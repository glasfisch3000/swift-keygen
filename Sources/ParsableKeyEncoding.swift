import ArgumentParser

enum ParsableKeyEncoding: String, CaseIterable {
    case base64
    case pem
}

extension ParsableKeyEncoding: Hashable { }
extension ParsableKeyEncoding: Codable { }
extension ParsableKeyEncoding: ExpressibleByArgument { }

extension ParsableKeyEncoding {
    init?(rawValue: String) {
        switch rawValue.lowercased() {
        case "base64", "b64": self = .base64
        case "pem": self = .pem
        default: return nil
        }
    }
}
