# Attendance Mobile App

Mobile app of the Attendance App.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project to a live system.

### Prerequisites
This project uses [Flutter](https://flutter.dev/) to build, test, and deploy multiplatform mobile apps from a single codebase. To build and run this project, you need to have Flutter installed on your machine.

You can refer to this [link](https://docs.flutter.dev/get-started/install) to install Flutter and set up the platform. To be able to build and run this project, you have to complete the [iOS](https://docs.flutter.dev/get-started/install/macos#ios-setup) and [Android](https://docs.flutter.dev/get-started/install/macos#android-setup) platform setup on your machine.

### Run the project

* [Set up an editor](https://docs.flutter.dev/get-started/editor?tab=vscode) that supports Flutter development.
* Open the project directory on your local machine using your preferred editor.
* Run the app on your preferred mobile device by referring to this [link](https://docs.flutter.dev/get-started/test-drive?tab=vscode) on section **Run the app**.


## Tests
To run the test, you can run this command:

`flutter test`

You can run this command to see the code coverage report:

`flutter test --coverage`

The report will be available on the `coverage/lcov.info` file.


To see the report in HTML format, you can use [lcov](https://formulae.brew.sh/formula/lcov). Run this command to generate HTML based code coverage report:

`genhtml coverage/lcov.info -o coverage/html`

Check the generated HTML format report by opening the `coverage/html/index.html` file.

## Deployment
TBD


## Contributing
This project uses the [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) design approach which has the objective of separation of concerns. This separation achieved by dividing the software into layers.

When contributing to this project please follows the [SOLID design principles](https://kessler.tech/software-architecture/solid/) that implemented by Clean Architecture design. 

This way we can have this project more understandable, flexible and maintainable.


## Built With

### User Interface
* [Flutter](https://github.com/flutter/flutter) - Flutter makes it easy and fast to build beautiful apps for mobile and beyond.
* [Cupertino Icons](https://github.com/flutter/packages/tree/main/third_party/packages/cupertino_icons) - Default icons asset for Cupertino widgets based on Apple styled icons.

### State Management
* [flutter_bloc](https://github.com/felangel/bloc/tree/master/packages/flutter_bloc) - Flutter Widgets that make it easy to implement the BLoC (Business Logic Component) design pattern. Built to be used with the bloc state management package.

### Dart Extension
* [Equatable](https://github.com/felangel/equatable) - A Dart package that helps to implement value based equality without needing to explicitly override `==` and `hashCode`.
* [dartz](https://github.com/spebbe/dartz) - Functional Programming in Dart. Purify your Dart code using efficient immutable data structures, monads, lenses and other FP tools.
* [intl](https://pub.dev/packages/intl) - Provides internationalization and localization facilities, including message translation, plurals and genders, date/number formatting and parsing, and bidirectional text.
* [google_fonts](https://pub.dev/packages/google_fonts) - A Flutter package to use fonts from fonts.google.com.

### Service Locator
* [get_it](https://github.com/fluttercommunity/get_it) - Simple direct Service Locator that allows to decouple the interface from a concrete implementation and to access the concrete implementation from everywhere in your App.

### Code Generation
* [build_runner](https://github.com/dart-lang/build/tree/master/build_runner) - A build system for Dart code generation and modular compilation.

### Linter
* [flutter_lints](https://github.com/flutter/packages/tree/main/packages/flutter_lints) - Recommended lints for Flutter apps, packages, and plugins to encourage good coding practices.

