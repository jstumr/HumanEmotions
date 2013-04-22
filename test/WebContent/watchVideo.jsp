<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="styles.css" />
<title>Watch Video</title>
<script langauge="text/javascript">
			
            var num = 1;
            var totalImg = 17
			window.setInterval("refreshDiv()", 4000);
            
            function refreshDiv(){  
            	
            	if(num < totalImg){
            		num++;
            		document.getElementById("bilder").setAttribute('src', "images/videoImages/"+num+".bmp");
            	}
            	else {
            		document.location= "theEnd.jsp";
            	}
            	
            }  
</script>  
</head>
<body bgcolor="#C0C0C0">
<form id="userForm" method="post" action="theEnd.jsp">
<center>
<h1> <br/> <br/><br/> </h1>


<img alt="Danke!" id="bilder" src="images/videoImages/1.bmp">
<!-- <br> <br>
<button style="font-size: 20px" name="submit" type="submit">  &nbsp; Weiter  &nbsp;</button> -->
</center>
</form>
</body>
</html>

