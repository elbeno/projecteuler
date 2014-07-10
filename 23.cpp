#include <iostream>
#include <algorithm>
using namespace std;

int divisorBuf[32786];

bool isAbundantInit(int n)
{
  int *pDiv = divisorBuf;
  *pDiv++ = 1;

  for (int i = 2; i <= n/2; ++i)
    {
      if (n % i == 0)
	*pDiv++ = i;      
    }
  
  int sum = 0;
  for (int *p = divisorBuf; p != pDiv; ++p)
    sum += *p;

  return sum > n; 
}

int abundantBuf[32768];
int *pabundantEnd;

void getAbundants()
{
  int *p = abundantBuf;
  for (int i = 12; i < 28124; ++i)
    if (isAbundantInit(i))
      {
	//cout << i << ", ";
	*p++ = i;
      }
  *p = 0; 
  pabundantEnd = p;
}

bool canBe2Sum(int n)
{
  for (int *p = abundantBuf; *p <= n/2 && *p != 0; ++p)
    {
      if ((*p == n/2) && (n&1 == 0) 
	  || find(abundantBuf, pabundantEnd, (n - *p)) != pabundantEnd)
	{
	  //cout << n << "= " << *p << " + " << (n-*p) << endl;
	  return true;
	}
    }
  return false;
}

int main (int argc, char *argv[])
{
  getAbundants();

  int sum = 0;
  for (int i = 1; i < 28124; ++i)
    if (!canBe2Sum(i))
      {
	//cout << i << endl;
	sum += i;
      }

  cout << sum << endl;

  return 0;
}

