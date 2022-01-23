//
//  ArtistService.swift
//  progectOne
//
//  Created by Кацуба Павел Васильевич on 09.01.2022.
//

import Foundation

class APODService {
//    func getApods() -> [Apod] {
//        let apods = [Apod]()
//        getApodDtoList { apodDtos in
//            for apodDto in apodDtos {
//                let imageUrl = apodDto.url
//                getImage(url: imageUrl) {
//                    
//                }
//            }
//    }
    
    func getApodDtoList() async throws -> [ApodDto] {
        print("APODService start getApodDtoList()")
        let session = URLSession(configuration: .default)
        session.configuration.timeoutIntervalForRequest = 10.0
        
        let url2 = "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&count=5"
        var request = URLRequest(url: URL(string: url2)!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = ["Content-Type": "application/json"]
        
        if #available(iOS 15.0, *) {
            let (data, uRLResponse) = try await session.data(for: request)
            let dto = try? JSONDecoder().decode([ApodDto].self, from: data)
            print("converting to ApodDto...")
            print(String(decoding: data, as: UTF8.self))
            print("uRLResponse:\(uRLResponse)")
            return dto!
        } else {
            print("it is not nescaffe!!!")
            return []
        }
    }
    
    func getApodDtoList(completion: @escaping ([ApodDto]) -> Void) {
        print("APODService start getApodDtoList()")
        let session = URLSession(configuration: .default)
        session.configuration.timeoutIntervalForRequest = 10.0
        
        let url2 = "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&count=5"
        var request = URLRequest(url: URL(string: url2)!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = ["Content-Type": "application/json"]
        
//        let queue = DispatchQueue.global(qos: .utility)
//        queue.async {
//            <#code#>
//        }
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("getApodDtoList-> error: \(error)")
                return
            }

            if let response = response, let data = data, let dto = try? JSONDecoder().decode([ApodDto].self, from: data) {
                let httpResponse = response as? HTTPURLResponse
                print("getApodDtoList-> httpResponse: \(String(describing: httpResponse))")
                print(String(decoding: data, as: UTF8.self))
                completion(dto)

                return
            }

            print("getApodDtoList() didn't get any data")
            completion([])
        }

        task.resume()
    }
    
    func getImage(url path: String) async throws -> Data? {
        print("APODService start getImage()")
        if #available(iOS 15.0, *) {
            let (data, _) = try await URLSession.shared.data(from: URL(string: path)!)
            print("getImage -> somr data i guess")
            return data
        } else {
            print("getImage -> nothing??? really??!!")
            return nil
        }
    }
        
    
//    func getImage(url path: String, completion: @escaping (Data) -> Void) {
//        print("APODService start getImage()")
//        URLSession.shared.dataTask(with: URL(string: path)!) { data, response, error in
//            guard let data = data, error == nil else {
//                print("data is empty or error not nil. data.isEmpty:\(data?.isEmpty)")
//                return
//
//            }
//            print("APODService success.")
//            completion(data)
//        }
//    }
}
