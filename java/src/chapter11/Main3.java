package chapter11;

public class Main3 {

	public static void main(String[] args) {
		// 제네릭
		//   =>  클래스 내부에 사용할 타입을 미리 정하지 않고
		//         클래스 사용되는 시점에 타입을 주입받는 방식
		//   => 클래스<T>   T : 타입 매개변수
		//       타입 매개변수를 작성하는 규칙
		//         - 무조건 대문자
		//         - 무조건 한글자     <T>, <K,V>, <E>....
		
		//   클래스<Student>  : Student 타입 인자, 매개타입
		
		// 상자 준비
		GenericBox<Apple> abox = new GenericBox<Apple>();
		GenericBox<Apple> abox2 = new GenericBox<Apple>();
		
		
		abox.set(new Apple());
		//abox2.set("apple");
		
		Apple ap = abox.get();
		
		System.out.println(ap);
		
		
		
	}

}
