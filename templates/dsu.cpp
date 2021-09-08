#include <iostream>
#include <vector>
using namespace std;


struct DSU {
    vector<int> _parent, _sz;
    DSU (int n) {
        _parent.resize(n+1), _sz.resize(n+1);
        for (int i = 0; i <= n; i++) {
            _parent[i] = i;
            _sz[i] = 1;
        }
    }
    int find_root (int u) {
        if (_parent[u] == u)
            return u;
        return _parent[u] = find_root(_parent[u]);
    }
    void connect (int u, int v) {
        u = find_root(u);
        v = find_root(v);
        if (u == v) return;
        if (_sz[u] > _sz[v])
            swap(u, v);
        _parent[u] = v;
        _sz[v] += _sz[u];
    }
    int compSize (int v) {
        v = find_root(v);
        return _sz[v];
    }
    bool same (int u, int v) {
        return find_root(u) == find_root(v);
    }
};

signed main () {
    DSU st(10);

    cout << st.find_root(2) << endl;
    st.connect(1, 2);
    st.connect(1, 3);
    cout << st.find_root(1) << endl;
    cout << st.find_root(2) << endl;
    cout << st.find_root(3) << endl;
}
