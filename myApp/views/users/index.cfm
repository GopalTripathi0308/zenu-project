<cfoutput>
<cfinclude template="../shared/_banner.cfm">

<div class="container mx-auto px-4 py-6">

    <h1 class="text-3xl font-bold mb-6">Users</h1>

    <div class="mb-4">
        #linkTo(
            text="New User",
            route="newUser",
            class="inline-flex items-center px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700"
        )#
    </div>

    <div class="overflow-x-auto">
        <table class="min-w-full bg-white shadow-md rounded-lg">
            <thead class="bg-gray-50">
                <tr>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Name</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Email</th>
                    <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" colspan="2">Actions</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-200">
                <cfloop query="users">
                    <tr class="hover:bg-gray-50">
                        <td class="px-6 py-4 whitespace-nowrap">
                            #EncodeForHtml(users.name)#
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            #EncodeForHtml(users.email)#
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            #linkTo(
                                text="Edit",
                                route="editUser",
                                key=users.id,
                                title="Edit #users.name#",
                                class="text-indigo-600 hover:text-indigo-900"
                            )#
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            #buttonTo(
                                text="Delete",
                                route="user",
                                key=users.id,
                                method="delete",
                                title="Delete #users.name#",
                                class="text-red-600 hover:text-red-900"
                            )#
                        </td>
                    </tr>
                </cfloop>
            </tbody>
        </table>
    </div>
</div>
</cfoutput>