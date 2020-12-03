package exam03.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import exam03.ds.JdbcUtil;
import exam03.dto.Course;

public class CourseDao {
	private static final CourseDao instance = new CourseDao();

	public CourseDao() {
		super();
	}

	public static final CourseDao getInstance() {
		return instance;
	}

	public List<Course> selectCourseByAll(){
		String sql = "select id, name, credit, lecturer, week, start_hour, end_hour from course_tbl_01 order by id asc";
		try (Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();) {
			if (rs.next()) {
				List<Course> list = new ArrayList<>();
				do {
					list.add(getCourse(rs));
				} while (rs.next());
				return list;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

		private Course getCourse(ResultSet rs) throws SQLException {
			String id = rs.getString("id");
			String name = rs.getString("name");
			int credit = rs.getInt("credit");
			String lecturer = rs.getString("lecturer");
			int week = rs.getInt("week");
			int start_hour = rs.getInt("start_hour");
			int end_hour = rs.getInt("end_hour");
			
			return new Course(id, name, credit, lecturer, week, start_hour, end_hour);
		}
		
		public int countList() {
			String sql = "select count(id) from course_tbl_01";
			try(Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();){
				if(rs.next()) {
					do {
						return rs.getInt(1);
					}while(rs.next());
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return 0;
		}
	
		public int insertCourse(Course course) {
			String sql = "insert into course_tbl_01 values(?, ?, ?, ?, ?, ?, ?)";
			try(Connection con = JdbcUtil.getConnection();
					PreparedStatement pstmt = con.prepareStatement(sql)){
				pstmt.setString(1, course.getId());
				pstmt.setString(2, course.getName());
				pstmt.setInt(3, course.getCredit());
				pstmt.setString(4, course.getLecturer());
				pstmt.setInt(5, course.getWeek());
				pstmt.setInt(6, course.getStart_hour());
				pstmt.setInt(7, course.getEnd_hour());
				return pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return 0;
		}
		
		public int deleteCourse(String id) {
			String sql = "delete course_tbl_01 where id=?";
			try(Connection con = JdbcUtil.getConnection();
					PreparedStatement pstmt = con.prepareStatement(sql);){
				pstmt.setString(1, id);
				return pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return 0;
		}
		
		public int updateCourse(Course course) {
			String sql = "update course_tbl_01 set name=?, credit=?, lecturer=?, week=?, start_hour=?, end_hour=? where id=?";
			try(Connection con = JdbcUtil.getConnection();
					PreparedStatement pstmt = con.prepareStatement(sql);){
				pstmt.setString(1, course.getName());
				pstmt.setInt(2, course.getCredit());
				pstmt.setString(3, course.getLecturer());
				pstmt.setInt(4, course.getWeek());
				pstmt.setInt(5, course.getStart_hour());
				pstmt.setInt(6, course.getEnd_hour());
				pstmt.setString(7, course.getId());
				return pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return 0;
		}
		
		public Course selectCourseById(String id) {
			String sql = "select id, name, credit, lecturer, week, start_hour, end_hour from course_tbl_01 where id=? ";
			try(Connection con = JdbcUtil.getConnection();
					PreparedStatement pstmt = con.prepareStatement(sql);){
				pstmt.setString(1, id);
				try(ResultSet rs = pstmt.executeQuery()){
					if(rs.next()) {
						do {
							return getCourse(rs);
						}while(rs.next());
					}
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return null;
		}
}

