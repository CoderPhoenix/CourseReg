<%@ page import="javax.servlet.http.*,javax.servlet.*,java.io.*,java.sql.*" %>
<%
response.setContentType("text/html");
String fusn=request.getParameter("fusn");
session.setAttribute("fusn",fusn);
String pwd=request.getParameter("fpwd");
String sel=request.getParameter("fopt");
try
{
	        Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","oracle");
		if(sel.equals("log"))
	{      Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select pwd,mail from faculty where fid='"+fusn+"'");
             if(!(rs.next()))//wrong id
	          { 
				  response.sendRedirect("fErrorLoginDet.html");
	          }

			 String pass=rs.getString(1);
			 if(pass==null)//send otp
                      response.sendRedirect("fMail.jsp");

			else
	         {   if(pwd.equals(pass))
  				 	 response.sendRedirect("faculty.jsp");
				 else
					response.sendRedirect("fErrorLoginDet.html");
			 }
      }//if sel===log
    else
	{
	response.sendRedirect("fMail.jsp");
	}
}//try
catch(Exception e)
{e.printStackTrace();}
%>