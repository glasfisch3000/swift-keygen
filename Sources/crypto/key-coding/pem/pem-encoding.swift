import Foundation

extension CryptoKey {
    public func encodePEMString(as contentType: PEMContentType) -> String {
        let keyData = Data(self.rawRepresentation)
        let base64 = keyData.base64EncodedString()
        
        let prefix = "----- BEGIN \(contentType.rawValue) -----"
        let suffix = "----- END \(contentType.rawValue) -----"
        
        return prefix + "\n" + base64 + "\n" + suffix
    }
    
    public func encodePEMData(as contentType: PEMContentType) throws -> Data {
        let stringToEncode = encodePEMString(as: contentType)
        
        guard let encodedData = stringToEncode.data(using: .utf8) else { throw PEMEncodingError.utf8EncodingFailed }
        return encodedData
    }
}
