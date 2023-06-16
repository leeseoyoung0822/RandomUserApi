//
//  ContentView.swift
//  RandomUserApi
//
//  Created by 이서영 on 2023/06/06.
//

import SwiftUI

struct ContentView: View {
    // 뷰 모델 생성
    @ObservedObject var randomUserViewModel = RandomUserViewModel()
    
    
    var body: some View {
        //하나씩 가져와서 변경될때마다 view를 그림
        List(randomUserViewModel.randomUsers){ aRandomUser in RandomUserRowView(aRandomUser) //뷰를 그릴 땐 여기를 들어감.
        }
//        List(0...100, id: \.self){ index in
//            RandomUserRowView()
//
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
