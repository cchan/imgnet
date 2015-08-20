
inputSize = 10;
layerSizes = [15;15;5];


nndata = {rand(layerSizes(1), inputSize)};
for i = 2:size(layerSizes)(1)
	nndata = [nndata {rand(layerSizes(i),layerSizes(i-1))}];
end

for i = 1:size(nndata)
	nndata{i}
end
