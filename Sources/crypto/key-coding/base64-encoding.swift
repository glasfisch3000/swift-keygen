import Foundation

extension CryptoKey {
    public func encodeBase64() -> Data {
        let keyData = Data(self.rawRepresentation)
        return keyData.base64EncodedData()
    }
}
