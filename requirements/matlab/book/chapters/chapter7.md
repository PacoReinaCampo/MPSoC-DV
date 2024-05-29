# App Building in MATLAB

MATLAB provides various tools and frameworks for building interactive applications. This guide covers the main aspects of app building, from using the App Designer to migrating GUIDE apps.

## Develop Apps Using App Designer

App Designer is a drag-and-drop environment for creating professional apps without extensive coding.

### Getting Started with App Designer

- **Open App Designer**:
  - In the MATLAB Home tab, click on "App Designer".

- **Creating a New App**:
  - Select "New App".
  - Choose a template or start with a blank app.

### Designing the App Interface

- **Drag and Drop Components**:
  - Use the Component Library to drag components (e.g., buttons, sliders, axes) onto the canvas.

- **Arrange and Customize Components**:
  - Arrange components using alignment tools.
  - Customize properties (e.g., labels, colors) through the Component Browser.

### Writing Callbacks

- **Add Callbacks**:
  - Click on a component, and in the "Callbacks" section, add a callback function.
  - Write the function code to define the component's behavior.

Example:
```matlab
% Button callback function
function ButtonPushed(app, event)
    app.Label.Text = 'Button Pressed';
end
```

### Running the App

- **Run the App**:
  - Click the "Run" button in the App Designer toolstrip to test the app.

## Develop Apps Programmatically

For more control, you can develop apps programmatically using MATLAB code.

### Creating a Simple UI Programmatically

Example:
```matlab
function simpleUI
    % Create a figure window
    f = figure('Name', 'Simple UI');
    
    % Create a button
    btn = uicontrol('Style', 'pushbutton', 'String', 'Click Me', ...
                    'Position', [100, 100, 100, 50], ...
                    'Callback', @buttonCallback);
    
    % Button callback function
    function buttonCallback(src, event)
        disp('Button clicked');
    end
end
```

### Layout Management

Use `uigridlayout`, `uiflowcontainer`, and other layout managers to organize UI components.

Example:
```matlab
function gridLayoutUI
    % Create a figure window with a grid layout
    f = uifigure('Name', 'Grid Layout UI');
    gl = uigridlayout(f, [2, 2]);
    
    % Add UI components to the grid layout
    btn1 = uibutton(gl, 'Text', 'Button 1');
    btn2 = uibutton(gl, 'Text', 'Button 2');
    lbl = uilabel(gl, 'Text', 'Label');
end
```

## Develop Live Editor Tasks

Live Editor tasks allow you to create interactive controls within Live Scripts.

### Creating Live Editor Tasks

- **Create a New Live Editor Task**:
  - Open a Live Script (`.mlx` file).
  - From the "Live Editor" tab, select "Insert Task".

- **Customizing the Task**:
  - Define the task's inputs and outputs.
  - Write the code to execute when the task is run.

Example:
```matlab
% Insert Task code
data = rand(100,1);
meanData = mean(data);
disp(['Mean of data: ', num2str(meanData)]);
```

## Create Custom UI Components

Custom UI components enable you to create reusable, specialized controls.

### Creating a Custom Component

Example:
```matlab
classdef CustomButton < matlab.ui.componentcontainer.ComponentContainer
    properties
        Button
    end
    
    methods
        function obj = CustomButton(parent)
            obj.Button = uibutton(parent, 'Text', 'Custom Button');
            obj.Button.ButtonPushedFcn = @obj.onButtonPushed;
        end
        
        function onButtonPushed(obj, src, event)
            disp('Custom Button Clicked');
        end
    end
end
```

## Package and Share Apps

Packaging apps allows you to share your applications with others.

### Creating an App Installer

- **Package the App**:
  - In MATLAB, go to the "Apps" tab and click "Package App".
  - Follow the wizard to include all necessary files and dependencies.

- **Generate the Installer**:
  - MATLAB will create an installer file (`.mlappinstall`).
  - Share the installer with others, who can install the app directly from the MATLAB Apps tab.

## Migrate GUIDE Apps

GUIDE is MATLAB's older app building tool, and it is recommended to migrate GUIDE apps to App Designer.

### Steps to Migrate GUIDE Apps

1. **Open the GUIDE App in GUIDE**:
   - In MATLAB, type `guide` and open your GUIDE app.
   
2. **Export to App Designer**:
   - Use the GUIDE to App Designer migration tool:
     ```matlab
     guideToAppDesigner('yourGuideApp.fig');
     ```

3. **Adjust the Code**:
   - Update the auto-generated code as needed to fit the App Designer structure.

4. **Test the New App**:
   - Run and test the app in App Designer to ensure functionality.

## Conclusion

By leveraging these tools and techniques, you can create robust, interactive applications in MATLAB. Whether using the App Designer for a visual approach or coding programmatically for more control, MATLAB provides the flexibility to develop, package, and share applications effectively.
