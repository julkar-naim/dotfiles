#include <bits/stdc++.h>
#define endl '\n'
#define umap unordered_map
#define all(var) var.begin(), var.end()
#define input freopen("input", "r", stdin)
#define output freopen("output", "w", stdout)
#define Fast ios_base::sync_with_stdio(0),cin.tie(NULL),cout.tie(NULL)
#define dbg(x) cerr << #x << " => " << x << endl
using Long = long long;
using namespace std;


// set works with unique element. In struct, based on the comparator member set only contains the unique element.
// Be careful if multiple of comparator is need. use multiset...


struct MyPair {
    int a, b;
};
bool comparator (MyPair a, MyPair b) {
    return a.a < b.a;
}
set<MyPair, decltype(comparator)*> st(comparator); 
multiset<MyPair, decltype(comparator)*> mst(comparator); 

signed main(){
    st.insert({1, 1});
    st.insert({1, 2});
    mst.insert({1, 1});
    mst.insert({1, 2});

    for (auto [a, b]: st)
        cout << a << ' ' << b << endl;
    cout << "Mst" << endl;
    for (auto [a, b]: mst)
        cout << a << ' ' << b << endl;
}

