/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03
// Date      : Tue Feb 18 22:54:11 2025
/////////////////////////////////////////////////////////////


module sort ( CLK, RST, next, changed, finish, sort );
  output [23:0] sort;
  input CLK, RST, next;
  output changed, finish;
  wire   N106, N107, N108, N109, N110, N111, N115, N116, N117, N118, N119,
         N120, N122, N123, \nextline[7][2] , \nextline[7][1] ,
         \nextline[7][0] , \nextline[6][2] , \nextline[6][1] ,
         \nextline[6][0] , \nextline[5][2] , \nextline[5][1] ,
         \nextline[5][0] , \nextline[4][2] , \nextline[4][1] ,
         \nextline[4][0] , \nextline[3][2] , \nextline[3][1] ,
         \nextline[3][0] , \nextline[2][2] , \nextline[2][1] ,
         \nextline[2][0] , \nextline[1][2] , \nextline[1][1] ,
         \nextline[1][0] , \nextline[0][2] , \nextline[0][1] ,
         \nextline[0][0] , N137, N138, N151, N152, N153, N164, N165, N166,
         N286, N287, N288, N379, N381, N382, N383, N396, N397, N398, n63, n65,
         n69, n70, n73, n74, n77, n78, n79, n80, n81, n84, n86, n88, n89, n90,
         n91, n94, n95, n97, n99, n100, n102, n103, n104, n105, n106, n108,
         n109, n110, n111, n112, n114, n116, n117, n118, n119, n121, n123,
         n124, n125, n127, n128, n129, n130, n132, n133, n134, n136, n137,
         n138, n140, n141, n144, n145, n146, n147, n149, n150, n152, n153,
         n155, n156, n157, n159, n160, n162, n163, n164, n166, n167, n168,
         n169, n170, n171, n172, n173, n174, n176, n177, n178, n179, n180,
         n181, n182, n184, n185, n186, n187, n188, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n217,
         n218, n219, n220, n221, n222, n223, n225, n226, n227, n232, n233,
         n234, n238, n239, n241, n242, n243, n245, n246, n247, n249, n250,
         n251, n253, n254, n256, n257, n258, n259, n260, n261, n262, n263,
         n264, n265, n266, n267, n268, n269, n270, n271, n272, n273, n274,
         n275, n276, n277, n278, n279, n280, n281, n282, n283, n284, n285,
         n286, n287, n288, n289, n290, n291, n292, n293, n294, n295, n296,
         n297, n298, n299, n300, n301, n302, n303, n304, n305, n306, n307,
         n308, n309, n310, n311, n312, n313, n314, n316, n317, n318, n319,
         n320, n321, n322, n323, n324, n325, n326, n327, n328, n329, n330,
         n331, n332, n333, n334, n335, n336, n337, n338, n339, n340, n341,
         n342, n343, n344, n345, n346, n347, n348, n349, n350, n351, n352,
         n354, n356, n357, n358, n359, n360, n1, n2, n3, n4, n5, n6, n7, n8,
         n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n64, n66,
         n67, n68, n71, n72, n75, n76, n82, n83, n85, n87, n92, n93, n96, n98,
         n101, n107, n113, n115, n120, n122, n126, n131, n135, n139, n142,
         n143, n148, n151, n154, n158, n161, n165, n175, n183, n189, n215,
         n216, n224, n228, n229, n230, n231, n235, n236, n237, n240, n244,
         n248, n252, n255, n315, n353, n355, n361, n362, n363, n364, n365,
         n366, n367, n368, n369, n370, n371, n372, n373, n374, n375, n376,
         n377, n378, n379, n380, n381, n382, n383, n384, n385, n386, n387,
         n388, n389, n390, n391, n392, n393, n394, n395, n396, n397, n398,
         n399, n400, n401, n402, n403, n404, n405, n406, n407, n408, n409,
         n410, n411, n412, n413, n414, n415, n416, n417, n418, n419, n420,
         n421, n422, n423, n424, n425, n426, n427, n428, n429, n430, n431,
         n432, n433, n434, n435, n436, n437, n438, n439, n440, n441, n442,
         n443, n444, n445, n446, n447, n448, n449, n450, n451, n452, n453,
         n454, n455, n456, n457, n458, n459;
  wire   [1:0] state;
  wire   [1:0] nextstate;

  DFFRX1 finish_reg ( .D(n314), .CK(CLK), .RN(n12), .Q(finish), .QN(n289) );
  DFFRX1 done_reg ( .D(n399), .CK(CLK), .RN(n12), .Q(n4), .QN(n318) );
  DFFRX1 \line_reg[6][0]  ( .D(n296), .CK(CLK), .RN(n13), .QN(n270) );
  DFFRX1 \line_reg[2][2]  ( .D(n307), .CK(CLK), .RN(n13), .QN(n281) );
  DFFRX1 \line_reg[2][0]  ( .D(n291), .CK(CLK), .RN(n14), .QN(n265) );
  DFFRX1 \line_reg[3][2]  ( .D(n308), .CK(CLK), .RN(n12), .QN(n282) );
  DFFRX1 \line_reg[1][2]  ( .D(n306), .CK(CLK), .RN(n13), .QN(n280) );
  DFFRX1 \line_reg[1][1]  ( .D(n298), .CK(CLK), .RN(n13), .QN(n272) );
  DFFRX1 \line_reg[5][1]  ( .D(n303), .CK(CLK), .RN(n13), .QN(n277) );
  DFFRX1 \line_reg[0][2]  ( .D(n310), .CK(CLK), .RN(n12), .QN(n284) );
  DFFRX1 \line_reg[0][1]  ( .D(n302), .CK(CLK), .RN(n13), .QN(n276) );
  DFFRX1 \line_reg[0][0]  ( .D(n294), .CK(CLK), .RN(n14), .QN(n268) );
  DFFRX1 \line_reg[4][1]  ( .D(n301), .CK(CLK), .RN(n13), .QN(n275) );
  DFFRX1 \line_reg[4][0]  ( .D(n293), .CK(CLK), .RN(n14), .QN(n267) );
  DFFRX1 \min_id_reg[2]  ( .D(n320), .CK(CLK), .RN(n12), .Q(N117), .QN(n263)
         );
  DFFRX1 \count_reg[1]  ( .D(n360), .CK(CLK), .RN(n12), .Q(n1), .QN(n321) );
  DFFRX1 \index_reg[2]  ( .D(N398), .CK(CLK), .RN(n12), .Q(N108), .QN(n288) );
  DFFRX1 \index_reg[1]  ( .D(N397), .CK(CLK), .RN(n12), .Q(N107), .QN(n325) );
  DFFRX1 \min_id_reg[0]  ( .D(n351), .CK(CLK), .RN(n12), .Q(N115), .QN(n324)
         );
  DFFRX1 \min_id_reg[1]  ( .D(n350), .CK(CLK), .RN(n12), .Q(N116), .QN(n323)
         );
  DFFRX1 \count_reg[0]  ( .D(n359), .CK(CLK), .RN(n12), .Q(n3), .QN(n322) );
  DFFRX1 changed_reg ( .D(n21), .CK(CLK), .RN(n12), .Q(changed), .QN(n316) );
  DFFSX1 full_reg ( .D(n354), .CK(CLK), .SN(n459), .Q(n430), .QN(n317) );
  DFFSX1 \line_reg[7][2]  ( .D(n313), .CK(CLK), .SN(n459), .QN(n287) );
  DFFSX1 \line_reg[7][1]  ( .D(n305), .CK(CLK), .SN(n459), .QN(n279) );
  DFFSX1 \line_reg[7][0]  ( .D(n297), .CK(CLK), .SN(n459), .QN(n271) );
  DFFSX1 \line_reg[6][2]  ( .D(n312), .CK(CLK), .SN(n459), .QN(n286) );
  DFFSX1 \line_reg[6][1]  ( .D(n304), .CK(CLK), .SN(n459), .QN(n278) );
  DFFSX1 \line_reg[5][2]  ( .D(n311), .CK(CLK), .SN(n459), .QN(n285) );
  DFFSX1 \line_reg[5][0]  ( .D(n295), .CK(CLK), .SN(n459), .QN(n269) );
  DFFSX1 \line_reg[4][2]  ( .D(n309), .CK(CLK), .SN(n459), .QN(n283) );
  DFFSX1 \line_reg[3][1]  ( .D(n300), .CK(CLK), .SN(n459), .QN(n274) );
  DFFSX1 \line_reg[3][0]  ( .D(n292), .CK(CLK), .SN(n459), .QN(n266) );
  DFFSX1 \line_reg[2][1]  ( .D(n299), .CK(CLK), .SN(n459), .QN(n273) );
  DFFSX1 \line_reg[1][0]  ( .D(n290), .CK(CLK), .SN(n459), .QN(n264) );
  DFFSX1 \cur_min_reg[0]  ( .D(n319), .CK(CLK), .SN(n459), .Q(n431), .QN(n260)
         );
  DFFSX1 \cur_min_reg[2]  ( .D(n352), .CK(CLK), .SN(n459), .Q(n262), .QN(n458)
         );
  DFFSX1 \cur_min_reg[1]  ( .D(n413), .CK(CLK), .SN(n459), .Q(n261) );
  DFFSX1 \nextline_reg[3][1]  ( .D(n338), .CK(CLK), .SN(n459), .Q(
        \nextline[3][1] ), .QN(n447) );
  DFFRX1 \nextline_reg[3][2]  ( .D(n337), .CK(CLK), .RN(n459), .Q(
        \nextline[3][2] ), .QN(n439) );
  DFFRXL \state_reg[1]  ( .D(nextstate[1]), .CK(CLK), .RN(n459), .Q(state[1]), 
        .QN(n428) );
  DFFRXL \state_reg[0]  ( .D(nextstate[0]), .CK(CLK), .RN(n459), .Q(state[0]), 
        .QN(n408) );
  DFFRX4 \index_reg[0]  ( .D(N396), .CK(CLK), .RN(n459), .Q(N106), .QN(n57) );
  DFFX2 \pivot_reg[1]  ( .D(n356), .CK(CLK), .Q(N110), .QN(n92) );
  DFFX2 \pivot_reg[0]  ( .D(n358), .CK(CLK), .Q(N109), .QN(n87) );
  DFFX2 \pivot_reg[2]  ( .D(n357), .CK(CLK), .Q(N111), .QN(n93) );
  DFFRX1 \nextline_reg[6][0]  ( .D(n330), .CK(CLK), .RN(n13), .Q(
        \nextline[6][0] ), .QN(n451) );
  DFFSX1 \nextline_reg[7][0]  ( .D(n349), .CK(CLK), .SN(n14), .Q(
        \nextline[7][0] ), .QN(n450) );
  DFFSX1 \nextline_reg[6][2]  ( .D(n328), .CK(CLK), .SN(n14), .Q(
        \nextline[6][2] ), .QN(n435) );
  DFFSX1 \nextline_reg[7][2]  ( .D(n326), .CK(CLK), .SN(n14), .Q(
        \nextline[7][2] ), .QN(n434) );
  DFFRX1 \nextline_reg[2][0]  ( .D(n342), .CK(CLK), .RN(n14), .Q(
        \nextline[2][0] ), .QN(n456) );
  DFFSX1 \nextline_reg[3][0]  ( .D(n339), .CK(CLK), .SN(n14), .Q(
        \nextline[3][0] ), .QN(n455) );
  DFFRX1 \nextline_reg[2][2]  ( .D(n340), .CK(CLK), .RN(n13), .Q(
        \nextline[2][2] ), .QN(n440) );
  DFFSX1 \nextline_reg[5][0]  ( .D(n333), .CK(CLK), .SN(n14), .Q(
        \nextline[5][0] ), .QN(n452) );
  DFFRX1 \nextline_reg[4][0]  ( .D(n336), .CK(CLK), .RN(n14), .Q(
        \nextline[4][0] ), .QN(n454) );
  DFFSX1 \nextline_reg[5][2]  ( .D(n331), .CK(CLK), .SN(n14), .Q(
        \nextline[5][2] ), .QN(n436) );
  DFFSX1 \nextline_reg[1][0]  ( .D(n345), .CK(CLK), .SN(n14), .Q(
        \nextline[1][0] ), .QN(n457) );
  DFFSX1 \nextline_reg[4][2]  ( .D(n334), .CK(CLK), .SN(n14), .Q(
        \nextline[4][2] ), .QN(n438) );
  DFFRX1 \nextline_reg[0][0]  ( .D(n348), .CK(CLK), .RN(n13), .Q(
        \nextline[0][0] ), .QN(n453) );
  DFFRX1 \nextline_reg[1][2]  ( .D(n343), .CK(CLK), .RN(n13), .Q(
        \nextline[1][2] ), .QN(n441) );
  DFFRX1 \nextline_reg[0][2]  ( .D(n346), .CK(CLK), .RN(n12), .Q(
        \nextline[0][2] ), .QN(n437) );
  DFFSX1 \nextline_reg[6][1]  ( .D(n329), .CK(CLK), .SN(n14), .Q(
        \nextline[6][1] ), .QN(n443) );
  DFFSX1 \nextline_reg[7][1]  ( .D(n327), .CK(CLK), .SN(n14), .Q(
        \nextline[7][1] ), .QN(n442) );
  DFFSX1 \nextline_reg[2][1]  ( .D(n341), .CK(CLK), .SN(n14), .Q(
        \nextline[2][1] ), .QN(n448) );
  DFFRX1 \nextline_reg[5][1]  ( .D(n332), .CK(CLK), .RN(n13), .Q(
        \nextline[5][1] ), .QN(n444) );
  DFFRX1 \nextline_reg[4][1]  ( .D(n335), .CK(CLK), .RN(n13), .Q(
        \nextline[4][1] ), .QN(n446) );
  DFFRX1 \nextline_reg[1][1]  ( .D(n344), .CK(CLK), .RN(n13), .Q(
        \nextline[1][1] ), .QN(n449) );
  DFFRX1 \nextline_reg[0][1]  ( .D(n347), .CK(CLK), .RN(n13), .Q(
        \nextline[0][1] ), .QN(n445) );
  NAND3X1 U3 ( .A(n87), .B(n92), .C(N111), .Y(n150) );
  NAND3X1 U4 ( .A(n87), .B(n93), .C(N110), .Y(n176) );
  NAND2X1 U5 ( .A(n321), .B(n3), .Y(n88) );
  NAND2X1 U6 ( .A(n322), .B(n1), .Y(n103) );
  OA22X1 U7 ( .A0(n56), .A1(n43), .B0(N108), .B1(n42), .Y(n2) );
  NOR2X2 U8 ( .A(n92), .B(N109), .Y(n82) );
  INVX4 U9 ( .A(RST), .Y(n459) );
  OAI22X1 U10 ( .A0(n170), .A1(n364), .B0(N120), .B1(n363), .Y(N287) );
  OAI22X1 U11 ( .A0(n372), .A1(n170), .B0(N120), .B1(n371), .Y(N286) );
  OAI22X1 U12 ( .A0(n56), .A1(n47), .B0(N108), .B1(n46), .Y(N383) );
  NAND2X1 U13 ( .A(N153), .B(n11), .Y(n116) );
  OAI22X2 U14 ( .A0(n93), .A1(n61), .B0(N111), .B1(n60), .Y(N153) );
  NAND2X1 U15 ( .A(N151), .B(n11), .Y(n94) );
  OAI22X2 U16 ( .A0(n85), .A1(n93), .B0(N111), .B1(n83), .Y(N151) );
  OAI22X1 U17 ( .A0(n170), .A1(n355), .B0(N120), .B1(n353), .Y(N288) );
  OAI22X2 U18 ( .A0(n55), .A1(n56), .B0(N108), .B1(n54), .Y(N382) );
  NAND2X1 U19 ( .A(N152), .B(n11), .Y(n99) );
  OAI22X2 U20 ( .A0(n93), .A1(n67), .B0(N111), .B1(n66), .Y(N152) );
  NAND4X1 U21 ( .A(n11), .B(n212), .C(n213), .D(n214), .Y(n159) );
  OAI21X1 U22 ( .A0(n159), .A1(n166), .B0(n169), .Y(n162) );
  NAND3BX1 U23 ( .AN(n89), .B(n210), .C(n211), .Y(n84) );
  CLKINVX1 U24 ( .A(n11), .Y(n412) );
  OAI21X1 U25 ( .A0(n208), .A1(n209), .B0(n197), .Y(n156) );
  OAI21X1 U26 ( .A0(n200), .A1(n201), .B0(n197), .Y(n153) );
  OAI21X1 U27 ( .A0(n195), .A1(n196), .B0(n197), .Y(n149) );
  NOR2X1 U28 ( .A(n103), .B(n402), .Y(n104) );
  NOR2X1 U29 ( .A(n88), .B(n402), .Y(n89) );
  NAND4X1 U30 ( .A(n218), .B(n219), .C(n220), .D(n221), .Y(n81) );
  OAI21XL U31 ( .A0(N110), .A1(n1), .B0(n234), .Y(n258) );
  XOR2X1 U32 ( .A(n259), .B(n258), .Y(N119) );
  XNOR2X1 U33 ( .A(n325), .B(N106), .Y(n238) );
  OAI21X1 U34 ( .A0(n159), .A1(n150), .B0(n160), .Y(n145) );
  OAI21X1 U35 ( .A0(n159), .A1(n184), .B0(n187), .Y(n180) );
  OAI21X1 U36 ( .A0(n159), .A1(n176), .B0(n179), .Y(n172) );
  NAND3BX1 U37 ( .AN(n104), .B(n117), .C(n118), .Y(n100) );
  NOR3X2 U38 ( .A(n93), .B(N110), .C(n87), .Y(n128) );
  NAND3X1 U39 ( .A(n92), .B(n93), .C(N109), .Y(n184) );
  NAND3X1 U40 ( .A(N110), .B(n93), .C(N109), .Y(n166) );
  NOR3X2 U41 ( .A(N110), .B(N111), .C(N109), .Y(n191) );
  NOR2X1 U42 ( .A(state[0]), .B(state[1]), .Y(n70) );
  INVX3 U43 ( .A(n20), .Y(n17) );
  INVX3 U44 ( .A(n19), .Y(n18) );
  CLKBUFX3 U45 ( .A(n22), .Y(n19) );
  CLKBUFX3 U46 ( .A(n22), .Y(n20) );
  CLKBUFX3 U47 ( .A(n22), .Y(n21) );
  CLKINVX1 U48 ( .A(n239), .Y(n393) );
  CLKINVX1 U49 ( .A(N118), .Y(n373) );
  CLKINVX1 U50 ( .A(N122), .Y(n154) );
  CLKINVX1 U51 ( .A(n137), .Y(n411) );
  CLKINVX1 U52 ( .A(n111), .Y(n410) );
  CLKINVX1 U53 ( .A(n108), .Y(n409) );
  CLKINVX1 U54 ( .A(n159), .Y(n415) );
  CLKINVX1 U55 ( .A(n162), .Y(n404) );
  CLKINVX1 U56 ( .A(n84), .Y(n400) );
  INVX3 U57 ( .A(n197), .Y(n402) );
  CLKINVX1 U58 ( .A(n156), .Y(n405) );
  CLKINVX1 U59 ( .A(n149), .Y(n407) );
  CLKINVX1 U60 ( .A(n153), .Y(n406) );
  OR2X1 U61 ( .A(n129), .B(n402), .Y(n132) );
  CLKINVX1 U62 ( .A(n106), .Y(n423) );
  CLKINVX1 U63 ( .A(n78), .Y(n22) );
  OAI21XL U64 ( .A0(N151), .A1(n421), .B0(n225), .Y(n219) );
  OAI2BB2XL U65 ( .B0(n226), .B1(n227), .A0N(n421), .A1N(N151), .Y(n225) );
  NOR2XL U66 ( .A(N152), .B(n420), .Y(n227) );
  AOI211XL U67 ( .A0(N152), .A1(n420), .B0(n2), .C0(N153), .Y(n226) );
  CLKINVX1 U68 ( .A(n81), .Y(n414) );
  OAI221XL U69 ( .A0(n421), .A1(n81), .B0(n414), .B1(n458), .C0(n417), .Y(n352) );
  INVX1 U70 ( .A(N382), .Y(n421) );
  OAI22XL U71 ( .A0(n442), .A1(n84), .B0(n400), .B1(n95), .Y(n327) );
  AOI221XL U72 ( .A0(n406), .A1(n88), .B0(N287), .B1(n89), .C0(n97), .Y(n95)
         );
  OAI22XL U73 ( .A0(n91), .A1(n410), .B0(n422), .B1(n99), .Y(n97) );
  OAI22XL U74 ( .A0(n443), .A1(n100), .B0(n401), .B1(n109), .Y(n329) );
  AOI221XL U75 ( .A0(n406), .A1(n103), .B0(n104), .B1(N287), .C0(n110), .Y(
        n109) );
  OAI22XL U76 ( .A0(n410), .A1(n106), .B0(n423), .B1(n99), .Y(n110) );
  OAI22XL U77 ( .A0(n444), .A1(n125), .B0(n395), .B1(n133), .Y(n332) );
  AOI221XL U78 ( .A0(n128), .A1(n111), .B0(n406), .B1(n129), .C0(n134), .Y(
        n133) );
  OAI22XL U79 ( .A0(n128), .A1(n99), .B0(n425), .B1(n132), .Y(n134) );
  OAI22XL U80 ( .A0(n445), .A1(n188), .B0(n396), .B1(n198), .Y(n347) );
  AOI221XL U81 ( .A0(n191), .A1(n111), .B0(n406), .B1(n192), .C0(n199), .Y(
        n198) );
  OAI22XL U82 ( .A0(n191), .A1(n99), .B0(n425), .B1(n194), .Y(n199) );
  NOR2X1 U83 ( .A(n421), .B(N379), .Y(n254) );
  NAND2X1 U84 ( .A(n416), .B(N106), .Y(N396) );
  NAND2X1 U85 ( .A(n416), .B(n238), .Y(N397) );
  NAND2X1 U86 ( .A(n416), .B(n391), .Y(N398) );
  OAI22XL U87 ( .A0(n434), .A1(n84), .B0(n400), .B1(n86), .Y(n326) );
  AOI221XL U88 ( .A0(n407), .A1(n88), .B0(N286), .B1(n89), .C0(n90), .Y(n86)
         );
  OAI22XL U89 ( .A0(n91), .A1(n409), .B0(n422), .B1(n94), .Y(n90) );
  OAI22XL U90 ( .A0(n435), .A1(n100), .B0(n401), .B1(n102), .Y(n328) );
  AOI221XL U91 ( .A0(n407), .A1(n103), .B0(n104), .B1(N286), .C0(n105), .Y(
        n102) );
  OAI22XL U92 ( .A0(n409), .A1(n106), .B0(n423), .B1(n94), .Y(n105) );
  OAI22XL U93 ( .A0(n437), .A1(n188), .B0(n396), .B1(n190), .Y(n346) );
  AOI221XL U94 ( .A0(n191), .A1(n108), .B0(n407), .B1(n192), .C0(n193), .Y(
        n190) );
  OAI22XL U95 ( .A0(n191), .A1(n94), .B0(n426), .B1(n194), .Y(n193) );
  OAI22XL U96 ( .A0(n436), .A1(n125), .B0(n395), .B1(n127), .Y(n331) );
  AOI221XL U97 ( .A0(n128), .A1(n108), .B0(n407), .B1(n129), .C0(n130), .Y(
        n127) );
  OAI22XL U98 ( .A0(n128), .A1(n94), .B0(n426), .B1(n132), .Y(n130) );
  NAND4X1 U99 ( .A(n241), .B(n12), .C(n242), .D(n243), .Y(n239) );
  NAND3XL U100 ( .A(n245), .B(n420), .C(N165), .Y(n242) );
  OAI221XL U101 ( .A0(N165), .A1(n420), .B0(N166), .B1(n2), .C0(n245), .Y(n241) );
  AOI21X1 U102 ( .A0(N164), .A1(n421), .B0(n394), .Y(n243) );
  OAI22XL U103 ( .A0(n393), .A1(n92), .B0(n238), .B1(n239), .Y(n356) );
  OAI22XL U104 ( .A0(n393), .A1(n93), .B0(n391), .B1(n239), .Y(n357) );
  OAI22XL U105 ( .A0(n393), .A1(n87), .B0(N106), .B1(n239), .Y(n358) );
  OAI222XL U106 ( .A0(n449), .A1(n180), .B0(n185), .B1(n182), .C0(n397), .C1(
        n153), .Y(n344) );
  AOI2BB2XL U107 ( .B0(N152), .B1(n184), .A0N(n8), .A1N(n184), .Y(n185) );
  OAI222XL U108 ( .A0(n446), .A1(n145), .B0(n152), .B1(n147), .C0(n398), .C1(
        n153), .Y(n335) );
  AOI2BB2XL U109 ( .B0(N152), .B1(n150), .A0N(n150), .A1N(n8), .Y(n152) );
  OAI22XL U110 ( .A0(n451), .A1(n100), .B0(n401), .B1(n112), .Y(n330) );
  AOI221XL U111 ( .A0(n405), .A1(n103), .B0(N288), .B1(n104), .C0(n114), .Y(
        n112) );
  OAI22XL U112 ( .A0(n106), .A1(n411), .B0(n423), .B1(n116), .Y(n114) );
  OAI222XL U113 ( .A0(n448), .A1(n172), .B0(n177), .B1(n174), .C0(n403), .C1(
        n153), .Y(n341) );
  AOI2BB2XL U114 ( .B0(N152), .B1(n176), .A0N(n176), .A1N(n8), .Y(n177) );
  OAI222XL U115 ( .A0(n447), .A1(n162), .B0(n167), .B1(n164), .C0(n404), .C1(
        n153), .Y(n338) );
  AOI2BB2XL U116 ( .B0(N152), .B1(n166), .A0N(n8), .A1N(n166), .Y(n167) );
  OAI22XL U117 ( .A0(n450), .A1(n84), .B0(n400), .B1(n206), .Y(n349) );
  AOI221XL U118 ( .A0(n405), .A1(n88), .B0(N288), .B1(n89), .C0(n207), .Y(n206) );
  OAI22XL U119 ( .A0(n91), .A1(n411), .B0(n422), .B1(n116), .Y(n207) );
  OAI222XL U120 ( .A0(n441), .A1(n180), .B0(n181), .B1(n182), .C0(n397), .C1(
        n149), .Y(n343) );
  AOI2BB2XL U121 ( .B0(N151), .B1(n184), .A0N(n9), .A1N(n184), .Y(n181) );
  OAI222XL U122 ( .A0(n440), .A1(n172), .B0(n173), .B1(n174), .C0(n403), .C1(
        n149), .Y(n340) );
  AOI2BB2XL U123 ( .B0(N151), .B1(n176), .A0N(n176), .A1N(n9), .Y(n173) );
  OAI222XL U124 ( .A0(n439), .A1(n162), .B0(n163), .B1(n164), .C0(n404), .C1(
        n149), .Y(n337) );
  AOI2BB2XL U125 ( .B0(N151), .B1(n166), .A0N(n9), .A1N(n166), .Y(n163) );
  OAI22XL U126 ( .A0(n453), .A1(n188), .B0(n396), .B1(n202), .Y(n348) );
  AOI221XL U127 ( .A0(n191), .A1(n137), .B0(n405), .B1(n192), .C0(n203), .Y(
        n202) );
  OAI22XL U128 ( .A0(n191), .A1(n116), .B0(n424), .B1(n194), .Y(n203) );
  CLKINVX2 U129 ( .A(N383), .Y(n420) );
  OAI222XL U130 ( .A0(n438), .A1(n145), .B0(n146), .B1(n147), .C0(n398), .C1(
        n149), .Y(n334) );
  AOI2BB2XL U131 ( .B0(N151), .B1(n150), .A0N(n150), .A1N(n9), .Y(n146) );
  OAI22XL U132 ( .A0(n452), .A1(n125), .B0(n395), .B1(n136), .Y(n333) );
  AOI221XL U133 ( .A0(n128), .A1(n137), .B0(n405), .B1(n129), .C0(n138), .Y(
        n136) );
  OAI22XL U134 ( .A0(n128), .A1(n116), .B0(n424), .B1(n132), .Y(n138) );
  NAND2XL U135 ( .A(N382), .B(n5), .Y(n77) );
  OAI211XL U136 ( .A0(N382), .A1(n5), .B0(n73), .C0(n74), .Y(n63) );
  NAND3XL U137 ( .A(n77), .B(n420), .C(N137), .Y(n73) );
  OAI221XL U138 ( .A0(N137), .A1(n420), .B0(N138), .B1(n2), .C0(n77), .Y(n74)
         );
  OAI221XL U139 ( .A0(n394), .A1(n63), .B0(n428), .B1(n65), .C0(n412), .Y(
        nextstate[1]) );
  NAND2BXL U140 ( .AN(N164), .B(N382), .Y(n245) );
  CLKBUFX3 U141 ( .A(n459), .Y(n12) );
  OAI222XL U142 ( .A0(n456), .A1(n172), .B0(n178), .B1(n174), .C0(n403), .C1(
        n156), .Y(n342) );
  AOI2BB2XL U143 ( .B0(N153), .B1(n176), .A0N(n176), .A1N(n7), .Y(n178) );
  OAI222XL U144 ( .A0(n454), .A1(n145), .B0(n155), .B1(n147), .C0(n398), .C1(
        n156), .Y(n336) );
  AOI2BB2XL U145 ( .B0(N153), .B1(n150), .A0N(n150), .A1N(n7), .Y(n155) );
  OAI222XL U146 ( .A0(n457), .A1(n180), .B0(n186), .B1(n182), .C0(n397), .C1(
        n156), .Y(n345) );
  AOI2BB2XL U147 ( .B0(N153), .B1(n184), .A0N(n7), .A1N(n184), .Y(n186) );
  OAI222XL U148 ( .A0(n455), .A1(n162), .B0(n168), .B1(n164), .C0(n404), .C1(
        n156), .Y(n339) );
  AOI2BB2XL U149 ( .B0(N153), .B1(n166), .A0N(n7), .A1N(n166), .Y(n168) );
  INVXL U150 ( .A(N287), .Y(n425) );
  CLKINVX1 U151 ( .A(n123), .Y(N118) );
  INVXL U152 ( .A(N286), .Y(n426) );
  INVXL U153 ( .A(N288), .Y(n424) );
  CLKINVX1 U154 ( .A(N119), .Y(n374) );
  INVX3 U155 ( .A(n238), .Y(N122) );
  INVXL U156 ( .A(N379), .Y(n419) );
  CLKINVX1 U157 ( .A(n170), .Y(N120) );
  NOR2X1 U158 ( .A(n7), .B(n412), .Y(n137) );
  NOR2X1 U159 ( .A(n8), .B(n412), .Y(n111) );
  NOR2X1 U160 ( .A(n9), .B(n412), .Y(n108) );
  CLKINVX1 U161 ( .A(n10), .Y(n158) );
  CLKINVX1 U162 ( .A(n10), .Y(n391) );
  NAND2X1 U163 ( .A(n11), .B(n172), .Y(n174) );
  NAND2X1 U164 ( .A(n11), .B(n180), .Y(n182) );
  AOI33X1 U165 ( .A0(n429), .A1(n170), .A2(n124), .B0(n433), .B1(n432), .B2(
        n171), .Y(n169) );
  NAND2X1 U166 ( .A(n11), .B(n162), .Y(n164) );
  CLKINVX1 U167 ( .A(n172), .Y(n403) );
  CLKINVX1 U168 ( .A(n180), .Y(n397) );
  NAND2X1 U169 ( .A(n11), .B(n145), .Y(n147) );
  CLKINVX1 U170 ( .A(n145), .Y(n398) );
  CLKINVX1 U171 ( .A(n188), .Y(n396) );
  CLKINVX1 U172 ( .A(n100), .Y(n401) );
  CLKINVX1 U173 ( .A(n170), .Y(n427) );
  NAND3X1 U174 ( .A(n427), .B(n429), .C(n124), .Y(n210) );
  AOI32X1 U175 ( .A0(n433), .A1(n432), .A2(n119), .B0(n422), .B1(n415), .Y(
        n211) );
  NOR2X2 U176 ( .A(n408), .B(n428), .Y(n197) );
  NOR2X1 U177 ( .A(n402), .B(N119), .Y(n144) );
  CLKINVX1 U178 ( .A(n125), .Y(n395) );
  AND2X2 U179 ( .A(N119), .B(n197), .Y(n124) );
  CLKINVX1 U180 ( .A(n123), .Y(n429) );
  INVX3 U181 ( .A(n316), .Y(n15) );
  NAND2X2 U182 ( .A(n1), .B(n3), .Y(n129) );
  OAI22XL U183 ( .A0(n451), .A1(n103), .B0(n450), .B1(n88), .Y(n209) );
  OAI22XL U184 ( .A0(n452), .A1(n129), .B0(n453), .B1(n192), .Y(n208) );
  OAI22XL U185 ( .A0(n435), .A1(n103), .B0(n434), .B1(n88), .Y(n196) );
  OAI22XL U186 ( .A0(n436), .A1(n129), .B0(n437), .B1(n192), .Y(n195) );
  OAI22XL U187 ( .A0(n443), .A1(n103), .B0(n442), .B1(n88), .Y(n201) );
  OAI22XL U188 ( .A0(n444), .A1(n129), .B0(n445), .B1(n192), .Y(n200) );
  OR2X1 U189 ( .A(n192), .B(n402), .Y(n194) );
  NAND2X1 U190 ( .A(n121), .B(n87), .Y(n106) );
  NOR2X1 U191 ( .A(n93), .B(n92), .Y(n121) );
  CLKINVX1 U192 ( .A(n91), .Y(n422) );
  NAND2X1 U193 ( .A(next), .B(n430), .Y(n78) );
  CLKINVX1 U194 ( .A(n232), .Y(n399) );
  AOI32X1 U195 ( .A0(n402), .A1(n4), .A2(n417), .B0(n65), .B1(n197), .Y(n232)
         );
  CLKINVX1 U196 ( .A(n79), .Y(n394) );
  INVX3 U197 ( .A(n70), .Y(n417) );
  CLKBUFX3 U198 ( .A(n459), .Y(n14) );
  CLKBUFX3 U199 ( .A(n459), .Y(n13) );
  NAND3X1 U200 ( .A(n213), .B(n214), .C(n212), .Y(n218) );
  OAI22XL U201 ( .A0(n222), .A1(n223), .B0(N382), .B1(n458), .Y(n220) );
  OA21XL U202 ( .A0(n421), .A1(n262), .B0(n11), .Y(n221) );
  OAI221XL U203 ( .A0(n57), .A1(n81), .B0(n324), .B1(n414), .C0(n417), .Y(n351) );
  OAI221XL U204 ( .A0(n325), .A1(n81), .B0(n323), .B1(n414), .C0(n417), .Y(
        n350) );
  OAI221XL U205 ( .A0(n288), .A1(n81), .B0(n263), .B1(n414), .C0(n417), .Y(
        n320) );
  CLKINVX1 U206 ( .A(n217), .Y(n413) );
  AOI221XL U207 ( .A0(N383), .A1(n414), .B0(n81), .B1(n261), .C0(n70), .Y(n217) );
  OAI221XL U208 ( .A0(n2), .A1(n81), .B0(n260), .B1(n414), .C0(n417), .Y(n319)
         );
  CLKINVX1 U209 ( .A(n249), .Y(n416) );
  OAI31XL U210 ( .A0(n250), .A1(state[1]), .A2(n251), .B0(n417), .Y(n249) );
  AOI211XL U211 ( .A0(N383), .A1(n6), .B0(n253), .C0(n254), .Y(n251) );
  OAI32XL U212 ( .A0(n6), .A1(N383), .A2(n254), .B0(N382), .B1(n419), .Y(n250)
         );
  AOI211X1 U213 ( .A0(n261), .A1(n420), .B0(n431), .C0(n2), .Y(n222) );
  NOR2X1 U214 ( .A(n261), .B(n420), .Y(n223) );
  OAI221XL U215 ( .A0(n418), .A1(n394), .B0(n65), .B1(n402), .C0(n69), .Y(
        nextstate[0]) );
  AOI31X1 U216 ( .A0(n318), .A1(n70), .A2(n317), .B0(n415), .Y(n69) );
  CLKINVX1 U217 ( .A(n63), .Y(n418) );
  CLKINVX1 U218 ( .A(N108), .Y(n56) );
  XNOR2X2 U219 ( .A(n322), .B(n87), .Y(n123) );
  NAND2X1 U220 ( .A(N109), .B(n3), .Y(n259) );
  NAND2X1 U221 ( .A(N110), .B(n1), .Y(n234) );
  OA22X1 U222 ( .A0(n38), .A1(n391), .B0(n10), .B1(n37), .Y(n5) );
  CLKINVX1 U223 ( .A(n57), .Y(n161) );
  CLKINVX1 U224 ( .A(n57), .Y(n39) );
  OA22X1 U225 ( .A0(n391), .A1(n382), .B0(n10), .B1(n381), .Y(n6) );
  CLKINVX1 U226 ( .A(n57), .Y(n392) );
  NOR2X1 U227 ( .A(N381), .B(n2), .Y(n253) );
  CLKXOR2X2 U228 ( .A(n257), .B(n93), .Y(n170) );
  OAI31XL U229 ( .A0(n258), .A1(n322), .A2(n87), .B0(n234), .Y(n257) );
  OA22X1 U230 ( .A0(n263), .A1(n189), .B0(N117), .B1(n183), .Y(n7) );
  OA22X1 U231 ( .A0(n263), .A1(n228), .B0(N117), .B1(n224), .Y(n8) );
  OA22X1 U232 ( .A0(n244), .A1(n263), .B0(N117), .B1(n240), .Y(n9) );
  CLKINVX1 U233 ( .A(N115), .Y(n248) );
  CLKINVX1 U234 ( .A(N116), .Y(n252) );
  CLKBUFX3 U235 ( .A(N123), .Y(n10) );
  OAI21XL U236 ( .A0(n256), .A1(n288), .B0(n80), .Y(N123) );
  NOR2X1 U237 ( .A(N107), .B(N106), .Y(n256) );
  NAND3X1 U238 ( .A(n57), .B(n325), .C(n288), .Y(n80) );
  AOI33X1 U239 ( .A0(n123), .A1(n170), .A2(n124), .B0(n324), .B1(n432), .B2(
        n171), .Y(n179) );
  XNOR2X1 U240 ( .A(N106), .B(N109), .Y(n213) );
  AND2X2 U241 ( .A(n263), .B(n415), .Y(n171) );
  AOI33X1 U242 ( .A0(n429), .A1(n170), .A2(n144), .B0(n323), .B1(n433), .B2(
        n171), .Y(n187) );
  AOI33X1 U243 ( .A0(n427), .A1(n123), .A2(n144), .B0(n324), .B1(n119), .B2(
        n323), .Y(n160) );
  NOR2X1 U244 ( .A(n159), .B(n263), .Y(n119) );
  OAI22XL U245 ( .A0(n264), .A1(n15), .B0(n16), .B1(n457), .Y(sort[18]) );
  OAI22XL U246 ( .A0(n268), .A1(n15), .B0(n16), .B1(n453), .Y(sort[21]) );
  OAI22XL U247 ( .A0(n272), .A1(n15), .B0(n16), .B1(n449), .Y(sort[19]) );
  OAI22XL U248 ( .A0(n276), .A1(n15), .B0(n16), .B1(n445), .Y(sort[22]) );
  OAI22XL U249 ( .A0(n280), .A1(n15), .B0(n16), .B1(n441), .Y(sort[20]) );
  OAI22XL U250 ( .A0(n284), .A1(n15), .B0(n16), .B1(n437), .Y(sort[23]) );
  NAND3X1 U251 ( .A(n204), .B(n194), .C(n205), .Y(n188) );
  NAND3X1 U252 ( .A(n123), .B(n170), .C(n144), .Y(n204) );
  AOI32X1 U253 ( .A0(n323), .A1(n324), .A2(n171), .B0(n191), .B1(n415), .Y(
        n205) );
  OAI22XL U254 ( .A0(n285), .A1(n15), .B0(n16), .B1(n436), .Y(sort[8]) );
  OAI22XL U255 ( .A0(n283), .A1(n15), .B0(n16), .B1(n438), .Y(sort[11]) );
  CLKBUFX3 U256 ( .A(n157), .Y(n11) );
  NOR2X1 U257 ( .A(n428), .B(state[0]), .Y(n157) );
  OAI22XL U258 ( .A0(n269), .A1(n15), .B0(n16), .B1(n452), .Y(sort[6]) );
  OAI22XL U259 ( .A0(n267), .A1(n15), .B0(n16), .B1(n454), .Y(sort[9]) );
  OAI22XL U260 ( .A0(n277), .A1(n15), .B0(n316), .B1(n444), .Y(sort[7]) );
  OAI22XL U261 ( .A0(n275), .A1(n15), .B0(n16), .B1(n446), .Y(sort[10]) );
  NAND3X1 U262 ( .A(n427), .B(n123), .C(n124), .Y(n117) );
  AOI32X1 U263 ( .A0(n119), .A1(n432), .A2(n324), .B0(n423), .B1(n415), .Y(
        n118) );
  XNOR2X1 U264 ( .A(N107), .B(N110), .Y(n214) );
  NAND3X1 U265 ( .A(n140), .B(n132), .C(n141), .Y(n125) );
  NAND3X1 U266 ( .A(n427), .B(n429), .C(n144), .Y(n140) );
  AOI32X1 U267 ( .A0(n119), .A1(n433), .A2(n323), .B0(n128), .B1(n415), .Y(
        n141) );
  XOR2X1 U268 ( .A(n288), .B(N111), .Y(n212) );
  CLKBUFX3 U269 ( .A(n316), .Y(n16) );
  NAND2X1 U270 ( .A(n121), .B(N109), .Y(n91) );
  OAI22XL U271 ( .A0(n266), .A1(n15), .B0(n16), .B1(n455), .Y(sort[12]) );
  OAI22XL U272 ( .A0(n274), .A1(n15), .B0(n16), .B1(n447), .Y(sort[13]) );
  OAI22XL U273 ( .A0(n282), .A1(n15), .B0(n16), .B1(n439), .Y(sort[14]) );
  OAI22XL U274 ( .A0(n273), .A1(n15), .B0(n16), .B1(n448), .Y(sort[16]) );
  OAI22XL U275 ( .A0(n265), .A1(n15), .B0(n16), .B1(n456), .Y(sort[15]) );
  OAI22XL U276 ( .A0(n281), .A1(changed), .B0(n16), .B1(n440), .Y(sort[17]) );
  OAI22XL U277 ( .A0(n287), .A1(n15), .B0(n316), .B1(n434), .Y(sort[2]) );
  OAI22XL U278 ( .A0(n271), .A1(changed), .B0(n16), .B1(n450), .Y(sort[0]) );
  OAI22XL U279 ( .A0(n279), .A1(changed), .B0(n16), .B1(n442), .Y(sort[1]) );
  OAI22XL U280 ( .A0(n286), .A1(n15), .B0(n316), .B1(n435), .Y(sort[5]) );
  OAI22XL U281 ( .A0(n278), .A1(n15), .B0(n316), .B1(n443), .Y(sort[4]) );
  OAI22XL U282 ( .A0(n270), .A1(n15), .B0(n16), .B1(n451), .Y(sort[3]) );
  OAI31XL U283 ( .A0(n197), .A1(n321), .A2(n70), .B0(n247), .Y(n360) );
  NOR2X1 U284 ( .A(n104), .B(n89), .Y(n247) );
  NAND2X2 U285 ( .A(n321), .B(n322), .Y(n192) );
  OAI22XL U286 ( .A0(n456), .A1(n17), .B0(n265), .B1(n19), .Y(n291) );
  OAI22XL U287 ( .A0(n454), .A1(n17), .B0(n267), .B1(n20), .Y(n293) );
  OAI22XL U288 ( .A0(n453), .A1(n17), .B0(n268), .B1(n21), .Y(n294) );
  OAI22XL U289 ( .A0(n451), .A1(n17), .B0(n270), .B1(n21), .Y(n296) );
  OAI22XL U290 ( .A0(n449), .A1(n17), .B0(n272), .B1(n21), .Y(n298) );
  OAI22XL U291 ( .A0(n446), .A1(n17), .B0(n275), .B1(n21), .Y(n301) );
  OAI22XL U292 ( .A0(n445), .A1(n18), .B0(n276), .B1(n19), .Y(n302) );
  OAI22XL U293 ( .A0(n444), .A1(n18), .B0(n277), .B1(n20), .Y(n303) );
  OAI22XL U294 ( .A0(n441), .A1(n18), .B0(n280), .B1(n21), .Y(n306) );
  OAI22XL U295 ( .A0(n440), .A1(n18), .B0(n281), .B1(n21), .Y(n307) );
  OAI22XL U296 ( .A0(n439), .A1(n18), .B0(n282), .B1(n21), .Y(n308) );
  OAI22XL U297 ( .A0(n437), .A1(n18), .B0(n284), .B1(n21), .Y(n310) );
  OAI22XL U298 ( .A0(n457), .A1(n17), .B0(n264), .B1(n19), .Y(n290) );
  OAI22XL U299 ( .A0(n455), .A1(n17), .B0(n266), .B1(n20), .Y(n292) );
  OAI22XL U300 ( .A0(n452), .A1(n17), .B0(n269), .B1(n21), .Y(n295) );
  OAI22XL U301 ( .A0(n450), .A1(n17), .B0(n271), .B1(n21), .Y(n297) );
  OAI22XL U302 ( .A0(n448), .A1(n17), .B0(n273), .B1(n19), .Y(n299) );
  OAI22XL U303 ( .A0(n447), .A1(n17), .B0(n274), .B1(n20), .Y(n300) );
  OAI22XL U304 ( .A0(n443), .A1(n18), .B0(n278), .B1(n21), .Y(n304) );
  OAI22XL U305 ( .A0(n442), .A1(n18), .B0(n279), .B1(n21), .Y(n305) );
  OAI22XL U306 ( .A0(n438), .A1(n18), .B0(n283), .B1(n21), .Y(n309) );
  OAI22XL U307 ( .A0(n436), .A1(n18), .B0(n285), .B1(n21), .Y(n311) );
  OAI22XL U308 ( .A0(n435), .A1(n18), .B0(n286), .B1(n21), .Y(n312) );
  OAI22XL U309 ( .A0(n434), .A1(n18), .B0(n287), .B1(n21), .Y(n313) );
  NAND2X1 U310 ( .A(n246), .B(n417), .Y(n359) );
  XNOR2X1 U311 ( .A(n322), .B(n402), .Y(n246) );
  NOR2X1 U312 ( .A(n408), .B(state[1]), .Y(n79) );
  NAND4BX1 U313 ( .AN(n121), .B(n233), .C(n129), .D(n234), .Y(n65) );
  NAND2X1 U314 ( .A(N111), .B(n192), .Y(n233) );
  CLKINVX1 U315 ( .A(n323), .Y(n432) );
  CLKINVX1 U316 ( .A(n324), .Y(n433) );
  OAI32X1 U317 ( .A0(n4), .A1(next), .A2(n317), .B0(n318), .B1(n430), .Y(n354)
         );
  OAI22XL U318 ( .A0(n289), .A1(n79), .B0(n394), .B1(n80), .Y(n314) );
  NOR2X1 U319 ( .A(n238), .B(n57), .Y(n36) );
  NOR2X1 U320 ( .A(n238), .B(n39), .Y(n35) );
  NOR2X1 U321 ( .A(n39), .B(N122), .Y(n33) );
  NOR2X1 U322 ( .A(n57), .B(N122), .Y(n32) );
  AO22X1 U323 ( .A0(\nextline[5][0] ), .A1(n33), .B0(\nextline[4][0] ), .B1(
        n32), .Y(n23) );
  AOI221XL U324 ( .A0(\nextline[6][0] ), .A1(n36), .B0(\nextline[7][0] ), .B1(
        n35), .C0(n23), .Y(n26) );
  AO22X1 U325 ( .A0(\nextline[1][0] ), .A1(n33), .B0(\nextline[0][0] ), .B1(
        n32), .Y(n24) );
  AOI221XL U326 ( .A0(\nextline[2][0] ), .A1(n36), .B0(\nextline[3][0] ), .B1(
        n35), .C0(n24), .Y(n25) );
  OAI22XL U327 ( .A0(n158), .A1(n26), .B0(n10), .B1(n25), .Y(N138) );
  AO22X1 U328 ( .A0(\nextline[5][1] ), .A1(n33), .B0(\nextline[4][1] ), .B1(
        n32), .Y(n27) );
  AOI221XL U329 ( .A0(\nextline[6][1] ), .A1(n36), .B0(\nextline[7][1] ), .B1(
        n35), .C0(n27), .Y(n30) );
  AO22X1 U330 ( .A0(\nextline[1][1] ), .A1(n33), .B0(\nextline[0][1] ), .B1(
        n32), .Y(n28) );
  AOI221XL U331 ( .A0(\nextline[2][1] ), .A1(n36), .B0(\nextline[3][1] ), .B1(
        n35), .C0(n28), .Y(n29) );
  OAI22XL U332 ( .A0(n391), .A1(n30), .B0(n10), .B1(n29), .Y(N137) );
  AO22X1 U333 ( .A0(\nextline[5][2] ), .A1(n33), .B0(\nextline[4][2] ), .B1(
        n32), .Y(n31) );
  AOI221XL U334 ( .A0(\nextline[6][2] ), .A1(n36), .B0(\nextline[7][2] ), .B1(
        n35), .C0(n31), .Y(n38) );
  AO22X1 U335 ( .A0(\nextline[1][2] ), .A1(n33), .B0(\nextline[0][2] ), .B1(
        n32), .Y(n34) );
  AOI221XL U336 ( .A0(\nextline[2][2] ), .A1(n36), .B0(\nextline[3][2] ), .B1(
        n35), .C0(n34), .Y(n37) );
  NOR2X1 U337 ( .A(n325), .B(N106), .Y(n53) );
  NOR2X1 U338 ( .A(n325), .B(n57), .Y(n52) );
  NOR2X1 U339 ( .A(n57), .B(N107), .Y(n50) );
  NOR2X1 U340 ( .A(N106), .B(N107), .Y(n49) );
  AO22X1 U341 ( .A0(\nextline[5][0] ), .A1(n50), .B0(\nextline[4][0] ), .B1(
        n49), .Y(n40) );
  AOI221XL U342 ( .A0(\nextline[6][0] ), .A1(n53), .B0(\nextline[7][0] ), .B1(
        n52), .C0(n40), .Y(n43) );
  AO22X1 U343 ( .A0(\nextline[1][0] ), .A1(n50), .B0(\nextline[0][0] ), .B1(
        n49), .Y(n41) );
  AOI221XL U344 ( .A0(\nextline[2][0] ), .A1(n53), .B0(\nextline[3][0] ), .B1(
        n52), .C0(n41), .Y(n42) );
  AO22X1 U345 ( .A0(\nextline[5][1] ), .A1(n50), .B0(\nextline[4][1] ), .B1(
        n49), .Y(n44) );
  AOI221XL U346 ( .A0(\nextline[6][1] ), .A1(n53), .B0(\nextline[7][1] ), .B1(
        n52), .C0(n44), .Y(n47) );
  AO22X1 U347 ( .A0(\nextline[1][1] ), .A1(n50), .B0(\nextline[0][1] ), .B1(
        n49), .Y(n45) );
  AOI221XL U348 ( .A0(\nextline[2][1] ), .A1(n53), .B0(\nextline[3][1] ), .B1(
        n52), .C0(n45), .Y(n46) );
  AO22X1 U349 ( .A0(\nextline[5][2] ), .A1(n50), .B0(\nextline[4][2] ), .B1(
        n49), .Y(n48) );
  AOI221XL U350 ( .A0(\nextline[6][2] ), .A1(n53), .B0(\nextline[7][2] ), .B1(
        n52), .C0(n48), .Y(n55) );
  AO22X1 U351 ( .A0(\nextline[1][2] ), .A1(n50), .B0(\nextline[0][2] ), .B1(
        n49), .Y(n51) );
  AOI221XL U352 ( .A0(\nextline[2][2] ), .A1(n53), .B0(\nextline[3][2] ), .B1(
        n52), .C0(n51), .Y(n54) );
  NOR2X1 U353 ( .A(n92), .B(n87), .Y(n76) );
  NOR2X1 U354 ( .A(n87), .B(N110), .Y(n72) );
  NOR2X1 U355 ( .A(N109), .B(N110), .Y(n71) );
  AO22X1 U356 ( .A0(\nextline[5][0] ), .A1(n72), .B0(\nextline[4][0] ), .B1(
        n71), .Y(n58) );
  AOI221XL U357 ( .A0(\nextline[6][0] ), .A1(n82), .B0(\nextline[7][0] ), .B1(
        n76), .C0(n58), .Y(n61) );
  AO22X1 U358 ( .A0(\nextline[1][0] ), .A1(n72), .B0(\nextline[0][0] ), .B1(
        n71), .Y(n59) );
  AOI221XL U359 ( .A0(\nextline[2][0] ), .A1(n82), .B0(\nextline[3][0] ), .B1(
        n76), .C0(n59), .Y(n60) );
  AO22X1 U360 ( .A0(\nextline[5][1] ), .A1(n72), .B0(\nextline[4][1] ), .B1(
        n71), .Y(n62) );
  AOI221XL U361 ( .A0(\nextline[6][1] ), .A1(n82), .B0(\nextline[7][1] ), .B1(
        n76), .C0(n62), .Y(n67) );
  AO22X1 U362 ( .A0(\nextline[1][1] ), .A1(n72), .B0(\nextline[0][1] ), .B1(
        n71), .Y(n64) );
  AOI221XL U363 ( .A0(\nextline[2][1] ), .A1(n82), .B0(\nextline[3][1] ), .B1(
        n76), .C0(n64), .Y(n66) );
  AO22X1 U364 ( .A0(\nextline[5][2] ), .A1(n72), .B0(\nextline[4][2] ), .B1(
        n71), .Y(n68) );
  AOI221XL U365 ( .A0(\nextline[6][2] ), .A1(n82), .B0(\nextline[7][2] ), .B1(
        n76), .C0(n68), .Y(n85) );
  AO22X1 U366 ( .A0(\nextline[1][2] ), .A1(n72), .B0(\nextline[0][2] ), .B1(
        n71), .Y(n75) );
  AOI221XL U367 ( .A0(\nextline[2][2] ), .A1(n82), .B0(\nextline[3][2] ), .B1(
        n76), .C0(n75), .Y(n83) );
  NOR2X1 U368 ( .A(n154), .B(n57), .Y(n143) );
  NOR2X1 U369 ( .A(n154), .B(n161), .Y(n142) );
  NOR2X1 U370 ( .A(n161), .B(N122), .Y(n135) );
  NOR2X1 U371 ( .A(n57), .B(N122), .Y(n131) );
  AO22X1 U372 ( .A0(\nextline[5][0] ), .A1(n135), .B0(\nextline[4][0] ), .B1(
        n131), .Y(n96) );
  AOI221XL U373 ( .A0(\nextline[6][0] ), .A1(n143), .B0(\nextline[7][0] ), 
        .B1(n142), .C0(n96), .Y(n107) );
  AO22X1 U374 ( .A0(\nextline[1][0] ), .A1(n135), .B0(\nextline[0][0] ), .B1(
        n131), .Y(n98) );
  AOI221XL U375 ( .A0(\nextline[2][0] ), .A1(n143), .B0(\nextline[3][0] ), 
        .B1(n142), .C0(n98), .Y(n101) );
  OAI22XL U376 ( .A0(n158), .A1(n107), .B0(n10), .B1(n101), .Y(N166) );
  AO22X1 U377 ( .A0(\nextline[5][1] ), .A1(n135), .B0(\nextline[4][1] ), .B1(
        n131), .Y(n113) );
  AOI221XL U378 ( .A0(\nextline[6][1] ), .A1(n143), .B0(\nextline[7][1] ), 
        .B1(n142), .C0(n113), .Y(n122) );
  AO22X1 U379 ( .A0(\nextline[1][1] ), .A1(n135), .B0(\nextline[0][1] ), .B1(
        n131), .Y(n115) );
  AOI221XL U380 ( .A0(\nextline[2][1] ), .A1(n143), .B0(\nextline[3][1] ), 
        .B1(n142), .C0(n115), .Y(n120) );
  OAI22XL U381 ( .A0(n158), .A1(n122), .B0(n10), .B1(n120), .Y(N165) );
  AO22X1 U382 ( .A0(\nextline[5][2] ), .A1(n135), .B0(\nextline[4][2] ), .B1(
        n131), .Y(n126) );
  AOI221XL U383 ( .A0(\nextline[6][2] ), .A1(n143), .B0(\nextline[7][2] ), 
        .B1(n142), .C0(n126), .Y(n151) );
  AO22X1 U384 ( .A0(\nextline[1][2] ), .A1(n135), .B0(\nextline[0][2] ), .B1(
        n131), .Y(n139) );
  AOI221XL U385 ( .A0(\nextline[2][2] ), .A1(n143), .B0(\nextline[3][2] ), 
        .B1(n142), .C0(n139), .Y(n148) );
  OAI22XL U386 ( .A0(n151), .A1(n158), .B0(n10), .B1(n148), .Y(N164) );
  NOR2X1 U387 ( .A(n252), .B(N115), .Y(n237) );
  NOR2X1 U388 ( .A(n252), .B(n248), .Y(n236) );
  NOR2X1 U389 ( .A(n248), .B(N116), .Y(n231) );
  NOR2X1 U390 ( .A(N115), .B(N116), .Y(n230) );
  AO22X1 U391 ( .A0(\nextline[5][0] ), .A1(n231), .B0(\nextline[4][0] ), .B1(
        n230), .Y(n165) );
  AOI221XL U392 ( .A0(\nextline[6][0] ), .A1(n237), .B0(\nextline[7][0] ), 
        .B1(n236), .C0(n165), .Y(n189) );
  AO22X1 U393 ( .A0(\nextline[1][0] ), .A1(n231), .B0(\nextline[0][0] ), .B1(
        n230), .Y(n175) );
  AOI221XL U394 ( .A0(\nextline[2][0] ), .A1(n237), .B0(\nextline[3][0] ), 
        .B1(n236), .C0(n175), .Y(n183) );
  AO22X1 U395 ( .A0(\nextline[5][1] ), .A1(n231), .B0(\nextline[4][1] ), .B1(
        n230), .Y(n215) );
  AOI221XL U396 ( .A0(\nextline[6][1] ), .A1(n237), .B0(\nextline[7][1] ), 
        .B1(n236), .C0(n215), .Y(n228) );
  AO22X1 U397 ( .A0(\nextline[1][1] ), .A1(n231), .B0(\nextline[0][1] ), .B1(
        n230), .Y(n216) );
  AOI221XL U398 ( .A0(\nextline[2][1] ), .A1(n237), .B0(\nextline[3][1] ), 
        .B1(n236), .C0(n216), .Y(n224) );
  AO22X1 U399 ( .A0(\nextline[5][2] ), .A1(n231), .B0(\nextline[4][2] ), .B1(
        n230), .Y(n229) );
  AOI221XL U400 ( .A0(\nextline[6][2] ), .A1(n237), .B0(\nextline[7][2] ), 
        .B1(n236), .C0(n229), .Y(n244) );
  AO22X1 U401 ( .A0(\nextline[1][2] ), .A1(n231), .B0(\nextline[0][2] ), .B1(
        n230), .Y(n235) );
  AOI221XL U402 ( .A0(\nextline[2][2] ), .A1(n237), .B0(\nextline[3][2] ), 
        .B1(n236), .C0(n235), .Y(n240) );
  NOR2X1 U403 ( .A(n374), .B(N118), .Y(n370) );
  NOR2X1 U404 ( .A(n374), .B(n373), .Y(n369) );
  NOR2X1 U405 ( .A(n373), .B(N119), .Y(n367) );
  NOR2X1 U406 ( .A(N118), .B(N119), .Y(n366) );
  AO22X1 U407 ( .A0(\nextline[5][0] ), .A1(n367), .B0(\nextline[4][0] ), .B1(
        n366), .Y(n255) );
  AOI221XL U408 ( .A0(\nextline[6][0] ), .A1(n370), .B0(\nextline[7][0] ), 
        .B1(n369), .C0(n255), .Y(n355) );
  AO22X1 U409 ( .A0(\nextline[1][0] ), .A1(n367), .B0(\nextline[0][0] ), .B1(
        n366), .Y(n315) );
  AOI221XL U410 ( .A0(\nextline[2][0] ), .A1(n370), .B0(\nextline[3][0] ), 
        .B1(n369), .C0(n315), .Y(n353) );
  AO22X1 U411 ( .A0(\nextline[5][1] ), .A1(n367), .B0(\nextline[4][1] ), .B1(
        n366), .Y(n361) );
  AOI221XL U412 ( .A0(\nextline[6][1] ), .A1(n370), .B0(\nextline[7][1] ), 
        .B1(n369), .C0(n361), .Y(n364) );
  AO22X1 U413 ( .A0(\nextline[1][1] ), .A1(n367), .B0(\nextline[0][1] ), .B1(
        n366), .Y(n362) );
  AOI221XL U414 ( .A0(\nextline[2][1] ), .A1(n370), .B0(\nextline[3][1] ), 
        .B1(n369), .C0(n362), .Y(n363) );
  AO22X1 U415 ( .A0(\nextline[5][2] ), .A1(n367), .B0(\nextline[4][2] ), .B1(
        n366), .Y(n365) );
  AOI221XL U416 ( .A0(\nextline[6][2] ), .A1(n370), .B0(\nextline[7][2] ), 
        .B1(n369), .C0(n365), .Y(n372) );
  AO22X1 U417 ( .A0(\nextline[1][2] ), .A1(n367), .B0(\nextline[0][2] ), .B1(
        n366), .Y(n368) );
  AOI221XL U418 ( .A0(\nextline[2][2] ), .A1(n370), .B0(\nextline[3][2] ), 
        .B1(n369), .C0(n368), .Y(n371) );
  NOR2X1 U419 ( .A(n154), .B(n57), .Y(n388) );
  NOR2X1 U420 ( .A(n154), .B(n392), .Y(n387) );
  NOR2X1 U421 ( .A(n392), .B(N122), .Y(n385) );
  NOR2X1 U422 ( .A(n57), .B(N122), .Y(n384) );
  AO22X1 U423 ( .A0(\nextline[5][0] ), .A1(n385), .B0(\nextline[4][0] ), .B1(
        n384), .Y(n375) );
  AOI221XL U424 ( .A0(\nextline[6][0] ), .A1(n388), .B0(\nextline[7][0] ), 
        .B1(n387), .C0(n375), .Y(n378) );
  AO22X1 U425 ( .A0(\nextline[1][0] ), .A1(n385), .B0(\nextline[0][0] ), .B1(
        n384), .Y(n376) );
  AOI221XL U426 ( .A0(\nextline[2][0] ), .A1(n388), .B0(\nextline[3][0] ), 
        .B1(n387), .C0(n376), .Y(n377) );
  OAI22XL U427 ( .A0(n391), .A1(n378), .B0(n10), .B1(n377), .Y(N381) );
  AO22X1 U428 ( .A0(\nextline[5][1] ), .A1(n385), .B0(\nextline[4][1] ), .B1(
        n384), .Y(n379) );
  AOI221XL U429 ( .A0(\nextline[6][1] ), .A1(n388), .B0(\nextline[7][1] ), 
        .B1(n387), .C0(n379), .Y(n382) );
  AO22X1 U430 ( .A0(\nextline[1][1] ), .A1(n385), .B0(\nextline[0][1] ), .B1(
        n384), .Y(n380) );
  AOI221XL U431 ( .A0(\nextline[2][1] ), .A1(n388), .B0(\nextline[3][1] ), 
        .B1(n387), .C0(n380), .Y(n381) );
  AO22X1 U432 ( .A0(\nextline[5][2] ), .A1(n385), .B0(\nextline[4][2] ), .B1(
        n384), .Y(n383) );
  AOI221XL U433 ( .A0(\nextline[6][2] ), .A1(n388), .B0(\nextline[7][2] ), 
        .B1(n387), .C0(n383), .Y(n390) );
  AO22X1 U434 ( .A0(\nextline[1][2] ), .A1(n385), .B0(\nextline[0][2] ), .B1(
        n384), .Y(n386) );
  AOI221XL U435 ( .A0(\nextline[2][2] ), .A1(n388), .B0(\nextline[3][2] ), 
        .B1(n387), .C0(n386), .Y(n389) );
  OAI22XL U436 ( .A0(n390), .A1(n391), .B0(n10), .B1(n389), .Y(N379) );
endmodule


module JAM_DW01_add_0_DW01_add_1 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16
;
  wire   [9:1] carry;

  ADDFHX4 U1_1 ( .A(A[1]), .B(B[1]), .CI(n2), .CO(carry[2]), .S(SUM[1]) );
  ADDFHX4 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFHX4 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFHX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  XOR3X1 U1 ( .A(n1), .B(A[2]), .C(B[2]), .Y(SUM[2]) );
  NAND2X1 U2 ( .A(n5), .B(n6), .Y(SUM[8]) );
  NAND2X2 U3 ( .A(B[2]), .B(carry[2]), .Y(n12) );
  NAND2X6 U4 ( .A(A[2]), .B(n1), .Y(n13) );
  NAND3X4 U5 ( .A(n12), .B(n13), .C(n14), .Y(carry[3]) );
  XOR2X1 U6 ( .A(carry[5]), .B(n8), .Y(SUM[5]) );
  CLKAND2X12 U7 ( .A(A[7]), .B(carry[7]), .Y(n15) );
  NAND2XL U8 ( .A(n3), .B(n15), .Y(n6) );
  ADDFHX4 U9 ( .A(A[1]), .B(B[1]), .CI(n7), .CO(n1) );
  CLKAND2X12 U10 ( .A(B[0]), .B(A[0]), .Y(n2) );
  XOR2X1 U11 ( .A(A[7]), .B(carry[7]), .Y(SUM[7]) );
  NAND3X2 U12 ( .A(n9), .B(n10), .C(n11), .Y(carry[6]) );
  NAND2X1 U13 ( .A(A[8]), .B(n4), .Y(n5) );
  CLKINVX1 U14 ( .A(n15), .Y(n4) );
  INVXL U15 ( .A(A[8]), .Y(n3) );
  NAND2X1 U16 ( .A(B[5]), .B(carry[5]), .Y(n9) );
  NAND2X1 U17 ( .A(A[5]), .B(carry[5]), .Y(n10) );
  NAND2X1 U18 ( .A(A[5]), .B(B[5]), .Y(n11) );
  CLKAND2X12 U19 ( .A(B[0]), .B(A[0]), .Y(n7) );
  XOR2XL U20 ( .A(B[5]), .B(A[5]), .Y(n8) );
  NAND2XL U21 ( .A(A[8]), .B(n15), .Y(n16) );
  XOR2XL U22 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  NAND2X1 U23 ( .A(A[2]), .B(B[2]), .Y(n14) );
  XNOR2X1 U24 ( .A(A[9]), .B(n16), .Y(SUM[9]) );
endmodule


module JAM ( CLK, RST, W, J, Cost, MatchCount, MinCost, Valid );
  output [2:0] W;
  output [2:0] J;
  input [6:0] Cost;
  output [3:0] MatchCount;
  output [9:0] MinCost;
  input CLK, RST;
  output Valid;
  wire   N22, N23, N24, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, next, sort_done, finish, \line[7][2] , \line[7][1] ,
         \line[7][0] , \line[6][2] , \line[6][1] , \line[6][0] , \line[5][2] ,
         \line[5][1] , \line[5][0] , \line[4][2] , \line[4][1] , \line[4][0] ,
         \line[3][2] , \line[3][1] , \line[3][0] , \line[2][2] , \line[2][1] ,
         \line[2][0] , \line[1][2] , \line[1][1] , \line[1][0] , \line[0][2] ,
         \line[0][1] , \line[0][0] , N42, N43, N44, N45, N46, N47, N48, N49,
         N50, N51, N52, \count[3] , N147, N148, N174, N175, N176, N179, N180,
         N181, N182, N183, N184, n22, n23, n25, n26, n27, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n110, n117, n119, n121, n123, n125, n127, n129, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235;
  wire   [2:0] state;
  wire   [2:0] nextstate;
  wire   [9:0] cur_cost;

  sort sort ( .CLK(CLK), .RST(RST), .next(next), .changed(sort_done), .finish(
        finish), .sort({\line[0][2] , \line[0][1] , \line[0][0] , \line[1][2] , 
        \line[1][1] , \line[1][0] , \line[2][2] , \line[2][1] , \line[2][0] , 
        \line[3][2] , \line[3][1] , \line[3][0] , \line[4][2] , \line[4][1] , 
        \line[4][0] , \line[5][2] , \line[5][1] , \line[5][0] , \line[6][2] , 
        \line[6][1] , \line[6][0] , \line[7][2] , \line[7][1] , \line[7][0] })
         );
  JAM_DW01_add_0_DW01_add_1 r398 ( .A(cur_cost), .B({1'b0, 1'b0, 1'b0, Cost}), 
        .CI(1'b0), .SUM({N51, N50, N49, N48, N47, N46, N45, N44, N43, N42}) );
  DFFRX1 \count_reg[3]  ( .D(n80), .CK(CLK), .RN(n157), .Q(\count[3] ), .QN(
        n22) );
  DFFRX1 \count_reg[2]  ( .D(n81), .CK(CLK), .RN(n156), .Q(N24), .QN(n23) );
  DFFRX1 \count_reg[1]  ( .D(n83), .CK(CLK), .RN(n156), .Q(N23), .QN(n25) );
  DFFRX1 \cur_cost_reg[9]  ( .D(n84), .CK(CLK), .RN(n230), .Q(cur_cost[9]), 
        .QN(n27) );
  DFFRX1 \cur_cost_reg[7]  ( .D(n88), .CK(CLK), .RN(n157), .Q(cur_cost[7]), 
        .QN(n31) );
  DFFRX1 \cur_cost_reg[6]  ( .D(n90), .CK(CLK), .RN(n157), .Q(cur_cost[6]), 
        .QN(n32) );
  DFFRX1 \cur_cost_reg[4]  ( .D(n94), .CK(CLK), .RN(n157), .Q(cur_cost[4]), 
        .QN(n34) );
  DFFRX1 \cur_cost_reg[3]  ( .D(n96), .CK(CLK), .RN(n157), .Q(cur_cost[3]), 
        .QN(n35) );
  DFFRX1 \cur_cost_reg[1]  ( .D(n103), .CK(CLK), .RN(n156), .Q(cur_cost[1]), 
        .QN(n37) );
  DFFRX1 \cur_cost_reg[0]  ( .D(n100), .CK(CLK), .RN(n157), .Q(cur_cost[0]), 
        .QN(n38) );
  DFFRX1 \state_reg[1]  ( .D(nextstate[1]), .CK(CLK), .RN(n156), .Q(state[1]), 
        .QN(n45) );
  DFFRX1 \cur_cost_reg[2]  ( .D(n98), .CK(CLK), .RN(n157), .Q(cur_cost[2]), 
        .QN(n36) );
  DFFRX1 \cur_cost_reg[5]  ( .D(n92), .CK(CLK), .RN(n157), .Q(cur_cost[5]), 
        .QN(n33) );
  DFFRX2 \count_reg[0]  ( .D(n82), .CK(CLK), .RN(n157), .Q(N22), .QN(n26) );
  DFFRX1 \cur_cost_reg[8]  ( .D(n86), .CK(CLK), .RN(n230), .Q(cur_cost[8]), 
        .QN(n30) );
  DFFRX1 \state_reg[0]  ( .D(nextstate[0]), .CK(CLK), .RN(n156), .Q(state[0]), 
        .QN(n46) );
  DFFRX1 \MatchCount_reg[0]  ( .D(n79), .CK(CLK), .RN(n156), .Q(n239), .QN(n42) );
  DFFRX1 \W_reg[2]  ( .D(N181), .CK(CLK), .RN(n156), .QN(n127) );
  DFFRX1 \W_reg[0]  ( .D(N179), .CK(CLK), .RN(n157), .QN(n125) );
  DFFRX1 \W_reg[1]  ( .D(N180), .CK(CLK), .RN(n157), .QN(n123) );
  DFFRX1 \J_reg[0]  ( .D(N182), .CK(CLK), .RN(n157), .QN(n121) );
  DFFRX1 \J_reg[1]  ( .D(N183), .CK(CLK), .RN(n156), .QN(n119) );
  DFFRX1 \J_reg[2]  ( .D(N184), .CK(CLK), .RN(n156), .QN(n117) );
  DFFRX1 \MatchCount_reg[3]  ( .D(n76), .CK(CLK), .RN(n156), .Q(n236), .QN(n39) );
  DFFSX1 \MinCost_reg[9]  ( .D(n101), .CK(CLK), .SN(n230), .Q(n240), .QN(n196)
         );
  DFFSX1 \MinCost_reg[7]  ( .D(n87), .CK(CLK), .SN(n230), .Q(n242), .QN(n224)
         );
  DFFSX1 \MinCost_reg[6]  ( .D(n89), .CK(CLK), .SN(n230), .Q(n243), .QN(n194)
         );
  DFFSX1 \MinCost_reg[4]  ( .D(n93), .CK(CLK), .SN(n230), .Q(n245), .QN(n195)
         );
  DFFRXL \state_reg[2]  ( .D(nextstate[2]), .CK(CLK), .RN(n230), .Q(state[2])
         );
  DFFSXL \MinCost_reg[3]  ( .D(n95), .CK(CLK), .SN(n230), .Q(n246), .QN(n226)
         );
  DFFRHQX1 Valid_reg ( .D(finish), .CK(CLK), .RN(n230), .Q(n129) );
  DFFSX1 \MinCost_reg[0]  ( .D(n99), .CK(CLK), .SN(n230), .QN(n104) );
  DFFSX1 \MinCost_reg[1]  ( .D(n102), .CK(CLK), .SN(n230), .QN(n105) );
  DFFSX1 \MinCost_reg[8]  ( .D(n85), .CK(CLK), .SN(n157), .Q(n241), .QN(n143)
         );
  DFFRX1 \MatchCount_reg[2]  ( .D(n77), .CK(CLK), .RN(n156), .Q(n237), .QN(n40) );
  DFFSX1 \MinCost_reg[5]  ( .D(n91), .CK(CLK), .SN(n156), .Q(n244), .QN(n151)
         );
  DFFSX1 \MinCost_reg[2]  ( .D(n97), .CK(CLK), .SN(n157), .Q(n247), .QN(n146)
         );
  DFFRX1 \MatchCount_reg[1]  ( .D(n78), .CK(CLK), .RN(n156), .Q(n238), .QN(n41) );
  NOR2X1 U81 ( .A(N51), .B(n196), .Y(n138) );
  OAI222X2 U82 ( .A0(MinCost[8]), .A1(n200), .B0(MinCost[8]), .B1(n175), .C0(
        n200), .C1(n175), .Y(n176) );
  INVX3 U83 ( .A(N50), .Y(n200) );
  NAND2X2 U84 ( .A(n147), .B(n190), .Y(n192) );
  OAI21XL U85 ( .A0(n189), .A1(n188), .B0(n187), .Y(n190) );
  OAI222XL U86 ( .A0(n213), .A1(n212), .B0(cur_cost[6]), .B1(n225), .C0(
        cur_cost[7]), .C1(n224), .Y(n214) );
  OAI21XL U87 ( .A0(n54), .A1(n58), .B0(n155), .Y(n61) );
  AND2X4 U88 ( .A(n148), .B(n149), .Y(n64) );
  INVX16 U89 ( .A(n104), .Y(MinCost[0]) );
  INVX16 U90 ( .A(n110), .Y(MinCost[3]) );
  CLKINVX1 U91 ( .A(n246), .Y(n110) );
  INVX16 U92 ( .A(n105), .Y(MinCost[1]) );
  INVX3 U93 ( .A(RST), .Y(n230) );
  INVXL U94 ( .A(n129), .Y(n106) );
  INVX12 U95 ( .A(n106), .Y(Valid) );
  NOR2BX1 U96 ( .AN(n242), .B(N49), .Y(n177) );
  NAND2BX1 U97 ( .AN(n242), .B(N49), .Y(n175) );
  BUFX12 U98 ( .A(n236), .Y(MatchCount[3]) );
  OAI22X1 U99 ( .A0(cur_cost[9]), .A1(n227), .B0(n228), .B1(n216), .Y(N147) );
  INVX12 U100 ( .A(n41), .Y(MatchCount[1]) );
  INVX12 U101 ( .A(n146), .Y(MinCost[2]) );
  INVX12 U102 ( .A(n224), .Y(MinCost[7]) );
  AO21XL U103 ( .A0(n37), .A1(n206), .B0(MinCost[1]), .Y(n205) );
  INVX16 U104 ( .A(n151), .Y(MinCost[5]) );
  INVX12 U105 ( .A(n117), .Y(J[2]) );
  INVX12 U106 ( .A(n119), .Y(J[1]) );
  INVX12 U107 ( .A(n121), .Y(J[0]) );
  INVX12 U108 ( .A(n123), .Y(W[1]) );
  INVX12 U109 ( .A(n125), .Y(W[0]) );
  INVX12 U110 ( .A(n127), .Y(W[2]) );
  BUFX12 U111 ( .A(n239), .Y(MatchCount[0]) );
  INVX12 U112 ( .A(n40), .Y(MatchCount[2]) );
  INVX12 U113 ( .A(n196), .Y(MinCost[9]) );
  INVX12 U114 ( .A(n194), .Y(MinCost[6]) );
  NOR2BXL U115 ( .AN(MinCost[0]), .B(cur_cost[0]), .Y(n206) );
  INVX12 U116 ( .A(n195), .Y(MinCost[4]) );
  NOR2XL U117 ( .A(n34), .B(n245), .Y(n219) );
  INVX16 U118 ( .A(n143), .Y(MinCost[8]) );
  NOR2BXL U119 ( .AN(cur_cost[3]), .B(MinCost[3]), .Y(n220) );
  AOI32XL U120 ( .A0(n215), .A1(n223), .A2(n214), .B0(n241), .B1(n30), .Y(n216) );
  AO22X1 U121 ( .A0(n142), .A1(N50), .B0(n143), .B1(n142), .Y(n191) );
  CLKINVX1 U122 ( .A(n177), .Y(n142) );
  NOR2X1 U123 ( .A(N51), .B(n176), .Y(n136) );
  NOR2X1 U124 ( .A(n196), .B(n176), .Y(n137) );
  OR3X6 U125 ( .A(n136), .B(n137), .C(n138), .Y(n193) );
  NAND2X8 U126 ( .A(n193), .B(n192), .Y(N52) );
  AND2XL U127 ( .A(n244), .B(n33), .Y(n139) );
  AND2XL U128 ( .A(n245), .B(n34), .Y(n140) );
  AND2X2 U129 ( .A(n209), .B(n208), .Y(n141) );
  NOR3X1 U130 ( .A(n139), .B(n140), .C(n141), .Y(n213) );
  OAI21XL U131 ( .A0(n49), .A1(n235), .B0(n50), .Y(nextstate[1]) );
  AOI221X1 U132 ( .A0(N45), .A1(n197), .B0(n183), .B1(n182), .C0(n181), .Y(
        n189) );
  OAI222X1 U133 ( .A0(N48), .A1(n186), .B0(n194), .B1(n186), .C0(N48), .C1(
        n194), .Y(n187) );
  CLKINVX1 U134 ( .A(N47), .Y(n199) );
  NOR2X1 U135 ( .A(n220), .B(n219), .Y(n209) );
  NAND2BX1 U136 ( .AN(n211), .B(n210), .Y(n212) );
  OR2X1 U137 ( .A(n144), .B(n145), .Y(n82) );
  NOR2X1 U138 ( .A(n26), .B(n66), .Y(n144) );
  NOR2XL U139 ( .A(N22), .B(n64), .Y(n145) );
  INVX1 U140 ( .A(n150), .Y(n186) );
  AND2X2 U141 ( .A(N46), .B(n195), .Y(n152) );
  OAI22XL U142 ( .A0(n64), .A1(n65), .B0(n22), .B1(n66), .Y(n80) );
  NAND2X1 U143 ( .A(cur_cost[2]), .B(n146), .Y(n217) );
  NOR2XL U144 ( .A(n51), .B(N52), .Y(n49) );
  NOR2XL U145 ( .A(n33), .B(n244), .Y(n211) );
  NOR2XL U146 ( .A(n30), .B(n241), .Y(n204) );
  OA21X2 U147 ( .A0(N51), .A1(n196), .B0(n191), .Y(n147) );
  INVX1 U148 ( .A(n57), .Y(n231) );
  NAND3BXL U149 ( .AN(N147), .B(n218), .C(n217), .Y(n221) );
  NOR2BXL U150 ( .AN(n247), .B(N44), .Y(n179) );
  NAND2BXL U151 ( .AN(n247), .B(N44), .Y(n180) );
  AOI2BB1XL U152 ( .A0N(n105), .A1N(N43), .B0(MinCost[0]), .Y(n178) );
  NOR2BXL U153 ( .AN(cur_cost[0]), .B(MinCost[0]), .Y(n201) );
  OAI21XL U154 ( .A0(sort_done), .A1(n52), .B0(n54), .Y(next) );
  OA21XL U155 ( .A0(n234), .A1(n64), .B0(n66), .Y(n69) );
  OAI32X1 U156 ( .A0(n68), .A1(N24), .A2(n64), .B0(n69), .B1(n23), .Y(n81) );
  NAND2X1 U157 ( .A(state[0]), .B(n75), .Y(n47) );
  OA21XL U158 ( .A0(N22), .A1(n64), .B0(n66), .Y(n70) );
  OAI32X1 U159 ( .A0(n26), .A1(N23), .A2(n64), .B0(n70), .B1(n25), .Y(n83) );
  OR2X1 U160 ( .A(N52), .B(n47), .Y(n148) );
  OR2X1 U161 ( .A(n71), .B(n229), .Y(n149) );
  AOI222X4 U162 ( .A0(n151), .A1(N47), .B0(n151), .B1(n152), .C0(N47), .C1(
        n152), .Y(n150) );
  CLKINVX1 U163 ( .A(n61), .Y(n232) );
  NOR2BX1 U164 ( .AN(n48), .B(N52), .Y(n51) );
  OAI2BB2XL U165 ( .B0(n52), .B1(n229), .A0N(n233), .A1N(n51), .Y(nextstate[0]) );
  NAND2BX1 U166 ( .AN(N147), .B(N148), .Y(n58) );
  NOR3X1 U167 ( .A(n47), .B(N52), .C(n48), .Y(nextstate[2]) );
  CLKINVX1 U168 ( .A(N45), .Y(n198) );
  CLKBUFX3 U169 ( .A(n63), .Y(n155) );
  NAND2BXL U170 ( .AN(n54), .B(N147), .Y(n63) );
  CLKINVX1 U171 ( .A(n180), .Y(n197) );
  AND2X2 U172 ( .A(n52), .B(n54), .Y(n71) );
  CLKINVX1 U173 ( .A(n47), .Y(n233) );
  CLKBUFX3 U174 ( .A(n73), .Y(n154) );
  NOR2BX1 U175 ( .AN(n153), .B(n47), .Y(n73) );
  NAND2X1 U176 ( .A(n71), .B(n47), .Y(n66) );
  INVX3 U177 ( .A(n75), .Y(n235) );
  CLKBUFX3 U178 ( .A(n230), .Y(n157) );
  CLKBUFX3 U179 ( .A(n230), .Y(n156) );
  CLKINVX1 U180 ( .A(n68), .Y(n234) );
  XNOR2X1 U181 ( .A(\count[3] ), .B(n67), .Y(n65) );
  NOR2X1 U182 ( .A(n68), .B(n23), .Y(n67) );
  AO21X1 U183 ( .A0(state[1]), .A1(state[2]), .B0(state[0]), .Y(n50) );
  CLKINVX1 U184 ( .A(n218), .Y(n228) );
  CLKINVX1 U185 ( .A(n204), .Y(n223) );
  AOI2BB1XL U186 ( .A0N(MatchCount[0]), .A1N(n58), .B0(n232), .Y(n60) );
  OAI21XL U187 ( .A0(n55), .A1(n39), .B0(n56), .Y(n76) );
  NAND4XL U188 ( .A(n237), .B(n238), .C(n57), .D(n39), .Y(n56) );
  OA21XL U189 ( .A0(n237), .A1(n58), .B0(n59), .Y(n55) );
  OA21XL U190 ( .A0(n238), .A1(n58), .B0(n60), .Y(n59) );
  OAI32XL U191 ( .A0(n41), .A1(n237), .A2(n231), .B0(n59), .B1(n40), .Y(n77)
         );
  NOR3X1 U192 ( .A(n58), .B(n232), .C(n42), .Y(n57) );
  OAI22XL U193 ( .A0(n60), .A1(n41), .B0(n238), .B1(n231), .Y(n78) );
  OAI22XL U194 ( .A0(n42), .A1(n61), .B0(n232), .B1(n62), .Y(n79) );
  NOR2XL U195 ( .A(N147), .B(n42), .Y(n62) );
  INVXL U196 ( .A(n243), .Y(n225) );
  OAI2BB2XL U197 ( .B0(n27), .B1(n155), .A0N(MinCost[9]), .A1N(n155), .Y(n101)
         );
  OAI2BB2XL U198 ( .B0(n155), .B1(n35), .A0N(MinCost[3]), .A1N(n155), .Y(n95)
         );
  OAI2BB2XL U199 ( .B0(n155), .B1(n30), .A0N(MinCost[8]), .A1N(n155), .Y(n85)
         );
  OAI2BB2XL U200 ( .B0(n155), .B1(n33), .A0N(MinCost[5]), .A1N(n155), .Y(n91)
         );
  OAI2BB2XL U201 ( .B0(n155), .B1(n37), .A0N(MinCost[1]), .A1N(n155), .Y(n102)
         );
  OAI2BB2XL U202 ( .B0(n155), .B1(n34), .A0N(MinCost[4]), .A1N(n155), .Y(n93)
         );
  OAI2BB2XL U203 ( .B0(n155), .B1(n31), .A0N(n242), .A1N(n155), .Y(n87) );
  OAI2BB2XL U204 ( .B0(n155), .B1(n36), .A0N(n247), .A1N(n155), .Y(n97) );
  OAI2BB2XL U205 ( .B0(n155), .B1(n32), .A0N(MinCost[6]), .A1N(n155), .Y(n89)
         );
  OAI2BB2XL U206 ( .B0(n155), .B1(n38), .A0N(MinCost[0]), .A1N(n155), .Y(n99)
         );
  OAI2BB2XL U207 ( .B0(n153), .B1(n27), .A0N(N51), .A1N(n154), .Y(n84) );
  OAI2BB2XL U208 ( .B0(n153), .B1(n30), .A0N(N50), .A1N(n154), .Y(n86) );
  INVXL U209 ( .A(n240), .Y(n227) );
  OAI2BB2XL U210 ( .B0(n153), .B1(n31), .A0N(N49), .A1N(n154), .Y(n88) );
  OAI2BB2XL U211 ( .B0(n153), .B1(n32), .A0N(N48), .A1N(n154), .Y(n90) );
  OAI2BB2XL U212 ( .B0(n153), .B1(n33), .A0N(N47), .A1N(n154), .Y(n92) );
  OAI2BB2XL U213 ( .B0(n153), .B1(n34), .A0N(N46), .A1N(n154), .Y(n94) );
  OAI2BB2XL U214 ( .B0(n153), .B1(n35), .A0N(N45), .A1N(n154), .Y(n96) );
  OAI2BB2XL U215 ( .B0(n153), .B1(n36), .A0N(N44), .A1N(n154), .Y(n98) );
  OAI2BB2XL U216 ( .B0(n153), .B1(n37), .A0N(N43), .A1N(n154), .Y(n103) );
  OAI2BB2XL U217 ( .B0(n153), .B1(n38), .A0N(N42), .A1N(n154), .Y(n100) );
  NOR2BX1 U218 ( .AN(N176), .B(n235), .Y(N182) );
  NOR2BX1 U219 ( .AN(N175), .B(n235), .Y(N183) );
  NOR2BX1 U220 ( .AN(N174), .B(n235), .Y(N184) );
  NAND3X1 U221 ( .A(n46), .B(n45), .C(state[2]), .Y(n54) );
  NAND2X1 U222 ( .A(n75), .B(n46), .Y(n52) );
  NOR2X1 U223 ( .A(n45), .B(state[2]), .Y(n75) );
  CLKBUFX3 U224 ( .A(n72), .Y(n153) );
  NAND2X1 U225 ( .A(n52), .B(n74), .Y(n72) );
  OAI21XL U226 ( .A0(\count[3] ), .A1(n53), .B0(n233), .Y(n74) );
  NAND2X1 U227 ( .A(n23), .B(n25), .Y(n53) );
  CLKINVX1 U228 ( .A(sort_done), .Y(n229) );
  NAND2X1 U229 ( .A(N23), .B(N22), .Y(n68) );
  NAND3BX1 U230 ( .AN(n53), .B(N22), .C(\count[3] ), .Y(n48) );
  CLKINVX1 U231 ( .A(N24), .Y(n174) );
  NOR2X1 U232 ( .A(n235), .B(n23), .Y(N181) );
  NOR2X1 U233 ( .A(n235), .B(n26), .Y(N179) );
  NOR2X1 U234 ( .A(n235), .B(n25), .Y(N180) );
  NOR2X1 U235 ( .A(n25), .B(N22), .Y(n171) );
  NOR2X1 U236 ( .A(n25), .B(n26), .Y(n170) );
  NOR2X1 U237 ( .A(n26), .B(N23), .Y(n168) );
  NOR2X1 U238 ( .A(N22), .B(N23), .Y(n167) );
  AO22X1 U239 ( .A0(\line[5][0] ), .A1(n168), .B0(\line[4][0] ), .B1(n167), 
        .Y(n158) );
  AOI221XL U240 ( .A0(\line[6][0] ), .A1(n171), .B0(\line[7][0] ), .B1(n170), 
        .C0(n158), .Y(n161) );
  AO22X1 U241 ( .A0(\line[1][0] ), .A1(n168), .B0(\line[0][0] ), .B1(n167), 
        .Y(n159) );
  AOI221XL U242 ( .A0(\line[2][0] ), .A1(n171), .B0(\line[3][0] ), .B1(n170), 
        .C0(n159), .Y(n160) );
  OAI22XL U243 ( .A0(n174), .A1(n161), .B0(N24), .B1(n160), .Y(N176) );
  AO22X1 U244 ( .A0(\line[5][1] ), .A1(n168), .B0(\line[4][1] ), .B1(n167), 
        .Y(n162) );
  AOI221XL U245 ( .A0(\line[6][1] ), .A1(n171), .B0(\line[7][1] ), .B1(n170), 
        .C0(n162), .Y(n165) );
  AO22X1 U246 ( .A0(\line[1][1] ), .A1(n168), .B0(\line[0][1] ), .B1(n167), 
        .Y(n163) );
  AOI221XL U247 ( .A0(\line[2][1] ), .A1(n171), .B0(\line[3][1] ), .B1(n170), 
        .C0(n163), .Y(n164) );
  OAI22XL U248 ( .A0(n174), .A1(n165), .B0(N24), .B1(n164), .Y(N175) );
  AO22X1 U249 ( .A0(\line[5][2] ), .A1(n168), .B0(\line[4][2] ), .B1(n167), 
        .Y(n166) );
  AOI221XL U250 ( .A0(\line[6][2] ), .A1(n171), .B0(\line[7][2] ), .B1(n170), 
        .C0(n166), .Y(n173) );
  AO22X1 U251 ( .A0(\line[1][2] ), .A1(n168), .B0(\line[0][2] ), .B1(n167), 
        .Y(n169) );
  AOI221XL U252 ( .A0(\line[2][2] ), .A1(n171), .B0(\line[3][2] ), .B1(n170), 
        .C0(n169), .Y(n172) );
  OAI22XL U253 ( .A0(n173), .A1(n174), .B0(N24), .B1(n172), .Y(N174) );
  AO22X1 U254 ( .A0(n178), .A1(N42), .B0(N43), .B1(n105), .Y(n183) );
  OAI22XL U255 ( .A0(n179), .A1(n198), .B0(MinCost[3]), .B1(n179), .Y(n182) );
  OAI22XL U256 ( .A0(MinCost[3]), .A1(n198), .B0(MinCost[3]), .B1(n180), .Y(
        n181) );
  NOR2X1 U257 ( .A(n195), .B(N46), .Y(n184) );
  OAI22XL U258 ( .A0(n184), .A1(n199), .B0(MinCost[5]), .B1(n184), .Y(n185) );
  OAI21XL U259 ( .A0(N48), .A1(n194), .B0(n185), .Y(n188) );
  OAI22XL U260 ( .A0(cur_cost[1]), .A1(n201), .B0(n201), .B1(n105), .Y(n203)
         );
  NAND2X1 U261 ( .A(cur_cost[7]), .B(n224), .Y(n215) );
  NAND2X1 U262 ( .A(cur_cost[6]), .B(n225), .Y(n210) );
  NOR3BXL U263 ( .AN(n210), .B(n204), .C(n211), .Y(n202) );
  NAND3X1 U264 ( .A(n203), .B(n215), .C(n202), .Y(n222) );
  NAND2X1 U265 ( .A(cur_cost[9]), .B(n227), .Y(n218) );
  OAI211X1 U266 ( .A0(n206), .A1(n37), .B0(n205), .C0(n217), .Y(n207) );
  OAI221XL U267 ( .A0(cur_cost[2]), .A1(n146), .B0(cur_cost[3]), .B1(n226), 
        .C0(n207), .Y(n208) );
  NOR4X1 U268 ( .A(n222), .B(n221), .C(n220), .D(n219), .Y(N148) );
endmodule

