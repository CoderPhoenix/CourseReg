<%@page import="java.io.*,java.sql.*,javax.servlet.*,javax.servlet.http.*"%>
<html>
<body>
<br>
 <%     
 String id=(String)session.getAttribute("fusn");
 String mail1 =request.getParameter("fmail1");
String mail2 =request.getParameter("fmail2");
	    try
		{  		            
	         Class.forName("oracle.jdbc.driver.OracleDriver");	   
	         Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","oracle");   
	         con.setAutoCommit(false);
			 Statement s=con.createStatement();
			 ResultSet rs=s.executeQuery("select mail from faculty where fid='"+id+"'");
			 rs.next();
		
			 if(rs.getString(1).equals(mail1)){
				 s.executeUpdate("update faculty set mail='"+mail2+"' where fid= '"+id+"'");
				 con.commit();
				response.sendRedirect("faculty.jsp");
			 }
             else
				 response.sendRedirect("ferrorchangemail.html");
            
			 out.println("</body></html>");
			 }
		catch(Exception e){
				e.printStackTrace();
		}
%>