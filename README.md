# SwiftSSL

SwiftSSL is an Elegant crypto toolkit in Swift, based on CommonCrypto.

## How To Get Started

- Add SwiftSSL as submodule

	```shell
	git submodule add https://github.com/SwiftP2P/SwiftSSL.git SwiftSSL
	```

- Add SwiftSSL.xcodeproj as subproject

- Configure your project
	- Add relative path for file **module.map** in your project **Build Settings / Swift Compiler - Search Paths / Import Paths**

- Done!

## Sample Code

SwiftSSL try to do things in swift way, so it doesn't just transfor code from openssl or other lib.

If you wanna digest String or NSData, you can do it just like this:

```swift
import SwiftSSL

let plainText: String = "This is plain text."
var digestString = plainText.digest(SwiftSSL.DigestAlgorithm.MD5)
```

Just that simple!

Wanna sign a message?

```swift
import SwiftSSL

let message: String = "This is your message."
let passphrase: String = "Your passphrase"
var signature = message.sign(SwiftSSL.HMACAlgorithm.SHA512, key: passphrase)
```

Have fun!

## About

SwiftSSL is still on the way. It has provided:

- Crypto
	- Digest
		- MD2
		- MD4
		- MD5
		- SHA1
		- SHA224
		- SHA256
		- SHA384
		- SHA512
	- HMAC
		- MD5
		- SHA1
		- SHA224
		- SHA256
		- SHA384
		- SHA512


## References

- [Apple's CommonCrypto source](http://www.opensource.apple.com/source/CommonCrypto/)

## License

Cypraea is released under the MIT license. See LICENSE for details.