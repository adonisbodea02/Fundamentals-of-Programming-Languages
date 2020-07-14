#include <iostream>
#include <utility>

using namespace std;

int n, m, a[100], b[100]; 

extern void quickSort(int arr[], int low, int high);

extern pair<int, int> algorithm();

void readNumbers(){
	cout << "Give the number of elements for the first array: ";
	cin >> n;
	for(int i = 0; i < n; i++){
		cout << "Number on the position " << i << " for the first array: ";
		cin >> a[i];
	}
	cout << "Give the number of elements for the second array: ";
	cin >> m;
	for(int i = 0; i < m; i++){
		cout << "Number on the position " << i << " for the second array: ";
		cin >> b[i];
	}
}

void outputSolution(int a, int b){
	cout << "The pair with the smallest difference is (" << a  <<"," << b << ")";
}

int main(){
	readNumbers();
	quickSort(a, 0, n-1);
	quickSort(b, 0, m-1);
	
	pair<int, int> p;
	
	p = algorithm();
	
	outputSolution(p.first, p.second);
}