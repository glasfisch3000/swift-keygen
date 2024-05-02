import ArgumentParser

@main
struct Keygen: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "keygen",
        abstract: "Generate encryption or signing keys.",
        shouldDisplay: true,
        subcommands: [
            KeygenEd25519.self
        ]
    )
}
