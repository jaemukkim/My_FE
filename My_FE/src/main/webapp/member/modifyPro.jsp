<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "mymember.MemberDAO" %>

<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="member" class="mymember.MemberDTO">
    <jsp:setProperty name="member" property="*" />
</jsp:useBean>

<%  
MemberDAO manager = MemberDAO.getInstance();
  //회원정보 수정 처리 메소드 호출 후 수정 상황값 반환
  int check = manager.updateMember(member);
    
  out.println(check);
 %>