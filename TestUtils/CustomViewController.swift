//
//  CustomViewController.swift
//  TestCoreData
//
//  Created by Admin on 5/23/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit
extension UIView{
    func animShow(){
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseIn],
                       animations: {
                        self.center.y -= self.bounds.height
                        self.layoutIfNeeded()
        }, completion: nil)
        self.isHidden = false
    }
    func animHide(){
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveLinear],
                       animations: {
                        self.center.y += self.bounds.height
                        self.layoutIfNeeded()
                        
        },  completion: {(_ completed: Bool) -> Void in
            self.isHidden = true
        })
    }
}

class CustomViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    var responderView: UIView!
    var compPicker = Int()
    var pickerData = [String]()

    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var customPIcker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bottomView.animHide()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.bottomView.animShow()
        }
        // Do any additional setup after loading the view.
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
        self.view.addGestureRecognizer(gesture)
        self.customPIcker.reloadAllComponents()
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.responderView is UITextField {
            (self.responderView as! UITextField).inputView = self.customPIcker
        }
    }
    func setUpPickerViewResponder(respView:UIView,data:[String],comp:Int) {
        self.pickerData = data
        self.responderView = respView
        self.compPicker = comp
        self.responderView = respView
        if respView is UITextField {
            (respView as! UITextField).inputView = nil
        }
    }
    @objc func checkAction(sender : UITapGestureRecognizer) {
        // Do what you want
        self.dismiss(animated: true, completion: nil)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.pickerData[row]
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
