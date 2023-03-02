<html>
<head>
</head>
<body>
<%@ page import = "java.sql.*"%>
<%
          String usr_name =  request.getParameter("usr_name");
          String squery =  request.getParameter("security_question");
          String ans = request.getParameter("answer");
          String dbquery = null;
          String dbans = null;
          String sql;
        try{
            Connection con = null;
            PreparedStatement stmt = null;
            String url = "jdbc:mysql://localhost: 3306/hotel_reservationdb";
            String user = "root";
            String password = "toor";
            con = DriverManager.getConnection(url, user, password);
            stmt = con.prepareStatement("select security_question, answer from users where user_name=?");
            stmt.setString(1,usr_name);
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                dbquery = rs.getString("security_question");
                dbans  =rs.getString("answer");
            }
        }
        catch(SQLException e){
            out.println("<h1>Not connected to database</h1><br>");
            e.printStackTrace();
        }
        
        if(dbquery!=null){
            if(dbquery.equals(squery)&&dbans.equals(ans)){
	        session.setAttribute("usr", usr_name);
            request.getRequestDispatcher("reset.jsp").forward(request, response);
            }
            else{
                response.sendRedirect("customer.html");
                }
            }
        else{
            response.sendRedirect("customer.html");
        }   
%>
</body>
</html>