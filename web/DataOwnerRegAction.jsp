<%-- 
    Document   : RegisterAction
    Created on : 27 Jul, 2019, 5:16:23 PM
    Author     : VENKAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    String fname=request.getParameter("fname");
    String lname=request.getParameter("lname");
    String email=request.getParameter("email");
    String mobile=request.getParameter("mobile");
    String gender=request.getParameter("gender");
    String address=request.getParameter("address");
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/verifiable", "root", "root");
        Statement st= con.createStatement();
      ResultSet rs=st.executeQuery("select count(*) from dataowner where username='"+username+"'");
      while(rs.next())
      {
          int count=rs.getInt(1);
          if(count==0)
          {
              int i=st.executeUpdate("insert into dataowner values('"+fname+"','"+lname+"','"+email+"','"+mobile+"','"+gender+"','"+address+"','"+username+"','"+password+"','Waiting')");
              if(i>0)
              {
                  %>
                  <script type="text/javascript">
           window.alert("Registration SuccessFully Completed");
           window.location="dataOwner.jsp";
           
           </script>
                  <%
              }
else
{
%>
                  <script type="text/javascript">
           window.alert("Registration Fail");
           window.location="DataOwnerReg.jsp";
           
           </script>
                  <%
}
          }
%>
                  <script type="text/javascript">
           window.alert("Username Alredy Exist");
           window.location="DataOwnerReg.jsp";
           
           </script>
                  <%
      }
%>
                  <script type="text/javascript">
           window.alert("Username Already Exist");
           window.location="DataOwnerReg.jsp";
           
           </script>
                  <%
    }
    catch(Exception e)
    {
        out.println(e);
    }
    %>