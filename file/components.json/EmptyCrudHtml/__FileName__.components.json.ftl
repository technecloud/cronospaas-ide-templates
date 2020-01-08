{
	"name": "custom-cronos-components",
	"version": "0.0.0",
	"components": [
		{
			"name": "${ComponentId}",
			"text_pt_BR": "${ComponentName}",
			"text_en_US": "${ComponentName}",
			"class": "adjust-icon mdi mdi-checkerboard",
			"wrapper": false,
			"templateURL": "${FullPath}/${FileName}.template.html",
			"properties": {
				"onclick": {
					"type": "event"
				},
				"target": {
					"removable": false,
					"type": "list",
					"options": [
						{
							"key": "_blank",
							"value": "Nova janela"
						},
						{
							"key": "_self",
							"value": "Mesma janela"
						},
						{
							"key": "_parent",
							"value": "Janela pai"
						},
						{
							"key": "_top",
							"value": "Top"
						}
					]
				},
				"href": {
					"removable": false,
					"type": "projectResource",
					"resourceType": "text/html"
				}
			},
			"childrenProperties": [${ChildrenProperties}]
		}

	]
}