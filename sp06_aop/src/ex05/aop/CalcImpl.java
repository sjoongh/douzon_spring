package ex05.aop;

public class CalcImpl implements ICalc {

	@Override
	public int add(int x, int y) {
		// 보조관심(cross-cutting-concern)
		int sum = x + y;
		// 보조관심(cross-cutting-concern)
		System.out.println("add 주관심사");
		return sum;
	}

	@Override
	public int mul(int x, int y) {
		int mul = x * y;   // 주관심사
		return mul;
	}

	@Override
	public int sub(int x, int y, int z) {
		
		if( y > x ) {
			throw new IllegalArgumentException("y값이 x보다 큽니다.");
		}
		
		int sub = x - y - z;  // 주관심사
		return sub;
	}

}
