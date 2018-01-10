<%@page import="java.io.*,java.sql.*,javax.servlet.*,javax.servlet.http.*"%>
 <%        
   String id=(String)session.getAttribute("usn");
  String sem=(String)session.getAttribute("sem");
  String petype=(String)session.getAttribute("petype");
  String subj=request.getParameter("subj");
	    try
		{      		            
	         Class.forName("oracle.jdbc.driver.OracleDriver");	   
	         Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","oracle");   
	         con.setAutoCommit(false);
	         Statement s = null ;
			 Statement stmt=null;
			 int max=10;

			 Statement st=con.createStatement();
		 ResultSet rs=st.executeQuery("select count(id) from "+petype+" where subj='"+subj+"'");
                rs.next();

				if(rs.getInt(1) < max)
			{
					session.setAttribute("err","");
	         s=con.createStatement();
             s.executeUpdate("insert into "+petype+" values('"+id+"','"+subj+"')");
             
			 stmt=con.createStatement();
			 out.println("subject after entry into pe"+subj);
			 stmt.executeUpdate("insert into "+subj+" values('"+id+"')");
             con.commit();
			}
			else
			{ 
				session.setAttribute("err","Max filled..Please select another option");
			}
			 response.sendRedirect("page1.jsp");
			
          
		}//try
		catch(Exception e)
		{
			out.println("Exception at page3.jsp");
		    e.printStackTrace();
		}
%>
