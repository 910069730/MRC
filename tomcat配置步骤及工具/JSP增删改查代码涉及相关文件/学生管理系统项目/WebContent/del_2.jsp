<%@ page language="java" contentType="text/html; charset=gb2312"%>
<%@ page import="java.sql.*" %>
<%@ page import="myweb.Test" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
   <%//��ȡ�ύ��ѧ��
     String number=new String(request.getParameter("number").getBytes("iso-8859-1"),"utf-8");
     number=number.trim();
     if(number==null) number="";
     Test t=new Test();
     if(t.del(number).equals("ɾ���ɹ�")) session.setAttribute("del","ɾ���ɹ�");
     else if(t.del(number).equals("ɾ��ʧ��"))session.setAttribute("del","ɾ��ʧ��");
     else session.setAttribute("del","û�����ѧ��");
     response.sendRedirect("del_1.jsp");
     
   %>
</body>
</html>