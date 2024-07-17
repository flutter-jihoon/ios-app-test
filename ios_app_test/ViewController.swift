//
//  ViewController.swift
//  ios_app_test
//
//  Created by 임지훈 on 7/8/24.
//

import UIKit
import Flutter

class ViewController: UIViewController {
  var displayLink: CADisplayLink?
 override func viewDidLoad() {
  super.viewDidLoad()

  let button = UIButton(type:UIButton.ButtonType.custom)
  button.addTarget(self, action: #selector(showFlutter), for: .touchUpInside)
  button.setTitle("Show Flutter!", for: UIControl.State.normal)
  button.setTitleColor(UIColor.blue, for: .normal)
  button.backgroundColor = UIColor.clear
  button.translatesAutoresizingMaskIntoConstraints = false
  self.view.addSubview(button)
   
  NSLayoutConstraint.activate([
   button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
   button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
   button.widthAnchor.constraint(equalToConstant: 160),
   button.heightAnchor.constraint(equalToConstant: 40)
  ])
 }
  
 @objc func showFlutter() {
  let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
  let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
  flutterViewController.modalPresentationStyle = .fullScreen
  present(flutterViewController, animated: true, completion: nil)
 }
}
