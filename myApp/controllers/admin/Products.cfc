component extends="Controller" {
    function index() {
        // Set data in this scope
        this.products = [
            {
                id = 1,
                name = "Laptop",
                price = 999.99
            },
            {
                id = 2,
                name = "Smartphone",
                price = 599.99
            },
            {
                id = 3,
                name = "Headphones",
                price = 199.99
            }
        ];
        
        // Pass data explicitly to view
        return renderView(data=this);
    }
}

