
import asyncio

if __name__ == '__main__':
    import gtp
    from backup import rows
else:
    from gotextprotocol import gtp

async def bot_runa(row):
    return gtp.bot_run(row['cmd'], row['dir'])

async def bot_runl(rows):
    l = lambda rows: (bot_runa(row) for row in rows)
    return await asyncio.gather(*l(rows))

def bot_run(rows):
    return asyncio.run(bot_runl(rows))

async def qra(proc, word): 
    return gtp.qr(proc, word)

async def qrl(procs, word):
    l = lambda procs, word: (qra(proc, word) for proc in procs)
    return await asyncio.gather(*l(procs, word))

def qr(procs, word):
    return ''.join(asyncio.run(qrl(procs, word)))
"""
def v(func, vec):
    l = []
    for elem in vec:
        l.append(func(elem))
    return l
print(v(lambda proc: gtp.qr(proc, 'quit'), procs))
#"""
def session(rows):
    procs = bot_run(rows)
    print(procs)
    while True:
        word = input()
        print(qr(procs, word))
        if word == 'quit':
            break

if __name__ == '__main__':
    session(rows)
