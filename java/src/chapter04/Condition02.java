package chapter04;

public class Condition02 {

	public static void main(String[] args) {
		// 조건문 2 - switch
		// 변수에 담긴 데이터의 일치 여부를 통해서 코드를 분기하는 조건문
		//  지정된 case 이후로 전부 실행 - 기본
		//  지정된 case만 실행하고 싶다면 break;를 이용
		
		String lang = "java";
		
		switch(lang) {
		case "javascript":
			System.out.println("자바스크립트를 공부합니다.");
			break;
		case "python":
			System.out.println("파이썬을 공부합니다.");
			break;
		case "java":
			System.out.println("자바를 공부합니다.");
			break;
		case "c#":
			System.out.println("씨샵을 공부합니다.");
			break;
		default:
			System.out.println("코틀린을 공부합니다.");
		}
		

	}

}
