#include <cassert>
#include <iostream>
#include <vector>

template <class T>
__global__ void vector_addition_kernel(const T *a, const T *b, size_t size,
                                       T *rv) {
  uint32_t tid = threadIdx.x + blockIdx.x * blockDim.x;
  uint32_t stride = blockDim.x * gridDim.x;
  for (uint32_t i = tid; i < size; i += stride) {
    rv[i] = a[i] + b[i];
  }
}

template <class T>
void vector_addition_impl(const std::vector<T> &a, const std::vector<T> &b,
                          std::vector<T> &rv) {
  assert(a.size() == b.size());
  size_t size = a.size();
  assert(size == rv.size());

  T *d_a;
  T *d_b;
  T *d_rv;

  cudaMalloc(&d_a, sizeof(T) * size);
  cudaMalloc(&d_b, sizeof(T) * size);
  cudaMalloc(&d_rv, sizeof(T) * size);

  cudaMemcpy(d_a, a.data(), sizeof(T) * size, cudaMemcpyHostToDevice);
  cudaMemcpy(d_b, b.data(), sizeof(T) * size, cudaMemcpyHostToDevice);

  vector_addition_kernel<<<512, 10>>>(d_a, d_b, size, d_rv);

  cudaMemcpy(rv.data(), d_rv, sizeof(T) * size, cudaMemcpyDeviceToHost);

  cudaFree(d_a);
  cudaFree(d_b);
  cudaFree(d_rv);
}

template <class T>
void vector_addition_cpu(const std::vector<T> &a, const std::vector<T> &b,
                         std::vector<T> &rv) {
  assert(a.size() == b.size());
  size_t size = a.size();
  assert(size == rv.size());

  for (size_t i = 0; i < size; ++i) {
    rv[i] = a[i] + b[i];
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
  std::vector<int> rv(SIZE);
  std::vector<int> exp(SIZE);

  vector_addition_impl(a, b, rv);
  vector_addition_cpu(a, b, exp);

  assert(rv == exp);
  std::cout << "SUCCESS" << std::endl;
}