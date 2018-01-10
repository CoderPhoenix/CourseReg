<%@page import="java.io.*,java.sql.*,java.util.*,javax.servlet.*,javax.servlet.http.*"%>
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

.settings {
	left:10%;
	top:20%;
}

.selection {
	left:30%;
	top:20%;
}

.result {
	left:50%;
	top:20%;
}

.rating {
	left:70%;
	top:20%;
}

.logout {
	left:90%;
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
	font-size: 1.2em;
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
.circle {
    background:rgba(15,10,10,0.3);
    color: white;
	font-family:'Trebuchet MS', Helvetica,sans-serif;
	font-weight: bold;
	font-size: 1.2em;
	border:2px solid black;
	text-align:center;
	position:absolute;
	top:60%;
	left:50%;
	right:20%;
	bottom:20%;

	}

</style>
</head>
<body>
<div class="settings dropdown">
<button class="button dropdown" onclick="location.href='javascript:void(0)';">settings</button>
	<div  class="dropdown-content " style="top:115%;left:22%">
		<button class="button " style="	width:60px;height:60px;font-size:0.8em;" onclick="location.href='changepwd.html';">change pwd</button>
	</div>
	<div  class="dropdown-content " style="top:115%;left:82%;">
		<button class="button" style="width:60px;height:60px;font-size:0.8em;" onclick="location.href='changemail.html';">change mail_id</button>
		</div>
</div>

<div class="selection">
<button class="button" onclick="location.href='selection_button.jsp';">selection</button>
</div>
<div class="result">
<button class="button" onclick="location.href='DisplayStudents.jsp';">result</button>
</div>
<div class="rating">
<button class="button" onclick="location.href='rating.jsp';">rating</button>
</div>
<div class="logout">
<button class="button" onclick="location.href='logout.jsp';">logout</button>
</div>

<%
try
		{      		            
	         Class.forName("oracle.jdbc.driver.OracleDriver");	   
	         Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","oracle");   
	         con.setAutoCommit(false);
	         Statement s=con.createStatement();
			 ResultSet rs=s.executeQuery("select * from deadline");
             if(!rs.next())
			{response.sendRedirect("page1.jsp");
			 }
			 			
			 String d=rs.getString(1);
			 int yy=Integer.parseInt(d.substring(0,4));
			 int mm=Integer.parseInt(d.substring(5,7));
			 int dd=Integer.parseInt(d.substring(8,10));
			 Calendar now = Calendar.getInstance();
		   	 int yr = now.get(Calendar.YEAR);
			 int m = now.get(Calendar.MONTH) + 1;
			 int da=now.get(Calendar.DAY_OF_MONTH);
			 if(yr<yy)
				 response.sendRedirect("page1.jsp");
			 else if(yr==yy && m<mm)
				 response.sendRedirect("page1.jsp");
			 else if(yr==yy && m==mm && da<=dd)
				 response.sendRedirect("page1.jsp");
%>
<div class="circle">
</br>
DEADLINE  COMPLETED
</br></br>
Please check the schedule and contact the respected faculty.
</br>
</div><%			 
		}
			 catch(Exception e)
			 {
				 out.println("Exception at selection_button.jsp");
			 }
%>