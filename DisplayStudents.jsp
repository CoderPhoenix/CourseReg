<%@ page import="javax.servlet.http.*,javax.servlet.*,java.io.*,java.sql.*,java.util.*" %>

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
/*table*/
#admintable {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#admintable td, #admintable th {
    border: 1px solid #ddd;
    padding: 8px;
	text-align:center;
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
  String id=(String)session.getAttribute("usn");
  String msg="";
  session.setAttribute("err",msg);
	Calendar now1 = Calendar.getInstance();
    int yr1 = now1.get(Calendar.YEAR);
    int m1 = now1.get(Calendar.MONTH) + 1;
        int b=Integer.parseInt("20"+id.substring(0,2));
	int pyr=((yr1-b)+1);
	String sem="0";
	if(m1>=5 && m1<=10)
	sem="2";
	else
	{
	pyr++;
	sem="1";
	}
	String c="-"+sem;
    String batch=""+pyr+c;
	String ys=""+pyr+sem;
	sem=ys;
  session.setAttribute("sem",ys);
response.setContentType("text/html");
try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","oracle");
			Statement st3=con.createStatement();
			ResultSet rs3=st3.executeQuery("select * from deadline");
			if(!rs3.next())
			{out.println("<h1 style='font-size:1.2em;background: rgba(150, 100, 50, 0.7);border:2px solid black;text-align:center;margin:auto;'><b>WAIT UNTIL DEADLINE FOR THE RESULT</b></h1>");
			 }
			 			
			 String d=rs3.getString(1);
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
	           {	          
				 out.println("<h1 style='font-size:1.2em;background: rgba(150, 100, 50, 0.7);border:2px solid black;text-align:center;margin:auto;'><b>PLEASE WAIT TILL DEADLINE</b></h1>");
				 flag=1;
                }
            if(flag==0)
			{
				int i=0,j=0;
				if(sem.equals("31"))
				{
					i=1;
					j=2;
				}
				if(sem.equals("41"))			
				{
					i=3;
					j=5;
				}
				out.print("<div class='scroll'>");
				for(;i<=j;i++)
				{
					out.print("<table id='admintable'>");
					Statement st5=con.createStatement();
					ResultSet rs5=st5.executeQuery("select count(sub) from admin where type='PE"+i+"'");
					rs5.next();
					int colspan=rs5.getInt(1);
					out.println("<tr><th id='sup' colspan="+colspan+">Professional Elective "+i+"</th></tr><tr>");
					Statement st=con.createStatement();
					ResultSet rs=st.executeQuery("select sub from admin where type='PE"+i+"'");
			
			while(rs.next())
			{
				String subj=rs.getString(1);
				Statement st2=con.createStatement();
				ResultSet rs2= st2.executeQuery("select * from "+subj);
				if(rs2.next())
				{
					out.print("<td valign=top><table id='admintable'>");
					out.println("<tr><th id='sub'> "+subj+"</th></tr>");				
					do
					{	  
						out.println("<tr><td>"+rs2.getString(1)+"</td></tr>");
					}while(rs2.next());
					out.print("</table></td>");
				}
				st2.close();
				rs2.close();
			  }//while
			  st.close();
			  rs.close();
			out.println("</tr></table>");
		
				}//for
				out.print("</div>");
			}
		out.print("</body></html>");
		}//try
		catch(Exception e)
		{out.println("Exception at DataBase.DisplayStudents.jsp");
		e.printStackTrace();}%>


