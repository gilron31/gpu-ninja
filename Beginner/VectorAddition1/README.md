# Vector Addition 1
Elementwise vector addition, namely computing $c_i = a_i + b_i$ is a basic building block of many algorithms. For our purposes, it has two important features:
1. It involves host-device communication.
2. It involves having many threads cooperating.

## Learning Outcomes
1. Understanding device memory allocation and free.
2. Understanding host-device memory copy.
3. Understanding how to write "ebaressingly parallel" kernels.
4. Getting used to writing wrappers and proper tests.
- [ ] Add these:
1. Timing each part of the application.
2. Including gpu code inside cpu flow.
   
# DoD
1. In `vector_addition_1.cu`, implement the following functions according to the documentation in the code:
   1. `vector_addition_kernel`
   2. `vector_addition_impl`

- [ ] Extra: write a generic embarassingly parallel kernel.

# Material & Setup
- [ ] Write this section.
## Related Reading Material
- code search here`/usr/local/cuda/include/cuda_runtime_api.h`
- https://docs.nvidia.com/cuda/pdf/CUDA_Runtime_API.pdf

