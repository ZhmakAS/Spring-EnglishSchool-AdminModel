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

<title>EnglishSchool - ${title}</title>

<script>
	window.menu = '${title}';

	window.contextRoot = '${contextRoot}';
</script>


<!-- Bootstrap core CSS -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">


<!-- dataTable styleeds-->
<link href="${css}/dataTables.bootstrap.css" rel="stylesheet">

<link href="${css}/styles.css" rel="stylesheet">
<%@ include file="./shared/styles.jsp" %>


</head>

<body>

	<!-- Custom styles for this template -->
	<%@ include file="./shared/navbar.jsp"%>


	<c:if test="${adminClickManageData == true}">
		<%@ include file="managePage.jsp"%>
	</c:if>

	<c:if
		test="${adminClickTeachers == true or adminClickStudents == true or 
	adminClickGroups == true or adminClickGroupID == true or adminClickRequest ==true}">
		<%@ include file="managePage.jsp"%>
	</c:if>

	<c:if test="${adminClickShowUser == true}">
		<%@ include file="profile.jsp"%>
	</c:if>

	<script src="${js}/jquery.min.js"></script>
	<script src="${js}/bootstrap.bundle.min.js"></script>
	<!-- DataTable Plugin --> 
	<script src="${js}/jquery.dataTables.js"></script>
	<!-- Bootsrtap DataTable config File -->
	<script src="${js}/dataTables.bootstrap.js"></script>
	<script src="${js}/config.js"></script>
	<script src="${js}/bootbox.min.js"></script>

</body>

</html>