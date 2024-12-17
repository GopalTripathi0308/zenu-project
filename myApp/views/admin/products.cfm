<h1>Admin Products</h1>

<table class="table">
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <cfoutput>
            <cfloop array="#products#" item="product">
                <tr>
                    <td>#product.id#</td>
                    <td>#product.name#</td>
                    <td>$#numberFormat(product.price, '999.99')#</td>
                    <td>
                        <a href="#urlFor(action='edit', key=product.id)#" class="btn btn-sm btn-primary">Edit</a>
                        <a href="#urlFor(action='delete', key=product.id)#" class="btn btn-sm btn-danger" 
                           onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>
            </cfloop>
        </cfoutput>
    </tbody>
</table>

<a href="#urlFor(action='new')#" class="btn btn-success">Add New Product</a>