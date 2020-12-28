# StringAttributes

Swift compatible `NSAttributedString` builder.

## Description

The main idea behind the implementation is that in Swift 4 there is a new `NSAttributedStringKey` which is used for attributed string keys by String API.
So we can create a generic extension for `[NSAttributedStringKey: Any]` dictionary:

```swift
extension Dictionary where Key == NSAttributedStringKey, Value == Any {
    var font: UIFont { ... }
    var foregroundColor: UIFont { ... }
    ...
}
```

Also we define a typealias for attributed dictionary just for convenience:

```swift
public typealias StringAttributes = [NSAttributedStringKey: Any]
```

## Usage

### Create string attributes separately from a string

```swift
let attributes = StringAttributes {
    $0.foregroundColor = .red
    $0.backgroundColor = .white
    $0.link = URL(string: "http://github.com")
})
let string = NSAttributedString(string: "text", attributes: attributes)
```

### Attributize a string using inline builder initialization

```swift
let string = "text".with(StringAttributes {
    $0.foregroundColor = .red
    $0.backgroundColor = .white
    $0.link = URL(string: "http://github.com")
})
```
