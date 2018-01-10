<%@page import=" java.io.*,java.security.Security, java.util.Properties,java.sql.*,javax.mail.Message,javax.mail.MessagingException,javax.mail.PasswordAuthentication, javax.mail.Session,javax.mail.Transport, javax.mail.internet.InternetAddress,javax.mail.internet.MimeMessage,java.util.*,javax.servlet.*,javax.servlet.http.*,javax.servlet.http.HttpServlet"%>

<%

 String emailFromAddress = "bnsv8245@gmail.com";
  
Properties props = new Properties();
props.put("mail.smtp.host","smtp.gmail.com");
props.put("mail.smtp.auth","true");
props.put("mail.smtp.port","465");
props.put("mail.smtp.socketFactory.port","465");
props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");

Session session2 = Session.getInstance(props,
new javax.mail.Authenticator() {

protected PasswordAuthentication getPasswordAuthentication() {
return new PasswordAuthentication("bnsv8245", "bnsv8234056");
}
});
//session2 = Session.getInstance(props, this); 

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");	   
	         Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","system","oracle");   
	         con.setAutoCommit(false);
	         Statement s = null ;
	         s=con.createStatement();
             String usn=(String)session.getAttribute("fusn");
			 ResultSet rs=s.executeQuery("select pwd,mail from faculty where fid='"+usn+"'");
			rs.next();
	
			String toSend=rs.getString(1);

		 String mail=rs.getString(2);

        if(toSend==null)//no pwd
	 	{
					 String no="0123456789";
		              toSend="";
					 Random rd=new Random();
					 for(int i=0;i<4;i++)
			           toSend+=no.charAt(rd.nextInt(no.length()));
		}

Statement s2=con.createStatement(); 
s2.executeUpdate("update faculty set pwd='"+toSend+"' where fid='"+usn+"'");
con.commit();

MimeMessage msg = new MimeMessage(session2);
msg.addRecipient(Message.RecipientType.TO,new InternetAddress(mail));

           msg.setSubject("electiveotp");    
           msg.setText(toSend);
           Transport.send(msg);  
response.sendRedirect("flogin.html");
	
}//try
catch(Exception e)
	{e.printStackTrace();}
%>