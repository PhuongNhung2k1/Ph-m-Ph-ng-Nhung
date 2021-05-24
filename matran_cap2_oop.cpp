#include <iostream>

using namespace std;
class matrix{
private:
    int m,n;
    double **a;
public:
    friend istream& operator>>( istream &is, matrix &x);
    friend ostream& operator<<( ostream &os, matrix x);
    matrix operator -();
    matrix operator+( matrix x);
    matrix operator-( matrix x);
};
istream& operator >>( istream &is, matrix &x){
cout<<" nhap so dong:";
is>>x.m;
cout<<" nhap so cot:";
is>>x.n;
x.a= new double*[x.m];
for( int  i =0 ;i< x.m ; i++){
    x.a[i]=new double [x.n];
}
for( int i =0 ; i< x.m;i++){
    for( int j =0 ; j < x.n; j++){
        cout<<"\ta["<<i<<"]["<<j<<"]=";
        is>>x.a[i][j];
    }

    return is;
    }
}
ostream& operator <<( ostream &os, matrix x){
for( int i =0 ; i< x.m; i++){
for( int j=0; j< x.n; j++)
    {
        os<<x.a[i][j]<<" ";
    }
    os<<endl;
}
return os;
}
matrix matrix::operator-(){
for( int i =0 ; i< this->m; i++){
for( int j =0 ; j < this->n; j++)
    {
       this->a[i][j]=-this->a[i][j];
    }
}
return *this;
}
matrix matrix::operator+(matrix x){
matrix tong;
if( this->m!=x.m&&this->n!=x.n){
    return *this;
}
tong.m=this->m;
tong.n=this->n;
tong.a=new double *[tong.m];
for( int i =0 ; i< tong.m ; i++){
    tong.a[i]=new double [tong.n];
}
for( int i =0 ; i< tong.m ; i++){
    for( int j=0 ;j<tong.n;j++){
        tong.a[i][j]=this->a[i][j]+x.a[i][j];
     }
  }
  return tong;
}

matrix matrix::operator-(matrix x){
matrix hieu;
if( this->m!=x.m&&this->n!=x.n){
    return *this;
}
hieu.m=this->m;
hieu.n=this->n;
x.a=new double*[hieu.m];
for( int i =0 ; i< hieu.m; i++){
   hieu.a[i]=new double[hieu.n];
}
for( int i =0 ; i< hieu.m; i++){
    for( int j=0 ; j< hieu.n; j++){
        hieu.a[i][j]=this->a[i][j]-x.a[i][j];    }
}
return hieu;
}

int main()
{matrix p,q,mt1,mt2,mt3,mt4;
cout<<" nhap mat tran p:";
cin>>p;
cout<<" nhap q:";
cin>>q;
mt1=-p;
cout<<" mtr sau doi dau p:"<<endl;
cout<<mt1<<endl;
mt2=-q;
cout<<" mtr sau doi dau p:"<<endl;
cout<<mt2<<endl;

    return 0;
}
