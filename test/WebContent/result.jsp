<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="styles.css" />
<title>Ergebnis!</title>
</head>
<body bgcolor="#C0C0C0">
<%
	int userAge = 0;
	int ageMinus = 18;
	 int agePlus = 26;
	//System.out.println("session.getAttribute(userAge).toString()" + session.getAttribute("userAge").toString());
	if(session.getAttribute("userAge")!= null||!session.getAttribute("userAge").toString().equals(""))
	{
		 userAge = Integer.parseInt( session.getAttribute("userAge").toString());
		 agePlus = userAge + 2; 
		 ageMinus = userAge - 2;
	}
	
	
	
	/* int waitingtime = 10;
	response.setHeader("Refresh", waitingtime + ";url=result_1Adetailed.jsp");  */
	int numOfQues=0;
	int numOfRight=0;
	int percent=85;
	String category="";
	String dbUrl = "jdbc:mysql://localhost:3306/dbexperiment";
			String dbClass = "com.mysql.jdbc.Driver";
			Connection contemp = null;
			Class.forName(dbClass);
			contemp = DriverManager.getConnection(dbUrl,"root","adminadmin");
			
			// Check the answer of user about 
			String tempsql = "SELECT count(ques_img) as total_ques FROM dbexperiment.t_userteil2ans where session_id='" + request.getSession().getId() + "'";
			String rightsql = "SELECT count(ques_img) as right_ans FROM dbexperiment.t_userteil2ans where result_ans=1 and session_id='"+ request.getSession().getId()  + "'";
			
			Statement tempstmt = contemp.createStatement();
			Statement rightstmt = contemp.createStatement();
			
			ResultSet tempres = tempstmt.executeQuery(tempsql);
			ResultSet rightres = rightstmt.executeQuery(rightsql);
			
			if(rightres.next())
			numOfRight = rightres.getInt("right_ans");
						
			if(tempres.next())
			numOfQues = tempres.getInt("total_ques");
			
			float percentFloat = (((float)numOfRight)/((float)numOfQues)) * 100;
			int percentInt = Math.round(percentFloat);
			System.out.println("total no of question attempt : " + numOfQues);
			System.out.println("total no of right answers    : " + numOfRight);
			System.out.println("percentage             : " + percentFloat);
			contemp.close();
			
			if(numOfRight >40){
				percent = 85; 
				category = "überdurchschnittlichen"; }
			else if(numOfRight < 19){
				percent = 15; 
				category = "unterdurchschnittlichen";
			}else 
				{
				percent = 50; 
				category = "durchschnittlichen";
			}
%>
<br><br>

<p align="center" style="font-family:;font-size:22px;">
Ihr Ergebnis in der Figurerkennungsaufgabe:
</p>

<div align="center" style="height: 118px; ">
<table border="2" cellpadding="0" cellspacing="0" width="70%" style="height: 106px; ">
<tr style="font-family:arial;color:white;font-size:18px;"  bgcolor="#6A97B6">
<th></th>
<th width="30%" align="center"> Test </th>
<th width="50%" align="center">Anzahl fehlerfrei<br> gelöster Aufgaben</th>
<th width="30%" align="center"> Prozentrang </th>
</tr>

<tr  style="font-family:arial;color:black;font-size:18px;">
<td width="20%" bgcolor="#6A97B6" style="font-family:arial;color:white;font-size:18px;"> <b>Ergebnis</b></td>
<td align="center">Figurerkennungsaufgabe</td>

<td align="center"><%=numOfRight %></td>
<td align="center"><%=percent %>  </td>

</tr>

</table>
</div>

<center>
<div style="font-size:26px;"  width="70%" align="center" >
<br> <br>
- Ihr Ergebnis in dieser Figurerkennungsaufgabe liegt <b> im
  <%=category %>
  Leistungsbereich</b>.
<br><br>
- Das Ergebnis von circa <%=percent%> der<b> Studierenden (N = 153) zwischen 19 und 28 Jahren</b> liegt unter Ihrem Ergebnis.
<br><br>
- Ihre Konzentrationsleistung, d.h. Ihr Tempo und Ihre Genauigkeit des konzentrierten Arbeitens, sind <b> <%=category %></b>.
</div>
</center>
<form  action="result_1Adetailed.jsp" method="post">
<center> <br><br><br><br>
<button style="font-size: 20px" name="submit" type="submit">  &nbsp; Weiter  &nbsp;</button>
</center>

</form>
</body>
</html>