/// A set of errors that can occur while encoding data to hexadecimal format.
extension HexEncoder {
    public enum EncodingError: Error {
        case internalError
        case unicodeEncodingFailed
    }
}
