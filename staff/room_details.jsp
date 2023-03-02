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
        <link rel="stylesheet" href="css/customer_db.css">
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
        <%@ page import = "java.sql.*"%>
        <%
        int count=0;
        String sql;
        String URL = String.format("jdbc:mysql://localhost:3306/hotel_reservationdb");
        String USER = "root";
        String PASS = "toor"; 
        Connection conn = null;
        Statement stmt = null;
        conn = DriverManager.getConnection(URL, USER, PASS);
        stmt = conn.createStatement();
        try{
            sql = "SELECT COUNT(room_number) count FROM room";
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next())
            {
                count =  rs.getInt("count");
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        %>
        <div class="nwrapper" style="margin-top: 9%;">
        <%
        int[] rno = new int[count];
        int[] rtype = new int[count];
        int[] assigned = new int[count];
        int[] assigned_status = new int[count];
        int i=0;
            String sql1;
            try
            {
                sql1 = "select * from room";
                ResultSet rs = stmt.executeQuery(sql1);
                while(rs.next())
                {
                    rno[i] = rs.getInt("room_number");
                    rtype[i] = rs.getInt("type");
                    assigned[i] = rs.getInt("assigned");
                    assigned_status[i] = rs.getInt("room_assigned_status");
                    i+=1;
                }
            }
            catch(Exception e){
                e.printStackTrace();
            }
        %>
        <%for(i=0;i<=count-1;i++){%>
        <div class="section">
        <div class="desc">
            <div class="fill eich"></div>
            <div class="name"><%=rno[i]%></div>
            <div class="room" style="margin-top: 15px;">Type: <%=rtype[i]%></div>
            <div class="checkin">status</div>
            <div class="checkin_date"><%=assigned_status[i]%></div>
            <div class="checkout">Assigned id</div>
            <div class="checkout_date"><%=assigned[i]%></div>
        </div>
        </div>
        <%}%>
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
				<li><a class="codrops-icon codrops-icon-prev" href="staff_options.jsp"><span>Home</span></a></li></ul> 
		</div><!-- /container -->
		<script src="js/classie.js"></script>
		<script src="js/gnmenu.js"></script>
		<script>
			new gnMenu( document.getElementById( 'gn-menu' ) );
		</script>		
	</body>
</html>