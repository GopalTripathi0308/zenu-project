<cfscript>
	/*
		Use this file to configure your application.
		You can also use the environment specific files (e.g. /config/production/settings.cfm) to override settings set here.
		Don't forget to issue a reload request (e.g. reload=true) after making changes.
		See http://docs.cfwheels.org/docs/configuration-and-defaults for more info.
	*/

	// Set URL rewriting
	set(URLRewriting="On");

	// Set reload password
	set(reloadPassword="");

	// Environment-specific settings
	if (application.$wheels.environment == "development") {
		// Development database
		set(dataSourceName="luceepg");
		
		// Development settings
		set(showDebugInformation=true);
		set(showErrorInformation=true);
		set(reloadPassword="");
		
	} else {
		// Production database
		set(dataSourceName="luceepg");
		
		// Production settings
		set(showDebugInformation=false);
		set(showErrorInformation=false);
		set(reloadPassword="your_secure_password");
	}
</cfscript>
