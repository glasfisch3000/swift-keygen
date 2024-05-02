import Foundation
import Crypto

internal func keyread_private_ed25519(url: URL) throws -> Curve25519.Signing.PrivateKey {
    let data = try Data(contentsOf: url)
    
    let pathExtension = url.pathExtension
    if !pathExtension.isEmpty, pathExtension.lowercased() == "pem" {
        let decoder = PEMDecoder(contentTypes: pemContentTypes)
        return try decoder.decodeKey(from: data, as: Curve25519.Signing.PrivateKey.self)
    } else {
        for decoder in defaultDecoders {
            if let key = try? decoder.decodeKey(from: data, as: Curve25519.Signing.PrivateKey.self) { return key }
        }
        throw KeyDecodingError.unknownFormat
    }
}

// file constants
fileprivate let pemContentTypes: [PEMContentType] = [.privateKey, .ecPrivateKey, .anyPrivateKey]
fileprivate let defaultDecoders: [any KeyDecoder] = [
    PEMDecoder(contentTypes: pemContentTypes),
    Base64Decoder()
]
