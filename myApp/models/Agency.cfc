component extends="Model" {
    function config() {
        table("agencies");
        
        // Map database columns to properties
        property(name="name", column="name");  // Keep original column name
        property(name="suburb", column="suburb");
        property(name="state", column="state");
        property(name="forSale", column="for_sale");
        property(name="forLease", column="for_lease");
        property(name="defaultProduct", column="default_product");
        property(name="status", column="status");
        property(name="createdAt", column="createdat");
        property(name="updatedAt", column="updatedat");
        
        // New properties for images
        property(name="logo", column="logo");
        property(name="backgroundColor", column="background_color");
        property(name="fontColor", column="font_color");
    }
} 