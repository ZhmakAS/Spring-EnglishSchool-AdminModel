var $table = $('#adminProductsTable');

if ($table.length) {

	var jsonUrl = '';
	if (window.data == 'teachers') {
		jsonUrl = window.contextRoot + '/json/data/show/teachers';
	}else if(window.data == 'students'){
		jsonUrl = window.contextRoot + '/json/data/show/students';
	}
	else if(window.data == 'groups'){
		jsonUrl = window.contextRoot + '/json/data/show/groups';
	}
	else if(window.data == 'groupID'){
		jsonUrl = window.contextRoot + '/json/data/show/students/'+window.groupId+'/group';
	}
	else {
		jsonUrl = window.contextRoot + '/json/data/show/requests';
	}

	if(window.data == 'teachers' || window.data == 'students'|| window.data == 'groupID'){
	$table
			.DataTable({

				lengthMenu : [ [ 2, 5, 10, -1 ],
						[ '2 records', '5 records', '10 records', 'All' ] ],
				pageLength : 5,
				ajax : {
					url : jsonUrl,
					dataSrc : ''
				},
				columns : [

						{
							data : 'id',
							bSortable:false
						},
						{
							data : 'firstName'
						},
						{
							data : 'lastName'
						},
						{
							data : 'age'
							
						},
						{
							data : 'phone'
						
						},
						{
							data : 'address',
							bSortable:false
						},
						{
							data : 'active',
							mRender:function(data,type,row){
								var string = '';
									string += '<label class="switch">';
									if(data){
										string += '<input type="checkbox" checked="checked" value="'+row.id+'" />';
									}else{
										string += '<input type="checkbox"  value="'+row.id+'" />';
										
									}
									
									string += '<div class="slider round"></div> </label>';
								
									return string;
							}
						},
						{
							data : 'id',
							bSortable:false,
							mRender : function(data, type, row) {
							
								var string = '';
								if(window.data == 'students'){
									string +='<a href="'+window.contextRoot+'/manage/'+data+'/user"class="btn btn-primary ">';	
								}else if(window.data == 'teachers'){
									string +='<a href="'+window.contextRoot+'/manage/'+data+'/teacher"class="btn btn-primary ">';	
								}
								
								string += '<span class="badge">Edit</span></a>';
								return string;
								
							}
						},
						{
							data : 'id',
							bSortable:false,
							mRender : function(data, type, row) {
								var str = '';
								if(window.data == 'teachers'){
									str += '<a href="'+ window.contextRoot + '/manage/show/teacher/'+data+'"><span class="btn btn-success">Show</span></a>';
								}else if(window.data == 'students'){
									str += '<a href="'+ window.contextRoot + '/manage/show/student/'+data+'"><span class="btn btn-success">Show</span></a>';
								}
								
								return str;
							}
						}
				],
				
				
	initComplete : function(){
					
					
					var api = this.api();
					api.$('.switch input[type="checkbox"]').on('change',function(){
						
						var checkbox = $(this);
						var checked  = checkbox.prop('checked');
						var dMsg = (checked)? 'You want to activate the user?':'You want to deactivate the user?';
						var value = checkbox.prop('value');
						bootbox.confirm({
							size:'medium',
							titile:'Product Activation & Deactivation',
							message: dMsg,
							callback:function(confirmed){
								if(confirmed){
									console.log(value);
									var activationURL = ''
									if(window.data == 'teachers'){
										 activationURL = window.contextRoot +'/manage/teacher/'+value+'/activation';
									}else if(window.data == 'students'){
										 activationURL = window.contextRoot +'/manage/user/'+value+'/activation';
									}
									
									
									$.post(activationURL,function(data){
										bootbox.alert({
											size:'medium',
											title:'Information',
											message:data 
										});
									})
									
								}else{
									checkbox.prop('checked',!checked);
								}	
							}
						});
						
					});

				}

			});
	
	}else if(window.data == 'requests'){
		$table
		.DataTable({

			lengthMenu : [ [ 2, 5, 10, -1 ],
					[ '2 records', '5 records', '10 records', 'All' ] ],
			pageLength : 5,
			ajax : {
				url : jsonUrl,
				dataSrc : ''
			},
			columns : [

					{
						data : 'id'
					},
					{
						data : 'name'
					
					},
					{
						data : 'email'
					},
					{
						data : 'phone'
					},
					{
						data : 'date'
					},
					{
						data : 'id',
						mRender : function(data, type, row) {
							return '<a href="'+ window.contextRoot + '/manage/delete/request/'+data+'" class="btn btn-success">Delete</a>';
						}
					}
			]

		});
		
		
	}else{
		$table
		.DataTable({

			lengthMenu : [ [ 2, 5, 10, -1 ],
					[ '2 records', '5 records', '10 records', 'All' ] ],
			pageLength : 5,
			ajax : {
				url : jsonUrl,
				dataSrc : ''
			},
			columns : [

					{
						data : 'id'
					},
					{
						data : 'title',
						mRender : function(data, type, row) {
							return '<a href="'+ window.contextRoot + '/manage/show/students/'+ row.id+'/group">'+data+'</a>';
						}
					},
					{
						data : 'level_id'
					},
					{
						data : 'teacher_id'
					},
					{
						data : 'capasity'
					}
			]

		});

	}
}