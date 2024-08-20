//
//  FirestoreService.swift
//  MainBoard
//
//  Created by Satvik Viriyala on 01/08/24.
//
//
//import Foundation
//import FirebaseFirestore
//
//class FirestoreService {
//    private let db = Firestore.firestore()
//
//    func fetchCommunities(completion: @escaping (Result<[Community], Error>) -> Void) {
//        db.collection("communities").getDocuments { (querySnapshot, error) in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//
//            guard let snapshot = querySnapshot else {
//                completion(.failure(NSError(domain: "FirestoreError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Snapshot is nil"])))
//                return
//            }
//
//            var communities = [Community]() // Array to hold successful decodings
//            var errors = [Error]() // Array to hold errors
//
//            for document in snapshot.documents {
//                do {
//                    let community = try document.data(as: Community.self)
//                    communities.append(community) // Append successful decoding
//                } catch {
//                    print("Error decoding document: \(document.data()) Error: \(error)") // Print the error and the document data
//                    errors.append(error)
//                }
//            }
//            if errors.isEmpty {
//                completion(.success(communities))
//            } else {
//                completion(.failure(errors.first!)) // Return the first error encountered
//            }
//        }
//    }
//}
