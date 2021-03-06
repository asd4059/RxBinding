//
//  Emit.swift
//  RxBinding
//
//  Created by Meng Li on 05/25/2020.
//  Copyright (c) 2020 MuShare. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import RxSwift
import RxCocoa

infix operator ~> : DefaultPrecedence

// Emit the observer, the relay or the binder.
public extension SharedSequenceConvertibleType where SharingStrategy == SignalSharingStrategy {

    static func ~> <O>(observable: Self, observer: O) -> Disposable where O: ObserverType, Self.Element == O.Element {
        observable.emit(to: observer)
    }

    static func ~> <O>(observable: Self, observer: O) -> Disposable where O: ObserverType, O.Element == Self.Element? {
        observable.emit(to: observer)
    }

    static func ~> (observable: Self, relay: PublishRelay<Self.Element>) -> Disposable {
        observable.emit(to: relay)
    }

    static func ~> (observable: Self, relay: PublishRelay<Self.Element?>) -> Disposable {
        observable.emit(to: relay)
    }

    static func ~> (observable: Self, relay: BehaviorRelay<Self.Element>) -> Disposable {
        observable.emit(to: relay)
    }

    static func ~> (observable: Self, relay: BehaviorRelay<Self.Element?>) -> Disposable {
        observable.emit(to: relay)
    }
}

// Emit the array of observer, relay or binder.
public extension SharedSequenceConvertibleType where SharingStrategy == SignalSharingStrategy {

    static func ~> <O>(observable: Self, observers: [O]) -> [Disposable] where O: ObserverType, Self.Element == O.Element {
        observers.map { observable.emit(to: $0) }
    }

    static func ~> <O>(observable: Self, observers: [O]) -> [Disposable] where O: ObserverType, O.Element == Self.Element? {
        observers.map { observable.emit(to: $0) }
    }

    static func ~> (observable: Self, relays: [PublishRelay<Self.Element>]) -> [Disposable] {
        relays.map { observable.emit(to: $0) }
    }

    static func ~> (observable: Self, relays: [PublishRelay<Self.Element?>]) -> [Disposable] {
        relays.map { observable.emit(to: $0) }
    }

    static func ~> (observable: Self, relays: [BehaviorRelay<Self.Element>]) -> [Disposable] {
        relays.map { observable.emit(to: $0) }
    }

    static func ~> (observable: Self, relays: [BehaviorRelay<Self.Element?>]) -> [Disposable] {
        relays.map { observable.emit(to: $0) }
    }
}
