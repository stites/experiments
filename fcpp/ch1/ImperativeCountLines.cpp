#include <vector>
#include <iostream>
#include <string>
#include <fstream>
#include "myprint.hpp"
#include <algorithm>
#include <functional>

using namespace std;
/* namespace fs = boost::filesystem; */

vector<int> count_lines_in_files(const vector<string>& files)
{
  vector<int> results;
  char c = 0;
  for (const auto& file : files)
  {
    int line_count = 0;
    std::ifstream in(file);
    while (in.get(c)){
      if (c == '\n') {
        line_count++;
      }
    }
    results.push_back(line_count);
  }
  return results;
}

template <typename T>
void run_listing(const string& section, const string& title, function<T()> runnable){
  cout << "Listing " << section << ", " << title << ":" << endl;
  cout << runnable() << endl;
}

void run_listing1(const vector<string>& files)
{
  run_listing<vector<int>>(
      "1.1",
      "Calculating the number of lines the imperative way",
      [=]()->auto{ return count_lines_in_files(files); });
}

int count_lines(const string& filename)
{
  ifstream in(filename);
  return count(
      istreambuf_iterator<char>(in),
      istreambuf_iterator<char>(),
      '\n');
}

vector<int>
algorithm_count_lines_in_files(const vector<string>& files)
{
  vector<int> results;
  for (const auto& file : files) {
    results.push_back(count_lines(file));
  }
  return results;
}

void run_listing2(const vector<string>& files)
{
  run_listing<vector<int>>(
      "1.2",
      "Using std::count to count newline characters",
      [=]()->auto{ return algorithm_count_lines_in_files(files); });
}

int main(int argc, char *argv[])
{
  const vector<string> files { "ImperativeCountLines.cpp", "myprint.hpp" };
  run_listing1(files);
  run_listing2(files);
  return 0;
}
