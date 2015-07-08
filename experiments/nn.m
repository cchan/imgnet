1;

%Theta = {rand(10,20),rand(10,10),rand(5,10)};
%function y = frontprop(x)
%	for i = 0 : numel(Theta)
%		x = Theta{i} * x;
%	x * Theta
%end



% Note to self: it's ALWAYS rows, cols. Number of rows/cols, index of rows/cols, etc.

imgs = [
1,1,1,1,1,\
 1,0,0,0,1,\
 1,0,0,0,1,\
 1,0,0,0,1,\
 1,1,1,1,1;
0,0,1,0,0,\
 0,1,1,0,0,\
 0,0,1,0,0,\
 0,0,1,0,0,\
 1,1,1,1,1;
1,1,1,1,1,\
 0,0,0,0,1,\
 1,1,1,1,1,\
 1,0,0,0,0,\
 1,1,1,1,1;
1,1,1,1,1,\
 0,0,0,0,1,\
 1,1,1,1,1,\
 0,0,0,0,1,\
 1,1,1,1,1;
0,0,1,1,0,\
 0,1,0,1,0,\
 1,1,1,1,1,\
 0,0,0,1,0,\
 0,0,0,1,0;
1,1,1,1,1,\
 1,0,0,0,0,\
 1,1,1,1,1,\
 0,0,0,0,1,\
 1,1,1,1,1;
1,1,1,1,1,\
 1,0,0,0,0,\
 1,1,1,1,1,\
 1,0,0,0,1,\
 1,1,1,1,1;
1,1,1,1,1,\
 0,0,0,0,1,\
 0,0,0,1,0,\
 0,0,1,0,0,\
 0,0,1,0,0;
1,1,1,1,1,\
 1,0,0,0,1,\
 1,1,1,1,1,\
 1,0,0,0,1,\
 1,1,1,1,1;
1,1,1,1,1,\
 1,0,0,0,1,\
 1,1,1,1,1,\
 0,0,0,0,1,\
 0,1,1,1,1
]; %Does Octave have direct image-processing capability? Process all the stuff and dump it into csv data (reals, not bools).

subviewSize=[3,3]; %How big is the "view" for the convolution unit?
imgSize=[5,5]; %How big is the whole image?
numImgs=size(imgs)(1); %How many images?

%Let's generate all possible convolutions (lol these terms) for each image.
convolutions=[];
for n = 1:numImgs %for each image
	for i = 1:imgSize(1) - subviewSize(1) + 1
		for j = 1:imgSize(2) - subviewSize(2) + 1 %Iterate through every possible position
			mask = zeros(imgSize);
			mask(i:i+subviewSize(1)-1,j:j+subviewSize(2)-1) = 1;
			convolutions = [convolutions,[1,imgs(n,find(mask))]']; %And add that convolution
		end
	end
end

weights = rand(5,9); % 3x3. 5 outputs.

(weights * convolutions); %For each of these, we pull over the neuron with closest weights, and inhibit the others.


%given each 3x3: we need to create several neurons that each activate to different features. Then we can build on top of that to have more features.
%So we'll have 5 neurons to have 5 classification classes.
%For each of those we




%So now we unsupervisedly learn based on this output. How? I have no idea. Tbh it should be more than just a linear classifier; it should be a more complex net.
	%Like [25,5,1] instead of just [25,1]. And this would be simply connected, not convoluted.

% HOW DO WE UNSUPERVISEDLY LEARN THO???



% % ADAPTIVE RESONANCE THEORY (ISH)
% factor = 0.3;
% vigilance = 5;
% mutationFactor = 0.1;

% % 1) Give each neuron the input vector and collect the responses.
% responses = weights * imgs'; %And that is the output of this layer. Conveniently, you can reroll this to create a slightly smaller "image" of activations.

% % 2) Find the neuron with the highest response. [and subtract from that some factor times the sum of all the others' responses. That's the neuron's "fit".]
% maxedPositions = (responses == max(responses));
% for i=1:numImgs
	% fit = [fit, find(maxedPositions(:,i),1)];%((1+factor)*max(responses) - factor*sum(responses));
% % fit now contains for each image one of the best-fitting neurons.

% % 3) [If this is above the Vigilance Parameter] Increase the intensity of response of that neuron to that image, and decrease that of the others.
% % vigilant = find(fit>vigilance); % the indices of images that have sufficiently vigilant neurons
% weights(vigilant) += (imgs(vigilant)-0.5) * mutationFactor ; % adjust it so that next time it'll have an even more intense response


% max(weights * imgs')

% find(fit<=vigilance); %the indices of images that don't have sufficiently vigilant neurons

% for i = 1:numImgs
	% resp = responses(:,1);
	% while(fit < vigilance)

		% fit = ((1+factor)*max(resp) - factor*sum(resp));
	% end
% end


% %	and go to the next input and repeat from (1) until each input in the set of training inputs has been fed in lambda times.
% % 4) If this is below the Vigilance Parameter, ignore this neuron and repeat from (2). If there are no more neurons to ignore, just take an 'uncommitted' one (the first one I guess) and adjust.





