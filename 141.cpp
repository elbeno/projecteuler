#include <iostream>
#include <cmath>
using namespace std;

bool is_progressive(long long int n)
{
	long long int i = 2;
	for (; i*i <= n; ++i)
	{
		long long int b = n % i;
		if (b != 0)
		{
			long long int a = n / i;
			long long int c = i;

			if (c > b) swap(b,c);
			if (b > a) swap(a,b);
			if (c > b) swap(b,c);

			if (a*c == b*b)
				return true;
		}
	}
	return false;
}

bool is_perfect_square(long long int n)
{
	double f = sqrt((double) n);
	long long int r = (long long int)f;
	return r*r == n;
}

int main (int argc, char *argv[])
{
	long long int prog_sum = 0;
	for (long long int i = 1; i < 1000000000; ++i)
	{
		if (is_perfect_square(i) && is_progressive(i))
			prog_sum += i;
	}
	cout << "Sum is " << prog_sum << endl;
	cin.ignore();
	return 0;
}