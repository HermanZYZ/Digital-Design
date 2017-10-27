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

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000000158844068_1279674626_init();
    work_m_00000000002056519323_3566486687_init();
    work_m_00000000002137161048_1408181582_init();
    work_m_00000000001681536882_4042550952_init();
    work_m_00000000001592776212_0064338728_init();
    work_m_00000000002003285095_0373109384_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000002003285095_0373109384");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
