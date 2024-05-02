import Foundation

struct Base64Encoder {
    init() { }
    
    public func encodeString(key: any CryptoKey) -> String {
        let keyData = Data(key.rawRepresentation)
        return keyData.base64EncodedString()
    }
    
    public func encodeData(key: any CryptoKey) -> Data {
        let keyData = Data(key.rawRepresentation)
        return keyData.base64EncodedData()
    }
}
