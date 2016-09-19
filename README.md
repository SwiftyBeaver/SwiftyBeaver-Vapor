# SwiftyBeaver Provider for Vapor
[![Language Swift 3](https://img.shields.io/badge/Language-Swift%203-orange.svg)](https://swift.org) [![Vapor 1.x](https://img.shields.io/badge/Vapor-1.x-blue.svg)](http://vapor.codes/) [![SwiftyBeaver 1.x](https://img.shields.io/badge/SwiftyBeaver-1.x-blue.svg)] (https://github.com/SwiftyBeaver/SwiftyBeaver) [![Slack Status](https://slack.swiftybeaver.com/badge.svg)](https://slack.swiftybeaver.com) 

Adds logging support to the [Vapor Web Framework](https://github.com/vapor/vapor)  for server-side Swift 3 on Linux and Mac.

## Installation

Add this to the `Package.swift` of your Vapor project:

```swift
dependencies: [
	.Package(url: "https://github.com/SwiftyBeaver/SwiftyBeaver-Vapor.git", majorVersion: 0, minor: 0),
	//...other packages here
],
```
<br/>

## Setup

```swift
import Foundation
import Vapor
import SwiftyBeaverVapor
import SwiftyBeaver

// set-up SwiftyBeaver logging destinations (console, file, cloud, ...)
// learn more at http://bit.ly/2ci4mMX
let console = ConsoleDestination()  // log to Xcode Console in color
let file = FileDestination()  // log to file in color
file.logFileURL = URL(string: "file:///tmp/VaporLogs.log")! // set log file
let sbProvider = SwiftyBeaverProvider(destinations: [console, file])

// create Droplet
let app = Droplet(initializedProviders: [sbProvider])
let log = app.log.self // to avoid writing app.log all the time
```
<br/>

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

The `main.swift` in the included Example folder contains more details. Please also see the SwiftyBeaver [destination docs](http://docs.swiftybeaver.com/category/8-logging-destinations) and how to set a [custom logging format](http://docs.swiftybeaver.com/category/19-advanced-topics).
<br/><br/>

## Output to Xcode 8 Console

<img src="https://cloud.githubusercontent.com/assets/564725/18640658/5e1ea16e-7e99-11e6-8fbf-706b3150c617.png" width="615">

[Learn more](http://docs.swiftybeaver.com/article/9-log-to-xcode-console) about colored logging to Xcode 8 Console.
<br/><br/>

## Output to File

<img src="https://cloud.githubusercontent.com/assets/564725/18640664/658667ac-7e99-11e6-9267-d7cd168fea47.png" width="802">


[Learn more](http://docs.swiftybeaver.com/article/10-log-to-file) about logging to file which is great for Terminal.app fans or to store logs on disk.
<br/><br/>

## Output to Cloud & Mac App

![swiftybeaver-demo1](https://cloud.githubusercontent.com/assets/564725/14846071/218c0646-0c62-11e6-92cb-e6e963b68724.gif)

[Learn more](http://docs.swiftybeaver.com/article/11-log-to-swiftybeaver-platform) about logging to the SwiftyBeaver Platform **during release!**
<br/><br/>

## Learn More

- [Website](https://swiftybeaver.com)
- [SwiftyBeaver Framework](https://github.com/SwiftyBeaver/SwiftyBeaver)
- [Documentation](http://docs.swiftybeaver.com/)
- [Medium Blog](https://medium.com/swiftybeaver-blog)
- [On Twitter](https://twitter.com/SwiftyBeaver)


Get support via Github Issues, email and our <b><a href="https://slack.swiftybeaver.com">public Slack channel</a></b>.
<br/><br/>

## License

SwiftyBeaverVapor is released under the [MIT License](https://github.com/SwiftyBeaver/SwiftyBeaver-Vapor/blob/master/LICENSE).
