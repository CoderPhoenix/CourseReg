<%@page import="java.io.*,java.sql.*,javax.servlet.*,javax.servlet.http.*"%>
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
    color: white;
	font-family:'Trebuchet MS', Helvetica,sans-serif;
	font-weight: bold;
	font-size: 1.2em;
	border:2px solid black;
	text-align:center;
	position:absolute;
	top:60%;
	left:52%;
	right:65%;
	bottom:30%;

	}
/*circle*/
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
 Integer no=(Integer)(session.getAttribute("no"));
 int n=no.intValue();
 n++;
 session.setAttribute("no",n);

   String id=(String)session.getAttribute("usn");
  String sem=(String)session.getAttribute("sem");
  out.println("<h1 style='font-size:1.2em;background: rgba(150, 100, 50, 0.7);border:2px solid black;text-align:center;margin:auto;'><b>"+((String)session.getAttribute("err"))+"</b></h1>");
	    try
		{ 
	         Class.forName("oracle.jdbc.driver.OracleDriver");	   
	         Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","oracle");   
	         con.setAutoCommit(false);
	         Statement s = null ;
	         s=con.createStatement();
			 int i=0,j=0,k=0;
			 if(sem.equals("31"))	
			{
				 i=1;j=2;
				 k=j-i+1;

			}
			if(sem.equals("41"))
			{
				i=3;
				j=5;
				k=j-i+1;
			}



						int flag=0;
	                      out.print("<div class='circle'>");
out.println("<form action='page2.jsp' method='post'>");

out.println("</br></br>");
out.println("Select your elective "+n);
out.println("</br></br>");
			 out.println("<select name='petype'>");
		for(;i<=j;i++)
			{
			ResultSet r=s.executeQuery("select id from PE"+i);
		int f=0;
			while(r.next())
				{
				   f=0;
				    if((r.getString(1)).equals(id))
					{
						f=1;
						flag++;
						break;
					}
				}//while
				if(f==0)
				{
					out.print("<option value='PE"+i+"'>PE"+i+"</option>");
				}

			}//for
				out.println("</select></br></br></br>");
				out.println("<input style='align:center;width:30%;padding:0.5% 0.5% 0.5% 0.5%; background: rgba(150, 100, 50, 0.3);border: 3px solid black;'type=submit value=submit>");
				out.println("</form>");
				out.print("</div>");
				out.println("</body>");
				out.println("</html>");
			 if(flag==k)
			{
				 response.sendRedirect("selection_done.jsp");
			 }
		}//try
		catch(Exception e)
		{
			out.println("Exception at page1.jsp");
		    e.printStackTrace();
		}
%>
