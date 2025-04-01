wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 {/home/LiauYiShang/Iccontest/2022_pre/build/JAM.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_JAM"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_JAM/sort"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_JAM"
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/u_JAM/CLK} \
{/testfixture/u_JAM/count\[3:0\]} \
{/testfixture/u_JAM/sort_done} \
{/testfixture/u_JAM/state\[2:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvGetSignalClose -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_JAM"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_JAM"
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/u_JAM/CLK} \
{/testfixture/u_JAM/count\[3:0\]} \
{/testfixture/u_JAM/sort_done} \
{/testfixture/u_JAM/state\[2:0\]} \
{/testfixture/u_JAM/next} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvGetSignalClose -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSelectGroup -win $_nWave1 {G2}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetCursor -win $_nWave1 4564.313595 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 5578.605505 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 6339.324438 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 5388.425772 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 6149.144705 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 5261.639283 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 6085.751460 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 5261.639283 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 6275.931193 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 6275.931193 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 5325.032528 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 4183.954129 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 5325.032528 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 6529.504171 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 5578.605505 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 4057.167640 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 5325.032528 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 6592.897415 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 5578.605505 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 4500.920351 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 5388.425772 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 6719.683904 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 4564.313595 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 5578.605505 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 6909.863637 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 5388.425772 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 5071.459550 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 6783.077148 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 5515.212261 -snap {("G1" 5)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 19525.119268 -snap {("G1" 2)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvResizeWindow -win $_nWave1 1920 23 1920 1137
wvSetCursor -win $_nWave1 17482.447037 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 16785.682844 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 15518.838856 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 16849.025043 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 17419.104838 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 18052.526832 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 27807.225541 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 18432.580029 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 19572.739618 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 20776.241407 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 20586.214809 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 21473.005600 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 22613.165190 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 23499.955981 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 24260.062374 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 25590.248562 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 26350.354955 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 27300.487946 -snap {("G1" 1)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_JAM"
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/u_JAM/CLK} \
{/testfixture/u_JAM/state\[2:0\]} \
{/testfixture/u_JAM/J\[2:0\]} \
{/testfixture/u_JAM/W\[2:0\]} \
{/testfixture/u_JAM/count\[3:0\]} \
{/testfixture/u_JAM/sort_done} \
{/testfixture/u_JAM/next} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 3 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/u_JAM/CLK} \
{/testfixture/u_JAM/state\[2:0\]} \
{/testfixture/u_JAM/J\[2:0\]} \
{/testfixture/u_JAM/W\[2:0\]} \
{/testfixture/u_JAM/Cost\[6:0\]} \
{/testfixture/u_JAM/count\[3:0\]} \
{/testfixture/u_JAM/sort_done} \
{/testfixture/u_JAM/next} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/u_JAM/CLK} \
{/testfixture/u_JAM/state\[2:0\]} \
{/testfixture/u_JAM/J\[2:0\]} \
{/testfixture/u_JAM/W\[2:0\]} \
{/testfixture/u_JAM/Cost\[6:0\]} \
{/testfixture/u_JAM/cur_cost\[9:0\]} \
{/testfixture/u_JAM/count\[3:0\]} \
{/testfixture/u_JAM/sort_done} \
{/testfixture/u_JAM/next} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSetPosition -win $_nWave1 {("G1" 6)}
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 19699.424017 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 20649.557008 -snap {("G1" 5)}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_JAM"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_JAM"
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/u_JAM/CLK} \
{/testfixture/u_JAM/state\[2:0\]} \
{/testfixture/u_JAM/J\[2:0\]} \
{/testfixture/u_JAM/W\[2:0\]} \
{/testfixture/u_JAM/Cost\[6:0\]} \
{/testfixture/u_JAM/cur_cost\[9:0\]} \
{/testfixture/u_JAM/line\[7:0\]} \
{/testfixture/u_JAM/count\[3:0\]} \
{/testfixture/u_JAM/sort_done} \
{/testfixture/u_JAM/next} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalClose -win $_nWave1
wvZoomIn -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetCursor -win $_nWave1 29564.971575 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 30768.473364 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 29596.642675 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 30546.775666 -snap {("G1" 5)}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetCursor -win $_nWave1 39604.710182 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 40618.185372 -snap {("G1" 2)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 14632.048064 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 15550.509955 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 15297.141158 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 16627.327345 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 20427.859310 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 17514.118137 -snap {("G1" 9)}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetCursor -win $_nWave1 18622.606627 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 20332.846011 -snap {("G1" 5)}
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSetSearchMode -win $_nWave1 -value "x" -case off -skipGlitch off -X2Y off
wvSelectSignal -win $_nWave1 {( "G1" 2 )} 
wvSearchNext -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 101424.915897 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 78463.368611 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 79540.186001 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 80521.990092 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 78368.355312 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 79540.186001 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 80458.647892 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 81567.136382 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 82580.611573 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 83499.073464 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 84607.561954 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 85526.023845 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 86412.814637 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 87616.316426 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 67600.181412 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 65636.573230 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 66808.403919 -snap {("G1" 1)}
wvSetCursor -win $_nWave1 66523.364022 -snap {("G1" 2)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 16532.314046 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 17165.736040 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 16373.958548 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 17482.447037 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 16373.958548 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 17735.815835 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 16468.971847 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 15550.509955 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 15423.825557 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 16215.603049 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 15297.141158 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 16215.603049 -snap {("G1" 10)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 17355.762639 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 18337.566729 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 17862.500234 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 18590.935527 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 18274.224530 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 17577.460337 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 18527.593328 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 17609.131436 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 18685.948826 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 17482.447037 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 17545.789237 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 18432.580029 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 19509.397419 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 18495.922228 -snap {("G1" 5)}
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSelectSignal -win $_nWave1 {( "G1" 8 )} 
wvSelectSignal -win $_nWave1 {( "G1" 7 )} 
wvSetCursor -win $_nWave1 18337.566729 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 27427.172345 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 27490.514544 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 28503.989735 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 5510.771349 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 6524.246539 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 5447.429149 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 6555.917639 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 5352.415850 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 6334.219941 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 129566400.181940 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 129565418.377849 -snap {("G2" 0)}
wvSetCursor -win $_nWave1 129565481.720048 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 129565291.693450 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 129566273.497541 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 129565513.391148 -snap {("G1" 8)}
wvSelectSignal -win $_nWave1 {( "G1" 10 )} 
wvSetCursor -win $_nWave1 129566305.168641 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 129565291.693450 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 129566336.839740 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 129567667.025928 -snap {("G1" 8)}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSelectSignal -win $_nWave1 {( "G1" 6 )} 
wvSetCursor -win $_nWave1 129555505.323641 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 129554523.519550 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 129555188.612644 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 129554333.492952 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 129555283.625943 -snap {("G1" 10)}
wvSetCursor -win $_nWave1 129567635.354828 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 129568522.145620 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 129569408.936412 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 129570422.411602 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 129571625.913391 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 129572132.650986 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 129573557.850473 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 129574476.312365 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 129575268.089857 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 129574539.654564 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 129576661.618244 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 129575553.129755 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 129576598.276045 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 129575933.182951 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 129569598.963010 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 129567540.341529 -snap {("G1" 3)}
wvSetCursor -win $_nWave1 129567825.381426 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 129568553.816720 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 129568363.790121 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 129568458.803421 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 129568490.474520 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 129569503.949711 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 129568743.843318 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 129568553.816720 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 129568363.790121 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 129569313.923113 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 129568680.501119 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 129568332.119022 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 129568585.487819 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 129568585.487819 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 129568585.487819 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 129568617.158919 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 129569662.305209 -snap {("G1" 5)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 8741.223519 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 9437.987712 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 10166.423005 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 11274.911495 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 12446.742184 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 13080.164178 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 12351.728885 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 6365.891041 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 4972.362654 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 5320.744751 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 6080.851143 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 5289.073651 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 4117.242962 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 4307.269560 -snap {("G1" 8)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 39557.203532 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 38543.728341 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 17514.118137 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 28503.989735 -snap {("G1" 8)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 17450.775938 -snap {("G1" 8)}
wvGetSignalOpen -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/u_JAM/CLK} \
{/testfixture/u_JAM/state\[2:0\]} \
{/testfixture/u_JAM/J\[2:0\]} \
{/testfixture/u_JAM/sort/count\[1:0\]} \
{/testfixture/u_JAM/W\[2:0\]} \
{/testfixture/u_JAM/Cost\[6:0\]} \
{/testfixture/u_JAM/cur_cost\[9:0\]} \
{/testfixture/u_JAM/sort_done} \
{/testfixture/u_JAM/next} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_JAM"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_JAM/sort"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_JAM"
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/u_JAM/CLK} \
{/testfixture/u_JAM/state\[2:0\]} \
{/testfixture/u_JAM/J\[2:0\]} \
{/testfixture/u_JAM/sort/count\[1:0\]} \
{/testfixture/u_JAM/count\[3:0\]} \
{/testfixture/u_JAM/W\[2:0\]} \
{/testfixture/u_JAM/Cost\[6:0\]} \
{/testfixture/u_JAM/cur_cost\[9:0\]} \
{/testfixture/u_JAM/sort_done} \
{/testfixture/u_JAM/next} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 4 )} 
wvCut -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 39367.176934 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 37498.582051 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 38417.043943 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 37245.213254 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 38258.688444 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 37466.910952 -snap {("G1" 8)}
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSetPosition -win $_nWave1 {("G1" 3)}
wvExpandBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSetPosition -win $_nWave1 {("G1" 3)}
wvCollapseBus -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 3)}
wvSetPosition -win $_nWave1 {("G1" 5)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetCursor -win $_nWave1 36580.120160 -snap {("G1" 5)}
wvSelectSignal -win $_nWave1 {( "G1" 3 )} 
wvSetCursor -win $_nWave1 37466.910952 -snap {("G1" 3)}
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetCursor -win $_nWave1 38543.728341 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 37530.253151 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 36516.777960 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 37593.595350 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 36611.791259 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 37371.897652 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 36548.449060 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 37276.884353 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 36801.817858 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 37498.582051 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 36548.449060 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 37403.568752 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 38132.004045 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 39398.848034 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 38702.083840 -snap {("G1" 5)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 5510.771349 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 6302.548841 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 5795.811246 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 4592.309457 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 5764.140146 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 6555.917639 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 5574.113548 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 6017.508944 -snap {("G1" 9)}
wvSetCursor -win $_nWave1 6397.562140 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 5542.442448 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 6334.219941 -snap {("G1" 8)}
wvSetCursor -win $_nWave1 19414.384119 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 17514.118137 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 17735.815835 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 17640.802536 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 17609.131436 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 17609.131436 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 17735.815835 -snap {("G1" 6)}
wvSetCursor -win $_nWave1 17640.802536 -snap {("G1" 7)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_JAM/r399"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_JAM/sort"
wvGetSignalSetScope -win $_nWave1 "/testfixture/u_JAM"
wvGetSignalClose -win $_nWave1
wvExit
