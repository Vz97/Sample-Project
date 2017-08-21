<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8" %>
<% Class.forName("net.ucanaccess.jdbc.UcanaccessDriver"); %>
<html>
    <body>
        <%
        String url = "jdbc:ucanaccess://C:\\Users\\Rekha\\Documents\\Search.accdb";
        Connection con=DriverManager.getConnection(url);
        Statement st=con.createStatement();
        String id=request.getParameter("uname");
        ResultSet rs=st.executeQuery("select * from s1 where StaffID='" +id+"'");
        if(!rs.next())
        {
            out.println("Sorry");
        }
        else
        {
        %>
   
        <Center> <h1>The Staff Details for the ID:<%= rs.getString(8) %> is Shown Below</h1> </Center>
        <center>       
            <Table border="1">
                    <tr><th>Name</th><td><%= rs.getString(1) %></td></tr>
                    <tr><th>ID</th><td><%= rs.getString(8) %></td></tr>
                    <tr><th>Department</th><td><%= rs.getString(2) %></td></tr>
                    <tr><th>Phone</th><td><%= rs.getString(3) %></td></tr>
                    <tr><th>DOB</th><td><%= rs.getString(4) %></td></tr>
                    <tr><th>Residence</th><td><%= rs.getString(5) %></td></tr>
                    <tr><th>Email</th><td><%= rs.getString(6) %></td></tr>
                    <tr><th>Qualification</th><td><%= rs.getString(7) %></td></tr>
            </Table>
        </center>
        <%
            }
        %>
        
    </body>
</html>
