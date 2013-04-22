<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="styles.css" />
<title>Teil:1 - Persoenliche Daten</title>

<script type="text/javascript"> 
	function validateForm()
	{
		var age = document.getElementById('age').value ;
    	//alert( age);
  
    	if(	isNaN(age)||age<1||age>100)
        {
            alert("Bitte geben Sie eine korrekte Zahl für Ihr Alter ein");
            flag = 1;
            return false;
        }
    
    	var semester = document.getElementById('semester').value ;
    	if(	isNaN(semester)||semester<1||semester>100)
        {
    		alert("Bitte geben Sie eine korrekte Zahl für Ihr Semester ein");
    		return false;
        }
    	
    	
    	return true;
    	
	}
</script>
</head>
<body bgcolor="#C0C0C0">
<form id="userForm" method="post" action="SaveUserDetails" onsubmit="return validateForm();">
<p width="90%" class="bigFont" >
Abschließend möchten wir Sie noch  um Information zu Ihrer Person bitten. 
Wir weisen erneut darauf hin, dass alle Ihre Angaben nur im Rahmen unserer 
<br> wissenschaftlichen Studie streng vertraulich und anonym behandelt werden.
</p> <br>

<table cellpadding="10" cellspacing="0" border="0" width="70%" >
<tr class="bigFont"> 
<td class="numColumn" >1. </td>
<td class="userdataQTable"> Mein Alter</td>
<td > <input type="text" name="age" id="age" size=2 >Jahr(e) </td>
</tr>

<tr class="bigFont" > 
<td class="numColumn" >2. </td>
<td class="userdataQTable">Ich bin </td>
<td > <input type="radio" name="gender" value="F">Weiblich <br/>
	<input type="radio" name="gender" value="M">Männlich
 </td>
</tr>

<tr class="bigFont" > 
<td class="numColumn" >3. </td>
<td class="userdataQTable"> Welches ist Ihr Studiengang? </td>
<td  ><input type="text" name="studium" size=100 class="userdataAnswerBox"> </td>
</tr>

<tr  class="bigFont" > 
<td class="numColumn" >4. </td>
<td class="userdataQTable"> Im welchem Semester sind Sie? </td>
<td ><input type="text" name="semester" id="semester" size=2> </td>
</tr>

<tr class="bigFont"  > 
<td class="numColumn" >5. </td>
<td class="userdataQTable"> Was ist Ihr Geburtsland? </td>
<td> <input type="text" name="birthland" size=50 class="userdataAnswerBox"></td>
</tr>

<tr class="bigFont"  > 
<td class="numColumn" >6. </td>
<td class="userdataQTable"> Was ist Ihre Nationalität (falls abweichend von Geburtsland)?</td>
<td ><input type="text" name="nation" size=50 class="userdataAnswerBox"> </td>
</tr>

<tr  class="bigFont" > 
<td class="numColumn" >7. </td>
<td class="userdataQTable"> Ist Deutsch Ihre Muttersprache? </td>
<td><input type="radio" name="muttersprache" value="JA">Ja <br/>
	<input type="radio" name="muttersprache" value="NE">Nein
 </td>
</tr>

<tr class="bigFont"  > 
<td class="numColumn" >8. </td>
<td class="userdataQTable"> Wenn "nein", wie lange sprechen sie schon Deutsch?</td>
<td> <input type="text" name="ger_expr" id="ger_expr" size=2> Jahr(e)</td>
</tr>

</table>
<br>
<center>
<button style="font-size: 20px" name="submit" type="submit" >  &nbsp; Weiter  &nbsp;</button>
</center>
</form>
</body>
</html>