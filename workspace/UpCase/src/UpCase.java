
public class UpCase {

	public static void main(String[] args) 
	{
		char ch;
		// букви от горен регистър
		for (int i=0; i<10; i++)
		{
			ch = (char) ('a' + i);
			System.out.print(ch);
			
			// Тази конструкция изключва 6-я бит
			ch = (char) ((int) ch & 65503);
			System.out.print(ch + " ");
		}
		System.out.println();
		// Букви от долен регистър
		for (int i=0; i<10; i++)
		{
			ch = (char) ('A' + i);
			System.out.print(ch);
			
			// Тази конструкция изключва 6-я бит
			ch = (char) ((int) ch | 32);
			System.out.print(ch + " ");
		}
		System.out.println();
		
		//ENCODE
		String msg="this is a test";
		String encmsg="";
		String decmsg="";
		int key=88;
		System.out.print("Original message: ");
		System.out.println(msg);
		
		//coding
		for (int i=0; i<msg.length(); i++)
			encmsg = encmsg + (char) (msg.charAt(i) ^ key);
		
		System.out.print("Encoded message: ");
		System.out.println(encmsg);
		
		for (int i=0; i<msg.length(); i++)
			decmsg = decmsg + (char) (encmsg.charAt(i) ^ key);
		System.out.print("Decoded message: ");
		System.out.println(decmsg);
		
		//
		// Shift demo
		//
		
		int val=1;
		for (int i=0; i<8; i++)
		{
			for (int t=128; t>0; t=t/2)
			{
				if ((val & t)!=0) System.out.print("1 ");
				else System.out.print("0 ");
			}
			System.out.println();
			val = val << 1;
		}
		System.out.println();
		val = 128;
		for (int i=0; i<8; i++)
		{
			for (int t=128; t>0; t=t/2)
			{
				if ((val & t)!=0) System.out.print("1 ");
				else System.out.print("0 ");
			}
			System.out.println();
			val = val >> 1;
		}
		System.out.println();
		
	}

}
