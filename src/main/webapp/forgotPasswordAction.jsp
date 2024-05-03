<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
String email = request.getParameter("email");
String mobileNumber = request.getParameter("mnumber");
String securityQuestion = request.getParameter("securityQuestion");
String answer = request.getParameter("answer");
String newPassword = request.getParameter("newPassword");

int check = 0;

try{
  Connection con = ConnectionProvider.getCon();
  PreparedStatement p = con.prepareStatement("update users set password = ? where email = ? and answer = ?");
  p.setString(1, newPassword);
  p.setString(2, email);
  p.setString(3, answer);
  
  int i = p.executeUpdate();
  
  if(i > 0){  
    check=1;
    response.sendRedirect("forgotPassword.jsp?msg=done");
  }
  
  if(check == 0){
    response.sendRedirect("forgotPassword.jsp?msg=invalid");
  }
  
}

catch(Exception e){
  System.out.println(e);
}

%>

