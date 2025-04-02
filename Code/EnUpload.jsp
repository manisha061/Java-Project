<%@page import="com.upload.Key"%>
<%@page import="javax.crypto.KeyGenerator"%>
<%@page import="javax.crypto.SecretKey"%>
<%@page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64"%>
<%@page import="com.upload.encryption"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.PrintStream"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.security.DigestInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.math.BigInteger"%>
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
        <h2><span>Encrypt Data </span> ::</h2>
          <p>&nbsp; </p>
		   <%

      	try 
	{
            String d1=request.getParameter("from");
          String d2=request.getParameter("to");
           if(d1.compareTo(d2)< 0){
              session.setAttribute("from",d1);
              session.setAttribute("to",d2);
           }else {
           %>
           <script type="text/javascript">
               window.alert("Please Check Date Format(From/To)");
               window.location="Upload.jsp";
               </script>
           
           <%
           }
               
           
      		String file=request.getParameter("tt");
      		String cont=request.getParameter("text");
                session.setAttribute("data",cont);
      		String keys = "ef50a0ef2c3e3a5f";
      		
      		String filename="filename.txt";
      		
			
      			KeyGenerator keygen=KeyGenerator.getInstance("AES");
           keygen.init(128);
           SecretKey s=keygen.generateKey();
           //converting secret keyto string
           byte[] b=s.getEncoded();//encoding secret key
           String skey=Base64.encode(b);
           
          out.println("secret key:"+skey);
          
          String encryptedValue=new encryption().encrypt(cont,s);
          
          
        
           
         
			
      		
	
%>
		 
<form action="Upload1.jsp" method="post">
		  		<table width="598" border="1" align="center">

            <tr>
              <td width="286"><span class="style4">File Name :- </span></td>
              <td width="356"><input name="fname" type="text" id="t42" size="50" value="<%= file %>" readonly="readonly" /></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td><textarea name="text2" cols="50" rows="15" readonly><%= encryptedValue %></textarea></td>
            </tr>
            <tr>
              <td><span class="style4">Secret Key : </span></td>
              <td><input name="t4" type="text"  size="50" value="<%= skey %>" readonly="readonly" /></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td><div align="right">
              </div></td>
              <td><input type="submit" name="Submit2" value="Upload" /></td>
            </tr>
          </table>
		  </form>
		  <%

	   

          
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
	
          <p>&nbsp;</p>
      </div>
    </div>
    <div id="footer">
      <p>Copyright &copy; 2019. Design by <a href="https://www.youtube.com/channel/UCWYttDXqDTehViek5qNlk0g?view_as=subscriber">Venkat Java Projects</a>.</p>
    </div>
  </div>
</div>
</body>
</html>
