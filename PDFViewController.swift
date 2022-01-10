import Foundation
import PDFKit

class PDFViewController : UIViewController{

    lazy var pdfView : PDFView = {
        let pdfView = PDFView()
        pdfView.autoScales = true
        pdfView.frame = self.view.bounds
        return pdfView
    }()
    
    var pdfUrl : String
    
    init(pdfUrl : String){
        self.pdfUrl = pdfUrl
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(pdfView)
        displayPdf()
    }
    
    private func displayPdf() {
        if let pdfDocument = self.createPdfDocument(forFileName: "pdffile") {
            self.view.addSubview(pdfView)
            pdfView.document = pdfDocument
        }
    }
    
    private func createPdfDocument(forFileName fileName: String) -> PDFDocument? {
        if let resourceUrl = URL(string: pdfUrl) {
            return PDFDocument(url: resourceUrl)
        }
        return nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
