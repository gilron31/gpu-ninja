# gpu-ninja
A set of exercises designed to teach Graphical Processing Unit (GPU) working and architecture and demonstrate best practices from a performance critical point of view. 

# Repo Structure
The repo is divided into units, each unit as a (few) well defined learning outcome(s). Each unit either requires writing code from scratch or re-writing existing code. Some units are partitioned according to the level of depth they go into. The units are grouped into three levels "Beginner", "Intermediate" and "Advanced". It is recommended to proceed to the next level only once you've completed all units in the previous level. 

- Beginner 
  - HelloWolrd (how to setup your environment. what includes do we use and why. basic nvcc usage. write hello world kernel)
  - QueryDeviceProperties (understand all specs of your device)
  - VectorAddition (how we allocate memory on host and device. write a vector addition kernel. measure kernel time, comm time and global bw)
- Intermediate
  - VectorAddition2 (maximize global r/w bw. observe how it varies with num of threads/blocks/data_size. Characterize the effects of uncoalesced memory accesses.)
  - LogicThrottle (build a framework to test the throughput of various logical operations)
  - CumSum ()
- Advanced

list of topics to be covered
- divergence
- async comm/kernel and streams
- pinned memory
- atomics
- shared
- local
- Writing inline assembly


# Existing material online
I tried nvidia courses material (https://developer.nvidia.com/cuda-education) but it is all either paid or to high level. 

The only thing that came close is https://github.com/NVIDIA/cuda-samples/tree/master/Samples. It is indeed a very comprehensive overview of practically all CUDA features. Yet it lacks one improtant aspect. It is not hands-on, it has no call to action, therefore, it is not suitible for learning purposes. Sometimes I will refer to it (especially the )
## Reading Material and Code Samples
- CUDA by examples (2010) 
- https://github.com/nvidia/cuda-samples
- The CUDA handbook (2013) https://www.cudahandbook.com/
- Nvidia guides
  - Programming guide
  - platform whitepaper
  - optimization guide
  - Nvidia blogs
    - https://developer.nvidia.com/blog/even-easier-introduction-cuda/
    - https://developer.nvidia.com/blog/easy-introduction-cuda-c-and-c/
- Reverse Engineering
  -  Volta https://arxiv.org/pdf/1804.06826.pdf
  - Ampere
    - https://www.nvidia.com/en-us/on-demand/session/gtcspring21-s33322/
    - https://arxiv.org/pdf/2208.11174v1.pdf
## Hands-On exercises
- https://github.com/udacity/cs344
- 

## Noteworthy people in the field
- [ ] Denis Bakhvalov
- [ ] Nicholas Wilt
- [ ] 