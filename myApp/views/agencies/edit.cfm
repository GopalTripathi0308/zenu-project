<cfoutput>
<div class="container mx-auto px-4 py-6">
    <div class="flex items-center gap-2 text-sm text-gray-600 mb-6">
        #linkTo(route="users", text="<i class='fas fa-home'></i>", encode=false)#
        <span>></span>
        #linkTo(route="agencies", text="Agencies")#
        <span>></span>
        #linkTo(text=agency.name)#
    </div>

    <div class="mb-6">
        <h1 class="text-2xl">#agency.name# (#agency.id#)</h1>
    </div>

    <!--- Tabs --->
    <div class="flex gap-4 border-b mb-6">
        #linkTo(route="editAgency", key=agency.id, text="DETAILS", class="px-6 py-2 border-b-2 border-blue-600 text-blue-600")#
        #linkTo(route="agencyStaff", key=agency.id, text="STAFF", class="px-6 py-2")#
        <button class="px-6 py-2">PRODUCTS</button>
        #linkTo(route="agencyImages", key=agency.id, text="IMAGES", class="px-6 py-2")#
        <button class="px-6 py-2">COMMS</button>
        <button class="px-6 py-2">PROPERTIES</button>
        <button class="px-6 py-2">NOTES</button>
        <button class="px-6 py-2">XML</button>
    </div>

    <!--- Form --->
    #startFormTag(method="patch", key=agency.id, route="agency", class="max-w-4xl")#
        
        <!--- Agency Details Section --->
        <div class="bg-white rounded-lg shadow-md p-6 mb-6">
            <h2 class="text-xl font-semibold mb-4">Agency Details</h2>
            
            <div class="grid grid-cols-2 gap-6">
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Agency Name</label>
                    #textField(
                        objectName="agency", 
                        property="name", 
                        class="w-full px-3 py-2 border rounded-md",
                        label="",
                        placeholder="Name"
                    )#
                </div>
                
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Suburb</label>
                    #textField(
                        objectName="agency", 
                        property="suburb", 
                        class="w-full px-3 py-2 border rounded-md",
                        label="",
                        placeholder="Suburb"
                    )#
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">State</label>
                    #selectTag(
                        objectName="agency", 
                        property="state", 
                        name="agency[state]",
                        options="VIC,NSW,QLD,WA,SA,TAS,NT,ACT", 
                        selected=agency.state,
                        class="w-full px-3 py-2 border rounded-md",
                        label=""
                    )#
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Status</label>
                    #selectTag(
                        objectName="agency", 
                        property="status", 
                        name="agency[status]",
                        options="ACTIVE,INACTIVE,DRAFT", 
                        selected=agency.status,
                        class="w-full px-3 py-2 border rounded-md",
                        label=""
                    )#
                </div>
            </div>
        </div>

        <!--- Listing Stats Section --->
        <div class="bg-white rounded-lg shadow-md p-6 mb-6">
            <h2 class="text-xl font-semibold mb-4">Listing Stats</h2>
            
            <div class="grid grid-cols-2 gap-6">
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">For Sale</label>
                    #textField(
                        objectName="agency", 
                        property="forSale", 
                        class="w-full px-3 py-2 border rounded-md", 
                        type="number",
                        label=""
                    )#
                </div>
                
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">For Lease</label>
                    #textField(
                        objectName="agency", 
                        property="forLease", 
                        class="w-full px-3 py-2 border rounded-md", 
                        type="number",
                        label=""
                    )#
                </div>

                <div class="col-span-2">
                    <label class="block text-sm font-medium text-gray-700 mb-1">Default Product</label>
                    #selectTag(
                        objectName="agency", 
                        property="defaultProduct", 
                        name="agency[defaultProduct]",
                        options="Basic Subscription,Standard Subscription,Premium All,Feature All - per listing(Sale),Feature All - per listing(All)", 
                        selected=agency.defaultProduct,
                        class="w-full px-3 py-2 border rounded-md",
                        label=""
                    )#
                </div>
            </div>
        </div>

        <!--- Submit Button --->
        <div class="flex justify-end gap-4">
            #linkTo(route="agencies", text="Cancel", class="px-6 py-2 border rounded-md hover:bg-gray-50")#
            #submitTag(value="Save Changes", class="px-6 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700")#
        </div>
    #endFormTag()#
</div>
</cfoutput> 