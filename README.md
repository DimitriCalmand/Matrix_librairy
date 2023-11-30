# Matrix Library (C)

## Overview

Welcome to the Matrix Library in C! This library is designed to provide a versatile and efficient solution for matrix operations. It incorporates advanced optimization techniques, including SIMD (Single Instruction, Multiple Data) instructions and integration with the Intel Math Kernel Library (MKL).

## Features

- **Matrix Operations**: The library supports fundamental matrix operations, including addition, multiplication, and more.
  
- **Data Types**: It offers flexibility with support for different data types, such as float and double.
  
- **Optimization Levels**: The library can be compiled with different optimization levels based on the desired performance:
  - `USE_SIMD=0`: No SIMD optimization.
  - `USE_SIMD=1`: SIMD optimization using AVX instructions.
  - `USE_SIMD=2`: Utilizes Intel MKL for optimized operations.
  
- **Dynamic Memory Management**: Efficient memory handling for matrices.

## Compilation Options

Choose the compilation option that suits your performance requirements:

- `USE_SIMD=0`: This setting turns off SIMD optimization, providing a baseline implementation.
  
- `USE_SIMD=1`: Enables SIMD optimization with AVX instructions. Ideal for enhancing performance on compatible hardware.
  
- `USE_SIMD=2`: Integrates Intel MKL for optimized linear algebra operations. Ensure MKL is properly installed.

## Usage

Include the library header in your C files and compile with the desired compilation option. The library provides a set of functions for performing matrix operations. Refer to the documentation for details on each function.

## Optimization Details

### SIMD Optimization

When compiled with `USE_SIMD=1`, the library leverages SIMD instructions (AVX) to accelerate matrix operations. This is particularly beneficial for large matrices.

### MKL Integration

With `USE_SIMD=2`, the library integrates with the Intel MKL, a highly optimized library for linear algebra operations. Ensure MKL is installed on your system for maximum performance.

## Notes

- Adjust the compilation options based on your optimization preferences.
  
- The library is designed for ease of use and high performance in matrix computations.



