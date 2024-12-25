component extends="wheels.migrator.Migration" {
    function up() {
        t = createTable(name="agencies", id=true);
        t.string(columnName="name", limit=255);
        t.string(columnName="suburb", limit=100);
        t.string(columnName="state", limit=3);
        t.integer(columnName="for_sale", default=0);
        t.integer(columnName="for_lease", default=0);
        t.string(columnName="default_product", limit=50);
        t.string(columnName="status", limit=20, default="ACTIVE");
        t.datetime(columnName="createdAt");
        t.datetime(columnName="updatedAt");
        t.create();
        // Add dummy data
        execute("
            INSERT INTO agencies (name, suburb, state, for_sale, for_lease, default_product, status, createdAt, updatedAt)
            VALUES
            ('Bell Real Estate', 'OLINDA', 'VIC', 93, 6, 'Standard Subscription', 'ACTIVE', NOW(), NOW()),
            ('Nelson Alexander Kew', 'KEW', 'VIC', 37, 38, 'Standard Subscription', 'ACTIVE', NOW(), NOW()),
            ('Barry Plant Manningham', 'DONCASTER EAST', 'VIC', 143, 0, 'Basic Subscription', 'ACTIVE', NOW(), NOW()),
            ('Hoskins Real Estate Donvale', 'DONVALE', 'VIC', 14, 0, 'Standard Subscription', 'ACTIVE', NOW(), NOW()),
            ('Frank Gordon & Co Pty Ltd', 'PORT MELBOURNE', 'VIC', 8, 3, 'Basic Subscription', 'ACTIVE', NOW(), NOW()),
            ('Woodards Camberwell', 'CAMBERWELL', 'VIC', 20, 41, 'Premium All', 'ACTIVE', NOW(), NOW()),
            ('Woodards Blackburn', 'BLACKBURN', 'VIC', 32, 26, 'Feature All - per listing(Sale)', 'ACTIVE', NOW(), NOW()),
            ('Walsh Cairnes & Co Pty Ltd', 'HAWTHORN', 'VIC', 1, 1, 'Feature All - per listing(All)', 'ACTIVE', NOW(), NOW()),
            ('Fletchers Canterbury', 'CANTERBURY', 'VIC', 1, 0, 'Basic Subscription', 'ACTIVE', NOW(), NOW())
        ");
    }
    function down() {
        dropTable("agencies");
    }
}