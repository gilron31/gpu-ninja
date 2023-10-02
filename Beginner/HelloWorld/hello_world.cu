// #include <iostream>
// #include <stdio.h>

// __global__ void hello_world_kernel(char *a)
// {
//     printf("hello world from GPU");
// }

// int main()
// {
//     std::cout << "hello world from CPU" << std::endl;
//     char *d_a;
//     cudaMalloc(&d_a, 100);
//     hello_world_kernel<<<1, 1>>>(d_a);
//     cudaDeviceSynchronize();
// }

#include <stdio.h>

#define CUDART_CHECK(fn)                                                          \
    do                                                                            \
    {                                                                             \
        cudaError_t status = (fn);                                                \
        if (cudaSuccess != (status))                                              \
        {                                                                         \
            fprintf(stderr, "CUDA Runtime Failure (line %d of file %s):\n\t"      \
                            "%s returned 0x%x (%s)\n",                            \
                    __LINE__, __FILE__, #fn, status, cudaGetErrorString(status)); \
        }                                                                         \
    } while (0);

__global__ void helloCUDA(float f)
{
    for (size_t i = 0; i < 1; i++)
    {
        printf("Hello thread %d, f=%f\n", threadIdx.x, f);
    }
}

int main()
{
    printf("hello from cpu\n");
    helloCUDA<<<1, 5>>>(1.2345f);
    cudaDeviceSynchronize();
    CUDART_CHECK(cudaPeekAtLastError());
    return 0;
}