#include <bits/stdc++.h>
#include<ext/pb_ds/assoc_container.hpp>
#include <ext/pb_ds/tree_policy.hpp>
using namespace std;
using namespace __gnu_pbds;

template<class T> using ordered_set = tree<T, null_type, less<T>, rb_tree_tag, tree_order_statistics_node_update>;


signed main(){
    ordered_set<pair<int,int>> oset;
    oset.insert({2, 0});
    oset.insert({2, 1});
    oset.insert({3, 0});
    oset.insert({3, 1});
    cout << oset.order_of_key({3, 0});
}
