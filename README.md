Xcode5_plug-in_template
=======================

# Xcode 5 plug-in template

Basic template for creating a plugin for Xcode 5 dev 6 and hopefully it will work in the GM.
It is an adaptation of the XCode 4 plugin by [Delisa Mason - xcode 4 plugin template](https://github.com/kattrali/Xcode4-Plugin-Template )

## Installation

- Clone or copy this project to `~/Library/Developer/Xcode/Templates/Project Templates/Application Plug-in/Xcode5 Plugin.xctemplate`. 
(Create the `Templates/Project Templates/Application Plug-in` subdirectories if they do not already exist.)
- Restart Xcode
- When creating a new Xcode plugin, create a new project and select **Xcode5 Plugin** from `OS X > Application Plug-in`.


## Usage

The default plugin file links against `AppKit` and `Foundation`, and, when built (and Xcode is restarted), creates a menu item labeled "Do Action" in the File menu. Pressing the menu item should open an alert. Customize at will!

##Important
For this plug-in to work you need to manually add a key to the **"projectname".plist** of the project.
I have not been able to figure out how i can define this entry in the template! 
If anyone has this knowledge please let me know or fork the project to fix it.

You need to add this key and value to the plist file:
'''XML
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<array>
	<string>63FC1C47-140D-42B0-BB4D-A10B2D225574</string>
</array>
</plist>'''

This will whitelist the plug-in and allow it to run in Xcode 5.


## Notes

- Set `XCPluginHasUI` in `Info.plist` to `YES` to disable your plugin
- Remember that the directory where the template resides must be named **.xctemplate* for Xcode to recognise it as a template.

### Plugin Debugging

- I would recommend keeping a console open with `tail -f /var/log/system.log` running, for that special moment when you crash Xcode, or want to see the output of your `NSLog()` statements.
- Since Xcode 5, Xcode uses ARC internally, so the plug-in does not have to use manual memory management anymore.:-D

