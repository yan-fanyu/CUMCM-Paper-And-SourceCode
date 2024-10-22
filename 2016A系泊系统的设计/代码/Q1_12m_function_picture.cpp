#include<iostream>
#include<cstdio>
#include<cstring>
#include<cmath>
#include<algorithm>
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
double sum=0;
double ans;
double windj;
double Abs(double a)
{
    if(a>0)
        return a;
    return -a;
}
void fb()
{
    Vf=12;
    double S=(2-h)*2*cos(windj)+pi*1*1*sin(windj);
    Ffengx=0.625*S*Vf*Vf*cos(windj);
    Ffengy=0.625*S*Vf*Vf*sin(windj);
    Ffu=rou*g*pi*Rfb*Rfb*h;
    double Gfb=1000*g;
    x[1]=Ffengx;
    y[1]=Ffu-Gfb-Ffengy;
}
void steel()
{
    double G=10*g-rou*g*pi*0.025*0.025*L;
    for(int i=2;i<=5;i++)
    {
        y[i]=y[i-1]-G;
        x[i]=x[i-1];
        theat[i-1]=atan((y[i-1]*L-G*L/2)/(x[i-1]*L))/pi*180;
        //cout<<theat[i-1]<<endl;
        sum+=L*sin(theat[i-1]/180*pi);
    }
    double Gg=1200*g;
    double Gt=100*g-rou*g*pi*0.15*0.15*L;
    Yj=y[5]-Gg-Gt;
    Xj=x[5];
    Theat=atan((y[5]*L-Gt*L/2)/(x[5]*L))/pi*180;
    sum+=L*sin(Theat/180*pi);
    //cout<<Theat<<endl;
}
void chain()
{
    Fx[0]=Xj;
    Fy[0]=Yj;
    double l=0.105;
    double G=7*l*g;
    //cout<<G<<endl;
    for(int i=1;i<=210;i++)
    {
        Fy[i]=Fy[i-1]-G;
        Fx[i]=Fx[i-1];
        jiao[i]=atan((Fy[i-1]*l-G*l/2)/(Fx[i-1]*l))/pi*180;
        //cout<<jiao[i]<<endl;
        if(jiao[i]<=0)
            break;
        sum+=l*sin(jiao[i]/180*pi);
    }
}
int main()
{
    freopen("12m_pic.out","w",stdout);
    windj=0;
    INF=99999;
    h=0;
    while(1)
    {
        if(h>2)
            break;
        sum=0;
        h=h+0.001;
        fb();
        steel();
        chain();
        cout<<Abs(sum-18)<<endl;
        if(Abs(sum-18)<INF)
        {
            INF=Abs(sum-18);
            ans=h;
        }
    }
    return 0;
}
