<%@ page import="java.sql.*" %>


<%
		Connection conn = null;
		Statement stmt = null;
		
        String sort_column = "1";
        String sort_order = "asc";
        if (request.getParameter("sort") != null) sort_column = request.getParameter("sort");
        if (request.getParameter("sortdir") != null) sort_order = request.getParameter("sortdir");
	try{
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection ("jdbc:mysql://localhost:3306/flughafendb", "flughafen","flug");
	
		stmt = conn.createStatement();
		
		String the_sql =    " select * from flughafen" +
                            " order by " + sort_column + " " + sort_order + ";";	


		PreparedStatement pstmt = conn.prepareStatement (the_sql);
		/*pstmt.setInt("limite",6);
		pstmt.setInt("active",0);*/
                            
		ResultSet res = pstmt.executeQuery();
		
		out.println ("<h3>Flughafen </h3>");
		int rowcont = 0;
        out.println("<table border=1> <tr> <th>Kuerzel</th> <th>Bezeichnung</th></tr>");

		while(res.next()){
            out.println("<tr>");
			out.print("<td> " +res.getString(1) + ": </td>");
			out.println("<td>" + res.getString(2) + "</td></tr>");
		}
		out.println("</table>");
	}
catch(SQLException e){
	out.println ("<hr><b class='error'> JDBC Schrott: "+ e.getMessage()+"</b><br>");
}

%>