
% Script to run the INDEX code on CPU
addpath('../Common');
addpath('../Utils');

%% Problem setup
c = 1.0;            % Conductivity (homogeneous, linear, isotropic material)
nelx = 10;          % Number of elements on X-direction
nely = 10;          % Number of elements on Y-direction
nelz = 10 ;         % Number of elements on Z-direction
dTypeE = 'uint32';  % Data precision for "elements" ['uint32', 'uint64' or 'double']
dTypeN = 'double';  % Data precision for "nodes" ['single' or 'double']

%% Mesh generation
[elements, nodes] = CreateMesh(nelx,nely,nelz,dTypeE,dTypeN);

%% Index computation on CPU (symmetry)
tic;
[iKh, jKh] = IndexScalarsas(elements);      % Row/column indices of tril(K)
times = toc;
fprintf('Time spend computing row/column indices of tril(K) on serial CPU: %f\n',times);