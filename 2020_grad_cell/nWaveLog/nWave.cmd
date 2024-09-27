wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 {/home/LiauYiShang/2020_grad_cell/SME.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x29ffa1f6"
wvGetSignalSetScope -win $_nWave1 "/testfixture"
wvGetSignalClose -win $_nWave1
wvSetCursor -win $_nWave1 208803.042221
wvSetCursor -win $_nWave1 42418.831695
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/\$unit_0x29ffa1f6"
wvGetSignalSetScope -win $_nWave1 "/testfixture"
wvGetSignalClose -win $_nWave1
wvExit
