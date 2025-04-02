<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
        <li><a href="ProxyHome.jsp">Home</a></li>
        <li><a href="PermitFile.jsp">Permit File And Send To Cloud</a></li>
        <li><a href="ViewAllPermittedFiles.jsp">View All Permitted Files</a></li>
        <li><a href="index.html">Logout</a></li>
      </ul>
    </div>
    <div id="content">
      <div id="column1">
          <%String username=(String)session.getAttribute("username");%>
        <h3>Welcome <%=username%></h3>
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
                                                      
                                                      <h2 style="color:red;">View All Permit Files</h2>
                                                      
        <table style="margin-bottom:200px;">
            <tr>
                <th>File Id</th>
                <th>File Name</th>
                <th>Owner Name</th>
                 
                    <th>Permit Status</th>
             </tr>
            <%Date d=new Date();
                
                SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
                String currentdate=sdf.format(d);
                
         Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/verifiable", "root", "root");
        Statement st= con.createStatement();
    ResultSet r=st.executeQuery("select * from proxy where status='Permitted' and cloud='Permitted'");
    
        while(r.next()){
            String status=r.getString("cloud");
            String id=r.getString("id");
          %>
          <tr>
              <td><%=r.getString("fid")%></td>
              <td><%=r.getString("fname")%></td>
              <td><%=r.getString("user")%></td>
              
              
                 
                  <td><%=r.getString("cloud")%></td>    
                  
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
