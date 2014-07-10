#include <iostream>
#include <fstream>
#include <math.h>
using namespace std;

/*
  b ^ e = x
  log[b] x = e

  log[b] x = log x / log b

  log x = log[b] x * log b
        = e * log b

  log x > log y => x > y

 */

int main(int argc, char *argv[])
{
    int line = 1;
    double largest = 0;
    int largestline = 0;

    ifstream in("base_exp.txt");
    while (!in.eof())
    {
        int base;
        char c;
        int exp;

        in >> base;
        in >> c;
        in >> exp;

        cout << base << "," << exp << ":";

        double logx = ((double) exp) * log(base);
        if (logx > largest)
        {
            largest = logx;
            largestline = line;
        }
        cout << logx << endl;
        ++line;      
    }
    in.close();

    cout << largestline << endl;
    
    cin.ignore();
    return 0;
}

