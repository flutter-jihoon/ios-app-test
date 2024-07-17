//
//  FLNativeView.swift
//  ios_app_test
//
//  Created by 임지훈 on 7/9/24.
//

import Flutter
import UIKit

class FLNativeViewFactory: NSObject, FlutterPlatformViewFactory {
  private var messenger: FlutterBinaryMessenger
  
  init(messenger: FlutterBinaryMessenger) {
    self.messenger = messenger
    super.init()
  }
  
  func create(
    withFrame frame: CGRect,
    viewIdentifier viewId: Int64,
    arguments args: Any?
  ) -> FlutterPlatformView {
    return FLNativeView(
      frame: frame,
      viewIdentifier: viewId,
      arguments: args,
      binaryMessenger: messenger)
  }
  
  public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
    return FlutterStandardMessageCodec.sharedInstance()
  }
}

class FLNativeView: NSObject, FlutterPlatformView {
    private var _view: UIView

    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        _view = UIView()
        super.init()
        createNativeView(view: _view, args: args)
    }

    func view() -> UIView {
        return _view
    }
  
  func createNativeView(view _view: UIView, args: Any?) {
    self._view.backgroundColor = UIColor.black
    self._view.clipsToBounds = true
    
    let nativeLabel = UILabel()
    if let creationParams = args as? [String: Any], let index = creationParams["index"] as? Int {
      nativeLabel.text = "\(index + 1)번째 항목"
   }
    
    nativeLabel.textColor = UIColor.white
    nativeLabel.textAlignment = .center
    nativeLabel.font = UIFont.systemFont(ofSize: 20)
    nativeLabel.translatesAutoresizingMaskIntoConstraints = false
    
    self._view.addSubview(nativeLabel)
    
    NSLayoutConstraint.activate([
      nativeLabel.centerXAnchor.constraint(equalTo: self._view.centerXAnchor),
      nativeLabel.centerYAnchor.constraint(equalTo: self._view.centerYAnchor)
    ])
  }
}
