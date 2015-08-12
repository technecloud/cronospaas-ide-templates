(function($app) {
  angular.module('custom.datasource', [])

  /**
  * Global factory responsible for managing all datasets
  */
  .factory('DatasetManager', ['$http','$q', '$resource', '$timeout','$rootScope', function($http, $q, $resource, $timeout, $rootScope) {
     // Global dataset List
    this.datasets = {};

    /**
    * Class representing a single dataset
    */
    var DataSet = function(name) {
      // Publiic members
      this.data = [];
      this.name = name;
      this.keys = [];
      this.endpoint = null;
      this.active = {};
      this.inserting = false; 
      this.editing = false;
      this.fetchSize = 2;
      this.observers = [];
      this.rowsPerPage = null;
      this.append = true;
      this.headers = null;

      // Private members
      var cursor = 0;
      var service = null;
      var _savedProps;
      var hasMoreResults = false;

      this.init = function() {

        // Get the service resource
        service = $resource(this.entity, {}, 
        {
          update: {
            method: 'PUT', // this method issues a PUT request
            headers : this.headers
          },
          save: {
            method: 'POST', // this method issues a POST request
            headers : this.headers
          }
        });
        

        // Start watching for changes in
        // activeRow to notify observers
        if(this.observers && this.observers.length > 0) {
          $rootScope.$watch(function() {
            return this.active;
          }.bind(this), function ( activeRow ) {
            if(activeRow) {
              this.notifyObservers(activeRow);         
            }
          }.bind(this), true);
        }
      }

      //Public methods
      /**
      * Append a new value to the end of this dataset.
      */ 
      this.insert = function (obj) {
        service.save(obj).$promise.then(function(obj) {
          this.data.push(obj);
          this.active = obj;
        }.bind(this));
      };

      /**
      * Uptade a value into this dataset by using the dataset key to compare
      * the objects
      */ 
      this.update = function (obj, callback) {
        // Get the keys values
        var keyObj = getKeyValues(obj);
        
        service.update(keyObj, obj).$promise.then(function(obj) {
          // For each row data
          this.data.forEach(function(currentRow) {
            // Iterate all keys checking if the 
            // current object match with the
            // extracted key values
            var found;
            for(var key in keyObj) {
              if(currentRow[key] && currentRow[key] === keyObj[key]) {
                found = true;
              } else {
                found = false;
              }
            }
            if(found) {
              this.copy(obj,currentRow);
            }
          }.bind(this));
        }.bind(this));        
      };

      /**
      * Insert or update based on the active row
      */ 
      this.post = function () {
        if(this.inserting) {
          this.insert(this.active);
          this.inserting = false;
        } else if(this.editing) {
          this.update(this.active);
          this.editing = false;
        }

      };

      this.cancel = function() {
        this.inserting = false;
        this.editing = false;
        this.active = this.data[0];
      };
      
     this.startInserting = function () {
       this.inserting = true;
       this.active = {};
       if(this.onStartInserting){
         this.onStartInserting();
       }
     };
     
     this.startEditing = function (item) {
       if(item) this.active = item;
       this.editing = true;
     };

      /**
      * Remove an object from this dataset by using the given id.
      * the objects
      */
      this.remove = function (object) {
        if(!object) {
          object = this.active;
        }
        
        var keyObj = getKeyValues(object);
        
        var suffixPath = "";
        for(var key in keyObj) {
          if(keyObj.hasOwnProperty(key)) {
            suffixPath += "/" + keyObj[key];
          }
        }
        
        var deleteService = $resource(this.entity + suffixPath, {} , {remove : { method : 'DELETE', headers: this.headers}});
        
        deleteService.remove().$promise.then(function() {
          // For each row data
          for(var i = 0; i < this.data.length; i++) {
            // Iterate all keys checking if the 
            // current object match with the same
            // vey values
            // Check all keys
            var found;
            for(var key in keyObj) {
              if(keyObj.hasOwnProperty(key)) {
                if(this.data[i][key] && this.data[i][key] === keyObj[key]) {
                  found = true;
                } else {
                  // There's a difference between the current object
                  // and the key values extracted from the object
                  // that we want to remove
                  found = false;
                }
              }
            }
            if(found) {
              // If it's the object we're loking for
              // remove it from the array
              this.data.splice(i,1);
              this.active = (i > 0) ? this.data[i - 1] : null;
              
              $rootScope.$apply();
            }
          }
        }.bind(this));
      };
      
      /**
       * Get the object keys values from the dataset keylist
       * PRIVATE FUNCTION
       */
      var getKeyValues = function(rowData) {
          var keys = this.keys;
          var keyValues = {};
          for(var i = 0; i < this.keys.length; i++) {
            keyValues[this.keys[i]] = rowData[this.keys[i]];
          }
          
          return keyValues;
      }.bind(this);

      /**
      * Check if the object has more itens to iterate
      */
      this.hasNext = function () {
        return this.data && (cursor < this.data.length - 1);
      };

      this.hasPrevious = function () {
        return this.data && (cursor > 0);
      };

      /**
      * Check if the object has more itens to iterate
      */
      this.order = function (order) {
        _savedProps.order = order;
      };

      /**
      *  Get the current item moving the cursor to the next element
      */
      this.next = function () {
        if(!this.hasNext()) {
          this.nextPage();
        }
        this.active = this.copy(this.data[++cursor],{});
        return this.active;
      };
      
      /**
      *  Try to fetch the previous page
      */
      this.nextPage = function () {
        this.offset = parseInt(this.offset) + parseInt(this.rowsPerPage); 
        this.fetch(_savedProps, { 
          success: function(data) {
            if(!data || data.length < parseInt(this.rowsPerPage)) {
              this.offset = parseInt(this.offset) - this.data.length; 
            }
          }
        });
      };
      
      /**
      *  Try to fetch the previous page
      */
      this.prevPage = function () {
        if(!this.append && !this.preppend) {
          this.offset = parseInt(this.offset) - this.data.length; 
          
          if(this.offset < 0) {
            this.offset = 0;
          } else if(this.offset >= 0) {
            this.fetch(_savedProps, {
              success: function(data) {
                if(!data || data.length === 0) {
                  this.offset = 0; 
                }
              } 
            }); 
          }
        }
      };
      
      /**
      *  Check if has more pages
      */
      this.hasNextPage = function () {
        return hasMoreResults;
      };
      
      /**
      *  Check if has previews pages
      */
      this.hasPrevPage = function () {
        return this.offset > 0 && !this.append && !this.prepend;
      };      

      /**
      *  Get the previous item
      */
      this.previous = function () {
        if(!this.hasPrevious()) throw "Dataset Overflor Error";
        this.active = this.copy(this.data[--cursor],{});
        return this.active;
      };

      /**
      *  Moves the cursor to the specified item
      */
      this.goTo = function (rowId) {
        for(var i = 0; i < this.data.length; i++) {
          if(this.data[i][this.key] === rowId) {
            cursor = i;
            this.active = this.copy(this.data[cursor],{});
            return this.active;
          }
        }
      };

      /**
      *  Get the current cursor index
      */
      this.getCursor = function () {
        return cursor;
      };
      
      /**
      *  filter dataset by URL
      */
      this.filter = function ( url ) {
        var oldoffset = this.offset;
        this.offset = 0;
        this.fetch({ path: url }, { beforeFill: function(oldData) {
          this.cleanup(); 
        }, error : function(error) {
          this.offset = oldoffset;  
        }});
      };
      
      /**
       * Cleanup datasource  
       */
      this.cleanup = function () {
        this.offset = 0;
        this.data = [];
        this.cursor = -1;
        this.active = null;
        hasMoreResults = false;
      }

      /**
      *  Get the current row data
      */
      this.current = function () {
        return this.active || this.data[0];
      };

      /**
      *  Fetch all data from the server
      */
      this.fetch = function (properties, callbacksObj) {
        var props = properties || {};
        var callbacks = callbacksObj || {};

        // Adjust property parameters and the endpoint url
        props.params = props.params || {};
        var resourceURL = this.entity + (props.path || "");
        
        var resource = $resource(resourceURL, {}, {'query' : {method: 'GET', headers : this.headers, isArray: true}});

        // Set Limit and offset
        props.params.limit = this.rowsPerPage;
        props.params.offset = this.offset;

        // Query the server with defined params
        var query = resource.query(props.params);
        
        // Store the last configuration for late use
        _savedProps = props;

        query.$promise.then(
          // Success Handler
          function (data) {
            if(data) {
              
              // Call the before fill callback
              if(callbacks.beforeFill) callbacks.beforeFill.apply(this, this.data);

              // If prepend property was set. 
              // Add the new data before the old one
              if(this.prepend) this.data = data.concat(this.data);  

              // If append property was set. 
              // Add the new data after the old one
              if(this.append) this.data = this.data.concat(data);

              // When neither  nor preppend was set
              // Just replace the current data
              if(!this.prepend && !this.append) {
                this.data = data;
                this.active = data[0];
                cursor = 0;
              }
              if(callbacks.success) callbacks.success.call(this, data);
              
              hasMoreResults = (data.length >= this.rowsPerPage);
            } 
          }.bind(this),
          // Error Handler
          function (error) {
            alert(error);
            if(callbacks.error) callbacks.error.call(this, data);
          }.bind(this)
        );
      };

      /**
      * Asynchronously notify observers 
      */
      this.notifyObservers = function () {
        for(var key in this.observers) {
          if(this.observers.hasOwnProperty(key)) {
            var dataset = this.observers[key];
            $timeout(function() {
              dataset.notify.call(dataset, this.active);
            }.bind(this),1);  
          }
        }
      };

      this.notify = function (activeRow) {
        if(activeRow) {
          // Parse the filter using regex
          // to identify {params}
          var filter = this.watchFilter;
          var pattern = /\{([A-z][A-z|0-9]*)\}/gim;

          // replace all params found by the 
          // respectiveValues in activeRow
          filter = filter.replace(pattern,function(a,b) {
            return activeRow.hasOwnProperty(b) ? activeRow[b] : "";
          });
          
          this.fetch({ 
            params : {
              q: filter
            }
          });
        }
      };
      
      this.addObserver = function(observer) {
        this.observers.push(observer);
      };

      /**
      * Clone a JSON Object
      */
      this.copy = function (from,to) {
        if(from === null || typeof(from) != 'object')
            return from;

        to = to || {}; 

        for(var key in from) {
            if(from.hasOwnProperty(key) && key.indexOf('$')==-1) {
                to[key] = this.copy(from[key]);
            }
        }
        return to;
      };

    };

    /**
      * Dataset Manager Methods
      */
    this.storeDataset = function (dataset) {
        this.datasets[dataset.name] = dataset;
    },

    /**
    * Initialize a new dataset
    */
    this.initDataset = function (props) {
        var endpoint = (props.endpoint) ? props.endpoint : "";

        var dts = new DataSet(props.name);
        dts.entity = props.entity;
        dts.keys = (props.keys && props.keys.length > 0) ? props.keys.split(",") : [];
        dts.rowsPerPage = props.rowsPerPage ? props.rowsPerPage : 100; // Default 100 rows per page
        dts.append = props.append;
        dts.prepend = props.prepend;
        dts.endpoint = props.endpoint;
        dts.filterURL = props.filterURL;
        dts.offset = (props.offset) ? props.offset : 0; // Default offset is 0

        
        // Check for headers
        if(props.headers && props.headers.length > 0) {
          dts.headers = {};
          var headers = props.headers.split(";");
          var header;
          for(var i = 0; i < headers.length; i++) {
             header = headers[i].split(":");
             if(header.length === 2) {
              dts.headers[header[0]] = header[1];  
             }
          }
        }
        
        // Init
        dts.init();
        this.storeDataset(dts);

        if(!props.lazy && (Object.prototype.toString.call(props.watch) !== "[object String]") && !props.filterURL) {
          // Query string object
          var queryObj = {};
          if(dts.rowsPerPage) queryObj.limit = dts.rowsPerPage;

          // Fill the dataset
          dts.fetch({params: queryObj}, {success: function(data) {
            if (data && data.length > 0) {
              this.active = data[0];
              this.cursor = 0;
            }
          }});
        }

        if(props.watch && Object.prototype.toString.call(props.watch) === "[object String]") {
          this.registerObserver(props.watch, dts);
          dts.watchFilter = props.watchFilter;
        }
        
        // Filter the dataset if the filter property was set
        if(props.filterURL && props.filterURL.length > 0) { 
          dts.filter(props.filterURL);
        }
        
        

        // Add this instance into the root scope
        // This will expose the dataset name as a
        // global variable
        $rootScope[dts.name] = dts;
        window[dts.name] = dts;
        
        return dts;
    };

    /**
    * Register a dataset as an observer to another one
    */
    this.registerObserver = function (targetName, dataset) {
      this.datasets[targetName].addObserver(dataset);
    };

    return this;
  }]);

  /**
  * Cronus Dataset Directive
  */
  $app.directive('datasource',['DatasetManager','$timeout','$parse', function (DatasetManager,$timeout,$parse) {
    var timeoutPromise;
    return {
      restrict: 'E',
      template: '',
      link: function( scope, element, attrs ) {
        var init = function () {
          var datasource = DatasetManager.initDataset({
            name: attrs.name,
            entity: attrs.entity,
            keys: $parse(attrs.keys)(scope),
            endpoint: attrs.endpoint,
            lazy: (attrs.hasOwnProperty('lazy') && attrs.lazy === "") || attrs.lazy === "true",
            append: !attrs.hasOwnProperty('append') || attrs.append === "true",
            prepend: (attrs.hasOwnProperty('prepend') && attrs.prepend === "") || attrs.prepend === "true",
            watch: attrs.watch,
            rowsPerPage: attrs.rowsPerPage,
            offset: attrs.offset,
            filterURL : attrs.filter,
            watchFilter: attrs.watchFilter,
            headers : attrs.headers
          });
          
          attrs.$observe('filter', function( value ){
                
                // Stop the pending timeout
                $timeout.cancel(timeoutPromise);
                
                // Start a timeout
                timeoutPromise = $timeout(function() {
                   datasource.filter(value);
                }, 500);
                
          });
        };
        init();
      }
    };
  }]);
  
  $app.directive('crnDatasource',['DatasetManager', function(DatasetManager) {
      return {
        restrict: 'A',
        scope: true,
        link: function(scope, element, attrs) {
            scope.data = DatasetManager.datasets;
            scope.datasource = scope.data[attrs.crnDatasource];
        }
      };
    }]);
}(app));