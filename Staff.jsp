
<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8" session="false" %>
        <% Class.forName("net.ucanaccess.jdbc.UcanaccessDriver"); %>
<html>
    <head>
        <style>
body { background-image:url("img2.jpg");
    font-family: "Lato", sans-serif;}
h3
{
    color: black;
}

div.tab {
    width: 100%;
    text-align: center;
    background-color: #ff9966;
    overflow: auto;
}


div.tab a {
    width: 10%;
    padding: 6px 0;
    float: left;
    transition: all 0.3s ease;
    color: white;
    font-size: 18px
}


div.tab a:hover {
    background-color: #000;
}


div.tab a:focus, .active {
    background-color: #4CAF50;
}


.tabcontent {
    display: none;
    padding: 6px 12px;
    -webkit-animation: fadeEffect 1s;
    animation: fadeEffect 1s;
}


@-webkit-keyframes fadeEffect {
    from {opacity: 0;}
    to {opacity: 1;}
}

@keyframes fadeEffect {
    from {opacity: 0;}
    to {opacity: 1;}
}
       </style>
    </head>
    <body>
        <%
        String url = "jdbc:ucanaccess://C:\\Users\\Rekha\\Documents\\Search1.accdb";
        Connection con=DriverManager.getConnection(url);
        Statement st=con.createStatement();
        String ss=(String)request.getSession().getAttribute("uid");
        ResultSet rs=st.executeQuery("select * from ps1;");
        ResultSet rs2=st.executeQuery("select * from s1 where StaffID='"+ ss +"'");
        rs.next();
        rs2.next();
        %>
        
       <center><h3>Welcome to Staff page</h3></center>
         <div class="tab">

  <a href="#" class="fa fa-search" onclick="openCity(event, 'Search')">Search</a>
  <a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'PersonalDetails')">Personal Details</a>
  <a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'Payroll')">Payroll Details</a>

</div>
       <form action="red.jsp" method="POST">
        <div id="Search" class="tabcontent">

       <center>User name: <input type="text" name="uname"/><br/><br/>
 <input type="submit" value="submit"></center>
        </form></div>
<div id="PersonalDetails" class="tabcontent">
    <center>
        <table>    
            <tr><th>Staff Name:</th> <td><%= rs2.getString(1) %></td></tr>  
        <tr><th>Staff ID</th> <td><%= rs2.getString(8) %></td></tr>   
        <tr><th>Department</th><td><%= rs2.getString(2) %></td></tr>
        <tr><th>DOB </th><td><%= rs2.getString(4) %></td></tr>
        <tr><th>Qualification</th><td><%= rs2.getString(7) %></td></tr>
        <tr><th>Phone</th><td><%= rs2.getString(3) %></td></tr>
        <tr><th>Residence</th><td><%= rs2.getString(5) %></td></tr>
        <tr><th>E-Mail</th><td><%= rs2.getString(6) %></td></tr>
        </table>
    </center>

</div>

<div id="Payroll" class="tabcontent">
<table border="0" cellpadding="8">
    <center>
        <tr><th>StaffID</th><th>Basic Salary</th>  <th>HRA</th><th>CA</th><th>MRA</th><th>CCA</th><th>Gross Salary</th><th>Net Pay</th><th>Payroll Code</th></tr>
<% while(rs.next())
{
    %>

    
        <tr><td><%= rs.getString(1) %></td>  <td><%= rs.getString(2) %></td>  <td><%= rs.getString(3) %></td><td><%= rs.getString(4) %></td><td><%= rs.getString(5) %></td><td><%= rs.getString(6) %></td><td><%= rs.getString(7) %></td><td><%= rs.getString(8) %></td><td><%= rs.getString(9)%></td></tr>
        
        
    

<%
    }
%>
    </center>
</table>
</div>
<script>
function openCity(evt, cityName) {
    var i, tabcontent, fa;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    fa = document.getElementsByClassName("fa");
    for (i = 0; i < fa.length; i++) {
        fa[i].className = fa[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}
</script>
</body>
</html>
