import Foundation

struct FetchableImageHelper{
    static func getImageName(from urlString: String) -> String? {
        guard var base64String = urlString.data(using: .utf8)?.base64EncodedString() else { return nil }
        base64String = base64String.components(separatedBy: CharacterSet.alphanumerics.inverted).joined()
     
        guard base64String.count < 50 else {
            return String(base64String.dropFirst(base64String.count - 50))
        }
     
        return base64String
    }
    
    static func loadLocalImage(from urlString: String) -> Data? {
        
        let imageData = FileManager.default.contents(atPath: urlString)
        return imageData
        
    }
    
    static func downloadImage(from url: URL) async -> Data? {
        
        let res = try? await URLSession.shared.data(for: URLRequest(url: url))
        return res?.0
    }
    
}
