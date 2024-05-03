<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String id= request.getParameter("id");
String name= request.getParameter("name");
String category= request.getParameter("category");
String price= request.getParameter("price");
String active= request.getParameter("active");


try{
	Connection con = ConnectionProvider.getCon();
	PreparedStatement p= con.prepareStatement("insert into product values(?,?,?,?,?)");
    p.setString(1,id);
    p.setString(2,name);
    p.setString(3,category);
    p.setString(4,price);
    p.setString(5,active);
    p.executeUpdate();
    response.sendRedirect(" addNewProduct.jsp?msg=done ");
    

}
catch (Exception e){
	System.out.println(e);
	response.sendRedirect("addNewProduct.jsp?msg=wrong");
	
}
%>