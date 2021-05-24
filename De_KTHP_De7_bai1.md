#include<bits/stdc++.h>
using namespace std;
class Banhkeo;
class Nhasx{
	private:
		char tennsx[20];
		char diachi[20];
	public:
		friend class Hanghoa;
		friend void timten(Banhkeo *bk, const char*tennsx,int n);
};
class Date{
	private:
		int ngay,thang, nam;
	public:
		friend class Banhkeo;
		friend void sx_tang_namsx(Banhkeo *bk , int n);
};
class Hanghoa{
	protected:
		char tenhang[20];
		Nhasx nsx;
		int dongia;
	public:
		void input(){
			cout<<"ten hang:";  fflush(stdin); gets(tenhang);
			cout<<" ten nsx:"; fflush(stdin); gets(nsx.tennsx);
			cout<<" dia chi nsx:"; fflush(stdin); gets(nsx.diachi);
			cout<<"don gia :"; cin>>dongia;
		}
		void output(){
			cout<<setw(15)<<tenhang;
			cout<<setw(15)<<nsx.tennsx;
			cout<<setw(15)<<nsx.diachi;
			cout<<setw(15)<<dongia;
		}
};
class Banhkeo:public Hanghoa{
	private:
		int kichthuoc;
		Date ngaynhap;
	public:
		void nhap();
		void xuat();
	friend void sx_tang_namsx(Banhkeo *bk , int n);
	friend void timten(Banhkeo *bk, const char*tennsx,int n);
	friend void chen(Banhkeo *bk,int &n, int k);
	friend void danhsachbk(Banhkeo *bk,int n);
};
void tieude(){
	cout<<setw(15)<<"ten hang";
	cout<<setw(15)<<"ten nsx";
	cout<<setw(15)<<"dia chi";
	cout<<setw(15)<<"don gia";
	cout<<setw(15)<<"Kich thuoc";
	cout<<setw(20)<<"ngay nhap"<<endl;
}
void Banhkeo::nhap(){
	Hanghoa::input();
	cout<<"kich thuoc:"; cin>>kichthuoc;
	cout<<"ngay nhap:"; cin>>ngaynhap.ngay;
	cout<<" thang :"; cin>>ngaynhap.thang;
	cout<<"nam:"; cin>>ngaynhap.nam;
}
void Banhkeo::xuat(){
	Hanghoa::output();
	cout<<setw(15)<<kichthuoc;
	cout<<setw(20)<<ngaynhap.ngay<<"/"<<ngaynhap.thang<<"/"<<ngaynhap.nam<<endl;
}
void sx_tang_namsx(Banhkeo *bk , int n){
	for(int i=0 ; i< n-1; i++){
		for(int j=i+1; j<n ; j++){
			if(bk[i].ngaynhap.nam > bk[j].ngaynhap.nam ){
				swap(bk[i], bk[j]);
			}
		}
	}
	for(int i=0 ; i<n ; i++){
		bk[i].xuat();
	}
}
void timten(Banhkeo *bk, const char *tennsx ,int n){
	bool check = false;
	for(int i =0 ; i<n; i++){
		if(strcmpi(bk[i].nsx.tennsx,tennsx)==0){
			check = true;
			break;
		}
	}
	if(check){
		for(int i=0 ; i< n; i++){
			if(strcmpi(bk[i].nsx.tennsx,tennsx)==0){
				bk[i].xuat();
			}
		}
	}
	else{
		cout<<" ko tim thay ten hang san xuat"<<endl;
	}
}
void danhsachbk(Banhkeo *bk,int n){
	tieude();
	for(int i=0 ; i<n ;i++){
		bk[i].xuat();
		cout<<endl;
	}
}
void chen(Banhkeo *bk, int &n, int k){
	bk = (Banhkeo *)realloc(bk, n+1);
	Banhkeo tam;
	tam.nhap();
	for(int i = n-1 ; i>=k-1 ;i--){
		bk[i+1] = bk[i];
	}
	bk[k-1]= tam;
	n++;
}
int main(){
	Banhkeo *bk;
	int n;
	cout<<"nhap vao so luong banh keo:"; cin>>n;
	bk = new Banhkeo[n];
	for(int i=0 ; i<n ; i++){
		cout<<"nhapbanh keo thu "<<i+1<<endl;
		bk[i].nhap();
	}
	cout<<"------------------------------Danh Sach Banh Keo Vua Duoc Nhap-----------------------"<<endl;
	for(int i=0;i< n ; i++){
		bk[i].xuat();
	}
	cout<<"------------------------------Danh sach banh keo duoc sap xep tang dan theo nam sx-------------------------"<<endl;
	sx_tang_namsx(bk,n);
	cout<<"------------------------------Danh Sach Banh Keo co hang sx -----------------------"<<endl;
	timten(bk,"Trang An",n);
	int k;
	cout<<"nhap vao vi tri can chen:";
	cin>>k;
	cout<<"----------------------------danh sach banh keo sau khi them----------------------------"<<endl;
	chen(bk,n,k);
	cout<<" danh sach tat ca sp"<<endl;
	danhsachbk(bk, n);
	return 0;
	
}
