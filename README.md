In an OS X app, I wanted to bind a table of objects, each represented by a dictionary, to an array of dictionaries in user defaults.

So I bound the Content Array of the array controller to the 'values' of the shared user defaults controller with an arbitrary key path, which pleasantly became the key to the array in the user defaults.  I set "Handles Content as Compound Values” to ON.

Result: The table is populated as expected from user defaults when its window opens, and all works and persists as expected if user adds or deletes an object (row).  But changes to object attributes are persisted only for new objects, and only if user adds *another* object before quitting.

In the array controller's content, the object attribute is always changed as expected.  So, the problem is the binding of the array controller content to user defaults, and I think the explanation is that, as always, KVO is “shallow”.  Observing an array does not observe changes to its elements.

I’m kind of surprised that the “magic of Cocoa Bindings” does not provide a “code-less” solution for user defaults in this case.  With Core Data, this type of thing “just works”.

Did I miss something?

I also tried this using a custom object instead of an NSMutableDictionary as the content class of the array controller, making my custom class conform to NSCoding, and inserting a NSKeyedUnarchiveFromData value transformer into the binding.  Result: Exactly the same deficiency.

To make the project work, I added an “Apply” button which “manually” copies the array controller content to the user defaults, in other words, doing manually what Cocoa Bindings was not doing.  See #define FIX_IT in AppDelegate.m.


STEPS TO RECREATE THIS PROJECT FROM SCRATCH

In Xcode, New OS X Cocoa App project.

Edit the default xib file which appears in the project.

Add an array controller, and a table view to the window.

Select the array controller and click Attributes Inspector  Verify atttributes mode = Class and class = NSMutableDictionary. Switch on checkbox Prepares Content.

Bind array controller to Shared User Defaults,
Controller Key = values
Model Key Path = persons
Handles Content as Compound Values = ON

Bind both table columns to array controller > arranged objects

Set two text fields’ Behavior to editable

Select first TableColumn
Bind Vaue to Array Controller with Controller Key = arrangedObjects.

Select second Table Column
ditto

Add a fixed image view to the first columnn’s view, so you can see name-less rows.  Make the Table View Cell (NSTextField) wider, to use whole column.  Similarly, widen the Table View Cell in second column.

Select Table View Cell (NSTextField) in first column.
Bind Value to Table Cell View with Model KeyPath = objectValue.firstName.

Select Table View Cell (NSTextField) in second column.
Bind Value to Table Cell View with Model KeyPath = objectValue.lastName.

Add + and - buttons, set their target/action to array controller’s -add: and -remove: actions.

