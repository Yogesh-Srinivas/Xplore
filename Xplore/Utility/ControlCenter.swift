struct ControlCenter{
    
    static let cleaningFeeInUSD : Double = 30
    static var cleaningFee : Double{
        get{
            return GeneralUtils.convertCurrency(of: cleaningFeeInUSD, from: "USD", to: GeneralUtils.getCurrentCurrency())
        }
    }
    static let serviceFeeInUSD : Double = 50
    
    static var serviceFee : Double{
        get{
            return GeneralUtils.convertCurrency(of: serviceFeeInUSD, from: "USD", to: GeneralUtils.getCurrentCurrency())
        }
    }
    
    static let fontConstant : Double = 3
    
    static let TermsOfService = """
Terms of service (ToS) is a type of document stating details about what a service provider is responsible for as well as user obligations that must be adhered to for continuation of the service. Users that don’t follow the rules specified in a ToS are subject to termination. Many websites and applications publish their terms of service.

Terms of service should include user rights and responsibilities. The ToS should also be transparent about all activities of the service that have significance for users, such as details of what the service does with user data as well as how the service maintains user privacy and security.

A ToS can specify what users can expect from the service so they cannot claim ignorance about something that they later object to. Similarly, specifying behaviors that will not be tolerated makes it easier for a service provider to get rid of problematic users, who otherwise might claim that they were unfairly terminated. Removing someone from a service that provides a channel to an audience is sometimes referred to as deplatforming.

Typically, ToS are presented to users for inspection, often in a pop-up, but the service provider may not require users to acknowledge having read them. In this case, continued use of the service is considered to constitute agreement to the terms. Even in cases where the user must claim to have read the terms of service, however, they frequently don’t because the documents tend to be long, and relevant details may not be prominently featured.

User rights groups recommend making terms of service more easily readable. One such initiative, ToS;DR, breaks down ToS for prominent websites and services.
"""
    static let PrivacyPolicy = """
Xplore is committed to protecting your privacy and ensuring the security of your personal information. As a leading online marketplace for lodging and travel experiences, we collect and use information from our users to provide and improve our services. This Privacy Policy describes how we collect, use, and share your information and the steps we take to protect your privacy.

What Information We Collect

When you use Airbnb, we may collect personal information from you, such as your name, email address, and phone number. We also collect information related to your bookings and payments, including your payment card details, billing address, and other financial information. In addition, we may collect information about your device and location, such as your IP address and mobile device ID.


How We Share Your Information

We may share your personal information with third parties as necessary to provide our services, such as with hosts, guests, and service providers involved in your bookings. We may also share your information with third-party service providers, such as payment processors, analytics providers, and customer support providers.

In addition, we may disclose your information to law enforcement agencies or other authorities as required by law or to protect the rights, property, or safety of Airbnb, our users, or others. If Airbnb is involved in a merger, acquisition, or sale of assets, we may transfer your information to the new owner or successor company.

Your Choices and Rights

You have the right to access, correct, or delete your personal information at any time. You can also opt out of receiving marketing communications from us by updating your preferences in your account settings or by following the unsubscribe instructions in our communications.

If you have any questions or concerns about our Privacy Policy or our practices regarding your personal information, please contact us at privacy@xplore.com.
"""
    
    
    static let cancellationPolicy = "Airbnb offers hosts the flexibility to choose from several different cancellation policies, each with varying levels of flexibility for guests. The most flexible policy is the \"Flexible\" policy, which allows guests to cancel up to 24 hours before check-in and receive a full refund. The \"Moderate\" policy allows guests to cancel up to 5 days before check-in for a full refund, while the \"Strict\" policy allows guests to cancel up to 7 days before check-in for a 50% refund. Hosts can also choose the \"Super Strict\" policy, which allows guests to cancel up to 30 days before check-in for a 50% refund or up to 60 days before check-in for a 50% refund. It is important for guests to carefully review a listing's cancellation policy before making a reservation to ensure they understand the terms and potential financial implications of cancellation."
    
    static let guestRules = "We ask every guest to remember a few simple things about what makes a great guest.\n\n\(Constants.BULLETING_POINT) Follow the house rules\n\(Constants.BULLETING_POINT) Treat your Host's home like your own"
    
    static let reserveConfirmText = "By selecting the below button I agree to the Host's House Rules,Ground rules for guest and I'm responsible for the damage."
}
