<%@ page 
import="javax.servlet.http.*,javax.servlet.*,java.io.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<style>
body {
   background: url("photo_bg.jpg") no-repeat center center fixed;
    background-size: cover;
	height:100%;
	-webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
}

.dropdown-content {
	display:none;
    position: absolute;
    z-index: 1;
}

.dropdown-content a {
    color:black;
    display: block;
}
.dropdown:hover .dropdown-content {
    display: block;
}

/*//////////////////*/
div{
    position: absolute;
    transform: translate(-50%, -50%) ;
}

.set_deadline{
	left:10%;
	top:20%;
}

.generate_results {
	left:22%;
	top:20%;
}

.display_subjects {
	left:34%;
	top:20%;
}

.display_students_registered {
	left:46%;
	top:20%;
}
.edit_subjects{
	left:58%;
	top:20%;

}
.edit_faculty{
	left:70%;
	top:20%;
}
.cpwd {
	left:82%;
	top:20%;
}
.logout{
left:94%;
top:20%;
}

.button {
    background:rgba(15,10,10,0.8);
    border:2px solid black;
    color: white;
    /*padding: 15px 32px;*/ 
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-weight: bold;
	font-size: 1em;
    margin: 2px 2px;
	border-radius: 50%;
	width:100px;
	height:100px;
}

.button:hover
{
cursor:pointer;
background-color:rgba(0, 0, 0,0.3);
}
/*circle*/

div{
color:white;
    height: 10em;
    margin: 0;
    position: absolute;
    top: 50%;
    left: 50%;
    margin-right: -50%;
	
    transform: translate(-50%, -50%) ;
	
}
.circle {
background:rgba(15,10,10,0.3);
	border-radius:50%;
	color: white;
	font-family:'Trebuchet MS', Helvetica,sans-serif;
	display:table;
	font-weight: bold;
	font-size: 1.2em;
	width: auto;
	margin:0 auto;
	border:2px solid black;
	top:65%;
padding:20px 20px 20px 20px;
	position:absolute;
	

}
.circle span {
	display:table-cell;
	vertical-align:middle;
	text-align:center;
	padding: 0 15px;
}
/*circle*/
#admintable {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#admintable td, #admintable th {
    text-align:center;
	border: 1px solid #ddd;
    padding: 8px;
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
div.scroll
{
background-color: white;
    width: 450px;
    height: 350px;
    overflow: scroll;
	margin-top:100px;
}
div{
    color:black;
    height: 10em;
    margin: 0;
    position: absolute;
    top: 50%;
    left: 50%;
    margin-right: -50%;
	transform: translate(-50%, -50%) ;	
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
<div class="set_deadline">
<button class="button" onclick="location.href='set_deadline.html';">Set Deadline</button>
</div>
<div class="generate_results">
<button class="button" onclick="location.href='generate_button.jsp';">Generate Results</button>
</div>
<div class="display_subjects">
<button class="button" onclick="location.href='DisplaySubjects.jsp';">Display Subjects</button>
</div>
<div class="display_students_registered">
<button class="button" onclick="location.href='DisplayResult.jsp';">Registered Students</button>
</div>

<div class="edit_subjects dropdown">
<button class="button dropdown" onclick="location.href='javascript:void(0)';">Edit Subjects</button>
	<div  class="dropdown-content " style="top:115%;left:-10%">
		<button class="button " style="	width:60px;height:60px;font-size:0.8em;" onclick="location.href='EditFaculty.jsp';">Change Faculty</button>
	</div>
	<div  class="dropdown-content " style="top:135%;left:50%;">
		<button class="button" style="width:60px;height:60px;font-size:0.8em;" onclick="location.href='InsertSubj.jsp';">Insert Subject</button>
		</div>
		<div  class="dropdown-content " style="top:115%;left:110%;">
		<button class="button" style="width:60px;height:60px;font-size:0.8em;" onclick="location.href='DeleteSubj.jsp';">Delete Subject</button>
		</div>
</div>

<div class="edit_faculty dropdown">
<button class="button dropdown" onclick="location.href='javascript:void(0)';">Edit Faculty</button>
	<div  class="dropdown-content " style="top:125%;left:22%">
		<button class="button " style="	width:60px;height:60px;font-size:0.8em;" onclick="location.href='InsertFaculty.jsp';">Insert Faculty</button>
	</div>
	<div  class="dropdown-content " style="top:125%;left:82%;">
		<button class="button" style="width:60px;height:60px;font-size:0.8em;" onclick="location.href='DeleteFaculty.jsp';">Delete Faculty</button>
		</div>
</div>
<div class="cpwd">
<button class="button" onclick="location.href='achangepwd.html';">Change password</button>
</div>
<div class="logout">
<button class="button" onclick="location.href='logout.jsp';">Logout</button>
</div>
<%
  try
  { 		
	  Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","oracle");
			out.print("<div class='scroll'>");
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
        out.println("</div>");
		out.println("<a href='FullTable.jsp' style='text-decoration:none;color:#206040;font-size:30px;font-weight:bold;position:absolute;top:90%;left:43%;'>View Full Table</a>");
		out.println("</body>");
		out.println("</html>");
	}//try
	catch(Exception e)
	{  out.println("Exception occured at DisplayResult.jsp");
		e.printStackTrace();
     }
%>

</body>
</html>