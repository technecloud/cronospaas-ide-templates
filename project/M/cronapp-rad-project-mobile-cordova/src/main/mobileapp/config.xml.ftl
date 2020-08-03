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
    <icon src="res/icon.png" />
    <splash src="res/screen.png" />
    <platform name="android">
        <preference name="android-minSdkVersion" value="22" />
        <allow-intent href="market:*" />
        <#-- VERIFY IF THE VARIABLES CONTAINING THE LIST OF ICONS AND SPLASH SCREEN ARE DEFINED (mobilesizes.json) -->
        <#if androidIconList?has_content>
            <#list androidIconList as androidIcon>
                <icon density="${androidIcon.density}" src="res/icon/android/${androidIcon.file}" />
            </#list>
        <#else>
                <icon density="ldpi" src="res/icon/android/drawable-ldpi-icon.png"/>
                <icon density="mdpi" src="res/icon/android/drawable-mdpi-icon.png"/>
                <icon density="hdpi" src="res/icon/android/drawable-hdpi-icon.png"/>
                <icon density="xhdpi" src="res/icon/android/drawable-xhdpi-icon.png"/>
                <icon density="xxhdpi" src="res/icon/android/drawable-xxhdpi-icon.png"/>
                <icon density="xxxhdpi" src="res/icon/android/drawable-xxxhdpi-icon.png"/>
        </#if>

        <#if androidSplashList?has_content>
            <#list androidSplashList as androidSplash>
                <splash density="${androidSplash.density}" src="res/screen/android/${androidSplash.file}" />
            </#list>
        <#else>
                <splash density="land-ldpi" src="res/screen/android/drawable-land-ldpi-screen.png"/>
                <splash density="land-mdpi" src="res/screen/android/drawable-land-mdpi-screen.png"/>
                <splash density="land-hdpi" src="res/screen/android/drawable-land-hdpi-screen.png"/>
                <splash density="land-xhdpi" src="res/screen/android/drawable-land-xhdpi-screen.png"/>
                <splash density="land-xxhdpi" src="res/screen/android/drawable-land-xxhdpi-screen.png"/>
                <splash density="land-xxxhdpi" src="res/screen/android/drawable-land-xxxhdpi-screen.png"/>
                <splash density="port-ldpi" src="res/screen/android/drawable-port-ldpi-screen.png"/>
                <splash density="port-mdpi" src="res/screen/android/drawable-port-mdpi-screen.png"/>
                <splash density="port-hdpi" src="res/screen/android/drawable-port-hdpi-screen.png"/>
                <splash density="port-xhdpi" src="res/screen/android/drawable-port-xhdpi-screen.png"/>
                <splash density="port-xxhdpi" src="res/screen/android/drawable-port-xxhdpi-screen.png"/>
                <splash density="port-xxxhdpi" src="res/screen/android/drawable-port-xxxhdpi-screen.png"/>
        </#if>
        <edit-config file="app/src/main/AndroidManifest.xml" mode="merge" target="/manifest/application" xmlns:android="http://schemas.android.com/apk/res/android">
            <application android:networkSecurityConfig="@xml/network_security_config" />
        </edit-config>
        <resource-file src="network_security_config.xml" target="app/src/main/res/xml/network_security_config.xml" />

    </platform>
    <platform name="ios">
        <allow-intent href="itms:*" />
        <allow-intent href="itms-apps:*" />

        <#if iosIconList?has_content>
            <#list iosIconList as iosIcon>
                <icon height="${iosIcon.height?string["0"]}" src="res/icon/ios/${iosIcon.file}" width="${iosIcon.width?string["0"]}" />
            </#list>
        <#else>
                <icon height="57" src="res/icon/ios/icon.png" width="57"/>
                <icon height="114" src="res/icon/ios/icon@2x.png" width="114"/>
                <icon height="40" src="res/icon/ios/icon-40.png" width="40"/>
                <icon height="80" src="res/icon/ios/icon-40@2x.png" width="80"/>
                <icon height="120" src="res/icon/ios/icon-40@3x.png" width="120"/>
                <icon height="50" src="res/icon/ios/icon-50.png" width="50"/>
                <icon height="100" src="res/icon/ios/icon-50@2x.png" width="100"/>
                <icon height="60" src="res/icon/ios/icon-60.png" width="60"/>
                <icon height="120" src="res/icon/ios/icon-60@2x.png" width="120"/>
                <icon height="180" src="res/icon/ios/icon-60@3x.png" width="180"/>
                <icon height="72" src="res/icon/ios/icon-72.png" width="72"/>
                <icon height="144" src="res/icon/ios/icon-72@2x.png" width="144"/>
                <icon height="76" src="res/icon/ios/icon-76.png" width="76"/>
                <icon height="152" src="res/icon/ios/icon-76@2x.png" width="152"/>
                <icon height="167" src="res/icon/ios/icon-83.5@2x.png" width="167"/>
                <icon height="29" src="res/icon/ios/icon-small.png" width="29"/>
                <icon height="58" src="res/icon/ios/icon-small@2x.png" width="58"/>
                <icon height="87" src="res/icon/ios/icon-small@3x.png" width="87"/>
                <icon height="1024" src="res/icon/ios/icon-1024.png" width="1024"/>
        </#if>

        <#if iosSplashList?has_content>
            <#list iosSplashList as iosSplash>
                <splash height="${iosSplash.height?string["0"]}" src="res/screen/ios/${iosSplash.file}" width="${iosSplash.width?string["0"]}" />
            </#list>
        <#else>
                <splash height="1136" src="res/screen/ios/Default-568h@2x~iphone.png" width="640"/>
                <splash height="1334" src="res/screen/ios/Default-667h.png" width="750"/>
                <splash height="2208" src="res/screen/ios/Default-736h.png" width="1242"/>
                <splash height="1242" src="res/screen/ios/Default-Landscape-736h.png" width="2208"/>
                <splash height="1536" src="res/screen/ios/Default-Landscape@2x~ipad.png" width="2048"/>
                <splash height="2048" src="res/screen/ios/Default-Landscape@~ipadpro.png" width="2732"/>
                <splash height="768" src="res/screen/ios/Default-Landscape~ipad.png" width="1024"/>
                <splash height="2048" src="res/screen/ios/Default-Portrait@2x~ipad.png" width="1536"/>
                <splash height="2732" src="res/screen/ios/Default-Portrait@~ipadpro.png" width="2048"/>
                <splash height="1024" src="res/screen/ios/Default-Portrait~ipad.png" width="768"/>
                <splash height="960" src="res/screen/ios/Default@2x~iphone.png" width="640"/>
                <splash height="480" src="res/screen/ios/Default~iphone.png" width="320"/>
                <splash height="2732" src="res/screen/ios/Default@2x~universal~anyany.png" width="2732"/>
        </#if>


    </platform>
    <plugin name="cordova-plugin-cronapp" spec="https://github.com/cronapp/cordova-plugin-cronapp.git#develop"/>
</widget>
