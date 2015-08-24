
inputSize = 15;
layerSizes = [10,5,15];


nndata = {rand(layerSizes(1), inputSize)};
for i = 2:length(layerSizes)
	nndata = [nndata {rand(layerSizes(i),layerSizes(i-1))}];
end

vector = [1:15]';
newvec = nndata{1} * vector;
for i = 2:length(nndata)
	newvec = nndata{i} * (1./(1+e.^-newvec));
end
