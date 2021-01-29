import Foundation

public final class DefaultStep<A>: Step<Context> where A.Type == Context.Type {
    let content: (() -> ())?
    let contentWithContext: ((_ context: inout Context) -> ())?
    let _title: String

    public convenience init(_ title: String, contentWithContext: ((_ context: inout Context)->())? = nil) {
        self.init(title, contentWithContext: contentWithContext, content: nil)
    }

    public convenience init(_ title: String, content: (()->())? = nil) {
        self.init(title, contentWithContext: nil, content: content)
    }

    init(_ title: String, contentWithContext: ((_ context: inout Context)->())?, content: (()->())?) {
        self.content = content
        self.contentWithContext = contentWithContext
        self._title = title
    }

    public override var title: String {
        _title
    }

    public override func execute(in context: inout Context) {
        content?()
        contentWithContext?(&context)
    }
}

