package ex02.di.annotation;

import org.springframework.beans.factory.annotation.Autowired;

public class applicationContext {

	
	private Recorder recorder; // 멤버 필드
	
//	@Autowired
//	public void setRecorder(Recorder recorder) {
//		this.recorder = recorder;
//		System.out.println("@Autowired 자동 주입");
//	}
//	public Recorder getRecorder() {
//		return recorder;
//	}
	
	// 3. 일반 메소드를 통한 자동 주입
	@Autowired
	public void userMethod(Recorder recorder) {
		this.recorder = recorder;
		System.out.println("사용자(일반) 메소드 이용한 자동 주입");
	}
	
	public void print() {
		System.out.println("method 주입");
	}
}
