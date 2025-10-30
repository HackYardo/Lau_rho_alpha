
import numpy as np  # lib@3rd

if __name__ == '__main__':
    import gtp
    from backup import bots
else:
    from gotextprotocol import gtp

qr = gtp.qr

GTP_AXIS:str = "ABCDEFGHJKLMNOPQRST"  # no 'I'
SGF_AXIS:str = "abcdefghijkmnopqrst"  # no 'l'

def descartes(char:str) -> int:
    if char.isupper():
        return GTP_AXIS.find(char) + 1
    else:
        return SGF_AXIS.find(char) + 1

def vertex(x:int, y:int, flag:bool=True) -> str:
    if flag:
        return GTP_AXIS[x-1]+f'{y}'
    else:
        return SGF_AXIS[x-1]+SGF_AXIS[y-1]

def show(item) -> None:
    print(type(item))
    print(len(item))
    print(item)
    print()  

def display(sth) -> None:  # custom print something
    if len(sth) > 1:
        for item in sth:
            show(item)
    else:
        show(sth)

def board_size(proc, name=''):
    i:int = 1 if name != 'Leela Zero' else 3    
    lines = qr(proc, "showboard", name).split(sep='\n')[i,i+2]
    n = len(lines[0].split())
    m = int(lines[1].split()[0])
    return m, n

def board_num(proc, name='') -> np.ndarray:
    lines:list[str] = qr(proc, "showboard", name).split(sep='\n')
    i:int = 1 if name != 'Leela Zero' else 3
    n:int = len(lines[i].split())
    m:int = int(lines[i+1].split()[0])
    
    boardNum:np.ndarray = np.zeros((1, m*n), np.int8)
    raw:str = ' '.join(lines[i+1:m+i+1])
    idx:int = -1
    for j, char in enumerate(raw):
        if char in '.XO+' and raw[j-2] != ' ':
            idx = idx + 1
            if char == 'X':
                boardNum[0, idx] = -1
            elif char == 'O':  # upper case of 'o', not zero '0'
                boardNum[0, idx] = 1
            else:
                pass
        else:
            continue
    return boardNum.reshape(m, n)

def num2rgba(matrix):
    vector = matrix.reshape(1, matrix.size)[0]
    color:list[str] = ['rgba(0,0,0,0)' for i in range(0, matrix.size)]
    for idx, item in enumerate(vector):
        a = abs(item)
        if item < 0:
            color[idx] = f'rgba(0,0,0,{a})'
        elif item > 0:
            color[idx] = f'rgba(255,255,255,{a})'
        else:
            continue
    return color

def board_rgba(proc, name=''):
    return num2rgba(board_num(proc, name))

def rgba(proc, name=''):
    lines:list[str] = qr(proc, "showboard", name).split(sep='\n')
    i:int = 1 if name != 'Leela Zero' else 3
    n:int = len(lines[i].split())
    m:int = int(lines[i+1].split()[0])
    
    color:list[str] = ['rgba(0,0,0,0)' for k in range(0, m*n)]
    raw:str = ' '.join(lines[i+1:m+i+1])
    idx:int = -1
    for j, char in enumerate(raw):
        if char in '.XO+' and raw[j-2] != ' ':
            idx = idx + 1
            if char == 'X':
                color[idx] = 'rgba(0,0,0,1)'
            elif char == 'O':  # upper case of 'o', not zero '0'
                color[idx] = 'rgba(255,255,255,1)'
            else:
                pass
        else:
            continue
    return color, m, n

def board_capture(proc, name=''):  # only GNU Go
    lines = qr(proc, "showboard", name).split(sep='\n')
    m = int(lines[2].split()[0])
    i = round(m/2)
    
    black = int(lines[i].split()[-2])
    white = int(lines[i+1].split()[-2])
    return [black, white]

def session(bot):
    proc = gtp.bot_run(bot['cmd'], bot['dir'])
    greet, name = gtp.bot_ready(proc)
    print(greet)
    while True:
        word = input()
        if word == "quit":
            print(gtp.bot_end(proc))
            break
        elif word == "board":
            show(board_num(proc, name))
        elif word == "rgba":
            show(rgba(proc, name))
        else:
            print(qr(proc, word, name))

if __name__ == '__main__':
    session(bots['l'])
