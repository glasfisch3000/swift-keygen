/// A set of errors that can occur while decoding a cryptographic key from hexadecimal data.
extension HexDecoder {
    public enum DecodingError: Error {
        case invalidFormat
        case invalidSize
    }
}
