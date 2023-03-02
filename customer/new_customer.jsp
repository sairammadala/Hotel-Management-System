<html>
<head>
</head>
<body>
<%@ page import = "java.sql.*"%>
<%
          String phno = request.getParameter("pno");
          String full_name =  request.getParameter("fname");
          String usr_name =  request.getParameter("uname");
          String paswd =  request.getParameter("pwd");
          String squery = request.getParameter("security_question");
          String ans = request.getParameter("answer");
          String email = request.getParameter("email");
        try{
            Connection con = null;
            PreparedStatement stmt = null;
            String url = "jdbc:mysql://localhost: 3306/hotel_reservationdb";
            String user = "root";
            String password = "toor";
            con = DriverManager.getConnection(url, user, password);
            stmt = con.prepareStatement("insert into users(fname,phno,user_name,password,security_question,answer, email) values(?,?,?,?,?,?,?)");
            stmt.setString(1, full_name);
            stmt.setString(2, phno);
            stmt.setString(3,usr_name);
            stmt.setString(4,paswd);
            stmt.setString(5, squery);
            stmt.setString(6, ans);
            stmt.setString(7,email);
            int i = stmt.executeUpdate();
            session.setAttribute("usr", usr_name);
            session.setAttribute("pwd", paswd);
            request.getRequestDispatcher("customer_options.jsp").forward(request, response);
        }
        catch(SQLException e){
            out.println("<h1>"+full_name+"</h1>");
            out.println("<h1>oops!! account not created</h1><br>");
            e.printStackTrace();}
%>
</body>
</html>