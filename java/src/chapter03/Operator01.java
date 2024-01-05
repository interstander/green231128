package chapter03;

public class Operator01 {

	public static void main(String[] args) {
		// [처리] 연산자
		//  : 데이터를 처리하기 위한 가장 작은 도구
		
		// - 산술(사칙) 연산,대입(할당) 연산, 비교(관계) 연산, 논리 연산, 비트 연산, 삼항 연산
		
		// 1) 산술 연산 : +,-,*,/(몫), %(나머지)
		int a1 = 10/3;
		System.out.println("10/3 : "+a1); //3
		
		double a2 = 10/3;
		System.out.println("10/3 : "+a2);  // 3.0
		double a3 = (double)10/3;
		System.out.println("10/3 : "+a3);  // 3.333
		
		int a4 = 10%3;
		System.out.println("10%3 : "+a4); 
		
		System.out.println();
		// 1-1) 증감 연산자  ++, --
		int b1 = 10;
		b1++;  // 선처리 후증감
		System.out.println("b1++ : "+b1);  //11
		++b1;  // 선증감 후처리
		System.out.println("++b1 : "+b1);  //12
		
		System.out.println();
		int b2=10,b3=20;
		
		int result1 = b2++ * ++b3;
//					  10       20
//                    10       21(선증가)
//                       *(210) => result1
//                    11(후증가) 21
		System.out.println("b2 : "+b2);  // 11
		System.out.println("b3 : "+b3);  // 21
		System.out.println("result1 : "+result1); //   210
		System.out.println();
		// 2) 대입연산 = 
		//       오른쪽의 데이터를 왼쪽 변수에 대입한다.
		int c1 = 10+20;
		System.out.println("c1 : "+c1);
		System.out.println();
		// [연산자 우선 순위]
		//   1) 소스는 뭘 의미하는 지 직관적으로 알수 있게 작성해야함
		//   2) ()를 사용해서 우선순위를 지정
		
		// 2-1) 복합대입 연산 (다른 연산과 대입연산의 혼종)
		int d1 = 10;
//		d1 = d1+10;
		d1 += 10;
		System.out.println("d1 : "+d1);
		
		System.out.println();
		// 3) 비교(관계)연산 : <, <=, >, >=, == , !=
		//      => 결과는 반드시 논리타입
		int e1 = 10;
		int e2 = 20;
		System.out.println("e1 < e2 : "+(e1<e2));
		System.out.println();
		
		//  3-1) 문자열 비교 => equals();
		String f1 = new String("반갑습니다.");
		String f2 = new String("반갑습니다.");
		
		System.out.println("f1 == f2 : "+(f1==f2));		
		
		System.out.println("f1.equals(f2) : "+(f1.equals(f2)));
		System.out.println();
		
		//  4) 논리 연산 : &&, ||, !, ^
		//       => 비교 연산과 함께 많이 사용된다.
		boolean g1 = true;
		boolean g2 = false;
		
		System.out.println("g1 && g2 : "+(g1 && g2));
		
		System.out.println("g1 || g2 : "+(g1 || g2));
		
		System.out.println("!g1 : "+(!g1));
		
		System.out.println("g1 ^ g2 : "+(g1 ^ g2));
		
		System.out.println();
		//  4-1) SCE (Short Circuit Evaluation) : 불필요한 연산 제거
		int h1 = 0;
		int h2 = 0;
		boolean result2;
		
		result2 = ((h1+=10)< 0 && (h2+=10) > 0); 
		// 앞의 결과가 false이므로 뒤의 연산을 하지 않는다.
		System.out.println("h1 : "+h1); //10
		System.out.println("h2 : "+h2); //0
		System.out.println("result2 : "+result2);
		
		//SCE를 무시하고 무조건 앞 뒤 연산을 모두 진행시키는 방법 => && -> &, || -> |
		h1 = 0;
		h2 = 0;
		result2 = ((h1+=10)< 0 & (h2+=10) > 0); 
		
		System.out.println("h1 : "+h1); //10
		System.out.println("h2 : "+h2); //10
		System.out.println("result2 : "+result2);
		
		System.out.println();
		// 5) 삼항 연산 : 피연산자가 3개인 연산
		//     (조건:T/F) ? 결과-T : 결과-F;
		int i1 = 70;
		String result3 = (i1 >= 60 )? "합격" : "불합격";
		
		System.out.println("결과 : "+result3);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

	}

}
