#include <iostream>
#include <math.h>
using namespace std;

int count_digits(long long int n)
{
	int count = 0;
	while (n > 0)
	{
		n /= 10;
		++count;
	}
	return count;
}

int main(int argc, char *argv[])
{
	long long int numerator = 3;
	long long int denominator = 2;
	int num = 0;
	double root2 = sqrt(2.0);

	for (int i = 0; i < 49; ++i)
	{
		cout << numerator << "/" << denominator << endl;
		if (count_digits(numerator) > count_digits(denominator))
			++num;

		denominator += numerator;
		numerator = (long long int) floor( denominator * root2 + 0.5 );
	}

	cout << num << endl;
	cin.ignore();
	return 0;
}