# Transcend-DrivePro-200
Conjoin videos with ffmpeg and bash scripting + timelapse for the Transcend DrivePro 200

This file has been tested using Manjaro Linux.  No guarantees this will work with your system, **not responsible for file loss or system damage -- See MIT license**.

# Assumptions
1) You are using a Transcend DrivePro 200 or another DashCam which uses H.264 videos under a QuickTime MOV container at 29.97 fps.
2) You want to combine your files into one full output file and one 1:16 timelapse file at 59.94fps
3) You have access to Bash scripting
4) You have ffmpeg with all the prereqs installed to process video with **libx264**
5) Your raw movie files are in subdirectories under the directory in which you will run this file.  Your subdirectories are arranged alphabetically in the order in which you want the videos ordered.  Within each subdirectory, the videos are named in alphabetical order that matches chronological order.
6) You don't want sound in the timelapse (as it will make no sense anyway since we're dropping 7 out of 8 frames)
7) You should replace "Trip Name Goes Here" with something 
8) You want to keep your source files
9) You don't have more than 9,999 source files
10) You have **no other .MOV files in the directory you will run this script in -- as they will be deleted**

# Steps
1) import this file into the directory **above** all the files you want to merge and timelapse.  It will look at all directories underneath.
2) **chmod 700 trip.sh** or some other permission that allows for execution
3) **./trip.sh**

# Parameters You Can Change
1) `tripname="Trip Name Goes Here"` Change the trip name to something meaningful.  For example, if you name your trip Tennessee, you'll see Tennessee_full.mp4 as the conjoined raw files and Tennessee_lapse16.mp4 as the 1:16 timelapse.
2) The first `-r:v "479.52/1"` makes the timelapse come out as 1:16, because the dashcam natively records at 29.97fps.  29.97x16=479.52.  If you want to change the timelapse scale to 1:24, for example, you may change this to "719.28/1" because 29.97x24=719.28
3) The second `-r:v "59.94/1"` makes the timelapse framerate 59.94fps.  If you want 29.97fps, change this to "29.97/1"
4) The `-an` argument removes the audio track
5) The `-c:v libx264` uses **libx264** to encode.  If you prefer a different codec, change, but be aware you may need to modify the container to be something other than mp4 if you use an incompatible codec.
