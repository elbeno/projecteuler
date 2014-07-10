#include <iostream>
#include <algorithm>
using namespace std;

const int maxpent = 10000;

long long int pent[maxpent];

void fillpent()
{
  for (int i = 0; i<maxpent; ++i)
    pent[i] = i * (3*i-1) / 2;
}

bool isPent(long long int i)
{
  long long int *pi = lower_bound(pent, &pent[maxpent], i);
  return *pi == i;
}

int main()
{
  cout << "Calculating pentagonal array" << endl;
  fillpent();
  cout << "Searching pentagonal array" << endl;
  for (int i = 1; i < maxpent/2; ++i)
    for (int j = i+1; j < maxpent; ++j)
      {
	long long int ip = pent[i];
	long long int jp = pent[j];
	if (isPent(jp-ip) && isPent(jp+ip))
	  {
	    cout << ip << " " << jp << " : " << (jp-ip) << endl;
	  }
      }
  
}
