<!-- Bootstrap-theme CSS -->
<link href="${css}/bootstrap-theam.css" rel="stylesheet">
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container">
		<a class="navbar-brand" href="${contextRoot}/home">EnglishSchool</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav navbar-left">
				<li class="nav-item" id="home"><a class="nav-link"
					href="${contextRoot}/home">Home <span class="sr-only">(current)</span>
				</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li class="nav-item " id="contact">
				<a class="nav-link" href="${contextRoot}/perform-logout">LogOut</a>
					</li>
				</li>
				<li class="nav-item " id="login">
				<a class="nav-link" href="${contextRoot}/login">Login</a>
				</li>

			</ul>
		</div>
	</div>
</nav>