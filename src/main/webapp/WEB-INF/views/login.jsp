<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />


<c:set var="contextRoot" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">


<title>Online shopping - ${title}</title>

<script>
	window.menu = '${title}';

	window.contextRoot = '${contextRoot}';
</script>



<!-- Bootstrap core CSS -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">


<!-- Bootstrap core CSS -->
<link href="${css}/style.jsp" rel="stylesheet">

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>


<body class="main">

	<link
		href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
		rel="stylesheet" id="bootstrap-css">
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<!------ Include the above in your HEAD tag ---------->

	<div class="container">
		<c:if test="${not empty message}">
			<div class="row" id="messagebox">
				<div class="col-lg-offset-3 col-lg-6">
					<div class="alert alert-danger" role="alert">
						<strong>Oh snap!</strong> ${ message}
					</div>
				</div>
			</div>
		</c:if>
		
		<c:if test="${not empty logout}">
			<div class="row" id="messagebox">
				<div class="col-lg-offset-3 col-lg-6">
					<div class="alert alert-success" role="alert">
							 ${logout}
					</div>
				</div>
			</div>
		</c:if>

		<div class="row">
			<div class="col-lg-offset-3 col-lg-6">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="text-center">Welcome</h1>
						</div>
						<form action="${contextRoot}/login" method="POST">
							<div class="modal-body">
								<div class="form-group">
									<input type="text" name="username"
										class="form-control input-lg" placeholder="Telephone(0-XX-XXX-XX-XX)"
										required="required" />
								</div>

								<div class="form-group">
									<input type="password" name="password"
										class="form-control input-lg" placeholder="Password"
										required="required" />
								</div>

								<div class="form-group">
									<input type="submit" class="btn btn-block btn-lg btn-primary"
										value="Login" /> <span class="pull-right"><a href="#">Register</a></span><span><a
										href="#">Forgot Password</a></span> 
										<input type="hidden"
										name="${_csrf.parameterName}" value="${_csrf.token}" />
								</div>
							</div>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>



	<script type="text/javascript">
		setTimeout(function() {
			$('#messagebox').fadeOut('slow');
		}, 2000);
	</script>
</body>

</html>