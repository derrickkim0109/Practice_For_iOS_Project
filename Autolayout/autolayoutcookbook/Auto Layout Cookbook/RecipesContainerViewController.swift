/*
    Copyright (C) 2015 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information

    Abstract:
    A view controller hosting the various recipes being demonstrated.
*/

import UIKit

class RecipesContainerViewController: UIViewController {
    // MARK: Properties

    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet var navigationButtons: [UIButton]!

    let recipes = Recipe.loadRecipes()
    
    var currentRecipeIndex = 0
    
    var showInstructionsForFullScreenMode = true
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Give the container view a border and layout margins.
        containerView.layer.borderWidth = 1.0
        containerView.layer.borderColor = UIColor.blackColor().CGColor
        containerView.layoutMargins = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
                
        showRecipe(recipes[currentRecipeIndex])
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let segueIdentifier = segue.identifier, let identifier = CookbookStoryboardIdentifier(rawValue: segueIdentifier) else { return }
        
        switch identifier {
            case .InformationView:
                // Fetch the `InformationViewController` from the presented `UINavigationController`.
                guard let navigationController = segue.destinationViewController as? UINavigationController,
                    infoViewController = navigationController.viewControllers.first as? InformationViewController else {
                        return
                }
                
                let recipe = recipes[currentRecipeIndex]
                infoViewController.informationText = recipe.description

            default:
                /*
                    Add a double tap gesture recognizer to presented recipe view
                    controllers. This recognizer will dismiss the presented controller.
                */
                let doubleTapGesture = UITapGestureRecognizer(target: self, action: "handleDismissPresentedViewControllerGestureRecognizer:")
                
                doubleTapGesture.numberOfTapsRequired = 2
                doubleTapGesture.numberOfTouchesRequired = 1
                
                segue.destinationViewController.view.addGestureRecognizer(doubleTapGesture)
        }
    }
    
    // MARK: Interface Builder actions

    @IBAction func dismissInformationViewController(sender: UIStoryboardSegue) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func showPreviousRecipe(sender: AnyObject) {
        let count = recipes.count
        let index = (currentRecipeIndex.predecessor() + count) % count
        let recipe = recipes[index]
        
        showRecipe(recipe)
        currentRecipeIndex = index
    }

    @IBAction func showNextRecipe(sender: AnyObject) {
        let count = recipes.count
        let index = currentRecipeIndex.successor() % count
        let recipe = recipes[index]
        
        showRecipe(recipe)
        currentRecipeIndex = index
    }

    @IBAction func displayFullScreen(sender: UIGestureRecognizer) {
        guard sender.state == UIGestureRecognizerState.Began else { return }
        
        let recipe = recipes[currentRecipeIndex]
        self.performSegueWithIdentifier(recipe.segueIdentifier, sender: nil)
        
        if showInstructionsForFullScreenMode {
            let alertController = UIAlertController(title: "Full Screen Mode", message: "Double-tap to exit full screen mode.", preferredStyle: .Alert)
            let dismissAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
            let acceptAction = UIAlertAction(title: "Don't Show Again", style: .Default) { _ in
                self.showInstructionsForFullScreenMode = false
            }
            
            alertController.addAction(dismissAction)
            alertController.addAction(acceptAction)
            
            presentedViewController?.presentViewController(alertController, animated: true, completion: nil)
        }
    }

    // MARK: Gesture recognizer handlers
    
    func handleDismissPresentedViewControllerGestureRecognizer(gestureRecognizer: UITapGestureRecognizer) {
        if gestureRecognizer.state == .Recognized {
            presentedViewController?.dismissViewControllerAnimated(true, completion: nil)
        }
    }

    // MARK: Convenience
    
    private func enableButtons(enabled: Bool = true) {
        for button in navigationButtons {
            button.enabled = enabled
        }
    }

    private func showRecipe(recipe: Recipe) {
        titleLabel.text = recipe.title
        enableButtons(false)
        
        let newViewController = recipe.instantiateViewController()
        let oldViewController = childViewControllers[0]
        
        let newView = newViewController.view
        let containerMargins = containerView.layoutMarginsGuide

        newView.translatesAutoresizingMaskIntoConstraints = false
        addChildViewController(newViewController)
        
        transitionFromViewController(oldViewController, toViewController: newViewController, duration: 0.25, options: [.TransitionCrossDissolve], animations: {
            newView.leadingAnchor.constraintEqualToAnchor(containerMargins.leadingAnchor).active = true
            newView.trailingAnchor.constraintEqualToAnchor(containerMargins.trailingAnchor).active = true
            newView.topAnchor.constraintEqualToAnchor(containerMargins.topAnchor).active = true
            newView.bottomAnchor.constraintEqualToAnchor(containerMargins.bottomAnchor).active = true
        }, completion: { [unowned self] _ in
            oldViewController.removeFromParentViewController()
            self.enableButtons()
        })
    }
}

