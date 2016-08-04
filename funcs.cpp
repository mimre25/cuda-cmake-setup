//
// Created by mimre on 8/3/16.
//

#include "include/funcs.h"

extern "C"
void squareIt_h(float *in, float *out);

void squareIt_W (float* in, float* out) {
  squareIt_h(in, out);
}

extern "C"
void doubl_h(float *in, float *out);

void doublIt_W (float* in, float* out) {
  doubl_h(in, out);
}