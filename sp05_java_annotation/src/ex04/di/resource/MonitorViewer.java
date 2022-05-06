package ex04.di.resource;

import javax.annotation.Resource;

public class MonitorViewer {
	
	private Recorder recorder; // 멤버 필드
	
	@Resource(name="record1")
	public void setRecorder(Recorder recorder) {
		System.out.println(recorder);
		this.recorder = recorder;
//		record = Resource.class.getTypeName().equalsIgnoreCase("record1");
		if (Resource.class.getTypeName().equals("record1")) {
			System.out.println("@Resource 주입-1111111");
		} else if (Resource.class.getTypeName().equals("record2")) {
			System.out.println("@Resource 주입-2222");
		} else if (Resource.class.getTypeName().equals("recor3")) {
			System.out.println("@Resource 주입-3333");
		} else {
			System.out.println("@Resource 주입에 이름이 없어요");
		}
	}
	
	
}
