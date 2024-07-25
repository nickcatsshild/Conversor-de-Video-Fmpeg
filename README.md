# Video Converter with FFmpeg

## Purpose

The goal of this script is to convert videos into desired formats in an automated and straightforward manner.

## Introduction

Before we begin, let me explain my setup. I have a server running Jellyfin, and I'm in the process of organizing everything. This script works well if you have a graphics card capable of being used for encoding; it will perform efficiently. If you don't have such a card, the conversion will still work but might take longer.

## Prerequisites

Download and extract the latest version of FFmpeg into the folder where the scripts are located. The FFmpeg executables must be within the same directory as the scripts.
[Download FFmpeg](https://ffmpeg.org/download.html#build-windows)

For those who prefer to avoid command-line programs, we have developed a series of simplified drag-and-drop scripts for Windows.

### Key Requirement

You must have FFmpeg installed on your computer. If you don't, follow the detailed instructions in our article: "How to Install FFmpeg on Windows."

Download the ready-made FFmpeg scripts for Windows and Linux, which will be available soon.

## Script Overview

Here, we provide a brief explanation of each script. For a more detailed understanding, we recommend watching the explanatory video on our YouTube channel.

## Usage Instructions

1. Ensure FFmpeg is installed on your computer. If not, download and extract the files into the same folder as the scripts.

### Scripts

#### Video to MKV

- Converts single audio track files from various formats to MKV. This script only changes the container to MKV, leaving the rest unchanged.

#### Video to Single Audio MP4

- Converts single audio track files from various formats to MP4. This script only changes the container to MP4, leaving the rest unchanged.

#### Audio to AAC

- Changes only the audio codec of a video, leaving the rest unchanged, including the container.

#### Video to Dual Audio MP4

- Converts dual audio track files from various formats to MP4. This script changes the container to MP4, preserving both audio tracks and leaving the rest unchanged.

#### Video to MP4 H264 AAC

- Converts the video to MP4, changing the video codec to H264 and the audio codec to AAC, providing better compatibility for streaming with Plex, Emby, or Jellyfin. This script is applicable only to single audio track files.

#### Video to Dual Audio MP4 H264

- Converts the video to MP4, changing the video codec to H264 while keeping both original audio tracks. Ideal for better streaming compatibility with Plex, Emby, and Jellyfin.

## New Scripts

I have made some updates to improve conversion further. Included are scripts to convert to H265, VP8, and VP9 formats, removing meta tags from videos while maintaining the same video size.

## Conversion with FFmpeg on Linux

I also developed a script for use on a Linux server, which can be used as a service with an input and output directory. (Note: Running it as a service consumes some resources, so I do not recommend it.)

---

Feel free to download and use these scripts to simplify your video conversion tasks and enhance your media library organization.
