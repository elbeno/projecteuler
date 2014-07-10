#include <iostream>
#include <fstream>
using namespace std;


const long long int ACE = 1LL<<42LL;
const long long int KING = 1LL<<39LL;
const long long int QUEEN = 1LL<<36LL;
const long long int JACK = 1LL<<33LL;
const long long int TEN = 1LL<<30LL;

struct card
{
    long long int value;
    char suit;
};

struct game
{
    card p1[5];
    card p2[5];
};

game games[1000];

void readgames()
{
    int n = 0;
    char c;
    ifstream in("poker.txt");
    while (!in.eof() && n < 1000)
    {
        for (int i = 0; i < 5; ++i)
        {
            in >> c;
            switch (c)
            {
            case 'A' : games[n].p1[i].value = ACE; break;
            case 'T' : games[n].p1[i].value = TEN; break;
            case 'J' : games[n].p1[i].value = JACK; break;
            case 'Q' : games[n].p1[i].value = QUEEN; break;
            case 'K' : games[n].p1[i].value = KING; break;
            default : games[n].p1[i].value = 1LL<<(3*(c-'0')); break;
            }
            in >> games[n].p1[i].suit;
        }
        for (int i = 0; i < 5; ++i)
        {
            in >> c;
            switch (c)
            {
            case 'A' : games[n].p2[i].value = ACE; break;
            case 'T' : games[n].p2[i].value = TEN; break;
            case 'J' : games[n].p2[i].value = JACK; break;
            case 'Q' : games[n].p2[i].value = QUEEN; break;
            case 'K' : games[n].p2[i].value = KING; break;
            default : games[n].p2[i].value = 1LL<<(3*(c-'0')); break;
            }
            in >> games[n].p2[i].suit;
        }
        ++n;
    }
    in.close();
}

void showgame(game &g, int s1, int s2)
{
    for (int i = 0; i < 5; ++i)
    {
        for (int j = 2; j <= 14; ++j)
        {

            if (g.p1[i].value == (1LL << (j*3)))
            {
                switch (j)
                {
                case 10 : cout << "T"; break;
                case 11 : cout << "J"; break;
                case 12 : cout << "Q"; break;
                case 13 : cout << "K"; break;
                case 14 : cout << "A"; break;
                default: cout << j;
                }
            }
        }
        cout << g.p1[i].suit << " ";
    }
    cout << "(" << s1 << ") : ";
    for (int i = 0; i < 5; ++i)
    {
        for (int j = 2; j <= 14; ++j)
        {

            if (g.p2[i].value == (1LL << (j*3)))
            {
                switch (j)
                {
                case 10 : cout << "T"; break;
                case 11 : cout << "J"; break;
                case 12 : cout << "Q"; break;
                case 13 : cout << "K"; break;
                case 14 : cout << "A"; break;
                default: cout << j;
                }
            }
        }
        cout << g.p2[i].suit << " ";
    }
    cout << "(" << s2 << ")";
}

void sort_hand(card *c)
{
    for (int i = 0; i < 5; ++i)
        for (int j = i+1; j < 5; ++j)
            if (c[j].value > c[i].value)
                swap(c[i], c[j]);
}

bool is_flush(card *c)
{
    return c[0].suit == c[1].suit
        && c[0].suit == c[2].suit
        && c[0].suit == c[3].suit
        && c[0].suit == c[4].suit;
}

bool is_royal_flush(card *c)
{
    return c[0].value == ACE
        && c[1].value == KING
        && c[2].value == QUEEN
        && c[3].value == JACK
        && c[4].value == TEN
        && is_flush(c);
}

bool is_straight(card *c)
{
    return c[0].value == (c[1].value << 3)
        && c[1].value == (c[2].value << 3)
        && c[2].value == (c[3].value << 3)
        && c[3].value == (c[4].value << 3);
}

bool is_straight_flush(card *c)
{
    return is_straight(c) && is_flush(c);
}

struct cpair { int num; int p; int q; };

cpair num_pairs(card *c)
{
    long long int sum = 0;
    for (int i = 0; i < 5; ++i)
        sum += c[i].value;

    cpair p; p.num = 0; p.p = 0; p.q = 0;

    for (long long int i = 2; i <= 14; ++i)
    {
        long long int mask = 7LL << (i*3);
        long long int pair = 2LL << (i*3);
        if ((sum & mask) == pair)
        {
            p.num++;            
            if (p.p == 0)
                p.p = i;
            else
                p.q = i;
        }
    }
    return p;
}

int has_three(card *c)
{
    long long int sum = 0;
    for (int i = 0; i < 5; ++i)
        sum += c[i].value;

    for (long long int i = 2; i <= 14; ++i)
    {
        long long int mask = 7LL << (i*3);
        long long int trip = 3LL << (i*3);
        if ((sum & mask) == trip)
            return i;
    }
    return 0;
}

int has_four(card *c)
{
    long long int sum = 0;
    for (int i = 0; i < 5; ++i)
        sum += c[i].value;

    for (long long int i = 2; i <= 14; ++i)
    {
        long long int mask = 7LL << (i*3);
        long long int trip = 4LL << (i*3);
        if ((sum & mask) == trip)
            return i;
    }
    return 0;
}

struct full_house { bool b; int p; int q; };

full_house is_full_house(card *c)
{
    full_house f;
    f.p = has_three(c);
    cpair p = num_pairs(c);
    f.q = p.p;
    f.b = f.p > 0 && f.q > 0;
    return f;
}

int compare_fours(card *c1, int f1, card *c2, int f2)
{
    if (f1 > f2)
        return 1;
    else if (f1 == f2)
    {
        long long int nonf1 = 0;
        long long int nonf2 = 0;
        for (int i = 0; i < 5; ++i)
        {
            if (c1[i].value != (1LL << (f1*3)))
                nonf1 = c1[i].value;
            if (c2[i].value != (1LL << (f2*3)))
                nonf2 = c2[i].value;
        }
        if (nonf1 > nonf2)
            return 1;
    }    

    return 0;
}

int compare_threes(card *c1, int f1, card *c2, int f2)
{
    if (f1 > f2)
        return 1;
    else if (f1 == f2)
    {
        long long int nonf1_a[2];
        long long int nonf2_a[2];
        long long int *nonf1 = nonf1_a;
        long long int *nonf2 = nonf2_a;
        for (int i = 0; i < 5; ++i)
        {
            if (c1[i].value != (1LL << (f1*3)))
                *nonf1++ = c1[i].value;
            if (c2[i].value != (1LL << (f2*3)))
                *nonf2++ = c2[i].value;
        }

        for (int i = 0; i < 2; ++i)
        {
            if (nonf1_a[i] > nonf2_a[i])
                return 1;
            else if (nonf1_a[i] < nonf2_a[i])
                return 0;                
        }
    }    

    return 0;
}

int compare_one_pair(card *c1, int f1, card *c2, int f2)
{
    if (f1 > f2)
        return 1;
    else if (f1 == f2)
    {
        long long int nonf1_a[3];
        long long int nonf2_a[3];
        long long int *nonf1 = nonf1_a;
        long long int *nonf2 = nonf2_a;
        for (int i = 0; i < 5; ++i)
        {
            if (c1[i].value != (1LL << (f1*3)))
                *nonf1++ = c1[i].value;
            if (c2[i].value != (1LL << (f2*3)))
                *nonf2++ = c2[i].value;
        }

        for (int i = 0; i < 3; ++i)
        {
            if (nonf1_a[i] > nonf2_a[i])
                return 1;
            else if (nonf1_a[i] < nonf2_a[i])
                return 0;                
        }
    }    

    return 0;
}

int compare_two_pairs(card *c1, cpair p1, card *c2, cpair p2)
{
    if (p1.p > p2.p && p1.p > p2.q)
        return 1;

    if (p1.q > p2.p && p1.q > p2.q)
        return 1;

    else if (p1.p == p2.p && p1.q == p1.q)
    {
        long long int nonf1;
        long long int nonf2;
        for (int i = 0; i < 5; ++i)
        {
            if (c1[i].value != (1LL << (p1.p*3))
                && c1[i].value != (1LL << (p1.q*3)))
                nonf1 = c1[i].value;
            if (c2[i].value != (1LL << (p2.p*3))
                && c2[i].value != (1LL << (p2.q*3)))
                nonf2 = c1[i].value;
        }

        if (nonf1 > nonf2)
            return 1;
    }    

    return 0;
}

int compare_full_house(full_house f1, full_house f2)
{
    if (f1.p > f2.p)
        return 1;
    else if (f2.p > f1.p)
        return 0;

    if (f1.q > f2.q)
        return 1;


    return 0;
}

int compare_hands(card *c1, card *c2)
{
    {
        int f1 = has_four(c1);
        int f2 = has_four(c2);

        if (f1 > 0 && f2 > 0)
            return compare_fours(c1, f1, c2, f2);
    }
    

    {
        full_house f1 = is_full_house(c1);
        full_house f2 = is_full_house(c2);

        if (f1.b && f2.b)
            return compare_full_house(f1,f2);
    }

    {
        int f1 = has_three(c1);
        int f2 = has_three(c2);

        if (f1 > 0 && f2 > 0)
            return compare_threes(c1, f1, c2, f2);
    }

    {
        cpair p1 = num_pairs(c1);
        cpair p2 = num_pairs(c2);

        if (p1.num == 2 && p2.num == 2)
            return compare_two_pairs(c1, p1, c2, p2);

        if (p1.num == 1 && p2.num == 1)
            return compare_one_pair(c1, p1.p, c2, p2.p);
    }


    for (int i = 0; i < 5; ++i)
    {
        if (c1[i].value > c2[i].value)
            return 1;
        else if (c2[i].value > c1[i].value)
            return 0;
    }
    return 0;
}

int score_hand(card *c)
{
    if (is_royal_flush(c))
        return 9;
    if (is_straight_flush(c))
        return 8;
    if (has_four(c))
        return 7;
    full_house f = is_full_house(c);
    if (f.b)
        return 6;
    if (is_flush(c))
        return 5;
    if (is_straight(c))
        return 4;
    if (has_three(c))
        return 3;

    return num_pairs(c).num;
}

int eval(game &g)
{
    sort_hand(g.p1);
    sort_hand(g.p2);


    int score1 = score_hand(g.p1);
    int score2 = score_hand(g.p2);

    showgame(g, score1, score2);

    if (score1 > score2)
        return 1;
    else if (score1 == score2)
        return compare_hands(g.p1, g.p2);
     
    return 0;
}

int main(int argc, char *argv[])
{
    readgames();

    int p1wins = 0;
    for (int i = 0; i < 1000; ++i)
    {
        int s = eval(games[i]);
        cout << " : Player " << 2-s << " wins." << endl;
        p1wins += s;
    }

    cout << "Player 1 wins " << p1wins << " hands." << endl;

    cin.ignore();
    return 0;
}
