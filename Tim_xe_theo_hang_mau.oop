#include <iostream>
#include <iomanip>
#include <string.h>

using namespace std;

class XeHoi;

class NhaSanXuat{
private:
    char maNSX[10];
    char tenNSX[50];
    char diaChiNSX[50];
friend class XeHoi;
friend void TimXeCoMauVaDiaChiNSX(XeHoi *x, int n, const char *mau, const char *diaChiNSX);
};

class XeHoi{
private:
    char nhanHieu[20];
    NhaSanXuat NSX;
    char mauSon[10];
    char xuatXu[15];
    long giaBan;
public:
    void Nhap();
    void Xuat();
friend void TimHangXe(XeHoi *x, int n, const char *nhanHieu);
friend void TimXeCoMauVaDiaChiNSX(XeHoi *x, int n, const char *mau, const char *diaChiNSX);
};

void XeHoi::Nhap(){
    cout << "\tNhap nhan hieu: ";
    fflush(stdin);
    gets(nhanHieu);
    cout << "\tNhap ma NSX: ";
    fflush(stdin);
    gets(NSX.maNSX);
    cout << "\tNhap ten NSX: ";
    fflush(stdin);
    gets(NSX.tenNSX);
    cout << "\tNhap dia chi NSX: ";
    fflush(stdin);
    gets(NSX.diaChiNSX);
    cout << "\tNhap mau son: ";
    fflush(stdin);
    gets(mauSon);
    cout << "\tNhap xuat xu: ";
    fflush(stdin);
    gets(xuatXu);
    cout << "\tNhap gia ban: ";
    cin >> giaBan;
}

void XeHoi::Xuat(){
    cout << setw(10) << nhanHieu;
    cout << setw(10) << NSX.maNSX;
    cout << setw(25) << NSX.tenNSX;
    cout << setw(30) << NSX.diaChiNSX;
    cout << setw(10) << mauSon;
    cout << setw(15) << xuatXu;
    cout << setw(15) << giaBan;
}

void TieuDe(){
    cout << setw(10) << "Nhan hieu";
    cout << setw(10) << "Ma NSX";
    cout << setw(25) << "Ten NSX";
    cout << setw(30) << "Dia chi NSX";
    cout << setw(10) << "Mau son";
    cout << setw(15) << "Xuat xu";
    cout << setw(15) << "Gia ban" << endl;
}

void TimHangXe(XeHoi *x, int n, const char *hang){
    bool check = false;
    for(int i = 0; i < n; i++){
        if(strcmpi(x[i].nhanHieu, hang) == 0){
            check = true;
            break;
        }
    }
    if(check){
        cout << "-------------------------DANH SACH XE HOI HANG "<< hang << "-------------------------" << endl;
        TieuDe();
        for(int i = 0; i < n; i++){
            if(strcmpi(x[i].nhanHieu, hang) == 0){
                x[i].Xuat();
                cout << endl;
            }
        }
    } else {
        cout << "Khong co xe hoi cua hang " << hang << endl;
    }
}

void TimXeCoMauVaDiaChiNSX(XeHoi *x, int n, const char *mau, const char *diaChiNSX){
    bool check = false;
    for(int i = 0; i < n; i++){
        if(strcmpi(x[i].mauSon, mau) == 0 && strcmpi(x[i].NSX.diaChiNSX, diaChiNSX) == 0){
            check = true;
            break;
        }
    }
    if(check){
        cout << "-------------------------DANH SACH XE HOI CO MAU "<< mau << " va dia chi NSX " << diaChiNSX << "-------------------------" << endl;
        TieuDe();
        for(int i = 0; i < n; i++){
            if(strcmpi(x[i].mauSon, mau) == 0 && strcmpi(x[i].NSX.diaChiNSX, diaChiNSX) == 0){
                x[i].Xuat();
                cout << endl;
            }
        }
    } else {
        cout << "Khong co xe hoi mau son " << mau << " va dia chi NSX " << diaChiNSX << endl;
    }
}

int main(){
    int n;
    cout << "Nhap so xe hoi: ";
    cin >> n;
    XeHoi *x = new XeHoi[n];
    for(int i = 0; i < n; i++){
        cout << "Nhap thong tin xe hoi thu " << i + 1 << endl;
        x[i].Nhap();
    }
    cout << "-------------------------DANH SACH XE HOI-------------------------" << endl;
    TieuDe();
    for(int i = 0; i < n; i++){
        x[i].Xuat();
        cout << endl;
    }
    TimHangXe(x, n, "Toyota");
    TimXeCoMauVaDiaChiNSX(x, n, "Green", "Nhat Ban");
    return 0;
}
