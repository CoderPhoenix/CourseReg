<%@page import="javax.servlet.http.*, javax.servlet.*, java.io.*, java.sql.*, java.util.*" %>
<%
String aid=request.getParameter("usn");
String apwd=request.getParameter("pwd");
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","oracle");
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from adlogin");
             rs.next();
			 String id=rs.getString(1);
			 String pwd=rs.getString(2);
			 if(id.equals(aid) && pwd.equals(apwd))
				 response.sendRedirect("indexAdmin.html");
			 else
				 response.sendRedirect("ErrorAdminLogin.html");
}
catch(Exception e)
{e.printStackTrace();}
%>