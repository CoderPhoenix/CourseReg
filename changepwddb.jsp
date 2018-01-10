<%@page import="java.io.*,java.sql.*,javax.servlet.*,javax.servlet.http.*"%>
<html>
<body>
<br>
 <%     
 String id=(String)session.getAttribute("usn");
 String pwd1 =request.getParameter("pwd1");
String pwd2 =request.getParameter("pwd2");
	    try
		{      		            
	         Class.forName("oracle.jdbc.driver.OracleDriver");	   
	         Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","oracle");   
	         con.setAutoCommit(false);
			 Statement s=con.createStatement();
			 ResultSet rs=s.executeQuery("select pwd from student where id='"+id+"'");
			 rs.next();
		
			 if(rs.getString(1).equals(pwd1)){
				 s.executeUpdate("update student set pwd='"+pwd2+"' where id= '"+id+"'");
				 out.println("Successfully updated password");
				 con.commit();
				 response.sendRedirect("display.jsp");
			 }
             else
				 response.sendRedirect("errorchangepwd.html");
            
			 out.println("</body></html>");
			 }
		catch(Exception e){
			out.println("Exception occured in changepwddb.jsp"+e);
		}
%>