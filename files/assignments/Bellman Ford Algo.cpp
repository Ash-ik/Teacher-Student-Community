#include<bits/stdc++.h>
using namespace std;

int main()
{
    freopen("input.txt","r",stdin);
    int ver,i,j,k;
    cout<<"Enter the no. of Vertices: ";
    cin>>ver;

    cout<<"\n Enter the graph :";
    int INF= 100;
    int graph[ver][ver];
    int dis[ver];
    int source[ver];

    for( i=0;i<ver;i++)
    {
        for( j=0;j<ver;j++)
        {
            cin>>graph[i][j];


        }

    }

    dis[0]=0;
    source[0]=INF;
    for( i=1;i<ver;i++)
    {
        dis[i]=INF;
        source[i]=0;
    }


    for(k=0;k<ver-1;k++)
    {
        for(i=0;i<ver;i++)
            {
                for(j=0;j<ver;j++)
                    {
                        if(graph[i][j]+dis[i]<dis[j] )
                        {
                            dis[j]=graph[i][j]+dis[i];
                            source[j]=i;

                        }




                    }

            }

    }

    for( k=0;k<ver;k++ )
    {
        cout<<source[k]<<" ";
    }




    cout<<"\n\n";

    int out;
    out=ver;
    for(k=0;k<ver-1;k++)
    {
        if(k==0)
        {cout<<ver-1;
            out=ver-1;
        }

        else{

             cout<<"<-"<<source[out];
        out=source[out];
        }


    }








}
