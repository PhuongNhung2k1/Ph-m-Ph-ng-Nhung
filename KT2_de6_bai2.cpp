#include<bits/stdc++.h>
using namespace std;
class HT{
	private:
		float r;
	public:
	HT(){
		r=0;
	}
	HT(float bk){
		r = bk;
	}
	float dientich();
	friend ostream & operator<<(ostream &os, HT x);
	HT operator + (HT x);
	HT operator - (HT x);
	HT operator > (HT x);
	HT operator < (HT x);
};
float HT::dientich(){
	return 2*M_PI*r*r;
}
ostream & operator<<(ostream &os, HT x){
	os<<"Dien tich hinh tron:"; os<<x.dientich();
}
HT HT ::operator + (HT x){
	return dientich() + x.dientich();
}
HT HT ::operator - (HT x){
	return dientich() - x.dientich();
}
HT	HT ::operator > (HT x){
	if(r > x.r){
		cout<<"The tich hinh tron P>Q";
	}
}
HT	HT ::operator < (HT x){
	if(r < x.r){
		cout<<"The tich hinh tron P<Q";
	}
}
int main(){
	HT P(2.5), Q(1.5);
	cout<<"Tong dien tich hai ht:"<<P.dientich() + Q.dientich()<<endl;
	cout<<"hieu dien tich hai ht:"<<P.dientich() - Q.dientich()<<endl;
	P>Q;
	P<Q;
	return 0;
}
