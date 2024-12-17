/*
  |----------------------------------------------------------------------------------------------|
	| Parameter  | Required | Type    | Default | Description                                      |
  |----------------------------------------------------------------------------------------------|
	| name       | Yes      | string  |         | table name, in pluralized form                   |
	| force      | No       | boolean | false   | drop existing table of same name before creating |
	| id         | No       | boolean | true    | if false, defines a table with no primary key    |
	| primaryKey | No       | string  | id      | overrides default primary key name               |
  |----------------------------------------------------------------------------------------------|

    EXAMPLE:
      t = createTable(name='employees', force=false, id=true, primaryKey='empId');
			t.string(columnNames='firstName,lastName', default='', null=true, limit='255');
			t.text(columnNames='bio', default='', null=true);
			t.binary(columnNames='credentials');
			t.biginteger(columnNames='sinsCommitted', default='', null=true, limit='1');
			t.char(columnNames='code', default='', null=true, limit='8');
			t.decimal(columnNames='hourlyWage', default='', null=true, precision='1', scale='2');
			t.date(columnNames='dateOfBirth', default='', null=true);
			t.datetime(columnNames='employmentStarted', default='', null=true);
			t.float(columnNames='height', default='', null=true);
			t.integer(columnNames='age', default='', null=true, limit='1');
      t.time(columnNames='lunchStarts', default='', null=true);
			t.uniqueidentifier(columnNames='uid', default='newid()', null=false);
			t.references("vacation");
			t.timestamps();
			t.create();
*/
component extends="wheels.migrator.Migration" hint="Create User Table" {

	function up() {
		transaction {
			try {
				// Create fresh table with force=true will drop if exists
				t = createTable(name = 'users', force=true);
				t.string(columnNames='name', limit='100');
				t.string(columnNames='email', limit='100');
				t.string(columnNames='password', limit='255');
				t.timestamps(softDelete=true);
				t.create();

				// Insert fresh data
				execute("
					INSERT INTO users (name, email, createdat, updatedat) VALUES
					('Gopal Tripathi', 'gopal@company.com', NOW(), NOW()),
					('Support Team', 'support@company.com', NOW(), NOW()),
					('System User', 'system@company.com', NOW(), NOW())
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
				dropTable('users');
			} catch (any e) {
				local.exception = e;
				transaction action="rollback";
				Throw(errorCode = "1", detail = local.exception.detail, message = local.exception.message, type = "any");
			}
			transaction action="commit";
		}
	}

}
