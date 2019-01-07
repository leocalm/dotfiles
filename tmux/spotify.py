import subprocess

try:
    p = subprocess.Popen(['/usr/bin/playerctl', 'status'],
                         stdout=subprocess.PIPE,
                         stderr=subprocess.PIPE)
    status = p.communicate()[0].decode('UTF-8').strip()
    if status == 'Playing':
        a = subprocess.Popen(['playerctl', 'metadata', 'xesam:albumArtist'],
                             stdout=subprocess.PIPE)
        artist = a.communicate()[0].decode('UTF-8').strip()
        t = subprocess.Popen(['playerctl', 'metadata', 'xesam:title'],
                             stdout=subprocess.PIPE)
        title = t.communicate()[0].decode('UTF-8').strip()
        print(' {} | {}'.format(artist, title))
    elif status == 'Paused':
        print('')
    else:
        print('■')
except:
    print('■')
