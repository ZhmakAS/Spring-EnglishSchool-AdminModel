<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<h2>Profiles</h2>
<div class="container">
	<div class="row">
		
		<div class="col-md-7 ">

			<div class="panel panel-default">
				<div class="panel-heading">
					<c:if test="${isUser == true}">
					<h4>User Profile</h4>
					</c:if>
					<c:if test="${isTeacher == true}">
					<h4>Teacher Profile</h4>
					</c:if>
				</div>
				<div class="panel-body">

					<div class="box box-info">

						<div class="box-body">
							<div class="col-sm-6">
								<div align="center">
									<img alt="User Pic"
										src="${images}/${user.code}.jpg"
										id="profile-image1" class="img-circle img-responsive"> 

								</div>

								<br>

							</div>
							<c:if test="${isUser == true}">
								<div class="col-sm-6">
									<h4 style="color: #00b1b1;">${user.firstName} ${user.lastName}</h4>
									</span> <span><p>Student</p></span>
								</div>
								<div class="clearfix"></div>
								<hr style="margin: 5px 0 5px 0;">


								<div class="col-sm-5 col-xs-6 tital "><strong>First Name:</strong></div>
								<div class="col-sm-7 col-xs-6 ">${user.firstName}</div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>


								<div class="col-sm-5 col-xs-6 tital "><strong>Last Name:</strong></div>
								<div class="col-sm-7">${user.lastName}</div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>

								<div class="col-sm-5 col-xs-6 tital "><strong>Age:</strong></div>
								<div class="col-sm-7">${user.age}</div>

								<div class="clearfix"></div>
								<div class="bot-border"></div>

								<div class="col-sm-5 col-xs-6 tital "><strong>Phone:</strong></div>
								<div class="col-sm-7">${user.phone}</div>

								<div class="clearfix"></div>
								<div class="bot-border"></div>

								<div class="col-sm-5 col-xs-6 tital "><strong>Address:</strong></div>
								<div class="col-sm-7">${user.address}</div>

								<div class="clearfix"></div>
								<div class="bot-border"></div>

								<div class="col-sm-5 col-xs-6 tital "><strong>Level:</strong></div>
								<div class="col-sm-7">${level.title} (${level.short_title})</div>

								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								
								<div class="col-sm-5 col-xs-6 tital "><strong>Group:</strong></div>
								<div class="col-sm-7">${group.title}</div>

								<div class="clearfix"></div>
								<div class="bot-border"></div>

							</c:if>

							<c:if test="${isTeacher == true}">
								<div class="col-sm-6">
									<h4 style="color: #00b1b1;">${user.firstName} ${user.lastName}</h4>
									</span> <span><p>Teacher</p></span>
								</div>
								<div class="clearfix"></div>
								<hr style="margin: 5px 0 5px 0;">
								<div class="col-sm-5 col-xs-6 tital "><strong>First Name:</strong></div>
								<div class="col-sm-7 col-xs-6 ">${user.firstName}</div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>

								<div class="col-sm-5 col-xs-6 tital "><strong>Last Name:</strong></div>
								<div class="col-sm-7">${user.lastName}</div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>

								<div class="col-sm-5 col-xs-6 tital "><strong>Age:</strong></div>
								<div class="col-sm-7">${user.age}</div>

								<div class="clearfix"></div>
								<div class="bot-border"></div>

								<div class="col-sm-5 col-xs-6 tital "><strong>Phone:</strong></div>
								<div class="col-sm-7">${user.phone}</div>

								<div class="clearfix"></div>
								<div class="bot-border"></div>

								<div class="col-sm-5 col-xs-6 tital "><strong>Address:</strong></div>
								<div class="col-sm-7">${user.address}</div>

								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								<div class="col-sm-5 col-xs-6 tital "><strong>Group:</strong></div>
								<div class="col-sm-7">${group.title}</div>

								<div class="clearfix"></div>
								<div class="bot-border"></div>

							</c:if>

							<!-- /.box-body -->
						</div>
						<!-- /.box -->

					</div>
					<div class="panel-footer">
						<a data-original-title="Broadcast Message" data-toggle="tooltip"
							type="button" class="btn btn-sm btn-primary"><i
							class="glyphicon glyphicon-envelope"></i></a> <span
							class="pull-right"> <a href="edit.html"
							data-original-title="Edit this user" data-toggle="tooltip"
							type="button" class="btn btn-sm btn-warning"><i
								class="glyphicon glyphicon-edit"></i></a> <a
							data-original-title="Remove this user" data-toggle="tooltip"
							type="button" class="btn btn-sm btn-danger"><i
								class="glyphicon glyphicon-remove"></i></a>
						</span>
					</div>


				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-7"></div>
		</div>
	</div>
</div>

