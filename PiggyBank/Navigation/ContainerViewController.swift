//
//  ContainerView.swift
//  PiggyBank
//
//  Created by Alden Lamp on 1/1/21.
//

import Foundation
import UIKit

enum SideBarState{
    case closed
    case open
}

enum NotificationNames: String {
    case switchScreen = "SwitchScreenNotification"
    case toggleSideBar = "ToggleSideBarNotification"
    case toggleAllowSidebar = "ToggleAllowSideBarNotification"
    
    var notification : Notification.Name {
        return Notification.Name(rawValue: self.rawValue)
    }
}

class ContainerViewController: UIViewController {
    
    var activeNavigationController: MainNavigationController!
    var sidebarController = SidebarViewController()
    
    var allowSide = true
    var currentState: SideBarState = .closed
    
    var containerOverlay = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        
        activeNavigationController = MainNavigationController()
        
        self.view.addSubview(activeNavigationController.view)
        self.addChild(activeNavigationController)
        activeNavigationController.didMove(toParent: self)
        
        activeNavigationController.switchToScreen(num: 0)
        
        containerOverlay = UIButton(frame: self.view.frame)
        containerOverlay.backgroundColor = UIColor.black
        containerOverlay.layer.opacity = 0.0
        containerOverlay.isUserInteractionEnabled = false
        self.view.addSubview(containerOverlay)
        
        containerOverlay.addTarget(self, action: #selector(overlayClicked(sender:)), for: .touchUpInside)
        
        sidebarController.view.frame = CGRect(x: -Appearance.SIDEBAR_WIDTH, y: 0, width: Appearance.SIDEBAR_WIDTH, height: self.view.frame.height)
        view.addSubview(sidebarController.view)
        sidebarController.didMove(toParent: self)
        sidebarController.view.layoutIfNeeded()
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(ContainerViewController.handlePanGesture(_:)))
        panGestureRecognizer.delegate = self
        activeNavigationController.view.addGestureRecognizer(panGestureRecognizer)
        sidebarController.view.addGestureRecognizer(panGestureRecognizer)
        self.view.addGestureRecognizer(panGestureRecognizer)
        
        NotificationCenter.default.addObserver(forName: NotificationNames.switchScreen.notification, object: nil, queue: nil, using: handleSwitchToScreen(notification:))
        NotificationCenter.default.addObserver(forName: NotificationNames.toggleSideBar.notification, object: nil, queue: nil, using: toggleMenu(notification:))
        NotificationCenter.default.addObserver(forName: NotificationNames.toggleAllowSidebar.notification, object: nil, queue: nil, using: toggleAllowSidebar(notification:))
    }
    
    func handleSwitchToScreen(notification: Notification) {
        animateSidePanel(toState: .closed)
    }
        
    @objc func overlayClicked(sender: UIButton) {
        animateSidePanel(toState: .closed)
    }
    
    func toggleAllowSidebar(notification: Notification) {
        allowSide = !allowSide
    }
    
    func toggleMenu(notification: Notification? = nil) {
        if currentState == .closed {
            animateSidePanel(toState: .open)
        } else {
            animateSidePanel(toState: .closed)
        }

    }
    
    func animateSidePanel(toState state: SideBarState) {
        UIView.animate(withDuration: Appearance.SIDEBAR_ANIMATION_DURATION, delay: 0.0, options: .curveEaseOut, animations: {
            self.sidebarController.view.frame = CGRect(x: state == .open ? 0 : -Appearance.SIDEBAR_WIDTH, y: 0, width: Appearance.SIDEBAR_WIDTH, height: self.view.frame.height)
            self.sidebarController.view.layer.shadowOpacity = state == .open ? Appearance.SIDEBAR_SHADOW_OPACITY : 0.0
            self.containerOverlay.layer.opacity = state == .open ? Float(Appearance.OVERLAY_FULL_OPACITY) : 0.0
        }, completion: nil)
        
        currentState = state
        containerOverlay.isUserInteractionEnabled = state == .open
    }
    
}

extension ContainerViewController: UIGestureRecognizerDelegate {
    
    
    @objc func handlePanGesture(_ recognizer: UIPanGestureRecognizer) {
        if allowSide {
            switch recognizer.state {
            case .changed:
                let translation = recognizer.translation(in: self.view).x
                if translation + sidebarController.view.frame.origin.x < 0 && translation + sidebarController.view.frame.origin.x > -Appearance.SIDEBAR_WIDTH {
                    sidebarController.view.center.x = sidebarController.view.center.x + translation
                }
                
                let opacityProportion = Float((sidebarController.view.frame.origin.x + Appearance.SIDEBAR_WIDTH) / Appearance.SIDEBAR_WIDTH)
                containerOverlay.layer.opacity = opacityProportion * Float(Appearance.OVERLAY_FULL_OPACITY)
                sidebarController.view.layer.shadowOpacity = opacityProportion * Float(Appearance.SIDEBAR_SHADOW_OPACITY)
                recognizer.setTranslation(CGPoint.zero, in: self.view)
                
            case .ended:
                if sidebarController.view.center.x > 0 {
                    if recognizer.velocity(in: self.view).x < -100 {
                        animateSidePanel(toState: .closed)
                    } else {
                        animateSidePanel(toState: .open)
                    }
                } else {
                    animateSidePanel(toState: .closed)
                }
            default:
                break
            }
            
        }
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if currentState != .closed {
            return true
        }
        
        if touch.location(in: self.view).x < self.view.frame.width / 3 {
            return true
        } else {
            return false
        }
    }
}
