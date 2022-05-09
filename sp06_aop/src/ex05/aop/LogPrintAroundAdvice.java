package ex05.aop;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.util.StopWatch;
import java.util.Arrays;

public class LogPrintAroundAdvice implements MethodInterceptor {

	@Override
	public Object invoke(MethodInvocation invocation) throws Throwable {
		System.out.println("Arround Service Invoke() start.....");
		Log log = LogFactory.getLog(this.getClass());
		StopWatch sw = new StopWatch();
		sw.start();    // 시작측정 시작
		log.info("타이머 시작");
		
		///////////////////////////////////
		Object result = invocation.proceed();   // 주관심사의 함수 호출 
		///////////////////////////////////
		
		log.info("타이머 정지");
		sw.stop();  // 시간측정 끝
		
		log.info("[TimeerLOG] Method : " + invocation.getMethod());  // 실행한 메소드 명칭 
		System.out.println("[Time LOG ] args : "+ Arrays.toString(invocation.getArguments()));
		log.info("[TimerLOG] proecess Time : " + sw.getTotalTimeMillis());
		
		return result;
	}

}
