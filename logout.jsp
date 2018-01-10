<%@ page import="javax.servlet.http.*,javax.servlet.*,java.io.*,java.sql.*" %>

<html>
  <head>
    <meta charset="utf-8">
    <title>LOGOUT</title>
    <script>
      // Add actual page to history
      history.pushState(null, null, location.pathname)

      // Register back button click
      window.onpopstate = function (e) {
        // Prevent default action on back button click
        e.preventDefault()
        // Add actual page to history again
        history.pushState(null, null, location.pathname)
      }
    </script>
	<style>
	body
	{
		background-image:url("photo_bg.jpg");
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
	left: 40%;
	

}
	</style>
  </head>
  <body>
<%session.invalidate();%>
<div class="circle">
<h3>Successfully logged out</h3>
</div>
</body>
</html>