import ArgumentParser

public enum Algorithm {
    case ed25519
}

extension Algorithm: Hashable { }
extension Algorithm: Codable { }

extension Algorithm {
    public func generateKey() -> any PrivateKey {
        switch self {
        case .ed25519: keygen_ed25519()
        }
    }
}
