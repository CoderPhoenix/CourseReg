<%@page import="java.io.*,java.sql.*,javax.servlet.*,javax.servlet.http.*"%>
<html>
<body>
<br>
 <%     
 String id=(String)session.getAttribute("usn");
 String mail1 =request.getParameter("mail1");
String mail2 =request.getParameter("mail2");
	    try
		{      		            
	         Class.forName("oracle.jdbc.driver.OracleDriver");	   
	         Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","oracle");   
	         con.setAutoCommit(false);
			 Statement s=con.createStatement();
			 ResultSet rs=s.executeQuery("select mail from student where id='"+id+"'");
			 rs.next();
		
			 if(rs.getString(1).equals(mail1)){
				 s.executeUpdate("update student set mail='"+mail2+"' where id= '"+id+"'");
				 out.println("Successfully updated mail id");
				 con.commit();
				response.sendRedirect("display.jsp");

			 }
             else
				 response.sendRedirect("errorchangemail.html");
            
			 out.println("</body></html>");
			 }
		catch(Exception e){
			out.println("Exception occured in changemaildb.jsp"+e);
		}
%>