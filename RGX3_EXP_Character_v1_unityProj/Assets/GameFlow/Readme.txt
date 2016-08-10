GameFlow v0.8.98b
--------------------------

GameFlow is a powerful tool that lets you create programs in Unity without writing a single line of code and without leaving the Editor.


Installation - Unity Asset Store
-----------------------------------

Once purchased on the Unity Asset Store and downloaded the GameFlow package should be already installed on your system and ready to use in your projects. The only required step is to import the package into your project in one of these two ways:

1) If you are creating a new project, just mark the checkbox "GameFlow.unityPackage" in the New Project window to get the package automatically imported.

2) If you need to import GameFlow into an existing project, log in the Asset Store (Window > Asset Store) and toggle the Download Manager, then Find the GameFlow package and click on the Import button to get the package automatically imported into the current project.

If you need further information on installation or the update process, please refer to the "First Steps" chapter in the User Manual under the GameFlow/Documentation folder in the Project tab.


Installation - Clean Source Code Asset Store
-----------------------------------------------

If you purchased GameFlow on the CleanSourceCode Asset Store, you just need to download the GameFlow.unityPackage file on your system and then to import it on your current Unity project by using the Assets > Import Package > Custom Package menu option or simply by double clicking the file. Click "Import" on the dialog and after the import is complete, a new "GameFlow" folder should appear on your Project window.

If you need further information on installation or the update process, please refer to the "First Steps" chapter in the User Manual under the GameFlow/Documentation folder in the Project tab.


Help & Documentation
------------------------

Reference help is always available as the last option in the context menu of any GameFlow component. The context menu is displayed by clicking any on the "Gear" icon in the upper right corner of any component or block in the Inspector tab.

User Manual, Tutorials, Reference and API documents are included in the package under the GameFlow/Documentation folder for offline browsing.


Useful Links
--------------

Overview -> http://gameflow4unity.com/
Documentation -> http://gameflow4unity.com/docs/
Learning Resources -> http://gameflow4unity.com/learn/
Showcase -> http://gameflow4unity.com/showcase/
Forum -> http://gameflow4unity.com/forum/
Facebook Group -> https://www.facebook.com/groups/gameflow/
Facebook Group (es) -> https://www.facebook.com/groups/gameflow.es/


Follow us:
------------

Twitter -> https://twitter.com/evasiongames , https://twitter.com/xeleh
Facebook -> https://www.facebook.com/evasiongames
Youtube -> https://www.youtube.com/user/evasiongames


Release Notes
----------------

[0.8.98b]
* New Set Script Property action.
* New GameObject > GameFlow menu with useful items to create GameObjects with GameFlow components in one step.
* Added "Draw Blocks Background" option in preferences.
* Fixed issue whereby Variables and Parameters of type Enum were not able to select enumerations defined in custom user scripts.
* New application events: On Application Init, Focus, Pause and Quit.
* Interface IVariableType (the one to add to your custom scripts if you want to use them as Variable object types) renamed to IVariableFriendly.
* All the audio related actions (Play Music, Stop Music, etc.) will continue working after loading another scene.
* Added option to preferences to choose whether GameFlow object fields will require ALT key to be pressed for selection change to make effect on double click.
* Fixed Invoke Method action losing the chosen method after adding or removing methods to the source script.
* Play Animation action now supporting also Animator as target type.
* Fixed animation clip selection in Play Animation not getting all the availables clips; the popup field has been replaced with a validated Animation Clip type object field.
* Set Animator State action should now work correctly in Unity 5.x.

[0.8.97b]
* New Get Script Property action. Use it to read the value of any public variable of your custom scripts and store it in a GameFlow Variable.
* New For Each action.
* New Resize List action.
* New Get / Set Selectable Property actions.
* New Select action [UI].
* New On Select and On Deselect event programs [UI].
* New Get / Set Color Component actions.
* New Main Camera built-in variable.
* Built-in variables in the "Built-in" prefab now showing a description.
* Set Color now working also with Text, Image, GUIText and GUITexture components contained in the specified GameObject.
* Cleanup of Component > GameFlow menu.
* Fixed UI event programs not getting executed when listening target is Scene Hierarchy.
* Fixed wrong warning message in UI event programs when listening target is another GameObject.

[0.8.96b]
* New Sort List action (works for all list types except Object).
* Added option to Clear List action to remove only the "None" objects (only for Object-type lists).
* Redesign of the "Add Block" window (previously called the Add Action / Condition window): blocky style, foldable help, add button and context menu.
* Added menu option with shortcut to show the "Add Block" window. Check Window > GameFlow > Add Block ...
* Added "Execute" button in Program components (bottom right).
* Replaced words "New" in all button labels like "+ New Action... " with "Add" for correctness.
* Fixed some properties not working in Set Slider Property action.
* Fixed Set Interpolate Color action not working when Duration is zero.

[0.8.95b]
* New Get Variable / Get Parameter (by Id) actions.
* New Get Index Of Item In List action.
* Variables of type Variable can be now set as indirect (like a pointer to another variable).
* Added "Case Sensitive" option for Equal / Not Equal (String) comparison to Variable / Parameter Value conditions.
* Fixed On Parameter Change programs not registering events correctly after duplicating objects or adding new parameters.
* API: methods Variables.GetVariableById() and Parameters.GetParameterById() now supporting GameObject specification to reduce search scope.
* Removed built-in variable Mouse Scroll Delta due to incompatibility with Unity 5.
* Fixed Pause Editor action not pausing the execution of the current program.

[0.8.94b]
* Fixed error calculating shortest rotation in Interpolate and Rotate actions.

[0.8.93b]
* Fixed error on console when trying to change the "listening range" GameObject in the settings section of an event program.
* Fixed object selector window not showing for GameObject-type fields.
* Fixed Destroy action not working for prefab instances.
* Fixed objects in a Pool not restoring to their initial state after released.
* Removed clamping of Scene property in Load Scene action.
* Fixed console errors and object selector window not showing for GameObject-type fields when a prefab or prefab instance is inspected.
* Fixed undo not working properly when using "Set <UI-Component> Property" actions in "On Parameter Change" programs while in Editor mode.
* Fixed wrong revert of changes made by "Set <UI-Component> Property" actions after entering Play mode.
* Fixed event programs not responding when the Listening Range is set to "Scene Hierarchy".
* GameFlow menu items relocated under "Tools > GameFlow" following Unity guidelines.

[0.8.9b]
* Initial support for uGUI components. Added UI types to type selector window.
* New Get / Set Property actions for all major UI components: Button, Canvas, Image, Input Field, Raw Image, Slider, Scrollbar, Text, Toggle.
* New UI Event Controller.
* New On Click event program.
* New On Pointer Enter / Exit / Down / Up event programs.
* New On Value Change event program.
* New On End Edit event program.
* New Set / Get Rect Transform Property actions.
* New Get Rect Transform action.
* New feature: easy localization.
* New Localization component. Consider it a kind of "localized variable", that is, you can use wherever a Variable is accepted.
* New Set / Reset Language actions to change the current localization language in runtime.
* New built-in Default Language / Language variables to get the default and current language in use.
* New Localization Settings (Edit > Project Settings > Localization).
* New On Language Set event program.
* New Set / Get Material actions.
* New Get Tag / Get Layer actions.
* New Set Scale action.
* Improved default tab selection in object selector window. If no suitable object is available in GameObject nor Scene tabs, Assets will be the default.
* Parameters can now be dragged also when they are not in Editor mode.
* Variables in action/condition fields can now be dragged & dropped to other fields.
* Added "Multiplier" property to Set Position, Set Rotation and Set Random Rotation.
* New Set Random Position and Set Random Scale actions.
* Modified visual style and position of the "Create Variable" buttons that will appear now on the inner right side of the fields. Added tooltip hint.
* New "multi-line edit" button for strings that can contain long texts.
* New Set Position / Rotation / Scale Component actions.
* Improved "Listening Range" in event programs (thx Sledge!). Now allowing specification of the GameObject to listen and a new option for listening only to GameObjects in a List.
* New Clamp Rotation action to limit the rotation to specified min-max angles.
* Look At action now supporting the specification of the "look direction" enabling it for 2D use.
* Added "Space" and "Apply To" properties to most actions related with Transform modification.
* Improved popup menus on labels: faster and more reliable, hover cursor, new icon (small up/down arrows), can get keyboard focus.
* Removed Object Condition due to technical reasons. Added "Is / Is Not None" option to Variable Value Condition to compensate this removal.
* Added hover "move" cursor to title area of the blocks as UI hint.
* New Orbit and Set Orbit Rotation actions, now you can make your own FPS controller easily.
* Replaced "Local Space" toggle with a popup menu in Get Radial Offset. Also properties reordered.
* New "Finish Program" action.
* New "Get Position In Path" action.
* Paths are now static in runtime, that means better performance. If you need it for special effects, you can force a precalculation at any time with the new "Recalculate Path" action.
* Reordering of properties in "Get / Set Path Property" actions. Removed "Show Labels" property. Added "Length" and "Points" properties.
* Removed the "Get Active GameObject" action.
* Visual changes in List and Path inspector editors, now using foldouts for settings and items/points.
* Added Variables.GetVariableById(), Parameters.GetParameterById() and Localizations.GetLocalizationById() enabling easy access to GameFlow data blocks from your own scripts.
* String type variables now supporting "Variable Expansion" (use ${variable-id} in the value). This expansion is also supported in the "Text" property when set using the Set Text / GUIText Property actions.
* Object fields can now be dragged.
* Event Parameters can now be "variant" type if they can hold values of different types in runtime.
* Added "Write Value" button when a variable is marked as persistent. This allow to write the current value to PlayerPrefs and it's useful for testing during development.
* Visual changes in Programs. Now using separate foldouts for Settings, Parameters and Actions.
* New Toggle Description context menu in Variable blocks enabling an additional text area for a description of the purpose of the variable.
* Interpolate Color action also working with Text, Image and Raw Image.
* Added "easing" to all Transform-interpolation related actions (Interpolate, Move, Rotate, Scale, Move Randomly, Rotate Randomly, Scale Randomly).
* Pools no longer hiding the reusable instances of the model in the hierarchy.
* Fixed context help not showing in browser in Windows.
* Fixed parsing error when using persistent variables for types Vector2, Vector3, Rect and Color.
* Fixed persistence not working for variables in prefabs.
* Fixed graphics in Object / Action selection window when Unity Pro skin is active.
* Fixed List.type returning incorrect Type.
* Fixed event program parameters getting null'ed on runtime after a Reset in the Editor and after a copy / paste as new component.
* Fixed Inspector not scrolling automatically when a new action or condition is added from the actions/conditions window.
* Fixed typo in Set Rotation action labels.
* Fixed error when selecting UnityEngine.Object as the object type for a Variable or Parameter. This type is not longer allowed.
* Fixed zombie "actions / conditions selector" windows after scripts reload.
* Fixed excessive lag when rendering splines in the scene window.
* Fixed accidental drag and drop of actions/conditions at the bottom of the selector window.
* Fixed variables not being properly refreshed after Undo when the variable had been modified by a Program executed in Editor mode.
* Fixed Clone action disconnecting clones of prefab instances from their original's prefab. Now clones retain the prefab connection.
* Fixed macros window allowing macros not coming from a prefab.
* Fixed On Activate programs not starting on initially inactive GameObjects later (in runtime) activated by the user.
* Fixed Font property in Set GUIText Property not allowing for selection of Font objects.
* Fixed execution of Instantiate action in Editor: created instances will no longer lose the connection with its prefab.
* Fixed incoherent behaviour of variables in prefabs. Their values were "persistent" during Play in the editor. Now the initial value is restored when the game stops.
* Fixed insertion bar keeping drawn in the Inspector after closing the actions/conditions window.
* Fixed warnings in the console when dragging an object over a non-component type field (like AudioClip).
* Fixed invalid references to event parameters keeping alive in fields after dragging an action/condition from a program to another. Now those references are set to None
* Fixed Limit Variable / Parameter Value actions not working in Editor mode.
* Fixed issue in Variable Value Condition causing incorrect evaluation when target variable type is Object.
* Fixed internal GameFlow components showing in the Inspector when creating clones or instances.
* Fixed search text field in actions/conditions selector not being remembered nor selected on window focus.
* Fixed Variables in assets (specially built-in Variables) not listed in the corresponding tab of the object selector window.


[0.8.8b]
* New Macros support. Now you can assign programs to a set of predefined hotkeys and execute them at any time in the Editor. See the new GameFlow menu > Macros.
* New Built-in variable (Active GameObject) and action (Get Active GameObject) to get the currently selected GameObject (useful for macros).
* Actions / Conditions selector window improvement #1: you can now drag and drop any action or condition from the selector window to any place in the program in the Inspector window.
* Actions / Conditions selector window improvement #2: when the selector is open, its current insertion point will be highlighted in the program. You can change this insertion place at any time by clicking in any of the "Add New Action ..." (or Condition) labels, and also with the context menu option "Insert New Action..." (or Condition).
* Actions / Conditions selector window improvement #3: the selector window won't be closed after choosing one option in the list, now you can keep adding actions or conditions to the current insertion point by pressing Return or Double click, the window will stay until you press Escape (also CMD+W on Mac) or click on the close button.
* New Built-in Variables for Input control: Input Axis, Input Axis X / Y.
* New Built-in Variables for Mouse Input control: Mouse Position X / Y, Mouse Delta, Mouse Delta X / Y, Mouse Scroll Delta, Mouse Scroll Delta X / Y.
* New Map Vector action which allows for mapping vector components (like converting X/Y to X/Z).
* Added Get Parent action.
* New Angle Condition and Get Angle action.
* New Create Primitive action.
* New Toggle GameObject Activation action.
* New Move / Rotate / Scale Randomly actions.
* Interpolation-type actions will now set end position / rotation / scale when duration is zero.
* Added label with current version to the GameFlow pane in Unity preferences.
* Added Expand / Collapse All context menu options for programs and event programs.
* New During action. Executes the contained actions during the specified duration.
* Game actions like Start Game or Pause Game will show warnings when necessary.
* Improved execution of programs in editor mode and better progress indicator allowing users to cancel the execution.
* Removed actions Show / Close Progress Window which are no longer required.
* Added "Info Text" property to action Setup Progress to show message under the progress indicator during the execution of programs in editor mode.
* New Increment, Decrement, Multiply, Divide and Toggle Parameter Value actions.
* Added "Read Only" validation to all actions that modify the value of variables or parameters.
* Renamed Limit Parameter action as "Limit Parameter Value" for coherence.
* Replaced Set Parameter Visibility action with "Set Parameter Property" which allows the modification of other properties.
* Parameters now supporting an optional checkbox "Indirect" that enables indirection when set to Variable type. When set as "indirect", the Parameter will work as a pointer to the Variable given as value.
* Multiply / Divide Variable Value actions no longer will use a float type multiplier but a multiplier of the same type of the specified variable.
* Added brief documentation for the available built-in Variables.
* New "Current FPS" Built-in Variable to get the current number of frames per second.
* A string format can now be specified when setting the "Text" property using Set GUIText Property action.
* Actions Get / Set Transform Property now supporting LocalPosition, WorldPosition, WorldRotation, LocalScale, WorldScale properties all of them returning Vector3 values.
* Added new Draw Bounds Frame which draws the 2D frame of the 3D bounds.
* Interpolate actions like Move or Rotate now supporting a Vector3 (in addition to a Transform) as target value. Added Scale action.
* Added missing Clear Particles action.
* Added menu option Asset > Instantiate Prefab to create a new instance from the selected Prefab.
* New Get Transform Direction action (convert local space direction to world space direction).
* New Freeze action allowing to freeze position, rotation and scale of the specified Transform.
* New Get Offset / Get Radial Offset actions.
* Improved search text filter in the Actions / Conditions selector window.
* Added option menu GameFlow > Debug > Capture Inspectors to create a .png with the visible contents of every Inspector tab.
* Added three new PlayerController prefabs.
* Added new Countdown prefab.
* Added new FPS Counter prefab.
* Added two example macros in Prefabs/Macros: random duplication, radial duplication of the selected object.
* Improved Teleport prefab: colliders drawing, execution of program before teleporting.
* Fixed an issue whereby initially disabled actions won't setup nor execute in loops once enabled during play mode.
* Fixed issue whereby the object selector window was shown after dropping a GameObject into an object field when that GameObject only contains one component of the required type and no variables. Now the desired component will be automatically selected as there's no need to show the object selector window in that case.
* Fixed "Remove Variable" context menu option not being enabled for built-in variables.
* Fixed an issue whereby a Parameter from an Event Program could be dragged into a Parameters list causing errors.
* Fixed Toggle Variable Value which was always setting the type of target Variable to Boolean.
* Fixed an issue whereby it was possible to drag a container action (like If) into one its contained actions causing errors.
* Interpolate Color action now working also for GUIText and GUITexture components.
* Fixed bounds calculation in Draw Bounds action when the type of the input object is Transform.
* Fixed annoying delay the first time the action / condition selector window is opened.
* Fixed context menu "Paste Action / Condition" not getting enabled after a Cut.
* Fixed issue whereby context help won't show when the path to the Unity project contained spaces.
* Fixed lost of prefab connection when adding GameFlow blocks to a prefab instance. Unity 5 only.
* Fixed errors on console when adding GameFlow blocks to a prefab. Unity 5 only.
* Fixed potential issue with persistence in Vector2, Vector3, Rect and Color types Variables.

[v0.8.7b]
* Ready for Unity 5.
* Drag and drop of blocks now supporting duplicates (hold Command on Mac OS X, Control on Windows).
* New Set / Get Force Property actions.
* New Get First / Last Item From List actions.
* New Get List Count action.
* New List Count condition.
* New Set / Get Physics Property (gravity, etc.).
* New Set / Get Render Property actions to access Render Settings.
* New Evaluate action currently only for conditions but planned to allow evaluation of expressions in a future version.
* New On Destroy event program.
* New Get Color action.
* New Interpolate Color action.
* New Set / Get Collider Property actions.
* New Enable / Disable Component actions.
* New Mouse Button Condition.
* New (experimental) On Draw Gizmos program allowing for customization of the way the Editor draws components in the Scene view.
* New Draw Bounds, Draw Collider and Draw Force actions specially for On Draw Gizmos programs.
* The position value in Set Position can now be specified with a Transform.
* Instantiate action has now all the options of the Clone action (position, activation of the created instance) and can now be executed in Editor time.
* Added "Is / Is not Equal to <another object>" comparisons to GameObject / Object conditions.
* Improved and more useful log messages. If you click on a message in the console, the GameObject containing the action which generated the message will be highlighted.
* Removed Area tool and related actions in favour of Draw Bounds.
* New Launcher prefab.
* New Scale and Anchor properties in Force objects for a more precise drawing of the Force gizmo in the scene.
* Improved plugin setup mechanism (no more GameFlow icons in the Scene view).
* Fixed output variable in List actions keeping an incorrect type when changing the type of the specified list.
* Fixed object selector window not selecting the Assets tab for references to assets.
* Fixed error when selecting an asset by double clicking in a field which references to the asset.
* Fixed context menu option "Paste Component as New" not creating new actions but referencing the original actions contained in the copied program. It will now create actual duplicates.
* Fixed Add Force action not using the Force magnitude but just the multiplier.
* Fixed Get Random Point In Collider not working correctly with rotated/scaled colliders.
* Fixed an issue whereby references to private event parameters were alive after moving a block to a different program or after creating a duplicate of an event program using "Paste Component as New".
* Reordering and minor rewording of property fields in Add Force action.
* Minor visual adjustments in Distance Condition.
* Minor visual improv. in Enable / Disable Behaviour to show the type of the specified target Behaviour.


[v0.8.6b]
* Added Send Message and Invoke Method actions which allow for integration with custom scripts.
* Added Platform Condition.
* Added Set Platform / Platform Type actions (useful for testing).
* Added Reset Timer action.
* Added Set / Get Timer Property actions.
* Added On Awake program.
* Added Dont Destroy On Load action.
* Added Teleport gamefab.
* API: added GetProgram() to Action.
* Fixed a bug in Set Rigidbody Property (Constraints Property).
* Fixed error when dragging a GameObject containing event programs with parameters to a property field.
* Fixed "Insert New Action" misplacing new actions when used in "Else" section of an IF action.
* Fixed boolean values shown as toggles in Variable/Parameter Value Condition(s).
* Fixed "GameFlow Updated to version XX" message showing when the package is already updated.


[v0.8.4b] - Initial Release
* Added Pong example.
* Fixed time-based actions (like Wait) not working in Program.
* Fixed error on event dispatching to Event Programs removed during runtime.
* Fixed error when adding a Get Random Item From List action.

---

(c) 2015 Evasion Games, S.L.
