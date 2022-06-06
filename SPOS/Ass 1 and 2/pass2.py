words = []
f = open("inter_codes.txt",'r')
outf = open("pass2output.txt",'w')
symbol = open("symtab.txt",'r')
literal = open("littab.txt",'r')

symbols =[]
literals =[]
for line in symbol:
    symbols.append(line.split())
for line in literal:
    literals.append(line.split())
    
# print(symbols)
# print(literals)
# print( symbols[1][2])
for line in f:
    line = line.replace('(' ,"")
    line = line.replace(')',"")
    words=line.split()
    print(words)

    if 'AD,02' in words[1]:
        outf.write(f"{words[0]} 00 0 {words[2][2:]}")
        outf.write("\n")
    elif 'DL,01' in words[1]:
        outf.write(f"{words[0]} 00 0 {words[2][2:]}")
        outf.write("\n")
    elif 'DL,02' in words[1]:
        outf.write(f"{words[0]} 00 0 00")
        outf.write("\n")
    elif "AD" in words[0]:
        print(words[0])
        outf.write(" ----\n")
        
    else:
        if words[0].isnumeric():
            outf.write(words[0])

        MachineCode = words[1].split(',')
        outf.write(f" {MachineCode[1]}")
        
        if len(words) == 4:
            if words[2]=='1' or words[2]== '2' or words[2] == '3' or words[2] == '4':
                outf.write(f" {words[2]} ")
            else :
                outf.write(f" 0 ")

            symbolLiteral = words[3].split(",")
            if symbolLiteral[0] == 'S':
                outf.write(symbols[int(symbolLiteral[1])][2])
                outf.write("\n")
            elif  symbolLiteral[0] == 'L':   
                outf.write(literals[int(symbolLiteral[1])-1][2])
                outf.write("\n")
            else:
                outf.write(symbolLiteral[1])
                outf.write("\n")

        else :
            outf.write(f" 0 ")
            symbolLiteral = words[2].split(",")
            if symbolLiteral[0] == 'S':
                outf.write(symbols[int(symbolLiteral[1])][2])
                outf.write("\n")
            elif  symbolLiteral[0] == 'L':   
                outf.write(literals[int(symbolLiteral[1])-1][2])
                outf.write("\n")
            else:
                outf.write(symbolLiteral[1])
                outf.write("\n")


f.close()
outf.close()
symbol.close()
