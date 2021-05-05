#include <bits/stdc++.h>
#include<ext/pb_ds/assoc_container.hpp>
#include <ext/pb_ds/tree_policy.hpp>
using namespace std;
using namespace __gnu_pbds;

template<class T> using ordered_set = tree<T, null_type, less<T>, rb_tree_tag, tree_order_statistics_node_update>;


signed main(){
    ordered_set<pair<int, int>> oset;

    /* oset.insert({1, 1}); */
    /* oset.insert({1, 2}); */
    /* oset.insert({1, 3}); */
    /* oset.insert({2, 1}); */
    oset.insert({2, 1});

    int order = oset.order_of_key({1, 1});
    cout << order << endl;

}



// pbds find_by_order is zero indexed based
