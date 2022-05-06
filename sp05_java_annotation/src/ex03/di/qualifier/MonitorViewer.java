package ex03.di.qualifier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

public class MonitorViewer {
	
	private Recorder recorder;
	
	// @inject
	// injection 되는 타입의 객체(bean)가 존재하지 않아도 error없이 실행 가능
	@Autowired(required = false)
	@Qualifier("aa") // 1. 이렇게 기재해도 되고
	public void setRecorder(Recorder recorder) { // 2.
		this.recorder = recorder;
		System.out.println("@Autowired 자동 주입");
	}
	
	@Autowired
	public MonitorViewer(@Qualifier("bb") Recorder recorder) { // 생성자 함수에는 파라미터 안에 기재
		this.recorder = recorder;
		System.out.println("asd");
	}
}
