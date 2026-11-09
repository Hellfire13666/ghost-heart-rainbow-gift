python3 -c "$(cat <<'PY'
import colorsys
import random
import shutil
import textwrap
import time

RESET = '\033[0m'
WIDTH = min(80, max(48, shutil.get_terminal_size((78, 24)).columns))
COLORS = ['95', '96', '92', '93', '94', '95']


def rainbow(s, shift=0.0):
    chunks = []
    for i, char in enumerate(s):
        r, g, b = colorsys.hsv_to_rgb((shift + i / 38) % 1, .76, 1)
        chunks.append(f'\033[38;2;{round(r*255)};{round(g*255)};{round(b*255)}m{char}')
    return ''.join(chunks) + RESET


def glow(s, color='95'):
    print(f'\033[{color}m{s}{RESET}')


def heading(s, shift=.6):
    print('\n' + rainbow('═' * WIDTH, shift))
    print(rainbow(s.center(WIDTH), shift + .08))
    print(rainbow('═' * WIDTH, shift + .2))


def paragraph(s, color=None):
    if not s:
        print()
        return
    for row in textwrap.wrap(s, width=WIDTH - 5, break_long_words=False, break_on_hyphens=False):
        if color:
            glow('  ' + row, color)
        else:
            print('  ' + row)
    print()


def ask(msg):
    try:
        return input(msg).strip().lower()
    except (EOFError, KeyboardInterrupt):
        print()
        return '0'


def pause():
    ask('\n  💜 Press ENTER to return to the kingdom... ')


def links(title, items):
    heading(title, .47)
    for i, (name, url) in enumerate(items):
        glow('  ' + name, COLORS[i % len(COLORS)])
        print('    ' + url)
        print()


KINGDOM = [
    ('GlitchByte Hangout', 'https://glitchbyte.alwaysdata.net/hangout'),
    ('EXPOSED HQ', 'https://rosieglitchbyte13666.alwaysdata.net/exposed'),
    ('Poison Orchid Shadow Terminal', 'https://rosieglitchbyte13666.alwaysdata.net/poison-orchid/terminal'),
]
EXPLORE = [
    ('Hangout Welcome', 'https://glitchbyte.alwaysdata.net/welcome'),
    ('Hangout Showcase', 'https://glitchbyte.alwaysdata.net/hangout/showcase'),
    ('Evidence Wall', 'https://rosieglitchbyte13666.alwaysdata.net/poison-orchid/evidence'),
    ('Receipt Vault', 'https://rosieglitchbyte13666.alwaysdata.net/poison-orchid/receipts'),
    ('Operations Menu', 'https://rosieglitchbyte13666.alwaysdata.net/poison-orchid/menu'),
]
REPOS = [
    ('GitHub', 'https://github.com/Hellfire13666'),
    ('GlitchByte Phantom Labs', 'https://github.com/Hellfire13666/glitchbyte-phantom-labs'),
    ('Wolf Fang', 'https://github.com/Hellfire13666/wolf-fang-glitchbyte-2026'),
    ('Phantom Spine', 'https://github.com/Hellfire13666/phantom-spine-live-signal-2026'),
]
SOCIALS = [
    ('Wildrose / X', 'https://x.com/tewildrose'),
    ('EXPOSED HQ / X', 'https://x.com/AnoExpose666'),
    ('Divinity Anne / Facebook', 'https://www.facebook.com/Gitchbyte'),
    ('Instagram / Louisville Slugger', 'https://www.instagram.com/louievilleslugger69/'),
    ('Instagram / GlitchByte Rosie', 'https://www.instagram.com/glitchbyterosie/'),
    ('Instagram / Rosie GlitchByte', 'https://www.instagram.com/rosieglitchbyte/'),
    ('Discord', 'https://discord.com/users/1185539122153140335'),
    ('Twitch', 'https://www.twitch.tv/rosieglitchbyteyte/'),
    ('Pastebin', 'https://pastebin.com/u/Slugger67922'),
]
LABS = [
    'NIGHTGLASS', 'NECTARJAR QUEEN BEE', 'BLACKTHORN INTEL', 'HEXVULTURE',
    'PHONETHORN', 'WOLF FANG', 'VENOMROSE', 'PHANTOM SPINE',
    'ROOTSIGNAL', 'RIFTSEAL', 'HEXBAZAAR', 'ROSE CRAWLER',
    'MASTER HUB', 'GHOSTMARK', 'HEXWAKE', 'VOIDLANTERN',
]


def welcome():
    heading('👑 WELCOME TO MY LITTLE GLITCHBYTE KINGDOM 🌹')
    glow('  ✦ ROSIE GLITCHBYTE // PHANTOM LABS ✦', '96')
    glow('  THE KINGDOM OF LOVE, GLITCHES & HACKS', '95')
    paragraph('Hey, beautiful souls & beautiful weirdos! 💗👻💜', '92')
    paragraph("Welcome to my little corner of the digital universe, where the inspired designs of GlitchByte's heart, friendship, technology, creativity, and a little beautiful chaos all come together.")


def heart_hax():
    heading('📱 FROM TERMUX GIRL TO HEART HAX 💜')
    glow('  Five years in the making · Heart Hax in bloom', '96')
    paragraph('For five years, I was a Termux girl, building custom terminals on my phone and dreaming of Linux.')
    paragraph('Then one day, that dream was placed in my hands in computer form.')
    paragraph('What looked like a little machine to the world felt like a doorway to me, a chance, a future, and a dream finally becoming real.')
    paragraph('With a brother beside me, Heart Hax began to bloom. 👻💚', '92')
    paragraph('And from those little beginnings came learning Linux, dual boot, creating tools, building terminals, designing websites, and discovering things I never imagined I could do.')
    paragraph("I look at our creations today and still can't believe how far this little dream has come. And the most beautiful part? I didn't have to walk that journey alone. 💗", '95')


def tribute():
    heading('🐺 TO MY BROTHERS I HOLD DEAR TO MY HEART 💗')
    glow('  🐺 💗 💜 Forever in my heart', '95')
    paragraph('To the brothers who have sat beside me, shared their knowledge, helped me learn, encouraged my dreams, and kept me afloat when others tried to hold a girl down...')
    paragraph('Thank you from the bottom of my heart.', '96')
    paragraph("You weren't just watching me build something. You were right there with me through the little mistakes, the long hours, the frustration, the laughter, and those unforgettable BAAAAAAM moments when something finally came together.")
    paragraph('You gave me your time, patience, knowledge, and encouragement. When I look at everything we\'ve created, I see more than tools, websites, and terminals. I see the memories, the friendship, the love, and the respect.')
    paragraph("No matter where life takes us, I'll never forget what you've done for me or what these years have meant.")
    paragraph("Till I'm dead and a true ghost. 👻💗💜", '95')
    paragraph('MADD LOVE & RESPECT TILL THE END. ALWAYS.', '92')


def doorstep():
    heading('🌹 FIND OUR LITTLE KINGDOM AROUND THE WEB')
    paragraph('Our worlds · Our people · Our creations', '95')
    paragraph('These are simply our public addresses gathered in one place, like names on a welcome wall. No new hub, switches, or duplicate doorway system.')
    links('OUR KINGDOM', KINGDOM)


def exploring():
    links('✨ MORE PLACES TO EXPLORE', EXPLORE)


def labs():
    heading('🧪 A FEW CREATIONS THAT GREW ALONG THE WAY')
    glow('  GLITCHBYTE PHANTOM LABS', '96')
    for i, name in enumerate(LABS, 1):
        glow(f'   {i:02d}  ✦ {name}', COLORS[i % len(COLORS)])
    print()
    paragraph('Every little creation is a leaf in our strange, beautiful digital garden. 👻🌹', '92')


def repos():
    links('💻 PHANTOM LABS', REPOS)


def socials():
    links('💗 FOLLOW & CONNECT', SOCIALS)


def closing():
    heading('🌹 💜 👻 💚  FROM THE HEART')
    paragraph('This little Kingdom was built with love, curiosity, patience, and a whole lot of heart.')
    paragraph('Every page, every design, every tool, every terminal, and every little piece of this world carries part of my journey, my dreams, and the people who helped me believe I could create something beautiful.')
    paragraph('To the brothers I hold dear to my heart, thank you for the love, the guidance, the inspiration, and the memories woven into every step of this story.')
    paragraph('And to every beautiful soul who stops here, thank you for being part of this little corner of the universe.')
    paragraph('This is not just a collection of links or creations. It’s a living piece of my heart.', '95')
    paragraph('A place built from glitch love, inspiration, imagination, and the belief that even the smallest dream can bloom into something beautiful.')
    paragraph('💜 More designs coming soon.', '95')
    paragraph('👻 More glitch love to share.', '96')
    paragraph('💚 More inspiration still growing.', '92')
    paragraph('And as this Kingdom continues to bloom, I hope it always carries the same sweetness, respect, love, and light that helped bring it to life.')
    paragraph('With love, remembrance, and inspiration always,', '95')
    paragraph('Rosie GlitchByte 🌹💚👻', '92')
    paragraph('Forever growing. Forever glowing. Forever GlitchByte.', '96')
    glow('  Much love, Rosie GlitchByte 🌹💚👻', '95')
    paragraph('Stay weird. Stay curious. Keep learning. Keep creating. Always lead with love and respect.')
    glow('  FROM A LITTLE TERMUX DREAM TO HEART HAX IN BLOOM', '96')
    glow('  BUILT WITH LOVE // GROWN WITH INSPIRATION // FOREVER GLITCHBYTE', '92')


GHOST_MESSAGES = [
    ('Not every kingdom is made of castles.', 'Some are made of friendship, code,', 'and stubborn, beautiful dreams.'),
    ('A tiny terminal on a phone.', 'A giant world inside a hopeful heart.', 'Look at the universe you grew.'),
    ('A neon rose glows in the dark.', 'One little ghost guards every memory.', 'Madd love to the brothers, always.'),
    ('The best hackers collect more than code.', 'They collect stories, laughter, and love.', 'Those are the treasures worth keeping.'),
]


def ghost():
    heading('👻 SECRET GHOST SIGNAL UNLOCKED')
    for line in random.choice(GHOST_MESSAGES):
        print(rainbow('   ' + line, .2))
    print()
    glow('  KEEP GLITCHING. KEEP BLOOMING.', '92')
    glow('  BAAAAAAAAAAM! 👻🌹', '95')


def heartbeat():
    heading('🌈 RAINBOW HEARTBEAT')
    for i in range(9):
        print('\r' + rainbow('  💗 ' + '✦ ' * (i + 1), i / 9), end='', flush=True)
        time.sleep(.09)
    print('\n')
    glow('  HEART HAX ONLINE 💜', '95')
    glow('  BROTHERHOOD FOREVER 🐺', '96')
    glow('  MADD LOVE ALWAYS 🌹', '92')


def heartjar():
    heading('💌 LITTLE JAR OF HEART HAX')
    quotes = [
        'You can start with one tiny idea and grow a whole universe.',
        'Every glorious BAAAAAAM began with someone trying again.',
        'May your little ghost always find a friendly light.',
        'Code is cool. Kindness is legendary.',
        'Take the memories with you. Let the next dream bloom.',
    ]
    paragraph(random.choice(quotes), '95')
    glow('  Signed: your tiny rainbow ghost 👻💜', '96')


CHAPTERS = [welcome, heart_hax, tribute, doorstep, exploring, labs, repos, socials, closing]


def complete_page():
    heading('📖 THE COMPLETE WELCOME WALL')
    for fn in CHAPTERS:
        fn()
        if ask('  ✦ ENTER for the next chapter (0 to stop): ') == '0':
            break


MENU = [
    ('1', '👑 WELCOME TO MY LITTLE KINGDOM'),
    ('2', '📱 TERMUX GIRL TO HEART HAX'),
    ('3', '🐺 TRIBUTE TO MY BROTHERS'),
    ('4', '🌹 OUR KINGDOM DOORWAYS'),
    ('5', '🔮 MORE PLACES TO EXPLORE'),
    ('6', '🧪 PHANTOM LABS GARDEN'),
    ('7', '💻 OUR GITHUB CREATIONS'),
    ('8', '💗 FOLLOW & CONNECT'),
    ('9', '💌 THE SWEET CLOSING NOTE'),
    ('10', '👻 SECRET GHOST MESSAGE'),
    ('11', '🌈 RAINBOW HEARTBEAT'),
    ('12', '💜 LITTLE JAR OF HEART HAX'),
    ('A', '📖 READ THE ENTIRE WELCOME WALL'),
    ('0', '✨ LEAVE WITH MADD LOVE'),
]
ACTIONS = {str(i): f for i, f in enumerate(CHAPTERS, 1)}
ACTIONS.update({'10': ghost, '11': heartbeat, '12': heartjar, 'a': complete_page, 'bam': ghost})

heading('🌈 GHOST HEART // GLITCHBYTE KINGDOM 🌹')
glow('  WELCOME TO MY LITTLE GLITCHBYTE KINGDOM!', '95')
glow('  Where Termux dreams became a kingdom of love.', '96')

while True:
    print('\n' + rainbow('✦' * min(WIDTH, 60), .2))
    for idx, title in MENU:
        glow(f'  [{idx:>2}] {title}', COLORS[(len(idx) + ord(idx[0])) % len(COLORS)])
    choice = ask('\n  🌈 Choose your doorway: ')
    if choice in ('0', 'q', 'quit', 'exit'):
        print('\n' + rainbow('  GHOST SIGNAL COMPLETE // MADD LOVE ALWAYS 👻💗💜', .6))
        break
    fn = ACTIONS.get(choice)
    if not fn:
        glow('  👻 That doorway is still hiding in the mist. Try again!', '93')
        continue
    fn()
    if fn != complete_page:
        pause()
PY
)"
