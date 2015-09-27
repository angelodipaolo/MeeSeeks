# MeeSeeks

![MeeSeeks](https://raw.github.com/angelodipaolo/MeeSeeks/master/logo.png)

A collection of Swift utilities and helpers for various iOS programming tasks.

- [JSON](#json)
- [Managing State](#managing-state)
- [Core Graphics](#core-graphics)

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

## Managing State

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

#### Usage

Bring order to your view controllers with `StateMachine` and `Stateful`.

```
// possible view controller states
enum ViewState {
    case Loading
    case Viewing(model: Model)
    case Editing(model: Model)
    case Saving(model: Model)
    case Cancelled
}

class ViewController: UIViewController, Stateful
    typealias StateType = ViewState
    var viewStateMachine = StateMachine<ViewController>?

    override func viewDidLoad() {
        super.viewDidLoad()

        // setup state machine to manage view states
        // set `Loading` as initial state
        viewStateMachine = StateMachine<ViewController>(state: .Loading, owner: self)

        // fetch some data
        modelController.fetchModel { [weak self] (model) in
            
            // enter the `Viewing` state to view the model data
            self?.viewStateMachine?.state = .Viewing(model)
        }
    }

    // MARK: Stateful Protocol Methods

    func shouldEnterState(state: ViewState, fromPreviousState: ViewState) -> Bool {
        return true
    }

    func enteredState(state: ViewState) {
        
        switch state {

        case .Loading:
            title = "Loading"
            showActivityIndicator()

        case .Viewing(let model):
            title = nil
            hideActivityIndicator()
            renderViewModel(model)

        case .Editing(let model):
            title = "Edit"
            renderEditModel(model)
            
        case .Saving(let model):
            title = "Saving..."
            showActivityIndicator()

            model.save { [weak self] in
                self?.hideActivityIndicator()
                self?.dismissViewControllerAnimated(true, completion: nil)
            }
            
        case .Cancelled:
            dismissViewControllerAnimated(true, completion: nil)
        }
    }

    // MARK: Actions

    @IBAction func editTapped() {
        // enter `Editing` state
        viewStateMachine?.state = .Editing(modelController.model)
    }

    @IBAction func saveTapped() {
        // enter `Saving` state
        viewStateMachine?.state = .Saving(modelController.model)
    }
}
```

## Core Graphics

#### `CGRect` Helpers

```
public extension CGRect {

    public var calculatedWidth: CGFloat { get }
    public var calculatedHeight: CGFloat { get }

    public var midX: CGFloat { get }
    public var midY: CGFloat { get }
    public var center: CGPoint { get }

    public func widthByPercent(percentage: CGFloat) -> CGFloat
    public func heightByPercent(percentage: CGFloat) -> CGFloat
}
```
