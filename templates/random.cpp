#include <bits/stdc++.h>
#define endl '\n'
#define umap unordered_map
#define all(var) var.begin(), var.end()
#define input freopen("input", "r", stdin)
#define output freopen("output", "w", stdout)
#define Fast ios_base::sync_with_stdio(0), cin.tie(NULL), cout.tie(NULL)
#define dbg(x) cerr << #x << " => " << x << endl
using Long = long long;
using namespace std;

signed main () {
    std::default_random_engine generator;
    std::uniform_int_distribution<int> distribution(1,10);
    auto dice = std::bind ( distribution, generator );

    for (int i = 0; i < 10; i++) {
        cout << dice() << ' ' ;
    }
    cout << endl;
}
