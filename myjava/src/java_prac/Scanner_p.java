package java_prac;

import java.util.Scanner;

public class Scanner_p {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 * scanner
		 * 1. 콘솔로부터 문자열은 읽을 수 있지만, 기본 타입값으로 바로 읽을 수 없다. java.util패키지의 scanner클래스를 이용하면 
		 * 		콘솔로부터 기본 타입의 값을 바로 읽을 수 있다.
		 * 2. 기본 실행
		 * 		Scanner scan = new Scanner(System.in);
		 * 3. 메서드..
		 * 		1) nextBoolean() : true/false
		 * 		2) nextByte(),nextShort(),nextInt(),nextLong(),nextFloat(),nextDouble()
		 * 		3) nextLine() : String 값을 읽는다.
		 */
		Scanner scan = new Scanner(System.in);
		System.out.print("이름을 입력하세요");
		String name = scan.nextLine();
		System.out.println("점수를 입력하세요");
		int point = scan.nextInt();
		System.out.println("이름: " + name);
		System.out.println("점수: " + point);
	}
}
