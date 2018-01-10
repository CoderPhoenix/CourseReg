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

  <%
  int no=0;
  session.setAttribute("no",no);
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

        response.setContentType("text/html");
		Statement st=null;
	     Statement stmt=null;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","oracle");
			st=con.createStatement();
            stmt=con.createStatement();
            ResultSet rset=stmt.executeQuery("select * from deadline");
              String d=null;
			if(rset.next())
			 d=rset.getString(1);
			out.println( "<marquee style='position:absolute;top:0px;left:0px;font-size:1.2em;background: rgba(150, 100, 50, 0.7);border:2px solid black;'><b>DEADLINE FOR SELECTION IS "+d+"</b></marquee>");

			int nr=0;
			ResultSet rs1=st.executeQuery("select count(sub) from admin");
			if(rs1.next())
			      nr=rs1.getInt(1);           
			String arr[][]=new String[nr][7];
            Statement st2=con.createStatement();

			ResultSet rs=st2.executeQuery("select * from admin");
			
			
			int k=0;
		    while(rs.next())
			{
				for(int i=0,j=1;i<5;i++,j++)
				{
					if(rs.getString(j)==null)
						arr[k][i]="";
					else
						arr[k][i]=rs.getString(j);
				}
				k++;
			}
//display
        out.print("<div class='scroll'><table id='admintable'>	<tr><th>Subject</th><th>Type</th><th>Faculty</th><th>Rating</th></tr>");

	for(int i=0;i<nr;i++)
	{
		out.print("<tr><td>"+arr[i][0]+"</td><td>"+arr[i][3]+"</td><td>"+arr[i][2]+"</td><td>"+arr[i][4]+"</td></tr>");
	}
	out.print("</table></div>");

	%>


</body>
</html>