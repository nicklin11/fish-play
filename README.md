# fish-play

A lightweight Fish shell wrapper for `mpv` and `yt-dlp` designed for background music playback.
Легковесная обертка для `mpv` и `yt-dlp` для оболочки Fish, предназначенная для фонового воспроизведения музыки.

---

## Features / Возможности

*   **Background Playback:** Music continues playing even after you close the terminal. / **Фоновое воспроизведение:** Музыка продолжает играть после закрытия терминала.
*   **Search Support:** YouTube (default) and SoundCloud. / **Поиск:** YouTube (по умолчанию) и SoundCloud.
*   **Proxy Support:** Integrated `-proxy_on` flag to route requests through a local SOCKS5 proxy (port 2080). / **Поддержка прокси:** Флаг `-proxy_on` для маршрутизации через ваш локальный SOCKS5 прокси (порт 2080).
*   **Smart URL Handling:** Automatically detects any URL (including VK, Yandex, RuTube) and plays them directly. / **Умная обработка ссылок:** Автоматически распознает любые URL (включая VK, Яндекс, RuTube) и воспроизводит их напрямую.
*   **Desktop Notifications:** Uses `notify-send` for track information. / **Уведомления:** Использует `notify-send` для информации о треке.

## Requirements / Требования

*   [Fish Shell](https://fishshell.com/)
*   [mpv](https://mpv.io/)
*   [yt-dlp](https://github.com/yt-dlp/yt-dlp)
*   `libnotify-bin` (for desktop notifications / для уведомлений)

## Installation / Установка

1. Create the function file: / Создайте файл функции:
   ```bash
   nano ~/.config/fish/functions/play.fish
   ```
2. Paste the script into this file and save it. / Вставьте скрипт в этот файл и сохраните его.
3. Restart your terminal. The `play` command is now available globally. / Перезапустите терминал. Теперь команда `play` доступна глобально.

## Usage / Использование

```fish
play [flags] <query or url>
```

### Flags / Флаги:

| Flag / Флаг | Description / Описание |
| :--- | :--- |
| `-yt` | YouTube (Default / По умолчанию) |
| `-sc` | SoundCloud |
| `-proxy_on` | Enable SOCKS5 proxy on port 2080 / Включить SOCKS5 прокси (порт 2080) |

### Examples / Примеры:

*   **Default search (YouTube):** / **Поиск по умолчанию (YouTube):**
    `play lo-fi hip hop`
*   **SoundCloud search with proxy:** / **Поиск в SoundCloud через прокси:**
    `play -sc -proxy_on techno mix`
*   **Direct URL playback:** / **Прямое воспроизведение по ссылке:**
    `play https://music.yandex.ru/album/...`

