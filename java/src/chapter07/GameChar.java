package chapter07;

import java.util.Date;

public class GameChar { // 게임 케릭터
	// 클래스 내부에 변수, 메서드 => '멤버'
	
	// 모든 인스턴스가 공유하는 정보 => 정적
	// 정적 멤버 변수
	static String lang = "한글";
	// 정적 멤버 메서드
	public static void setLang(String language) {
		GameChar.lang = language;
	}
	
	
	// (인스턴스)멤버변수(속성, 필드...)
	String job = "전사";
	int str = 5;
	int intel = 5;
	
	// 특별한 메서드 => 생성자
	public GameChar(String selectJob) { // 외부에서 선택한 직업을
		this.job = selectJob;				//  인스턴스 내에서 사용할 겁니다.
		// this : 새로 생성된 '인스턴스' 자기자신 
	}
	public GameChar() {
		// 메서드(생성자) 오버 로딩
	}
	public GameChar(String selectJob,int str) {
		this.job = selectJob;
		if(str >=0) {
			this.str = str;	
		}
		
	}
	
	
	// (인스턴스)멤버메서드
	public void skill1() {
		System.out.println("스킬1이 동작합니다");
		System.out.println(this.str+"만큼 피해를 입힙니다.");
	}
	
	public void skill2() {
		System.out.println("스킬2이 동작합니다");
		this.skill1();
	}
	
	
	// 초기화 블록
	// 멤버 변수를 초기화 하는 방법
	//   1. 기본값 : int vari = 10;
	//   2. 생성자 : 
	//     클래스명(int vari){
//				this.vari = vari;
//			}
	//   3. 초기화 블록
	{
		// 초기화 블록
	}
	
	// 초기화 블록을 언제 쓰는가?
	//  초기화 동작 순서  => 마지막 동작된 데이터가 최종 저장
	//    1. 명시적초기화  => 변수에 직접 데이터 넣기
	//    2. 초기화블록   =>  데이터를 제어후 변수에 담기
	//    3. 생성자
	
	Date date = null;  // 날짜를 저장할때 사용하는 객체
	{
		if(true) {
			date = new Date();
		}	
	}
	
	// 정적멤버 초기화 블록
	static {
		
	}
	
	
	
	
	
	
	
	
	
	

}
