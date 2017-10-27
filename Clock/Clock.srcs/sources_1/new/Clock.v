//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/12/13 20:29:46
// Design Name: 
// Module Name: CLOCK
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CLOCK#(
    parameter frq = 100000000,//板子时钟频率是100MHz = 100000000 Hz，1秒
    parameter half = 50000000//0.5秒，用来控制闪烁
)
(   input wire clk,//W5
    input wire menu,//U18，菜单键
    input wire de,//U17 调闹钟时间
    input wire add,//T18，调时钟时间
    input wire clr,//W19，秒表清零
    input wire pause,//T17，秒表暂停和启动
    output reg [6:0] a_to_g,//七段管接口
    output reg [3:0] an,//数码管使能端
    output reg [2:0] mode_,//L1,P1,N3显示当前状态
    output wire dp,//小数点
    output wire test,//整点报时，U16
    output wire pause_LED,//秒表暂停就亮，U3，初始为高电平
    output wire alarm_LED );//U9，时间到了，闪烁一分钟
   
    wire [1:0] s;//四选一，选通数码管
    reg [3:0] digit;//数码管显示内容
    reg flash;//每隔0.5秒的高电平
    wire [3:0] aen;
    reg [30:0] clkdiv;//分频
    reg [3:0] s_0,s_1,m_0,m_1,h_0,h_1;//保存时钟秒分时的各位和十位，
    assign s = clkdiv[19:18]; // count every 5.2 ms
    assign aen = 4'b1111; // enable all digits
    assign dp = an[2]; //限制为第二个的小数点亮   
    //button
    reg[15:0] cnt[4:0];//电容
    reg [2:0] mode;//时钟模式
    reg button[4:0];//0-menu,1-add,2-de,3-clr,4-start/pause
    //clock
    reg one[2:0];//count for time:one[0]-one second、one[1]-one minute、one[2]-one hour
    reg test_;//这里后来变成了整点报时，闪烁五秒
    reg clock[1:0];//用来记录是调时还是调分
    wire m_plus,h_plus;//上升沿作为敏感条件
    assign test = test_;//其实前期设计这里是作为调试输出查看，后来用来输出整点报时
    assign m_plus = one[1] | ( clock[0] & button[1] );//后面部分是处于调分模式下并且按钮按下！！！！没有后面部分，会死人
    assign h_plus = one[2] | ( clock[1] & button[1] );//同上   
    //alarm clock   
    reg [3:0] alarm_h1,alarm_h0,alarm_m1,alarm_m0;//分别是时-时，分-分,输出时alarm_LED
    reg alarm_;//处于模式5、6的时候输出的信号
    wire alarm_signal;//其实这个也没什么必要
    reg alarm_led;//时间到了，U19就亮一分钟
    assign alarm_LED = alarm_led;//闹钟提示led
    assign alarm_signal = button[2];//调闹钟时间的按钮
    //秒表
    reg [3:0] watch_s1,watch_s0,watch_m1,watch_m0;//秒表的时分各位
    wire watch_plus,watch_plus_;//上升沿作为敏感条件
    reg one_min,pause_ ;//one-minute:时间到了一分钟，pause：是否暂停
    assign watch_plus = ( one[0] | button[3] | button[4] );//多敏感条件，分别为一秒信号，清零，暂停
    assign watch_plus_ = ( one_min | button[3] | button[4] );//多敏感条件，分别为一分钟信号，清零，暂停
    assign pause_LED = pause_;//暂停/启动状态显示

    
    initial
    begin
        s_0 <= 0;
        s_1 <= 0;
        m_0 <= 0;
        m_1 <= 0;
        h_0 <= 0;
        h_1 <= 0;
        clock[0] <= 0;
        clock[1] <= 0;
        one[0] <= 0;
        one[0] <= 0;
        alarm_m0 <= 0;
        alarm_m1 <= 0;
        alarm_h0 <= 0;
        alarm_h1 <= 0;
        pause_ <= 1;
    end
    
    // 7段数码管：hex7seg
    always @ ( * )
    begin
    case (digit)
    0: a_to_g = 7'b0000001;//all off
    1: a_to_g = 7'b1001111;
    2: a_to_g = 7'b0010010;
    3: a_to_g = 7'b0000110;
    4: a_to_g = 7'b1001100;
    5: a_to_g = 7'b0100100;
    6: a_to_g = 7'b0100000;
    7: a_to_g = 7'b0001111;
    8: a_to_g = 7'b0000000;
    9: a_to_g = 7'b0000100;
    
    default: a_to_g = 7'b1111111; // all off
    endcase
    end
    
    // 时钟分频器
    always @ (posedge clk)
    begin
        if (clkdiv == frq)//时钟上升沿次数达到10000000次，时间到了一秒
        begin
            clkdiv <= 0;//重置寄存器
            one[0] <= 1;//对外拉高一秒的信号电平
        end
        else if(clkdiv == half)//时钟上升沿次数达到5000000次，时间过了0.5秒
        begin
            flash <= flash + 1;//亮灭交替
            clkdiv <= clkdiv + 1;//继续记录
            one[0] <= 0;//拉低一秒的信号电平
        end
        else//时间未到
        begin
            clkdiv <= clkdiv + 1;
            one[0] <= 0;//拉低一秒的信号电平
        end
    end
    
        // Digit select: ancode
    always @ ( * )
    begin
    an = 4'b1111;
    if (aen[s] == 1)
        an[s] = 0;
    end
    
        // 4位 4选1 MUX: mux44
     always @ ( * )
     begin
     case(mode)
     
     0:begin
        case (s)
           0: digit = s_0;
           1: digit = s_1;
           2: digit = m_0;
           3: digit = m_1;
            default:  digit = s_0;
        endcase
       end
       
     1:begin
        case (s)
           0: digit = m_0;
           1: digit = m_1;
           2: digit = h_0;
           3: digit = h_1;
           default:  digit = m_0;
        endcase
        end
        
      2:begin
         case(s)
           0:begin
              if(flash == 1) digit = m_0;//0.5秒闪烁
              else digit = 10;
             end
           1:begin
              if(flash == 1) digit = m_1;
              else digit = 10;
             end
           2: digit = h_0;
           3: digit = h_1;
           default:  digit = m_0;
         endcase
         end
         
      3:begin
        case(s)
          3:begin
             if(flash == 1)  digit = h_1;
             else digit = 10;
            end
          2:begin
             if(flash == 1) digit = h_0;
             else digit = 10;
            end
          1: digit = m_1;
          0: digit = m_0;
          default: digit = 0;
        endcase
        end
        
      4:begin
        case(s)
          0:digit = alarm_m0;
          1:digit = alarm_m1;
          2:digit = alarm_h0;
          3:digit = alarm_h1;
        default:digit = 0;
        endcase
        end
        
      5:begin
        case(s)
        0:begin
            if(flash == 1) digit = alarm_m0;
            else digit = 10;
        end
        1:begin
            if(flash == 1) digit = alarm_m1;
            else digit = 10;
        end
        2:digit = alarm_h0;
        3:digit = alarm_h1;
        default:digit = 0;
        endcase
        end
       
      6:begin
        case(s)
        0: digit = alarm_m0;
        1: digit = alarm_m1;
        2: begin
           if( flash == 1) digit = alarm_h0;
           else digit = 10;
           end  
        3:begin
            if( flash == 1) digit = alarm_h1;
            else digit = 10;
          end 
         endcase 
         end
         
       7:begin
          case(s)
          0:digit = watch_s0;
          1:digit = watch_s1;
          2:digit = watch_m0;
          3:digit = watch_m1;
          endcase
       end                                  
        
    default:  digit = 0;
    endcase
    end
 
 //**********************************************************************************
        /*
 mode模式：
 000 - 分秒
 001 - 时分
 010 - 调分
 011 - 调时
 100 - 闹钟时间
 101 - 闹钟分设定
 110 - 闹钟时设定
 111 - 秒表
 */
 //*************************************************************************************

 //消抖 
 always @ (*)
 begin
     if(cnt[0] > 32767 )  button[0] <= 1;//32767是模拟模拟的电容电平，更改这个数可更改按钮的灵敏度
     else  button[0] <= 0;
         
     if(cnt[1] > 32767 )  button[1] <= 1;
     else  button[1] <= 0;
                       
     if(cnt[2] > 32767 )   button[2] <= 1;
     else  button[2] <= 0;
            
     if(cnt[3] > 32767 )  button[3] <= 1;
     else  button[3] <= 0;
     
     if(cnt[4] > 32767 )  button[4] <= 1;
     else  button[4] <= 0;           
 end
 
 always @ ( posedge clk )
 begin//电容模拟：按钮按下且电容还没充满电，电容充电
     if(menu && cnt[0] < 65535 )  cnt[0] <= cnt[0] + 1;
     else if(!menu && cnt[0] > 0) cnt[0] <= cnt[0] - 1;
     //按钮松开且电容有电，则放电    
     if(add && cnt[1] < 65535 )  cnt[1] <= cnt[1] + 1;
     else if(!add && cnt[1] > 0) cnt[1] <= cnt[1] - 1;
                     
     if(de && cnt[2] < 65535 )   cnt[2] <= cnt[2] + 1;
     else if(!de && cnt[2] > 0)  cnt[2] <= cnt[2] - 1;   
                  
     if(clr && cnt[3] < 65535 )  cnt[3] <= cnt[3] + 1;
     else if(!clr && cnt[3] > 0) cnt[3] <= cnt[3] - 1; 
     
     if(pause && cnt[4] < 65535 )  cnt[4] <= cnt[4] + 1;
     else if(!pause && cnt[4] > 0) cnt[4] <= cnt[4] - 1;           
 end
 //********************************************************************************************
 //change menu
 always @ ( posedge button[0] )//切换模式
 begin
     mode <= mode + 1;
 end
 
 always @ ( * )
 begin
    mode_ <= mode;
 end
 
   always @ ( * )//！！！！辅助调时调分，避免冲突
     begin
     case(mode)
     2: begin clock[0] <= 1; clock[1] <= 0; alarm_ <= 0; end//clock[0]记录当前在调分
     3: begin clock[0] <= 0; clock[1] <= 1; alarm_ <= 0; end//clock[1]记录当前在调时
     5: begin clock[0] <= 0; clock[1] <= 0; alarm_ <= 1; end//alarm_记录当前在调闹钟
     6: begin clock[0] <= 0; clock[1] <= 0; alarm_ <= 1; end
     default:begin
         clock[0] <= 0;
         clock[1] <= 0;
         alarm_ <= 0;
     end
     endcase
     //   if(mode == 5) alarm_ <= 1;
     //   else if(mode == 6) alarm_ <= 1;
     //   else alarm_ <= 0;
     end 
 
 //*********************************************************************************************
 
//seconds
    always @ ( posedge one[0] )//一秒的脉冲到来
    begin 
       if(s_0 == 9)//进位判断
       begin
           s_0 <= 0;
           if(s_1 == 5 )
           begin
                s_1 <= 0;
                one[1] <= 1;//拉高一分钟的信号电平
           end
           else
           begin
                s_1 <= s_1 + 1;
                one[1] <= 0;
           end
       end
       else  
       begin
       s_0 <= s_0 + 1; 
       one[1] <= 0;
       end
      end
        
 //minutes
    always @ ( posedge m_plus )//(posedge one[1] , posedge button[1])分钟进不了位
    begin
//        if( one[1] == 1 && button[1] == 0 )//这一个判断是有毒的
//        begin
           if(m_0 == 9)//进位判断
           begin
               m_0 <= 0;
               if(m_1 == 5) //
               begin
               m_1 <= 0;
               if( mode != 2 )  one[2] <= 1;//拉高一小时的信号电平
               else one[2] <= 0;
               end
               else 
               begin
               m_1 <= m_1 + 1;
               one[2] <= 0;
               end
            end
            else  m_0 <= m_0 + 1;            
        end
//        else if( mode == 2 )
//        begin
//           if(m_0 == 9)
//           begin
//               m_0 <= 0;
//               if(m_1 == 5)   m_1 <= 0;
//               else  m_1 <= m_1 + 1;
//            end
//            else  m_0 <= m_0 + 1;
//        end
                
//    end

//hours
    always @ ( posedge h_plus )
    begin  
//    if ( mode == 3 )//
//    begin
//       if( h_0 == 3 )
//       begin
//           if(h_1 == 2)
//           begin
//               h_0 <= 0;
//               h_1 <= 0;
//            end
//            else  h_0 <= h_0 + 1;
//       end
//       else if(h_0 == 9)
//       begin
//           h_0 <= 0;
//           h_1 <= h_1 + 1;
//       end
//       else h_0 <= h_0 + 1;        
//    end
     
//    else if( one[2] == 1 && button[1] == 0 ) //加了这一个判断，剧毒
//    begin
        if(h_0 == 3)
        begin
            if(h_1 == 2)
            begin
                h_0 <= 0;
                h_1 <= 0;
             end
             else h_0 <= h_0 + 1;
        end
        else if(h_0 == 9)
        begin
            h_0 <= 0;
            h_1 <= h_1 + 1;
        end
        else
            h_0 <= h_0 + 1;
//    end
 
   end
   
   //闹钟
   //**************************************************************************************
   //alarm settings
   
   always @ ( posedge alarm_signal )
   begin
        if( mode == 5 )
        begin
              if( alarm_m0 == 9 )
              begin
                    alarm_m0 <= 0;
                    if( alarm_m1 == 5) alarm_m1 <= 0;
                    else alarm_m1 <= alarm_m1 + 1;
              end
              else alarm_m0 <= alarm_m0 + 1;
        end
        else if ( mode == 6 )//其实可以像时钟那样简化，懒得改了，改了也怕出什么幺蛾子
        begin
              if( alarm_h0 == 3)
              begin
                    if(alarm_h1 == 2)
                    begin
                         alarm_h0 <= 0;
                         alarm_h1 <= 0;
                    end
                    else alarm_h0 <= alarm_h0 + 1;
              end 
              else if(alarm_h0 == 9)
              begin
                    alarm_h0 <= 0;
                    alarm_h1 <= alarm_h1 + 1;
              end
              else  alarm_h0 <= alarm_h0 + 1;
        end
   end
//************************************************************************************
   //time of alarm judge
   always  @ ( * )
   begin//当闹钟时间和当前时间一样，则拉高提示led的电平，使其亮
       if( alarm_m0 == m_0 && alarm_m1 == m_1 && alarm_h0 == h_0 && alarm_h1 == h_1 )
       begin
          alarm_led <= 1;
       end
       else alarm_led <= 0;
       
       if( !flash ) alarm_led <= 0;
   end
 
//*************************************************************************************** 
//整点报时
   
   always @ ( posedge clk )
   begin 
          if( one[2] && s_0 < 5 && s_1 < 1 )
              test_ <= 1;
          else 
              test_ <= 0;
   end  
//**************************************************************************
//秒表
  
//  always @ ( posedge clk)
//  begin
//          before_ones <= one[0];
//          after_ones <= before_ones;
          
//          before_onem <= one_min;
//          after_onem <= before_onem;
//  end
  
  always @ ( posedge button[4] )
  begin//暂停/启动键按下，切换启动/暂停
     if( mode == 7)  pause_ <= pause_ + 1;
     else pause_ <= pause_;//保存暂停/启动状态的寄存器
  end
  
  always @ ( posedge watch_plus )
  begin //秒表的秒
       if( button[3] == 1)//清零
       begin
          watch_s1 <= 0;
          watch_s0 <= 0;
       end
       else if( pause_ == 1 )//暂停
       begin 
          watch_s1 <= watch_s1;
          watch_s0 <= watch_s0;
       end
       else if ( button[3] == 0 && button[4] == 0 && pause_ == 0)
       begin      //计时
          if( watch_s0 == 9)
          begin
              watch_s0 <= 0;
              if( watch_s1 == 5 )
              begin
                   one_min <= 1;//一分钟信号
                   watch_s1 <= 0; 
              end
              else 
              begin
              watch_s1 <= watch_s1 + 1;
              one_min <= 0;
              end
          end
          else 
          begin
          watch_s0 <= watch_s0 + 1;
          one_min <= 0;
          end
       end
  end
  
  always @ ( posedge watch_plus_)
  begin  //秒表的分
       if( button[3] == 1)//清零
       begin
          watch_m1 <= 0;
          watch_m0 <= 0;
       end
       else if( pause_ == 1 )//暂停
       begin 
          watch_m1 <= watch_m1;
          watch_m0 <= watch_m0;
       end   
       else if ( one_min == 1 && button[3] == 0 && button[4] == 0 )
       begin  //计时
          if( watch_m0 == 9)
          begin
              watch_m0 <= 0;
              if( watch_m1 == 5 )  watch_m1 <= 0; 
              else watch_m1 <= watch_m1 + 1;
          end
          else watch_m0 <= watch_m0 + 1;
       end      
  end
       
endmodule
