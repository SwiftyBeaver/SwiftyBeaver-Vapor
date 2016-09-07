# SwiftyBeaver Provider for Vapor

Adds logging support to the [Vapor](https://github.com/vapor/vapor) web framework for server-side Swift 3 on Linux and Mac.

## Installation

Add this to the `Package.swift` of your Vapor project:

```swift
dependencies: [
	.Package(url: "https://github.com/SwiftyBeaver/SwiftyBeaver-Vapor.git"),
	//...other packages here
],
```

## Setup

```swift
import Vapor
import VaporSwiftyBeaver

let drop = Droplet(providers: [VaporSwiftyBeaver.SwiftyBeaverProvider.self])
```

## Use


## License

VaporSwiftyBeaver released under the [MIT License](https://github.com/SwiftyBeaver/SwiftyBeaver-Vapor/blob/master/LICENSE).
