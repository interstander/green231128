package chapter12.set;

import java.util.HashSet;
import java.util.Set;

import chapter12.sample.Student;

public class Main03 {

	public static void main(String[] args) {
		// 이론1. 임의의 객체가 같은지 어떻게 판단?
		
		Set<Student> set = new HashSet<>();
		
		set.add(new Student(17,"홍길동"));
		set.add(new Student(15,"박길동"));
		set.add(new Student(21,"이길동"));
		
		System.out.println("학생 인원수 : "+set.size()); //3명
		
		set.add(new Student(17,"홍길동")); // 이전에 15라인에서 저장한 사람과 다른사람 취급
		set.add(new Student(17,"홍길동")); 
		set.add(new Student(17,"홍길동")); 
		set.add(new Student(17,"홍길동")); 
		set.add(new Student(17,"홍길동")); 
		set.add(new Student(17,"홍길동")); 
		System.out.println("학생 인원수 : "+set.size()); 
		
		
		
		
		
	}

}
