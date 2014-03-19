An Empty Droiuby Standalone App Template
========================================

This is an empty Android Project that you can use to house a standalone droiuby app.

You will also need this if you need more permissions than what the Droiuby Developer app has or if you want to use external libraries and resources.

How to use (minimum changes)
----------------------------

1. Simply replace launcher.zip with your Droiuby package.
2. Customize StartupActivity to point to your zip file. (Locate the string asset:launcher.zip)
3. Rename the package name to the one you want (Google Play requires a universally unique package name)
4. Update AndroidManifest.xml to reflect the new package name
