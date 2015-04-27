var isMobile = {
    Android: function() {
        return navigator.userAgent.match(/Android/i);
    },
    BlackBerry: function() {
        return navigator.userAgent.match(/BlackBerry/i);
    },
    iOS: function() {
        return navigator.userAgent.match(/iPhone|iPad|iPod/i);
    },
    Opera: function() {
        return navigator.userAgent.match(/Opera Mini/i);
    },
    Windows: function() {
        return navigator.userAgent.match(/IEMobile/i);
    },
    any: function() {
        return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
    }
};

document.addEventListener('deviceready', function () {

  if (isMobile.any() && navigator.notification) { // Override default HTML alert with native dialog
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

  
if (!isMobile.any()) { // Override default HTML alert with native dialog

   window.vibrate = function(miliseconds){
      alert('navigator.notification.vibrate(miliseconds)', miliseconds);
   };

   window.beep = function(times){
      alert('navigator.notification.beep(times)', times);
   };

}

