 /*************************************************************/
//消抖
module Debounce(
 input wire clk,
 input wire menu,//zhong
 input wire add,//shang 
 input wire pause,//xia
 input wire clr,//zuo
 input wire de,//you
 output reg [4:0] button
);
reg[15:0] cnt[4:0];//电容
always @ (*)
begin
  if(cnt[0] > 32767 )  button[0] <= 1;
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
begin
  if(menu && cnt[0] < 65535 )  cnt[0] <= cnt[0] + 1;
  else if(!menu && cnt[0] > 0) cnt[0] <= cnt[0] - 1;
      
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
endmodule

/********************************************************************/
//显示 
module  display(
input wire clk,
input wire [3:0] digit,
output reg [3:0] an,
output reg [6:0] a_to_g,
output wire dp
);

wire [3:0] aen;
wire [1:0] s;
reg [30:0] clkdiv;
assign aen = 4'b1111; // enable all digits
assign dp = an[2];   
assign s = clkdiv[19:18]; // count every 5.2 ms

// Digit select: ancode
always @ ( * )
begin
an = 4'b1111;
if (aen[s] == 1)
    an[s] = 0;
end
////  
// 时钟分频器
  always @ (posedge clk)
  begin
      if (clkdiv == 100_000_000)//frq==100_000_000
      begin
          clkdiv <= 0;
      end
      else
      begin
          clkdiv <= clkdiv + 1;
      end
  end
  
/////
always @ ( * )
begin
case (digit)
     0: a_to_g = 7'b0000001;
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

endmodule

/*******************************************************/
//模式选择

module changemode(
 input wire btn0,
 output reg [2:0] mode
);
always @ ( posedge btn0 )
begin
 mode <= mode + 1;
end
endmodule


/***************************************************/ 
////////////时钟的多个模式

module CLOCKZ(
input wire clk,
input wire [4:0]button ,
input wire [2:0] mode,
output wire alarm_LED,
output wire pause_LED,
output reg [3:0] digit,
output wire test
);

 wire [1:0] s;
 reg [30:0] clkdiv;
 reg clock[1:0];
 reg flash;//使shanshuo
 
 assign s = clkdiv[19:18]; // count every 5.2 ms   
 
//模式000 001  正常的计时  分秒、时分 
 reg [3:0] s_0,s_1,m_0,m_1,h_0,h_1;
 reg jinwei[2:0];//jinwei[0]-one second、jinwei[1]-one minute、jinwei[2]-one hour
 reg test_;//整点报时，闪烁五秒
 
 assign test=test_;
 
//模式010 011  调分调时 
  wire m_plus,h_plus;//时钟敏感上升沿 
  
  assign m_plus = jinwei[1] | ( clock[0] & button[1] );//调分模式下并且按钮按下
 assign h_plus = jinwei[2] | ( clock[1] & button[1] );//调时模式下并且按钮按下 
 

//模式100 闹钟
 reg [3:0] alarm_h1,alarm_h0,alarm_m1,alarm_m0;//分别是时-时，分-分,输出时alarm_LED
 reg alarm_led;//时间到了，U19就亮一分钟
 wire alarm_signal; 
 
 
 assign alarm_LED = alarm_led;    
 assign alarm_signal = button[2];
 
 
//模式101 110  闹钟分，时设定
   reg alarm_;//处于模式5、6的时候输出的信号

//模式111  秒表
reg [3:0] watch_s1,watch_s0,watch_m1,watch_m0;//秒表的时分各位
wire watch_splus,watch_mplus_;//上升沿作为敏感条件
reg pause_;
reg one_min;//one-minute:时间到了一分钟，pause：是否暂停 

assign watch_splus = ( jinwei[0] | button[3] | button[4] );
assign watch_mplus_ = ( one_min | button[3] | button[4] );
assign pause_LED = pause_;

/******************************************************************************/ 


//分频器
always @ (posedge clk)
begin
 if (clkdiv == 100_000_000)//1s
 begin
     clkdiv <= 0;
     jinwei[0] <= 1;
 end
 else if(clkdiv == 50_000_000)//0.5s flash 闪烁 
 begin
     flash <= flash + 1;
     clkdiv <= clkdiv + 1;
     jinwei[0] <= 0;
 end
 else
 begin
     clkdiv <= clkdiv + 1;
     jinwei[0] <= 0;
 end
end 

///初始化  
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
  jinwei[0] <= 0;
  jinwei[0] <= 0;
  alarm_m0 <= 0;
  alarm_m1 <= 0;
  alarm_h0 <= 0;
  alarm_h1 <= 0;
  pause_ <= 1;
end
 
//助调时调分，避免冲突    
always @ ( * )
begin
case(mode)
   2: begin clock[0] <= 1; clock[1] <= 0; alarm_ <= 0; end
   3: begin clock[0] <= 0; clock[1] <= 1; alarm_ <= 0; end
   5: begin clock[0] <= 0; clock[1] <= 0; alarm_ <= 1; end
   6: begin clock[0] <= 0; clock[1] <= 0; alarm_ <= 1; end
default:
   begin
       clock[0] <= 0;
       clock[1] <= 0;
       alarm_ <= 0;
   end
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
//*************************************************************** 
always @ ( * )
begin
  case(mode)
  0:begin//minute:second
     case (s)
        0: digit= s_0;
        1: digit= s_1;
        2: digit = m_0;
        3: digit= m_1;
         default:  digit = s_0;
     endcase
    end
    
  1:begin//hour:minute
     case (s)
        0: digit= m_0;
        1: digit= m_1;
        2: digit= h_0;
        3: digit= h_1;
        default:  digit = m_0;
     endcase
     end
     
   2:begin//change minute
     case(s)
       0:begin
         if(flash == 1) 
          begin
             digit = m_0;//0.5秒shanshuo
          end
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
             
  3:begin//changing hour
    case(s)
       0: digit = m_0;
       1: digit = m_1;
       2:begin
          if(flash == 1) digit = h_0;
          else digit = 10;
         end
       3:begin
          if(flash == 1)  digit = h_1;
          else digit = 10;
         end 
      default: digit = 0;
    endcase
    end
            
  4:begin//setting alarm
    case(s)
      0:digit = alarm_m0;
      1:digit = alarm_m1;
      2:digit = alarm_h0;
      3:digit = alarm_h1;
    default:digit = 0;
    endcase
    end
            
  5:begin//setting alarm minute
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
           
  6:begin//setting alarm hour
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
     
   7:begin//counting
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


/***************************************************************************/ 
//seconds 进位
 always @ ( posedge jinwei[0] )
 begin 
    if(s_0 == 9)
    begin
        s_0 <= 0;
        if(s_1 == 5 )
        begin
             s_1 <= 0;
             jinwei[1] <= 1;
        end
        else
        begin
             s_1 <= s_1 + 1;
             jinwei[1] <= 0;
        end
    end
    else  
    begin
    s_0 <= s_0 + 1; 
    jinwei[1] <= 0;
    end
   end
     
//minutes  进位
 always @ ( posedge m_plus )//(posedge one[1] , posedge button[1])分钟进不了位
 begin
//        if( one[1] == 1 && button[1] == 0 )//这一个判断是有毒的
//        begin
        if(m_0 == 9)
        begin
            m_0 <= 0;
            if(m_1 == 5) //
            begin
            m_1 <= 0;
            if( mode != 2 )  jinwei[2] <= 1;//调分模式下不进位
            else jinwei[2] <= 0;
            end
            else 
            begin
            m_1 <= m_1 + 1;
            jinwei[2] <= 0;
            end
         end
         else  m_0 <= m_0 + 1;                         
 end

//hours  进位
 always @ ( posedge h_plus )
 begin  
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
begin
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
       if( jinwei[2] && s_0 < 5 && s_1 < 1 )
           test_ <= 1;
       else 
           test_ <= 0;
end          

/******************************************/    
//停止        
always @ ( posedge button[4] )
     begin
        if( mode == 7)  pause_ <= pause_ + 1;
        else pause_ <= pause_;
     end
/********************************************/

//秒表的second          
always @ ( posedge watch_splus )
begin
  if( button[3] == 1)
  begin
     watch_s1 <= 0;
     watch_s0 <= 0;
  end
  else if( pause_ == 1 )
  begin 
     watch_s1 <= watch_s1;
     watch_s0 <= watch_s0;
  end
  else if ( button[3] == 0 && button[4] == 0 && pause_ == 0)
  begin
     if( watch_s0 == 9)
     begin
         watch_s0 <= 0;
         if( watch_s1 == 5 )
         begin
              one_min <= 1;
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
  
/************************************************************/
//秒表的分钟         
always @ ( posedge watch_mplus_)
begin
  if( button[3] == 1)
  begin
     watch_m1 <= 0;
     watch_m0 <= 0;
  end
  else if( pause_ == 1 )
  begin 
     watch_m1 <= watch_m1;
     watch_m0 <= watch_m0;
  end   
  else if ( one_min == 1 && button[3] == 0 && button[4] == 0 )
  begin
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


/********************************************************/

//顶层
module CLOCK(
 input wire clk,
 input wire menu,//U18
 input wire de,//U17 alarm
 input wire add,//T18
 input wire clr,//W19
 input wire pause,//T17
 output wire [6:0] a_to_g,
 output wire [3:0] an,
 output wire [2:0] mode_,//L1,P1,N3显示当前状态
 output wire dp,
 output wire test,//整点报时，U16
 output wire pause_LED,//秒表暂停就亮，U3
 output wire alarm_LED 
);//U9，时间到了，闪烁一分钟

 wire [4:0] button;//0-menu,1-add,2-de,3-clr,4-start/pause
 wire [3:0] digit;
 
 Debounce U1(
             .clk(clk),
             .menu(menu),
             .add(add),
             .pause(pause),
             .clr(clr),
             .de(de),
             .button(button)
);//xiaodou

changemode U4(
         .btn0(button[0]),
         .mode(mode_)
);

CLOCKZ  U2(
         .clk(clk),
         .button(button),
         .mode(mode_),
         .alarm_LED(alarm_LED),
         .pause_LED(pause_LED),
         .digit(digit),
         .test(test)
 );//gezhong moshi 
 display U3(
         .clk(clk),
         .an(an),
         .digit(digit),
         .a_to_g(a_to_g),
         .dp(dp)
 );      
            
endmodule 