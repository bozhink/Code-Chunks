package cellularautomata;

public class Code
{
	private int pattern[] = new int[8];
	private int pat[] = {0x80, 0x40, 0x20, 0x10, 0x8, 0x4, 0x2, 0x1};
	
	private void GetPattern (int code) {
		for (int i=0; i<8; i++) {
			pattern[i] = (code&pat[i])==pat[i] ? 1 : 0;
		}
	}
	
	public Code (byte code) {
		GetPattern(code);
	}
	
	public Code (int code) {
		GetPattern(code);
	}
	
	public Code (long code) {
		GetPattern((int)code);
	}

	public int Calculate(int a, int b, int c) {
		switch (a) {
		case 1:
			switch (b) {
			case 1:
				switch (c) {
				case 1:
					return pattern[0];
				case 0:
					return pattern[1];
				default:
					return 0;
				}
			case 0:
				switch (c) {
				case 1:
					return pattern[2];
				case 0:
					return pattern[3];
				default:
					return 0;
				}
			default:
				return 0;	
			}
		case 0:
			switch (b) {
			case 1:
				switch (c) {
				case 1:
					return pattern[4];
				case 0:
					return pattern[5];
				default:
					return 0;
				}
			case 0:
				switch (c) {
				case 1:
					return pattern[6];
				case 0:
					return pattern[7];
				default:
					return 0;
				}
			default:
				return 0;	
			}
		default:
			return 0;	
		}
	}
	public static int get(int a, int b, int c) {
		return (a-c) % 2;
	}
}
