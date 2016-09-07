# SwiftyBeaver Provider for Vapor

Adds logging support to the [Vapor](https://github.com/vapor/vapor) web framework for server-side Swift 3 on Linux and Mac.

## Installation

Add this to the `Package.swift` of your Vapor project:

```swift
dependencies: [
	.Package(url: "https://github.com/SwiftyBeaver/SwiftyBeaver-Vapor.git", majorVersion: 0, minor: 0),
	//...other packages here
],
```

## Setup

```swift
import Vapor
import SwiftyBeaverVapor

let app = Droplet(providers: [SwiftyBeaverProvider.self])
let log = app.log.self // to avoid writing app.log all the time
```

## Use

```swift
app.get("/") { request in

    log.verbose("not so important")
    log.debug("something to debug")
    log.info("a nice information")
    log.warning("oh no, that won’t be good")
    log.error("ouch, an error did occur!")

    return "welcome!"
}

```

The `main.swift` in the included Example folder contains more details.


## License

SwiftyBeaverVapor released under the [MIT License](https://github.com/SwiftyBeaver/SwiftyBeaver-Vapor/blob/master/LICENSE).
