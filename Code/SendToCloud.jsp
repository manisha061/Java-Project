
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%
String id=request.getParameter("id");
String fname=request.getParameter("fname");
String user=request.getParameter("user");

try{
    String query="update proxy set cloud='Permitted' where id='"+id+"'";
    Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/verifiable", "root", "root");
        Statement st= con.createStatement();
           
  int i=st.executeUpdate(query);
    if(i>0){
             response.sendRedirect("PermitFile.jsp?msg=success");          
    }else{
      response.sendRedirect("PermitFile.jsp?msg=failed");  
    }
    
}catch(Exception e){
    out.println(e);
}

%>