//
//  ViewController.swift
//  TestBarcodeQRcode
//
//  Created by APP技術部-陳冠志 on 2019/8/30.
//  Copyright © 2019 Bruce Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, QRScannerViewDelegate {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var scannerView: QRScannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.scannerView.delegate = self
    }

    @IBAction func openCamera(_ sender: Any) {
        self.scannerView.startScanning()
    }
    
    @IBAction func stopScanner(_ sender: Any) {
        textLabel.text = "請掃描"
        self.scannerView.stopScanning()
    }
    func qrScanningDidFail() {
        textLabel.text = "掃描失敗"
        print("qrScanningDidFail")
    }
    
    func qrScanningSucceededWithCode(_ str: String?) {
        print("qrScanningSucceededWithCode : \(String(describing: str))")
        DispatchQueue.main.async {
            self.textLabel.text = "掃描成功： \(String(describing: str))" 
        }
    }
    
    func qrScanningDidStop() {
        print("qrScanningDidStop")
    }
    
}



