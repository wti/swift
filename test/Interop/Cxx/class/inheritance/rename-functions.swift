// RUN: %target-typecheck-verify-swift -verify-ignore-unknown -I %S/Inputs -I %swift_src_root/lib/ClangImporter/SwiftBridging -cxx-interoperability-mode=default

import RenameFunctions

func immortal(_ x: ImmortalStruct) {
    x.virtualFun()
    x.swiftVirtualFun()
    x.swiftNonVirtualFun()
}
