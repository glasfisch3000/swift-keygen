import Foundation

extension CryptoKey {
    public func encodeBase64String() -> String {
        let keyData = Data(self.rawRepresentation)
        return keyData.base64EncodedString()
    }
    
    public func encodeBase64Data() -> Data {
        let keyData = Data(self.rawRepresentation)
        return keyData.base64EncodedData()
    }
}
