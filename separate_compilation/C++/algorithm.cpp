#include <iostream>
#include <utility>
#include <limits>
#include <stdlib.h>

using namespace std;

extern int n;
extern int m;
extern int a[100];
extern int b[100];

pair<int, int> algorithm(){
	int i = 0;
	int j = 0;
	int n1 = 0;
	int n2 = 0;
	int difference = numeric_limits<int>::max();
	
	while(i < n && j < m){
		if(abs(a[i] - b[j]) < difference){
			difference = abs(a[i] - b[j]);
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
	
	return make_pair(n1, n2);
}