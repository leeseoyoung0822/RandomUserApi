//
//  File.swift
//  RandomUserApi
//
//  Created by 이서영 on 2023/06/06.
//

import Foundation
import SwiftUI
import URLImage

struct ProfileImgView : View {
    
    var imageUrl : URL
    // 프로필 이미지 뷰
    var body: some View {

        URLImage(imageUrl) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .frame(width: 50, height: 60)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.init(UIColor.orange), lineWidth: 2))
    }
}


struct ProfileImgViewP_Previews: PreviewProvider {
    static var previews: some View {
        
        let url = URL(string:
            "https://randomuser.me/api/portraits/women/54.jpg")!
        
        
        ProfileImgView(imageUrl: url)
    }
}
