package chapter17;

public class Main04 {

	public static void main(String[] args) {
		// 스레드에 우선순위 배분
		//  1~10까지 1일수록 낮고 10일수록 우선순위가 높다.
		
		for(int i=0;i<15;i++) {
			Thread thread = new Test("스레드 : "+i); //각 스레드에 이름 부여
			
			if(i!=10) {
				thread.setPriority(1); // 스레드에 우선순위를 부여하는 메서드
			}else {
				thread.setPriority(10);
				// 10번 스레드만 우선순위를 10으로 맞추고
				// 그외 스래드는 우선순위를 1로 두고 동작
			}
			thread.start();
		}

	}

}
