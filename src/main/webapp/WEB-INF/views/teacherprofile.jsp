<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->



<hr>
<div class="container">
	<div class="row">
		<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="/EnglishSchool/home">Home</a></li>
		<li class="breadcrumb-item active">Personal-Profile</li>
	    </ol>
		<div class="col-sm-10">
			<h1>${teacher.firstName} 	${teacher.lastName}</h1>
		</div>
		<div class="col-sm-2">
			<a href="/EnglishSchool/perform-logout" class="pull-right"><img title="profile image"
				class="img-circle img-responsive"
				src="http://www.gravatar.com/avatar/28fd20ccec6865e2d5f0e1f4446eb7bf?s=100"></a>
		</div>
	</div>

	<div class="col-md-3">
		<ul class="nav nav-pills nav-stacked admin-menu">
			<li class="active"><a href="" data-target-id="profile"><i
					class="glyphicon glyphicon-user"></i> HomeTask</a></li>
			<li><a href="" data-target-id="change-password"><i
					class="glyphicon glyphicon-lock"></i> Change Password</a></li>
			<li><a href="" data-target-id="settings"><i
					class="glyphicon glyphicon-cog"></i>Info</a></li>
			<li><a href="" data-target-id="logout"><i
					class="glyphicon glyphicon-log-out"></i> Logout</a></li>
		</ul>
	</div>
	<div class="col-md-9  admin-content" id="profile">

		<ul class="nav nav-tabs panel panel-info" id="myTab">
			<li class="active"><a href="#home" data-toggle="tab">Home</a></li>
			<li><a href="#messages" data-toggle="tab">Messages</a></li>
			<li><a href="#settings" data-toggle="tab">Settings</a></li>
		</ul>

		<div class="tab-content">
			<div class="tab-pane active" id="home">
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>#</th>
								<th>HomeTask</th>
								<th>Topic</th>
								<th>Decription</th>
								<th>Date</th>
							</tr>
						</thead>
						<tbody id="items">
							<tr>
								<td>1</td>
								<td>Section 3:Student book. page 134 ex 2,4,7</td>
								<td>Gerund</td>
								<td>Simple Gerund task</td>
								<td>12.05.2018</td>

							</tr>
							<tr>
								<td>2</td>
								<td>Section 2:Student book. page 134 ex 2,3,4</td>
								<td>Reported Spech</td>
								<td>Simple Reported Speach task</td>
								<td>12.05.2018</td>

							</tr>
							<tr>
								<td>3</td>
								<td>Section 4:Student book. page 18 ex 2,5,7</td>
								<td>Conditionals</td>
								<td>Simple Conditional task</td>
								<td>21.06.2018</td>

							</tr>
						</tbody>
					</table>
					<hr>
					<div class="row">
						<div class="col-md-4 col-md-offset-4 text-center">
							<ul class="pagination" id="myPager"></ul>
						</div>
					</div>
				</div>
				<!--/table-resp-->

				<hr>
			</div>
			<!--/tab-content-->
		</div>
	</div>

	<div class="col-md-9  admin-content" id="settings">
		<div class="panel panel-info" style="margin: 1em;">
			<div class="panel-heading">
				<h3 class="panel-title">Joined</h3>
			</div>
			<div class="panel-body">
				<div class="label label-success">2.13.2014</div>
			</div>
		</div>
		<div class="panel panel-info" style="margin: 1em;">
			<div class="panel-heading">
				<h3 class="panel-title">Last seen</h3>
			</div>
			<div class="panel-body">
				<div class="badge">Yesterday</li></div>
			</div>
		</div>
		<div class="panel panel-info" style="margin: 1em;">
			<div class="panel-heading">
				<h3 class="panel-title">Real name</h3>
			</div>
			<div class="panel-body">
				<div class="label label-success">${user.firstName} ${user.lastName}</div>
			</div>
		</div>
	</div>





	<div class="col-md-9  admin-content" id="change-password">
		<form action="/password" method="post">


			<div class="panel panel-info" style="margin: 1em;">
				<div class="panel-heading">
					<h3 class="panel-title">
						<label for="new_password" class="control-label panel-title">New
							Password</label>
					</h3>
				</div>
				<div class="panel-body">
					<div class="form-group">
						<div class="col-sm-10">
							<input type="password" class="form-control" name="password"
								id="new_password">
						</div>
					</div>

				</div>
			</div>


			<div class="panel panel-info" style="margin: 1em;">
				<div class="panel-heading">
					<h3 class="panel-title">
						<label for="confirm_password" class="control-label panel-title">Confirm
							password</label>
					</h3>
				</div>
				<div class="panel-body">
					<div class="form-group">
						<div class="col-sm-10">
							<input type="password" class="form-control"
								name="password_confirmation" id="confirm_password">
						</div>
					</div>
				</div>
			</div>


			<div class="panel panel-info border" style="margin: 1em;">
				<div class="panel-body">
					<div class="form-group">
						<div class="pull-left">
							<input type="submit" class="form-control btn btn-primary"
								name="submit" id="submit">
						</div>
					</div>
				</div>
			</div>

		</form>
	</div>


	<div class="col-md-9  admin-content" id="logout">
		<div class="panel panel-info" style="margin: 1em;">
			<div class="panel-heading">
				<h3 class="panel-title">Confirm Logout</h3>
			</div>
			<div class="panel-body">
				Do you really want to logout ?   <a href="#"
					class="label label-danger"
					onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
					<span>   Yes   </span>
				</a>     <a href="/account" class="label label-success"> <span>  No   </span></a>
			</div>
			<form id="logout-form" action="#" method="POST"
				style="display: none;"></form>
		</div>




		<script>
			$(document).ready(function() {
				var navItems = $('.admin-menu li > a');
				var navListItems = $('.admin-menu li');
				var allWells = $('.admin-content');
				var allWellsExceptFirst = $('.admin-content:not(:first)');
				allWellsExceptFirst.hide();
				navItems.click(function(e) {
					e.preventDefault();
					navListItems.removeClass('active');
					$(this).closest('li').addClass('active');
					allWells.hide();
					var target = $(this).attr('data-target-id');
					$('#' + target).show();
				});
			});
		</script>

	</div>
	<!--/col-3-->


	<div class="col-md-9  admin-content" id="change-password">
		<form action="/password" method="post">


			<div class="panel panel-info" style="margin: 1em;">
				<div class="panel-heading">
					<h3 class="panel-title">
						<label for="new_password" class="control-label panel-title">New
							Password</label>
					</h3>
				</div>
				<div class="panel-body">
					<div class="form-group">
						<div class="col-sm-10">
							<input type="password" class="form-control" name="password"
								id="new_password">
						</div>
					</div>

				</div>
			</div>


			<div class="panel panel-info" style="margin: 1em;">
				<div class="panel-heading">
					<h3 class="panel-title">
						<label for="confirm_password" class="control-label panel-title">Confirm
							password</label>
					</h3>
				</div>
				<div class="panel-body">
					<div class="form-group">
						<div class="col-sm-10">
							<input type="password" class="form-control"
								name="password_confirmation" id="confirm_password">
						</div>
					</div>
				</div>
			</div>


			<div class="panel panel-info border" style="margin: 1em;">
				<div class="panel-body">
					<div class="form-group">
						<div class="pull-left">
							<input type="submit" class="form-control btn btn-primary"
								name="submit" id="submit">
						</div>
					</div>
				</div>
			</div>

		</form>
	</div>

</div>