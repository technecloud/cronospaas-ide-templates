# baixe o jar do cronos-ide, descompacte-o e entre no diretorio

# adicione a plataforma
cordova platform add wp8

# adiciona os plugins
cordova plugin add org.apache.cordova.dialogs
cordova plugin add org.apache.cordova.vibration
cordova plugin add org.apache.cordova.camera

# compile e gere o artefato .xpa
cordova build wp8

# simular
cordova run wp8