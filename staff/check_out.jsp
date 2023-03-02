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
        <link rel="stylesheet" type="text/css" href="css/customer_db.css" />
		<link rel="stylesheet" href="css/new_css.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
		<script src="js/modernizr.custom.js"></script>
		<style>
			#signup{
						background-color: #583672;
						margin-left: 100px;
						color: white;
						border-radius: 8px;
						font-weight: bold;
						-webkit-box-shadow: 0px 9px 15px -11px rgba(88,54,114,1);
						-moz-box-shadow: 0px 9px 15px -11px rgba(88,54,114,1);
						box-shadow: 0px 9px 15px -11px rgba(88,54,114,1);
						border: none;
						padding: 10px 20px;
						border-radius: 8px;
						display: block;
						margin: auto;
						margin-top: 10px;
						margin-bottom: 20px;
						
    					}
			#wrapper {
            			  width: 500px;
             			 height: 50%;
            			 overflow: hidden;
              			border: 0px solid #000;
              			margin: 50px auto;
             			 padding: 10px;
           			 }
  			.main-content {
              				width: 350px;
             				 height: 70%;
             				 margin: 24%;
             				 background-color: #fff;
             				 border: 2px solid #e6e6e6;
             				 padding: 40px 50px;
            			}
			body{
				background-image: url("bgimage.webp");
				background-size: cover;
				background-repeat: no-repeat;
				backface-visibility: visible;
			}
           			 .header {
             				 border: 0px solid #000;
              				margin-bottom: 15px;
          			}
            .input-1,
            .input-2,
            .input-3,
            .input-4 {
              width: 100%;
              margin-bottom: 10px;
              padding: 8px 12px;
              border: 1px solid #dbdbdb;
              box-sizing: border-box;
              border-radius: 3px;
            }
            
            .input-4{
                padding-top: 5px;
            }
            
            .btn {
              width: 100%;
              background-color: #3897f0;
              border: 1px solid #3897f0;
              padding: 5px 12px;
              color: #fff;
              font-weight: bold;
              cursor: pointer;
              border-radius: 3px;
            }
            
            input:focus {
                background-color: yellow;
            }
			div{
				display:block;
			}
		</style>
	</head>
	<body>
		<%
		response.setHeader("cache-control", "no-cache, no-store, must-revalidate");
		String usr =  (String)session.getAttribute("usr"); 
		String pwd = (String)session.getAttribute("pwd");
		if(session.getAttribute("usr") == null)
			response.sendRedirect("staff.html");%>
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
		<div class="container">
			<ul id="gn-menu" class="gn-menu-main">
				<li class="gn-trigger">
					<a class="gn-icon gn-icon-menu"><span>Menu</span></a>
					<nav class="gn-menu-wrapper">
						<div class="gn-scroller">
							<ul class="gn-menu">
								<li><a class="gn-icon gn-icon-earth" onclick="assign()">Assign Rooms</a></li>
								<li><a class="gn-icon gn-icon-illustrator" onclick="check_out()">Update checkout date</a></li>
								<li><a class="gn-icon gn-icon-article" onclick="customer_db()">view customer database</a></li>
								<li><a class="gn-icon gn-icon-article" onclick="customer_details()">view a Customer details</a></li>
								<li><a class="gn-icon gn-icon-archive" onclick="unassigned_rooms()">View unassigned roms</a></li>
								<li><a class="gn-icon gn-icon-help" onclick="room_details()">Room details</a></li>
                                <li><a class="gn-icon gn-icon-cog" onclick="logout()">log out</a></li>
							</ul>
						</div><!-- /gn-scroller -->
					</nav>
				</li>
				<li><a class="codrops-icon codrops-icon-prev" href="staff_options.jsp"><span>Home</span></a></li>			</ul>
		</div><!-- /container -->
        <div id="wrapper">
            <div class="main-content">
                <div class="header">
                    <h2 style="color: aqua; font-family: Snell Roundhand, cursive; text-align: center;">Hotel Newbie</h2>
                </div><br>
			<div class="left">
				<div class="contact">
					<form action="update_checkout.jsp" >
							<input type="number" placeholder="Enter customer id" name="customer_id" />
							<button id="signup">Confirm</button> 
					</form>
				</div>
			</div>
            
        </div>
		<script src="js/classie.js"></script>
		<script src="js/gnmenu.js"></script>
		<script>
			new gnMenu( document.getElementById( 'gn-menu' ) );
		</script>		
	</body>
</html> 