
#include <cuda.h>
#include <device_launch_parameters.h>
#include <cuda_runtime_api.h>

__device__ float square_d(float in)
{
  return in * in;
}

__global__ void square_g(float *d_in, float *d_out)
{

  int idx = threadIdx.x;
  d_out[idx] = square_d(d_in[idx]);
}


extern "C"
void squareIt_h(float *in, float *out)
{
  const int SIZE = 64;
  const size_t BYTES = SIZE * sizeof(float);
  float* h_in = in;

  float* h_out = out;

  float* d_in;
  float* d_out;

  cudaMalloc((void **) &d_in, BYTES);
  cudaMalloc((void **) &d_out, BYTES);

  cudaMemcpy(d_in, h_in, BYTES, cudaMemcpyHostToDevice);

  square_g<<<1, SIZE>>>(d_in, d_out);

  cudaMemcpy(h_out, d_out, BYTES, cudaMemcpyDeviceToHost);

  return ;
}