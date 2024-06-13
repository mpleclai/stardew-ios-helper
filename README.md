# Stardew Helper

An iOS App for information management and tips surrounding Stardew Valley gameplay.

## Getting Started

### Set-Up

#### XCode
 * You can download from either [Apple's Developer Site](https://developer.apple.com/download/applications/) or the App Store on your Mac
 * As of 3/29/24, I am running Version 15.3

#### Resource Files
 * If when the project is opened, there does not exist a Resources directory under StardewHelper containing all of the json files, please create one by:
1. Right clicking on StardewHelper and selecting 'New Group' and then naming it Resources
2. Cloning the contents of the project here: https://github.com/mpleclai/stardew-helper-data
3. Right clicking on Resources and selecting 'Add Files to "StardewHelper" ...'
4. Select all the contents within 'stardew-helper-data/script_output/' + under "Added Folders" hit "Create Folder References"
5. Click the "Add" button and they should be added to the project

#### Simulator/Device Setup
 * [Apple Developer Simulator Documentatiion](https://developer.apple.com/documentation/xcode/running-your-app-in-the-simulator-or-on-a-device)
 * My personal setup: 
     <img width="906" alt="Screen Shot 2022-07-08 at 12 44 02 PM" src="https://user-images.githubusercontent.com/25015098/178043497-29c34ecc-7262-4abb-b815-ba9c7d8ba6ae.png">

### Installing

* You should just be able to clone from this git repository and open in XCode

### Executing program
* Once you have your simulator (Virtual Device) set up you can either hit the play button in the upper left to pull up a virtual device:

    <img width="413" alt="Screen Shot 2022-07-08 at 12 50 01 PM" src="https://user-images.githubusercontent.com/25015098/178044344-5cec2a08-5ff2-4340-ac6f-acb0b4372861.png">

* Or you can just hit the play button above the preview on the right hand side of the screen.

    <img width="453" alt="Screen Shot 2022-07-08 at 12 49 50 PM" src="https://user-images.githubusercontent.com/25015098/178044322-867e9ff7-0d4e-44fd-a4c8-9101d78beb7d.png">

## Help
* What can I use for linting?  
  * I use https://github.com/realm/SwiftLint which can be installed with `brew install swiftlint`
  * Run `swiftlint --fix`to auto-fix issues
* Do I commit `StardewHelper.xcodeproj/project.pbxproj`?
  * Yes - the project.pbxproj file holds all of the info for a target's files and build settings.
* Do I commit `StardewHelper.xcodeproj/xcuserdata/[yournamehere].xcuserdatad/xcdebugger/`?
  *  This should be covered in the gitignore - but in the off chance it doesn't catch it - do NOT commit this since it makes annoying conflicts.
* My Preview that's usually on the right side disappeared - how do I get it to come back?
  * Editor -> Canvas
