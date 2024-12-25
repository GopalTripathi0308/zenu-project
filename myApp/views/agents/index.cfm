<cfoutput>
<div class="container mx-auto px-4 py-6">
    <div class="flex items-center gap-2 text-sm text-gray-600 mb-6">
        #linkTo(route="users", text="<i class='fas fa-home'></i>", encode=false)#
        <span>></span>
        #linkTo(route="agencies", text="Agencies")#
        <span>></span>
        #linkTo(text=agency.name)#
        <span>></span>
        <span>Staff</span>
    </div>

    <div class="mb-6">
        <h1 class="text-2xl">#agency.name# (#agency.id#)</h1>
    </div>

    <!--- Tabs --->
    <div class="flex gap-4 border-b mb-6">
        #linkTo(route="editAgency", key=agency.id, text="DETAILS", class="px-6 py-2")#
        #linkTo(route="agencyStaff", key=agency.id, text="STAFF", class="px-6 py-2 border-b-2 border-blue-600 text-blue-600")#
        <button class="px-6 py-2">PRODUCTS</button>
        #linkTo(route="agencyImages", key=agency.id, text="IMAGES", class="px-6 py-2")#
        <button class="px-6 py-2">COMMS</button>
        <button class="px-6 py-2">PROPERTIES</button>
        <button class="px-6 py-2">NOTES</button>
        <button class="px-6 py-2">XML</button>
    </div>

    <div class="bg-white rounded-lg shadow-md">
        <div class="p-6 flex justify-between items-center border-b">
            <div>
                <h2 class="text-xl font-semibold">#arrayLen(agents)# Staff (Drag the row to sort)</h2>
            </div>
            #linkTo(text="NEW STAFF +", class="px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700")#
        </div>

        <div class="p-6 border-b">
            <div class="flex gap-4">
                <input type="text" placeholder="Refine by Name, Mobile or Email" class="flex-1 px-3 py-2 border rounded-md">
                <div class="flex gap-2 items-center">
                    <span class="text-sm text-gray-600">Sort by:</span>
                    <select class="px-3 py-2 border rounded-md w-32">
                        <option>Default</option>
                    </select>
                    <select class="px-3 py-2 border rounded-md w-32">
                        <option>Ascending</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="overflow-x-auto">
            <table class="w-full">
                <thead class="bg-gray-50">
                    <tr>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Name</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Position</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Mobile</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Email</th>
                        <th class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Display on</th>
                        <th class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Primary</th>
                        <th class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Photo</th>
                        <th class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Multi Office?</th>
                        <th class="px-6 py-3"></th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                    <cfloop array="#agents#" item="agent">
                        <tr class="hover:bg-gray-50">
                            <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                                #agent.name#
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                #agent.position#
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                #agent.mobile#
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                #agent.email#
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-center">
                                <input type="checkbox" <cfif agent.displayOn>checked</cfif> class="h-4 w-4">
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-center">
                                <input type="checkbox" <cfif agent.isPrimary>checked</cfif> class="h-4 w-4">
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-center">
                                <cfif len(agent.photoUrl)>
                                    <img src="#agent.photoUrl#" class="h-8 w-8 rounded-full mx-auto">
                                </cfif>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-center">
                                <input type="checkbox" <cfif agent.isMultiOffice>checked</cfif> class="h-4 w-4">
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                <div class="flex gap-2 justify-end">
                                    <button class="text-blue-600 hover:text-blue-900">
                                        <i class="fas fa-plus"></i>
                                    </button>
                                    <button class="text-red-600 hover:text-red-900">
                                        <i class="fas fa-times"></i>
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </cfloop>
                </tbody>
            </table>
        </div>
    </div>
</div>
</cfoutput>