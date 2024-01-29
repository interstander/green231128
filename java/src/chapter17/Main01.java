package chapter17;

public class Main01 {

	public static void main(String[] args) {
		// 싱글 스레드 상황
		for(int i=0;i<5;i++) {
			System.out.println("띵");
		}
		
		for(int i=0;i<5;i++) {
			System.out.println("동");
		}

	}

}
