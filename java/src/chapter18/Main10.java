package chapter18;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;

public class Main10 {

	public static void main(String[] args) throws Exception {
		// 기본타입을 위한 보조스트림
		
		String targetFileName = "Z:\\sample\\test.xx";
		
		File targetFile = new File(targetFileName);

		// 데이터 기록
		FileOutputStream fos = new FileOutputStream(targetFile);
		DataOutputStream dos = new DataOutputStream(fos);
		
		dos.writeUTF("홍길동");	//문자열
		dos.writeDouble(178.14);  //실수
		dos.writeInt(87);		//정수

		dos.writeUTF("고길동");	//문자열
		dos.writeDouble(168.95);  //실수
		dos.writeInt(92);		//정수
		
		dos.writeUTF("박길동");	//문자열
		dos.writeDouble(180.27);  //실수
		dos.writeInt(74);		//정수
		
		dos.flush();
		dos.close();
		fos.close();
//-------------------------------------------------------------------------
		// 데이터 조회
		FileInputStream fis = new FileInputStream(targetFile);
		DataInputStream dis = new DataInputStream(fis);
		
		for(int i=0;i<3;i++) {
			String name = dis.readUTF();
			double height = dis.readDouble();
			int score = dis.readInt();

			
			System.out.printf("%s : %f : %d \n",name,height,score);
			
		}
		dis.close();
		fis.close();
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
