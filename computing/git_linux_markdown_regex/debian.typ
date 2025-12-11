== Download and Verify
== Ready a USB Drive
== Reboot to install
== Check Hardware, Software
=== Sudo User
=== CPU Frequency
=== Input Method
```sh
ibus-setup
apt search pinyin ibus
# space, b, q
apt show ibus-pinyin
# q
apt show ibus-libpinyin
sudo apt install ibus-libpinyin -y
ibus-setup
```
== Set APT Source
== Remove, Install Software
```sh
sudo apt install vlc gnugo

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
sudo apt install pkg-tools libssl-dev
cargo install --locked typst-cli
typst -V

curl -fsSL https://install.julialang.org | sh
julia
]st
add WGLMakie GLMakie CairoMakie
# ctrl d
cd Downloads
mkdir juliaplot
cd juliaplot
touch cairomakie.jl
nano cairomakie.jl
```
```jl
using CairoMakie
v = rand(10, 2)
f = scatter(v[:,1], v[:,2], rasterize = 10, markersize = 30.0)
save("cm.pdf", f, pdf_vesion="1.7")
```
```sh
# ctrl x, y, enter
julia cairomakie.jl
firefox cm.pdf
# alt f4
cd ..

python3 -V  # 3.13.5
mkdir python3_13_5venv
cd python3_13_5venv
sudo apt install python3-venv
python3 -m venv .
bin/python -m ensurepip --upgrade
bin/python -m pip --version
bin/python -m pip install -U NiceGUI
wget 'https://github.com/zauberzeug/nicegui/archive/refs/heads/main.zip'
unzip main.zip
bin/python main.py
```
== Set Software
```sh
firefox
# homepage, new tab
# search engine
# https only
# not send usage data
# alt f4
firefox
# import bookmarks, passwords
```
