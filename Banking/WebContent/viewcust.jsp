<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>customer details</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="CSS/viewcust.css">
</head>
<body>

<div class="container">
  <h2>CUSTOMERS</h2>
           
  <table class="table table-dark table-hover">
    <thead>
      <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Balance</th>
        <th>View</th>
      </tr>
    </thead>
   <%

       try{
    	   
    	   System.out.println( session.getAttribute("balance"));
	       Class.forName("com.mysql.jdbc.Driver");
	       Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingsystem","root","smitha");
	      Statement st=con.createStatement();
	
         String sql="select  * from customer";
         ResultSet rs=st.executeQuery(sql);
        while(rs.next()){

     %>
    <tbody>
      <tr>
        <td><%=rs.getString("name")%></td>
        <td><%=rs.getString("email")%></td>
        <td><%=rs.getString("currentbalance")%></td>
        <td><a href="transfer.jsp?name=<%=rs.getString("name") %>">VIEW CUSTOMERS</a></td>
       
      </tr>
        
         <%
}
con.close();
st.close();
rs.close();
}catch(Exception e){
	System.out.println(e);
}
 
%>
    </tbody>
  </table>
</div>

</body>
</html>
