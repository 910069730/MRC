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
    		rs = stmt.executeQuery(strSQL); //ִ��SQL��䣬�����ʺŲ�ѯ
    		//����ͱ��Ƿ�ָ�����һ����¼
    		if(!rs.next()) result ="�޴��ʺ�"; //��ָ�����һ����¼���ʾû�м�¼
    		//�ж������Ƿ���ȷ
    		else if(!rs.getString("PW").equals(Password)) result ="�������";
    		//ͨ������ʾ�ʺ����������ȷ�ɹ�����
    		else result = "�ɹ�����";	
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
	//�ɼ�¼��
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
num=sql.executeUpdate(condition);//ִ����Ӳ���
con.close();
}catch(Exception event){}
if (num>0) return true ;
else return false;
}
 
 //��ѯ�Ƿ���ѧ����number��ѧ��
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
 //�ɼ��޸�
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
	           //ִ�и��²���
				sql.executeUpdate(condition1);
				sql.executeUpdate(condition2);
				sql.executeUpdate(condition3);
				sql.executeUpdate(condition4);
				con.close();
				return "�޸ĳɹ�";
		 }catch(Exception e){return "�޸�ʧ��";}
	 }else{return "û�����ѧ��";}
 }
	//�ɼ�ɾ��
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
    			//ɾ������
    			String deleteALL="DELETE FROM student WHERE number"+"="+"'"+number+"'";
    			sql.executeUpdate(deleteALL);
    			con.close();
    			return "ɾ���ɹ�";
    	}catch(Exception e){return "ɾ��ʧ��";}
    }else return "û�����ѧ��";
    	}
 
	//��ѯ
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

