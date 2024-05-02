import Foundation

public enum KeyEncoding {
    case base64
    case pem(type: PEMContentType)
}

extension KeyEncoding: Hashable { }
extension KeyEncoding: Codable { }

extension CryptoKey {
    public func encode(with encoding: KeyEncoding) throws -> Data {
        switch encoding {
        case .base64: return encodeBase64()
        case .pem(let type): return try encodePEM(as: type)
        }
    }
}
