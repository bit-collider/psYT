# psYT

PowerShell scripts for conveniently downloading content from YouTube, allowing you to specify video quality and extract audio.

## Scripts

### PowerShell Scripts

* **`yt-mp4.ps1`**: Downloads a YouTube video with a specified quality and the best available audio stream. The output filename will include the YouTuber's name and the video title.
* **`yt-mp3.ps1`**: Downloads the best available audio stream from one or more YouTube URLs. It extracts the audio and saves it as a high-quality MP3 file. The output filename will include the YouTuber's name and the video title.

## Prerequisites

Ensure that these tools are installed and accessible in your system's PATH or located in the same directory as these scripts.

* **yt-dlp**: These scripts rely on [yt-dlp](https://github.com/yt-dlp/yt-dlp), a powerful command-line tool for downloading videos and audio from YouTube and various other platforms.

* **FFmpeg**: These scripts also require [FFmpeg](https://github.com/BtbN/FFmpeg-Builds/releases), a tool used for processing video and audio files.

* **PowerShell**: These are PowerShell scripts (`.ps1`), so you need PowerShell installed on your system.


## PowerShell Execution Policy

PowerShell restricts script execution by default for security reasons. If you encounter a message like *"running scripts is disabled on this system"*, you'll need to adjust the execution policy.

To temporarily allow script execution in your current session:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

To permanently allow script execution for the current user (more convenient but less secure):

```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

For more details, refer to the [official documentation on execution policies](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.4).

## Usage

### PowerShell

1. Open PowerShell.
2. Navigate to the directory where you have saved the `.ps1` scripts using the `cd` command.
3. Execute the scripts as follows:

   * **`yt-mp4.ps1`**:

     ```powershell
     .\yt-mp4.ps1 "<YouTube URL>" [Quality]
     ```

     * `<YouTube URL>`: The URL of the YouTube video you want to download. **(Required)**
     * `[Quality]`: The desired video quality (e.g., `720`, `1080`). This is **optional** and defaults to `1080` if not specified.

   * **`yt-mp3.ps1`**:

     ```powershell
     .\yt-mp3.ps1 "<YouTube URL 1>" ["<YouTube URL 2>" ...]
     ```

     * `<YouTube URL 1>`: The URL of the first YouTube video. **(Required)**
     * `["<YouTube URL 2>" ...]`: Additional YouTube URLs (optional, for batch downloads).
     * `[Quality]`: Automatically chooses the best one.

## Output

Downloaded files will be saved in the current directory. The filename format is structured as:

```
<YouTuber Name> - <Video Title>.<Extension>
```

Where:

* `<YouTuber Name>`: The name of the YouTube channel.
* `<Video Title>`: The title of the video.
* `<Extension>`: `mp4` for video downloads and `mp3` for audio downloads.

## Error Handling

The scripts include basic error handling and will display a usage message and exit if:

* No arguments are provided when the script is run.
* A mandatory argument, such as the YouTube URL, is missing.

## Important Notes

* Ensure that `yt-dlp.exe` and `FFmpeg` is either in your system’s PATH or located in the same directory as the PowerShell scripts.
* Respect YouTube's [Terms of Service](https://www.youtube.com/t/terms) when using these tools.
* These scripts are provided as-is and without warranty. Use them responsibly.

### Help

* To see the examples, type: `get-help ./yt-mp3.ps1 -examples`
* For more information, type: `get-help ./yt-mp3.ps1 -detailed`
* For technical information, type: `get-help ./yt-mp3.ps1 -full`
