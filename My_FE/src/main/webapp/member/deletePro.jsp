<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "mymember.MemberDAO" %>

<% request.setCharacterEncoding("utf-8");%>

<%
  String id = (String)session.getAttribute("id");
  String password  = request.getParameter("password");
	
  MemberDAO manager = MemberDAO.getInstance();
  //회원탈퇴처리 메소드 수행 후 탈퇴 상황 값 반환
  int check = manager.deleteMember(id, password);
	
  if(check == 1)//탈퇴성공시
	 session.invalidate();//세션을 무효화
  
  out.println(check);
%>