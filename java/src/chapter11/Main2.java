package chapter11;

public class Main2 {

	public static void main(String[] args) {
		// 1. 과일 저장하기 위한 범용상자를 준비합니다.
		Box abox = new Box();
		Box bbox = new Box();
		
		//  2. 과일 객체를 상자에 저장해 봅시다.
		abox.set(new Apple());
		bbox.set(new Banana());
		
		//  3. 과일 객체를 상자에서 꺼내봅니다.
		Apple ap = (Apple)abox.get();
		Banana nana = (Banana)bbox.get();
		
		System.out.println(ap.toString());
		System.out.println(nana.toString());
		
		//-------------------------------------
		Box abox2 = new Box();
		
		abox2.set("Apple");
		
		Apple ap2 = (Apple)abox2.get();
		
		System.out.println(ap2.toString());
		
	}

}






