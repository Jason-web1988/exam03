package exam03.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import exam03.ds.JdbcUtil;
import exam03.dto.Lecturer;

public class LecturerDao {
	private static final LecturerDao instance = new LecturerDao();

	public LecturerDao() {
		super();
		// TODO Auto-generated constructor stub
	}

	public static final LecturerDao getInstance() {
		return instance;
	}
	
	public List<Lecturer> selectLecturerByAll(){
		String sql = "select idx, name, major, field from lecturer_tbl_01";
		try(Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()){
			if(rs.next()) {
				List<Lecturer> list = new ArrayList<>();
				do {
					list.add(getLecturer(rs));
				}while(rs.next());
				return list;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	private Lecturer getLecturer(ResultSet rs) throws SQLException {
		int idx = rs.getInt("idx");
		String name =rs.getString("name");
		String major = rs.getString("major");
		String field =rs.getString("field");
		return new Lecturer(idx, name, major, field);
	}
	
	public Lecturer selectLecturerByIdx(int idx) {
		String sql="select idx, name, major, field from lecturer_tbl_01 where idx=?";
		try(Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, idx);
			try(ResultSet rs = pstmt.executeQuery()){
				if(rs.next()) {
					do {
					return getLecturer(rs);
					}while(rs.next());
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
