#include<stdio.h>
#include <string.h>

int numLongChains (int bound, int minimumLength)
{
	int* filterChainsSmaller(int bound, int minimumLength)
	{
		
		int* generateLengthsArray(int bound)
		{
			static int a[1000];
			
			int generateChainLength(int number){
				int i = 1;
				while(number != 1){
					if(number % 2 == 0){
						number = number / 2;
					}
					else{
						number = number * 3 + 1;
					}
					i++;
				}
				return i;
			}
			
			for(int i = 1; i < bound + 1; i++){
				a[i-1] = generateChainLength(i);
			}
			
			return a;
		}
		
		int* p = generateLengthsArray(bound);
		for(int i = 0; i < bound; i++){
			if(p[i] <= minimumLength){
				p[i] = 0;
			}
		}
		
		return p;
	}
	
	int counter = 0;
	
	int* p = filterChainsSmaller(bound, minimumLength);
	for(int i = 0; i < bound; i++){
		if(p[i] > 0){
			counter++;
		}
	}
	
	return counter;
}

int main(){
	
	int ok = 1;
	while(ok)
	{
		int bound, minimumLength;  
		printf("Please enter the upper bound:\n");
		scanf("%d", &bound);
		printf("Please enter the minimum length:\n");
		scanf("%d", &minimumLength);
		printf("The number of numbers smaller than the given bound for which the chain is longer than the limit specified is:\n");
		printf("%d\n", numLongChains(bound, minimumLength));
		printf("Wanna try again? (type Yes)\n");
		char s[100];
		scanf("%s", s);
		if(strcmp(s, "Yes") != 0){
			ok = 0;
		}
	}
	return 0;
}