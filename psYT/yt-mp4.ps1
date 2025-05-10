<#
.SYNOPSIS
    Downloads a YouTube video with a specified quality and best audio.

.DESCRIPTION
    Downloads a YouTube video using yt-dlp, allowing you to specify the video quality.
    The filename will include the YouTuber's name.

.PARAMETER YouTubeURL
    The URL of the YouTube video to download.

.PARAMETER Quality
    The desired video quality (e.g., 1080). Defaults to 1080 if not provided.

.EXAMPLE
    .\yt-mp4.ps1 "https://www.youtube.com/watch?v=dQw4w9WgXcQ 1080

.EXAMPLE
    .\yt-mp4.ps1 "https://www.youtube.com/watch?v=GtL1huin9EE"
#>
param(
    [Parameter(Mandatory=$false)]
    [string]$YouTubeURL,

    [string]$Quality = "1080"
)


Write-Host "YouTube URL: $YouTubeURL"
write-host "Quality: $Quality"

$outputTemplate = "%(uploader)s - %(title)s.%(ext)s"
$formatString = "bestvideo[height<=$Quality]+bestaudio"


& yt-dlp.exe -f $formatString --merge-output-format mp4 -o $outputTemplate $YouTubeURL

Write-Host "Download complete."