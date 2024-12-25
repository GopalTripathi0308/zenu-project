component extends="wheels.migrator.Migration" hint="Creates agents table and adds sample data" {

    function up() {
        transaction {
            try {
                // Create agents table
                t = createTable(name="agents");
                t.integer(columnName="agency_id", null=false);
                t.string(columnName="name", limit=255, null=false);
                t.string(columnName="position", limit=255);
                t.string(columnName="mobile", limit=50);
                t.string(columnName="email", limit=255);
                t.boolean(columnName="display_on", default=true);
                t.boolean(columnName="primary_agent", default=false);
                t.string(columnName="photo_url", limit=255);
                t.boolean(columnName="multi_office", default=false);
                t.timestamps();
                t.create();

                // Add foreign key
                addForeignKey(table='agents', referenceTable='agencies', column='agency_id', referenceColumn='id');

                // Add indexes
                addIndex(table='agents', columnNames='agency_id');
                addIndex(table='agents', columnNames='email');
                addIndex(table='agents', columnNames='mobile');

                // Add sample data based on the image
                addRecord(
                    table='agents',
                    agency_id=5570,
                    name='Sam Allwright',
                    mobile='0402 456 131',
                    email='sallwright@petrusma.com.au',
                    display_on=true,
                    primary_agent=false,
                    multi_office=false
                );

                addRecord(
                    table='agents',
                    agency_id=5570,
                    name='Kahn Duffey',
                    mobile='0413 586 360',
                    email='kduffey@petrusma.com.au',
                    display_on=true,
                    primary_agent=false,
                    multi_office=false
                );

                addRecord(
                    table='agents',
                    agency_id=5570,
                    name='Jake Towns',
                    position='Director & Auctioneer',
                    mobile='0402 355 789',
                    email='1455.18329@emaildrop.rexsoft',
                    display_on=true,
                    primary_agent=false,
                    photo_url='/path/to/jake.jpg',
                    multi_office=false
                );

                addRecord(
                    table='agents',
                    agency_id=5570,
                    name='Ed ten Broeke',
                    mobile='0418 508 106',
                    email='etenbroeke@petrusma.com.au',
                    display_on=true,
                    primary_agent=false,
                    multi_office=false
                );

                addRecord(
                    table='agents',
                    agency_id=5570,
                    name='Tegan Rainbird',
                    mobile='0424 677 854',
                    email='trainbird@petrusma.com.ai',
                    display_on=true,
                    primary_agent=false,
                    photo_url='/path/to/tegan.jpg',
                    multi_office=false
                );

                addRecord(
                    table='agents',
                    agency_id=5570,
                    name='Sheridan Mccarthy',
                    mobile='0418 740 096',
                    email='smccarthy@petrusma.com.au',
                    display_on=true,
                    primary_agent=false,
                    photo_url='/path/to/sheridan.jpg',
                    multi_office=false
                );

                addRecord(
                    table='agents',
                    agency_id=5570,
                    name='Daniel ten Broeke',
                    mobile='0408241814',
                    email='dtenbroeke@petrusma.com.au',
                    display_on=true,
                    primary_agent=false,
                    photo_url='/path/to/daniel.jpg',
                    multi_office=false
                );

            } catch (any e) {
                local.exception = e;
            }

            if (StructKeyExists(local, "exception")) {
                transaction action="rollback";
                Throw(
                    errorCode="1",
                    detail=local.exception.detail,
                    message=local.exception.message,
                    type="any"
                );
            } else {
                transaction action="commit";
            }
        }
    }

    function down() {
        transaction {
            try {
                dropTable('agents');
            } catch (any e) {
                local.exception = e;
            }

            if (StructKeyExists(local, "exception")) {
                transaction action="rollback";
                Throw(
                    errorCode="1",
                    detail=local.exception.detail,
                    message=local.exception.message,
                    type="any"
                );
            } else {
                transaction action="commit";
            }
        }
    }

}