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
        String fullname =null, phone=null;
		response.setHeader("cache-control", "no-cache, no-store, must-revalidate");
		String usr =  (String)session.getAttribute("usr");
		String pwd = (String)session.getAttribute("pwd");
		if(session.getAttribute("usr") == null)
			response.sendRedirect("customer.html");
        String name = request.getParameter("fname");
        String phone_number = request.getParameter("pno");
		int room_type = Integer.parseInt(request.getParameter("room_type"));
		String payment = (String)request.getParameter("payment_method");
        int id=-1;	       
        %>
        <%@ page import = "java.sql.*"%>
        <%
        String sql;
        String URL = String.format("jdbc:mysql://localhost:3306/hotel_reservationdb");
        String USER = "root";
        String PASS = "toor";
        Connection conn = null;
        Statement stmt = null;
        try
        {
               conn = DriverManager.getConnection(URL, USER, PASS);
               stmt = conn.createStatement();
	 sql = String.format("insert into customer(name, phone_number, room_type, payment_method) values('%s', '%s', '%d', '%s')",name, phone_number, room_type, payment);
	 int i=stmt.executeUpdate(sql);
        }
        catch(Exception e){
            e.printStackTrace();
        }
        try
        {
            sql = String.format("select id from customer where phone_number = %s", phone_number);
            ResultSet rs2;
            rs2 = stmt.executeQuery(sql);
            if(rs2.next())
            {
                id = rs2.getInt("id");
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
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
			<header>
				<h1 style="margin-left: 25%;">Hotel newbie<span style="color: yellow;">A whole different world!</span></h1>
				
               			 <%out.println("<div style=\"background-color: rgb(255, 246, 244);width: 400px;border: 10px solid hsl(0, 18%, 78%);padding-left: 50px;padding-top:50px;padding-bottom:50px;margin-top: 40px;margin-left:230px\"><h2 style=\"color:darkblue;font-family:constantia;\">Your reservation id is '"+id+"'.</h2></div>");%>
			</header> 
		</div><!-- /container -->
		<script src="js/classie.js"></script>
		<script src="js/gnmenu.js"></script>
		<script>
			new gnMenu( document.getElementById( 'gn-menu' ) );
		</script>
	</body>
</html>