

fout = open("gigante.txt", "w")
for row in range(1700):
    line = "";
    number = 1;
    for column in range(10):
        if(column == 9):
            line += str(number%10) + "\n";
        else:
            line += str(number%10) + ",";
        number+=1;
    
    fout.write(line);      
    
    