//
//  AppDelegate.swift
//  ios_app_test
//
//  Created by 임지훈 on 7/8/24.
//

import Flutter
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  lazy var flutterEngine = FlutterEngine(name: "flutterEngine")
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?
  ) -> Bool {
    flutterEngine.run();
    guard let pluginRegistrar = self.flutterEngine.registrar(forPlugin: "Runner") else { return false }
    let factory = FLNativeViewFactory(messenger: pluginRegistrar.messenger())
    pluginRegistrar.register(factory, withId: "viewType")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
