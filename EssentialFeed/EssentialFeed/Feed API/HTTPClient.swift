//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Meharoof Najeeb on 26/12/2024.
//

import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
