<%@ page import="javax.servlet.http.*,javax.servlet.*,java.io.*,java.sql.*" %>

<%
response.setContentType("text/html");
String usn=request.getParameter("usn");
session.setAttribute("usn",usn);
String pwd=request.getParameter("pwd");
String sel=request.getParameter("opt");
try
{
            Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","oracle");

		if(sel.equals("log"))
	{
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select pwd,mail from student where id='"+usn+"'");
			out.println("after retvng the user id based info...");
             if(!(rs.next()))//wrong id
	          {
				  response.sendRedirect("ErrorLoginDet.html");
	          }
			 String pass=rs.getString(1);
			 if(pass==null)//send otp
                      response.sendRedirect("Mail.jsp");
			else
	         {
                 if(pwd.equals(pass))
  					
				 {
					 if(usn.equals("admin"))
						 response.sendRedirect("indexAdmin.html");
					 else
					 response.sendRedirect("display.jsp");
				 }
				 else
					response.sendRedirect("ErrorLoginDet.html");
				}
 }//if sel===log
else
	{
	response.sendRedirect("Mail.jsp");
	}
}//try
catch(Exception e)
{out.println("Exception in selec.jsp");}
%>