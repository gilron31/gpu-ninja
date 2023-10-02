# Hello World
And what your computer needs to compile and run CUDA code.


Based on https://developer.download.nvidia.com/compute/cuda/5_5/rel/docs/CUDA_Getting_Started_Linux.pdf
## Installation
In order to develop for Nvidia GPUs you need the following things:
- A CUDA capable device, a GPU. 
  - Depending on your system (Linux/macOS/Windows) there might be different ways of finding out what your hardware is.
  - On linux, the easy way is:
    ```
    lspci | grep -i nvidia
    ``` 
- An SDK, and most importantly, a compiler capable of compiling GPU code.
- A Driver capable of communicating with the GPU on runtime.
 

While the first is simply a hardware requirement, the second and third are software requirements. The software requirements are contained in the "CUDA toolkit". 


quoting from the document:
"
The installation is a two-step process. First the small repository configuration package must be downloaded from the NVIDIA CUDA download page, and installed manually. The package sets the package manager database to include the CUDA repository. Then the CUDA Toolkit is installed using the package manager software.
"

Following the instructions at https://developer.nvidia.com/cuda-downloads installs both the `nvcc` compiler and the cuda driver, alongside many usefull utilities. 

## How to verify installation

### `nvidia-smi`
A monitor script listing all available Nvidia hardware connected to your computer. On my laptop the output is:

```
Mon Oct  2 13:30:03 2023       
+---------------------------------------------------------------------------------------+
| NVIDIA-SMI 535.104.05             Driver Version: 535.104.05   CUDA Version: 12.2     |
|-----------------------------------------+----------------------+----------------------+
| GPU  Name                 Persistence-M | Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |         Memory-Usage | GPU-Util  Compute M. |
|                                         |                      |               MIG M. |
|=========================================+======================+======================|
|   0  NVIDIA GeForce MX130           Off | 00000000:01:00.0 Off |                  N/A |
| N/A   47C    P8              N/A / 200W |      4MiB /  2048MiB |      0%      Default |
|                                         |                      |                  N/A |
+-----------------------------------------+----------------------+----------------------+
                                                                                         
+---------------------------------------------------------------------------------------+
| Processes:                                                                            |
|  GPU   GI   CI        PID   Type   Process name                            GPU Memory |
|        ID   ID                                                             Usage      |
|=======================================================================================|
|    0   N/A  N/A      2583      G   /usr/lib/xorg/Xorg                            2MiB |
+---------------------------------------------------------------------------------------+
```

### `nvcc --version`

# Hello world program

## The code
```cpp
#include <iostream>

__global__ void hello_world_kernel() { printf("Hello World from GPU\n"); }

int main() {
  std::cout << "Hello World from CPU" << std::endl;
  hello_world_kernel<<<1, 1>>>();
  cudaDeviceSynchronize();
}
```

- [ ] Add explaination about the `__global__`, the  `<<<1, 1>>>` and `cudaDeviceSynchronize()`.
## Compilation & Execution

```bash
nvcc -arch=sm_50 Beginner/HelloWorld/hello_world.cu -o ./hello_world; ./hello_world 
```

Now, why do I need to specify the `-arch=sm_50`?
My gpu is a GeForce MX130. We can look it up online (or use `nvidia-smi -q`) and see that it from the Maxwell series, thus it supports cuda compute 5.0 or lower. The default sm artchitecture...
- [ ] Point to a reference about SM architecture and cuda capability. 

## Improved Hello World
- [ ] A word about asynchronisity.
- [ ] Defining the `CUDA_CHECK_ERR` macro.
- [ ] An example of a compilation that succeeds and a run that fails.
- [ ] explain this https://stackoverflow.com/questions/6302695/difference-between-cuda-h-cuda-runtime-h-cuda-runtime-api-h and create a demo for a case that needs to include them in a .cc file. such as ptr.h


# Task
1. Read through the section and follow instructions.
2. Make sure you compile and run the code sample and recieve the following output:
    ```
    Hello World from CPU
    Hello World from GPU
    ```

