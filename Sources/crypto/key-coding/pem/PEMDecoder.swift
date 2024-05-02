import Foundation
import RegexBuilder

/// A decoder that parses PEM-formatted data.
public struct PEMDecoder: KeyDecoder {
    /// The accepted key type identifiers.
    public var contentTypes: [PEMContentType]
    
    /// Creates a new decoder object with specified accepted content types.
    public init(contentTypes: [PEMContentType]) {
        self.contentTypes = contentTypes
    }
}

extension PEMDecoder {
    public func decodeKey<Key: CryptoKey>(from data: Data, as type: Key.Type) throws -> Key {
        guard let string = String(data: data, encoding: .utf8) else { throw DecodingError.utf8DecodingFailed }
        
        let typeRef = Reference(PEMContentType.self)
        let dataRef = Reference(Data.self)
        
        guard let match = string.wholeMatch(of: {
            "----- BEGIN "
            TryCapture(as: typeRef) {
                OneOrMore(.word + .digit + .anyOf(" .#"))
            } transform: { substring in
                PEMContentType(rawValue: String(substring))
            }
            " -----"
            
            CharacterClass.newlineSequence
            
            TryCapture(as: dataRef) {
                OneOrMore(.base64)
                Optionally("=")
                Optionally("=")
            } transform: { substring -> Data? in
                guard let stringData = String(substring).data(using: .utf8) else { return nil }
                return Data(base64Encoded: stringData)
            }
            
            CharacterClass.newlineSequence
            
            "----- END "
            typeRef
            " -----"
        }) else { throw DecodingError.invalidFormat }
        
        let contentType = match[typeRef]
        guard self.contentTypes.contains(contentType) else { throw DecodingError.invalidContentType }
        
        let data = match[dataRef]
        return try Key(rawRepresentation: data)
    }
}
