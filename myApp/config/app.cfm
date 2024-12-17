<cfscript>
	/*
		Use this file to set variables for the Application.cfc's "this" scope.

		Examples:
		this.name = "MyAppName";
		this.sessionTimeout = CreateTimeSpan(0,0,5,0);
	*/

	this.name = "MyApp";

	// Set initial environment if not set
	if (!structKeyExists(application, "$wheels")) {
		application.$wheels = {};
		application.$wheels.environment = "development";
	}

	// Method 1: Using URL parameter
	if (structKeyExists(url, "environment")) {
		 application.$wheels.environment = url.environment;
	}

	// Method 2: Using form parameter
	if (structKeyExists(form, "switchEnvironment")) {
		application.$wheels.environment = form.switchEnvironment;
	}

	// Method 3: Create a simple toggle function
	public void function switchEnvironment() {
		if (application.$wheels.environment == "development") {
			application.$wheels.environment = "production";
		} else {
			application.$wheels.environment = "development";
		}
	}
</cfscript>

<!--- Add UI toggle only if not in production --->
<cfif structKeyExists(application, "$wheels") 
      AND application.$wheels.environment IS NOT "production">
	<div style="position:fixed;bottom:10px;right:10px;z-index:9999;">
		<form method="post">
			<input type="hidden" name="switchEnvironment" 
				   value="#application.$wheels.environment == 'development' ? 'production' : 'development'#">
			<button type="submit">Switch to #application.$wheels.environment == 'development' ? 'Production' : 'Development'#</button>
		</form>
	</div>
</cfif>
