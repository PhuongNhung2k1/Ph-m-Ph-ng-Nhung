#include <iostream>

using namespace std;

class Date{
  private:
    int ngay, thang, nam;
  public:
    void Nhap();
    void Xuat();
};

class NSX{
  private:
    char tenNSX[100];
    char diaChi[100];
  public:
    void Nhap();
    void Xuat();
};

class Hang{
  private:
    char tenHang[100];
    NSX x;
    long donGia;
  public:
    void Nhap();
    void Xuat();
};

class TiVi : public Hang{
  private:
    double kichThuoc;
    Date ngayNhap;
  public:
    void Nhap();
    void Xuat();
};

void Date::Nhap(){
  cout << "Nhap ngay: ";
  cin >> ngay;
  cout << "Nhap thang: ";
  cin >> thang;
  cout << "Nhap nam: ";
  cin >> nam;
}

void Date::Xuat(){
  cout << ngay << "/" << thang << "/" << nam << endl;
}

void NSX::Nhap(){
  cout << "Nhap ten NSX: ";
  fflush(stdin);
  gets(tenNSX);
  cout << "Nhap dia chi: ";
  fflush(stdin);
  gets(diaChi);
}

void NSX::Xuat(){
  cout << "Ten NSX: " << tenNSX << endl;
  cout << "Dia chi: " << diaChi << endl;
}

void Hang::Nhap(){
  cout << "Nhap ten hang: ";
  fflush(stdin);
  gets(tenHang);
  x.Nhap();
  cout << "Nhap don gia: ";
  cin >> donGia;
}

void Hang::Xuat(){
  cout << "Ten hang: " << tenHang << endl;
  x.Xuat();
  cout << "Don gia: " << donGia << endl;
}

void TiVi::Nhap(){
  Hang::Nhap();
  cout << "Nhap kich thuoc: ";
  cin >> kichThuoc;
  ngayNhap.Nhap();
}

void TiVi::Xuat(){
  Hang::Xuat();
  cout << "Kich thuoc: " << kichThuoc << endl;
  ngayNhap.Xuat();
}

int main(){
  TiVi tivi;
  tivi.Nhap();
  cout << "--------------------------TIVI--------------------------" << endl;
  tivi.Xuat();
  return 0;
}
