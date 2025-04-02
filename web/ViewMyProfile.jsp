<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
        <li><a href="OwnerHome.jsp">Home</a></li>
        <li><a href="Upload.jsp">Upload File</a></li>
        <li><a href="ViewUploadedFiles.jsp">View Uploded Files</a></li>
        <li><a href="ViewMyProfile.jsp">View My Profile</a></li>
        <li><a href="ViewSearchTranactions.jsp">View Search Transaction</a></li>
        <li><a href="index.html">Logout</a></li>
      </ul>
    </div>
    <div id="content">
      <div id="column1">
          <%String username=(String)session.getAttribute("username");%>
        <h3>Welcome <%=username%></h3>
        <h3>My Profile </h3>
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
        <table>
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                 <th>Mobile</th> 
                 <th>Gender</th>
                  <th>Address</th>
                   <th>Status</th>
                 
             </tr>
            <%
         Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/verifiable", "root", "root");
        Statement st= con.createStatement();
    ResultSet r=st.executeQuery("select * from dataowner where username='"+username+"'");
        while(r.next()){
          %>
          <tr>
              <td><%=r.getString("fname")%></td>
              <td><%=r.getString("lname")%></td>
              <td><%=r.getString("email")%></td>
              
              <td><%=r.getString("mobile")%></td>
              <td><%=r.getString("gender")%></td>
              <td><%=r.getString("address")%></td>
              <td><%=r.getString("status")%></td>
       
          </tr> 
          
          <%
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
