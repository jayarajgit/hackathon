<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if IE 8]>         <html class="ie8"> <![endif]-->
<!--[if IE 9]>         <html class="ie9 gt-ie8"> <![endif]-->
<!--[if gt IE 9]><!--> <html class="gt-ie8 gt-ie9 not-ie"> <!--<![endif]-->
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>vzPixel Documents</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">

	<!-- Open Sans font from Google CDN -->
	<link href="assets/css/fonts.css" rel="stylesheet" type="text/css">

	<!-- Pixel Admin's stylesheets -->
	<link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="assets/css/pixel-admin.min.css" rel="stylesheet" type="text/css">
	<link href="assets/css/widgets.min.css" rel="stylesheet" type="text/css">
	<link href="assets/css/rtl.min.css" rel="stylesheet" type="text/css">
	<link href="assets/css/themes.min.css" rel="stylesheet" type="text/css">
	<link href="assets/css/custom.css" rel="stylesheet" type="text/css">

	<!--[if lt IE 9]>
		<script src="assets/javascripts/ie.min.js"></script>
	<![endif]-->
</head>


<!-- 1. $BODY ======================================================================================
	
	Body

	Classes:
	* 'theme-{THEME NAME}'
	* 'right-to-left'      - Sets text direction to right-to-left
	* 'main-menu-right'    - Places the main menu on the right side
	* 'no-main-menu'       - Hides the main menu
	* 'main-navbar-fixed'  - Fixes the main navigation
	* 'main-menu-fixed'    - Fixes the main menu
	* 'main-menu-animated' - Animate main menu
-->
<body class="theme-default main-menu-animated">

<script type="text/javascript">var init = [];</script>
<!-- Demo script --> <script src="assets/demo/demo.js"></script> <!-- / Demo script -->

<div id="main-wrapper">


<!-- 2. $MAIN_NAVIGATION ===========================================================================

	Main navigation
-->
	<div id="main-navbar" class="navbar navbar-inverse" role="navigation">
		<!-- Main menu toggle -->
		<button type="button" id="main-menu-toggle"><i class="navbar-icon fa fa-bars icon"></i><span class="hide-menu-text">HIDE MENU</span></button>
		
		<div class="navbar-inner">
			<!-- Main navbar header -->
			<div class="navbar-header">

				<!-- Logo -->
				<a href="index.html" class="navbar-brand">
					<div><img alt="Pixel Admin" src="assets/images/pixel-admin/main-navbar-logo.png"></div>
					PixelAdmin
				</a>

				<!-- Main navbar toggle -->
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#main-navbar-collapse"><i class="navbar-icon fa fa-bars"></i></button>

			</div> <!-- / .navbar-header -->

			<div id="main-navbar-collapse" class="collapse navbar-collapse main-navbar-collapse">
				<div>
					<ul class="nav navbar-nav">
						<li>
							<a href="#">Home</a>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown</a>
							<ul class="dropdown-menu">
								<li><a href="#">First item</a></li>
								<li><a href="#">Second item</a></li>
								<li class="divider"></li>
								<li><a href="#">Third item</a></li>
							</ul>
						</li>
					</ul> <!-- / .navbar-nav -->

					<div class="right clearfix">
						<ul class="nav navbar-nav pull-right right-navbar-nav">

<!-- 3. $NAVBAR_ICON_BUTTONS =======================================================================

							Navbar Icon Buttons

							NOTE: .nav-icon-btn triggers a dropdown menu on desktop screens only. On small screens .nav-icon-btn acts like a hyperlink.

							Classes:
							* 'nav-icon-btn-info'
							* 'nav-icon-btn-success'
							* 'nav-icon-btn-warning'
							* 'nav-icon-btn-danger' 
-->
							<li class="nav-icon-btn nav-icon-btn-danger dropdown">
								<a href="#notifications" class="dropdown-toggle" data-toggle="dropdown">
									<span class="label">5</span>
									<i class="nav-icon fa fa-bullhorn"></i>
									<span class="small-screen-text">Notifications</span>
								</a>

								<!-- NOTIFICATIONS -->
								
								<!-- Javascript -->
								<script>
									init.push(function () {
										$('#main-navbar-notifications').slimScroll({ height: 250 });
									});
								</script>
								<!-- / Javascript -->

								<div class="dropdown-menu widget-notifications no-padding" style="width: 300px">
									<div class="notifications-list" id="main-navbar-notifications">

										<div class="notification">
											<div class="notification-title text-danger">SYSTEM</div>
											<div class="notification-description"><strong>Error 500</strong>: Syntax error in index.php at line <strong>461</strong>.</div>
											<div class="notification-ago">12h ago</div>
											<div class="notification-icon fa fa-hdd-o bg-danger"></div>
										</div> <!-- / .notification -->

										<div class="notification">
											<div class="notification-title text-info">STORE</div>
											<div class="notification-description">You have <strong>9</strong> new orders.</div>
											<div class="notification-ago">12h ago</div>
											<div class="notification-icon fa fa-truck bg-info"></div>
										</div> <!-- / .notification -->

										<div class="notification">
											<div class="notification-title text-default">CRON DAEMON</div>
											<div class="notification-description">Job <strong>"Clean DB"</strong> has been completed.</div>
											<div class="notification-ago">12h ago</div>
											<div class="notification-icon fa fa-clock-o bg-default"></div>
										</div> <!-- / .notification -->

										<div class="notification">
											<div class="notification-title text-success">SYSTEM</div>
											<div class="notification-description">Server <strong>up</strong>.</div>
											<div class="notification-ago">12h ago</div>
											<div class="notification-icon fa fa-hdd-o bg-success"></div>
										</div> <!-- / .notification -->

										<div class="notification">
											<div class="notification-title text-warning">SYSTEM</div>
											<div class="notification-description"><strong>Warning</strong>: Processor load <strong>92%</strong>.</div>
											<div class="notification-ago">12h ago</div>
											<div class="notification-icon fa fa-hdd-o bg-warning"></div>
										</div> <!-- / .notification -->

									</div> <!-- / .notifications-list -->
									<a href="#" class="notifications-link">MORE NOTIFICATIONS</a>
								</div> <!-- / .dropdown-menu -->
							</li>
							<li class="nav-icon-btn nav-icon-btn-success dropdown">
								<a href="#messages" class="dropdown-toggle" data-toggle="dropdown">
									<span class="label">10</span>
									<i class="nav-icon fa fa-envelope"></i>
									<span class="small-screen-text">Income messages</span>
								</a>

								<!-- MESSAGES -->
								
								<!-- Javascript -->
								<script>
									init.push(function () {
										$('#main-navbar-messages').slimScroll({ height: 250 });
									});
								</script>
								<!-- / Javascript -->

								<div class="dropdown-menu widget-messages-alt no-padding" style="width: 300px;">
									<div class="messages-list" id="main-navbar-messages">

										<div class="message">
											<img src="assets/demo/avatars/2.jpg" alt="" class="message-avatar">
											<a href="#" class="message-subject">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</a>
											<div class="message-description">
												from <a href="#">Robert Jang</a>
												&nbsp;&nbsp;·&nbsp;&nbsp;
												2h ago
											</div>
										</div> <!-- / .message -->

										<div class="message">
											<img src="assets/demo/avatars/3.jpg" alt="" class="message-avatar">
											<a href="#" class="message-subject">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</a>
											<div class="message-description">
												from <a href="#">Michelle Bortz</a>
												&nbsp;&nbsp;·&nbsp;&nbsp;
												2h ago
											</div>
										</div> <!-- / .message -->

										<div class="message">
											<img src="assets/demo/avatars/4.jpg" alt="" class="message-avatar">
											<a href="#" class="message-subject">Lorem ipsum dolor sit amet.</a>
											<div class="message-description">
												from <a href="#">Timothy Owens</a>
												&nbsp;&nbsp;·&nbsp;&nbsp;
												2h ago
											</div>
										</div> <!-- / .message -->

										<div class="message">
											<img src="assets/demo/avatars/5.jpg" alt="" class="message-avatar">
											<a href="#" class="message-subject">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</a>
											<div class="message-description">
												from <a href="#">Denise Steiner</a>
												&nbsp;&nbsp;·&nbsp;&nbsp;
												2h ago
											</div>
										</div> <!-- / .message -->

										<div class="message">
											<img src="assets/demo/avatars/2.jpg" alt="" class="message-avatar">
											<a href="#" class="message-subject">Lorem ipsum dolor sit amet.</a>
											<div class="message-description">
												from <a href="#">Robert Jang</a>
												&nbsp;&nbsp;·&nbsp;&nbsp;
												2h ago
											</div>
										</div> <!-- / .message -->

										<div class="message">
											<img src="assets/demo/avatars/2.jpg" alt="" class="message-avatar">
											<a href="#" class="message-subject">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</a>
											<div class="message-description">
												from <a href="#">Robert Jang</a>
												&nbsp;&nbsp;·&nbsp;&nbsp;
												2h ago
											</div>
										</div> <!-- / .message -->

										<div class="message">
											<img src="assets/demo/avatars/3.jpg" alt="" class="message-avatar">
											<a href="#" class="message-subject">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</a>
											<div class="message-description">
												from <a href="#">Michelle Bortz</a>
												&nbsp;&nbsp;·&nbsp;&nbsp;
												2h ago
											</div>
										</div> <!-- / .message -->

										<div class="message">
											<img src="assets/demo/avatars/4.jpg" alt="" class="message-avatar">
											<a href="#" class="message-subject">Lorem ipsum dolor sit amet.</a>
											<div class="message-description">
												from <a href="#">Timothy Owens</a>
												&nbsp;&nbsp;·&nbsp;&nbsp;
												2h ago
											</div>
										</div> <!-- / .message -->

										<div class="message">
											<img src="assets/demo/avatars/5.jpg" alt="" class="message-avatar">
											<a href="#" class="message-subject">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</a>
											<div class="message-description">
												from <a href="#">Denise Steiner</a>
												&nbsp;&nbsp;·&nbsp;&nbsp;
												2h ago
											</div>
										</div> <!-- / .message -->

										<div class="message">
											<img src="assets/demo/avatars/2.jpg" alt="" class="message-avatar">
											<a href="#" class="message-subject">Lorem ipsum dolor sit amet.</a>
											<div class="message-description">
												from <a href="#">Robert Jang</a>
												&nbsp;&nbsp;·&nbsp;&nbsp;
												2h ago
											</div>
										</div> <!-- / .message -->

									</div> <!-- / .messages-list -->
									<a href="#" class="messages-link">MORE MESSAGES</a>
								</div> <!-- / .dropdown-menu -->
							</li>
<!-- /3. $END_NAVBAR_ICON_BUTTONS -->

							<li>
								<form class="navbar-form pull-left">
									<input type="text" class="form-control" placeholder="Search">
								</form>
							</li>

							<li class="dropdown">
								<a href="#" class="dropdown-toggle user-menu" data-toggle="dropdown">
									<img src="assets/demo/avatars/1.jpg" alt="">
									<span>John Doe</span>
								</a>
								<ul class="dropdown-menu">
									<li><a href="#"><span class="label label-warning pull-right">New</span>Profile</a></li>
									<li><a href="#"><span class="badge badge-primary pull-right">New</span>Account</a></li>
									<li><a href="#"><i class="dropdown-icon fa fa-cog"></i>&nbsp;&nbsp;Settings</a></li>
									<li class="divider"></li>
									<li><a href="pages-signin.html"><i class="dropdown-icon fa fa-power-off"></i>&nbsp;&nbsp;Log Out</a></li>
								</ul>
							</li>
						</ul> <!-- / .navbar-nav -->
					</div> <!-- / .right -->
				</div>
			</div> <!-- / #main-navbar-collapse -->
		</div> <!-- / .navbar-inner -->
	</div> <!-- / #main-navbar -->
<!-- /2. $END_MAIN_NAVIGATION -->


<!-- 4. $MAIN_MENU =================================================================================

		Main menu
		
		Notes:
		* to make the menu item active, add a class 'active' to the <li>
		  example: <li class="active">...</li>
		* multilevel submenu example:
			<li class="mm-dropdown">
			  <a href="#"><span class="mm-text">Submenu item text 1</span></a>
			  <ul>
				<li>...</li>
				<li class="mm-dropdown">
				  <a href="#"><span class="mm-text">Submenu item text 2</span></a>
				  <ul>
					<li>...</li>
					...
				  </ul>
				</li>
				...
			  </ul>
			</li>
-->
	<div id="main-menu" role="navigation">
		<div id="main-menu-inner">
			<div class="menu-content top" id="menu-content-demo">
				<!-- Menu custom content demo
					 CSS:        styles/pixel-admin-less/demo.less or styles/pixel-admin-scss/_demo.scss
					 Javascript: html/assets/demo/demo.js
				 -->
				<div>
					<div class="text-bg"><span class="text-slim">Welcome,</span> <span class="text-semibold">John</span></div>

					<img src="assets/demo/avatars/1.jpg" alt="" class="">
					<div class="btn-group">
						<a href="#" class="btn btn-xs btn-primary btn-outline dark"><i class="fa fa-envelope"></i></a>
						<a href="#" class="btn btn-xs btn-primary btn-outline dark"><i class="fa fa-user"></i></a>
						<a href="#" class="btn btn-xs btn-primary btn-outline dark"><i class="fa fa-cog"></i></a>
						<a href="#" class="btn btn-xs btn-danger btn-outline dark"><i class="fa fa-power-off"></i></a>
					</div>
					<a href="#" class="close">&times;</a>
				</div>
			</div>
			<ul class="navigation">
				<li>
					<a href="index.html"><i class="menu-icon fa fa-dashboard"></i><span class="mm-text">Documents</span></a>
				</li>
				
				
				
				
				
				
				
				<li class="mm-dropdown">
					<a href="#"><i class="menu-icon fa fa-files-o"></i><span class="mm-text">Folder1</span><span class="label label-success">16</span></a>
					<ul>
						<li>
							<a tabindex="-1" href="pages-search.html"><span class="mm-text">Sub Folder1</span></a>
						</li>
						<li>
							<a tabindex="-1" href="pages-pricing.html"><span class="mm-text">Sub Folder2</span></a>
						</li>
						<li>
							<a tabindex="-1" href="pages-faq.html"><span class="mm-text">Sub Folder3</span></a>
						</li>
						<li class="mm-dropdown">
							<a href="#"><i class="menu-icon fa fa-envelope"></i><span class="mm-text">Sub Folder4 With Sub</span></a>
							<ul>
								<li>
									<a tabindex="-1" href="pages-inbox.html"><span class="mm-text">Folder4 Sub1</span></a>
								</li>
								<li>
									<a tabindex="-1" href="pages-show-email.html"><span class="mm-text">Folder4 Sub2</span></a>
								</li>
								<li>
									<a tabindex="-1" href="pages-new-email.html"><span class="mm-text">Folder4 Sub3</span></a>
								</li>
							</ul>
						</li>
						<li>
							<a tabindex="-1" href="pages-blank.html"><span class="mm-text">Blank page</span></a>
						</li>
					</ul>
				</li>
				
				
				<li class="mm-dropdown">
					<!--  
						menu-icon fa fa-sitemap
						menu-icon fa fa-folder-open 
					-->
					<a href="#"><i class="menu-icon fa fa-folder-o"></i><span class="mm-text">Folder2</span><span class="badge badge-primary">6</span></a>
					<ul>
						<li>
							<a tabindex="-1" href="#"><span class="mm-text">Folder level 1.1</span><span class="badge badge-danger">12</span><span class="label label-info">21</span></a>
						</li>
						<li>
							<a tabindex="-1" href="#"><span class="mm-text">Folder Level 1.2</span></a>
						</li>
						<li class="mm-dropdown">
							<a tabindex="-1" href="#"><span class="mm-text">Folder Level 1.3</span><span class="label label-warning">5</span></a>
							<ul>
								<li>
									<a tabindex="-1" href="#"><span class="mm-text">Folder Level 2.1</span></a>
								</li>
								<li class="mm-dropdown">
									<a tabindex="-1" href="#"><span class="mm-text">Folder Level 2.2</span></a>
									<ul>
										<li class="mm-dropdown">
											<a tabindex="-1" href="#"><span class="mm-text">Folder Level 3.1</span></a>
											<ul>
												<li>
													<a tabindex="-1" href="#"><span class="mm-text">Folder Level 4.1</span></a>
												</li>
											</ul>
										</li>
										<li>
											<a tabindex="-1" href="#"><span class="mm-text">Folder Level 3.2</span></a>
										</li>
									</ul>
								</li>
								<li>
									<a tabindex="-1" href="#"><span class="mm-text">Folder Level 2.2</span></a>
								</li>
							</ul>
						</li>
					</ul>
				</li>
			</ul> <!-- / .navigation -->
			<div class="menu-content">
				<a href="pages-invoice.html" class="btn btn-primary btn-block btn-outline dark">Create Invoice</a>
			</div>
		</div> <!-- / #main-menu-inner -->
	</div> <!-- / #main-menu -->
<!-- /4. $MAIN_MENU -->

	<div id="content-wrapper">
		<ul class="breadcrumb breadcrumb-page">
			<div class="breadcrumb-label text-light-gray">You are here: </div>
			<li><a href="#">Home</a></li>
			<li class="active"><a href="#">Documents</a></li>
		</ul>
		<div class="page-header">
			
			<div class="row">
				<!-- Page header, center on small screens -->
				<h1 class="col-xs-12 col-sm-4 text-center text-left-sm"><i class="fa page-header-icon menu-icon fa fa-files-o"></i>&nbsp;&nbsp;Documents </h1>

				<div class="col-xs-12 col-sm-8">
					<div class="row">
						<hr class="visible-xs no-grid-gutter-h">

						<!-- Search field -->
						<form action="" class="pull-right col-xs-12 col-sm-6">
							<div class="input-group no-margin">
								<span class="input-group-addon" style="border:none;background: #fff;background: rgba(0,0,0,.05);"><i class="fa fa-search"></i></span>
								<input type="text" placeholder="Search documents..." class="form-control no-padding-hr" style="border:none;background: #fff;background: rgba(0,0,0,.05);">
							</div>
						</form>
						
												<!-- Margin -->
						<div class="visible-xs clearfix form-group-margin"></div>
						
						
						<!-- "Create project" button, width=auto on desktops -->
						<div class="pull-right col-xs-12 col-sm-auto">
							<a href="#" class="thumbnail btn btn-primary btn-labeled" style="width: 100%;"><span class="btn-label icon fa fa-plus"></span>Upload Document</a>
						</div>
												<!-- Margin -->
						<div class="visible-xs clearfix form-group-margin"></div>
						
						
						
						
							<!-- Start Modal Box -->
						<div id="myModal" class="modal fade" tabindex="-1" role="dialog">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">×</button>
										<h3 class="modal-title">Upload</h3>
									</div>
									<div class="modal-body"></div>
									<div class="modal-footer">
									<button class="btn btn-default">Submit</button>
										<button class="btn btn-default" data-dismiss="modal">Close</button>
									</div>

										<div id="upload-form" class="form-group" style="display: none">
											<input type="file" name="img[]" class="file">
											<div class="input-group col-xs-12">
												<span class="input-group-addon"><i
													class="glyphicon glyphicon-picture"></i></span> <input type="text"
													class="form-control input-lg" disabled
													placeholder="Upload Image"> <span
													class="input-group-btn">
													<button id="upload-btn"
														class="browse btn btn-primary input-lg" type="button">
														<i class="glyphicon glyphicon-search"></i> Browse
													</button>
												</span>
											</div>
											<div class="input-group col-xs-12">
												<label for="comment">Comment:</label>
												<textarea class="form-control" rows="5" id="comment"></textarea>
											</div>

										</div>
									</div>
							</div>
						</div>
							
							<!-- End Modal Box -->
						
						
												<!-- "Create project" button, width=auto on desktops -->
						<div class="pull-right col-xs-12 col-sm-auto">
							<a href="#" class="btn btn-primary btn-labeled" style="width: 100%;"><span class="btn-label icon fa fa-plus"></span>Create</a>
						</div>
						
					</div>
				</div>
			</div>
		</div> <!-- / .page-header -->

		
		
		
		
		


		<!-- Primary table -->
		<div class="table-primary">
			<!--  
			<div class="table-header">
				<div class="table-caption">
					Primary Table
				</div>
			</div>
			 -->
			
			<table id="tblDocs" class="table table-bordered">
				
			</table>
			
			<!-- 
				<div class="table-footer">
					Footer
				</div>
			-->
		</div>
		<!-- / Primary table -->
		
		<div id="divContent">
			sdgjasg a;sjgfd9a4jas asdflgkapsofgi ,masfg npoasfgi34masgfd asfg Kumar sdgjasg a;sjgfd9a4jas asdflgkapsofgi ,masfg npoasfgi34masgfd asfg Kumar
			sdgjasg a;sjgfd9a4jas asdflgkapsofgi ,masfg npoasfgi34masgfd asfg Kumar sdgjasg a;sjgfd9a4jas asdflgkapsofgi ,masfg npoasfgi34masgfd asfg Kumar
			sdgjasg a;sjgfd9a4jas asdflgkapsofgi ,masfg npoasfgi34masgfd asfg Kumar sdgjasg a;sjgfd9a4jas asdflgkapsofgi ,masfg npoasfgi34masgfd asfg Kumar
			sdgjasg a;sjgfd9a4jas asdflgkapsofgi ,masfg npoasfgi34masgfd asfg Kumar sdgjasg a;sjgfd9a4jas asdflgkapsofgi ,masfg npoasfgi34masgfd asfg Kumar
			
		</div>

		</div>
	</div> <!-- / #content-wrapper -->
	<div id="main-menu-bg"></div>
</div> <!-- / #main-wrapper -->

<!-- Get jQuery from Google CDN -->
<!--[if !IE]> -->
	<script type="text/javascript"> window.jQuery || document.write('<script src="assets/javascripts/jquery.min.js">'+"<"+"/script>"); </script>
<!-- <![endif]-->
<!--[if lte IE 9]>
	<script type="text/javascript"> window.jQuery || document.write('<script src="assets/javascripts/jquery1.8.3.min.js">'+"<"+"/script>"); </script>
<![endif]-->


<!-- Pixel Admin's javascripts -->

<script src="assets/javascripts/jquery.dataTables.min.js"></script>
<script src="assets/javascripts/bootstrap.min.js"></script>
<script src="assets/javascripts/bootstrap-table.js"></script>
<script src="assets/javascripts/pixel-admin.min.js"></script>
<script src="assets/javascripts/custom.js"></script>

<script src="assets/javascripts/hilitor.js"></script>

<script type="text/javascript">
	init.push(function () {
		// Javascript code here
	});
	window.PixelAdmin.start(init);
	
	function getDocs(){
		/*
		$.ajax({
			url : "getDocs.jsp",
			type:"get",
			dataType : "json",
			success : function(result){
				alert(result);
			},
			error:function(e){
				
			}
		});
		*/
		
		$('#tblDocs').bootstrapTable({
		    url: 'getDocs.jsp?d='+new Date().getTime(),
		    pagination : true,
		    sortName : ["name","modified_by"],
		    columns: [
				{
				      "field": "id",
				      "title": "sno"
				   },
				   {
				      "field": "name",
				      "title": "Name"
				   },
				   {
				      "field": "last_modified",
				      "title": "Modified Date"
				   },
				   {
				      "field": "last_modified_by",
				      "title": "Modified By"
				   },
				   {
				      "field": "created_on",
				      "title": "Created By"
				   },
				   {
				      "field": "version",
				      "title": "Version"
				   }
				]
		});
		
	}
	
	  
	$(document).ready(function(){
		getDocs();
		
	   
	    
	    var myHilitor = new Hilitor("divContent");
		myHilitor.apply("Kumar");
		  
	});
	
</script>

</body>
</html>