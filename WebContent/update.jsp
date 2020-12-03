<%@page import="exam03.dto.Lecturer"%>
<%@page import="java.util.List"%>
<%@page import="exam03.dao.LecturerDao"%>
<%@page import="exam03.dto.Course"%>
<%@page import="exam03.dao.CourseDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	LecturerDao lecturerDao = LecturerDao.getInstance();
	CourseDao courseDao = CourseDao.getInstance();
	
	String id = request.getParameter("id");
	Course course = courseDao.selectCourseById(id);
	
	int idx = Integer.parseInt(course.getLecturer());	
	Lecturer Getlecturer = lecturerDao.selectLecturerByIdx(idx);  
	
	List<Lecturer> list = lecturerDao.selectLecturerByAll(); 
%>
<h2>교과목 추가</h2>
 <form action="/exam03/index.jsp?pp=action" method="post" id="update">
 	<input type="hidden" name=action value="updateList">
 <table border="1">
 	<tr>
 		<th>교과목 코드</th>
 		<td><input type="text" id="id" name="id" style="width:99%;" value=<%=course.getId() %> readonly></td>
 	</tr>
 	
 	<tr>
 		<th>과목명</th>
 		<td><input type="text" id="name" name="name" style="width:99%;" value=<%=course.getName()%>></td>
 	</tr>
 
 	<tr>
 		<th>담당강사</th>
 		<td align="left">
 			<select id="lecturer" name="lecturer" required>
 				<option value="<%=course.getLecturer()%>"><%=Getlecturer.getName()%></option>
 				<%for(Lecturer lecturer : list) {%>
 				<option value="<%=lecturer.getIdx()%>"><%=lecturer.getName()%></option>
 				<%} %>
 			</select>
 		</td>
 	</tr>	
 	
 	<tr>
 		<th>학점</th>
 		<td><input type="text" id="credit" name="credit" style="width:99%;" value="<%=course.getCredit()%>"></td>
 	</tr>
 	
 	<tr>
 		<th>요일</th>
 		<td>
 			<label><input type="radio" id="week" name="week" value="1" checked >월</label>
 			<label><input type="radio" id="week" name="week" value="2" >화</label>
 			<label><input type="radio" id="week" name="week" value="3" >수</label>
 			<label><input type="radio" id="week" name="week" value="4" >목</label>
 			<label><input type="radio" id="week" name="week" value="5" >금</label>
 			<label><input type="radio" id="week" name="week" value="6" >토</label>
 		</td>
 	</tr>
 	
 	<tr>
 		<th>시작</th>
 		<td><input type="number" id="start_hour" name="start_hour" style="width:98%;" value="<%=course.getStart_hour()%>"></td>
 	</tr>
 	
 	<tr>
 		<th>종료</th>
 		<td><input type="number" id="end_hour" name="end_hour"  style="width:98%;" value="<%=course.getEnd_hour()%>"></td>
 	</tr>
 </table>
 </form>
 <br>
 <div class="btn_group" align="center">
 	<button type="button" onclick="location.href='/exam03/index.jsp?pp=list'">목록</button>
 	<button type="button" onclick="history.back(); return false">취소</button>
 	<button type="button" onclick="updateList()">완료</button>
 </div>