    result.forEach(item -> cloudManager.byEntity(item).build().dropbox(DROPBOX_APP_ACCESS_TOKEN).popule(item));
