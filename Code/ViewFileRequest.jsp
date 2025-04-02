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
        <li><a href="OKGSPHome.jsp">Home</a></li>
        <li><a href="ViewSearchkeyRequest.jsp">View Search Key Request</a></li>
        <li><a href="ViewFileRequest.jsp">View File Request</a></li>
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
                                                      
     <h2 style="color:red;">View File  Request</h2>
                                                      
        <table style="margin-bottom:200px;">
            <tr>
                <th>Request Id</th>
                <th>Requested By</th>
                <th>Owner Name</th>
                 <th>File Name</th>
                 <th>Date</th>
                <th>Status</th>
                      </tr>
            <%
                try{
         Class.forName("com.mysql.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/verifiable", "root", "root");
         Statement st= con.createStatement();
    ResultSet r=st.executeQuery("select * from dwnrequest where status='waiting'");
    
        while(r.next()){
            String status=r.getString("status");
          %>
          <tr>
              <td><%=r.getString("id")%></td>
              <td><%=r.getString("username")%></td>
              <td><%=r.getString("owner")%></td>
               <td><%=r.getString("fname")%></td>
              <td><%=r.getString("date")%></td>
           <%
           if(status.equals("waiting")){
               %>
               <td><a href="GenerateDwnKey.jsp?id=<%=r.getString("id")%>">Generate</a></td>  
               <%
           }else{
%>
               <td><%=status%></td>   
               <%
}
           
           %>
             
        
            <%}
}catch(Exception e){
out.println(e);
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
