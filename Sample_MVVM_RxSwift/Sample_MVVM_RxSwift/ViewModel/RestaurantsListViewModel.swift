//
//  RestaurantsListViewModel.swift
//  Sample_MVVM_RxSwift
//
//  Created by Derrick kim on 2022/08/13.
//

import RxSwift

final class RestaurantsListViewModel {
    let title = "Restaurants"
    
    private let restaurantService: RestaurantServiceProtocol
    
    init(restaurantService: RestaurantService = RestaurantService()) {
        self.restaurantService = restaurantService
    }
    
    @discardableResult
    func fetchRestaurantViewModels() -> Observable<[RestaurantViewModel]> {
        restaurantService.fetchRestaurants().map { restaurants in
            restaurants.map { restaurant in
                RestaurantViewModel(restaurant: restaurant)
            }
        }
    }
}
