enum Algorithm: String {
    case rsa
    case ed25519
}

extension Algorithm: Hashable { }
extension Algorithm: Codable { }

extension Algorithm {
    init?(rawValue: String) {
        switch rawValue.lowercased() {
        case "rsa": self = .rsa
        case "ec25519", "ed25519", "25519": self = .ed25519
        default: return nil
        }
    }
}
