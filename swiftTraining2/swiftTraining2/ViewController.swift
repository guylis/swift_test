//
//  ViewController.swift
//  swiftTraining2
//
//  Created by Guy Lis on 03/01/2020.
//  Copyright © 2020 Ironsource. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    @IBOutlet weak var details: UILabel!
//    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var linkTextView: UITextView!
    @IBOutlet weak var stack2: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        test2()
        let attributedString = NSMutableAttributedString(string: "Site Link")
        attributedString.addAttribute(.link, value: "https://google.com/", range: NSRange(location: 0, length: 9))
        linkTextView.attributedText = attributedString

    }

    func test2() {
        for n in 1...100 {
            
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = " stack 1 item" + String(n);
            stackView.addArrangedSubview(label)
        }
        
        for n in 1...20 {
            
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = " stack 2 item" + String(n);
            stack2.addArrangedSubview(label)
        }

    }



    
}
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

extension String {
    var htmlToAttributedString: NSMutableAttributedString? {
        guard let data = data(using: .utf8) else { return NSMutableAttributedString() }
        do {
            let richText =  try NSMutableAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .right

            richText.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: richText.length))
            return richText
        } catch {
            return NSMutableAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
