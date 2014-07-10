#include <iostream>
#include <cmath>

using namespace std;

double epsilon()
{
   double machEps = 1.0;

   do {
      machEps /= 2.0;
   }
   while ((1.0 + (machEps/2.0)) != 1.0);

   cout << "Calculated Machine epsilon: " << machEps <<endl;
   return machEps;
}

int main(int argc, char *argv[])
{
	double eps = epsilon();

	for (int n = 1680; ; ++n)
	{	
		int count = 0;
		double oneovern = 1.0/n;
		for (int x = n+1; x <= n*2; ++x)
		{
			double oneoverx = 1.0/x;
			for (int y = x; ; ++y)
			{
				double sum = oneoverx + 1.0/y;
				if (fabs(sum - oneovern) <= eps)
				{
					//cout << "1/" << x << " + 1/" << y << " = 1/" << n << endl;
					++count;
					break;
				}
				else if (sum < oneovern)
					break;
			}
		}
		cout << n << ":" << count << endl;
		if (count > 1000)
		{
			cout << "Count exceeds 1000 for " << n << endl;
			return 0;
		}
	}

	return 0;
}

