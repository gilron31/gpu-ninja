#include <iostream>

__global__ void hello_world_kernel() { printf("Hello World from GPU\n"); }

int main() {
  std::cout << "Hello World from CPU" << std::endl;
  hello_world_kernel<<<1, 1>>>();
  cudaDeviceSynchronize();
}
