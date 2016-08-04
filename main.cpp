#include <iostream>

#include "include/funcs.h"

using namespace std;

int main()
{
  std::cout << "Hello, World!" << std::endl;

  const int SIZE = 64;
  float in[SIZE];
  for (int i = 0; i < SIZE; ++i)
  {
    in[i] = float(i);
  }
  float out[SIZE];

  squareIt_W (in, out);

  for (int i = 0; i < SIZE; ++i)
  {
    cout << out[i] << endl;
  }

  doublIt_W(out, out);

  for (int i = 0; i < SIZE; ++i)
  {
    cout << out[i] << endl;
  }

  return 0;
}