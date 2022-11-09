DECLARE SUB playjingle ()
'$FORM Form1
DECLARE SUB SplashScreen ()
DECLARE SUB setcolorline (start, linee, offset, colorr%)
DECLARE SUB PrintDolphin ()
DECLARE SUB PrintLogo ()

DIM SHARED playarr$(8)
CONST playarrlen = 8
playarr$(1) = "t120o0l8g#16g#.g#.g#p4"
playarr$(2) = "f16f#16gg.g.o1ff#g."
playarr$(3) = "o0g-48g48o1cc.co0b-16o1c.p4p16"
playarr$(4) = "o1cc.co0b-16o1cp8c."
playarr$(5) = "o0g16g#g#.g#.g#p4"
playarr$(6) = "f16f#16gg.g.o1ff#g.p16"
playarr$(7) = "cc.co0b-16o1cp4p8"
playarr$(8) = "cc4cc#4c#4"

SplashScreen
playjingle

PRINT "Press ENTER to find your dolphin..."
SLEEP ' wait for key press

LOAD Form1
Form1.SHOW

SUB playjingle ()
    FOR x = 1 TO playarrlen
        IF INKEY$ <> "" THEN EXIT SUB
        PLAY "X" + VARPTR$(playarr$(x))
    NEXT
END SUB

SUB PrintDolphin ()
PRINT "                                                                  __"
PRINT "                                     .__                         / |"
PRINT "                                    /  /                         |  \"
PRINT "                                   /   |                     ,-------'_"
PRINT "                              ____/     \_________,     ,_--""      _/  \_"
PRINT "                _______------'                     `---""          ,-\___/"
PRINT "            _--""                                               ,-"""
PRINT "        ___(___                                          ,__--"""
PRINT "       (-------0                                   __---"""
PRINT "        `--___                                    /"
PRINT "              `--___\                _______-----'"
PRINT "                    \\    (____-----'"
PRINT "                     \\    \_"
PRINT "                      `""`..__\"


END SUB

SUB PrintLogo ()
    COLOR 12
    PRINT "   _____         ____  ___     ___       __     __   _       ___   ___   ___ "
    PRINT "  / __(_)__  ___/ /  |/  /_ __/ _ \___  / /__  / /  (_)__     | | |   | |    "
    PRINT " / _// / _ \/ _  / /|_/ / // / // / _ \/ / _ \/ _ \/ / _ \    + | |   |  -+- "
    PRINT "/_/ /_/_//_/\_,_/_/  /_/\_, /____/\___/_/ .__/_//_/_/_//_/    | | |   |     |"
    PRINT "                       /___/           /_/                   ---   ---   --- "
    COLOR 7

    ' set D, O, S to their colors in MS-DOS logo
    FOR x = 0 TO 5
        setcolorline 59, x, 5, 4        ' D
        setcolorline (59 + 7), x, 5, 5  ' O
        setcolorline (59 + 13), x, 5, 14' S
    NEXT
END SUB

SUB setcolorline (start, linee, offset, colorr%)
    DEF SEG = &HB800
    FOR i = ((start + (80 * linee)) * 2) + 1 TO ((start + offset + (80 * linee)) * 2) + 1 STEP 2
        POKE i, colorr%
    NEXT
END SUB

SUB SplashScreen ()
    CLS
    PrintLogo
    PrintDolphin
    PRINT SPACE$(40); "(C) Workplace2Software 2022."
    PRINT SPACE$(44); "All Rights Reserved."

    ' color W2S text
    setcolorline 43, 19, 9, 15
    setcolorline 53, 19, 1, 11
    setcolorline 54, 19, 8, 15

END SUB

