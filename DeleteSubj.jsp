<%@ page import="javax.servlet.http.*,javax.servlet.*,java.io.*,java.sql.*" %>
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
	padding:20px 20px 20px 20px;
    border-radius:15%;
    background:rgba(15,10,10,0.3);
	color: white;
	font-family:'Trebuchet MS', Helvetica,sans-serif;
	display:table;
	font-weight: bold;
	font-size: 1.2em;
	border:2px solid black;
	position:absolute;
	top:65%;
	left:50%;
	bottom:35%;
	right:28%;
	text-align:center;
}
/*circle*/
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
<button class="button" onclick="location.href='achangepwd.html';">Change Password</button>
</div>
<div class="logout">
<button class="button" onclick="location.href='logout.jsp';">Logout</button>
</div>
<br>
<div class='circle'><span>
<form action=DeleteSubj2.jsp method=post>
<h2 align=center> Delete  Subject </h2><hr>
Subject name
</br></br>
<select style="align:center" name="sn">
<%
try{

Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","oracle");
            Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select sub from admin");
while(rs.next())
{
	String sub=rs.getString(1);
	out.println("<option value='"+sub+"'>"+sub+"</option>");
}
  }
  catch(Exception e)
  {
	  e.printStackTrace();
  }
%>
</select>
</br></br>
Subject type
</br></br>
<select style="align:center" name=st>
<option value=PE1>PE1</option>
<option value=PE2>PE2</option>
<option value=PE3>PE3</option>
<option value=PE4>PE4</option>
<option value=PE5>PE5</option>
</select>

</br></br>

<%
out.println("<input style='margin-top:7%;width:45%;padding:0.5% 0.5% 0.5% 0.5%;align:center; background: rgba(150, 100, 50, 0.3);border: 3px solid black;' type='submit' value='submit'>");


%>
</form></div>
</body></html>
