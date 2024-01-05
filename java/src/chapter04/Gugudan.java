package chapter04;

public class Gugudan {

	public static void main(String[] args) {
		//  구구단 출력 (이중 반복문은 연습하는 좋은 수단)
		
		//  1단계 : 구구단 2단을 출력해 봅시다.
		System.out.println("\\n----- 1단계-----");
		System.out.println("2 X 1 = 2");
		System.out.println("2 X 2 = 4");
		System.out.println("2 X 3 = 6");
		System.out.println("2 X 4 = 8");
		System.out.println("2 X 5 = 10");
		System.out.println("2 X 6 = 12");
		System.out.println("2 X 7 = 14");
		System.out.println("2 X 8 = 16");
		System.out.println("2 X 9 = 18");
		
		// 2단계 : 2단 출력문을 변화하는 부분과 변화하지 않는 부분을 구분해서 출력해 봅시다.
		System.out.println("\n----- 2단계-----");
		System.out.println("2 X "+1+" = "+(2*1));
		System.out.println("2 X "+2+" = "+(2*2));
		System.out.println("2 X "+3+" = "+(2*3));
		System.out.println("2 X "+4+" = "+(2*4));
		System.out.println("2 X "+5+" = "+(2*5));
		System.out.println("2 X "+6+" = "+(2*6));
		System.out.println("2 X "+7+" = "+(2*7));
		System.out.println("2 X "+8+" = "+(2*8));
		System.out.println("2 X "+9+" = "+(2*9));
		
		// 3단계 : 2단계의 내용을 토대로 반복문 구성   => 구구단 2단이 완성
		System.out.println("\n----- 3단계-----");
		for(int j=1;j<=9;j++) {
			System.out.println("2 X "+j+" = "+(2*j));
		}
		
		// 4단계 : 3단계의 내용을 9단까지 출력해봅시다.
		System.out.println("\n----- 4단계-----");
		
		System.out.println("*** 2단 ***");
		for(int j=1;j<=9;j++) {
			System.out.println("2 X "+j+" = "+(2*j));
		}
		
		System.out.println("*** 3단 ***");
		for(int j=1;j<=9;j++) {
			System.out.println("3 X "+j+" = "+(3*j));
		}
		
		System.out.println("*** 4단 ***");
		for(int j=1;j<=9;j++) {
			System.out.println("4 X "+j+" = "+(4*j));
		}
		
		System.out.println("*** 5단 ***");
		for(int j=1;j<=9;j++) {
			System.out.println("5 X "+j+" = "+(5*j));
		}
		
		System.out.println("*** 6단 ***");
		for(int j=1;j<=9;j++) {
			System.out.println("6 X "+j+" = "+(6*j));
		}
		
		System.out.println("*** 7단 ***");
		for(int j=1;j<=9;j++) {
			System.out.println("7 X "+j+" = "+(7*j));
		}
		
		System.out.println("*** 8단 ***");
		for(int j=1;j<=9;j++) {
			System.out.println("8 X "+j+" = "+(8*j));
		}
		
		System.out.println("*** 9단 ***");
		for(int j=1;j<=9;j++) {
			System.out.println("9 X "+j+" = "+(9*j));
		}
		
		// 5단계 : 4단계의 내용을 반복되는 부분과 반복되지 않는 부분을 구분해서 반복문을 만들어 봅시다.
		System.out.println("\n----- 5단계-----");
		
		for(int i=2;i<=9;i++) {
			System.out.println("*** "+i+"단 ***");
			for(int j=1;j<=9;j++) {
				System.out.println(i+" X "+j+" = "+(i*j));
			}
		}

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
