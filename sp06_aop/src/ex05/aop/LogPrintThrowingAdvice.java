package ex05.aop;

import org.springframework.aop.ThrowsAdvice;

public class LogPrintThrowingAdvice implements ThrowsAdvice {

	@Override
	public String toString() {
		return "LogPrintThrowingAdvice [getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
	
}
