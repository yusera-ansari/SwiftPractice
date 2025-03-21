//
//  UrlSessionTest.swift
//  SwiftPractice
//
//  Created by yusera-ansari on 21/03/25.
//

import Foundation


class UrlSessionWithDispatch:Test, Testable{
    static func appendTests() {
        createTopic(for: "URLseesion tests")
//        tests.append(test1)
//        tests.append(test2)
        tests.append(test3)
               
    }
    
    static func runTests() {
        super.runTests(with:    UrlSessionWithDispatch.self)
    }
    
    static func test1()  {
        print("outside dispatch")
        /*
         1. Simple GET Request
         Problem: Write a Swift function that uses URLSession to perform a GET request to fetch data from a given URL and prints the response (e.g., JSON data).
         
         Requirements:
         
         Use URLSession.shared.dataTask to fetch data from a URL.
         Handle errors appropriately and print any errors.
         Print the fetched data as a string for verification.
         */
        
        DispatchQueue.global().async {
            print("inside dispatch")
            let url:URL? = URL(string: "https://fakestoreapi.com/products")
            guard let url = url else{
                print("Url error")
                return;
            }
            let session = URLSession.shared.dataTask(with: url){
                data, response, error in
                print("inside the resonse handler")
                
                if  let error = error {
                    print("An error occurred! \(error)")
                    return;
                    
                }
                
                guard let response = response as? HTTPURLResponse,
                      (200...299).contains(response.statusCode) else{
                    print("thers a server error!!");
                    return;
                }
                
                if let mimeType = response.mimeType, mimeType == "application/json",
                   let data = data,
                   let string = String(data: data, encoding: .utf8){
                    print(data, response.statusCode, string)
                }
            }
            session.resume()
        }
//        RunLoop.main.run()
        
    }
    
    static func test2(){
        /*
         2. POST Request with JSON Data
         Problem: Write a Swift function that sends a POST request with JSON data (e.g., user login credentials) to a URL and prints the response.
         
         Requirements:
         
         Send a POST request with JSON in the body.
         Set appropriate HTTP headers (e.g., Content-Type: application/json).
         Handle the response and print the returned data.
         Properly handle any errors that occur during the request.
         
         */
        
        let url = URL(string: "https://fakestoreapi.com/products");
        var request = URLRequest(url: url!);
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let data = Product(id: 1, title: "test", price: 110.0, description: "This is a test product by yusera", category: "jewelery", image: "hhtps://unsplash.com/image.png");
        
        guard let jsonData = try? JSONEncoder().encode(data) else{
            print("Error in json data parsing: ")
            return
        }
        
        request.httpBody = jsonData;
        DispatchQueue.global().async {
            
            let session = URLSession.shared.dataTask(with: request){
                data, response, error in
                if let error = error {
                    print("Error occurred: ",error)
                    return ;
                }
                
                guard let response = response as? HTTPURLResponse,
                      (200...299).contains(response.statusCode)
                else{
                    print("response error: ")
                    return;
                }
                
                if let mimeType = response.mimeType, mimeType == "application/json", let data = data,
                   let string = String(data: data, encoding: .utf8){
                    print("This is response data for test 2: ", string, response.statusCode)
                    
                }
                
                
                
                
            }
            session.resume()
        }
     
    }
    
    
    //test3
    
    enum RequestType{
        case postsUrl, usersUrl, commentsUrl
    }
    func makeAPICall(url:URL, for request: RequestType, with dispatchGroup:DispatchGroup, complete: @escaping (String)->() ){
        URLSession.shared.dataTask(with: url) {
            data, response, error   in
            defer{
                dispatchGroup.leave()
            }
            do{
                if let error = error{
                    throw APIError.requestFailed(error: "\(request)  failed with error: \(error.localizedDescription)")
                    
                }
                
                guard let response = response as? HTTPURLResponse,
                      (200...299).contains(response.statusCode) else{
                    throw APIError.invalidResponse(response: " \(request) failed: the response is invalid \(response) response code:  ")
                      
                }
                guard let data = data, let string = String(data: data, encoding: .utf8) else{
                    throw APIError.invalidData(error: "\(request) failed Invalid data: \(data)")
                }
//                print(string)
                complete(string)
                
            }catch{
                
            }
        }.resume()
    }
    static func test3()   {
        /*
         Problem: Concurrent API Requests
         Goal: Write a Swift function that fetches data from multiple API endpoints concurrently and combines the results into a single response.
         */
        let postsURL = URL(string: "https://jsonplaceholder.typicode.com/posts")!
           let usersURL = URL(string: "https://jsonplaceholder.typicode.com/users")!
           let commentsURL = URL(string: "https://jsonplaceholder.typicode.com/comments")!
           
        let dispatchGroup = DispatchGroup();
        var apiResponse = APIResponseData();
       
         
        let urlSessionDispatchObj = UrlSessionWithDispatch();
        dispatchGroup.enter()
        urlSessionDispatchObj.makeAPICall(url: postsURL, for: RequestType.postsUrl, with: dispatchGroup){
            (data) in
             
                apiResponse.posts=data
            
        }
        dispatchGroup.enter()
        
        urlSessionDispatchObj.makeAPICall(url: usersURL, for: RequestType.usersUrl, with: dispatchGroup){
            (data) in
             print("printing......")
            apiResponse.users=data
            
        }
        dispatchGroup.enter()
        urlSessionDispatchObj.makeAPICall(url: commentsURL, for: RequestType.commentsUrl, with: dispatchGroup){
            (data) in
             
            apiResponse.comments=data
            
        }
           
        dispatchGroup.notify(queue: .main ){
            print(apiResponse)
        }
           
        RunLoop.main.run()
        
    }
    
    
    }

