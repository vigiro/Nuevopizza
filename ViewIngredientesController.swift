//
//  ViewIngredientesController.swift
//  pizza
//
//  Created by vidal romero  on 13/07/16.
//  Copyright © 2016 vidal romero . All rights reserved.
//

import UIKit

protocol ingredientsPizzaDelegate {
    func setPizzaIngredients(ingredients:[String:String])
}

class ViewIngredientesController: UIViewController {
    
    @IBOutlet weak var switchHam: UISwitch!
    @IBOutlet weak var switchPepperoni: UISwitch!
    @IBOutlet weak var switchTurkey: UISwitch!
    @IBOutlet weak var switchSausage: UISwitch!
    @IBOutlet weak var switchOlive: UISwitch!
    @IBOutlet weak var switchOnion: UISwitch!
    @IBOutlet weak var switchPepper: UISwitch!
    @IBOutlet weak var switchPineapple: UISwitch!
    @IBOutlet weak var switchAnchovy: UISwitch!
    
    var delegate: ingredientsPizzaDelegate? = nil
    var ingredients = [String: String]()
    var pizzaIngredientsTmp:  Pizza?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setIngredientsOn()
        ingredients = (pizzaIngredientsTmp?.ingredientes)!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   
    func setIngredientsOn() {
        for (_, values) in (pizzaIngredientsTmp?.ingredientes)! {
            switch values {
            case "Jamon":
                switchHam.setOn(true, animated: true)
            case "Pepperoni":
                switchPepperoni.setOn(true, animated: true)
            case "Pavo":
                switchTurkey.setOn(true, animated: true)
            case "Salchicha":
                switchSausage.setOn(true, animated: true)
            case "Aceituna":
                switchOlive.setOn(true, animated: true)
            case "Cebolla":
                switchOnion.setOn(true, animated: true)
            case "Pimiento":
                switchPepper.setOn(true, animated: true)
            case "Piña":
                switchPineapple.setOn(true, animated: true)
            case "Anchoa":
                switchAnchovy.setOn(true, animated: true)
            default:
                switchHam.setOn(false, animated: true)
            }
            
        }
        
     
    }
    
    func existIngredient(key: String) -> Bool {
        if  (ingredients[key] == nil) {
            return true
        }else {
            return false
        }
    }
    
    func availableSpace() -> Bool {
        if ingredients.count < 5 {
            return true
        }else {
            return false
        }
        
    }
    
    @IBAction func setHam(sender: AnyObject) {
        let added = switchHam.on
        if added != true {
            ingredients["Ham"] = nil
            setPizzaIngredients(ingredients)
        }else {
            if availableSpace() {
                ingredients["Ham"] = "Jamon"
            }else {
                switchHam.setOn(false, animated: true)
            }
            setPizzaIngredients(ingredients)
        }
    }
    
    @IBAction func setPepperoni(sender: AnyObject) {
        let added = switchPepperoni.on
        if added != true {
            ingredients["Pepperoni"] = nil
            setPizzaIngredients(ingredients)
        }else {
            if availableSpace() {
                ingredients["Pepperoni"] = "Pepperoni"
            }else {
                switchPepperoni.setOn(false, animated: true)
            }
            setPizzaIngredients(ingredients)
        }
    }
    
    @IBAction func setTurkey(sender: AnyObject) {
        let added = switchTurkey.on
        if added != true {
            ingredients["Turkey"] = nil
            setPizzaIngredients(ingredients)
        }else {
            if availableSpace() {
                ingredients["Turkey"] = "Pavo"
            }else {
                switchTurkey.setOn(false, animated: true)
            }
            setPizzaIngredients(ingredients)
        }
    }
    
    @IBAction func setSausage(sender: AnyObject) {
        let added = switchSausage.on
        if added != true {
            ingredients["Sausage"] = nil
            setPizzaIngredients(ingredients)
        }else {
            if availableSpace() {
                ingredients["Sausage"] = "Salchicha"
            }else {
                switchSausage.setOn(false, animated: true)
            }
            setPizzaIngredients(ingredients)
        }
    }
    
    @IBAction func setOlive(sender: AnyObject) {
        let added = switchOlive.on
        if added != true {
            ingredients["Olive"] = nil
            setPizzaIngredients(ingredients)
        }else {
            if availableSpace() {
                ingredients["Olive"] = "Aceituna"
            }else {
                switchOlive.setOn(false, animated: true)
            }
            setPizzaIngredients(ingredients)
        }
    }
    
    @IBAction func setOnion(sender: AnyObject) {
        let added = switchOnion.on
        if added != true {
            ingredients["Onion"] = nil
            setPizzaIngredients(ingredients)
        }else {
            if availableSpace() {
                ingredients["Onion"] = "Cebolla"
            }else {
                switchOnion.setOn(false, animated: true)
            }
            setPizzaIngredients(ingredients)
        }
    }
    
    @IBAction func setPepper(sender: AnyObject) {
        let added = switchPepper.on
        if added != true {
            ingredients["Pepper"] = nil
            setPizzaIngredients(ingredients)
        }else {
            if availableSpace() {
                ingredients["Pepper"] = "Pimiento"
            }else {
                switchPepper.setOn(false, animated: true)
            }
            setPizzaIngredients(ingredients)
        }
    }
    
    @IBAction func setPineapple(sender: AnyObject) {
        let added = switchPineapple.on
        if added != true {
            ingredients["Pineapple"] = nil
            setPizzaIngredients(ingredients)
        }else {
            if availableSpace() {
                ingredients["Pineapple"] = "Piña"
            }else {
                switchPineapple.setOn(false, animated: true)
            }
            setPizzaIngredients(ingredients)
        }
    }
    
    @IBAction func setAnchovy(sender: AnyObject) {
        let added = switchAnchovy.on
        if added != true {
            ingredients["Anchovy"] = nil
            setPizzaIngredients(ingredients)
        }else {
            if availableSpace() {
                ingredients["Anchovy"] = "Anchoa"
            }else {
                switchAnchovy.setOn(false, animated: true)
            }
            setPizzaIngredients(ingredients)
        }
    }
    
    func setPizzaIngredients(ingredientes: [String: String]) {
        if delegate != nil {
            delegate!.setPizzaIngredients(ingredients)
           
        }
    }
    
}
