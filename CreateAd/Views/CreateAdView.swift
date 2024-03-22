//
//  CreateAdView.swift
//  CreateAd
//
//  Created by Dimitrios Tsoumanis on 21/03/2024.
//

import Combine
import SwiftUI

struct CreateAdView: View {
    @ObservedObject private var viewModel: CreateAdViewModel
    
    init(viewModel: CreateAdViewModel = CreateAdViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("New Property Classified").font(.headline)
                    .padding(.bottom, 30)
                RowView(sectionName: "Title", typingElement: $viewModel.title)
                RowView(sectionName: "Location", typingElement: $viewModel.location)
                if viewModel.showMenu {
                    ScrollView(showsIndicators: false) {
                        ForEach(viewModel.locations, id: \.id) { location in
                            VStack(alignment: .leading) {
                                Text("\(location.mainText), "+"\(location.secondaryText)")
                                    .padding(.horizontal)
                                Divider()
                            }
                            .onTapGesture {
                                viewModel.location = "\(location.mainText), "+"\(location.secondaryText)"
                                viewModel.locationID = location.id
                                withAnimation {
                                    self.viewModel.showMenu.toggle()
                                }
                            }
                        }
                    }
                }
                RowView(sectionName: "Price", typingElement: $viewModel.price)
                    .keyboardType(.numberPad)
                RowView(sectionName: "Description", lineLimit: 2..., typingElement: $viewModel.description)
                HStack {
                    Spacer()
                    Button("Submit") {
                        viewModel.submit()
                    }
                    .sheet(isPresented: $viewModel.showModalCreateAd, onDismiss: {
                        viewModel.clearAll()
                    }, content: {
                        SheetView(newAd: NewlyCleatedAd(title: viewModel.title,
                                                        location: viewModel.location,
                                                        price: viewModel.price,
                                                        description: viewModel.description
                                                       )
                        )
                    })
                    .buttonStyle(CustomButton(backgroundColor: .green,
                                              formIsValid: $viewModel.formIsValid))
                    .padding(.trailing)
                    Button("  Clear  ") {
                        viewModel.clearAll()
                    }
                    .buttonStyle(CustomButton(backgroundColor: .red,
                                              formIsValid: $viewModel.formIsValid))
                    Spacer()
                }
                .padding(.top, 30)
            }
        }
        .padding()
        .foregroundColor(.black)
        .background(.white)
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    CreateAdView()
}


