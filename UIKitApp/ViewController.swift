//
//  ViewController.swift
//  UIKit
//
//  Created by Anna Lavrova on 01.02.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Label
        mainLabel.font = mainLabel.font.withSize(35)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2

        // Segmented Controll
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)

        // Slider
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .blue
        slider.maximumTrackTintColor = .gray
        slider.thumbTintColor = .white

        mainLabel.text = String(slider.value)

        // Button
        doneButton.setTitle("Done", for: .normal)
        doneButton.setTitleColor(.white, for: .normal)

        // Date Picker
        datePicker.locale = Locale(identifier: "ru_RU")
    }


    @IBAction func segmentedControlAction() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "The first segment is selected"
            mainLabel.textColor = .red

        case 1:
            mainLabel.text = "The second segment is selected"
            mainLabel.textColor = .blue

        default:
            mainLabel.text = "The third segment is selected"
            mainLabel.textColor = .yellow
        }
    }


    @IBAction func sliderAction() {
        mainLabel.text = String(slider.value)
        let sliderValue = CGFloat(slider.value)
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(sliderValue)
    }


    @IBAction func doneButtonPressed() {
        guard let inputText = textField.text, !inputText.isEmpty else {
            showAlert(with: "Text field is empty", and: "Please enter your name")
            return
        }

        if let _ = Double(inputText) {
            showAlert(with: "Wrong Format", and: "Please enter your name")
            return
        }
        mainLabel.text = textField.text
    }

    @IBAction func datePicked() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.locale = Locale(identifier: "ru_RU")

        mainLabel.text = formatter.string(from: datePicker.date)
    }
    
}

// MARK: - Private Methods

extension ViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.textField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }


}

