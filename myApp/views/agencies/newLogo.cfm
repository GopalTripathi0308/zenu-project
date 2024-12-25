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
        #linkTo(route="agencyImages", key=agency.id, text="Images")#
        <span>></span>
        <span>Add Logo</span>
    </div>

    <div class="mb-6">
        <h1 class="text-2xl">Upload Logo for #agency.name#</h1>
    </div>

    #startFormTag(
        route="uploadAgencyLogo", 
        key=agency.id, 
        multipart=true, 
        class="max-w-2xl bg-white rounded-lg shadow-md p-6"
    )#
        <div class="mb-6">
            <label class="block text-sm font-medium text-gray-700 mb-2">Select Logo File</label>
            <input type="file" name="logo" accept="image/*" class="w-full">
            <p class="mt-2 text-sm text-gray-500">Recommended size: 200x100 pixels. Supported formats: JPG, PNG</p>
        </div>

        <div class="flex justify-end gap-4">
            #linkTo(route="agencyImages", key=agency.id, text="Cancel", class="px-6 py-2 border rounded-md hover:bg-gray-50")#
            #submitTag(value="Upload Logo", class="px-6 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700")#
        </div>
    #endFormTag()#
</div>
</cfoutput> 