package myweb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.*;

public class Test {
    public String CheckLogin(String Login1,String Password1) throws Exception{
    	Connection con = null;
    	Statement stmt = null;
    	ResultSet rs = null;
    	String result = null;
    	String Login=Login1.trim();
    	String Password=Password1.trim();
    	try{
    		String dbpath = "C:/JSPdemo/db.mdb";
    		String url = "jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ="+dbpath;
    		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
    		con = DriverManager.getConnection(url);
    		stmt =con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
    		String strSQL = "SELECT * FROM Login WHERE XM= '" + Login + "'";
    		rs = stmt.executeQuery(strSQL); //执行SQL语句，进行帐号查询
    		//检查油标是否指到最后一条记录
    		if(!rs.next()) result ="无此帐号"; //若指向最后一条记录则表示没有记录
    		//判断密码是否正确
    		else if(!rs.getString("PW").equals(Password)) result ="密码错误";
    		//通过检查表示帐号与密码均正确成功登入
    		else result = "成功登入";	
    	}catch(Exception ex){throw ex;
    	}finally{
    		rs.close();
    		stmt.close();
    		con.close();
    	}
    	return result;
    }
    
	public Test() throws Exception{
		System.out.println(CheckLogin("admin","123"));
		// TODO Auto-generated constructor stub
	}

	public static void main(String[] args) throws Exception {
		 new Test();

	}
	//成绩录入
public boolean insert(String number,String name,String m,String e,String p,String j,String cl){
Connection con=null;
Statement sql=null;
ResultSet rs=null;
int num=0;
try{String dbpath = "C:/JSPdemo/db.mdb";
String url = "jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ="+dbpath;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con = DriverManager.getConnection(url);
sql =con.createStatement();
String condition="INSERT INTO student VALUES"+
       "("+"'"+number+"','"+name+"','"+m+"','"+e+"','"+p+"','"+j+"','"+cl+"')";
System.out.println(condition);
num=sql.executeUpdate(condition);//执行添加操作
con.close();
}catch(Exception event){}
if (num>0) return true ;
else return false;
}
 
 //查询是否有学号是number的学生
 public boolean query1(String number){
	 Connection con=null;
	 Statement sql=null;
		ResultSet rs=null;
		try{
			String dbpath = "c:/JSPdemo/db.mdb";
			String url = "jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ="+dbpath;
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con = DriverManager.getConnection(url);
			sql =con.createStatement();
			String condition="SELECT * FROM student where number ="+"'"+number+"'";
			rs=sql.executeQuery(condition);
			int num=0;
			while(rs.next()) num++ ;
			con.close();
			if(num>0) return true;
			else return false;
		}catch(Exception e) {return false;}
 }
 //成绩修改
 public String update(String number,float newMath,float newEnglish,float newPhysics,float newJava){
	 if(query1(number)){
		 Connection con=null;
		 Statement sql=null;
		 ResultSet rs=null;
		 try{
				String dbpath = "c:/JSPdemo/db.mdb";
				String url = "jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ="+dbpath;
				Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
				con = DriverManager.getConnection(url);
				sql =con.createStatement();
				String condition1="UPDATE student SET math = "+newMath+"WHERE number ="+"'"+number+"'";
				String condition2="UPDATE student SET english = "+newEnglish+"WHERE number ="+"'"+number+"'";
				String condition3="UPDATE student SET phics = "+newPhysics+"WHERE number ="+"'"+number+"'";
				String condition4="UPDATE student SET java = "+newJava+"WHERE number ="+"'"+number+"'";
	           //执行更新操作
				sql.executeUpdate(condition1);
				sql.executeUpdate(condition2);
				sql.executeUpdate(condition3);
				sql.executeUpdate(condition4);
				con.close();
				return "修改成功";
		 }catch(Exception e){return "修改失败";}
	 }else{return "没有这个学号";}
 }
	//成绩删除
    public String del(String number){
    	if(query1(number)){
    		Connection con=null;
    		Statement sql=null;
    		ResultSet rs=null;
    		try{
    			String dbpath = "c:/JSPdemo/db.mdb";
    			String url = "jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ="+dbpath;
    			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
    			con = DriverManager.getConnection(url);
    			sql =con.createStatement();
    			//删除操作
    			String deleteALL="DELETE FROM student WHERE number"+"="+"'"+number+"'";
    			sql.executeUpdate(deleteALL);
    			con.close();
    			return "删除成功";
    	}catch(Exception e){return "删除失败";}
    }else return "没有这个学号";
    	}
 
	//查询
	public ResultSet query(String number){
		Connection con=null;
		Statement sql=null;
		ResultSet rs=null;
		try{
			String dbpath = "c:/JSPdemo/db.mdb";
			String url = "jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ="+dbpath;
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			con = DriverManager.getConnection(url);
			sql =con.createStatement();
			String condition="SELECT * FROM student where number LIKE"+"'"+number+"'";
			System.out.println(condition);
			rs=sql.executeQuery(condition);
			return rs ;
		}catch(Exception e){return rs;}
		

		}
	
}

