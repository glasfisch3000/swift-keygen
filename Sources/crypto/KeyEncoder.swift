import Foundation

public protocol KeyEncoder {
    func encodeString(key: any CryptoKey) throws -> String
    func encodeData(key: any CryptoKey) throws -> Data
}
