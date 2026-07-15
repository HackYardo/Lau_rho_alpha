
def gtp_sgf(vertex:str):
    gtp = 'ABCDEFGHJKLMNOPQRST'
    sgf = 'abcdefghijkmnopqrst'
    

class Node:
    def __init__(self, vertex='', /, move=0, branch=0, *, pairs=dict()):
        self.vertex = vertex
        self.move = move
        self.branch = branch
        self.pairs = pairs
    
        
