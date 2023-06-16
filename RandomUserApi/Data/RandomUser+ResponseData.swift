//
//  RandomUser+ResponseData.swift
//  RandomUserApi
//
//  Created by 이서영 on 2023/06/07.
//

import Foundation

struct RandomUser : Codable, Identifiable, CustomStringConvertible {
    var id = UUID()
    var name : Name
    var photo : Photo
    // 이름 바꾸고 싶을 때
    private enum CodingKeys : String, CodingKey {
        case name = "name"
        case photo = "picture"
    }
    static func getDummy() -> Self {
        print(#fileID, #function, #line, "" )
        return RandomUser(name : Name.getDummy(), photo : Photo.getDummy())
    }
    
    var profileImgUrl : URL {
        get {
            URL(string: photo.medium)!
        }
    }
    
    var description: String {
        return  name.description
    }
}

struct Name : Codable, CustomStringConvertible {
    var title : String
    var first : String
    var last : String
    
    var description: String {
        return  "[\(title)] \(last), \(first)"
    }
    static func getDummy() -> Self {
        print(#fileID, #function, #line, "" )
        return Name(title : "학생", first: "이서영", last: "2020125046")
    }
}

struct Photo : Codable {
    var large : String
    var medium : String
    var thumbnail : String
    static func getDummy() -> Self {
        print(#fileID, #function, #line, "" )
        return Photo(large: "https://randomuser.me/api/portraits/men/36.jpg", medium: "https://randomuser.me/api/portraits/men/36.jpg", thumbnail: "https://randomuser.me/api/portraits/men/36.jpg")
    }
}


struct Info : Codable {
    var seed : String
    var resultsCount : Int
    var page : Int
    var version : String
    private enum CodingKeys : String, CodingKey {
        case seed = "seed"
        case resultsCount = "results"
        case page = "page"
        case version = "version"
    }
}

struct RandomUserResponse : Codable, CustomStringConvertible {
    var results : [RandomUser]
    var info : Info
    private enum CodingKeys : String, CodingKey {
        case results, info
    }
    var description: String{
        return "results.count: \(results.count) / info : \(info.seed)"
    }

}
