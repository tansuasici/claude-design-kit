# Store screenshot sizes

Pixel sizes as listed in the editor's device table (`src/lib/devices.ts`) at
commit `e889033` of ParthJadhav/app-store-screenshots. They are a starting point,
not a source of truth: **confirm them in App Store Connect or Play Console before
uploading.** Export PNG or JPG without an alpha channel.

## Apple (App Store Connect)

| Target | Sizes (W×H) | Notes |
|---|---|---|
| iPhone | 1320×2868 (6.9"), 1284×2778 (6.5"), 1206×2622 (6.3"), 1125×2436 (6.1") | Landscape is the same sizes turned. |
| iPad | 2064×2752 (13"), 2048×2732 (12.9") | |
| iPhone Duo, outer | 1398×2034 portrait, 2034×1398 landscape | Each display and orientation is its own set. Capture each display at its own size; never resize iPhone captures. |
| iPhone Duo, inner | 2007×2853 portrait, 2853×2007 landscape | |
| Apple TV | 3840×2160, 1920×1080 | Landscape only. |
| Apple Watch | 422×514, 410×502 (Ultra), 416×496 (Series 10), 396×484 (Series 7), 368×448 (Series 4), 312×390 (Series 3) | Two or three short words per headline line. |
| CarPlay | iPhone sizes in landscape (2868×1320 …) | No slot of its own: CarPlay shots go in the iPhone slot. |
| Mac | 2880×1800, 2560×1600, 1440×900, 1280×800 | 16:10 landscape only. Its own platform, not under iOS. |
| Creative, universal | 5244×2950 | Product page header and search results. |
| Creative, header | 3840×1646 | Product page header only. |
| Creative, search | 3840×2560, 1920×1280 | Search results, 3:2. |

Up to 10 screenshots per set. Creative assets are optional and are reviewed
separately from screenshots; keep the message and focal art inside the art safe
area, and write one short line per creative, not a screenshot headline.

## Google Play (Play Console)

| Target | Sizes (W×H) | Notes |
|---|---|---|
| Phone | 1080×1920 | |
| 7" tablet | 1200×1920 portrait, 1920×1200 landscape | |
| 10" tablet | 1600×2560 portrait, 2560×1600 landscape | |
| Feature graphic | 1024×500 | No device frame. Shown at many crops; keep the message central. |

Up to 8 screenshots per device type. Play rejects PNGs with an alpha channel.

## Frames
Apple's product bezels are licensed for mock-ups of apps on Apple platforms only.
Android decks use a neutral frame or none. Keep Watch, TV, CarPlay and Mac frames
fully inside the canvas; a cropped watch or TV reads as a mistake.
