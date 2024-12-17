<!--- Place HTML here that should be used as the default layout of your application. --->
<cfparam name="title" type="string" default="MyApp">
<html>
	<head>
		<cfoutput>
			<title>#title#</title>
			#csrfMetaTags()#
		</cfoutput>
		<link href="/stylesheets/main.css" rel="stylesheet">
		<style>
			* {
				margin: 0;
				padding: 0;
				box-sizing: border-box;
			}

			body {
				font-family: 'Arial', sans-serif;
				line-height: 1.6;
				min-height: 100vh;
				display: flex;
				flex-direction: column;
			}

			header {
				background-color: #2c3e50;
				padding: 1rem 0;
				box-shadow: 0 2px 5px rgba(0,0,0,0.1);
			}

			.nav-wrapper {
				max-width: 1200px;
				margin: 0 auto;
				padding: 0 1rem;
				display: flex;
				justify-content: space-between;
				align-items: center;
			}

			.brand-logo {
				color: white;
				text-decoration: none;
				font-size: 1.5rem;
				font-weight: bold;
			}

			.nav-links {
				list-style: none;
				display: flex;
				gap: 2rem;
			}

			.nav-links a {
				color: white;
				text-decoration: none;
				padding: 0.5rem 1rem;
				border-radius: 4px;
				transition: background-color 0.3s;
			}

			.nav-links a:hover {
				background-color: #34495e;
			}

			main {
				flex: 1;
				max-width: 1200px;
				margin: 2rem auto;
				padding: 0 1rem;
			}

			footer {
				background-color: #2c3e50;
				color: white;
				padding: 2rem 0;
				margin-top: auto;
			}

			.footer-content {
				max-width: 1200px;
				margin: 0 auto;
				padding: 0 1rem;
				text-align: center;
			}

			/* Flash messages styling */
			.flash-message {
				padding: 1rem;
				margin-bottom: 1rem;
				border-radius: 4px;
			}

			.flash-error {
				background-color: #fee2e2;
				border: 1px solid #ef4444;
				color: #991b1b;
			}

			.flash-success {
				background-color: #dcfce7;
				border: 1px solid #22c55e;
				color: #166534;
			}
		</style>
	</head>

	<body>
		<header>
			<nav>
				<cfoutput>
					<div class="nav-wrapper">
						<cfoutput>
							#linkTo(text="MyApp", controller="wheels", action="wheels", class="brand-logo")#
							<ul class="nav-links">
								<li>#linkTo(text="Users", controller="users", action="index")#</li>
								<li>#linkTo(text="Sign Up", controller="users", action="new")#</li>
							</ul>
						</cfoutput>
					</div>
				</cfoutput>
			</nav>
		</header>

		<main>
			<cfoutput>
				#flashMessages()#
				#includeContent()#
			</cfoutput>
		</main>

		<footer>
			<cfoutput>
				<div class="footer-content">
					<div class="copyright">
						&copy; #Year(Now())# MyApp. All rights reserved.
					</div>
				</div>
			</cfoutput>
		</footer>
		
		<script src="/javascripts/main.js"></script>
	</body>
</html>
