<cfoutput>
<div class="container mx-auto px-4 py-6">
    <!--- Breadcrumb --->
    <div class="flex items-center gap-2 text-sm text-gray-600 mb-6">
        #linkTo(route="users", text="<i class='fas fa-home'></i>", encode=false)#
        <span>></span>
        #linkTo(route="agencies", text="Agencies")#
        <span>></span>
        #linkTo(text=agency.name)#
        <span>></span>
        <span>Images</span>
    </div>

    <div class="mb-6">
        <h1 class="text-2xl">#agency.name# (#agency.id#)</h1>
    </div>

    <!--- Tabs --->
    <div class="flex gap-4 border-b mb-6">
        #linkTo(route="editAgency", key=agency.id, text="DETAILS", class="px-6 py-2")#
        <button class="px-6 py-2">STAFF</button>
        <button class="px-6 py-2">PRODUCTS</button>
        #linkTo(route="agencyImages", key=agency.id, text="IMAGES", class="px-6 py-2 border-b-2 border-blue-600 text-blue-600")#
        <button class="px-6 py-2">COMMS</button>
        <button class="px-6 py-2">PROPERTIES</button>
        <button class="px-6 py-2">NOTES</button>
        <button class="px-6 py-2">XML</button>
    </div>

    <!--- Wrap the content in a form --->
    #startFormTag(method="patch", key=agency.id, route="agency", class="max-w-4xl")#
        <!--- Logo Section --->
        <div class="bg-white rounded-lg shadow-md p-6 mb-6">
            <div class="flex justify-between items-center mb-4">
                <h2 class="text-xl font-semibold">Logo</h2>
                #linkTo(
                    route="addAgencyLogo",
                    key=agency.id,
                    text="ADD LOGO",
                    class="px-4 py-2 bg-green-600 text-white rounded-md hover:bg-green-700"
                )#
            </div>
            
            <div class="border rounded-lg p-8 flex items-center justify-center">
                <cfif len(agency.logo)>
                    <img src="#agency.logo#" alt="Agency Logo" class="max-w-xs">
                <cfelse>
                    <div class="text-center text-gray-500">
                        <i class="fas fa-image text-4xl mb-2"></i>
                        <p>No logo uploaded</p>
                    </div>
                </cfif>
            </div>
        </div>

        <!--- Colors Section --->
        <div class="bg-white rounded-lg shadow-md p-6">
            <h2 class="text-xl font-semibold mb-4">Colors</h2>
            
            <div class="grid grid-cols-2 gap-6">
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Background Color</label>
                    #textField(
                        objectName="agency", 
                        property="backgroundColor", 
                        class="w-full px-3 py-2 border rounded-md",
                        label="",
                        placeholder="fdec02",
                        value=agency.backgroundColor
                    )#
                </div>
                
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Font Color</label>
                    #textField(
                        objectName="agency", 
                        property="fontColor", 
                        class="w-full px-3 py-2 border rounded-md",
                        label="",
                        placeholder="1b1c1a",
                        value=agency.fontColor
                    )#
                </div>
            </div>
        </div>

        <!--- Update Button --->
        <div class="flex justify-end mt-6">
            #submitTag(value="UPDATE", class="px-6 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700")#
        </div>
    #endFormTag()#
</div>
</cfoutput> 