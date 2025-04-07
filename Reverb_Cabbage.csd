<Cabbage>
form caption("Reverb") size(300, 200), guiMode("queue"), pluginId("rvbs")

rslider bounds(20, 20, 80, 80), channel("level"), range(0, 1, 0.5), text("Dry/Wet"), colour("lightblue")
rslider bounds(110, 20, 80, 80), channel("fblvl"), range(0.5, 0.99, 0.85), text("Level"), colour("lightblue")
rslider bounds(200, 20, 80, 80), channel("fco"), range(500, 10000, 3000), text("Cut Off Freq"), colour("lightblue")
</Cabbage>

<CsoundSynthesizer>
<CsOptions>
-n -d 
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

instr 1
    ; Input (mono, duplicated for stereo)
    a2 inch 2
    aL = a2
    aR = a2

    
    kLevel chnget "level"
    kFblvl chnget "fblvl"
    kFco chnget "fco"
    
    ; Apply reverb 
    aRevL, aRevR reverbsc aL, aR, kFblvl, kFco, sr, 0.1

    ; Mix dry/wet
    aOutL = (aL * (1 - kLevel)) + (aRevL * kLevel)
    aOutR = (aR * (1 - kLevel)) + (aRevR * kLevel)

    ; Output
    outs aOutL, aOutR
endin
</CsInstruments>
<CsScore>
f0 z
i1 0 z
</CsScore>
</CsoundSynthesizer>
