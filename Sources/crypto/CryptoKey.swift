import Foundation

/// A cryptographic key, representable as a `DataProtocol` type.
public protocol CryptoKey: RawRepresentable where RawValue == Data {
    /// Provides access to the underlying raw data.
    var rawRepresentation: RawValue { get }
    
    /// Initializes a key object by trying to parse raw data.
    init(rawRepresentation: RawValue) throws
}

/// A cryptographic key with a corresponding public key.
public protocol PrivateKey: CryptoKey {
    /// The corresponding public key type.
    associatedtype PublicKey: CryptoKey
    
    /// Creates a corresponding public key.
    func makePublicKey() -> PublicKey
}


// default implementations
extension CryptoKey {
    public var rawValue: RawValue { rawRepresentation }
    
    public init?(rawValue: RawValue) {
        try? self.init(rawRepresentation: rawValue)
    }
}
