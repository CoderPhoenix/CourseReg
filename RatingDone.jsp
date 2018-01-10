<%@ page import="javax.servlet.http.*,javax.servlet.*,java.io.*,java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<style>
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

li {
    float: left;
}
li.saanserif
{
 font-family: Arial, Helvetica, sans-serif;
}
li a, .dropbtn {
    display: inline-block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover, .dropdown:hover .dropbtn {
    background-color: green;
}

li.dropdown {
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
}
.saanserif{font-family: Arial, Helvetica, sans-serif;
}
.dropdown-content a:hover {background-color: #f1f1f1}

.dropdown:hover .dropdown-content {
    display: block;
}
</style>
</head>
<body>

<ul>
<li  class="dropdown" class="sansserif">
    <a href="javascript:void(0)" class="dropbtn">Settings</a>
    <div  class="dropdown-content">
      <a href="changepwd.html">change pwd </a>
      <a href="changemail.html">change mail_id</a>
    </div>
  </li>
  
  <%
  String sid=(String)session.getAttribute("usn");

	Calendar now = Calendar.getInstance();
    int yr = now.get(Calendar.YEAR);
    int m = now.get(Calendar.MONTH) + 1;
        int b=Integer.parseInt("20"+sid.substring(0,2));
	int pyr=((yr-b)+1);
	int sem=0;
	System.out.println("month is  :"+m);
	if(m>=5 && m<=10)
	sem=2;
	else
	{
	pyr++;
	sem=1;
	}
	String c="-"+sem;
    String batch=pyr+c;
  out.print("<li class=sansserif><a href=selection_button.jsp>Selection</a></li>");
  %>
  <li class="sansserif"><a href="DisplayStudents.jsp">Result</a></li>
  <li class="sansserif"><a href="rating.jsp">Rating</a></li>
    <li class="sansserif"><a href="logout.jsp">Logout</a></li>

</ul>

<%
try{
  //String sid=(String)session.getAttribute("usn");

		response.setContentType("text/html");

		Connection con=null;
		Statement st=null;
	
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","oracle");
			st=con.createStatement();
			Enumeration en=request.getParameterNames();
		out.print("rating submitted");
		while(en.hasMoreElements())
		{
				Object objOri=en.nextElement();
				String param=(String)objOri;
				int value=Integer.parseInt(request.getParameter(param));
            if(value!=0)
			{
				con.setAutoCommit(false);
			    st.executeUpdate("update student set "+param+"='"+value+"' where id='"+sid+"'");
			    con.commit();
				String num=param.substring(1,2);
				String subj="";
				ResultSet rs=st.executeQuery("select pe"+num+" from student where id='"+sid+"'");
				rs.next();
				subj=rs.getString(1);


                ResultSet rst=st.executeQuery("select "+param+" from student where pe"+num+"='"+subj+"'");
                
                int cnt=0;
                while(rst.next())
				{
					if(rst.getString(1)!=null)
					{
						cnt++;
					}

				}

				Statement st2=con.createStatement();
				ResultSet rs2=st2.executeQuery("select rating from admin where sub='"+subj+"'");
				rs2.next();
				String ra=(rs2.getString(1));
				Float r=0.0f;
				if(ra!=null)
					r=Float.parseFloat(ra);
				Float sum=(r*(cnt-1));
				sum += value;
				r=(sum/cnt);
				String updaterate=Float.toString(r);
				con.setAutoCommit(false);
				st2.executeUpdate("update admin set rating='"+updaterate+"' where sub='"+subj+"'");
				con.commit();
			}//if
		}//while
		response.sendRedirect("display.jsp");
}//try
catch(Exception e)
{
	e.printStackTrace();
}

	%>


</body>
</html>