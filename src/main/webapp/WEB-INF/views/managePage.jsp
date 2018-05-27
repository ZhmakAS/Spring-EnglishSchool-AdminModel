<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<c:if test="${adminClickTeachers  == true}">

	<script>
		window.data = 'teachers';
	</script>
	<ol class="breadcrumb">

		<li class="breadcrumb-item"><a href="${contextRoot}/home">Home</a></li>
		<li class="breadcrumb-item active">Teachers</li>
	</ol>
</c:if>


<c:if test="${adminClickStudents  == true}">

	<script>
		window.data = 'students';
	</script>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="${contextRoot}/home">Home</a></li>
		<li class="breadcrumb-item active">Students</li>
	</ol>
</c:if>

<c:if test="${adminClickRequest  == true}">

	<script>
		window.data = 'requests';
	</script>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="${contextRoot}/home">Home</a></li>
		<li class="breadcrumb-item active">Requests</li>
	</ol>
</c:if>

<c:if test="${adminClickGroups  == true}">

	<script>
		window.data = 'groups';
	</script>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="${contextRoot}/home">Home</a></li>
		<li class="breadcrumb-item active">Groups</li>
	</ol>
</c:if>

<c:if test="${adminClickGroupID  == true}">

	<script>
		window.data = 'groupID';
		window.groupId = '${group.id}'
	</script>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="${contextRoot}/home">Home</a></li>
		<li class="breadcrumb-item active">Group</li>
		<li class="breadcrumb-item active">${group.title}</li>
	</ol>
</c:if>

<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="text-muted">Welcome ${user.firstName}
				${user.lastName}</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-4">
			<h3>Management Block</h3>
			<br />
			<%@ include file="./shared/sidebar.jsp"%>
		</div>




		<c:if test="${adminClickStudents  == true}">
			<div class=" col-md-8">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>${Title}</h4>
					</div>
					<div class="panel-body">
						<sf:form class="form-horizontal" modelAttribute="user"
							action="/EnglishSchool/manage/add/student" method="POST">

							<div class="form-group">
								<label class="control-label col-md-4" for="name">Enter
									Student First Name: </label>
								<div class="col-md-8">
									<sf:input type="text" id="firstNname" path="firstName"
										placeholder="Student First Name" class="form-control" />
									<sf:errors path="firstName" cssClass="text-danger" element="em"></sf:errors>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-4" for="name">Enter
									Student Last Name: </label>
								<div class="col-md-8">
									<sf:input type="text" id="lastName" path="lastName"
										placeholder="Student Last Name" class="form-control" />
									<sf:errors path="lastName" cssClass="text-danger" element="em"></sf:errors>
								</div>
							</div>


							<div class="form-group">
								<label class="control-label col-md-4" for="unitPrice">Enter
									Student Age: </label>
								<div class="col-md-8">
									<sf:input type="number" id="Student Age" path="age"
										placeholder="Student Age" class="form-control" />
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-4" for="quantity">Enter
									Student Phone: </label>
								<div class="col-md-8">
									<sf:input type="text" id="phone" path="phone"
										placeholder="Phone Number" class="form-control" />
									<sf:errors path="phone" cssClass="text-danger" element="em"></sf:errors>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-4" for="name">Enter
									Student Address: </label>
								<div class="col-md-8">
									<sf:input type="text" id="address" path="address"
										placeholder="Student Address" class="form-control" />
									<sf:errors path="address" cssClass="text-danger" element="em"></sf:errors>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-4" for="quantity">Select
									Level:</label>
								<div class="col-md-8">
									<sf:select class="form-control" id="levelId" path="level_id"
										items="${levels}" itemLabel="title" itemValue="id" />
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-4" for="quantity">Select
									Group:</label>
								<div class="col-md-8">
									<sf:select class="form-control" id="groupId" path="group_id"
										items="${groups}" itemLabel="title" itemValue="id" />
								</div>
							</div>

							<div class="form-group">
								<div class="col-md-offset-4 col-md-8">
									<input type="submit" name="submit" id="submit" value="Submit"
										class="btn btn-primary" />
									<sf:hidden path="id" />
									<sf:hidden path="code" />
									<sf:hidden path="active" />
								</div>
							</div>

						</sf:form>

					</div>

				</div>
			</div>

		</c:if>



		<c:if test="${adminClickTeachers  == true}">
			<div class=" col-md-8">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>${Title}</h4>
					</div>
					<div class="panel-body">
						<sf:form class="form-horizontal" modelAttribute="teacher"
							action="/EnglishSchool/manage/add/teacher" method="POST">

							<div class="form-group">
								<label class="control-label col-md-4" for="name">Enter
									Teacher First Name: </label>
								<div class="col-md-8">
									<sf:input type="text" id="firstNname" path="firstName"
										placeholder="Teacher First Name" class="form-control" />
									<sf:errors path="firstName" cssClass="text-danger" element="em"></sf:errors>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-4" for="name">Enter
									Teacher Last Name: </label>
								<div class="col-md-8">
									<sf:input type="text" id="lastName" path="lastName"
										placeholder="Teacher Last Name" class="form-control" />
									<sf:errors path="lastName" cssClass="text-danger" element="em"></sf:errors>
								</div>
							</div>


							<div class="form-group">
								<label class="control-label col-md-4" for="unitPrice">Enter
									Teacher Age: </label>
								<div class="col-md-8">
									<sf:input type="number" id="Student Age" path="age"
										placeholder="Teacher Age" class="form-control" />
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-4" for="quantity">Enter
									Teacher Phone: </label>
								<div class="col-md-8">
									<sf:input type="text" id="phone" path="phone"
										placeholder="Phone Number" class="form-control" />
									<sf:errors path="phone" cssClass="text-danger" element="em"></sf:errors>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-4" for="name">Enter
									Teacher Address: </label>
								<div class="col-md-8">
									<sf:input type="text" id="address" path="address"
										placeholder="Teacher Address" class="form-control" />
									<sf:errors path="address" cssClass="text-danger" element="em"></sf:errors>
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-offset-4 col-md-8">
									<input type="submit" name="submit" id="submit" value="Submit"
										class="btn btn-primary" />
									<sf:hidden path="id" />
									<sf:hidden path="code" />
									<sf:hidden path="active" />
								</div>
							</div>

						</sf:form>

					</div>

				</div>
			</div>

		</c:if>

		<c:if test="${adminClickGroups  == true}">
			<div class=" col-md-8">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>${Title}</h4>
					</div>
					<div class="panel-body">
						<sf:form class="form-horizontal" modelAttribute="group"
							action="/EnglishSchool/manage/add/group" method="POST">

							<div class="form-group">
								<label class="control-label col-md-4" for="name">Enter
									Group Title: </label>
								<div class="col-md-8">
									<sf:input type="text" id="title" path="title"
										placeholder="Group Title" class="form-control" />
									<sf:errors path="title" cssClass="text-danger" element="em"></sf:errors>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-4" for="quantity">Select
									Group Teacher:</label>
								<div class="col-md-8">
									<sf:select class="form-control" id="teacherId"
										path="teacher_id" items="${teachers}" itemLabel="lastName"
										itemValue="id" />
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-4" for="quantity">Select
									Group Level:</label>
								<div class="col-md-8">
									<sf:select class="form-control" id="levelId" path="level_id"
										items="${levels}" itemLabel="title" itemValue="id" />
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-4" for="quantity">Enter
									Group Capasity: </label>
								<div class="col-md-8">
									<sf:input type="number" id="capasity" path="capasity"
										placeholder="Capasity" class="form-control" />
									<sf:errors path="capasity" cssClass="text-danger" element="em"></sf:errors>
								</div>
							</div>


							<div class="form-group">
								<div class="col-md-offset-4 col-md-8">
									<input type="submit" name="submit" id="submit" value="Submit"
										class="btn btn-primary" />
									<sf:hidden path="id" />
								</div>
							</div>

						</sf:form>

					</div>

				</div>
			</div>

		</c:if>


	</div>
</div>


<c:if test="${adminClickGroups  == true}">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h3>${Title}</h3>
				<hr />
			</div>

			<div class="col-lg-12">
				<div style="overflow: auto">
					<table id="adminProductsTable"
						class="table table-striped table-responsive">

						<thead class="thead-dark">
							<tr>
								<th>Id</th>
								<th>Title</th>
								<th>Level</th>
								<th>Teacher</th>
								<th>Capasity</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>Id</th>
								<th>Title</th>
								<th>Level</th>
								<th>Teacher</th>
								<th>Capasity</th>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
	</div>
</c:if>

<c:if test="${adminClickRequest  == true}">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h3>${Title}</h3>
				<hr />
			</div>

			<div class="col-lg-12">
				<div style="overflow: auto">
					<table id="adminProductsTable"
						class="table table-striped table-responsive">

						<thead class="thead-dark">
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>Email</th>
								<th>Phone</th>
								<th>Date</th>
								<th>Delete</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>Email</th>
								<th>Phone</th>
								<th>Date</th>
								<th>Delete</th>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
	</div>
</c:if>




<c:if
	test="${adminClickTeachers  == true or adminClickStudents == true or adminClickGroupID  == true }">

	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h3>${Title}</h3>
				<hr />
			</div>

			<div class="col-lg-12">
				<div style="overflow: auto">
					<table id="adminProductsTable"
						class="table table-striped table-responsive">

						<thead class="thead-dark">
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>LastName</th>
								<th>Age</th>
								<th>Phone</th>
								<th>Address</th>
								<th>Active</th>
								<th>Edit</th>
								<th>Show User</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>LastName</th>
								<th>Age</th>
								<th>Phone</th>
								<th>Address</th>
								<th>Active</th>
								<th>Edit</th>
								<th>Show User</th>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
	</div>
</c:if>


