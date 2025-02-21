// RUN: rm -rf %t
// RUN: split-file %s %t
// RUN: %target-swift-frontend -typecheck -verify -I %t/Inputs  %t/test.swift  -enable-experimental-cxx-interop
// RUN: not %target-swift-frontend -typecheck -I %t/Inputs  %t/test.swift  -enable-experimental-cxx-interop 2>&1 | %FileCheck %s

//--- Inputs/module.modulemap
module Test {
    header "test.h"
    requires cplusplus
}

//--- Inputs/test.h

struct X {
  X();
  X(const X&) = default;
  X(X&&) = default;
  ~X();
};

void acceptRValueRef(int &&);
void acceptRValueRef(X &&);

template<class T>
void notStdMove(T &&);

//--- test.swift

import Test

public func foo(_ x: consuming X) {}

public func test() {
  let x = X()
  acceptRValueRef(consuming: x)
  let y = X()
  foo(y)
  let z = X()
}
