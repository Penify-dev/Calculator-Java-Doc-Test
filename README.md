# Java Swing Calculator

A modern, feature-rich calculator application built with Java Swing, offering both standard and scientific calculation modes with customizable themes.

[![License MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Java Version](https://img.shields.io/badge/java-11%2B-orange.svg)]()
[![Build Tool](https://img.shields.io/badge/build-maven-green.svg)]()

## 🌟 Features

### Calculation Modes
- **Standard Mode**: Basic arithmetic operations (+, -, *, /, %)
- **Scientific Mode**: Advanced operations including:
  - Square root (√)
  - Power/Exponentiation (^)
  - Natural logarithm (ln)

### User Interface
- **Dual Themes**: Light and Dark mode support
- **Responsive Design**: Clean, intuitive button layout
- **Dynamic Resizing**: Window adapts to selected mode
- **Error Handling**: Input validation and proper error display

### Technical Features
- **Theme System**: YAML-based configuration for easy customization
- **Modular Architecture**: Well-organized package structure
- **Maven Build**: Standard build tool integration
- **Unit Tests**: JUnit 5 test coverage

## 📸 Screenshots

|                Scientific / Dark                | Standard / Light |
:------------------------------------------------:|:-------------------|
 ![Dark calculator screenshot](screenshots/scientific-dark.png) | ![Light calculator screenshot](screenshots/standard-light.png)

## 🚀 Quick Start

### Prerequisites
- Java 11 or higher
- Maven 3.6+ (optional, for building from source)

### Installation

#### Option 1: Clone and Run
```bash
# Clone the repository
git clone https://github.com/HouariZegai/Calculator.git
cd Calculator

# Compile and run using Maven
mvn clean compile exec:java -Dexec.mainClass="com.houarizegai.calculator.App"
```

#### Option 2: IDE Setup
1. **Fork** this repository to your GitHub account
2. Clone your fork locally
3. Import the project into your IDE (IntelliJ IDEA, Eclipse, etc.)
4. Run the `App.java` main class

## 🏗️ Project Structure

```
src/
├── main/
│   ├── java/com/houarizegai/calculator/
│   │   ├── App.java                    # Main application entry point
│   │   ├── ui/
│   │   │   └── CalculatorUI.java       # Main UI component and logic
│   │   ├── theme/
│   │   │   ├── ThemeLoader.java        # Theme loading utility
│   │   │   └── properties/             # Theme data classes
│   │   └── util/
│   │       └── ColorUtil.java          # Color conversion utilities
│   └── resources/
│       └── application.yaml            # Theme configurations
└── test/
    └── java/com/houarizegai/calculator/
        └── CalculatorUITest.java       # Unit tests
```

## 🎨 Customization

### Adding New Themes
Edit `src/main/resources/application.yaml` to add custom themes:

```yaml
themes:
  - name: YourThemeName
    applicationBackground: f0f3f9    # Hex color without #
    textColor: 000000
    operatorBackground: f7f9fc
    numbersBackground: ffffff
    btnEqualTextColor: ffffff
    btnEqualBackground: 0067c0
```

### Supported Operations
- **Basic**: Addition (+), Subtraction (-), Multiplication (*), Division (/)
- **Advanced**: Modulo (%), Square Root (√), Power (^), Natural Logarithm (ln)

## 🧪 Testing

Run the test suite using Maven:
```bash
mvn test
```

## 🛠️ Built With

- **Java 11+** - Core programming language
- **Swing** - GUI framework
- **Maven** - Dependency management and build tool
- **Jackson YAML** - Configuration file parsing
- **JUnit 5** - Testing framework

## 🤝 Contributing

We welcome contributions! Here's how you can help:

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/AmazingFeature`)
3. **Commit** your changes (`git commit -m 'Add some AmazingFeature'`)
4. **Push** to the branch (`git push origin feature/AmazingFeature`)
5. **Open** a Pull Request

### Contribution Ideas
- Add more scientific functions (sin, cos, tan, etc.)
- Implement keyboard shortcuts
- Add calculation history
- Improve accessibility features
- Create additional themes

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Original design and implementation by [Houari Zegai](https://github.com/HouariZegai)
- Built with ❤️ using Java Swing

## ⭐ Show Your Support

If this project helped you, please give it a ⭐️ and share it with others!
