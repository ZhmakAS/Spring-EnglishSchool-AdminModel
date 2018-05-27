
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<spring:url var="css" value="/resources/css" />
<spring:url var="images" value="/resources/images" />



<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- Website CSS style -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">

<!-- Website Font style -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Passion+One'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Oxygen'
	rel='stylesheet' type='text/css'>
<!--Custom file style-->
<link href="${css}/styles.css" rel="stylesheet">

<title>Request</title>
</head>
<body>
	<div class="container">
	<div class="row">
	<div class="col-lg-12">
	
	</div>
	</div>
		<c:if test="${not empty warning}">
			<div class="row" id="messagebox">
				<div class=" col-lg-12">
					<div class="alert alert-danger" role="alert">
						<strong>Oh snap!</strong> ${warning}
					</div>
				</div>
			</div>
		</c:if>
		<div class="row">
			<div class="main-login main-center">
				<h5>Sign up once and watch any of our free demos.</h5>
				<sf:form class="" method="post"
					action="${contextRoot}/procces/submit" modelAttribute="request">

					<div class="form-group">
						<label for="name" class="cols-sm-2 control-label">Your
							Name</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user fa"
									aria-hidden="true"></i></span>
									<sf:input type="text" class="form-control" path="name" id="name"
									placeholder="Enter your Name" />
								<sf:errors path="name" cssClass="text-dark" element="em"></sf:errors>					
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="email" class="cols-sm-2 control-label">Your
							Email</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-envelope fa" aria-hidden="true"></i></span>
								<sf:input type="text" class="form-control" path="email"
									id="email" placeholder="Enter your Email" />
								<sf:errors path="email" cssClass="text-dark" element="em"></sf:errors>

							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="username" class="cols-sm-2 control-label">Phone</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-users fa"
									aria-hidden="true"></i></span>
								<sf:input type="text" class="form-control" path="phone"
									id="username" placeholder="Enter your phone" />
								<sf:errors path="phone" cssClass="text-dark" element="em"></sf:errors>
							</div>
						</div>
					</div>


					<div class="form-group ">
						<input type="submit" name="submit" id="submit"
							value="Submit Request"
							class="btn btn-primary btn-lg btn-block login-button" />
						<sf:hidden path="id" />
					</div>

				</sf:form>
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