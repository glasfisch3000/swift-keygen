extension PEMDecoder {
    /// A set of errors that can occur while decoding a cryptographic key from PEM-formatted data.
    public enum DecodingError: Error {
        case utf8DecodingFailed
        case invalidFormat
        case invalidContentType
    }
}
