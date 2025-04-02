<%-- 
    Document   : GenerateSKey
    Created on : Dec 24, 2019, 3:19:42 PM
    Author     : Acer
--%>

<%@page import="java.util.Random"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%Random r=new Random();
int i=r.nextInt(1000000-40000)+5000;
String key=""+i;



String id=request.getParameter("id");
   Class.forName("com.mysql.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/verifiable", "root", "root");
         Statement st= con.createStatement();
   int iw=st.executeUpdate("update keyrequest set status='"+key+"'where id='"+id+"'");
   if(iw>0){
     %>
     <script type="text/javascript">
         window.alert("Key Generated Successfully");
         window.location="ViewSearchkeyRequest.jsp";
         </script>
     <%
   }else{
 %>
     <script type="text/javascript">
         window.alert("Key Generation Failed");
         window.location="ViewSearchkeyRequest.jsp";
         </script>
     <%
}
%>