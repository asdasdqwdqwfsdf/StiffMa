sets.nel = 160;
sets.dTE = 'uint64';
sets.dTN = 'single';
[elements, ~] = CreateMesh2(sets.nel,sets.nel,sets.nel,sets.dTE,sets.dTN);
sets.nel = 4096000;
d = gpuDevice;
sets.tbs = d.MaxThreadsPerBlock;
sets.numSMs   = d.MultiprocessorCount;
sets.WarpSize = d.SIMDWidth;
elementsGPU = gpuArray(elements');
sets.sz = 36;
sets.edof = 8;


%% Index-CPU-Scalar
[iK, jK] = Index_ssa(elements, sets);

%% Index-CPU-Scalar-Symmetry
[iK, jK] = Index_sssa(elements, sets);

%% Index-GPU-Scalar-Symmetry
[iKd, jKd] = Index_spsa(elementsGPU, sets);
wait(d);