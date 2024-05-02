import ArgumentParser

enum ParsableAlgorithm: String, CaseIterable {
    case ed25519
}

extension ParsableAlgorithm: Hashable { }
extension ParsableAlgorithm: Codable { }
extension ParsableAlgorithm: ExpressibleByArgument { }

extension ParsableAlgorithm {
    init?(rawValue: String) {
        switch rawValue.lowercased() {
        case "ec25519", "ed25519", "25519": self = .ed25519
        default: return nil
        }
    }
}
