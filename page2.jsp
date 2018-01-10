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
 <%        
   String id=(String)session.getAttribute("usn");
  String sem=(String)session.getAttribute("sem");
  String petype=request.getParameter("petype");
  session.setAttribute("petype",petype);
	    try
		{      		            			
	         Class.forName("oracle.jdbc.driver.OracleDriver");	   
	         Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","oracle");   
	         con.setAutoCommit(false);
	         Statement s = null ;
	         s=con.createStatement();
			 int max=10;
             ResultSet r=s.executeQuery("select sub from admin where type='"+petype+"'");
			 			out.print("<div class='circle'>");
out.println("<form action='page3.jsp' method='post'>");

out.println("</br></br>");
out.println("Select the subject ");
out.println("</br></br>");
			 out.println("<select name=subj>");
			 while(r.next())
			{
				 			String subj=r.getString(1);

				 Statement st=con.createStatement();
		 ResultSet rs=st.executeQuery("select count(id) from "+petype+" where subj='"+subj+"'");
                rs.next();

				if(rs.getInt(1) < max)
				{
				 out.println("<option value="+subj+">"+subj+"</option>");
				}//if
			}
		        out.println("</select></br></br>");
				out.println("<input style='align:center;width:30%;padding:0.5% 0.5% 0.5% 0.5%; background: rgba(150, 100, 50, 0.3);border: 3px solid black;'type=submit value=submit>");

				out.println("</form></div>");
				out.println("</body>");
				out.println("</html>");
		}//try
		catch(Exception e)
		{
			out.println("Exception at page2.jsp");
		    e.printStackTrace();
		}
%>
