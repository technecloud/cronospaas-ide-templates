document.addEventListener('deviceready', function () {

  if (navigator.notification) { // Override default HTML alert with native dialog

      window.alert = function (message, title, onAlert) {
          navigator.notification.alert(
              message,    // message
              onAlert,    // callback
              title,      // title
              'OK'        // buttonName
          );
      };


    window.confirm = function(message, title, onConfirm) {
      navigator.notification.confirm(
        message,  // message
        onConfirm,// callback to invoke with index of button pressed
        title,    // title
        ['OK','Cancel']         // buttonLabels
      );
    };

    window.prompt = function(message, title, defaultText, onPrompt){
     navigator.notification.prompt(
        message,  // message
        onPrompt, // callback to invoke
        title,    // title
        ['OK','Cancel'], // buttonLabels
        defaultText      // defaultText
    );
   };

   window.vibrate = function(miliseconds){
    navigator.notification.vibrate(miliseconds);
   };

   window.beep = function(times){
    navigator.notification.beep(times);
   };

  } 
}, false);

  
if (!navigator.notification) { // Override default HTML alert with native dialog

   window.vibrate = function(miliseconds){
      alert('navigator.notification.vibrate(miliseconds)', miliseconds);
   };

   window.beep = function(times){
      alert('navigator.notification.beep(times)', times);
   };

}



