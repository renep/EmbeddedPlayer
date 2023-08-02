//
//  ViewController.swift
//  EmbeddedPlayer
//
//  Created by René Pirringer on 02.08.23.
//

import UIKit
import PinLayout
import AVKit

class ViewController: UIViewController {
	let label = UILabel()
	
	var actualPreviewController: UIViewController?
	
	override func loadView() {
		super.loadView()
		self.view.backgroundColor = .systemBackground
		
		self.view.addSubview(label)
		label.text = "Embedded Player Test.\nThere are no playback controls visible after the app launch. Only the video preview image is shown. When you tap the vidoe then the controls are shown."
		label.textColor = .label
		label.textAlignment = .center
		label.numberOfLines = 0
		
		label.layout
			.pin(.top, .leading, .trailing, gap: 44)
		
		if let url = URL(string: "https://ciqua.com/transfer/video/fountain.mp4") {
			addPlayer(mediaURL: url)
		}
	}


	func addPlayer(mediaURL: URL) {
		let playerController = AVPlayerViewController()
		playerController.showsTimecodes = true
		playerController.player = AVPlayer(url: mediaURL)
		playerController.beginAppearanceTransition(true, animated: false)
		self.addChild(playerController)
		view.addSubview(playerController.view)

		playerController.view.layout
			.pin(.top, to: label, gap: 44)
			.pin(.bottom, .leading, .trailing)

		playerController.didMove(toParent: self)
		self.actualPreviewController = playerController
		playerController.endAppearanceTransition()
	}


}

