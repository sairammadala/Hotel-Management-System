<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<style>
			.centered1{
				position:absolute;
				top: 30%;
				left: 50%;
				transform: translate(-50%,-50%);
			}
			.centered2{
				position:absolute;
				top: 37%;
				left: 50%;
				transform: translate(-50%,-50%);
			}
			#stay{
				text-align: center;
				color: bisque;
				font-size: 70px;
				font-family: 'Times New Roman', Times, serif;
				font-style: normal;
				font-weight: 500;
			}
			#feel{
				text-align: center;
				color:gold;
				font-size:20px;
				font-family: Arial, Helvetica, sans-serif;
				font-style: normal;
				font-weight: 300;
			}
		</style>
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
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<script src="js/modernizr.custom.js"></script>
		<style>
			
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
			function logout(){
				window.location.replace("logout.jsp");
			}
        </script>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			
			<!-- Indicators -->
			<ol class="carousel-indicators">
				
			  <li data-target="#myCarousel" data-slide-to="0" ></li>
			  <li data-target="#myCarousel" data-slide-to="1" ></li>
			  <li data-target="#myCarousel" data-slide-to="2"></li>
			  <li data-target="#myCarousel" data-slide-to="3" class="active"></li>
			  
			
			</ol>
		  
			<!-- Wrapper for slides -->
			<div class="carousel-inner" style="height:100vh;">
			  <div class="item">
				<div class="centered1" style="position: absolute;"><h1 id="stay">Hotel Newbie </h1>	</div>
				<div class="centered2" style="position: absolute;"><h4 id="feel">A whole different world!</h4></div>
				<img src="bgimage.webp">
			  </div>
		  
			  <div class="item">
				<div class="centered1" style="position: absolute;"><h1 id="stay">Hotel Newbie </h1>	</div>
				<div class="centered2" style="position: absolute;"><h4 id="feel">A whole different world!</h4></div>
				<img src="bgimage1.webp" alt="Chicago">
			  </div>

			  <div class="item">
				<div class="centered1" style="position: absolute;"><h1 id="stay">Hotel Newbie </h1>	</div>
				<div class="centered2" style="position: absolute;"><h4 id="feel">A whole different world!</h4></div>
				<img src="bgimage3.jpg" alt="Chicago">
			  </div>

			  <div class="item active">
				<div class="centered1" style="position: absolute;"><h1 id="stay">Hotel Newbie </h1>	</div>
				<div class="centered2" style="position: absolute;"><h4 id="feel">A whole different world!</h4></div>
				<img src="bgimage5.jpg" alt="Chicago">
			  </div>
			  
			</div>
		  
			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			  <span class="glyphicon glyphicon-chevron-left"></span>
			  <span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
			  <span class="glyphicon glyphicon-chevron-right"></span>
			  <span class="sr-only">Next</span>
			</a>
		</div>
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
									<a class="gn-icon gn-icon-cog" onclick="logout()">log out</a>
								</li>
							</ul>
						</div><!-- /gn-scroller -->
					</nav>
				</li>
				<li><a class="codrops-icon codrops-icon-prev" href="staff_options.jsp"><span>Home</span></a></li>			</ul>
			
				
		</div><!-- /container -->
		<script src="js/classie.js"></script>
		<script src="js/gnmenu.js"></script>
		<script>
			new gnMenu( document.getElementById( 'gn-menu' ) );
		</script>	
	</body>
</html>