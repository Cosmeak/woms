//
//  BooksView.swift
//  woms
//
//  Created by Guillaume FINE on 20/11/2023.
//

import SwiftUI

struct BooksView: View {
    @StateObject var viewModel = BooksViewModel()
    
    var body: some View {
        NavigationView(content: {
            VStack(content: {
                List {
                    ForEach (viewModel.books) { book in
                        HStack {
                            Text(book.title)
                            Button {
                                viewModel.removeBook(book)
                            } label: {
                                Image(systemName: "trash.fill")
                                    .foregroundStyle(Color.red)
                            }
                        }
                    }
                }
            })
            .navigationTitle("Books")
            .toolbar {
                Button {
                    viewModel.createBookIsShowed = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.createBookIsShowed, content: {
                CreateBookView(isShowed: $viewModel.createBookIsShowed, books: $viewModel.books)
            })
        })
    }
}

#Preview {
    BooksView()
}
