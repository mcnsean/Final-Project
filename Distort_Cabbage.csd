<Cabbage>
form caption("Untitled") size(400, 300), guiMode("queue") pluginId("def1")
rslider bounds(296, 162, 100, 100), channel("gain"), range(0, 15, 0, 1, .01), text("Gain"), trackerColour("lime"), outlineColour(0, 0, 0, 50), textColour("black")
rslider bounds(32, 40, 68, 70), channel("size"), range(0, 1, .2, 1, 0.001), text("Size"), colour(2, 132, 0, 255), 

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 32
nchnls = 2
0dbfs = 1


instr 1
kGain cabbageGetValue "gain"
kFdBack chnget "size"

a1 inch 1
a2 inch 2 


;ares clip a2,1,10 ;attempt at clipping not effecting tone, probable syntax error or incorrect positioning

outs a1*kGain, a2* tanh(kGain *kFdBack)
endin

</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
;starts instrument 1 and runs it for a week
i1 0 [60*60*24*7] 
</CsScore>
</CsoundSynthesizer>
