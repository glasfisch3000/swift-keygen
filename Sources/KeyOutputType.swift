import Foundation

/// A destination that encoded key data can be printed to.
public enum KeyOutputDestination {
    case stdout(Descriptor?)
    case file(URL)
}

extension KeyOutputDestination {
    public enum Descriptor {
        case privateKey
        case publicKey
    }
}

extension KeyOutputDestination.Descriptor: CustomStringConvertible {
    public var description: String {
        switch self {
        case .privateKey: "Private Key"
        case .publicKey: "Public Key"
        }
    }
}
