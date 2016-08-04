#include <cuda.h>
#include <device_launch_parameters.h>
#include <cuda_runtime_api.h>


__device__ float doubl_d(float in)
{
  return in * 2;
}

__global__ void doubl_g(float* in, float* out)
{
  int idx = threadIdx.x;
  out[idx] = doubl_d(in[idx]);
}

extern "C"
__host__ void doubl_h(float* in, float* out)
{
  const int SIZE = 64;
  size_t BYTES = SIZE * sizeof(float);

  float* h_in = in;
  float* h_out = out;

  float* d_in;
  float* d_out;
  cudaMalloc((void **) &d_in, BYTES);
  cudaMalloc((void **) &d_out, BYTES);

  cudaMemcpy(d_in, h_in, BYTES, cudaMemcpyHostToDevice);

  doubl_g<<<1,SIZE>>>(d_in, d_out);

  cudaMemcpy(h_out, d_out, BYTES, cudaMemcpyDeviceToHost);

}