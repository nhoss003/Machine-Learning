function parta
% Niloufar Hosseini Pour
% 861242801
% 11/18/2016
% CS229
% PS6
for depth=[1,2,3]
    i =0;
    figure
    subplot
    for trees =[1,10,100,1000]
       i = i+1;
        subplot(2,2,i);
        partaaa(depth,trees);
         title(sprintf('depth = %g, trees = %g', depth, trees));
    end
end

end