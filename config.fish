function play
    set -l platform "yt" # YouTube теперь по умолчанию
    set -l proxy_on 0
    set -l query_args

    for arg in $argv
        switch "$arg"
            case "-yt"
                set platform "yt"
            case "-sc"
                set platform "sc"
            case "-proxy_on"
                set proxy_on 1
            case "*"
                set -a query_args "$arg"
        end
    end

    set -l input (string join " " $query_args)
    set -l proxy_url "socks5://127.0.0.1:2080"
    
    set -l bg_flags --no-video --no-terminal --input-ipc-server=/tmp/mpvsocket --ytdl-format=bestaudio
    
    if test $proxy_on -eq 1
        set -a bg_flags --ytdl-raw-options="yes-playlist=,proxy=$proxy_url"
    else
        set -a bg_flags --ytdl-raw-options="yes-playlist="
    end

    set -l launch_mpv mpv $bg_flags
    if test $proxy_on -eq 1
        set launch_mpv env all_proxy="$proxy_url" http_proxy="$proxy_url" https_proxy="$proxy_url" mpv $bg_flags
    end

    if string match -r "^https?://" "$input" > /dev/null
        $launch_mpv "$input" >/dev/null 2>&1 &
        disown
        notify-send -a "Music" "🎶 Запуск по ссылке"
        return 0
    end

    notify-send -a "Music" "🔍 Поиск..." "Платформа: $platform"
    
    set -l ytdl_cmd yt-dlp
    if test $proxy_on -eq 1; set -a ytdl_cmd --proxy "$proxy_url"; end

    set -l search_query
    if test "$platform" = "sc"
        set search_query "scsearch1:$input"
    else
        set search_query "ytsearch1:$input"
    end

    set -l result ($ytdl_cmd --print "%(title)s" --print "%(webpage_url)s" --no-playlist "$search_query" 2>/dev/null)

    if test (count $result) -ge 2
        set -l title $result[1]
        set -l url $result[2]

        if test "$platform" = "yt"
            set -l video_id (string match -r "(?:v=|/)([0-9A-Za-z_-]{11})" "$url")[2]
            set url "https://www.youtube.com/watch?v=$video_id&list=RD$video_id"
        end

        $launch_mpv "$url" >/dev/null 2>&1 &
        disown
        notify-send -a "Music" "✅ Запущено" "$title"
    else
        notify-send -a "Music" "❌ Ничего не найдено"
    end
end