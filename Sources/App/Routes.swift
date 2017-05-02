import Vapor

final class Routes: RouteCollection {
    private let log: LogProtocol
    
    init(log: LogProtocol) {
        self.log = log
    }
    
    func build(_ builder: RouteBuilder) throws {
        builder.get("/") { request in
            
            self.log.verbose("not so important")
            self.log.debug("something to debug")
            self.log.info("a nice information")
            self.log.warning("oh no, that won’t be good")
            self.log.error("ouch, an error did occur!")
            
            return "welcome!"
        }
    }
}
