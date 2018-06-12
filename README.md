# SwiftyBeaver Logging Provider for Vapor
[![Swift](https://img.shields.io/badge/Swift-4.1-orange.svg)](https://swift.org) 
[![Vapor 3.x](https://img.shields.io/badge/Vapor-3.x-blue.svg)](http://vapor.codes/) 
[![SwiftyBeaver 1.x](https://img.shields.io/badge/SwiftyBeaver-1.x-blue.svg)](https://github.com/SwiftyBeaver/SwiftyBeaver) 
[![Slack](https://img.shields.io/badge/Join-Our%20Slack%20Chat-blue.svg)](https://slack.swiftybeaver.com) 

Adds the powerful logging of [SwiftyBeaver](https://github.com/SwiftyBeaver/SwiftyBeaver) to [Vapor](https://github.com/vapor/vapor) for server-side Swift on Linux and Mac.

## Installation

Add this to the `Package.swift` of your Vapor project:

```swift
dependencies: [
    .package(url: "https://github.com/SwiftyBeaver/SwiftyBeaver-Vapor.git", from: "1.1.0")),
	//...other packages here
],
```
<br/>

## Setup

In `configure.swift`:
```swift
/// Called before your application initializes.
public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
    
    // ...

    let loggingDestination = ConsoleDestination()
    try services.register(SwiftyBeaverProvider(destinations: [loggingDestination]))

    config.prefer(SwiftyBeaverVapor.self, for: Logger.self)

    // ...
}
```

Add the SwiftyBeaver [logging destinations](http://docs.swiftybeaver.com/category/8-logging-destinations) you want to use, optionally adjust their defaults like format, color, filter or minimum log level and you are ready to log 🙌
<br/>

## Use

For example, you can log requests as they come in.
```swift
func index(_ req: Request) throws -> Future<[Foo]> {

    let logger = try? req.sharedContainer.make(Logger.self)
    logger?.log(req.description, at: .verbose, file: #file, function: #function, line: #line, column: #column)

    return Foo.query(on: req).all()
}

```

For more information see the SwiftyBeaver [destination docs](http://docs.swiftybeaver.com/category/8-logging-destinations) and how to set a [custom logging format](http://docs.swiftybeaver.com/category/19-advanced-topics).
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
