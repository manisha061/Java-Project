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
          <h2 style="color:red">Download File</h2>
        
              <table>
              
          <%
          String oname=request.getParameter("oname");
         String fname=request.getParameter("fname"); 
         
         System.out.println(oname);
         System.out.println(fname);
         System.out.println(username);
          try{
               Class.forName("com.mysql.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/verifiable", "root", "root");
         Statement st= con.createStatement();
           Statement st1= con.createStatement();
  ResultSet r=st.executeQuery("select * from dwnrequest where username='"+username+"' and owner='"+oname+"'and fname='"+fname+"'");
        if(r.next()){
     ResultSet r1=st1.executeQuery("select * from files where username='"+oname+"' and fname='"+fname+"'");
         if(r1.next()){
             
           %>
           <tr>
               <th>File Name</th><td><input type="text" name="fname" value="<%=fname%>"</td>
           </tr>
            <tr>
                <th>File</th><td><textarea cols=50 rows=10 name="file"><%=r1.getString("data")%></textarea></td>
           </tr>
           
           <tr>
               <th></th><td><a href="Download.jsp?fname=<%=fname%>"><input type="button" value="Download"</a></td>
           </tr>
           <%
         }
        }      
          }catch(Exception e){
            System.out.println(e);  
          }
          %>
             
              </table>
          </form>
          
          
    </div>
    <div id="footer">
      <p>Copyright &copy; 2019. Design by <a href="https://www.youtube.com/channel/UCWYttDXqDTehViek5qNlk0g?view_as=subscriber">Venkat Java Projects</a>.</p>
    </div>
  </div>
</div>
</body>
</html>
