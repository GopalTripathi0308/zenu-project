component extends="wheels.migrator.Migration" {
    function up() {
        addColumn(table='agencies', columnType='string', columnName='logo', limit=255, nullable=true);
        addColumn(table='agencies', columnType='string', columnName='background_color', limit=6, nullable=true);
        addColumn(table='agencies', columnType='string', columnName='font_color', limit=6, nullable=true);
    }

    function down() {
        removeColumn(table='agencies', columnName='logo');
        removeColumn(table='agencies', columnName='background_color');
        removeColumn(table='agencies', columnName='font_color');
    }
} 