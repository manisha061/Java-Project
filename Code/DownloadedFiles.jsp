<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>Verifiable and Multi Keyword Searchable Attribute Based Encryption Scheme for Cl</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="default.css" />
<style>
    ul li{
     list-style: none;
    }
</style>
</head>
<body>
<div id="outer">
  <div id="outer2">
    <div id="header">
      <h2>Verifiable and Multi Keyword Searchable Attribute Based Encryption Scheme for Cloud</h2>
      
    </div>
    <div id="menu">
     <ul>
        <li><a href="UserHome.jsp">Home</a></li>
        <li><a href="UserLogin.jsp">Log Out</a></li>
       
    </div>
    <div id="content" >
      <div id="column1" style="border:1px solid red;width:200px;float:right;height:300px;border-radius:10px; ">
          <%String username=(String)session.getAttribute("username");%>
          <center> <h3>Show Menu</h3>
         <ul>
        <li><a href="UserHome.jsp">Home</a></li>
        <li><a href="RequestSearchKey.jsp">Request Search Key</a></li>
        <li><a href="CViewFiles.jsp">View Files</a></li>
        <li><a href="SBOMultiKeyword.jsp">Search Based On MultiKeyword</a></li>
        <li><a href="RequestForDP.jsp">Request For Download Permission</a></li>
        <li><a href="DownloadedFiles.jsp">Downloaded Files</a></li>
        <li><a href="index.html">Logout</a></li>
      </ul>
              </center>
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
      </div>
          <h2 style="color:red">Download File</h2>
          
          <form action="DnldKey.jsp" method="post">
              <table>
                  <tr><th>Enter Data Owner Name:</th><td><input type="text" name="oname" required=""/></td></tr>
                <tr><th>Enter Filename Name:</th><td><input type="text" name="fname" required=""/></td></tr>
       <tr><th></th><td><input type="submit" Value="Download" required=""/></td></tr>
              </table>
          </form>
           <h2 style="color:red">Downloaded Files</h2>
           <table style="margin-bottom:200px;">
            <tr>
                <th>Id</th>
                <th>FileName </th>
                <th>Task</th>
                 <th>Date</th>
                
                      </tr>
            <%
                try{
         Class.forName("com.mysql.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/verifiable", "root", "root");
         Statement st= con.createStatement();
    ResultSet r=st.executeQuery("select * from download");
    
        while(r.next()){
            
          %>
          <tr>
              <td><%=r.getString("id")%></td>
              <td><%=r.getString("fname")%></td>
              <td><%=r.getString("task")%></td>
            
              <td><%=r.getString("date")%></td>
          
        
            <%}
}catch(Exception e){
out.println(e);
}
            %>
           
        
            
        </table>
        
    </div>
    <div id="footer">
      <p>Copyright &copy; 2019. Design by <a href="https://www.youtube.com/channel/UCWYttDXqDTehViek5qNlk0g?view_as=subscriber">Venkat Java Projects</a>.</p>
    </div>
  </div>
</div>
</body>
</html>
