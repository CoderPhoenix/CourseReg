<%@page import="java.util.*,java.io.*,java.sql.*,javax.servlet.*,javax.servlet.http.*"%>
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
    color: white;
	font-family:'Trebuchet MS', Helvetica,sans-serif;
	font-weight: bold;
	font-size: 30px;
	border:2px solid black;
	text-align:center;
	position:absolute;
	top:60%;
	left:52%;
	right:65%;
	bottom:30%;
}
</style>
</head>
<body>
<br>
<div class="settings dropdown">
<button class="button dropdown" onclick="location.href='javascript:void(0)';">settings</button>
	<div  class="dropdown-content " style="top:115%;left:22%">
		<button class="button " style="	width:60px;height:60px;font-size:0.8em;" onclick="location.href='changepwd.html';">change pwd</button>
	</div>
	<div  class="dropdown-content " style="top:115%;left:82%;">
		<button class="button" style="width:60px;height:60px;font-size:0.8em;" onclick="location.href='changemail.html';">change mail_id</button>
		</div>
</div>
<%
  String id=(String)session.getAttribute("usn");
  String msg="";
  session.setAttribute("err",msg);
	Calendar now = Calendar.getInstance();
    int yr = now.get(Calendar.YEAR);
    int m = now.get(Calendar.MONTH) + 1;
        int b=Integer.parseInt("20"+id.substring(0,2));
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
    String batch=""+pyr+c;
	String ys=""+pyr+sem;
  session.setAttribute("sem",ys);
%>
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

<div class="circle">
</br>
Thanks for submitting !</br>-->You may have already completed your selection process.</br>(or)</br>-->You may have completed this course.
</div>