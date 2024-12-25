component extends="Controller" {
    
    function config() {
        provides("html");
        verifies(except="index,new,create,show", params="key", paramsTypes="integer");
    }

    function index() {
        // Get status filter from params, default to 'ALL'
        currentStatus = params.status ?: "ALL";
        
        // Base query parameters
        queryParams = {
            order="id"
        };
        
        // Apply status filter
        switch(currentStatus) {
            case "ACTIVE":
                queryParams.where = "status = 'ACTIVE'";
                break;
            case "INACTIVE":
                queryParams.where = "status = 'INACTIVE'";
                break;
            case "DRAFT":
                queryParams.where = "status = 'DRAFT'";
                break;
            // For "ALL", no where clause needed
        }
        
        // Execute query
        agencies = model("agency").findAll(argumentCollection=queryParams);
        
        renderView(data={currentStatus=currentStatus});
    }

    function show() {
        agency = model("agency").findByKey(params.key);
    }

    function new() {
        agency = model("agency").new();
    }

    function edit() {
        agency = model("agency").findByKey(params.key);
        if (IsNull(agency)) {
            redirectTo(route="agencies", error="Agency not found.");
        }
    }

    function create() {
        agency = model("agency").new(params.agency);
        if (agency.save()) {
            redirectTo(route="agencies", success="Agency was created successfully.");
        } else {
            renderPage(action="new");
        }
    }

    function update() {
        agency = model("agency").findByKey(params.key);
        if (IsNull(agency)) {
            redirectTo(route="agencies", error="Agency not found.");
            return;
        }

        if (agency.update(params.agency)) {
            redirectTo(route="agencies", success="Agency was updated successfully.");
        } else {
            renderPage(action="edit");
        }
    }

    function delete() {
        agency = model("agency").findByKey(params.key);
        if (!IsNull(agency)) {
            agency.delete();
        }
        redirectTo(route="agencies", success="Agency was deleted successfully.");
    }

    function images() {
        agency = model("agency").findByKey(params.key);
        if (IsNull(agency)) {
            redirectTo(route="agencies", error="Agency not found.");
        }
        renderView(data={agency=agency});
    }

    function updateImages() {
        agency = model("agency").findByKey(params.key);
        if (IsNull(agency)) {
            redirectTo(route="agencies", error="Agency not found.");
            return;
        }

        if (agency.update(params.agency)) {
            redirectTo(route="agencyImages", key=params.key, success="Images were updated successfully.");
        } else {
            renderView(action="images");
        }
    }

    function newLogo() {
        agency = model("agency").findByKey(params.key);
        if (IsNull(agency)) {
            redirectTo(route="agencies", error="Agency not found.");
            return;
        }
        renderView(data={agency=agency});
    }

    function uploadLogo() {
        agency = model("agency").findByKey(params.key);
        if (IsNull(agency)) {
            redirectTo(route="agencies", error="Agency not found.");
            return;
        }

        // Handle file upload here
        if (structKeyExists(form, "logo") && len(form.logo)) {
            try {
                // Create upload directory if it doesn't exist
                uploadDir = expandPath("./public/uploads/agencies/#agency.id#/");
                if (!directoryExists(uploadDir)) {
                    directoryCreate(uploadDir);
                }

                // Upload the file
                uploadedFile = fileUpload(
                    uploadDir,
                    "logo",
                    "image/jpeg,image/png,image/gif",
                    "makeunique"
                );

                // Update the agency with the logo path
                logoPath = "/uploads/agencies/#agency.id#/#uploadedFile.serverFile#";
                
                if (agency.update(logo=logoPath)) {
                    redirectTo(route="agencyImages", key=params.key, success="Logo uploaded successfully.");
                } else {
                    redirectTo(route="agencyImages", key=params.key, error="Failed to save logo path to database.");
                }
            } catch (any e) {
                redirectTo(route="agencyImages", key=params.key, error="Failed to upload logo: #e.message#");
            }
        } else {
            redirectTo(route="agencyImages", key=params.key, error="No logo file selected.");
        }
    }
} 