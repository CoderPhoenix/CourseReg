<%@ page import="javax.servlet.http.*,javax.servlet.*,java.io.*,java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<script language="JavaScript" type="text/javascript">
window.history.forward(1);
</script>

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
	border-radius:50%;
	color: white;
	font-family:'Trebuchet MS', Helvetica,sans-serif;
	display:table;
	font-weight: bold;
	font-size: 1.2em;
	width: auto;
	margin:0 auto;
	border:2px solid black;
	top:50%;
padding:20px 20px 20px 20px;
	position:absolute;
	left: 50%;
	

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
    <div class='circle'>
	<h3>No subjects are left to rate </h3>
	</div>
</body>
</html>