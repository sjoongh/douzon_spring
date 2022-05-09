package ex02.aop;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.util.StopWatch;

public class LogPrintHandlerImpl implements InvocationHandler {
	
	private Object  target;
	
	public LogPrintHandlerImpl(Object target) {   // DI
		this.target = target;
	}

	@Override  // 보조 프로그램을 여기에 작성
	public Object invoke(Object proxy, Method method, Object[] args) 
			throws Throwable {
		System.out.println("invoke method start........................................");
		// 보조 업무 구현
		Log log = LogFactory.getLog(this.getClass());
		
		StopWatch sw = new StopWatch();
		sw.start();    // 시작측정 시작
		log.info("타이머 시작");
		
		//////// main 관심 실행 //////////////////////////////////
		int result = (int)method.invoke(target, args);
		//////////////////////////////////////////////////////////
		
		log.info("타이머 정지");
		sw.stop();  // 시간측정 끝
		
		log.info("[TimeerLOG] Method : " + method.getName());  // 실행한 메소드 명칭 
		log.info("[TimerLOG] proecess Time : " + sw.getTotalTimeMillis());
		
		return result;
	}

}








