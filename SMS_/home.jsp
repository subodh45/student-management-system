<%@ page import="java.sql.*" %>
  <% 
   if (request.getParameter("i")!=null)
{
   int rollno=Integer.parseInt(request.getParameter("i"));
try{
   DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
   String url="jdbc:mysql://localhost:3306/student_1";
   Connection con=DriverManager.getConnection(url,"root","abc456"); 
   String sql="delete from student2 where rollno=?";  
   PreparedStatement pst=con.prepareStatement(sql);
   pst.setInt(1,rollno);
   pst.executeUpdate();
con.close();
}catch(SQLException err)
{out.println("issue "+  err);}

}
%>


<html>
 <head>
  <title>Student Management System</title>
  <Style> 
  *{font-size:50px}
   .nav{background-color:black;font-size:50px;}
   .nav a{color:white;text-decoration:none; margin:2%; text-align:left;}
   .nav1{font-size:40px;text-align:right;margin-top:-555px;}
  </Style>
 </head>
 <body>

  <%
    if(session.getAttribute("user")!=null)
     {
       
}else
  {  response.sendRedirect("index.jsp");}
%> 
 
     <div class="nav">
         <a href="home.jsp";>Home</a>
         <a href="create.jsp";>Create</a>
       <a href="update.jsp";>Update</a>
      </div>
<center>

<h1><b>Student Information</b></h1>

<br/> 

  <table border="3" style="width:50%">
     <tr>
           <th>Roll No</th>
           <th>Name</th>
           <th>Divison</th>
           <th>Percent</th>
           <th>Delete</th>
           <th>Update</th> 
     </tr>   

<%
    try{
   DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
   String url="jdbc:mysql://localhost:3306/student_1";
   Connection con=DriverManager.getConnection(url,"root","abc456"); 
   String sql="select * from student2 " ;
  Statement stmt=con.createStatement();
   ResultSet rs=stmt.executeQuery(sql);

    while(rs.next())
{
    int rollno=rs.getInt(1);
    String name=rs.getString(2);
    String divison=rs.getString(3);
    int percent=rs.getInt(4);
%>
    <tr style="text-align:center;">
       <td> <%=rollno%> </td>
        <td> <%=name %> </td>
       <td> <%=divison %> </td>
       <td> <%=percent%> </td>
       <td> <a href="?i=<%=rollno %>" onclick="return confirm('r u sure??')" style="text-decoration:none";>delete</a> </td>
      <td> <a href="update.jsp?u=<%=rollno %>" style="text-decoration:none";>update</a> </td> 
    
 </tr>  
<%

}
  

}catch(SQLException err)
{out.println("issue "+  err);}


%>

</table>
<div class="nav1">
<form>
   <input type="submit" value="logout" name="btn">
</form>
<% 
  if(request.getParameter("btn")!=null)
{   request.getSession().invalidate();
   response.sendRedirect("index.jsp");
}
%> 
</div>
     
   </center>
 </body>

</html>