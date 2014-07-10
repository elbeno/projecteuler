#include <iostream>
using namespace std;

struct divrec
{
  int x;
  int y;
  int result;
};

divrec *digits;

divrec *find (int x, int y, divrec *pMaxRec)
{
  for (divrec *pRec = digits; pRec != pMaxRec; ++pRec)
    {
      if (pRec->x == x && pRec->y == y)
	return pRec;
    }
  return 0;
}

int longDiv (int a, int b, divrec *pDiv)
{
  divrec *pFound = 0;
  pDiv->x = a;
  pDiv->y = b;

  if (a == 0)
    {
      // terminated
      cout << " terminated after " << (pDiv - digits) << " digits" << endl;
      return 0;
    }
  else if (pFound = find (a, b, pDiv))
    {
      // recurred
      cout << " recurred after " << (pDiv - digits) << " digits";
      cout << " (recur length " << (pDiv - pFound) << " digits)" << endl;
      return pDiv - pFound;
    }
  else
    {
      int rem = a%b;
      pDiv->result = a/b;
      return longDiv(rem*10, b, ++pDiv);
    }
}

int main (int argc, char *argv[])
{
  digits = new divrec[1024];

  int max = 0;
  int maxval = 0;
  int i = 2;
  for (; i < 1000; ++i)
    {
      cout << i;
      int recurlen = longDiv(1, i, digits);
      if (recurlen > max)
	{
	  max = recurlen;
	  maxval = i;
	}
    }

  cout << "1/" << maxval << " contains the longest recurring cycle" << endl;

  delete[] digits;
  return 0;
}
