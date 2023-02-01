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
        String fullname =null, phone=null;
		response.setHeader("cache-control", "no-cache, no-store, must-revalidate");
		String usr =  (String)session.getAttribute("usr");
		String pwd = (String)session.getAttribute("pwd");
		if(session.getAttribute("usr") == null)
			response.sendRedirect("customer.html");
        %>
        <%@ page import = "java.sql.*"%>
        <%
                try{
                    Connection con = null;
                    PreparedStatement stmt = null;
                    String url = "jdbc:mysql://localhost: 3306/hotel_reservationdb";
                    String user = "root";
                    String password = "toor";
                    con = DriverManager.getConnection(url, user, password);
                    stmt = con.prepareStatement("select fname, phno from users where user_name=?");
                    stmt.setString(1,usr);
                    ResultSet rs = stmt.executeQuery();
                    while(rs.next()){
                        fullname = rs.getString("fname");
	         phone = rs.getString("phno");
                    }
                }
                catch(SQLException e){	
                    e.printStackTrace();}
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
									<a class="gn-icon gn-icon-archive" href="customer.html">log out</a>
								</li>
							</ul>
						</div><!-- /gn-scroller -->
					</nav>
				</li>
				<li><a class="codrops-icon codrops-icon-prev" href="customer_options.jsp"><span>Home</span></a></li>			</ul> 
		</div><!-- /container -->
        <div id="wrapper">
            <div class="main-content">
              <div class="header">
                <h2 style="color: aqua; font-family: Snell Roundhand, cursive; text-align: center;">Hotel Newbie</h2>
                <div class="caption">
                  <p style="color: darkgray ;font-family: 'Times New Roman', Times, serif; font-size: large;text-align: center;margin-top:0px">Happy booking!!</p>
                </div>
              </div>
              <div class="l-part">
               <form action="book.jsp" method="post">
                <input type="text"   class="input-2" value=  '<%=fullname%>'  name="fname" readonly/>
                <input type="text"   class="input-1" value= '<%=phone%>'  name="pno" readonly />
                <input type="submit" value="book" class="btn" />
          </form>
      </div>
		<script src="js/classie.js"></script>
		<script src="js/gnmenu.js"></script>
		<script>
			new gnMenu( document.getElementById( 'gn-menu' ) );
		</script>
	</body>
</html>