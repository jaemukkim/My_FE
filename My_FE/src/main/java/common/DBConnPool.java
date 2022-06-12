package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnPool {
	
	public  Connection con;
	public  Statement stmt;
	public  PreparedStatement psmt;
	public  ResultSet rs; 
	
	//�⺻ ������ 
	public DBConnPool() {
		
        try {
            // JDBC ����̹� �ε�
            Class.forName("oracle.jdbc.OracleDriver");

            // DB�� ����
            String url = "jdbc:oracle:thin:@localhost:1521:xe";  
            String id = "hr2";
            String pwd = "1234"; 
            con = DriverManager.getConnection(url, id, pwd); 

            System.out.println("DB ���� ����(�⺻ ������)");
        }
        catch (Exception e) {            
            e.printStackTrace();
        }
	}
	
	
	//�ڿ� ���� ����  (�ڿ� �ݳ�) : close() �޼ҵ� ȣ��� �ڿ��� �ݳ��ϵ��� ���� 
    public  void close() {
        try {            
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (psmt != null) psmt.close();
            if (con != null) con.close();  // �ڵ����� Ŀ�ؼ� Ǯ�� �ݳ���

            System.out.println("DB Ŀ�ؼ� Ǯ �ڿ� �ݳ�");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
	
	

}
