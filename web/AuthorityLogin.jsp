<%-- 
    Document   : cloudlogin
    Created on : 17 Dec, 2018, 9:20:11 PM
    Author     : VENKAT
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String username=request.getParameter("username");
    
    String password=request.getParameter("password");
    
try
    {
        Class.forName("com.mysql.jdbc.Driver");
         Connection    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/verifiable", "root", "root");
     
      Statement st= con.createStatement();
      ResultSet rs=st.executeQuery("select * from aa where username='"+username+"' and password='"+password+"' ");
      if(rs.next())
      {
   %>
    <script type="text/javascript">
        window.alert(" Attribute Authority Login Sucess");
        window.location="AAHome.jsp";
   </script>
   <%
       session.setAttribute("username",username);
}
else
{
    %>
    <script type="text/javascript">
        window.alert(" Attribute Authority Login Fail");
        window.location="AttributeAuthority.jsp";
   </script>
   <%
}
}
    catch(Exception e)
    {
        out.println(e);
    }
%>