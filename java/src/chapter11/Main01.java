package chapter11;

import java.util.Random;
import java.util.Scanner;

public class Main01 {

	public static void main(String[] args) {
		// 과일 객체  => 상자 객체 담아서 처리
		// 1. 과일을 담기 위한 상자를 준비
		AppleBox abox = new AppleBox();
		BananaBox bbox = new BananaBox();
		
		// 2. 과일 객체를 준비해서 상자에 담기
		abox.set(new Apple());
		bbox.set(new Banana());
		
		// 3. 상자에서 과일 꺼내서 확인해 봅시다.
		Apple ap = abox.get();
		Banana nana = bbox.get();
		
		System.out.println(ap.toString());
		System.out.println(nana.toString());


		
		
		
		
		
	}

}
