# MeeSeeks

![MeeSeeks](https://raw.github.com/angelodipaolo/MeeSeeks/master/logo.png)

A collection of Swift utilities and helpers for iOS programming tasks.

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

## State

#### `Stateful`

A protocol that enables an object to work with a finite state machine.


#### `StateMachine`

An abstract class for creating a finite state machine.

```
public protocol Stateful {
    typealias StateType
    func shouldEnterState(state: StateType, fromPreviousState previousState: StateType) -> Bool
    func enteredState(state: StateType)
}
```

Usage example:

```
enum ViewState {
    case Editing(model: Model)
    case Viewing
    case Saving
    case Cancelling
}

class ViewController: UIViewController, Stateful
    typealias StateType = ViewState

    var viewStateMachine = StateMachine<ViewController>?

    override func viewDidLoad() {
        super.viewDidLoad()

        viewStateMachine = StateMachine<ViewController>(state: .Viewing, owner: self)
    }

    // MARK: - Stateful Protocol Methods

    func shouldEnterState(state: ViewState, fromPreviousState: ViewState) -> Bool {
        return true
    }

    func enteredState(state: ViewState) {
        
        switch state {
            
        case .Editing:
            
            self.title = "Edit Model"
            renderModel(modelController.model)
            
        case .Viewing:
            
            title = nil            
            renderModel(modelController.model)
            
        case .Saving:
            title = "Saving..."
            
            modelController.saveModel { [weak self] in
                self?.dismissViewControllerAnimated(true, completion: nil)
            }
            
        case .Cancelling:
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
}
```
