{
    "name": "crn-${WidgetId}",
    "text": "${WidgetName}",
    "image": "/node_modules/cronapp-framework-js/img/cron-icon/crn-list.svg",
    "description": "${Description}",
    "category": [
        "PLUGINS"
    ],
    "templateURL": "${r"${webcontent}"}/components/templates/${WidgetId}.template.html",
    "properties": {
        "class": {
            "order": 9999
        },
        "id": {
            "order": 1
        },
        "onclick": {
            "type": "event"
        },
        "onchange": {
            "removable": true,
            "type": "event"
        },
        "on-tap": {
            "removable": true,
            "type": "event"
        },
        "on-double-tap": {
            "removable": true,
            "type": "event"
        },
        "on-hold": {
            "removable": false,
            "type": "event"
        },
        "on-drag": {
            "removable": false,
            "type": "event"
        },
        "on-swipe": {
            "removable": false,
            "type": "event"
        }
    },
    "attributesForPreview": [],
    "childrenProperties": [],
    "styles": []
}