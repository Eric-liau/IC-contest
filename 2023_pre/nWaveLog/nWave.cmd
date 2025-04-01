wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 {/home/LiauYiShang/Iccontest/2023_pre/build/LASER.fsdb}
wvRestoreSignal -win $_nWave1 \
           "/home/LiauYiShang/Iccontest/2023_pre/build/signal.rc" \
           -overWriteAutoAlias on -appendSignals on
wvSetCursor -win $_nWave1 56775393.384133 -snap {("G5" 0)}
wvSetCursor -win $_nWave1 56764531.915337 -snap {("G5" 0)}
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 231614.033665 -snap {("G1" 9)}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSetSearchMode -win $_nWave1 -value 4
wvSearchNext -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSearchNext -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSetSearchMode -win $_nWave1 -value 1
wvSearchNext -win $_nWave1
wvSetCursor -win $_nWave1 23662916.436421 -snap {("G1" 2)}
wvExit
