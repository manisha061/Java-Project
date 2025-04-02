<%-- 
    Document   : insertdata
    Created on : Jul 3, 2019, 11:08:17 AM
    Author     : Acer
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.dbcon.DBCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%try{
    
    
   String username=(String)session.getAttribute("username");
   String from=(String)session.getAttribute("from");
   String to=(String)session.getAttribute("to");
                                    String email=(String)session.getAttribute("email"); 
                                     String data=(String)session.getAttribute("data");
                                    String fname=request.getParameter("fname"); 
					String cipher=request.getParameter("text2"); 
					String skey=request.getParameter("t4"); 
					
 
    Connection connection=DBCon.getCon();
PreparedStatement ps=connection.prepareStatement("insert into files values(null,?,?,?,?,?,?,?,?)");
						ps.setString(1,fname);
						ps.setString(2,data);
						ps.setString(3,cipher);	
						ps.setString(4,skey);
						ps.setString(5,username);
                                                ps.setString(6,"No");
                                                ps.setString(7,from);
                                                ps.setString(8,to);
						
						
                                                
                                                
                                              int i=ps.executeUpdate();  
                                                if(i>0){
                          Statement st2=connection.createStatement();
st2.executeUpdate("insert into transaction values(null,'"+username+"','"+username+"','"+fname+"','upload',now())");                          


                                                    %>
                                                    <script type="text/javascript">
                                                        window.alert("File Uploaded successfully");
                                                        window.location="Upload.jsp";
                                                        </script>
                                                    <%
                                                }else{
%>
                                                    <script type="text/javascript">
                                                        window.alert("Uploading Filed Failed");
                                                        window.location="Upload.jsp";
                                                        </script>
                                                    <%
}
					


}catch(Exception e){
   out.println(e); 
}

%>