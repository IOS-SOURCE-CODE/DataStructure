//: Playground - noun: a place where people can play

import Foundation


var age  = 500

withUnsafePointer(to: &age) { pointer  in
   print(pointer)
    print(pointer.pointee)
}


withUnsafeBytes(of: &age) { pointer in
   print(pointer.count)
   print(pointer.first)
   print(pointer[0])
}
