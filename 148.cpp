#include <iostream>
#include <list>
using namespace std;

long long int power7s[11] = {1,7,49,343,2401,16807,117649,823543,5764801,40353607,282475249 };

long long int accumval[11];
long long int accumdec[11];

long long int base7[11];
char base7str[12];

void toBase7(long long int n)
{
  for (long long int i = 10; i >=0; --i)
    {
      int d = n / power7s[i];
      int m = n % power7s[i];
      base7[i] = d;
      n = m;
    }
}

void base7ToString()
{
  char *str = base7str;
  int i = 10;
  while (i >= 0 && base7[i] == 0)
    {
      --i;
    }

  for (; i >= 0; --i)
    {
      *str++ = base7[i] + '0';
    }
  *str = 0;
}

struct powermul
{
  long long int poweridx;
  long long int mul;
};

powermul findpowerandmul()
{
  powermul pm;
  
  for (long long int i = 0; i < 11; ++i)
    {
      if (base7[i] != 0)
	{
	  pm.poweridx = i;
	  break;
	}
    }

  pm.mul = base7[pm.poweridx];
  for (long long int i = pm.poweridx+1; i < 11; ++i)
    {
      pm.mul *= base7[i]+1;
    }


  return pm;
}


int main(int argc, char *argv[])
{
  long long int sum = 0;

  for (long long int i = 1; i < 1000000000; ++i)
    {
      toBase7(i);
      //base7ToString();
      //cout << i << " " << base7str << " ";

      powermul pm = findpowerandmul();
      //cout << power7s[pm.poweridx] << " " << pm.mul << endl;

      if (pm.poweridx > 0)
	{
	  accumval[pm.poweridx] += (power7s[pm.poweridx] - 1) * pm.mul;
	  accumdec[pm.poweridx] += pm.mul;	  
	}

      for (int j = 1; j < 11; ++j)
	{
	  sum += accumval[j];
	  accumval[j] -= accumdec[j];
	  if (accumval[j] <= 0)
	    {
	      accumval[j] = 0;
	      accumdec[j] = 0;
	    }
	}
    }
  cout << sum << endl;

  cin.ignore();

  return 0;
}
