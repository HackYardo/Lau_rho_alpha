= FFmpeg
== Intro
== Usage
```sh
# resize an image
ffmpeg -i demo.jpg -vf scale=160:-1 demo_small.png
# resize a video
ffmpeg -i demo.mp4 -vf scale=160:90 demo_small.png
# resize a video with the aspect ratio
ffmpeg -i demo.mp4 -vf "scale=iw*0.5:ih*0.5" demo_50.mp4
# crop a 1K video from the top left 100,100 pixels
ffmpeg -i demo.mp4 -vf "crop=160:90:100:100"
```
== Option
/ -i: input a file
/ -vf: apply a filter
/ scale: the aspect ratio filter
/ crop: the crop filter
