package exam03.dto;

public class Lecturer {
	private int idx;
	private String name;
	private String major;
	private String field;
	public Lecturer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Lecturer(int idx, String name, String major, String field) {
		super();
		this.idx = idx;
		this.name = name;
		this.major = major;
		this.field = field;
	}
	public final int getIdx() {
		return idx;
	}
	public final void setIdx(int idx) {
		this.idx = idx;
	}
	public final String getName() {
		return name;
	}
	public final void setName(String name) {
		this.name = name;
	}
	public final String getMajor() {
		return major;
	}
	public final void setMajor(String major) {
		this.major = major;
	}
	public final String getField() {
		return field;
	}
	public final void setField(String field) {
		this.field = field;
	}
	@Override
	public String toString() {
		return String.format("Lecturer [idx=%s, name=%s, major=%s, field=%s]", idx, name, major, field);
	}
	
	
}
