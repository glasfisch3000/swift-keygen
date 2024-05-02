import Foundation

/// An encoder that outputs hexadecimal data.
public struct HexEncoder: KeyEncoder {
    /// Creates a new encoder object.
    public init() { }
    
    public func encodeString(key: any CryptoKey) throws -> String {
        let keyData = Data(key.rawRepresentation)
        return try keyData.hexString()
    }
    
    public func encodeData(key: any CryptoKey) throws -> Data {
        let keyData = Data(key.rawRepresentation)
        return try keyData.hexData()
    }
}
