#include <iostream>
#include <list>
#include <algorithm>
using namespace std;

int nameval(const char *c)
{
  int n = 0;
  for ( ; *c != 0; ++c)
    {
      n += *c - 'A' + 1;
    }
  return n;
}

int main(int argc, char *argv[])
{
  FILE *fp = fopen("names.txt", "rb");
  fseek(fp, 0, SEEK_END);
  int len = ftell(fp); 
  char *buf = new char[len];
  fseek(fp, 0, SEEK_SET);
  fread(buf, 1, len, fp);
  fclose(fp);

  char *pBuf = buf;
  char namebuf[128];
  list<string> namelist;

  while (pBuf < &buf[len])
    {
      char *pDst = namebuf;
      while (isspace(*pBuf)) ++pBuf;
      char c = *pBuf++;
      while (*pBuf != '\"')
	*pDst++ = *pBuf++;
      *pDst = 0;
      pBuf+=2;
      list<string>::iterator it = lower_bound(namelist.begin(), namelist.end(), string(namebuf));
      namelist.insert(it, string(namebuf));      
    }

  unsigned long long int sum = 0;
  int mul = 1;
  for (list<string>::iterator it = namelist.begin(); it != namelist.end(); ++it)
    {
      sum += nameval(it->c_str()) * mul++;
    }

  cout << sum << endl;

  delete[] buf;
}
