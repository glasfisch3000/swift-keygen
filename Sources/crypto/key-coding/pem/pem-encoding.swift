import Foundation

extension CryptoKey {
    public func encodePEM(as contentType: PEMContentType) throws -> Data {
        let keyData = Data(self.rawRepresentation)
        let base64 = keyData.base64EncodedString()
        
        let prefix = "----- BEGIN \(contentType.rawValue) -----"
        let suffix = "----- END \(contentType.rawValue) -----"
        
        let stringToEncode = prefix + "\n" + base64 + "\n" + suffix
        
        guard let encodedData = stringToEncode.data(using: .utf8) else { throw PEMEncodingError.utf8EncodingFailed }
        return encodedData
    }
}
