wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 {/home/LiauYiShang/2016_grad_cell/LBP.fsdb}
wvAddAllSignals -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 \
           40 41 42 43 44 45 46 47 48 49 )} 
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 \
           40 41 42 43 44 45 46 47 48 49 )} 
wvSetRadix -win $_nWave1 -format UDec
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSetCursor -win $_nWave1 45153.396472 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 40245.418595 -snap {("G1" 7)}
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSetCursor -win $_nWave1 47443.786148 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 39918.220069 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 45480.594997 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 54969.352227 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 64458.109456 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 74274.065211 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 85398.815067 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 95214.770821 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 104376.329526 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 115501.079381 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 124008.241035 -snap {("G1" 7)}
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSelectSignal -win $_nWave1 {( "G1" 12 )} 
