#include <vector>
#include <string>
#include <functional>
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

template <typename T>
void run_listing(const string& section, const string& title, function<T()> runnable){
  cout << "Listing " << section << ", " << title << ":" << endl;
  cout << runnable() << endl;
}


