#include<iostream>
#include<cmath>
using namespace std;
int x[1000],n;
int place(int a,int k)
{
    for(int i=1;i<=k-1;i++)
    {
        if((x[i]==a)||(abs(x[i]-a)==abs(k-i)))
            return 0;
    }
    return 1;
}

void nqueen(int k, int n)
{
    for(int i=1;i<=n;i++)
    {
        if(place(i,k))
        {
            x[k]=i;
            if(k==n)
            {
             for(int j=1;j<=n;j++)
             {
                 cout<<x[j]<<" ";
             }
             cout<<"\n";
            }
            else
                nqueen(k+1,n);
        }
    }

}
int main()
{
    cout<<"Enter number of queens:";
    //int n;
    cin>>n;
    nqueen(1,n);
}
