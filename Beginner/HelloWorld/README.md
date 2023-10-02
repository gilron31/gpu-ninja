# Hello World
And what your computer needs to compile and run CUDA code.


Based on https://developer.download.nvidia.com/compute/cuda/5_5/rel/docs/CUDA_Getting_Started_Linux.pdf
## Basics
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