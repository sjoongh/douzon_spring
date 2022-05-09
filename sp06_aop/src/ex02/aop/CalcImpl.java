package ex02.aop;

public class CalcImpl implements ICalc {

	@Override
	public int add(int x, int y) {
		int result = x + y;
		return result;
	}

	@Override
	public int mul(int x, int y) {
		int result = x * y;
		return result;
	}

}
