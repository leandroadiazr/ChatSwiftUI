//
//  StorageManager.swift
//  ChatUI
//
//  Created by Leandro Diaz on 10/10/21.
//

import UIKit
import FirebaseStorage
import FirebaseAuth

class StorageManager {
//    private init() {}
//    static let shared       = FireStorageManager()
    private let storage     = Storage.storage()
//    private let firestore   = FireStoreManager.shared
    private let userManager = UsersManager()
    private lazy var imagesReferences = storage.reference()
    let cache               = NSCache<NSString, UIImage>()
    
//    func uploadProfileImage(user: UserProfile, completion: @escaping (Result<String, ErrorMessages>) -> Void) {
//        let changeProfile = Auth.auth().currentUser?.createProfileChangeRequest()
//        changeProfile?.displayName = user.name
//        let imageURL = URL(string: user.profileImage)
//        changeProfile?.photoURL = imageURL
//        changeProfile?.commitChanges(completion: { (error) in
//            if let unwrappedError = error {
//                completion(.failure(.unableToSaveProfile))
//                print(unwrappedError.localizedDescription)
//            } else {
//                guard let userID = Auth.auth().currentUser?.uid else { return }
//                self.userManager.saveUser(user: user, userID: userID) { (error) in
//                    completion(.success("Profile Saved"))
//                }
//                completion(.success("Profile Saved"))
//            }
//        })
//    }
    
    func uploadSingleImage(_ image: UIImage, completion: @escaping (String) -> Void) {
        let imageRef = imagesReferences.child("images/\(UUID().uuidString).jpg")
    
        //convert image to data
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        imageRef.putData(imageData, metadata: nil) { (_, error) in
            if let unwrappedError = error {
                print("unwrappedError :", unwrappedError)
            } else {
                imageRef.downloadURL { (url, downloadError) in
                    if let unwrappedDownloadError = downloadError {
                        print(unwrappedDownloadError)
                    } else if let unwrappedUrl = url {
                        completion(unwrappedUrl.absoluteString)
                        print(unwrappedUrl.absoluteString)
                    }
                }
            }
        }
    }
    
    func bulkUpload(_ images: [UIImage], completion: @escaping  ([String]) -> Void) {
        let semaphore = DispatchSemaphore(value: images.count)
        var imagesPaths = [String]()
        var counter = 0
        for image in images {
            semaphore.wait()
            uploadSingleImage(image) { (urlPath) in
                imagesPaths.append(urlPath)
                counter += 1
                if counter == images.count {
                    completion(imagesPaths)
                }
                semaphore.signal()
            }
        }
    }
    
    func uploadMessageImage(_ image: UIImage, completion: @escaping (String) -> Void) {
        let imageRef = imagesReferences.child("messageImages/\(UUID().uuidString).jpg")
    
        //convert image to data
        guard let imageData = image.jpegData(compressionQuality: 0.1) else { return }
        
        imageRef.putData(imageData, metadata: nil) { (_, error) in
            if let unwrappedError = error {
                print("unwrappedError :", unwrappedError)
            } else {
                imageRef.downloadURL { (url, downloadError) in
                    if let unwrappedDownloadError = downloadError {
                        print(unwrappedDownloadError)
                    } else if let unwrappedUrl = url {
                        completion(unwrappedUrl.absoluteString)
                        print(unwrappedUrl.absoluteString)
                    }
                }
            }
        }
    }
}