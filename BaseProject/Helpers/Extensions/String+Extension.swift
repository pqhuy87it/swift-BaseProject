import Foundation
import UIKit

// MARK: - Initializers

extension String {
	/// SwifterSwift: Create a new string from a base64 string (if applicable).
	///
	///		String(base64: "SGVsbG8gV29ybGQh") = "Hello World!"
	///		String(base64: "hello") = nil
	///
	/// - Parameter base64: base64 string.
	init?(base64: String) {
		guard let decodedData = Data(base64Encoded: base64) else { return nil }
		guard let str = String(data: decodedData, encoding: .utf8) else { return nil }
		self.init(str)
	}

	/// SwifterSwift: Create a new random string of given length.
	///
	///		String(randomOfLength: 10) -> "gY8r3MHvlQ"
	///
	/// - Parameter length: number of characters in string.
	init(randomOfLength length: Int) {
		guard length > 0 else {
			self.init()
			return
		}

		let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
		var randomString = ""
		for _ in 1...length {
			randomString.append(base.randomElement()!)
		}
		self = randomString
	}
}

// MARK: - Properties

extension String {
	/// SwifterSwift: NSString from a string.
	var nsString: NSString {
		return NSString(string: self)
	}

	/// SwifterSwift: The full `NSRange` of the string.
	var fullNSRange: NSRange { NSRange(startIndex..<endIndex, in: self) }

	/// SwifterSwift: NSString lastPathComponent.
	var lastPathComponent: String {
		return (self as NSString).lastPathComponent
	}

	/// SwifterSwift: NSString deletingLastPathComponent.
	var deletingLastPathComponent: String {
		return (self as NSString).deletingLastPathComponent
	}

	/// SwifterSwift: NSString pathComponents.
	var pathComponents: [String] {
		return (self as NSString).pathComponents
	}

	var firstUppercased: String { prefix(1).uppercased() + dropFirst() }

	var firstCapitalized: String { prefix(1).capitalized + dropFirst() }
}

// MARK: - Methods

extension String {
	/// SwifterSwift: Float value from string (if applicable).
	///
	/// - Parameter locale: Locale (default is Locale.current)
	/// - Returns: Optional Float value from given string.
	func float(locale: Locale = .current) -> Float? {
		let formatter = NumberFormatter()
		formatter.locale = locale
		formatter.allowsFloats = true
		return formatter.number(from: self)?.floatValue
	}

	/// SwifterSwift: Double value from string (if applicable).
	///
	/// - Parameter locale: Locale (default is Locale.current)
	/// - Returns: Optional Double value from given string.
	func double(locale: Locale = .current) -> Double? {
		let formatter = NumberFormatter()
		formatter.locale = locale
		formatter.allowsFloats = true
		return formatter.number(from: self)?.doubleValue
	}

	/// SwifterSwift: CGFloat value from string (if applicable).
	///
	/// - Parameter locale: Locale (default is Locale.current)
	/// - Returns: Optional CGFloat value from given string.
	func cgFloat(locale: Locale = .current) -> CGFloat? {
		let formatter = NumberFormatter()
		formatter.locale = locale
		formatter.allowsFloats = true
		return formatter.number(from: self) as? CGFloat
	}

	/// SwifterSwift: Array of strings separated by new lines.
	///
	///		"Hello\ntest".lines() -> ["Hello", "test"]
	///
	/// - Returns: Strings separated by new lines.
	func lines() -> [String] {
		var result = [String]()
		enumerateLines { line, _ in
			result.append(line)
		}
		return result
	}

	/// SwifterSwift: an array of all words in a string
	///
	///		"Swift is amazing".words() -> ["Swift", "is", "amazing"]
	///
	/// - Returns: The words contained in a string.
	func words() -> [String] {
		// https://stackoverflow.com/questions/42822838
		let chararacterSet = CharacterSet.whitespacesAndNewlines.union(.punctuationCharacters)
		let comps = components(separatedBy: chararacterSet)
		return comps.filter { !$0.isEmpty }
	}

	/// SwifterSwift: Count of words in a string.
	///
	///		"Swift is amazing".wordsCount() -> 3
	///
	/// - Returns: The count of words contained in a string.
	func wordCount() -> Int {
		// https://stackoverflow.com/questions/42822838
		let chararacterSet = CharacterSet.whitespacesAndNewlines.union(.punctuationCharacters)
		let comps = components(separatedBy: chararacterSet)
		let words = comps.filter { !$0.isEmpty }
		return words.count
	}

	/// SwifterSwift: Safely subscript string with index.
	///
	///		"Hello World!"[safe: 3] -> "l"
	///		"Hello World!"[safe: 20] -> nil
	///
	/// - Parameter index: index.
	subscript(safe index: Int) -> Character? {
		guard index >= 0, index < count else { return nil }
		return self[self.index(startIndex, offsetBy: index)]
	}

	/// SwifterSwift: Safely subscript string within a given range.
	///
	///        "Hello World!"[safe: 6..<11] -> "World"
	///        "Hello World!"[safe: 21..<110] -> nil
	///
	///        "Hello World!"[safe: 6...11] -> "World!"
	///        "Hello World!"[safe: 21...110] -> nil
	///
	/// - Parameter range: Range expression.
	subscript<R>(safe range: R) -> String? where R: RangeExpression, R.Bound == Int {
		let range = range.relative(to: Int.min..<Int.max)
		guard range.lowerBound >= 0,
			  let lowerIndex = index(startIndex, offsetBy: range.lowerBound, limitedBy: endIndex),
			  let upperIndex = index(startIndex, offsetBy: range.upperBound, limitedBy: endIndex) else {
			return nil
		}

		return String(self[lowerIndex..<upperIndex])
	}

	/// SwifterSwift: First character of string uppercased(if applicable) while keeping the original string.
	///
	///        "hello world".firstCharacterUppercased() -> "Hello world"
	///        "".firstCharacterUppercased() -> ""
	///
	mutating func firstCharacterUppercased() {
		guard let first = first else { return }
		self = String(first).uppercased() + dropFirst()
	}

	/// SwifterSwift: Check if string contains one or more instance of substring.
	///
	///		"Hello World!".contain("O") -> false
	///		"Hello World!".contain("o", caseSensitive: false) -> true
	///
	/// - Parameters:
	///   - string: substring to search for.
	///   - caseSensitive: set true for case sensitive search (default is true).
	/// - Returns: true if string contains one or more instance of substring.
	func contains(_ string: String, caseSensitive: Bool = true) -> Bool {
		if !caseSensitive {
			return range(of: string, options: .caseInsensitive) != nil
		}
		return range(of: string) != nil
	}

	/// SwifterSwift: Count of substring in string.
	///
	///		"Hello World!".count(of: "o") -> 2
	///		"Hello World!".count(of: "L", caseSensitive: false) -> 3
	///
	/// - Parameters:
	///   - string: substring to search for.
	///   - caseSensitive: set true for case sensitive search (default is true).
	/// - Returns: count of appearance of substring in string.
	func count(of string: String, caseSensitive: Bool = true) -> Int {
		if !caseSensitive {
			return lowercased().components(separatedBy: string.lowercased()).count - 1
		}
		return components(separatedBy: string).count - 1
	}

	/// SwifterSwift: Check if string ends with substring.
	///
	///		"Hello World!".ends(with: "!") -> true
	///		"Hello World!".ends(with: "WoRld!", caseSensitive: false) -> true
	///
	/// - Parameters:
	///   - suffix: substring to search if string ends with.
	///   - caseSensitive: set true for case sensitive search (default is true).
	/// - Returns: true if string ends with substring.
	func ends(with suffix: String, caseSensitive: Bool = true) -> Bool {
		if !caseSensitive {
			return lowercased().hasSuffix(suffix.lowercased())
		}
		return hasSuffix(suffix)
	}

	/// SwifterSwift: Reverse string.
	@discardableResult
	mutating func reverse() -> String {
		let chars: [Character] = reversed()
		self = String(chars)
		return self
	}

	/// SwifterSwift: Removes given prefix from the string.
	///
	///   "Hello, World!".removingPrefix("Hello, ") -> "World!"
	///
	/// - Parameter prefix: Prefix to remove from the string.
	/// - Returns: The string after prefix removing.
	func removingPrefix(_ prefix: String) -> String {
		guard hasPrefix(prefix) else { return self }
		return String(dropFirst(prefix.count))
	}

	/// SwifterSwift: Removes given suffix from the string.
	///
	///   "Hello, World!".removingSuffix(", World!") -> "Hello"
	///
	/// - Parameter suffix: Suffix to remove from the string.
	/// - Returns: The string after suffix removing.
	func removingSuffix(_ suffix: String) -> String {
		guard hasSuffix(suffix) else { return self }
		return String(dropLast(suffix.count))
	}

	/// SwifterSwift: Adds prefix to the string.
	///
	///     "www.apple.com".withPrefix("https://") -> "https://www.apple.com"
	///
	/// - Parameter prefix: Prefix to add to the string.
	/// - Returns: The string with the prefix prepended.
	func withPrefix(_ prefix: String) -> String {
		// https://www.hackingwithswift.com/articles/141/8-useful-swift-extensions
		guard !hasPrefix(prefix) else { return self }
		return prefix + self
	}

	/// SwifterSwift: NSString appendingPathComponent(str: String)
	///
	/// - Note: This method only works with file paths (not, for example, string representations of URLs.
	///   See NSString [appendingPathComponent(_:)](https://developer.apple.com/documentation/foundation/nsstring/1417069-appendingpathcomponent)
	/// - Parameter str: the path component to append to the receiver.
	/// - Returns: a new string made by appending aString to the receiver, preceded if necessary by a path separator.
	func appendingPathComponent(_ str: String) -> String {
		return (self as NSString).appendingPathComponent(str)
	}
}

// MARK: - Date

extension String {
	/// SwifterSwift: Date object from string of date format.
	///
	///		"2017-01-15".date(withFormat: "yyyy-MM-dd") -> Date set to Jan 15, 2017
	///		"not date string".date(withFormat: "yyyy-MM-dd") -> nil
	///
	/// - Parameter format: date format.
	/// - Returns: Date object from string (if applicable).
	func date(withFormat format: String) -> Date? {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = format
		return dateFormatter.date(from: self)
	}
}

// MARK: - Substring

extension String {
	/// SwifterSwift: Sliced string from a start index with length.
	///
	///        "Hello World".slicing(from: 6, length: 5) -> "World"
	///
	/// - Parameters:
	///   - index: string index the slicing should start from.
	///   - length: amount of characters to be sliced after given index.
	/// - Returns: sliced substring of length number of characters (if applicable) (example: "Hello World".slicing(from: 6, length: 5) -> "World")
	func slicing(from index: Int, length: Int) -> String? {
		guard length >= 0, index >= 0, index < count else { return nil }
		guard index.advanced(by: length) <= count else {
			return self[safe: index..<count]
		}
		guard length > 0 else { return "" }
		return self[safe: index..<index.advanced(by: length)]
	}

	/// SwifterSwift: Slice given string from a start index with length (if applicable).
	///
	///		var str = "Hello World"
	///		str.slice(from: 6, length: 5)
	///		print(str) // prints "World"
	///
	/// - Parameters:
	///   - index: string index the slicing should start from.
	///   - length: amount of characters to be sliced after given index.
	@discardableResult
	mutating func slice(from index: Int, length: Int) -> String {
		if let str = slicing(from: index, length: length) {
			self = String(str)
		}
		return self
	}

	/// SwifterSwift: Slice given string from a start index to an end index (if applicable).
	///
	///		var str = "Hello World"
	///		str.slice(from: 6, to: 11)
	///		print(str) // prints "World"
	///
	/// - Parameters:
	///   - start: string index the slicing should start from.
	///   - end: string index the slicing should end at.
	@discardableResult
	mutating func slice(from start: Int, to end: Int) -> String {
		guard end >= start else { return self }
		if let str = self[safe: start..<end] {
			self = str
		}
		return self
	}

	/// SwifterSwift: Slice given string from a start index (if applicable).
	///
	///		var str = "Hello World"
	///		str.slice(at: 6)
	///		print(str) // prints "World"
	///
	/// - Parameter index: string index the slicing should start from.
	@discardableResult
	mutating func slice(at index: Int) -> String {
		guard index < count else { return self }
		if let str = self[safe: index..<count] {
			self = str
		}
		return self
	}

	/// SwifterSwift: Removes spaces and new lines in beginning and end of string.
	///
	///		var str = "  \n Hello World \n\n\n"
	///		str.trim()
	///		print(str) // prints "Hello World"
	///
	@discardableResult
	mutating func trim() -> String {
		self = trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
		return self
	}

	/// SwifterSwift: Returns a new string in which all occurrences of a regex in a specified range of the receiver are replaced by the template.
	/// - Parameter regex: Regex to replace.
	/// - Parameter template: The template to replace the regex.
	/// - Parameter options: The matching options to use
	/// - Parameter searchRange: The range in the receiver in which to search.
	/// - Returns: A new string in which all occurrences of regex in searchRange of the receiver are replaced by template.
	func replacingOccurrences(
		of regex: NSRegularExpression,
		with template: String,
		options: NSRegularExpression.MatchingOptions = [],
		range searchRange: Range<String.Index>? = nil) -> String {
		let range = NSRange(searchRange ?? startIndex..<endIndex, in: self)
		return regex.stringByReplacingMatches(in: self, options: options, range: range, withTemplate: template)
	}
}

// MARK: - NSRegularExpression

extension String {
	/// SwifterSwift: Verify if string matches the regex pattern.
	///
	/// - Parameter pattern: Pattern to verify.
	/// - Returns: `true` if string matches the pattern.
	func matches(pattern: String) -> Bool {
		return range(of: pattern, options: .regularExpression, range: nil, locale: nil) != nil
	}

	/// SwifterSwift: Verify if string matches the regex.
	///
	/// - Parameter regex: Regex to verify.
	/// - Parameter options: The matching options to use.
	/// - Returns: `true` if string matches the regex.
	func matches(regex: NSRegularExpression, options: NSRegularExpression.MatchingOptions = []) -> Bool {
		let range = NSRange(startIndex..<endIndex, in: self)
		return regex.firstMatch(in: self, options: options, range: range) != nil
	}

	func find(pattern: String) -> NSTextCheckingResult? {
		do {
			let re = try NSRegularExpression(pattern: pattern, options: [])
			return re.firstMatch(
				in: self,
				options: [],
				range: NSMakeRange(0, self.utf16.count))
		} catch {
			return nil
		}
	}
}

// MARK: - URL

extension String {
	/// SwifterSwift: Convert URL string to readable string.
	///
	///		var str = "it's%20easy%20to%20decode%20strings"
	///		str.urlDecode()
	///		print(str) // prints "it's easy to decode strings"
	///
	@discardableResult
	mutating func urlDecode() -> String {
		if let decoded = removingPercentEncoding {
			self = decoded
		}
		return self
	}

	/// SwifterSwift: Escape string.
	///
	///		var str = "it's easy to encode strings"
	///		str.urlEncode()
	///		print(str) // prints "it's%20easy%20to%20encode%20strings"
	///
	@discardableResult
	mutating func urlEncode() -> String {
		if let encoded = addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
			self = encoded
		}
		return self
	}
}

// MARK: - Localized

extension String {
	@discardableResult func localize(_ comment: String? = nil) -> String {
		return NSLocalizedString(self,
								 tableName: AppSetting.shared.language.localizeTableName,
								 comment: comment ?? "")
	}

	/// Fetches a localised String Arguments
	///
	/// - Parameter arguments: parameters to be added in a string
	/// - Returns: localized string
	public func localized(with arguments: [CVarArg]) -> String {
		return String(format: self.localize(), locale: nil, arguments: arguments)
	}
}

// MARK: - Random

extension String {
	/// SwifterSwift: Random string of given length.
	///
	///		String.random(ofLength: 18) -> "u7MMZYvGo9obcOcPj8"
	///
	/// - Parameter length: number of characters in string.
	/// - Returns: random string of given length.
	static func random(ofLength length: Int) -> String {
		guard length > 0 else { return "" }
		let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
		var randomString = ""
		for _ in 1...length {
			randomString.append(base.randomElement()!)
		}
		return randomString
	}
}

// MARK: - Range NSRange

extension String {
	/// SwifterSwift: Convert an `NSRange` into `Range<String.Index>`.
	/// - Parameter nsRange: The `NSRange` within the receiver.
	/// - Returns: The equivalent `Range<String.Index>` of `nsRange` found within the receiving string.
	func range(from nsRange: NSRange) -> Range<Index> {
		guard let range = Range(nsRange, in: self) else { fatalError("Failed to find range \(nsRange) in \(self)") }
		return range
	}

	/// SwifterSwift: Convert a `Range<String.Index>` into `NSRange`.
	/// - Parameter range: The `Range<String.Index>` within the receiver.
	/// - Returns: The equivalent `NSRange` of `range` found within the receiving string.
	func nsRange(from range: Range<Index>) -> NSRange {
		return NSRange(range, in: self)
	}

	func nSRangeOf(_ str: String) -> NSRange {
		return (self as NSString).range(of: str)
	}
}

// MARK: - REALM

extension String {
	func dictionaryValue() -> [String: Any] {
		if let data = self.data(using: String.Encoding.utf8) {
			do {
				let json = try JSONSerialization.jsonObject(with: data,
															options: JSONSerialization.ReadingOptions.allowFragments) as? [String: AnyObject]
				return json!
			} catch {
				logD("Error converting to JSON", logLevel: .error)
			}
		}

		return NSDictionary() as! [String : AnyObject]
	}
}

extension String {

    func isNumber() -> Bool {
        let numberRegex = "^[0-9]*$"
        return NSPredicate(format: "SELF MATCHES %@", numberRegex).evaluate(with:self)
    }
    
    public func subString(fromIndex: Int, toIndex: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: fromIndex)..<self.index(self.startIndex, offsetBy: toIndex)])
    }

    func conversionParam() -> String {
        return self.replacingOccurrences(of: "=", with: "")
            .replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "/", with: "_")
    }

    func utf8DecodedString() -> String {
        let data = self.data(using: .utf8)
        if let message = String(data: data!, encoding: .nonLossyASCII){
            return message
        }
        return ""
    }
    
    func utf8EncodedString() -> String? {
        let messageData = self.data(using: .nonLossyASCII)
        let text = String(data: messageData!, encoding: .utf8)
        return text
    }
    
    func utf16EncodedString() -> String? {
        let dataEncoding = self.data(using: String.Encoding.nonLossyASCII)
        return String(data: dataEncoding!, encoding: String.Encoding.utf8)
    }

	// MARK: - Prefix Suffix

	// Prefix

	func caseInsensitiveHasPrefix(_ prefix: String) -> Bool {
		return lowercased().hasPrefix(prefix.lowercased())
	}

	// Suffix

	func caseInsensitiveHasSuffix(_ suffix: String) -> Bool {
		return lowercased().hasSuffix(suffix.lowercased())
	}
}

