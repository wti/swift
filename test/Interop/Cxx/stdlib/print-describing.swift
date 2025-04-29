// RUN: %empty-directory(%t)
// RUN: %target-build-swift %s -o %t/a.out -Xfrontend -enable-experimental-cxx-interop -I %S/Inputs
// RUN: %target-codesign %t/a.out
// RUN: %target-run %t/a.out | %FileCheck %s --check-prefix=CHECK --check-prefix=CHECK-%target-os

// REQUIRES: executable_test

import CxxStdlib

func printDescribingString() {
  let s = std.string("Goodbye, World!")
  print(s)
  print(String(describing: s))
}

printDescribingString()
// CHECK: Goodbye, World!
