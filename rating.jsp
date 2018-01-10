<%@ page import="javax.servlet.http.*,javax.servlet.*,java.io.*,java.sql.*,java.util.*" %>
<html>
<head>
<link rel="stylesheet" href="style.css" />
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
	padding:40px 40px 40px 40px;
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
	left:48%;
	bottom:35%;
	right:10%;
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

<div class="circle">
<form id="ratingsForm"  action="RatingDone.jsp" method="post">
<%
 String id=(String)session.getAttribute("usn");
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
    String batch=pyr+c;
  
        response.setContentType("text/html");

		Connection con=null;
		Statement st=null;
	        Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","oracle");
			st=con.createStatement();
			ResultSet rs=st.executeQuery("select pe1,r1,pe2,r2,pe3,r3,pe4,r4,pe5,r5 from student where id='"+id+"'");
			rs.next();
			int flag=0;
			for(int i=1;i<=10;i+=2)
			{
				if(rs.getString(i)!=null && rs.getString(i+1)==null)
					flag++;
			}
			if(flag==0)
			{
				response.sendRedirect("NoRating.jsp");
			}
		else
		{ 
			out.print("<form action='RatingDone.jsp' method='post'>");
			for(int i=1;i<=10;i+=2)
			{
			String sub=rs.getString(i);
			if(sub!=null)
			{
				String rate=rs.getString(i+1);
				if(rate==null)
				{
					int num=(i/2)+1;
					String na="r"+num;

					out.println("Provide rating for : "+sub);
					out.println("</br></br>");
		out.println("<div class='stars' style='margin-left:100px'><input type='radio' name='"+na+"' class='star-1' value='1' id='star-1"+na+"'/><label class='star-1' for='star-1"+na+"'>1</label>		<input type='radio' name='"+na+"' class='star-2' value='2' id='star-2"+na+"' />		<label class='star-2' for='star-2"+na+"'>2</label>		<input type='radio' name='"+na+"' class='star-3' value='3' id='star-3"+na+"' />		<label class='star-3' for='star-3"+na+"'>3</label>		<input type='radio' name='"+na+"' class='star-4' value='4' id='star-4"+na+"' />		<label class='star-4' for='star-4"+na+"'>4</label>		<input type='radio' name='"+na+"' class='star-5' value='5' id='star-5"+na+"' />		<label class='star-5' for='star-5"+na+"'>5</label><span></span></div>");
     
     out.println("</br>");
	      out.println("</br>");

	}
			}
			}
			out.println("<input style='margin-top:7%;width:45%;padding:0.5% 0.5% 0.5% 0.5%;margin-left:25%; background: rgba(150, 100, 50, 0.3);border: 3px solid black;' type='submit' value='submit'>");
out.print("</form>");
			out.print("</div>");

		}

	%>
</body>
</html>
