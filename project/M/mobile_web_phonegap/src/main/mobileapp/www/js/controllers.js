(function($app) {

	angular.module('starter.controllers', [])

	app.controller('AppController', function($scope, $ionicModal, $ionicPopup,
			$timeout, $http, $rootScope, $window, $state , $translate) {

		// With the new view caching in Ionic, Controllers are only called
		// when they are recreated or on app start, instead of every page change.
		// To listen for when this page is active (for example, to refresh data),
		// listen for the $ionicView.enter event:
		//$scope.$on('$ionicView.enter', function(e) {
		//});

		// Form data for the login modal
		$scope.loginData = {};

		$scope.contactlist = [{
			title : 'Selena Gomez',
			id : 1,
			number : '1-521-753-9980',
			avatar : 'img/user_f_1.png'
		}, {
			title : 'Liza Soberano',
			id : 2,
			number : '1-860-630-5100',
			avatar : 'img/user_f_2.png'
		}, {
			title : 'Angelina Jolie',
			id : 3,
			number : '1-630-860-0216',
			avatar : 'img/user_f_3.png'
		}, {
			title : 'Katy Perry',
			id : 4,
			number : '1-630-860-5100',
			avatar : 'img/user_f_4.png'
		}, {
			title : 'Pia Wurtzbach',
			id : 5,
			number : '1-932-845-5890',
			avatar : 'img/user_f_3.png'
		}, {
			title : 'Eva Mendes',
			id : 6,
			number : '1-630-860-5100',
			avatar : 'img/user_f_2.png'
		}, {
			title : 'Julianne Hough',
			id : 7,
			number : '1-630-860-5100',
			avatar : 'img/user_f_1.png'
		}, {
			title : 'Natalie Portman',
			id : 8,
			number : '1-430-810-4300',
			avatar : 'img/user_f_3.png'
		}, {
			title : 'Jennifer Lopez',
			id : 9,
			number : '1-786-265-6000',
			avatar : 'img/user_f_3.png'
		}, {
			title : 'Jessica Alba',
			id : 10,
			number : '1-630-860-5100',
			avatar : 'img/user_f_2.png'
		}, {
			title : 'Alana Blanchard',
			id : 11,
			number : '1-630-860-5100',
			avatar : 'img/user_f_1.png'
		}, {
			title : 'Nicole Scherzinger',
			id : 12,
			number : '1-310-641-0216',
			avatar : 'img/user_f_4.png'
		}];

		$scope.menulist = [{
			title : 'Search',
			url : '/app/search'
		}, {
			title : 'Contact List',
			url : '/app/contactlist'
		}];

		// Create the login modal that we will use later
		$ionicModal.fromTemplateUrl('public/login.view.html', {
			scope : $scope
		}).then(function(modal) {
			$scope.modal = modal;
		});

		// Triggered in the login modal to close it
		$scope.closeLogin = function() {
			$scope.modal.hide();
		};

		// Open the login modal
		$scope.login = function() {
			$scope.modal.show();
		};

		// Perform the login action when the user submits the login form
		$scope.doLogin = function() {
			console.log('Doing login', $scope.loginData);
			var user = {
				username : $scope.loginData.username,
				password : $scope.loginData.password
			};
			
			if ($scope.loginData.host && $scope.loginData.host.indexOf('http') > -1) {
			  
				var hostBackEnd =  $scope.loginData.host + '/auth';
				
				$http({
					method : 'POST',
					url : hostBackEnd,
					data : serializeData(user),
					headers : {
						'Content-Type' : 'application/x-www-form-urlencoded'
					}
				}).success(handleSuccess).error(handleError);
			} else {
			  showAlert('Alert', 'Host Incorret!')
			} 
			// Simulate a login delay. Remove this and replace with your login
			// code if using a login system

		};

		function handleSuccess(data, status, headers, config) {
			// Store data response on session storage
			// The session storage will be cleaned when the browser window is closed
			if (typeof (Storage) !== "undefined") {
				// save the user data on localStorage
				sessionStorage.setItem("_u", JSON.stringify(data));
			} else {
				// Sorry! No Web Storage support.
				// The home page may not work if it depends
				// on the logged user data
			}
			$timeout(function() {
				$scope.closeLogin();
			}, 1000);
			
			// Redirect to home page
			$state.go("app.search");
		}

		function handleError(data, status, headers, config) {
		  console.log(data);
			showAlert(status, 'Login invalid!')
		}

		function serializeData(data) {
			// If this is not an object, defer to native stringification.
			if (!angular.isObject(data)) {
				return ((data === null) ? "" : data.toString());
			}

			var buffer = [];

			// Serialize each key in the object.
			for ( var name in data) {
				if (!data.hasOwnProperty(name)) {
					continue;
				}

				var value = data[name];

				buffer.push(encodeURIComponent(name) + "="
						+ encodeURIComponent((value === null) ? "" : value));
			}

			// Serialize the buffer and clean it up for transportation.
			var source = buffer.join("&").replace(/%20/g, "+");
			return (source);
		}

		function showAlert(title, template, action) {
			var alertPopup = $ionicPopup.alert({
				title : title,
				template : template
			});

			alertPopup.then(action);
		}
	})

	app.controller('ContactListController', function($scope) {
	})

	app.controller('ContactController',
			function($scope, $stateParams, $filter) {
				$scope.contact = {};

				var title = $filter('filter')($scope.contactlist, {
					id : $stateParams.contactId
				});
				if (title.length > 0) {
					$scope.contact = title[0];
				} else {
					var notFound = [{
						title : 'Not Found!',
						id : 0
					}];
					$scope.contact = notFound;
				}
			});

}(app));