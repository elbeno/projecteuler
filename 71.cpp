#include <iostream>

using namespace std;

int main()
{
	int n = 3;
	int d = 7;

	double threebyseven = 3.0 / 7.0;
	double closest = 0.0;
	int closestn = 0;
	int closestd = 0;
	
	while (n <= 428571)
	{
		n++;
		double c =  (double)n / (double)d;
		while (c > threebyseven)
		{
			d++;
			c = (double)n / (double)d;
		}
		if (c > closest && (d % 7))
		{
			closest = c;
			closestn = n;
			closestd = d;
		}
	}

	cout << closestn << "/" << closestd << endl;

	return 0;
}
