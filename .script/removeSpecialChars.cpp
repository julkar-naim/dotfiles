#include <iostream>
using namespace std;

bool check (char ch) {
    if (ch == ']') return true;
    if (ch == '[') return true;
    if (ch == '(') return true;
    if (ch == ')') return true;
    if (ch == '{') return true;
    if (ch == '}') return true;
    if (ch == ' ') return true;
    return false;
}

signed main () {
    string s; 
    getline(cin, s);
    for (int i = 0; i < (int)s.size(); i++) {
        if (check(s[i])) {
            s.insert(i, "\\");
            i++;
        }
    }
    cout << s << endl;
}


