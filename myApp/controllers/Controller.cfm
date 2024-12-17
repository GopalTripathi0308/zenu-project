private struct function banner() {
    local.data = {
        appName = "MyApp",
        navItems = [
            {text="Users", href="/users"},
            {text="Dashboard", href="/dashboard"}
        ]
    };
    return local.data;
}