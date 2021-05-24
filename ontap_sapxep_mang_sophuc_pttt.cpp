#include<bits/stdc++.h>
using namespace std;
class mang{
	private:
		int n;
		int *a;
	public:
		friend istream &operator >>(istream &is, mang &x);
		friend ostream &operator <<(ostream &os, mang x);
		mang operator++();
		mang operator+(mang x);// sap xep mang
		mang operator--();
		mang operator - (mang x);
};
istream &operator >>(istream &is, mang &x){
	cout<<"nhap so luong phan tu cua mang:";
	is>>x.n;
	x.a = new int[x.n];
	for(int i=0 ; i<x.n ; i++){
		cout<<"a["<<i<<"]=";
		is>>x.a[i];
	}
	return is;
}
ostream &operator <<(ostream &os, mang x){
	for(int i=0 ; i<x.n; i++){
		os<<x.a[i]<<"  ";
	}
	return os;
}
mang mang ::operator+(mang x){
	mang tg;
	tg.n = n;
	for(int i=0 ; i<tg.n; i++){
		tg.a[i]= this->a[i]+ x.a[i];
	}
	return tg;
}
mang mang ::operator-(mang x){
	mang tg;
	tg.n = n;
	for(int i=0 ; i<tg.n; i++){
		tg.a[i]= this->a[i]- x.a[i];
	}
	return tg;
}
mang mang:: operator++(){
	for(int i=0 ; i<n-1; i++){
		for(int j=i+1; j<n ; j++){
			if(a[i]>a[j]){
				int tam = a[i];
				a[i] = a[j];
				a[j]= tam;
			}
		}
	}
	return *this;
}
mang mang:: operator--(){
	for(int i=0 ; i<n-1; i++){
		for(int j=i+1; j<n ; j++){
			if(a[i]< a[j]){
				int tam = a[i];
				a[i] = a[j];
				a[j]= tam;
			}
		}
	}
	return *this;
}
int main(){
	mang m1,m2 ,tong, hieu;
	cout<<"nhap mang :";
	cin>>m1;
	cin>>m2;
	cout<<"mang vua nhap la:"<<m1<<endl;
//	tong = m1+m2;
//	hieu = m1-m2;
//	cout<<"tong"<<tong<<endl;
//	cout<<"hieu"<<hieu<<endl;
	cout<<"tang dan:"<<++m1<<endl;
	cout<<"giam dan:"<<--m1<<endl;
	return 0;
}






/*class sophuc{
	private:
		float thuc, ao;
	public:
		sophuc(){
			thuc = ao =0;
		}
		sophuc(float x, float y){
			thuc = x,
			ao = y;
		}
	//friend istream &operator>> (istream &is, sophuc &x);
	friend ostream &operator<< (ostream &os, sophuc x);
	sophuc operator +(sophuc x);
	sophuc operator -(sophuc x);
};
ostream &operator<< (ostream &os, sophuc x){
	os<<x.thuc;
		if(x.ao<0 ){
			os<<x.ao<<"*i ";
	    }
	    os<<"+"<<x.ao<<"*i";
}
sophuc sophuc:: operator +(sophuc x){
	sophuc k;
	k.thuc = thuc +x.thuc;
	k.ao = ao +x.ao;
	return k;
}
sophuc sophuc:: operator -(sophuc x){
	sophuc k;
	k.thuc = thuc -x.thuc;
	k.ao = ao -x.ao;
	return k;
}
int main(){
	sophuc sp1(-2,-3.5), sp2(1.5,-2), tong, hieu;
	tong = sp1+ sp2;
	hieu = sp1-sp2;
	cout<<"tong :"<<tong<<endl;
	cout<<"hieu :"<<hieu<<endl;
	return 0;
}*/
