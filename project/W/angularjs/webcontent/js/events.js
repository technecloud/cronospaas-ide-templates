app.userEvents.homeTest123Onclick = function(event) {
  // Your code goes here
}

app.userEvents.homeTest123Onclick2 = function(event) {
    var request = { name:  'Hello World' };
  
    $.ajax({
      dataType: "json",
      method: "POST",
      url: "api/rest/Pessoa/onclick",
      data: JSON.stringify(request),
      headers:{
        'Content-Type' : 'application/json'
      },
      success: function(data) {
        this.$apply(function() {
          
          JSON.stringify(data);
          
        }.bind(this));
      }.bind(this)
    });
}