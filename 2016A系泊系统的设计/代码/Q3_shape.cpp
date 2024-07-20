#include<iostream>
#include<cstdio>
#include<cstring>
#include<cmath>
#include<algorithm>
#include<ctime>
using namespace std;
#define MAXN 1005
#define g 9.8
#define pi 3.14159
double INF=99999;
double L=1,Rfb=1,rou=1025,Mfb=1000;
double Ffengx,Ffengy,Ffu,h,Vf,Vs;
double theat[MAXN],jiao[MAXN];
double x[10];
double y[10];
double T[MAXN];
double Xj,Yj;
double Theat;
double Fx[MAXN],Fy[MAXN];
double sum=0,sum2=0;
double ans;
double windj;
double Fw,Vw,weigh;
double type[10][5];
double Ds[10];
int Type,number;
void fb()
{
    double S=(2-h)*2*cos(windj)+pi*1*1*sin(windj);
    Ffengx=0.625*S*Vf*Vf*cos(windj);
    Ffengy=0.625*S*Vf*Vf*sin(windj);
    Fw=374*2*h*Vw*Vw;
    Ffu=rou*g*pi*Rfb*Rfb*h;
    double Gfb=1000*g;
    x[1]=Ffengx+Fw;
    y[1]=Ffu-Gfb-Ffengy;
}
void steel()
{
    cout<<"钢管的角度:"<<endl;
    double G=10*g-rou*g*pi*0.025*0.025*L;
    for(int i=2;i<=5;i++)
    {
        Fw=374*Vw*Vw*0.05;
        theat[i-1]=atan((y[i-1]*L-G*L/2)/(x[i-1]*L+Fw*L/2))/pi*180;
        y[i]=y[i-1]-G;
        x[i]=x[i-1]+Fw;
        sum+=L*sin(theat[i-1]/180*pi);
        sum2+=L*cos(theat[i-1]/180*pi);
        cout<<theat[i-1]<<endl;
    }
    double Gg=weigh*g;
    double Gt=100*g-rou*g*pi*0.15*0.15*L;
    Fw=374*Vw*Vw*0.3;
    Theat=atan((y[5]*L-Gt*L/2)/(x[5]*L+Fw*L/2))/pi*180;
    Yj=y[5]-Gg-Gt;
    Xj=x[5]+Fw;
    sum+=L*sin(Theat/180*pi);
    sum2+=L*cos(Theat/180*pi);
    cout<<"钢桶的角度:"<<endl;
    cout<<Theat<<endl;
}
void chain()
{
    cout<<"锚链的角度:"<<endl;
    Fw=Ds[Type]*374*Vw*Vw;
    Fx[0]=Xj;
    Fy[0]=Yj;
    double l=type[Type][1];
    double G=type[Type][2]*l*g;
    for(int i=1;i<=number;i++)
    {
        Fy[i]=Fy[i-1]-G;
        Fx[i]=Fx[i-1]+Fw;
        jiao[i]=atan((Fy[i-1]*l-G*l/2)/(Fx[i-1]*l+Fw*l/2))/pi*180;
        if(jiao[i]<=0)
        {
            jiao[i]=0;
            sum+=0;
            sum2+=l;
            cout<<jiao[i]<<endl;
            continue;
        }
        sum+=l*sin(jiao[i]/180*pi);
        sum2+=l*cos(jiao[i]/180*pi);
        cout<<jiao[i]<<endl;
    }
}
void initial()
{
    type[1][1]=0.078;
    type[1][2]=3.2;
    type[2][1]=0.105;
    type[2][2]=7;
    type[3][1]=0.120;
    type[3][2]=12.5;
    type[4][1]=0.150;
    type[4][2]=19.5;
    type[5][1]=0.180;
    type[5][2]=28.12;
    Ds[1]=0.0017;
    Ds[2]=0.0032;
    Ds[3]=0.0049;
    Ds[4]=0.0076;
    Ds[5]=0.0109;
}
double Abs(double a)
{
    if(a>0)
        return a;
    return -a;
}
int main()
{
    Type=3;
    number=162;
    weigh=2816;
    h=1.3;
    initial();
    cout<<"请输入风的速度(m/s):"<<endl;
    cin>>Vf;
    cout<<"请输入风向与水平面的夹角(°):"<<endl;
    cin>>windj;
    cout<<"请输入海水流速(m/s):"<<endl;
    cin>>Vw;
    fb();
    steel();
    chain();
    cout<<"游动范围半径:"<<endl;
    cout<<sum2<<endl;
    return 0;
}
