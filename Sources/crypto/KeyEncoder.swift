import Foundation

/// An object that can be used to encode cryptographic keys in a specific format.
public protocol KeyEncoder {
    /// Encodes the supplied key to a `String`.
    func encodeString(key: any CryptoKey) throws -> String
    /// Encodes the supplied key to raw data.
    func encodeData(key: any CryptoKey) throws -> Data
}
