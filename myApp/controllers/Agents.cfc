component extends="Controller" {
    
    function config() {
        provides("html");
    }

    function index() {
        agency = model("agency").findByKey(params.key);
        agents = model("agent").findAll(
            where="id = #params.key#",
            returnAs="objects"
        );
        renderView(agency=agency, agents=agents);
    }

    function create() {
        agent = model("agent").new(params.agent);
        agent.agencyId = params.key;
        if (agent.save()) {
            redirectTo(route="agencyStaff", key=params.key, success="Agent was created successfully.");
        } else {
            redirectTo(route="agencyStaff", key=params.key, error="Failed to create agent.");
        }
    }

    function update() {
        agent = model("agent").findByKey(params.agentKey);
        if (agent.update(params.agent)) {
            redirectTo(route="agencyStaff", key=params.key, success="Agent was updated successfully.");
        } else {
            redirectTo(route="agencyStaff", key=params.key, error="Failed to update agent.");
        }
    }

    function delete() {
        agent = model("agent").findByKey(params.agentKey);
        agent.delete();
        redirectTo(route="agencyStaff", key=params.key, success="Agent was deleted successfully.");
    }
}