<html>
    <head>
        <style>
        * {
            margin: 0px;
            padding: 0px;
          }
          
        body {
            background-image: url(bgimage.webp);
            background-repeat: no-repeat;
            background-size: cover;
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
			response.sendRedirect("customer.html");
        int id = Integer.parseInt(request.getParameter("booking_id"));	
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
            sql = String.format("delete from customer where id = %d;",id);   
            stmt.executeUpdate(sql);
            out.println("<h1 style=\"text-align:center; color:red; margin-top: 20%;\">your reservation cancelled.</h1>");
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        %>
    </body>
</html>