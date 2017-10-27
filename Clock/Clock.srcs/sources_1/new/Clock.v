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
    parameter frq = 100000000,//����ʱ��Ƶ����100MHz = 100000000 Hz��1��
    parameter half = 50000000//0.5�룬����������˸
)
(   input wire clk,//W5
    input wire menu,//U18���˵���
    input wire de,//U17 ������ʱ��
    input wire add,//T18����ʱ��ʱ��
    input wire clr,//W19���������
    input wire pause,//T17�������ͣ������
    output reg [6:0] a_to_g,//�߶ιܽӿ�
    output reg [3:0] an,//�����ʹ�ܶ�
    output reg [2:0] mode_,//L1,P1,N3��ʾ��ǰ״̬
    output wire dp,//С����
    output wire test,//���㱨ʱ��U16
    output wire pause_LED,//�����ͣ������U3����ʼΪ�ߵ�ƽ
    output wire alarm_LED );//U9��ʱ�䵽�ˣ���˸һ����
   
    wire [1:0] s;//��ѡһ��ѡͨ�����
    reg [3:0] digit;//�������ʾ����
    reg flash;//ÿ��0.5��ĸߵ�ƽ
    wire [3:0] aen;
    reg [30:0] clkdiv;//��Ƶ
    reg [3:0] s_0,s_1,m_0,m_1,h_0,h_1;//����ʱ�����ʱ�ĸ�λ��ʮλ��
    assign s = clkdiv[19:18]; // count every 5.2 ms
    assign aen = 4'b1111; // enable all digits
    assign dp = an[2]; //����Ϊ�ڶ�����С������   
    //button
    reg[15:0] cnt[4:0];//����
    reg [2:0] mode;//ʱ��ģʽ
    reg button[4:0];//0-menu,1-add,2-de,3-clr,4-start/pause
    //clock
    reg one[2:0];//count for time:one[0]-one second��one[1]-one minute��one[2]-one hour
    reg test_;//���������������㱨ʱ����˸����
    reg clock[1:0];//������¼�ǵ�ʱ���ǵ���
    wire m_plus,h_plus;//��������Ϊ��������
    assign test = test_;//��ʵǰ�������������Ϊ��������鿴����������������㱨ʱ
    assign m_plus = one[1] | ( clock[0] & button[1] );//���沿���Ǵ��ڵ���ģʽ�²��Ұ�ť���£�������û�к��沿�֣�������
    assign h_plus = one[2] | ( clock[1] & button[1] );//ͬ��   
    //alarm clock   
    reg [3:0] alarm_h1,alarm_h0,alarm_m1,alarm_m0;//�ֱ���ʱ-ʱ����-��,���ʱalarm_LED
    reg alarm_;//����ģʽ5��6��ʱ��������ź�
    wire alarm_signal;//��ʵ���Ҳûʲô��Ҫ
    reg alarm_led;//ʱ�䵽�ˣ�U19����һ����
    assign alarm_LED = alarm_led;//������ʾled
    assign alarm_signal = button[2];//������ʱ��İ�ť
    //���
    reg [3:0] watch_s1,watch_s0,watch_m1,watch_m0;//����ʱ�ָ�λ
    wire watch_plus,watch_plus_;//��������Ϊ��������
    reg one_min,pause_ ;//one-minute:ʱ�䵽��һ���ӣ�pause���Ƿ���ͣ
    assign watch_plus = ( one[0] | button[3] | button[4] );//�������������ֱ�Ϊһ���źţ����㣬��ͣ
    assign watch_plus_ = ( one_min | button[3] | button[4] );//�������������ֱ�Ϊһ�����źţ����㣬��ͣ
    assign pause_LED = pause_;//��ͣ/����״̬��ʾ

    
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
    
    // 7������ܣ�hex7seg
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
    
    // ʱ�ӷ�Ƶ��
    always @ (posedge clk)
    begin
        if (clkdiv == frq)//ʱ�������ش����ﵽ10000000�Σ�ʱ�䵽��һ��
        begin
            clkdiv <= 0;//���üĴ���
            one[0] <= 1;//��������һ����źŵ�ƽ
        end
        else if(clkdiv == half)//ʱ�������ش����ﵽ5000000�Σ�ʱ�����0.5��
        begin
            flash <= flash + 1;//������
            clkdiv <= clkdiv + 1;//������¼
            one[0] <= 0;//����һ����źŵ�ƽ
        end
        else//ʱ��δ��
        begin
            clkdiv <= clkdiv + 1;
            one[0] <= 0;//����һ����źŵ�ƽ
        end
    end
    
        // Digit select: ancode
    always @ ( * )
    begin
    an = 4'b1111;
    if (aen[s] == 1)
        an[s] = 0;
    end
    
        // 4λ 4ѡ1 MUX: mux44
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
              if(flash == 1) digit = m_0;//0.5����˸
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
 modeģʽ��
 000 - ����
 001 - ʱ��
 010 - ����
 011 - ��ʱ
 100 - ����ʱ��
 101 - ���ӷ��趨
 110 - ����ʱ�趨
 111 - ���
 */
 //*************************************************************************************

 //���� 
 always @ (*)
 begin
     if(cnt[0] > 32767 )  button[0] <= 1;//32767��ģ��ģ��ĵ��ݵ�ƽ������������ɸ��İ�ť��������
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
 begin//����ģ�⣺��ť�����ҵ��ݻ�û�����磬���ݳ��
     if(menu && cnt[0] < 65535 )  cnt[0] <= cnt[0] + 1;
     else if(!menu && cnt[0] > 0) cnt[0] <= cnt[0] - 1;
     //��ť�ɿ��ҵ����е磬��ŵ�    
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
 always @ ( posedge button[0] )//�л�ģʽ
 begin
     mode <= mode + 1;
 end
 
 always @ ( * )
 begin
    mode_ <= mode;
 end
 
   always @ ( * )//��������������ʱ���֣������ͻ
     begin
     case(mode)
     2: begin clock[0] <= 1; clock[1] <= 0; alarm_ <= 0; end//clock[0]��¼��ǰ�ڵ���
     3: begin clock[0] <= 0; clock[1] <= 1; alarm_ <= 0; end//clock[1]��¼��ǰ�ڵ�ʱ
     5: begin clock[0] <= 0; clock[1] <= 0; alarm_ <= 1; end//alarm_��¼��ǰ�ڵ�����
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
    always @ ( posedge one[0] )//һ������嵽��
    begin 
       if(s_0 == 9)//��λ�ж�
       begin
           s_0 <= 0;
           if(s_1 == 5 )
           begin
                s_1 <= 0;
                one[1] <= 1;//����һ���ӵ��źŵ�ƽ
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
    always @ ( posedge m_plus )//(posedge one[1] , posedge button[1])���ӽ�����λ
    begin
//        if( one[1] == 1 && button[1] == 0 )//��һ���ж����ж���
//        begin
           if(m_0 == 9)//��λ�ж�
           begin
               m_0 <= 0;
               if(m_1 == 5) //
               begin
               m_1 <= 0;
               if( mode != 2 )  one[2] <= 1;//����һСʱ���źŵ�ƽ
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
     
//    else if( one[2] == 1 && button[1] == 0 ) //������һ���жϣ��綾
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
   
   //����
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
        else if ( mode == 6 )//��ʵ������ʱ�������򻯣����ø��ˣ�����Ҳ�³�ʲô�۶���
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
   begin//������ʱ��͵�ǰʱ��һ������������ʾled�ĵ�ƽ��ʹ����
       if( alarm_m0 == m_0 && alarm_m1 == m_1 && alarm_h0 == h_0 && alarm_h1 == h_1 )
       begin
          alarm_led <= 1;
       end
       else alarm_led <= 0;
       
       if( !flash ) alarm_led <= 0;
   end
 
//*************************************************************************************** 
//���㱨ʱ
   
   always @ ( posedge clk )
   begin 
          if( one[2] && s_0 < 5 && s_1 < 1 )
              test_ <= 1;
          else 
              test_ <= 0;
   end  
//**************************************************************************
//���
  
//  always @ ( posedge clk)
//  begin
//          before_ones <= one[0];
//          after_ones <= before_ones;
          
//          before_onem <= one_min;
//          after_onem <= before_onem;
//  end
  
  always @ ( posedge button[4] )
  begin//��ͣ/���������£��л�����/��ͣ
     if( mode == 7)  pause_ <= pause_ + 1;
     else pause_ <= pause_;//������ͣ/����״̬�ļĴ���
  end
  
  always @ ( posedge watch_plus )
  begin //������
       if( button[3] == 1)//����
       begin
          watch_s1 <= 0;
          watch_s0 <= 0;
       end
       else if( pause_ == 1 )//��ͣ
       begin 
          watch_s1 <= watch_s1;
          watch_s0 <= watch_s0;
       end
       else if ( button[3] == 0 && button[4] == 0 && pause_ == 0)
       begin      //��ʱ
          if( watch_s0 == 9)
          begin
              watch_s0 <= 0;
              if( watch_s1 == 5 )
              begin
                   one_min <= 1;//һ�����ź�
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
  begin  //���ķ�
       if( button[3] == 1)//����
       begin
          watch_m1 <= 0;
          watch_m0 <= 0;
       end
       else if( pause_ == 1 )//��ͣ
       begin 
          watch_m1 <= watch_m1;
          watch_m0 <= watch_m0;
       end   
       else if ( one_min == 1 && button[3] == 0 && button[4] == 0 )
       begin  //��ʱ
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
