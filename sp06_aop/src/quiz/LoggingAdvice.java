package quiz;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.util.StopWatch;

public class LoggingAdvice {
	
	public Object arround(ProceedingJoinPoint  point)  throws Throwable {
		String methodName = point.getKind();
		String methodName2 = point.getSignature().getName();
		
		System.out.println("[LOG ] methodName = " + methodName + 
				", methodName2 = " + methodName2 + " 호출 되기 전......");
		
		StopWatch sw = new StopWatch();
		sw.start(methodName);
		
		///////main 관심 실행 //////////////////////////////////
		Object obj = point.proceed();  // 실제 타켓 대상 메소드가 호출 되는 부분 
		//////////////////////////////////////////////////////////
		
		System.out.println("[LOG ] "+ methodName2 +" 호출 완료 되었습니다." );
		System.out.println("[LOG ] 실행 시간 : " + sw.getTotalTimeMillis()/1000 + " 초");

		return obj;
	}

}
