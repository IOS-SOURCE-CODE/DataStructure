//: Playground - noun: a place where people can play

import Foundation

let birdCategory: UInt32 = 1 << 0
let new = birdCategory << 4

let worldCategory: UInt32 = 1 << 1



let rightShift: UInt8 = 1 << 7


rightShift >> 1
rightShift >> 2

var capacity = 4

capacity & (~capacity + 1)

capacity & 4


var b = 1

while(b < capacity) {
   b = b * 2
}

b


