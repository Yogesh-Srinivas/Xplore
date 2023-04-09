import Foundation

protocol FetchableImage{
    func fetchImage(
        from imageUrl : String,
        completionHander : @escaping (_ imageData : Data?)->()
    )
}


