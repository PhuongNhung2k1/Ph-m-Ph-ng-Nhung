#include<bits/stdc++.h>
using namespace std;
class Mang{
	private:
		int n;
		int *a;
	public:
		friend istream &operator >>(istream &is, Mang &x);
		friend ostream &operator <<(ostream &os, Mang x);
		Mang operator ++();
		Mang operator --();
};
istream &operator >>(istream &is, Mang &x){
 	cout<<"nhap so luong phan tu:"<<endl;
 	is>>x.n;
 	x.a = new int[x.n];
 		for(int i=0; i<x.n ;i++){
 			cout<<"a["<<i<<"]=";
 			is>>x.a[i];
		 }
	return is;
 } 
ostream &operator <<(ostream &os, Mang x){
 	for(int i=0 ; i<x.n; i++){
 		os<<x.a[i]<<"  ";
	 }
	 return os;
 }
 Mang Mang:: operator ++(){
 	for(int i=0 ;i<n-1; i++){
 		for(int j =i+1; j<n ; j++){
 			if(a[i]>a[j]){
 				int tam = a[i];
 				a[i]= a[j];
 				a[j]= tam;
			 }
		 }
	 }
	 return *this;
 }
  Mang Mang:: operator --(){
 	for(int i=0 ;i<n-1; i++){
 		for(int j =i+1; j<n ; j++){
 			if(a[i]<a[j]){
 				int tam = a[i];
 				a[i]= a[j];
 				a[j]= tam;
			 }
		 }
	 }
	 return *this;
 }
int main(){
	Mang m1;
	cout<<"nhap mang :";
	cin>>m1;
	cout<<"\nmang vua nhap la:";
	cout<<m1;
	fstream f("mang.txt",ios::out);
	f<<"\nmang sau khi sap xep tang la:";
	f<<++m1;
	f<<"\nmang sau khi sap xep giam la:";
	f<<--m1;
	f.close();
	ifstream f2("mang.txt",ios::in);
	char S[200];
	while(!f2.eof())
	{
 	f2.getline(S, 200);
		cout<<S<<endl;
	}
	f2.close();
	return 0;
}
