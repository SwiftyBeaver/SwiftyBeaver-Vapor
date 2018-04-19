# SwiftyBeaver Logging Provider for Vapor
[![Language Swift 4.x](https://img.shields.io/badge/Language-Swift%204.x-orange.svg)](https://swift.org)
[![Vapor 3.x](https://img.shields.io/badge/Vapor-3.x-blue.svg)](http://vapor.codes/)
[![SwiftyBeaver 1.x](https://img.shields.io/badge/SwiftyBeaver-1.x-blue.svg)](https://github.com/SwiftyBeaver/SwiftyBeaver)
[![Slack Status](https://slack.swiftybeaver.com/badge.svg)](https://slack.swiftybeaver.com)

Adds the powerful logging of [SwiftyBeaver](https://github.com/SwiftyBeaver/SwiftyBeaver) to [Vapor](https://github.com/vapor/vapor)
for server-side Swift 4.x on Linux and Mac.

## Installation

Add this to the `Package.swift` of your Vapor project:

```swift
dependencies: [
	.package(url: "https://github.com/SwiftyBeaver/SwiftyBeaver-Vapor.git", from: "2.0.0"),
	//...other packages here
],
```

## Setup

Following the [Vapor 3 recommended app structure](https://docs.vapor.codes/3.0/getting-started/structure/)

```swift
// configure.swift

import SwiftyBeaverVapor
import Vapor

// register the SwiftyBeaver Provider with Vapor
try services.register(SwiftyBeaverProvider())

// set-up SwiftyBeaver logging destinations (console, file, cloud, ...)
// see http://docs.swiftybeaver.com/category/8-logging-destinations to learn more
let console = ConsoleDestination() // log to Xcode Console in color
let file = FileDestination() // log to file
file.logFileURL = URL(fileURLWithPath: "/tmp/VaporLogs.log") // set log file

// create the custom SwiftyBeaverConfig and register it with Vapor
let myConfig = SwiftyBeaverConfig(destinations: [console, file])
services.register(myConfig)
```

Add the SwiftyBeaver [logging destinations](http://docs.swiftybeaver.com/category/8-logging-destinations) you want to use,
optionally adjust their defaults like format, color, filter or minimum log level and you are ready to log. 🙌

## Use

Again, following the [Vapor 3 recommended app structure](https://docs.vapor.codes/3.0/getting-started/structure/)

```swift
// routes.swift

router.get { request -> String in
    let log = try request.make(SwiftyBeaverLogger.self)

    log.verbose("not so important")
    log.debug("something to debug")
    log.info("a nice information")
    log.warning("oh no, that won’t be good")
    log.error("ouch, an error did occur!")

    return "Welcome!"
}
```

The `main.swift` in the included Example folder contains more details. Please also see the SwiftyBeaver
[destination docs](http://docs.swiftybeaver.com/category/8-logging-destinations) and how to set a
[custom logging format](http://docs.swiftybeaver.com/category/19-advanced-topics).

## Output to Xcode 8 Console

<img src="https://cloud.githubusercontent.com/assets/564725/18640658/5e1ea16e-7e99-11e6-8fbf-706b3150c617.png" width="615">

[Learn more](http://docs.swiftybeaver.com/article/9-log-to-xcode-console) about colored logging to Xcode 8 Console.

## Output to File

<img src="https://cloud.githubusercontent.com/assets/564725/18640664/658667ac-7e99-11e6-9267-d7cd168fea47.png" width="802">

[Learn more](http://docs.swiftybeaver.com/article/10-log-to-file) about logging to file which is great for Terminal.app fans or to store logs on disk.

## Output to Cloud & Mac App

![swiftybeaver-demo1](https://cloud.githubusercontent.com/assets/564725/14846071/218c0646-0c62-11e6-92cb-e6e963b68724.gif)

[Learn more](http://docs.swiftybeaver.com/article/11-log-to-swiftybeaver-platform) about logging to the SwiftyBeaver Platform **during release!**

## Learn More

- [Website](https://swiftybeaver.com)
- [SwiftyBeaver Framework](https://github.com/SwiftyBeaver/SwiftyBeaver)
- [Documentation](http://docs.swiftybeaver.com/)
- [Medium Blog](https://medium.com/swiftybeaver-blog)
- [On Twitter](https://twitter.com/SwiftyBeaver)

Get support via Github Issues, email and our <b><a href="https://slack.swiftybeaver.com">public Slack channel</a></b>.

## License

SwiftyBeaverVapor is released under the [MIT License](https://github.com/SwiftyBeaver/SwiftyBeaver-Vapor/blob/master/LICENSE).
