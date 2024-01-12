package chapter08.com.green.main;

import java.util.Scanner;

//import chapter08.com.green.dto.Lecturer;
//import chapter08.com.green.dto.Student;  //가장 자주 쓰는 것을 임포트
//import chapter08.com.green.vo.Student;
import chapter08.com.green.dto.*;  // 해당 패키지의 모든 클래스를 전부 임포트 하겠습니다.(권장X)

public class Main01 {

	public static void main(String[] args) {
		// 예제로 만든 클래스의 인스턴스를 만들어 봅시다.
		
		//chapter08.com.green.dto.Student studentDto = new chapter08.com.green.dto.Student();
		//chapter08.com.green.dto.Lecturer lectutrtDto = new chapter08.com.green.dto.Lecturer();
		Student studentDto = new Student();
		Lecturer lectutrtDto = new Lecturer();
		
		//chapter08.com.green.vo.Student studentVo = new chapter08.com.green.vo.Student();
		chapter08.com.green.vo.Student studentVo = new chapter08.com.green.vo.Student();
		chapter08.com.green.vo.Teacher teacherVo = new chapter08.com.green.vo.Teacher();
		
		//[원칙] 인스턴스를 생성하기 위해서 클래스가 어디있는지 패키지명.클래스 형태로 사용해야 한다.
		//  매번 패키지명.클래스로 쓰기에는 불편하므로
		//   -> 앞으로 특정 클래스는 특정 패키지에서 가져온것만 사용할 겁니다. (지정 : import)
		
		Scanner scan = new Scanner(System.in);
		
		java.lang.System.out.println();
		//  java.lang. 패키지는 자바프로그램을 실행하는데 핵심적인 패키지
		//     => 굳이 임포트 없어도 사용이 가능하다.
		Object obj = new Object();

		
		
		
		
		
	}

}
