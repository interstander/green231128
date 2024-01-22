package chapter12.sample;

public class Student {
	private int stuNo;
	private String stuName;
	
	public Student(int stuNo, String stuName) {
		this.stuNo = stuNo;
		this.stuName = stuName;
	}
	// 학생이 같은 학생인지 아닌지에 대한 판단 정보
	//  1) 해시값 : 메모리 주소를 바탕으로 정수(int) => 중복
	@Override
	public int hashCode() {
		return this.stuNo;
//		return this.stuName.hashCode();
		  //  문자열의 경우 이미 비교를 위한 hashcode메서드가 오버라이드가 되어있다.
	}
	
	//  2) equals메서드를 통한 2차 비교
	//       반환 타입이 t/f
	//     기본 : 주소값이 명확하게 일치하는가를 판단
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof Student) {
			Student stu = (Student)obj;
			
			return (stu.getStuNo() == this.stuNo)
					&& stu.getStuName().equals(this.stuName);
		}else {
			return false; // 어짜피 학생객체도 아님
		}
	}
	

	public int getStuNo() {
		return stuNo;
	}

	public void setStuNo(int stuNo) {
		this.stuNo = stuNo;
	}

	public String getStuName() {
		return stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}
	
	
	
}
