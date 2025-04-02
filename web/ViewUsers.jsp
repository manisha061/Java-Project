<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>Verifiable and Multi Keyword Searchable Attribute Based Encryption Scheme for Cl</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="default.css" />
</head>
<body>
<div id="outer">
  <div id="outer2">
    <div id="header">
      <h2>Verifiable and Multi Keyword Searchable Attribute Based Encryption Scheme for Cloud</h2>
      
    </div>
    <div id="menu">
      <ul>
        <li><a href="CloudHome.jsp">Home</a></li>
        <li><a href="ViewFiles.jsp">View Files</a></li>
        <li><a href="ViewUsers.jsp">View Users</a></li>
        <li><a href="ViewOwners.jsp">View Owners</a></li>
        <li><a href="ViewAllTranactions.jsp">View All Transactions</a></li>
        <li><a href="index.html">Logout</a></li>
      </ul>
    </div>
      <style>
                                                      table tr th{
                                                          text-align: center;
                                                          height:50px;
                                                          background: #00cb86;
                                                          color:#12557f;
                                                          width:200px;
                                                      }
                                                      table tr td{
                                                          text-align: center;
                                                          background: #DDD;
                                                          height:35px;
                                                      }
                                                      </style>
    <div id="content">
      <div id="column1">
          <%String username=(String)session.getAttribute("username");%>
          <center><h3>View Users And Activate</h3></center>
       <%@page import="java.sql.*" %>
            <%
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/verifiable", "root", "root");
        Statement st= con.createStatement();
      ResultSet rs=st.executeQuery("select * from user");
      %>
      <table style="margin: 10px;" border="2px" >
          <tr>
              <th>First Name</th>
              <th>Last Name</th>
              <th>Email Id</th>
              <th>Mobile Number</th>
              <th>Username</th>
              <th>Status</th>
              <th>Activate</th>
          </tr>
          <%while(rs.next())
          {
              %>
              <tr>
                  <td><%=rs.getString(1)%></td>
                  <td><%=rs.getString(2)%></td>
                  <td><%=rs.getString(3)%></td>
                  <td><%=rs.getString(4)%></td>
                  <td><%=rs.getString(7)%></td>
                  <td><%=rs.getString(9)%></td>
                  <td><a href="Uactivate.jsp?username=<%=rs.getString(7)%>">Activate</a></td>
              </tr>
         <% }
}
catch(Exception e)
{
out.print(e);
}
         %>
      </table>
      </div>
     
    </div>
    <div id="footer">
      <p>Copyright &copy; 2019. Design by <a href="https://www.youtube.com/channel/UCWYttDXqDTehViek5qNlk0g?view_as=subscriber">Venkat Java Projects</a>.</p>
    </div>
  </div>
</div>
</body>
</html>
