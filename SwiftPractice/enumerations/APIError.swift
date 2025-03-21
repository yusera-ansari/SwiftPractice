//
//  APIError.swift
//  SwiftPractice
//
//  Created by yusera-ansari on 21/03/25.
//


enum APIError:Error{
    case requestFailed(error:String)
    case invalidResponse(response:String)
    case invalidData(error:String)
}
