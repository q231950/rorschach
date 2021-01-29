import Foundation
import XCTest

public class DefaultAssertion<Context>: Assertion<Context> {
    let content: (() -> ())?
    let contentWithContext: ((_ context: Context) -> ())?
    let _title: String

    public convenience init(_ title: String, contentWithContext: ((_ context: Context)->())? = nil) {
        self.init(title, contentWithContext: contentWithContext, content: nil)
    }

    public convenience init(_ title: String, content: (()->())? = nil) {
        self.init(title, contentWithContext: nil, content: content)
    }

    init(_ title: String, contentWithContext: ((_ context: Context)->())?, content: (()->())?) {
        self.content = content
        self.contentWithContext = contentWithContext
        self._title = title
    }

    public override var title: String {
        _title
    }

    public override func assert(in context: Context) {
        content?()
        contentWithContext?(context)
    }
}
