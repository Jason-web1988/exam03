<%@page import="exam03.dao.CourseDao"%>
<%@page import="exam03.dto.Course"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	CourseDao courseDao = CourseDao.getInstance();	

	String action = request.getParameter("action");
	
	String id = "";
	String name="";
	int credit = -1;
	String lecturer =""; 
	int week = -1;
	int start_hour = -1;
	int end_hour = -1;
		
	switch(action){
		case "insert" :
			id = request.getParameter("id");
			name = request.getParameter("name");
			lecturer = request.getParameter("lecturer");
			credit = Integer.parseInt(request.getParameter("credit"));
			week = Integer.parseInt(request.getParameter("week"));
			start_hour = Integer.parseInt(request.getParameter("start_hour"));
			end_hour = Integer.parseInt(request.getParameter("end_hour"));
			
			Course insertCourse = new Course(id, name, credit, lecturer, week, start_hour, end_hour);
			int insertRes = courseDao.insertCourse(insertCourse);
			System.out.println("insertRes >> " + insertRes);
			break;
		
		case "deleteList" :
			id = request.getParameter("id");
			int deleteRes = courseDao.deleteCourse(id);
			System.out.println("deleteRes >> " + deleteRes);
			break;	
		
		case "updateList":
			id = request.getParameter("id");
			name = request.getParameter("name");
			lecturer = request.getParameter("lecturer");
			credit = Integer.parseInt(request.getParameter("credit"));
			week = Integer.parseInt(request.getParameter("week"));
			start_hour = Integer.parseInt(request.getParameter("start_hour"));
			end_hour = Integer.parseInt(request.getParameter("end_hour"));
			Course updateCourse = new Course(id, name, credit, lecturer, week, start_hour, end_hour);
			int updateCourseRes = courseDao.updateCourse(updateCourse);
			System.out.println("updateCourseRes >> " + updateCourseRes);
	}
	
%>

<script>
	location.href="/exam03/index.jsp?pp=list";
</script>