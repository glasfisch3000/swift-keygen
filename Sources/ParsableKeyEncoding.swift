import ArgumentParser

/// A parsable key encoding method specified by the user.
public enum ParsableKeyEncoding: String, CaseIterable {
    /// Encodes the key's data in base64 format.
    case base64
    /// Encodes the key's data in PEM format.
    case pem
    /// Encodes the key's data in hexadecimal format.
    case hex
}

extension ParsableKeyEncoding: Hashable { }
extension ParsableKeyEncoding: Codable { }
extension ParsableKeyEncoding: ExpressibleByArgument { }

extension ParsableKeyEncoding {
    public init?(rawValue: String) {
        switch rawValue.lowercased() {
        case "base64", "b64": self = .base64
        case "pem": self = .pem
        case "hex", "hexadecimal": self = .hex
        default: return nil
        }
    }
}
