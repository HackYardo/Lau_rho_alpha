
import subprocess as sp  # .Popen()
if __name__ == '__main__':
    import sys  # .argv
    from engine import bots, REPO
else:
    from gotextprotocol.engine import REPO

def bot_run(cmd, path=''):
    proc = sp.Popen(cmd.split(), text=True, bufsize=0,
                    cwd = REPO + path,
                    stdin=sp.PIPE, stdout=sp.PIPE, stderr=sp.STDOUT)
    return proc

def bot_try(cmd, path=''):
    try:
        proc = bot_run(cmd, path)
        greet = proc.communicate("24 quit")[0]
        if "=24" in greet:
            return ""
        else:
            return greet
    except FileNotFoundError:
        return f"wrong command `{cmd.split()[0]}` or directory `{path}`\n"
    except IndexError:
        return f"wrong command `{cmd}`"

def bot_end(proc):
    return proc.communicate("quit\n")[0]

def valid(word):
    if '' in word.split(' '):
        word = "blah"
    return word

def query(proc, word):
    word = valid(word)
    proc.stdin.write(f"{word}\n")
    #proc.stdin.flush()  # the same to `bufsize`

def reply(proc):
    paragraph = ""
    while True:
        sentence = proc.stdout.readline()
        if sentence == '\n':
            break
        paragraph = paragraph + sentence
    return paragraph

def reply_leelaz(proc, word):
    paragraph = ""
    if word == "showboard":
        for i in range(0,33):
            sentence = proc.stdout.readline()
            if sentence != '\n':
                paragraph = paragraph + sentence
    elif len(word) > 8 and word[0:8] == "genmove " and word[8] in "BWbw":
        while True:
            sentence = proc.stdout.readline()
            if sentence != '\n' and sentence[0] in "=?":
                paragraph = paragraph + sentence
                reply(proc)
                break
    elif word == "printsgf":
        paragraph = reply(proc)
        reply(proc)
    else:
        paragraph = reply(proc)
    return paragraph

def qr(proc, word, name=''):  # query_reply
    query(proc, word)
    if name == 'Leela Zero':
        return reply_leelaz(proc, word)
    else:
        return reply(proc)
    
def bot_ready(proc):
    greet = qr(proc, "name")
    name = greet[greet.rfind('=')+2:-1]
    return greet, name

def arg(args):
    cmd = 'gnugo --mode gtp'
    path = ''
    
    helpMessage = f"""\
-h, --help\tDisplay this help message.
-c '<cmd>'\tThe command to run a GoTextProtocol engine bot.
-d '<dir>'\tThe directory where to run the command.
-b  <bot> \tRun a bot from the file "gotextprotocol/engine.py".
--once    \tDisable test-run before run. (Disable run twice.)
--test    \tOnly test-run, and not run. If pass, do nothing.

Examples:
  python3 gtp.py -h
  python3 gtp.py -c '{cmd}'
  python3 gtp.py -c '{cmd}' -d '{path}'
  python3 gtp.py -b g
  python3 gtp.py --once -b g
  python3 gtp.py --test -c '{cmd}' -d '{path}'\n"""
    
    l = len(args)
    if l > 1:
        if l == 3 and args[1] == "-b" and args[2] in bots:
            bot = bots[args[2]]
            cmd = bot['cmd']
            path = bot['dir']
        elif l == 3 and args[1] == "-c":
            cmd = args[2]
        elif l == 5 and args[1] == "-c" and args[3] == "-d":
            cmd = args[2]
            path = args[4]
        else:
            cmd = ''
    if cmd == '':
        path = helpMessage
    return cmd, path
    
def session():
    flag = True
    test = True
    args = sys.argv
    if "--once" in args:
        test = False
        args.remove("--once")
    if "--test" in args:
        flag = False
        args.remove("--test")
    
    cmd, path = arg(args)
    if cmd == '':
        print(path)
        test = False
        flag =False

    if test:
        info = bot_try(cmd, path)
        if info != '':
            print(info)
            flag = False

    if flag:
        proc = bot_run(cmd, path)
        greet, name = bot_ready(proc)  # sync when launch
        print(greet)
        while True:
            word = input()
            if word == "quit":
                print(bot_end(proc))
                break
            else:
                print(qr(proc, word, name))
            
if __name__ == '__main__':
    session()
