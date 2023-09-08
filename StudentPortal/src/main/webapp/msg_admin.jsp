<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>

<%! String username; %>

<%

Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");
if (loggedIn != null && loggedIn) {
    String username = (String) session.getAttribute("username");
}
else{
	response.sendRedirect("error_page.jsp");
}

%>


    
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
       
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="shortcut icon" href="https://img.favpng.com/17/20/24/computer-icons-favicon-scalable-vector-graphics-web-design-png-favpng-FxX7qA70tWMUi0GGnu9h35mX8.jpg">
    
    
  	
<meta charset="ISO-8859-1">
<title>Messages | Admin</title>
</head>

<style>

nav{
	background-color:#6C63FF;
}

.card{
	
	background-color:whitesmoke;
	box-shadow: rgba(0, 0, 0, 0.07) 0px 1px 1px, rgba(0, 0, 0, 0.07) 0px 2px 2px, rgba(0, 0, 0, 0.07) 0px 4px 4px, rgba(0, 0, 0, 0.07) 0px 8px 8px, rgba(0, 0, 0, 0.07) 0px 16px 16px;
	border-radius:10px !important;
}
.card-title{
	font-weight:800;
}

</style>

<body>
	<header id="head1">
		<nav class="navbar navbar-expand-lg navbar-light sticky-top bg-warning">
			<div class="container p-1">
				<a class="navbar-brand text text-dark">
					<strong>
						Admin Portal
					</strong>
				</a>
  				<div>
  				 
  				 <a href="logout.jsp" class="btn btn-outline-dark" role="button" style="border-radius:20px; width:120px;">
  			 		<strong><i class="fa fa-user-circle-o"></i> logout</strong>
  				 </a>
  				 
  				 
  				</div>

			</div>
			
		</nav>
	</header>
	
	<%
            
           
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "password");
                
                // Use PreparedStatement to prevent SQL injection
                PreparedStatement ps = con.prepareStatement("SELECT * FROM messages ORDER BY id desc;");
                
                
                ResultSet rs = ps.executeQuery();
                
    %>
        
	<main>
		
		<div class="container mt-5 table-responsive">
				<h4 class="text pt-4 pb-4 text-center" style="font-weight:bold; font-size:35px;">Messages</h4>
                
                    <%
                        while (rs.next()) {
                        	
                        	
                    %>
                    
         <div class="card mb-3">
  			<div class="card-body text-dark">
    			<h5 class="card-title mb-3"><i class="fa fa-bell"></i> Message</h5>
    			<p style="font-weight:600;">From : <em><%= rs.getString(2) %></em></p>
    			<p style="font-weight:600;">Phone : <em><%= rs.getString(3) %></em> </p>
    			<p style="font-weight:600;">Message :<p>
    			<div class="mt-2 mb-2 p-2"><em><%= rs.getString(4) %></em></div>
  			</div>
		</div>           					
                    
                    <%
                   
                        }
                    
                        rs.close();
                        ps.close();
                        con.close();
                    } catch (Exception e) {
                        out.print("An error occurred: " + e.getMessage());
                    }
						
                    %>
              </div>     		
		</main>	
	</body>
</html>