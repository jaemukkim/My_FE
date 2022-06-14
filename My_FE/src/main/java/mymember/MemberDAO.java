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
				System.out.println ("암호화 되지 않은 패스워드 : " + orgPass); 
				
						
				String sql = "insert into mymember values (?, ?, ?, ?, ?, ?) "; 
				
				psmt = con.prepareStatement(sql) ; 
				psmt.setString(1, Member.getId());
				psmt.setString(2, Member.getPassword());	
				psmt.setString(3, Member.getName());
				psmt.setString(4, Member.getAddress());
				psmt.setTimestamp(5, Member.getReg_date()); 
				psmt.setString(6, Member.getPhone());
				
				psmt.executeUpdate(); 
				
				System.out.println("회원정보 DB 입력 성공 ");		
				
			}catch (Exception e) {
				e.printStackTrace();
				System.out.println("회원 정보 DB 입력시 예외 발생"); 
			}finally {
//				instance.close(); 
			}				
		}	
		
		public int userCheck(String id, String password) {
			int x = -1; 			
			
			try {				
				String orgPass = password;
				
				String sql = "select password from mymember where id = ? ";
				psmt = con.prepareStatement(sql);
				psmt.setString(1, id);   
				rs = psmt.executeQuery(); 
				
				if (rs.next()) {     
					String dbpassword = rs.getString("password");
					if (orgPass.equals(dbpassword)) {
						x= 1;  
					}else {
						x= 0;    
					}					
				}			
				
			}catch (Exception e) {
				e.printStackTrace();
				System.out.println("아이디와 패스워드 인증 실패 했습니다.");
			}finally {
//				instance.close(); 	
			}
				
			return x; 		
		}
		
		//아이디 중복 체크
		public int confirmId (String id) {
			int x = -1 ;   
			
			try {
				String sql = "select id from mymember where id = ?" ; 
				psmt = con.prepareStatement(sql);
				
				System.out.println(sql);
				
				psmt.setString (1,id); 
				rs = psmt.executeQuery();
				
				if ( rs.next()) { 					
					System.out.println(id + " 는 존재 하는 ID 입니다. ");					
					 x= 1; 
				} else {  
					System.out.println(id + " 는 DB에 존재하지 않는 ID 입니다. ");
					 x= -1 ; 
				}
						
			}catch (Exception e) {
				e.printStackTrace();
				System.out.println(" ID 중복 체크중 예외 발생");
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
				System.out.println("회원 정보 읽어 오는 중 예외 발생");
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
				
				if (rs.next()) {	// 해당 아이디가 DB에 존재한다.
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
				System.out.println("회원 정보 수정시 예외 발생");
			}finally {
//				instance.close();
			}
						
			return x; 				 
		}
		
		public int deleteMember(String id, String password) {
			int x = -1; 
						
			try {
				
				String orgPass = password; 
				
				String sql = "select password from mymember where id = ?"; 
				psmt = con.prepareStatement(sql); 
				psmt.setString(1, id);
				rs = psmt.executeQuery(); 
				
				if (rs.next()) {  
					String dbpassword = rs.getString("password"); 

					if (orgPass.equals(dbpassword)) {
					sql = "delete mymember where id = ?"; 
						
						psmt = con.prepareStatement(sql); 
						psmt.setString(1, id);
						psmt.executeUpdate(); 
						x = 1;     								
					}		
				}
						
			}catch (Exception e) {
				e.printStackTrace();
				System.out.println("회원 탈퇴시 예외가 발생 했습니다");
			} finally {
//				instance.close();
			}
			
			return x; 			
		}
		

		
}
