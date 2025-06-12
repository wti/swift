#include "swift/bridging"

struct ImmortalStruct {
    virtual void virtualFun() const SWIFT_NAME(swiftVirtualFun());
    void nonVirtualFun() const SWIFT_NAME(swiftNonVirtualFun());
} SWIFT_IMMORTAL_REFERENCE;
