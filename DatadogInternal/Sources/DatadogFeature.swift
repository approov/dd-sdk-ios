/*
 * Unless explicitly stated otherwise all files in this repository are licensed under the Apache License Version 2.0.
 * This product includes software developed at Datadog (https://www.datadoghq.com/).
 * Copyright 2019-Present Datadog, Inc.
 */

import Foundation

public struct DatadogFeatureConfiguration {
    /// The Feature name.
    public let name: String

    /// The URL request builder for uploading data in this Feature.
    ///
    /// This builder currently use the v1 context, but will be soon migrated to v2
    public let requestBuilder: FeatureRequestBuilder

    /// The message bus receiver.
    ///
    /// The `FeatureMessageReceiver` defines an interface for Feature to receive any message
    /// from a bus that is shared between Features registered in a core.
    public let messageReceiver: FeatureMessageReceiver

    public init(name: String, requestBuilder: FeatureRequestBuilder, messageReceiver: FeatureMessageReceiver) {
        self.name = name
        self.requestBuilder = requestBuilder
        self.messageReceiver = messageReceiver
    }
}

/// A Datadog Feature that can interact with the core through the message-bus
///
/// A Feature **cannot** open a scope to write events, only a `DatadogProduct`
/// can collect and upload data.
public protocol DatadogFeature {
    /// The feature name.
    static var name: String { get }

    /// The message bus receiver.
    ///
    /// The `FeatureMessageReceiver` defines an interface for Feature to receive any message
    /// from a bus that is shared between Features registered in a core.
    var messageReceiver: FeatureMessageReceiver { get }
}


/// A Datadog Product that can store and upload data to its relative product
/// on the Datadog platform.
public protocol DatadogProduct: DatadogFeature {
    /// The URL request builder for uploading data in this Feature.
    var requestBuilder: FeatureRequestBuilder { get }
}
