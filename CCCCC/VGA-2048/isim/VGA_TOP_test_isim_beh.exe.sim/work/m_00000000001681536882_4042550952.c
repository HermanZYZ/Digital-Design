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
static const char *ng0 = "D:/Xilinx/WorkSpace/CPU/1.9/VGA/dis_shake.v";
static int ng1[] = {0, 0};



static void Always_30_0(char *t0)
{
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

LAB0:    t1 = (t0 + 1812U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(30, ng0);
    t2 = (t0 + 2152);
    *((int *)t2) = 1;
    t3 = (t0 + 1840);
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

LAB7:    xsi_set_current_line(36, ng0);

LAB10:    xsi_set_current_line(37, ng0);
    t2 = (t0 + 784U);
    t3 = *((char **)t2);
    t2 = (t0 + 1104);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(38, ng0);
    t2 = (t0 + 1104);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = (t0 + 1196);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(39, ng0);
    t2 = (t0 + 1196);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = (t0 + 1288);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(31, ng0);

LAB9:    xsi_set_current_line(32, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 1104);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    xsi_set_current_line(33, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1196);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(34, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1288);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB8;

}

static void Cont_43_1(char *t0)
{
    char t6[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    int t30;
    int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    unsigned int t43;
    unsigned int t44;
    char *t45;
    unsigned int t46;
    unsigned int t47;
    char *t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;

LAB0:    t1 = (t0 + 1956U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(43, ng0);
    t2 = (t0 + 784U);
    t3 = *((char **)t2);
    t2 = (t0 + 1288);
    t4 = (t2 + 36U);
    t5 = *((char **)t4);
    t7 = *((unsigned int *)t3);
    t8 = *((unsigned int *)t5);
    t9 = (t7 & t8);
    *((unsigned int *)t6) = t9;
    t10 = (t3 + 4);
    t11 = (t5 + 4);
    t12 = (t6 + 4);
    t13 = *((unsigned int *)t10);
    t14 = *((unsigned int *)t11);
    t15 = (t13 | t14);
    *((unsigned int *)t12) = t15;
    t16 = *((unsigned int *)t12);
    t17 = (t16 != 0);
    if (t17 == 1)
        goto LAB4;

LAB5:
LAB6:    t38 = (t0 + 2204);
    t39 = (t38 + 32U);
    t40 = *((char **)t39);
    t41 = (t40 + 40U);
    t42 = *((char **)t41);
    memset(t42, 0, 8);
    t43 = 1U;
    t44 = t43;
    t45 = (t6 + 4);
    t46 = *((unsigned int *)t6);
    t43 = (t43 & t46);
    t47 = *((unsigned int *)t45);
    t44 = (t44 & t47);
    t48 = (t42 + 4);
    t49 = *((unsigned int *)t42);
    *((unsigned int *)t42) = (t49 | t43);
    t50 = *((unsigned int *)t48);
    *((unsigned int *)t48) = (t50 | t44);
    xsi_driver_vfirst_trans(t38, 0, 0);
    t51 = (t0 + 2160);
    *((int *)t51) = 1;

LAB1:    return;
LAB4:    t18 = *((unsigned int *)t6);
    t19 = *((unsigned int *)t12);
    *((unsigned int *)t6) = (t18 | t19);
    t20 = (t3 + 4);
    t21 = (t5 + 4);
    t22 = *((unsigned int *)t3);
    t23 = (~(t22));
    t24 = *((unsigned int *)t20);
    t25 = (~(t24));
    t26 = *((unsigned int *)t5);
    t27 = (~(t26));
    t28 = *((unsigned int *)t21);
    t29 = (~(t28));
    t30 = (t23 & t25);
    t31 = (t27 & t29);
    t32 = (~(t30));
    t33 = (~(t31));
    t34 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t34 & t32);
    t35 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t35 & t33);
    t36 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t36 & t32);
    t37 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t37 & t33);
    goto LAB6;

}


extern void work_m_00000000001681536882_4042550952_init()
{
	static char *pe[] = {(void *)Always_30_0,(void *)Cont_43_1};
	xsi_register_didat("work_m_00000000001681536882_4042550952", "isim/VGA_TOP_test_isim_beh.exe.sim/work/m_00000000001681536882_4042550952.didat");
	xsi_register_executes(pe);
}
