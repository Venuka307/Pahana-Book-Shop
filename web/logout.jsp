<%@ page language="java" session="true" %>
<%
    session.invalidate(); // Ends the current user session
    response.sendRedirect("login.jsp"); // Redirect to login page
%>
