//
//  ARC.swift
//  SwiftPractice
//
//  Created by yusera-ansari on 20/03/25.
//

class ARC:Test, Testable{
    
    override init() {
        super.init()
         print("initialized ARC object \(self)")
    }
    static func appendTests() {
        tests.append(test1)
    }
    
    static func runTests() {
        super.runTests(with: ARC.self)
    }
    static func test1(){
        
    }
    
    deinit{
        print("de-initializing: ARC object \(self)")
    }
}
