#include<iostream>
#include<cstdio>
#include<ctime>
#include<cstring>
#include<cmath>
#include<algorithm>
using namespace std;
#define MAXN 1005
#define g 9.8
#define pi 3.14159
struct node
{
    int num[50];
    double H;
    double S;
    double w;
};
node gene[MAXN];
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
double windj;
double Fw,Vw;
double type[10][5];
double hmin,hmax,Rmin,Rmax;
double deltah,deltaR;
int n=100;//种群数量；
int dai=1000;//代数
int temp;
double Ds[10];
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
void value_before(int Type,int number,int weigh)
{
    double S=(2-h)*2*cos(windj)+pi*1*1*sin(windj);
    Ffengx=0.625*S*Vf*Vf*cos(windj);
    Ffengy=0.625*S*Vf*Vf*sin(windj);
    Fw=374*2*h*Vw*Vw;
    Ffu=rou*g*pi*Rfb*Rfb*h;
    double Gfb=1000*g;
    x[1]=Ffengx+Fw;
    y[1]=Ffu-Gfb-Ffengy;
    double G=10*g-rou*g*pi*0.025*0.025*L;
    for(int i=2;i<=5;i++)
    {
        Fw=374*Vw*Vw*0.05;
        theat[i-1]=atan((y[i-1]*L-G*L/2)/(x[i-1]*L+Fw*L/2))/pi*180;
        y[i]=y[i-1]-G;
        x[i]=x[i-1]+Fw;
        sum+=L*sin(theat[i-1]/180*pi);
        sum2+=L*cos(theat[i-1]/180*pi);
    }
    double Gg=weigh*g;
    double Gt=100*g-rou*g*pi*0.15*0.15*L;
    Fw=374*Vw*Vw*0.3;
    Theat=atan((y[5]*L-Gt*L/2)/(x[5]*L+Fw*L/2))/pi*180;
    Yj=y[5]-Gg-Gt;
    Xj=x[5]+Fw;
    sum+=L*sin(Theat/180*pi);
    sum2+=L*cos(Theat/180*pi);
    Fw=Ds[Type]*374*Vw*Vw;
    Fx[0]=Xj;
    Fy[0]=Yj;
    double l=type[Type][1];
    G=type[Type][2]*l*g;
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
            continue;
        }
        sum+=l*sin(jiao[i]/180*pi);
        sum2+=l*cos(jiao[i]/180*pi);
    }
}
double value(int m,int Type,int number,int weigh)
{
    double ans=999999;
    h=0;
    while(1)
    {
        if(h>2)
            break;
        sum=0;
        sum2=0;
        h=h+0.1;
        value_before(Type,number,weigh);
        if(sum+h>=16&&sum+h<=20&&Theat>=85&&jiao[number]<=16&&jiao[number]>=0)
        {
            if(sqrt(((h-hmin)/deltah)*((h-hmin)/deltah)+((sum2-Rmin)/deltaR)*((sum2-Rmin)/deltaR))<ans)
            {
                gene[m].H=h;
                gene[m].S=sum2;
                ans=sqrt(((h-hmin)/deltah)*((h-hmin)/deltah)+((sum2-Rmin)/deltaR)*((sum2-Rmin)/deltaR));
            }
        }
    }
    return ans;
}
void bianma(int i,int Type,int number,int weigh)
{
    for(int k=3;k>=1;k--)
    {
        gene[i].num[k]=Type%2;
        Type=Type/2;
    }
    for(int k=12;k>=4;k--)
    {
        gene[i].num[k]=number%2;
        number=number/2;
    }
    for(int k=24;k>=13;k--)
    {
        gene[i].num[k]=weigh%2;
        weigh=weigh/2;
    }
}
void chushi()
{
    for(int i=1;i<=n;i++)
    {
        int Type=rand()%5+1;
        int weigh=500+rand()%3500;
        int number=60+rand()%440;
        bianma(i,Type,number,weigh);
    }
}
void jiaocha()//交叉操作
{
    for(int i=1;i<=n-1;i++)
    {
        int k=rand()%n+1;
        for(int j=1;j<=k;j++)
            gene[temp].num[j]=gene[i].num[j];
        for(int j=k+1;j<=n;j++)
            gene[temp].num[j]=gene[i+1].num[j];
        temp++;
    }
}
void bianyi()//变异
{
    for(int i=1;i<=n;i++)
    {
        int k=rand()%n+1;
        for(int j=1;j<=n;j++)
            gene[temp].num[j]=gene[i].num[j];
        gene[temp].num[k]=1-gene[i].num[k];
        temp++;
    }
}
int Pow(int m)
{
    int ans=1;
    for(int i=1;i<=m;i++)
        ans*=2;
    return ans;
}
void jiema()
{
    for(int i=1;i<=temp-1;i++)
    {
        int Type=0,number=0,weigh=0;
        for(int j=1;j<=3;j++)
            Type+=gene[i].num[j]*Pow((3-j));
        for(int j=4;j<=12;j++)
            number+=gene[i].num[j]*Pow((12-j));
        for(int j=13;j<=24;j++)
            weigh+=gene[i].num[j]*Pow((24-j));
        gene[i].w=value(i,Type,number,weigh);
    }
}
bool cmp(node a,node b)
{
    return a.w<b.w;
}
void GA()
{
    chushi();
    for(int i=1;i<=dai;i++)
    {
        temp=n+1;
        jiaocha();
        bianyi();
        jiema();
        sort(&gene[1],&gene[temp],cmp);
        //cout<<i<<endl;
    }
}
int main()
{
    srand(time(NULL));
    cout<<"请输入风的速度(m/s),范围为0~36:"<<endl;
    cin>>Vf;
    cout<<"请输入风向与水平面的夹角(°),范围为0~90:"<<endl;
    cin>>windj;
    cout<<"请输入海水流速(m/s),范围为0~1.5:"<<endl;
    cin>>Vw;
    initial();
    hmin=1.24;
    hmax=1.45;
    deltah=hmax-hmin;
    Rmin=12.3278;
    Rmax=96.5646;
    deltaR=Rmax-Rmin;
    GA();
    int Type=0,number=0,weigh=0;
    for(int j=1;j<=3;j++)
        Type+=gene[1].num[j]*Pow((3-j));
    for(int j=4;j<=12;j++)
        number+=gene[1].num[j]*Pow((12-j));
    for(int j=13;j<=24;j++)
        weigh+=gene[1].num[j]*Pow((24-j));
    cout<<Type<<endl<<number<<endl<<weigh<<endl;
    cout<<gene[1].H<<' '<<gene[1].S<<endl;
    return 0;
}
