//
//  main.swift
//  SwiftyBeaverProvider
//
//  Created by Gustavo Perdomo on 5/2/17.
//  Copyright © 2016 Sebastian Kreutzberger. Some rights reserved.
//

let config = try Config()
try config.setup()

let drop = try Droplet(config)
try drop.setup()

try drop.run()
