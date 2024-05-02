import Foundation

/// An object that can be used to decode cryptographic keys from a specific format.
public protocol KeyDecoder {
    /// Decodes a key from raw data`.
    func decodeKey<Key: CryptoKey>(from data: Data, as type: Key.Type) throws -> Key
}
