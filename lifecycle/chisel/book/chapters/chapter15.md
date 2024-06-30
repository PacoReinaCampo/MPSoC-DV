# CONTRIBUTING TO CHISEL

## PUBLISHING A CHISEL LIBRARY

### Using a Library

Using an existing Chisel library:

1. **Identify Library**: Choose a Chisel library that aligns with your project requirements.
2. **Include in Project**: Add the library dependency to your Chisel project build file (`build.sbt`).

### Prerequisites

Before publishing a Chisel library, ensure:

- **Scala and SBT**: Have Scala and SBT installed on your system.
- **Library Requirements**: Ensure the library meets licensing and compatibility requirements.

### Library Setup

Set up your Chisel library project:

1. **Create Project**: Initialize a new Scala project using SBT.
   ```bash
   sbt new chisel/chisel-template.g8
   ```

2. **Implement Library**: Develop your Chisel library functionality.

### Regular Publishing

Publish your Chisel library:

1. **Publish to Sonatype**: Publish your library to Sonatype.
   ```bash
   sbt publishSigned
   ```

2. **Release Version**: Release the version on Sonatype after verification.
   ```bash
   sbt sonatypeRelease
   ```

## CONTRIBUTING TO CHISEL

### Setup the Development Environment

Set up your environment for contributing to Chisel:

1. **Clone Repository**: Clone the Chisel repository from GitHub.
   ```bash
   git clone https://github.com/freechipsproject/chisel3.git
   ```

2. **Build Chisel**: Build Chisel using SBT.
   ```bash
   cd chisel3
   sbt compile
   ```

### Testing

Test your changes in Chisel:

1. **Run Tests**: Execute tests to ensure functionality.
   ```bash
   sbt test
   ```

### Contribute with a Pull Request

Contribute your changes to Chisel:

1. **Create Branch**: Create a new branch for your changes.
   ```bash
   git checkout -b my-feature-branch
   ```

2. **Implement Changes**: Make necessary changes and test them.
   
3. **Commit Changes**: Commit your changes with descriptive messages.
   ```bash
   git commit -am "Implemented feature X"
   ```

4. **Push Branch**: Push your branch to GitHub.
   ```bash
   git push origin my-feature-branch
   ```

5. **Create Pull Request**: Create a pull request on GitHub with detailed description.

6. **Review and Merge**: Collaborate with maintainers for review and merge.

## EXERCISE

### Enhance Chisel Functionality

Contribute to Chisel by implementing a new feature or fixing a known issue. Follow the contribution guidelines and best practices outlined in the Chisel repository.

This manual provides comprehensive guidance on contributing to Chisel, including publishing a Chisel library with prerequisites, setup, and publishing steps, setting up the development environment, testing, contributing with a pull request, and an exercise to enhance Chisel functionality. Adjust examples based on specific library or contribution requirements and expand functionality as needed.
