f = open("201501.bck").readlines()
fout = open("201501.csv","w")
for i in range(5000):
    fout.write(f[i])