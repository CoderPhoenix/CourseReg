<%@page import="java.io.*,java.sql.*,javax.servlet.*,javax.servlet.http.*"%>
<html>
<body>
<br>
 <%     
 String id=(String)session.getAttribute("fusn");
 String fpwd1 =request.getParameter("fpwd1");
 String fpwd2 =request.getParameter("fpwd2");
	    try
		{   Class.forName("oracle.jdbc.driver.OracleDriver");	   
	         Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","oracle");   
	         con.setAutoCommit(false);
			 Statement s=con.createStatement();
			 ResultSet rs=s.executeQuery("select pwd from faculty where fid='"+id+"'");
			 rs.next();
		
			 if(rs.getString(1).equals(fpwd1)){
				 s.executeUpdate("update faculty set pwd='"+fpwd2+"' where fid= '"+id+"'");
				 con.commit();
				 response.sendRedirect("faculty.jsp");
			 }
             else
				 response.sendRedirect("ferrorchangepwd.html");
            
			 out.println("</body></html>");
			 }
		catch(Exception e){
			e.printStackTrace();
		}
%>