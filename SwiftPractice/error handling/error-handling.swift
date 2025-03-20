//
//  error-handling.swift
//  SwiftPractice
//
//  Created by yusera-ansari on 19/03/25.
//
 

enum DivisionError:Error{
    case dividedBYZero
}

func divide(_ num:Int, by divisor:Int) throws ->Int {
    print("Dividing \(num) by \(divisor)...")
    
    if(divisor==0){
        print("throwing dividedbyzero error....")
         
        throw DivisionError.dividedBYZero
    }
    print("Quotient is: \(num/divisor)")
    return num/divisor
}

class ErrorHandling:Test, Testable{
   
    
    static func appendTests(){
        print("fetching tests....")
        tests.append(test1)
        tests.append(test2)
        tests.append(test3)
        tests.append(test4)
        tests.append(test5)
        print("done!")
    }
      static func runTests(){
        super.runTests(with: ErrorHandling.self)
    }
    
    static func test1 (){
    
        do{
            try divide(2, by: 0)
        }
        catch DivisionError.dividedBYZero {
            print("caught: pss..you tried to divide the number by zero!")
        }
        catch{
            print( error)
        }
    }
    
    static func test2(){
        //handling error in general catch block
        createTopic(for: "handling error in general catch block")
        do{
            try divide(20, by: 54)
        }catch{
            print("Caught: \(error)")
        }
    }
    
    static func test3(){
        //Converting Errors to Optional Values
        createTopic(for: "Converting Errors to Optional Values")
        let x = try? divide(3, by: 0)
        print("value of x is :",x)
        
        let y: Int?
        do{
            y = try divide(2, by: 0)
        }catch{
            y=nil;
        }
        print("value of y is:", y)
    }
    static func test4(){
        //handling error with if..let
        createTopic(for: "handling error with if..let")
        if let val = try? divide(2, by: 10){
            print ("val is equal to:", val);
         
        }
        addSpace()
        if let val = try? divide(10, by: 2){
            print ("val is equal to:", val);
        
        }
        addSpace()
        if let val = try? divide(10, by: 0){
            print ("val is equal to:", val);
        }
    }
    static func test5(){
        //Disabling Error Propagation
        createTopic(for:"Disabling Error Propagation")
        
        let x = try! divide(1000, by: 2)
        print("value of x is:", x);
       
    }
    
    
}
