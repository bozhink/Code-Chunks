package directedsandpile.stochastic;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;

import directedsandpile.stochastic.model.pi4Model;

public class pi4Simulation {
	
	@SuppressWarnings("resource")
	public static void main(String[] args) {
		int L;
		int N;
		String filename;
		
		if (args.length < 3) {
			System.err.println("Usage: program <N> <L> <file>)");
			return;
		} else {
			N = Integer.parseInt(args[0]);
			L = Integer.parseInt(args[1]);
			filename = args[2];
		}
		
		pi4Model model = new pi4Model(L);
		System.out.println("Created pi/4 model with size "+L);
		int t, s;
		
		String output;
		RandomAccessFile fout;
		try {
			fout = new RandomAccessFile(filename, "rw");
		} catch (FileNotFoundException e) {
			System.err.println("Cannot open output file!");
			return;
		}
		
		try {
			// Go to the end of the file
			fout.seek(fout.length());
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		for (int i=0; i<N; i++) {
			model.Randomize();
			model.DropSand();
			model.update();
			t = model.Get_t();
			s = model.Get_s();
			output = t + " " + s + "\n";
			//System.out.print(output);
			try {
				fout.write(output.getBytes());
			} catch (IOException e) {
				System.err.println("Error writing to output file!");
				return;
			}
			if ((i % (N/1000))==0) {
				System.out.print("\rIteration #" + i);
			}
		}
		System.out.println();
		
		try {
			fout.close();
		} catch (IOException e) {
			System.err.println("Error closing output file!");
		}
		
	}
	
}
