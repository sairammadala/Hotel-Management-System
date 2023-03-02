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
				top: 35%;
				left: 50%;
				transform: translate(-50%,-50%);
			}
			#stay{
				text-align: center;
				color: bisque;
				font-size: 70px;
				font-family: 'Times New Roman', Times, serif;
				font-style: normal;
				font-weight: 300;
				letter-spacing: 10px;
			}
			#feel{
				text-align: center;
				color:lavender;
				font-size:20px;
				font-family: Arial, Helvetica, sans-serif;
				font-style: normal;
				font-weight: 300;
				word-spacing: 10px;
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
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
 	 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
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
			response.sendRedirect("customer.html");
		%>
		<script>
            function book(){
                window.location = "add_reservation.jsp" ;
            }
            function cancel(){
                window.location = "confirm_cancellation.jsp" ;
            }
            function status(){
                window.location="check_status.jsp";
            }
			function logout(){
				window.location.replace("logout.jsp");
			}
		</script>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
			  <li data-target="#myCarousel" data-slide-to="1" ></li>
			  <li data-target="#myCarousel" data-slide-to="0" ></li>
			  <li data-target="#myCarousel" data-slide-to="2" class="active"></li>
			  <li data-target="#myCarousel" data-slide-to="3"></li>
			  
			</ol>
		  
			<!-- Wrapper for slides -->
			<div class="carousel-inner" style="height: 100vh;">
				
			  <div class="item">
				<div class="centered1" style="position: absolute;"><h1 id="stay">STAY   WITH   US</h1></div>
				<div class="centered2" style="position: absolute;"><h4 id="feel">FEEL LIKE HOME</h4></div>
				<img src="bgimage.webp" alt="Los Angeles">
			  </div>
		  
			  <div class="item">
				<div class="centered1" style="position: absolute;"><h1 id="stay">STAY   WITH   US</h1></div>
				<div class="centered2" style="position: absolute;"><h4 id="feel">FEEL LIKE HOME</h4></div>
				<img src="bgimage1.webp" alt="Chicago">
			  </div>

			  <div class="item active">
				<div class="centered1" style="position: absolute;"><h1 id="stay">STAY   WITH   US</h1></div>
				<div class="centered2" style="position: absolute;"><h4 id="feel">FEEL LIKE HOME</h4></div>
				<img src="bgimage3.jpg" alt="Chicago">
			  </div>

			  <div class="item">
				<div class="centered1" style="position: absolute;"><h1 id="stay">STAY   WITH   US</h1></div>
				<div class="centered2" style="position: absolute;"><h4 id="feel">FEEL LIKE HOME</h4></div>
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
									<a class="gn-icon gn-icon-download" onclick="book()">Book a room</a>
								</li>
								<li><a class="gn-icon gn-icon-cog" onclick="cancel()">cancel reservation</a></li>
								<li><a class="gn-icon gn-icon-help" onclick="status()">check status</a></li>
								<li>
									<a class="gn-icon gn-icon-archive" onclick="logout()">log out</a>
								</li>
							</ul>
						</div><!-- /gn-scroller -->
					</nav>
				</li>
				<li><a class="codrops-icon codrops-icon-prev" href="customer_options.jsp"><span>Home</span></a></li>			</ul>
		</div><!-- /container -->
		<script src="js/classie.js"></script>
		<script src="js/gnmenu.js"></script>
		<script>
			new gnMenu( document.getElementById( 'gn-menu' ) );
		</script>		
	</body>
</html>