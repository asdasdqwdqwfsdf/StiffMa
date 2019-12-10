/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * StiffMas2.cu
 *
 * Code generation for function 'StiffMas2'
 *
 */

/* Include files */
#include "StiffMas2.h"
#include "MWCudaDimUtility.h"
#include "MWLaunchParametersUtilities.h"
#include "StiffMas2_data.h"
#include "StiffMas2_emxutil.h"
#include "introsort.h"
#include "rt_nonfinite.h"
#include <math.h>
#include <string.h>

/* Function Declarations */
static __global__ void StiffMas2_kernel1(const emxArray_real_T *nodes, const
  int32_T e, const emxArray_uint32_T *elements, real_T X[24]);
static __global__ void StiffMas2_kernel10(const int32_T jy, const int32_T jp1j,
  real_T Jac[9]);
static __global__ void StiffMas2_kernel11(const int32_T jp1j, const real_T Jac[9],
  const int32_T jy, const real_T L[24], const int32_T jA, real_T B[24]);
static __global__ void StiffMas2_kernel12(const real_T B[24], real_T b_B[64]);
static __global__ void StiffMas2_kernel13(const real_T B[64], const real_T smax,
  real_T ke[64]);
static __global__ void StiffMas2_kernel14(const real_T ke[64], const int32_T e,
  emxArray_real_T *Ke);
static __global__ void StiffMas2_kernel15(const emxArray_uint32_T *iK, const
  int32_T iy, emxArray_uint32_T *result);
static __global__ void StiffMas2_kernel16(const emxArray_uint32_T *jK, const
  int32_T iy, emxArray_uint32_T *result);
static __global__ void StiffMas2_kernel17(int32_T SZ[2]);
static __global__ void StiffMas2_kernel18(const emxArray_uint32_T *result,
  int32_T SZ[2]);
static __global__ void StiffMas2_kernel19(const emxArray_uint32_T *result, const
  int32_T k, int32_T SZ[2]);
static __global__ void StiffMas2_kernel2(const emxArray_uint32_T *elements,
  const int32_T e, uint32_T ind[64]);
static __global__ void StiffMas2_kernel20(const emxArray_uint32_T *result,
  emxArray_uint32_T *b);
static __global__ void StiffMas2_kernel21(const emxArray_uint32_T *result,
  emxArray_int32_T *idx);
static __global__ void StiffMas2_kernel22(const emxArray_uint32_T *result, const
  int32_T i, emxArray_int32_T *idx);
static __global__ void StiffMas2_kernel23(const emxArray_uint32_T *result,
  emxArray_int32_T *idx);
static __global__ void StiffMas2_kernel24(const int32_T j, const
  emxArray_uint32_T *b, const emxArray_int32_T *idx, const int32_T iy,
  emxArray_uint32_T *ycol);
static __global__ void StiffMas2_kernel25(const emxArray_uint32_T *ycol, const
  int32_T j, const int32_T iy, emxArray_uint32_T *b);
static __global__ void StiffMas2_kernel26(const emxArray_int32_T *idx,
  emxArray_int32_T *b_idx);
static __global__ void StiffMas2_kernel27(const emxArray_uint32_T *b, const
  int32_T i, emxArray_uint32_T *b_b);
static __global__ void StiffMas2_kernel28(const emxArray_uint32_T *b,
  emxArray_uint32_T *b_b);
static __global__ void StiffMas2_kernel29(const emxArray_int32_T *idx, const
  int32_T ix, emxArray_int32_T *indx);
static __global__ void StiffMas2_kernel3(const uint32_T ind[64], const int32_T e,
  emxArray_uint32_T *jK, emxArray_uint32_T *iK);
static __global__ void StiffMas2_kernel30(const uint32_T uv[2], emxArray_int32_T
  *r);
static __global__ void StiffMas2_kernel31(const int32_T i, emxArray_int32_T *idx);
static __global__ void StiffMas2_kernel32(const emxArray_int32_T *indx, const
  int32_T i, emxArray_int32_T *idx);
static __global__ void StiffMas2_kernel33(const emxArray_int32_T *indx,
  emxArray_int32_T *idx);
static __global__ void StiffMas2_kernel34(const emxArray_int32_T *idx,
  emxArray_int32_T *r);
static __global__ void StiffMas2_kernel35(const emxArray_int32_T *iwork, const
  int32_T j, const int32_T kEnd, emxArray_int32_T *idx);
static __global__ void StiffMas2_kernel36(const emxArray_uint32_T *b, const
  emxArray_int32_T *r, emxArray_uint32_T *b_b);
static __global__ void StiffMas2_kernel37(const emxArray_uint32_T *b,
  emxArray_uint32_T *b_b);
static __global__ void StiffMas2_kernel38(const emxArray_int32_T *r, const
  int32_T ix, emxArray_int32_T *invr);
static __global__ void StiffMas2_kernel39(const emxArray_int32_T *invr,
  emxArray_int32_T *ipos);
static __global__ void StiffMas2_kernel4(real_T ke[64]);
static __global__ void StiffMas2_kernel40(const int32_T ix, const
  emxArray_int32_T *idx, const int32_T jy, const int32_T i, emxArray_int32_T
  *ipos);
static __global__ void StiffMas2_kernel41(const int32_T jy, const int32_T ix,
  emxArray_int32_T *idx);
static __global__ void StiffMas2_kernel42(const emxArray_int32_T *iwork, const
  int32_T j, const int32_T kEnd, emxArray_int32_T *idx);
static __global__ void StiffMas2_kernel43(const emxArray_uint32_T *result,
  emxArray_uint32_T *b);
static __global__ void StiffMas2_kernel44(const emxArray_int32_T *ipos,
  emxArray_uint32_T *idx);
static __global__ void StiffMas2_kernel45(const int32_T sz[2],
  emxArray_boolean_T *filled);
static __global__ void StiffMas2_kernel46(const int32_T sz[2], emxArray_real_T
  *Afull);
static __global__ void StiffMas2_kernel47(const int32_T sz[2], emxArray_int32_T *
  counts);
static __global__ void StiffMas2_kernel48(const emxArray_real_T *Ke, const
  emxArray_int32_T *counts, const int32_T iy, emxArray_real_T *Afull);
static __global__ void StiffMas2_kernel49(const emxArray_uint32_T *b, const
  int32_T iy, emxArray_int32_T *ridxInt);
static __global__ void StiffMas2_kernel5(const real_T X[24], const real_T L[24],
  real_T Jac[9]);
static __global__ void StiffMas2_kernel50(const emxArray_uint32_T *b, const
  int32_T iy, emxArray_int32_T *cidxInt);
static __global__ void StiffMas2_kernel51(const int32_T jA, emxArray_int32_T
  *sortedIndices);
static __global__ void StiffMas2_kernel52(const emxArray_int32_T *cidxInt,
  emxArray_int32_T *t);
static __global__ void StiffMas2_kernel53(const emxArray_int32_T *t, const
  emxArray_int32_T *sortedIndices, const int32_T iy, emxArray_int32_T *cidxInt);
static __global__ void StiffMas2_kernel54(const emxArray_int32_T *ridxInt,
  emxArray_int32_T *t);
static __global__ void StiffMas2_kernel55(const emxArray_int32_T *t, const
  emxArray_int32_T *sortedIndices, const int32_T iy, emxArray_int32_T *ridxInt);
static __global__ void StiffMas2_kernel6(const real_T Jac[9], real_T x[9]);
static __global__ void StiffMas2_kernel7(int8_T ipiv[3]);
static __global__ void StiffMas2_kernel8(const real_T x[9], real_T *detJ);
static __global__ void StiffMas2_kernel9(const int32_T jy, const int32_T jp1j,
  real_T Jac[9]);
static __inline__ __device__ real_T atomicOpreal_T(real_T *address, real_T value);
static void gpuEmxFree_boolean_T(emxArray_boolean_T *inter);
static void gpuEmxFree_int32_T(emxArray_int32_T *inter);
static void gpuEmxFree_real_T(emxArray_real_T *inter);
static void gpuEmxFree_uint32_T(emxArray_uint32_T *inter);
static void gpuEmxMemcpyCpuToGpu_boolean_T(const emxArray_boolean_T *cpu,
  emxArray_boolean_T *inter, emxArray_boolean_T *gpu);
static void gpuEmxMemcpyCpuToGpu_int32_T(const emxArray_int32_T *cpu,
  emxArray_int32_T *inter, emxArray_int32_T *gpu);
static void gpuEmxMemcpyCpuToGpu_real_T(const emxArray_real_T *cpu,
  emxArray_real_T *inter, emxArray_real_T *gpu);
static void gpuEmxMemcpyCpuToGpu_uint32_T(const emxArray_uint32_T *cpu,
  emxArray_uint32_T *inter, emxArray_uint32_T *gpu);
static void gpuEmxMemcpyGpuToCpu_boolean_T(emxArray_boolean_T *cpu,
  emxArray_boolean_T *inter);
static void gpuEmxMemcpyGpuToCpu_int32_T(emxArray_int32_T *cpu, emxArray_int32_T
  *inter);
static void gpuEmxMemcpyGpuToCpu_real_T(emxArray_real_T *cpu, emxArray_real_T
  *inter);
static void gpuEmxMemcpyGpuToCpu_uint32_T(emxArray_uint32_T *cpu,
  emxArray_uint32_T *inter);
static void gpuEmxReset_boolean_T(emxArray_boolean_T *inter);
static void gpuEmxReset_int32_T(emxArray_int32_T *inter);
static void gpuEmxReset_real_T(emxArray_real_T *inter);
static void gpuEmxReset_uint32_T(emxArray_uint32_T *inter);
static __inline__ __device__ real_T shflDown2(real_T in1, uint32_T offset,
  uint32_T mask);
static __device__ real_T threadGroupReduction(real_T val, uint32_T lane,
  uint32_T mask);
static __device__ real_T workGroupReduction(real_T val, uint32_T mask, uint32_T
  numActiveWarps);

/* Function Definitions */
static __global__ __launch_bounds__(32, 1) void StiffMas2_kernel1(const
  emxArray_real_T *nodes, const int32_T e, const emxArray_uint32_T *elements,
  real_T X[24])
{
  uint32_T threadId;
  int32_T ibmat;
  int32_T itilerow;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  ibmat = static_cast<int32_T>((threadId % 8U));
  itilerow = static_cast<int32_T>(((threadId - static_cast<uint32_T>(ibmat)) /
    8U));
  if (itilerow < 3) {
    X[ibmat + (itilerow << 3)] = nodes->data[(static_cast<int32_T>
      (elements->data[e + elements->size[0] * ibmat]) + nodes->size[0] *
      itilerow) - 1];
  }
}

static __global__ __launch_bounds__(32, 1) void StiffMas2_kernel10(const int32_T
  jy, const int32_T jp1j, real_T Jac[9])
{
  uint32_T threadId;
  int32_T tmpIdx;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  tmpIdx = static_cast<int32_T>(threadId);
  if (tmpIdx < 1) {
    Jac[jp1j + 5] -= Jac[jp1j + 2] * Jac[jy + 5];
  }
}

static __global__ __launch_bounds__(32, 1) void StiffMas2_kernel11(const int32_T
  jp1j, const real_T Jac[9], const int32_T jy, const real_T L[24], const int32_T
  jA, real_T B[24])
{
  uint32_T threadId;
  real_T d;
  int32_T k;
  real_T d1;
  real_T d2;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  k = static_cast<int32_T>(threadId);
  if (k < 8) {
    d = L[(jA + 3 * k) - 1];
    d1 = L[(jy + 3 * k) - 1] - d * Jac[jy - 1];
    d2 = ((L[(jp1j + 3 * k) - 1] - d * Jac[jp1j - 1]) - d1 * Jac[jp1j + 2]) /
      Jac[jp1j + 5];
    B[3 * k + 2] = d2;
    d -= d2 * Jac[jA + 5];
    d1 -= d2 * Jac[jy + 5];
    d1 /= Jac[jy + 2];
    B[3 * k + 1] = d1;
    d -= d1 * Jac[jA + 2];
    d /= Jac[jA - 1];
    B[3 * k] = d;
  }
}

static __global__ __launch_bounds__(64, 1) void StiffMas2_kernel12(const real_T
  B[24], real_T b_B[64])
{
  uint32_T threadId;
  real_T d;
  int32_T ibmat;
  int32_T itilerow;
  int32_T jcol;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  jcol = static_cast<int32_T>((threadId % 8U));
  itilerow = static_cast<int32_T>(((threadId - static_cast<uint32_T>(jcol)) / 8U));
  if (itilerow < 8) {
    d = 0.0;
    for (ibmat = 0; ibmat < 3; ibmat++) {
      d += B[ibmat + 3 * itilerow] * B[ibmat + 3 * jcol];
    }

    b_B[itilerow + (jcol << 3)] = d;
  }
}

static __global__ __launch_bounds__(64, 1) void StiffMas2_kernel13(const real_T
  B[64], const real_T smax, real_T ke[64])
{
  uint32_T threadId;
  int32_T itilerow;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  itilerow = static_cast<int32_T>(threadId);
  if (itilerow < 64) {
    ke[itilerow] += smax * B[itilerow];
  }
}

static __global__ __launch_bounds__(64, 1) void StiffMas2_kernel14(const real_T
  ke[64], const int32_T e, emxArray_real_T *Ke)
{
  uint32_T threadId;
  int32_T ibmat;
  int32_T itilerow;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  ibmat = static_cast<int32_T>((threadId % 8U));
  itilerow = static_cast<int32_T>(((threadId - static_cast<uint32_T>(ibmat)) /
    8U));
  if (itilerow < 8) {
    Ke->data[(ibmat + (itilerow << 3)) + (e << 6)] = ke[ibmat + (itilerow << 3)];
  }
}

static __global__ __launch_bounds__(1024, 1) void StiffMas2_kernel15(const
  emxArray_uint32_T *iK, const int32_T iy, emxArray_uint32_T *result)
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T itilerow;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>(iy);
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    itilerow = static_cast<int32_T>(idx);
    result->data[itilerow] = iK->data[itilerow];
  }
}

static __global__ __launch_bounds__(1024, 1) void StiffMas2_kernel16(const
  emxArray_uint32_T *jK, const int32_T iy, emxArray_uint32_T *result)
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T itilerow;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>(iy);
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    itilerow = static_cast<int32_T>(idx);
    result->data[itilerow + result->size[0]] = jK->data[itilerow];
  }
}

static __global__ __launch_bounds__(32, 1) void StiffMas2_kernel17(int32_T SZ[2])
{
  uint32_T threadId;
  int32_T itilerow;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  itilerow = static_cast<int32_T>(threadId);
  if (itilerow < 2) {
    SZ[itilerow] = 0;
  }
}

static __global__ __launch_bounds__(32, 1) void StiffMas2_kernel18(const
  emxArray_uint32_T *result, int32_T SZ[2])
{
  uint32_T threadId;
  int32_T jcol;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  jcol = static_cast<int32_T>(threadId);
  if (jcol < 2) {
    SZ[jcol] = static_cast<int32_T>(result->data[result->size[0] * jcol]);
  }
}

static __global__ __launch_bounds__(32, 1) void StiffMas2_kernel19(const
  emxArray_uint32_T *result, const int32_T k, int32_T SZ[2])
{
  uint32_T threadId;
  int32_T jcol;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  jcol = static_cast<int32_T>(threadId);
  if ((static_cast<int32_T>((jcol < 2))) && (static_cast<int32_T>((result->data
         [(k + result->size[0] * jcol) + 1] > static_cast<uint32_T>(SZ[jcol])))))
  {
    SZ[jcol] = static_cast<int32_T>(result->data[(k + result->size[0] * jcol) +
      1]);
  }
}

static __global__ __launch_bounds__(64, 1) void StiffMas2_kernel2(const
  emxArray_uint32_T *elements, const int32_T e, uint32_T ind[64])
{
  uint32_T threadId;
  int32_T jcol;
  int32_T itilerow;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  itilerow = static_cast<int32_T>((threadId % 8U));
  jcol = static_cast<int32_T>(((threadId - static_cast<uint32_T>(itilerow)) / 8U));
  if (jcol < 8) {
    ind[(jcol << 3) + itilerow] = elements->data[e + elements->size[0] * jcol];
  }
}

static __global__ __launch_bounds__(1024, 1) void StiffMas2_kernel20(const
  emxArray_uint32_T *result, emxArray_uint32_T *b)
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T itilerow;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((result->size[0] * result->size[1] - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    itilerow = static_cast<int32_T>(idx);
    b->data[itilerow] = result->data[itilerow];
  }
}

static __global__ __launch_bounds__(1024, 1) void StiffMas2_kernel21(const
  emxArray_uint32_T *result, emxArray_int32_T *idx)
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T b_idx;
  int32_T itilerow;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((result->size[0] - 1));
  for (b_idx = threadId; b_idx <= static_cast<uint32_T>(loopEnd); b_idx +=
       threadStride) {
    itilerow = static_cast<int32_T>(b_idx);
    idx->data[itilerow] = 0;
  }
}

static __global__ __launch_bounds__(1024, 1) void StiffMas2_kernel22(const
  emxArray_uint32_T *result, const int32_T i, emxArray_int32_T *idx)
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T b_idx;
  int32_T jcol;
  int32_T k;
  boolean_T p;
  int32_T ibmat;
  uint32_T v1;
  uint32_T v2;
  int64_T loopEnd;
  boolean_T exitg1;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>(((i - 1) / 2));
  for (b_idx = threadId; b_idx <= static_cast<uint32_T>(loopEnd); b_idx +=
       threadStride) {
    k = static_cast<int32_T>(b_idx);
    jcol = (k << 1) + 1;
    p = true;
    ibmat = 1;
    exitg1 = false;
    while ((!static_cast<int32_T>(exitg1)) && (static_cast<int32_T>((ibmat < 3))))
    {
      v1 = result->data[(jcol + result->size[0] * (ibmat - 1)) - 1];
      v2 = result->data[jcol + result->size[0] * (ibmat - 1)];
      if (v1 != v2) {
        p = (v1 <= v2);
        exitg1 = true;
      } else {
        ibmat++;
      }
    }

    if (p) {
      idx->data[jcol - 1] = jcol;
      idx->data[jcol] = jcol + 1;
    } else {
      idx->data[jcol - 1] = jcol + 1;
      idx->data[jcol] = jcol;
    }
  }
}

static __global__ __launch_bounds__(32, 1) void StiffMas2_kernel23(const
  emxArray_uint32_T *result, emxArray_int32_T *idx)
{
  uint32_T threadId;
  int32_T tmpIdx;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  tmpIdx = static_cast<int32_T>(threadId);
  if (tmpIdx < 1) {
    idx->data[result->size[0] - 1] = result->size[0];
  }
}

static __global__ __launch_bounds__(1024, 1) void StiffMas2_kernel24(const
  int32_T j, const emxArray_uint32_T *b, const emxArray_int32_T *idx, const
  int32_T iy, emxArray_uint32_T *ycol)
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T b_idx;
  int32_T jcol;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((iy - 1));
  for (b_idx = threadId; b_idx <= static_cast<uint32_T>(loopEnd); b_idx +=
       threadStride) {
    jcol = static_cast<int32_T>(b_idx);
    ycol->data[jcol] = b->data[(idx->data[jcol] + b->size[0] * j) - 1];
  }
}

static __global__ __launch_bounds__(1024, 1) void StiffMas2_kernel25(const
  emxArray_uint32_T *ycol, const int32_T j, const int32_T iy, emxArray_uint32_T *
  b)
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T jcol;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((iy - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    jcol = static_cast<int32_T>(idx);
    b->data[jcol + b->size[0] * j] = ycol->data[jcol];
  }
}

static __global__ __launch_bounds__(1024, 1) void StiffMas2_kernel26(const
  emxArray_int32_T *idx, emxArray_int32_T *b_idx)
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T c_idx;
  int32_T itilerow;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((idx->size[0] - 1));
  for (c_idx = threadId; c_idx <= static_cast<uint32_T>(loopEnd); c_idx +=
       threadStride) {
    itilerow = static_cast<int32_T>(c_idx);
    b_idx->data[itilerow] = idx->data[itilerow];
  }
}

static __global__ __launch_bounds__(1024, 1) void StiffMas2_kernel27(const
  emxArray_uint32_T *b, const int32_T i, emxArray_uint32_T *b_b)
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int32_T itilerow;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = (static_cast<int64_T>(i) + 1L) * 2L - 1L;
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>((idx % (static_cast<uint32_T>(i) + 1U)));
    itilerow = static_cast<int32_T>(((idx - static_cast<uint32_T>(ibmat)) / (
      static_cast<uint32_T>(i) + 1U)));
    b_b->data[ibmat + b_b->size[0] * itilerow] = b->data[ibmat + b->size[0] *
      itilerow];
  }
}

static __global__ __launch_bounds__(1024, 1) void StiffMas2_kernel28(const
  emxArray_uint32_T *b, emxArray_uint32_T *b_b)
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T itilerow;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((b->size[0] * b->size[1] - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    itilerow = static_cast<int32_T>(idx);
    b_b->data[itilerow] = b->data[itilerow];
  }
}

static __global__ __launch_bounds__(1024, 1) void StiffMas2_kernel29(const
  emxArray_int32_T *idx, const int32_T ix, emxArray_int32_T *indx)
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T b_idx;
  int32_T k;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((ix - 1));
  for (b_idx = threadId; b_idx <= static_cast<uint32_T>(loopEnd); b_idx +=
       threadStride) {
    k = static_cast<int32_T>(b_idx);
    indx->data[k] = idx->data[k];
  }
}

static __global__ __launch_bounds__(64, 1) void StiffMas2_kernel3(const uint32_T
  ind[64], const int32_T e, emxArray_uint32_T *jK, emxArray_uint32_T *iK)
{
  uint32_T threadId;
  int32_T ibmat;
  int32_T itilerow;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  ibmat = static_cast<int32_T>((threadId % 8U));
  itilerow = static_cast<int32_T>(((threadId - static_cast<uint32_T>(ibmat)) /
    8U));
  if (itilerow < 8) {
    iK->data[(ibmat + (itilerow << 3)) + (e << 6)] = ind[itilerow + (ibmat << 3)];
    jK->data[(ibmat + (itilerow << 3)) + (e << 6)] = ind[ibmat + (itilerow << 3)];
  }
}

static __global__ __launch_bounds__(1024, 1) void StiffMas2_kernel30(const
  uint32_T uv[2], emxArray_int32_T *r)
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T itilerow;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((static_cast<int32_T>(uv[0]) - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    itilerow = static_cast<int32_T>(idx);
    r->data[itilerow] = 0;
  }
}

static __global__ __launch_bounds__(1024, 1) void StiffMas2_kernel31(const
  int32_T i, emxArray_int32_T *idx)
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T b_idx;
  int32_T itilerow;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>(i);
  for (b_idx = threadId; b_idx <= static_cast<uint32_T>(loopEnd); b_idx +=
       threadStride) {
    itilerow = static_cast<int32_T>(b_idx);
    idx->data[itilerow] = 0;
  }
}

static __global__ __launch_bounds__(1024, 1) void StiffMas2_kernel32(const
  emxArray_int32_T *indx, const int32_T i, emxArray_int32_T *idx)
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T b_idx;
  int32_T ibmat;
  int32_T k;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>(((i - 1) / 2));
  for (b_idx = threadId; b_idx <= static_cast<uint32_T>(loopEnd); b_idx +=
       threadStride) {
    k = static_cast<int32_T>(b_idx);
    ibmat = (k << 1) + 1;
    if (indx->data[ibmat - 1] <= indx->data[ibmat]) {
      idx->data[ibmat - 1] = ibmat;
      idx->data[ibmat] = ibmat + 1;
    } else {
      idx->data[ibmat - 1] = ibmat + 1;
      idx->data[ibmat] = ibmat;
    }
  }
}

static __global__ __launch_bounds__(32, 1) void StiffMas2_kernel33(const
  emxArray_int32_T *indx, emxArray_int32_T *idx)
{
  uint32_T threadId;
  int32_T tmpIdx;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  tmpIdx = static_cast<int32_T>(threadId);
  if (tmpIdx < 1) {
    idx->data[indx->size[0] - 1] = indx->size[0];
  }
}

static __global__ __launch_bounds__(1024, 1) void StiffMas2_kernel34(const
  emxArray_int32_T *idx, emxArray_int32_T *r)
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T b_idx;
  int32_T itilerow;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((idx->size[0] - 1));
  for (b_idx = threadId; b_idx <= static_cast<uint32_T>(loopEnd); b_idx +=
       threadStride) {
    itilerow = static_cast<int32_T>(b_idx);
    r->data[itilerow] = idx->data[itilerow];
  }
}

static __global__ __launch_bounds__(1024, 1) void StiffMas2_kernel35(const
  emxArray_int32_T *iwork, const int32_T j, const int32_T kEnd, emxArray_int32_T
  *idx)
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T b_idx;
  int32_T k;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((kEnd - 1));
  for (b_idx = threadId; b_idx <= static_cast<uint32_T>(loopEnd); b_idx +=
       threadStride) {
    k = static_cast<int32_T>(b_idx);
    idx->data[(j + k) - 1] = iwork->data[k];
  }
}

static __global__ __launch_bounds__(1024, 1) void StiffMas2_kernel36(const
  emxArray_uint32_T *b, const emxArray_int32_T *r, emxArray_uint32_T *b_b)
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T ibmat;
  int32_T itilerow;
  int64_T loopEnd;
  uint32_T tmpIndex;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = (static_cast<int64_T>((r->size[0] - 1)) + 1L) * 2L - 1L;
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    ibmat = static_cast<int32_T>((idx % static_cast<uint32_T>(r->size[0])));
    tmpIndex = (idx - static_cast<uint32_T>(ibmat)) / static_cast<uint32_T>
      (r->size[0]);
    itilerow = static_cast<int32_T>(tmpIndex);
    b_b->data[ibmat + b_b->size[0] * itilerow] = b->data[(r->data[ibmat] +
      b->size[0] * itilerow) - 1];
  }
}

static __global__ __launch_bounds__(1024, 1) void StiffMas2_kernel37(const
  emxArray_uint32_T *b, emxArray_uint32_T *b_b)
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T itilerow;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((b->size[0] * b->size[1] - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    itilerow = static_cast<int32_T>(idx);
    b_b->data[itilerow] = b->data[itilerow];
  }
}

static __global__ __launch_bounds__(1024, 1) void StiffMas2_kernel38(const
  emxArray_int32_T *r, const int32_T ix, emxArray_int32_T *invr)
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T k;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((ix - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    k = static_cast<int32_T>(idx);
    invr->data[r->data[k] - 1] = k + 1;
  }
}

static __global__ __launch_bounds__(1024, 1) void StiffMas2_kernel39(const
  emxArray_int32_T *invr, emxArray_int32_T *ipos)
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T itilerow;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((ipos->size[0] - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    itilerow = static_cast<int32_T>(idx);
    ipos->data[itilerow] = invr->data[ipos->data[itilerow] - 1];
  }
}

static __global__ __launch_bounds__(64, 1) void StiffMas2_kernel4(real_T ke[64])
{
  uint32_T threadId;
  int32_T itilerow;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  itilerow = static_cast<int32_T>(threadId);
  if (itilerow < 64) {
    /*  Columm index storage */
    ke[itilerow] = 0.0;
  }
}

static __global__ __launch_bounds__(1024, 1) void StiffMas2_kernel40(const
  int32_T ix, const emxArray_int32_T *idx, const int32_T jy, const int32_T i,
  emxArray_int32_T *ipos)
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T b_idx;
  int32_T jcol;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((i - jy));
  for (b_idx = threadId; b_idx <= static_cast<uint32_T>(loopEnd); b_idx +=
       threadStride) {
    jcol = static_cast<int32_T>(b_idx);
    ipos->data[idx->data[(jy + jcol) - 1] - 1] = ix;
  }
}

static __global__ __launch_bounds__(32, 1) void StiffMas2_kernel41(const int32_T
  jy, const int32_T ix, emxArray_int32_T *idx)
{
  uint32_T threadId;
  int32_T tmpIdx;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  tmpIdx = static_cast<int32_T>(threadId);
  if (tmpIdx < 1) {
    idx->data[ix - 1] = idx->data[jy - 1];
  }
}

static __global__ __launch_bounds__(1024, 1) void StiffMas2_kernel42(const
  emxArray_int32_T *iwork, const int32_T j, const int32_T kEnd, emxArray_int32_T
  *idx)
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T b_idx;
  int32_T k;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((kEnd - 1));
  for (b_idx = threadId; b_idx <= static_cast<uint32_T>(loopEnd); b_idx +=
       threadStride) {
    k = static_cast<int32_T>(b_idx);
    idx->data[(j + k) - 1] = iwork->data[k];
  }
}

static __global__ __launch_bounds__(1024, 1) void StiffMas2_kernel43(const
  emxArray_uint32_T *result, emxArray_uint32_T *b)
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T itilerow;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((result->size[0] * result->size[1] - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    itilerow = static_cast<int32_T>(idx);
    b->data[itilerow] = result->data[itilerow];
  }
}

static __global__ __launch_bounds__(1024, 1) void StiffMas2_kernel44(const
  emxArray_int32_T *ipos, emxArray_uint32_T *idx)
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T b_idx;
  int32_T itilerow;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((ipos->size[0] - 1));
  for (b_idx = threadId; b_idx <= static_cast<uint32_T>(loopEnd); b_idx +=
       threadStride) {
    itilerow = static_cast<int32_T>(b_idx);
    idx->data[itilerow] = static_cast<uint32_T>(ipos->data[itilerow]);
  }
}

static __global__ __launch_bounds__(1024, 1) void StiffMas2_kernel45(const
  int32_T sz[2], emxArray_boolean_T *filled)
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T itilerow;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((sz[0] - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    itilerow = static_cast<int32_T>(idx);
    filled->data[itilerow] = true;
  }
}

static __global__ __launch_bounds__(1024, 1) void StiffMas2_kernel46(const
  int32_T sz[2], emxArray_real_T *Afull)
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T itilerow;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((sz[0] - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    itilerow = static_cast<int32_T>(idx);
    Afull->data[itilerow] = 0.0;
  }
}

static __global__ __launch_bounds__(1024, 1) void StiffMas2_kernel47(const
  int32_T sz[2], emxArray_int32_T *counts)
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T itilerow;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((sz[0] - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    itilerow = static_cast<int32_T>(idx);
    counts->data[itilerow] = 0;
  }
}

static __global__ __launch_bounds__(1024, 1) void StiffMas2_kernel48(const
  emxArray_real_T *Ke, const emxArray_int32_T *counts, const int32_T iy,
  emxArray_real_T *Afull)
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T k;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((iy - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    k = static_cast<int32_T>(idx);
    if (counts->data[k] == 0) {
      Afull->data[k] = 0.0;
    } else {
      Afull->data[k] = static_cast<real_T>(counts->data[k]) * Ke->data[0];
    }
  }
}

static __global__ __launch_bounds__(1024, 1) void StiffMas2_kernel49(const
  emxArray_uint32_T *b, const int32_T iy, emxArray_int32_T *ridxInt)
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T k;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((iy - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    k = static_cast<int32_T>(idx);
    ridxInt->data[k] = static_cast<int32_T>(b->data[k]);
  }
}

static __global__ __launch_bounds__(32, 1) void StiffMas2_kernel5(const real_T
  X[24], const real_T L[24], real_T Jac[9])
{
  uint32_T threadId;
  real_T d;
  int32_T ibmat;
  int32_T itilerow;
  int32_T jcol;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  jcol = static_cast<int32_T>((threadId % 3U));
  itilerow = static_cast<int32_T>(((threadId - static_cast<uint32_T>(jcol)) / 3U));
  if (itilerow < 3) {
    d = 0.0;
    for (ibmat = 0; ibmat < 8; ibmat++) {
      d += L[itilerow + 3 * ibmat] * X[ibmat + (jcol << 3)];
    }

    Jac[itilerow + 3 * jcol] = d;
  }
}

static __global__ __launch_bounds__(1024, 1) void StiffMas2_kernel50(const
  emxArray_uint32_T *b, const int32_T iy, emxArray_int32_T *cidxInt)
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T k;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((iy - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    k = static_cast<int32_T>(idx);
    cidxInt->data[k] = static_cast<int32_T>(b->data[k + b->size[0]]);
  }
}

static __global__ __launch_bounds__(1024, 1) void StiffMas2_kernel51(const
  int32_T jA, emxArray_int32_T *sortedIndices)
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T k;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((jA - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    k = static_cast<int32_T>(idx);
    sortedIndices->data[k] = k + 1;
  }
}

static __global__ __launch_bounds__(1024, 1) void StiffMas2_kernel52(const
  emxArray_int32_T *cidxInt, emxArray_int32_T *t)
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T itilerow;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((cidxInt->size[0] - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    itilerow = static_cast<int32_T>(idx);
    t->data[itilerow] = cidxInt->data[itilerow];
  }
}

static __global__ __launch_bounds__(1024, 1) void StiffMas2_kernel53(const
  emxArray_int32_T *t, const emxArray_int32_T *sortedIndices, const int32_T iy,
  emxArray_int32_T *cidxInt)
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T k;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((iy - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    k = static_cast<int32_T>(idx);
    cidxInt->data[k] = t->data[sortedIndices->data[k] - 1];
  }
}

static __global__ __launch_bounds__(1024, 1) void StiffMas2_kernel54(const
  emxArray_int32_T *ridxInt, emxArray_int32_T *t)
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T itilerow;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((ridxInt->size[0] - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    itilerow = static_cast<int32_T>(idx);
    t->data[itilerow] = ridxInt->data[itilerow];
  }
}

static __global__ __launch_bounds__(1024, 1) void StiffMas2_kernel55(const
  emxArray_int32_T *t, const emxArray_int32_T *sortedIndices, const int32_T iy,
  emxArray_int32_T *ridxInt)
{
  uint32_T threadId;
  uint32_T threadStride;
  uint32_T idx;
  int32_T k;
  int64_T loopEnd;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  loopEnd = static_cast<int64_T>((iy - 1));
  for (idx = threadId; idx <= static_cast<uint32_T>(loopEnd); idx +=
       threadStride) {
    k = static_cast<int32_T>(idx);
    ridxInt->data[k] = t->data[sortedIndices->data[k] - 1];
  }
}

static __global__ __launch_bounds__(32, 1) void StiffMas2_kernel6(const real_T
  Jac[9], real_T x[9])
{
  uint32_T threadId;
  int32_T itilerow;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  itilerow = static_cast<int32_T>(threadId);
  if (itilerow < 9) {
    /*  Jacobian matrix */
    x[itilerow] = Jac[itilerow];
  }
}

static __global__ __launch_bounds__(32, 1) void StiffMas2_kernel7(int8_T ipiv[3])
{
  uint32_T threadId;
  int32_T itilerow;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  itilerow = static_cast<int32_T>(threadId);
  if (itilerow < 3) {
    ipiv[itilerow] = static_cast<int8_T>((itilerow + 1));
  }
}

static __global__ __launch_bounds__(32, 1) void StiffMas2_kernel8(const real_T
  x[9], real_T *detJ)
{
  uint32_T idx;
  real_T tmpRed0;
  uint32_T threadStride;
  uint32_T threadId;
  uint32_T thBlkId;
  uint32_T mask;
  uint32_T numActiveThreads;
  uint32_T numActiveWarps;
  uint32_T blockStride;
  int32_T m;
  threadStride = static_cast<uint32_T>(mwGetTotalThreadsLaunched());
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  thBlkId = static_cast<uint32_T>(mwGetThreadIndexWithinBlock());
  blockStride = static_cast<uint32_T>(mwGetThreadsPerBlock());
  tmpRed0 = 1.0;
  numActiveThreads = blockStride;
  if (mwIsLastBlock()) {
    m = static_cast<int32_T>((3U % blockStride));
    if (static_cast<uint32_T>(m) > 0U) {
      numActiveThreads = static_cast<uint32_T>(m);
    }
  }

  numActiveWarps = ((numActiveThreads + warpSize) - 1U) / warpSize;
  if (threadId <= 2U) {
    tmpRed0 = x[static_cast<int32_T>(threadId) + 3 * static_cast<int32_T>
      (threadId)];
  }

  mask = __ballot_sync(MAX_uint32_T, threadId <= 2U);
  for (idx = threadId + threadStride; idx <= 2U; idx += threadStride) {
    tmpRed0 *= x[static_cast<int32_T>(idx) + 3 * static_cast<int32_T>(idx)];
  }

  tmpRed0 = workGroupReduction(tmpRed0, mask, numActiveWarps);
  if (thBlkId == 0U) {
    atomicOpreal_T(&detJ[0], tmpRed0);
  }
}

static __global__ __launch_bounds__(32, 1) void StiffMas2_kernel9(const int32_T
  jy, const int32_T jp1j, real_T Jac[9])
{
  uint32_T threadId;
  int32_T tmpIdx;
  threadId = static_cast<uint32_T>(mwGetGlobalThreadIndex());
  tmpIdx = static_cast<int32_T>(threadId);
  if (tmpIdx < 1) {
    Jac[jp1j + 2] /= Jac[jy + 2];
  }
}

static __inline__ __device__ real_T atomicOpreal_T(real_T *address, real_T value)
{
  unsigned long long int *address_as_up;
  unsigned long long int old;
  unsigned long long int assumed;
  address_as_up = (unsigned long long int *)address;
  old = *address_as_up;
  do {
    assumed = old;
    old = atomicCAS(address_as_up, old, __double_as_longlong(value *
      __longlong_as_double(old)));
  } while (assumed != old);

  return __longlong_as_double(old);
}

static void gpuEmxFree_boolean_T(emxArray_boolean_T *inter)
{
  cudaFree(inter->data);
  cudaFree(inter->size);
}

static void gpuEmxFree_int32_T(emxArray_int32_T *inter)
{
  cudaFree(inter->data);
  cudaFree(inter->size);
}

static void gpuEmxFree_real_T(emxArray_real_T *inter)
{
  cudaFree(inter->data);
  cudaFree(inter->size);
}

static void gpuEmxFree_uint32_T(emxArray_uint32_T *inter)
{
  cudaFree(inter->data);
  cudaFree(inter->size);
}

static void gpuEmxMemcpyCpuToGpu_boolean_T(const emxArray_boolean_T *cpu,
  emxArray_boolean_T *inter, emxArray_boolean_T *gpu)
{
  int32_T actualSize;
  int32_T i;
  int32_T allocatingSize;
  if (inter->numDimensions < cpu->numDimensions) {
    inter->numDimensions = cpu->numDimensions;
    cudaFree(inter->size);
    cudaMalloc(&inter->size, inter->numDimensions * sizeof(int32_T));
  } else {
    inter->numDimensions = cpu->numDimensions;
  }

  actualSize = 1;
  for (i = 0; i < cpu->numDimensions; i++) {
    actualSize *= cpu->size[i];
  }

  if (inter->allocatedSize < actualSize) {
    if (inter->canFreeData) {
      cudaFree(inter->data);
    }

    allocatingSize = cpu->allocatedSize;
    if (allocatingSize < actualSize) {
      allocatingSize = actualSize;
    }

    inter->allocatedSize = allocatingSize;
    inter->canFreeData = true;
    cudaMalloc(&inter->data, inter->allocatedSize * sizeof(boolean_T));
  }

  cudaMemcpy(inter->data, cpu->data, actualSize * sizeof(boolean_T),
             cudaMemcpyHostToDevice);
  cudaMemcpy(inter->size, cpu->size, cpu->numDimensions * sizeof(int32_T),
             cudaMemcpyHostToDevice);
  cudaMemcpy(gpu, inter, 32UL, cudaMemcpyHostToDevice);
}

static void gpuEmxMemcpyCpuToGpu_int32_T(const emxArray_int32_T *cpu,
  emxArray_int32_T *inter, emxArray_int32_T *gpu)
{
  int32_T actualSize;
  int32_T i;
  int32_T allocatingSize;
  if (inter->numDimensions < cpu->numDimensions) {
    inter->numDimensions = cpu->numDimensions;
    cudaFree(inter->size);
    cudaMalloc(&inter->size, inter->numDimensions * sizeof(int32_T));
  } else {
    inter->numDimensions = cpu->numDimensions;
  }

  actualSize = 1;
  for (i = 0; i < cpu->numDimensions; i++) {
    actualSize *= cpu->size[i];
  }

  if (inter->allocatedSize < actualSize) {
    if (inter->canFreeData) {
      cudaFree(inter->data);
    }

    allocatingSize = cpu->allocatedSize;
    if (allocatingSize < actualSize) {
      allocatingSize = actualSize;
    }

    inter->allocatedSize = allocatingSize;
    inter->canFreeData = true;
    cudaMalloc(&inter->data, inter->allocatedSize * sizeof(int32_T));
  }

  cudaMemcpy(inter->data, cpu->data, actualSize * sizeof(int32_T),
             cudaMemcpyHostToDevice);
  cudaMemcpy(inter->size, cpu->size, cpu->numDimensions * sizeof(int32_T),
             cudaMemcpyHostToDevice);
  cudaMemcpy(gpu, inter, 32UL, cudaMemcpyHostToDevice);
}

static void gpuEmxMemcpyCpuToGpu_real_T(const emxArray_real_T *cpu,
  emxArray_real_T *inter, emxArray_real_T *gpu)
{
  int32_T actualSize;
  int32_T i;
  int32_T allocatingSize;
  if (inter->numDimensions < cpu->numDimensions) {
    inter->numDimensions = cpu->numDimensions;
    cudaFree(inter->size);
    cudaMalloc(&inter->size, inter->numDimensions * sizeof(int32_T));
  } else {
    inter->numDimensions = cpu->numDimensions;
  }

  actualSize = 1;
  for (i = 0; i < cpu->numDimensions; i++) {
    actualSize *= cpu->size[i];
  }

  if (inter->allocatedSize < actualSize) {
    if (inter->canFreeData) {
      cudaFree(inter->data);
    }

    allocatingSize = cpu->allocatedSize;
    if (allocatingSize < actualSize) {
      allocatingSize = actualSize;
    }

    inter->allocatedSize = allocatingSize;
    inter->canFreeData = true;
    cudaMalloc(&inter->data, inter->allocatedSize * sizeof(real_T));
  }

  cudaMemcpy(inter->data, cpu->data, actualSize * sizeof(real_T),
             cudaMemcpyHostToDevice);
  cudaMemcpy(inter->size, cpu->size, cpu->numDimensions * sizeof(int32_T),
             cudaMemcpyHostToDevice);
  cudaMemcpy(gpu, inter, 32UL, cudaMemcpyHostToDevice);
}

static void gpuEmxMemcpyCpuToGpu_uint32_T(const emxArray_uint32_T *cpu,
  emxArray_uint32_T *inter, emxArray_uint32_T *gpu)
{
  int32_T actualSize;
  int32_T i;
  int32_T allocatingSize;
  if (inter->numDimensions < cpu->numDimensions) {
    inter->numDimensions = cpu->numDimensions;
    cudaFree(inter->size);
    cudaMalloc(&inter->size, inter->numDimensions * sizeof(int32_T));
  } else {
    inter->numDimensions = cpu->numDimensions;
  }

  actualSize = 1;
  for (i = 0; i < cpu->numDimensions; i++) {
    actualSize *= cpu->size[i];
  }

  if (inter->allocatedSize < actualSize) {
    if (inter->canFreeData) {
      cudaFree(inter->data);
    }

    allocatingSize = cpu->allocatedSize;
    if (allocatingSize < actualSize) {
      allocatingSize = actualSize;
    }

    inter->allocatedSize = allocatingSize;
    inter->canFreeData = true;
    cudaMalloc(&inter->data, inter->allocatedSize * sizeof(uint32_T));
  }

  cudaMemcpy(inter->data, cpu->data, actualSize * sizeof(uint32_T),
             cudaMemcpyHostToDevice);
  cudaMemcpy(inter->size, cpu->size, cpu->numDimensions * sizeof(int32_T),
             cudaMemcpyHostToDevice);
  cudaMemcpy(gpu, inter, 32UL, cudaMemcpyHostToDevice);
}

static void gpuEmxMemcpyGpuToCpu_boolean_T(emxArray_boolean_T *cpu,
  emxArray_boolean_T *inter)
{
  int32_T actualSize;
  int32_T i;
  actualSize = 1;
  for (i = 0; i < cpu->numDimensions; i++) {
    actualSize *= cpu->size[i];
  }

  cudaMemcpy(cpu->data, inter->data, actualSize * sizeof(boolean_T),
             cudaMemcpyDeviceToHost);
  cudaMemcpy(cpu->size, inter->size, inter->numDimensions * sizeof(int32_T),
             cudaMemcpyDeviceToHost);
}

static void gpuEmxMemcpyGpuToCpu_int32_T(emxArray_int32_T *cpu, emxArray_int32_T
  *inter)
{
  int32_T actualSize;
  int32_T i;
  actualSize = 1;
  for (i = 0; i < cpu->numDimensions; i++) {
    actualSize *= cpu->size[i];
  }

  cudaMemcpy(cpu->data, inter->data, actualSize * sizeof(int32_T),
             cudaMemcpyDeviceToHost);
  cudaMemcpy(cpu->size, inter->size, inter->numDimensions * sizeof(int32_T),
             cudaMemcpyDeviceToHost);
}

static void gpuEmxMemcpyGpuToCpu_real_T(emxArray_real_T *cpu, emxArray_real_T
  *inter)
{
  int32_T actualSize;
  int32_T i;
  actualSize = 1;
  for (i = 0; i < cpu->numDimensions; i++) {
    actualSize *= cpu->size[i];
  }

  cudaMemcpy(cpu->data, inter->data, actualSize * sizeof(real_T),
             cudaMemcpyDeviceToHost);
  cudaMemcpy(cpu->size, inter->size, inter->numDimensions * sizeof(int32_T),
             cudaMemcpyDeviceToHost);
}

static void gpuEmxMemcpyGpuToCpu_uint32_T(emxArray_uint32_T *cpu,
  emxArray_uint32_T *inter)
{
  int32_T actualSize;
  int32_T i;
  actualSize = 1;
  for (i = 0; i < cpu->numDimensions; i++) {
    actualSize *= cpu->size[i];
  }

  cudaMemcpy(cpu->data, inter->data, actualSize * sizeof(uint32_T),
             cudaMemcpyDeviceToHost);
  cudaMemcpy(cpu->size, inter->size, inter->numDimensions * sizeof(int32_T),
             cudaMemcpyDeviceToHost);
}

static void gpuEmxReset_boolean_T(emxArray_boolean_T *inter)
{
  memset(inter, 0, sizeof(emxArray_boolean_T));
}

static void gpuEmxReset_int32_T(emxArray_int32_T *inter)
{
  memset(inter, 0, sizeof(emxArray_int32_T));
}

static void gpuEmxReset_real_T(emxArray_real_T *inter)
{
  memset(inter, 0, sizeof(emxArray_real_T));
}

static void gpuEmxReset_uint32_T(emxArray_uint32_T *inter)
{
  memset(inter, 0, sizeof(emxArray_uint32_T));
}

static __inline__ __device__ real_T shflDown2(real_T in1, uint32_T offset,
  uint32_T mask)
{
  int2 tmp;
  tmp = *(int2 *)&in1;
  tmp.x = __shfl_down_sync(mask, tmp.x, offset);
  tmp.y = __shfl_down_sync(mask, tmp.y, offset);
  return *(real_T *)&tmp;
}

static __device__ real_T threadGroupReduction(real_T val, uint32_T lane,
  uint32_T mask)
{
  real_T other;
  uint32_T offset;
  uint32_T activeSize;
  activeSize = __popc(mask);
  offset = (activeSize + 1U) / 2U;
  while (activeSize > 1U) {
    other = shflDown2(val, offset, mask);
    if (lane + offset < activeSize) {
      val *= other;
    }

    activeSize = offset;
    offset = (offset + 1U) / 2U;
  }

  return val;
}

static __device__ real_T workGroupReduction(real_T val, uint32_T mask, uint32_T
  numActiveWarps)
{
  __shared__ real_T shared[32];
  uint32_T lane;
  uint32_T widx;
  uint32_T thBlkId;
  thBlkId = static_cast<uint32_T>(mwGetThreadIndexWithinBlock());
  lane = thBlkId % warpSize;
  widx = thBlkId / warpSize;
  val = threadGroupReduction(val, lane, mask);
  if (lane == 0U) {
    shared[widx] = val;
  }

  __syncthreads();
  mask = __ballot_sync(MAX_uint32_T, lane < numActiveWarps);
  val = shared[lane];
  if (widx == 0U) {
    val = threadGroupReduction(val, lane, mask);
  }

  return val;
}

void StiffMas2(const emxArray_uint32_T *elements, const emxArray_real_T *nodes,
               real_T c, coder_internal_sparse *K)
{
  emxArray_uint32_T *iK;
  emxArray_uint32_T *jK;
  emxArray_real_T *Ke;
  int32_T i;
  int32_T k;
  int32_T e;
  emxArray_uint32_T *result;
  int32_T iv[1];
  int32_T iv1[1];
  int32_T iy;
  real_T L[24];
  int32_T SZ[2];
  real_T Jac[9];
  real_T x[9];
  int8_T ipiv[3];
  emxArray_int32_T *ipos;
  int32_T b_i;
  emxArray_uint32_T *b;
  static const real_T dv[8] = { -0.57735026918962584, -0.57735026918962584,
    0.57735026918962584, 0.57735026918962584, -0.57735026918962584,
    -0.57735026918962584, 0.57735026918962584, 0.57735026918962584 };

  static const real_T dv1[8] = { -0.57735026918962584, -0.57735026918962584,
    -0.57735026918962584, -0.57735026918962584, 0.57735026918962584,
    0.57735026918962584, 0.57735026918962584, 0.57735026918962584 };

  emxArray_int32_T *idx;
  int32_T n;
  emxArray_uint32_T *b_idx;
  static const real_T dv2[8] = { -0.57735026918962584, 0.57735026918962584,
    0.57735026918962584, -0.57735026918962584, -0.57735026918962584,
    0.57735026918962584, 0.57735026918962584, -0.57735026918962584 };

  emxArray_int32_T *iwork;
  int32_T sz[2];
  emxArray_real_T *Afull;
  emxArray_boolean_T *filled;
  emxArray_int32_T *counts;
  int32_T i2;
  emxArray_uint32_T *ycol;
  int32_T j;
  int32_T jy;
  int32_T jp1j;
  int32_T qEnd;
  emxArray_int32_T *c_idx;
  int32_T kEnd;
  real_T smax;
  real_T s;
  boolean_T isodd;
  emxArray_int32_T *ridxInt;
  real_T detJ;
  int32_T b_c;
  int32_T jA;
  int32_T ix;
  uint32_T v1;
  uint32_T v2;
  emxArray_uint32_T *b_b;
  emxArray_int32_T *cidxInt;
  emxArray_int32_T *sortedIndices;
  cell_wrap_2 tunableEnvironment[2];
  emxArray_int32_T *indx;
  emxArray_int32_T *r;
  uint32_T uv[2];
  emxArray_int32_T *t;
  emxArray_int32_T *d_idx;
  emxArray_uint32_T *c_b;
  emxArray_int32_T *b_t;
  emxArray_int32_T *b_iwork;
  emxArray_int32_T *invr;
  int32_T initAuxVar;
  emxArray_real_T *gpu_nodes;
  emxArray_uint32_T *gpu_elements;
  real_T (*gpu_X)[24];
  uint32_T (*gpu_ind)[64];
  emxArray_uint32_T *gpu_jK;
  emxArray_uint32_T *gpu_iK;
  real_T (*gpu_ke)[64];
  real_T (*gpu_L)[24];
  real_T (*gpu_Jac)[9];
  real_T (*gpu_x)[9];
  int8_T (*gpu_ipiv)[3];
  real_T *gpu_detJ;
  real_T (*gpu_B)[24];
  real_T (*b_gpu_B)[64];
  emxArray_real_T *gpu_Ke;
  dim3 grid;
  dim3 block;
  boolean_T validLaunchParams;
  emxArray_uint32_T *gpu_result;
  dim3 b_grid;
  dim3 b_block;
  boolean_T b_validLaunchParams;
  int32_T (*gpu_SZ)[2];
  dim3 c_grid;
  dim3 c_block;
  boolean_T c_validLaunchParams;
  emxArray_uint32_T *gpu_b;
  dim3 d_grid;
  dim3 d_block;
  boolean_T d_validLaunchParams;
  emxArray_int32_T *gpu_idx;
  dim3 e_grid;
  dim3 e_block;
  boolean_T e_validLaunchParams;
  dim3 f_grid;
  dim3 f_block;
  boolean_T f_validLaunchParams;
  emxArray_uint32_T *gpu_ycol;
  dim3 g_grid;
  dim3 g_block;
  boolean_T g_validLaunchParams;
  dim3 h_grid;
  dim3 h_block;
  boolean_T h_validLaunchParams;
  emxArray_int32_T *b_gpu_idx;
  dim3 i_grid;
  dim3 i_block;
  boolean_T i_validLaunchParams;
  emxArray_uint32_T *b_gpu_b;
  dim3 j_grid;
  dim3 j_block;
  boolean_T j_validLaunchParams;
  dim3 k_grid;
  dim3 k_block;
  boolean_T k_validLaunchParams;
  emxArray_int32_T *gpu_indx;
  uint32_T (*gpu_uv)[2];
  dim3 l_grid;
  dim3 l_block;
  boolean_T l_validLaunchParams;
  emxArray_int32_T *gpu_r;
  dim3 m_grid;
  dim3 m_block;
  boolean_T m_validLaunchParams;
  emxArray_int32_T *c_gpu_idx;
  dim3 n_grid;
  dim3 n_block;
  boolean_T n_validLaunchParams;
  dim3 o_grid;
  dim3 o_block;
  boolean_T o_validLaunchParams;
  emxArray_int32_T *gpu_iwork;
  dim3 p_grid;
  dim3 p_block;
  boolean_T p_validLaunchParams;
  dim3 q_grid;
  dim3 q_block;
  boolean_T q_validLaunchParams;
  emxArray_uint32_T *c_gpu_b;
  dim3 r_grid;
  dim3 r_block;
  boolean_T r_validLaunchParams;
  dim3 s_grid;
  dim3 s_block;
  boolean_T s_validLaunchParams;
  emxArray_int32_T *gpu_invr;
  emxArray_int32_T *gpu_ipos;
  dim3 t_grid;
  dim3 t_block;
  boolean_T t_validLaunchParams;
  dim3 u_grid;
  dim3 u_block;
  boolean_T u_validLaunchParams;
  emxArray_int32_T *b_gpu_iwork;
  dim3 v_grid;
  dim3 v_block;
  boolean_T v_validLaunchParams;
  dim3 w_grid;
  dim3 w_block;
  boolean_T w_validLaunchParams;
  dim3 x_grid;
  dim3 x_block;
  boolean_T x_validLaunchParams;
  emxArray_uint32_T *d_gpu_idx;
  int32_T (*gpu_sz)[2];
  dim3 y_grid;
  dim3 y_block;
  boolean_T y_validLaunchParams;
  emxArray_boolean_T *gpu_filled;
  dim3 ab_grid;
  dim3 ab_block;
  boolean_T ab_validLaunchParams;
  emxArray_real_T *gpu_Afull;
  dim3 bb_grid;
  dim3 bb_block;
  boolean_T bb_validLaunchParams;
  emxArray_int32_T *gpu_counts;
  dim3 cb_grid;
  dim3 cb_block;
  boolean_T cb_validLaunchParams;
  dim3 db_grid;
  dim3 db_block;
  boolean_T db_validLaunchParams;
  emxArray_int32_T *gpu_ridxInt;
  dim3 eb_grid;
  dim3 eb_block;
  boolean_T eb_validLaunchParams;
  emxArray_int32_T *gpu_cidxInt;
  dim3 fb_grid;
  dim3 fb_block;
  boolean_T fb_validLaunchParams;
  emxArray_int32_T *gpu_sortedIndices;
  dim3 gb_grid;
  dim3 gb_block;
  boolean_T gb_validLaunchParams;
  emxArray_int32_T *gpu_t;
  dim3 hb_grid;
  dim3 hb_block;
  boolean_T hb_validLaunchParams;
  dim3 ib_grid;
  dim3 ib_block;
  boolean_T ib_validLaunchParams;
  emxArray_int32_T *b_gpu_t;
  dim3 jb_grid;
  dim3 jb_block;
  boolean_T jb_validLaunchParams;
  boolean_T jK_dirtyOnGpu;
  boolean_T iK_dirtyOnGpu;
  boolean_T x_dirtyOnGpu;
  boolean_T ipiv_dirtyOnGpu;
  boolean_T detJ_dirtyOnGpu;
  boolean_T Ke_dirtyOnGpu;
  boolean_T result_dirtyOnGpu;
  boolean_T b_dirtyOnGpu;
  boolean_T idx_dirtyOnGpu;
  boolean_T b_b_dirtyOnGpu;
  boolean_T indx_dirtyOnGpu;
  boolean_T r_dirtyOnGpu;
  boolean_T b_idx_dirtyOnGpu;
  boolean_T c_b_dirtyOnGpu;
  boolean_T ipos_dirtyOnGpu;
  boolean_T c_idx_dirtyOnGpu;
  boolean_T filled_dirtyOnGpu;
  boolean_T Afull_dirtyOnGpu;
  boolean_T counts_dirtyOnGpu;
  boolean_T ridxInt_dirtyOnGpu;
  boolean_T cidxInt_dirtyOnGpu;
  boolean_T sortedIndices_dirtyOnGpu;
  boolean_T nodes_dirtyOnCpu;
  boolean_T elements_dirtyOnCpu;
  boolean_T jK_dirtyOnCpu;
  boolean_T iK_dirtyOnCpu;
  boolean_T x_dirtyOnCpu;
  boolean_T ipiv_dirtyOnCpu;
  boolean_T Ke_dirtyOnCpu;
  boolean_T result_dirtyOnCpu;
  boolean_T b_dirtyOnCpu;
  boolean_T idx_dirtyOnCpu;
  boolean_T ycol_dirtyOnCpu;
  boolean_T b_idx_dirtyOnCpu;
  boolean_T b_b_dirtyOnCpu;
  boolean_T indx_dirtyOnCpu;
  boolean_T r_dirtyOnCpu;
  boolean_T c_idx_dirtyOnCpu;
  boolean_T iwork_dirtyOnCpu;
  boolean_T c_b_dirtyOnCpu;
  boolean_T invr_dirtyOnCpu;
  boolean_T ipos_dirtyOnCpu;
  boolean_T b_iwork_dirtyOnCpu;
  boolean_T sz_dirtyOnCpu;
  boolean_T counts_dirtyOnCpu;
  boolean_T ridxInt_dirtyOnCpu;
  boolean_T cidxInt_dirtyOnCpu;
  boolean_T sortedIndices_dirtyOnCpu;
  boolean_T t_dirtyOnCpu;
  boolean_T b_t_dirtyOnCpu;
  emxArray_uint32_T inter_elements;
  emxArray_uint32_T inter_iK;
  emxArray_uint32_T inter_jK;
  emxArray_real_T inter_Ke;
  emxArray_real_T inter_nodes;
  emxArray_uint32_T inter_result;
  emxArray_int32_T inter_ipos;
  emxArray_uint32_T inter_b;
  emxArray_int32_T inter_idx;
  emxArray_int32_T inter_iwork;
  emxArray_uint32_T inter_ycol;
  emxArray_int32_T b_inter_idx;
  emxArray_uint32_T b_inter_b;
  emxArray_int32_T inter_indx;
  emxArray_int32_T inter_r;
  emxArray_int32_T c_inter_idx;
  emxArray_int32_T b_inter_iwork;
  emxArray_uint32_T c_inter_b;
  emxArray_int32_T inter_invr;
  emxArray_uint32_T d_inter_idx;
  emxArray_boolean_T inter_filled;
  emxArray_real_T inter_Afull;
  emxArray_int32_T inter_counts;
  emxArray_int32_T inter_ridxInt;
  emxArray_int32_T inter_cidxInt;
  emxArray_int32_T inter_sortedIndices;
  emxArray_int32_T inter_t;
  emxArray_int32_T b_inter_t;
  boolean_T exitg1;
  int32_T exitg2;
  cudaMalloc(&b_gpu_t, 32UL);
  gpuEmxReset_int32_T(&b_inter_t);
  cudaMalloc(&gpu_t, 32UL);
  gpuEmxReset_int32_T(&inter_t);
  cudaMalloc(&gpu_sortedIndices, 32UL);
  gpuEmxReset_int32_T(&inter_sortedIndices);
  cudaMalloc(&gpu_cidxInt, 32UL);
  gpuEmxReset_int32_T(&inter_cidxInt);
  cudaMalloc(&gpu_ridxInt, 32UL);
  gpuEmxReset_int32_T(&inter_ridxInt);
  cudaMalloc(&gpu_counts, 32UL);
  gpuEmxReset_int32_T(&inter_counts);
  cudaMalloc(&gpu_Afull, 32UL);
  gpuEmxReset_real_T(&inter_Afull);
  cudaMalloc(&gpu_sz, 8UL);
  cudaMalloc(&gpu_filled, 32UL);
  gpuEmxReset_boolean_T(&inter_filled);
  cudaMalloc(&d_gpu_idx, 32UL);
  gpuEmxReset_uint32_T(&d_inter_idx);
  cudaMalloc(&gpu_invr, 32UL);
  gpuEmxReset_int32_T(&inter_invr);
  cudaMalloc(&c_gpu_b, 32UL);
  gpuEmxReset_uint32_T(&c_inter_b);
  cudaMalloc(&gpu_iwork, 32UL);
  gpuEmxReset_int32_T(&b_inter_iwork);
  cudaMalloc(&c_gpu_idx, 32UL);
  gpuEmxReset_int32_T(&c_inter_idx);
  cudaMalloc(&gpu_uv, 8UL);
  cudaMalloc(&gpu_r, 32UL);
  gpuEmxReset_int32_T(&inter_r);
  cudaMalloc(&gpu_indx, 32UL);
  gpuEmxReset_int32_T(&inter_indx);
  cudaMalloc(&b_gpu_b, 32UL);
  gpuEmxReset_uint32_T(&b_inter_b);
  cudaMalloc(&b_gpu_idx, 32UL);
  gpuEmxReset_int32_T(&b_inter_idx);
  cudaMalloc(&gpu_ycol, 32UL);
  gpuEmxReset_uint32_T(&inter_ycol);
  cudaMalloc(&b_gpu_iwork, 32UL);
  gpuEmxReset_int32_T(&inter_iwork);
  cudaMalloc(&gpu_idx, 32UL);
  gpuEmxReset_int32_T(&inter_idx);
  cudaMalloc(&gpu_b, 32UL);
  gpuEmxReset_uint32_T(&inter_b);
  cudaMalloc(&gpu_ipos, 32UL);
  gpuEmxReset_int32_T(&inter_ipos);
  cudaMalloc(&gpu_SZ, 8UL);
  cudaMalloc(&gpu_result, 32UL);
  gpuEmxReset_uint32_T(&inter_result);
  cudaMalloc(&b_gpu_B, 512UL);
  cudaMalloc(&gpu_B, 192UL);
  cudaMalloc(&gpu_detJ, 8UL);
  cudaMalloc(&gpu_ipiv, 3UL);
  cudaMalloc(&gpu_x, 72UL);
  cudaMalloc(&gpu_Jac, 72UL);
  cudaMalloc(&gpu_L, 192UL);
  cudaMalloc(&gpu_ke, 512UL);
  cudaMalloc(&gpu_ind, 256UL);
  cudaMalloc(&gpu_X, 192UL);
  cudaMalloc(&gpu_nodes, 32UL);
  gpuEmxReset_real_T(&inter_nodes);
  cudaMalloc(&gpu_Ke, 32UL);
  gpuEmxReset_real_T(&inter_Ke);
  cudaMalloc(&gpu_jK, 32UL);
  gpuEmxReset_uint32_T(&inter_jK);
  cudaMalloc(&gpu_iK, 32UL);
  gpuEmxReset_uint32_T(&inter_iK);
  cudaMalloc(&gpu_elements, 32UL);
  gpuEmxReset_uint32_T(&inter_elements);
  ipiv_dirtyOnCpu = false;
  x_dirtyOnCpu = false;
  nodes_dirtyOnCpu = true;
  elements_dirtyOnCpu = true;
  emlrtHeapReferenceStackEnterFcnR2012b(emlrtRootTLSGlobal);
  emxInit_uint32_T(&iK, 3, true);
  iK_dirtyOnGpu = false;
  emxInit_uint32_T(&jK, 3, true);
  jK_dirtyOnGpu = false;
  emxInit_real_T(&Ke, 3, true);
  Ke_dirtyOnGpu = false;

  /*  STIFFMAS2 Create the global stiffness matrix K for a SCALAR problem in SERIAL computing. */
  /*    STIFFMAS2(elements,nodes,c) returns a sparse matrix K from finite element */
  /*    analysis of scalar problems in a three-dimensional domain, where "elements" */
  /*    is the connectivity matrix of size nelx8, "nodes" the nodal coordinates of */
  /*    size Nx3, and "c" the material property for an isotropic material (scalar). */
  /*  */
  /*    See also STIFFMAS */
  /*  */
  /*    For more information, see the <a href="matlab: */
  /*    web('https://github.com/fjramireg/StiffMa')">StiffMa</a> web site. */
  /*    Written by Francisco Javier Ramirez-Gil, fjramireg@gmail.com */
  /*    Universidad Nacional de Colombia - Medellin */
  /*  	Created: 08/12/2019. Version: 1.0 - Only 1 function instead of 2 in StiffMas */
  /*  Add kernelfun pragma to trigger kernel creation */
  /*  Variable declaration/initialization */
  /*  Gauss point */
  /*  Points through r-coordinate */
  /*  Points through s-coordinate */
  /*  Points through t-coordinate */
  /*  Data type (precision) for index computation */
  /*  Data type (precision) for ke computation */
  /*  Total number of elements */
  /*  Stores the rows' indices */
  /*  Stores the columns' indices */
  /*  Stores the NNZ values */
  i = elements->size[0];
  k = iK->size[0] * iK->size[1] * iK->size[2];
  iK->size[0] = 8;
  iK->size[1] = 8;
  iK->size[2] = elements->size[0];
  emxEnsureCapacity_uint32_T(iK, k);
  iK_dirtyOnCpu = true;
  k = jK->size[0] * jK->size[1] * jK->size[2];
  jK->size[0] = 8;
  jK->size[1] = 8;
  jK->size[2] = elements->size[0];
  emxEnsureCapacity_uint32_T(jK, k);
  jK_dirtyOnCpu = true;
  k = Ke->size[0] * Ke->size[1] * Ke->size[2];
  Ke->size[0] = 8;
  Ke->size[1] = 8;
  Ke->size[2] = elements->size[0];
  emxEnsureCapacity_real_T(Ke, k);
  Ke_dirtyOnCpu = true;
  for (e = 0; e < i; e++) {
    /*  Loop over elements */
    /*  Nodes of the element 'e' */
    if (nodes_dirtyOnCpu) {
      gpuEmxMemcpyCpuToGpu_real_T(nodes, &inter_nodes, gpu_nodes);
      nodes_dirtyOnCpu = false;
    }

    if (elements_dirtyOnCpu) {
      gpuEmxMemcpyCpuToGpu_uint32_T(elements, &inter_elements, gpu_elements);
      elements_dirtyOnCpu = false;
    }

    StiffMas2_kernel1<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(gpu_nodes, e,
      gpu_elements, *gpu_X);

    /*  Nodal coordinates of the element 'e' */
    StiffMas2_kernel2<<<dim3(1U, 1U, 1U), dim3(64U, 1U, 1U)>>>(gpu_elements, e, *
      gpu_ind);

    /*  Index for element 'e' */
    /*  Row index storage */
    if (jK_dirtyOnCpu) {
      gpuEmxMemcpyCpuToGpu_uint32_T(jK, &inter_jK, gpu_jK);
      jK_dirtyOnCpu = false;
    }

    if (iK_dirtyOnCpu) {
      gpuEmxMemcpyCpuToGpu_uint32_T(iK, &inter_iK, gpu_iK);
      iK_dirtyOnCpu = false;
    }

    StiffMas2_kernel3<<<dim3(1U, 1U, 1U), dim3(64U, 1U, 1U)>>>(*gpu_ind, e,
      gpu_jK, gpu_iK);
    iK_dirtyOnGpu = true;
    jK_dirtyOnGpu = true;

    /*  Columm index storage */
    StiffMas2_kernel4<<<dim3(1U, 1U, 1U), dim3(64U, 1U, 1U)>>>(*gpu_ke);

    /*  Initialize the element stiffness matrix */
    for (b_i = 0; b_i < 8; b_i++) {
      /*  Loop over numerical integration */
      /*   Shape function derivatives with respect to r,s,t. L = [dNdr; dNds; dNdt]; L matrix */
      /*   % dN/dr; */
      /*    % dN/ds; */
      /*    % dN/dt; */
      L[0] = -(1.0 - dv[b_i]) * (1.0 - dv1[b_i]) * 0.125;
      L[3] = (1.0 - dv[b_i]) * (1.0 - dv1[b_i]) * 0.125;
      L[6] = (dv[b_i] + 1.0) * (1.0 - dv1[b_i]) * 0.125;
      L[9] = -(dv[b_i] + 1.0) * (1.0 - dv1[b_i]) * 0.125;
      L[12] = -(1.0 - dv[b_i]) * (dv1[b_i] + 1.0) * 0.125;
      L[15] = (1.0 - dv[b_i]) * (dv1[b_i] + 1.0) * 0.125;
      L[18] = (dv[b_i] + 1.0) * (dv1[b_i] + 1.0) * 0.125;
      L[21] = -(dv[b_i] + 1.0) * (dv1[b_i] + 1.0) * 0.125;
      L[1] = -(1.0 - dv2[b_i]) * (1.0 - dv1[b_i]) * 0.125;
      L[4] = -(dv2[b_i] + 1.0) * (1.0 - dv1[b_i]) * 0.125;
      L[7] = (dv2[b_i] + 1.0) * (1.0 - dv1[b_i]) * 0.125;
      L[10] = (1.0 - dv2[b_i]) * (1.0 - dv1[b_i]) * 0.125;
      L[13] = -(1.0 - dv2[b_i]) * (dv1[b_i] + 1.0) * 0.125;
      L[16] = -(dv2[b_i] + 1.0) * (dv1[b_i] + 1.0) * 0.125;
      L[19] = (dv2[b_i] + 1.0) * (dv1[b_i] + 1.0) * 0.125;
      L[22] = (1.0 - dv2[b_i]) * (dv1[b_i] + 1.0) * 0.125;
      L[2] = -(1.0 - dv2[b_i]) * (1.0 - dv[b_i]) * 0.125;
      L[5] = -(dv2[b_i] + 1.0) * (1.0 - dv[b_i]) * 0.125;
      L[8] = -(dv2[b_i] + 1.0) * (dv[b_i] + 1.0) * 0.125;
      L[11] = -(1.0 - dv2[b_i]) * (dv[b_i] + 1.0) * 0.125;
      L[14] = (1.0 - dv2[b_i]) * (1.0 - dv[b_i]) * 0.125;
      L[17] = (dv2[b_i] + 1.0) * (1.0 - dv[b_i]) * 0.125;
      L[20] = (dv2[b_i] + 1.0) * (dv[b_i] + 1.0) * 0.125;
      L[23] = (1.0 - dv2[b_i]) * (dv[b_i] + 1.0) * 0.125;
      cudaMemcpy(gpu_L, &L[0], 192UL, cudaMemcpyHostToDevice);
      StiffMas2_kernel5<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(*gpu_X, *gpu_L,
        *gpu_Jac);

      /*  Jacobian matrix */
      StiffMas2_kernel6<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(*gpu_Jac,
        *gpu_x);
      x_dirtyOnGpu = true;
      if (ipiv_dirtyOnCpu) {
        cudaMemcpy(gpu_ipiv, &ipiv[0], 3UL, cudaMemcpyHostToDevice);
        ipiv_dirtyOnCpu = false;
      }

      StiffMas2_kernel7<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(*gpu_ipiv);
      ipiv_dirtyOnGpu = true;
      for (j = 0; j < 2; j++) {
        b_c = j << 2;
        jp1j = b_c + 1;
        n = 1 - j;
        jA = 0;
        ix = b_c;
        if (x_dirtyOnGpu) {
          cudaMemcpy(&x[0], gpu_x, 72UL, cudaMemcpyDeviceToHost);
          x_dirtyOnGpu = false;
        }

        smax = fabs(x[b_c]);
        for (k = 0; k <= n; k++) {
          ix++;
          s = fabs(x[ix]);
          if (s > smax) {
            jA = k + 1;
            smax = s;
          }
        }

        if (x[b_c + jA] != 0.0) {
          if (jA != 0) {
            if (ipiv_dirtyOnGpu) {
              cudaMemcpy(&ipiv[0], gpu_ipiv, 3UL, cudaMemcpyDeviceToHost);
              ipiv_dirtyOnGpu = false;
            }

            ipiv[j] = static_cast<int8_T>(((j + jA) + 1));
            ipiv_dirtyOnCpu = true;
            initAuxVar = j + jA;
            for (k = 0; k < 3; k++) {
              ix = j + k * 3;
              iy = initAuxVar + k * 3;
              smax = x[ix];
              x[ix] = x[iy];
              x[iy] = smax;
              x_dirtyOnCpu = true;
            }
          }

          k = (b_c - j) + 2;
          for (jA = 0; jA <= k - jp1j; jA++) {
            jy = (b_c + jA) + 1;
            x[jy] /= x[b_c];
            x_dirtyOnCpu = true;
          }
        }

        n = 1 - j;
        jA = b_c + 5;
        jy = b_c + 3;
        for (iy = 0; iy <= n; iy++) {
          smax = x[jy];
          if (x[jy] != 0.0) {
            ix = b_c;
            k = jA - 1;
            i2 = jA - j;
            for (qEnd = 0; qEnd <= i2 - k; qEnd++) {
              kEnd = (jA + qEnd) - 1;
              x[kEnd] += x[ix + 1] * -smax;
              x_dirtyOnCpu = true;
              ix++;
            }
          }

          jy += 3;
          jA += 3;
        }
      }

      detJ = 1.0;
      if (x_dirtyOnCpu) {
        cudaMemcpy(gpu_x, &x[0], 72UL, cudaMemcpyHostToDevice);
        x_dirtyOnCpu = false;
      }

      cudaMemcpy(gpu_detJ, &detJ, 8UL, cudaMemcpyHostToDevice);
      StiffMas2_kernel8<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(*gpu_x,
        gpu_detJ);
      detJ_dirtyOnGpu = true;
      isodd = false;
      for (k = 0; k < 2; k++) {
        if (ipiv_dirtyOnGpu) {
          cudaMemcpy(&ipiv[0], gpu_ipiv, 3UL, cudaMemcpyDeviceToHost);
          ipiv_dirtyOnGpu = false;
        }

        if (ipiv[k] > k + 1) {
          isodd = !isodd;
        }
      }

      if (isodd) {
        cudaMemcpy(&detJ, gpu_detJ, 8UL, cudaMemcpyDeviceToHost);
        detJ = -detJ;
        detJ_dirtyOnGpu = false;
      }

      /*  Jacobian's determinant */
      jA = 1;
      jy = 2;
      jp1j = 3;
      cudaMemcpy(&Jac[0], gpu_Jac, 72UL, cudaMemcpyDeviceToHost);
      smax = fabs(Jac[0]);
      s = fabs(Jac[1]);
      if (s > smax) {
        smax = s;
        jA = 2;
        jy = 1;
      }

      if (fabs(Jac[2]) > smax) {
        jA = 3;
        jy = 2;
        jp1j = 1;
      }

      Jac[jy - 1] /= Jac[jA - 1];
      Jac[jp1j - 1] /= Jac[jA - 1];
      Jac[jy + 2] -= Jac[jy - 1] * Jac[jA + 2];
      Jac[jp1j + 2] -= Jac[jp1j - 1] * Jac[jA + 2];
      Jac[jy + 5] -= Jac[jy - 1] * Jac[jA + 5];
      Jac[jp1j + 5] -= Jac[jp1j - 1] * Jac[jA + 5];
      if (fabs(Jac[jp1j + 2]) > fabs(Jac[jy + 2])) {
        iy = jy;
        jy = jp1j;
        jp1j = iy;
      }

      cudaMemcpy(gpu_Jac, &Jac[0], 72UL, cudaMemcpyHostToDevice);
      StiffMas2_kernel9<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(jy, jp1j,
        *gpu_Jac);
      StiffMas2_kernel10<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(jy, jp1j,
        *gpu_Jac);
      StiffMas2_kernel11<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(jp1j, *gpu_Jac,
        jy, *gpu_L, jA, *gpu_B);

      /*  B matrix */
      if (detJ_dirtyOnGpu) {
        cudaMemcpy(&detJ, gpu_detJ, 8UL, cudaMemcpyDeviceToHost);
      }

      smax = c * detJ;
      StiffMas2_kernel12<<<dim3(1U, 1U, 1U), dim3(64U, 1U, 1U)>>>(*gpu_B,
        *b_gpu_B);
      StiffMas2_kernel13<<<dim3(1U, 1U, 1U), dim3(64U, 1U, 1U)>>>(*b_gpu_B, smax,
        *gpu_ke);

      /*  Element stiffness matrix */
    }

    if (Ke_dirtyOnCpu) {
      gpuEmxMemcpyCpuToGpu_real_T(Ke, &inter_Ke, gpu_Ke);
      Ke_dirtyOnCpu = false;
    }

    StiffMas2_kernel14<<<dim3(1U, 1U, 1U), dim3(64U, 1U, 1U)>>>(*gpu_ke, e,
      gpu_Ke);
    Ke_dirtyOnGpu = true;

    /*  Element stiffness matrix storage */
  }

  emxInit_uint32_T(&result, 2, true);
  result_dirtyOnGpu = false;
  if (iK_dirtyOnGpu) {
    gpuEmxMemcpyGpuToCpu_uint32_T(iK, &inter_iK);
  }

  iv[0] = iK->size[2] << 6;
  if (jK_dirtyOnGpu) {
    gpuEmxMemcpyGpuToCpu_uint32_T(jK, &inter_jK);
  }

  iv1[0] = jK->size[2] << 6;
  i = result->size[0] * result->size[1];
  result->size[0] = iv[0];
  result->size[1] = 2;
  emxEnsureCapacity_uint32_T(result, i);
  result_dirtyOnCpu = true;
  iy = iv[0] - 1;
  validLaunchParams = mwGetLaunchParameters(static_cast<real_T>((iy + 1L)),
    &grid, &block, 1024U, 65535U);
  if (validLaunchParams) {
    if (iK_dirtyOnCpu) {
      gpuEmxMemcpyCpuToGpu_uint32_T(iK, &inter_iK, gpu_iK);
    }

    gpuEmxMemcpyCpuToGpu_uint32_T(result, &inter_result, gpu_result);
    StiffMas2_kernel15<<<grid, block>>>(gpu_iK, iy, gpu_result);
    result_dirtyOnCpu = false;
    result_dirtyOnGpu = true;
  }

  emxFree_uint32_T(&iK);
  gpuEmxFree_uint32_T(&inter_iK);
  iy = iv1[0] - 1;
  b_validLaunchParams = mwGetLaunchParameters(static_cast<real_T>((iy + 1L)),
    &b_grid, &b_block, 1024U, 65535U);
  if (b_validLaunchParams) {
    if (jK_dirtyOnCpu) {
      gpuEmxMemcpyCpuToGpu_uint32_T(jK, &inter_jK, gpu_jK);
    }

    if (result_dirtyOnCpu) {
      gpuEmxMemcpyCpuToGpu_uint32_T(result, &inter_result, gpu_result);
      result_dirtyOnCpu = false;
    }

    StiffMas2_kernel16<<<b_grid, b_block>>>(gpu_jK, iy, gpu_result);
    result_dirtyOnGpu = true;
  }

  emxFree_uint32_T(&jK);
  gpuEmxFree_uint32_T(&inter_jK);
  if (result_dirtyOnGpu) {
    gpuEmxMemcpyGpuToCpu_uint32_T(result, &inter_result);
  }

  iy = result->size[0];
  StiffMas2_kernel17<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(*gpu_SZ);
  if (result->size[0] >= 1) {
    if (result_dirtyOnCpu) {
      gpuEmxMemcpyCpuToGpu_uint32_T(result, &inter_result, gpu_result);
      result_dirtyOnCpu = false;
    }

    StiffMas2_kernel18<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(gpu_result,
      *gpu_SZ);
    for (k = 0; k <= iy - 2; k++) {
      StiffMas2_kernel19<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(gpu_result, k,
        *gpu_SZ);
    }
  }

  emxInit_int32_T(&ipos, 1, true);
  ipos_dirtyOnGpu = false;
  i = ipos->size[0];
  ipos->size[0] = result->size[0];
  emxEnsureCapacity_int32_T(ipos, i);
  ipos_dirtyOnCpu = true;
  emxInit_uint32_T(&b, 2, true);
  b_dirtyOnGpu = false;
  if (result->size[0] == 0) {
    i = b->size[0] * b->size[1];
    b->size[0] = result->size[0];
    b->size[1] = 2;
    emxEnsureCapacity_uint32_T(b, i);
    b_dirtyOnCpu = true;
    w_validLaunchParams = mwGetLaunchParameters(static_cast<real_T>
      (((result->size[0] * result->size[1] - 1) + 1L)), &w_grid, &w_block, 1024U,
      65535U);
    if (w_validLaunchParams) {
      if (result_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_uint32_T(result, &inter_result, gpu_result);
      }

      gpuEmxMemcpyCpuToGpu_uint32_T(b, &inter_b, gpu_b);
      StiffMas2_kernel43<<<w_grid, w_block>>>(gpu_result, gpu_b);
      b_dirtyOnCpu = false;
      b_dirtyOnGpu = true;
    }
  } else {
    i = b->size[0] * b->size[1];
    b->size[0] = result->size[0];
    b->size[1] = 2;
    emxEnsureCapacity_uint32_T(b, i);
    b_dirtyOnCpu = true;
    c_validLaunchParams = mwGetLaunchParameters(static_cast<real_T>
      (((result->size[0] * result->size[1] - 1) + 1L)), &c_grid, &c_block, 1024U,
      65535U);
    if (c_validLaunchParams) {
      if (result_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_uint32_T(result, &inter_result, gpu_result);
        result_dirtyOnCpu = false;
      }

      gpuEmxMemcpyCpuToGpu_uint32_T(b, &inter_b, gpu_b);
      StiffMas2_kernel20<<<c_grid, c_block>>>(gpu_result, gpu_b);
      b_dirtyOnCpu = false;
      b_dirtyOnGpu = true;
    }

    emxInit_int32_T(&idx, 1, true);
    idx_dirtyOnGpu = false;
    n = result->size[0] + 1;
    i = idx->size[0];
    idx->size[0] = result->size[0];
    emxEnsureCapacity_int32_T(idx, i);
    idx_dirtyOnCpu = true;
    d_validLaunchParams = mwGetLaunchParameters(static_cast<real_T>
      (((result->size[0] - 1) + 1L)), &d_grid, &d_block, 1024U, 65535U);
    if (d_validLaunchParams) {
      if (result_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_uint32_T(result, &inter_result, gpu_result);
        result_dirtyOnCpu = false;
      }

      gpuEmxMemcpyCpuToGpu_int32_T(idx, &inter_idx, gpu_idx);
      StiffMas2_kernel21<<<d_grid, d_block>>>(gpu_result, gpu_idx);
      idx_dirtyOnCpu = false;
      idx_dirtyOnGpu = true;
    }

    emxInit_int32_T(&iwork, 1, true);
    i = iwork->size[0];
    iwork->size[0] = result->size[0];
    emxEnsureCapacity_int32_T(iwork, i);
    b_iwork_dirtyOnCpu = true;
    i = result->size[0] - 1;
    e_validLaunchParams = mwGetLaunchParameters(static_cast<real_T>(((i - 1) / 2
      + 1L)), &e_grid, &e_block, 1024U, 65535U);
    if (e_validLaunchParams) {
      if (result_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_uint32_T(result, &inter_result, gpu_result);
        result_dirtyOnCpu = false;
      }

      if (idx_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_int32_T(idx, &inter_idx, gpu_idx);
        idx_dirtyOnCpu = false;
      }

      StiffMas2_kernel22<<<e_grid, e_block>>>(gpu_result, i, gpu_idx);
      idx_dirtyOnGpu = true;
    }

    if ((result->size[0] & 1) != 0) {
      if (result_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_uint32_T(result, &inter_result, gpu_result);
      }

      if (idx_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_int32_T(idx, &inter_idx, gpu_idx);
        idx_dirtyOnCpu = false;
      }

      StiffMas2_kernel23<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(gpu_result,
        gpu_idx);
      idx_dirtyOnGpu = true;
    }

    b_i = 2;
    while (b_i < n - 1) {
      i2 = b_i << 1;
      j = 1;
      for (jy = b_i + 1; jy < n; jy = qEnd + b_i) {
        jp1j = j;
        iy = jy;
        qEnd = j + i2;
        if (qEnd > n) {
          qEnd = n;
        }

        k = 0;
        kEnd = qEnd - j;
        while (k + 1 <= kEnd) {
          isodd = true;
          jA = 0;
          exitg1 = false;
          while ((!exitg1) && (jA + 1 < 3)) {
            if (idx_dirtyOnGpu) {
              gpuEmxMemcpyGpuToCpu_int32_T(idx, &inter_idx);
              idx_dirtyOnGpu = false;
            }

            v1 = result->data[(idx->data[jp1j - 1] + result->size[0] * jA) - 1];
            v2 = result->data[(idx->data[iy - 1] + result->size[0] * jA) - 1];
            if (v1 != v2) {
              isodd = (v1 <= v2);
              exitg1 = true;
            } else {
              jA++;
            }
          }

          if (isodd) {
            if (idx_dirtyOnGpu) {
              gpuEmxMemcpyGpuToCpu_int32_T(idx, &inter_idx);
              idx_dirtyOnGpu = false;
            }

            iwork->data[k] = idx->data[jp1j - 1];
            b_iwork_dirtyOnCpu = true;
            jp1j++;
            if (jp1j == jy) {
              while (iy < qEnd) {
                k++;
                iwork->data[k] = idx->data[iy - 1];
                iy++;
              }
            }
          } else {
            if (idx_dirtyOnGpu) {
              gpuEmxMemcpyGpuToCpu_int32_T(idx, &inter_idx);
              idx_dirtyOnGpu = false;
            }

            iwork->data[k] = idx->data[iy - 1];
            b_iwork_dirtyOnCpu = true;
            iy++;
            if (iy == qEnd) {
              while (jp1j < jy) {
                k++;
                iwork->data[k] = idx->data[jp1j - 1];
                jp1j++;
              }
            }
          }

          k++;
        }

        v_validLaunchParams = mwGetLaunchParameters(static_cast<real_T>(((kEnd -
          1) + 1L)), &v_grid, &v_block, 1024U, 65535U);
        if (v_validLaunchParams) {
          if (idx_dirtyOnCpu) {
            gpuEmxMemcpyCpuToGpu_int32_T(idx, &inter_idx, gpu_idx);
            idx_dirtyOnCpu = false;
          }

          if (b_iwork_dirtyOnCpu) {
            gpuEmxMemcpyCpuToGpu_int32_T(iwork, &inter_iwork, b_gpu_iwork);
            b_iwork_dirtyOnCpu = false;
          }

          StiffMas2_kernel42<<<v_grid, v_block>>>(b_gpu_iwork, j, kEnd, gpu_idx);
          idx_dirtyOnGpu = true;
        }

        j = qEnd;
      }

      b_i = i2;
    }

    emxFree_int32_T(&iwork);
    gpuEmxFree_int32_T(&inter_iwork);
    emxInit_uint32_T(&ycol, 1, true);
    iy = result->size[0];
    i = ycol->size[0];
    ycol->size[0] = result->size[0];
    emxEnsureCapacity_uint32_T(ycol, i);
    ycol_dirtyOnCpu = true;
    for (j = 0; j < 2; j++) {
      f_validLaunchParams = mwGetLaunchParameters(static_cast<real_T>(((iy - 1)
        + 1L)), &f_grid, &f_block, 1024U, 65535U);
      if (f_validLaunchParams) {
        if (b_dirtyOnCpu) {
          gpuEmxMemcpyCpuToGpu_uint32_T(b, &inter_b, gpu_b);
          b_dirtyOnCpu = false;
        }

        if (idx_dirtyOnCpu) {
          gpuEmxMemcpyCpuToGpu_int32_T(idx, &inter_idx, gpu_idx);
          idx_dirtyOnCpu = false;
        }

        if (ycol_dirtyOnCpu) {
          gpuEmxMemcpyCpuToGpu_uint32_T(ycol, &inter_ycol, gpu_ycol);
          ycol_dirtyOnCpu = false;
        }

        StiffMas2_kernel24<<<f_grid, f_block>>>(j, gpu_b, gpu_idx, iy, gpu_ycol);
      }

      g_validLaunchParams = mwGetLaunchParameters(static_cast<real_T>(((iy - 1)
        + 1L)), &g_grid, &g_block, 1024U, 65535U);
      if (g_validLaunchParams) {
        if (b_dirtyOnCpu) {
          gpuEmxMemcpyCpuToGpu_uint32_T(b, &inter_b, gpu_b);
          b_dirtyOnCpu = false;
        }

        if (ycol_dirtyOnCpu) {
          gpuEmxMemcpyCpuToGpu_uint32_T(ycol, &inter_ycol, gpu_ycol);
          ycol_dirtyOnCpu = false;
        }

        StiffMas2_kernel25<<<g_grid, g_block>>>(gpu_ycol, j, iy, gpu_b);
        b_dirtyOnGpu = true;
      }
    }

    emxFree_uint32_T(&ycol);
    gpuEmxFree_uint32_T(&inter_ycol);
    emxInit_int32_T(&c_idx, 1, true);
    i = c_idx->size[0];
    if (idx_dirtyOnGpu) {
      gpuEmxMemcpyGpuToCpu_int32_T(idx, &inter_idx);
    }

    c_idx->size[0] = idx->size[0];
    emxEnsureCapacity_int32_T(c_idx, i);
    b_idx_dirtyOnCpu = true;
    h_validLaunchParams = mwGetLaunchParameters(static_cast<real_T>(((idx->size
      [0] - 1) + 1L)), &h_grid, &h_block, 1024U, 65535U);
    if (h_validLaunchParams) {
      if (idx_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_int32_T(idx, &inter_idx, gpu_idx);
      }

      gpuEmxMemcpyCpuToGpu_int32_T(c_idx, &b_inter_idx, b_gpu_idx);
      StiffMas2_kernel26<<<h_grid, h_block>>>(gpu_idx, b_gpu_idx);
      b_idx_dirtyOnCpu = false;
    }

    emxFree_int32_T(&idx);
    gpuEmxFree_int32_T(&inter_idx);
    ix = 0;
    jA = result->size[0];
    k = 1;
    while (k <= jA) {
      jy = k;
      do {
        exitg2 = 0;
        k++;
        if (k > jA) {
          exitg2 = 1;
        } else {
          isodd = false;
          j = 0;
          exitg1 = false;
          while ((!exitg1) && (j < 2)) {
            if (b_dirtyOnGpu) {
              gpuEmxMemcpyGpuToCpu_uint32_T(b, &inter_b);
              b_dirtyOnGpu = false;
            }

            if (b->data[(jy + b->size[0] * j) - 1] != b->data[(k + b->size[0] *
                 j) - 1]) {
              isodd = true;
              exitg1 = true;
            } else {
              j++;
            }
          }

          if (isodd) {
            exitg2 = 1;
          }
        }
      } while (exitg2 == 0);

      ix++;
      for (j = 0; j < 2; j++) {
        if (b_dirtyOnGpu) {
          gpuEmxMemcpyGpuToCpu_uint32_T(b, &inter_b);
          b_dirtyOnGpu = false;
        }

        b->data[(ix + b->size[0] * j) - 1] = b->data[(jy + b->size[0] * j) - 1];
        b_dirtyOnCpu = true;
      }

      i = k - 1;
      u_validLaunchParams = mwGetLaunchParameters(static_cast<real_T>(((i - jy)
        + 1L)), &u_grid, &u_block, 1024U, 65535U);
      if (u_validLaunchParams) {
        if (b_idx_dirtyOnCpu) {
          gpuEmxMemcpyCpuToGpu_int32_T(c_idx, &b_inter_idx, b_gpu_idx);
          b_idx_dirtyOnCpu = false;
        }

        if (ipos_dirtyOnCpu) {
          gpuEmxMemcpyCpuToGpu_int32_T(ipos, &inter_ipos, gpu_ipos);
          ipos_dirtyOnCpu = false;
        }

        StiffMas2_kernel40<<<u_grid, u_block>>>(ix, b_gpu_idx, jy, i, gpu_ipos);
        ipos_dirtyOnGpu = true;
      }

      if (b_idx_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_int32_T(c_idx, &b_inter_idx, b_gpu_idx);
        b_idx_dirtyOnCpu = false;
      }

      StiffMas2_kernel41<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(jy, ix,
        b_gpu_idx);
    }

    if (1 > ix) {
      i = -1;
    } else {
      i = ix - 1;
    }

    emxInit_uint32_T(&b_b, 2, true);
    b_b_dirtyOnGpu = false;
    k = b_b->size[0] * b_b->size[1];
    b_b->size[0] = i + 1;
    b_b->size[1] = 2;
    emxEnsureCapacity_uint32_T(b_b, k);
    b_b_dirtyOnCpu = true;
    i_validLaunchParams = mwGetLaunchParameters(static_cast<real_T>(((i + 1L) *
      2L)), &i_grid, &i_block, 1024U, 65535U);
    if (i_validLaunchParams) {
      if (b_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_uint32_T(b, &inter_b, gpu_b);
      }

      gpuEmxMemcpyCpuToGpu_uint32_T(b_b, &b_inter_b, b_gpu_b);
      StiffMas2_kernel27<<<i_grid, i_block>>>(gpu_b, i, b_gpu_b);
      b_b_dirtyOnCpu = false;
      b_b_dirtyOnGpu = true;
    }

    if (b_dirtyOnGpu) {
      gpuEmxMemcpyGpuToCpu_uint32_T(b, &inter_b);
      b_dirtyOnGpu = false;
    }

    i = b->size[0] * b->size[1];
    if (b_b_dirtyOnGpu) {
      gpuEmxMemcpyGpuToCpu_uint32_T(b_b, &b_inter_b);
    }

    b->size[0] = b_b->size[0];
    b->size[1] = 2;
    emxEnsureCapacity_uint32_T(b, i);
    b_dirtyOnCpu = true;
    j_validLaunchParams = mwGetLaunchParameters(static_cast<real_T>(((b_b->size
      [0] * b_b->size[1] - 1) + 1L)), &j_grid, &j_block, 1024U, 65535U);
    if (j_validLaunchParams) {
      gpuEmxMemcpyCpuToGpu_uint32_T(b, &inter_b, gpu_b);
      if (b_b_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_uint32_T(b_b, &b_inter_b, b_gpu_b);
      }

      StiffMas2_kernel28<<<j_grid, j_block>>>(b_gpu_b, gpu_b);
      b_dirtyOnCpu = false;
      b_dirtyOnGpu = true;
    }

    emxFree_uint32_T(&b_b);
    gpuEmxFree_uint32_T(&b_inter_b);
    emxInit_int32_T(&indx, 1, true);
    indx_dirtyOnGpu = false;
    i = indx->size[0];
    indx->size[0] = ix;
    emxEnsureCapacity_int32_T(indx, i);
    indx_dirtyOnCpu = true;
    k_validLaunchParams = mwGetLaunchParameters(static_cast<real_T>(((ix - 1) +
      1L)), &k_grid, &k_block, 1024U, 65535U);
    if (k_validLaunchParams) {
      if (b_idx_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_int32_T(c_idx, &b_inter_idx, b_gpu_idx);
      }

      gpuEmxMemcpyCpuToGpu_int32_T(indx, &inter_indx, gpu_indx);
      StiffMas2_kernel29<<<k_grid, k_block>>>(b_gpu_idx, ix, gpu_indx);
      indx_dirtyOnCpu = false;
      indx_dirtyOnGpu = true;
    }

    emxFree_int32_T(&c_idx);
    gpuEmxFree_int32_T(&b_inter_idx);
    emxInit_int32_T(&r, 1, true);
    r_dirtyOnGpu = false;
    if (indx_dirtyOnGpu) {
      gpuEmxMemcpyGpuToCpu_int32_T(indx, &inter_indx);
    }

    n = indx->size[0] + 1;
    uv[0] = static_cast<uint32_T>(indx->size[0]);
    i = r->size[0];
    r->size[0] = static_cast<int32_T>(uv[0]);
    emxEnsureCapacity_int32_T(r, i);
    r_dirtyOnCpu = true;
    l_validLaunchParams = mwGetLaunchParameters(static_cast<real_T>(((
      static_cast<int32_T>(uv[0]) - 1) + 1L)), &l_grid, &l_block, 1024U, 65535U);
    if (l_validLaunchParams) {
      cudaMemcpy(gpu_uv, &uv[0], 8UL, cudaMemcpyHostToDevice);
      gpuEmxMemcpyCpuToGpu_int32_T(r, &inter_r, gpu_r);
      StiffMas2_kernel30<<<l_grid, l_block>>>(*gpu_uv, gpu_r);
      r_dirtyOnCpu = false;
      r_dirtyOnGpu = true;
    }

    if (indx->size[0] != 0) {
      emxInit_int32_T(&d_idx, 1, true);
      b_idx_dirtyOnGpu = false;
      i = static_cast<int32_T>(uv[0]) - 1;
      k = d_idx->size[0];
      d_idx->size[0] = static_cast<int32_T>(uv[0]);
      emxEnsureCapacity_int32_T(d_idx, k);
      c_idx_dirtyOnCpu = true;
      m_validLaunchParams = mwGetLaunchParameters(static_cast<real_T>((i + 1L)),
        &m_grid, &m_block, 1024U, 65535U);
      if (m_validLaunchParams) {
        gpuEmxMemcpyCpuToGpu_int32_T(d_idx, &c_inter_idx, c_gpu_idx);
        StiffMas2_kernel31<<<m_grid, m_block>>>(i, c_gpu_idx);
        c_idx_dirtyOnCpu = false;
        b_idx_dirtyOnGpu = true;
      }

      emxInit_int32_T(&b_iwork, 1, true);
      i = b_iwork->size[0];
      b_iwork->size[0] = static_cast<int32_T>(uv[0]);
      emxEnsureCapacity_int32_T(b_iwork, i);
      iwork_dirtyOnCpu = true;
      i = indx->size[0] - 1;
      n_validLaunchParams = mwGetLaunchParameters(static_cast<real_T>(((i - 1) /
        2 + 1L)), &n_grid, &n_block, 1024U, 65535U);
      if (n_validLaunchParams) {
        if (indx_dirtyOnCpu) {
          gpuEmxMemcpyCpuToGpu_int32_T(indx, &inter_indx, gpu_indx);
          indx_dirtyOnCpu = false;
        }

        if (c_idx_dirtyOnCpu) {
          gpuEmxMemcpyCpuToGpu_int32_T(d_idx, &c_inter_idx, c_gpu_idx);
          c_idx_dirtyOnCpu = false;
        }

        StiffMas2_kernel32<<<n_grid, n_block>>>(gpu_indx, i, c_gpu_idx);
        b_idx_dirtyOnGpu = true;
      }

      if ((indx->size[0] & 1) != 0) {
        if (indx_dirtyOnCpu) {
          gpuEmxMemcpyCpuToGpu_int32_T(indx, &inter_indx, gpu_indx);
        }

        if (c_idx_dirtyOnCpu) {
          gpuEmxMemcpyCpuToGpu_int32_T(d_idx, &c_inter_idx, c_gpu_idx);
          c_idx_dirtyOnCpu = false;
        }

        StiffMas2_kernel33<<<dim3(1U, 1U, 1U), dim3(32U, 1U, 1U)>>>(gpu_indx,
          c_gpu_idx);
        b_idx_dirtyOnGpu = true;
      }

      b_i = 2;
      while (b_i < n - 1) {
        i2 = b_i << 1;
        j = 1;
        for (jy = b_i + 1; jy < n; jy = qEnd + b_i) {
          jp1j = j;
          iy = jy;
          qEnd = j + i2;
          if (qEnd > n) {
            qEnd = n;
          }

          k = 0;
          kEnd = qEnd - j;
          while (k + 1 <= kEnd) {
            if (b_idx_dirtyOnGpu) {
              gpuEmxMemcpyGpuToCpu_int32_T(d_idx, &c_inter_idx);
              b_idx_dirtyOnGpu = false;
            }

            if (indx->data[d_idx->data[jp1j - 1] - 1] <= indx->data[d_idx->
                data[iy - 1] - 1]) {
              b_iwork->data[k] = d_idx->data[jp1j - 1];
              iwork_dirtyOnCpu = true;
              jp1j++;
              if (jp1j == jy) {
                while (iy < qEnd) {
                  k++;
                  b_iwork->data[k] = d_idx->data[iy - 1];
                  iy++;
                }
              }
            } else {
              b_iwork->data[k] = d_idx->data[iy - 1];
              iwork_dirtyOnCpu = true;
              iy++;
              if (iy == qEnd) {
                while (jp1j < jy) {
                  k++;
                  b_iwork->data[k] = d_idx->data[jp1j - 1];
                  jp1j++;
                }
              }
            }

            k++;
          }

          p_validLaunchParams = mwGetLaunchParameters(static_cast<real_T>(((kEnd
            - 1) + 1L)), &p_grid, &p_block, 1024U, 65535U);
          if (p_validLaunchParams) {
            if (c_idx_dirtyOnCpu) {
              gpuEmxMemcpyCpuToGpu_int32_T(d_idx, &c_inter_idx, c_gpu_idx);
              c_idx_dirtyOnCpu = false;
            }

            if (iwork_dirtyOnCpu) {
              gpuEmxMemcpyCpuToGpu_int32_T(b_iwork, &b_inter_iwork, gpu_iwork);
              iwork_dirtyOnCpu = false;
            }

            StiffMas2_kernel35<<<p_grid, p_block>>>(gpu_iwork, j, kEnd,
              c_gpu_idx);
            b_idx_dirtyOnGpu = true;
          }

          j = qEnd;
        }

        b_i = i2;
      }

      emxFree_int32_T(&b_iwork);
      gpuEmxFree_int32_T(&b_inter_iwork);
      if (b_idx_dirtyOnGpu) {
        gpuEmxMemcpyGpuToCpu_int32_T(d_idx, &c_inter_idx);
      }

      o_validLaunchParams = mwGetLaunchParameters(static_cast<real_T>
        (((d_idx->size[0] - 1) + 1L)), &o_grid, &o_block, 1024U, 65535U);
      if (o_validLaunchParams) {
        if (r_dirtyOnCpu) {
          gpuEmxMemcpyCpuToGpu_int32_T(r, &inter_r, gpu_r);
          r_dirtyOnCpu = false;
        }

        if (c_idx_dirtyOnCpu) {
          gpuEmxMemcpyCpuToGpu_int32_T(d_idx, &c_inter_idx, c_gpu_idx);
        }

        StiffMas2_kernel34<<<o_grid, o_block>>>(c_gpu_idx, gpu_r);
        r_dirtyOnGpu = true;
      }

      emxFree_int32_T(&d_idx);
      gpuEmxFree_int32_T(&c_inter_idx);
    }

    emxFree_int32_T(&indx);
    gpuEmxFree_int32_T(&inter_indx);
    emxInit_uint32_T(&c_b, 2, true);
    c_b_dirtyOnGpu = false;
    i = c_b->size[0] * c_b->size[1];
    if (r_dirtyOnGpu) {
      gpuEmxMemcpyGpuToCpu_int32_T(r, &inter_r);
    }

    c_b->size[0] = r->size[0];
    c_b->size[1] = 2;
    emxEnsureCapacity_uint32_T(c_b, i);
    c_b_dirtyOnCpu = true;
    q_validLaunchParams = mwGetLaunchParameters(static_cast<real_T>((((r->size[0]
      - 1) + 1L) * 2L)), &q_grid, &q_block, 1024U, 65535U);
    if (q_validLaunchParams) {
      if (b_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_uint32_T(b, &inter_b, gpu_b);
      }

      if (r_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_int32_T(r, &inter_r, gpu_r);
        r_dirtyOnCpu = false;
      }

      gpuEmxMemcpyCpuToGpu_uint32_T(c_b, &c_inter_b, c_gpu_b);
      StiffMas2_kernel36<<<q_grid, q_block>>>(gpu_b, gpu_r, c_gpu_b);
      c_b_dirtyOnCpu = false;
      c_b_dirtyOnGpu = true;
    }

    if (b_dirtyOnGpu) {
      gpuEmxMemcpyGpuToCpu_uint32_T(b, &inter_b);
      b_dirtyOnGpu = false;
    }

    i = b->size[0] * b->size[1];
    if (c_b_dirtyOnGpu) {
      gpuEmxMemcpyGpuToCpu_uint32_T(c_b, &c_inter_b);
    }

    b->size[0] = c_b->size[0];
    b->size[1] = 2;
    emxEnsureCapacity_uint32_T(b, i);
    b_dirtyOnCpu = true;
    r_validLaunchParams = mwGetLaunchParameters(static_cast<real_T>(((c_b->size
      [0] * c_b->size[1] - 1) + 1L)), &r_grid, &r_block, 1024U, 65535U);
    if (r_validLaunchParams) {
      gpuEmxMemcpyCpuToGpu_uint32_T(b, &inter_b, gpu_b);
      if (c_b_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_uint32_T(c_b, &c_inter_b, c_gpu_b);
      }

      StiffMas2_kernel37<<<r_grid, r_block>>>(c_gpu_b, gpu_b);
      b_dirtyOnCpu = false;
      b_dirtyOnGpu = true;
    }

    emxFree_uint32_T(&c_b);
    gpuEmxFree_uint32_T(&c_inter_b);
    emxInit_int32_T(&invr, 1, true);
    i = invr->size[0];
    invr->size[0] = r->size[0];
    emxEnsureCapacity_int32_T(invr, i);
    invr_dirtyOnCpu = true;
    s_validLaunchParams = mwGetLaunchParameters(static_cast<real_T>(((ix - 1) +
      1L)), &s_grid, &s_block, 1024U, 65535U);
    if (s_validLaunchParams) {
      if (r_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_int32_T(r, &inter_r, gpu_r);
      }

      gpuEmxMemcpyCpuToGpu_int32_T(invr, &inter_invr, gpu_invr);
      StiffMas2_kernel38<<<s_grid, s_block>>>(gpu_r, ix, gpu_invr);
      invr_dirtyOnCpu = false;
    }

    emxFree_int32_T(&r);
    gpuEmxFree_int32_T(&inter_r);
    if (ipos_dirtyOnGpu) {
      gpuEmxMemcpyGpuToCpu_int32_T(ipos, &inter_ipos);
      ipos_dirtyOnGpu = false;
    }

    i = ipos->size[0];
    emxEnsureCapacity_int32_T(ipos, i);
    ipos_dirtyOnCpu = true;
    t_validLaunchParams = mwGetLaunchParameters(static_cast<real_T>(((ipos->
      size[0] - 1) + 1L)), &t_grid, &t_block, 1024U, 65535U);
    if (t_validLaunchParams) {
      if (invr_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_int32_T(invr, &inter_invr, gpu_invr);
      }

      gpuEmxMemcpyCpuToGpu_int32_T(ipos, &inter_ipos, gpu_ipos);
      StiffMas2_kernel39<<<t_grid, t_block>>>(gpu_invr, gpu_ipos);
      ipos_dirtyOnCpu = false;
      ipos_dirtyOnGpu = true;
    }

    emxFree_int32_T(&invr);
    gpuEmxFree_int32_T(&inter_invr);
  }

  emxFree_uint32_T(&result);
  gpuEmxFree_uint32_T(&inter_result);
  emxInit_uint32_T(&b_idx, 1, true);
  c_idx_dirtyOnGpu = false;
  i = b_idx->size[0];
  if (ipos_dirtyOnGpu) {
    gpuEmxMemcpyGpuToCpu_int32_T(ipos, &inter_ipos);
  }

  b_idx->size[0] = ipos->size[0];
  emxEnsureCapacity_uint32_T(b_idx, i);
  x_validLaunchParams = mwGetLaunchParameters(static_cast<real_T>(((ipos->size[0]
    - 1) + 1L)), &x_grid, &x_block, 1024U, 65535U);
  if (x_validLaunchParams) {
    if (ipos_dirtyOnCpu) {
      gpuEmxMemcpyCpuToGpu_int32_T(ipos, &inter_ipos, gpu_ipos);
    }

    gpuEmxMemcpyCpuToGpu_uint32_T(b_idx, &d_inter_idx, d_gpu_idx);
    StiffMas2_kernel44<<<x_grid, x_block>>>(gpu_ipos, d_gpu_idx);
    c_idx_dirtyOnGpu = true;
  }

  emxFree_int32_T(&ipos);
  gpuEmxFree_int32_T(&inter_ipos);
  if (b_dirtyOnGpu) {
    gpuEmxMemcpyGpuToCpu_uint32_T(b, &inter_b);
  }

  sz[0] = b->size[0];
  sz_dirtyOnCpu = true;
  emxInit_real_T(&Afull, 2, true);
  Afull_dirtyOnGpu = false;
  if (Ke_dirtyOnGpu) {
    gpuEmxMemcpyGpuToCpu_real_T(Ke, &inter_Ke);
  }

  if (Ke->size[2] << 6 == 1) {
    emxInit_int32_T(&counts, 2, true);
    counts_dirtyOnGpu = false;
    if (c_idx_dirtyOnGpu) {
      gpuEmxMemcpyGpuToCpu_uint32_T(b_idx, &d_inter_idx);
    }

    iy = b_idx->size[0];
    i = counts->size[0] * counts->size[1];
    counts->size[0] = sz[0];
    counts->size[1] = 1;
    emxEnsureCapacity_int32_T(counts, i);
    counts_dirtyOnCpu = true;
    bb_validLaunchParams = mwGetLaunchParameters(static_cast<real_T>(((sz[0] - 1)
      + 1L)), &bb_grid, &bb_block, 1024U, 65535U);
    if (bb_validLaunchParams) {
      cudaMemcpy(gpu_sz, &sz[0], 8UL, cudaMemcpyHostToDevice);
      gpuEmxMemcpyCpuToGpu_int32_T(counts, &inter_counts, gpu_counts);
      StiffMas2_kernel47<<<bb_grid, bb_block>>>(*gpu_sz, gpu_counts);
      counts_dirtyOnCpu = false;
      counts_dirtyOnGpu = true;
    }

    for (k = 0; k < iy; k++) {
      if (counts_dirtyOnGpu) {
        gpuEmxMemcpyGpuToCpu_int32_T(counts, &inter_counts);
        counts_dirtyOnGpu = false;
      }

      counts->data[static_cast<int32_T>(b_idx->data[k]) - 1]++;
      counts_dirtyOnCpu = true;
    }

    i = Afull->size[0] * Afull->size[1];
    Afull->size[0] = sz[0];
    Afull->size[1] = 1;
    emxEnsureCapacity_real_T(Afull, i);
    iy = Afull->size[0];
    cb_validLaunchParams = mwGetLaunchParameters(static_cast<real_T>(((iy - 1) +
      1L)), &cb_grid, &cb_block, 1024U, 65535U);
    if (cb_validLaunchParams) {
      if (Ke_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_real_T(Ke, &inter_Ke, gpu_Ke);
      }

      gpuEmxMemcpyCpuToGpu_real_T(Afull, &inter_Afull, gpu_Afull);
      if (counts_dirtyOnCpu) {
        gpuEmxMemcpyCpuToGpu_int32_T(counts, &inter_counts, gpu_counts);
      }

      StiffMas2_kernel48<<<cb_grid, cb_block>>>(gpu_Ke, gpu_counts, iy,
        gpu_Afull);
      Afull_dirtyOnGpu = true;
    }

    emxFree_int32_T(&counts);
    gpuEmxFree_int32_T(&inter_counts);
  } else {
    emxInit_boolean_T(&filled, 2, true);
    filled_dirtyOnGpu = false;
    if (c_idx_dirtyOnGpu) {
      gpuEmxMemcpyGpuToCpu_uint32_T(b_idx, &d_inter_idx);
    }

    iy = b_idx->size[0];
    i = filled->size[0] * filled->size[1];
    filled->size[0] = sz[0];
    filled->size[1] = 1;
    emxEnsureCapacity_boolean_T(filled, i);
    y_validLaunchParams = mwGetLaunchParameters(static_cast<real_T>(((sz[0] - 1)
      + 1L)), &y_grid, &y_block, 1024U, 65535U);
    if (y_validLaunchParams) {
      cudaMemcpy(gpu_sz, &sz[0], 8UL, cudaMemcpyHostToDevice);
      sz_dirtyOnCpu = false;
      gpuEmxMemcpyCpuToGpu_boolean_T(filled, &inter_filled, gpu_filled);
      StiffMas2_kernel45<<<y_grid, y_block>>>(*gpu_sz, gpu_filled);
      filled_dirtyOnGpu = true;
    }

    i = Afull->size[0] * Afull->size[1];
    Afull->size[0] = sz[0];
    Afull->size[1] = 1;
    emxEnsureCapacity_real_T(Afull, i);
    ab_validLaunchParams = mwGetLaunchParameters(static_cast<real_T>(((sz[0] - 1)
      + 1L)), &ab_grid, &ab_block, 1024U, 65535U);
    if (ab_validLaunchParams) {
      if (sz_dirtyOnCpu) {
        cudaMemcpy(gpu_sz, &sz[0], 8UL, cudaMemcpyHostToDevice);
      }

      gpuEmxMemcpyCpuToGpu_real_T(Afull, &inter_Afull, gpu_Afull);
      StiffMas2_kernel46<<<ab_grid, ab_block>>>(*gpu_sz, gpu_Afull);
      Afull_dirtyOnGpu = true;
    }

    for (k = 0; k < iy; k++) {
      if (filled_dirtyOnGpu) {
        gpuEmxMemcpyGpuToCpu_boolean_T(filled, &inter_filled);
        filled_dirtyOnGpu = false;
      }

      if (filled->data[static_cast<int32_T>(b_idx->data[k]) - 1]) {
        filled->data[static_cast<int32_T>(b_idx->data[k]) - 1] = false;
        if (Afull_dirtyOnGpu) {
          gpuEmxMemcpyGpuToCpu_real_T(Afull, &inter_Afull);
          Afull_dirtyOnGpu = false;
        }

        Afull->data[static_cast<int32_T>(b_idx->data[k]) - 1] = Ke->data[k];
      } else {
        if (Afull_dirtyOnGpu) {
          gpuEmxMemcpyGpuToCpu_real_T(Afull, &inter_Afull);
          Afull_dirtyOnGpu = false;
        }

        smax = Afull->data[static_cast<int32_T>(b_idx->data[k]) - 1];
        s = Ke->data[k];
        Afull->data[static_cast<int32_T>(b_idx->data[k]) - 1] = smax + s;
      }
    }

    emxFree_boolean_T(&filled);
    gpuEmxFree_boolean_T(&inter_filled);
  }

  emxFree_uint32_T(&b_idx);
  gpuEmxFree_uint32_T(&d_inter_idx);
  emxFree_real_T(&Ke);
  gpuEmxFree_real_T(&inter_Ke);
  emxInit_int32_T(&ridxInt, 1, true);
  ridxInt_dirtyOnGpu = false;
  jA = b->size[0];
  iy = b->size[0];
  i = ridxInt->size[0];
  ridxInt->size[0] = b->size[0];
  emxEnsureCapacity_int32_T(ridxInt, i);
  ridxInt_dirtyOnCpu = true;
  db_validLaunchParams = mwGetLaunchParameters(static_cast<real_T>(((iy - 1) +
    1L)), &db_grid, &db_block, 1024U, 65535U);
  if (db_validLaunchParams) {
    if (b_dirtyOnCpu) {
      gpuEmxMemcpyCpuToGpu_uint32_T(b, &inter_b, gpu_b);
      b_dirtyOnCpu = false;
    }

    gpuEmxMemcpyCpuToGpu_int32_T(ridxInt, &inter_ridxInt, gpu_ridxInt);
    StiffMas2_kernel49<<<db_grid, db_block>>>(gpu_b, iy, gpu_ridxInt);
    ridxInt_dirtyOnCpu = false;
    ridxInt_dirtyOnGpu = true;
  }

  emxInit_int32_T(&cidxInt, 1, true);
  cidxInt_dirtyOnGpu = false;
  iy = b->size[0];
  i = cidxInt->size[0];
  cidxInt->size[0] = b->size[0];
  emxEnsureCapacity_int32_T(cidxInt, i);
  cidxInt_dirtyOnCpu = true;
  eb_validLaunchParams = mwGetLaunchParameters(static_cast<real_T>(((iy - 1) +
    1L)), &eb_grid, &eb_block, 1024U, 65535U);
  if (eb_validLaunchParams) {
    if (b_dirtyOnCpu) {
      gpuEmxMemcpyCpuToGpu_uint32_T(b, &inter_b, gpu_b);
    }

    gpuEmxMemcpyCpuToGpu_int32_T(cidxInt, &inter_cidxInt, gpu_cidxInt);
    StiffMas2_kernel50<<<eb_grid, eb_block>>>(gpu_b, iy, gpu_cidxInt);
    cidxInt_dirtyOnCpu = false;
    cidxInt_dirtyOnGpu = true;
  }

  emxInit_int32_T(&sortedIndices, 1, true);
  sortedIndices_dirtyOnGpu = false;
  i = sortedIndices->size[0];
  sortedIndices->size[0] = b->size[0];
  emxEnsureCapacity_int32_T(sortedIndices, i);
  fb_validLaunchParams = mwGetLaunchParameters(static_cast<real_T>(((jA - 1) +
    1L)), &fb_grid, &fb_block, 1024U, 65535U);
  if (fb_validLaunchParams) {
    gpuEmxMemcpyCpuToGpu_int32_T(sortedIndices, &inter_sortedIndices,
      gpu_sortedIndices);
    StiffMas2_kernel51<<<fb_grid, fb_block>>>(jA, gpu_sortedIndices);
    sortedIndices_dirtyOnGpu = true;
  }

  emxInitMatrix_cell_wrap_2(tunableEnvironment, true);
  i = tunableEnvironment[0].f1->size[0];
  if (cidxInt_dirtyOnGpu) {
    gpuEmxMemcpyGpuToCpu_int32_T(cidxInt, &inter_cidxInt);
    cidxInt_dirtyOnGpu = false;
  }

  tunableEnvironment[0].f1->size[0] = cidxInt->size[0];
  emxEnsureCapacity_int32_T(tunableEnvironment[0].f1, i);
  for (i = 0; i < cidxInt->size[0]; i++) {
    tunableEnvironment[0].f1->data[i] = cidxInt->data[i];
  }

  i = tunableEnvironment[1].f1->size[0];
  if (ridxInt_dirtyOnGpu) {
    gpuEmxMemcpyGpuToCpu_int32_T(ridxInt, &inter_ridxInt);
    ridxInt_dirtyOnGpu = false;
  }

  tunableEnvironment[1].f1->size[0] = ridxInt->size[0];
  emxEnsureCapacity_int32_T(tunableEnvironment[1].f1, i);
  for (i = 0; i < ridxInt->size[0]; i++) {
    tunableEnvironment[1].f1->data[i] = ridxInt->data[i];
  }

  emxInit_int32_T(&t, 1, true);
  if (sortedIndices_dirtyOnGpu) {
    gpuEmxMemcpyGpuToCpu_int32_T(sortedIndices, &inter_sortedIndices);
  }

  introsort(sortedIndices, cidxInt->size[0], tunableEnvironment);
  sortedIndices_dirtyOnCpu = true;
  iy = cidxInt->size[0];
  i = t->size[0];
  t->size[0] = cidxInt->size[0];
  emxEnsureCapacity_int32_T(t, i);
  t_dirtyOnCpu = true;
  emxFreeMatrix_cell_wrap_2(tunableEnvironment);
  gb_validLaunchParams = mwGetLaunchParameters(static_cast<real_T>
    (((cidxInt->size[0] - 1) + 1L)), &gb_grid, &gb_block, 1024U, 65535U);
  if (gb_validLaunchParams) {
    if (cidxInt_dirtyOnCpu) {
      gpuEmxMemcpyCpuToGpu_int32_T(cidxInt, &inter_cidxInt, gpu_cidxInt);
      cidxInt_dirtyOnCpu = false;
    }

    gpuEmxMemcpyCpuToGpu_int32_T(t, &inter_t, gpu_t);
    StiffMas2_kernel52<<<gb_grid, gb_block>>>(gpu_cidxInt, gpu_t);
    t_dirtyOnCpu = false;
  }

  hb_validLaunchParams = mwGetLaunchParameters(static_cast<real_T>(((iy - 1) +
    1L)), &hb_grid, &hb_block, 1024U, 65535U);
  if (hb_validLaunchParams) {
    if (cidxInt_dirtyOnCpu) {
      gpuEmxMemcpyCpuToGpu_int32_T(cidxInt, &inter_cidxInt, gpu_cidxInt);
    }

    gpuEmxMemcpyCpuToGpu_int32_T(sortedIndices, &inter_sortedIndices,
      gpu_sortedIndices);
    sortedIndices_dirtyOnCpu = false;
    if (t_dirtyOnCpu) {
      gpuEmxMemcpyCpuToGpu_int32_T(t, &inter_t, gpu_t);
    }

    StiffMas2_kernel53<<<hb_grid, hb_block>>>(gpu_t, gpu_sortedIndices, iy,
      gpu_cidxInt);
    cidxInt_dirtyOnGpu = true;
  }

  emxFree_int32_T(&t);
  gpuEmxFree_int32_T(&inter_t);
  emxInit_int32_T(&b_t, 1, true);
  iy = ridxInt->size[0];
  i = b_t->size[0];
  b_t->size[0] = ridxInt->size[0];
  emxEnsureCapacity_int32_T(b_t, i);
  b_t_dirtyOnCpu = true;
  ib_validLaunchParams = mwGetLaunchParameters(static_cast<real_T>
    (((ridxInt->size[0] - 1) + 1L)), &ib_grid, &ib_block, 1024U, 65535U);
  if (ib_validLaunchParams) {
    if (ridxInt_dirtyOnCpu) {
      gpuEmxMemcpyCpuToGpu_int32_T(ridxInt, &inter_ridxInt, gpu_ridxInt);
      ridxInt_dirtyOnCpu = false;
    }

    gpuEmxMemcpyCpuToGpu_int32_T(b_t, &b_inter_t, b_gpu_t);
    StiffMas2_kernel54<<<ib_grid, ib_block>>>(gpu_ridxInt, b_gpu_t);
    b_t_dirtyOnCpu = false;
  }

  jb_validLaunchParams = mwGetLaunchParameters(static_cast<real_T>(((iy - 1) +
    1L)), &jb_grid, &jb_block, 1024U, 65535U);
  if (jb_validLaunchParams) {
    if (ridxInt_dirtyOnCpu) {
      gpuEmxMemcpyCpuToGpu_int32_T(ridxInt, &inter_ridxInt, gpu_ridxInt);
    }

    if (sortedIndices_dirtyOnCpu) {
      gpuEmxMemcpyCpuToGpu_int32_T(sortedIndices, &inter_sortedIndices,
        gpu_sortedIndices);
    }

    if (b_t_dirtyOnCpu) {
      gpuEmxMemcpyCpuToGpu_int32_T(b_t, &b_inter_t, b_gpu_t);
    }

    StiffMas2_kernel55<<<jb_grid, jb_block>>>(b_gpu_t, gpu_sortedIndices, iy,
      gpu_ridxInt);
    ridxInt_dirtyOnGpu = true;
  }

  emxFree_int32_T(&b_t);
  gpuEmxFree_int32_T(&b_inter_t);
  cudaMemcpy(&SZ[0], gpu_SZ, 8UL, cudaMemcpyDeviceToHost);
  K->m = SZ[0];
  K->n = SZ[1];
  if (b->size[0] >= 1) {
    iy = b->size[0];
  } else {
    iy = 1;
  }

  i = K->d->size[0];
  K->d->size[0] = iy;
  emxEnsureCapacity_real_T(K->d, i);
  for (i = 0; i < iy; i++) {
    K->d->data[i] = 0.0;
  }

  K->maxnz = iy;
  i = K->colidx->size[0];
  K->colidx->size[0] = SZ[1] + 1;
  emxEnsureCapacity_int32_T(K->colidx, i);
  K->colidx->data[0] = 1;
  i = K->rowidx->size[0];
  K->rowidx->size[0] = iy;
  emxEnsureCapacity_int32_T(K->rowidx, i);
  for (i = 0; i < iy; i++) {
    K->rowidx->data[i] = 0;
  }

  iy = 0;
  i = SZ[1];
  for (b_c = 0; b_c < i; b_c++) {
    exitg1 = false;
    while ((!exitg1) && (iy + 1 <= b->size[0])) {
      if (cidxInt_dirtyOnGpu) {
        gpuEmxMemcpyGpuToCpu_int32_T(cidxInt, &inter_cidxInt);
        cidxInt_dirtyOnGpu = false;
      }

      if (cidxInt->data[iy] == b_c + 1) {
        if (ridxInt_dirtyOnGpu) {
          gpuEmxMemcpyGpuToCpu_int32_T(ridxInt, &inter_ridxInt);
          ridxInt_dirtyOnGpu = false;
        }

        K->rowidx->data[iy] = ridxInt->data[iy];
        iy++;
      } else {
        exitg1 = true;
      }
    }

    K->colidx->data[b_c + 1] = iy + 1;
  }

  emxFree_int32_T(&cidxInt);
  gpuEmxFree_int32_T(&inter_cidxInt);
  emxFree_int32_T(&ridxInt);
  gpuEmxFree_int32_T(&inter_ridxInt);
  emxFree_uint32_T(&b);
  gpuEmxFree_uint32_T(&inter_b);
  for (k = 0; k < jA; k++) {
    if (Afull_dirtyOnGpu) {
      gpuEmxMemcpyGpuToCpu_real_T(Afull, &inter_Afull);
      Afull_dirtyOnGpu = false;
    }

    K->d->data[k] = Afull->data[sortedIndices->data[k] - 1];
  }

  emxFree_int32_T(&sortedIndices);
  gpuEmxFree_int32_T(&inter_sortedIndices);
  emxFree_real_T(&Afull);
  gpuEmxFree_real_T(&inter_Afull);
  iy = 1;
  i = K->colidx->size[0];
  for (b_c = 0; b_c <= i - 2; b_c++) {
    jA = K->colidx->data[b_c];
    K->colidx->data[b_c] = iy;
    while (jA < K->colidx->data[b_c + 1]) {
      smax = 0.0;
      jy = K->rowidx->data[jA - 1];
      while ((jA < K->colidx->data[b_c + 1]) && (K->rowidx->data[jA - 1] == jy))
      {
        smax += K->d->data[jA - 1];
        jA++;
      }

      if (smax != 0.0) {
        K->d->data[iy - 1] = smax;
        K->rowidx->data[iy - 1] = jy;
        iy++;
      }
    }
  }

  K->colidx->data[K->colidx->size[0] - 1] = iy;

  /*  Assembly of the global stiffness matrix */
  emlrtHeapReferenceStackLeaveFcnR2012b(emlrtRootTLSGlobal);
  gpuEmxFree_uint32_T(&inter_elements);
  cudaFree(gpu_elements);
  cudaFree(gpu_iK);
  cudaFree(gpu_jK);
  cudaFree(gpu_Ke);
  gpuEmxFree_real_T(&inter_nodes);
  cudaFree(gpu_nodes);
  cudaFree(*gpu_X);
  cudaFree(*gpu_ind);
  cudaFree(*gpu_ke);
  cudaFree(*gpu_L);
  cudaFree(*gpu_Jac);
  cudaFree(*gpu_x);
  cudaFree(*gpu_ipiv);
  cudaFree(gpu_detJ);
  cudaFree(*gpu_B);
  cudaFree(*b_gpu_B);
  cudaFree(gpu_result);
  cudaFree(*gpu_SZ);
  cudaFree(gpu_ipos);
  cudaFree(gpu_b);
  cudaFree(gpu_idx);
  cudaFree(b_gpu_iwork);
  cudaFree(gpu_ycol);
  cudaFree(b_gpu_idx);
  cudaFree(b_gpu_b);
  cudaFree(gpu_indx);
  cudaFree(gpu_r);
  cudaFree(*gpu_uv);
  cudaFree(c_gpu_idx);
  cudaFree(gpu_iwork);
  cudaFree(c_gpu_b);
  cudaFree(gpu_invr);
  cudaFree(d_gpu_idx);
  cudaFree(gpu_filled);
  cudaFree(*gpu_sz);
  cudaFree(gpu_Afull);
  cudaFree(gpu_counts);
  cudaFree(gpu_ridxInt);
  cudaFree(gpu_cidxInt);
  cudaFree(gpu_sortedIndices);
  cudaFree(gpu_t);
  cudaFree(b_gpu_t);
}

/* End of code generation (StiffMas2.cu) */
