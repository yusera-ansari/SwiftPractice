//
//  GCD.swift
//  SwiftPractice
//
//  Created by Abcom on 19/03/25.
//

import Foundation

class GCD : Test, Testable{
    static func appendTests() {
        print("fetching tests....")
        tests.append(test1)
        tests.append(test2)
        print("done!")
    }
    
    static func runTests() {
        
        super.runTests(with: GCD.self)
        RunLoop.main.run()
        
    }
    
 static func test1(){
     /*Simple Asynchronous Task:
      
      Write a Swift function that uses GCD to print "Hello, World!" asynchronously after a delay of 2 seconds.
      How can you make sure that the message is printed on the main thread?
      */
     print("starting dispatch...")
     DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(2)) {
            print("Hello, World!")
//         exit(0)
        }
    
    }
    
    static func test2(){
        /*
         Basic Concurrent Task Execution:

         Write a Swift program that uses GCD to run two functions concurrently:
         One function that prints "Task 1 is starting" and waits for 3 seconds, then prints "Task 1 is finished".
         Another function that prints "Task 2 is starting" and waits for 1 second, then prints "Task 2 is finished".
         Use DispatchQueue.global(qos: .background) for executing tasks concurrently.
         */
        
        DispatchQueue.global(qos:.background).async(execute: {
            print("Task 1 is starting");
            sleep(3)
            print("Task 1 is finished")
        })
        
        DispatchQueue.global(qos: .background).async(execute: {
            print("Task 2 is starting")
            sleep(1)
            print("Task 2 is finished")
        })
    }
}
