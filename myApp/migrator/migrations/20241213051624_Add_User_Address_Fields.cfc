component extends="wheels.migrator.Migration" hint="Add address fields to users table" {

	function up() {
		transaction {
			try {
				// Add new columns to users table
				addColumn(table='users', columnType='string', columnName='city', limit='100', null=true);
				addColumn(table='users', columnType='string', columnName='pincode', limit='10', null=true);
				addColumn(table='users', columnType='text', columnName='address', null=true);

				// Optionally add some sample data to existing records
				execute("
					UPDATE users 
					SET city = 'Mumbai', 
						pincode = '400001', 
						address = '123 Main Street, Andheri East'
					WHERE email = 'gopal@company.com'
				");
			} catch (any e) {
				local.exception = e;
				transaction action="rollback";
				Throw(errorCode = "1", detail = local.exception.detail, message = local.exception.message, type = "any");
			}
			transaction action="commit";
		}
	}

	function down() {
		transaction {
			try {
				// Remove the columns in reverse order
				removeColumn(table='users', columnName='address');
				removeColumn(table='users', columnName='pincode');
				removeColumn(table='users', columnName='city');
			} catch (any e) {
				local.exception = e;
				transaction action="rollback";
				Throw(errorCode = "1", detail = local.exception.detail, message = local.exception.message, type = "any");
			}
			transaction action="commit";
		}
	}
} 