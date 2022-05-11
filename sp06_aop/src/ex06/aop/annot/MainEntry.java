package ex06.aop.annot;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class MainEntry {

	public static void main(String[] args) {
		
		String config = "ex06/aop/annot/appCtx.xml";
		ApplicationContext ctx = new GenericXmlApplicationContext();
		
		Student student = ctx.getBean("student", Student.class);
		student.getStudentInfo();
		
		Worker worker = ctx.getBean("worker", Worker.class);
		worker.getStudentInfo();
	}

}
