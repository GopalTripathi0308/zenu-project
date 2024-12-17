<cfscript>
    // Development
    if (application.wheels.environment == "development") {
        set(dataSourceName="luceepg");  // connects to postgres_dev on port 5432
    }
    // Production
    else {
        set(dataSourceName="luceepg-prod");  // connects to postgres_prod on port 5433
    }
</cfscript> 