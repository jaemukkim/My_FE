package mymember;

import common.DBConnPool;

public class MemberDAO extends DBConnPool{
 
		private static MemberDAO instance = new MemberDAO();
		
		public static MemberDAO getInstance() {
			return instance; 
		}
		

		private MemberDAO () { super(); }; 
		
		
		public void insertMember (MemberDTO Member) {
			
			
			try {
				
				String orgPass = Member.getPassword(); 
				System.out.println ("��ȣȭ ���� ���� �н����� : " + orgPass); 
				
						
				String sql = "insert into mymember values (?, ?, ?, ?, ?, ?) "; 
				
				psmt = con.prepareStatement(sql) ; 
				psmt.setString(1, Member.getId());
				psmt.setString(2, Member.getPassword());	
				psmt.setString(3, Member.getName());
				psmt.setString(4, Member.getAddress());
				psmt.setTimestamp(5, Member.getReg_date()); 
				psmt.setString(6, Member.getPhone());
				
				psmt.executeUpdate(); 
				
				System.out.println("ȸ������ DB �Է� ���� ");		
				
			}catch (Exception e) {
				e.printStackTrace();
				System.out.println("ȸ�� ���� DB �Է½� ���� �߻�"); 
			}finally {
//				instance.close(); 
			}
				
		}
		
		
		public int userCheck(String id, String password) {
			int x = -1; 
			
			
			try {
				
				String orgPass = password;    //������ �Ѿ���� �н����� 
				
				String sql = "select password from mymember where id = ? "; 
				psmt = con.prepareStatement(sql);
				psmt.setString(1, id);   
				rs = psmt.executeQuery(); 
				
				if (rs.next()) {    //���̵� �����ϸ� 
					String dbpassword = rs.getString("password");     //DB���� ������ �н����� . 
					
					if (orgPass.equals(dbpassword)) {
						x=1;  // ������ �Ѱܿ� �н������ DB���� ������ �н����尡 ��ġ �Ҷ� x: 1 
					}else {
						x= 0;   // �н����尡 ��ġ���� ������ 
					}
					
					
				}			
				
			}catch (Exception e) {
				e.printStackTrace();
				System.out.println("���̵�� �н����� ���� ���� �߽��ϴ�.");
			}finally {
//				instance.close(); 	
			}
				
			return x; 		
		}
		
		//���̵� �ߺ� üũ (confirmId.jsp) 
		public int confirmId (String id) {
			int x = -1 ;   
			
			try {
				String sql = "select id from mymember where id = ?" ; 
				psmt = con.prepareStatement(sql);
				
				System.out.println(sql);
				
				psmt.setString (1,id); 
				rs = psmt.executeQuery();
				
				if ( rs.next()) {  // ���̵� DB �� �����ϴ� ���
					
					System.out.println(id + " �� ���� �ϴ� ID �Դϴ�. ");
					
					 x= 1; 
				} else {  //���̵� DB�� �������� �ʴ� ���
					System.out.println(id + " �� DB�� �������� �ʴ� ID �Դϴ�. ");
					 x= -1 ; 
				}
						
			}catch (Exception e) {
				e.printStackTrace();
				System.out.println(" ID �ߺ� üũ�� ���� �߻�");
			}finally {
			}	
			return x ; 
		}
		
		
		public MemberDTO getMember (String id, String password) {
			MemberDTO member = null ; 
				
			try {
				
				String orgPass = password; 
				
				
				String sql = "select * from mymember where id = ?"; 
				psmt = con.prepareStatement(sql); 
				psmt.setString(1, id);
				rs = psmt.executeQuery(); 
				
				if (rs.next() ) {  
					String dbpassword = rs.getString("password");  
					
					if ( orgPass.equals(dbpassword)) {
						
						member = new MemberDTO();    //
						
						member.setId(rs.getString("id"));
						member.setName(rs.getString("name"));
						member.setAddress(rs.getString("address"));
						member.setReg_date(rs.getTimestamp("reg_date"));
						member.setPhone(rs.getString("phone"));					
					} else { 
					}
					
				}
				
				
			}catch (Exception e) {
				e.printStackTrace();
				System.out.println("ȸ�� ���� �о� ���� �� ���� �߻�");
			}finally {
				
//				instance.close(); 
			}
		
			return member; 		
		}
		
		
		public int updateMember(MemberDTO member) {
			int x = -1 ; 
			
			
			try {
				String orgPass = member.getPassword(); 
				
				String sql = "select password from mymember where id = ?" ; 
				psmt = con.prepareStatement(sql); 
				psmt.setString(1, member.getId());
				rs = psmt.executeQuery();  
				
				if (rs.next()) {	// �ش� ���̵� DB�� �����Ѵ�.
					String dbpassword = rs.getString("password"); 
					if (orgPass.equals(dbpassword)) {
					
						       sql = "update mymember set name = ?, address = ?, phone= ? " ;  
							   sql += " where id = ?"; 
						psmt = con.prepareStatement(sql); 
						psmt.setString(1, member.getName());
						psmt.setString(2, member.getAddress());
						psmt.setString(3, member.getPhone());
						psmt.setString(4, member.getId());
						
						psmt.executeUpdate();
						x = 1; 	
					
					}else {
						x = 0;   
					}
								
				} else {	
				}
						
			}catch (Exception e) {
				e.printStackTrace();
				System.out.println("ȸ�� ���� ������ ���� �߻�");
			}finally {
//				instance.close();
			}
						
			return x; 				 
		}

		
}
