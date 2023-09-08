<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*" %>     
    
    
<% 

try{
	
	String msg_email = request.getParameter("email");
	String msg_phone = request.getParameter("phone");
	String msg = request.getParameter("msg");
	
	// before inserting data i need check the mail alreday exist or not
	// inserting data
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","password");
		Statement stmt = con.createStatement();
		
		
			PreparedStatement ps = con.prepareStatement("INSERT INTO messages (user_email, user_phone, user_msg) VALUES (?, ?, ?);");
			ps.setString(1, msg_email);
			ps.setString(2, msg_phone);
			ps.setString(3, msg);

			int rowsAffected = ps.executeUpdate();

			if (rowsAffected > 0) {
			%>
       			 <script>
            		setTimeout(function() {
                		alert('Your Message Successfully send to Admin !!!');
                			window.location.href = './index.html#contact';
            			}, 1000);
        		</script>
        	<%
			} else {
			    out.print("<script>alert('Failed !!!!')</script>");
			}
		
	}
	catch(Exception e){
		
	}
}
catch(Exception e){
	out.print(e.getMessage());
}

%>