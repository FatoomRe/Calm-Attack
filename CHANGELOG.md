# 📝 Changelog

All notable changes to **Calm Attack** will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

# 📝 Changelog

All notable changes to **Calm Attack** will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0] - 2025-08-02 🎉

### 🚀 Major Refactoring Release
This release represents a complete architectural overhaul to improve maintainability and contributor experience.

### ✨ Added
- **Core Architecture System**
  - `lib/core/constants/app_constants.dart` - Centralized constants for colors, text styles, sizes, and assets
  - `lib/core/utils/audio_utils.dart` - Reusable audio management utilities
  - `lib/core/utils/navigation_utils.dart` - Standardized navigation helpers
  - `lib/core/utils/session_utils.dart` - Session tracking and timing utilities
  - `lib/core/widgets/common_widgets.dart` - Reusable UI components library

### 🔧 Improved
- **All Screen Components** - Refactored to use new modular architecture
- **Layout Consistency** - All screens now follow the same responsive design pattern
- **Error Handling** - Enhanced disposal patterns and lifecycle management
- **Asset Management** - Fixed case-sensitive asset loading issues
- **Bubble Game Layout** - Improved positioning and visual consistency
- **Material 3 Theming** - Modern theme system with consistent styling

### 🐛 Fixed
- Audio player disposal exceptions during widget lifecycle
- Widget lifecycle assertions in vibration screen
- UI overflow issues in common widgets
- Asset loading errors for taste screen images
- Bubble game navigation flow restored

### 🗑️ Removed
- `DEVELOPER_GUIDE.md` - Consolidated into main documentation
- Hardcoded styling throughout codebase
- Redundant code patterns across screens

## [Unreleased] - In Development 🚧

### ✨ Currently Working On
- 🫁 **Breathing Exercise** - Guided breathing with visual cues and 3-3-3 technique
- 🎵 **Sound Focus Exercise** - Calming audio environments for grounding
- 📳 **Vibration Focus Exercise** - Haptic feedback for physical grounding
- 🌸 **Smell Imagination Exercise** - Guided scent visualization with beautiful imagery
- 🍃 **Taste Imagination Exercise** - Mindful taste visualization scenarios
- 🫧 **Bubble Pop Game** - Interactive cognitive engagement through sequential bubble popping
- 📱 Cross-platform Flutter implementation (iOS & Android)
- 🎨 Beautiful, calming user interface design
- ♿ Accessibility features and inclusive design
- 🔒 Complete offline functionality with privacy focus
- 📖 Comprehensive documentation and contribution guides

### 🔜 Planned Features
- 🌙 Dark mode support for nighttime relief
- 📊 Progress tracking to see your journey to calm
- 🔔 Gentle reminder notifications for preventive care
- 🌍 Multi-language support to help people worldwide
- 🎧 Custom audio upload functionality

### 🎨 Design Principles
- Soft, soothing color palette optimized for mental health
- Intuitive navigation with clear user flow
- Responsive design for all screen sizes
- Smooth animations and calming transitions
- Science-based UI/UX for anxiety relief

### 🔒 Privacy & Security Focus
- Zero data collection policy
- Completely offline operation
- No tracking, analytics, or external dependencies
- Local device storage only
- Open source for complete transparency

---

## 📋 Development Status

**Current Status**: 🚧 **Active Development**

This project is currently in active development and has not yet been officially released. We're building a comprehensive mental health tool with the community's help. 

### 🎯 Roadmap to v1.0.0
- [ ] Complete all core exercises implementation
- [ ] Comprehensive testing across devices
- [ ] Accessibility compliance verification
- [ ] Community feedback integration
- [ ] Documentation finalization
- [ ] App store preparation and submission

---

## 📋 Version Guidelines

We use [Semantic Versioning](https://semver.org/):
- **MAJOR.MINOR.PATCH** (e.g., 1.0.0)
- **MAJOR**: Breaking changes that affect user experience
- **MINOR**: New features that don't break existing functionality
- **PATCH**: Bug fixes and small improvements

## 🏷️ Release Types

- **🚀 Major Release**: Significant new features or redesigns
- **✨ Minor Release**: New exercises, features, or improvements
- **🔧 Patch Release**: Bug fixes and small enhancements
- **🔒 Security Release**: Critical security updates

---

<div align="center">

*"Every version brings us closer to helping more people find calm."*

**Made with 💙 for everyone fighting the invisible battle**

</div>
