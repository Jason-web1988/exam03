package exam03.dto;

public class Course {
	private String id;
	private String name;
	private int credit;
	private String lecturer;
	private int week;
	private int start_hour;
	private int end_hour;
	public Course() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Course(String id, String name, int credit, String lecturer, int week, int start_hour, int end_hour) {
		super();
		this.id = id;
		this.name = name;
		this.credit = credit;
		this.lecturer = lecturer;
		this.week = week;
		this.start_hour = start_hour;
		this.end_hour = end_hour;
	}
	
	
	
	public final String getId() {
		return id;
	}
	public final void setId(String id) {
		this.id = id;
	}
	public final String getName() {
		return name;
	}
	public final void setName(String name) {
		this.name = name;
	}
	public final int getCredit() {
		return credit;
	}
	public final void setCredit(int credit) {
		this.credit = credit;
	}
	public final String getLecturer() {
		return lecturer;
	}
	public final void setLecturer(String lecturer) {
		this.lecturer = lecturer;
	}
	public final int getWeek() {
		return week;
	}
	public final void setWeek(int week) {
		this.week = week;
	}
	public final int getStart_hour() {
		return start_hour;
	}
	public final void setStart_hour(int start_hour) {
		this.start_hour = start_hour;
	}
	public final int getEnd_hour() {
		return end_hour;
	}
	public final void setEnd_hour(int end_hour) {
		this.end_hour = end_hour;
	}
	@Override
	public String toString() {
		return String.format("Course [id=%s, name=%s, credit=%s, lecturer=%s, week=%s, start_hour=%s, end_hour=%s]", id,
				name, credit, lecturer, week, start_hour, end_hour);
	}
	
	
}
