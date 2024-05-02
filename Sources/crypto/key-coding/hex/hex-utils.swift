import Foundation

extension Data {
    /// Create data from parsing a hexadecimal string.
    public init(hexString: String) throws {
        guard hexString.count.isMultiple(of: 2), !hexString.isEmpty else { throw HexDecoder.DecodingError.invalidSize }
        self.init(repeating: 0, count: hexString.count/2)
        
        let stringBytes: [UInt8] = Array(hexString.data(using: String.Encoding.utf8)!)
        
        for i in stride(from: stringBytes.startIndex, to: stringBytes.endIndex - 1, by: 2) {
            let char1 = try convertHexCharToByte(stringBytes[i])
            let char2 = try convertHexCharToByte(stringBytes[i + 1])
            
            self[i/2] = (char1 & 0xf) << 4 | (char2 & 0xf)
        }
    }
    
    /// Create data from parsing hexadecimal data.
    public init(hexData: Data) throws {
        guard hexData.count.isMultiple(of: 2), !hexData.isEmpty else { throw HexDecoder.DecodingError.invalidSize }
        self.init(repeating: 0, count: hexData.count/2)
        
        for i in stride(from: hexData.startIndex, to: hexData.endIndex - 1, by: 2) {
            let char1 = try convertHexCharToByte(hexData[i])
            let char2 = try convertHexCharToByte(hexData[i + 1])
            
            self[i/2] = (char1 & 0xf) << 4 | (char2 & 0xf)
        }
    }
    
    /// A hexadecimal string representation of the underlying bytes.
    public func hexString() throws -> String {
        var string = ""
        for byte in self {
            let (char1, char2) = try convertByteToHexChars(byte)
            string += String(char1) + String(char2)
        }
        
        return string
    }
    
    /// A hexadecimal data representation of the underlying bytes.
    public func hexData() throws -> Data {
        var data = Data(capacity: self.count*2)
        for byte in self {
            let (byte1, byte2) = try convertByteToHexCharBytes(byte)
            data += [byte1, byte2]
        }
        
        return data
    }
}

private func convertHexCharToByte(_ c: UInt8) throws -> UInt8 {
    switch c {
    case 0x30 ... 0x39: return c - 0x30 // 0-9
    case 0x41 ... 0x46: return c - 0x41 + 0xa // A-F
    case 0x61 ... 0x66: return c - 0x61 + 0xa // a-f
    default: throw HexDecoder.DecodingError.invalidFormat
    }
}

private func convertByteToHexChars(_ c: UInt8, upperCase: Bool = false) throws -> (Character, Character) {
    let (char1, char2) = try convertByteToHexCharBytes(c, upperCase: upperCase)
    
    guard let scalar1 = Unicode.Scalar(UInt32(char1)) else { throw HexEncoder.EncodingError.unicodeEncodingFailed }
    guard let scalar2 = Unicode.Scalar(UInt32(char2)) else { throw HexEncoder.EncodingError.unicodeEncodingFailed }
    return (Character(scalar1), Character(scalar2))
}

private func convertByteToHexCharBytes(_ c: UInt8, upperCase: Bool = false) throws -> (UInt8, UInt8) {
    let c1 = (c >> 4) & 0xf
    let c2 = c & 0xf
    
    let char1: UInt8
    switch c1 {
    case 0x0 ... 0x9: char1 = c1 + 0x30
    case 0xa ... 0xf: char1 = upperCase ? (c1 - 0xa + 0x41) : (c1 - 0xa + 0x61)
    default: throw HexEncoder.EncodingError.internalError
    }
    
    let char2: UInt8
    switch c2 {
    case 0x0 ... 0x9: char2 = c2 + 0x30
    case 0xa ... 0xf: char2 = upperCase ? (c2 - 0xa + 0x41) : (c2 - 0xa + 0x61)
    default: throw HexEncoder.EncodingError.internalError
    }
    
    return (char1, char2)
}
