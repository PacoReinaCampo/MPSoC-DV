# Graphics in MATLAB

MATLAB offers powerful tools for creating, formatting, and saving 2-D and 3-D plots, as well as handling images and graphics objects. Here's a comprehensive guide to MATLAB graphics:

## 2-D and 3-D Plots

### 2-D Plots

2-D plots are fundamental for visualizing data.

- **Basic 2-D Plot**:
  ```matlab
  x = linspace(0, 2*pi, 100);
  y = sin(x);
  plot(x, y);
  title('Sine Wave');
  xlabel('x');
  ylabel('sin(x)');
  ```

- **Multiple Plots**:
  ```matlab
  y1 = sin(x);
  y2 = cos(x);
  plot(x, y1, x, y2);
  legend('sin(x)', 'cos(x)');
  ```

- **Scatter Plot**:
  ```matlab
  scatter(x, y);
  title('Scatter Plot');
  xlabel('x');
  ylabel('y');
  ```

### 3-D Plots

3-D plots provide a deeper understanding of data relationships.

- **Basic 3-D Plot**:
  ```matlab
  [X, Y] = meshgrid(-5:0.5:5, -5:0.5:5);
  Z = X.^2 + Y.^2;
  mesh(X, Y, Z);
  title('3-D Mesh Plot');
  ```

- **Surface Plot**:
  ```matlab
  surf(X, Y, Z);
  title('3-D Surface Plot');
  ```

## Formatting and Annotation

Customizing plots enhances readability and presentation quality.

- **Axis Labels and Titles**:
  ```matlab
  xlabel('X-axis');
  ylabel('Y-axis');
  zlabel('Z-axis');  % For 3-D plots
  title('My Plot');
  ```

- **Legends**:
  ```matlab
  legend('Data 1', 'Data 2');
  ```

- **Text Annotations**:
  ```matlab
  text(pi, 0, 'Intersection Point');
  ```

- **Customizing Line Styles and Colors**:
  ```matlab
  plot(x, y, '--r', 'LineWidth', 2);  % Dashed red line with width 2
  ```

## Images

MATLAB supports image processing and display.

- **Displaying Images**:
  ```matlab
  img = imread('example.png');
  imshow(img);
  ```

- **Image Manipulation**:
  ```matlab
  gray_img = rgb2gray(img);
  imshow(gray_img);
  ```

## Printing and Saving

Exporting plots and figures is essential for documentation and presentation.

- **Saving Figures**:
  ```matlab
  saveas(gcf, 'myPlot.png');  % Save current figure as PNG
  saveas(gcf, 'myPlot.fig');  % Save as MATLAB figure file
  ```

- **Printing Figures**:
  ```matlab
  print('myPlot', '-dpng');  % Print to PNG file
  print('myPlot', '-dpdf');  % Print to PDF file
  ```

## Graphics Objects

MATLAB graphics are object-oriented, allowing detailed control over each component.

- **Creating and Modifying Graphics Objects**:
  ```matlab
  p = plot(x, y);
  set(p, 'LineWidth', 2, 'Color', 'r');  % Modify properties
  ```

- **Accessing Object Properties**:
  ```matlab
  props = get(p);  % Get all properties
  linewidth = get(p, 'LineWidth');  % Get specific property
  ```

## Graphics Performance

Efficient rendering of graphics is important for large datasets and complex plots.

- **Improving Performance**:
  - **Use `LineSpec` and `MarkerSpec`** efficiently to reduce rendering time.
  - **Limit the amount of data points** plotted in a single figure.
  - **Use lower-level graphics functions** (`line`, `patch`) for complex customizations.

- **Updating Plots Efficiently**:
  ```matlab
  h = plot(x, y);
  for k = 1:length(x)
      set(h, 'YData', sin(x + k/10));
      drawnow;
  end
  ```

- **Using `parfor` for Parallel Processing**:
  ```matlab
  parfor i = 1:100
      % Code to generate plots or process data
  end
  ```

By mastering these graphics capabilities in MATLAB, you can create professional, informative, and visually appealing plots and images for a wide range of applications.
