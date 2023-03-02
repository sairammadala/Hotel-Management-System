<html>
<head>
</head>
<body>
<%
		response.setHeader("cache-control", "no-cache, no-store, must-revalidate");
		String usr =  (String)session.getAttribute("usr");
		if(session.getAttribute("usr") == null)
			response.sendRedirect("customer.html");       
%>
<%@ page import = "java.sql.*"%>
<%
          String np1 =  request.getParameter("np1");
          String np2 =  request.getParameter("np2");
        if(np1.equals(np2)){
        try{
            Connection con = null;
            PreparedStatement stmt = null;
            String url = "jdbc:mysql://localhost: 3306/hotel_reservationdb";
            String user = "root";
            String password = "toor";
            con = DriverManager.getConnection(url, user, password);
            stmt = con.prepareStatement("update users set password=? where user_name=?");
            stmt.setString(1, np1);
            stmt.setString(2,usr);
            stmt.executeUpdate();
            session.removeAttribute("usr");
            session.invalidate();
            response.sendRedirect("customer.html");
        }
        catch(SQLException e){
            out.println("<h1>Not connected to database</h1><br>");
            e.printStackTrace();}
        }
        else{
            request.getRequestDispatcher("reset.jsp").forward(request, response);
        }
%>
</body>
</html>