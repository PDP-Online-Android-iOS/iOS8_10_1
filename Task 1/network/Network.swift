//
//  AFHttp.swift
//  Task 1
//
//  Created by Ogabek Matyakubov on 17/01/23.
//

import Foundation
import Alamofire

private let IS_TESTER = true
private let DEV_SERVER = "https://jsonplaceholder.typicode.com"
private let DEP_SERVER = "https://jsonplaceholder.typicode.com"

let headers: HTTPHeaders = [
    "Accept": "application/json"
]

class Network {
    
    // MARK: - Network Requests
    
    class func get(url: String, params: Parameters, handler: @escaping (AFDataResponse<Any>) -> Void) {
        AF.request(server(url: url), method: .get, parameters: params, headers: headers).validate(statusCode: 200..<500).responseJSON(completionHandler: handler)
    }
    
    class func post(url: String, params: Parameters, handler: @escaping (AFDataResponse<Any>) -> Void) {
        AF.request(server(url: url), method: .post, parameters: params, headers: headers).validate(statusCode: 200..<500).responseJSON(completionHandler: handler)
    }
    
    class func put(url: String, params: Parameters, handler: @escaping (AFDataResponse<Any>) -> Void) {
        AF.request(server(url: url), method: .put, parameters: params, headers: headers).validate(statusCode: 200..<500).responseJSON(completionHandler: handler)
    }
    
    class func del(url: String, params: Parameters, handler: @escaping (AFDataResponse<Any>) -> Void) {
        AF.request(server(url: url), method: .delete, parameters: params, headers: headers).validate(statusCode: 200..<500).responseJSON(completionHandler: handler)
    }
    
    // MARK: - Server Function
    
    class func server(url: String) -> URL {
        if IS_TESTER {
            return URL(string: DEV_SERVER + url)!
        } else {
            return URL(string: DEP_SERVER + url)!
        }
    }
    
    // MARK: - APIs
    
    static let API_POST_LIST = "/posts"
    
    // More APIs that you need
    
    // MARK: - Parameters
    
    class func emptyParams() -> Parameters {
        return [:]
    }
    
    // More Parameters that you need
    
}
