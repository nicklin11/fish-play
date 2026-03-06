# fish-play
A lightweight Fish shell wrapper for `mpv` and `yt-dlp` designed for background music playback with support for multiple platforms and local proxying.

## Features
- **Background Playback:** Plays music in the background without needing an open terminal window.
- **Multi-Platform Support:** Easily switch between YouTube, SoundCloud (default), VK, RuTube, and Yandex Music.
- **Proxy Support:** Integrated `-proxy_on` flag to route requests through a local SOCKS5 proxy (default port 2080).
- **Desktop Notifications:** Uses `notify-send` to confirm track information.
- **Smart URL Handling:** Automatically detects URLs and skips search if a direct link is provided.

## Prerequisites
Ensure you have the following installed:
- [Fish Shell](https://fishshell.com/)
- [mpv](https://mpv.io/)
- [yt-dlp](https://github.com/yt-dlp/yt-dlp)
- `libnotify-bin` (for `notify-send`)

## Installation
1. Copy the `play` function into your fish configuration:
   ```bash
   nano ~/.config/fish/config.fish

    Paste the script at the bottom of the file.

    Save and restart your terminal (or run source ~/.config/fish/config.fish).

Usage

Basic command:
code Fish

play [flags] <query or url>

Flags:
Flag	Platform
-sc	SoundCloud (Default)
-yt	YouTube
-ya	Yandex Music
-vk	VKontakte
-rt	RuTube
-proxy_on	Enable proxy (SOCKS5 on port 2080)
Examples:

    Default search (SoundCloud):
    play lofi hip hop

    YouTube search with proxy:
    play -yt -proxy_on phonk mix

    Direct URL playback:
    play https://music.yandex.ru/album/some-album

    Mixed flags:
    play -proxy_on -ya <url>

# fish-play

Легковесная обертка (wrapper) для `mpv` и `yt-dlp` для оболочки Fish, предназначенная для фонового воспроизведения музыки с поддержкой различных платформ и локального прокси.

## Возможности
- **Фоновое воспроизведение:** Музыка продолжает играть, даже если вы закроете терминал.
- **Поддержка платформ:** Легкое переключение между YouTube, SoundCloud (по умолчанию), VK, RuTube и Яндекс Музыкой.
- **Поддержка прокси:** Флаг `-proxy_on` для маршрутизации трафика через ваш локальный SOCKS5 прокси (по умолчанию порт 2080).
- **Уведомления:** Использует `notify-send` для вывода информации о треке.
- **Умная обработка ссылок:** Автоматически распознает ссылки и играет их напрямую.

## Требования
Убедитесь, что у вас установлены:
- [Fish Shell](https://fishshell.com/)
- [mpv](https://mpv.io/)
- [yt-dlp](https://github.com/yt-dlp/yt-dlp)
- `libnotify-bin` (для работы `notify-send`)

## Установка
1. Создайте файл функции:
   ```bash
   nano ~/.config/fish/functions/play.fish

    Скопируйте содержимое скрипта play.fish в этот файл и сохраните.

    Перезапустите терминал (или выполните source ~/.config/fish/config.fish). Теперь команда play доступна глобально.

Использование

Базовый синтаксис:
code Fish

play [флаги] <запрос или ссылка>

Флаги:
Флаг	Платформа
-sc	SoundCloud (По умолчанию)
-yt	YouTube
-ya	Яндекс Музыка
-vk	ВКонтакте
-rt	RuTube
-proxy_on	Включить прокси (SOCKS5, порт 2080)
Примеры:

    Поиск по умолчанию (SoundCloud):
    play lofi hip hop

    YouTube с включенным прокси:
    play -yt -proxy_on phonk mix

    Прямая ссылка:
    play https://music.yandex.ru/album/some-album

    Комбинированные флаги:
    play -proxy_on -ya <ссылка>