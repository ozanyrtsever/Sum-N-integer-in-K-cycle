from __future__ import absolute_import
from __future__ import print_function
import sys
import os
import math
import adderSchedule
import pyverilog.vparser.ast as vast
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator
def main():
    n = 30
    k = 7
    adderPerCycle = adderSchedule.adderSchedule(n,k)
    adderCount = max(adderPerCycle)
    print(adderPerCycle)
    params = vast.Paramlist( [] )
    prevPorts = []
    clk = vast.Ioport( vast.Input('clk') )
    rst = vast.Ioport( vast.Input('rst') )
    prevPorts.append(clk)
    prevPorts.append(rst)
    width = vast.Width( vast.IntConst('4'), vast.IntConst('0') )
    for i in range(n):
        variableName = str("num" + str(i + 1))
        prevPorts.append(vast.Ioport( vast.Input(variableName, width=width) ))
    
    ports = vast.Portlist( prevPorts )
    width = vast.Width( vast.IntConst('9'), vast.IntConst('0') )
    items = []
    for i in range(adderCount):
        registerName = str("res" + str(i + 1))
        registerNxtName = str("res" + str(i + 1) + "Nxt")
        items.append(vast.Reg(registerName, width=width))
        items.append(vast.Reg(registerNxtName, width=width))
    for i in range(adderCount):
        wireName = str("out" + str(i + 1))
        items.append(vast.Wire(wireName, width=width))
    for i in range(adderCount*2):
        regName = str("in" + str(i + 1))
        items.append(vast.Reg(regName, width=width))
    width = vast.Width( vast.IntConst(str(math.floor(math.log2(k) + 1 ))), vast.IntConst('0') )
    counter = vast.Reg('counter', width=width)
    counterNxt = vast.Reg('counterNxt', width=width)
    items.append(counter)
    items.append(counterNxt)


    for i in range(adderCount):
        wireName = str("out" + str(i + 1))
        reg1Name = str("in" + str(i + i + 1))
        reg2Name = str("in" + str(i + i + 2))
        regPlus = vast.Plus(vast.Identifier(reg1Name), vast.Identifier(reg2Name))
        assign = vast.Assign(
            vast.Lvalue(vast.Identifier(wireName)),
            vast.Rvalue(regPlus)) # :DATAWID-8]
        items.append(assign)
    
    

    sens = vast.Sens(vast.Identifier('clk'), type='posedge')
    senslist = vast.SensList([ sens ])
    posEdge = []
    counterFF = vast.NonblockingSubstitution(
        vast.Lvalue(vast.Identifier('counter')),
        vast.Rvalue(vast.IntConst('counterNxt')))
    posEdge.append(counterFF)
    for i in range(adderCount):
        regName = str("res" + str(i + 1))
        regNxtName = str("res" + str(i + 1) + "Nxt")
        resFF = vast.NonblockingSubstitution(
            vast.Lvalue(vast.Identifier(regName)),
            vast.Rvalue(vast.IntConst(regNxtName)))
        posEdge.append(resFF)
    statementSeq = vast.Block(posEdge)

    always = vast.Always(senslist, statementSeq)
    senslist = vast.SensList([])

    ##### always @(*) begin
    comb = []
    for i in range(adderCount):
        regName = str("res" + str(i + 1))
        regNxtName = str("res" + str(i + 1) + "Nxt")
        resLatch = vast.BlockingSubstitution(
            vast.Lvalue(vast.Identifier(regNxtName)),
            vast.Rvalue(vast.Identifier(regName)))
        comb.append(resLatch)
    counterPlus1 = vast.Plus(vast.Identifier('counter'), vast.IntConst('1'))
    clockCounter = vast.BlockingSubstitution(
        vast.Lvalue(vast.Identifier('counter')),
        vast.Rvalue(counterPlus1))
    comb.append(clockCounter)
    rstState = []
    for i in range(adderCount):
        regNxtName = str("res" + str(i + 1) + "Nxt")
        regReset = vast.BlockingSubstitution(
            vast.Lvalue(vast.Identifier(regNxtName)),
            vast.Rvalue(vast.IntConst(0)))
        rstState.append(regReset)
    rstState.append(vast.BlockingSubstitution(
        vast.Lvalue(vast.Identifier('counterNxt')),
        vast.Rvalue(vast.IntConst(0))))
    ifRstTrue = vast.Block(rstState)
    
    inputCounter = 1
    states = []
    for index, i in enumerate(adderPerCycle):
        state = []
        regCounter = 1
        
        for j in range(i*2):
            in1 = str("in" + str(j + 1))
            if(index == 0):
                if(inputCounter <= n):
                    numName = str("num" + str(inputCounter))
                    inputCounter  += 1
                    state.append(vast.BlockingSubstitution(
                        vast.Lvalue(vast.Identifier(in1)),
                        vast.Rvalue(vast.Identifier(numName))))
                else:
                    regName = str("res" + str(regCounter))
                    regCounter += 1
                    state.append(vast.BlockingSubstitution(
                        vast.Lvalue(vast.Identifier(in1)),
                        vast.Rvalue(vast.Identifier(regName))))
            else:
                if(j % 2 != 0 and inputCounter <= n):
                    numName = str("num" + str(inputCounter))
                    inputCounter  += 1
                    state.append(vast.BlockingSubstitution(
                        vast.Lvalue(vast.Identifier(in1)),
                        vast.Rvalue(vast.Identifier(numName))))
                else:
                    regName = str("res" + str(regCounter))
                    regCounter += 1
                    state.append(vast.BlockingSubstitution(
                        vast.Lvalue(vast.Identifier(in1)),
                        vast.Rvalue(vast.Identifier(regName))))
                        
        for k in range(i):
            regName = str("resNxt" + str(k + 1))
            outName = str("out" + str(k + 1))
            state.append(vast.BlockingSubstitution(
                vast.Lvalue(vast.Identifier(regName)),
                vast.Rvalue(vast.Identifier(outName))))
        state = vast.Block(state)

        states.append(state)
    allStates = []
    for index, state in enumerate(states):
        allStates.append(vast.Case([vast.Identifier(str(index))], state))
    caseStatement = vast.CaseStatement(vast.Identifier('counter'), allStates)
    caseBlock = vast.Block([caseStatement])
    ifRst = vast.IfStatement(vast.Identifier('rst'), ifRstTrue, caseBlock)
    comb.append(ifRst)


    ##### end
    sens = vast.Sens(vast.Identifier('*'), type='*')
    senslist = vast.SensList([ sens ])
    statementComb = vast.Block(comb)
    alwaysComb = vast.Always(senslist,  statementComb)



    items.append(always)
    items.append(alwaysComb)

    ast = vast.ModuleDef("top", params, ports, items)
    
    codegen = ASTCodeGenerator()
    rslt = codegen.visit(ast)
    print(rslt)
    file1 = open("topModule.v", "w")
    file1.write(rslt)
    file1.close()

if __name__ == '__main__':
    main()