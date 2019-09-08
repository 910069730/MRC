<%@ page language="java" contentType="text/html; charset=GB2312" import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="myweb.Test"  %>    <% //调用Test.java函数 %>
<%!
    String CheckLogin(String Login1,String Password1) throws Exception{
	 /*null为空值的意思*/
	Connection con = null;  //连接
	Statement stmt = null;  //与获取结果有关	
	ResultSet rs = null;    //数据结果（获取）
	String result = null;
	String Login=Login1.trim();
	String Password=Password1.trim();
	try{
		String dbpath = "C:/JSPdemo/db.mdb"; //db路径（数据库路径）（重点)
		String dbname = ""; //db名称
		String user = "";
		String url ="jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ="+dbpath; //驱动（**关键**）
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		con = DriverManager.getConnection(url);
		stmt =con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		String strSQL = "SELECT * FROM Login WHERE XM= '" + Login + "'";
		rs = stmt.executeQuery(strSQL);//执行SQL语句，进行账号查询
		
		//检查游标是否指到最后一条记录
		if(!rs.next()) result = "无此账号";//若指向最后一条记录则表示没有记录
		
		//判断密码是否正确
		else if (!rs.getString("PW").equals(Password)) result = "密码错误";
		//通过检查表示账号与密码均正确成功登入
		else result = "成功登入";
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
    String UserNm = request.getParameter("UserNm");//取得表单输入的账号
    String UserPasswd = request.getParameter("UserPasswd");//取得表单输入的密码
    
    //判断使用者账号与密码所取得值是否为null，是则将网页导向LogFrm.htm（防止盗链）
    if(UserNm == null || UserPasswd == null) response.sendRedirect("LogFrm.htm");
   // String strCheckLogin = CheckLogin(UserNm,UserPasswd);//原方法//进行账号与密码的检查
    
    Test t=new Test();
    String strCheckLogin = t.CheckLogin(UserNm, UserPasswd);//现方法//进行帐号与密码的检查 
    
    //判断是否成功登入
    if (strCheckLogin.equals("成功登入")){
    	session.setAttribute("UserNm",UserNm);//将登入账号储存进session中
    	session.setAttribute("UserPasswd",UserPasswd);//将账号密码储存进session中
    	response.sendRedirect("LoginSuccess.jsp");//将显示网页导向LoginSuccess.jsp网页
    }
%>
<!-- 若登录失败时才会执行至下面的语句 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
</head>
<body>
<center>
<font size=5 color= blue> 使用者登录</font>
</center>
<hr>
<center>
      <%=strCheckLogin %>
      <p></p>
      <a href = "LogFrm.htm">请重新登录</a>
</center>
</body>
</html>