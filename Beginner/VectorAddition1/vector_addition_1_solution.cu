#include <cassert>
#include <iostream>
#include <vector>

template <class T>
__global__ void vector_addition_kernel(const T *a, const T *b, size_t size,
                                       T *c) {
  uint32_t tid = threadIdx.x + blockIdx.x * blockDim.x;
  uint32_t stride = blockDim.x * gridDim.x;
  for (uint32_t i = tid; i < size; i += stride) {
    c[i] = a[i] + b[i];
  }
}

template <class T>
void vector_addition_impl(const std::vector<T> &a, const std::vector<T> &b,
                          std::vector<T> &c) {
  assert(a.size() == b.size());
  size_t size = a.size();
  assert(size == c.size());

  T *d_a;
  T *d_b;
  T *d_c;

  cudaMalloc(&d_a, sizeof(T) * size);
  cudaMalloc(&d_b, sizeof(T) * size);
  cudaMalloc(&d_c, sizeof(T) * size);

  cudaMemcpy(d_a, a.data(), sizeof(T) * size, cudaMemcpyHostToDevice);
  cudaMemcpy(d_b, b.data(), sizeof(T) * size, cudaMemcpyHostToDevice);

  vector_addition_kernel<<<512, 10>>>(d_a, d_b, size, d_c);

  cudaMemcpy(c.data(), d_c, sizeof(T) * size, cudaMemcpyDeviceToHost);

  cudaFree(d_a);
  cudaFree(d_b);
  cudaFree(d_c);
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