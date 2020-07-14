import java.util.Scanner;

public class Main{
	
	public static void main(String args[]) 
    { 
        int a[] = readArray();
		int b[] = readArray();
  
        Sort s = new Sort(); 
        s.quickSort(a, 0, a.length-1);
		s.quickSort(b, 0, b.length-1);
		
		Algorithm al = new Algorithm();
		
		Pair p = al.algorithm(a, b);
		
        System.out.print("The pair with the smalles difference is (" + Integer.toString(p.first) + "," + Integer.toString(p.second) + ")");
    } 
	
	public static int[] readArray(){
		int n = 0;
        Scanner s = new Scanner(System.in);
        System.out.print("Enter number of elements you want in array:");
        n = s.nextInt();
        int a[] = new int[n];
        for(int i = 0; i < n; i++)
        {
			System.out.println("Number on the position " + Integer.toString(i) + ":");
            a[i] = s.nextInt();
        }
		
		return a;
	}
}