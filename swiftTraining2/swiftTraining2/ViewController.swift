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
        attributedString.addAttribute(.link, value: "https://hudson-tlv.com/", range: NSRange(location: 0, length: 9))
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



    func test1() {
          let imageWidth = self.view.frame.width
                let imageHeight = imageWidth * 0.75
                let urlString = "https://foxfoodreviews2.files.wordpress.com/2016/11/img_20161110_195733-1.jpg?w=" + String(Int(imageWidth)) + "&h=" + String(Int(imageHeight))
                let url = URL(string: urlString)
        //        image.load(url:url!)
                
                
                let label1 = UILabel()
                label1.translatesAutoresizingMaskIntoConstraints = false
                label1.numberOfLines = 0
        //        label1.textAlignment = NSTextAlignment.right
                let  x =  """
                זמן רב  שאני שומע מחברים על מסעדת <b>הדסון</b> בתל אביב, שנחשבת למסעדת בשר ברמה גבוהה עם סטייקים מן הטובים בארץ. החלטתי שהגיע זמן לנסות אותה עם האחיות שלי שגם אוהבות מאוד בשר. המסעדה ממוקמת ב<b>רחוב הברזל 27 בתל אביב</b> באיזור רמת החייל, ניתן להחנות ב<b>מגדלי אור</b> שממוקמים דקה מהמסעדה ולקבל הנחה בחנייה.<br>דם יותר כי יש כמות מוגבלת שלהם., אפילו לאחותי שלא מסוגלת לאכול בשר שהוא לא עשוי היטב. גם הבשר וגם השילוב שלו עם הרוטב המתקתק היה מצוין.

                """
                        
                label1.attributedText = x.htmlToAttributedString
                let label2 = UILabel()
                label2.translatesAutoresizingMaskIntoConstraints = false
                label2.text = "this is another test";

                
                let label3 = UILabel()
                label3.translatesAutoresizingMaskIntoConstraints = false
                label3.text = "this is yet another test";


                let label4 = UILabel()
                label4.translatesAutoresizingMaskIntoConstraints = false
                label4.text = "this is the end";

                let image1 = UIImageView()
                image1.translatesAutoresizingMaskIntoConstraints = false
                image1.load(url:url!)
                
                let image2 = UIImageView()
                image2.translatesAutoresizingMaskIntoConstraints = false
                image2.load(url:url!)

                
                let image3 = UIImageView()
                image3.translatesAutoresizingMaskIntoConstraints = false
                image3.load(url:url!)

                let image4 = UIImageView()
                image4.translatesAutoresizingMaskIntoConstraints = false
                image4.load(url:url!)


                stackView.addArrangedSubview(label1)
                stackView.addArrangedSubview(image1)
                stackView.addArrangedSubview(label2)
                stackView.addArrangedSubview(image2)
                stackView.addArrangedSubview(label3)
                stackView.addArrangedSubview(image3)
                stackView.addArrangedSubview(label4)
                stackView.addArrangedSubview(image4)

        //        stackView.addSubview(image1)

        //        self.view.addSubview(label)
                
                
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
