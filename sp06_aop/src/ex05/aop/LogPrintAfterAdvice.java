package ex05.aop;

import java.lang.reflect.Method;
import java.util.Arrays;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.aop.AfterReturningAdvice;

public class LogPrintAfterAdvice implements AfterReturningAdvice {

	@Override
	public void afterReturning(Object returnValue, Method method, Object[] args, Object target) throws Throwable {
		System.out.println("AfterReturnungAdvice Start");
		Log log = LogFactory.getLog(this.getClass());
		log.info("[주업무 실행되고 돌아와서 바로 실행]");
		log.info("[AfterReturning Method] : " + method.getName());
		log.info("[Return value] : " + returnValue);
		log.info("[args value] : " + Arrays.toString(args));
		
	}
	
	
}
