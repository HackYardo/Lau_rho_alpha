bots = {
    "g": {
        'dir': ".",
        'cmd': "gnugo --mode gtp"},
    "k": {
        'dir': "../badukbots",
        'cmd': "./katago gtp -model model.bin.gz -config gtp.cfg"},
    "l": {
        'dir': "../badukbots",
        'cmd': "leelaz -g -w weight.gz -v 64 --cpu-only --noponder"},
    "g10": {
        'dir': ".",
        'cmd': "gnugo --mode gtp --boardsize 10 --komi 25"},
    "k-6":{
        'dir': "../badukbots",
        'cmd': "./katago gtp -model model.txt.gz -config gtp.cfg"},}

REPO = __file__[:-24]  # the origin of relative paths

cols = [
    {'name': 'name', 'label': 'Name', 'field': 'name', 'align': 'left'},
    {'name': 'dir',  'label': 'Dir',  'field': 'dir',  'align': 'left'},
    {'name': 'cmd',  'label': 'Cmd',  'field': 'cmd',  'align': 'left'},]

def bots_update(l:list[dict]) -> None:
    s = "bots = {"
    for item in l:
        s = s + f"""
    "{item['name']}": {{
        'dir': "{item['dir']}",
        'cmd': "{item['cmd']}"}},"""
    s = s + '}'

    with open(__file__, 'r') as f:
        old = f.read()
        idx = old.find("\n\n")
        new = s + old[idx:]
    with open(__file__, 'w') as f:
        f.write(new)
    
def rows_gen(d:dict[dict]) -> list:
    l = []
    for key, val in d.items():
        val['name'] = key
        l.append(val)
    return l

rows = rows_gen(bots)
