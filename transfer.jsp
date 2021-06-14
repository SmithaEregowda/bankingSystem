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
  <link rel="stylesheet" href="CSS/transfer.css">
</head>
<body>
 <%

       try{
	       Class.forName("com.mysql.jdbc.Driver");
	       Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingsystem","root","smitha");
	      Statement st=con.createStatement();
	      String name=request.getParameter("name");
	       
         String sql="select  * from customer where name='"+name+"' ";
         ResultSet rs=st.executeQuery(sql);
         request.setAttribute("Name",name);
         
        while(rs.next()){

     %>
<div class="container">
  <h2>customer <%=rs.getString("name") %> </h2>
           
  <form action="transcaction.jsp" method="post">
  <table border="1">
    <thead>
      <tr>
        <td>Name</td>
        <td><input type="text" value=<%=rs.getString("name") %> name="name" readonly></td>
      </tr>
    <tr>
    <td>Email</td>
    <td><input type="text" value=<%=rs.getString("email") %> name="email" readonly></td> 
    </tr>
    <tr>
    <td>Balance</td>
    <td><input type="text" value=<%=rs.getString("currentbalance") %> name="balance" readonly></td>
   </tr>
   <tr >
    <td colspan="2"><input type="button" value="Transfer" id="transfer" onclick="document.getElementById('hidden').style.display='block'"/></td>
   </tr>
   <tr>
    <td  colspan="2"> 
    <div id="hidden" style="display: none;" class='transaction'>
   
      Enter amount:<input type="text" name="num" id="num"><br><br>
      
     <input type="submit" id="submit" onclick="amount()" />
   
     </div>
     </td>
   </tr>
    </table>
  
  
  </form>
    </div>
    
   
     
   
         <%
}
       
con.close();
st.close();
rs.close();
}catch(Exception e){
	System.out.println(e);
}
 
%>
  
   
 

<script>
function amount(){
	if(num.value==''||isNaN(num.value)){
		alert("invalid amount")
	}
	else{
		alert("are you want send RS."+" "+num.value+" "+"money");
		document.getElementById('hidden').style.display='none'
	}
	
	
	
}
</script>

</body>
</html>
