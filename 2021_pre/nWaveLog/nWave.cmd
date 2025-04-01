wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/LiauYiShang/Iccontest/2021_pre/build/geofence.fsdb}
wvRestoreSignal -win $_nWave1 \
           "/home/LiauYiShang/Iccontest/2021_pre/build/signal.rc" \
           -overWriteAutoAlias on -appendSignals on
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 252705.124289 -snap {("G1" 5)}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetCursor -win $_nWave1 102302.500600 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 108045.798879 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 111635.360304 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 116660.746298 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 121327.176150 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 127070.474429 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 129942.123569 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 132095.860424 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 127788.386714 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 498231.125729 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 253064.080432 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 130301.079712 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 127788.386714 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 132813.772709 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 102661.456742 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 107327.886594 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 111994.316446 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 102661.456742 -snap {("G1" 5)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 13 )} 
wvSetCursor -win $_nWave1 133890.641136 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 136403.334133 -snap {("G1" 4)}
wvSelectSignal -win $_nWave1 {( "G1" 9 )} 
wvSetPosition -win $_nWave1 {("G1" 9)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 9)}
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSetPosition -win $_nWave1 {("G1" 10)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/u_geofence/clk} \
{/testfixture/u_geofence/state\[2:0\]} \
{/testfixture/u_geofence/i\[2:0\]} \
{/testfixture/u_geofence/j\[2:0\]} \
{/testfixture/u_geofence/hexagon_area\[24:0\]} \
{/testfixture/u_geofence/tri_area\[24:0\]} \
{/testfixture/u_geofence/tri_area_temp\[19:0\]} \
{/testfixture/u_geofence/mul0\[19:0\]} \
{/testfixture/u_geofence/mul1\[19:0\]} \
{/testfixture/u_geofence/a\[21:0\]} \
{/testfixture/u_geofence/num\[4:0\]} \
{/testfixture/u_geofence/cur_x\[10:0\]} \
{/testfixture/u_geofence/cur_y\[10:0\]} \
{/testfixture/u_geofence/temp_x\[10:0\]} \
{/testfixture/u_geofence/temp_y\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/u_geofence/x_array\[5:0\]} \
{/testfixture/u_geofence/x_array\[5\]\[9:0\]} \
{/testfixture/u_geofence/x_array\[4\]\[9:0\]} \
{/testfixture/u_geofence/x_array\[3\]\[9:0\]} \
{/testfixture/u_geofence/x_array\[2\]\[9:0\]} \
{/testfixture/u_geofence/x_array\[1\]\[9:0\]} \
{/testfixture/u_geofence/x_array\[0\]\[9:0\]} \
{/testfixture/u_geofence/y_array\[5:0\]} \
{/testfixture/u_geofence/y_array\[5\]\[9:0\]} \
{/testfixture/u_geofence/y_array\[4\]\[9:0\]} \
{/testfixture/u_geofence/y_array\[3\]\[9:0\]} \
{/testfixture/u_geofence/y_array\[2\]\[9:0\]} \
{/testfixture/u_geofence/y_array\[1\]\[9:0\]} \
{/testfixture/u_geofence/y_array\[0\]\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/root\[9:0\]} \
{/testfixture/u_geofence/a\[19:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/is_inside} \
{/testfixture/u_geofence/valid} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/X\[9:0\]} \
{/testfixture/u_geofence/Y\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSetPosition -win $_nWave1 {("G1" 10)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 134967.509564 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 136762.290276 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 132454.816566 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 152915.316686 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 132454.816566 -snap {("G1" 3)}
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSetRadix -win $_nWave1 -2Com
wvSelectSignal -win $_nWave1 {( "G4" 7 )} 
wvSelectSignal -win $_nWave1 {( "G4" 5 )} 
wvSelectSignal -win $_nWave1 {( "G4" 6 )} 
wvSelectSignal -win $_nWave1 {( "G4" 7 )} 
wvSelectSignal -win $_nWave1 {( "G4" 6 )} 
wvSetCursor -win $_nWave1 137480.202561 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 174452.685234 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 174093.729091 -snap {("G1" 3)}
wvSelectSignal -win $_nWave1 {( "G3" 2 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 10)}
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSetPosition -win $_nWave1 {("G1" 12)}
wvSetPosition -win $_nWave1 {("G1" 14)}
wvSetPosition -win $_nWave1 {("G1" 15)}
wvSetPosition -win $_nWave1 {("G4" 0)}
wvSetPosition -win $_nWave1 {("G4" 2)}
wvSetPosition -win $_nWave1 {("G4" 4)}
wvSetPosition -win $_nWave1 {("G4" 6)}
wvSetPosition -win $_nWave1 {("G4" 8)}
wvSetPosition -win $_nWave1 {("G4" 10)}
wvSetPosition -win $_nWave1 {("G4" 12)}
wvSetPosition -win $_nWave1 {("G4" 13)}
wvSetPosition -win $_nWave1 {("G4" 14)}
wvSetPosition -win $_nWave1 {("G3" 0)}
wvSetPosition -win $_nWave1 {("G3" 1)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G3" 2)}
wvSetCursor -win $_nWave1 137480.202561 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 132454.816566 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 138198.114846 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 156145.921968 -snap {("G1" 13)}
wvSetCursor -win $_nWave1 135326.465706 -snap {("G1" 13)}
wvSetCursor -win $_nWave1 134249.597279 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 138916.027131 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 133531.684994 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 138557.070988 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 143582.456982 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 138198.114846 -snap {("G3" 2)}
wvSetCursor -win $_nWave1 141787.676270 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 137480.202561 -snap {("G1" 8)}
wvSelectGroup -win $_nWave1 {G4}
wvSelectGroup -win $_nWave1 {G4}
wvSetPosition -win $_nWave1 {("G4" 0)}
wvMoveSelected -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_geofence"
wvSetPosition -win $_nWave1 {("G4" 1)}
wvSetPosition -win $_nWave1 {("G4" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/u_geofence/clk} \
{/testfixture/u_geofence/state\[2:0\]} \
{/testfixture/u_geofence/i\[2:0\]} \
{/testfixture/u_geofence/j\[2:0\]} \
{/testfixture/u_geofence/hexagon_area\[24:0\]} \
{/testfixture/u_geofence/tri_area\[24:0\]} \
{/testfixture/u_geofence/tri_area_temp\[19:0\]} \
{/testfixture/u_geofence/mul0\[19:0\]} \
{/testfixture/u_geofence/mul1\[19:0\]} \
{/testfixture/u_geofence/num\[4:0\]} \
{/testfixture/u_geofence/cur_x\[10:0\]} \
{/testfixture/u_geofence/cur_y\[10:0\]} \
{/testfixture/u_geofence/temp_x\[10:0\]} \
{/testfixture/u_geofence/temp_y\[10:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G4" \
{/testfixture/u_geofence/r_array\[5:0\]} \
{/testfixture/u_geofence/x_array\[5:0\]} \
{/testfixture/u_geofence/x_array\[5\]\[9:0\]} \
{/testfixture/u_geofence/x_array\[4\]\[9:0\]} \
{/testfixture/u_geofence/x_array\[3\]\[9:0\]} \
{/testfixture/u_geofence/x_array\[2\]\[9:0\]} \
{/testfixture/u_geofence/x_array\[1\]\[9:0\]} \
{/testfixture/u_geofence/x_array\[0\]\[9:0\]} \
{/testfixture/u_geofence/y_array\[5:0\]} \
{/testfixture/u_geofence/y_array\[5\]\[9:0\]} \
{/testfixture/u_geofence/y_array\[4\]\[9:0\]} \
{/testfixture/u_geofence/y_array\[3\]\[9:0\]} \
{/testfixture/u_geofence/y_array\[2\]\[9:0\]} \
{/testfixture/u_geofence/y_array\[1\]\[9:0\]} \
{/testfixture/u_geofence/y_array\[0\]\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
{/testfixture/u_geofence/root\[9:0\]} \
{/testfixture/u_geofence/a\[21:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/testfixture/u_geofence/is_inside} \
{/testfixture/u_geofence/valid} \
}
wvAddSignal -win $_nWave1 -group {"G5" \
{/testfixture/u_geofence/X\[9:0\]} \
{/testfixture/u_geofence/Y\[9:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G6" \
}
wvSelectSignal -win $_nWave1 {( "G4" 1 )} 
wvSetPosition -win $_nWave1 {("G4" 1)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G4" 1 )} 
wvExpandBus -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G4" 2 3 4 5 6 7 )} 
wvSetRadix -win $_nWave1 -format UDec
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetCursor -win $_nWave1 142864.544698 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 147172.018407 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 140710.807843 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 145736.193837 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 140710.807843 -snap {("G3" 1)}
wvSetCursor -win $_nWave1 145377.237695 -snap {("G3" 1)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSaveSignal -win $_nWave1 "/home/LiauYiShang/Iccontest/2021_pre/build/signal.rc"
wvExit
