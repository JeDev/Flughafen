<!DOCTYPE html>
<html>
<head>

    <title>Jeevi International Airport</title>
    <link rel="stylesheet" type="text/css" media="screen" href="main.css" />
    <meta charset="utf-8" />


</head>
<body>

    <div class="main">

        <header>
                <div class="logo">Jeevi International Airport</div>
                <div class="menubox">
                    <ul class="menulist">
                        <li class="menu"><a href=""><%out.println("Ank\u00fcnfte");%></a></li>
                        <li class="menu"><a href=""><%out.println("Abfl\u00fcge");%></a></li>
                    </ul>
                </div>
            </header>

    <%
    String subpage = "start";
    if (request.getParameter("seite") != null)  {
        subpage = request.getParameter("seite");
    }
    
    switch(subpage) {
        case"start": %>
            <jsp:include page="welcome.jsp" flush="true"/><%; break;

        case"abflug": %>
            <jsp:include page="departures.jsp" flush="true"/><%; break;

        case"ankunft": %> 
            <jsp:include page="arrivals.jsp" flush="true"/><%; break;
    }
%>

    </div>
    <footer>Fusszeile<footer>

</body>
</html>