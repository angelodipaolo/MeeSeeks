# MeeSeeks

A collection of Swift helpers for iOS.

## JSON


#### `JSONDecodable`

A protocol that enables a type to be decoded from JSON.

```
extension Foo: JSONDecodable {

  static func decode(json: AnyObject) -> Foo? {
        guard let bar = json["bar"] as? String else { return nil }
        
        return Foo(bar: bar)
    }
}
```

#### `JSONDecoder`

A simple API for decoding JSON as a type that conforms to the `JSONDecodable` protocol.

```
struct Foo {
  var bar: String
}

extension Foo: JSONDecodable {

  static func decode(json: AnyObject) -> Foo? {
        guard let bar = json["bar"] as? String else { return nil }
        
        return Foo(bar: bar)
    }
}

let json: AnyObject = fetchJSON()
let foo = JSONDecoder<Foo>.decode(json)

```
