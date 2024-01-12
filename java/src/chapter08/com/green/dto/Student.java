package chapter08.com.green.dto;

public class Student {

	private String name;
	private int stuNum;
	private int korScore;
	private int engScore;
	private int mathScore;
	// 클래스의 모든 필드에 private을 붙임으로 필드에 직접 접근을 막겠다. => 캡슐화
	// 필드에 데이터를 저장하거나 조회하는 기능을 메서드로 통제해야 함.
	
	// 데이터를 저장할 때 사용하는 메서드 : setter
	// 데이터를 조회할 때 사용하는 메서드 : getter
	
	// getter메서드와 setter메서드는 이런 이름으로 쓰겠다 => 규칙
	//   get필드명();  필드 데이터를 읽어오기 위한 getter메서드
	//   set필드명(데이터);  필드에 데이터를 채우기 위한 setter메서드
	
	public Student() {}
	public Student(String name) {
		this.name = name;
	}
	public Student(String name, int stuNum, int korScore, int engScore, int mathScore) {
		this.name = name;
		this.stuNum = stuNum;
		this.korScore = korScore;
		this.engScore = engScore;
		this.mathScore = mathScore;
	}
	
	
	
	public void setName(String name) {
		this.name = name; 
	}
	
	public String getName() {
		return this.name;
	}

	public int getStuNum() {
		return stuNum;
	}

	public void setStuNum(int stuNum) {
		this.stuNum = stuNum;
	}

	public int getKorScore() {
		return korScore;
	}

	public void setKorScore(int korScore) {
		this.korScore = korScore;
	}

	public int getEngScore() {
		return engScore;
	}

	public void setEngScore(int engScore) {
		this.engScore = engScore;
	}

	public int getMathScore() {
		return mathScore;
	}

	public void setMathScore(int mathScore) {
		this.mathScore = mathScore;
	}
	
	
	
	
	
	
	
	
	
}
