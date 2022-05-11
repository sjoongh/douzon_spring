package ex06.aop.annot;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class LogApp { // Advice class - around 적용
	
	@Pointcut("bean(student)")
	private void pointCutMethod() { }
	
	@Around("pointCutMethod()")
	public Object loggerApp(ProceedingJoinPoint point) throws Throwable {
		
		String signatureStr = point.getSignature().toLongString();
		System.out.println(signatureStr + "is start.......");
		long st = System.currentTimeMillis();
		
		Object obj;
		try {
			obj = point.proceed();
			return obj;
		} finally {
			long end = System.currentTimeMillis();
			System.out.println(signatureStr);
		}
		
	}
	@Before("pointCutMethod()")
	public void beforeAdvice() {
		System.out.println("beforeAdvice()");
	}
}
