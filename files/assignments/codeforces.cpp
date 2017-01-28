#include<stdio.h>
#include<string.h>
#include<vector>
#include<math.h>
#include<algorithm>
#include<map>
#define read freopen("in.txt","r",stdin)
using namespace std;

int main()
{
    int m,n,ans=0;
    scanf("%d %d",&m,&n);
while(1)
{
    if(m>n)
    {
        int temp=m;
        m=n;
        n=temp;
    }
    m=m-1;
    n=n-2;
    if(m<0||n<0)
    {
            printf("%d\n",ans);return 0;
    }
    ans++;
}

    return 0;
}

