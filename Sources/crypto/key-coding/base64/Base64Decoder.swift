import Foundation

/// A decoder that parses PEM-formatted data.
public struct Base64Decoder: KeyDecoder {
    /// Creates a new decoder object.
    public init() { }
    
    public func decodeKey<Key: CryptoKey>(from data: Data, as type: Key.Type) throws -> Key {
        guard let data = Data(base64Encoded: data) else { throw DecodingError.invalidFormat }
        return try Key(rawRepresentation: data)
    }
}
