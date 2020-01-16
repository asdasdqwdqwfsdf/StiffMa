function [iK, jK] = IndexVectorSymGPU(elements)
% INDEXVECTORSYMGPU Compute the row and column indices of lower symmetric
% part of global stiffness matrix for a VECTOR problem taking advantage of
% GPU computing. 
%   INDEXVECTORSYMGPU(elements) returns the rows "iK" and columns "jK"
%   position of all element stiffness matrices in the global system for a
%   finite element analysis of a vector problem in a three-dimensional
%   domain taking advantage of symmetry and GPU computing, where "elements"
%   is the connectivity matrix. 
%
%   See also STIFFMATGENVCSYMGPU, INDEXVECTORSYMCPU, INDEXVECTORSYMCPUP
%
%   For more information, see <a href="matlab:
%   web('https://github.com/fjramireg/MatGen')">the MatGen Web site</a>.

%   Written by Francisco Javier Ramirez-Gil, fjramireg@gmail.com
%   Universidad Nacional de Colombia - Medellin
%   Created: 17/01/2019. Modified: 21/01/2019. Version: 1.3

dType = classUnderlying(elements);          % Data type (int32, uint32, int64, uint64, double)
nel = size(elements,2);                     % Number of elements

% INITIALIZATION OF GPU VARIABLES
iK  = zeros(300*nel,1,dType,'gpuArray');    % Stores row indices (initialized directly on GPU)
jK  = zeros(300*nel,1,dType,'gpuArray');    % Stores column indices (initialized directly on GPU)

% MATLAB KERNEL CREATION
if strcmp(dType,'uint32')               % uint32
    ker = parallel.gpu.CUDAKernel('IndexVectorGPU.ptx',...                      % PTXFILE
        'const unsigned int*,const unsigned int,unsigned int*,unsigned int*',...% C prototype for kernel
        'IndexVectorGPUIj');                                                    % Specify entry point
elseif strcmp(dType,'uint64')           % uint64
    ker = parallel.gpu.CUDAKernel('IndexVectorGPU.ptx',...
        'const unsigned long *, const unsigned long, unsigned long *, unsigned long *',...
        'IndexVectorGPUIm');
elseif strcmp(dType,'double')           % double
    ker = parallel.gpu.CUDAKernel('IndexVectorGPU.ptx',...
        'const double *, const double, double *, double *',...
        'IndexVectorGPUId');
else
    error('Not supported data type. Use only one of this: uint32, uint64, double');
end

% MATLAB KERNEL CONFIGURATION
ker.ThreadBlockSize = [ker.MaxThreadsPerBlock, 1, 1];    % Threads per block
ker.GridSize = [ceil(nel/ker.ThreadBlockSize(1)), 1, 1]; % Blocks per grid

% MATLAB KERNEL CALL
[iK, jK] = feval(ker, elements, nel, iK, jK);            % GPU code execution
