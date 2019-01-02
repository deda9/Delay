import Foundation

enum DelayThread {
    case background(DispatchQoS.QoSClass)
    case main
}

func delay(seconds: Double, thread: DelayThread, execute: @escaping @convention(block) () -> Void) {
    switch thread {
    case .main:
        DispatchQueue.main.asyncAfter(seconds: seconds, execute: execute)
    case .background(let qos):
        DispatchQueue.global(qos: qos).asyncAfter(seconds: seconds, execute: execute)
    }
}

func delay(seconds: Int, thread: DelayThread, execute: @escaping @convention(block) () -> Void) {
    switch thread {
    case .main:
        DispatchQueue.main.asyncAfter(seconds: seconds, execute: execute)
    case .background(let qos):
        DispatchQueue.global(qos: qos).asyncAfter(seconds: seconds, execute: execute)
    }
}

extension DispatchQueue {
    func asyncAfter(seconds: Int, qos: DispatchQoS = .default, execute work: @escaping @convention(block) () -> Void) {
        self.asyncAfter(deadline: DispatchTime(seconds), qos: qos, execute: work)
    }
    
    func asyncAfter(seconds: Int, execute work: @escaping @convention(block) () -> Void) {
        self.asyncAfter(deadline: DispatchTime(seconds), execute: work)
    }
    
    func asyncAfter(seconds: Double, qos: DispatchQoS = .default, execute work: @escaping @convention(block) () -> Void) {
        self.asyncAfter(deadline: DispatchTime(seconds), qos: qos, execute: work)
    }
    
    func asyncAfter(seconds: Double, execute work: @escaping @convention(block) () -> Void) {
        self.asyncAfter(deadline: DispatchTime(seconds), execute: work)
    }
}

extension DispatchTime {
    public init(_ value: Int) {
        self = .now() + .seconds(value)
    }
    
    public init(_ value: Double) {
        self = .now() + .milliseconds(Int(value * 1000))
    }
}
