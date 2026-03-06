# fish-play
A lightweight Fish shell wrapper for `mpv` and `yt-dlp` designed for background music playback with support for multiple platforms and local proxying.

## 🇷🇺 Описание на русском
**fish-play** — это легкая обертка для `mpv` и `yt-dlp` для оболочки Fish, предназначенная для фонового воспроизведения музыки с поддержкой различных платформ и локального прокси.

### Основные возможности
- **Фоновое воспроизведение:** Музыка продолжает играть, даже если вы закроете терминал.
- **Поддержка платформ:** Легкое переключение между YouTube, SoundCloud (по умолчанию), VK, RuTube и Яндекс Музыкой.
- **Поддержка прокси:** Флаг `-proxy_on` для маршрутизации трафика через ваш локальный SOCKS5 прокси (порт 2080).
- **Уведомления:** Использует `notify-send` для вывода информации о треке.
- **Умная обработка ссылок:** Автоматически распознает URL и воспроизводит их напрямую.

## Prerequisites / Требования
Ensure you have the following installed:
- [Fish Shell](https://fishshell.com/)
- [mpv](https://mpv.io/)
- [yt-dlp](https://github.com/yt-dlp/yt-dlp)
- `libnotify-bin` (for `notify-send`)

## Installation / Установка
1. Create the function file:
   ```bash
   nano ~/.config/fish/functions/play.fish
   ```
2. Paste the script into this file and save it.
3. Restart your terminal (or run `source ~/.config/fish/config.fish`). The `play` command will now be available globally.

## Usage / Использование

Basic command / Базовый синтаксис:
```fish
play [flags] <query or url>
```

### Flags / Флаги:
| Flag | Platform |
| :--- | :--- |
| `-sc` | SoundCloud (Default / По умолчанию) |
| `-yt` | YouTube |
| `-ya` | Yandex Music / Яндекс Музыка |
| `-vk` | VKontakte / ВКонтакте |
| `-rt` | RuTube |
| `-proxy_on` | Enable SOCKS5 proxy on port 2080 / Включить SOCKS5 прокси (порт 2080) |

### Examples / Примеры:
* **Default search (SoundCloud):**
  `play lofi hip hop`
* **YouTube search with proxy:**
  `play -yt -proxy_on phonk mix`
* **Direct URL playback:**
  `play https://music.yandex.ru/album/some-album`
* **Mixed flags:**
  `play -proxy_on -ya <url>`

