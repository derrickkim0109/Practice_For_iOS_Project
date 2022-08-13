//
//  ViewController.swift
//  PostTestApp
//
//  Created by LeeChiheon on 2022/07/14.
//

import UIKit

struct Secret: Codable {
    let secret: String
}

class ViewController: UIViewController {
    
    let url = "https://market-training.yagom-academy.kr/api/products"
    let identifier = "fcf9c25a-0335-11ed-9676-09473f3f26fd"
    let secret = "zuGLbBAqks"

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        callHTTPMethodPost()
        
//        callDeleteSecetNumber{ result in
//            switch result {
//            case .success(let data):
//                print(data)
//            case .failure(let error):
//                break
//            }
//        }
        
//        deletePost { error in
//            print(error)
//        }
        patchData { result in
            switch result {
            case .success(let data):
                print("data: \(data)")
            case .failure(let error):
                print("error: \(error)")
            }
        }
    }
    

}

// MARK: - PATCH METHOD

extension ViewController {
    func patchData(completion: @escaping (Result<Data,Error>) -> Void) {
        var component = URLComponents()
        component.scheme = "https"
        component.host = "market-training.yagom-academy.kr"
        component.path = "/api/products/\(3998)"
        var deleteRequest = URLRequest(url: component.url!)
        
        do{
           let json: [String: Any] = [
            "thumbnail_id": 4372,
            
            "stock": 1,
            "secret": self.secret
           ]
            
            let jsonData = try JSONSerialization.data(withJSONObject: json, options: [])
            
            deleteRequest.httpBody = jsonData
            deleteRequest.httpMethod = "PATCH"
            deleteRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            deleteRequest.addValue(self.identifier, forHTTPHeaderField: "identifier")
            
            print("jsonData: ", String(data: deleteRequest.httpBody!, encoding: .utf8) ?? "no body data")
        } catch {
            print("ERROR")
        }

        let task = URLSession.shared.dataTask(with: deleteRequest as URLRequest) {
            data, response, error in

            if error != nil {
                print("error=\(error)")
                
                return
            }

            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("responseString = \(responseString!)")
            
            return
        }
        task.resume()
    }
}


// MARK: - DELETE METHOD

extension ViewController {
    func callDeleteSecetNumber(completion: @escaping (Result<Secret,Error>) -> Void) {
        var component = URLComponents()
        component.scheme = "https"
        component.host = "market-training.yagom-academy.kr"
        component.path = "/api/products/\(3992)/secret"
        
        var deleteRequest = URLRequest(url: component.url!)
        deleteRequest.httpMethod = "POST"
        
        do {
            let param = ["secret" : self.secret]
            let dataBody = try JSONSerialization.data(withJSONObject: param, options: .init())
            
            deleteRequest.httpBody = dataBody
            deleteRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            deleteRequest.addValue(self.identifier, forHTTPHeaderField: "identifier")
            
            URLSession.shared.dataTask(with: deleteRequest) { (data, response, error) in
                guard let data = data else { return }
                
                print(String(data: data, encoding: .utf8)!)

            }.resume()
    
        } catch {
            completion(.failure(error))
        }
     
    }
        
    func deletePost(completion: @escaping (Error?) -> ()) {
        let productSecret = "c60d968e-0d74-11ed-9676-c37b0f81c8ae"
        var component = URLComponents()
        component.scheme = "https"
        component.host = "market-training.yagom-academy.kr"
        component.path = "/api/products/\(3992)/\(productSecret)"
        
        var deleteRequest = URLRequest(url: component.url!)
        deleteRequest.httpMethod = "DELETE"
        deleteRequest.setValue("application/json", forHTTPHeaderField: "Content-type")
        deleteRequest.addValue(identifier, forHTTPHeaderField: "identifier")
        
        URLSession.shared.dataTask(with: deleteRequest) { (data, response, error) in
            DispatchQueue.main.async {
                print("success")
            }
        }.resume()
    }
}


extension ViewController {
    func callHTTPMethodGetData() {
        // MARK: - URLSession Completion Handler
        
        var urlComponent: URLComponents! = URLComponents(string: url)
        urlComponent.queryItems = [
            URLQueryItem(name: "page_no", value: "1"),
            URLQueryItem(name: "items_per_page", value: "10")
        ]
        
        let urlComponentURL: URL! = urlComponent.url
        let request = URLRequest(url: urlComponentURL)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            let decodedData = try! JSONDecoder().decode(Products.self, from: data!)
            
            decodedData.pages.forEach {
                print("\($0.name)")
                print("\($0.thumbnail)")
                print("\($0.price)")
                print()
            }
        }
        //task.resume()
                
        let configuration = URLSessionConfiguration.default
        configuration.waitsForConnectivity = true
        
        let delegateSession = MyDelegateSession()
        
        let myDelegateSession = URLSession(configuration: configuration, delegate: delegateSession, delegateQueue: nil)
        
        let myTask = myDelegateSession.dataTask(with: request)
        
        //let tasktask = delegateSession.session.dataTask(with: request)
        
//        myTask.resume()
        
        //tasktask.resume()
    }
    
    func callHTTPMethodPost() {
        
        // MARK: - Multi form-data
        let parameters = Parameters(name: "내가 가지고 있는 애플마우스", descriptions: "1", price: 9000000000, currency: .USD, secret: secret, discounted_price: 1000, stock: 1)
        
        guard let image = Image(withImage: #imageLiteral(resourceName: "mouse")),
              let url = URL(string: self.url) else { return }
        
        var postRequest = URLRequest(url: url)
        postRequest.httpMethod = "POST"
        
        let boundary = generateBoundary()
        
        postRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        postRequest.addValue(self.identifier, forHTTPHeaderField: "identifier")
        
        let dataBody = createDataBody(withParameters: parameters, images: [image, image, image], boundary: boundary)
        print(String(decoding: dataBody, as: UTF8.self))
        postRequest.httpBody = dataBody
        
        let session = URLSession.shared
        let postDataTask = session.dataTask(with: postRequest) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
        }
        
        postDataTask.resume()
    }
    
    // MARK: - generateBoundary
    func generateBoundary() -> String {
        return "Boundary-\(UUID().uuidString)"
    }
    
    // MARK: - createDataBody
    func createDataBody(withParameters params: Parameters, images: [Image]?, boundary: String) -> Data {
        let lineBreak = "\r\n"
        var body = Data()
        
        // parameter 넣기
        body.append("--\(boundary + lineBreak)")
        body.append("Content-Disposition: form-data; name=\"\(Parameters.key)\"\(lineBreak + lineBreak)")
        body.append("\(params.returnParamatersString() + lineBreak)")
        
        // image 넣기
        if let images = images {
            for image in images {
                body.append("--\(boundary + lineBreak)")
                body.append("Content-Disposition: form-data; name=\"\(Image.key)\"; filename=\"\(image.filename)\"\(lineBreak)")
                body.append("Content-Type: \(image.mimeType + lineBreak + lineBreak)")
                body.append(image.data)
                body.append(lineBreak)
            }
        }
        
        // 끝났다고 표시해주기
        body.append("--\(boundary)--\(lineBreak)")
        
        return body
    }
    
    
}

// Data에 String을 추가해주는 메서드 정의
extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            self.append(data)
        }
    }
}
