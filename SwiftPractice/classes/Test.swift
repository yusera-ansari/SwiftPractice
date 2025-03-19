//
//  Test.swift
//  SwiftPractice
//
//  Created by yusera-ansari on 19/03/25.
//


class Test{
    typealias test = () ->()
    static var tests = [test]()
    static func addSpace(){
        print(".\n.\n.")
    }
//    static func appendTests(){
//        fatalError(
//            "Must be implemented by child"
//        )
//    }
   
    static func createTopic(for topic:String){
        print("Topic: \(topic)")
        var underline=""
       
        for i in 1...50{
            underline+="_"
        }
        
        print(underline+"\n")
    }

    static func runTests(with testable : Testable.Type ){
        testable.appendTests()
        
        print("\ntotal tests: \(tests.count)")
        for (index, test) in tests.enumerated(){
            print("\nstaring test \(index+1) of \(tests.count) ")
            addSpace()
            test();
            addSpace()
            print("ending test \(index+1) of \(tests.count)\n")
        }
    }
}

