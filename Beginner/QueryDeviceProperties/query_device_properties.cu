#include <iostream>

int main() {
  int device;
  cudaGetDevice(&device);
  std::cout << "device: " << device << std::endl;
  cudaDeviceProp prop;
  cudaGetDeviceProperties(&prop, device);

  std::cout << "name: " << prop.name << std::endl;
  std::cout << "pciBusID: " << prop.pciBusID << std::endl;
  std::cout << "major: " << prop.major << std::endl;
  std::cout << "minor: " << prop.minor << std::endl;
  std::cout << "totalGlobalMem: " << prop.totalGlobalMem << std::endl;
  std::cout << "l2CacheSize: " << prop.l2CacheSize << std::endl;
  std::cout << "sharedMemPerMultiprocessor: " << prop.sharedMemPerMultiprocessor
            << std::endl;
  std::cout << "regsPerMultiprocessor: " << prop.regsPerMultiprocessor
            << std::endl;
  std::cout << "multiProcessorCount: " << prop.multiProcessorCount << std::endl;
}
