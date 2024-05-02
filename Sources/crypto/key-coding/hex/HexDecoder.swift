import Foundation

/// A decoder that parses hexadecimal data.
public struct HexDecoder: KeyDecoder {
    /// Creates a new decoder object.
    public init() { }
    
    public func decodeKey<Key: CryptoKey>(from data: Data, as type: Key.Type) throws -> Key {
        let data = try Data(hexData: data)
        return try Key(rawRepresentation: data)
    }
}
