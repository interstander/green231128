package chapter04;

import java.io.IOException;
import java.util.Scanner;

public class Input01 {

	public static void main(String[] args) throws IOException {
		// 키보드 입력
		//  - 키보드 입력 방법
		//     System.in.read(); => 키보드의 버튼 '하나'를 입력받는 기능
		//							 -> 키코드
//		int keyCode = System.in.read();
//	
//		System.out.println("입력한 키코드 : "+keyCode);
//		System.out.println("입력한 글자 : "+(char)keyCode);
		
		//   일반적으로 사용하기 불편함!!
		//  여러 글자를 입력하기 어렵기 때문에
		//  => 여러 글자를 입력하기에 효율적인 기능
		Scanner scan = new Scanner(System.in);
		
		System.out.print("문자열을 입력해 봅시다 >>");
		String str1 = scan.next();
		               //  공백이 입력되기 전까지의 "문자열"을 입력받는 기능
		scan.nextLine();
		System.out.println("입력 데이터 : "+str1);
		
		System.out.println("\n-------------------------------------");
		
		System.out.print("문자열을 입력해 봅시다 >>");
		String str2 = scan.nextLine();
					   //  줄바꿈이 입력되기 전까지의 "문자열"을 입력받는 기능
		System.out.println("입력 데이터 : "+str2);
		
		//   scan.nextInt(); 정수 입력
		//   scan.nextDouble(); 실수 입력
		//-------------------------------------------------
		//  [주의 사항]
		//  엔터키에 해당 키코드가 2개 (캐리지리턴, 라인피드)	
		//   - scan.next();
		//   - scan.nextInt();
		//   - scan.nextDouble();
		//   이런 기능 사용할 때 엔터키의 키코드 정보가 남아서 다음 입력에 영향준다.
		
		//  해결방법 1. scan.nextLine(); 한줄을 추가해서 남은 키코드를 비워준다.
		//  해결방법 2. scan.nextLine();으로 입력받은후 적절하게 형변환 해주면 됨
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	}

}
