/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03
// Date      : Mon Aug 12 14:22:17 2024
/////////////////////////////////////////////////////////////


module SME_DW01_add_0 ( A, B, CI, SUM, CO );
  input [5:0] A;
  input [5:0] B;
  output [5:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [5:1] carry;

  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  XOR3X1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .Y(SUM[5]) );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module SME ( clk, reset, chardata, isstring, ispattern, valid, match, 
        match_index );
  input [7:0] chardata;
  output [4:0] match_index;
  input clk, reset, isstring, ispattern;
  output valid, match;
  wire   N42, N43, N44, N45, N46, N47, N48, N49, n966, n967, n968, n969, n970,
         n971, newstr, \pattern[0][7] , \pattern[0][6] , \pattern[0][5] ,
         \pattern[0][4] , \pattern[0][3] , \pattern[0][2] , \pattern[0][1] ,
         \pattern[0][0] , \pattern[1][7] , \pattern[1][6] , \pattern[1][5] ,
         \pattern[1][4] , \pattern[1][3] , \pattern[1][2] , \pattern[1][1] ,
         \pattern[1][0] , \pattern[2][7] , \pattern[2][6] , \pattern[2][5] ,
         \pattern[2][4] , \pattern[2][3] , \pattern[2][2] , \pattern[2][1] ,
         \pattern[2][0] , \pattern[3][7] , \pattern[3][6] , \pattern[3][5] ,
         \pattern[3][4] , \pattern[3][3] , \pattern[3][2] , \pattern[3][1] ,
         \pattern[3][0] , \pattern[4][7] , \pattern[4][6] , \pattern[4][5] ,
         \pattern[4][4] , \pattern[4][3] , \pattern[4][2] , \pattern[4][1] ,
         \pattern[4][0] , \pattern[5][7] , \pattern[5][6] , \pattern[5][5] ,
         \pattern[5][4] , \pattern[5][3] , \pattern[5][2] , \pattern[5][1] ,
         \pattern[5][0] , \pattern[6][7] , \pattern[6][6] , \pattern[6][5] ,
         \pattern[6][4] , \pattern[6][3] , \pattern[6][2] , \pattern[6][1] ,
         \pattern[6][0] , \pattern[7][7] , \pattern[7][6] , \pattern[7][5] ,
         \pattern[7][4] , \pattern[7][3] , \pattern[7][2] , \pattern[7][1] ,
         \pattern[7][0] , N50, N51, N52, N53, N54, N55, N56, N57, \cur_str[5] ,
         \string[0][7] , \string[0][6] , \string[0][5] , \string[0][4] ,
         \string[0][3] , \string[0][2] , \string[0][1] , \string[0][0] ,
         \string[1][7] , \string[1][6] , \string[1][5] , \string[1][4] ,
         \string[1][3] , \string[1][2] , \string[1][1] , \string[1][0] ,
         \string[2][7] , \string[2][6] , \string[2][5] , \string[2][4] ,
         \string[2][3] , \string[2][2] , \string[2][1] , \string[2][0] ,
         \string[3][7] , \string[3][6] , \string[3][5] , \string[3][4] ,
         \string[3][3] , \string[3][2] , \string[3][1] , \string[3][0] ,
         \string[4][7] , \string[4][6] , \string[4][5] , \string[4][4] ,
         \string[4][3] , \string[4][2] , \string[4][1] , \string[4][0] ,
         \string[5][7] , \string[5][6] , \string[5][5] , \string[5][4] ,
         \string[5][3] , \string[5][2] , \string[5][1] , \string[5][0] ,
         \string[6][7] , \string[6][6] , \string[6][5] , \string[6][4] ,
         \string[6][3] , \string[6][2] , \string[6][1] , \string[6][0] ,
         \string[7][7] , \string[7][6] , \string[7][5] , \string[7][4] ,
         \string[7][3] , \string[7][2] , \string[7][1] , \string[7][0] ,
         \string[8][7] , \string[8][6] , \string[8][5] , \string[8][4] ,
         \string[8][3] , \string[8][2] , \string[8][1] , \string[8][0] ,
         \string[9][7] , \string[9][6] , \string[9][5] , \string[9][4] ,
         \string[9][3] , \string[9][2] , \string[9][1] , \string[9][0] ,
         \string[10][7] , \string[10][6] , \string[10][5] , \string[10][4] ,
         \string[10][3] , \string[10][2] , \string[10][1] , \string[10][0] ,
         \string[11][7] , \string[11][6] , \string[11][5] , \string[11][4] ,
         \string[11][3] , \string[11][2] , \string[11][1] , \string[11][0] ,
         \string[12][7] , \string[12][6] , \string[12][5] , \string[12][4] ,
         \string[12][3] , \string[12][2] , \string[12][1] , \string[12][0] ,
         \string[13][7] , \string[13][6] , \string[13][5] , \string[13][4] ,
         \string[13][3] , \string[13][2] , \string[13][1] , \string[13][0] ,
         \string[14][7] , \string[14][6] , \string[14][5] , \string[14][4] ,
         \string[14][3] , \string[14][2] , \string[14][1] , \string[14][0] ,
         \string[15][7] , \string[15][6] , \string[15][5] , \string[15][4] ,
         \string[15][3] , \string[15][2] , \string[15][1] , \string[15][0] ,
         \string[16][7] , \string[16][6] , \string[16][5] , \string[16][4] ,
         \string[16][3] , \string[16][2] , \string[16][1] , \string[16][0] ,
         \string[17][7] , \string[17][6] , \string[17][5] , \string[17][4] ,
         \string[17][3] , \string[17][2] , \string[17][1] , \string[17][0] ,
         \string[18][7] , \string[18][6] , \string[18][5] , \string[18][4] ,
         \string[18][3] , \string[18][2] , \string[18][1] , \string[18][0] ,
         \string[19][7] , \string[19][6] , \string[19][5] , \string[19][4] ,
         \string[19][3] , \string[19][2] , \string[19][1] , \string[19][0] ,
         \string[20][7] , \string[20][6] , \string[20][5] , \string[20][4] ,
         \string[20][3] , \string[20][2] , \string[20][1] , \string[20][0] ,
         \string[21][7] , \string[21][6] , \string[21][5] , \string[21][4] ,
         \string[21][3] , \string[21][2] , \string[21][1] , \string[21][0] ,
         \string[22][7] , \string[22][6] , \string[22][5] , \string[22][4] ,
         \string[22][3] , \string[22][2] , \string[22][1] , \string[22][0] ,
         \string[23][7] , \string[23][6] , \string[23][5] , \string[23][4] ,
         \string[23][3] , \string[23][2] , \string[23][1] , \string[23][0] ,
         \string[24][7] , \string[24][6] , \string[24][5] , \string[24][4] ,
         \string[24][3] , \string[24][2] , \string[24][1] , \string[24][0] ,
         \string[25][7] , \string[25][6] , \string[25][5] , \string[25][4] ,
         \string[25][3] , \string[25][2] , \string[25][1] , \string[25][0] ,
         \string[26][7] , \string[26][6] , \string[26][5] , \string[26][4] ,
         \string[26][3] , \string[26][2] , \string[26][1] , \string[26][0] ,
         \string[27][7] , \string[27][6] , \string[27][5] , \string[27][4] ,
         \string[27][3] , \string[27][2] , \string[27][1] , \string[27][0] ,
         \string[28][7] , \string[28][6] , \string[28][5] , \string[28][4] ,
         \string[28][3] , \string[28][2] , \string[28][1] , \string[28][0] ,
         \string[29][7] , \string[29][6] , \string[29][5] , \string[29][4] ,
         \string[29][3] , \string[29][2] , \string[29][1] , \string[29][0] ,
         \string[30][7] , \string[30][6] , \string[30][5] , \string[30][4] ,
         \string[30][3] , \string[30][2] , \string[30][1] , \string[30][0] ,
         \string[31][7] , \string[31][6] , \string[31][5] , \string[31][4] ,
         \string[31][3] , \string[31][2] , \string[31][1] , \string[31][0] ,
         N58, N59, N60, N61, N62, N63, N64, N65, N71, N137, N138, N139, N140,
         N141, N142, N166, N167, N168, N169, N170, N171, N173, N174, N175,
         N176, N177, N178, N188, N189, N190, N191, N192, N193, N273, N275,
         N277, N279, N281, n30, n31, n32, n33, n34, n35, n37, n38, n40, n41,
         n42, n43, n45, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n102, n103, n104, n106, n108,
         n110, n112, n113, n114, n115, n116, n117, n119, n121, n122, n123,
         n124, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n158, n159, n160,
         n161, n162, n164, n165, n166, n167, n168, n169, n171, n172, n174,
         n175, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n213, n214, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n234, n238, n240, n241, n242, n243, n244, n246,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303,
         n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314,
         n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n325,
         n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358,
         n359, n360, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n386, n387, n388, n389, n390, n391,
         n392, n393, n394, n395, n396, n397, n398, n399, n400, n401, n402,
         n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413,
         n414, n415, n416, n417, n418, n419, n420, n421, n422, n423, n424,
         n425, n426, n427, n428, n429, n430, n431, n432, n433, n434, n435,
         n436, n437, n438, n439, n440, n441, n442, n443, n444, n445, n446,
         n447, n448, n449, n450, n451, n452, n453, n454, n455, n456, n457,
         n458, n459, n460, n461, n462, n463, n464, n465, n466, n467, n468,
         n469, n470, n471, n472, n473, n474, n475, n476, n477, n478, n479,
         n480, n481, n482, n483, n484, n485, n486, n487, n488, n489, n490,
         n491, n492, n493, n494, n495, n496, n497, n498, n499, n500, n501,
         n502, n503, n504, n505, n506, n507, n508, n509, n510, n511, n512,
         n513, n514, n515, n516, n517, n518, n519, n520, n521, n522, n523,
         n524, n525, n526, n527, n528, n529, n530, n531, n532, n533, n534,
         n535, n536, n537, n538, n539, n540, n541, n542, n543, n544, n545,
         n546, n547, n548, n549, n550, n551, n552, n553, n554, n555, n556,
         n557, n558, n559, n560, n561, n562, n563, n564, n565, n566, n567,
         n568, n569, n570, n571, n572, n573, n574, n575, n576, n577, n578,
         n579, n580, n581, n582, n583, n584, n585, n586, n587, n588, n589,
         n590, n591, n592, n593, n594, n595, n596, n597, n598, N165, N164,
         N163, N162, N161, N910, N909, N908, N907, N906, N905, \r537/SUM[1] ,
         \r537/SUM[2] , \r537/SUM[3] , \r537/SUM[4] , n599, n600, n608, n609,
         n610, n611, n612, n613, n614, n615, n616, n617, n618, n619, n620,
         n621, n622, n623, n624, n625, n626, n627, n628, n629, n630, n631,
         n632, n633, n634, n635, n636, n637, n638, n639, n640, n641, n642,
         n643, n644, n645, n646, n647, n648, n649, n650, n651, n652, n653,
         n654, n655, n656, n657, n658, n659, n660, n661, n662, n663, n664,
         n665, n666, n667, n668, n669, n670, n671, n672, n673, n674, n675,
         n676, n677, n678, n679, n680, n681, n682, n683, n684, n685, n686,
         n687, n688, n689, n690, n691, n692, n693, n694, n695, n696, n697,
         n698, n699, n700, n701, n702, n703, n704, n705, n706, n707, n708,
         n709, n710, n711, n712, n713, n714, n715, n716, n717, n718, n719,
         n720, n721, n722, n723, n724, n725, n726, n727, n728, n729, n730,
         n731, n732, n733, n734, n735, n736, n737, n738, n739, n740, n741,
         n742, n743, n744, n745, n746, n747, n748, n749, n750, n751, n752,
         n753, n754, n755, n756, n757, n758, n759, n760, n761, n762, n763,
         n764, n765, n766, n767, n768, n769, n770, n771, n772, n773, n774,
         n775, n776, n777, n778, n779, n780, n781, n782, n783, n784, n785,
         n786, n787, n788, n789, n790, n791, n792, n793, n794, n795, n796,
         n797, n798, n799, n800, n801, n802, n803, n804, n805, n806, n807,
         n808, n809, n810, n811, n812, n813, n814, n815, n816, n817, n818,
         n819, n820, n821, n822, n823, n824, n825, n826, n827, n828, n829,
         n830, n831, n832, n833, n834, n835, n836, n837, n838, n839, n840,
         n841, n842, n843, n844, n845, n846, n847, n848, n849, n850, n851,
         n852, n853, n854, n855, n856, n857, n858, n859, n860, n861, n862,
         n863, n864, n865, n866, n867, n868, n869, n870, n871, n872, n873,
         n874, n875, n876, n877, n878, n879, n880, n881, n882, n883, n884,
         n885, n886, n887, n888, n889, n890, n891, n892, n893, n894, n895,
         n896, n897, n898, n899, n900, n901, n902, n903, n904, n905, n906,
         n907, n908, n909, n910, n911, n912, n913, n914, n915, n916, n917,
         n918, n919, n920, n921, n922, n923, n924, n925, n926, n927, n928,
         n929, n930, n931, n932, n933, n934, n935, n936, n937, n938, n939,
         n940, n941, n942, n943, n944, n945, n946, n947, n948, n949, n950,
         n951, n952, n953, n954, n955, n956, n957, n958, n959, n960, n961,
         n962, n963, n964;
  wire   [5:0] str_len;
  wire   [3:0] pat_len;
  wire   [3:0] pat_start;
  wire   [5:0] str_start;
  wire   [5:2] \r537/carry ;
  wire   [4:2] \r536/carry ;
  wire   [5:2] \r535/carry ;
  wire   [5:2] \add_66_2/carry ;
  wire   [5:0] \sub_66/carry ;
  wire   [5:2] \add_46_aco/carry ;

  OAI31X2 U17 ( .A0(n35), .A1(n952), .A2(n37), .B0(n38), .Y(n33) );
  SME_DW01_add_0 add_66 ( .A({N165, N165, N164, N163, N162, N161}), .B(
        str_start), .CI(1'b0), .SUM({N171, N170, N169, N168, N167, N166}) );
  DFFRX1 \cur_pat_reg[3]  ( .D(n593), .CK(clk), .RN(n940), .QN(n213) );
  DFFQX1 \string_reg[9][7]  ( .D(n326), .CK(clk), .Q(\string[9][7] ) );
  DFFQX1 \string_reg[9][6]  ( .D(n327), .CK(clk), .Q(\string[9][6] ) );
  DFFQX1 \string_reg[11][7]  ( .D(n342), .CK(clk), .Q(\string[11][7] ) );
  DFFQX1 \string_reg[13][7]  ( .D(n358), .CK(clk), .Q(\string[13][7] ) );
  DFFQX1 \string_reg[11][6]  ( .D(n343), .CK(clk), .Q(\string[11][6] ) );
  DFFQX1 \string_reg[26][7]  ( .D(n462), .CK(clk), .Q(\string[26][7] ) );
  DFFQX1 \string_reg[3][7]  ( .D(n278), .CK(clk), .Q(\string[3][7] ) );
  DFFQX1 \string_reg[15][7]  ( .D(n374), .CK(clk), .Q(\string[15][7] ) );
  DFFQX1 \string_reg[13][6]  ( .D(n359), .CK(clk), .Q(\string[13][6] ) );
  DFFQX1 \string_reg[5][7]  ( .D(n294), .CK(clk), .Q(\string[5][7] ) );
  DFFQX1 \string_reg[25][6]  ( .D(n455), .CK(clk), .Q(\string[25][6] ) );
  DFFQX1 \string_reg[28][7]  ( .D(n478), .CK(clk), .Q(\string[28][7] ) );
  DFFQX1 \string_reg[3][6]  ( .D(n279), .CK(clk), .Q(\string[3][6] ) );
  DFFQX1 \string_reg[15][6]  ( .D(n375), .CK(clk), .Q(\string[15][6] ) );
  DFFQX1 \string_reg[7][7]  ( .D(n310), .CK(clk), .Q(\string[7][7] ) );
  DFFQX1 \string_reg[9][2]  ( .D(n331), .CK(clk), .Q(\string[9][2] ) );
  DFFQX1 \string_reg[0][7]  ( .D(n254), .CK(clk), .Q(\string[0][7] ) );
  DFFQX1 \string_reg[9][4]  ( .D(n329), .CK(clk), .Q(\string[9][4] ) );
  DFFQX1 \string_reg[30][7]  ( .D(n494), .CK(clk), .Q(\string[30][7] ) );
  DFFQX1 \string_reg[5][6]  ( .D(n295), .CK(clk), .Q(\string[5][6] ) );
  DFFQX1 \string_reg[9][5]  ( .D(n328), .CK(clk), .Q(\string[9][5] ) );
  DFFQX1 \string_reg[27][6]  ( .D(n471), .CK(clk), .Q(\string[27][6] ) );
  DFFQX1 \string_reg[7][6]  ( .D(n311), .CK(clk), .Q(\string[7][6] ) );
  DFFQX1 \string_reg[20][7]  ( .D(n414), .CK(clk), .Q(\string[20][7] ) );
  DFFQX1 \string_reg[8][7]  ( .D(n318), .CK(clk), .Q(\string[8][7] ) );
  DFFQX1 \string_reg[0][6]  ( .D(n255), .CK(clk), .Q(\string[0][6] ) );
  DFFQX1 \string_reg[11][2]  ( .D(n347), .CK(clk), .Q(\string[11][2] ) );
  DFFQX1 \string_reg[11][4]  ( .D(n345), .CK(clk), .Q(\string[11][4] ) );
  DFFQX1 \string_reg[18][7]  ( .D(n398), .CK(clk), .Q(\string[18][7] ) );
  DFFQX1 \string_reg[29][6]  ( .D(n486), .CK(clk), .Q(\string[29][6] ) );
  DFFQX1 \string_reg[11][5]  ( .D(n344), .CK(clk), .Q(\string[11][5] ) );
  DFFQX1 \string_reg[22][7]  ( .D(n430), .CK(clk), .Q(\string[22][7] ) );
  DFFQX1 \string_reg[13][2]  ( .D(n363), .CK(clk), .Q(\string[13][2] ) );
  DFFQX1 \string_reg[31][6]  ( .D(n507), .CK(clk), .Q(\string[31][6] ) );
  DFFQX1 \string_reg[9][3]  ( .D(n330), .CK(clk), .Q(\string[9][3] ) );
  DFFQX1 \string_reg[19][6]  ( .D(n407), .CK(clk), .Q(\string[19][6] ) );
  DFFQX1 \string_reg[8][6]  ( .D(n319), .CK(clk), .Q(\string[8][6] ) );
  DFFQX1 \string_reg[10][7]  ( .D(n334), .CK(clk), .Q(\string[10][7] ) );
  DFFQX1 \string_reg[13][4]  ( .D(n361), .CK(clk), .Q(\string[13][4] ) );
  DFFQX1 \string_reg[24][7]  ( .D(n452), .CK(clk), .Q(\string[24][7] ) );
  DFFQX1 \string_reg[25][2]  ( .D(n459), .CK(clk), .Q(\string[25][2] ) );
  DFFQX1 \string_reg[3][2]  ( .D(n283), .CK(clk), .Q(\string[3][2] ) );
  DFFQX1 \string_reg[15][2]  ( .D(n379), .CK(clk), .Q(\string[15][2] ) );
  DFFQX1 \string_reg[31][7]  ( .D(n508), .CK(clk), .Q(\string[31][7] ) );
  DFFQX1 \string_reg[25][4]  ( .D(n457), .CK(clk), .Q(\string[25][4] ) );
  DFFQX1 \string_reg[3][4]  ( .D(n281), .CK(clk), .Q(\string[3][4] ) );
  DFFQX1 \string_reg[15][4]  ( .D(n377), .CK(clk), .Q(\string[15][4] ) );
  DFFQX1 \string_reg[13][5]  ( .D(n360), .CK(clk), .Q(\string[13][5] ) );
  DFFQX1 \string_reg[1][7]  ( .D(n262), .CK(clk), .Q(\string[1][7] ) );
  DFFQX1 \string_reg[9][0]  ( .D(n333), .CK(clk), .Q(\string[9][0] ) );
  DFFQX1 \string_reg[21][6]  ( .D(n423), .CK(clk), .Q(\string[21][6] ) );
  DFFQX1 \string_reg[25][5]  ( .D(n456), .CK(clk), .Q(\string[25][5] ) );
  DFFQX1 \string_reg[3][5]  ( .D(n280), .CK(clk), .Q(\string[3][5] ) );
  DFFQX1 \string_reg[15][5]  ( .D(n376), .CK(clk), .Q(\string[15][5] ) );
  DFFQX1 \string_reg[12][7]  ( .D(n350), .CK(clk), .Q(\string[12][7] ) );
  DFFQX1 \string_reg[11][3]  ( .D(n346), .CK(clk), .Q(\string[11][3] ) );
  DFFQX1 \string_reg[5][2]  ( .D(n299), .CK(clk), .Q(\string[5][2] ) );
  DFFQX1 \string_reg[10][6]  ( .D(n335), .CK(clk), .Q(\string[10][6] ) );
  DFFQX1 \string_reg[25][7]  ( .D(n454), .CK(clk), .Q(\string[25][7] ) );
  DFFQX1 \string_reg[23][6]  ( .D(n439), .CK(clk), .Q(\string[23][6] ) );
  DFFQX1 \string_reg[2][7]  ( .D(n270), .CK(clk), .Q(\string[2][7] ) );
  DFFQX1 \string_reg[14][7]  ( .D(n366), .CK(clk), .Q(\string[14][7] ) );
  DFFQX1 \string_reg[5][4]  ( .D(n297), .CK(clk), .Q(\string[5][4] ) );
  DFFQX1 \string_reg[27][2]  ( .D(n475), .CK(clk), .Q(\string[27][2] ) );
  DFFQX1 \string_reg[16][6]  ( .D(n387), .CK(clk), .Q(\string[16][6] ) );
  DFFQX1 \string_reg[7][2]  ( .D(n315), .CK(clk), .Q(\string[7][2] ) );
  DFFQX1 \string_reg[27][4]  ( .D(n473), .CK(clk), .Q(\string[27][4] ) );
  DFFQX1 \string_reg[0][2]  ( .D(n259), .CK(clk), .Q(\string[0][2] ) );
  DFFQX1 \string_reg[7][4]  ( .D(n313), .CK(clk), .Q(\string[7][4] ) );
  DFFQX1 \string_reg[0][4]  ( .D(n257), .CK(clk), .Q(\string[0][4] ) );
  DFFQX1 \string_reg[1][6]  ( .D(n263), .CK(clk), .Q(\string[1][6] ) );
  DFFQX1 \string_reg[5][5]  ( .D(n296), .CK(clk), .Q(\string[5][5] ) );
  DFFQX1 \string_reg[9][1]  ( .D(n332), .CK(clk), .Q(\string[9][1] ) );
  DFFQX1 \string_reg[11][0]  ( .D(n349), .CK(clk), .Q(\string[11][0] ) );
  DFFQX1 \string_reg[13][3]  ( .D(n362), .CK(clk), .Q(\string[13][3] ) );
  DFFQX1 \string_reg[27][5]  ( .D(n472), .CK(clk), .Q(\string[27][5] ) );
  DFFQX1 \string_reg[12][6]  ( .D(n351), .CK(clk), .Q(\string[12][6] ) );
  DFFQX1 \string_reg[7][5]  ( .D(n312), .CK(clk), .Q(\string[7][5] ) );
  DFFQX1 \string_reg[4][7]  ( .D(n292), .CK(clk), .Q(\string[4][7] ) );
  DFFQX1 \string_reg[29][2]  ( .D(n490), .CK(clk), .Q(\string[29][2] ) );
  DFFQX1 \string_reg[25][3]  ( .D(n458), .CK(clk), .Q(\string[25][3] ) );
  DFFQX1 \string_reg[0][5]  ( .D(n256), .CK(clk), .Q(\string[0][5] ) );
  DFFQX1 \string_reg[15][3]  ( .D(n378), .CK(clk), .Q(\string[15][3] ) );
  DFFQX1 \string_reg[24][6]  ( .D(n451), .CK(clk), .Q(\string[24][6] ) );
  DFFQX1 \string_reg[27][7]  ( .D(n470), .CK(clk), .Q(\string[27][7] ) );
  DFFQX1 \string_reg[3][3]  ( .D(n282), .CK(clk), .Q(\string[3][3] ) );
  DFFQX1 \string_reg[2][6]  ( .D(n271), .CK(clk), .Q(\string[2][6] ) );
  DFFQX1 \string_reg[14][6]  ( .D(n367), .CK(clk), .Q(\string[14][6] ) );
  DFFQX1 \string_reg[29][4]  ( .D(n488), .CK(clk), .Q(\string[29][4] ) );
  DFFQX1 \string_reg[6][7]  ( .D(n302), .CK(clk), .Q(\string[6][7] ) );
  DFFQX1 \string_reg[31][2]  ( .D(n504), .CK(clk), .Q(\string[31][2] ) );
  DFFQX1 \string_reg[19][2]  ( .D(n411), .CK(clk), .Q(\string[19][2] ) );
  DFFQX1 \string_reg[8][2]  ( .D(n323), .CK(clk), .Q(\string[8][2] ) );
  DFFQX1 \string_reg[31][4]  ( .D(n505), .CK(clk), .Q(\string[31][4] ) );
  DFFQX1 \string_reg[19][4]  ( .D(n409), .CK(clk), .Q(\string[19][4] ) );
  DFFQX1 \string_reg[8][4]  ( .D(n321), .CK(clk), .Q(\string[8][4] ) );
  DFFQX1 \string_reg[13][0]  ( .D(n365), .CK(clk), .Q(\string[13][0] ) );
  DFFQX1 \string_reg[29][5]  ( .D(n487), .CK(clk), .Q(\string[29][5] ) );
  DFFQX1 \string_reg[11][1]  ( .D(n348), .CK(clk), .Q(\string[11][1] ) );
  DFFQX1 \string_reg[25][0]  ( .D(n461), .CK(clk), .Q(\string[25][0] ) );
  DFFQX1 \string_reg[3][0]  ( .D(n285), .CK(clk), .Q(\string[3][0] ) );
  DFFQX1 \string_reg[15][0]  ( .D(n381), .CK(clk), .Q(\string[15][0] ) );
  DFFQX1 \string_reg[5][3]  ( .D(n298), .CK(clk), .Q(\string[5][3] ) );
  DFFQX1 \string_reg[29][7]  ( .D(n493), .CK(clk), .Q(\string[29][7] ) );
  DFFQX1 \string_reg[31][5]  ( .D(n506), .CK(clk), .Q(\string[31][5] ) );
  DFFQX1 \string_reg[4][6]  ( .D(n291), .CK(clk), .Q(\string[4][6] ) );
  DFFQX1 \string_reg[19][5]  ( .D(n408), .CK(clk), .Q(\string[19][5] ) );
  DFFQX1 \string_reg[8][5]  ( .D(n320), .CK(clk), .Q(\string[8][5] ) );
  DFFQX1 \string_reg[27][3]  ( .D(n474), .CK(clk), .Q(\string[27][3] ) );
  DFFQX1 \string_reg[26][6]  ( .D(n463), .CK(clk), .Q(\string[26][6] ) );
  DFFQX1 \string_reg[17][7]  ( .D(n390), .CK(clk), .Q(\string[17][7] ) );
  DFFQX1 \string_reg[21][2]  ( .D(n427), .CK(clk), .Q(\string[21][2] ) );
  DFFQX1 \string_reg[7][3]  ( .D(n314), .CK(clk), .Q(\string[7][3] ) );
  DFFQX1 \string_reg[6][6]  ( .D(n303), .CK(clk), .Q(\string[6][6] ) );
  DFFQX1 \string_reg[19][7]  ( .D(n406), .CK(clk), .Q(\string[19][7] ) );
  DFFQX1 \string_reg[21][4]  ( .D(n425), .CK(clk), .Q(\string[21][4] ) );
  DFFQX1 \string_reg[0][3]  ( .D(n258), .CK(clk), .Q(\string[0][3] ) );
  DFFQX1 \string_reg[10][2]  ( .D(n339), .CK(clk), .Q(\string[10][2] ) );
  DFFQX1 \string_reg[23][2]  ( .D(n443), .CK(clk), .Q(\string[23][2] ) );
  DFFQX1 \string_reg[13][1]  ( .D(n364), .CK(clk), .Q(\string[13][1] ) );
  DFFQX1 \string_reg[10][4]  ( .D(n337), .CK(clk), .Q(\string[10][4] ) );
  DFFQX1 \string_reg[16][2]  ( .D(n389), .CK(clk), .Q(\string[16][2] ) );
  DFFQX1 \string_reg[23][4]  ( .D(n441), .CK(clk), .Q(\string[23][4] ) );
  DFFQX1 \string_reg[5][0]  ( .D(n301), .CK(clk), .Q(\string[5][0] ) );
  DFFQX1 \string_reg[16][4]  ( .D(n385), .CK(clk), .Q(\string[16][4] ) );
  DFFQX1 \string_reg[17][6]  ( .D(n391), .CK(clk), .Q(\string[17][6] ) );
  DFFQX1 \string_reg[25][1]  ( .D(n460), .CK(clk), .Q(\string[25][1] ) );
  DFFQX1 \string_reg[3][1]  ( .D(n284), .CK(clk), .Q(\string[3][1] ) );
  DFFQX1 \string_reg[15][1]  ( .D(n380), .CK(clk), .Q(\string[15][1] ) );
  DFFQX1 \string_reg[21][5]  ( .D(n424), .CK(clk), .Q(\string[21][5] ) );
  DFFQX1 \string_reg[27][0]  ( .D(n477), .CK(clk), .Q(\string[27][0] ) );
  DFFQX1 \string_reg[7][0]  ( .D(n317), .CK(clk), .Q(\string[7][0] ) );
  DFFQX1 \string_reg[29][3]  ( .D(n489), .CK(clk), .Q(\string[29][3] ) );
  DFFQX1 \string_reg[28][6]  ( .D(n479), .CK(clk), .Q(\string[28][6] ) );
  DFFQX1 \string_reg[1][2]  ( .D(n267), .CK(clk), .Q(\string[1][2] ) );
  DFFQX1 \string_reg[10][5]  ( .D(n336), .CK(clk), .Q(\string[10][5] ) );
  DFFQX1 \string_reg[0][0]  ( .D(n261), .CK(clk), .Q(\string[0][0] ) );
  DFFQX1 \string_reg[23][5]  ( .D(n440), .CK(clk), .Q(\string[23][5] ) );
  DFFQX1 \string_reg[21][7]  ( .D(n422), .CK(clk), .Q(\string[21][7] ) );
  DFFQX1 \string_reg[1][4]  ( .D(n265), .CK(clk), .Q(\string[1][4] ) );
  DFFQX1 \string_reg[31][3]  ( .D(n509), .CK(clk), .Q(\string[31][3] ) );
  DFFQX1 \string_reg[12][2]  ( .D(n355), .CK(clk), .Q(\string[12][2] ) );
  DFFQX1 \string_reg[16][5]  ( .D(n386), .CK(clk), .Q(\string[16][5] ) );
  DFFQX1 \string_reg[19][3]  ( .D(n410), .CK(clk), .Q(\string[19][3] ) );
  DFFQX1 \string_reg[30][6]  ( .D(n495), .CK(clk), .Q(\string[30][6] ) );
  DFFQX1 \string_reg[8][3]  ( .D(n322), .CK(clk), .Q(\string[8][3] ) );
  DFFQX1 \string_reg[18][6]  ( .D(n399), .CK(clk), .Q(\string[18][6] ) );
  DFFQX1 \string_reg[12][4]  ( .D(n353), .CK(clk), .Q(\string[12][4] ) );
  DFFQX1 \string_reg[23][7]  ( .D(n438), .CK(clk), .Q(\string[23][7] ) );
  DFFQX1 \string_reg[24][2]  ( .D(n447), .CK(clk), .Q(\string[24][2] ) );
  DFFQX1 \string_reg[2][2]  ( .D(n275), .CK(clk), .Q(\string[2][2] ) );
  DFFQX1 \string_reg[14][2]  ( .D(n371), .CK(clk), .Q(\string[14][2] ) );
  DFFQX1 \string_reg[24][4]  ( .D(n449), .CK(clk), .Q(\string[24][4] ) );
  DFFQX1 \string_reg[1][5]  ( .D(n264), .CK(clk), .Q(\string[1][5] ) );
  DFFQX1 \string_reg[5][1]  ( .D(n300), .CK(clk), .Q(\string[5][1] ) );
  DFFQX1 \string_reg[29][0]  ( .D(n492), .CK(clk), .Q(\string[29][0] ) );
  DFFQX1 \string_reg[2][4]  ( .D(n273), .CK(clk), .Q(\string[2][4] ) );
  DFFQX1 \string_reg[14][4]  ( .D(n369), .CK(clk), .Q(\string[14][4] ) );
  DFFQX1 \string_reg[27][1]  ( .D(n476), .CK(clk), .Q(\string[27][1] ) );
  DFFQX1 \string_reg[12][5]  ( .D(n352), .CK(clk), .Q(\string[12][5] ) );
  DFFQX1 \string_reg[31][0]  ( .D(n502), .CK(clk), .Q(\string[31][0] ) );
  DFFQX1 \string_reg[7][1]  ( .D(n316), .CK(clk), .Q(\string[7][1] ) );
  DFFQX1 \string_reg[19][0]  ( .D(n413), .CK(clk), .Q(\string[19][0] ) );
  DFFQX1 \string_reg[8][0]  ( .D(n325), .CK(clk), .Q(\string[8][0] ) );
  DFFQX1 \string_reg[0][1]  ( .D(n260), .CK(clk), .Q(\string[0][1] ) );
  DFFQX1 \string_reg[21][3]  ( .D(n426), .CK(clk), .Q(\string[21][3] ) );
  DFFQX1 \string_reg[20][6]  ( .D(n415), .CK(clk), .Q(\string[20][6] ) );
  DFFQX1 \string_reg[24][5]  ( .D(n450), .CK(clk), .Q(\string[24][5] ) );
  DFFQX1 \string_reg[2][5]  ( .D(n272), .CK(clk), .Q(\string[2][5] ) );
  DFFQX1 \string_reg[14][5]  ( .D(n368), .CK(clk), .Q(\string[14][5] ) );
  DFFQX1 \string_reg[10][3]  ( .D(n338), .CK(clk), .Q(\string[10][3] ) );
  DFFQX1 \string_reg[4][2]  ( .D(n288), .CK(clk), .Q(\string[4][2] ) );
  DFFQX1 \string_reg[23][3]  ( .D(n442), .CK(clk), .Q(\string[23][3] ) );
  DFFQX1 \string_reg[22][6]  ( .D(n431), .CK(clk), .Q(\string[22][6] ) );
  DFFQX1 \string_reg[16][3]  ( .D(n384), .CK(clk), .Q(\string[16][3] ) );
  DFFQX1 \string_reg[4][4]  ( .D(n286), .CK(clk), .Q(\string[4][4] ) );
  DFFQX1 \string_reg[26][2]  ( .D(n467), .CK(clk), .Q(\string[26][2] ) );
  DFFQX1 \string_reg[6][2]  ( .D(n307), .CK(clk), .Q(\string[6][2] ) );
  DFFQX1 \string_reg[29][1]  ( .D(n491), .CK(clk), .Q(\string[29][1] ) );
  DFFQX1 \string_reg[26][4]  ( .D(n465), .CK(clk), .Q(\string[26][4] ) );
  DFFQX1 \string_reg[16][7]  ( .D(n388), .CK(clk), .Q(\string[16][7] ) );
  DFFQX1 \string_reg[6][4]  ( .D(n305), .CK(clk), .Q(\string[6][4] ) );
  DFFQX1 \string_reg[21][0]  ( .D(n429), .CK(clk), .Q(\string[21][0] ) );
  DFFQX1 \string_reg[1][3]  ( .D(n266), .CK(clk), .Q(\string[1][3] ) );
  DFFQX1 \string_reg[31][1]  ( .D(n503), .CK(clk), .Q(\string[31][1] ) );
  DFFQX1 \string_reg[19][1]  ( .D(n412), .CK(clk), .Q(\string[19][1] ) );
  DFFQX1 \string_reg[4][5]  ( .D(n293), .CK(clk), .Q(\string[4][5] ) );
  DFFQX1 \string_reg[8][1]  ( .D(n324), .CK(clk), .Q(\string[8][1] ) );
  DFFQX1 \string_reg[10][0]  ( .D(n341), .CK(clk), .Q(\string[10][0] ) );
  DFFQX1 \string_reg[23][0]  ( .D(n445), .CK(clk), .Q(\string[23][0] ) );
  DFFQX1 \string_reg[12][3]  ( .D(n354), .CK(clk), .Q(\string[12][3] ) );
  DFFQX1 \string_reg[17][2]  ( .D(n395), .CK(clk), .Q(\string[17][2] ) );
  DFFQX1 \string_reg[26][5]  ( .D(n464), .CK(clk), .Q(\string[26][5] ) );
  DFFQX1 \string_reg[16][0]  ( .D(n383), .CK(clk), .Q(\string[16][0] ) );
  DFFQX1 \string_reg[6][5]  ( .D(n304), .CK(clk), .Q(\string[6][5] ) );
  DFFQX1 \string_reg[17][4]  ( .D(n393), .CK(clk), .Q(\string[17][4] ) );
  DFFQX1 \string_reg[28][2]  ( .D(n483), .CK(clk), .Q(\string[28][2] ) );
  DFFQX1 \string_reg[24][3]  ( .D(n448), .CK(clk), .Q(\string[24][3] ) );
  DFFQX1 \string_reg[2][3]  ( .D(n274), .CK(clk), .Q(\string[2][3] ) );
  DFFQX1 \string_reg[14][3]  ( .D(n370), .CK(clk), .Q(\string[14][3] ) );
  DFFQX1 \string_reg[28][4]  ( .D(n481), .CK(clk), .Q(\string[28][4] ) );
  DFFQX1 \string_reg[30][2]  ( .D(n499), .CK(clk), .Q(\string[30][2] ) );
  DFFQX1 \string_reg[1][0]  ( .D(n269), .CK(clk), .Q(\string[1][0] ) );
  DFFQX1 \string_reg[18][2]  ( .D(n403), .CK(clk), .Q(\string[18][2] ) );
  DFFQX1 \string_reg[30][4]  ( .D(n497), .CK(clk), .Q(\string[30][4] ) );
  DFFQX1 \string_reg[17][5]  ( .D(n392), .CK(clk), .Q(\string[17][5] ) );
  DFFQX1 \string_reg[21][1]  ( .D(n428), .CK(clk), .Q(\string[21][1] ) );
  DFFQX1 \string_reg[18][4]  ( .D(n401), .CK(clk), .Q(\string[18][4] ) );
  DFFQX1 \string_reg[12][0]  ( .D(n357), .CK(clk), .Q(\string[12][0] ) );
  DFFQX1 \string_reg[28][5]  ( .D(n480), .CK(clk), .Q(\string[28][5] ) );
  DFFQX1 \string_reg[10][1]  ( .D(n340), .CK(clk), .Q(\string[10][1] ) );
  DFFQX1 \string_reg[23][1]  ( .D(n444), .CK(clk), .Q(\string[23][1] ) );
  DFFQX1 \string_reg[24][0]  ( .D(n453), .CK(clk), .Q(\string[24][0] ) );
  DFFQX1 \string_reg[2][0]  ( .D(n277), .CK(clk), .Q(\string[2][0] ) );
  DFFQX1 \string_reg[14][0]  ( .D(n373), .CK(clk), .Q(\string[14][0] ) );
  DFFQX1 \string_reg[16][1]  ( .D(n382), .CK(clk), .Q(\string[16][1] ) );
  DFFQX1 \string_reg[4][3]  ( .D(n287), .CK(clk), .Q(\string[4][3] ) );
  DFFQX1 \string_reg[30][5]  ( .D(n496), .CK(clk), .Q(\string[30][5] ) );
  DFFQX1 \string_reg[18][5]  ( .D(n400), .CK(clk), .Q(\string[18][5] ) );
  DFFQX1 \string_reg[26][3]  ( .D(n466), .CK(clk), .Q(\string[26][3] ) );
  DFFQX1 \string_reg[20][2]  ( .D(n419), .CK(clk), .Q(\string[20][2] ) );
  DFFQX1 \string_reg[6][3]  ( .D(n306), .CK(clk), .Q(\string[6][3] ) );
  DFFQX1 \string_reg[1][1]  ( .D(n268), .CK(clk), .Q(\string[1][1] ) );
  DFFQX1 \string_reg[20][4]  ( .D(n417), .CK(clk), .Q(\string[20][4] ) );
  DFFQX1 \string_reg[22][2]  ( .D(n435), .CK(clk), .Q(\string[22][2] ) );
  DFFQX1 \string_reg[12][1]  ( .D(n356), .CK(clk), .Q(\string[12][1] ) );
  DFFQX1 \string_reg[22][4]  ( .D(n433), .CK(clk), .Q(\string[22][4] ) );
  DFFQX1 \string_reg[4][0]  ( .D(n290), .CK(clk), .Q(\string[4][0] ) );
  DFFQX1 \string_reg[17][3]  ( .D(n394), .CK(clk), .Q(\string[17][3] ) );
  DFFQX1 \string_reg[24][1]  ( .D(n446), .CK(clk), .Q(\string[24][1] ) );
  DFFQX1 \string_reg[2][1]  ( .D(n276), .CK(clk), .Q(\string[2][1] ) );
  DFFQX1 \string_reg[14][1]  ( .D(n372), .CK(clk), .Q(\string[14][1] ) );
  DFFQX1 \string_reg[20][5]  ( .D(n416), .CK(clk), .Q(\string[20][5] ) );
  DFFQX1 \string_reg[26][0]  ( .D(n469), .CK(clk), .Q(\string[26][0] ) );
  DFFQX1 \string_reg[6][0]  ( .D(n309), .CK(clk), .Q(\string[6][0] ) );
  DFFQX1 \string_reg[28][3]  ( .D(n482), .CK(clk), .Q(\string[28][3] ) );
  DFFQX1 \string_reg[22][5]  ( .D(n432), .CK(clk), .Q(\string[22][5] ) );
  DFFQX1 \string_reg[30][3]  ( .D(n498), .CK(clk), .Q(\string[30][3] ) );
  DFFQX1 \string_reg[18][3]  ( .D(n402), .CK(clk), .Q(\string[18][3] ) );
  DFFQX1 \string_reg[17][0]  ( .D(n397), .CK(clk), .Q(\string[17][0] ) );
  DFFQX1 \string_reg[4][1]  ( .D(n289), .CK(clk), .Q(\string[4][1] ) );
  DFFQX1 \string_reg[28][0]  ( .D(n485), .CK(clk), .Q(\string[28][0] ) );
  DFFQX1 \string_reg[26][1]  ( .D(n468), .CK(clk), .Q(\string[26][1] ) );
  DFFQX1 \string_reg[6][1]  ( .D(n308), .CK(clk), .Q(\string[6][1] ) );
  DFFQX1 \string_reg[30][0]  ( .D(n501), .CK(clk), .Q(\string[30][0] ) );
  DFFQX1 \string_reg[18][0]  ( .D(n405), .CK(clk), .Q(\string[18][0] ) );
  DFFQX1 \string_reg[20][3]  ( .D(n418), .CK(clk), .Q(\string[20][3] ) );
  DFFQX1 \string_reg[22][3]  ( .D(n434), .CK(clk), .Q(\string[22][3] ) );
  DFFQX1 \string_reg[17][1]  ( .D(n396), .CK(clk), .Q(\string[17][1] ) );
  DFFQX1 \string_reg[28][1]  ( .D(n484), .CK(clk), .Q(\string[28][1] ) );
  DFFQX1 \string_reg[20][0]  ( .D(n421), .CK(clk), .Q(\string[20][0] ) );
  DFFQX1 \string_reg[30][1]  ( .D(n500), .CK(clk), .Q(\string[30][1] ) );
  DFFQX1 \string_reg[18][1]  ( .D(n404), .CK(clk), .Q(\string[18][1] ) );
  DFFQX1 \string_reg[22][0]  ( .D(n437), .CK(clk), .Q(\string[22][0] ) );
  DFFQX1 \string_reg[20][1]  ( .D(n420), .CK(clk), .Q(\string[20][1] ) );
  DFFQX1 \string_reg[22][1]  ( .D(n436), .CK(clk), .Q(\string[22][1] ) );
  DFFQX1 \pattern_reg[5][6]  ( .D(n566), .CK(clk), .Q(\pattern[5][6] ) );
  DFFQX1 \pattern_reg[7][6]  ( .D(n586), .CK(clk), .Q(\pattern[7][6] ) );
  DFFQX1 \pattern_reg[4][6]  ( .D(n558), .CK(clk), .Q(\pattern[4][6] ) );
  DFFQX1 \pattern_reg[6][6]  ( .D(n574), .CK(clk), .Q(\pattern[6][6] ) );
  DFFQX1 \pattern_reg[3][6]  ( .D(n550), .CK(clk), .Q(\pattern[3][6] ) );
  DFFQX1 \pattern_reg[1][6]  ( .D(n534), .CK(clk), .Q(\pattern[1][6] ) );
  DFFQX1 \pattern_reg[2][6]  ( .D(n542), .CK(clk), .Q(\pattern[2][6] ) );
  DFFQX1 \pattern_reg[0][6]  ( .D(n526), .CK(clk), .Q(\pattern[0][6] ) );
  DFFQX1 \pattern_reg[5][4]  ( .D(n568), .CK(clk), .Q(\pattern[5][4] ) );
  DFFQX1 \pattern_reg[7][4]  ( .D(n584), .CK(clk), .Q(\pattern[7][4] ) );
  DFFQX1 \pattern_reg[4][4]  ( .D(n560), .CK(clk), .Q(\pattern[4][4] ) );
  DFFQX1 \pattern_reg[6][4]  ( .D(n576), .CK(clk), .Q(\pattern[6][4] ) );
  DFFQX1 \pattern_reg[5][7]  ( .D(n565), .CK(clk), .Q(\pattern[5][7] ) );
  DFFQX1 \pattern_reg[7][7]  ( .D(n587), .CK(clk), .Q(\pattern[7][7] ) );
  DFFQX1 \pattern_reg[3][4]  ( .D(n552), .CK(clk), .Q(\pattern[3][4] ) );
  DFFQX1 \pattern_reg[4][7]  ( .D(n557), .CK(clk), .Q(\pattern[4][7] ) );
  DFFQX1 \pattern_reg[1][4]  ( .D(n536), .CK(clk), .Q(\pattern[1][4] ) );
  DFFQX1 \pattern_reg[6][7]  ( .D(n573), .CK(clk), .Q(\pattern[6][7] ) );
  DFFQX1 \pattern_reg[2][4]  ( .D(n544), .CK(clk), .Q(\pattern[2][4] ) );
  DFFQX1 \pattern_reg[0][4]  ( .D(n528), .CK(clk), .Q(\pattern[0][4] ) );
  DFFQX1 \pattern_reg[3][7]  ( .D(n549), .CK(clk), .Q(\pattern[3][7] ) );
  DFFQX1 \pattern_reg[5][2]  ( .D(n570), .CK(clk), .Q(\pattern[5][2] ) );
  DFFQX1 \pattern_reg[7][2]  ( .D(n582), .CK(clk), .Q(\pattern[7][2] ) );
  DFFQX1 \pattern_reg[1][7]  ( .D(n533), .CK(clk), .Q(\pattern[1][7] ) );
  DFFQX1 \pattern_reg[5][5]  ( .D(n567), .CK(clk), .Q(\pattern[5][5] ) );
  DFFQX1 \pattern_reg[4][2]  ( .D(n562), .CK(clk), .Q(\pattern[4][2] ) );
  DFFQX1 \pattern_reg[2][7]  ( .D(n541), .CK(clk), .Q(\pattern[2][7] ) );
  DFFQX1 \pattern_reg[7][5]  ( .D(n585), .CK(clk), .Q(\pattern[7][5] ) );
  DFFQX1 \pattern_reg[6][2]  ( .D(n578), .CK(clk), .Q(\pattern[6][2] ) );
  DFFQX1 \pattern_reg[0][7]  ( .D(n525), .CK(clk), .Q(\pattern[0][7] ) );
  DFFQX1 \pattern_reg[5][0]  ( .D(n572), .CK(clk), .Q(\pattern[5][0] ) );
  DFFQX1 \pattern_reg[7][0]  ( .D(n588), .CK(clk), .Q(\pattern[7][0] ) );
  DFFQX1 \pattern_reg[4][5]  ( .D(n559), .CK(clk), .Q(\pattern[4][5] ) );
  DFFQX1 \pattern_reg[6][5]  ( .D(n575), .CK(clk), .Q(\pattern[6][5] ) );
  DFFQX1 \pattern_reg[4][0]  ( .D(n564), .CK(clk), .Q(\pattern[4][0] ) );
  DFFQX1 \pattern_reg[3][2]  ( .D(n554), .CK(clk), .Q(\pattern[3][2] ) );
  DFFQX1 \pattern_reg[6][0]  ( .D(n580), .CK(clk), .Q(\pattern[6][0] ) );
  DFFQX1 \pattern_reg[1][2]  ( .D(n538), .CK(clk), .Q(\pattern[1][2] ) );
  DFFQX1 \pattern_reg[3][5]  ( .D(n551), .CK(clk), .Q(\pattern[3][5] ) );
  DFFQX1 \pattern_reg[2][2]  ( .D(n546), .CK(clk), .Q(\pattern[2][2] ) );
  DFFQX1 \pattern_reg[1][5]  ( .D(n535), .CK(clk), .Q(\pattern[1][5] ) );
  DFFQX1 \pattern_reg[0][2]  ( .D(n530), .CK(clk), .Q(\pattern[0][2] ) );
  DFFQX1 \pattern_reg[3][0]  ( .D(n556), .CK(clk), .Q(\pattern[3][0] ) );
  DFFQX1 \pattern_reg[1][0]  ( .D(n540), .CK(clk), .Q(\pattern[1][0] ) );
  DFFQX1 \pattern_reg[2][5]  ( .D(n543), .CK(clk), .Q(\pattern[2][5] ) );
  DFFQX1 \pattern_reg[0][5]  ( .D(n527), .CK(clk), .Q(\pattern[0][5] ) );
  DFFQX1 \pattern_reg[2][0]  ( .D(n548), .CK(clk), .Q(\pattern[2][0] ) );
  DFFQX1 \pattern_reg[5][3]  ( .D(n569), .CK(clk), .Q(\pattern[5][3] ) );
  DFFQX1 \pattern_reg[0][0]  ( .D(n532), .CK(clk), .Q(\pattern[0][0] ) );
  DFFQX1 \pattern_reg[7][3]  ( .D(n583), .CK(clk), .Q(\pattern[7][3] ) );
  DFFQX1 \pattern_reg[5][1]  ( .D(n571), .CK(clk), .Q(\pattern[5][1] ) );
  DFFQX1 \pattern_reg[4][3]  ( .D(n561), .CK(clk), .Q(\pattern[4][3] ) );
  DFFQX1 \pattern_reg[7][1]  ( .D(n581), .CK(clk), .Q(\pattern[7][1] ) );
  DFFQX1 \pattern_reg[6][3]  ( .D(n577), .CK(clk), .Q(\pattern[6][3] ) );
  DFFQX1 \pattern_reg[4][1]  ( .D(n563), .CK(clk), .Q(\pattern[4][1] ) );
  DFFQX1 \pattern_reg[6][1]  ( .D(n579), .CK(clk), .Q(\pattern[6][1] ) );
  DFFQX1 \pattern_reg[3][3]  ( .D(n553), .CK(clk), .Q(\pattern[3][3] ) );
  DFFQX1 \pattern_reg[1][3]  ( .D(n537), .CK(clk), .Q(\pattern[1][3] ) );
  DFFQX1 \pattern_reg[3][1]  ( .D(n555), .CK(clk), .Q(\pattern[3][1] ) );
  DFFQX1 \pattern_reg[2][3]  ( .D(n545), .CK(clk), .Q(\pattern[2][3] ) );
  DFFQX1 \pattern_reg[1][1]  ( .D(n539), .CK(clk), .Q(\pattern[1][1] ) );
  DFFQX1 \pattern_reg[0][3]  ( .D(n529), .CK(clk), .Q(\pattern[0][3] ) );
  DFFQX1 \pattern_reg[2][1]  ( .D(n547), .CK(clk), .Q(\pattern[2][1] ) );
  DFFQX1 \pattern_reg[0][1]  ( .D(n531), .CK(clk), .Q(\pattern[0][1] ) );
  DFFSX1 newstr_reg ( .D(n510), .CK(clk), .SN(n940), .Q(newstr), .QN(N71) );
  DFFRX1 valid_reg ( .D(n227), .CK(clk), .RN(n940), .QN(n599) );
  DFFRX1 \str_len_reg[1]  ( .D(n222), .CK(clk), .RN(n940), .Q(str_len[1]), 
        .QN(n246) );
  DFFRX1 \pat_len_reg[0]  ( .D(n590), .CK(clk), .RN(n940), .Q(pat_len[0]), 
        .QN(n243) );
  DFFRX1 \str_len_reg[4]  ( .D(n225), .CK(clk), .RN(n940), .Q(str_len[4]), 
        .QN(n953) );
  DFFRX1 \str_len_reg[5]  ( .D(n226), .CK(clk), .RN(n940), .Q(str_len[5]), 
        .QN(n244) );
  DFFRX1 match_reg ( .D(n592), .CK(clk), .RN(n940), .Q(n966), .QN(n214) );
  DFFRX1 \cur_pat_reg[1]  ( .D(n595), .CK(clk), .RN(n940), .Q(N43), .QN(n647)
         );
  DFFRX1 \cur_pat_reg[2]  ( .D(n594), .CK(clk), .RN(n940), .Q(N44), .QN(n646)
         );
  DFFRX1 \match_index_reg[4]  ( .D(n249), .CK(clk), .RN(n940), .Q(n967), .QN(
        n220) );
  DFFRX1 \match_index_reg[3]  ( .D(n250), .CK(clk), .RN(n940), .Q(n968), .QN(
        n219) );
  DFFRX1 \match_index_reg[2]  ( .D(n251), .CK(clk), .RN(n940), .Q(n969), .QN(
        n218) );
  DFFRX1 \match_index_reg[1]  ( .D(n252), .CK(clk), .RN(n940), .Q(n970), .QN(
        n217) );
  DFFRX1 \match_index_reg[0]  ( .D(n253), .CK(clk), .RN(n940), .Q(n971), .QN(
        N273) );
  DFFRX1 \pat_len_reg[1]  ( .D(n589), .CK(clk), .RN(n940), .Q(pat_len[1]), 
        .QN(n242) );
  DFFRX1 \cur_str_reg[3]  ( .D(n521), .CK(clk), .RN(n940), .Q(N48), .QN(n838)
         );
  DFFRX1 \cur_str_reg[2]  ( .D(n522), .CK(clk), .RN(n940), .Q(N47), .QN(n839)
         );
  DFFRX1 \cur_str_reg[1]  ( .D(n523), .CK(clk), .RN(n940), .Q(N46), .QN(n238)
         );
  DFFRX1 \cur_str_reg[0]  ( .D(n524), .CK(clk), .RN(n940), .Q(N45), .QN(n840)
         );
  DFFRX1 \cur_str_reg[5]  ( .D(n597), .CK(clk), .RN(n940), .Q(\cur_str[5] ), 
        .QN(n234) );
  DFFRX1 \pat_start_reg[3]  ( .D(n516), .CK(clk), .RN(n940), .Q(pat_start[3]), 
        .QN(n917) );
  DFFRX1 \pat_start_reg[0]  ( .D(n519), .CK(clk), .RN(n940), .QN(n919) );
  DFFRX1 \pat_start_reg[2]  ( .D(n517), .CK(clk), .RN(n940), .Q(pat_start[2]), 
        .QN(n918) );
  DFFRX1 \pat_start_reg[1]  ( .D(n518), .CK(clk), .RN(n940), .Q(pat_start[1]), 
        .QN(n916) );
  DFFRX1 \pat_len_reg[2]  ( .D(n938), .CK(clk), .RN(n940), .Q(pat_len[2]), 
        .QN(n241) );
  DFFRX1 \pat_len_reg[3]  ( .D(n591), .CK(clk), .RN(n940), .Q(pat_len[3]), 
        .QN(n240) );
  DFFRX1 \str_start_reg[5]  ( .D(n598), .CK(clk), .RN(n940), .Q(str_start[5]), 
        .QN(n609) );
  DFFRXL \str_len_reg[2]  ( .D(n223), .CK(clk), .RN(n940), .Q(str_len[2]), 
        .QN(n600) );
  DFFRXL \str_start_reg[4]  ( .D(n515), .CK(clk), .RN(n940), .Q(str_start[4])
         );
  DFFRXL \str_start_reg[3]  ( .D(n514), .CK(clk), .RN(n940), .Q(str_start[3])
         );
  DFFRXL \str_start_reg[2]  ( .D(n513), .CK(clk), .RN(n940), .Q(str_start[2])
         );
  DFFRXL \str_start_reg[1]  ( .D(n512), .CK(clk), .RN(n940), .Q(str_start[1])
         );
  DFFRX2 \cur_pat_reg[0]  ( .D(n596), .CK(clk), .RN(n940), .Q(N42), .QN(n648)
         );
  DFFRX2 \cur_str_reg[4]  ( .D(n520), .CK(clk), .RN(n940), .Q(N49), .QN(n837)
         );
  DFFRX1 \str_start_reg[0]  ( .D(n511), .CK(clk), .RN(n940), .Q(str_start[0])
         );
  DFFRX2 \str_len_reg[3]  ( .D(n224), .CK(clk), .RN(n940), .Q(str_len[3]), 
        .QN(n954) );
  DFFRX2 \str_len_reg[0]  ( .D(n221), .CK(clk), .RN(n940), .Q(str_len[0]), 
        .QN(n955) );
  NOR4X1 U551 ( .A(n950), .B(newstr), .C(reset), .D(str_len[5]), .Y(n71) );
  NOR3BX2 U552 ( .AN(n71), .B(str_len[3]), .C(str_len[4]), .Y(n58) );
  NOR3BX2 U553 ( .AN(n71), .B(n953), .C(str_len[3]), .Y(n82) );
  INVX12 U554 ( .A(n599), .Y(valid) );
  INVX8 U555 ( .A(reset), .Y(n940) );
  OAI22X1 U556 ( .A0(n648), .A1(n637), .B0(N42), .B1(n636), .Y(N51) );
  OAI22X1 U557 ( .A0(n648), .A1(n629), .B0(N42), .B1(n628), .Y(N53) );
  OAI22X1 U558 ( .A0(n645), .A1(n648), .B0(N42), .B1(n644), .Y(N50) );
  OAI22X1 U559 ( .A0(n648), .A1(n613), .B0(N42), .B1(n612), .Y(N57) );
  OAI22X1 U560 ( .A0(n648), .A1(n621), .B0(N42), .B1(n620), .Y(N55) );
  OAI22X1 U561 ( .A0(n648), .A1(n633), .B0(N42), .B1(n632), .Y(N52) );
  NOR4X1 U562 ( .A(n960), .B(n210), .C(N54), .D(N56), .Y(n172) );
  OAI22X1 U563 ( .A0(n648), .A1(n617), .B0(N42), .B1(n616), .Y(N56) );
  BUFX12 U564 ( .A(n970), .Y(match_index[1]) );
  BUFX12 U565 ( .A(n966), .Y(match) );
  BUFX12 U566 ( .A(n969), .Y(match_index[2]) );
  BUFX12 U567 ( .A(n968), .Y(match_index[3]) );
  BUFX12 U568 ( .A(n967), .Y(match_index[4]) );
  XOR2XL U569 ( .A(\r536/carry [4]), .B(match_index[4]), .Y(N281) );
  OAI22X1 U570 ( .A0(n648), .A1(n625), .B0(N42), .B1(n624), .Y(N54) );
  INVX12 U571 ( .A(N273), .Y(match_index[0]) );
  INVXL U572 ( .A(N55), .Y(n960) );
  CLKINVX1 U573 ( .A(n121), .Y(n957) );
  OA21XL U574 ( .A0(n169), .A1(n959), .B0(n41), .Y(n147) );
  OAI21XL U575 ( .A0(isstring), .A1(n147), .B0(n38), .Y(n144) );
  AND3X2 U576 ( .A(n953), .B(str_len[3]), .C(n71), .Y(n73) );
  CLKBUFX3 U577 ( .A(n138), .Y(n859) );
  CLKBUFX3 U578 ( .A(n136), .Y(n860) );
  CLKBUFX3 U579 ( .A(n130), .Y(n864) );
  CLKBUFX3 U580 ( .A(n133), .Y(n862) );
  CLKBUFX3 U581 ( .A(n139), .Y(n858) );
  CLKBUFX3 U582 ( .A(n98), .Y(n865) );
  CLKBUFX3 U583 ( .A(n45), .Y(n896) );
  CLKINVX1 U584 ( .A(chardata[0]), .Y(n948) );
  CLKINVX1 U585 ( .A(chardata[1]), .Y(n947) );
  CLKINVX1 U586 ( .A(chardata[2]), .Y(n946) );
  CLKINVX1 U587 ( .A(chardata[3]), .Y(n945) );
  CLKINVX1 U588 ( .A(chardata[4]), .Y(n944) );
  CLKINVX1 U589 ( .A(chardata[5]), .Y(n943) );
  CLKINVX1 U590 ( .A(chardata[6]), .Y(n942) );
  CLKINVX1 U591 ( .A(chardata[7]), .Y(n941) );
  NOR3BX1 U592 ( .AN(str_len[1]), .B(n955), .C(n600), .Y(n70) );
  NOR3BX1 U593 ( .AN(n246), .B(n600), .C(n955), .Y(n66) );
  NOR3X1 U594 ( .A(str_len[1]), .B(n899), .C(str_len[0]), .Y(n55) );
  NOR3X1 U595 ( .A(n246), .B(n899), .C(n955), .Y(n62) );
  NOR3X1 U596 ( .A(str_len[0]), .B(n899), .C(n246), .Y(n60) );
  NOR3X1 U597 ( .A(str_len[1]), .B(n899), .C(n955), .Y(n57) );
  NAND2X1 U598 ( .A(n119), .B(n936), .Y(n102) );
  CLKINVX1 U599 ( .A(n104), .Y(n936) );
  NAND2X1 U600 ( .A(n119), .B(n113), .Y(n115) );
  NOR2X1 U601 ( .A(n957), .B(n937), .Y(n119) );
  OAI21X2 U602 ( .A0(n186), .A1(n937), .B0(n949), .Y(n104) );
  AOI31X1 U603 ( .A0(n957), .A1(n959), .A2(n191), .B0(n174), .Y(n186) );
  OAI21XL U604 ( .A0(n956), .A1(n171), .B0(n43), .Y(n191) );
  INVX3 U605 ( .A(n150), .Y(n949) );
  NAND3X1 U606 ( .A(n936), .B(n957), .C(n147), .Y(n100) );
  NOR2X2 U607 ( .A(n150), .B(n119), .Y(n123) );
  CLKINVX1 U608 ( .A(n165), .Y(n935) );
  OAI211X1 U609 ( .A0(n166), .A1(n162), .B0(n41), .C0(n123), .Y(n165) );
  NOR2X1 U610 ( .A(n167), .B(n168), .Y(n166) );
  AO21X1 U611 ( .A0(n949), .A1(n121), .B0(n227), .Y(n113) );
  NOR2X1 U612 ( .A(n150), .B(n147), .Y(n227) );
  NAND2X1 U613 ( .A(n949), .B(n41), .Y(n152) );
  OAI31X1 U614 ( .A0(n171), .A1(n956), .A2(n172), .B0(n958), .Y(n162) );
  CLKINVX1 U615 ( .A(n174), .Y(n958) );
  CLKINVX1 U616 ( .A(n167), .Y(n956) );
  NOR2X1 U617 ( .A(n192), .B(n960), .Y(n174) );
  CLKINVX1 U618 ( .A(n172), .Y(n959) );
  NAND4BX1 U619 ( .AN(N58), .B(N60), .C(n195), .D(n196), .Y(n168) );
  NOR2X1 U620 ( .A(N61), .B(N59), .Y(n195) );
  NOR4X1 U621 ( .A(N65), .B(N64), .C(N63), .D(N62), .Y(n196) );
  CLKINVX1 U622 ( .A(n41), .Y(n937) );
  CLKBUFX3 U623 ( .A(n89), .Y(n873) );
  NAND2X1 U624 ( .A(n82), .B(n70), .Y(n89) );
  CLKBUFX3 U625 ( .A(n88), .Y(n874) );
  NAND2X1 U626 ( .A(n82), .B(n68), .Y(n88) );
  CLKBUFX3 U627 ( .A(n87), .Y(n875) );
  NAND2X1 U628 ( .A(n82), .B(n66), .Y(n87) );
  CLKBUFX3 U629 ( .A(n86), .Y(n876) );
  NAND2X1 U630 ( .A(n82), .B(n64), .Y(n86) );
  CLKBUFX3 U631 ( .A(n85), .Y(n877) );
  NAND2X1 U632 ( .A(n82), .B(n62), .Y(n85) );
  CLKBUFX3 U633 ( .A(n84), .Y(n878) );
  NAND2X1 U634 ( .A(n82), .B(n60), .Y(n84) );
  CLKBUFX3 U635 ( .A(n83), .Y(n879) );
  NAND2X1 U636 ( .A(n82), .B(n57), .Y(n83) );
  CLKBUFX3 U637 ( .A(n81), .Y(n880) );
  NAND2X1 U638 ( .A(n82), .B(n55), .Y(n81) );
  OAI21XL U639 ( .A0(n956), .A1(n40), .B0(n41), .Y(n37) );
  CLKINVX1 U640 ( .A(n42), .Y(n952) );
  NAND3X1 U641 ( .A(n43), .B(n950), .C(n957), .Y(n35) );
  NOR3BX2 U642 ( .AN(n71), .B(n953), .C(n954), .Y(n91) );
  CLKBUFX3 U643 ( .A(n97), .Y(n866) );
  NAND2X1 U644 ( .A(n91), .B(n68), .Y(n97) );
  CLKBUFX3 U645 ( .A(n96), .Y(n867) );
  NAND2X1 U646 ( .A(n91), .B(n66), .Y(n96) );
  CLKBUFX3 U647 ( .A(n95), .Y(n868) );
  NAND2X1 U648 ( .A(n91), .B(n64), .Y(n95) );
  CLKBUFX3 U649 ( .A(n94), .Y(n869) );
  NAND2X1 U650 ( .A(n91), .B(n62), .Y(n94) );
  CLKBUFX3 U651 ( .A(n93), .Y(n870) );
  NAND2X1 U652 ( .A(n91), .B(n60), .Y(n93) );
  CLKBUFX3 U653 ( .A(n92), .Y(n871) );
  NAND2X1 U654 ( .A(n91), .B(n57), .Y(n92) );
  CLKBUFX3 U655 ( .A(n90), .Y(n872) );
  NAND2X1 U656 ( .A(n91), .B(n55), .Y(n90) );
  CLKBUFX3 U657 ( .A(n69), .Y(n889) );
  NAND2X1 U658 ( .A(n70), .B(n58), .Y(n69) );
  CLKBUFX3 U659 ( .A(n67), .Y(n890) );
  NAND2X1 U660 ( .A(n68), .B(n58), .Y(n67) );
  CLKBUFX3 U661 ( .A(n65), .Y(n891) );
  NAND2X1 U662 ( .A(n66), .B(n58), .Y(n65) );
  CLKBUFX3 U663 ( .A(n63), .Y(n892) );
  NAND2X1 U664 ( .A(n64), .B(n58), .Y(n63) );
  CLKBUFX3 U665 ( .A(n61), .Y(n893) );
  NAND2X1 U666 ( .A(n62), .B(n58), .Y(n61) );
  CLKBUFX3 U667 ( .A(n59), .Y(n894) );
  NAND2X1 U668 ( .A(n60), .B(n58), .Y(n59) );
  CLKBUFX3 U669 ( .A(n56), .Y(n895) );
  NAND2X1 U670 ( .A(n57), .B(n58), .Y(n56) );
  NAND2X1 U671 ( .A(n951), .B(n950), .Y(n150) );
  CLKBUFX3 U672 ( .A(n80), .Y(n881) );
  NAND2X1 U673 ( .A(n73), .B(n70), .Y(n80) );
  NAND4X1 U674 ( .A(n123), .B(n42), .C(n41), .D(n161), .Y(n122) );
  CLKBUFX3 U675 ( .A(n78), .Y(n883) );
  NAND2X1 U676 ( .A(n73), .B(n66), .Y(n78) );
  CLKBUFX3 U677 ( .A(n76), .Y(n885) );
  NAND2X1 U678 ( .A(n73), .B(n62), .Y(n76) );
  CLKBUFX3 U679 ( .A(n75), .Y(n886) );
  NAND2X1 U680 ( .A(n73), .B(n60), .Y(n75) );
  CLKBUFX3 U681 ( .A(n74), .Y(n887) );
  NAND2X1 U682 ( .A(n73), .B(n57), .Y(n74) );
  CLKBUFX3 U683 ( .A(n79), .Y(n882) );
  NAND2X1 U684 ( .A(n73), .B(n68), .Y(n79) );
  CLKBUFX3 U685 ( .A(n77), .Y(n884) );
  NAND2X1 U686 ( .A(n73), .B(n64), .Y(n77) );
  CLKBUFX3 U687 ( .A(n72), .Y(n888) );
  NAND2X1 U688 ( .A(n73), .B(n55), .Y(n72) );
  CLKBUFX3 U689 ( .A(n140), .Y(n857) );
  NAND3X1 U690 ( .A(n898), .B(n897), .C(n137), .Y(n140) );
  CLKBUFX3 U691 ( .A(n134), .Y(n861) );
  NAND3X1 U692 ( .A(n898), .B(n897), .C(n131), .Y(n134) );
  OAI21XL U693 ( .A0(n897), .A1(n951), .B0(n141), .Y(n32) );
  AOI2BB1X1 U694 ( .A0N(n898), .A1N(n951), .B0(n939), .Y(n141) );
  CLKINVX1 U695 ( .A(n144), .Y(n939) );
  CLKBUFX3 U696 ( .A(n946), .Y(n910) );
  CLKBUFX3 U697 ( .A(n941), .Y(n900) );
  CLKBUFX3 U698 ( .A(n942), .Y(n902) );
  CLKBUFX3 U699 ( .A(n943), .Y(n904) );
  CLKBUFX3 U700 ( .A(n944), .Y(n906) );
  CLKBUFX3 U701 ( .A(n945), .Y(n908) );
  CLKBUFX3 U702 ( .A(n948), .Y(n914) );
  CLKBUFX3 U703 ( .A(n947), .Y(n912) );
  CLKBUFX3 U704 ( .A(n943), .Y(n905) );
  CLKBUFX3 U705 ( .A(n941), .Y(n901) );
  CLKBUFX3 U706 ( .A(n942), .Y(n903) );
  CLKBUFX3 U707 ( .A(n948), .Y(n915) );
  CLKBUFX3 U708 ( .A(n947), .Y(n913) );
  CLKBUFX3 U709 ( .A(n946), .Y(n911) );
  CLKBUFX3 U710 ( .A(n945), .Y(n909) );
  CLKBUFX3 U711 ( .A(n944), .Y(n907) );
  XOR2XL U712 ( .A(N64), .B(N56), .Y(n203) );
  AOI2BB1X1 U713 ( .A0N(n169), .A1N(n959), .B0(n162), .Y(n42) );
  NAND2X1 U714 ( .A(n198), .B(n199), .Y(n171) );
  NOR4X1 U715 ( .A(n204), .B(n205), .C(n206), .D(n207), .Y(n198) );
  NOR4X1 U716 ( .A(n200), .B(n201), .C(n202), .D(n203), .Y(n199) );
  XOR2XL U717 ( .A(N59), .B(N51), .Y(n204) );
  XOR2X1 U718 ( .A(N62), .B(N54), .Y(n201) );
  CLKBUFX3 U719 ( .A(n642), .Y(n650) );
  NOR2X1 U720 ( .A(n646), .B(n647), .Y(n642) );
  XOR2X1 U721 ( .A(N65), .B(N57), .Y(n202) );
  XOR2X1 U722 ( .A(N60), .B(N52), .Y(n207) );
  NAND2X1 U723 ( .A(n208), .B(n209), .Y(n167) );
  AND4XL U724 ( .A(N51), .B(N53), .C(N54), .D(N56), .Y(n208) );
  NOR4XL U725 ( .A(N57), .B(N52), .C(N50), .D(n960), .Y(n209) );
  NAND3BXL U726 ( .AN(n210), .B(N54), .C(N56), .Y(n192) );
  NAND4BBXL U727 ( .AN(N50), .BN(N51), .C(N52), .D(n211), .Y(n210) );
  NOR2XL U728 ( .A(N57), .B(N53), .Y(n211) );
  XOR2X1 U729 ( .A(N58), .B(N50), .Y(n205) );
  XOR2X1 U730 ( .A(N63), .B(N55), .Y(n200) );
  CLKBUFX3 U731 ( .A(n826), .Y(n856) );
  NAND2X1 U732 ( .A(n664), .B(n663), .Y(n826) );
  CLKBUFX3 U733 ( .A(n824), .Y(n854) );
  NAND2X1 U734 ( .A(n664), .B(n661), .Y(n824) );
  CLKBUFX3 U735 ( .A(n820), .Y(n852) );
  NAND2X1 U736 ( .A(n659), .B(n663), .Y(n820) );
  NOR2X1 U737 ( .A(n192), .B(N55), .Y(n121) );
  CLKBUFX3 U738 ( .A(n822), .Y(n850) );
  NAND2X1 U739 ( .A(n659), .B(n660), .Y(n822) );
  CLKBUFX3 U740 ( .A(n812), .Y(n846) );
  NAND2X1 U741 ( .A(n661), .B(n654), .Y(n812) );
  CLKBUFX3 U742 ( .A(n810), .Y(n844) );
  NAND2X1 U743 ( .A(n653), .B(n663), .Y(n810) );
  XOR2X1 U744 ( .A(N61), .B(N53), .Y(n206) );
  CLKBUFX3 U745 ( .A(n828), .Y(n842) );
  NAND2X1 U746 ( .A(n653), .B(n661), .Y(n828) );
  CLKBUFX3 U747 ( .A(n814), .Y(n848) );
  NAND2X1 U748 ( .A(n663), .B(n654), .Y(n814) );
  CLKBUFX3 U749 ( .A(n827), .Y(n855) );
  NAND2X1 U750 ( .A(n664), .B(n662), .Y(n827) );
  CLKBUFX3 U751 ( .A(n821), .Y(n849) );
  NAND2XL U752 ( .A(n659), .B(n661), .Y(n821) );
  CLKBUFX3 U753 ( .A(n825), .Y(n853) );
  NAND2XL U754 ( .A(n664), .B(n660), .Y(n825) );
  CLKBUFX3 U755 ( .A(n823), .Y(n851) );
  NAND2XL U756 ( .A(n659), .B(n662), .Y(n823) );
  CLKBUFX3 U757 ( .A(n815), .Y(n847) );
  NAND2X1 U758 ( .A(n654), .B(n662), .Y(n815) );
  CLKBUFX3 U759 ( .A(n813), .Y(n845) );
  NAND2XL U760 ( .A(n660), .B(n654), .Y(n813) );
  CLKBUFX3 U761 ( .A(n811), .Y(n843) );
  NAND2X1 U762 ( .A(n653), .B(n662), .Y(n811) );
  NAND2BX1 U763 ( .AN(n161), .B(n168), .Y(n43) );
  CLKBUFX3 U764 ( .A(n809), .Y(n841) );
  NAND2XL U765 ( .A(n653), .B(n660), .Y(n809) );
  CLKINVX1 U766 ( .A(n923), .Y(n932) );
  NOR2BX2 U767 ( .AN(n149), .B(N178), .Y(n41) );
  NAND3X1 U768 ( .A(n161), .B(n957), .C(n42), .Y(n153) );
  NOR3BX1 U769 ( .AN(n161), .B(n121), .C(n162), .Y(n154) );
  CLKINVX1 U770 ( .A(N169), .Y(n933) );
  ADDHXL U771 ( .A(n899), .B(\add_66_2/carry [2]), .CO(\add_66_2/carry [3]), 
        .S(N174) );
  CLKINVX1 U772 ( .A(N173), .Y(n931) );
  CLKINVX1 U773 ( .A(\r537/SUM[4] ), .Y(n961) );
  CLKINVX1 U774 ( .A(\r537/SUM[3] ), .Y(n962) );
  CLKINVX1 U775 ( .A(\r537/SUM[2] ), .Y(n963) );
  CLKINVX1 U776 ( .A(\r537/SUM[1] ), .Y(n964) );
  INVX3 U777 ( .A(isstring), .Y(n950) );
  OAI2BB2XL U778 ( .B0(n914), .B1(n873), .A0N(\string[23][0] ), .A1N(n873), 
        .Y(n445) );
  OAI2BB2XL U779 ( .B0(n912), .B1(n873), .A0N(\string[23][1] ), .A1N(n873), 
        .Y(n444) );
  OAI2BB2XL U780 ( .B0(n910), .B1(n873), .A0N(\string[23][2] ), .A1N(n873), 
        .Y(n443) );
  OAI2BB2XL U781 ( .B0(n908), .B1(n873), .A0N(\string[23][3] ), .A1N(n873), 
        .Y(n442) );
  OAI2BB2XL U782 ( .B0(n906), .B1(n873), .A0N(\string[23][4] ), .A1N(n873), 
        .Y(n441) );
  OAI2BB2XL U783 ( .B0(n904), .B1(n873), .A0N(\string[23][5] ), .A1N(n873), 
        .Y(n440) );
  OAI2BB2XL U784 ( .B0(n902), .B1(n873), .A0N(\string[23][6] ), .A1N(n873), 
        .Y(n439) );
  OAI2BB2XL U785 ( .B0(n900), .B1(n873), .A0N(\string[23][7] ), .A1N(n873), 
        .Y(n438) );
  OAI2BB2XL U786 ( .B0(n914), .B1(n874), .A0N(\string[22][0] ), .A1N(n874), 
        .Y(n437) );
  OAI2BB2XL U787 ( .B0(n912), .B1(n874), .A0N(\string[22][1] ), .A1N(n874), 
        .Y(n436) );
  OAI2BB2XL U788 ( .B0(n910), .B1(n874), .A0N(\string[22][2] ), .A1N(n874), 
        .Y(n435) );
  OAI2BB2XL U789 ( .B0(n908), .B1(n874), .A0N(\string[22][3] ), .A1N(n874), 
        .Y(n434) );
  OAI2BB2XL U790 ( .B0(n906), .B1(n874), .A0N(\string[22][4] ), .A1N(n874), 
        .Y(n433) );
  OAI2BB2XL U791 ( .B0(n904), .B1(n874), .A0N(\string[22][5] ), .A1N(n874), 
        .Y(n432) );
  OAI2BB2XL U792 ( .B0(n902), .B1(n874), .A0N(\string[22][6] ), .A1N(n874), 
        .Y(n431) );
  OAI2BB2XL U793 ( .B0(n900), .B1(n874), .A0N(\string[22][7] ), .A1N(n874), 
        .Y(n430) );
  OAI2BB2XL U794 ( .B0(n914), .B1(n875), .A0N(\string[21][0] ), .A1N(n875), 
        .Y(n429) );
  OAI2BB2XL U795 ( .B0(n912), .B1(n875), .A0N(\string[21][1] ), .A1N(n875), 
        .Y(n428) );
  OAI2BB2XL U796 ( .B0(n910), .B1(n875), .A0N(\string[21][2] ), .A1N(n875), 
        .Y(n427) );
  OAI2BB2XL U797 ( .B0(n908), .B1(n875), .A0N(\string[21][3] ), .A1N(n875), 
        .Y(n426) );
  OAI2BB2XL U798 ( .B0(n906), .B1(n875), .A0N(\string[21][4] ), .A1N(n875), 
        .Y(n425) );
  OAI2BB2XL U799 ( .B0(n904), .B1(n875), .A0N(\string[21][5] ), .A1N(n875), 
        .Y(n424) );
  OAI2BB2XL U800 ( .B0(n902), .B1(n875), .A0N(\string[21][6] ), .A1N(n875), 
        .Y(n423) );
  OAI2BB2XL U801 ( .B0(n900), .B1(n875), .A0N(\string[21][7] ), .A1N(n875), 
        .Y(n422) );
  OAI2BB2XL U802 ( .B0(n914), .B1(n876), .A0N(\string[20][0] ), .A1N(n876), 
        .Y(n421) );
  OAI2BB2XL U803 ( .B0(n912), .B1(n876), .A0N(\string[20][1] ), .A1N(n876), 
        .Y(n420) );
  OAI2BB2XL U804 ( .B0(n910), .B1(n876), .A0N(\string[20][2] ), .A1N(n876), 
        .Y(n419) );
  OAI2BB2XL U805 ( .B0(n908), .B1(n876), .A0N(\string[20][3] ), .A1N(n876), 
        .Y(n418) );
  OAI2BB2XL U806 ( .B0(n906), .B1(n876), .A0N(\string[20][4] ), .A1N(n876), 
        .Y(n417) );
  OAI2BB2XL U807 ( .B0(n904), .B1(n876), .A0N(\string[20][5] ), .A1N(n876), 
        .Y(n416) );
  OAI2BB2XL U808 ( .B0(n902), .B1(n876), .A0N(\string[20][6] ), .A1N(n876), 
        .Y(n415) );
  OAI2BB2XL U809 ( .B0(n900), .B1(n876), .A0N(\string[20][7] ), .A1N(n876), 
        .Y(n414) );
  OAI2BB2XL U810 ( .B0(n914), .B1(n877), .A0N(\string[19][0] ), .A1N(n877), 
        .Y(n413) );
  OAI2BB2XL U811 ( .B0(n912), .B1(n877), .A0N(\string[19][1] ), .A1N(n877), 
        .Y(n412) );
  OAI2BB2XL U812 ( .B0(n910), .B1(n877), .A0N(\string[19][2] ), .A1N(n877), 
        .Y(n411) );
  OAI2BB2XL U813 ( .B0(n908), .B1(n877), .A0N(\string[19][3] ), .A1N(n877), 
        .Y(n410) );
  OAI2BB2XL U814 ( .B0(n906), .B1(n877), .A0N(\string[19][4] ), .A1N(n877), 
        .Y(n409) );
  OAI2BB2XL U815 ( .B0(n904), .B1(n877), .A0N(\string[19][5] ), .A1N(n877), 
        .Y(n408) );
  OAI2BB2XL U816 ( .B0(n902), .B1(n877), .A0N(\string[19][6] ), .A1N(n877), 
        .Y(n407) );
  OAI2BB2XL U817 ( .B0(n900), .B1(n877), .A0N(\string[19][7] ), .A1N(n877), 
        .Y(n406) );
  OAI2BB2XL U818 ( .B0(n914), .B1(n878), .A0N(\string[18][0] ), .A1N(n878), 
        .Y(n405) );
  OAI2BB2XL U819 ( .B0(n912), .B1(n878), .A0N(\string[18][1] ), .A1N(n878), 
        .Y(n404) );
  OAI2BB2XL U820 ( .B0(n910), .B1(n878), .A0N(\string[18][2] ), .A1N(n878), 
        .Y(n403) );
  OAI2BB2XL U821 ( .B0(n908), .B1(n878), .A0N(\string[18][3] ), .A1N(n878), 
        .Y(n402) );
  OAI2BB2XL U822 ( .B0(n906), .B1(n878), .A0N(\string[18][4] ), .A1N(n878), 
        .Y(n401) );
  OAI2BB2XL U823 ( .B0(n904), .B1(n878), .A0N(\string[18][5] ), .A1N(n878), 
        .Y(n400) );
  OAI2BB2XL U824 ( .B0(n902), .B1(n878), .A0N(\string[18][6] ), .A1N(n878), 
        .Y(n399) );
  OAI2BB2XL U825 ( .B0(n900), .B1(n878), .A0N(\string[18][7] ), .A1N(n878), 
        .Y(n398) );
  OAI2BB2XL U826 ( .B0(n914), .B1(n879), .A0N(\string[17][0] ), .A1N(n879), 
        .Y(n397) );
  OAI2BB2XL U827 ( .B0(n912), .B1(n879), .A0N(\string[17][1] ), .A1N(n879), 
        .Y(n396) );
  OAI2BB2XL U828 ( .B0(n910), .B1(n879), .A0N(\string[17][2] ), .A1N(n879), 
        .Y(n395) );
  OAI2BB2XL U829 ( .B0(n908), .B1(n879), .A0N(\string[17][3] ), .A1N(n879), 
        .Y(n394) );
  OAI2BB2XL U830 ( .B0(n906), .B1(n879), .A0N(\string[17][4] ), .A1N(n879), 
        .Y(n393) );
  OAI2BB2XL U831 ( .B0(n904), .B1(n879), .A0N(\string[17][5] ), .A1N(n879), 
        .Y(n392) );
  OAI2BB2XL U832 ( .B0(n902), .B1(n879), .A0N(\string[17][6] ), .A1N(n879), 
        .Y(n391) );
  OAI2BB2XL U833 ( .B0(n900), .B1(n879), .A0N(\string[17][7] ), .A1N(n879), 
        .Y(n390) );
  OAI2BB2XL U834 ( .B0(n910), .B1(n880), .A0N(\string[16][2] ), .A1N(n880), 
        .Y(n389) );
  OAI2BB2XL U835 ( .B0(n900), .B1(n880), .A0N(\string[16][7] ), .A1N(n880), 
        .Y(n388) );
  OAI2BB2XL U836 ( .B0(n902), .B1(n880), .A0N(\string[16][6] ), .A1N(n880), 
        .Y(n387) );
  OAI2BB2XL U837 ( .B0(n904), .B1(n880), .A0N(\string[16][5] ), .A1N(n880), 
        .Y(n386) );
  OAI2BB2XL U838 ( .B0(n906), .B1(n880), .A0N(\string[16][4] ), .A1N(n880), 
        .Y(n385) );
  OAI2BB2XL U839 ( .B0(n908), .B1(n880), .A0N(\string[16][3] ), .A1N(n880), 
        .Y(n384) );
  OAI2BB2XL U840 ( .B0(n914), .B1(n880), .A0N(\string[16][0] ), .A1N(n880), 
        .Y(n383) );
  OAI2BB2XL U841 ( .B0(n912), .B1(n880), .A0N(\string[16][1] ), .A1N(n880), 
        .Y(n382) );
  NOR2BX1 U842 ( .AN(n33), .B(ispattern), .Y(n34) );
  OAI2BB2XL U843 ( .B0(n220), .B1(n33), .A0N(N281), .A1N(n34), .Y(n249) );
  OAI2BB2XL U844 ( .B0(n219), .B1(n33), .A0N(N279), .A1N(n34), .Y(n250) );
  OAI2BB2XL U845 ( .B0(n218), .B1(n33), .A0N(N277), .A1N(n34), .Y(n251) );
  OAI2BB2XL U846 ( .B0(n217), .B1(n33), .A0N(N275), .A1N(n34), .Y(n252) );
  OAI2BB2XL U847 ( .B0(N273), .B1(n33), .A0N(N273), .A1N(n34), .Y(n253) );
  OAI2BB2XL U848 ( .B0(n915), .B1(n866), .A0N(\string[30][0] ), .A1N(n866), 
        .Y(n501) );
  OAI2BB2XL U849 ( .B0(n913), .B1(n866), .A0N(\string[30][1] ), .A1N(n866), 
        .Y(n500) );
  OAI2BB2XL U850 ( .B0(n911), .B1(n866), .A0N(\string[30][2] ), .A1N(n866), 
        .Y(n499) );
  OAI2BB2XL U851 ( .B0(n909), .B1(n866), .A0N(\string[30][3] ), .A1N(n866), 
        .Y(n498) );
  OAI2BB2XL U852 ( .B0(n907), .B1(n866), .A0N(\string[30][4] ), .A1N(n866), 
        .Y(n497) );
  OAI2BB2XL U853 ( .B0(n905), .B1(n866), .A0N(\string[30][5] ), .A1N(n866), 
        .Y(n496) );
  OAI2BB2XL U854 ( .B0(n903), .B1(n866), .A0N(\string[30][6] ), .A1N(n866), 
        .Y(n495) );
  OAI2BB2XL U855 ( .B0(n901), .B1(n866), .A0N(\string[30][7] ), .A1N(n866), 
        .Y(n494) );
  OAI2BB2XL U856 ( .B0(n900), .B1(n867), .A0N(\string[29][7] ), .A1N(n867), 
        .Y(n493) );
  OAI2BB2XL U857 ( .B0(n914), .B1(n867), .A0N(\string[29][0] ), .A1N(n867), 
        .Y(n492) );
  OAI2BB2XL U858 ( .B0(n912), .B1(n867), .A0N(\string[29][1] ), .A1N(n867), 
        .Y(n491) );
  OAI2BB2XL U859 ( .B0(n910), .B1(n867), .A0N(\string[29][2] ), .A1N(n867), 
        .Y(n490) );
  OAI2BB2XL U860 ( .B0(n908), .B1(n867), .A0N(\string[29][3] ), .A1N(n867), 
        .Y(n489) );
  OAI2BB2XL U861 ( .B0(n906), .B1(n867), .A0N(\string[29][4] ), .A1N(n867), 
        .Y(n488) );
  OAI2BB2XL U862 ( .B0(n904), .B1(n867), .A0N(\string[29][5] ), .A1N(n867), 
        .Y(n487) );
  OAI2BB2XL U863 ( .B0(n902), .B1(n867), .A0N(\string[29][6] ), .A1N(n867), 
        .Y(n486) );
  OAI2BB2XL U864 ( .B0(n915), .B1(n868), .A0N(\string[28][0] ), .A1N(n868), 
        .Y(n485) );
  OAI2BB2XL U865 ( .B0(n913), .B1(n868), .A0N(\string[28][1] ), .A1N(n868), 
        .Y(n484) );
  OAI2BB2XL U866 ( .B0(n911), .B1(n868), .A0N(\string[28][2] ), .A1N(n868), 
        .Y(n483) );
  OAI2BB2XL U867 ( .B0(n909), .B1(n868), .A0N(\string[28][3] ), .A1N(n868), 
        .Y(n482) );
  OAI2BB2XL U868 ( .B0(n907), .B1(n868), .A0N(\string[28][4] ), .A1N(n868), 
        .Y(n481) );
  OAI2BB2XL U869 ( .B0(n905), .B1(n868), .A0N(\string[28][5] ), .A1N(n868), 
        .Y(n480) );
  OAI2BB2XL U870 ( .B0(n903), .B1(n868), .A0N(\string[28][6] ), .A1N(n868), 
        .Y(n479) );
  OAI2BB2XL U871 ( .B0(n901), .B1(n868), .A0N(\string[28][7] ), .A1N(n868), 
        .Y(n478) );
  OAI2BB2XL U872 ( .B0(n914), .B1(n869), .A0N(\string[27][0] ), .A1N(n869), 
        .Y(n477) );
  OAI2BB2XL U873 ( .B0(n912), .B1(n869), .A0N(\string[27][1] ), .A1N(n869), 
        .Y(n476) );
  OAI2BB2XL U874 ( .B0(n910), .B1(n869), .A0N(\string[27][2] ), .A1N(n869), 
        .Y(n475) );
  OAI2BB2XL U875 ( .B0(n908), .B1(n869), .A0N(\string[27][3] ), .A1N(n869), 
        .Y(n474) );
  OAI2BB2XL U876 ( .B0(n906), .B1(n869), .A0N(\string[27][4] ), .A1N(n869), 
        .Y(n473) );
  OAI2BB2XL U877 ( .B0(n904), .B1(n869), .A0N(\string[27][5] ), .A1N(n869), 
        .Y(n472) );
  OAI2BB2XL U878 ( .B0(n902), .B1(n869), .A0N(\string[27][6] ), .A1N(n869), 
        .Y(n471) );
  OAI2BB2XL U879 ( .B0(n900), .B1(n869), .A0N(\string[27][7] ), .A1N(n869), 
        .Y(n470) );
  OAI2BB2XL U880 ( .B0(n914), .B1(n870), .A0N(\string[26][0] ), .A1N(n870), 
        .Y(n469) );
  OAI2BB2XL U881 ( .B0(n912), .B1(n870), .A0N(\string[26][1] ), .A1N(n870), 
        .Y(n468) );
  OAI2BB2XL U882 ( .B0(n910), .B1(n870), .A0N(\string[26][2] ), .A1N(n870), 
        .Y(n467) );
  OAI2BB2XL U883 ( .B0(n908), .B1(n870), .A0N(\string[26][3] ), .A1N(n870), 
        .Y(n466) );
  OAI2BB2XL U884 ( .B0(n906), .B1(n870), .A0N(\string[26][4] ), .A1N(n870), 
        .Y(n465) );
  OAI2BB2XL U885 ( .B0(n904), .B1(n870), .A0N(\string[26][5] ), .A1N(n870), 
        .Y(n464) );
  OAI2BB2XL U886 ( .B0(n902), .B1(n870), .A0N(\string[26][6] ), .A1N(n870), 
        .Y(n463) );
  OAI2BB2XL U887 ( .B0(n900), .B1(n870), .A0N(\string[26][7] ), .A1N(n870), 
        .Y(n462) );
  OAI2BB2XL U888 ( .B0(n914), .B1(n871), .A0N(\string[25][0] ), .A1N(n871), 
        .Y(n461) );
  OAI2BB2XL U889 ( .B0(n912), .B1(n871), .A0N(\string[25][1] ), .A1N(n871), 
        .Y(n460) );
  OAI2BB2XL U890 ( .B0(n910), .B1(n871), .A0N(\string[25][2] ), .A1N(n871), 
        .Y(n459) );
  OAI2BB2XL U891 ( .B0(n908), .B1(n871), .A0N(\string[25][3] ), .A1N(n871), 
        .Y(n458) );
  OAI2BB2XL U892 ( .B0(n906), .B1(n871), .A0N(\string[25][4] ), .A1N(n871), 
        .Y(n457) );
  OAI2BB2XL U893 ( .B0(n904), .B1(n871), .A0N(\string[25][5] ), .A1N(n871), 
        .Y(n456) );
  OAI2BB2XL U894 ( .B0(n902), .B1(n871), .A0N(\string[25][6] ), .A1N(n871), 
        .Y(n455) );
  OAI2BB2XL U895 ( .B0(n900), .B1(n871), .A0N(\string[25][7] ), .A1N(n871), 
        .Y(n454) );
  OAI2BB2XL U896 ( .B0(n914), .B1(n872), .A0N(\string[24][0] ), .A1N(n872), 
        .Y(n453) );
  OAI2BB2XL U897 ( .B0(n900), .B1(n872), .A0N(\string[24][7] ), .A1N(n872), 
        .Y(n452) );
  OAI2BB2XL U898 ( .B0(n902), .B1(n872), .A0N(\string[24][6] ), .A1N(n872), 
        .Y(n451) );
  OAI2BB2XL U899 ( .B0(n904), .B1(n872), .A0N(\string[24][5] ), .A1N(n872), 
        .Y(n450) );
  OAI2BB2XL U900 ( .B0(n906), .B1(n872), .A0N(\string[24][4] ), .A1N(n872), 
        .Y(n449) );
  OAI2BB2XL U901 ( .B0(n908), .B1(n872), .A0N(\string[24][3] ), .A1N(n872), 
        .Y(n448) );
  OAI2BB2XL U902 ( .B0(n910), .B1(n872), .A0N(\string[24][2] ), .A1N(n872), 
        .Y(n447) );
  OAI2BB2XL U903 ( .B0(n912), .B1(n872), .A0N(\string[24][1] ), .A1N(n872), 
        .Y(n446) );
  OAI2BB2XL U904 ( .B0(n915), .B1(n889), .A0N(\string[7][0] ), .A1N(n889), .Y(
        n317) );
  OAI2BB2XL U905 ( .B0(n913), .B1(n889), .A0N(\string[7][1] ), .A1N(n889), .Y(
        n316) );
  OAI2BB2XL U906 ( .B0(n911), .B1(n889), .A0N(\string[7][2] ), .A1N(n889), .Y(
        n315) );
  OAI2BB2XL U907 ( .B0(n909), .B1(n889), .A0N(\string[7][3] ), .A1N(n889), .Y(
        n314) );
  OAI2BB2XL U908 ( .B0(n907), .B1(n889), .A0N(\string[7][4] ), .A1N(n889), .Y(
        n313) );
  OAI2BB2XL U909 ( .B0(n905), .B1(n889), .A0N(\string[7][5] ), .A1N(n889), .Y(
        n312) );
  OAI2BB2XL U910 ( .B0(n903), .B1(n889), .A0N(\string[7][6] ), .A1N(n889), .Y(
        n311) );
  OAI2BB2XL U911 ( .B0(n901), .B1(n889), .A0N(\string[7][7] ), .A1N(n889), .Y(
        n310) );
  OAI2BB2XL U912 ( .B0(n915), .B1(n890), .A0N(\string[6][0] ), .A1N(n890), .Y(
        n309) );
  OAI2BB2XL U913 ( .B0(n913), .B1(n890), .A0N(\string[6][1] ), .A1N(n890), .Y(
        n308) );
  OAI2BB2XL U914 ( .B0(n911), .B1(n890), .A0N(\string[6][2] ), .A1N(n890), .Y(
        n307) );
  OAI2BB2XL U915 ( .B0(n909), .B1(n890), .A0N(\string[6][3] ), .A1N(n890), .Y(
        n306) );
  OAI2BB2XL U916 ( .B0(n907), .B1(n890), .A0N(\string[6][4] ), .A1N(n890), .Y(
        n305) );
  OAI2BB2XL U917 ( .B0(n905), .B1(n890), .A0N(\string[6][5] ), .A1N(n890), .Y(
        n304) );
  OAI2BB2XL U918 ( .B0(n903), .B1(n890), .A0N(\string[6][6] ), .A1N(n890), .Y(
        n303) );
  OAI2BB2XL U919 ( .B0(n901), .B1(n890), .A0N(\string[6][7] ), .A1N(n890), .Y(
        n302) );
  OAI2BB2XL U920 ( .B0(n915), .B1(n891), .A0N(\string[5][0] ), .A1N(n891), .Y(
        n301) );
  OAI2BB2XL U921 ( .B0(n913), .B1(n891), .A0N(\string[5][1] ), .A1N(n891), .Y(
        n300) );
  OAI2BB2XL U922 ( .B0(n911), .B1(n891), .A0N(\string[5][2] ), .A1N(n891), .Y(
        n299) );
  OAI2BB2XL U923 ( .B0(n909), .B1(n891), .A0N(\string[5][3] ), .A1N(n891), .Y(
        n298) );
  OAI2BB2XL U924 ( .B0(n907), .B1(n891), .A0N(\string[5][4] ), .A1N(n891), .Y(
        n297) );
  OAI2BB2XL U925 ( .B0(n905), .B1(n891), .A0N(\string[5][5] ), .A1N(n891), .Y(
        n296) );
  OAI2BB2XL U926 ( .B0(n903), .B1(n891), .A0N(\string[5][6] ), .A1N(n891), .Y(
        n295) );
  OAI2BB2XL U927 ( .B0(n901), .B1(n891), .A0N(\string[5][7] ), .A1N(n891), .Y(
        n294) );
  OAI2BB2XL U928 ( .B0(n905), .B1(n892), .A0N(\string[4][5] ), .A1N(n892), .Y(
        n293) );
  OAI2BB2XL U929 ( .B0(n901), .B1(n892), .A0N(\string[4][7] ), .A1N(n892), .Y(
        n292) );
  OAI2BB2XL U930 ( .B0(n903), .B1(n892), .A0N(\string[4][6] ), .A1N(n892), .Y(
        n291) );
  OAI2BB2XL U931 ( .B0(n915), .B1(n892), .A0N(\string[4][0] ), .A1N(n892), .Y(
        n290) );
  OAI2BB2XL U932 ( .B0(n913), .B1(n892), .A0N(\string[4][1] ), .A1N(n892), .Y(
        n289) );
  OAI2BB2XL U933 ( .B0(n911), .B1(n892), .A0N(\string[4][2] ), .A1N(n892), .Y(
        n288) );
  OAI2BB2XL U934 ( .B0(n909), .B1(n892), .A0N(\string[4][3] ), .A1N(n892), .Y(
        n287) );
  OAI2BB2XL U935 ( .B0(n907), .B1(n892), .A0N(\string[4][4] ), .A1N(n892), .Y(
        n286) );
  OAI2BB2XL U936 ( .B0(n915), .B1(n893), .A0N(\string[3][0] ), .A1N(n893), .Y(
        n285) );
  OAI2BB2XL U937 ( .B0(n913), .B1(n893), .A0N(\string[3][1] ), .A1N(n893), .Y(
        n284) );
  OAI2BB2XL U938 ( .B0(n911), .B1(n893), .A0N(\string[3][2] ), .A1N(n893), .Y(
        n283) );
  OAI2BB2XL U939 ( .B0(n909), .B1(n893), .A0N(\string[3][3] ), .A1N(n893), .Y(
        n282) );
  OAI2BB2XL U940 ( .B0(n907), .B1(n893), .A0N(\string[3][4] ), .A1N(n893), .Y(
        n281) );
  OAI2BB2XL U941 ( .B0(n905), .B1(n893), .A0N(\string[3][5] ), .A1N(n893), .Y(
        n280) );
  OAI2BB2XL U942 ( .B0(n903), .B1(n893), .A0N(\string[3][6] ), .A1N(n893), .Y(
        n279) );
  OAI2BB2XL U943 ( .B0(n901), .B1(n893), .A0N(\string[3][7] ), .A1N(n893), .Y(
        n278) );
  OAI2BB2XL U944 ( .B0(n915), .B1(n894), .A0N(\string[2][0] ), .A1N(n894), .Y(
        n277) );
  OAI2BB2XL U945 ( .B0(n913), .B1(n894), .A0N(\string[2][1] ), .A1N(n894), .Y(
        n276) );
  OAI2BB2XL U946 ( .B0(n911), .B1(n894), .A0N(\string[2][2] ), .A1N(n894), .Y(
        n275) );
  OAI2BB2XL U947 ( .B0(n909), .B1(n894), .A0N(\string[2][3] ), .A1N(n894), .Y(
        n274) );
  OAI2BB2XL U948 ( .B0(n907), .B1(n894), .A0N(\string[2][4] ), .A1N(n894), .Y(
        n273) );
  OAI2BB2XL U949 ( .B0(n905), .B1(n894), .A0N(\string[2][5] ), .A1N(n894), .Y(
        n272) );
  OAI2BB2XL U950 ( .B0(n903), .B1(n894), .A0N(\string[2][6] ), .A1N(n894), .Y(
        n271) );
  OAI2BB2XL U951 ( .B0(n901), .B1(n894), .A0N(\string[2][7] ), .A1N(n894), .Y(
        n270) );
  OAI2BB2XL U952 ( .B0(n914), .B1(n895), .A0N(\string[1][0] ), .A1N(n895), .Y(
        n269) );
  OAI2BB2XL U953 ( .B0(n912), .B1(n895), .A0N(\string[1][1] ), .A1N(n895), .Y(
        n268) );
  OAI2BB2XL U954 ( .B0(n910), .B1(n895), .A0N(\string[1][2] ), .A1N(n895), .Y(
        n267) );
  OAI2BB2XL U955 ( .B0(n908), .B1(n895), .A0N(\string[1][3] ), .A1N(n895), .Y(
        n266) );
  OAI2BB2XL U956 ( .B0(n906), .B1(n895), .A0N(\string[1][4] ), .A1N(n895), .Y(
        n265) );
  OAI2BB2XL U957 ( .B0(n904), .B1(n895), .A0N(\string[1][5] ), .A1N(n895), .Y(
        n264) );
  OAI2BB2XL U958 ( .B0(n902), .B1(n895), .A0N(\string[1][6] ), .A1N(n895), .Y(
        n263) );
  OAI2BB2XL U959 ( .B0(n900), .B1(n895), .A0N(\string[1][7] ), .A1N(n895), .Y(
        n262) );
  OAI221XL U960 ( .A0(n100), .A1(str_start[0]), .B0(n840), .B1(n102), .C0(n103), .Y(n511) );
  NAND2X1 U961 ( .A(str_start[0]), .B(n104), .Y(n103) );
  OAI221XL U962 ( .A0(n100), .A1(n961), .B0(n837), .B1(n102), .C0(n112), .Y(
        n515) );
  NAND2X1 U963 ( .A(str_start[4]), .B(n104), .Y(n112) );
  OAI221XL U964 ( .A0(n100), .A1(n962), .B0(n838), .B1(n102), .C0(n110), .Y(
        n514) );
  NAND2X1 U965 ( .A(str_start[3]), .B(n104), .Y(n110) );
  OAI221XL U966 ( .A0(n100), .A1(n963), .B0(n839), .B1(n102), .C0(n108), .Y(
        n513) );
  NAND2X1 U967 ( .A(str_start[2]), .B(n104), .Y(n108) );
  OAI221XL U968 ( .A0(n100), .A1(n964), .B0(n238), .B1(n102), .C0(n106), .Y(
        n512) );
  NAND2X1 U969 ( .A(str_start[1]), .B(n104), .Y(n106) );
  OAI221XL U970 ( .A0(n100), .A1(n608), .B0(n234), .B1(n102), .C0(n175), .Y(
        n598) );
  NAND2X1 U971 ( .A(str_start[5]), .B(n104), .Y(n175) );
  NAND2X1 U972 ( .A(ispattern), .B(n950), .Y(n38) );
  CLKINVX1 U973 ( .A(ispattern), .Y(n951) );
  OAI221XL U974 ( .A0(n122), .A1(n608), .B0(n234), .B1(n123), .C0(n164), .Y(
        n597) );
  NAND2X1 U975 ( .A(N193), .B(n935), .Y(n164) );
  OAI221XL U976 ( .A0(n961), .A1(n122), .B0(n837), .B1(n123), .C0(n124), .Y(
        n520) );
  NAND2X1 U977 ( .A(N192), .B(n935), .Y(n124) );
  OAI221XL U978 ( .A0(n962), .A1(n122), .B0(n838), .B1(n123), .C0(n126), .Y(
        n521) );
  NAND2X1 U979 ( .A(N191), .B(n935), .Y(n126) );
  OAI221XL U980 ( .A0(n963), .A1(n122), .B0(n839), .B1(n123), .C0(n127), .Y(
        n522) );
  NAND2X1 U981 ( .A(N190), .B(n935), .Y(n127) );
  OAI221XL U982 ( .A0(n964), .A1(n122), .B0(n238), .B1(n123), .C0(n128), .Y(
        n523) );
  NAND2X1 U983 ( .A(N189), .B(n935), .Y(n128) );
  OAI221XL U984 ( .A0(str_start[0]), .A1(n122), .B0(n840), .B1(n123), .C0(n129), .Y(n524) );
  NAND2X1 U985 ( .A(N188), .B(n935), .Y(n129) );
  OAI22XL U986 ( .A0(n917), .A1(n113), .B0(n114), .B1(n115), .Y(n516) );
  OAI22XL U987 ( .A0(n919), .A1(n113), .B0(N42), .B1(n115), .Y(n519) );
  OAI22XL U988 ( .A0(n916), .A1(n113), .B0(n115), .B1(n117), .Y(n518) );
  OAI22XL U989 ( .A0(n918), .A1(n113), .B0(n115), .B1(n116), .Y(n517) );
  OAI2BB2XL U990 ( .B0(n915), .B1(n881), .A0N(\string[15][0] ), .A1N(n881), 
        .Y(n381) );
  OAI2BB2XL U991 ( .B0(n913), .B1(n881), .A0N(\string[15][1] ), .A1N(n881), 
        .Y(n380) );
  OAI2BB2XL U992 ( .B0(n911), .B1(n881), .A0N(\string[15][2] ), .A1N(n881), 
        .Y(n379) );
  OAI2BB2XL U993 ( .B0(n909), .B1(n881), .A0N(\string[15][3] ), .A1N(n881), 
        .Y(n378) );
  OAI2BB2XL U994 ( .B0(n907), .B1(n881), .A0N(\string[15][4] ), .A1N(n881), 
        .Y(n377) );
  OAI2BB2XL U995 ( .B0(n905), .B1(n881), .A0N(\string[15][5] ), .A1N(n881), 
        .Y(n376) );
  OAI2BB2XL U996 ( .B0(n903), .B1(n881), .A0N(\string[15][6] ), .A1N(n881), 
        .Y(n375) );
  OAI2BB2XL U997 ( .B0(n901), .B1(n881), .A0N(\string[15][7] ), .A1N(n881), 
        .Y(n374) );
  OAI2BB2XL U998 ( .B0(n915), .B1(n883), .A0N(\string[13][0] ), .A1N(n883), 
        .Y(n365) );
  OAI2BB2XL U999 ( .B0(n913), .B1(n883), .A0N(\string[13][1] ), .A1N(n883), 
        .Y(n364) );
  OAI2BB2XL U1000 ( .B0(n911), .B1(n883), .A0N(\string[13][2] ), .A1N(n883), 
        .Y(n363) );
  OAI2BB2XL U1001 ( .B0(n909), .B1(n883), .A0N(\string[13][3] ), .A1N(n883), 
        .Y(n362) );
  OAI2BB2XL U1002 ( .B0(n907), .B1(n883), .A0N(\string[13][4] ), .A1N(n883), 
        .Y(n361) );
  OAI2BB2XL U1003 ( .B0(n905), .B1(n883), .A0N(\string[13][5] ), .A1N(n883), 
        .Y(n360) );
  OAI2BB2XL U1004 ( .B0(n903), .B1(n883), .A0N(\string[13][6] ), .A1N(n883), 
        .Y(n359) );
  OAI2BB2XL U1005 ( .B0(n901), .B1(n883), .A0N(\string[13][7] ), .A1N(n883), 
        .Y(n358) );
  OAI2BB2XL U1006 ( .B0(n915), .B1(n885), .A0N(\string[11][0] ), .A1N(n885), 
        .Y(n349) );
  OAI2BB2XL U1007 ( .B0(n913), .B1(n885), .A0N(\string[11][1] ), .A1N(n885), 
        .Y(n348) );
  OAI2BB2XL U1008 ( .B0(n911), .B1(n885), .A0N(\string[11][2] ), .A1N(n885), 
        .Y(n347) );
  OAI2BB2XL U1009 ( .B0(n909), .B1(n885), .A0N(\string[11][3] ), .A1N(n885), 
        .Y(n346) );
  OAI2BB2XL U1010 ( .B0(n907), .B1(n885), .A0N(\string[11][4] ), .A1N(n885), 
        .Y(n345) );
  OAI2BB2XL U1011 ( .B0(n905), .B1(n885), .A0N(\string[11][5] ), .A1N(n885), 
        .Y(n344) );
  OAI2BB2XL U1012 ( .B0(n903), .B1(n885), .A0N(\string[11][6] ), .A1N(n885), 
        .Y(n343) );
  OAI2BB2XL U1013 ( .B0(n901), .B1(n885), .A0N(\string[11][7] ), .A1N(n885), 
        .Y(n342) );
  OAI2BB2XL U1014 ( .B0(n915), .B1(n886), .A0N(\string[10][0] ), .A1N(n886), 
        .Y(n341) );
  OAI2BB2XL U1015 ( .B0(n913), .B1(n886), .A0N(\string[10][1] ), .A1N(n886), 
        .Y(n340) );
  OAI2BB2XL U1016 ( .B0(n911), .B1(n886), .A0N(\string[10][2] ), .A1N(n886), 
        .Y(n339) );
  OAI2BB2XL U1017 ( .B0(n909), .B1(n886), .A0N(\string[10][3] ), .A1N(n886), 
        .Y(n338) );
  OAI2BB2XL U1018 ( .B0(n907), .B1(n886), .A0N(\string[10][4] ), .A1N(n886), 
        .Y(n337) );
  OAI2BB2XL U1019 ( .B0(n905), .B1(n886), .A0N(\string[10][5] ), .A1N(n886), 
        .Y(n336) );
  OAI2BB2XL U1020 ( .B0(n903), .B1(n886), .A0N(\string[10][6] ), .A1N(n886), 
        .Y(n335) );
  OAI2BB2XL U1021 ( .B0(n901), .B1(n886), .A0N(\string[10][7] ), .A1N(n886), 
        .Y(n334) );
  OAI2BB2XL U1022 ( .B0(n915), .B1(n887), .A0N(\string[9][0] ), .A1N(n887), 
        .Y(n333) );
  OAI2BB2XL U1023 ( .B0(n913), .B1(n887), .A0N(\string[9][1] ), .A1N(n887), 
        .Y(n332) );
  OAI2BB2XL U1024 ( .B0(n911), .B1(n887), .A0N(\string[9][2] ), .A1N(n887), 
        .Y(n331) );
  OAI2BB2XL U1025 ( .B0(n909), .B1(n887), .A0N(\string[9][3] ), .A1N(n887), 
        .Y(n330) );
  OAI2BB2XL U1026 ( .B0(n907), .B1(n887), .A0N(\string[9][4] ), .A1N(n887), 
        .Y(n329) );
  OAI2BB2XL U1027 ( .B0(n905), .B1(n887), .A0N(\string[9][5] ), .A1N(n887), 
        .Y(n328) );
  OAI2BB2XL U1028 ( .B0(n903), .B1(n887), .A0N(\string[9][6] ), .A1N(n887), 
        .Y(n327) );
  OAI2BB2XL U1029 ( .B0(n901), .B1(n887), .A0N(\string[9][7] ), .A1N(n887), 
        .Y(n326) );
  OAI2BB2XL U1030 ( .B0(n915), .B1(n882), .A0N(\string[14][0] ), .A1N(n882), 
        .Y(n373) );
  OAI2BB2XL U1031 ( .B0(n913), .B1(n882), .A0N(\string[14][1] ), .A1N(n882), 
        .Y(n372) );
  OAI2BB2XL U1032 ( .B0(n911), .B1(n882), .A0N(\string[14][2] ), .A1N(n882), 
        .Y(n371) );
  OAI2BB2XL U1033 ( .B0(n909), .B1(n882), .A0N(\string[14][3] ), .A1N(n882), 
        .Y(n370) );
  OAI2BB2XL U1034 ( .B0(n907), .B1(n882), .A0N(\string[14][4] ), .A1N(n882), 
        .Y(n369) );
  OAI2BB2XL U1035 ( .B0(n905), .B1(n882), .A0N(\string[14][5] ), .A1N(n882), 
        .Y(n368) );
  OAI2BB2XL U1036 ( .B0(n903), .B1(n882), .A0N(\string[14][6] ), .A1N(n882), 
        .Y(n367) );
  OAI2BB2XL U1037 ( .B0(n901), .B1(n882), .A0N(\string[14][7] ), .A1N(n882), 
        .Y(n366) );
  OAI2BB2XL U1038 ( .B0(n915), .B1(n884), .A0N(\string[12][0] ), .A1N(n884), 
        .Y(n357) );
  OAI2BB2XL U1039 ( .B0(n913), .B1(n884), .A0N(\string[12][1] ), .A1N(n884), 
        .Y(n356) );
  OAI2BB2XL U1040 ( .B0(n911), .B1(n884), .A0N(\string[12][2] ), .A1N(n884), 
        .Y(n355) );
  OAI2BB2XL U1041 ( .B0(n909), .B1(n884), .A0N(\string[12][3] ), .A1N(n884), 
        .Y(n354) );
  OAI2BB2XL U1042 ( .B0(n907), .B1(n884), .A0N(\string[12][4] ), .A1N(n884), 
        .Y(n353) );
  OAI2BB2XL U1043 ( .B0(n905), .B1(n884), .A0N(\string[12][5] ), .A1N(n884), 
        .Y(n352) );
  OAI2BB2XL U1044 ( .B0(n903), .B1(n884), .A0N(\string[12][6] ), .A1N(n884), 
        .Y(n351) );
  OAI2BB2XL U1045 ( .B0(n901), .B1(n884), .A0N(\string[12][7] ), .A1N(n884), 
        .Y(n350) );
  OAI2BB2XL U1046 ( .B0(n915), .B1(n888), .A0N(\string[8][0] ), .A1N(n888), 
        .Y(n325) );
  OAI2BB2XL U1047 ( .B0(n913), .B1(n888), .A0N(\string[8][1] ), .A1N(n888), 
        .Y(n324) );
  OAI2BB2XL U1048 ( .B0(n911), .B1(n888), .A0N(\string[8][2] ), .A1N(n888), 
        .Y(n323) );
  OAI2BB2XL U1049 ( .B0(n909), .B1(n888), .A0N(\string[8][3] ), .A1N(n888), 
        .Y(n322) );
  OAI2BB2XL U1050 ( .B0(n907), .B1(n888), .A0N(\string[8][4] ), .A1N(n888), 
        .Y(n321) );
  OAI2BB2XL U1051 ( .B0(n905), .B1(n888), .A0N(\string[8][5] ), .A1N(n888), 
        .Y(n320) );
  OAI2BB2XL U1052 ( .B0(n903), .B1(n888), .A0N(\string[8][6] ), .A1N(n888), 
        .Y(n319) );
  OAI2BB2XL U1053 ( .B0(n901), .B1(n888), .A0N(\string[8][7] ), .A1N(n888), 
        .Y(n318) );
  AND2X2 U1054 ( .A(n135), .B(pat_len[2]), .Y(n137) );
  NOR3X1 U1055 ( .A(pat_len[3]), .B(reset), .C(n38), .Y(n135) );
  OAI2BB2XL U1056 ( .B0(n914), .B1(n860), .A0N(\pattern[4][0] ), .A1N(n860), 
        .Y(n564) );
  OAI2BB2XL U1057 ( .B0(n912), .B1(n860), .A0N(\pattern[4][1] ), .A1N(n860), 
        .Y(n563) );
  OAI2BB2XL U1058 ( .B0(n910), .B1(n860), .A0N(\pattern[4][2] ), .A1N(n860), 
        .Y(n562) );
  OAI2BB2XL U1059 ( .B0(n908), .B1(n860), .A0N(\pattern[4][3] ), .A1N(n860), 
        .Y(n561) );
  OAI2BB2XL U1060 ( .B0(n906), .B1(n860), .A0N(\pattern[4][4] ), .A1N(n860), 
        .Y(n560) );
  OAI2BB2XL U1061 ( .B0(n904), .B1(n860), .A0N(\pattern[4][5] ), .A1N(n860), 
        .Y(n559) );
  OAI2BB2XL U1062 ( .B0(n902), .B1(n860), .A0N(\pattern[4][6] ), .A1N(n860), 
        .Y(n558) );
  OAI2BB2XL U1063 ( .B0(n900), .B1(n860), .A0N(\pattern[4][7] ), .A1N(n860), 
        .Y(n557) );
  NAND3X1 U1064 ( .A(n242), .B(n243), .C(n137), .Y(n136) );
  OAI2BB2XL U1065 ( .B0(n948), .B1(n858), .A0N(\pattern[6][0] ), .A1N(n858), 
        .Y(n580) );
  OAI2BB2XL U1066 ( .B0(n947), .B1(n858), .A0N(\pattern[6][1] ), .A1N(n858), 
        .Y(n579) );
  OAI2BB2XL U1067 ( .B0(n946), .B1(n858), .A0N(\pattern[6][2] ), .A1N(n858), 
        .Y(n578) );
  OAI2BB2XL U1068 ( .B0(n945), .B1(n858), .A0N(\pattern[6][3] ), .A1N(n858), 
        .Y(n577) );
  OAI2BB2XL U1069 ( .B0(n944), .B1(n858), .A0N(\pattern[6][4] ), .A1N(n858), 
        .Y(n576) );
  OAI2BB2XL U1070 ( .B0(n943), .B1(n858), .A0N(\pattern[6][5] ), .A1N(n858), 
        .Y(n575) );
  OAI2BB2XL U1071 ( .B0(n942), .B1(n858), .A0N(\pattern[6][6] ), .A1N(n858), 
        .Y(n574) );
  OAI2BB2XL U1072 ( .B0(n941), .B1(n858), .A0N(\pattern[6][7] ), .A1N(n858), 
        .Y(n573) );
  NAND3X1 U1073 ( .A(n243), .B(n897), .C(n137), .Y(n139) );
  OAI2BB2XL U1074 ( .B0(n948), .B1(n859), .A0N(\pattern[5][0] ), .A1N(n859), 
        .Y(n572) );
  OAI2BB2XL U1075 ( .B0(n947), .B1(n859), .A0N(\pattern[5][1] ), .A1N(n859), 
        .Y(n571) );
  OAI2BB2XL U1076 ( .B0(n946), .B1(n859), .A0N(\pattern[5][2] ), .A1N(n859), 
        .Y(n570) );
  OAI2BB2XL U1077 ( .B0(n945), .B1(n859), .A0N(\pattern[5][3] ), .A1N(n859), 
        .Y(n569) );
  OAI2BB2XL U1078 ( .B0(n944), .B1(n859), .A0N(\pattern[5][4] ), .A1N(n859), 
        .Y(n568) );
  OAI2BB2XL U1079 ( .B0(n943), .B1(n859), .A0N(\pattern[5][5] ), .A1N(n859), 
        .Y(n567) );
  OAI2BB2XL U1080 ( .B0(n942), .B1(n859), .A0N(\pattern[5][6] ), .A1N(n859), 
        .Y(n566) );
  OAI2BB2XL U1081 ( .B0(n941), .B1(n859), .A0N(\pattern[5][7] ), .A1N(n859), 
        .Y(n565) );
  NAND3X1 U1082 ( .A(n242), .B(n898), .C(n137), .Y(n138) );
  OAI2BB2XL U1083 ( .B0(n948), .B1(n857), .A0N(\pattern[7][0] ), .A1N(n857), 
        .Y(n588) );
  OAI2BB2XL U1084 ( .B0(n941), .B1(n857), .A0N(\pattern[7][7] ), .A1N(n857), 
        .Y(n587) );
  OAI2BB2XL U1085 ( .B0(n942), .B1(n857), .A0N(\pattern[7][6] ), .A1N(n857), 
        .Y(n586) );
  OAI2BB2XL U1086 ( .B0(n943), .B1(n857), .A0N(\pattern[7][5] ), .A1N(n857), 
        .Y(n585) );
  OAI2BB2XL U1087 ( .B0(n944), .B1(n857), .A0N(\pattern[7][4] ), .A1N(n857), 
        .Y(n584) );
  OAI2BB2XL U1088 ( .B0(n945), .B1(n857), .A0N(\pattern[7][3] ), .A1N(n857), 
        .Y(n583) );
  OAI2BB2XL U1089 ( .B0(n946), .B1(n857), .A0N(\pattern[7][2] ), .A1N(n857), 
        .Y(n582) );
  OAI2BB2XL U1090 ( .B0(n947), .B1(n857), .A0N(\pattern[7][1] ), .A1N(n857), 
        .Y(n581) );
  AND2X2 U1091 ( .A(n135), .B(n241), .Y(n131) );
  OAI2BB2XL U1092 ( .B0(n948), .B1(n861), .A0N(\pattern[3][0] ), .A1N(n861), 
        .Y(n556) );
  OAI2BB2XL U1093 ( .B0(n947), .B1(n861), .A0N(\pattern[3][1] ), .A1N(n861), 
        .Y(n555) );
  OAI2BB2XL U1094 ( .B0(n946), .B1(n861), .A0N(\pattern[3][2] ), .A1N(n861), 
        .Y(n554) );
  OAI2BB2XL U1095 ( .B0(n945), .B1(n861), .A0N(\pattern[3][3] ), .A1N(n861), 
        .Y(n553) );
  OAI2BB2XL U1096 ( .B0(n944), .B1(n861), .A0N(\pattern[3][4] ), .A1N(n861), 
        .Y(n552) );
  OAI2BB2XL U1097 ( .B0(n943), .B1(n861), .A0N(\pattern[3][5] ), .A1N(n861), 
        .Y(n551) );
  OAI2BB2XL U1098 ( .B0(n942), .B1(n861), .A0N(\pattern[3][6] ), .A1N(n861), 
        .Y(n550) );
  OAI2BB2XL U1099 ( .B0(n941), .B1(n861), .A0N(\pattern[3][7] ), .A1N(n861), 
        .Y(n549) );
  OAI2BB2XL U1100 ( .B0(n948), .B1(n864), .A0N(\pattern[0][0] ), .A1N(n864), 
        .Y(n532) );
  OAI2BB2XL U1101 ( .B0(n947), .B1(n864), .A0N(\pattern[0][1] ), .A1N(n864), 
        .Y(n531) );
  OAI2BB2XL U1102 ( .B0(n946), .B1(n864), .A0N(\pattern[0][2] ), .A1N(n864), 
        .Y(n530) );
  OAI2BB2XL U1103 ( .B0(n945), .B1(n864), .A0N(\pattern[0][3] ), .A1N(n864), 
        .Y(n529) );
  OAI2BB2XL U1104 ( .B0(n944), .B1(n864), .A0N(\pattern[0][4] ), .A1N(n864), 
        .Y(n528) );
  OAI2BB2XL U1105 ( .B0(n943), .B1(n864), .A0N(\pattern[0][5] ), .A1N(n864), 
        .Y(n527) );
  OAI2BB2XL U1106 ( .B0(n942), .B1(n864), .A0N(\pattern[0][6] ), .A1N(n864), 
        .Y(n526) );
  OAI2BB2XL U1107 ( .B0(n941), .B1(n864), .A0N(\pattern[0][7] ), .A1N(n864), 
        .Y(n525) );
  NAND3X1 U1108 ( .A(n243), .B(n131), .C(n242), .Y(n130) );
  OAI2BB2XL U1109 ( .B0(n915), .B1(n862), .A0N(\pattern[2][0] ), .A1N(n862), 
        .Y(n548) );
  OAI2BB2XL U1110 ( .B0(n913), .B1(n862), .A0N(\pattern[2][1] ), .A1N(n862), 
        .Y(n547) );
  OAI2BB2XL U1111 ( .B0(n911), .B1(n862), .A0N(\pattern[2][2] ), .A1N(n862), 
        .Y(n546) );
  OAI2BB2XL U1112 ( .B0(n909), .B1(n862), .A0N(\pattern[2][3] ), .A1N(n862), 
        .Y(n545) );
  OAI2BB2XL U1113 ( .B0(n907), .B1(n862), .A0N(\pattern[2][4] ), .A1N(n862), 
        .Y(n544) );
  OAI2BB2XL U1114 ( .B0(n905), .B1(n862), .A0N(\pattern[2][5] ), .A1N(n862), 
        .Y(n543) );
  OAI2BB2XL U1115 ( .B0(n903), .B1(n862), .A0N(\pattern[2][6] ), .A1N(n862), 
        .Y(n542) );
  OAI2BB2XL U1116 ( .B0(n901), .B1(n862), .A0N(\pattern[2][7] ), .A1N(n862), 
        .Y(n541) );
  NAND3X1 U1117 ( .A(n131), .B(n897), .C(n243), .Y(n133) );
  CLKBUFX3 U1118 ( .A(n132), .Y(n863) );
  NAND3X1 U1119 ( .A(n131), .B(n898), .C(n242), .Y(n132) );
  OAI2BB2XL U1120 ( .B0(n914), .B1(n863), .A0N(\pattern[1][0] ), .A1N(n863), 
        .Y(n540) );
  OAI2BB2XL U1121 ( .B0(n912), .B1(n863), .A0N(\pattern[1][1] ), .A1N(n863), 
        .Y(n539) );
  OAI2BB2XL U1122 ( .B0(n910), .B1(n863), .A0N(\pattern[1][2] ), .A1N(n863), 
        .Y(n538) );
  OAI2BB2XL U1123 ( .B0(n908), .B1(n863), .A0N(\pattern[1][3] ), .A1N(n863), 
        .Y(n537) );
  OAI2BB2XL U1124 ( .B0(n906), .B1(n863), .A0N(\pattern[1][4] ), .A1N(n863), 
        .Y(n536) );
  OAI2BB2XL U1125 ( .B0(n904), .B1(n863), .A0N(\pattern[1][5] ), .A1N(n863), 
        .Y(n535) );
  OAI2BB2XL U1126 ( .B0(n902), .B1(n863), .A0N(\pattern[1][6] ), .A1N(n863), 
        .Y(n534) );
  OAI2BB2XL U1127 ( .B0(n900), .B1(n863), .A0N(\pattern[1][7] ), .A1N(n863), 
        .Y(n533) );
  CLKINVX1 U1128 ( .A(n30), .Y(n938) );
  AOI32X1 U1129 ( .A0(n241), .A1(n897), .A2(n31), .B0(n32), .B1(pat_len[2]), 
        .Y(n30) );
  OAI21XL U1130 ( .A0(n240), .A1(n145), .B0(n146), .Y(n591) );
  NAND4X1 U1131 ( .A(n240), .B(n31), .C(n897), .D(pat_len[2]), .Y(n146) );
  AOI21X1 U1132 ( .A0(ispattern), .A1(n241), .B0(n32), .Y(n145) );
  NOR3X1 U1133 ( .A(n939), .B(n243), .C(n951), .Y(n31) );
  OAI2BB2XL U1134 ( .B0(n242), .B1(n141), .A0N(n31), .A1N(n242), .Y(n589) );
  OAI32X1 U1135 ( .A0(n951), .A1(n898), .A2(n939), .B0(n243), .B1(n144), .Y(
        n590) );
  OAI22XL U1136 ( .A0(n213), .A1(n949), .B0(n151), .B1(n152), .Y(n593) );
  OA22X1 U1137 ( .A0(n153), .A1(n917), .B0(n154), .B1(n114), .Y(n151) );
  OAI22XL U1138 ( .A0(n646), .A1(n949), .B0(n158), .B1(n152), .Y(n594) );
  OA22X1 U1139 ( .A0(n153), .A1(n918), .B0(n154), .B1(n116), .Y(n158) );
  OAI22XL U1140 ( .A0(n647), .A1(n949), .B0(n159), .B1(n152), .Y(n595) );
  OA22X1 U1141 ( .A0(n153), .A1(n916), .B0(n154), .B1(n117), .Y(n159) );
  OAI22XL U1142 ( .A0(n648), .A1(n949), .B0(n160), .B1(n152), .Y(n596) );
  OA22X1 U1143 ( .A0(N42), .A1(n154), .B0(n153), .B1(n919), .Y(n160) );
  OAI2BB2XL U1144 ( .B0(n909), .B1(n865), .A0N(\string[31][3] ), .A1N(n865), 
        .Y(n509) );
  OAI2BB2XL U1145 ( .B0(n901), .B1(n865), .A0N(\string[31][7] ), .A1N(n865), 
        .Y(n508) );
  OAI2BB2XL U1146 ( .B0(n903), .B1(n865), .A0N(\string[31][6] ), .A1N(n865), 
        .Y(n507) );
  OAI2BB2XL U1147 ( .B0(n905), .B1(n865), .A0N(\string[31][5] ), .A1N(n865), 
        .Y(n506) );
  OAI2BB2XL U1148 ( .B0(n907), .B1(n865), .A0N(\string[31][4] ), .A1N(n865), 
        .Y(n505) );
  OAI2BB2XL U1149 ( .B0(n911), .B1(n865), .A0N(\string[31][2] ), .A1N(n865), 
        .Y(n504) );
  OAI2BB2XL U1150 ( .B0(n913), .B1(n865), .A0N(\string[31][1] ), .A1N(n865), 
        .Y(n503) );
  OAI2BB2XL U1151 ( .B0(n915), .B1(n865), .A0N(\string[31][0] ), .A1N(n865), 
        .Y(n502) );
  NAND4X1 U1152 ( .A(n244), .B(str_len[4]), .C(n70), .D(n99), .Y(n98) );
  NOR4X1 U1153 ( .A(reset), .B(newstr), .C(n950), .D(n954), .Y(n99) );
  OAI2BB2XL U1154 ( .B0(n896), .B1(n914), .A0N(\string[0][0] ), .A1N(n896), 
        .Y(n261) );
  OAI2BB2XL U1155 ( .B0(n896), .B1(n912), .A0N(\string[0][1] ), .A1N(n896), 
        .Y(n260) );
  OAI2BB2XL U1156 ( .B0(n896), .B1(n910), .A0N(\string[0][2] ), .A1N(n896), 
        .Y(n259) );
  OAI2BB2XL U1157 ( .B0(n896), .B1(n908), .A0N(\string[0][3] ), .A1N(n896), 
        .Y(n258) );
  OAI2BB2XL U1158 ( .B0(n896), .B1(n906), .A0N(\string[0][4] ), .A1N(n896), 
        .Y(n257) );
  OAI2BB2XL U1159 ( .B0(n896), .B1(n904), .A0N(\string[0][5] ), .A1N(n896), 
        .Y(n256) );
  OAI2BB2XL U1160 ( .B0(n896), .B1(n902), .A0N(\string[0][6] ), .A1N(n896), 
        .Y(n255) );
  OAI2BB2XL U1161 ( .B0(n896), .B1(n900), .A0N(\string[0][7] ), .A1N(n896), 
        .Y(n254) );
  OAI211X1 U1162 ( .A0(newstr), .A1(n54), .B0(n940), .C0(isstring), .Y(n45) );
  AND4X1 U1163 ( .A(n953), .B(n954), .C(n244), .D(n55), .Y(n54) );
  OAI21XL U1164 ( .A0(n214), .A1(n227), .B0(n148), .Y(n592) );
  OAI2BB1XL U1165 ( .A0N(n149), .A1N(N178), .B0(n227), .Y(n148) );
  OAI2BB1X1 U1166 ( .A0N(n950), .A1N(newstr), .B0(n38), .Y(n510) );
  AO22X1 U1167 ( .A0(n950), .A1(str_len[1]), .B0(N138), .B1(isstring), .Y(n222) );
  AO22X1 U1168 ( .A0(n950), .A1(str_len[5]), .B0(N142), .B1(isstring), .Y(n226) );
  OAI2BB2XL U1169 ( .B0(isstring), .B1(n955), .A0N(isstring), .A1N(N137), .Y(
        n221) );
  OAI2BB2XL U1170 ( .B0(isstring), .B1(n954), .A0N(N140), .A1N(isstring), .Y(
        n224) );
  OAI2BB2XL U1171 ( .B0(isstring), .B1(n953), .A0N(N141), .A1N(isstring), .Y(
        n225) );
  OAI2BB2XL U1172 ( .B0(isstring), .B1(n600), .A0N(N139), .A1N(isstring), .Y(
        n223) );
  CLKBUFX3 U1173 ( .A(n640), .Y(n651) );
  NOR2X1 U1174 ( .A(n647), .B(N44), .Y(n640) );
  CLKBUFX3 U1175 ( .A(n639), .Y(n652) );
  NOR2X1 U1176 ( .A(N43), .B(N44), .Y(n639) );
  CLKBUFX3 U1177 ( .A(n643), .Y(n649) );
  NOR2X1 U1178 ( .A(n646), .B(N43), .Y(n643) );
  OAI2BB1X1 U1179 ( .A0N(n194), .A1N(n168), .B0(n956), .Y(n161) );
  NAND4BX1 U1180 ( .AN(n197), .B(n234), .C(n837), .D(n238), .Y(n194) );
  NAND3X1 U1181 ( .A(n838), .B(n839), .C(n840), .Y(n197) );
  CLKBUFX3 U1182 ( .A(pat_len[0]), .Y(n898) );
  ADDFXL U1183 ( .A(n897), .B(n916), .CI(\sub_66/carry [1]), .CO(
        \sub_66/carry [2]), .S(N162) );
  ADDFXL U1184 ( .A(pat_len[2]), .B(n918), .CI(\sub_66/carry [2]), .CO(
        \sub_66/carry [3]), .S(N163) );
  AND2X2 U1185 ( .A(n178), .B(n168), .Y(n169) );
  NAND4X1 U1186 ( .A(n179), .B(n180), .C(n181), .D(n182), .Y(n178) );
  XOR2X1 U1187 ( .A(n899), .B(n839), .Y(n180) );
  XOR2X1 U1188 ( .A(str_len[3]), .B(n838), .Y(n179) );
  ADDFXL U1189 ( .A(pat_len[3]), .B(n917), .CI(\sub_66/carry [3]), .CO(
        \sub_66/carry [4]), .S(N164) );
  CLKINVX1 U1190 ( .A(N171), .Y(n934) );
  CLKBUFX3 U1191 ( .A(pat_len[1]), .Y(n897) );
  ADDHXL U1192 ( .A(str_len[1]), .B(str_len[0]), .CO(\add_66_2/carry [2]), .S(
        N173) );
  CLKBUFX3 U1193 ( .A(str_len[2]), .Y(n899) );
  ADDHX1 U1194 ( .A(str_len[3]), .B(\add_66_2/carry [3]), .CO(
        \add_66_2/carry [4]), .S(N175) );
  ADDHXL U1195 ( .A(str_len[4]), .B(\add_66_2/carry [4]), .CO(
        \add_66_2/carry [5]), .S(N176) );
  ADDHXL U1196 ( .A(match_index[1]), .B(n971), .CO(\r536/carry [2]), .S(N275)
         );
  ADDHXL U1197 ( .A(match_index[2]), .B(\r536/carry [2]), .CO(\r536/carry [3]), 
        .S(N277) );
  ADDHXL U1198 ( .A(match_index[3]), .B(\r536/carry [3]), .CO(\r536/carry [4]), 
        .S(N279) );
  NOR3X1 U1199 ( .A(n183), .B(n184), .C(n185), .Y(n182) );
  XOR2X1 U1200 ( .A(n837), .B(n953), .Y(n184) );
  XOR2X1 U1201 ( .A(n234), .B(n244), .Y(n183) );
  XOR2X1 U1202 ( .A(n238), .B(n246), .Y(n185) );
  XOR2X1 U1203 ( .A(n897), .B(n647), .Y(n188) );
  NAND4X1 U1204 ( .A(n187), .B(n188), .C(n189), .D(n190), .Y(n149) );
  XOR2X1 U1205 ( .A(pat_len[3]), .B(n213), .Y(n190) );
  XOR2X1 U1206 ( .A(pat_len[2]), .B(n646), .Y(n189) );
  XOR2X1 U1207 ( .A(n898), .B(n648), .Y(n187) );
  XOR2X1 U1208 ( .A(str_len[0]), .B(n840), .Y(n181) );
  NOR4BX1 U1209 ( .AN(n919), .B(pat_start[3]), .C(pat_start[2]), .D(
        pat_start[1]), .Y(n40) );
  ADDHXL U1210 ( .A(N906), .B(N905), .CO(\add_46_aco/carry [2]), .S(N138) );
  ADDHXL U1211 ( .A(N908), .B(\add_46_aco/carry [3]), .CO(
        \add_46_aco/carry [4]), .S(N140) );
  ADDHXL U1212 ( .A(N907), .B(\add_46_aco/carry [2]), .CO(
        \add_46_aco/carry [3]), .S(N139) );
  ADDHXL U1213 ( .A(N909), .B(\add_46_aco/carry [4]), .CO(
        \add_46_aco/carry [5]), .S(N141) );
  XOR2X1 U1214 ( .A(\r537/carry [5]), .B(n609), .Y(n608) );
  ADDHXL U1215 ( .A(str_start[1]), .B(str_start[0]), .CO(\r537/carry [2]), .S(
        \r537/SUM[1] ) );
  ADDHXL U1216 ( .A(str_start[2]), .B(\r537/carry [2]), .CO(\r537/carry [3]), 
        .S(\r537/SUM[2] ) );
  ADDHXL U1217 ( .A(str_start[3]), .B(\r537/carry [3]), .CO(\r537/carry [4]), 
        .S(\r537/SUM[3] ) );
  ADDHXL U1218 ( .A(str_start[4]), .B(\r537/carry [4]), .CO(\r537/carry [5]), 
        .S(\r537/SUM[4] ) );
  ADDHXL U1219 ( .A(N46), .B(N45), .CO(\r535/carry [2]), .S(N189) );
  ADDHXL U1220 ( .A(N47), .B(\r535/carry [2]), .CO(\r535/carry [3]), .S(N190)
         );
  ADDHXL U1221 ( .A(N48), .B(\r535/carry [3]), .CO(\r535/carry [4]), .S(N191)
         );
  ADDHXL U1222 ( .A(N49), .B(\r535/carry [4]), .CO(\r535/carry [5]), .S(N192)
         );
  AND3X2 U1223 ( .A(n899), .B(str_len[1]), .C(n955), .Y(n68) );
  XNOR2X1 U1224 ( .A(n155), .B(n213), .Y(n114) );
  NAND2X1 U1225 ( .A(n156), .B(N44), .Y(n155) );
  NOR2X1 U1226 ( .A(n647), .B(n648), .Y(n156) );
  AND3X2 U1227 ( .A(n246), .B(n899), .C(n955), .Y(n64) );
  AO21X1 U1228 ( .A0(n647), .A1(n648), .B0(n156), .Y(n117) );
  XOR2X1 U1229 ( .A(n646), .B(n156), .Y(n116) );
  AO22X1 U1230 ( .A0(\pattern[3][0] ), .A1(n651), .B0(\pattern[1][0] ), .B1(
        n652), .Y(n610) );
  AOI221XL U1231 ( .A0(\pattern[5][0] ), .A1(n649), .B0(\pattern[7][0] ), .B1(
        n650), .C0(n610), .Y(n613) );
  AO22X1 U1232 ( .A0(\pattern[2][0] ), .A1(n651), .B0(\pattern[0][0] ), .B1(
        n652), .Y(n611) );
  AOI221XL U1233 ( .A0(\pattern[4][0] ), .A1(n649), .B0(\pattern[6][0] ), .B1(
        n650), .C0(n611), .Y(n612) );
  AO22X1 U1234 ( .A0(\pattern[3][1] ), .A1(n651), .B0(\pattern[1][1] ), .B1(
        n652), .Y(n614) );
  AOI221XL U1235 ( .A0(\pattern[5][1] ), .A1(n649), .B0(\pattern[7][1] ), .B1(
        n650), .C0(n614), .Y(n617) );
  AO22X1 U1236 ( .A0(\pattern[2][1] ), .A1(n651), .B0(\pattern[0][1] ), .B1(
        n652), .Y(n615) );
  AOI221XL U1237 ( .A0(\pattern[4][1] ), .A1(n649), .B0(\pattern[6][1] ), .B1(
        n650), .C0(n615), .Y(n616) );
  AO22X1 U1238 ( .A0(\pattern[3][2] ), .A1(n651), .B0(\pattern[1][2] ), .B1(
        n652), .Y(n618) );
  AOI221XL U1239 ( .A0(\pattern[5][2] ), .A1(n649), .B0(\pattern[7][2] ), .B1(
        n650), .C0(n618), .Y(n621) );
  AO22X1 U1240 ( .A0(\pattern[2][2] ), .A1(n651), .B0(\pattern[0][2] ), .B1(
        n652), .Y(n619) );
  AOI221XL U1241 ( .A0(\pattern[4][2] ), .A1(n649), .B0(\pattern[6][2] ), .B1(
        n650), .C0(n619), .Y(n620) );
  AO22X1 U1242 ( .A0(\pattern[3][3] ), .A1(n651), .B0(\pattern[1][3] ), .B1(
        n652), .Y(n622) );
  AOI221XL U1243 ( .A0(\pattern[5][3] ), .A1(n649), .B0(\pattern[7][3] ), .B1(
        n650), .C0(n622), .Y(n625) );
  AO22X1 U1244 ( .A0(\pattern[2][3] ), .A1(n651), .B0(\pattern[0][3] ), .B1(
        n652), .Y(n623) );
  AOI221XL U1245 ( .A0(\pattern[4][3] ), .A1(n649), .B0(\pattern[6][3] ), .B1(
        n650), .C0(n623), .Y(n624) );
  AO22X1 U1246 ( .A0(\pattern[3][4] ), .A1(n651), .B0(\pattern[1][4] ), .B1(
        n652), .Y(n626) );
  AOI221XL U1247 ( .A0(\pattern[5][4] ), .A1(n649), .B0(\pattern[7][4] ), .B1(
        n650), .C0(n626), .Y(n629) );
  AO22X1 U1248 ( .A0(\pattern[2][4] ), .A1(n651), .B0(\pattern[0][4] ), .B1(
        n652), .Y(n627) );
  AOI221XL U1249 ( .A0(\pattern[4][4] ), .A1(n649), .B0(\pattern[6][4] ), .B1(
        n650), .C0(n627), .Y(n628) );
  AO22X1 U1250 ( .A0(\pattern[3][5] ), .A1(n651), .B0(\pattern[1][5] ), .B1(
        n652), .Y(n630) );
  AOI221XL U1251 ( .A0(\pattern[5][5] ), .A1(n649), .B0(\pattern[7][5] ), .B1(
        n650), .C0(n630), .Y(n633) );
  AO22X1 U1252 ( .A0(\pattern[2][5] ), .A1(n651), .B0(\pattern[0][5] ), .B1(
        n652), .Y(n631) );
  AOI221XL U1253 ( .A0(\pattern[4][5] ), .A1(n649), .B0(\pattern[6][5] ), .B1(
        n650), .C0(n631), .Y(n632) );
  AO22X1 U1254 ( .A0(\pattern[3][6] ), .A1(n651), .B0(\pattern[1][6] ), .B1(
        n652), .Y(n634) );
  AOI221XL U1255 ( .A0(\pattern[5][6] ), .A1(n649), .B0(\pattern[7][6] ), .B1(
        n650), .C0(n634), .Y(n637) );
  AO22X1 U1256 ( .A0(\pattern[2][6] ), .A1(n651), .B0(\pattern[0][6] ), .B1(
        n652), .Y(n635) );
  AOI221XL U1257 ( .A0(\pattern[4][6] ), .A1(n649), .B0(\pattern[6][6] ), .B1(
        n650), .C0(n635), .Y(n636) );
  AO22X1 U1258 ( .A0(\pattern[3][7] ), .A1(n651), .B0(\pattern[1][7] ), .B1(
        n652), .Y(n638) );
  AOI221XL U1259 ( .A0(\pattern[5][7] ), .A1(n649), .B0(\pattern[7][7] ), .B1(
        n650), .C0(n638), .Y(n645) );
  AO22X1 U1260 ( .A0(\pattern[2][7] ), .A1(n651), .B0(\pattern[0][7] ), .B1(
        n652), .Y(n641) );
  AOI221XL U1261 ( .A0(\pattern[4][7] ), .A1(n649), .B0(\pattern[6][7] ), .B1(
        n650), .C0(n641), .Y(n644) );
  NOR2X1 U1262 ( .A(n838), .B(N47), .Y(n653) );
  NOR2X1 U1263 ( .A(n840), .B(N46), .Y(n660) );
  NOR2X1 U1264 ( .A(N45), .B(N46), .Y(n661) );
  OAI22XL U1265 ( .A0(\string[9][0] ), .A1(n841), .B0(\string[8][0] ), .B1(
        n842), .Y(n658) );
  AND2X1 U1266 ( .A(N46), .B(N45), .Y(n662) );
  AND2X1 U1267 ( .A(N46), .B(n840), .Y(n663) );
  OAI22XL U1268 ( .A0(\string[11][0] ), .A1(n843), .B0(\string[10][0] ), .B1(
        n844), .Y(n657) );
  NOR2X1 U1269 ( .A(n838), .B(n839), .Y(n654) );
  OAI22XL U1270 ( .A0(\string[13][0] ), .A1(n845), .B0(\string[12][0] ), .B1(
        n846), .Y(n656) );
  OAI22XL U1271 ( .A0(\string[15][0] ), .A1(n847), .B0(\string[14][0] ), .B1(
        n848), .Y(n655) );
  NOR4X1 U1272 ( .A(n658), .B(n657), .C(n656), .D(n655), .Y(n680) );
  NOR2X1 U1273 ( .A(N47), .B(N48), .Y(n659) );
  OAI221XL U1274 ( .A0(\string[0][0] ), .A1(n849), .B0(\string[1][0] ), .B1(
        n850), .C0(n837), .Y(n668) );
  OAI22XL U1275 ( .A0(\string[3][0] ), .A1(n851), .B0(\string[2][0] ), .B1(
        n852), .Y(n667) );
  NOR2X1 U1276 ( .A(n839), .B(N48), .Y(n664) );
  OAI22XL U1277 ( .A0(\string[5][0] ), .A1(n853), .B0(\string[4][0] ), .B1(
        n854), .Y(n666) );
  OAI22XL U1278 ( .A0(\string[7][0] ), .A1(n855), .B0(\string[6][0] ), .B1(
        n856), .Y(n665) );
  NOR4X1 U1279 ( .A(n668), .B(n667), .C(n666), .D(n665), .Y(n679) );
  OAI22XL U1280 ( .A0(\string[25][0] ), .A1(n841), .B0(\string[24][0] ), .B1(
        n842), .Y(n672) );
  OAI22XL U1281 ( .A0(\string[27][0] ), .A1(n843), .B0(\string[26][0] ), .B1(
        n844), .Y(n671) );
  OAI22XL U1282 ( .A0(\string[29][0] ), .A1(n845), .B0(\string[28][0] ), .B1(
        n846), .Y(n670) );
  OAI22XL U1283 ( .A0(\string[31][0] ), .A1(n847), .B0(\string[30][0] ), .B1(
        n848), .Y(n669) );
  NOR4X1 U1284 ( .A(n672), .B(n671), .C(n670), .D(n669), .Y(n678) );
  OAI221XL U1285 ( .A0(\string[16][0] ), .A1(n849), .B0(\string[17][0] ), .B1(
        n850), .C0(N49), .Y(n676) );
  OAI22XL U1286 ( .A0(\string[19][0] ), .A1(n851), .B0(\string[18][0] ), .B1(
        n852), .Y(n675) );
  OAI22XL U1287 ( .A0(\string[21][0] ), .A1(n853), .B0(\string[20][0] ), .B1(
        n854), .Y(n674) );
  OAI22XL U1288 ( .A0(\string[23][0] ), .A1(n855), .B0(\string[22][0] ), .B1(
        n856), .Y(n673) );
  NOR4X1 U1289 ( .A(n676), .B(n675), .C(n674), .D(n673), .Y(n677) );
  AO22X1 U1290 ( .A0(n680), .A1(n679), .B0(n678), .B1(n677), .Y(N65) );
  OAI22XL U1291 ( .A0(\string[9][1] ), .A1(n841), .B0(\string[8][1] ), .B1(
        n842), .Y(n684) );
  OAI22XL U1292 ( .A0(\string[11][1] ), .A1(n843), .B0(\string[10][1] ), .B1(
        n844), .Y(n683) );
  OAI22XL U1293 ( .A0(\string[13][1] ), .A1(n845), .B0(\string[12][1] ), .B1(
        n846), .Y(n682) );
  OAI22XL U1294 ( .A0(\string[15][1] ), .A1(n847), .B0(\string[14][1] ), .B1(
        n848), .Y(n681) );
  NOR4X1 U1295 ( .A(n684), .B(n683), .C(n682), .D(n681), .Y(n700) );
  OAI221XL U1296 ( .A0(\string[0][1] ), .A1(n849), .B0(\string[1][1] ), .B1(
        n850), .C0(n837), .Y(n688) );
  OAI22XL U1297 ( .A0(\string[3][1] ), .A1(n851), .B0(\string[2][1] ), .B1(
        n852), .Y(n687) );
  OAI22XL U1298 ( .A0(\string[5][1] ), .A1(n853), .B0(\string[4][1] ), .B1(
        n854), .Y(n686) );
  OAI22XL U1299 ( .A0(\string[7][1] ), .A1(n855), .B0(\string[6][1] ), .B1(
        n856), .Y(n685) );
  NOR4X1 U1300 ( .A(n688), .B(n687), .C(n686), .D(n685), .Y(n699) );
  OAI22XL U1301 ( .A0(\string[25][1] ), .A1(n841), .B0(\string[24][1] ), .B1(
        n842), .Y(n692) );
  OAI22XL U1302 ( .A0(\string[27][1] ), .A1(n843), .B0(\string[26][1] ), .B1(
        n844), .Y(n691) );
  OAI22XL U1303 ( .A0(\string[29][1] ), .A1(n845), .B0(\string[28][1] ), .B1(
        n846), .Y(n690) );
  OAI22XL U1304 ( .A0(\string[31][1] ), .A1(n847), .B0(\string[30][1] ), .B1(
        n848), .Y(n689) );
  NOR4X1 U1305 ( .A(n692), .B(n691), .C(n690), .D(n689), .Y(n698) );
  OAI221XL U1306 ( .A0(\string[16][1] ), .A1(n849), .B0(\string[17][1] ), .B1(
        n850), .C0(N49), .Y(n696) );
  OAI22XL U1307 ( .A0(\string[19][1] ), .A1(n851), .B0(\string[18][1] ), .B1(
        n852), .Y(n695) );
  OAI22XL U1308 ( .A0(\string[21][1] ), .A1(n853), .B0(\string[20][1] ), .B1(
        n854), .Y(n694) );
  OAI22XL U1309 ( .A0(\string[23][1] ), .A1(n855), .B0(\string[22][1] ), .B1(
        n856), .Y(n693) );
  NOR4X1 U1310 ( .A(n696), .B(n695), .C(n694), .D(n693), .Y(n697) );
  AO22X1 U1311 ( .A0(n700), .A1(n699), .B0(n698), .B1(n697), .Y(N64) );
  OAI22XL U1312 ( .A0(\string[9][2] ), .A1(n841), .B0(\string[8][2] ), .B1(
        n842), .Y(n704) );
  OAI22XL U1313 ( .A0(\string[11][2] ), .A1(n843), .B0(\string[10][2] ), .B1(
        n844), .Y(n703) );
  OAI22XL U1314 ( .A0(\string[13][2] ), .A1(n845), .B0(\string[12][2] ), .B1(
        n846), .Y(n702) );
  OAI22XL U1315 ( .A0(\string[15][2] ), .A1(n847), .B0(\string[14][2] ), .B1(
        n848), .Y(n701) );
  NOR4X1 U1316 ( .A(n704), .B(n703), .C(n702), .D(n701), .Y(n720) );
  OAI221XL U1317 ( .A0(\string[0][2] ), .A1(n849), .B0(\string[1][2] ), .B1(
        n850), .C0(n837), .Y(n708) );
  OAI22XL U1318 ( .A0(\string[3][2] ), .A1(n851), .B0(\string[2][2] ), .B1(
        n852), .Y(n707) );
  OAI22XL U1319 ( .A0(\string[5][2] ), .A1(n853), .B0(\string[4][2] ), .B1(
        n854), .Y(n706) );
  OAI22XL U1320 ( .A0(\string[7][2] ), .A1(n855), .B0(\string[6][2] ), .B1(
        n856), .Y(n705) );
  NOR4X1 U1321 ( .A(n708), .B(n707), .C(n706), .D(n705), .Y(n719) );
  OAI22XL U1322 ( .A0(\string[25][2] ), .A1(n841), .B0(\string[24][2] ), .B1(
        n842), .Y(n712) );
  OAI22XL U1323 ( .A0(\string[27][2] ), .A1(n843), .B0(\string[26][2] ), .B1(
        n844), .Y(n711) );
  OAI22XL U1324 ( .A0(\string[29][2] ), .A1(n845), .B0(\string[28][2] ), .B1(
        n846), .Y(n710) );
  OAI22XL U1325 ( .A0(\string[31][2] ), .A1(n847), .B0(\string[30][2] ), .B1(
        n848), .Y(n709) );
  NOR4X1 U1326 ( .A(n712), .B(n711), .C(n710), .D(n709), .Y(n718) );
  OAI221XL U1327 ( .A0(\string[16][2] ), .A1(n849), .B0(\string[17][2] ), .B1(
        n850), .C0(N49), .Y(n716) );
  OAI22XL U1328 ( .A0(\string[19][2] ), .A1(n851), .B0(\string[18][2] ), .B1(
        n852), .Y(n715) );
  OAI22XL U1329 ( .A0(\string[21][2] ), .A1(n853), .B0(\string[20][2] ), .B1(
        n854), .Y(n714) );
  OAI22XL U1330 ( .A0(\string[23][2] ), .A1(n855), .B0(\string[22][2] ), .B1(
        n856), .Y(n713) );
  NOR4X1 U1331 ( .A(n716), .B(n715), .C(n714), .D(n713), .Y(n717) );
  AO22X1 U1332 ( .A0(n720), .A1(n719), .B0(n718), .B1(n717), .Y(N63) );
  OAI22XL U1333 ( .A0(\string[9][3] ), .A1(n841), .B0(\string[8][3] ), .B1(
        n842), .Y(n724) );
  OAI22XL U1334 ( .A0(\string[11][3] ), .A1(n843), .B0(\string[10][3] ), .B1(
        n844), .Y(n723) );
  OAI22XL U1335 ( .A0(\string[13][3] ), .A1(n845), .B0(\string[12][3] ), .B1(
        n846), .Y(n722) );
  OAI22XL U1336 ( .A0(\string[15][3] ), .A1(n847), .B0(\string[14][3] ), .B1(
        n848), .Y(n721) );
  NOR4X1 U1337 ( .A(n724), .B(n723), .C(n722), .D(n721), .Y(n740) );
  OAI221XL U1338 ( .A0(\string[0][3] ), .A1(n849), .B0(\string[1][3] ), .B1(
        n850), .C0(n837), .Y(n728) );
  OAI22XL U1339 ( .A0(\string[3][3] ), .A1(n851), .B0(\string[2][3] ), .B1(
        n852), .Y(n727) );
  OAI22XL U1340 ( .A0(\string[5][3] ), .A1(n853), .B0(\string[4][3] ), .B1(
        n854), .Y(n726) );
  OAI22XL U1341 ( .A0(\string[7][3] ), .A1(n855), .B0(\string[6][3] ), .B1(
        n856), .Y(n725) );
  NOR4X1 U1342 ( .A(n728), .B(n727), .C(n726), .D(n725), .Y(n739) );
  OAI22XL U1343 ( .A0(\string[25][3] ), .A1(n841), .B0(\string[24][3] ), .B1(
        n842), .Y(n732) );
  OAI22XL U1344 ( .A0(\string[27][3] ), .A1(n843), .B0(\string[26][3] ), .B1(
        n844), .Y(n731) );
  OAI22XL U1345 ( .A0(\string[29][3] ), .A1(n845), .B0(\string[28][3] ), .B1(
        n846), .Y(n730) );
  OAI22XL U1346 ( .A0(\string[31][3] ), .A1(n847), .B0(\string[30][3] ), .B1(
        n848), .Y(n729) );
  NOR4X1 U1347 ( .A(n732), .B(n731), .C(n730), .D(n729), .Y(n738) );
  OAI221XL U1348 ( .A0(\string[16][3] ), .A1(n849), .B0(\string[17][3] ), .B1(
        n850), .C0(N49), .Y(n736) );
  OAI22XL U1349 ( .A0(\string[19][3] ), .A1(n851), .B0(\string[18][3] ), .B1(
        n852), .Y(n735) );
  OAI22XL U1350 ( .A0(\string[21][3] ), .A1(n853), .B0(\string[20][3] ), .B1(
        n854), .Y(n734) );
  OAI22XL U1351 ( .A0(\string[23][3] ), .A1(n855), .B0(\string[22][3] ), .B1(
        n856), .Y(n733) );
  NOR4X1 U1352 ( .A(n736), .B(n735), .C(n734), .D(n733), .Y(n737) );
  AO22X1 U1353 ( .A0(n740), .A1(n739), .B0(n738), .B1(n737), .Y(N62) );
  OAI22XL U1354 ( .A0(\string[9][4] ), .A1(n841), .B0(\string[8][4] ), .B1(
        n842), .Y(n744) );
  OAI22XL U1355 ( .A0(\string[11][4] ), .A1(n843), .B0(\string[10][4] ), .B1(
        n844), .Y(n743) );
  OAI22XL U1356 ( .A0(\string[13][4] ), .A1(n845), .B0(\string[12][4] ), .B1(
        n846), .Y(n742) );
  OAI22XL U1357 ( .A0(\string[15][4] ), .A1(n847), .B0(\string[14][4] ), .B1(
        n848), .Y(n741) );
  NOR4X1 U1358 ( .A(n744), .B(n743), .C(n742), .D(n741), .Y(n760) );
  OAI221XL U1359 ( .A0(\string[0][4] ), .A1(n849), .B0(\string[1][4] ), .B1(
        n850), .C0(n837), .Y(n748) );
  OAI22XL U1360 ( .A0(\string[3][4] ), .A1(n851), .B0(\string[2][4] ), .B1(
        n852), .Y(n747) );
  OAI22XL U1361 ( .A0(\string[5][4] ), .A1(n853), .B0(\string[4][4] ), .B1(
        n854), .Y(n746) );
  OAI22XL U1362 ( .A0(\string[7][4] ), .A1(n855), .B0(\string[6][4] ), .B1(
        n856), .Y(n745) );
  NOR4X1 U1363 ( .A(n748), .B(n747), .C(n746), .D(n745), .Y(n759) );
  OAI22XL U1364 ( .A0(\string[25][4] ), .A1(n841), .B0(\string[24][4] ), .B1(
        n842), .Y(n752) );
  OAI22XL U1365 ( .A0(\string[27][4] ), .A1(n843), .B0(\string[26][4] ), .B1(
        n844), .Y(n751) );
  OAI22XL U1366 ( .A0(\string[29][4] ), .A1(n845), .B0(\string[28][4] ), .B1(
        n846), .Y(n750) );
  OAI22XL U1367 ( .A0(\string[31][4] ), .A1(n847), .B0(\string[30][4] ), .B1(
        n848), .Y(n749) );
  NOR4X1 U1368 ( .A(n752), .B(n751), .C(n750), .D(n749), .Y(n758) );
  OAI221XL U1369 ( .A0(\string[16][4] ), .A1(n849), .B0(\string[17][4] ), .B1(
        n850), .C0(N49), .Y(n756) );
  OAI22XL U1370 ( .A0(\string[19][4] ), .A1(n851), .B0(\string[18][4] ), .B1(
        n852), .Y(n755) );
  OAI22XL U1371 ( .A0(\string[21][4] ), .A1(n853), .B0(\string[20][4] ), .B1(
        n854), .Y(n754) );
  OAI22XL U1372 ( .A0(\string[23][4] ), .A1(n855), .B0(\string[22][4] ), .B1(
        n856), .Y(n753) );
  NOR4X1 U1373 ( .A(n756), .B(n755), .C(n754), .D(n753), .Y(n757) );
  AO22X1 U1374 ( .A0(n760), .A1(n759), .B0(n758), .B1(n757), .Y(N61) );
  OAI22XL U1375 ( .A0(\string[9][5] ), .A1(n841), .B0(\string[8][5] ), .B1(
        n842), .Y(n764) );
  OAI22XL U1376 ( .A0(\string[11][5] ), .A1(n843), .B0(\string[10][5] ), .B1(
        n844), .Y(n763) );
  OAI22XL U1377 ( .A0(\string[13][5] ), .A1(n845), .B0(\string[12][5] ), .B1(
        n846), .Y(n762) );
  OAI22XL U1378 ( .A0(\string[15][5] ), .A1(n847), .B0(\string[14][5] ), .B1(
        n848), .Y(n761) );
  NOR4X1 U1379 ( .A(n764), .B(n763), .C(n762), .D(n761), .Y(n780) );
  OAI221XL U1380 ( .A0(\string[0][5] ), .A1(n849), .B0(\string[1][5] ), .B1(
        n850), .C0(n837), .Y(n768) );
  OAI22XL U1381 ( .A0(\string[3][5] ), .A1(n851), .B0(\string[2][5] ), .B1(
        n852), .Y(n767) );
  OAI22XL U1382 ( .A0(\string[5][5] ), .A1(n853), .B0(\string[4][5] ), .B1(
        n854), .Y(n766) );
  OAI22XL U1383 ( .A0(\string[7][5] ), .A1(n855), .B0(\string[6][5] ), .B1(
        n856), .Y(n765) );
  NOR4X1 U1384 ( .A(n768), .B(n767), .C(n766), .D(n765), .Y(n779) );
  OAI22XL U1385 ( .A0(\string[25][5] ), .A1(n841), .B0(\string[24][5] ), .B1(
        n842), .Y(n772) );
  OAI22XL U1386 ( .A0(\string[27][5] ), .A1(n843), .B0(\string[26][5] ), .B1(
        n844), .Y(n771) );
  OAI22XL U1387 ( .A0(\string[29][5] ), .A1(n845), .B0(\string[28][5] ), .B1(
        n846), .Y(n770) );
  OAI22XL U1388 ( .A0(\string[31][5] ), .A1(n847), .B0(\string[30][5] ), .B1(
        n848), .Y(n769) );
  NOR4X1 U1389 ( .A(n772), .B(n771), .C(n770), .D(n769), .Y(n778) );
  OAI221XL U1390 ( .A0(\string[16][5] ), .A1(n849), .B0(\string[17][5] ), .B1(
        n850), .C0(N49), .Y(n776) );
  OAI22XL U1391 ( .A0(\string[19][5] ), .A1(n851), .B0(\string[18][5] ), .B1(
        n852), .Y(n775) );
  OAI22XL U1392 ( .A0(\string[21][5] ), .A1(n853), .B0(\string[20][5] ), .B1(
        n854), .Y(n774) );
  OAI22XL U1393 ( .A0(\string[23][5] ), .A1(n855), .B0(\string[22][5] ), .B1(
        n856), .Y(n773) );
  NOR4X1 U1394 ( .A(n776), .B(n775), .C(n774), .D(n773), .Y(n777) );
  AO22X1 U1395 ( .A0(n780), .A1(n779), .B0(n778), .B1(n777), .Y(N60) );
  OAI22XL U1396 ( .A0(\string[9][6] ), .A1(n841), .B0(\string[8][6] ), .B1(
        n842), .Y(n784) );
  OAI22XL U1397 ( .A0(\string[11][6] ), .A1(n843), .B0(\string[10][6] ), .B1(
        n844), .Y(n783) );
  OAI22XL U1398 ( .A0(\string[13][6] ), .A1(n845), .B0(\string[12][6] ), .B1(
        n846), .Y(n782) );
  OAI22XL U1399 ( .A0(\string[15][6] ), .A1(n847), .B0(\string[14][6] ), .B1(
        n848), .Y(n781) );
  NOR4X1 U1400 ( .A(n784), .B(n783), .C(n782), .D(n781), .Y(n800) );
  OAI221XL U1401 ( .A0(\string[0][6] ), .A1(n849), .B0(\string[1][6] ), .B1(
        n850), .C0(n837), .Y(n788) );
  OAI22XL U1402 ( .A0(\string[3][6] ), .A1(n851), .B0(\string[2][6] ), .B1(
        n852), .Y(n787) );
  OAI22XL U1403 ( .A0(\string[5][6] ), .A1(n853), .B0(\string[4][6] ), .B1(
        n854), .Y(n786) );
  OAI22XL U1404 ( .A0(\string[7][6] ), .A1(n855), .B0(\string[6][6] ), .B1(
        n856), .Y(n785) );
  NOR4X1 U1405 ( .A(n788), .B(n787), .C(n786), .D(n785), .Y(n799) );
  OAI22XL U1406 ( .A0(\string[25][6] ), .A1(n841), .B0(\string[24][6] ), .B1(
        n842), .Y(n792) );
  OAI22XL U1407 ( .A0(\string[27][6] ), .A1(n843), .B0(\string[26][6] ), .B1(
        n844), .Y(n791) );
  OAI22XL U1408 ( .A0(\string[29][6] ), .A1(n845), .B0(\string[28][6] ), .B1(
        n846), .Y(n790) );
  OAI22XL U1409 ( .A0(\string[31][6] ), .A1(n847), .B0(\string[30][6] ), .B1(
        n848), .Y(n789) );
  NOR4X1 U1410 ( .A(n792), .B(n791), .C(n790), .D(n789), .Y(n798) );
  OAI221XL U1411 ( .A0(\string[16][6] ), .A1(n849), .B0(\string[17][6] ), .B1(
        n850), .C0(N49), .Y(n796) );
  OAI22XL U1412 ( .A0(\string[19][6] ), .A1(n851), .B0(\string[18][6] ), .B1(
        n852), .Y(n795) );
  OAI22XL U1413 ( .A0(\string[21][6] ), .A1(n853), .B0(\string[20][6] ), .B1(
        n854), .Y(n794) );
  OAI22XL U1414 ( .A0(\string[23][6] ), .A1(n855), .B0(\string[22][6] ), .B1(
        n856), .Y(n793) );
  NOR4X1 U1415 ( .A(n796), .B(n795), .C(n794), .D(n793), .Y(n797) );
  AO22X1 U1416 ( .A0(n800), .A1(n799), .B0(n798), .B1(n797), .Y(N59) );
  OAI22XL U1417 ( .A0(\string[9][7] ), .A1(n841), .B0(\string[8][7] ), .B1(
        n842), .Y(n804) );
  OAI22XL U1418 ( .A0(\string[11][7] ), .A1(n843), .B0(\string[10][7] ), .B1(
        n844), .Y(n803) );
  OAI22XL U1419 ( .A0(\string[13][7] ), .A1(n845), .B0(\string[12][7] ), .B1(
        n846), .Y(n802) );
  OAI22XL U1420 ( .A0(\string[15][7] ), .A1(n847), .B0(\string[14][7] ), .B1(
        n848), .Y(n801) );
  NOR4X1 U1421 ( .A(n804), .B(n803), .C(n802), .D(n801), .Y(n836) );
  OAI221XL U1422 ( .A0(\string[0][7] ), .A1(n849), .B0(\string[1][7] ), .B1(
        n850), .C0(n837), .Y(n808) );
  OAI22XL U1423 ( .A0(\string[3][7] ), .A1(n851), .B0(\string[2][7] ), .B1(
        n852), .Y(n807) );
  OAI22XL U1424 ( .A0(\string[5][7] ), .A1(n853), .B0(\string[4][7] ), .B1(
        n854), .Y(n806) );
  OAI22XL U1425 ( .A0(\string[7][7] ), .A1(n855), .B0(\string[6][7] ), .B1(
        n856), .Y(n805) );
  NOR4X1 U1426 ( .A(n808), .B(n807), .C(n806), .D(n805), .Y(n835) );
  OAI22XL U1427 ( .A0(\string[26][7] ), .A1(n844), .B0(\string[25][7] ), .B1(
        n841), .Y(n819) );
  OAI22XL U1428 ( .A0(\string[28][7] ), .A1(n846), .B0(\string[27][7] ), .B1(
        n843), .Y(n818) );
  OAI22XL U1429 ( .A0(\string[30][7] ), .A1(n848), .B0(\string[29][7] ), .B1(
        n845), .Y(n817) );
  OAI21XL U1430 ( .A0(\string[31][7] ), .A1(n847), .B0(N49), .Y(n816) );
  NOR4X1 U1431 ( .A(n819), .B(n818), .C(n817), .D(n816), .Y(n834) );
  OAI222XL U1432 ( .A0(\string[17][7] ), .A1(n850), .B0(\string[16][7] ), .B1(
        n849), .C0(\string[18][7] ), .C1(n852), .Y(n832) );
  OAI22XL U1433 ( .A0(\string[20][7] ), .A1(n854), .B0(\string[19][7] ), .B1(
        n851), .Y(n831) );
  OAI22XL U1434 ( .A0(\string[22][7] ), .A1(n856), .B0(\string[21][7] ), .B1(
        n853), .Y(n830) );
  OAI22XL U1435 ( .A0(\string[24][7] ), .A1(n842), .B0(\string[23][7] ), .B1(
        n855), .Y(n829) );
  NOR4X1 U1436 ( .A(n832), .B(n831), .C(n830), .D(n829), .Y(n833) );
  AO22X1 U1437 ( .A0(n836), .A1(n835), .B0(n834), .B1(n833), .Y(N58) );
  OR2X1 U1438 ( .A(n919), .B(n898), .Y(\sub_66/carry [1]) );
  XNOR2X1 U1439 ( .A(n898), .B(n919), .Y(N161) );
  AND2X1 U1440 ( .A(str_len[0]), .B(N71), .Y(N905) );
  AND2X1 U1441 ( .A(str_len[1]), .B(N71), .Y(N906) );
  AND2X1 U1442 ( .A(n899), .B(N71), .Y(N907) );
  AND2X1 U1443 ( .A(str_len[3]), .B(N71), .Y(N908) );
  AND2X1 U1444 ( .A(str_len[4]), .B(N71), .Y(N909) );
  AND2X1 U1445 ( .A(N71), .B(str_len[5]), .Y(N910) );
  CLKINVX1 U1446 ( .A(N905), .Y(N137) );
  XOR2X1 U1447 ( .A(\add_46_aco/carry [5]), .B(N910), .Y(N142) );
  CLKINVX1 U1448 ( .A(\sub_66/carry [4]), .Y(N165) );
  XOR2X1 U1449 ( .A(\add_66_2/carry [5]), .B(str_len[5]), .Y(N177) );
  CLKINVX1 U1450 ( .A(N45), .Y(N188) );
  XOR2X1 U1451 ( .A(\r535/carry [5]), .B(\cur_str[5] ), .Y(N193) );
  NAND2BX1 U1452 ( .AN(N176), .B(N170), .Y(n930) );
  NOR2BX1 U1453 ( .AN(N176), .B(N170), .Y(n920) );
  OA22X1 U1454 ( .A0(n920), .A1(n934), .B0(n920), .B1(N177), .Y(n929) );
  NAND2BX1 U1455 ( .AN(N174), .B(N168), .Y(n923) );
  AOI2BB1X1 U1456 ( .A0N(n931), .A1N(N167), .B0(n955), .Y(n921) );
  AO22X1 U1457 ( .A0(n921), .A1(N166), .B0(N167), .B1(n931), .Y(n926) );
  NOR2BX1 U1458 ( .AN(N174), .B(N168), .Y(n922) );
  OAI22XL U1459 ( .A0(n922), .A1(n933), .B0(N175), .B1(n922), .Y(n925) );
  OAI22XL U1460 ( .A0(N175), .A1(n933), .B0(N175), .B1(n923), .Y(n924) );
  AOI221XL U1461 ( .A0(N169), .A1(n932), .B0(n926), .B1(n925), .C0(n924), .Y(
        n928) );
  OA22X1 U1462 ( .A0(N177), .A1(n934), .B0(n930), .B1(N177), .Y(n927) );
  OAI221XL U1463 ( .A0(n930), .A1(n934), .B0(n929), .B1(n928), .C0(n927), .Y(
        N178) );
endmodule

