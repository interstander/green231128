package chapter13;

import java.io.FileInputStream;
import java.io.FileNotFoundException;

public class Main04 {

	public static void main(String[] args) {
		// 일반 예외 => 무조건 예외처리 코드를 작성해야 한다!!
		
		try {
			FileInputStream fis = new FileInputStream("data.text");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
