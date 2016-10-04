# baixe o jar do cronos-ide, descompacte-o e entre no diretorio

# adicione a plataforma
cordova platform add android

# adiciona os plugins
cordova plugin add org.apache.cordova.dialogs
cordova plugin add org.apache.cordova.vibration
cordova plugin add org.apache.cordova.camera

# compile e gere o artefato .apk
cordova build android

# simular
cordova run android