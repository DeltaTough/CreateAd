//
//  CreateAdViewModel.swift
//  CreateAd
//
//  Created by Dimitrios Tsoumanis on 22/03/2024.
//

import Combine
import SwiftUI

final class CreateAdViewModel: ObservableObject {
    @Published var description = ""
    @Published var locations: [Location] = []
    @Published var location = ""
    @Published var locationID = ""
    @Published var price = ""
    @Published var title = ""
    @Published var formIsValid = false
    @Published var showMenu = false
    @Published var showModalCreateAd = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        $location
            .filter { $0.trimmingCharacters(in: .whitespacesAndNewlines).count > 2 }
            .debounce(for: 0.3, scheduler: RunLoop.main)
            .map { input in
                getLocations(for: input)
                    .replaceError(with: [])
            }
            .switchToLatest()
            .receive(on: RunLoop.main)
            .assign(to: &$locations)
        
        isFormValidPublisher
            .receive(on: RunLoop.main)
            .assign(to: &$formIsValid)
        
        $location
            .sink(receiveValue: { [weak self] in
                guard let self = self else { return }
                if !$0.isEmpty { self.showMenu = true }
            })
            .store(in: &cancellables)
        
        $locations
            .sink(receiveValue: { [weak self] in
                guard let self = self else { return }
                if $0.map({ $0.id }).contains(self.locationID) {
                    self.showMenu = false
                }
            })
            .store(in: &cancellables)
        
        isLocationAvailablePublisher
            .receive(on: RunLoop.main)
            .assign(to: &$showMenu)
            
    }
    
    var isTitleAvailablePublisher: some Publisher<Bool, Never> {
        $title
            .map { title in
                return title.trimmingCharacters(in: .whitespacesAndNewlines).count > 0
            }
            .eraseToAnyPublisher()
    }
    
    var isLocationAvailablePublisher: some Publisher<Bool, Never> {
        $location
            .map { location in
                return location.trimmingCharacters(in: .whitespacesAndNewlines).count > 3
            }
            .eraseToAnyPublisher()
    }
    
    var isFormValidPublisher: some Publisher<Bool, Never> {
        Publishers.CombineLatest(
            isTitleAvailablePublisher,
            isLocationAvailablePublisher
        ).map { isTitleValid, isLocationValid in
            return isTitleValid && isLocationValid
        }
        .eraseToAnyPublisher()
    }
    
    func submit() {
        showModalCreateAd = true
    }
    
    func clearAll() {
        title = ""
        location = ""
        price = ""
        description = ""
    }
}
