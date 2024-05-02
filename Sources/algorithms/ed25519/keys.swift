import Foundation
import Crypto

extension Curve25519.Signing.PrivateKey: PrivateKey {
    public typealias RawValue = Data
    
    public func makePublicKey() -> Curve25519.Signing.PublicKey {
        self.publicKey
    }
}

extension Curve25519.Signing.PublicKey: CryptoKey {
    public typealias RawValue = Data
}
