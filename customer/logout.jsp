<%
session.removeAttribute("usr");
session.invalidate();
 response.sendRedirect("customer.html");
%>