#!/usr/bin/env python
# -*- coding: cp1252 -*-

__VERSION__ = '1.0'
import immlib
from immlib import BpHook
DESC = "Simple PyHook" 


class DemoHook(BpHook): 
    def __init__(self):
        BpHook.__init__(self)


    def run(self, regs):
	imm = immlib.Debugger()
	eipOnStack = imm.readLong(regs['ESP'])
	strcpyFirstArg =  imm.readLong(regs['ESP'] + 4)
	strcpySecondArg = imm.readLong(regs['ESP'] + 8) #In this case, we are interested in the strcpy function
	imm.log("EIP on the stack 0x%80x First Arg: 0x%08x Second Arg: 0x%08x "%(eipOnStack, strcpyFirstArg, strcpySecondArg))
	receivedString = imm.readString(strcpySecondArg)
	imm.log("Received String %s with length %d " %(str(receivedString), len(receivedString))) # Here we paint in the logs tab, the arguments that have been sent to the function.
	imm.updateLog() 
		
def main(args):
   imm = immlib.Debugger()
   functionToHook = "msvcrt.strcpy" #On windows systems, the STRCPY function
   functionAddress = imm.getAddress(functionToHook) #In this line we retrieve the memory address where the STRCPY function is loaded
   newHook = DemoHook()
   newHook.add("Demo Hook", functionAddress)
   return "Success!"
