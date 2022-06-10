<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "mymember.MemberDAO" %>

<% request.setCharacterEncoding("utf-8");%>

<% 
  String id = request.getParameter("id");
  
  MemberDAO manager = MemberDAO.getInstance();
  
  int check= manager.confirmId(id);
  
  out.println(check);
 %>
