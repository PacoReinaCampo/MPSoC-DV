# EXTERNAL LANGUAGE INTERFACES IN MATLAB

MATLAB supports integration with various external programming languages, allowing you to leverage the strengths of different languages within your MATLAB environment. Here's a detailed guide on interfacing MATLAB with C++, Java, Python, .NET, COM, web services, C, and Fortran.

## C++ WITH MATLAB

### Calling C++ from MATLAB

To call C++ code from MATLAB, you can use MEX files or MATLAB Engine API.

- **Creating MEX Files**:
  1. **Write C++ Code**: 
     ```cpp
     // mymexfunction.cpp
     #include "mex.h"
     void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[]) {
         double *input = mxGetPr(prhs[0]);
         plhs[0] = mxCreateDoubleScalar(input[0] * 2);
     }
     ```
  2. **Compile the MEX File**:
     ```matlab
     mex mymexfunction.cpp
     ```
  3. **Call the MEX Function**:
     ```matlab
     result = mymexfunction(10);
     ```

- **MATLAB Engine API for C++**:
  1. **Initialize MATLAB Engine**:
     ```cpp
     #include "matlab_engine.hpp"
     int main() {
         matlab::engine::MATLABEngine *matlabPtr = matlab::engine::startMATLAB();
         matlabPtr->eval(u"disp('Hello from C++')");
         return 0;
     }
     ```

## JAVA WITH MATLAB

### Calling Java from MATLAB

MATLAB can directly call Java classes and methods.

- **Using Java Classes**:
  1. **Add Java Class to MATLAB Path**:
     ```matlab
     javaaddpath('path/to/java/classes');
     ```
  2. **Call Java Methods**:
     ```matlab
     myObj = javaObject('MyJavaClass');
     result = myObj.myMethod();
     ```

### Calling MATLAB from Java

You can use the MATLAB Engine API for Java.

- **MATLAB Engine for Java**:
  1. **Initialize MATLAB Engine**:
     ```java
     import com.mathworks.engine.*;
     public class MatlabEngineTest {
         public static void main(String[] args) throws Exception {
             MatlabEngine eng = MatlabEngine.startMatlab();
             eng.eval("disp('Hello from Java')");
             eng.close();
         }
     }
     ```

## PYTHON WITH MATLAB

### Calling Python from MATLAB

MATLAB provides the `py` interface to call Python functions.

- **Calling Python Functions**:
  ```matlab
  result = py.some_module.some_function(arg1, arg2);
  ```

- **Example**:
  ```matlab
  py.sys.path.append('path/to/python/module');
  result = py.math.sqrt(25);
  disp(result);
  ```

### Calling MATLAB from Python

Use the MATLAB Engine API for Python.

- **MATLAB Engine for Python**:
  1. **Install the Engine**:
     ```sh
     pip install matlab
     ```
  2. **Use MATLAB in Python**:
     ```python
     import matlab.engine
     eng = matlab.engine.start_matlab()
     eng.eval("disp('Hello from Python')")
     eng.quit()
     ```

## .NET WITH MATLAB

### Calling .NET from MATLAB

MATLAB supports .NET assemblies.

- **Add .NET Assembly**:
  ```matlab
  NET.addAssembly('path/to/assembly.dll');
  ```

- **Call .NET Methods**:
  ```matlab
  obj = NET.createGeneric('Namespace.ClassName', 'System.Double');
  result = obj.MethodName();
  ```

### Calling MATLAB from .NET

Use MATLAB Engine API for .NET.

- **MATLAB Engine for .NET**:
  1. **Initialize MATLAB Engine**:
     ```csharp
     using MathWorks.MATLAB.Engine;
     class Program {
         static void Main(string[] args) {
             var eng = MATLABEngine.StartMATLAB();
             eng.Eval("disp('Hello from .NET')");
             eng.Quit();
         }
     }
     ```

## COM WITH MATLAB

### Calling COM Objects from MATLAB

MATLAB can interact with COM objects.

- **Create COM Object**:
  ```matlab
  obj = actxserver('progID');
  ```

- **Call Methods on COM Object**:
  ```matlab
  result = obj.MethodName(arg1, arg2);
  ```

### Calling MATLAB as COM Server

- **Register MATLAB as COM Server**:
  ```sh
  matlab -regserver
  ```

- **Use MATLAB COM Server in Other Languages**:
  ```vb
  Dim matlab As Object
  Set matlab = CreateObject("matlab.application")
  matlab.Execute("disp('Hello from COM client')")
  ```

## WEB SERVICES WITH MATLAB

### Accessing Web Services

MATLAB supports HTTP requests and web services.

- **Using `webread` and `webwrite`**:
  ```matlab
  data = webread('http://example.com/api/data');
  webwrite('http://example.com/api/data', data);
  ```

### Creating Web Services

Use MATLAB Production Server to deploy MATLAB functions as web services.

- **Deploying a Function**:
  1. **Create a Deployable Archive**:
     ```sh
     mcc -m myFunction -a additionalFiles
     ```
  2. **Deploy to MATLAB Production Server**:
     Configure the server to host the compiled archive.

## C WITH MATLAB

### Calling C from MATLAB

Use MEX files to integrate C code with MATLAB.

- **Creating MEX Files**:
  ```c
  // mymexfunction.c
  #include "mex.h"
  void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[]) {
      double *input = mxGetPr(prhs[0]);
      plhs[0] = mxCreateDoubleScalar(input[0] * 2);
  }
  ```
  ```matlab
  mex mymexfunction.c
  result = mymexfunction(10);
  ```

### Calling MATLAB from C

Use the MATLAB Engine API for C.

- **MATLAB Engine for C**:
  ```c
  #include "engine.h"
  int main() {
      Engine *ep = engOpen(NULL);
      engEvalString(ep, "disp('Hello from C')");
      engClose(ep);
      return 0;
  }
  ```

## FORTRAN WITH MATLAB

### Calling Fortran from MATLAB

Use MEX files to integrate Fortran code with MATLAB.

- **Creating MEX Files**:
  ```fortran
  ! mymexfunction.F
  subroutine mexFunction(nlhs, plhs, nrhs, prhs)
      implicit none
      integer nlhs, nrhs
      mwPointer plhs(*), prhs(*)
      double precision, pointer :: x(:)
      mwPointer mxGetPr, mxCreateDoubleScalar
      plhs(1) = mxCreateDoubleScalar(2 * mxGetPr(prhs(1))(1))
  end subroutine
  ```
  ```matlab
  mex mymexfunction.F
  result = mymexfunction(10);
  ```

### Calling MATLAB from Fortran

Use the MATLAB Engine API for Fortran.

- **MATLAB Engine for Fortran**:
  ```fortran
  program main
      use engine
      type(engine) :: ep
      call engOpen(ep, NULL)
      call engEvalString(ep, "disp('Hello from Fortran')")
      call engClose(ep)
  end program main
  ```

By leveraging these external language interfaces, you can enhance MATLAB's capabilities and integrate it with a wide range of programming environments. This allows for more versatile and powerful applications, taking advantage of the unique strengths of each language.
