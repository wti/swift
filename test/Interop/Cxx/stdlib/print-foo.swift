// RUN: %empty-directory(%t)
// RUN: %target-build-swift %s -o %t/a.out -Xfrontend -enable-experimental-cxx-interop -I %S/Inputs
// RUN: %target-codesign %t/a.out
// RUN: %target-run %t/a.out | %FileCheck %s --check-prefix=CHECK --check-prefix=CHECK-%target-os

// REQUIRES: executable_test

import NoCXXStdlib

extension Foo : CustomStringConvertible {
  public var description: String {
    return "Description --> Foo{a: \(a)}"
  }
}

func printFoo() {
  let s = Foo(a: 5)
  print(s)
}

printFoo()
