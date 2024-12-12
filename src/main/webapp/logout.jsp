<%--
  Created by IntelliJ IDEA.
  User: brian
  Date: 10/17/2024
  Time: 2:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%
    // Invalidate the session and remove cookies
    session.invalidate();

    // Redirect to login page
    response.sendRedirect("index.html");
%>

