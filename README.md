# SoundManager
Parse pod will need to be installed so sounds can be populated from Parse.

If you don't already have cocoapods installed:

Open Terminal
Type without quotes:

"sudo gem install cocoapods"
-enter password

Type without quotes:

"pod setup"

-navigate to project folder
Type without quotes:

"pod init"

-open up Podfile
Type without quotes:

"open -a XCode Podfile"

-In the file that opens on a line above target type

pod 'Parse'
-Save and quit XCode

-In Terminal and still in project folder type without quotes:

"pod install"

-When completed quit terminal and launch XCode
-open the workspace file rather than project file. (.xcworkspace rather than .xcodeproject
