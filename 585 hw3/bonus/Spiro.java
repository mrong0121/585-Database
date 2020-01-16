import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintStream;

public class Spiro {
	public static void main(String args[]) {
		double R = 8.0, r = 1.0, a = 4.0;
		try {
			PrintStream out = new PrintStream(new FileOutputStream("OutFile.txt"));
			for(double t = 0.00; t < 16 * Math.PI; t = t + 0.01){
				double x = (R + r) * Math.cos((r / R) * t) - a * Math.cos((1 + r / R) * t) - 118.2892712; 
				double y = (R + r) * Math.sin((r / R) * t) - a * Math.sin((1 + r / R) * t) + 34.0211550; 
				out.println(x +"," + y +"," + 0+"");
			}
			out.close();
	 	} catch (FileNotFoundException e) {
	      		e.printStackTrace();
	    }
	}
}

