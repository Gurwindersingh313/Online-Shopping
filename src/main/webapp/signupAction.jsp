<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<% 
 String name = request.getParameter("name");
String email = request.getParameter("email");
String mobileNumber = request.getParameter("mobileNumber");
String securityQuestion = request.getParameter("securityQuestion");
String answer = request.getParameter("answer");
String password = request.getParameter("password");
String address="";
String city="";
String state="";
String country="";
try{
	Connection con = ConnectionProvider.getCon();
	PreparedStatement p= con.prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?,?)");
    p.setString(1,name);
    p.setString(2,email);
    p.setString(3,mobileNumber);
    p.setString(4,securityQuestion);
    p.setString(5,answer);
    p.setString(6,password);
    p.setString(7,address);
    p.setString(8,city);
    p.setString(9,state);
    p.setString(10,country);
    p.executeUpdate();
    response.sendRedirect("signup.jsp?msg=valid");
    

}
catch (Exception e){
	System.out.println(e);
	response.sendRedirect("signup.jsp?msg=invalid");
	
}



%>