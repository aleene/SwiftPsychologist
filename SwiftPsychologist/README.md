# SwiftPsychologist

This application is written in Swift 2.1 using Xcode 7.2

The purpose for the application is getting to learn Swift. I follow the Stanford course by Paul Hegarty of spring 2015. This application is exactly as he presented in his lectures.

## Changes from the course application
There are a few changes from what is presented during the cours. I guess this is due to a Swift language change. In PsychologistViewController the `var destination = segue.destinationViewController as? UIViewController` gives the error "conditional cast always succeeds" and is now changed to `var destination = segue.destinationViewController`. Not sure why a conditionals cast was needed anyway, as it will be checked later on anyway

