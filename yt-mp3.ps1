<#
.SYNOPSIS
    Downloads the best audio from YouTube and saves it as a high-quality MP3.

.DESCRIPTION
    Downloads the best available audio stream from the provided YouTube URL(s)
    using yt-dlp, converts it to MP3, and saves it with the YouTuber's name and
    video title in the filename.

.PARAMETER YouTubeURL
    One or more YouTube video URLs to download the audio from.

.EXAMPLE
    .\yt-mp3.ps1 "https://www.youtube.com/watch?v=dQw4w9WgXcQ"

.EXAMPLE
    .\yt-mp3.ps1 "https://www.youtube.com/watch?v=dQw4w9WgXcQ" "https://www.youtube.com/watch?v=GtL1huin9EE"
#>
param(
    [Parameter(Mandatory=$false, ValueFromRemainingArguments=$true)]
    [string[]]$YouTubeURL
)

if (-not $YouTubeURL) {
    Write-Host "Error: You must provide a YouTube URL."

    Write-Host "Usage: $($MyInvocation.MyCommand.Name) <YouTube URL 1> [YouTube URL 2] [...]"
    Write-Host "Example:"
    Write-Host "  $($MyInvocation.MyCommand.Name) "https://www.youtube.com/watch?v=whatever""
    Write-Host "  $($MyInvocation.MyCommand.Name) "https://www.youtube.com/watch?v=whatever" "https://www.youtube.com/watch?v=whatever" "
    exit 1
}


Write-Host "YouTube URL: $YouTubeURL"
write-host "Quality: Best"

$outputTemplate = "%(uploader)s - %(title)s.%(ext)s"


foreach ($url in $YouTubeURL) {
    Write-Host "Processing URL: $url"
    & yt-dlp.exe -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 -o $outputTemplate $url
}

Write-Host "Done."