<%@ page language="java" contentType="text/html; charset=GB2312"%>
<%
    //����û��Ƿ��Ѿ���ɵ�¼  
    String Name =(String)session.getAttribute("UserNm");
    
    //��Name����Ϊnull������δ��ɵ�¼
    if(Name==null)
    	response.sendRedirect("LogFrm.htm");//�����������LogFrm.htm�ļ���Ҫ���û����µ�¼
    	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta charset="UTF-8">
<head>
<title>�ɼ�����</title>
</head>
<body>
<center>
        <font size=5 color=blue ><b>�ɼ�����</b></font>
        <hr><h2><font size=3 color=yellow >����Ա��<%=Name %></font></h2><p></p>
        <table>
             <tr align=left>
                <td width=78><a href ="append_1.jsp">�ɼ�¼��</a></td>
                <td width=78><a href ="update_1.jsp">�ɼ��޸�</a></td>
                <td width=78><a href ="query_1.jsp">�ɼ���ѯ</a></td>
                <td width=78><a href ="del_1.jsp">ɾ����¼</a></td>
             </tr>
        </table><br>
</center>
</body>
</html>