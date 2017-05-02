@_exported import Vapor
import SwiftyBeaverProvider

extension Droplet {
    public func setup() throws {
        try collection(Routes(log: self.log))
    }
}

extension Config {
    public func setup() throws {
        try addProvider(SwiftyBeaverProvider.Provider.self)
    }
}
