# Stardew Helper

An iOS App for information management and tips surrounding Stardew Valley gameplay.

Warnings: 
- This is mostly me just messing around with learning some iOS stuff and adding features to an app for me to use while playing Stardew Valley on my Switch.
- I'm working on a script to automatically grab game files and add them to the resources folder for easily updating them, but in the mean time they have to be populated on an individual basis.
 
## Current Features

#### Create + Delete User Profiles
[Note -- Remixed Bundles selection functionality in progress]

<img width="375" alt="Screenshot 2024-06-12 at 7 39 45 PM" src="https://github.com/mpleclai/stardew-ios-helper/assets/25015098/066bdb58-1a3a-499a-a852-132510330c90">

<img width="391" alt="Screenshot 2024-06-12 at 7 40 15 PM" src="https://github.com/mpleclai/stardew-ios-helper/assets/25015098/005dd069-59d3-45e8-9032-36cd996004db">


#### Community Center Bundle Checklist
<img width="396" alt="2024-06-12 19 42 04" src="https://github.com/mpleclai/stardew-ios-helper/assets/25015098/8fe3645c-bfb5-4c46-97b8-8f1b29c14970">

#### Museum Checklist
<img width="384" alt="Screenshot 2024-06-12 at 7 41 48 PM" src="https://github.com/mpleclai/stardew-ios-helper/assets/25015098/c0d9e92b-0d6c-49ea-8c94-ff8f30112170">

#### Crops Lookup
<img width="396" alt="2024-06-12 19 25 18" src="https://github.com/mpleclai/stardew-ios-helper/assets/25015098/4841f99f-f314-48b0-be4d-f0b3349c5623">

#### Fishing Lookup
<img width="396" alt="2024-06-12 19 44 00" src="https://github.com/mpleclai/stardew-ios-helper/assets/25015098/b246d1cd-fbd4-4bb6-a0a6-6b321cdd82af">

#### Farm Animal Lookup
<img width="396" alt="2024-06-12 19 28 17" src="https://github.com/mpleclai/stardew-ios-helper/assets/25015098/8ee2bb85-bb61-4e71-9316-1ff3fd17d2c6">


#### [In Progress] Villager Lookup
[TODO - Parse + Present game schedule data]

<img width="396" alt="2024-06-12 19 19 46" src="https://github.com/mpleclai/stardew-ios-helper/assets/25015098/11fd4010-df57-4d36-a7c0-6cf88316a316">

#### [In Progress] Location Lookup
<img width="396" alt="2024-06-12 19 22 01" src="https://github.com/mpleclai/stardew-ios-helper/assets/25015098/d4819618-9cab-4b3a-af9b-c423e025bb30">


#### [In Progress] Reminders Section
<img width="399" alt="Screenshot 2024-06-12 at 7 18 18 PM" src="https://github.com/mpleclai/stardew-ios-helper/assets/25015098/1f461f24-b46a-4839-9356-75da2d07314c">

Currently Completed:
- Birthdays
- Last Day to Plant Crops/Last Day of Season
- Traveling Cart
- Krobus selling Sprinkler

## Getting Started

### Set-Up

#### XCode
 * You can download from either [Apple's Developer Site](https://developer.apple.com/download/applications/) or the App Store on your Mac
 * As of 3/29/24, I am running Version 15.3

#### Resource Files
 * When the project is opened, there will not exist a Resources directory under StardewHelper containing the relevant JSON files
 * I am working on a script to make this step easy given I am parsing several of the game files to get the data I was using for the app

 * Current Resources I have locally are:
<img width="159" alt="Screenshot 2024-06-12 at 7 11 04 PM" src="https://github.com/mpleclai/stardew-ios-helper/assets/25015098/e08aa703-f5ce-48a4-93e9-a23c41f0c501">


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
