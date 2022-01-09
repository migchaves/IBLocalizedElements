# IBLocalizedElements

This small project pretends to show how to localize strings directly in the Interface Builder.

1 - Create extensions for string localization:

extension String {
    
    var localized: String {
        return NSLocalizedString(
            self,
            tableName: nil,
            bundle: Bundle.main,
            value: "",
            comment: "")
    }
}
