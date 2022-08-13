//
//  YagomAcademy.swift
//  SamplePOP
//
//  Created by Derrick kim on 2022/06/30.
//

import Foundation
//    상황 1 : 야곰 아카데미 구성원 각각의 역할을 표현하고 싶을 때 (ex : 캠퍼, 크루, 리더, 매니저, 서포터, 리뷰어 등)

protocol AccessDiscord {
    func connect()
}

extension AccessDiscord {
    func connect() {
        print("연결한다")
    }
}

protocol PostNotification {
    func notify(to camper: String)
}

extension PostNotification {
    func notify(to camper: String) {
        print("\(camper)에게 공지사항을 알립니다.")
    }
}

struct Camper: AccessDiscord {
    
}

struct Crew: AccessDiscord, PostNotification {
    func connect() {
        print("크루 섹션에 연결합니다")
    }
}

struct Leader: AccessDiscord, PostNotification {
    func connect() {
        print("리더 섹션에 연결합니다")
    }
}


