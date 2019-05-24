#include <vector>
#include <iostream>
#include <string>
#include <fstream>
#include "myprint.hpp"
#include <algorithm>
#include <range/v3/all.hpp>

/// Listing 1
std::vector<int> count_lines_in_files(const std::vector<std::string>& files)
{
std::vector<int> results;
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

/// Listing 2
int count_lines(const std::string& filename)
{
  ifstream in(filename);
  return count(
      istreambuf_iterator<char>(in),
      istreambuf_iterator<char>(),
      '\n');
}

std::vector<int>
algorithm_count_lines_in_files(const std::vector<std::string>& files)
{
std::vector<int> results;
  for (const auto& file : files) {
    results.push_back(count_lines(file));
  }
  return results;
}

/// Listing 3
std::vector<int> transform_count_lines_in_files(const std::vector<std::string>& files)
{
  std::vector<int> results(size(files));
  transform(cbegin(files), cend(files), begin(results), count_lines);
  return results;
}

// Listing 4
vector<int> ranges_count_lines_in_files(const vector<std::string>& files)
{
  return files | ranges::view::transform(count_lines);
}

int main(int argc, char *argv[])
{
  const vector<std::string> files { "Chapter1Examples.cpp", "myprint.hpp" };
  run_listing1("1", "Calculating the number of lines the imperative way", files, count_lines_in_files);
  run_listing1("2", "Using std::count to count newline characters", files, algorithm_count_lines_in_files);
  run_listing1("3", "Mapping files to line counts by using std::transform", files, transform_count_lines_in_files);
  run_listing1("4", "Transformation using ranges", files, ranges_count_lines_in_files);
  /*
  // doesn't seem to compile:
  std::vector<double> xs = {1.0, 2.0, 5.0};
  auto res = sum(xs | ranges::view::transform(sqrt))
  std::cout <<  "" << std::endl;
  */
  return 0;
}
