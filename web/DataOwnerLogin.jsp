<%-- 
    Document   : ProviderLogin
    Created on : 28 Jul, 2019, 6:46:58 PM
    Author     : VENKAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    String username=request.getParameter("username");
    session.setAttribute( "username",username);
    String password=request.getParameter("password");
    try
    {
       Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/verifiable", "root", "root");
        Statement st= con.createStatement();
      ResultSet rs=st.executeQuery("select *from dataowner where username='"+username+"' and password='"+password+"'");
      while(rs.next())
      {
          String status=rs.getString("status");
          if(status.equalsIgnoreCase("Waiting"))
          {
              %>
                  <script type="text/javascript">
           window.alert("Your Account Not Yet  Activated By Cloud");
           window.location="dataOwner.jsp";
           
           </script>
                  <%
          }
else
if(status.equalsIgnoreCase("Activated"))
{
%>
                  <script type="text/javascript">
           window.alert("Owner Login SuccessFully ");
           window.location="OwnerHome.jsp";
           
           </script>
                  <%
}
%>
                  <script type="text/javascript">
           window.alert("Username Or Password Incorrect");
           window.location="dataOwner.jsp";
           
           </script>
                  <%
      }
%>
                  <script type="text/javascript">
           window.alert("Username Or Password Incorrect");
           window.location="dataOwner.jsp";
           
           </script>
                  <%
    }
    catch(Exception e)
    {
     out.println(e);
    }
    %>
