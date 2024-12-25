<div class="bg-white border-b">
  <div class="container mx-auto px-4 py-2">
    <nav class="flex items-center text-sm">
      <cfoutput>
        #linkTo(
          route="users",
          class="text-gray-600 hover:text-blue-600",
          encode=false,
          text='<i class="fas fa-home"></i>'
        )#
        
        <span class="mx-2 text-gray-400">></span>
        
        <cfswitch expression="#params.controller#">
          <cfcase value="users">
            <cfif params.action eq "index">
              <span class="text-gray-800">Users</span>
            <cfelseif params.action eq "new">
              #linkTo(route="users", text="Users", class="text-gray-600 hover:text-blue-600")#
              <span class="mx-2 text-gray-400">></span>
              <span class="text-gray-800">New User</span>
            <cfelseif params.action eq "edit">
              #linkTo(route="users", text="Users", class="text-gray-600 hover:text-blue-600")#
              <span class="mx-2 text-gray-400">></span>
              <span class="text-gray-800">Edit User</span>
            </cfif>
          </cfcase>
          <cfcase value="agencies">
            <cfif params.action eq "index">
              <span class="text-gray-800">Agencies</span>
            <cfelseif params.action eq "new">
              #linkTo(route="agencies", text="Agencies", class="text-gray-600 hover:text-blue-600")#
              <span class="mx-2 text-gray-400">></span>
              <span class="text-gray-800">New Agency</span>
            <cfelseif params.action eq "edit">
              #linkTo(route="agencies", text="Agencies", class="text-gray-600 hover:text-blue-600")#
              <span class="mx-2 text-gray-400">></span>
              <span class="text-gray-800">Edit Agency</span>
            <cfelseif params.action eq "show">
              #linkTo(route="agencies", text="Agencies", class="text-gray-600 hover:text-blue-600")#
              <span class="mx-2 text-gray-400">></span>
              <span class="text-gray-800">#agency.name#</span>
            </cfif>
          </cfcase>
          <cfdefaultcase>
            <span class="text-gray-800">#titleize(params.controller)#</span>
          </cfdefaultcase>
        </cfswitch>
      </cfoutput>
    </nav>
  </div>
</div>