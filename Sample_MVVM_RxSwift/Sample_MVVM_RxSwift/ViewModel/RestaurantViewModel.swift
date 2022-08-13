//
//  RestaurantViewModel.swift
//  Sample_MVVM_RxSwift
//
//  Created by Derrick kim on 2022/08/13.
//

struct RestaurantViewModel {
    private let restaurant: Restaurant
    
    var displayText: String {
        return restaurant.name + " - " + restaurant.cuisine.rawValue.capitalized
    }
    
    init(restaurant: Restaurant) {
        self.restaurant = restaurant
    }
}
