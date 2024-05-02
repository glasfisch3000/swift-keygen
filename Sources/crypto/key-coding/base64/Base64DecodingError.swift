extension Base64Decoder {
    /// A set of errors that can occur while decoding a cryptographic key from base64-formatted data.
    enum DecodingError: Error {
        case invalidFormat
    }
}
