import sum_nk_genSched
import os

path = "test/"
for (root, dirs, file) in os.walk(path):
    for f in file:
        testCase = open(path + f, 'r')
        n = int(testCase.readline())
        k = int(testCase.readline())
        adderPerCycle = sum_nk_genSched.adderSchedule(n,k)
        reversedAdderPerCycle = adderPerCycle[::-1]
        error = 0
        errorMessage = []
        for i, adder in enumerate(reversedAdderPerCycle):
            testAdder = int(testCase.readline())
            if not testAdder:
                break
            if(testAdder != adder):
                error += 1
                errorMessage.append("Something wrong in the file "+ f + " in " + str(i + 1) + " cycle")
                break
        if(error !=0 ):
            print("Test "+ f  + " : n = " + str(n) + " k = " + str(k) + " failed")
        else:
            print("Test "+ f  + " : n = " + str(n) + " k = " + str(k) + " passed")