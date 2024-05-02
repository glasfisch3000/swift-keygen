import ArgumentParser

/// A parsable key encoding method specified by the user.
public enum ParsableKeyEncoding: String, CaseIterable {
    /// Encodes the key's data in base64 format.
    case base64
    /// Encodes the key's data in PEM format.
    case pem
}

extension ParsableKeyEncoding: Hashable { }
extension ParsableKeyEncoding: Codable { }
extension ParsableKeyEncoding: ExpressibleByArgument { }

extension ParsableKeyEncoding {
    public init?(rawValue: String) {
        switch rawValue.lowercased() {
        case "base64", "b64": self = .base64
        case "pem": self = .pem
        default: return nil
        }
    }
}
