## About
**[VastBaduk]()** is a web-ui for the game of Go/Weiqi/Baduk. Based on NiceGUI and GoTextProtocol engines.

> *[VastGo]()* is a sister repo written in julia, not python.

The aims of VastGo and VastBaduk are the same:

- play some sorts of Baduk games without modifying AI als or retraining neutral network models/weights from zero
 - four kinds of blind go:
 - MagnetGo or 1000-voltage-Go or ElectricalGo
 - liangzi Go
 - random opening
 - multiple colors Go
 - reuse captured stones from opponints
 - rectangle stones Go
- plot visualizing: 3D-ownship, score-tree
- cross-platforms:
 - Android (with [Termux](termux.org))
 - Linux
 - Windows
- compatiticed with Sabaki and Ogatak, (and Online-Go-Server someday maybe)

## Status

mode | GNU Go | KataGo | Leela-Zero


## Usage

soft/hardware requrement

<details>
  <summary>qucikstart (e.g. KataGo)</summary>

- somewhere/
 - badukbots/
  - katago(.exe)
  - model.bin.gz
  - gtp.cfg
 - pyvenv/
  - bin/
   - python
  - lib/
   - python3.12/
    - site-packages/
     - nicegui/
     - numpy/
     - plotly/
 - VastBaduk/
  - pagemain.py

Go to **VastBaduk/** and type **../pyvenv/bin/python pagemain.py** in terminal
</details>

```lisp
python pip
python venv
pip install nicegui ...
download and then unzip repop.zip
path/to/venv/bin/python main.py
```

## License

## Link

Refs:

- [the game of Go](quickref.pdf)
- [GoTextProtocal]()
- [SmartGameFormat]()
- [NiceGUI]()

Bots:

Bot        | Engine  | NN model/weight
---        | ---     | ---
GNU Go     | release | ---
KataGo     | release | models
Leela Zero | release | weights

UIs:

[KaTrain]()
[LizGoban]()
[LizzieYzy]()
[Ogatak]()
[Online-Go Server]()
[q5Go]()
[Sabaki]()

Art:

favicon: favicon.cc
Symbol: Google
diagram: PlantUML

Miscellaneous:

- [a command line tutorial]()
- [KataGo's RuleSet]()
- [KataGo's GTP Extention]()
- [KataGo's config sample]()
- [Sensei's Library]()
十进制版本号
