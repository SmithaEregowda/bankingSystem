<%@ page import="java.sql.*" %>
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String num=request.getParameter("num");
String balance=request.getParameter("balance");


try{
	 Class.forName("com.mysql.jdbc.Driver");
     Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingsystem","root","smitha");
    Statement st=con.createStatement();
    String query="insert into  transaction values('"+name+"','"+email+"','"+num+"') ";
	st.executeUpdate(query);
	int value = Integer.parseInt(balance)+Integer.parseInt(num);
	balance = String. valueOf(value) ;
	System.out.println(balance);
	
	request.setAttribute("balance",balance); 
	
} 
catch(Exception e){
	System.out.println(e);
	
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>customer details</title>
  <link rel="stylesheet" href="CSS/sucess.css">
</head>
<body>
<p><b>
    TRANSFERED SUCESSFULLY!!!!!
 </b></p>
</body>
</html>