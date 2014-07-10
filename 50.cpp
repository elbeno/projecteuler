#include <list>
#include <iostream>
using namespace std;

list<int> primes;

bool composite(int i)
{
	if (i > 1000000)
		return true;

	for (list<int>::iterator it = primes.begin(); it != primes.end(); ++it)
	{
		if (i % *it == 0)
			return true;
		if (*it * *it > i)
			return false;
	}
	return false;
}

void find_primes(int upto)
{
	for (int i = 2; i < upto; ++i)
	{
		if (!composite(i))
			primes.push_back(i);
	}
}

void show_primes()
{
	for (list<int>::iterator it = primes.begin(); it != primes.end(); ++it)
	{
		cout << *it << endl;
	}
}

struct suminfo
{
	int sum;
	list<int>::iterator start;
};

suminfo find_sum(int length)
{
	suminfo default;
	default.sum = 0;

	for (list<int>::iterator it = primes.begin(); it != primes.end(); ++it)
	{
		int sum = 0;
		int count = 0;
		for (list<int>::iterator it2 = it; count < length && it2 != primes.end(); ++it2)
		{
			sum += *it2;
			++count;
		}
		if (count == length && !composite(sum))
		{
			suminfo s;
			s.sum = sum;
			s.start = it;
			return s;
		}
	}
	return default;
}

int main(int argc, char *argv[])
{
	find_primes(150000);
	//show_primes();
	for (int i = 271; i < 600; ++i)
	{
		suminfo s = find_sum(i);
		if (s.sum > 0)
		{
			cout << "Sum of " << i << ": " << find_sum(i).sum;
			/*
			cout << " (";
			for (int c = 0; c < i; ++s.start, ++c)
			{
				cout << *s.start;
				if (c < i-1) cout << " + ";
			}
			cout << ")";
			*/
			cout << endl;

		}
	}
	cin.ignore();
}