//
//  Pokemon.swift
//  SamplePOP
//
//  Created by Derrick kim on 2022/06/30.
//

import Foundation

// 상황 4 : 포켓몬(피카츄, 라이츄, 파이리, 꼬부기, 또가스, 또도가스, 잉어킹, 갸라도스 등등)을 표현하고 싶을

protocol WalkWithTwoLegs {
    func walkWithTwoLegs()
}

extension WalkWithTwoLegs {
    func walkWithTwoLegs() {
        print("두 발로 걷습니다.")
    }
}
protocol WalkWithFourLegs {
    func walkWithFourLegs()
}

extension WalkWithFourLegs {
    func walkWithFourLegs() {
        print("네 발로 걷습니다.")
    }
}

protocol Flying {
    func fly()
}

extension Flying {
    func fly() {
        print("날아다닙니다.")
    }
}

protocol Swimming {
    func swim()
}

extension Swimming {
    func swim() {
        print("헤엄칩니다.")
    }
}

struct Pikachu: WalkWithTwoLegs, WalkWithFourLegs {
    private var health: Int = 100
    
    func walk() {
        if health <= 50 {
            walkWithFourLegs()
        } else {
            walkWithTwoLegs()
        }
    }
}

struct Charmander: WalkWithFourLegs {
    
}

struct AgainGas: Flying {
    
}

struct FishKing: Swimming {
    
}



