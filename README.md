<h1 align="center">🌌 SpectreConky</h1>

<p align="center">
  <img src="https://i.ibb.co/WpjR6Lp6/Screenshot-2025-10-26-15-45-02.png" alt="SpectreConky Preview" width="45%" style="margin-right: 10px; border-radius: 8px;">
</p>

<p align="center">
  <strong>SpectreConky</strong> is a minimalist, futuristic Conky widget inspired by Rainmeter’s “Spectre” skin — redesigned for Linux desktops.<br>
  It displays the <strong>day</strong>, <strong>date</strong>, and <strong>time</strong> in bold Researcher font, styled white-on-black with full transparency and perfect centering.<br>
  Lightweight, auto-starting, and visually striking — ideal for modern Linux setups.
</p>

<hr>

<h2>✨ Features</h2>

<ul>
  <li>🕒 Large, stretched day of the week (e.g., <strong>SUNDAY</strong>)</li>
  <li>📅 Clean date below (e.g., <strong>26 OCTOBER, 2025.</strong>)</li>
  <li>⏰ Centered time with dashes (<strong>- 10:51 -</strong>)</li>
  <li>⚡ Transparent background — no borders</li>
  <li>💾 Auto-start on boot</li>
  <li>🧠 Managed via <strong>Conky Manager 2</strong></li>
  <li>🧩 Uses <strong>Researcher Regular</strong> futuristic font</li>
  <li>💡 Inspired by the <em>Spectre Rainmeter</em> aesthetic</li>
</ul>

<hr>

<h2>🧰 Requirements</h2>

<ul>
  <li><strong>Conky</strong> (<code>conky-all</code> package)</li>
  <li><strong>Conky Manager 2</strong> <em>(required for easy widget control)</em></li>
  <li><strong>Font Awesome</strong> <em>(for optional icons)</em></li>
  <li><strong>Researcher-Regular.ttf</strong> <em>(included in this repository)</em></li>
</ul>

<p><strong>Tested on:</strong></p>
<ul>
  <li>Linux Lite 7.4</li>
  <li>Ubuntu 22.04+</li>
  <li>Arch Linux</li>
  <li>Fedora / RHEL</li>
</ul>

<hr>

<h2>📦 Installation</h2>

<h3>🔧 Auto Install (Recommended)</h3>

<p>First, clone the repository from GitHub:</p>
<p>First, clone the repository from GitHub:</p>

```bash
git clone https://github.com/chrizmonsaji/SpectreConky.git
```

```bash
cd SpectreConky
```

<p>Then, run the included setup script:</p>

```bash
chmod +x ./spectre-setup.sh
```

```bash
./spectre-setup.sh
```

<p>The script will:</p>

<ul>
  <li>Install Conky, Conky Manager 2, and required dependencies</li>
  <li>Copy configuration files to <code>~/.config/conky/</code></li>
  <li>Install the Researcher font system-wide</li>
  <li>Add SpectreConky to your startup applications</li>
  <li>Launch the widget automatically</li>
</ul>
```
