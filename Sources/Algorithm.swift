import ArgumentParser

public enum Algorithm: String, CaseIterable {
    case ed25519
}

extension Algorithm: Hashable { }
extension Algorithm: Codable { }
extension Algorithm: ExpressibleByArgument { }

extension Algorithm {
    public init?(rawValue: String) {
        switch rawValue.lowercased() {
        case "ec25519", "ed25519", "25519": self = .ed25519
        default: return nil
        }
    }
}

extension Algorithm {
    func generateKey() -> any PrivateKey {
        switch self {
        case .ed25519: keygen_ed25519()
        }
    }
}
