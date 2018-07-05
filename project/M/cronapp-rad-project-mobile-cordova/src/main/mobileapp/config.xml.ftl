<?xml version='1.0' encoding='utf-8'?>
<widget id="${appid}" version="1.0.0" xmlns="http://www.w3.org/ns/widgets" xmlns:cdv="http://cordova.apache.org/ns/1.0">
    <name>${appname}</name>
    <description>${appname}</description>
    <author email="${useremail}" href="http://cronapp.io">${username}</author>
    <content src="index.html" />
    <plugin name="cordova-plugin-whitelist" spec="1" />
    <access origin="*" />
    <allow-intent href="http://*/*" />
    <allow-intent href="https://*/*" />
    <allow-intent href="tel:*" />
    <allow-intent href="sms:*" />
    <allow-intent href="mailto:*" />
    <allow-intent href="geo:*" />
    <platform name="android">
        <allow-intent href="market:*" />
    </platform>
    <platform name="ios">
        <allow-intent href="itms:*" />
        <allow-intent href="itms-apps:*" />
    </platform>
	<icon src="res/icon.png" />
    <splash src="res/screen.png" />
    <plugin name="cordova-plugin-cronapp" spec="1.0.2-d" />
</widget>
