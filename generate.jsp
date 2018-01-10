<%@page import="java.io.*,java.sql.*,javax.servlet.*,javax.servlet.http.*"%>
<%
  try
{
	         Class.forName("oracle.jdbc.driver.OracleDriver");	   
	         Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","oracle");   
	         con.setAutoCommit(false);
	         Statement s = null ;
			 int min=2,max=10;
          
		for(int z=1;z<=5;z++)
			{
			 s=con.createStatement();
             ResultSet rs=s.executeQuery("select sub from admin where type='PE"+z+"'");
             
			 int totcnt=0;

			 while(rs.next())
			{  String sub=rs.getString(1);

               Statement st=con.createStatement();
			   ResultSet rset=st.executeQuery("select count(list) from "+sub);
			   rset.next();
                          
               int count=rset.getInt(1);

				if(count<min)
				{
					Statement stmt1=con.createStatement();
					stmt1.executeUpdate("insert into min_tab values('"+sub+"','"+count+"')");
					con.commit();
					totcnt+=count;
				} 		 
				else
				{
					Statement stmt2=con.createStatement();
					stmt2.executeUpdate("insert into valid_tab values('"+sub+"','"+(max-count)+"')");
					con.commit();
				}
			}//while



				String list[]=new String[90];
               int i=0;
				//push into available slots

               Statement stmt3=con.createStatement();
				ResultSet rst1=stmt3.executeQuery("select subj from min_tab");
				while(rst1.next())
				{
                   String su=rst1.getString(1);
               Statement stmt4=con.createStatement();
				ResultSet rst2=stmt4.executeQuery("select list from "+su);
                  while(rst2.next())
					{
				         list[i]=rst2.getString(1);
						 i++;

					}
				
					Statement stmt9=con.createStatement();

				stmt9.executeUpdate("truncate table "+su);
									con.commit();

				}//each subject
		if(totcnt>0)
		{
			if(totcnt<min)
				{
			
            Statement stmt5=con.createStatement();
			ResultSet rst3=stmt5.executeQuery("select * from valid_tab");

			int k=0;
     		while(rst3.next()&& k<i)
					{   String subject=rst3.getString(1);
						 int cnt=rst3.getInt(2);

						 for(int l=0;(l<cnt && k<i);l++)
						{
                            Statement stmt6=con.createStatement();
						stmt6.executeUpdate("insert into "+subject+" values('"+list[k++]+"')");
					con.commit();

						}				      
					}
				}//if
				    
			else
			{ //combine them
			Statement st5=con.createStatement();
			ResultSet rs5=st5.executeQuery("select subj from min_tab where count=(select max(count) from min_tab)");
			rs5.next();
			String subject=rs5.getString(1);
			Statement st6=con.createStatement();
				for(int y=0;y<i;y++)
				{
					st6.executeUpdate("insert into "+subject+" values('"+list[y]+"')");
				}
			}//else of combine them
		}
		Statement st10=con.createStatement();
		st10.executeUpdate("truncate table valid_tab");
		Statement st11=con.createStatement();
		st11.executeUpdate("truncate table min_tab");
		con.commit();
	 }//for each pe
	 //update student database
	 for(int m=1;m<=5;m++)                  
	{  
		    Statement st7=con.createStatement();
			ResultSet rs7=st7.executeQuery("select sub from admin where type='PE"+m+"'");
			
			while(rs7.next())
			{
				String subj=rs7.getString(1);
				Statement st8=con.createStatement();
				ResultSet rs8= st8.executeQuery("select * from "+subj);
				while(rs8.next())
				{ 
					//inserting subj into students
					Statement st9=con.createStatement();
					st9.executeUpdate("update student set PE"+m+"='"+subj+"' where id='"+rs8.getString(1)+"'");
				}
			  }//while
	       }//for
		   
			 con.commit();
            response.sendRedirect("DisplayResult.jsp");//create pages			 
}//try
		catch(Exception e)
		{
			out.println("Exception at generate.jsp");
		}
%>
</body>
</html>