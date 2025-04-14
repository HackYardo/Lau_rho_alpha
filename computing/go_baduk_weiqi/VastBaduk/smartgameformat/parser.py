
import numpy as np

s:str = """
(;(;;(;)
     (;;))
  (;(;;;)
    (;)))"""

l:list[str] = [s, "(;;;;;;;)", "(;;;(;;;;)(;;))", "(;;;(;;;;)(;;)(;;;;;))",
               "(;;;(;;(;;)(;;))(;;))", "(;;;(;;;;)(;;)(;;;(;;)(;)))"]

def matrix2sgf() -> str:
    pass

def sgf2matrix(s:str) -> np.ndarray:  # only one gametree, not collection
    s = ''.join(s.split())
    rows = s.count(")(") + 1
    cols = []

    for i in range(0, rows):
        idx_right = s.find(')')
        line = s[:idx_right]
        cols.append(line.count(';'))
        idx_left = line.rfind('(')
        while len(s) > idx_right+1 and s[idx_right+1] == ')':
            idx_left = s[:idx_left].rfind('(')
            idx_right = idx_right + 1
        s = s[0:idx_left] + s[idx_right+1:]
        
    #matrix = np.zeros((rows, max(cols)), np.int8)
    
    return cols  #matrix

def test(l:list[str]) -> None:
    for s in l:
        cols = sgf2matrix(s)
        print(type(cols), '\n', cols)

def test_collection() -> None:
    with open("../sgf/ff4_ex.sgf") as f:
        print(sgf2matrix(f.read()))

#test(l)
#test_collection()
print(sgf2matrix(''.join(l)))
