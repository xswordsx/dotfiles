-- xmobar config used by Vic Fryzel
-- Author: Vic Fryzel
-- http://github.com/vicfryzel/xmonad-config

--Monokai Colorscheme
--
    --green       = "#A6E22E"
    --orange      = "#FD971F"
    --blue        = "#66D9EF"
    --purple      = "#F92672"
    --darkgray    = "#272822"
    --lightgray   = "#524F52"
    --yellow      = "#FDF5A9"
    --vividOrange = "#F37259"
--

-- This is setup for a single 1920x1080 monitor 
Config {
    font = "-*-terminus-medium-*-*-*-12-*-*-*-*-*-*-*",
    fgColor = "#F8F8F2", --"#3f3f3f",
    bgColor = "#272822", --"#dcdccc",
    -- position = Static { xpos = 0, ypos = 0, width = 1800, height = 16 },
    position = Top W 100,    
    lowerOnStart = True,
    commands = [
        Run Weather "LBSF" ["-t","<station>: <tempC>°C ",
            "--low",    "#66D9EF",
            "--normal", "#A6E22E",
            "--high",   "#F37259",
            "-L",       "12",
            "-H",       "30"] 36000,
        Run MultiCpu ["-t","Cpu: <total0>% <total1>% <total2>% <total3>%",
            "-L","30","-H","60",
            "-l","#A6E22E",
            "-n","#FD971F",
            "-h","#F37259",
            "-w","3"] 10,
        Run Memory ["-t","Mem: <usedratio>%",
            "-H","8192",
            "-L","4096",
            "-l","#A6E22E",
            "-n","#FD971F",
            "-h","#F37259"] 10,
        Run Swap ["-t","Swap: <usedratio>%",
            "-H","1024",
            "-L","512",
            "-l","#66D9EF",
            "-n","#A6E22E",
            "-h","#F37259"] 10,
        Run Network "eth0" ["-t","Down: <rx> Kb/s Up :<tx> Kb/s",
            "-H","1000",
            "-L","100",
            "-l","#A6E22E",
            "-n","#FD971F",
            "-h","#F37259"] 10,
        Run Date "<fc=#F92672>%a %b %_d</fc>  <fc=#FD971F>%H:%M</fc>" "date" 10,
        Run Com "~/.xmonad/get-volume.sh 30 60 F92672 FDF5A9 A6E22E" [] "vol" 10,
        Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    template = "%StdinReader% }{ Volume: %vol% | %multicpu% | %memory% | %swap% | %eth0% | <fc=#FFFFCC>%date%</fc> | %LBSF%"
}
