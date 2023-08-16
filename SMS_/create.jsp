<%@ page import="java.sql.*" %>

<html>
 <head>
  <title>Employee mS System</title>
  <Style> 
  *{font-size:50px}
  .nav{background-color:black;font-size:50px;}
   .nav a{color:white;text-decoration:none; margin:2%; text-align:left;}
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
 <h1>Add Student</h1>
<br/>
     <form>
      <input type="number" name="rollno" placeholder="enter student rollno" required >
     <br/><br/>
      <input type="text" name="name" placeholder="enter student name" required >
      <br/><br/>
      <input type="text" name="div" placeholder="enter student div" required >
      <br/><br/>
      <input type="number" name="percent" placeholder="enter student percent" required >
         <br/><br/>  
      <input type="submit" value="submit" name="btn" >
       
</form>

  <%
     if(request.getParameter("btn")!=null)
   {
    int rollno=Integer.parseInt(request.getParameter("rollno"));
    String name=request.getParameter("name");
    String divison=request.getParameter("div");
    int percent=Integer.parseInt(request.getParameter("percent"));   
try{
   DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
   String url="jdbc:mysql://localhost:3306/student_1";
   Connection con=DriverManager.getConnection(url,"root","abc456"); 
   String sql="insert into student2 values(?,?,?,?)";  
   PreparedStatement pst=con.prepareStatement(sql);
   pst.setInt(1,rollno);
   pst.setString(2,name);
   pst.setString(3,divison);
   pst.setInt(4,percent);
   pst.executeUpdate();
    out.println("record created");
  response.sendRedirect("home.jsp");
con.close();
}catch(SQLException err)
{out.println("issue "+  err);}
}

%>

   </center>
 </body>

</html>