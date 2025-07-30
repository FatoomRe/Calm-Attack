# 🤝 Contributing to Calm Attack

> *Together, we can build a sanctuary for minds in distress*

Thank you for considering contributing to **Calm Attack**! Your involvement helps us create a better, more accessible tool for people experiencing panic attacks. Every contribution, no matter how small, makes a difference in someone's life.

## 🌟 Table of Contents

- [🚀 Getting Started](#-getting-started)
- [🛠️ How to Contribute](#️-how-to-contribute)
- [📋 Development Guidelines](#-development-guidelines)
- [📤 Submitting Changes](#-submitting-changes)
- [🏷️ Issue Guidelines](#️-issue-guidelines)
- [👥 Community](#-community)

---

## 🚀 Getting Started

### Prerequisites

Before you begin, ensure you have:

- 📱 **Flutter SDK** (3.0 or later)
- 🎯 **Dart** (compatible with your Flutter version)
- 💻 **IDE**: VS Code, Android Studio, or your preferred editor
- 🔧 **Git** for version control

### Setting Up Your Development Environment

1. **Fork the repository**
   ```bash
   # Click the 'Fork' button on GitHub, then:
   git clone https://github.com/YOUR-USERNAME/Calm-Attack.git
   cd Calm-Attack
   ```

2. **Set up the upstream remote**
   ```bash
   git remote add upstream https://github.com/FatoomRe/Calm-Attack.git
   ```

3. **Install dependencies**
   ```bash
   flutter pub get
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

5. **Run tests** (if available)
   ```bash
   flutter test
   ```

---

## 🛠️ How to Contribute

### 🐛 Reporting Bugs

Found a bug? Help us fix it!

1. **Check existing issues** first
2. **Create a new issue** with:
   - Clear, descriptive title
   - Steps to reproduce
   - Expected vs actual behavior
   - Screenshots/videos if helpful
   - Device and OS information

### 💡 Suggesting Features

Have an idea for a new grounding technique or feature?

1. **Check the roadmap** and existing issues
2. **Open a feature request** with:
   - Clear description of the feature
   - Why it would be helpful for users
   - Any research or evidence supporting it
   - Mockups or examples if available

### 🎨 Contributing Code

#### Types of Contributions We Welcome:

- 🔧 **Bug fixes**
- ✨ **New grounding techniques**
- 🎵 **Audio content** (royalty-free)
- 🎨 **UI/UX improvements**
- 📱 **Accessibility enhancements**
- 🌐 **Internationalization**
- 📚 **Documentation improvements**
- 🧪 **Tests**

---

## 📋 Development Guidelines

### 🏗️ Project Structure

```
lib/
├── main.dart                 # App entry point
├── Pages/                    # Screen widgets
│   ├── start_screen.dart
│   ├── vibration_screen.dart
│   └── ...
├── Animations/               # Custom animations
├── Buttons/                  # Reusable button widgets
└── ...

assets/                       # Images, audio, animations
├── *.png                    # Images
├── *.mp3                    # Audio files
└── *.riv                    # Rive animations
```

### 🎯 Code Style Guidelines

1. **Follow Dart conventions**
   - Use `camelCase` for variables and functions
   - Use `PascalCase` for classes
   - Use meaningful, descriptive names

2. **Comment your code**
   ```dart
   // Clear, helpful comments for complex logic
   /// Documentation comments for public APIs
   ```

3. **Keep functions focused**
   - One responsibility per function
   - Keep functions under 50 lines when possible

4. **Error handling**
   - Always handle potential errors gracefully
   - Provide meaningful error messages

### 🎨 UI/UX Guidelines

- **Calming colors**: Use soft, soothing color palettes
- **Accessibility**: Ensure good contrast and screen reader support
- **Simple navigation**: Keep the user flow intuitive
- **Responsive design**: Support various screen sizes
- **Minimal cognitive load**: Avoid overwhelming users during panic

### 🔒 Privacy & Security

- **No data collection**: The app should work entirely offline
- **No tracking**: Respect user privacy completely
- **Local storage only**: Any settings should be stored locally

---

## 📤 Submitting Changes

### 1. Create a Branch

```bash
# Create and switch to a new branch
git checkout -b feature/your-feature-name

# For bug fixes:
git checkout -b fix/issue-description

# For documentation:
git checkout -b docs/what-you-updated
```

### 2. Make Your Changes

- Write clean, well-commented code
- Test your changes thoroughly
- Ensure the app builds without errors

### 3. Commit Your Changes

```bash
# Stage your changes
git add .

# Commit with a clear message
git commit -m "Add: New breathing exercise with custom timing

- Implements 4-7-8 breathing technique
- Adds visual breathing guide
- Includes customizable timing options
- Fixes #123"
```

### 4. Push and Create Pull Request

```bash
# Push your branch
git push origin feature/your-feature-name
```

Then create a Pull Request on GitHub with:
- **Clear title** describing the change
- **Detailed description** of what you've done
- **Screenshots** if UI changes are involved
- **Testing instructions** for reviewers

---

## 🏷️ Issue Guidelines

### 🐛 Bug Report Template

```markdown
**Bug Description**
A clear description of what the bug is.

**Steps to Reproduce**
1. Go to '...'
2. Click on '....'
3. See error

**Expected Behavior**
What you expected to happen.

**Actual Behavior**
What actually happened.

**Screenshots**
If applicable, add screenshots.

**Device Info**
- OS: [e.g. iOS 15.0, Android 12]
- Device: [e.g. iPhone 13, Pixel 6]
- App Version: [e.g. 1.0.0]
```

### 💡 Feature Request Template

```markdown
**Feature Description**
A clear description of the feature you'd like.

**Problem It Solves**
Why would this feature be helpful for users experiencing panic attacks?

**Proposed Solution**
How you think this should work.

**Research/Evidence**
Any mental health research supporting this technique.

**Additional Context**
Mockups, examples, or other relevant information.
```

---

## 👥 Community

### 🗣️ Communication Channels

- **GitHub Issues**: For bugs and feature requests
- **GitHub Discussions**: For general questions and ideas
- **Email**: [FatimahAlabbas1@outlook.sa](mailto:FatimahAlabbas1@outlook.sa) for sensitive matters

### 🎉 Recognition

Contributors will be:
- 📜 Listed in our README
- 🌟 Acknowledged in release notes
- 💙 Celebrated for their impact on mental health

---

## 🆘 Need Help?

Don't hesitate to ask questions! Contributing to open source can be intimidating, but we're here to help:

- 📚 Check existing issues and documentation
- 💬 Open a GitHub Discussion
- 📧 Email the maintainer
- 🔍 Look at recent Pull Requests for examples

---

## 🎯 First-Time Contributors

New to open source? Welcome! Here are some good first issues:

- 📝 Fix typos in documentation
- 🎨 Improve button styling
- 🌐 Add translations
- 🔧 Fix small bugs
- 📱 Test on different devices

Look for issues labeled with `good first issue` or `help wanted`.

---

<div align="center">

### 🌟 Thank you for contributing to mental health! 🌟

*Your code could be the reason someone finds calm in their storm.*

**Made with 💙 by contributors who care**

</div>
