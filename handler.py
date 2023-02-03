import os 

steps = 1
N = 10

def plot_outconf(i,steps):
    os.system("awk 'NR == "+str(steps*300+1)+
		", NR == "+str(300*(steps+1))+
		"' bd_xyz"+str(1)+".txt > temp.txt"
        )
    os.system("cat temp.txt >> trajectory.txt")
    os.system("")
    os.system("gnuplot -c ./plot.gnu temp.txt out_image"+str(i)+".png")
    os.system("mv *.png ./initial_conditions/")

BASE_DIR = os.getcwd()

bd_sym = os.path.join(
    BASE_DIR,
    'bdpd'
)
os.system("gnuplot -c ./plot.gnu temp.txt out_image"+str(0)+".png")
os.system("mv *.png ./initial_conditions/")
for i in range(N):
    os.system('rm -rf op* bd_xyz* PolicyOut* trajectory*')
    os.system(bd_sym)
    plot_outconf(i=i+1,steps=steps)

