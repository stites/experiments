#include <vector>
#include <iostream>

using namespace std;

template <typename T>
ostream& operator<<(ostream& os, const vector<T>& v)
{
    os << "[";
    for (auto const& i: v) {
      os << i << ", ";
    }
    os << (empty(v) ? "" : "\b\b") << "]";
    return os;
}


