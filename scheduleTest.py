import adderSchedule
def main():
    n = 40
    k = 2
    adderPerCycle = adderSchedule.adderSchedule(n, k)
    m = n
    for i, adder in enumerate(adderPerCycle):
        if(m >= adder*2):
            m = (m - adder*2) + adder
        else:
            print("Fail (Unnecessary adder found in ",  i + 1 ," cycle)")
            break
        if(m <= 0):
            print("Fail")
            break
    if(m != 1):
        print("Fail (Not Enough Cycle)")
    else:
        print("Passed")
if __name__ == '__main__':
    main()