<div class="bg-gradient-to-r from-blue-600 to-blue-800 text-white shadow-md">
  <div class="container mx-auto px-4 py-3">
    <div class="flex items-center justify-between">
      <div class="flex items-center space-x-4">
        <a href="/" class="text-xl font-bold">MyApp</a>
        <nav class="hidden md:flex space-x-4">
          <a href="/users" class="hover:text-blue-200">Users</a>
          <a href="/dashboard" class="hover:text-blue-200">Dashboard</a>
        </nav>
      </div>
      <div class="flex items-center space-x-3">
        <cfif structKeyExists(session, "loggedIn")>
          <span>#session.userEmail#</span>
          <a href="/logout" class="px-3 py-1 bg-blue-700 hover:bg-blue-600 rounded">Logout</a>
        <cfelse>
          <a href="/login" class="px-3 py-1 bg-blue-700 hover:bg-blue-600 rounded">Login</a>
        </cfif>
      </div>
    </div>
  </div>
</div>