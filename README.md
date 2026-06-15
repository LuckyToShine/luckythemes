# 🌌 Caelestia Schemes

A curated collection of custom color schemes and configurations for the **Caelestia** desktop environment. These themes completely overhaul your UI components—including dashboards, media players, weather widgets, and terminal emulators—to deliver cohesive visual experiences ranging from deep space aesthetics to high-contrast monochrome.

---

## 🎨 Available Themes

| Preview | Theme Name | Description | Key Accents |
| :---: | :--- | :--- | :--- |
| ![Dasli](dasli/preview2.png) | **Dasli** | The vibrant, signature look of Windows 11. | Deep Blues and Black |
| ![BlackArch](blackarch/preview2.png) | **BlackArch** | An aggressive, high-contrast dark theme optimized for stealth setups. | Pitch Black & Glowing Red |
| ![DarkMono](darkmono/preview2.png) | **DarkMono** | A clean, minimalist aesthetic stripped of all color distractions. | Monochromatic Grays & White |

---

## 🚀 Installation & Setup

> [!WARNING]
> The installation script uses **symlinks**. Moving or deleting the repository folder after installation will break your application configurations (e.g., Hyprland may fail to start). 
> 
> **Recommended Path:** Clone this repository directly to `~/.local/share/caelestia`.

### Prerequisites
Make sure you have the [`fish`](https://github.com/fish-shell/fish-shell) shell installed before running the automated setup.

```sh
# Clone the repository to the recommended directory
git clone https://github.com/LuckyToShine/Dasli-theme.git ~

# Navigate to the directory
cd ~/Dasli-theme

# Installation
sudo mv Dasli

The install script has some options for installing configs for some apps.
