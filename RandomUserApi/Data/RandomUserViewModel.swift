//
//  RandomUserViewModel.swift
//  RandomUserApi
//
//  Created by 이서영 on 2023/06/07.
//

import Foundation
import Combine
import Alamofire

class RandomUserViewModel : ObservableObject {
    
    // properties
    var subscription = Set<AnyCancellable>()
    
    @Published var randomUsers = [RandomUser]()
    
    var baseUrl = "https://randomuser.me/api/?results=100"
    
    init() {
        print(#fileID, #function, #line, "")
        fetchRandomUsers()
        
    }
    // 파싱
    func fetchRandomUsers() {
        print(#fileID, #function, #line, "" )
        //api 호출
        AF.request(baseUrl)
            //json을 randomuserrresponse로 파싱
            .publishDecodable(type:RandomUserResponse.self)
            .compactMap{ $0.value}  //unlapping
            .map{ $0.results}
        //구독을 통해 이벤트 받게됨.
            .sink(receiveCompletion: { completion in
                print("데이터스트링 완료")
            }, receiveValue: { receivedValue in
                print("받은 값 :\(receivedValue.count)")
                //값을 받았을 때 self.randomusers에 넣게됨
                self.randomUsers = receivedValue
            }).store(in: &subscription)
    }
}
