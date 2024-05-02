import Foundation

/// An encoder that outputs base64 encoded data.
public struct Base64Encoder: KeyEncoder {
    /// Creates a new encoder object.
    public init() { }
    
    public func encodeString(key: any CryptoKey) -> String {
        let keyData = Data(key.rawRepresentation)
        return keyData.base64EncodedString()
    }
    
    public func encodeData(key: any CryptoKey) -> Data {
        let keyData = Data(key.rawRepresentation)
        return keyData.base64EncodedData()
    }
}
