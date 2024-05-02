/// A set of errors that can occur while encoding data to hexadecimal format.
extension HexEncoder {
    enum EncodingError: Error {
        case internalError
        case unicodeEncodingFailed
    }
}
