
<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8" %>
        <% Class.forName("net.ucanaccess.jdbc.UcanaccessDriver"); %>
        <html>
    <head>
        <style>
body { background-image:url("img1.jpg");
    font-family: "Lato", sans-serif;}
h3
{
    color: #006666;
}

div.tab {
    width: 100%;
    text-align: center;
    background-color: #006666;
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
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
         
        <%
        String url = "jdbc:ucanaccess://C:\\Users\\Rekha\\Documents\\Search.accdb";
        Connection con=DriverManager.getConnection(url);
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from s1;");
        ResultSet rs1=st.executeQuery("select * from pl;");
       
        %>

<center><h3>Welcome to Admin page Mr.<%= session.getAttribute("uid") %> </h3></center>
<div class="tab">
    <a class="tablinks" href="#"><i class="fa fa-search" onclick="openCity(event, 'Search')"></i></a>
    <a href="#"><i class="tablinks" onclick="openCity(event, 'Payroll')">Payroll</i></a>

         </div>
<form action="red.jsp" method="POST">                    
<Center> <div id="Search" class="tabcontent"> <Center>
 <br><br><br>User name:<input type="text" name="uname" /><br/><br/>
<input type="submit" value="submit"> 
        </div>
</form>
<div id="Payroll" class="tabcontent">
<table border="0" cellpadding="8">
    <center>
        <tr><th>Payroll Code</th>&nbsp;<th>Commonly known as</th>  <th>Pay Period</th><th>Pay year</th><th>Pay Period Start Date</th><th>Processing Date</th><th>Company Code</th><th>Payroll Type</th><th>Processed</th></tr>
<% while(rs1.next())
{
    %>

    
        <tr><td><%= rs1.getString(1) %></td>  <td><%= rs1.getString(2) %></td>  <td><%= rs1.getString(3) %></td><td><%= rs1.getString(4) %></td><td><%= rs1.getString(5) %></td><td><%= rs1.getString(6) %></td><td><%= rs1.getString(7) %></td><td><%= rs1.getString(8) %></td><td><%= rs1.getString(9) %></td></tr>
        
        
    </center>

<%
    }
%>
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
