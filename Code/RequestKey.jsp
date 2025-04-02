<%-- 
    Document   : RequestKey
    Created on : Dec 24, 2019, 2:51:13 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<%
    String username=(String)session.getAttribute("username");
String owner=request.getParameter("oname");
String fname=request.getParameter("fname");
try{Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/verifiable", "root", "root");
        Statement st1= con.createStatement();
  ResultSet r=st1.executeQuery("select * from proxy where user='"+owner+"'and fname='"+fname+"' and status='Permitted' and cloud='Permitted'");
    if(r.next()){
    String sql="insert into keyrequest values(null,'"+username+"','"+owner+"','"+fname+"',now(),'waiting')";
         Statement st= con.createStatement();
    int i=st.executeUpdate(sql);
    if(i>0){
      %>
      <script type="text/javascript">
          window.alert("Request Sent Successfully");
          window.location="RequestSearchKey.jsp";
          </script>
      
      <%
    }else{
%>
      <script type="text/javascript">
          window.alert("Request Sendding Failed");
          window.location="RequestSearchKey.jsp";
          </script>
      
      <%
}
}else{
%>
      <script type="text/javascript">
          window.alert("File Or User Doesn't Exist");
          window.location="RequestSearchKey.jsp";
          </script>
      
      <%
}
    
}catch(Exception e){
 out.println(e);   
}


%>