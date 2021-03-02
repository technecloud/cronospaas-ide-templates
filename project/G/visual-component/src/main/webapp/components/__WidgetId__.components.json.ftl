{
	"name": "${WidgetId}-components",
	"version": "1.0.0",
	"components": [
		{
			"name": "${WidgetId}",
			"text": "${WidgetName}",
			"class": "cpn cpn-textinput",
			"templateURL": "${r"${webcontent}"}/components/templates/${WidgetId}.template.html",
			"properties": {
				"onchange": {
					"removable": true,
					"type": "event"
				}
			}
		}
	]
}