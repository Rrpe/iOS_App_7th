//
//  OnDemandBookDetailsViewWithClosures.swift
//  CombineFirebaseBookShelf
//
//  Created by KimJunsoo on 4/9/25.
//

import SwiftUI
import FirebaseFirestore

private class BookListViewModel: ObservableObject {
    @Published var books: [Book] = []
    @Published var errorMessage: String?
    
    private var db = Firestore.firestore()
    
    fileprivate func fetchBooks() {
        db.collection("books").getDocuments { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                self.errorMessage = error?.localizedDescription
                return
            }
            
            self.books = documents.compactMap { [weak self] querySnapshotDocument in
                let result = Result { try querySnapshotDocument.data(as: Book.self) }
                switch result {
                case .success(let book):
                    self?.errorMessage = nil
                    return book
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    return nil
                }
            }
        }
    }
}

struct ClosuresBookListView: View {
    @StateObject private var viewModel = BookListViewModel()
    
    var body: some View {
        List(viewModel.books) { book in
            Text(book.title)
        }
        .task {
            viewModel.fetchBooks()
        }
        .navigationTitle("Book List")
    }
}
