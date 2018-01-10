<%@page import="java.io.*,java.sql.*,javax.servlet.*,javax.servlet.http.*"%>
<html>
<body>
<br>
 <%     
 String apwd1 =request.getParameter("apwd1");
 String apwd2 =request.getParameter("apwd2");
	    try
		{   Class.forName("oracle.jdbc.driver.OracleDriver");	   
	         Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","oracle");   
	         con.setAutoCommit(false);
			 Statement s=con.createStatement();
			 ResultSet rs=s.executeQuery("select pwd from adlogin");
			 rs.next();
		          
			 if(rs.getString(1).equals(apwd1)){
				 s.executeUpdate("update adlogin set pwd='"+apwd2+"'");
				 con.commit();
				 response.sendRedirect("indexAdmin.html");
			 }
             else
				 response.sendRedirect("aerrorchangepwd.html");
            
			 out.println("</body></html>");
			 }
		catch(Exception e){
			e.printStackTrace();
		}
%>