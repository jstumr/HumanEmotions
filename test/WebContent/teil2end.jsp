<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="styles.css" />
<title>Teil:2 - Ende</title>
<script langauge="text/javascript">   
            window.setInterval("refreshDiv()", 5000);  
            function refreshDiv(){  
            	document.getElementById("msg").innerHTML ="";
              document.getElementById("msg").innerHTML = " <p id=\"msg\" class=\"bigFont\">" +
              
              " <br/> <b> Bitte haben Sie etwas Geduld. Es kann einige Sekunden dauern, " +
              " bis das Ergebnis berechnet wird ......." + "<br/> <br/> Zur besseren Einordnung Ihres Ergebnisses wird die Leistung einer Vergleichsstichprobe herangezogen. </b>  ";  
            }  
</script>  
</head>
<body bgcolor="#C0C0C0">
<form id="userForm" method="post" action="">
<center>

<%
String testType = session.getAttribute("testType").toString();
if(testType.equals("A") || testType.equals("B"))
{
	response.setHeader("Refresh", "35;url=result.jsp"); 

}
else
{
	response.setHeader("Refresh", "35;url=result_1B.jsp");
}

%>
<br/> <br/> <br/> <br/>
<table width="70%">
<div id="msg">
<p class="thanks"> <b>
<%
	if(testType.equals("A") || testType.equals("B"))
	{
		%>
		Herzlichen Dank! <br/> <br/>
		Ihre Zeit ist um!
		<%
	}
	else
	{
%>
		Herzlichen Dank!  

<%
	}

%>

</b>
</p></div>
</table>

<!-- <button style="font-size: 20px" name="submit" type="submit">  &nbsp; Weiter  &nbsp;</button> -->
</center>
</form>
</body>
</html>

