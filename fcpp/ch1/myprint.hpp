#include <vector>
#include <string>
#include <functional>
#include <iostream>

using namespace std;

template <typename T>
ostream& operator<<(ostream& os, const vector<T>& v)
{
  if (empty(v)) {
    os << "[]";
  } else {
    os << "[";
    for (auto const& i: v) {
      os << i << ", ";
    }
    os << "\b\b" << "]";
  }
  return os;
}


void run_listing1(
    const string& subsection,
    const string& title,
    const vector<std::string>& files,
    function<vector<int>(const vector<std::string>&)> runnable){
  cout << "Listing 1." << subsection << ", " << title << ":" << endl;
  cout << runnable(files) << endl;
}


