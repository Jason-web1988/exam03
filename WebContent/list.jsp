<%@page import="java.text.SimpleDateFormat"%>
<%@page import="exam03.dto.Course"%>
<%@page import="java.util.List"%>
<%@page import="exam03.dao.CourseDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	CourseDao courseDao = CourseDao.getInstance();
	List<Course> list = courseDao.selectCourseByAll();

	//게시물 갯수 불러오기
	int countList = courseDao.countList();
	
	//시간설정
	SimpleDateFormat sdf = new SimpleDateFormat("hhmm");
%>
<p>총 <%=countList%>개의 교과목이 있습니다.</p>

<table border="1">
	<thead>
		<tr>
			<th>과목코드</th>
			<th>과목명</th>
			<th>학점</th>
			<th>담당강사</th>
			<th>요일</th>
			<th>시작시간</th>
			<th>종료시간</th>
			<th>관리</th>
		</tr>
	</thead>
	<tbody>
		<%for(Course course : list){ %>
		<tr>
			<td><%=course.getId()%></td>	
			<td><%=course.getName()%></td>	
			<td><%=course.getCredit()%></td>
								
			<td><%if(course.getLecturer().equals("1")){ %>
				김교수
				<%}else if(course.getLecturer().equals("2")){ %>
				이교수
				<%}else if(course.getLecturer().equals("3")){ %>
				박교수
				<%}else if(course.getLecturer().equals("4")){ %>
				우교수
				<%}else if(course.getLecturer().equals("5")){ %>
				최교수
				<%}else if(course.getLecturer().equals("6")){ %>
				강교수
				<%}else{ %>
				황교수
				<%} %>
			</td>	
			
			<td><%if(course.getWeek()==1){ %>
				월
				<%}else if(course.getWeek()==2){ %>
				화
				<%}else if(course.getWeek()==3){ %>
				수
				<%}else if(course.getWeek()==4){ %>
				목
				<%}else if(course.getWeek()==5){ %>
				금
				<%}else if(course.getWeek()==6){ %>
				토
				<%} %>
			</td>
			
				
			<td><%=String.format("%04d",course.getStart_hour())%></td>	
			<td><%=String.format("%04d",course.getEnd_hour())%></td>	
			<td><a href="/exam03/index.jsp?pp=update&id=<%=course.getId()%>">수정</a>
			&nbsp/&nbsp<a href="/exam03/index.jsp?pp=action&action=deleteList&id=<%=course.getId()%>" 
			onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false;">삭제</a></td>	
		</tr>
		<%} %>
	</tbody>
</table>
<br>
<div class="btn_group">
	<button type="button" onclick="location.href='/exam03/index.jsp?pp=insert'">작성</button>
</div>