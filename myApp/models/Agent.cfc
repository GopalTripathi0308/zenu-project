component extends="Model" {
    function config() {
        belongsTo("agency");
        
        // Map database columns to properties
        property(name="agencyId", column="agency_id");
        property(name="displayOn", column="display_on");
        property(name="isPrimary", column="primary_agent");
        property(name="photoUrl", column="photo_url");
        property(name="isMultiOffice", column="multi_office");
        
        // Validations
        validatesPresenceOf("name,email,mobile");
        validatesUniquenessOf("email");
    }
}