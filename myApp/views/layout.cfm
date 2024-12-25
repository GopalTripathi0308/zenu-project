<!DOCTYPE html>
<html lang="en">
<head>
	<cfoutput>
		<title>Admin</title>
		#csrfMetaTags()#
	</cfoutput>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="https://cdn.tailwindcss.com"></script>
	<script src="https://kit.fontawesome.com/6669a1af88.js" crossorigin="anonymous"></script>
	<link href="/stylesheets/main.css" rel="stylesheet">
</head>
<body class="bg-gray-50 min-h-screen flex flex-col">
	<header class="bg-white shadow-sm">
		<div class="container mx-auto px-4">
			<div class="flex items-center justify-between h-16">
				<!-- Logo Section -->
				<div class="flex items-center">
					<cfoutput>
						#linkTo(
							route="agencies",
							class="text-xl font-bold",
							encode=false,
							text='<img src="/images/logo.png" alt="View Admin Logo" class="h-8 w-auto mr-2">'
						)#
					</cfoutput>
				</div>

				<!-- Search Bar -->
				<div class="flex-1 max-w-xl mx-8">
					<div class="relative">
						<input type="text" 
							   placeholder="Agent, Property, ID" 
							   class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
						>
						<div class="absolute inset-y-0 right-0 flex items-center pr-3">
							<i class="fas fa-search text-gray-400"></i>
						</div>
					</div>
				</div>

				<!-- Navigation Items -->
				<nav class="flex items-center space-x-8">
					<cfoutput>
						#linkTo(
							route="agencies",
							class="flex items-center text-gray-600 hover:text-blue-600",
							encode=false,
							text='<i class="fas fa-users-rectangle mr-2"></i><span>AGENCIES</span>'
						)#
					</cfoutput>
					<a href="##" class="flex items-center text-gray-600 hover:text-blue-600">
						<i class="fas fa-building mr-2"></i>
						<span>PROPERTIES</span>
					</a>
					<a href="##" class="flex items-center text-gray-600 hover:text-blue-600">
						<i class="fas fa-box mr-2"></i>
						<span>PRODUCTS</span>
					</a>
					<a href="##" class="flex items-center text-gray-600 hover:text-blue-600">
						<i class="fas fa-chart-line mr-2"></i>
						<span>REPORTS</span>
					</a>
					<a href="##" class="flex items-center text-gray-600 hover:text-blue-600">
						<i class="fas fa-cog"></i>
					</a>
				</nav>
			</div>
		</div>
	</header>

	<main class="flex-1">
		<cfoutput>
			<div class="container mx-auto px-4 py-8">
				#flashMessages()#
				#includeContent()#
			</div>
		</cfoutput>
	</main>

	<footer class="bg-white border-t">
		<div class="container mx-auto px-4 py-4">
			<cfoutput>
				<p class="text-center text-gray-600">&copy; #Year(Now())# View Admin. All rights reserved.</p>
			</cfoutput>
		</div>
	</footer>

	<script src="/javascripts/main.js"></script>
</body>
</html>
