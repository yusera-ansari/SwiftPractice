//
//  UrlSessionWithAsyncAwait.swift
//  SwiftPractice
//
//  Created by yusera-ansari on 21/03/25.
//

import Foundation

class UrlSessionWithAsyncAwait:Test, Testable{
    static func appendTests() {
        tests.append(test1)
    }
    static func apiCallForTest1()async{
        do{
            print("inside dispatch")
            let url:URL? = URL(string: "https://fakestoreapi.com/products")
            guard let url = url else{
                print("Url error")
                return;
            }
            let session = try await URLSession.shared.data(from: url)
            print("session: ",session)
            let (data, response) = session;
            print("The fetrieved data: \(String(data:data, encoding: .utf8))")
//            if  let string = String(data: session.0, encoding: .utf8){
//                print("my data: \(string)")
//            }
//
        }
        catch{
            print("an error occurred \(error)")
        }
    }
    static func runTests() {
        super.runTests(with: UrlSessionWithAsyncAwait.self)
    }
    static func test1(){
        Task{
            await apiCallForTest1()
        }
    }
    
    
}
