{
    "name": "crn-${WidgetId}",
    "text": "${WidgetName}",
    "image": "/node_modules/cronapp-framework-js/img/cron-icon/crn-list.svg",
    "description": "${Description}",
    "category": [
        "PLUGINS"
    ],
    "templateURL": "${r"${webcontent"}/components/templates/${WidgetId}.template.html",
    "properties": {
        "class": {
            "order": 9999
        },
        "id": {
            "order": 1
        }
    },
    "attributesForPreview": [],
    "childrenProperties": [
        {
            "name": "ng-init",
            "selector": "button",
            "type": "event"
        },
        {
            "name": "ng-click",
            "selector": "button",
            "type": "event"
        },
        {
            "name": "ng-dblclick",
            "selector": "button",
            "type": "event"
        },
        {
            "name": "ng-mouseenter",
            "selector": "button",
            "type": "event"
        },
        {
            "name": "ng-mouseleave",
            "selector": "button",
            "type": "event"
        },
        {
            "name": "ng-mousemove",
            "selector": "button",
            "type": "event"
        }
    ],
    "styles": []
}