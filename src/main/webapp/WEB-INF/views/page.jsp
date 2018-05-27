<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />


<c:set var="contextRoot" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Welcome Page</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link href="https://fonts.googleapis.com/css?family=Indie+Flower"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Amatic+SC"
	rel="stylesheet">
<!--Custom file style-->
<link href="${css}/styles.css" rel="stylesheet">
<style type="text/css">
header {
	background-image: url(${images}/layer.png);
	background-repeat: no-repeat;
	background-size: cover;
	color: white;
	width: 100%;
	min-height: 100%;
	padding-bottom: 200px;
}
</style>
</head>
<body>
	<header id="header" class="main__header">
	<div class="container">
		<div class="row">
			<div class="col-lg-5 ">
				<nav>
				<ul class="menu d-flex justify-content-center">
					<li class="menu__item"><a href="${contextRoot}/home"
						class="home"> Home </a></li>
					<li class="menu__item"><a href=""> AboutUs </a></li>
					<li class="menu__item"><a href="${contextRoot}/login">
							LogIn </a></li>
					<li class="menu__item"><a href="${contextRoot}/contact">
							ContactUs </a></li>
					<security:authorize access="hasAuthority('USER')">
						<li class="menu__item"><a href="${contextRoot}/profile">
								Profile </a></li>
					</security:authorize>
					<security:authorize access="hasAuthority('TEACHER')">
						<li class="menu__item"><a
							href="${contextRoot}/profile/teacher"> Profile </a></li>
					</security:authorize>
					<security:authorize access="hasAuthority('ADMIN')">
						<li class="menu__item"><a href="${contextRoot}/manage/school">
								Manage </a></li>
					</security:authorize>


				</ul>
				</nav>
			</div>

			<div class="col-lg-3 ml-auto">
				<div class="topnav ">
					<input type="text" placeholder="Search..">
				</div>
			</div>

		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="title ">
					<h2 class="title__main ml-auto">Knowledge is Eternal Happiness
					</h2>
					<a href="${contextRoot}/submission" class="ctm_button">work
						with us</a>
				</div>
			</div>
		</div>
	</div>
	</header>
	<section id="offer" class="offers">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="title_section2">
					<h3 class="title__offer">what we offer</h3>
					<p class="offer__text">Lorem ipsum dolor sit amet. Proin
						gravida nibh vel velit auctor aliquet</p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4">
				<div class="feature">

					<a href="register.html" class="offer_button"> <i
						class="fa fa-book feature__icon"></i>
					</a>

					<div class="feature__block">
						<h3 class="feature__title">Standart Course</h3>
						<p class="feature__text">Lorem ipsum dolor sit amet,
							consectetur adipiscing elit. Praesent vitae eros eget tellus
							tristique bibendum.</p>
					</div>

					<a href="${contextRoot}/description" class="ctm_button">Learn
						more</a>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="feature ">
					<a href="register.html" class="offer_button"> <i
						class="fa fa-briefcase feature__icon"></i>
					</a>
					<div class="feature__block">
						<h3 class="feature__title">Intensive Course</h3>
						<p class="feature__text">Lorem ipsum dolor sit amet,
							consectetur adipiscing elit. Praesent vitae eros eget tellus
							tristique bibendum.</p>
					</div>
					<a href="${contextRoot}/description" class="ctm_button">Learn
						more</a>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="feature">
					<a href="register.html" class="offer_button"> <i
						class="fa fa-university feature__icon"></i>
					</a>
					<div class="feature__block">
						<h3 class="feature__title">Exam Preparation</h3>
						<p class="feature__text">Lorem ipsum dolor sit amet,
							consectetur adipiscing elit. Praesent vitae eros eget tellus
							tristique bibendum.</p>
					</div>
					<a href="${contextRoot}/description" class="ctm_button">Learn
						more</a>
				</div>
			</div>
		</div>
	</div>
	</section>
	<section>
	<div class="section touch" id="touch">
		<div class="container">
			<div class="row">

				<div class="col-lg-12">
					<div class="title">
						<h2 class="title__main yellow">Keep in touch with us</h2>
						<p class="title__text">Lorem ipsum dolor sit amet, consectetur
							adipiscing elit. Praesent vitae eros eget tellus tristique
							bibendum. Donec rutrum sed sem quis venenatis</p>

					</div>
				</div>


			</div>
			<div class="row">
				<div class="col-lg-10 m-auto">
					<form action="@" class="form">
						<input type="email" placeholder="Enter  your email to update"
							class="form__input" required>
						<button type="submit" class="form__btn">Submit</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	</section>

	<div class="section footer" id="footer">
		<div class="row">
			<div class="col-lg-12">
				<div class="credits">HALOVIETNAM LTD 66, Dang Van ngu, Dong Da
					Hanoi, Vietnam</div>
			</div>
		</div>
	</div>
</body>
</html>