#include <iostream>
using namespace std;


int sumways(int n, int maxn)
{
    int count = 1;

    for (int i = 2; i <= min(maxn, n); ++i)
        count += sumways(n-i, i);

    return count;
}

int main(int argc, char *argv[])
{
    cout << sumways(100,99) << endl;

    cin.ignore();
    return 0;
}
