<%@ page language="java" contentType="text/html; charset=GB2312" import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="myweb.Test"  %>    <% //����Test.java���� %>
<%!
    String CheckLogin(String Login1,String Password1) throws Exception{
	 /*nullΪ��ֵ����˼*/
	Connection con = null;  //����
	Statement stmt = null;  //���ȡ����й�	
	ResultSet rs = null;    //���ݽ������ȡ��
	String result = null;
	String Login=Login1.trim();
	String Password=Password1.trim();
	try{
		String dbpath = "C:/JSPdemo/db.mdb"; //db·�������ݿ�·�������ص�)
		String dbname = ""; //db����
		String user = "";
		String url ="jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ="+dbpath; //������**�ؼ�**��
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con = DriverManager.getConnection(url);
		stmt =con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		String strSQL = "SELECT * FROM Login WHERE XM= '" + Login + "'";
		rs = stmt.executeQuery(strSQL);//ִ��SQL��䣬�����˺Ų�ѯ
		
		//����α��Ƿ�ָ�����һ����¼
		if(!rs.next()) result = "�޴��˺�";//��ָ�����һ����¼���ʾû�м�¼
		
		//�ж������Ƿ���ȷ
		else if (!rs.getString("PW").equals(Password)) result = "�������";
		//ͨ������ʾ�˺����������ȷ�ɹ�����
		else result = "�ɹ�����";
	}catch(Exception ex){throw ex;
	}finally{
		rs.close();
		stmt.close();
		con.close();
	}
	return result;
}
%>
<%
    String UserNm = request.getParameter("UserNm");//ȡ�ñ�������˺�
    String UserPasswd = request.getParameter("UserPasswd");//ȡ�ñ����������
    
    //�ж�ʹ�����˺���������ȡ��ֵ�Ƿ�Ϊnull��������ҳ����LogFrm.htm����ֹ������
    if(UserNm == null || UserPasswd == null) response.sendRedirect("LogFrm.htm");
   // String strCheckLogin = CheckLogin(UserNm,UserPasswd);//ԭ����//�����˺�������ļ��
    
    Test t=new Test();
    String strCheckLogin = t.CheckLogin(UserNm, UserPasswd);//�ַ���//�����ʺ�������ļ�� 
    
    //�ж��Ƿ�ɹ�����
    if (strCheckLogin.equals("�ɹ�����")){
    	session.setAttribute("UserNm",UserNm);//�������˺Ŵ����session��
    	session.setAttribute("UserPasswd",UserPasswd);//���˺����봢���session��
    	response.sendRedirect("LoginSuccess.jsp");//����ʾ��ҳ����LoginSuccess.jsp��ҳ
    }
%>
<!-- ����¼ʧ��ʱ�Ż�ִ������������ -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>�û���¼</title>
</head>
<body>
<center>
<font size=5 color= blue> ʹ���ߵ�¼</font>
</center>
<hr>
<center>
      <%=strCheckLogin %>
      <p></p>
      <a href = "LogFrm.htm">�����µ�¼</a>
</center>
</body>
</html>