/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x8ef4fb42 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/Xilinx/WorkSpace/CPU/1.9/VGA/VGA.v";
static int ng1[] = {0, 0};
static unsigned int ng2[] = {800U, 0U};
static int ng3[] = {1, 0};
static unsigned int ng4[] = {521U, 0U};
static unsigned int ng5[] = {96U, 0U};
static unsigned int ng6[] = {1U, 0U};
static unsigned int ng7[] = {0U, 0U};
static unsigned int ng8[] = {2U, 0U};
static int ng9[] = {60, 0};
static int ng10[] = {480, 0};
static int ng11[] = {250, 0};
static int ng12[] = {670, 0};
static int ng13[] = {260, 0};
static int ng14[] = {360, 0};
static int ng15[] = {460, 0};
static int ng16[] = {560, 0};
static unsigned int ng17[] = {3U, 0U};
static int ng18[] = {70, 0};
static int ng19[] = {170, 0};
static int ng20[] = {270, 0};
static int ng21[] = {370, 0};



static void Always_30_0(char *t0)
{
    char t13[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;

LAB0:    t1 = (t0 + 2088U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(30, ng0);
    t2 = (t0 + 3148);
    *((int *)t2) = 1;
    t3 = (t0 + 2116);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(30, ng0);

LAB5:    xsi_set_current_line(31, ng0);
    t4 = (t0 + 692U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(32, ng0);
    t2 = (t0 + 1380);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t13, 0, 8);
    t11 = (t4 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = *((unsigned int *)t5);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t11);
    t10 = *((unsigned int *)t12);
    t14 = (t9 ^ t10);
    t15 = (t8 | t14);
    t16 = *((unsigned int *)t11);
    t17 = *((unsigned int *)t12);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB12;

LAB9:    if (t18 != 0)
        goto LAB11;

LAB10:    *((unsigned int *)t13) = 1;

LAB12:    t22 = (t13 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t13);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB13;

LAB14:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 1380);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 32, t4, 10, t5, 32);
    t11 = (t0 + 1380);
    xsi_vlogvar_wait_assign_value(t11, t13, 0, 0, 10, 0LL);

LAB15:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(31, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 1380);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 10, 0LL);
    goto LAB8;

LAB11:    t21 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB12;

LAB13:    xsi_set_current_line(32, ng0);
    t28 = ((char*)((ng1)));
    t29 = (t0 + 1380);
    xsi_vlogvar_wait_assign_value(t29, t28, 0, 0, 10, 0LL);
    goto LAB15;

}

static void Always_36_1(char *t0)
{
    char t13[8];
    char t32[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t33;

LAB0:    t1 = (t0 + 2232U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(36, ng0);
    t2 = (t0 + 3156);
    *((int *)t2) = 1;
    t3 = (t0 + 2260);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(36, ng0);

LAB5:    xsi_set_current_line(37, ng0);
    t4 = (t0 + 692U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(38, ng0);
    t2 = (t0 + 1472);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t13, 0, 8);
    t11 = (t4 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = *((unsigned int *)t5);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t11);
    t10 = *((unsigned int *)t12);
    t14 = (t9 ^ t10);
    t15 = (t8 | t14);
    t16 = *((unsigned int *)t11);
    t17 = *((unsigned int *)t12);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB12;

LAB9:    if (t18 != 0)
        goto LAB11;

LAB10:    *((unsigned int *)t13) = 1;

LAB12:    t22 = (t13 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t13);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB13;

LAB14:    xsi_set_current_line(39, ng0);
    t2 = (t0 + 1380);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t13, 0, 8);
    t11 = (t4 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = *((unsigned int *)t5);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t11);
    t10 = *((unsigned int *)t12);
    t14 = (t9 ^ t10);
    t15 = (t8 | t14);
    t16 = *((unsigned int *)t11);
    t17 = *((unsigned int *)t12);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB19;

LAB16:    if (t18 != 0)
        goto LAB18;

LAB17:    *((unsigned int *)t13) = 1;

LAB19:    t22 = (t13 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t13);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB20;

LAB21:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 1472);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = (t0 + 1472);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 10, 0LL);

LAB22:
LAB15:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(37, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 1472);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 10, 0LL);
    goto LAB8;

LAB11:    t21 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB12;

LAB13:    xsi_set_current_line(38, ng0);
    t28 = ((char*)((ng1)));
    t29 = (t0 + 1472);
    xsi_vlogvar_wait_assign_value(t29, t28, 0, 0, 10, 0LL);
    goto LAB15;

LAB18:    t21 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB19;

LAB20:    xsi_set_current_line(39, ng0);
    t28 = (t0 + 1472);
    t29 = (t28 + 36U);
    t30 = *((char **)t29);
    t31 = ((char*)((ng3)));
    memset(t32, 0, 8);
    xsi_vlog_unsigned_add(t32, 32, t30, 10, t31, 32);
    t33 = (t0 + 1472);
    xsi_vlogvar_wait_assign_value(t33, t32, 0, 0, 10, 0LL);
    goto LAB22;

}

static void Cont_43_2(char *t0)
{
    char t3[8];
    char t4[8];
    char t8[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;

LAB0:    t1 = (t0 + 2376U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(43, ng0);
    t2 = (t0 + 1380);
    t5 = (t2 + 36U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng5)));
    memset(t8, 0, 8);
    t9 = (t6 + 4);
    if (*((unsigned int *)t9) != 0)
        goto LAB5;

LAB4:    t10 = (t7 + 4);
    if (*((unsigned int *)t10) != 0)
        goto LAB5;

LAB8:    if (*((unsigned int *)t6) < *((unsigned int *)t7))
        goto LAB7;

LAB6:    *((unsigned int *)t8) = 1;

LAB7:    memset(t4, 0, 8);
    t12 = (t8 + 4);
    t13 = *((unsigned int *)t12);
    t14 = (~(t13));
    t15 = *((unsigned int *)t8);
    t16 = (t15 & t14);
    t17 = (t16 & 1U);
    if (t17 != 0)
        goto LAB9;

LAB10:    if (*((unsigned int *)t12) != 0)
        goto LAB11;

LAB12:    t19 = (t4 + 4);
    t20 = *((unsigned int *)t4);
    t21 = *((unsigned int *)t19);
    t22 = (t20 || t21);
    if (t22 > 0)
        goto LAB13;

LAB14:    t24 = *((unsigned int *)t4);
    t25 = (~(t24));
    t26 = *((unsigned int *)t19);
    t27 = (t25 || t26);
    if (t27 > 0)
        goto LAB15;

LAB16:    if (*((unsigned int *)t19) > 0)
        goto LAB17;

LAB18:    if (*((unsigned int *)t4) > 0)
        goto LAB19;

LAB20:    memcpy(t3, t28, 8);

LAB21:    t29 = (t0 + 3240);
    t30 = (t29 + 32U);
    t31 = *((char **)t30);
    t32 = (t31 + 40U);
    t33 = *((char **)t32);
    memset(t33, 0, 8);
    t34 = 1U;
    t35 = t34;
    t36 = (t3 + 4);
    t37 = *((unsigned int *)t3);
    t34 = (t34 & t37);
    t38 = *((unsigned int *)t36);
    t35 = (t35 & t38);
    t39 = (t33 + 4);
    t40 = *((unsigned int *)t33);
    *((unsigned int *)t33) = (t40 | t34);
    t41 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t41 | t35);
    xsi_driver_vfirst_trans(t29, 0, 0);
    t42 = (t0 + 3164);
    *((int *)t42) = 1;

LAB1:    return;
LAB5:    t11 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB7;

LAB9:    *((unsigned int *)t4) = 1;
    goto LAB12;

LAB11:    t18 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t18) = 1;
    goto LAB12;

LAB13:    t23 = ((char*)((ng6)));
    goto LAB14;

LAB15:    t28 = ((char*)((ng7)));
    goto LAB16;

LAB17:    xsi_vlog_unsigned_bit_combine(t3, 1, t23, 1, t28, 1);
    goto LAB21;

LAB19:    memcpy(t3, t23, 8);
    goto LAB21;

}

static void Cont_45_3(char *t0)
{
    char t3[8];
    char t4[8];
    char t8[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;

LAB0:    t1 = (t0 + 2520U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(45, ng0);
    t2 = (t0 + 1472);
    t5 = (t2 + 36U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng8)));
    memset(t8, 0, 8);
    t9 = (t6 + 4);
    if (*((unsigned int *)t9) != 0)
        goto LAB5;

LAB4:    t10 = (t7 + 4);
    if (*((unsigned int *)t10) != 0)
        goto LAB5;

LAB8:    if (*((unsigned int *)t6) < *((unsigned int *)t7))
        goto LAB7;

LAB6:    *((unsigned int *)t8) = 1;

LAB7:    memset(t4, 0, 8);
    t12 = (t8 + 4);
    t13 = *((unsigned int *)t12);
    t14 = (~(t13));
    t15 = *((unsigned int *)t8);
    t16 = (t15 & t14);
    t17 = (t16 & 1U);
    if (t17 != 0)
        goto LAB9;

LAB10:    if (*((unsigned int *)t12) != 0)
        goto LAB11;

LAB12:    t19 = (t4 + 4);
    t20 = *((unsigned int *)t4);
    t21 = *((unsigned int *)t19);
    t22 = (t20 || t21);
    if (t22 > 0)
        goto LAB13;

LAB14:    t24 = *((unsigned int *)t4);
    t25 = (~(t24));
    t26 = *((unsigned int *)t19);
    t27 = (t25 || t26);
    if (t27 > 0)
        goto LAB15;

LAB16:    if (*((unsigned int *)t19) > 0)
        goto LAB17;

LAB18:    if (*((unsigned int *)t4) > 0)
        goto LAB19;

LAB20:    memcpy(t3, t28, 8);

LAB21:    t29 = (t0 + 3276);
    t30 = (t29 + 32U);
    t31 = *((char **)t30);
    t32 = (t31 + 40U);
    t33 = *((char **)t32);
    memset(t33, 0, 8);
    t34 = 1U;
    t35 = t34;
    t36 = (t3 + 4);
    t37 = *((unsigned int *)t3);
    t34 = (t34 & t37);
    t38 = *((unsigned int *)t36);
    t35 = (t35 & t38);
    t39 = (t33 + 4);
    t40 = *((unsigned int *)t33);
    *((unsigned int *)t33) = (t40 | t34);
    t41 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t41 | t35);
    xsi_driver_vfirst_trans(t29, 0, 0);
    t42 = (t0 + 3172);
    *((int *)t42) = 1;

LAB1:    return;
LAB5:    t11 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB7;

LAB9:    *((unsigned int *)t4) = 1;
    goto LAB12;

LAB11:    t18 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t18) = 1;
    goto LAB12;

LAB13:    t23 = ((char*)((ng6)));
    goto LAB14;

LAB15:    t28 = ((char*)((ng7)));
    goto LAB16;

LAB17:    xsi_vlog_unsigned_bit_combine(t3, 1, t23, 1, t28, 1);
    goto LAB21;

LAB19:    memcpy(t3, t23, 8);
    goto LAB21;

}

static void Cont_48_4(char *t0)
{
    char t3[8];
    char t4[8];
    char t8[8];
    char t12[8];
    char t28[8];
    char t32[8];
    char t40[8];
    char t72[8];
    char t88[8];
    char t92[8];
    char t100[8];
    char t132[8];
    char t148[8];
    char t152[8];
    char t160[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
    char *t11;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t29;
    char *t30;
    char *t31;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    char *t44;
    char *t45;
    char *t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    char *t54;
    char *t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    int t64;
    int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    char *t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    char *t79;
    char *t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    char *t84;
    char *t85;
    char *t86;
    char *t87;
    char *t89;
    char *t90;
    char *t91;
    char *t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    char *t99;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    char *t104;
    char *t105;
    char *t106;
    unsigned int t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    char *t114;
    char *t115;
    unsigned int t116;
    unsigned int t117;
    unsigned int t118;
    unsigned int t119;
    unsigned int t120;
    unsigned int t121;
    unsigned int t122;
    unsigned int t123;
    int t124;
    int t125;
    unsigned int t126;
    unsigned int t127;
    unsigned int t128;
    unsigned int t129;
    unsigned int t130;
    unsigned int t131;
    char *t133;
    unsigned int t134;
    unsigned int t135;
    unsigned int t136;
    unsigned int t137;
    unsigned int t138;
    char *t139;
    char *t140;
    unsigned int t141;
    unsigned int t142;
    unsigned int t143;
    char *t144;
    char *t145;
    char *t146;
    char *t147;
    char *t149;
    char *t150;
    char *t151;
    char *t153;
    unsigned int t154;
    unsigned int t155;
    unsigned int t156;
    unsigned int t157;
    unsigned int t158;
    char *t159;
    unsigned int t161;
    unsigned int t162;
    unsigned int t163;
    char *t164;
    char *t165;
    char *t166;
    unsigned int t167;
    unsigned int t168;
    unsigned int t169;
    unsigned int t170;
    unsigned int t171;
    unsigned int t172;
    unsigned int t173;
    char *t174;
    char *t175;
    unsigned int t176;
    unsigned int t177;
    unsigned int t178;
    unsigned int t179;
    unsigned int t180;
    unsigned int t181;
    unsigned int t182;
    unsigned int t183;
    int t184;
    int t185;
    unsigned int t186;
    unsigned int t187;
    unsigned int t188;
    unsigned int t189;
    unsigned int t190;
    unsigned int t191;
    char *t192;
    unsigned int t193;
    unsigned int t194;
    unsigned int t195;
    unsigned int t196;
    unsigned int t197;
    char *t198;
    char *t199;
    unsigned int t200;
    unsigned int t201;
    unsigned int t202;
    char *t203;
    unsigned int t204;
    unsigned int t205;
    unsigned int t206;
    unsigned int t207;
    char *t208;
    char *t209;
    char *t210;
    char *t211;
    char *t212;
    char *t213;
    unsigned int t214;
    unsigned int t215;
    char *t216;
    unsigned int t217;
    unsigned int t218;
    char *t219;
    unsigned int t220;
    unsigned int t221;
    char *t222;

LAB0:    t1 = (t0 + 2664U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(48, ng0);
    t2 = (t0 + 1472);
    t5 = (t2 + 36U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng9)));
    memset(t8, 0, 8);
    t9 = (t6 + 4);
    if (*((unsigned int *)t9) != 0)
        goto LAB5;

LAB4:    t10 = (t7 + 4);
    if (*((unsigned int *)t10) != 0)
        goto LAB5;

LAB8:    if (*((unsigned int *)t6) > *((unsigned int *)t7))
        goto LAB6;

LAB7:    memset(t12, 0, 8);
    t13 = (t8 + 4);
    t14 = *((unsigned int *)t13);
    t15 = (~(t14));
    t16 = *((unsigned int *)t8);
    t17 = (t16 & t15);
    t18 = (t17 & 1U);
    if (t18 != 0)
        goto LAB9;

LAB10:    if (*((unsigned int *)t13) != 0)
        goto LAB11;

LAB12:    t20 = (t12 + 4);
    t21 = *((unsigned int *)t12);
    t22 = *((unsigned int *)t20);
    t23 = (t21 || t22);
    if (t23 > 0)
        goto LAB13;

LAB14:    memcpy(t40, t12, 8);

LAB15:    memset(t72, 0, 8);
    t73 = (t40 + 4);
    t74 = *((unsigned int *)t73);
    t75 = (~(t74));
    t76 = *((unsigned int *)t40);
    t77 = (t76 & t75);
    t78 = (t77 & 1U);
    if (t78 != 0)
        goto LAB28;

LAB29:    if (*((unsigned int *)t73) != 0)
        goto LAB30;

LAB31:    t80 = (t72 + 4);
    t81 = *((unsigned int *)t72);
    t82 = *((unsigned int *)t80);
    t83 = (t81 || t82);
    if (t83 > 0)
        goto LAB32;

LAB33:    memcpy(t100, t72, 8);

LAB34:    memset(t132, 0, 8);
    t133 = (t100 + 4);
    t134 = *((unsigned int *)t133);
    t135 = (~(t134));
    t136 = *((unsigned int *)t100);
    t137 = (t136 & t135);
    t138 = (t137 & 1U);
    if (t138 != 0)
        goto LAB47;

LAB48:    if (*((unsigned int *)t133) != 0)
        goto LAB49;

LAB50:    t140 = (t132 + 4);
    t141 = *((unsigned int *)t132);
    t142 = *((unsigned int *)t140);
    t143 = (t141 || t142);
    if (t143 > 0)
        goto LAB51;

LAB52:    memcpy(t160, t132, 8);

LAB53:    memset(t4, 0, 8);
    t192 = (t160 + 4);
    t193 = *((unsigned int *)t192);
    t194 = (~(t193));
    t195 = *((unsigned int *)t160);
    t196 = (t195 & t194);
    t197 = (t196 & 1U);
    if (t197 != 0)
        goto LAB66;

LAB67:    if (*((unsigned int *)t192) != 0)
        goto LAB68;

LAB69:    t199 = (t4 + 4);
    t200 = *((unsigned int *)t4);
    t201 = *((unsigned int *)t199);
    t202 = (t200 || t201);
    if (t202 > 0)
        goto LAB70;

LAB71:    t204 = *((unsigned int *)t4);
    t205 = (~(t204));
    t206 = *((unsigned int *)t199);
    t207 = (t205 || t206);
    if (t207 > 0)
        goto LAB72;

LAB73:    if (*((unsigned int *)t199) > 0)
        goto LAB74;

LAB75:    if (*((unsigned int *)t4) > 0)
        goto LAB76;

LAB77:    memcpy(t3, t208, 8);

LAB78:    t209 = (t0 + 3312);
    t210 = (t209 + 32U);
    t211 = *((char **)t210);
    t212 = (t211 + 40U);
    t213 = *((char **)t212);
    memset(t213, 0, 8);
    t214 = 1U;
    t215 = t214;
    t216 = (t3 + 4);
    t217 = *((unsigned int *)t3);
    t214 = (t214 & t217);
    t218 = *((unsigned int *)t216);
    t215 = (t215 & t218);
    t219 = (t213 + 4);
    t220 = *((unsigned int *)t213);
    *((unsigned int *)t213) = (t220 | t214);
    t221 = *((unsigned int *)t219);
    *((unsigned int *)t219) = (t221 | t215);
    xsi_driver_vfirst_trans(t209, 0, 0);
    t222 = (t0 + 3180);
    *((int *)t222) = 1;

LAB1:    return;
LAB5:    t11 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB7;

LAB6:    *((unsigned int *)t8) = 1;
    goto LAB7;

LAB9:    *((unsigned int *)t12) = 1;
    goto LAB12;

LAB11:    t19 = (t12 + 4);
    *((unsigned int *)t12) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB12;

LAB13:    t24 = (t0 + 1472);
    t25 = (t24 + 36U);
    t26 = *((char **)t25);
    t27 = ((char*)((ng10)));
    memset(t28, 0, 8);
    t29 = (t26 + 4);
    if (*((unsigned int *)t29) != 0)
        goto LAB17;

LAB16:    t30 = (t27 + 4);
    if (*((unsigned int *)t30) != 0)
        goto LAB17;

LAB20:    if (*((unsigned int *)t26) > *((unsigned int *)t27))
        goto LAB19;

LAB18:    *((unsigned int *)t28) = 1;

LAB19:    memset(t32, 0, 8);
    t33 = (t28 + 4);
    t34 = *((unsigned int *)t33);
    t35 = (~(t34));
    t36 = *((unsigned int *)t28);
    t37 = (t36 & t35);
    t38 = (t37 & 1U);
    if (t38 != 0)
        goto LAB21;

LAB22:    if (*((unsigned int *)t33) != 0)
        goto LAB23;

LAB24:    t41 = *((unsigned int *)t12);
    t42 = *((unsigned int *)t32);
    t43 = (t41 & t42);
    *((unsigned int *)t40) = t43;
    t44 = (t12 + 4);
    t45 = (t32 + 4);
    t46 = (t40 + 4);
    t47 = *((unsigned int *)t44);
    t48 = *((unsigned int *)t45);
    t49 = (t47 | t48);
    *((unsigned int *)t46) = t49;
    t50 = *((unsigned int *)t46);
    t51 = (t50 != 0);
    if (t51 == 1)
        goto LAB25;

LAB26:
LAB27:    goto LAB15;

LAB17:    t31 = (t28 + 4);
    *((unsigned int *)t28) = 1;
    *((unsigned int *)t31) = 1;
    goto LAB19;

LAB21:    *((unsigned int *)t32) = 1;
    goto LAB24;

LAB23:    t39 = (t32 + 4);
    *((unsigned int *)t32) = 1;
    *((unsigned int *)t39) = 1;
    goto LAB24;

LAB25:    t52 = *((unsigned int *)t40);
    t53 = *((unsigned int *)t46);
    *((unsigned int *)t40) = (t52 | t53);
    t54 = (t12 + 4);
    t55 = (t32 + 4);
    t56 = *((unsigned int *)t12);
    t57 = (~(t56));
    t58 = *((unsigned int *)t54);
    t59 = (~(t58));
    t60 = *((unsigned int *)t32);
    t61 = (~(t60));
    t62 = *((unsigned int *)t55);
    t63 = (~(t62));
    t64 = (t57 & t59);
    t65 = (t61 & t63);
    t66 = (~(t64));
    t67 = (~(t65));
    t68 = *((unsigned int *)t46);
    *((unsigned int *)t46) = (t68 & t66);
    t69 = *((unsigned int *)t46);
    *((unsigned int *)t46) = (t69 & t67);
    t70 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t70 & t66);
    t71 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t71 & t67);
    goto LAB27;

LAB28:    *((unsigned int *)t72) = 1;
    goto LAB31;

LAB30:    t79 = (t72 + 4);
    *((unsigned int *)t72) = 1;
    *((unsigned int *)t79) = 1;
    goto LAB31;

LAB32:    t84 = (t0 + 1380);
    t85 = (t84 + 36U);
    t86 = *((char **)t85);
    t87 = ((char*)((ng11)));
    memset(t88, 0, 8);
    t89 = (t86 + 4);
    if (*((unsigned int *)t89) != 0)
        goto LAB36;

LAB35:    t90 = (t87 + 4);
    if (*((unsigned int *)t90) != 0)
        goto LAB36;

LAB39:    if (*((unsigned int *)t86) > *((unsigned int *)t87))
        goto LAB37;

LAB38:    memset(t92, 0, 8);
    t93 = (t88 + 4);
    t94 = *((unsigned int *)t93);
    t95 = (~(t94));
    t96 = *((unsigned int *)t88);
    t97 = (t96 & t95);
    t98 = (t97 & 1U);
    if (t98 != 0)
        goto LAB40;

LAB41:    if (*((unsigned int *)t93) != 0)
        goto LAB42;

LAB43:    t101 = *((unsigned int *)t72);
    t102 = *((unsigned int *)t92);
    t103 = (t101 & t102);
    *((unsigned int *)t100) = t103;
    t104 = (t72 + 4);
    t105 = (t92 + 4);
    t106 = (t100 + 4);
    t107 = *((unsigned int *)t104);
    t108 = *((unsigned int *)t105);
    t109 = (t107 | t108);
    *((unsigned int *)t106) = t109;
    t110 = *((unsigned int *)t106);
    t111 = (t110 != 0);
    if (t111 == 1)
        goto LAB44;

LAB45:
LAB46:    goto LAB34;

LAB36:    t91 = (t88 + 4);
    *((unsigned int *)t88) = 1;
    *((unsigned int *)t91) = 1;
    goto LAB38;

LAB37:    *((unsigned int *)t88) = 1;
    goto LAB38;

LAB40:    *((unsigned int *)t92) = 1;
    goto LAB43;

LAB42:    t99 = (t92 + 4);
    *((unsigned int *)t92) = 1;
    *((unsigned int *)t99) = 1;
    goto LAB43;

LAB44:    t112 = *((unsigned int *)t100);
    t113 = *((unsigned int *)t106);
    *((unsigned int *)t100) = (t112 | t113);
    t114 = (t72 + 4);
    t115 = (t92 + 4);
    t116 = *((unsigned int *)t72);
    t117 = (~(t116));
    t118 = *((unsigned int *)t114);
    t119 = (~(t118));
    t120 = *((unsigned int *)t92);
    t121 = (~(t120));
    t122 = *((unsigned int *)t115);
    t123 = (~(t122));
    t124 = (t117 & t119);
    t125 = (t121 & t123);
    t126 = (~(t124));
    t127 = (~(t125));
    t128 = *((unsigned int *)t106);
    *((unsigned int *)t106) = (t128 & t126);
    t129 = *((unsigned int *)t106);
    *((unsigned int *)t106) = (t129 & t127);
    t130 = *((unsigned int *)t100);
    *((unsigned int *)t100) = (t130 & t126);
    t131 = *((unsigned int *)t100);
    *((unsigned int *)t100) = (t131 & t127);
    goto LAB46;

LAB47:    *((unsigned int *)t132) = 1;
    goto LAB50;

LAB49:    t139 = (t132 + 4);
    *((unsigned int *)t132) = 1;
    *((unsigned int *)t139) = 1;
    goto LAB50;

LAB51:    t144 = (t0 + 1380);
    t145 = (t144 + 36U);
    t146 = *((char **)t145);
    t147 = ((char*)((ng12)));
    memset(t148, 0, 8);
    t149 = (t146 + 4);
    if (*((unsigned int *)t149) != 0)
        goto LAB55;

LAB54:    t150 = (t147 + 4);
    if (*((unsigned int *)t150) != 0)
        goto LAB55;

LAB58:    if (*((unsigned int *)t146) > *((unsigned int *)t147))
        goto LAB57;

LAB56:    *((unsigned int *)t148) = 1;

LAB57:    memset(t152, 0, 8);
    t153 = (t148 + 4);
    t154 = *((unsigned int *)t153);
    t155 = (~(t154));
    t156 = *((unsigned int *)t148);
    t157 = (t156 & t155);
    t158 = (t157 & 1U);
    if (t158 != 0)
        goto LAB59;

LAB60:    if (*((unsigned int *)t153) != 0)
        goto LAB61;

LAB62:    t161 = *((unsigned int *)t132);
    t162 = *((unsigned int *)t152);
    t163 = (t161 & t162);
    *((unsigned int *)t160) = t163;
    t164 = (t132 + 4);
    t165 = (t152 + 4);
    t166 = (t160 + 4);
    t167 = *((unsigned int *)t164);
    t168 = *((unsigned int *)t165);
    t169 = (t167 | t168);
    *((unsigned int *)t166) = t169;
    t170 = *((unsigned int *)t166);
    t171 = (t170 != 0);
    if (t171 == 1)
        goto LAB63;

LAB64:
LAB65:    goto LAB53;

LAB55:    t151 = (t148 + 4);
    *((unsigned int *)t148) = 1;
    *((unsigned int *)t151) = 1;
    goto LAB57;

LAB59:    *((unsigned int *)t152) = 1;
    goto LAB62;

LAB61:    t159 = (t152 + 4);
    *((unsigned int *)t152) = 1;
    *((unsigned int *)t159) = 1;
    goto LAB62;

LAB63:    t172 = *((unsigned int *)t160);
    t173 = *((unsigned int *)t166);
    *((unsigned int *)t160) = (t172 | t173);
    t174 = (t132 + 4);
    t175 = (t152 + 4);
    t176 = *((unsigned int *)t132);
    t177 = (~(t176));
    t178 = *((unsigned int *)t174);
    t179 = (~(t178));
    t180 = *((unsigned int *)t152);
    t181 = (~(t180));
    t182 = *((unsigned int *)t175);
    t183 = (~(t182));
    t184 = (t177 & t179);
    t185 = (t181 & t183);
    t186 = (~(t184));
    t187 = (~(t185));
    t188 = *((unsigned int *)t166);
    *((unsigned int *)t166) = (t188 & t186);
    t189 = *((unsigned int *)t166);
    *((unsigned int *)t166) = (t189 & t187);
    t190 = *((unsigned int *)t160);
    *((unsigned int *)t160) = (t190 & t186);
    t191 = *((unsigned int *)t160);
    *((unsigned int *)t160) = (t191 & t187);
    goto LAB65;

LAB66:    *((unsigned int *)t4) = 1;
    goto LAB69;

LAB68:    t198 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t198) = 1;
    goto LAB69;

LAB70:    t203 = ((char*)((ng6)));
    goto LAB71;

LAB72:    t208 = ((char*)((ng7)));
    goto LAB73;

LAB74:    xsi_vlog_unsigned_bit_combine(t3, 1, t203, 1, t208, 1);
    goto LAB78;

LAB76:    memcpy(t3, t203, 8);
    goto LAB78;

}

static void Always_50_5(char *t0)
{
    char t8[8];
    char t12[8];
    char t28[8];
    char t32[8];
    char t40[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
    char *t11;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t29;
    char *t30;
    char *t31;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    char *t44;
    char *t45;
    char *t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    char *t54;
    char *t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    int t64;
    int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    char *t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    char *t78;
    char *t79;

LAB0:    t1 = (t0 + 2808U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(50, ng0);
    t2 = (t0 + 3188);
    *((int *)t2) = 1;
    t3 = (t0 + 2836);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(50, ng0);

LAB5:    xsi_set_current_line(51, ng0);
    t4 = (t0 + 1380);
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng13)));
    memset(t8, 0, 8);
    t9 = (t6 + 4);
    if (*((unsigned int *)t9) != 0)
        goto LAB7;

LAB6:    t10 = (t7 + 4);
    if (*((unsigned int *)t10) != 0)
        goto LAB7;

LAB10:    if (*((unsigned int *)t6) > *((unsigned int *)t7))
        goto LAB8;

LAB9:    memset(t12, 0, 8);
    t13 = (t8 + 4);
    t14 = *((unsigned int *)t13);
    t15 = (~(t14));
    t16 = *((unsigned int *)t8);
    t17 = (t16 & t15);
    t18 = (t17 & 1U);
    if (t18 != 0)
        goto LAB11;

LAB12:    if (*((unsigned int *)t13) != 0)
        goto LAB13;

LAB14:    t20 = (t12 + 4);
    t21 = *((unsigned int *)t12);
    t22 = *((unsigned int *)t20);
    t23 = (t21 || t22);
    if (t23 > 0)
        goto LAB15;

LAB16:    memcpy(t40, t12, 8);

LAB17:    t72 = (t40 + 4);
    t73 = *((unsigned int *)t72);
    t74 = (~(t73));
    t75 = *((unsigned int *)t40);
    t76 = (t75 & t74);
    t77 = (t76 != 0);
    if (t77 > 0)
        goto LAB30;

LAB31:    xsi_set_current_line(52, ng0);
    t2 = (t0 + 1380);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng14)));
    memset(t8, 0, 8);
    t6 = (t4 + 4);
    if (*((unsigned int *)t6) != 0)
        goto LAB34;

LAB33:    t7 = (t5 + 4);
    if (*((unsigned int *)t7) != 0)
        goto LAB34;

LAB37:    if (*((unsigned int *)t4) > *((unsigned int *)t5))
        goto LAB35;

LAB36:    memset(t12, 0, 8);
    t10 = (t8 + 4);
    t14 = *((unsigned int *)t10);
    t15 = (~(t14));
    t16 = *((unsigned int *)t8);
    t17 = (t16 & t15);
    t18 = (t17 & 1U);
    if (t18 != 0)
        goto LAB38;

LAB39:    if (*((unsigned int *)t10) != 0)
        goto LAB40;

LAB41:    t13 = (t12 + 4);
    t21 = *((unsigned int *)t12);
    t22 = *((unsigned int *)t13);
    t23 = (t21 || t22);
    if (t23 > 0)
        goto LAB42;

LAB43:    memcpy(t40, t12, 8);

LAB44:    t54 = (t40 + 4);
    t73 = *((unsigned int *)t54);
    t74 = (~(t73));
    t75 = *((unsigned int *)t40);
    t76 = (t75 & t74);
    t77 = (t76 != 0);
    if (t77 > 0)
        goto LAB57;

LAB58:    xsi_set_current_line(53, ng0);
    t2 = (t0 + 1380);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng15)));
    memset(t8, 0, 8);
    t6 = (t4 + 4);
    if (*((unsigned int *)t6) != 0)
        goto LAB61;

LAB60:    t7 = (t5 + 4);
    if (*((unsigned int *)t7) != 0)
        goto LAB61;

LAB64:    if (*((unsigned int *)t4) > *((unsigned int *)t5))
        goto LAB62;

LAB63:    memset(t12, 0, 8);
    t10 = (t8 + 4);
    t14 = *((unsigned int *)t10);
    t15 = (~(t14));
    t16 = *((unsigned int *)t8);
    t17 = (t16 & t15);
    t18 = (t17 & 1U);
    if (t18 != 0)
        goto LAB65;

LAB66:    if (*((unsigned int *)t10) != 0)
        goto LAB67;

LAB68:    t13 = (t12 + 4);
    t21 = *((unsigned int *)t12);
    t22 = *((unsigned int *)t13);
    t23 = (t21 || t22);
    if (t23 > 0)
        goto LAB69;

LAB70:    memcpy(t40, t12, 8);

LAB71:    t54 = (t40 + 4);
    t73 = *((unsigned int *)t54);
    t74 = (~(t73));
    t75 = *((unsigned int *)t40);
    t76 = (t75 & t74);
    t77 = (t76 != 0);
    if (t77 > 0)
        goto LAB84;

LAB85:    xsi_set_current_line(54, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 1196);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);

LAB86:
LAB59:
LAB32:    goto LAB2;

LAB7:    t11 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB9;

LAB8:    *((unsigned int *)t8) = 1;
    goto LAB9;

LAB11:    *((unsigned int *)t12) = 1;
    goto LAB14;

LAB13:    t19 = (t12 + 4);
    *((unsigned int *)t12) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB14;

LAB15:    t24 = (t0 + 1380);
    t25 = (t24 + 36U);
    t26 = *((char **)t25);
    t27 = ((char*)((ng14)));
    memset(t28, 0, 8);
    t29 = (t26 + 4);
    if (*((unsigned int *)t29) != 0)
        goto LAB19;

LAB18:    t30 = (t27 + 4);
    if (*((unsigned int *)t30) != 0)
        goto LAB19;

LAB22:    if (*((unsigned int *)t26) > *((unsigned int *)t27))
        goto LAB21;

LAB20:    *((unsigned int *)t28) = 1;

LAB21:    memset(t32, 0, 8);
    t33 = (t28 + 4);
    t34 = *((unsigned int *)t33);
    t35 = (~(t34));
    t36 = *((unsigned int *)t28);
    t37 = (t36 & t35);
    t38 = (t37 & 1U);
    if (t38 != 0)
        goto LAB23;

LAB24:    if (*((unsigned int *)t33) != 0)
        goto LAB25;

LAB26:    t41 = *((unsigned int *)t12);
    t42 = *((unsigned int *)t32);
    t43 = (t41 & t42);
    *((unsigned int *)t40) = t43;
    t44 = (t12 + 4);
    t45 = (t32 + 4);
    t46 = (t40 + 4);
    t47 = *((unsigned int *)t44);
    t48 = *((unsigned int *)t45);
    t49 = (t47 | t48);
    *((unsigned int *)t46) = t49;
    t50 = *((unsigned int *)t46);
    t51 = (t50 != 0);
    if (t51 == 1)
        goto LAB27;

LAB28:
LAB29:    goto LAB17;

LAB19:    t31 = (t28 + 4);
    *((unsigned int *)t28) = 1;
    *((unsigned int *)t31) = 1;
    goto LAB21;

LAB23:    *((unsigned int *)t32) = 1;
    goto LAB26;

LAB25:    t39 = (t32 + 4);
    *((unsigned int *)t32) = 1;
    *((unsigned int *)t39) = 1;
    goto LAB26;

LAB27:    t52 = *((unsigned int *)t40);
    t53 = *((unsigned int *)t46);
    *((unsigned int *)t40) = (t52 | t53);
    t54 = (t12 + 4);
    t55 = (t32 + 4);
    t56 = *((unsigned int *)t12);
    t57 = (~(t56));
    t58 = *((unsigned int *)t54);
    t59 = (~(t58));
    t60 = *((unsigned int *)t32);
    t61 = (~(t60));
    t62 = *((unsigned int *)t55);
    t63 = (~(t62));
    t64 = (t57 & t59);
    t65 = (t61 & t63);
    t66 = (~(t64));
    t67 = (~(t65));
    t68 = *((unsigned int *)t46);
    *((unsigned int *)t46) = (t68 & t66);
    t69 = *((unsigned int *)t46);
    *((unsigned int *)t46) = (t69 & t67);
    t70 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t70 & t66);
    t71 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t71 & t67);
    goto LAB29;

LAB30:    xsi_set_current_line(51, ng0);
    t78 = ((char*)((ng7)));
    t79 = (t0 + 1196);
    xsi_vlogvar_assign_value(t79, t78, 0, 0, 2);
    goto LAB32;

LAB34:    t9 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB36;

LAB35:    *((unsigned int *)t8) = 1;
    goto LAB36;

LAB38:    *((unsigned int *)t12) = 1;
    goto LAB41;

LAB40:    t11 = (t12 + 4);
    *((unsigned int *)t12) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB41;

LAB42:    t19 = (t0 + 1380);
    t20 = (t19 + 36U);
    t24 = *((char **)t20);
    t25 = ((char*)((ng15)));
    memset(t28, 0, 8);
    t26 = (t24 + 4);
    if (*((unsigned int *)t26) != 0)
        goto LAB46;

LAB45:    t27 = (t25 + 4);
    if (*((unsigned int *)t27) != 0)
        goto LAB46;

LAB49:    if (*((unsigned int *)t24) > *((unsigned int *)t25))
        goto LAB48;

LAB47:    *((unsigned int *)t28) = 1;

LAB48:    memset(t32, 0, 8);
    t30 = (t28 + 4);
    t34 = *((unsigned int *)t30);
    t35 = (~(t34));
    t36 = *((unsigned int *)t28);
    t37 = (t36 & t35);
    t38 = (t37 & 1U);
    if (t38 != 0)
        goto LAB50;

LAB51:    if (*((unsigned int *)t30) != 0)
        goto LAB52;

LAB53:    t41 = *((unsigned int *)t12);
    t42 = *((unsigned int *)t32);
    t43 = (t41 & t42);
    *((unsigned int *)t40) = t43;
    t33 = (t12 + 4);
    t39 = (t32 + 4);
    t44 = (t40 + 4);
    t47 = *((unsigned int *)t33);
    t48 = *((unsigned int *)t39);
    t49 = (t47 | t48);
    *((unsigned int *)t44) = t49;
    t50 = *((unsigned int *)t44);
    t51 = (t50 != 0);
    if (t51 == 1)
        goto LAB54;

LAB55:
LAB56:    goto LAB44;

LAB46:    t29 = (t28 + 4);
    *((unsigned int *)t28) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB48;

LAB50:    *((unsigned int *)t32) = 1;
    goto LAB53;

LAB52:    t31 = (t32 + 4);
    *((unsigned int *)t32) = 1;
    *((unsigned int *)t31) = 1;
    goto LAB53;

LAB54:    t52 = *((unsigned int *)t40);
    t53 = *((unsigned int *)t44);
    *((unsigned int *)t40) = (t52 | t53);
    t45 = (t12 + 4);
    t46 = (t32 + 4);
    t56 = *((unsigned int *)t12);
    t57 = (~(t56));
    t58 = *((unsigned int *)t45);
    t59 = (~(t58));
    t60 = *((unsigned int *)t32);
    t61 = (~(t60));
    t62 = *((unsigned int *)t46);
    t63 = (~(t62));
    t64 = (t57 & t59);
    t65 = (t61 & t63);
    t66 = (~(t64));
    t67 = (~(t65));
    t68 = *((unsigned int *)t44);
    *((unsigned int *)t44) = (t68 & t66);
    t69 = *((unsigned int *)t44);
    *((unsigned int *)t44) = (t69 & t67);
    t70 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t70 & t66);
    t71 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t71 & t67);
    goto LAB56;

LAB57:    xsi_set_current_line(52, ng0);
    t55 = ((char*)((ng6)));
    t72 = (t0 + 1196);
    xsi_vlogvar_assign_value(t72, t55, 0, 0, 2);
    goto LAB59;

LAB61:    t9 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB63;

LAB62:    *((unsigned int *)t8) = 1;
    goto LAB63;

LAB65:    *((unsigned int *)t12) = 1;
    goto LAB68;

LAB67:    t11 = (t12 + 4);
    *((unsigned int *)t12) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB68;

LAB69:    t19 = (t0 + 1380);
    t20 = (t19 + 36U);
    t24 = *((char **)t20);
    t25 = ((char*)((ng16)));
    memset(t28, 0, 8);
    t26 = (t24 + 4);
    if (*((unsigned int *)t26) != 0)
        goto LAB73;

LAB72:    t27 = (t25 + 4);
    if (*((unsigned int *)t27) != 0)
        goto LAB73;

LAB76:    if (*((unsigned int *)t24) > *((unsigned int *)t25))
        goto LAB75;

LAB74:    *((unsigned int *)t28) = 1;

LAB75:    memset(t32, 0, 8);
    t30 = (t28 + 4);
    t34 = *((unsigned int *)t30);
    t35 = (~(t34));
    t36 = *((unsigned int *)t28);
    t37 = (t36 & t35);
    t38 = (t37 & 1U);
    if (t38 != 0)
        goto LAB77;

LAB78:    if (*((unsigned int *)t30) != 0)
        goto LAB79;

LAB80:    t41 = *((unsigned int *)t12);
    t42 = *((unsigned int *)t32);
    t43 = (t41 & t42);
    *((unsigned int *)t40) = t43;
    t33 = (t12 + 4);
    t39 = (t32 + 4);
    t44 = (t40 + 4);
    t47 = *((unsigned int *)t33);
    t48 = *((unsigned int *)t39);
    t49 = (t47 | t48);
    *((unsigned int *)t44) = t49;
    t50 = *((unsigned int *)t44);
    t51 = (t50 != 0);
    if (t51 == 1)
        goto LAB81;

LAB82:
LAB83:    goto LAB71;

LAB73:    t29 = (t28 + 4);
    *((unsigned int *)t28) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB75;

LAB77:    *((unsigned int *)t32) = 1;
    goto LAB80;

LAB79:    t31 = (t32 + 4);
    *((unsigned int *)t32) = 1;
    *((unsigned int *)t31) = 1;
    goto LAB80;

LAB81:    t52 = *((unsigned int *)t40);
    t53 = *((unsigned int *)t44);
    *((unsigned int *)t40) = (t52 | t53);
    t45 = (t12 + 4);
    t46 = (t32 + 4);
    t56 = *((unsigned int *)t12);
    t57 = (~(t56));
    t58 = *((unsigned int *)t45);
    t59 = (~(t58));
    t60 = *((unsigned int *)t32);
    t61 = (~(t60));
    t62 = *((unsigned int *)t46);
    t63 = (~(t62));
    t64 = (t57 & t59);
    t65 = (t61 & t63);
    t66 = (~(t64));
    t67 = (~(t65));
    t68 = *((unsigned int *)t44);
    *((unsigned int *)t44) = (t68 & t66);
    t69 = *((unsigned int *)t44);
    *((unsigned int *)t44) = (t69 & t67);
    t70 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t70 & t66);
    t71 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t71 & t67);
    goto LAB83;

LAB84:    xsi_set_current_line(53, ng0);
    t55 = ((char*)((ng8)));
    t72 = (t0 + 1196);
    xsi_vlogvar_assign_value(t72, t55, 0, 0, 2);
    goto LAB86;

}

static void Always_57_6(char *t0)
{
    char t8[8];
    char t12[8];
    char t28[8];
    char t32[8];
    char t40[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
    char *t11;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t29;
    char *t30;
    char *t31;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    char *t44;
    char *t45;
    char *t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    char *t54;
    char *t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    int t64;
    int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    char *t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    char *t78;
    char *t79;

LAB0:    t1 = (t0 + 2952U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(57, ng0);
    t2 = (t0 + 3196);
    *((int *)t2) = 1;
    t3 = (t0 + 2980);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(57, ng0);

LAB5:    xsi_set_current_line(58, ng0);
    t4 = (t0 + 1472);
    t5 = (t4 + 36U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng18)));
    memset(t8, 0, 8);
    t9 = (t6 + 4);
    if (*((unsigned int *)t9) != 0)
        goto LAB7;

LAB6:    t10 = (t7 + 4);
    if (*((unsigned int *)t10) != 0)
        goto LAB7;

LAB10:    if (*((unsigned int *)t6) > *((unsigned int *)t7))
        goto LAB8;

LAB9:    memset(t12, 0, 8);
    t13 = (t8 + 4);
    t14 = *((unsigned int *)t13);
    t15 = (~(t14));
    t16 = *((unsigned int *)t8);
    t17 = (t16 & t15);
    t18 = (t17 & 1U);
    if (t18 != 0)
        goto LAB11;

LAB12:    if (*((unsigned int *)t13) != 0)
        goto LAB13;

LAB14:    t20 = (t12 + 4);
    t21 = *((unsigned int *)t12);
    t22 = *((unsigned int *)t20);
    t23 = (t21 || t22);
    if (t23 > 0)
        goto LAB15;

LAB16:    memcpy(t40, t12, 8);

LAB17:    t72 = (t40 + 4);
    t73 = *((unsigned int *)t72);
    t74 = (~(t73));
    t75 = *((unsigned int *)t40);
    t76 = (t75 & t74);
    t77 = (t76 != 0);
    if (t77 > 0)
        goto LAB30;

LAB31:    xsi_set_current_line(59, ng0);
    t2 = (t0 + 1472);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng19)));
    memset(t8, 0, 8);
    t6 = (t4 + 4);
    if (*((unsigned int *)t6) != 0)
        goto LAB34;

LAB33:    t7 = (t5 + 4);
    if (*((unsigned int *)t7) != 0)
        goto LAB34;

LAB37:    if (*((unsigned int *)t4) > *((unsigned int *)t5))
        goto LAB35;

LAB36:    memset(t12, 0, 8);
    t10 = (t8 + 4);
    t14 = *((unsigned int *)t10);
    t15 = (~(t14));
    t16 = *((unsigned int *)t8);
    t17 = (t16 & t15);
    t18 = (t17 & 1U);
    if (t18 != 0)
        goto LAB38;

LAB39:    if (*((unsigned int *)t10) != 0)
        goto LAB40;

LAB41:    t13 = (t12 + 4);
    t21 = *((unsigned int *)t12);
    t22 = *((unsigned int *)t13);
    t23 = (t21 || t22);
    if (t23 > 0)
        goto LAB42;

LAB43:    memcpy(t40, t12, 8);

LAB44:    t54 = (t40 + 4);
    t73 = *((unsigned int *)t54);
    t74 = (~(t73));
    t75 = *((unsigned int *)t40);
    t76 = (t75 & t74);
    t77 = (t76 != 0);
    if (t77 > 0)
        goto LAB57;

LAB58:    xsi_set_current_line(60, ng0);
    t2 = (t0 + 1472);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng20)));
    memset(t8, 0, 8);
    t6 = (t4 + 4);
    if (*((unsigned int *)t6) != 0)
        goto LAB61;

LAB60:    t7 = (t5 + 4);
    if (*((unsigned int *)t7) != 0)
        goto LAB61;

LAB64:    if (*((unsigned int *)t4) > *((unsigned int *)t5))
        goto LAB62;

LAB63:    memset(t12, 0, 8);
    t10 = (t8 + 4);
    t14 = *((unsigned int *)t10);
    t15 = (~(t14));
    t16 = *((unsigned int *)t8);
    t17 = (t16 & t15);
    t18 = (t17 & 1U);
    if (t18 != 0)
        goto LAB65;

LAB66:    if (*((unsigned int *)t10) != 0)
        goto LAB67;

LAB68:    t13 = (t12 + 4);
    t21 = *((unsigned int *)t12);
    t22 = *((unsigned int *)t13);
    t23 = (t21 || t22);
    if (t23 > 0)
        goto LAB69;

LAB70:    memcpy(t40, t12, 8);

LAB71:    t54 = (t40 + 4);
    t73 = *((unsigned int *)t54);
    t74 = (~(t73));
    t75 = *((unsigned int *)t40);
    t76 = (t75 & t74);
    t77 = (t76 != 0);
    if (t77 > 0)
        goto LAB84;

LAB85:    xsi_set_current_line(61, ng0);
    t2 = ((char*)((ng17)));
    t3 = (t0 + 1288);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);

LAB86:
LAB59:
LAB32:    goto LAB2;

LAB7:    t11 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB9;

LAB8:    *((unsigned int *)t8) = 1;
    goto LAB9;

LAB11:    *((unsigned int *)t12) = 1;
    goto LAB14;

LAB13:    t19 = (t12 + 4);
    *((unsigned int *)t12) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB14;

LAB15:    t24 = (t0 + 1472);
    t25 = (t24 + 36U);
    t26 = *((char **)t25);
    t27 = ((char*)((ng19)));
    memset(t28, 0, 8);
    t29 = (t26 + 4);
    if (*((unsigned int *)t29) != 0)
        goto LAB19;

LAB18:    t30 = (t27 + 4);
    if (*((unsigned int *)t30) != 0)
        goto LAB19;

LAB22:    if (*((unsigned int *)t26) > *((unsigned int *)t27))
        goto LAB21;

LAB20:    *((unsigned int *)t28) = 1;

LAB21:    memset(t32, 0, 8);
    t33 = (t28 + 4);
    t34 = *((unsigned int *)t33);
    t35 = (~(t34));
    t36 = *((unsigned int *)t28);
    t37 = (t36 & t35);
    t38 = (t37 & 1U);
    if (t38 != 0)
        goto LAB23;

LAB24:    if (*((unsigned int *)t33) != 0)
        goto LAB25;

LAB26:    t41 = *((unsigned int *)t12);
    t42 = *((unsigned int *)t32);
    t43 = (t41 & t42);
    *((unsigned int *)t40) = t43;
    t44 = (t12 + 4);
    t45 = (t32 + 4);
    t46 = (t40 + 4);
    t47 = *((unsigned int *)t44);
    t48 = *((unsigned int *)t45);
    t49 = (t47 | t48);
    *((unsigned int *)t46) = t49;
    t50 = *((unsigned int *)t46);
    t51 = (t50 != 0);
    if (t51 == 1)
        goto LAB27;

LAB28:
LAB29:    goto LAB17;

LAB19:    t31 = (t28 + 4);
    *((unsigned int *)t28) = 1;
    *((unsigned int *)t31) = 1;
    goto LAB21;

LAB23:    *((unsigned int *)t32) = 1;
    goto LAB26;

LAB25:    t39 = (t32 + 4);
    *((unsigned int *)t32) = 1;
    *((unsigned int *)t39) = 1;
    goto LAB26;

LAB27:    t52 = *((unsigned int *)t40);
    t53 = *((unsigned int *)t46);
    *((unsigned int *)t40) = (t52 | t53);
    t54 = (t12 + 4);
    t55 = (t32 + 4);
    t56 = *((unsigned int *)t12);
    t57 = (~(t56));
    t58 = *((unsigned int *)t54);
    t59 = (~(t58));
    t60 = *((unsigned int *)t32);
    t61 = (~(t60));
    t62 = *((unsigned int *)t55);
    t63 = (~(t62));
    t64 = (t57 & t59);
    t65 = (t61 & t63);
    t66 = (~(t64));
    t67 = (~(t65));
    t68 = *((unsigned int *)t46);
    *((unsigned int *)t46) = (t68 & t66);
    t69 = *((unsigned int *)t46);
    *((unsigned int *)t46) = (t69 & t67);
    t70 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t70 & t66);
    t71 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t71 & t67);
    goto LAB29;

LAB30:    xsi_set_current_line(58, ng0);
    t78 = ((char*)((ng7)));
    t79 = (t0 + 1288);
    xsi_vlogvar_assign_value(t79, t78, 0, 0, 2);
    goto LAB32;

LAB34:    t9 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB36;

LAB35:    *((unsigned int *)t8) = 1;
    goto LAB36;

LAB38:    *((unsigned int *)t12) = 1;
    goto LAB41;

LAB40:    t11 = (t12 + 4);
    *((unsigned int *)t12) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB41;

LAB42:    t19 = (t0 + 1472);
    t20 = (t19 + 36U);
    t24 = *((char **)t20);
    t25 = ((char*)((ng20)));
    memset(t28, 0, 8);
    t26 = (t24 + 4);
    if (*((unsigned int *)t26) != 0)
        goto LAB46;

LAB45:    t27 = (t25 + 4);
    if (*((unsigned int *)t27) != 0)
        goto LAB46;

LAB49:    if (*((unsigned int *)t24) > *((unsigned int *)t25))
        goto LAB48;

LAB47:    *((unsigned int *)t28) = 1;

LAB48:    memset(t32, 0, 8);
    t30 = (t28 + 4);
    t34 = *((unsigned int *)t30);
    t35 = (~(t34));
    t36 = *((unsigned int *)t28);
    t37 = (t36 & t35);
    t38 = (t37 & 1U);
    if (t38 != 0)
        goto LAB50;

LAB51:    if (*((unsigned int *)t30) != 0)
        goto LAB52;

LAB53:    t41 = *((unsigned int *)t12);
    t42 = *((unsigned int *)t32);
    t43 = (t41 & t42);
    *((unsigned int *)t40) = t43;
    t33 = (t12 + 4);
    t39 = (t32 + 4);
    t44 = (t40 + 4);
    t47 = *((unsigned int *)t33);
    t48 = *((unsigned int *)t39);
    t49 = (t47 | t48);
    *((unsigned int *)t44) = t49;
    t50 = *((unsigned int *)t44);
    t51 = (t50 != 0);
    if (t51 == 1)
        goto LAB54;

LAB55:
LAB56:    goto LAB44;

LAB46:    t29 = (t28 + 4);
    *((unsigned int *)t28) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB48;

LAB50:    *((unsigned int *)t32) = 1;
    goto LAB53;

LAB52:    t31 = (t32 + 4);
    *((unsigned int *)t32) = 1;
    *((unsigned int *)t31) = 1;
    goto LAB53;

LAB54:    t52 = *((unsigned int *)t40);
    t53 = *((unsigned int *)t44);
    *((unsigned int *)t40) = (t52 | t53);
    t45 = (t12 + 4);
    t46 = (t32 + 4);
    t56 = *((unsigned int *)t12);
    t57 = (~(t56));
    t58 = *((unsigned int *)t45);
    t59 = (~(t58));
    t60 = *((unsigned int *)t32);
    t61 = (~(t60));
    t62 = *((unsigned int *)t46);
    t63 = (~(t62));
    t64 = (t57 & t59);
    t65 = (t61 & t63);
    t66 = (~(t64));
    t67 = (~(t65));
    t68 = *((unsigned int *)t44);
    *((unsigned int *)t44) = (t68 & t66);
    t69 = *((unsigned int *)t44);
    *((unsigned int *)t44) = (t69 & t67);
    t70 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t70 & t66);
    t71 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t71 & t67);
    goto LAB56;

LAB57:    xsi_set_current_line(59, ng0);
    t55 = ((char*)((ng6)));
    t72 = (t0 + 1288);
    xsi_vlogvar_assign_value(t72, t55, 0, 0, 2);
    goto LAB59;

LAB61:    t9 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB63;

LAB62:    *((unsigned int *)t8) = 1;
    goto LAB63;

LAB65:    *((unsigned int *)t12) = 1;
    goto LAB68;

LAB67:    t11 = (t12 + 4);
    *((unsigned int *)t12) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB68;

LAB69:    t19 = (t0 + 1472);
    t20 = (t19 + 36U);
    t24 = *((char **)t20);
    t25 = ((char*)((ng21)));
    memset(t28, 0, 8);
    t26 = (t24 + 4);
    if (*((unsigned int *)t26) != 0)
        goto LAB73;

LAB72:    t27 = (t25 + 4);
    if (*((unsigned int *)t27) != 0)
        goto LAB73;

LAB76:    if (*((unsigned int *)t24) > *((unsigned int *)t25))
        goto LAB75;

LAB74:    *((unsigned int *)t28) = 1;

LAB75:    memset(t32, 0, 8);
    t30 = (t28 + 4);
    t34 = *((unsigned int *)t30);
    t35 = (~(t34));
    t36 = *((unsigned int *)t28);
    t37 = (t36 & t35);
    t38 = (t37 & 1U);
    if (t38 != 0)
        goto LAB77;

LAB78:    if (*((unsigned int *)t30) != 0)
        goto LAB79;

LAB80:    t41 = *((unsigned int *)t12);
    t42 = *((unsigned int *)t32);
    t43 = (t41 & t42);
    *((unsigned int *)t40) = t43;
    t33 = (t12 + 4);
    t39 = (t32 + 4);
    t44 = (t40 + 4);
    t47 = *((unsigned int *)t33);
    t48 = *((unsigned int *)t39);
    t49 = (t47 | t48);
    *((unsigned int *)t44) = t49;
    t50 = *((unsigned int *)t44);
    t51 = (t50 != 0);
    if (t51 == 1)
        goto LAB81;

LAB82:
LAB83:    goto LAB71;

LAB73:    t29 = (t28 + 4);
    *((unsigned int *)t28) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB75;

LAB77:    *((unsigned int *)t32) = 1;
    goto LAB80;

LAB79:    t31 = (t32 + 4);
    *((unsigned int *)t32) = 1;
    *((unsigned int *)t31) = 1;
    goto LAB80;

LAB81:    t52 = *((unsigned int *)t40);
    t53 = *((unsigned int *)t44);
    *((unsigned int *)t40) = (t52 | t53);
    t45 = (t12 + 4);
    t46 = (t32 + 4);
    t56 = *((unsigned int *)t12);
    t57 = (~(t56));
    t58 = *((unsigned int *)t45);
    t59 = (~(t58));
    t60 = *((unsigned int *)t32);
    t61 = (~(t60));
    t62 = *((unsigned int *)t46);
    t63 = (~(t62));
    t64 = (t57 & t59);
    t65 = (t61 & t63);
    t66 = (~(t64));
    t67 = (~(t65));
    t68 = *((unsigned int *)t44);
    *((unsigned int *)t44) = (t68 & t66);
    t69 = *((unsigned int *)t44);
    *((unsigned int *)t44) = (t69 & t67);
    t70 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t70 & t66);
    t71 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t71 & t67);
    goto LAB83;

LAB84:    xsi_set_current_line(60, ng0);
    t55 = ((char*)((ng8)));
    t72 = (t0 + 1288);
    xsi_vlogvar_assign_value(t72, t55, 0, 0, 2);
    goto LAB86;

}


extern void work_m_00000000002056519323_3566486687_init()
{
	static char *pe[] = {(void *)Always_30_0,(void *)Always_36_1,(void *)Cont_43_2,(void *)Cont_45_3,(void *)Cont_48_4,(void *)Always_50_5,(void *)Always_57_6};
	xsi_register_didat("work_m_00000000002056519323_3566486687", "isim/VGA_TOP_isim_beh.exe.sim/work/m_00000000002056519323_3566486687.didat");
	xsi_register_executes(pe);
}
