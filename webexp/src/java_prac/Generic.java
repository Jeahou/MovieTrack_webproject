package java_prac;

import java.util.ArrayList;

public class Generic {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		         제네릭(Generic)타입이란?
			1. 컴파일 단계 에서 잘못된 타입 사용될 수 있는 문제 제거 가능.
			2. 자바 5부터 추가
			3. 컬렉션, 람다식(함수적 인터페이스),스트림, NIO에서 널리 사용
			4. 사용하는 코드의 이점.
				1) 컴파일 시 강한 타입 체크 가능..
				2) 타입변환 제거 기능..
		    5. 형식
				1) 타입을 파라미터로 가지는 클래스와 인터페이스에 적용된다.
				2) 선언 시 클래스 또는 인터페이스 이름 뒤에 <> 부호 붙임.
				3) <> 사이에는 타입 파라미터 위치..
				4) 타입 파라미터
					일반적으로 대문자 알파벳 한 문자로 표현
					개발 코드에서는 타입 파라미터 자리에 구체적인 타입을 지정해야..
			
		*/
		ArrayList<String> alg = new ArrayList<String>();
		ArrayList al = new ArrayList();
		
		alg.add("hello");
		al.add("hello");
		System.out.println(alg.get(0));
		// 제네릭을 사용하지 않으면 기본적으로 ArrayList안에 추가 되는 객체는 object 자료형으로 인식
		// 넣는것은 문제가 되지 않지만 값을 꺼낼때 casting을 해 주어야한다. 아래는 실행되지 않는다
		//String h = al.get(0);
		
		// 또한 al이 자료형이 object로 되어있기에 여러 다른 자료형이 들어 갈수도 있기에 제네릭스를 사용하여 
		// 고정시켜준다.
		
	}

}
