<cfoutput>
<div class="container mx-auto px-4 py-6">
    <!--- Add Breadcrumb --->
    <div class="flex items-center gap-2 text-sm text-gray-600 mb-6">
        #linkTo(route="users", text="<i class='fas fa-home'></i>", encode=false)#
        <span>></span>
        #linkTo(route="agencies", text="Agencies")#
    </div>

    <div class="flex justify-between items-center mb-6">
        <h1 class="text-2xl">Agencies</h1>
        <div class="flex gap-2">
            <button class="px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700 flex items-center gap-2">
                <span>EXPORT</span>
                <i class="fas fa-download"></i>
            </button>
            #linkTo(
                text="NEW AGENCY",
                route="newAgency",
                class="px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700 flex items-center gap-2"
            )#
        </div>
    </div>

    <!--- Status Tabs --->
    <div class="flex gap-4 mb-6">
        #linkTo(
            route="agencies",
            params="status=ALL",
            text="ALL",
            class="px-6 py-2 rounded-md #currentStatus == 'ALL' ? 'bg-blue-600 text-white' : 'hover:bg-gray-100'#"
        )#
        #linkTo(
            route="agencies",
            params="status=ACTIVE",
            text="ACTIVE",
            class="px-6 py-2 rounded-md #currentStatus == 'ACTIVE' ? 'bg-blue-600 text-white' : 'hover:bg-gray-100'#"
        )#
        #linkTo(
            route="agencies",
            params="status=INACTIVE",
            text="INACTIVE",
            class="px-6 py-2 rounded-md #currentStatus == 'INACTIVE' ? 'bg-blue-600 text-white' : 'hover:bg-gray-100'#"
        )#
        #linkTo(
            route="agencies",
            params="status=DRAFT",
            text="DRAFT",
            class="px-6 py-2 rounded-md #currentStatus == 'DRAFT' ? 'bg-blue-600 text-white' : 'hover:bg-gray-100'#"
        )#
    </div>

    <div class="text-sm text-gray-600 mb-4">
        #agencies.recordCount# Agencies
    </div>

    <!--- Filters --->
    <div class="flex gap-4 mb-6">
        <input type="text" placeholder="Refine by ID, Agency or Suburb" class="px-4 py-2 border rounded-md flex-grow">
        <select class="px-4 py-2 border rounded-md w-40">
            <option>State</option>
        </select>
        <select class="px-4 py-2 border rounded-md w-40">
            <option>Show all</option>
        </select>
        <select class="px-4 py-2 border rounded-md w-40">
            <option>Show all</option>
        </select>
        <select class="px-4 py-2 border rounded-md w-40">
            <option>Show All</option>
        </select>
        <button class="px-4 py-2 bg-gray-100 rounded-md">
            <i class="fas fa-search"></i>
        </button>
    </div>

    <!--- Sort Controls --->
    <div class="flex gap-4 mb-4">
        <span class="text-sm">Sort by:</span>
        <select class="px-2 py-1 border rounded-md w-32">
            <option>ID</option>
        </select>
        <select class="px-2 py-1 border rounded-md w-32">
            <option>Ascending</option>
        </select>
    </div>

    <!--- Table --->
    <div class="overflow-x-auto">
        <table class="w-full">
            <thead>
                <tr class="border-b">
                    <th class="text-left py-3">ID</th>
                    <th class="text-left py-3">Agency</th>
                    <th class="text-left py-3">Suburb</th>
                    <th class="text-left py-3">State</th>
                    <th class="text-left py-3">For Sale</th>
                    <th class="text-left py-3">For Lease</th>
                    <th class="text-left py-3">Default Product</th>
                    <th class="text-left py-3">Listing last modified</th>
                    <th class="text-left py-3">Status</th>
                    <th class="text-left py-3"></th>
                </tr>
            </thead>
            <tbody>
                <cfloop query="agencies">
                    <tr class="border-b hover:bg-gray-50">
                        <td class="py-3">#agencies.id#</td>
                        <td class="py-3">#EncodeForHtml(agencies.name)#</td>
                        <td class="py-3">#agencies.suburb#</td>
                        <td class="py-3">#agencies.state#</td>
                        <td class="py-3">#agencies.forSale#</td>
                        <td class="py-3">#agencies.forLease#</td>
                        <td class="py-3">#agencies.defaultProduct#</td>
                        <td class="py-3">#DateFormat(agencies.updatedAt, "ddd, d mmm yy")#</td>
                        <td class="py-3">
                            <span class="px-2 py-1 bg-green-100 text-green-800 rounded-full text-sm">
                                #agencies.status#
                            </span>
                        </td>
                        <td class="py-3">
                            #linkTo(
                                route="editAgency",
                                key=agencies.id,
                                class="text-blue-600 hover:text-blue-800",
                                encode=false,
                                text='<i class="fas fa-edit"></i>'
                            )#
                        </td>
                    </tr>
                </cfloop>
            </tbody>
        </table>
    </div>

    <!--- Pagination --->
    <div class="flex justify-end gap-2 mt-4">
        <button class="px-3 py-1 bg-blue-600 text-white rounded-md">1</button>
        <button class="px-3 py-1 hover:bg-gray-100 rounded-md">2</button>
        <button class="px-3 py-1 hover:bg-gray-100 rounded-md">3</button>
        <span class="px-3 py-1">...</span>
        <button class="px-3 py-1 hover:bg-gray-100 rounded-md">187</button>
    </div>
</div>
</cfoutput> 