<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.ArrayList"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="styles.css" />
<title>Teil 2 - Hauptdurchgänge</title>
<%
	String directoryPath = "images/main_task";
	int currentImg = Integer.parseInt(session.getAttribute("currentImg").toString());
	System.out.println("maintaskquestions.jsp currentImg -- "+ currentImg);
	ArrayList questions = (ArrayList)session.getAttribute("imgPath_teil2");
	Object[] imgPaths =  questions.toArray();
	
	String finalPath = directoryPath + "/" + imgPaths[currentImg]; // image path from database
	System.out.println("maintaskquestions.jsp : finalPath -- "+ finalPath);
	
	Date today = new java.util.Date();
    System.out.println("maintaskquestions.jsp TIMESTAMP .. " + new java.sql.Timestamp(today.getTime()));
    System.out.println("maintaskquestions.jsp teil2StartTime " + session.getAttribute("teil2StartTime"));
    if( session.getAttribute("teil2StartTime") == null)
    {
    	 session.setAttribute("teil2StartTime", new java.sql.Timestamp(today.getTime()));
    }
   
%>

<script langauge="text/javascript"> 

		var flag = 0;
            window.setInterval("refreshDiv()", 1000); 
            function refreshDiv(){  
            	
            	if(flag == 0)
            	{ 
            		document.getElementById('divImg').setAttribute('src', "<%=finalPath%>");
            		flag = 1;
            	}
                
            }  
            
             
            window.setInterval("refreshQuesDiv()", 4500);  
            function refreshQuesDiv(){  
            	
            	var temp = "<br> <br> <p>  Bitte geben Sie die Anzahl hier ein </p> "
                 	+ "<input id= \"number\" type=\"text\" name=\"number\" onkeyup=\"validate()\" size=3 style=\"font-size: 25px\"> " 
                 	+ "<br> <br> <button style=\"font-size: 20px\" name=\"submit\"  id=\"submit\" disabled=\"disabled\"  "
                 	+ " type=\"submit\"> &nbsp; Weiter  &nbsp;</button>";
                 	        
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
            	
            	
            	if(	isNaN(textNum)||textNum<0||textNum>1000)
                {
                    //alert("Invalid Number");
                    document.getElementById('number').value = input;
                    if ( input.length > 0)
                	{
                		document.getElementById("submit").disabled = false;
                	}
                    else{
                    	document.getElementById("submit").disabled = true;
                    }
                    
                }
            	else {
            		input = textNum;
            		document.getElementById("submit").disabled = false;
            		
            	}
            	
            	/* if ( textNum.length > 0)
            	{
            		document.getElementById("submit").disabled = false;
            	}
            	else
            	{
            		document.getElementById("submit").disabled = true;
            	} */
            }
            
            function validateEnter(event)
            {
            	
            	var textNum = document.getElementById('number').value ;
            	textNum = textNum.replace(/^\s+|\s+$/g, '');
            	
            	var key = 0;
            	
            	if(window.event)
            	{
            		key = window.event.keyCode; //IE
            		
            	}
            	 else {
            		 key = event.which; //firefox 
            	 }
                    
            		if(key == 13)
            		{
            			if ( textNum.length > 0)
                    	{
                    		 document.getElementById("submit").disabled = false;
                    		return true; 
                    	}
                    	else
                    	{
                    		return false;
                    	}
            		}
            		else
            		{
            			if(	isNaN(textNum)||textNum<0||textNum>1000)
                        {
                            //alert("Invalid Number");
                            document.getElementById('number').value = input;
                            if ( input.length > 0)
                        	{
                        		document.getElementById("submit").disabled = false;
                        	}
                            else{
                            	document.getElementById("submit").disabled = true;
                            }
                            
                        }
                    	else {
                    		input = textNum;
                    		document.getElementById("submit").disabled = false;
                    		
                    	}
                    	
            		}
            	
                    
                   

               return true;
                    
            	/* if (event.keyCode == 13) 
            	{
            		alert("event.keyCode == 13");  
            		if(IDBrowser != "IE" && event.which == 13) 
            			{
            			event.preventDefault();
            			}
                	else if (IDBrowser == "IE" && window.event.keyCode == 13)
                	{
                		event.preventDefault();
                		return false;
                	} 
            	}
            	 */
            	
            	
            	
            	
            }
</script>

</head>



<body bgcolor="#C0C0C0" >

<form action="SaveTeil2Data" method="post" onkeypress="return validateEnter(event);" >
<%
	System.out.println("maintaskquestions.jsp : " + session.getAttribute("testType"));

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