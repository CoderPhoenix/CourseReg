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
/*table*/
#admintable {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
	tableLayout:fixed;
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
    background-color: #006666;
    color: white;
}
div.scroll
{
background-color: white;
    width: 450px;
  height:350px;
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

/*table*/
</style>
</head>
<body>
<div class="settings dropdown">
<button class="button dropdown" onclick="location.href='javascript:void(0)';">settings</button>
	<div  class="dropdown-content " style="top:115%;left:22%">
		<button class="button " style="	width:60px;height:60px;font-size:0.8em;" onclick="location.href='fchangepwd.html';">change pwd</button>
	</div>
	<div  class="dropdown-content " style="top:115%;left:82%;">
		<button class="button" style="width:60px;height:60px;font-size:0.8em;" onclick="location.href='fchangemail.html';">change mail_id</button>
		</div>
</div>

<div class="logout">
<button class="button" onclick="location.href='flogout.jsp';">logout</button>
</div>

<%
String fid=(String)session.getAttribute("fusn");
        response.setContentType("text/html");
	try{

			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","oracle");
           
			
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from deadline");
			if(!rs.next())
			{	out.println( "<marquee style='position:absolute;top:0px;left:0px;font-size:1.2em;background: rgba(150, 100, 50, 0.7);border:2px solid black;'><b>WAIT UNTIL DEADLINE FOR THE RESULT</b></marquee>");
             }
			 String d=rs.getString(1);
			 int yy=Integer.parseInt(d.substring(0,4));
			 int mm=Integer.parseInt(d.substring(5,7));
			 int dd=Integer.parseInt(d.substring(8,10));
			 Calendar now = Calendar.getInstance();
		   	 int yr = now.get(Calendar.YEAR);
			 int m = now.get(Calendar.MONTH) + 1;
			 int da=now.get(Calendar.DAY_OF_MONTH);
			 int flag=0;
			 if(yr>yy);
			 else if(yr==yy && m>mm);
			 else if(yr==yy && m==mm && da>dd);
			 else
	           {	          out.println( "<marquee style='position:absolute;top:0px;left:0px;font-size:1.2em;background: rgba(150, 100, 50, 0.7);border:2px solid black;'><b>PLEASE WAIT UNTIL DEADLINE FOR THE RESULT</b></marquee>");
				 			 flag=1;
                }
			if(flag==0)
			{  int fl_sub=0;
			    int fl_stud=0;
				Statement st2=con.createStatement();
				ResultSet rs2=st2.executeQuery("select fname from faculty where fid='"+fid+"'");
				rs2.next();
				String fname=rs2.getString(1);
                fname=fname.toUpperCase();
				Statement st3=con.createStatement();
				ResultSet rs3=st3.executeQuery("select sub from admin where fname='"+fname+"'");
									while(rs3.next())
				{
					fl_sub=1;
					String subject=rs3.getString(1);

					Statement st4=con.createStatement();
					ResultSet rs4=st4.executeQuery("select * from "+subject);
					out.print("<div class='scroll'><table id='admintable'>	<tr><th>"+subject+"</th></tr>");
                    
					while(rs4.next())
					{
						fl_stud=1;
						out.print("<tr><td>"+rs4.getString(1)+"</td></tr>");
					}
                    if(fl_stud==0)
					{
						out.print("<tr><td>NO STUDENTS REGISTERED</td></tr>");
					}
					out.print("</table></div>");
				}if(fl_sub==0)
					out.print("<h1>NO ELECTIVES ALLOCATED</h1>");
			}
		}//try
		catch(Exception e)
		{ e.printStackTrace();
		}
%>
</body>
</html>