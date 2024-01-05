package chapter04;

import java.util.Random;
import java.util.Scanner;

public class Random01 {

	public static void main(String[] args) {
		// 임의의 수 생성하기
		//  1. Math.random() 
	/*
	 *   0.0  <=   Math.random();  <  1.0    : 0.0~~0.9999999~~
	 * 
	 * [로또 번호] 1부터 45까지의 임의의 숫자
	 * 
	 *  0.0  <=   Math.random();  <  1.0
	 *  0.0*45 <= Math.random()*45  <  1.0*45
	=>  0.0  <= Math.random()*45  <  45.0
		(int)0.0 <= (int)(Math.random()*45)  <  (int)45.0
	=>  0   <= (int)(Math.random()*45)   < 45
	    0+1 <= (int)(Math.random()*45) + 1  < 45+1
	=>  1 <= (int)(Math.random()*45) + 1 < 46
	
	    (int)Math.random()*45)+1
	 */
		
		int dice1 = (int)(Math.random()*6)+1;
					//  1~6
		System.out.println("주사위 굴림 : "+dice1);
		
	//  2. 
	//		Random r = new Random();
	// 		r.nextInt();
	//      r.nextInt();  => int숫자 범위 안에서 임의의 수
//		    r.nextInt(숫자);  => 0부터 숫자미만의 임의의 수
		
		Random r = new Random();
		int dice2= r.nextInt(6)+1;
						//  1~6
		System.out.println("주사위 굴림 : "+dice2);
		
		
		Scanner s = new Scanner(System.in);
		
		//  문제 1~~~
		Random r1 = new Random();   // X
		Scanner s1 = new Scanner(System.in);// X
		r.nextInt();
		s.nextLine();
		// 문제 2~~
		Random r2 = new Random();   // X
		Scanner s2 = new Scanner(System.in);// X
		r.nextInt();
		s.nextLine();
		
		// 문제 3~~~
		Random r3 = new Random();   // X
		Scanner s3 = new Scanner(System.in);// X
		r.nextInt();
		s.nextLine();
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
