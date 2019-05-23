#include <vector>
#include <iostream>
#include <string>
#include <fstream>
#include "myprint.hpp"
#include <algorithm>

using namespace std;

/// Listing 1
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

void run_listing1(const vector<string>& files)
{
  run_listing<vector<int>>(
      "1.1",
      "Calculating the number of lines the imperative way",
      [=]()->auto{ return count_lines_in_files(files); });
}

/// Listing 2
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

/// Listing 3
vector<int>
transform_count_lines_in_files(const vector<string>& files)
{
  vector<int> results(size(files));
  transform(cbegin(files), cend(files), begin(results), count_lines);
  return results;
}

void run_listing3(const vector<string>& files)
{
  run_listing<vector<int>>(
      "1.3",
      "Mapping files to line counts by using std::transform",
      [=]()->auto{ return transform_count_lines_in_files(files); });
}

int main(int argc, char *argv[])
{
  const vector<string> files { "ImperativeCountLines.cpp", "myprint.hpp" };
  run_listing1(files);
  run_listing2(files);
  run_listing3(files);
  return 0;
}
