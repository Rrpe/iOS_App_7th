//
//  OnDemandBookDetailsViewWithClosures.swift
//  CombineFirebaseBookShelf
//
//  Created by KimJunsoo on 4/9/25.
//

import Combine
import SwiftUI
import FirebaseFirestore

private class BookListViewModel: ObservableObject {
    @Published var books: [Book] = []
    @Published var errorMessage: String?
    
    private var db = Firestore.firestore()
    
    init() {
        db.collection("books").snapshotPublisher()
        /*.tryMap { querySnapshot in
         try querySnapshot.documents.compactMap { documentSnapshot in
         try documentSnapshot.data(as: Book.self)
         }
         }*/
            .map { querySnapshot in
                querySnapshot.documents.compactMap { documentSnapshot in
                    try? documentSnapshot.data(as: Book.self)
                }
            }
            .catch { [weak self] error in
                self?.errorMessage = error.localizedDescription
                return Just([Book]()).eraseToAnyPublisher()
            }
            .replaceError(with: [Book]())
            .handleEvents(receiveCancel: {
                print("Cancelled 2")
            })
            .assign(to: &$books)
    }
}

struct CombineBookListView: View {
    @StateObject private var viewModel = BookListViewModel()
    
    var body: some View {
        List(viewModel.books) { book in
            Text(book.title)
        }
        .navigationTitle("Book List")
    }
}
