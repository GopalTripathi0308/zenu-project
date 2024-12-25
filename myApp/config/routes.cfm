<cfscript>

	// Use this file to add routes to your application and point the root route to a controller action.
	// Don't forget to issue a reload request (e.g. reload=true) after making changes.
	// See http://docs.cfwheels.org/docs/routing for more info.

	mapper()

		// Logo routes need to come before resources to avoid conflicts
		.get(name="addAgencyLogo", pattern="agencies/[key]/logo/new", to="agencies##newLogo")
		.post(name="uploadAgencyLogo", pattern="agencies/[key]/logo", to="agencies##uploadLogo")
		.get(name="agencyImages", pattern="agencies/[key]/images", to="agencies##images")
		.patch(name="updateAgencyImages", pattern="agencies/[key]/images", to="agencies##updateImages")

		// Staff routes
		.get(name="agencyStaff", pattern="agencies/[key]/staff", to="agents##index")
		.post(name="createAgencyStaff", pattern="agencies/[key]/staff", to="agents##create")
		.delete(name="deleteAgencyStaff", pattern="agencies/[key]/staff/[agentKey]", to="agents##delete")
		.patch(name="updateAgencyStaff", pattern="agencies/[key]/staff/[agentKey]", to="agents##update")

		// General resources
		.resources("users")
		.resources("agencies")

		// The "wildcard" call below enables automatic mapping of "controller/action" type routes.
		.wildcard()

		// The root route
		.root(to = "wheels##wheels", method = "get")
	.end();
</cfscript>
