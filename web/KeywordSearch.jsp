<%@page import="java.sql.*"%>
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
      </div>
          <center><h2 style="color:red;">View Files</h2></center>
          
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
                                                      
                                                  
                                                      
        <table style="margin-bottom:200px;">
            <tr>
                <th>File Id</th>
                <th>File Name</th>
                <th>Data Owner</th>
         
                <th>View Content</th>
                 </tr>
            <%
                String keyword=request.getParameter("keyword");
                       System.out.println(keyword);
         Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/verifiable", "root", "root");
        Statement st= con.createStatement();
        Statement st1= con.createStatement();
    ResultSet r=st.executeQuery("select * from files");
    
        if(r.next()){
String data=r.getString("data");
String owner=r.getString("username");
String fname=r.getString("fname");

if(data.contains(keyword)){
    
 st1.executeUpdate("insert into transaction values(null,'"+username+"','"+owner+"','"+fname+"','Search',now())");
    %>
     <tr>
           <td><%=r.getString("id")%></td>
              <td><%=r.getString("fname")%></td>
              <td><%=r.getString("username")%></td>
              
              <td><a href="ViewContent.jsp?fid=<%=r.getString("id")%>&fname=<%=r.getString("fname")%>">View Content</a></td>
          </tr> 
          
    
    <%
}else{
response.sendRedirect("SBOMultiKeyword.jsp?msg=failed");
}


             %>
         
          <%
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
