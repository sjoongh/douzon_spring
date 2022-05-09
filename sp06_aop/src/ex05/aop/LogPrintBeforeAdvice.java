package ex05.aop;

import java.lang.reflect.Method;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.aop.MethodBeforeAdvice;

public class LogPrintBeforeAdvice implements MethodBeforeAdvice {

	@Override
	public void before(Method method, Object[] args, Object target) 
			throws Throwable {
		
		System.out.println("Before Advice Start");
		Log log = LogFactory.getLog(this.getClass());
		log.info("[Method Before Advice] 보조업무 구현(주업무 시작전)");
	}

}
