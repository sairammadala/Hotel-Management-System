<%
session.removeAttribute("usr");
session.invalidate();
 response.sendRedirect("staff.html");
%>