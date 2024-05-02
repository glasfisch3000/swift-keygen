import Foundation

public protocol CryptoKey: RawRepresentable where RawValue: DataProtocol {
    var rawRepresentation: RawValue { get }
    init(rawRepresentation: RawValue) throws
}

public protocol PrivateKey: CryptoKey {
    associatedtype PublicKey: CryptoKey
    
    func makePublicKey() -> PublicKey
}


// default implementations
extension CryptoKey {
    public var rawValue: RawValue { rawRepresentation }
    
    public init?(rawValue: RawValue) {
        try? self.init(rawRepresentation: rawValue)
    }
}
