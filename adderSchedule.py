import math

## n => number count
## k => cycle count

def adderSchedule(n, k):
    
    #print(math.floor(math.log2(k) + 1 ))
    adderPerCycle = []
    j = n - 1
    adder = 1
    for i in range(k,0,-1):
        #print("j: " + str(j))
        optimalAdder = math.floor(j / (i))
        adderPerCycle.append(min(adder , optimalAdder))
        #print("optimalAdder: "+ str(optimalAdder))
        if(adder > optimalAdder):
            #print("#: " +  str((adder - optimalAdder) + optimalAdder*2))
            j = n - ((adder - optimalAdder) + optimalAdder*2)
            adder = ((adder - optimalAdder) + optimalAdder*2)
        else:
            #print("#: " +  str(adder * 2))
            j = n - adder * 2
            adder *= 2
    reversedAdderPerCycle = adderPerCycle[::-1]
    return reversedAdderPerCycle