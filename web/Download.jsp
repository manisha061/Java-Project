<%-- 
    Document   : GenerateSKey
    Created on : Dec 24, 2019, 3:19:42 PM
    Author     : Acer
--%>

<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String username=(String)session.getAttribute("username");

String fname=request.getParameter("fname");
   Class.forName("com.mysql.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/verifiable", "root", "root");
         Statement st= con.createStatement();
   int iw=st.executeUpdate("insert into download values(null,'"+username+"','"+fname+"','Download',now())");
   if(iw>0){
     response.sendRedirect("Download2?"+fname);
   }else{
response.sendRedirect("DownloadedFiles.jsp?msg=failed");
}
%>