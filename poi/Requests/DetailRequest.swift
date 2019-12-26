//
//  DetailRequest.swift
//  poi
//
//  Created by Teknasyon-S on 19.11.2018.
//  Copyright © 2018 Hazal Eroglu. All rights reserved.
//

import Foundation
import Alamofire

struct DetailRequest {
    var url = "https://api.foursquare.com/v2/"
    var client_id = "RRWIWNV1OAZYSMCRO1JB4QGJKBL05QQY4DGU5YCNSQ5R3ZIA"
    var client_secret = "CLWM4EUVHVUO0XKMKNYVKRSMJ0NLEO0ZCYJRP3YZ020QP4MO"
    var qHeaders: [String] = ["client_id", "client_secret", "v"]
    var v = "20180323"
    var id = ""
    var param: [String] = []
    var parameters: [String] {
        get {
            return [client_id, client_secret, v]
        }
    }
    func makeRequest(closure: @escaping (DetailMainModel?) -> Void ) {
        var req = DetailRequest()
        var url = req.url
        url = url + "venues/"
        req.id = id
        url = url + req.id
        url = url + "?"
        url = url + createQString(req: req)
        Alamofire.request(url).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            //print("Result: \(response.result)")
            if let data = response.data, let jsonString = String(data: data, encoding: .utf8) {
                print("Json: \(jsonString)")
                let jsonData = jsonString.data(using: .utf8)!
                let decoder = JSONDecoder()
                do {
                    let model = try decoder.decode(DetailMainModel.self, from: jsonData)
                    closure(model)
                } catch {
                    print(error)
                    closure(nil)
                }
            }
        }
    }
    func createQString(req: DetailRequest) -> String {
        var qString = ""
        for (index, parameter) in req.parameters.enumerated() {
            if !parameter.isEmpty {
                qString = qString + req.qHeaders[index] + "=" + parameter + "&"
            }
        }
        qString = qString[0..<qString.count-1]
        return qString
    }
}
