package ex02.di.annotation;

public class MonitorViewer {
	// 의존 관계(객체)
	
	// 1. member field 설정
	private Recorder recorder;
	
	public Recorder getRecorder() {
		return recorder;
	}
	
	public void print() {
		System.out.println("method 주입 : " + this.recorder);
//		recorder.show();
	}
	
}
