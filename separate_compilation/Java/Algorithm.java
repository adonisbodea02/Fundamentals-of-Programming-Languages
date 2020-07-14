public class Algorithm{
	public Pair algorithm(int a[], int b[]){
		int i = 0;
		int j = 0;
		int n1 = 0;
		int n2 = 0;
		int difference = Integer.MAX_VALUE;
		
		while(i < a.length && j < b.length){
			if(Math.abs(a[i] - b[j]) < difference){
				difference = Math.abs(a[i] - b[j]);
				n1 = a[i];
				n2 = b[j];
			}
			
			if(a[i] < b[j]){
				i++;
			}
			else{
				j++;
			}
		}
		
		return new Pair(n1, n2);
	}
}