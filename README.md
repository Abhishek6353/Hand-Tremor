# Hand Tremor Demo 📱

A lightweight iOS application designed to help users assess hand stability. By utilizing the device's accelerometer and gyroscope, the app provides a clinical-style self-test that quantifies hand tremors into a simple stability score.

## ✨ Features
- **Real-time Motion Tracking**: Uses `CoreMotion` to capture user acceleration and rotation rates at 60Hz.
- **10-Second Stability Test**: A guided countdown-based test to ensure consistent data collection.
- **Smart Scoring Algorithm**: Normalizes complex motion data into a 0–100% stability percentage.
- **Instant Categorization**: Provides immediate feedback ranging from "Very Stable" to "Unstable".
- **Pure SwiftUI**: Modern, responsive UI built entirely with SwiftUI.

## 🚀 How It Works
1. **Initiate**: Tap "Start Test" from the home screen.
2. **Steady**: Hold the phone naturally in your palm.
3. **Analyze**: The app collects motion samples for 10 seconds.
4. **Result**: View your stability score and stability rating based on the magnitude of micro-movements detected during the test.

## 🛠 Tech Stack
- **Language**: Swift 5.0+
- **UI Framework**: SwiftUI
- **Hardware Integration**: CoreMotion (Accelerometer & Gyroscope)
- **Architecture**: MVVM-lite (using `ObservableObject`)

## 📦 Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/hand-tremor-demo.git
   ```
2. Open `Hand Tremor Demo.xcodeproj` in **Xcode**.
3. Select your target device (iPhone) and press `Cmd + R` to run.
   > **Note**: This app requires a physical device to access motion sensors; it will not return valid data on a Simulator.

## 📊 Stability Ratings
| Score Range | Classification |
| :--- | :--- |
| **85% - 100%** | Very Stable |
| **65% - 84%** | Stable |
| **40% - 64%** | Slight Tremor |
| **Below 40%** | Unstable |

## ⚠️ Disclaimer
This application is for demonstration purposes only and is not intended for medical diagnosis. Please consult a medical professional for clinical health concerns.

## Maintainer
**Abhishek** - GitHub: [@Abhishek6353](https://github.com/Abhishek6353)

## Star the Repo ⭐
If this tool helped you, consider starring the repo!
