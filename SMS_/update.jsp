<%@ page import="java.sql.*" %>

<html>
 <head>
  <title>Student mS System</title>
  <Style> 
  *{font-size:50px}
   .nav{background-color:black;font-size:50px;}
   .nav a{color:white;text-decoration:none;  margin:2%; text-align:left;}
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
<h1>Update Page</h1>
<br/>
     <form>
      <input type="number" name="rollno" placeholder="enter student roll no to be updated" required >
     <br/>    <br/>
      <input type="text" name="name" placeholder="enter change name " required >
     <br/>    <br/>
       <input type="text" name="div" placeholder="enter chnge div" required >
     <br/>    <br/>
      <input type="number" name="percent" placeholder="enter change percent" required >
     <br/>    <br/>
      <input type="submit" value="update" name="btn" >
       
</form>
<%

if (request.getParameter("btn")!=null)
 {      int rollno=Integer.parseInt(request.getParameter("rollno"));
          String name=request.getParameter("name");
           String divison=request.getParameter("div");
          int percent=Integer.parseInt(request.getParameter("percent"));  
   try
    {     
          DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
          String url="jdbc:mysql://localhost:3306/student_1";
          Connection con=DriverManager.getConnection(url,"root","abc456"); 
          String sql="update student2 set name=? ,divison=?,percent=? where rollno=?";  
          String sqll="select * from student2 where rollno=?";
          PreparedStatement pst=con.prepareStatement(sql);
          PreparedStatement pstt=con.prepareStatement(sqll);
          
          pst.setString(1,name);
          pst.setString(2,divison);
          pst.setInt(3,percent);
          pst.setInt(4,rollno);
          pstt.setInt(1,rollno);

          ResultSet rs=pstt.executeQuery();
          
          if(rs.next())
            {    pst.executeUpdate();
                          out.println("record updated");
                 response.sendRedirect("home.jsp");
          } else   {out.println("invalid rno");}
             
    
       
          con.close();
   

   }catch(SQLException er)
     {out.println("issue "+  er);}
 }

%>

   </center>
 </body>

</html>