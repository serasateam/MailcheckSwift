import XCTest
@testable import MailcheckSwift

class MailcheckSwiftTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSuggest() {
        
        let defaultDomains = ["yahoo.com", "google.com", "hotmail.com", "gmail.com", "me.com", "aol.com", "mac.com", "live.com", "comcast.net", "googlemail.com", "msn.com", "hotmail.co.uk", "yahoo.co.uk", "facebook.com", "verizon.net", "sbcglobal.net", "att.net", "gmx.com", "mail.com", "yahoo.com.tw"];
        let defaultTopLevelDomains = ["co.uk", "com", "net", "org", "info", "edu", "gov", "mil", "com.tw"];

        // should return nil for a valid likely e-mail
        XCTAssertNil(Mailcheck.suggest("randomuser@gmail.com"))
        
        // should return nil for an invalid e-mail
        XCTAssertNil(Mailcheck.suggest("", domains: defaultDomains, topLevelDomains: defaultTopLevelDomains))
        XCTAssertNil(Mailcheck.suggest("test@yahoo.com.tw", domains: defaultDomains, topLevelDomains: defaultTopLevelDomains))
        XCTAssertNil(Mailcheck.suggest("test@", domains: defaultDomains, topLevelDomains: defaultTopLevelDomains))
        XCTAssertNil(Mailcheck.suggest("test", domains: defaultDomains, topLevelDomains: defaultTopLevelDomains))
        
        // should have a suggestion for possible mistyping
        XCTAssert(Mailcheck.suggest("test@emaildomain.co", domains: defaultDomains, topLevelDomains: defaultTopLevelDomains)?.domain == "emaildomain.com")
        XCTAssert(Mailcheck.suggest("test@gmail.con", domains: defaultDomains, topLevelDomains: defaultTopLevelDomains)?.domain == "gmail.com")
        XCTAssert(Mailcheck.suggest("test@gnail.con", domains: defaultDomains, topLevelDomains: defaultTopLevelDomains)?.domain == "gmail.com")
        XCTAssert(Mailcheck.suggest("test@GNAIL.con", domains: defaultDomains, topLevelDomains: defaultTopLevelDomains)?.domain == "gmail.com")
        XCTAssert(Mailcheck.suggest("test@#gmail.com", domains: defaultDomains, topLevelDomains: defaultTopLevelDomains)?.domain == "gmail.com")
        XCTAssert(Mailcheck.suggest("test@comcast.com", domains: defaultDomains, topLevelDomains: defaultTopLevelDomains)?.domain == "comcast.net")
        XCTAssert(Mailcheck.suggest("test@hotmail.con", domains: defaultDomains, topLevelDomains: defaultTopLevelDomains)?.domain == "hotmail.com")
        XCTAssert(Mailcheck.suggest("test@hotmail.co", domains: defaultDomains, topLevelDomains: defaultTopLevelDomains)?.domain == "hotmail.com")
        XCTAssert(Mailcheck.suggest("test@fabecook.com", domains: defaultDomains, topLevelDomains: defaultTopLevelDomains)?.domain == "facebook.com")
        XCTAssert(Mailcheck.suggest("test@yajoo.com", domains: defaultDomains, topLevelDomains: defaultTopLevelDomains)?.domain == "yahoo.com")
        XCTAssert(Mailcheck.suggest("test@randomsmallcompany.cmo", domains: defaultDomains, topLevelDomains: defaultTopLevelDomains)?.domain == "randomsmallcompany.com")
        
    }
    
}
