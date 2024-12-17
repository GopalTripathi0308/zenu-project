function setup() {
  // create an instance of our model
  user = model("user").new();

  // a structure containing some default properties for the model
  properties = {
      firstName="Hugh",
      lastName="Dunnit",
      email="hugh@example.com",
      username="myusername",
      password="foobar",
      passwordConfirmation="foobar"
  };
}



function testUserModelShouldFailCustomValidation() {
  // set the properties of the model
  user.setProperties(properties);
  user.username = "2theBatmobile!";

  // run the validation
  user.valid();

  actual = user.allErrors()[1].message;
  expected = "Username cannot start with a number.";

  // assert that the expected error message is generated
  assert("actual eq expected");
}