function weight = randWeights(weight,units , layer)
weight{1} = 2*rand([units, 3])-1;
for i=2:layer-1
   weight{i} = 2*rand([units,units+1])-1;
end
weight{end} = 2*rand([1,units+1])-1;

end