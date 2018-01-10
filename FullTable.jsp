<%@ page 
import="javax.servlet.http.*,javax.servlet.*,java.io.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<style>
#admintable {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#admintable td, #admintable th {
    border: 1px solid #ddd;
    padding: 8px;
	text-align:center;
}

#admintable tr:nth-child(even){background-color: #f2f2f2;}
#admintable tr:nth-child(odd){background-color: #ffffff;}

#admintable tr:hover {background-color: #b3b3b3;}

#admintable th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: center;
    color: black;
}
#sup {
background-color:#b3b3b3;
}

#sub {
background-color:#d9d9d9;
}
/*table*/
</style>
</head>
<body>
<%
  try
  { 		
	  Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","oracle");
      for(int i=1;i<=5;i++) 
	{       out.print("<table id='admintable'>");
		    Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select sub from admin where type='PE"+i+"'");
			if(!rs.next())
			{}
			else
			{
			Statement st12=con.createStatement();
			ResultSet rs12=st12.executeQuery("select count(sub) from admin where type='PE"+i+"'");
			rs12.next();
			int colspan=rs12.getInt(1);
		    out.println("<tr><th id='sup' colspan="+colspan+">Professional Elective "+i+"</th></tr><tr>");
			do
			{
				String subj=rs.getString(1);
				Statement st2=con.createStatement();
				ResultSet rs2= st2.executeQuery("select * from "+subj);
				if(!rs2.next())
				{}
				else
				{
					out.print("<td valign=top><table id='admintable'>");
					out.println("<tr><th id='sub'> "+subj+"</th></tr>");
					do
					{  out.println("<tr><td>"+rs2.getString(1)+"</td></tr>");
					}while(rs2.next());
				}
				st2.close();
				rs2.close();
			  out.print("</table></td>");
			  }while(rs.next());//while
			}
			  st.close();
			  rs.close();
            out.print("</tr></table>");
	       }//for
		out.println("</body>");
		out.println("</html>");
	}//try
	catch(Exception e)
	{  out.println("Exception occured at FullTable.jsp");
		e.printStackTrace();
     }
%>

</body>
</html>