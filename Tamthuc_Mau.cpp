#include <iostream>

using namespace std;

class TamThuc{
  private:
    double a, b, c;
  public:
    TamThuc(){ a = b = c = 0; }
    TamThuc(double a, double b, double c){
      this->a = a;
      this->b = b;
      this->c = c;
    }
    TamThuc operator-();
    TamThuc operator+(TamThuc x);
    TamThuc operator-(TamThuc x);
    friend ostream& operator<<(ostream &os, TamThuc x);
};

TamThuc TamThuc::operator-(){
  TamThuc t;
  t.a = -this->a;
  t.b = -this->b;
  t.c = -this->c;
  return t;
}

TamThuc TamThuc::operator+(TamThuc x){
  TamThuc tong;
  tong.a = this->a + x.a;
  tong.b = this->b + x.b;
  tong.c = this->c + x.c;
  return tong;
}

TamThuc TamThuc::operator-(TamThuc x){
  TamThuc hieu;
  hieu.a = this->a - x.a;
  hieu.b = this->b - x.b;
  hieu.c = this->c - x.c;
  return hieu;
}

ostream& operator<<(ostream &os, TamThuc x){
  os << x.a << "x^2";
  if(x.b < 0){
    os << x.b << "x";
  } else {
    os << "+" << x.b << "x";
  }
  if(x.c < 0){
    os << x.c;
  } else {
    os << "+" << x.c;
  }
  return os;
0
}

int main(){
  TamThuc tt1(1, -2, 3);
  TamThuc tt2(-4, 7, -3);
  TamThuc tt3, tt4, tt5, tt6;
  tt3 = -tt1;
  tt4 = -tt2;
  cout << "Tam thuc 1: " << tt3 << endl;
  cout << "Tam thuc 2: " << tt4 << endl;
  tt5 = tt3 + tt4;
  tt6 = tt3 - tt4;
  cout << "Tong hai tam thuc: " << tt5 << endl;
  cout << "Hieu hai tam thuc: " << tt6 << endl;
  return 0;
}
