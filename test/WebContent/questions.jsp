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
<title>Teil:1 - Questions</title>
</head>
<body bgcolor="#C0C0C0">
<%-- <p style=" font-size: 12px;">Test Type: <%= session.getAttribute("testType") %></p> --%>
<center>
<%
	int startQuesNo = Integer.parseInt(session.getAttribute("startQuesNo").toString());
	System.out.println("startQuesNo -- "+startQuesNo);
%>

<br> <br>	


<form action="SaveTeil1Data" method="post">
<table cellpadding="2" cellspacing="0" border="0" width="80%">
<thead style="background-color: #006699; font-size: 12px; color: white;">
	<tr> <td width="5%" > </td> <td style=" font-size: 12px;" align="left"> </td>
	 <td width="6%" style=" font-size: 12px;">Stimme über<br>haupt nicht zu</td> 
	 <td width="6%"> </td>
	 <td width="6%"> </td>
	 <td width="6%"> </td>
	 <td width="6%"> </td>
	 <td width="6%"> </td>
	 <td width="6%" style=" font-size: 12px;">stimme voll und ganz zu </td> </tr>
</thead>


<%
int quesPerPage = 11;	
int quesNo =1;
	ArrayList questions = (ArrayList)session.getAttribute("questions");
	Object[] quesBeans =  questions.toArray();
	//Iterator ques_itr = questions.iterator();
	while (quesBeans.length > startQuesNo && quesNo <= quesPerPage)
	{
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
	<td align="center"><input type="radio" name="<%=qb.getQuesId()%>" value="6"/></td>
	<td align="center"><input type="radio" name="<%=qb.getQuesId()%>" value="7"/></td>
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
	<td align="center"><input type="radio" name="<%=qb.getQuesId()%>" value="6"/></td>
	<td align="center"><input type="radio" name="<%=qb.getQuesId()%>" value="7"/></td>
</tr>
<%
		}	
	quesNo ++;
	startQuesNo++;
	}
	
	session.setAttribute("startQuesNo", startQuesNo);
%>

</table><br>  <br> 
<button style="font-size: 20px" name="submit" type="submit">  &nbsp; Weiter  &nbsp;</button>
</form>
</center>
</body>
</html>