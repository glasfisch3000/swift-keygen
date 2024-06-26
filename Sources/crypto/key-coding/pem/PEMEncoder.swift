import Foundation

/// An encoder that outputs PEM-formatted data.
public struct PEMEncoder: KeyEncoder {
    /// The type identifier of the encoded keys.
    public var contentType: PEMContentType
    
    /// Creates a new encoder object with a specified content type.
    public init(contentType: PEMContentType) {
        self.contentType = contentType
    }
}

extension PEMEncoder {
    public func encodeString(key: any CryptoKey) -> String {
        let keyData = Data(key.rawRepresentation)
        let base64 = keyData.base64EncodedString()
        
        let prefix = "----- BEGIN \(contentType.rawValue) -----"
        let suffix = "----- END \(contentType.rawValue) -----"
        
        return prefix + "\n" + base64 + "\n" + suffix
    }
    
    public func encodeData(key: any CryptoKey) throws -> Data {
        let stringToEncode = encodeString(key: key)
        
        guard let encodedData = stringToEncode.data(using: .utf8) else { throw EncodingError.utf8EncodingFailed }
        return encodedData
    }
}
