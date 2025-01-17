import AVFoundation
import React

@objc(RCTVideoManager)
class RCTVideoManager: RCTViewManager {
    
    override func view() -> UIView {
        return RCTVideo(eventDispatcher: bridge.eventDispatcher() as! RCTEventDispatcher)
    }
    
    func methodQueue() -> DispatchQueue {
        return bridge.uiManager.methodQueue
    }
    
    @objc(save:reactTag:resolver:rejecter:)
    func save(options: NSDictionary, reactTag: NSNumber, resolve: @escaping RCTPromiseResolveBlock,reject: @escaping RCTPromiseRejectBlock) -> Void {
        bridge.uiManager.prependUIBlock({_ , viewRegistry in
            let view = viewRegistry?[reactTag]
            if !(view is RCTVideo) {
                RCTLogError("Invalid view returned from registry, expecting RCTVideo, got: %@", String(describing: view))
            } else if let view = view as? RCTVideo {
                view.save(options: options, resolve: resolve, reject: reject)
            }
        })
    }
    
    @objc(setLicenseResult:reactTag:)
    func setLicenseResult(license: NSString, reactTag: NSNumber) -> Void {
        bridge.uiManager.prependUIBlock({_ , viewRegistry in
            let view = viewRegistry?[reactTag]
            if !(view is RCTVideo) {
                RCTLogError("Invalid view returned from registry, expecting RCTVideo, got: %@", String(describing: view))
            } else if let view = view as? RCTVideo {
                view.setLicenseResult(license as String)
            }
        })
    }
    
    @objc(setLicenseResultError:reactTag:)
    func setLicenseResultError(error: NSString, reactTag: NSNumber) -> Void {
        bridge.uiManager.prependUIBlock({_ , viewRegistry in
            let view = viewRegistry?[reactTag]
            if !(view is RCTVideo) {
                RCTLogError("Invalid view returned from registry, expecting RCTVideo, got: %@", String(describing: view))
            } else if let view = view as? RCTVideo {
                view.setLicenseResultError(error as String)
            }
        })
    }
    
    @objc(dismissFullscreenPlayer:reactTag:)
    func dismissFullscreenPlayer(error: NSString, reactTag: NSNumber) -> Void {
        bridge.uiManager.prependUIBlock({_ , viewRegistry in
            let view = viewRegistry?[reactTag]
            if !(view is RCTVideo) {
                RCTLogError("Invalid view returned from registry, expecting RCTVideo, got: %@", String(describing: view))
            } else if let view = view as? RCTVideo {
                view.dismissFullscreenPlayer(error as String)
            }
        })
    }
    @objc(presentFullscreenPlayer:reactTag:)
    func presentFullscreenPlayer(error: NSString, reactTag: NSNumber) -> Void {
        bridge.uiManager.prependUIBlock({_ , viewRegistry in
            let view = viewRegistry?[reactTag]
            if !(view is RCTVideo) {
                RCTLogError("Invalid view returned from registry, expecting RCTVideo, got: %@", String(describing: view))
            } else if let view = view as? RCTVideo {
                view.presentFullscreenPlayer(error as String)
            }
        })
    }

    @objc(setPlayerPauseState:reactTag:)
    func setPlayerPauseState(paused: NSNumber, reactTag: NSNumber) -> Void {
        bridge.uiManager.prependUIBlock({_ , viewRegistry in
            let view = viewRegistry?[reactTag]
            if !(view is RCTVideo) {
                RCTLogError("Invalid view returned from registry, expecting RCTVideo, got: %@", String(describing: view))
            } else if let view = view as? RCTVideo {
                let paused = paused.boolValue
                view.setPaused(paused)
            }
        })
    }

    override func constantsToExport() -> [AnyHashable : Any]? {
        return [
            "ScaleNone": AVLayerVideoGravity.resizeAspect,
            "ScaleToFill": AVLayerVideoGravity.resize,
            "ScaleAspectFit": AVLayerVideoGravity.resizeAspect,
            "ScaleAspectFill": AVLayerVideoGravity.resizeAspectFill
        ]
    }

    override class func requiresMainQueueSetup() -> Bool {
        return true
    }
}
