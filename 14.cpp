#include <iostream>
using namespace std;

unsigned int next_collatz(unsigned int n)
{
  if (n & 1)
    return 3*n+1;
  return n >> 1;
}

int *collatz_chain_length;

int main(int argc, char *argv[])
{
  collatz_chain_length = new int[1000000];

  for (int i = 0; i<999999; ++i)
  {
    int count = 1;
    unsigned int n = i+1;

    while (n != 1)
    {
      n = next_collatz(n);
      if (n < i+1)
      {
	count += collatz_chain_length[n-1];
	break;
      }
      ++count;
    }

    collatz_chain_length[i] = count;
  }

  int max = 0;
  int maxidx = 0;
  for (int i = 0; i<999999; ++i)
  {
    if (collatz_chain_length[i] > max)
    {
      max = collatz_chain_length[i];
      maxidx = i;
    }
  }

  cout << "Max collatz chain is for " << (maxidx+1) << " (length " << max << ")" << endl;
  delete[] collatz_chain_length;
  return 0;
}
