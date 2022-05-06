package ex03.di.qualifier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

public class MonitorViewer {
	
	private Recorder recorder;
	
	// @inject
	// injection 되는 타입의 객체(bean)가 존재하지 않아도 error없이 실행 가능
	@Autowired(required = false)
	@Qualifier("aa")
	public void setRecorder(Recorder recorder) {
		this.recorder = recorder;
		System.out.println("@Autowired 자동 주입");
	}
	
	@Autowired
	@Qualifier("bb")
	public MonitorViewer(Recorder recorder) {
		this.recorder = recorder;
		System.out.println("asd");
	}
}
