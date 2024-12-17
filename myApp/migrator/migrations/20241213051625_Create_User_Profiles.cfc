component extends="wheels.migrator.Migration" hint="Create User Profiles Table" {

	function up() {
		transaction {
			try {
				// Create user_profiles table with foreign key
				t = createTable(name = 'user_profiles', force=true);
				t.integer(columnNames='user_id');  // Create the foreign key column
				t.string(columnNames='phone_number', limit='20', null=true);
				t.date(columnNames='date_of_birth', null=true);
				t.string(columnNames='gender', limit='20', null=true);
				t.text(columnNames='bio', null=true);
				t.string(columnNames='profile_picture', limit='255', null=true);
				t.string(columnNames='social_media_links', limit='500', null=true);
				t.timestamps(softDelete=true);
				t.create();

				// Add foreign key constraint with CASCADE rules
				execute("
					ALTER TABLE user_profiles 
					ADD CONSTRAINT fk_user_profiles_users 
					FOREIGN KEY (user_id) 
					REFERENCES users(id) 
					ON DELETE CASCADE 
					ON UPDATE CASCADE
				");

				// Add some sample profile data for existing users
				execute("
					INSERT INTO user_profiles (user_id, phone_number, bio, createdat, updatedat)
					SELECT id, '+91 9876543210', 'Sample bio for ' || name, NOW(), NOW()
					FROM users 
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
				dropTable('user_profiles');
			} catch (any e) {
				local.exception = e;
				transaction action="rollback";
				Throw(errorCode = "1", detail = local.exception.detail, message = local.exception.message, type = "any");
			}
			transaction action="commit";
		}
	}
} 