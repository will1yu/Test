//
//  CaptureManager.swift
//  QRCode
//
//  Created by meitu007 on 2018/2/22.
//  Copyright © 2018年 will. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

let windowHeight    = UIScreen.main.bounds.size.height
let windowWidth     = UIScreen.main.bounds.size.width
let screenSize      = UIScreen.main.bounds.size

extension Int {
    var f: CGFloat { return CGFloat(self) }
    var swf: Float { return Float(self) }
}

extension Float {
    var f: CGFloat { return CGFloat(self) }
}

extension Double {
    var f: CGFloat { return CGFloat(self) }
    var swf: Float { return Float(self) }
}

extension CGFloat {
    var swf: Float { return Float(self) }
}

@objc protocol CaptureManagerDelegate : NSObjectProtocol {
    @objc optional func didChangeAccessCameraState(isGranted:Bool)
    @objc optional func didOutputDecodeStringValue(stringValue:NSString)
    @objc optional func didDecodeUnmatchType(codeType:NSString)
}

class CaptureManager: NSObject {
    private var _cropRect:CGRect?
    var captureSession:AVCaptureSession = AVCaptureSession()
    var delegate:CaptureManagerDelegate? = nil
    var nextTipDate:Date? = nil
    weak var rootViewController:UIViewController? = nil
    
    var videoPreViewLayer:AVCaptureVideoPreviewLayer? = nil
    
    /* 开始捕捉*/
    var isReading:Bool = false
    
    override init() {
        super.init()
    }
    init(croRect:CGRect) {
        _cropRect = croRect
    }
    deinit {
        // MARK:有区别么？
//        self.clearCaputure()
        clearCaputure()
    }
    
    func clearCaputure() {
        // TODO:notFinish
        self.isReading = false
        
    }
    
    func authCapture() {
        
        let authStatus:AVAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)
        
        if authStatus == .notDetermined {
            AVCaptureDevice.requestAccess(for: .video, completionHandler: {
                (granded: Bool) in
                
                if granded {
                    self.setupCature()
                    self.didChangeAccessCameraState(isGranted: granded)
                } else {
                    self.didChangeAccessCameraState(isGranted: granded)
                }
            })
        } else if authStatus == .authorized || authStatus == .restricted {
            self.setupCature()
        } else if authStatus == .denied {
            // TODO:alert
        }
    }
    
    func setupCature() {
        // TODO:notFinish
        let captureDevice = AVCaptureDevice.default(for: .video)!
        
        do {
            try captureDevice.lockForConfiguration()
        } catch { }
        
        // 设置自动对焦
        if captureDevice.isFocusModeSupported(.continuousAutoFocus) {
            captureDevice.focusPointOfInterest = CGPoint(x: 0.5, y: 0.5)
            captureDevice.focusMode = .continuousAutoFocus
        }
        
        // 补光灯
        if captureDevice.hasTorch && captureDevice.isTorchModeSupported(.auto) {
            captureDevice.torchMode = .auto
        }
        
        captureDevice.videoZoomFactor = captureDevice.activeFormat.videoZoomFactorUpscaleThreshold
        
        captureDevice.unlockForConfiguration()
        
        // MARK:设置session
        var isHighPresent : Bool = false
        let idiom = UIDevice.current.userInterfaceIdiom
        if idiom == .pad || CGFloat(windowHeight) < 480 + 1 {
            isHighPresent = true
        }
        
        if isHighPresent {
            captureSession.sessionPreset = AVCaptureSession.Preset.high
        } else if captureSession.canSetSessionPreset(AVCaptureSession.Preset.hd1920x1080) {
            captureSession.sessionPreset = AVCaptureSession.Preset.hd1920x1080
        }
        
        let captureInput = try? AVCaptureDeviceInput.init(device: captureDevice)
        
        if captureInput == nil {
            debugPrint("captureInput init falied!")
            return
        }
        
        if captureSession.canAddInput(captureInput!) {
            captureSession.addInput(captureInput!)
        }
        
        let captureOutput = AVCaptureMetadataOutput()
        if captureSession.canAddOutput(captureOutput) {
            captureSession.addOutput(captureOutput)
        }
        
        
    }
    
    func didChangeAccessCameraState(isGranted:Bool) {
        DispatchQueue.main.async {
            // MARK: Question
            // Q1:responds(to aSelector: Selector!)
            // Q2:(...)!
            // Q3:self.delegate?.didChangeAccessCameraState!(isGranted: isGranted)
            if self.delegate != nil && (self.delegate?.responds(to: #selector(CaptureManagerDelegate.didChangeAccessCameraState(isGranted:))))! {
                self.delegate?.didChangeAccessCameraState!(isGranted: isGranted)
            }
        }
    }
}

// MARK: - AVCaptureMetadataOutputObjectsDelegate
extension CaptureManager: AVCaptureMetadataOutputObjectsDelegate {
    
}
