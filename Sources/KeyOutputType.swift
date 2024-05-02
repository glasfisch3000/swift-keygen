import Foundation

enum KeyOutputDestination {
    case stdout(Descriptor?)
    case file(URL)
}

extension KeyOutputDestination {
    enum Descriptor {
        case privateKey
        case publicKey
    }
}

extension KeyOutputDestination.Descriptor: CustomStringConvertible {
    var description: String {
        switch self {
        case .privateKey: "Private Key"
        case .publicKey: "Public Key"
        }
    }
}
