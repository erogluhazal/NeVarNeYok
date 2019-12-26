//
//  QueryRequest.swift
//  poi
//
//  Created by Teknasyon-S on 9.11.2018.
//  Copyright © 2018 Hazal Eroglu. All rights reserved.
//

import Foundation
import Alamofire

struct QueryRequest {
    var url = "https://api.foursquare.com/v2/"
    var client_id = "1MKYYTEH1BQGOIRUWSMC2AYVVFQWRISROSFLBY3ZED4AFIR0"
    var client_secret = "QBDJBTKUCAMTXXCM32CUQGP3F1TAEWJMVSQZK1Q1GJU2K2CQ"
    var qHeaders: [String] = ["client_id", "client_secret", "v", "limit", "ll", "query"]
    var v = "20180323"
    var limit = "10"
    var query = ""
    var ll = ""
    var param: [String] = []
    var parameters: [String] {
        get {
            return [client_id, client_secret, v, limit, ll, query]
        }
    }
    func makeRequest(limit: String, ll: String, query: String, closure: @escaping (PoiModel) -> Void ) {
        var req = QueryRequest()
        var url = req.url
        url = url + "venues/search?"
        req.ll = ll
        url = url + createQString(req: req)
        Alamofire.request(url).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            //print("Result: \(response.result)")                         // response serialization result
            if let json = response.result.value {
                //print("JSON: \(json)") // serialized json response
            }
            if let data = response.data, let jsonString = String(data: data, encoding: .utf8) {
                print("Json: \(jsonString)")
                let jsonData = jsonString.data(using: .utf8)!
                let decoder = JSONDecoder()
                do {
                    let model = try decoder.decode(PoiModel.self, from: jsonData)
                    closure(model)
                } catch {
                    print(error)
                }
            }
        }
        // let duration = String(format: "%.01f", PoiModel().response?.groups?[0].items?[0].venue?.location?.lat)
    }
    func createQString(req: QueryRequest) -> String {
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
