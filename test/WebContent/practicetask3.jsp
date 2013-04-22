<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="styles.css" />
<title>Teil 2 - Übungsdurchgänge 1</title>


<script langauge="text/javascript"> 
		
		var flag = 0;
            window.setInterval("refreshDiv()", 1000);  
            function refreshDiv(){  
            	//document.getElementById("divImg"). ="";
            	if(flag == 0)
            	{ 
            		document.getElementById('divImg').setAttribute('src', "images/practice_task/practice3.jpg");
            		flag = 1;
            	}
                
            }  
            
            var temp = "<br> <br> <p>  Bitte geben Sie die Anzahl hier ein </p> "
             	+ "<input id= \"number\" type=\"text\" name=\"number\" onkeyup=\"validate()\" size=3 style=\"font-size: 25px\"> " 
             	+ "<br> <br> <button style=\"font-size: 20px\" name=\"submit\"  id=\"submit\" disabled=\"disabled\"  "
             	+ " type=\"submit\"> &nbsp; Weiter  &nbsp;</button>";
             	
            window.setInterval("refreshQuesDiv()", 4500);  
            function refreshQuesDiv(){  
            	if(flag == 1)
            	{ 
            		document.getElementById('divImg').setAttribute('src', "");
                	document.getElementById('divImg').style.visibility = 'hidden'; 
                 	 document.getElementById('divQue').innerHTML = temp;  
            		flag = 2;
            		document.getElementById('number').focus();
            	}
            	
            } 
            
            function validate()
            {
            	var textNum = document.getElementById('number').value ;
            	textNum = textNum.replace(/^\s+|\s+$/g, '');
            	if ( textNum.length > 0)
            	{
            		document.getElementById("submit").disabled = false;
            	}
            	else
            	{
            		document.getElementById("submit").disabled = true;
            	}
            }
</script>

</head>
<body bgcolor="#C0C0C0">
<form action="maintaskIntro.jsp" method="post">
<%
	System.out.println("practicetask3.jsp : " + session.getAttribute("testType")
		+ " parametres: " + request.getParameter("number")		);

%>
<center>
<table width="90%" align="center">
<tr align="center"> <td class="heading"> <br> <br> <br>
<img id= "divImg" src="images/cross.jpg">
<div id="divQue"> </div>
</td> </tr>

<!-- <tr> <td> <br> <br> <button style="font-size: 20px" name="submit" type="submit">  &nbsp; Weiter  &nbsp;</button>  </td> </tr> -->
</table>
</center>
 
</form>
</body>
</html>