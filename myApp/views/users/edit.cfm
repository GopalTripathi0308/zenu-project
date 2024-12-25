<cfoutput>
<div class="container mx-auto px-4 py-8 max-w-md">
    <nav class="flex items-center space-x-2 mb-6 text-gray-600">
        <a href="users" class="hover:text-gray-900">
            <i class="fas fa-home"></i> Home
        </a>
        <span class="text-gray-400">/</span>
        #linkTo(
            route="users",
            text="Users",
            class="hover:text-gray-900"
        )#
        <span class="text-gray-400">/</span>
        <span class="text-gray-900">Edit User</span>
    </nav>

    <h1 class="text-3xl font-bold mb-6">Edit User #EncodeForHtml(user.name)#</h1>

    #startFormTag(route="user", key=user.key(), method="patch", class="space-y-6")#
        <div>
            #textField(
                objectName="user",
                property="name",
                label="Name",
                class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500",
                labelClass="block text-sm font-medium text-gray-700"
            )#
        </div>

        <div>
            #textField(
                objectName="user",
                property="email",
                label="Email",
                class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500",
                labelClass="block text-sm font-medium text-gray-700"
            )#
        </div>

        <div>
            #passwordField(
                objectName="user",
                property="password",
                label="Password",
                class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500",
                labelClass="block text-sm font-medium text-gray-700"
            )#
        </div>

        <div>
            #submitTag(class="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500")#
        </div>
    #endFormTag()#
</div>
</cfoutput>