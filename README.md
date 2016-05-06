This project demonstrates Apple Bug Report 26151911.

## Title

View-Based table binding NSArrayController to user defaults fails

## Description

Using Cocoa Bindings, if we bind the columns of a view-based table to an NSArrayController in the conventional way, and bind the 'content' of the array controller to an array of dictionaries in the user defaults via NSUserDefaultsController, the binding will work OK in the model-to-view direction, but in view-to-model direction, if *only* an attribute (dictionary entry) of one or more objects is changed, the change is not forwarded to user defaults as expected.

Because the binding works OK in one direction, and *almost* works in the other direction, and because some simple changes (using a cell-based table, or proxy-ing through another object instead of binding directly to NSUserDefaultsController) cause it to work, we feel that this is a bug caused by some unforeseen interaction between view-based tables and NSUserDefaultsController.

## Steps to Reproduce

1.  Clone this demo project which demonstrates the bug:
https://github.com/jerrykrinock/ArrayDictionaryDefaultsDemo

2.  Open the project.

3.  Build and run the target demo app.  A window will appear.

4.  Hit the "[+]" button to add a "person".

5.  In the table, enter a First Name and Last Name for your new person.

6.  Repeat the above two steps, adding two more persons with names.

7.  Quit the demo app.

8.  Relaunch the target demo app.

## Expected Results

Three "persons" with the first names and last names that you entered, should appear in the table.

## Actual Results

Only the first or maybe the first and second persons will have names.  The latter person(s) will have no names.

## Additional Notes

According to developer Keary Suska who was kind enough to test my demo project and provide a second opinion, if you make either of the following changes to the project, it will behave as expected:

(1) Change the view-based table to a cell-based table.
(2) Proxy the array in the app delegate.

Here is a link to the email thread where this issue was discussed.  Of course, our understanding improved as the thread progressed.

http://lists.apple.com/archives/cocoa-dev/2016/May/msg00061.html

If you want to erase the demo app's user defaults and start over, enter this command in Terminal.app:

```defaults delete com.sheepsystems.ArrayDictionaryDefaultsDemo```
