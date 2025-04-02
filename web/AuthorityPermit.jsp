
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%
String cid=request.getParameter("fid");
String fname=request.getParameter("fname");
String user=request.getParameter("user");
String from=request.getParameter("from");
String to=request.getParameter("to");
String cdate=request.getParameter("cdate");
try{
    String query="update files set status='Permitted' where id='"+cid+"'";
    Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/verifiable", "root", "root");
        Statement st= con.createStatement();
           Statement st1= con.createStatement();
  int i=st.executeUpdate(query);
    if(i>0){
      st1.execute("insert into proxy values(null,'"+cid+"','"+fname+"','"+user+"','"+from+"','"+to+"','"+cdate+"','Permitted','waiting')");
        response.sendRedirect("SendCurrentTimeFiles.jsp?msg=success");          
    }else{
      response.sendRedirect("SendCurrentTimeFiles.jsp?msg=failed");  
    }
    
}catch(Exception e){
    out.println(e);
}

%>