#include <iostream>
#include <fstream>
#include <string>
#include <list>
using namespace std;

bool is_tri_number(int n)
{
	int trisum = 0;
	for (int i = 1; trisum < n; ++i)
	{
		trisum += i;
		if (trisum == n)
			return true;
	}
	return false;
}

bool is_tri_word(const string &s)
{
	int lettersum = 0;
	for (const char *pc = s.c_str(); *pc != 0; ++pc)
		lettersum += *pc - 'A' + 1;

	bool b = is_tri_number(lettersum);
	cout << s << " : " << lettersum << " : " << b << endl;
	return b;
}

int main (int argc, char *argv[])
{
	ifstream input("words.txt");
	if (input.bad())
		return 1;

	list<string> words;
	char buffer[256];
	while (!input.eof())
	{
		input.get(buffer, 256, ',');
		buffer[strlen(buffer)-1] = 0;
		string s(&buffer[1]);
		words.push_front(s);
		char c;
		input.get(c);
	}
	input.close();

	int num_tri_words = 0;
	for (list<string>::const_iterator it = words.begin(); it != words.end(); ++it)
	{
		if (is_tri_word(*it))
			++num_tri_words;
	}

	cout << num_tri_words << " triangle words found" << endl;
	cin.ignore();

	return 0;
}