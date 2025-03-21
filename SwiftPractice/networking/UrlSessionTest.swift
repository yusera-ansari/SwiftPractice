//
//  UrlSessionTest.swift
//  SwiftPractice
//
//  Created by yusera-ansari on 21/03/25.
//

import Foundation


class UrlSessionTest:Test, Testable{
    static func appendTests() {
        createTopic(for: "URLseesion tests")
        tests.append(test1)
//        RunLoop.main.run()
    }
    
    static func runTests() {
        super.runTests(with:    UrlSessionTest.self)
    }
    static func apiCall()async{
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
    static func test1()  {
        print("outside dispatch")
        Task{
            await apiCall()
        }
        
        
        DispatchQueue.global().async {
//            print("inside dispatch")
//            let url:URL? = URL(string: "https://fakestoreapi.com/products")
//            guard let url = url else{
//                print("Url error")
//                return;
//            }
//            let session = URLSession.shared.dataTask(with: url){
//                data, response, error in
//                print("inside the resonse handler")
//                if  let error = error {
//                    print("An error occurred! \(error)")
//                    return;
//                    
//                }
//                
//                guard let response = response as? HTTPURLResponse,
//                      (200...299).contains(response.statusCode) else{
//                    print("thers a server error!!");
//                    return;
//                }
//                if let mimeType = response.mimeType, mimeType == "application/json",
//                   let data = data,
//                   let string = String(data: data, encoding: .utf8){
//                    print(data, response.statusCode, string)
//                }
//            }
//            session.resume()
//         
            
        }
        RunLoop.main.run()
        
    }
    
    
}
