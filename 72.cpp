#include <iostream>

using namespace std;

int gcd(int a, int b)
{
    while( 1 )
    {
        a = a % b;
		if( a == 0 )
			return b;
		b = b % a;
        if( b == 0 )
			return a;
    }
}

int main()
{
	int n = 1;
	int d = 2;
	int count = 0;

	for (int d = 2; d <= 1000000; ++d)
		for (int n = 1; n < d; ++n)
			if (gcd(n,d) == 1)
				++count;


	cout << count << endl;

	return 0;
}
