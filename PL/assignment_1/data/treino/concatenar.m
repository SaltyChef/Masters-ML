load P0.mat

gigante=P;

for i=0:32
    name="P"+string(i)+".mat";
    l=load(name,"P");
    A=l.P;
    gigante=cat(2,gigante,A);
end