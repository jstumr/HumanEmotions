<%@page import="uni.project.data.QuestionBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="styles.css" />
<title>Feedback 2</title>
</head>
<body bgcolor="#C0C0C0">
<%-- <p style=" font-size: 12px;">Test Type: <%= session.getAttribute("testType") %></p> --%>
<center>
<%
	int startQuesNo = Integer.parseInt(session.getAttribute("startQuesNo").toString());
	System.out.println("startQuesNo -- "+startQuesNo);
	if(startQuesNo == 0)
	{
%>
<table width="80%" align="center">
<tr align="left"> <td style=" font-size: 22px; padding-top:10px; padding-bottom:15px;"> 
<p> Vielen Dank! Nun folgen einige Fragen, die sich auf die Figurerkennungsaufgabe beziehen. <br>
<br> Bitte lesen Sie die folgenden Aussagen aufmerksam durch und beantworten Sie diese sorgfältig und ehrlich.  
Stufen Sie Ihre Antworten von <b> "trifft überhaupt nicht zu" bis "trifft voll und ganz zu" </b>ab.
</p>
</td> </tr>
</table>

<%
	}
%>

<form action="SaveFeedback2" method="post">
<table cellpadding="2" cellspacing="0" border="0" width="80%">
<thead style="background-color: #006699; font-size: 14px; color: white;">
	<tr> <td width="5%" > </td> <td style=" font-size: 12px;" align="left"> </td>
	 <td width="5%" style=" font-size: 12px;">trifft über<br>haupt nicht zu</td> 
	 <td width="5%"> </td>
	 <td width="5%"> </td>
	 <td width="5%"> </td>
	 <td width="5%"> </td>
	 <td width="5%"> </td>
	 <td width="5%" style=" font-size: 12px;">trifft voll und ganz zu </td> </tr>
</thead>

<%
int quesPerPage = 10;	
int quesNo =1;
	ArrayList questions = (ArrayList)session.getAttribute("feedback2_ques");
	Object[] quesBeans =  questions.toArray();
	//Iterator ques_itr = questions.iterator();
	while (quesBeans.length > startQuesNo && quesNo <= quesPerPage)
	{
		System.out.println("in while .. startQuesNo -- "+startQuesNo);
		QuestionBean qb = (QuestionBean) quesBeans[startQuesNo];
		
		if( quesNo % 2 == 0)
		{
%>
	<tr style="background-color: #E1EEF4; ">
	<td style=" font-size: 20px; padding-top:12px; padding-bottom:12px;"><%=startQuesNo+1%> </td>
	<td align="left" style=" font-size: 20px;" > <%=qb.getQues() %> </td>
	<td align="center"><input type="radio" name="<%=qb.getQuesId()%>" value="1"></td> 
	<td align="center"><input type="radio" name="<%=qb.getQuesId()%>" value="2"></td>
	<td align="center"><input type="radio" name="<%=qb.getQuesId()%>" value="3"></td>
	<td align="center"><input type="radio" name="<%=qb.getQuesId()%>" value="4"></td>
	<td align="center"><input type="radio" name="<%=qb.getQuesId()%>" value="5"></td>
	<td align="center"><input type="radio" name="<%=qb.getQuesId()%>" value="6"></td>
	<td align="center"><input type="radio" name="<%=qb.getQuesId()%>" value="7"></td>
</tr>
<%		} 
		else
		{
%>

<tr style="background-color: #FFFFFF;" >
	<td style=" font-size: 20px; padding-top:12px; padding-bottom:12px;"><%=startQuesNo+1%> </td>
	<td align="left" style=" font-size: 20px;"> <%=qb.getQues() %> </td>
	<td align="center"><input type="radio" name="<%=qb.getQuesId()%>" value="1"></td> 
	<td align="center"><input type="radio" name="<%=qb.getQuesId()%>" value="2"></td>
	<td align="center"><input type="radio" name="<%=qb.getQuesId()%>" value="3"></td>
	<td align="center"><input type="radio" name="<%=qb.getQuesId()%>" value="4"></td>
	<td align="center"><input type="radio" name="<%=qb.getQuesId()%>" value="5"></td>
	<td align="center"><input type="radio" name="<%=qb.getQuesId()%>" value="6"></td>
	<td align="center"><input type="radio" name="<%=qb.getQuesId()%>" value="7"></td>
</tr>
<%
		}	
	quesNo ++;
	startQuesNo++;
	}
	
	session.setAttribute("startQuesNo", startQuesNo);
%>

</table><br>
<button style="font-size: 20px" name="submit" type="submit">  &nbsp; Weiter  &nbsp;</button>
</form>
</center>
</body>
</html>