#include <cassert>
#include <iostream>
#include <vector>

template <class T>
__global__ void vector_addition_kernel(const T *a, const T *b, size_t size,
                                       T *c) {
  /**
   * Your Code Here!
   *
   * 1. Use all threads in the grid.
   * 2. Make this kernel as simple as possible (optimizations will come later).
   */
}

template <class T>
void vector_addition_impl(const std::vector<T> &a, const std::vector<T> &b,
                          std::vector<T> &c) {
  /**
   * Your Code Here!
   *
   * 1. Don't forget input validation.
   * 2. Don't forget to free the allocated device memory.
   * 3. Time each of the sections:
   *    a. Device memory allocation.
   *    b. H2D copy.
   *    c. Kernel invocation.
   *    d. D2H copy.
   *    e. Device memory free.
   */
}

template <class T>
void vector_addition_cpu(const std::vector<T> &a, const std::vector<T> &b,
                         std::vector<T> &c) {
  assert(a.size() == b.size());
  size_t size = a.size();
  assert(size == c.size());

  for (size_t i = 0; i < size; ++i) {
    c[i] = a[i] + b[i];
  }
}

std::ostream &operator<<(std::ostream &os, const std::vector<int> &input) {
  for (auto const &i : input) {
    os << i << " ";
  }
  return os;
}

int main() {
  constexpr size_t SIZE = 100000;
  std::vector<int> a(SIZE, 4);
  std::vector<int> b(SIZE, 5);
  std::vector<int> c(SIZE);
  std::vector<int> exp(SIZE);

  vector_addition_impl(a, b, c);
  vector_addition_cpu(a, b, exp);

  assert(c == exp);
  std::cout << "SUCCESS" << std::endl;
}