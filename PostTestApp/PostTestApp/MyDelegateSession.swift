//
//  MyDelegateSession.swift
//  PostTestApp
//
//  Created by Derrick kim on 2022/07/26.
//

import Foundation

// MARK: - URLSession Delegate

class MyDelegateSession: URLSession {
    var receivedData: Data?
    
    lazy var session: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.waitsForConnectivity = true
        return URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
    }()
}

extension MyDelegateSession: URLSessionDataDelegate {
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        
        guard let decodedData = try? JSONDecoder().decode(Products.self, from: data) else { return }
        print("완료됨!")
        
        decodedData.pages.forEach {
//            print($0)
            print($0.name)
//            print("\($0.thumbnail)")
//            print("\($0.price)")
//            print()
        }
        
        self.receivedData?.append(data)
    }
}
