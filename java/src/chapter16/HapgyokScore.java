package chapter16;

import java.util.function.IntPredicate;

public class HapgyokScore implements IntPredicate{

	@Override
	public boolean test(int value) {
		boolean result = value>=60;
		return result;
	}

}
