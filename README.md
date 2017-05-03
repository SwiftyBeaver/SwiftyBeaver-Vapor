<p align="center">
    <a href="http://vapor.codes">
        <img src="https://img.shields.io/badge/Vapor-2.x-blue.svg" alt="Vapor">
    </a>
    <a href="https://github.com/SwiftyBeaver/SwiftyBeaver">
        <img src="https://img.shields.io/badge/SwiftyBeaver-1.x-blue.svg" alt="SwiftyBeaver">
    </a>
    <!--a href="https://slack.swiftybeaver.com">
        <img src="https://slack.swiftybeaver.com/badge.svg" alt="Slack Team">
    </a-->
    <a href="LICENSE">
        <img src="http://img.shields.io/badge/license-MIT-brightgreen.svg" alt="MIT License">
    </a>
    <!--a href="https://circleci.com/gh/SwiftyBeaver/SwiftyBeaver-Vapor">
        <img src="https://circleci.com/gh/SwiftyBeaver/SwiftyBeaver-Vapor.svg?style=shield" alt="Continuous Integration">
    </a>
    <a href="https://travis-ci.org/SwiftyBeaver/SwiftyBeaver-Vapor">
    	<img src="https://travis-ci.org/SwiftyBeaver/SwiftyBeaver-Vapor.svg?branch=master" alt="Build Status">
    </a-->
    <a href="https://swift.org">
        <img src="http://img.shields.io/badge/swift-3.1-brightgreen.svg" alt="Swift 3.1">
    </a>
</center>

# SwiftyBeaver Logging Provider for Vapor

Adds the powerful logging of [SwiftyBeaver](https://github.com/SwiftyBeaver/SwiftyBeaver) to [Vapor](https://github.com/vapor/vapor) for server-side Swift 3 on Linux and Mac.

## Installation

Add this project to the `Package.swift` of your Vapor project:

```swift
import PackageDescription

let package = Package(
    name: "Project",
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 2),
        .Package(url: "https://github.com/SwiftyBeaver/SwiftyBeaver-Vapor.git", majorVersion: 2),
    ],
    exclude: [ ... ]
)
```

## Setup

After you've added the SwiftyBeaver Provider package to your project, setting the provider up in code is easy.

### Add to Droplet

First, register the SwiftyBeaverProvider.Provider with your Droplet.

```swift
import Vapor
import SwiftyBeaverProvider

let drop = try Droplet()

try drop.addProvider(SwiftyBeaverProvider.Provider.self)

````

### Configure Droplet

Once the provider is added to your Droplet, you can configure it to use the SwiftyBeaver logger. Otherwise you still use the old console logger.

Config/droplet.json

```json
{
    "log": "swiftybeaver",
}
```

### Configure Destinations

If you run your application now, you will likely see an error that the SwiftyBeaver configuration file is missing. Let's add that now

#### Basic

Here is an example of a simple SwiftyBeaver configuration file to configure console destination.

Config/swiftybeaver.json

```json
{
    "console": true
}
```

Here is an example of a SwiftyBeaver configuration file to add all possible destinations.

```json
{
    "console": true,
    "file": "path/to/log/file",
    "platform": {
        "appId": "YOUR_APP_ID",
        "appSecret": "YOUR_APP_SECRET",
        "encryptionKey": "YOUR_ENCRYPTION_KEY"
    }
}
```

> Note:
It's a good idea to store the SwiftyBeaver configuration file in the Config/secrets folder since it contains sensitive information.

## Use

```swift
drop.get("/") { request in

    drop.log.verbose("not so important")
    drop.log.debug("something to debug")
    drop.log.info("a nice information")
    drop.log.warning("oh no, that won’t be good")
    drop.log.error("ouch, an error did occur!")

    return "welcome!"
}

```

The `Routes.swift` in the included App folder contains more details. Please also see the SwiftyBeaver [destination docs](http://docs.swiftybeaver.com/category/8-logging-destinations) and how to set a [custom logging format](http://docs.swiftybeaver.com/category/19-advanced-topics).
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
