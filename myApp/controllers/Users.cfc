component extends="Controller" {
    function config(){}

    function index() {
        users = model("user").findAll(order="name");
        cfdump(users);
    }

    function new() {
        user = model("user").new();
    }

    function create() {
        user = model("user").create(params.user);

        redirectTo(
            route="users",
            success="User created successfully."
        );
    }

    function edit() {
        user = model("user").findByKey(params.key);
    }

    function update() {
    user = model("user").findByKey(params.key);
    user.update(params.user);

    redirectTo(
        route="editUser",
        key=user.id,
        success="User updated successfully."
        );
    }


    function delete() {
        user = model("user").findByKey(params.key);
        user.delete();

        redirectTo(
            route="users",
            success="User deleted successfully."
        );
    }   


}