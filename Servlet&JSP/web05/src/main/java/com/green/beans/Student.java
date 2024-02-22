package com.green.beans;

public class Student {
	private String studentName;
	private int korScore;
	private int engScore;
	private int mathScore;
	private int socScore;
	private int sciScore;
//	private int sumScore;
	
	public int getSumScore() {  // sumScore 필드가 있다고 속일수 있다!
		return this.korScore+
				this.engScore+
				this.mathScore+
				this.socScore+
				this.sciScore;
	}
	
	public double getAvgScore() {
		return this.getSumScore()/5.0;
	}
	
	
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
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
	public int getSocScore() {
		return socScore;
	}
	public void setSocScore(int socScore) {
		this.socScore = socScore;
	}
	public int getSciScore() {
		return sciScore;
	}
	public void setSciScore(int sciScore) {
		this.sciScore = sciScore;
	}
	
	
	
	
}
