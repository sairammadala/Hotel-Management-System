<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>Google Nexus Website Menu</title>
		<meta name="description" content="A sidebar menu as seen on the Google Nexus 7 website" />
		<meta name="keywords" content="google nexus 7 menu, css transitions, sidebar, side menu, slide out menu" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<script src="js/modernizr.custom.js"></script>
		<style>
			body{
				background-image: url("bgimage.webp");
				background-size: cover;
				background-repeat: no-repeat;
				backface-visibility: visible;
			}
		</style>
	</head>
	<body>
		<%
		response.setHeader("cache-control", "no-cache, no-store, must-revalidate");
		String usr =  (String)session.getAttribute("usr");
		String pwd = (String)session.getAttribute("pwd");
		if(session.getAttribute("usr") == null)
			response.sendRedirect("staff.html");
		%>
        <script>
            function assign(){
                window.location = "pending_customers.jsp" ;
            }
            function check_out(){
                window.location = "check_out.jsp" ;
            }
            function customer_db(){
                window.location="view_customer_db.jsp";
            }
            function customer_details(){
                window.location = "customer_details.jsp";
            }
            function unassigned_rooms(){
                window.location = "unassigned_rooms.jsp"; 
            }
            function room_details(){
                window.location = "room_details.jsp";
            }
        </script>
		<div class="container">
			<ul id="gn-menu" class="gn-menu-main">
				<li class="gn-trigger">
					<a class="gn-icon gn-icon-menu"><span>Menu</span></a>
					<nav class="gn-menu-wrapper">
						<div class="gn-scroller">
							<ul class="gn-menu">
								<li>
									<a class="gn-icon gn-icon-earth" onclick="assign()">Assign Rooms</a>
								</li>
								<li><a class="gn-icon gn-icon-illustrator" onclick="check_out()">Update checkout date</a></li>
								<li><a class="gn-icon gn-icon-article" onclick="customer_db()">view customer database</a></li>

								<li>
									<a class="gn-icon gn-icon-article" onclick="customer_details()">view a Customer details</a>
								</li>
								<li><a class="gn-icon gn-icon-archive" onclick="unassigned_rooms()">View unassigned roms</a></li>
								<li><a class="gn-icon gn-icon-help" onclick="room_details()">Room details</a></li>

								<li>
									<a class="gn-icon gn-icon-cog" href="staff.html">log out</a>
								</li>
							</ul>
						</div><!-- /gn-scroller -->
					</nav>
				</li>
				<li><a class="codrops-icon codrops-icon-prev" href="staff_options.jsp"><span>Home</span></a></li>			</ul>
			<header>
				<h1 style="margin-left: 	25%;">Hotel newbie<span style="color: yellow;">A whole different world!</span></h1>	
			</header> 
		</div><!-- /container -->
		<script src="js/classie.js"></script>
		<script src="js/gnmenu.js"></script>
		<script>
			new gnMenu( document.getElementById( 'gn-menu' ) );
		</script>	
	</body>
</html>