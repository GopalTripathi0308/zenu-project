component extends="wheels.migrator.Migration" hint="Add User Constraints" {

	function up() {
		transaction {
			try {
				addIndex(table='users', columnNames='email', unique=true, indexName='idx_users_email');
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
				removeIndex(table='users', indexName='idx_users_email');
			} catch (any e) {
				local.exception = e;
				transaction action="rollback";
				Throw(errorCode = "1", detail = local.exception.detail, message = local.exception.message, type = "any");
			}
			transaction action="commit";
		}
	}
} 