import sum_nk_genSched
def main():
    n = 70
    k = 7
    adderPerCycle = sum_nk_genSched.adderSchedule(n, k)
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