//Module: IMCMemoryUnit defined externally
//Module: IMCMemPort defined externally


module cgrame_configcell_context_II_3_1_size1 #(parameter contexts=1, parameter size=1) (
  ConfigIn,
  ConfigOut,
  Config_Clock,
  Config_Reset,
  CGRA_Clock,
  CGRA_Reset,
  CGRA_Enable,
  Context,
  select
);
    input CGRA_Clock;
    input CGRA_Reset;
    input CGRA_Enable;
    input ConfigIn;
    input Config_Clock;
    input Config_Reset;
    input [$clog2(contexts)-1:0] Context;
    output ConfigOut;
    output [size-1:0] select;
    reg [size-1:0] config_reg [contexts-1:0];

    reg [contexts-1:0] context_counter = {size{1'b0}};

    integer i;

    always @(posedge Config_Clock, posedge Config_Reset)
        if (Config_Reset) begin
            for (i = 0; i < contexts; i = i+1) begin
                config_reg[i] <= 'd0;
            end
        end
        else begin
            for (i = 0; i < contexts; i = i+1) begin
                if(i == 0) begin
                    config_reg[i] <= ConfigIn;
                end
                else begin
                    config_reg[i] <= config_reg[i-1];
                end
            end
        end

    assign select = config_reg[Context];
    assign ConfigOut = config_reg[contexts-1][0];

endmodule //cgrame_configcell_context_II_3_1_size1

module cgrame_op_shl_32b #(parameter contexts=1, parameter size=1) (
  a,
  b,
  c
);
    input [size-1:0] a;
    input [size-1:0] b;
    output [size-1:0] c;
    assign c = a << b;


endmodule //cgrame_op_shl_32b

module cgrame_op_lshr_32b #(parameter contexts=1, parameter size=1) (
  a,
  b,
  c
);
    input [size-1:0] a;
    input [size-1:0] b;
    output [size-1:0] c;
    assign c = a >> b;


endmodule //cgrame_op_lshr_32b

module cgrame_caseStatement_10in_0latency_32b #(parameter contexts=1, parameter latency=1, parameter size=1) (
  CGRA_Clock,
  CGRA_Reset,
  CGRA_Enable,
  in0,
  in1,
  in2,
  in3,
  in4,
  in5,
  in6,
  in7,
  in8,
  in9,
  out,
  select
);
    input CGRA_Clock;
    input CGRA_Reset;
    input CGRA_Enable;
    input [size-1:0] in0;
    input [size-1:0] in1;
    input [size-1:0] in2;
    input [size-1:0] in3;
    input [size-1:0] in4;
    input [size-1:0] in5;
    input [size-1:0] in6;
    input [size-1:0] in7;
    input [size-1:0] in8;
    input [size-1:0] in9;
    output [size-1:0] out;
    input [3:0] select;
    reg [size-1:0] computation;
    reg [size-1:0] delay_ppln [latency-1:0];
    always @*
        case (select)
            0: computation = in0;
            1: computation = in1;
            2: computation = in2;
            3: computation = in3;
            4: computation = in4;
            5: computation = in5;
            6: computation = in6;
            7: computation = in7;
            8: computation = in8;
            9: computation = in9;
            default: computation = {size{1'bx}};
        endcase
    integer i;
    always @(posedge CGRA_Clock, posedge CGRA_Reset) begin
        if (CGRA_Reset) begin
            for (i=0; i < latency; i=i+1)
                delay_ppln[i] <= {size{1'b0}};
        end else if (CGRA_Enable) begin
            for (i=1; i < latency; i=i+1)
                delay_ppln[i] <= delay_ppln[i-1];
            delay_ppln[0] <= computation;
        end
    end

    generate
        if (latency > 0)
            assign out = delay_ppln[latency-1];
        else
            assign out = computation;
    endgenerate

endmodule //cgrame_caseStatement_10in_0latency_32b

module cgrame_configcell_context_II_1_1_size2 #(parameter contexts=1, parameter size=1) (
  ConfigIn,
  ConfigOut,
  Config_Clock,
  Config_Reset,
  CGRA_Clock,
  CGRA_Reset,
  CGRA_Enable,
  select
);
    input CGRA_Clock;
    input CGRA_Reset;
    input CGRA_Enable;
    input ConfigIn;
    input Config_Clock;
    input Config_Reset;
    output ConfigOut;
    output [size-1:0] select;
    reg [size-1:0] config_reg [contexts-1:0];

    reg [contexts-1:0] context_counter = {size{1'b0}};

    integer i;

    always @(posedge Config_Clock, posedge Config_Reset)
        if (Config_Reset) begin
            for (i = 0; i < contexts; i = i+1) begin
                config_reg[i] <= 'd0;
            end
        end
        else begin
            for (i = 0; i < contexts; i = i+1) begin
                if(i == 0) begin
                    config_reg[i] <= {ConfigIn,config_reg[i][size-1:1]};
                end
                else begin
                    config_reg[i] <= {config_reg[i-1][0],config_reg[i][size-1:1]};
                end
            end
        end

    assign select = config_reg[0];
    assign ConfigOut = config_reg[contexts-1][0];

endmodule //cgrame_configcell_context_II_1_1_size2

module contextcell_U1 (
  input  CGRA_Clock,
  input  CGRA_Enable,
  input  CGRA_Reset,
  input  ConfigIn,
  output  ConfigOut,
  input  Config_Clock,
  input  Config_Reset,
  output [1:0] Context_Used
);
  //Wire declarations for instance 'ContextsUsed' (Module cgrame_configcell_context_II_1_1_size2)
  wire  ContextsUsed__CGRA_Clock;
  wire  ContextsUsed__CGRA_Enable;
  wire  ContextsUsed__CGRA_Reset;
  wire  ContextsUsed__ConfigIn;
  wire  ContextsUsed__ConfigOut;
  wire  ContextsUsed__Config_Clock;
  wire  ContextsUsed__Config_Reset;
  wire [1:0] ContextsUsed__select;
  cgrame_configcell_context_II_1_1_size2 #(.contexts(1),.size(2)) ContextsUsed(
    .CGRA_Clock(ContextsUsed__CGRA_Clock),
    .CGRA_Enable(ContextsUsed__CGRA_Enable),
    .CGRA_Reset(ContextsUsed__CGRA_Reset),
    .ConfigIn(ContextsUsed__ConfigIn),
    .ConfigOut(ContextsUsed__ConfigOut),
    .Config_Clock(ContextsUsed__Config_Clock),
    .Config_Reset(ContextsUsed__Config_Reset),
    .select(ContextsUsed__select)
  );

  //All the connections
  assign ContextsUsed__CGRA_Clock = CGRA_Clock;
  assign ContextsUsed__CGRA_Reset = CGRA_Reset;
  assign ContextsUsed__CGRA_Enable = CGRA_Enable;
  assign ContextsUsed__Config_Clock = Config_Clock;
  assign ContextsUsed__Config_Reset = Config_Reset;
  assign Context_Used[1:0] = ContextsUsed__select[1:0];
  assign ContextsUsed__ConfigIn = ConfigIn;
  assign ConfigOut = ContextsUsed__ConfigOut;

endmodule //contextcell_U1

module cgrame_configcell_context_II_3_1_size2 #(parameter contexts=1, parameter size=1) (
  ConfigIn,
  ConfigOut,
  Config_Clock,
  Config_Reset,
  CGRA_Clock,
  CGRA_Reset,
  CGRA_Enable,
  Context,
  select
);
    input CGRA_Clock;
    input CGRA_Reset;
    input CGRA_Enable;
    input ConfigIn;
    input Config_Clock;
    input Config_Reset;
    input [$clog2(contexts)-1:0] Context;
    output ConfigOut;
    output [size-1:0] select;
    reg [size-1:0] config_reg [contexts-1:0];

    reg [contexts-1:0] context_counter = {size{1'b0}};

    integer i;

    always @(posedge Config_Clock, posedge Config_Reset)
        if (Config_Reset) begin
            for (i = 0; i < contexts; i = i+1) begin
                config_reg[i] <= 'd0;
            end
        end
        else begin
            for (i = 0; i < contexts; i = i+1) begin
                if(i == 0) begin
                    config_reg[i] <= {ConfigIn,config_reg[i][size-1:1]};
                end
                else begin
                    config_reg[i] <= {config_reg[i-1][0],config_reg[i][size-1:1]};
                end
            end
        end

    assign select = config_reg[Context];
    assign ConfigOut = config_reg[contexts-1][0];

endmodule //cgrame_configcell_context_II_3_1_size2

module cgrame_configcell_context_II_3_1_size32 #(parameter contexts=1, parameter size=1) (
  ConfigIn,
  ConfigOut,
  Config_Clock,
  Config_Reset,
  CGRA_Clock,
  CGRA_Reset,
  CGRA_Enable,
  Context,
  select
);
    input CGRA_Clock;
    input CGRA_Reset;
    input CGRA_Enable;
    input ConfigIn;
    input Config_Clock;
    input Config_Reset;
    input [$clog2(contexts)-1:0] Context;
    output ConfigOut;
    output [size-1:0] select;
    reg [size-1:0] config_reg [contexts-1:0];

    reg [contexts-1:0] context_counter = {size{1'b0}};

    integer i;

    always @(posedge Config_Clock, posedge Config_Reset)
        if (Config_Reset) begin
            for (i = 0; i < contexts; i = i+1) begin
                config_reg[i] <= 'd0;
            end
        end
        else begin
            for (i = 0; i < contexts; i = i+1) begin
                if(i == 0) begin
                    config_reg[i] <= {ConfigIn,config_reg[i][size-1:1]};
                end
                else begin
                    config_reg[i] <= {config_reg[i-1][0],config_reg[i][size-1:1]};
                end
            end
        end

    assign select = config_reg[Context];
    assign ConfigOut = config_reg[contexts-1][0];

endmodule //cgrame_configcell_context_II_3_1_size32

module cgrame_mux_8to1_32b #(parameter contexts=1, parameter size=1) (
  in0,
  in1,
  in2,
  in3,
  in4,
  in5,
  in6,
  in7,
  out,
  select
);
    input [size-1:0] in0;
    input [size-1:0] in1;
    input [size-1:0] in2;
    input [size-1:0] in3;
    input [size-1:0] in4;
    input [size-1:0] in5;
    input [size-1:0] in6;
    input [size-1:0] in7;
    output reg [size-1:0] out;
    input [2:0] select;
    always @(*)
        case (select)
            0: out = in0;
            1: out = in1;
            2: out = in2;
            3: out = in3;
            4: out = in4;
            5: out = in5;
            6: out = in6;
            7: out = in7;
            default: out = {size{1'bx}};
        endcase

endmodule //cgrame_mux_8to1_32b

module cgrame_configcell_context_II_3_1_size3 #(parameter contexts=1, parameter size=1) (
  ConfigIn,
  ConfigOut,
  Config_Clock,
  Config_Reset,
  CGRA_Clock,
  CGRA_Reset,
  CGRA_Enable,
  Context,
  select
);
    input CGRA_Clock;
    input CGRA_Reset;
    input CGRA_Enable;
    input ConfigIn;
    input Config_Clock;
    input Config_Reset;
    input [$clog2(contexts)-1:0] Context;
    output ConfigOut;
    output [size-1:0] select;
    reg [size-1:0] config_reg [contexts-1:0];

    reg [contexts-1:0] context_counter = {size{1'b0}};

    integer i;

    always @(posedge Config_Clock, posedge Config_Reset)
        if (Config_Reset) begin
            for (i = 0; i < contexts; i = i+1) begin
                config_reg[i] <= 'd0;
            end
        end
        else begin
            for (i = 0; i < contexts; i = i+1) begin
                if(i == 0) begin
                    config_reg[i] <= {ConfigIn,config_reg[i][size-1:1]};
                end
                else begin
                    config_reg[i] <= {config_reg[i-1][0],config_reg[i][size-1:1]};
                end
            end
        end

    assign select = config_reg[Context];
    assign ConfigOut = config_reg[contexts-1][0];

endmodule //cgrame_configcell_context_II_3_1_size3

module cgrame_configcell_context_II_3_1_size4 #(parameter contexts=1, parameter size=1) (
  ConfigIn,
  ConfigOut,
  Config_Clock,
  Config_Reset,
  CGRA_Clock,
  CGRA_Reset,
  CGRA_Enable,
  Context,
  select
);
    input CGRA_Clock;
    input CGRA_Reset;
    input CGRA_Enable;
    input ConfigIn;
    input Config_Clock;
    input Config_Reset;
    input [$clog2(contexts)-1:0] Context;
    output ConfigOut;
    output [size-1:0] select;
    reg [size-1:0] config_reg [contexts-1:0];

    reg [contexts-1:0] context_counter = {size{1'b0}};

    integer i;

    always @(posedge Config_Clock, posedge Config_Reset)
        if (Config_Reset) begin
            for (i = 0; i < contexts; i = i+1) begin
                config_reg[i] <= 'd0;
            end
        end
        else begin
            for (i = 0; i < contexts; i = i+1) begin
                if(i == 0) begin
                    config_reg[i] <= {ConfigIn,config_reg[i][size-1:1]};
                end
                else begin
                    config_reg[i] <= {config_reg[i-1][0],config_reg[i][size-1:1]};
                end
            end
        end

    assign select = config_reg[Context];
    assign ConfigOut = config_reg[contexts-1][0];

endmodule //cgrame_configcell_context_II_3_1_size4

module const_32b_U10 (
  input  CGRA_Clock,
  input  CGRA_Enable,
  input  CGRA_Reset,
  input  ConfigIn,
  output  ConfigOut,
  input  Config_Clock,
  input  Config_Reset,
  input [1:0] Context,
  output [31:0] out
);
  //Wire declarations for instance 'ConstVal' (Module cgrame_configcell_context_II_3_1_size32)
  wire  ConstVal__CGRA_Clock;
  wire  ConstVal__CGRA_Enable;
  wire  ConstVal__CGRA_Reset;
  wire  ConstVal__ConfigIn;
  wire  ConstVal__ConfigOut;
  wire  ConstVal__Config_Clock;
  wire  ConstVal__Config_Reset;
  wire [1:0] ConstVal__Context;
  wire [31:0] ConstVal__select;
  cgrame_configcell_context_II_3_1_size32 #(.contexts(3),.size(32)) ConstVal(
    .CGRA_Clock(ConstVal__CGRA_Clock),
    .CGRA_Enable(ConstVal__CGRA_Enable),
    .CGRA_Reset(ConstVal__CGRA_Reset),
    .ConfigIn(ConstVal__ConfigIn),
    .ConfigOut(ConstVal__ConfigOut),
    .Config_Clock(ConstVal__Config_Clock),
    .Config_Reset(ConstVal__Config_Reset),
    .Context(ConstVal__Context),
    .select(ConstVal__select)
  );

  //All the connections
  assign ConstVal__CGRA_Clock = CGRA_Clock;
  assign ConstVal__CGRA_Reset = CGRA_Reset;
  assign ConstVal__CGRA_Enable = CGRA_Enable;
  assign ConstVal__Config_Clock = Config_Clock;
  assign ConstVal__Config_Reset = Config_Reset;
  assign ConstVal__Context[1:0] = Context[1:0];
  assign out[31:0] = ConstVal__select[31:0];
  assign ConstVal__ConfigIn = ConfigIn;
  assign ConfigOut = ConstVal__ConfigOut;

endmodule //const_32b_U10

module cgrame_contextcounter #(parameter contexts=1, parameter size=1) (
  CGRA_Clock,
  CGRA_Reset,
  CGRA_Enable,
  Context_Used,
  Context
);
    input CGRA_Clock;
    input CGRA_Reset;
    input CGRA_Enable;
    input [$clog2(contexts)-1:0] Context_Used;
    output reg [$clog2(contexts)-1:0] Context;

    integer i;

    always @(posedge CGRA_Clock, posedge CGRA_Reset)
        if (CGRA_Reset) begin
            Context <= 'd0;
        end
        else if (CGRA_Enable) begin
            if (Context < Context_Used) begin
                Context <= (Context+1);
            end
            else begin
                Context <= 'd0;
            end
        end

endmodule //cgrame_contextcounter

module cgrame_mux_2to1_32b #(parameter contexts=1, parameter size=1) (
  in0,
  in1,
  out,
  select
);
    input [size-1:0] in0;
    input [size-1:0] in1;
    output reg [size-1:0] out;
    input [0:0] select;
    always @(*)
        case (select)
            0: out = in0;
            1: out = in1;
            default: out = {size{1'bx}};
        endcase

endmodule //cgrame_mux_2to1_32b

module cgrame_mux_7to1_32b #(parameter contexts=1, parameter size=1) (
  in0,
  in1,
  in2,
  in3,
  in4,
  in5,
  in6,
  out,
  select
);
    input [size-1:0] in0;
    input [size-1:0] in1;
    input [size-1:0] in2;
    input [size-1:0] in3;
    input [size-1:0] in4;
    input [size-1:0] in5;
    input [size-1:0] in6;
    output reg [size-1:0] out;
    input [2:0] select;
    always @(*)
        case (select)
            0: out = in0;
            1: out = in1;
            2: out = in2;
            3: out = in3;
            4: out = in4;
            5: out = in5;
            6: out = in6;
            default: out = {size{1'bx}};
        endcase

endmodule //cgrame_mux_7to1_32b

module cgrame_mux_3to1_32b #(parameter contexts=1, parameter size=1) (
  in0,
  in1,
  in2,
  out,
  select
);
    input [size-1:0] in0;
    input [size-1:0] in1;
    input [size-1:0] in2;
    output reg [size-1:0] out;
    input [1:0] select;
    always @(*)
        case (select)
            0: out = in0;
            1: out = in1;
            2: out = in2;
            default: out = {size{1'bx}};
        endcase

endmodule //cgrame_mux_3to1_32b

module cgrame_mux_5to1_32b #(parameter contexts=1, parameter size=1) (
  in0,
  in1,
  in2,
  in3,
  in4,
  out,
  select
);
    input [size-1:0] in0;
    input [size-1:0] in1;
    input [size-1:0] in2;
    input [size-1:0] in3;
    input [size-1:0] in4;
    output reg [size-1:0] out;
    input [2:0] select;
    always @(*)
        case (select)
            0: out = in0;
            1: out = in1;
            2: out = in2;
            3: out = in3;
            4: out = in4;
            default: out = {size{1'bx}};
        endcase

endmodule //cgrame_mux_5to1_32b

module cgrame_mux_6to1_32b #(parameter contexts=1, parameter size=1) (
  in0,
  in1,
  in2,
  in3,
  in4,
  in5,
  out,
  select
);
    input [size-1:0] in0;
    input [size-1:0] in1;
    input [size-1:0] in2;
    input [size-1:0] in3;
    input [size-1:0] in4;
    input [size-1:0] in5;
    output reg [size-1:0] out;
    input [2:0] select;
    always @(*)
        case (select)
            0: out = in0;
            1: out = in1;
            2: out = in2;
            3: out = in3;
            4: out = in4;
            5: out = in5;
            default: out = {size{1'bx}};
        endcase

endmodule //cgrame_mux_6to1_32b

module cgrame_op_add_32b #(parameter contexts=1, parameter size=1) (
  a,
  b,
  c
);
    input [size-1:0] a;
    input [size-1:0] b;
    output [size-1:0] c;
    assign c = a + b ;


endmodule //cgrame_op_add_32b

module cgrame_op_cmp_32b #(parameter contexts=1, parameter size=1) (
  a,
  b,
  c
);
    input [size-1:0] a;
    input [size-1:0] b;
    output [size-1:0] c;
    assign c = a == b? 1: 0;


endmodule //cgrame_op_cmp_32b

module cgrame_op_and_32b #(parameter contexts=1, parameter size=1) (
  a,
  b,
  c
);
    input [size-1:0] a;
    input [size-1:0] b;
    output [size-1:0] c;
    assign c = a & b;


endmodule //cgrame_op_and_32b

module cgrame_op_ashr_32b #(parameter contexts=1, parameter size=1) (
  a,
  b,
  c
);
    input [size-1:0] a;
    input [size-1:0] b;
    output [size-1:0] c;
    assign c = a >>> b;


endmodule //cgrame_op_ashr_32b

module cgrame_op_multiply_32b #(parameter contexts=1, parameter size=1) (
  a,
  b,
  c
);
    input [size-1:0] a;
    input [size-1:0] b;
    output [size-1:0] c;
    assign c = a * b;


endmodule //cgrame_op_multiply_32b

module cgrame_op_or_32b #(parameter contexts=1, parameter size=1) (
  a,
  b,
  c
);
    input [size-1:0] a;
    input [size-1:0] b;
    output [size-1:0] c;
    assign c = a | b;


endmodule //cgrame_op_or_32b

module cgrame_op_sub_32b #(parameter contexts=1, parameter size=1) (
  a,
  b,
  c
);
    input [size-1:0] a;
    input [size-1:0] b;
    output [size-1:0] c;
    assign c = a - b;


endmodule //cgrame_op_sub_32b

module cgrame_op_xor_32b #(parameter contexts=1, parameter size=1) (
  a,
  b,
  c
);
    input [size-1:0] a;
    input [size-1:0] b;
    output [size-1:0] c;
    assign c = a ^ b;


endmodule //cgrame_op_xor_32b

module func_32b_add_multiply_sub_and_or_xor_shl_ashr_lshr_cmp_U11 (
  input  CGRA_Clock,
  input  CGRA_Enable,
  input  CGRA_Reset,
  input [31:0] in_a,
  input [31:0] in_b,
  output [31:0] out,
  input [3:0] select
);
  //Wire declarations for instance 'caseStatement' (Module cgrame_caseStatement_10in_0latency_32b)
  wire  caseStatement__CGRA_Clock;
  wire  caseStatement__CGRA_Enable;
  wire  caseStatement__CGRA_Reset;
  wire [31:0] caseStatement__in0;
  wire [31:0] caseStatement__in1;
  wire [31:0] caseStatement__in2;
  wire [31:0] caseStatement__in3;
  wire [31:0] caseStatement__in4;
  wire [31:0] caseStatement__in5;
  wire [31:0] caseStatement__in6;
  wire [31:0] caseStatement__in7;
  wire [31:0] caseStatement__in8;
  wire [31:0] caseStatement__in9;
  wire [31:0] caseStatement__out;
  wire [3:0] caseStatement__select;
  cgrame_caseStatement_10in_0latency_32b #(.contexts(3),.latency(0),.size(32)) caseStatement(
    .CGRA_Clock(caseStatement__CGRA_Clock),
    .CGRA_Enable(caseStatement__CGRA_Enable),
    .CGRA_Reset(caseStatement__CGRA_Reset),
    .in0(caseStatement__in0),
    .in1(caseStatement__in1),
    .in2(caseStatement__in2),
    .in3(caseStatement__in3),
    .in4(caseStatement__in4),
    .in5(caseStatement__in5),
    .in6(caseStatement__in6),
    .in7(caseStatement__in7),
    .in8(caseStatement__in8),
    .in9(caseStatement__in9),
    .out(caseStatement__out),
    .select(caseStatement__select)
  );

  //Wire declarations for instance 'op_add_32b' (Module cgrame_op_add_32b)
  wire [31:0] op_add_32b__a;
  wire [31:0] op_add_32b__b;
  wire [31:0] op_add_32b__c;
  cgrame_op_add_32b #(.contexts(3),.size(32)) op_add_32b(
    .a(op_add_32b__a),
    .b(op_add_32b__b),
    .c(op_add_32b__c)
  );

  //Wire declarations for instance 'op_and_32b' (Module cgrame_op_and_32b)
  wire [31:0] op_and_32b__a;
  wire [31:0] op_and_32b__b;
  wire [31:0] op_and_32b__c;
  cgrame_op_and_32b #(.contexts(3),.size(32)) op_and_32b(
    .a(op_and_32b__a),
    .b(op_and_32b__b),
    .c(op_and_32b__c)
  );

  //Wire declarations for instance 'op_ashr_32b' (Module cgrame_op_ashr_32b)
  wire [31:0] op_ashr_32b__a;
  wire [31:0] op_ashr_32b__b;
  wire [31:0] op_ashr_32b__c;
  cgrame_op_ashr_32b #(.contexts(3),.size(32)) op_ashr_32b(
    .a(op_ashr_32b__a),
    .b(op_ashr_32b__b),
    .c(op_ashr_32b__c)
  );

  //Wire declarations for instance 'op_cmp_32b' (Module cgrame_op_cmp_32b)
  wire [31:0] op_cmp_32b__a;
  wire [31:0] op_cmp_32b__b;
  wire [31:0] op_cmp_32b__c;
  cgrame_op_cmp_32b #(.contexts(3),.size(32)) op_cmp_32b(
    .a(op_cmp_32b__a),
    .b(op_cmp_32b__b),
    .c(op_cmp_32b__c)
  );

  //Wire declarations for instance 'op_lshr_32b' (Module cgrame_op_lshr_32b)
  wire [31:0] op_lshr_32b__a;
  wire [31:0] op_lshr_32b__b;
  wire [31:0] op_lshr_32b__c;
  cgrame_op_lshr_32b #(.contexts(3),.size(32)) op_lshr_32b(
    .a(op_lshr_32b__a),
    .b(op_lshr_32b__b),
    .c(op_lshr_32b__c)
  );

  //Wire declarations for instance 'op_multiply_32b' (Module cgrame_op_multiply_32b)
  wire [31:0] op_multiply_32b__a;
  wire [31:0] op_multiply_32b__b;
  wire [31:0] op_multiply_32b__c;
  cgrame_op_multiply_32b #(.contexts(3),.size(32)) op_multiply_32b(
    .a(op_multiply_32b__a),
    .b(op_multiply_32b__b),
    .c(op_multiply_32b__c)
  );

  //Wire declarations for instance 'op_or_32b' (Module cgrame_op_or_32b)
  wire [31:0] op_or_32b__a;
  wire [31:0] op_or_32b__b;
  wire [31:0] op_or_32b__c;
  cgrame_op_or_32b #(.contexts(3),.size(32)) op_or_32b(
    .a(op_or_32b__a),
    .b(op_or_32b__b),
    .c(op_or_32b__c)
  );

  //Wire declarations for instance 'op_shl_32b' (Module cgrame_op_shl_32b)
  wire [31:0] op_shl_32b__a;
  wire [31:0] op_shl_32b__b;
  wire [31:0] op_shl_32b__c;
  cgrame_op_shl_32b #(.contexts(3),.size(32)) op_shl_32b(
    .a(op_shl_32b__a),
    .b(op_shl_32b__b),
    .c(op_shl_32b__c)
  );

  //Wire declarations for instance 'op_sub_32b' (Module cgrame_op_sub_32b)
  wire [31:0] op_sub_32b__a;
  wire [31:0] op_sub_32b__b;
  wire [31:0] op_sub_32b__c;
  cgrame_op_sub_32b #(.contexts(3),.size(32)) op_sub_32b(
    .a(op_sub_32b__a),
    .b(op_sub_32b__b),
    .c(op_sub_32b__c)
  );

  //Wire declarations for instance 'op_xor_32b' (Module cgrame_op_xor_32b)
  wire [31:0] op_xor_32b__a;
  wire [31:0] op_xor_32b__b;
  wire [31:0] op_xor_32b__c;
  cgrame_op_xor_32b #(.contexts(3),.size(32)) op_xor_32b(
    .a(op_xor_32b__a),
    .b(op_xor_32b__b),
    .c(op_xor_32b__c)
  );

  //All the connections
  assign caseStatement__CGRA_Clock = CGRA_Clock;
  assign caseStatement__CGRA_Reset = CGRA_Reset;
  assign caseStatement__CGRA_Enable = CGRA_Enable;
  assign op_add_32b__a[31:0] = in_a[31:0];
  assign op_multiply_32b__a[31:0] = in_a[31:0];
  assign op_sub_32b__a[31:0] = in_a[31:0];
  assign op_and_32b__a[31:0] = in_a[31:0];
  assign op_or_32b__a[31:0] = in_a[31:0];
  assign op_xor_32b__a[31:0] = in_a[31:0];
  assign op_shl_32b__a[31:0] = in_a[31:0];
  assign op_ashr_32b__a[31:0] = in_a[31:0];
  assign op_lshr_32b__a[31:0] = in_a[31:0];
  assign op_cmp_32b__a[31:0] = in_a[31:0];
  assign op_add_32b__b[31:0] = in_b[31:0];
  assign op_multiply_32b__b[31:0] = in_b[31:0];
  assign op_sub_32b__b[31:0] = in_b[31:0];
  assign op_and_32b__b[31:0] = in_b[31:0];
  assign op_or_32b__b[31:0] = in_b[31:0];
  assign op_xor_32b__b[31:0] = in_b[31:0];
  assign op_shl_32b__b[31:0] = in_b[31:0];
  assign op_ashr_32b__b[31:0] = in_b[31:0];
  assign op_lshr_32b__b[31:0] = in_b[31:0];
  assign op_cmp_32b__b[31:0] = in_b[31:0];
  assign caseStatement__select[3:0] = select[3:0];
  assign caseStatement__in0[31:0] = op_add_32b__c[31:0];
  assign caseStatement__in1[31:0] = op_multiply_32b__c[31:0];
  assign caseStatement__in2[31:0] = op_sub_32b__c[31:0];
  assign caseStatement__in3[31:0] = op_and_32b__c[31:0];
  assign caseStatement__in4[31:0] = op_or_32b__c[31:0];
  assign caseStatement__in5[31:0] = op_xor_32b__c[31:0];
  assign caseStatement__in6[31:0] = op_shl_32b__c[31:0];
  assign caseStatement__in7[31:0] = op_ashr_32b__c[31:0];
  assign caseStatement__in8[31:0] = op_lshr_32b__c[31:0];
  assign caseStatement__in9[31:0] = op_cmp_32b__c[31:0];
  assign out[31:0] = caseStatement__out[31:0];

endmodule //func_32b_add_multiply_sub_and_or_xor_shl_ashr_lshr_cmp_U11

module adres_6in_vliw_U7 (
  input  CGRA_Clock,
  input  CGRA_Enable,
  input  CGRA_Reset,
  input  ConfigIn,
  output  ConfigOut,
  input  Config_Clock,
  input  Config_Reset,
  input [1:0] Context,
  output [31:0] fu_to_rf,
  input [31:0] in0,
  input [31:0] in1,
  input [31:0] in2,
  input [31:0] in3,
  input [31:0] in4,
  input [31:0] in5,
  output [31:0] out,
  input [31:0] rf_to_muxa,
  input [31:0] rf_to_muxout
);
  //Wire declarations for instance 'FuncConfig' (Module cgrame_configcell_context_II_3_1_size4)
  wire  FuncConfig__CGRA_Clock;
  wire  FuncConfig__CGRA_Enable;
  wire  FuncConfig__CGRA_Reset;
  wire  FuncConfig__ConfigIn;
  wire  FuncConfig__ConfigOut;
  wire  FuncConfig__Config_Clock;
  wire  FuncConfig__Config_Reset;
  wire [1:0] FuncConfig__Context;
  wire [3:0] FuncConfig__select;
  cgrame_configcell_context_II_3_1_size4 #(.contexts(3),.size(4)) FuncConfig(
    .CGRA_Clock(FuncConfig__CGRA_Clock),
    .CGRA_Enable(FuncConfig__CGRA_Enable),
    .CGRA_Reset(FuncConfig__CGRA_Reset),
    .ConfigIn(FuncConfig__ConfigIn),
    .ConfigOut(FuncConfig__ConfigOut),
    .Config_Clock(FuncConfig__Config_Clock),
    .Config_Reset(FuncConfig__Config_Reset),
    .Context(FuncConfig__Context),
    .select(FuncConfig__select)
  );

  //Wire declarations for instance 'MuxAConfig' (Module cgrame_configcell_context_II_3_1_size3)
  wire  MuxAConfig__CGRA_Clock;
  wire  MuxAConfig__CGRA_Enable;
  wire  MuxAConfig__CGRA_Reset;
  wire  MuxAConfig__ConfigIn;
  wire  MuxAConfig__ConfigOut;
  wire  MuxAConfig__Config_Clock;
  wire  MuxAConfig__Config_Reset;
  wire [1:0] MuxAConfig__Context;
  wire [2:0] MuxAConfig__select;
  cgrame_configcell_context_II_3_1_size3 #(.contexts(3),.size(3)) MuxAConfig(
    .CGRA_Clock(MuxAConfig__CGRA_Clock),
    .CGRA_Enable(MuxAConfig__CGRA_Enable),
    .CGRA_Reset(MuxAConfig__CGRA_Reset),
    .ConfigIn(MuxAConfig__ConfigIn),
    .ConfigOut(MuxAConfig__ConfigOut),
    .Config_Clock(MuxAConfig__Config_Clock),
    .Config_Reset(MuxAConfig__Config_Reset),
    .Context(MuxAConfig__Context),
    .select(MuxAConfig__select)
  );

  //Wire declarations for instance 'MuxBConfig' (Module cgrame_configcell_context_II_3_1_size3)
  wire  MuxBConfig__CGRA_Clock;
  wire  MuxBConfig__CGRA_Enable;
  wire  MuxBConfig__CGRA_Reset;
  wire  MuxBConfig__ConfigIn;
  wire  MuxBConfig__ConfigOut;
  wire  MuxBConfig__Config_Clock;
  wire  MuxBConfig__Config_Reset;
  wire [1:0] MuxBConfig__Context;
  wire [2:0] MuxBConfig__select;
  cgrame_configcell_context_II_3_1_size3 #(.contexts(3),.size(3)) MuxBConfig(
    .CGRA_Clock(MuxBConfig__CGRA_Clock),
    .CGRA_Enable(MuxBConfig__CGRA_Enable),
    .CGRA_Reset(MuxBConfig__CGRA_Reset),
    .ConfigIn(MuxBConfig__ConfigIn),
    .ConfigOut(MuxBConfig__ConfigOut),
    .Config_Clock(MuxBConfig__Config_Clock),
    .Config_Reset(MuxBConfig__Config_Reset),
    .Context(MuxBConfig__Context),
    .select(MuxBConfig__select)
  );

  //Wire declarations for instance 'MuxBypassConfig' (Module cgrame_configcell_context_II_3_1_size3)
  wire  MuxBypassConfig__CGRA_Clock;
  wire  MuxBypassConfig__CGRA_Enable;
  wire  MuxBypassConfig__CGRA_Reset;
  wire  MuxBypassConfig__ConfigIn;
  wire  MuxBypassConfig__ConfigOut;
  wire  MuxBypassConfig__Config_Clock;
  wire  MuxBypassConfig__Config_Reset;
  wire [1:0] MuxBypassConfig__Context;
  wire [2:0] MuxBypassConfig__select;
  cgrame_configcell_context_II_3_1_size3 #(.contexts(3),.size(3)) MuxBypassConfig(
    .CGRA_Clock(MuxBypassConfig__CGRA_Clock),
    .CGRA_Enable(MuxBypassConfig__CGRA_Enable),
    .CGRA_Reset(MuxBypassConfig__CGRA_Reset),
    .ConfigIn(MuxBypassConfig__ConfigIn),
    .ConfigOut(MuxBypassConfig__ConfigOut),
    .Config_Clock(MuxBypassConfig__Config_Clock),
    .Config_Reset(MuxBypassConfig__Config_Reset),
    .Context(MuxBypassConfig__Context),
    .select(MuxBypassConfig__select)
  );

  //Wire declarations for instance 'MuxOutConfig' (Module cgrame_configcell_context_II_3_1_size1)
  wire  MuxOutConfig__CGRA_Clock;
  wire  MuxOutConfig__CGRA_Enable;
  wire  MuxOutConfig__CGRA_Reset;
  wire  MuxOutConfig__ConfigIn;
  wire  MuxOutConfig__ConfigOut;
  wire  MuxOutConfig__Config_Clock;
  wire  MuxOutConfig__Config_Reset;
  wire [1:0] MuxOutConfig__Context;
  wire [0:0] MuxOutConfig__select;
  cgrame_configcell_context_II_3_1_size1 #(.contexts(3),.size(1)) MuxOutConfig(
    .CGRA_Clock(MuxOutConfig__CGRA_Clock),
    .CGRA_Enable(MuxOutConfig__CGRA_Enable),
    .CGRA_Reset(MuxOutConfig__CGRA_Reset),
    .ConfigIn(MuxOutConfig__ConfigIn),
    .ConfigOut(MuxOutConfig__ConfigOut),
    .Config_Clock(MuxOutConfig__Config_Clock),
    .Config_Reset(MuxOutConfig__Config_Reset),
    .Context(MuxOutConfig__Context),
    .select(MuxOutConfig__select)
  );

  //Wire declarations for instance 'const_val' (Module const_32b_U10)
  wire  const_val__CGRA_Clock;
  wire  const_val__CGRA_Enable;
  wire  const_val__CGRA_Reset;
  wire  const_val__ConfigIn;
  wire  const_val__ConfigOut;
  wire  const_val__Config_Clock;
  wire  const_val__Config_Reset;
  wire [1:0] const_val__Context;
  wire [31:0] const_val__out;
  const_32b_U10 const_val(
    .CGRA_Clock(const_val__CGRA_Clock),
    .CGRA_Enable(const_val__CGRA_Enable),
    .CGRA_Reset(const_val__CGRA_Reset),
    .ConfigIn(const_val__ConfigIn),
    .ConfigOut(const_val__ConfigOut),
    .Config_Clock(const_val__Config_Clock),
    .Config_Reset(const_val__Config_Reset),
    .Context(const_val__Context),
    .out(const_val__out)
  );

  //Wire declarations for instance 'func' (Module func_32b_add_multiply_sub_and_or_xor_shl_ashr_lshr_cmp_U11)
  wire  func__CGRA_Clock;
  wire  func__CGRA_Enable;
  wire  func__CGRA_Reset;
  wire [31:0] func__in_a;
  wire [31:0] func__in_b;
  wire [31:0] func__out;
  wire [3:0] func__select;
  func_32b_add_multiply_sub_and_or_xor_shl_ashr_lshr_cmp_U11 func(
    .CGRA_Clock(func__CGRA_Clock),
    .CGRA_Enable(func__CGRA_Enable),
    .CGRA_Reset(func__CGRA_Reset),
    .in_a(func__in_a),
    .in_b(func__in_b),
    .out(func__out),
    .select(func__select)
  );

  //Wire declarations for instance 'mux_a' (Module cgrame_mux_8to1_32b)
  wire [31:0] mux_a__in0;
  wire [31:0] mux_a__in1;
  wire [31:0] mux_a__in2;
  wire [31:0] mux_a__in3;
  wire [31:0] mux_a__in4;
  wire [31:0] mux_a__in5;
  wire [31:0] mux_a__in6;
  wire [31:0] mux_a__in7;
  wire [31:0] mux_a__out;
  wire [2:0] mux_a__select;
  cgrame_mux_8to1_32b #(.contexts(3),.size(32)) mux_a(
    .in0(mux_a__in0),
    .in1(mux_a__in1),
    .in2(mux_a__in2),
    .in3(mux_a__in3),
    .in4(mux_a__in4),
    .in5(mux_a__in5),
    .in6(mux_a__in6),
    .in7(mux_a__in7),
    .out(mux_a__out),
    .select(mux_a__select)
  );

  //Wire declarations for instance 'mux_b' (Module cgrame_mux_8to1_32b)
  wire [31:0] mux_b__in0;
  wire [31:0] mux_b__in1;
  wire [31:0] mux_b__in2;
  wire [31:0] mux_b__in3;
  wire [31:0] mux_b__in4;
  wire [31:0] mux_b__in5;
  wire [31:0] mux_b__in6;
  wire [31:0] mux_b__in7;
  wire [31:0] mux_b__out;
  wire [2:0] mux_b__select;
  cgrame_mux_8to1_32b #(.contexts(3),.size(32)) mux_b(
    .in0(mux_b__in0),
    .in1(mux_b__in1),
    .in2(mux_b__in2),
    .in3(mux_b__in3),
    .in4(mux_b__in4),
    .in5(mux_b__in5),
    .in6(mux_b__in6),
    .in7(mux_b__in7),
    .out(mux_b__out),
    .select(mux_b__select)
  );

  //Wire declarations for instance 'mux_bypass' (Module cgrame_mux_6to1_32b)
  wire [31:0] mux_bypass__in0;
  wire [31:0] mux_bypass__in1;
  wire [31:0] mux_bypass__in2;
  wire [31:0] mux_bypass__in3;
  wire [31:0] mux_bypass__in4;
  wire [31:0] mux_bypass__in5;
  wire [31:0] mux_bypass__out;
  wire [2:0] mux_bypass__select;
  cgrame_mux_6to1_32b #(.contexts(3),.size(32)) mux_bypass(
    .in0(mux_bypass__in0),
    .in1(mux_bypass__in1),
    .in2(mux_bypass__in2),
    .in3(mux_bypass__in3),
    .in4(mux_bypass__in4),
    .in5(mux_bypass__in5),
    .out(mux_bypass__out),
    .select(mux_bypass__select)
  );

  //Wire declarations for instance 'mux_out' (Module cgrame_mux_2to1_32b)
  wire [31:0] mux_out__in0;
  wire [31:0] mux_out__in1;
  wire [31:0] mux_out__out;
  wire [0:0] mux_out__select;
  cgrame_mux_2to1_32b #(.contexts(3),.size(32)) mux_out(
    .in0(mux_out__in0),
    .in1(mux_out__in1),
    .out(mux_out__out),
    .select(mux_out__select)
  );

  //All the connections
  assign const_val__Config_Clock = Config_Clock;
  assign FuncConfig__Config_Clock = Config_Clock;
  assign MuxAConfig__Config_Clock = Config_Clock;
  assign MuxBConfig__Config_Clock = Config_Clock;
  assign MuxBypassConfig__Config_Clock = Config_Clock;
  assign MuxOutConfig__Config_Clock = Config_Clock;
  assign const_val__Config_Reset = Config_Reset;
  assign FuncConfig__Config_Reset = Config_Reset;
  assign MuxAConfig__Config_Reset = Config_Reset;
  assign MuxBConfig__Config_Reset = Config_Reset;
  assign MuxBypassConfig__Config_Reset = Config_Reset;
  assign MuxOutConfig__Config_Reset = Config_Reset;
  assign const_val__CGRA_Clock = CGRA_Clock;
  assign func__CGRA_Clock = CGRA_Clock;
  assign FuncConfig__CGRA_Clock = CGRA_Clock;
  assign MuxAConfig__CGRA_Clock = CGRA_Clock;
  assign MuxBConfig__CGRA_Clock = CGRA_Clock;
  assign MuxBypassConfig__CGRA_Clock = CGRA_Clock;
  assign MuxOutConfig__CGRA_Clock = CGRA_Clock;
  assign const_val__CGRA_Reset = CGRA_Reset;
  assign func__CGRA_Reset = CGRA_Reset;
  assign FuncConfig__CGRA_Reset = CGRA_Reset;
  assign MuxAConfig__CGRA_Reset = CGRA_Reset;
  assign MuxBConfig__CGRA_Reset = CGRA_Reset;
  assign MuxBypassConfig__CGRA_Reset = CGRA_Reset;
  assign MuxOutConfig__CGRA_Reset = CGRA_Reset;
  assign const_val__CGRA_Enable = CGRA_Enable;
  assign func__CGRA_Enable = CGRA_Enable;
  assign FuncConfig__CGRA_Enable = CGRA_Enable;
  assign MuxAConfig__CGRA_Enable = CGRA_Enable;
  assign MuxBConfig__CGRA_Enable = CGRA_Enable;
  assign MuxBypassConfig__CGRA_Enable = CGRA_Enable;
  assign MuxOutConfig__CGRA_Enable = CGRA_Enable;
  assign func__in_a[31:0] = mux_a__out[31:0];
  assign func__in_b[31:0] = mux_b__out[31:0];
  assign mux_out__in1[31:0] = mux_bypass__out[31:0];
  assign mux_a__in6[31:0] = const_val__out[31:0];
  assign mux_b__in6[31:0] = const_val__out[31:0];
  assign fu_to_rf[31:0] = func__out[31:0];
  assign mux_b__in7[31:0] = mux_out__out[31:0];
  assign out[31:0] = mux_out__out[31:0];
  assign mux_a__in0[31:0] = in0[31:0];
  assign mux_b__in0[31:0] = in0[31:0];
  assign mux_bypass__in0[31:0] = in0[31:0];
  assign mux_a__in1[31:0] = in1[31:0];
  assign mux_b__in1[31:0] = in1[31:0];
  assign mux_bypass__in1[31:0] = in1[31:0];
  assign mux_a__in2[31:0] = in2[31:0];
  assign mux_b__in2[31:0] = in2[31:0];
  assign mux_bypass__in2[31:0] = in2[31:0];
  assign mux_a__in3[31:0] = in3[31:0];
  assign mux_b__in3[31:0] = in3[31:0];
  assign mux_bypass__in3[31:0] = in3[31:0];
  assign mux_a__in4[31:0] = in4[31:0];
  assign mux_b__in4[31:0] = in4[31:0];
  assign mux_bypass__in4[31:0] = in4[31:0];
  assign mux_a__in5[31:0] = in5[31:0];
  assign mux_b__in5[31:0] = in5[31:0];
  assign mux_bypass__in5[31:0] = in5[31:0];
  assign mux_a__in7[31:0] = rf_to_muxa[31:0];
  assign mux_out__in0[31:0] = rf_to_muxout[31:0];
  assign MuxAConfig__Context[1:0] = Context[1:0];
  assign MuxBConfig__Context[1:0] = Context[1:0];
  assign MuxBypassConfig__Context[1:0] = Context[1:0];
  assign MuxOutConfig__Context[1:0] = Context[1:0];
  assign FuncConfig__Context[1:0] = Context[1:0];
  assign const_val__Context[1:0] = Context[1:0];
  assign func__select[3:0] = FuncConfig__select[3:0];
  assign mux_a__select[2:0] = MuxAConfig__select[2:0];
  assign mux_b__select[2:0] = MuxBConfig__select[2:0];
  assign mux_bypass__select[2:0] = MuxBypassConfig__select[2:0];
  assign mux_out__select[0:0] = MuxOutConfig__select[0:0];
  assign FuncConfig__ConfigIn = ConfigIn;
  assign MuxAConfig__ConfigIn = FuncConfig__ConfigOut;
  assign MuxBConfig__ConfigIn = MuxAConfig__ConfigOut;
  assign MuxBypassConfig__ConfigIn = MuxBConfig__ConfigOut;
  assign MuxOutConfig__ConfigIn = MuxBypassConfig__ConfigOut;
  assign const_val__ConfigIn = MuxOutConfig__ConfigOut;
  assign ConfigOut = const_val__ConfigOut;

endmodule //adres_6in_vliw_U7

module adres_5in_vliw_U8 (
  input  CGRA_Clock,
  input  CGRA_Enable,
  input  CGRA_Reset,
  input  ConfigIn,
  output  ConfigOut,
  input  Config_Clock,
  input  Config_Reset,
  input [1:0] Context,
  output [31:0] fu_to_rf,
  input [31:0] in0,
  input [31:0] in1,
  input [31:0] in2,
  input [31:0] in3,
  input [31:0] in4,
  output [31:0] out,
  input [31:0] rf_to_muxa,
  input [31:0] rf_to_muxout
);
  //Wire declarations for instance 'FuncConfig' (Module cgrame_configcell_context_II_3_1_size4)
  wire  FuncConfig__CGRA_Clock;
  wire  FuncConfig__CGRA_Enable;
  wire  FuncConfig__CGRA_Reset;
  wire  FuncConfig__ConfigIn;
  wire  FuncConfig__ConfigOut;
  wire  FuncConfig__Config_Clock;
  wire  FuncConfig__Config_Reset;
  wire [1:0] FuncConfig__Context;
  wire [3:0] FuncConfig__select;
  cgrame_configcell_context_II_3_1_size4 #(.contexts(3),.size(4)) FuncConfig(
    .CGRA_Clock(FuncConfig__CGRA_Clock),
    .CGRA_Enable(FuncConfig__CGRA_Enable),
    .CGRA_Reset(FuncConfig__CGRA_Reset),
    .ConfigIn(FuncConfig__ConfigIn),
    .ConfigOut(FuncConfig__ConfigOut),
    .Config_Clock(FuncConfig__Config_Clock),
    .Config_Reset(FuncConfig__Config_Reset),
    .Context(FuncConfig__Context),
    .select(FuncConfig__select)
  );

  //Wire declarations for instance 'MuxAConfig' (Module cgrame_configcell_context_II_3_1_size3)
  wire  MuxAConfig__CGRA_Clock;
  wire  MuxAConfig__CGRA_Enable;
  wire  MuxAConfig__CGRA_Reset;
  wire  MuxAConfig__ConfigIn;
  wire  MuxAConfig__ConfigOut;
  wire  MuxAConfig__Config_Clock;
  wire  MuxAConfig__Config_Reset;
  wire [1:0] MuxAConfig__Context;
  wire [2:0] MuxAConfig__select;
  cgrame_configcell_context_II_3_1_size3 #(.contexts(3),.size(3)) MuxAConfig(
    .CGRA_Clock(MuxAConfig__CGRA_Clock),
    .CGRA_Enable(MuxAConfig__CGRA_Enable),
    .CGRA_Reset(MuxAConfig__CGRA_Reset),
    .ConfigIn(MuxAConfig__ConfigIn),
    .ConfigOut(MuxAConfig__ConfigOut),
    .Config_Clock(MuxAConfig__Config_Clock),
    .Config_Reset(MuxAConfig__Config_Reset),
    .Context(MuxAConfig__Context),
    .select(MuxAConfig__select)
  );

  //Wire declarations for instance 'MuxBConfig' (Module cgrame_configcell_context_II_3_1_size3)
  wire  MuxBConfig__CGRA_Clock;
  wire  MuxBConfig__CGRA_Enable;
  wire  MuxBConfig__CGRA_Reset;
  wire  MuxBConfig__ConfigIn;
  wire  MuxBConfig__ConfigOut;
  wire  MuxBConfig__Config_Clock;
  wire  MuxBConfig__Config_Reset;
  wire [1:0] MuxBConfig__Context;
  wire [2:0] MuxBConfig__select;
  cgrame_configcell_context_II_3_1_size3 #(.contexts(3),.size(3)) MuxBConfig(
    .CGRA_Clock(MuxBConfig__CGRA_Clock),
    .CGRA_Enable(MuxBConfig__CGRA_Enable),
    .CGRA_Reset(MuxBConfig__CGRA_Reset),
    .ConfigIn(MuxBConfig__ConfigIn),
    .ConfigOut(MuxBConfig__ConfigOut),
    .Config_Clock(MuxBConfig__Config_Clock),
    .Config_Reset(MuxBConfig__Config_Reset),
    .Context(MuxBConfig__Context),
    .select(MuxBConfig__select)
  );

  //Wire declarations for instance 'MuxBypassConfig' (Module cgrame_configcell_context_II_3_1_size3)
  wire  MuxBypassConfig__CGRA_Clock;
  wire  MuxBypassConfig__CGRA_Enable;
  wire  MuxBypassConfig__CGRA_Reset;
  wire  MuxBypassConfig__ConfigIn;
  wire  MuxBypassConfig__ConfigOut;
  wire  MuxBypassConfig__Config_Clock;
  wire  MuxBypassConfig__Config_Reset;
  wire [1:0] MuxBypassConfig__Context;
  wire [2:0] MuxBypassConfig__select;
  cgrame_configcell_context_II_3_1_size3 #(.contexts(3),.size(3)) MuxBypassConfig(
    .CGRA_Clock(MuxBypassConfig__CGRA_Clock),
    .CGRA_Enable(MuxBypassConfig__CGRA_Enable),
    .CGRA_Reset(MuxBypassConfig__CGRA_Reset),
    .ConfigIn(MuxBypassConfig__ConfigIn),
    .ConfigOut(MuxBypassConfig__ConfigOut),
    .Config_Clock(MuxBypassConfig__Config_Clock),
    .Config_Reset(MuxBypassConfig__Config_Reset),
    .Context(MuxBypassConfig__Context),
    .select(MuxBypassConfig__select)
  );

  //Wire declarations for instance 'MuxOutConfig' (Module cgrame_configcell_context_II_3_1_size1)
  wire  MuxOutConfig__CGRA_Clock;
  wire  MuxOutConfig__CGRA_Enable;
  wire  MuxOutConfig__CGRA_Reset;
  wire  MuxOutConfig__ConfigIn;
  wire  MuxOutConfig__ConfigOut;
  wire  MuxOutConfig__Config_Clock;
  wire  MuxOutConfig__Config_Reset;
  wire [1:0] MuxOutConfig__Context;
  wire [0:0] MuxOutConfig__select;
  cgrame_configcell_context_II_3_1_size1 #(.contexts(3),.size(1)) MuxOutConfig(
    .CGRA_Clock(MuxOutConfig__CGRA_Clock),
    .CGRA_Enable(MuxOutConfig__CGRA_Enable),
    .CGRA_Reset(MuxOutConfig__CGRA_Reset),
    .ConfigIn(MuxOutConfig__ConfigIn),
    .ConfigOut(MuxOutConfig__ConfigOut),
    .Config_Clock(MuxOutConfig__Config_Clock),
    .Config_Reset(MuxOutConfig__Config_Reset),
    .Context(MuxOutConfig__Context),
    .select(MuxOutConfig__select)
  );

  //Wire declarations for instance 'const_val' (Module const_32b_U10)
  wire  const_val__CGRA_Clock;
  wire  const_val__CGRA_Enable;
  wire  const_val__CGRA_Reset;
  wire  const_val__ConfigIn;
  wire  const_val__ConfigOut;
  wire  const_val__Config_Clock;
  wire  const_val__Config_Reset;
  wire [1:0] const_val__Context;
  wire [31:0] const_val__out;
  const_32b_U10 const_val(
    .CGRA_Clock(const_val__CGRA_Clock),
    .CGRA_Enable(const_val__CGRA_Enable),
    .CGRA_Reset(const_val__CGRA_Reset),
    .ConfigIn(const_val__ConfigIn),
    .ConfigOut(const_val__ConfigOut),
    .Config_Clock(const_val__Config_Clock),
    .Config_Reset(const_val__Config_Reset),
    .Context(const_val__Context),
    .out(const_val__out)
  );

  //Wire declarations for instance 'func' (Module func_32b_add_multiply_sub_and_or_xor_shl_ashr_lshr_cmp_U11)
  wire  func__CGRA_Clock;
  wire  func__CGRA_Enable;
  wire  func__CGRA_Reset;
  wire [31:0] func__in_a;
  wire [31:0] func__in_b;
  wire [31:0] func__out;
  wire [3:0] func__select;
  func_32b_add_multiply_sub_and_or_xor_shl_ashr_lshr_cmp_U11 func(
    .CGRA_Clock(func__CGRA_Clock),
    .CGRA_Enable(func__CGRA_Enable),
    .CGRA_Reset(func__CGRA_Reset),
    .in_a(func__in_a),
    .in_b(func__in_b),
    .out(func__out),
    .select(func__select)
  );

  //Wire declarations for instance 'mux_a' (Module cgrame_mux_7to1_32b)
  wire [31:0] mux_a__in0;
  wire [31:0] mux_a__in1;
  wire [31:0] mux_a__in2;
  wire [31:0] mux_a__in3;
  wire [31:0] mux_a__in4;
  wire [31:0] mux_a__in5;
  wire [31:0] mux_a__in6;
  wire [31:0] mux_a__out;
  wire [2:0] mux_a__select;
  cgrame_mux_7to1_32b #(.contexts(3),.size(32)) mux_a(
    .in0(mux_a__in0),
    .in1(mux_a__in1),
    .in2(mux_a__in2),
    .in3(mux_a__in3),
    .in4(mux_a__in4),
    .in5(mux_a__in5),
    .in6(mux_a__in6),
    .out(mux_a__out),
    .select(mux_a__select)
  );

  //Wire declarations for instance 'mux_b' (Module cgrame_mux_7to1_32b)
  wire [31:0] mux_b__in0;
  wire [31:0] mux_b__in1;
  wire [31:0] mux_b__in2;
  wire [31:0] mux_b__in3;
  wire [31:0] mux_b__in4;
  wire [31:0] mux_b__in5;
  wire [31:0] mux_b__in6;
  wire [31:0] mux_b__out;
  wire [2:0] mux_b__select;
  cgrame_mux_7to1_32b #(.contexts(3),.size(32)) mux_b(
    .in0(mux_b__in0),
    .in1(mux_b__in1),
    .in2(mux_b__in2),
    .in3(mux_b__in3),
    .in4(mux_b__in4),
    .in5(mux_b__in5),
    .in6(mux_b__in6),
    .out(mux_b__out),
    .select(mux_b__select)
  );

  //Wire declarations for instance 'mux_bypass' (Module cgrame_mux_5to1_32b)
  wire [31:0] mux_bypass__in0;
  wire [31:0] mux_bypass__in1;
  wire [31:0] mux_bypass__in2;
  wire [31:0] mux_bypass__in3;
  wire [31:0] mux_bypass__in4;
  wire [31:0] mux_bypass__out;
  wire [2:0] mux_bypass__select;
  cgrame_mux_5to1_32b #(.contexts(3),.size(32)) mux_bypass(
    .in0(mux_bypass__in0),
    .in1(mux_bypass__in1),
    .in2(mux_bypass__in2),
    .in3(mux_bypass__in3),
    .in4(mux_bypass__in4),
    .out(mux_bypass__out),
    .select(mux_bypass__select)
  );

  //Wire declarations for instance 'mux_out' (Module cgrame_mux_2to1_32b)
  wire [31:0] mux_out__in0;
  wire [31:0] mux_out__in1;
  wire [31:0] mux_out__out;
  wire [0:0] mux_out__select;
  cgrame_mux_2to1_32b #(.contexts(3),.size(32)) mux_out(
    .in0(mux_out__in0),
    .in1(mux_out__in1),
    .out(mux_out__out),
    .select(mux_out__select)
  );

  //All the connections
  assign const_val__Config_Clock = Config_Clock;
  assign FuncConfig__Config_Clock = Config_Clock;
  assign MuxAConfig__Config_Clock = Config_Clock;
  assign MuxBConfig__Config_Clock = Config_Clock;
  assign MuxBypassConfig__Config_Clock = Config_Clock;
  assign MuxOutConfig__Config_Clock = Config_Clock;
  assign const_val__Config_Reset = Config_Reset;
  assign FuncConfig__Config_Reset = Config_Reset;
  assign MuxAConfig__Config_Reset = Config_Reset;
  assign MuxBConfig__Config_Reset = Config_Reset;
  assign MuxBypassConfig__Config_Reset = Config_Reset;
  assign MuxOutConfig__Config_Reset = Config_Reset;
  assign const_val__CGRA_Clock = CGRA_Clock;
  assign func__CGRA_Clock = CGRA_Clock;
  assign FuncConfig__CGRA_Clock = CGRA_Clock;
  assign MuxAConfig__CGRA_Clock = CGRA_Clock;
  assign MuxBConfig__CGRA_Clock = CGRA_Clock;
  assign MuxBypassConfig__CGRA_Clock = CGRA_Clock;
  assign MuxOutConfig__CGRA_Clock = CGRA_Clock;
  assign const_val__CGRA_Reset = CGRA_Reset;
  assign func__CGRA_Reset = CGRA_Reset;
  assign FuncConfig__CGRA_Reset = CGRA_Reset;
  assign MuxAConfig__CGRA_Reset = CGRA_Reset;
  assign MuxBConfig__CGRA_Reset = CGRA_Reset;
  assign MuxBypassConfig__CGRA_Reset = CGRA_Reset;
  assign MuxOutConfig__CGRA_Reset = CGRA_Reset;
  assign const_val__CGRA_Enable = CGRA_Enable;
  assign func__CGRA_Enable = CGRA_Enable;
  assign FuncConfig__CGRA_Enable = CGRA_Enable;
  assign MuxAConfig__CGRA_Enable = CGRA_Enable;
  assign MuxBConfig__CGRA_Enable = CGRA_Enable;
  assign MuxBypassConfig__CGRA_Enable = CGRA_Enable;
  assign MuxOutConfig__CGRA_Enable = CGRA_Enable;
  assign fu_to_rf[31:0] = func__out[31:0];
  assign func__in_b[31:0] = mux_b__out[31:0];
  assign mux_a__in5[31:0] = const_val__out[31:0];
  assign mux_b__in5[31:0] = const_val__out[31:0];
  assign mux_out__in1[31:0] = mux_bypass__out[31:0];
  assign func__in_a[31:0] = mux_a__out[31:0];
  assign mux_b__in6[31:0] = mux_out__out[31:0];
  assign out[31:0] = mux_out__out[31:0];
  assign mux_a__in0[31:0] = in0[31:0];
  assign mux_b__in0[31:0] = in0[31:0];
  assign mux_bypass__in0[31:0] = in0[31:0];
  assign mux_a__in1[31:0] = in1[31:0];
  assign mux_b__in1[31:0] = in1[31:0];
  assign mux_bypass__in1[31:0] = in1[31:0];
  assign mux_a__in2[31:0] = in2[31:0];
  assign mux_b__in2[31:0] = in2[31:0];
  assign mux_bypass__in2[31:0] = in2[31:0];
  assign mux_a__in3[31:0] = in3[31:0];
  assign mux_b__in3[31:0] = in3[31:0];
  assign mux_bypass__in3[31:0] = in3[31:0];
  assign mux_a__in4[31:0] = in4[31:0];
  assign mux_b__in4[31:0] = in4[31:0];
  assign mux_bypass__in4[31:0] = in4[31:0];
  assign mux_a__in6[31:0] = rf_to_muxa[31:0];
  assign mux_out__in0[31:0] = rf_to_muxout[31:0];
  assign MuxAConfig__Context[1:0] = Context[1:0];
  assign MuxBConfig__Context[1:0] = Context[1:0];
  assign MuxBypassConfig__Context[1:0] = Context[1:0];
  assign MuxOutConfig__Context[1:0] = Context[1:0];
  assign FuncConfig__Context[1:0] = Context[1:0];
  assign const_val__Context[1:0] = Context[1:0];
  assign func__select[3:0] = FuncConfig__select[3:0];
  assign mux_a__select[2:0] = MuxAConfig__select[2:0];
  assign mux_b__select[2:0] = MuxBConfig__select[2:0];
  assign mux_bypass__select[2:0] = MuxBypassConfig__select[2:0];
  assign mux_out__select[0:0] = MuxOutConfig__select[0:0];
  assign FuncConfig__ConfigIn = ConfigIn;
  assign MuxAConfig__ConfigIn = FuncConfig__ConfigOut;
  assign MuxBConfig__ConfigIn = MuxAConfig__ConfigOut;
  assign MuxBypassConfig__ConfigIn = MuxBConfig__ConfigOut;
  assign MuxOutConfig__ConfigIn = MuxBypassConfig__ConfigOut;
  assign const_val__ConfigIn = MuxOutConfig__ConfigOut;
  assign ConfigOut = const_val__ConfigOut;

endmodule //adres_5in_vliw_U8

module cgrame_register_32b #(parameter contexts=1, parameter size=1) (
  CGRA_Clock,
  CGRA_Reset,
  CGRA_Enable,
  enable,
  in,
  out
);
    input CGRA_Clock;
    input CGRA_Reset;
    input CGRA_Enable;
    input [0:0] enable;
    input [size-1:0] in;
    output reg [size-1:0] out;
    always @(posedge CGRA_Clock, posedge CGRA_Reset)
        if (CGRA_Reset == 1)
            out <= 0;
        else
            if (enable & CGRA_Enable)
                out <= in;

endmodule //cgrame_register_32b

module registerFile_3in_6out_32b_U3 (
  input  CGRA_Clock,
  input  CGRA_Enable,
  input  CGRA_Reset,
  input  ConfigIn,
  output  ConfigOut,
  input  Config_Clock,
  input  Config_Reset,
  input [1:0] Context,
  input [31:0] in0,
  input [31:0] in1,
  input [31:0] in2,
  output [31:0] out0,
  output [31:0] out1,
  output [31:0] out2,
  output [31:0] out3,
  output [31:0] out4,
  output [31:0] out5
);
  //Wire declarations for instance 'drfInMux0Config' (Module cgrame_configcell_context_II_3_1_size2)
  wire  drfInMux0Config__CGRA_Clock;
  wire  drfInMux0Config__CGRA_Enable;
  wire  drfInMux0Config__CGRA_Reset;
  wire  drfInMux0Config__ConfigIn;
  wire  drfInMux0Config__ConfigOut;
  wire  drfInMux0Config__Config_Clock;
  wire  drfInMux0Config__Config_Reset;
  wire [1:0] drfInMux0Config__Context;
  wire [1:0] drfInMux0Config__select;
  cgrame_configcell_context_II_3_1_size2 #(.contexts(3),.size(2)) drfInMux0Config(
    .CGRA_Clock(drfInMux0Config__CGRA_Clock),
    .CGRA_Enable(drfInMux0Config__CGRA_Enable),
    .CGRA_Reset(drfInMux0Config__CGRA_Reset),
    .ConfigIn(drfInMux0Config__ConfigIn),
    .ConfigOut(drfInMux0Config__ConfigOut),
    .Config_Clock(drfInMux0Config__Config_Clock),
    .Config_Reset(drfInMux0Config__Config_Reset),
    .Context(drfInMux0Config__Context),
    .select(drfInMux0Config__select)
  );

  //Wire declarations for instance 'drfInMux1Config' (Module cgrame_configcell_context_II_3_1_size2)
  wire  drfInMux1Config__CGRA_Clock;
  wire  drfInMux1Config__CGRA_Enable;
  wire  drfInMux1Config__CGRA_Reset;
  wire  drfInMux1Config__ConfigIn;
  wire  drfInMux1Config__ConfigOut;
  wire  drfInMux1Config__Config_Clock;
  wire  drfInMux1Config__Config_Reset;
  wire [1:0] drfInMux1Config__Context;
  wire [1:0] drfInMux1Config__select;
  cgrame_configcell_context_II_3_1_size2 #(.contexts(3),.size(2)) drfInMux1Config(
    .CGRA_Clock(drfInMux1Config__CGRA_Clock),
    .CGRA_Enable(drfInMux1Config__CGRA_Enable),
    .CGRA_Reset(drfInMux1Config__CGRA_Reset),
    .ConfigIn(drfInMux1Config__ConfigIn),
    .ConfigOut(drfInMux1Config__ConfigOut),
    .Config_Clock(drfInMux1Config__Config_Clock),
    .Config_Reset(drfInMux1Config__Config_Reset),
    .Context(drfInMux1Config__Context),
    .select(drfInMux1Config__select)
  );

  //Wire declarations for instance 'drfInMux2Config' (Module cgrame_configcell_context_II_3_1_size2)
  wire  drfInMux2Config__CGRA_Clock;
  wire  drfInMux2Config__CGRA_Enable;
  wire  drfInMux2Config__CGRA_Reset;
  wire  drfInMux2Config__ConfigIn;
  wire  drfInMux2Config__ConfigOut;
  wire  drfInMux2Config__Config_Clock;
  wire  drfInMux2Config__Config_Reset;
  wire [1:0] drfInMux2Config__Context;
  wire [1:0] drfInMux2Config__select;
  cgrame_configcell_context_II_3_1_size2 #(.contexts(3),.size(2)) drfInMux2Config(
    .CGRA_Clock(drfInMux2Config__CGRA_Clock),
    .CGRA_Enable(drfInMux2Config__CGRA_Enable),
    .CGRA_Reset(drfInMux2Config__CGRA_Reset),
    .ConfigIn(drfInMux2Config__ConfigIn),
    .ConfigOut(drfInMux2Config__ConfigOut),
    .Config_Clock(drfInMux2Config__Config_Clock),
    .Config_Reset(drfInMux2Config__Config_Reset),
    .Context(drfInMux2Config__Context),
    .select(drfInMux2Config__select)
  );

  //Wire declarations for instance 'drfInMux3Config' (Module cgrame_configcell_context_II_3_1_size2)
  wire  drfInMux3Config__CGRA_Clock;
  wire  drfInMux3Config__CGRA_Enable;
  wire  drfInMux3Config__CGRA_Reset;
  wire  drfInMux3Config__ConfigIn;
  wire  drfInMux3Config__ConfigOut;
  wire  drfInMux3Config__Config_Clock;
  wire  drfInMux3Config__Config_Reset;
  wire [1:0] drfInMux3Config__Context;
  wire [1:0] drfInMux3Config__select;
  cgrame_configcell_context_II_3_1_size2 #(.contexts(3),.size(2)) drfInMux3Config(
    .CGRA_Clock(drfInMux3Config__CGRA_Clock),
    .CGRA_Enable(drfInMux3Config__CGRA_Enable),
    .CGRA_Reset(drfInMux3Config__CGRA_Reset),
    .ConfigIn(drfInMux3Config__ConfigIn),
    .ConfigOut(drfInMux3Config__ConfigOut),
    .Config_Clock(drfInMux3Config__Config_Clock),
    .Config_Reset(drfInMux3Config__Config_Reset),
    .Context(drfInMux3Config__Context),
    .select(drfInMux3Config__select)
  );

  //Wire declarations for instance 'drfInMux4Config' (Module cgrame_configcell_context_II_3_1_size2)
  wire  drfInMux4Config__CGRA_Clock;
  wire  drfInMux4Config__CGRA_Enable;
  wire  drfInMux4Config__CGRA_Reset;
  wire  drfInMux4Config__ConfigIn;
  wire  drfInMux4Config__ConfigOut;
  wire  drfInMux4Config__Config_Clock;
  wire  drfInMux4Config__Config_Reset;
  wire [1:0] drfInMux4Config__Context;
  wire [1:0] drfInMux4Config__select;
  cgrame_configcell_context_II_3_1_size2 #(.contexts(3),.size(2)) drfInMux4Config(
    .CGRA_Clock(drfInMux4Config__CGRA_Clock),
    .CGRA_Enable(drfInMux4Config__CGRA_Enable),
    .CGRA_Reset(drfInMux4Config__CGRA_Reset),
    .ConfigIn(drfInMux4Config__ConfigIn),
    .ConfigOut(drfInMux4Config__ConfigOut),
    .Config_Clock(drfInMux4Config__Config_Clock),
    .Config_Reset(drfInMux4Config__Config_Reset),
    .Context(drfInMux4Config__Context),
    .select(drfInMux4Config__select)
  );

  //Wire declarations for instance 'drfInMux5Config' (Module cgrame_configcell_context_II_3_1_size2)
  wire  drfInMux5Config__CGRA_Clock;
  wire  drfInMux5Config__CGRA_Enable;
  wire  drfInMux5Config__CGRA_Reset;
  wire  drfInMux5Config__ConfigIn;
  wire  drfInMux5Config__ConfigOut;
  wire  drfInMux5Config__Config_Clock;
  wire  drfInMux5Config__Config_Reset;
  wire [1:0] drfInMux5Config__Context;
  wire [1:0] drfInMux5Config__select;
  cgrame_configcell_context_II_3_1_size2 #(.contexts(3),.size(2)) drfInMux5Config(
    .CGRA_Clock(drfInMux5Config__CGRA_Clock),
    .CGRA_Enable(drfInMux5Config__CGRA_Enable),
    .CGRA_Reset(drfInMux5Config__CGRA_Reset),
    .ConfigIn(drfInMux5Config__ConfigIn),
    .ConfigOut(drfInMux5Config__ConfigOut),
    .Config_Clock(drfInMux5Config__Config_Clock),
    .Config_Reset(drfInMux5Config__Config_Reset),
    .Context(drfInMux5Config__Context),
    .select(drfInMux5Config__select)
  );

  //Wire declarations for instance 'drfInMux6Config' (Module cgrame_configcell_context_II_3_1_size2)
  wire  drfInMux6Config__CGRA_Clock;
  wire  drfInMux6Config__CGRA_Enable;
  wire  drfInMux6Config__CGRA_Reset;
  wire  drfInMux6Config__ConfigIn;
  wire  drfInMux6Config__ConfigOut;
  wire  drfInMux6Config__Config_Clock;
  wire  drfInMux6Config__Config_Reset;
  wire [1:0] drfInMux6Config__Context;
  wire [1:0] drfInMux6Config__select;
  cgrame_configcell_context_II_3_1_size2 #(.contexts(3),.size(2)) drfInMux6Config(
    .CGRA_Clock(drfInMux6Config__CGRA_Clock),
    .CGRA_Enable(drfInMux6Config__CGRA_Enable),
    .CGRA_Reset(drfInMux6Config__CGRA_Reset),
    .ConfigIn(drfInMux6Config__ConfigIn),
    .ConfigOut(drfInMux6Config__ConfigOut),
    .Config_Clock(drfInMux6Config__Config_Clock),
    .Config_Reset(drfInMux6Config__Config_Reset),
    .Context(drfInMux6Config__Context),
    .select(drfInMux6Config__select)
  );

  //Wire declarations for instance 'drfInMux7Config' (Module cgrame_configcell_context_II_3_1_size2)
  wire  drfInMux7Config__CGRA_Clock;
  wire  drfInMux7Config__CGRA_Enable;
  wire  drfInMux7Config__CGRA_Reset;
  wire  drfInMux7Config__ConfigIn;
  wire  drfInMux7Config__ConfigOut;
  wire  drfInMux7Config__Config_Clock;
  wire  drfInMux7Config__Config_Reset;
  wire [1:0] drfInMux7Config__Context;
  wire [1:0] drfInMux7Config__select;
  cgrame_configcell_context_II_3_1_size2 #(.contexts(3),.size(2)) drfInMux7Config(
    .CGRA_Clock(drfInMux7Config__CGRA_Clock),
    .CGRA_Enable(drfInMux7Config__CGRA_Enable),
    .CGRA_Reset(drfInMux7Config__CGRA_Reset),
    .ConfigIn(drfInMux7Config__ConfigIn),
    .ConfigOut(drfInMux7Config__ConfigOut),
    .Config_Clock(drfInMux7Config__Config_Clock),
    .Config_Reset(drfInMux7Config__Config_Reset),
    .Context(drfInMux7Config__Context),
    .select(drfInMux7Config__select)
  );

  //Wire declarations for instance 'drfOutMux0Config' (Module cgrame_configcell_context_II_3_1_size3)
  wire  drfOutMux0Config__CGRA_Clock;
  wire  drfOutMux0Config__CGRA_Enable;
  wire  drfOutMux0Config__CGRA_Reset;
  wire  drfOutMux0Config__ConfigIn;
  wire  drfOutMux0Config__ConfigOut;
  wire  drfOutMux0Config__Config_Clock;
  wire  drfOutMux0Config__Config_Reset;
  wire [1:0] drfOutMux0Config__Context;
  wire [2:0] drfOutMux0Config__select;
  cgrame_configcell_context_II_3_1_size3 #(.contexts(3),.size(3)) drfOutMux0Config(
    .CGRA_Clock(drfOutMux0Config__CGRA_Clock),
    .CGRA_Enable(drfOutMux0Config__CGRA_Enable),
    .CGRA_Reset(drfOutMux0Config__CGRA_Reset),
    .ConfigIn(drfOutMux0Config__ConfigIn),
    .ConfigOut(drfOutMux0Config__ConfigOut),
    .Config_Clock(drfOutMux0Config__Config_Clock),
    .Config_Reset(drfOutMux0Config__Config_Reset),
    .Context(drfOutMux0Config__Context),
    .select(drfOutMux0Config__select)
  );

  //Wire declarations for instance 'drfOutMux1Config' (Module cgrame_configcell_context_II_3_1_size3)
  wire  drfOutMux1Config__CGRA_Clock;
  wire  drfOutMux1Config__CGRA_Enable;
  wire  drfOutMux1Config__CGRA_Reset;
  wire  drfOutMux1Config__ConfigIn;
  wire  drfOutMux1Config__ConfigOut;
  wire  drfOutMux1Config__Config_Clock;
  wire  drfOutMux1Config__Config_Reset;
  wire [1:0] drfOutMux1Config__Context;
  wire [2:0] drfOutMux1Config__select;
  cgrame_configcell_context_II_3_1_size3 #(.contexts(3),.size(3)) drfOutMux1Config(
    .CGRA_Clock(drfOutMux1Config__CGRA_Clock),
    .CGRA_Enable(drfOutMux1Config__CGRA_Enable),
    .CGRA_Reset(drfOutMux1Config__CGRA_Reset),
    .ConfigIn(drfOutMux1Config__ConfigIn),
    .ConfigOut(drfOutMux1Config__ConfigOut),
    .Config_Clock(drfOutMux1Config__Config_Clock),
    .Config_Reset(drfOutMux1Config__Config_Reset),
    .Context(drfOutMux1Config__Context),
    .select(drfOutMux1Config__select)
  );

  //Wire declarations for instance 'drfOutMux2Config' (Module cgrame_configcell_context_II_3_1_size3)
  wire  drfOutMux2Config__CGRA_Clock;
  wire  drfOutMux2Config__CGRA_Enable;
  wire  drfOutMux2Config__CGRA_Reset;
  wire  drfOutMux2Config__ConfigIn;
  wire  drfOutMux2Config__ConfigOut;
  wire  drfOutMux2Config__Config_Clock;
  wire  drfOutMux2Config__Config_Reset;
  wire [1:0] drfOutMux2Config__Context;
  wire [2:0] drfOutMux2Config__select;
  cgrame_configcell_context_II_3_1_size3 #(.contexts(3),.size(3)) drfOutMux2Config(
    .CGRA_Clock(drfOutMux2Config__CGRA_Clock),
    .CGRA_Enable(drfOutMux2Config__CGRA_Enable),
    .CGRA_Reset(drfOutMux2Config__CGRA_Reset),
    .ConfigIn(drfOutMux2Config__ConfigIn),
    .ConfigOut(drfOutMux2Config__ConfigOut),
    .Config_Clock(drfOutMux2Config__Config_Clock),
    .Config_Reset(drfOutMux2Config__Config_Reset),
    .Context(drfOutMux2Config__Context),
    .select(drfOutMux2Config__select)
  );

  //Wire declarations for instance 'drfOutMux3Config' (Module cgrame_configcell_context_II_3_1_size3)
  wire  drfOutMux3Config__CGRA_Clock;
  wire  drfOutMux3Config__CGRA_Enable;
  wire  drfOutMux3Config__CGRA_Reset;
  wire  drfOutMux3Config__ConfigIn;
  wire  drfOutMux3Config__ConfigOut;
  wire  drfOutMux3Config__Config_Clock;
  wire  drfOutMux3Config__Config_Reset;
  wire [1:0] drfOutMux3Config__Context;
  wire [2:0] drfOutMux3Config__select;
  cgrame_configcell_context_II_3_1_size3 #(.contexts(3),.size(3)) drfOutMux3Config(
    .CGRA_Clock(drfOutMux3Config__CGRA_Clock),
    .CGRA_Enable(drfOutMux3Config__CGRA_Enable),
    .CGRA_Reset(drfOutMux3Config__CGRA_Reset),
    .ConfigIn(drfOutMux3Config__ConfigIn),
    .ConfigOut(drfOutMux3Config__ConfigOut),
    .Config_Clock(drfOutMux3Config__Config_Clock),
    .Config_Reset(drfOutMux3Config__Config_Reset),
    .Context(drfOutMux3Config__Context),
    .select(drfOutMux3Config__select)
  );

  //Wire declarations for instance 'drfOutMux4Config' (Module cgrame_configcell_context_II_3_1_size3)
  wire  drfOutMux4Config__CGRA_Clock;
  wire  drfOutMux4Config__CGRA_Enable;
  wire  drfOutMux4Config__CGRA_Reset;
  wire  drfOutMux4Config__ConfigIn;
  wire  drfOutMux4Config__ConfigOut;
  wire  drfOutMux4Config__Config_Clock;
  wire  drfOutMux4Config__Config_Reset;
  wire [1:0] drfOutMux4Config__Context;
  wire [2:0] drfOutMux4Config__select;
  cgrame_configcell_context_II_3_1_size3 #(.contexts(3),.size(3)) drfOutMux4Config(
    .CGRA_Clock(drfOutMux4Config__CGRA_Clock),
    .CGRA_Enable(drfOutMux4Config__CGRA_Enable),
    .CGRA_Reset(drfOutMux4Config__CGRA_Reset),
    .ConfigIn(drfOutMux4Config__ConfigIn),
    .ConfigOut(drfOutMux4Config__ConfigOut),
    .Config_Clock(drfOutMux4Config__Config_Clock),
    .Config_Reset(drfOutMux4Config__Config_Reset),
    .Context(drfOutMux4Config__Context),
    .select(drfOutMux4Config__select)
  );

  //Wire declarations for instance 'drfOutMux5Config' (Module cgrame_configcell_context_II_3_1_size3)
  wire  drfOutMux5Config__CGRA_Clock;
  wire  drfOutMux5Config__CGRA_Enable;
  wire  drfOutMux5Config__CGRA_Reset;
  wire  drfOutMux5Config__ConfigIn;
  wire  drfOutMux5Config__ConfigOut;
  wire  drfOutMux5Config__Config_Clock;
  wire  drfOutMux5Config__Config_Reset;
  wire [1:0] drfOutMux5Config__Context;
  wire [2:0] drfOutMux5Config__select;
  cgrame_configcell_context_II_3_1_size3 #(.contexts(3),.size(3)) drfOutMux5Config(
    .CGRA_Clock(drfOutMux5Config__CGRA_Clock),
    .CGRA_Enable(drfOutMux5Config__CGRA_Enable),
    .CGRA_Reset(drfOutMux5Config__CGRA_Reset),
    .ConfigIn(drfOutMux5Config__ConfigIn),
    .ConfigOut(drfOutMux5Config__ConfigOut),
    .Config_Clock(drfOutMux5Config__Config_Clock),
    .Config_Reset(drfOutMux5Config__Config_Reset),
    .Context(drfOutMux5Config__Context),
    .select(drfOutMux5Config__select)
  );

  //Wire declarations for instance 'drfReg0Config' (Module cgrame_configcell_context_II_3_1_size1)
  wire  drfReg0Config__CGRA_Clock;
  wire  drfReg0Config__CGRA_Enable;
  wire  drfReg0Config__CGRA_Reset;
  wire  drfReg0Config__ConfigIn;
  wire  drfReg0Config__ConfigOut;
  wire  drfReg0Config__Config_Clock;
  wire  drfReg0Config__Config_Reset;
  wire [1:0] drfReg0Config__Context;
  wire [0:0] drfReg0Config__select;
  cgrame_configcell_context_II_3_1_size1 #(.contexts(3),.size(1)) drfReg0Config(
    .CGRA_Clock(drfReg0Config__CGRA_Clock),
    .CGRA_Enable(drfReg0Config__CGRA_Enable),
    .CGRA_Reset(drfReg0Config__CGRA_Reset),
    .ConfigIn(drfReg0Config__ConfigIn),
    .ConfigOut(drfReg0Config__ConfigOut),
    .Config_Clock(drfReg0Config__Config_Clock),
    .Config_Reset(drfReg0Config__Config_Reset),
    .Context(drfReg0Config__Context),
    .select(drfReg0Config__select)
  );

  //Wire declarations for instance 'drfReg1Config' (Module cgrame_configcell_context_II_3_1_size1)
  wire  drfReg1Config__CGRA_Clock;
  wire  drfReg1Config__CGRA_Enable;
  wire  drfReg1Config__CGRA_Reset;
  wire  drfReg1Config__ConfigIn;
  wire  drfReg1Config__ConfigOut;
  wire  drfReg1Config__Config_Clock;
  wire  drfReg1Config__Config_Reset;
  wire [1:0] drfReg1Config__Context;
  wire [0:0] drfReg1Config__select;
  cgrame_configcell_context_II_3_1_size1 #(.contexts(3),.size(1)) drfReg1Config(
    .CGRA_Clock(drfReg1Config__CGRA_Clock),
    .CGRA_Enable(drfReg1Config__CGRA_Enable),
    .CGRA_Reset(drfReg1Config__CGRA_Reset),
    .ConfigIn(drfReg1Config__ConfigIn),
    .ConfigOut(drfReg1Config__ConfigOut),
    .Config_Clock(drfReg1Config__Config_Clock),
    .Config_Reset(drfReg1Config__Config_Reset),
    .Context(drfReg1Config__Context),
    .select(drfReg1Config__select)
  );

  //Wire declarations for instance 'drfReg2Config' (Module cgrame_configcell_context_II_3_1_size1)
  wire  drfReg2Config__CGRA_Clock;
  wire  drfReg2Config__CGRA_Enable;
  wire  drfReg2Config__CGRA_Reset;
  wire  drfReg2Config__ConfigIn;
  wire  drfReg2Config__ConfigOut;
  wire  drfReg2Config__Config_Clock;
  wire  drfReg2Config__Config_Reset;
  wire [1:0] drfReg2Config__Context;
  wire [0:0] drfReg2Config__select;
  cgrame_configcell_context_II_3_1_size1 #(.contexts(3),.size(1)) drfReg2Config(
    .CGRA_Clock(drfReg2Config__CGRA_Clock),
    .CGRA_Enable(drfReg2Config__CGRA_Enable),
    .CGRA_Reset(drfReg2Config__CGRA_Reset),
    .ConfigIn(drfReg2Config__ConfigIn),
    .ConfigOut(drfReg2Config__ConfigOut),
    .Config_Clock(drfReg2Config__Config_Clock),
    .Config_Reset(drfReg2Config__Config_Reset),
    .Context(drfReg2Config__Context),
    .select(drfReg2Config__select)
  );

  //Wire declarations for instance 'drfReg3Config' (Module cgrame_configcell_context_II_3_1_size1)
  wire  drfReg3Config__CGRA_Clock;
  wire  drfReg3Config__CGRA_Enable;
  wire  drfReg3Config__CGRA_Reset;
  wire  drfReg3Config__ConfigIn;
  wire  drfReg3Config__ConfigOut;
  wire  drfReg3Config__Config_Clock;
  wire  drfReg3Config__Config_Reset;
  wire [1:0] drfReg3Config__Context;
  wire [0:0] drfReg3Config__select;
  cgrame_configcell_context_II_3_1_size1 #(.contexts(3),.size(1)) drfReg3Config(
    .CGRA_Clock(drfReg3Config__CGRA_Clock),
    .CGRA_Enable(drfReg3Config__CGRA_Enable),
    .CGRA_Reset(drfReg3Config__CGRA_Reset),
    .ConfigIn(drfReg3Config__ConfigIn),
    .ConfigOut(drfReg3Config__ConfigOut),
    .Config_Clock(drfReg3Config__Config_Clock),
    .Config_Reset(drfReg3Config__Config_Reset),
    .Context(drfReg3Config__Context),
    .select(drfReg3Config__select)
  );

  //Wire declarations for instance 'drfReg4Config' (Module cgrame_configcell_context_II_3_1_size1)
  wire  drfReg4Config__CGRA_Clock;
  wire  drfReg4Config__CGRA_Enable;
  wire  drfReg4Config__CGRA_Reset;
  wire  drfReg4Config__ConfigIn;
  wire  drfReg4Config__ConfigOut;
  wire  drfReg4Config__Config_Clock;
  wire  drfReg4Config__Config_Reset;
  wire [1:0] drfReg4Config__Context;
  wire [0:0] drfReg4Config__select;
  cgrame_configcell_context_II_3_1_size1 #(.contexts(3),.size(1)) drfReg4Config(
    .CGRA_Clock(drfReg4Config__CGRA_Clock),
    .CGRA_Enable(drfReg4Config__CGRA_Enable),
    .CGRA_Reset(drfReg4Config__CGRA_Reset),
    .ConfigIn(drfReg4Config__ConfigIn),
    .ConfigOut(drfReg4Config__ConfigOut),
    .Config_Clock(drfReg4Config__Config_Clock),
    .Config_Reset(drfReg4Config__Config_Reset),
    .Context(drfReg4Config__Context),
    .select(drfReg4Config__select)
  );

  //Wire declarations for instance 'drfReg5Config' (Module cgrame_configcell_context_II_3_1_size1)
  wire  drfReg5Config__CGRA_Clock;
  wire  drfReg5Config__CGRA_Enable;
  wire  drfReg5Config__CGRA_Reset;
  wire  drfReg5Config__ConfigIn;
  wire  drfReg5Config__ConfigOut;
  wire  drfReg5Config__Config_Clock;
  wire  drfReg5Config__Config_Reset;
  wire [1:0] drfReg5Config__Context;
  wire [0:0] drfReg5Config__select;
  cgrame_configcell_context_II_3_1_size1 #(.contexts(3),.size(1)) drfReg5Config(
    .CGRA_Clock(drfReg5Config__CGRA_Clock),
    .CGRA_Enable(drfReg5Config__CGRA_Enable),
    .CGRA_Reset(drfReg5Config__CGRA_Reset),
    .ConfigIn(drfReg5Config__ConfigIn),
    .ConfigOut(drfReg5Config__ConfigOut),
    .Config_Clock(drfReg5Config__Config_Clock),
    .Config_Reset(drfReg5Config__Config_Reset),
    .Context(drfReg5Config__Context),
    .select(drfReg5Config__select)
  );

  //Wire declarations for instance 'drfReg6Config' (Module cgrame_configcell_context_II_3_1_size1)
  wire  drfReg6Config__CGRA_Clock;
  wire  drfReg6Config__CGRA_Enable;
  wire  drfReg6Config__CGRA_Reset;
  wire  drfReg6Config__ConfigIn;
  wire  drfReg6Config__ConfigOut;
  wire  drfReg6Config__Config_Clock;
  wire  drfReg6Config__Config_Reset;
  wire [1:0] drfReg6Config__Context;
  wire [0:0] drfReg6Config__select;
  cgrame_configcell_context_II_3_1_size1 #(.contexts(3),.size(1)) drfReg6Config(
    .CGRA_Clock(drfReg6Config__CGRA_Clock),
    .CGRA_Enable(drfReg6Config__CGRA_Enable),
    .CGRA_Reset(drfReg6Config__CGRA_Reset),
    .ConfigIn(drfReg6Config__ConfigIn),
    .ConfigOut(drfReg6Config__ConfigOut),
    .Config_Clock(drfReg6Config__Config_Clock),
    .Config_Reset(drfReg6Config__Config_Reset),
    .Context(drfReg6Config__Context),
    .select(drfReg6Config__select)
  );

  //Wire declarations for instance 'drfReg7Config' (Module cgrame_configcell_context_II_3_1_size1)
  wire  drfReg7Config__CGRA_Clock;
  wire  drfReg7Config__CGRA_Enable;
  wire  drfReg7Config__CGRA_Reset;
  wire  drfReg7Config__ConfigIn;
  wire  drfReg7Config__ConfigOut;
  wire  drfReg7Config__Config_Clock;
  wire  drfReg7Config__Config_Reset;
  wire [1:0] drfReg7Config__Context;
  wire [0:0] drfReg7Config__select;
  cgrame_configcell_context_II_3_1_size1 #(.contexts(3),.size(1)) drfReg7Config(
    .CGRA_Clock(drfReg7Config__CGRA_Clock),
    .CGRA_Enable(drfReg7Config__CGRA_Enable),
    .CGRA_Reset(drfReg7Config__CGRA_Reset),
    .ConfigIn(drfReg7Config__ConfigIn),
    .ConfigOut(drfReg7Config__ConfigOut),
    .Config_Clock(drfReg7Config__Config_Clock),
    .Config_Reset(drfReg7Config__Config_Reset),
    .Context(drfReg7Config__Context),
    .select(drfReg7Config__select)
  );

  //Wire declarations for instance 'in_mux0' (Module cgrame_mux_3to1_32b)
  wire [31:0] in_mux0__in0;
  wire [31:0] in_mux0__in1;
  wire [31:0] in_mux0__in2;
  wire [31:0] in_mux0__out;
  wire [1:0] in_mux0__select;
  cgrame_mux_3to1_32b #(.contexts(3),.size(32)) in_mux0(
    .in0(in_mux0__in0),
    .in1(in_mux0__in1),
    .in2(in_mux0__in2),
    .out(in_mux0__out),
    .select(in_mux0__select)
  );

  //Wire declarations for instance 'in_mux1' (Module cgrame_mux_3to1_32b)
  wire [31:0] in_mux1__in0;
  wire [31:0] in_mux1__in1;
  wire [31:0] in_mux1__in2;
  wire [31:0] in_mux1__out;
  wire [1:0] in_mux1__select;
  cgrame_mux_3to1_32b #(.contexts(3),.size(32)) in_mux1(
    .in0(in_mux1__in0),
    .in1(in_mux1__in1),
    .in2(in_mux1__in2),
    .out(in_mux1__out),
    .select(in_mux1__select)
  );

  //Wire declarations for instance 'in_mux2' (Module cgrame_mux_3to1_32b)
  wire [31:0] in_mux2__in0;
  wire [31:0] in_mux2__in1;
  wire [31:0] in_mux2__in2;
  wire [31:0] in_mux2__out;
  wire [1:0] in_mux2__select;
  cgrame_mux_3to1_32b #(.contexts(3),.size(32)) in_mux2(
    .in0(in_mux2__in0),
    .in1(in_mux2__in1),
    .in2(in_mux2__in2),
    .out(in_mux2__out),
    .select(in_mux2__select)
  );

  //Wire declarations for instance 'in_mux3' (Module cgrame_mux_3to1_32b)
  wire [31:0] in_mux3__in0;
  wire [31:0] in_mux3__in1;
  wire [31:0] in_mux3__in2;
  wire [31:0] in_mux3__out;
  wire [1:0] in_mux3__select;
  cgrame_mux_3to1_32b #(.contexts(3),.size(32)) in_mux3(
    .in0(in_mux3__in0),
    .in1(in_mux3__in1),
    .in2(in_mux3__in2),
    .out(in_mux3__out),
    .select(in_mux3__select)
  );

  //Wire declarations for instance 'in_mux4' (Module cgrame_mux_3to1_32b)
  wire [31:0] in_mux4__in0;
  wire [31:0] in_mux4__in1;
  wire [31:0] in_mux4__in2;
  wire [31:0] in_mux4__out;
  wire [1:0] in_mux4__select;
  cgrame_mux_3to1_32b #(.contexts(3),.size(32)) in_mux4(
    .in0(in_mux4__in0),
    .in1(in_mux4__in1),
    .in2(in_mux4__in2),
    .out(in_mux4__out),
    .select(in_mux4__select)
  );

  //Wire declarations for instance 'in_mux5' (Module cgrame_mux_3to1_32b)
  wire [31:0] in_mux5__in0;
  wire [31:0] in_mux5__in1;
  wire [31:0] in_mux5__in2;
  wire [31:0] in_mux5__out;
  wire [1:0] in_mux5__select;
  cgrame_mux_3to1_32b #(.contexts(3),.size(32)) in_mux5(
    .in0(in_mux5__in0),
    .in1(in_mux5__in1),
    .in2(in_mux5__in2),
    .out(in_mux5__out),
    .select(in_mux5__select)
  );

  //Wire declarations for instance 'in_mux6' (Module cgrame_mux_3to1_32b)
  wire [31:0] in_mux6__in0;
  wire [31:0] in_mux6__in1;
  wire [31:0] in_mux6__in2;
  wire [31:0] in_mux6__out;
  wire [1:0] in_mux6__select;
  cgrame_mux_3to1_32b #(.contexts(3),.size(32)) in_mux6(
    .in0(in_mux6__in0),
    .in1(in_mux6__in1),
    .in2(in_mux6__in2),
    .out(in_mux6__out),
    .select(in_mux6__select)
  );

  //Wire declarations for instance 'in_mux7' (Module cgrame_mux_3to1_32b)
  wire [31:0] in_mux7__in0;
  wire [31:0] in_mux7__in1;
  wire [31:0] in_mux7__in2;
  wire [31:0] in_mux7__out;
  wire [1:0] in_mux7__select;
  cgrame_mux_3to1_32b #(.contexts(3),.size(32)) in_mux7(
    .in0(in_mux7__in0),
    .in1(in_mux7__in1),
    .in2(in_mux7__in2),
    .out(in_mux7__out),
    .select(in_mux7__select)
  );

  //Wire declarations for instance 'out_mux0' (Module cgrame_mux_8to1_32b)
  wire [31:0] out_mux0__in0;
  wire [31:0] out_mux0__in1;
  wire [31:0] out_mux0__in2;
  wire [31:0] out_mux0__in3;
  wire [31:0] out_mux0__in4;
  wire [31:0] out_mux0__in5;
  wire [31:0] out_mux0__in6;
  wire [31:0] out_mux0__in7;
  wire [31:0] out_mux0__out;
  wire [2:0] out_mux0__select;
  cgrame_mux_8to1_32b #(.contexts(3),.size(32)) out_mux0(
    .in0(out_mux0__in0),
    .in1(out_mux0__in1),
    .in2(out_mux0__in2),
    .in3(out_mux0__in3),
    .in4(out_mux0__in4),
    .in5(out_mux0__in5),
    .in6(out_mux0__in6),
    .in7(out_mux0__in7),
    .out(out_mux0__out),
    .select(out_mux0__select)
  );

  //Wire declarations for instance 'out_mux1' (Module cgrame_mux_8to1_32b)
  wire [31:0] out_mux1__in0;
  wire [31:0] out_mux1__in1;
  wire [31:0] out_mux1__in2;
  wire [31:0] out_mux1__in3;
  wire [31:0] out_mux1__in4;
  wire [31:0] out_mux1__in5;
  wire [31:0] out_mux1__in6;
  wire [31:0] out_mux1__in7;
  wire [31:0] out_mux1__out;
  wire [2:0] out_mux1__select;
  cgrame_mux_8to1_32b #(.contexts(3),.size(32)) out_mux1(
    .in0(out_mux1__in0),
    .in1(out_mux1__in1),
    .in2(out_mux1__in2),
    .in3(out_mux1__in3),
    .in4(out_mux1__in4),
    .in5(out_mux1__in5),
    .in6(out_mux1__in6),
    .in7(out_mux1__in7),
    .out(out_mux1__out),
    .select(out_mux1__select)
  );

  //Wire declarations for instance 'out_mux2' (Module cgrame_mux_8to1_32b)
  wire [31:0] out_mux2__in0;
  wire [31:0] out_mux2__in1;
  wire [31:0] out_mux2__in2;
  wire [31:0] out_mux2__in3;
  wire [31:0] out_mux2__in4;
  wire [31:0] out_mux2__in5;
  wire [31:0] out_mux2__in6;
  wire [31:0] out_mux2__in7;
  wire [31:0] out_mux2__out;
  wire [2:0] out_mux2__select;
  cgrame_mux_8to1_32b #(.contexts(3),.size(32)) out_mux2(
    .in0(out_mux2__in0),
    .in1(out_mux2__in1),
    .in2(out_mux2__in2),
    .in3(out_mux2__in3),
    .in4(out_mux2__in4),
    .in5(out_mux2__in5),
    .in6(out_mux2__in6),
    .in7(out_mux2__in7),
    .out(out_mux2__out),
    .select(out_mux2__select)
  );

  //Wire declarations for instance 'out_mux3' (Module cgrame_mux_8to1_32b)
  wire [31:0] out_mux3__in0;
  wire [31:0] out_mux3__in1;
  wire [31:0] out_mux3__in2;
  wire [31:0] out_mux3__in3;
  wire [31:0] out_mux3__in4;
  wire [31:0] out_mux3__in5;
  wire [31:0] out_mux3__in6;
  wire [31:0] out_mux3__in7;
  wire [31:0] out_mux3__out;
  wire [2:0] out_mux3__select;
  cgrame_mux_8to1_32b #(.contexts(3),.size(32)) out_mux3(
    .in0(out_mux3__in0),
    .in1(out_mux3__in1),
    .in2(out_mux3__in2),
    .in3(out_mux3__in3),
    .in4(out_mux3__in4),
    .in5(out_mux3__in5),
    .in6(out_mux3__in6),
    .in7(out_mux3__in7),
    .out(out_mux3__out),
    .select(out_mux3__select)
  );

  //Wire declarations for instance 'out_mux4' (Module cgrame_mux_8to1_32b)
  wire [31:0] out_mux4__in0;
  wire [31:0] out_mux4__in1;
  wire [31:0] out_mux4__in2;
  wire [31:0] out_mux4__in3;
  wire [31:0] out_mux4__in4;
  wire [31:0] out_mux4__in5;
  wire [31:0] out_mux4__in6;
  wire [31:0] out_mux4__in7;
  wire [31:0] out_mux4__out;
  wire [2:0] out_mux4__select;
  cgrame_mux_8to1_32b #(.contexts(3),.size(32)) out_mux4(
    .in0(out_mux4__in0),
    .in1(out_mux4__in1),
    .in2(out_mux4__in2),
    .in3(out_mux4__in3),
    .in4(out_mux4__in4),
    .in5(out_mux4__in5),
    .in6(out_mux4__in6),
    .in7(out_mux4__in7),
    .out(out_mux4__out),
    .select(out_mux4__select)
  );

  //Wire declarations for instance 'out_mux5' (Module cgrame_mux_8to1_32b)
  wire [31:0] out_mux5__in0;
  wire [31:0] out_mux5__in1;
  wire [31:0] out_mux5__in2;
  wire [31:0] out_mux5__in3;
  wire [31:0] out_mux5__in4;
  wire [31:0] out_mux5__in5;
  wire [31:0] out_mux5__in6;
  wire [31:0] out_mux5__in7;
  wire [31:0] out_mux5__out;
  wire [2:0] out_mux5__select;
  cgrame_mux_8to1_32b #(.contexts(3),.size(32)) out_mux5(
    .in0(out_mux5__in0),
    .in1(out_mux5__in1),
    .in2(out_mux5__in2),
    .in3(out_mux5__in3),
    .in4(out_mux5__in4),
    .in5(out_mux5__in5),
    .in6(out_mux5__in6),
    .in7(out_mux5__in7),
    .out(out_mux5__out),
    .select(out_mux5__select)
  );

  //Wire declarations for instance 'reg0' (Module cgrame_register_32b)
  wire  reg0__CGRA_Clock;
  wire  reg0__CGRA_Enable;
  wire  reg0__CGRA_Reset;
  wire [0:0] reg0__enable;
  wire [31:0] reg0__in;
  wire [31:0] reg0__out;
  cgrame_register_32b #(.contexts(3),.size(32)) reg0(
    .CGRA_Clock(reg0__CGRA_Clock),
    .CGRA_Enable(reg0__CGRA_Enable),
    .CGRA_Reset(reg0__CGRA_Reset),
    .enable(reg0__enable),
    .in(reg0__in),
    .out(reg0__out)
  );

  //Wire declarations for instance 'reg1' (Module cgrame_register_32b)
  wire  reg1__CGRA_Clock;
  wire  reg1__CGRA_Enable;
  wire  reg1__CGRA_Reset;
  wire [0:0] reg1__enable;
  wire [31:0] reg1__in;
  wire [31:0] reg1__out;
  cgrame_register_32b #(.contexts(3),.size(32)) reg1(
    .CGRA_Clock(reg1__CGRA_Clock),
    .CGRA_Enable(reg1__CGRA_Enable),
    .CGRA_Reset(reg1__CGRA_Reset),
    .enable(reg1__enable),
    .in(reg1__in),
    .out(reg1__out)
  );

  //Wire declarations for instance 'reg2' (Module cgrame_register_32b)
  wire  reg2__CGRA_Clock;
  wire  reg2__CGRA_Enable;
  wire  reg2__CGRA_Reset;
  wire [0:0] reg2__enable;
  wire [31:0] reg2__in;
  wire [31:0] reg2__out;
  cgrame_register_32b #(.contexts(3),.size(32)) reg2(
    .CGRA_Clock(reg2__CGRA_Clock),
    .CGRA_Enable(reg2__CGRA_Enable),
    .CGRA_Reset(reg2__CGRA_Reset),
    .enable(reg2__enable),
    .in(reg2__in),
    .out(reg2__out)
  );

  //Wire declarations for instance 'reg3' (Module cgrame_register_32b)
  wire  reg3__CGRA_Clock;
  wire  reg3__CGRA_Enable;
  wire  reg3__CGRA_Reset;
  wire [0:0] reg3__enable;
  wire [31:0] reg3__in;
  wire [31:0] reg3__out;
  cgrame_register_32b #(.contexts(3),.size(32)) reg3(
    .CGRA_Clock(reg3__CGRA_Clock),
    .CGRA_Enable(reg3__CGRA_Enable),
    .CGRA_Reset(reg3__CGRA_Reset),
    .enable(reg3__enable),
    .in(reg3__in),
    .out(reg3__out)
  );

  //Wire declarations for instance 'reg4' (Module cgrame_register_32b)
  wire  reg4__CGRA_Clock;
  wire  reg4__CGRA_Enable;
  wire  reg4__CGRA_Reset;
  wire [0:0] reg4__enable;
  wire [31:0] reg4__in;
  wire [31:0] reg4__out;
  cgrame_register_32b #(.contexts(3),.size(32)) reg4(
    .CGRA_Clock(reg4__CGRA_Clock),
    .CGRA_Enable(reg4__CGRA_Enable),
    .CGRA_Reset(reg4__CGRA_Reset),
    .enable(reg4__enable),
    .in(reg4__in),
    .out(reg4__out)
  );

  //Wire declarations for instance 'reg5' (Module cgrame_register_32b)
  wire  reg5__CGRA_Clock;
  wire  reg5__CGRA_Enable;
  wire  reg5__CGRA_Reset;
  wire [0:0] reg5__enable;
  wire [31:0] reg5__in;
  wire [31:0] reg5__out;
  cgrame_register_32b #(.contexts(3),.size(32)) reg5(
    .CGRA_Clock(reg5__CGRA_Clock),
    .CGRA_Enable(reg5__CGRA_Enable),
    .CGRA_Reset(reg5__CGRA_Reset),
    .enable(reg5__enable),
    .in(reg5__in),
    .out(reg5__out)
  );

  //Wire declarations for instance 'reg6' (Module cgrame_register_32b)
  wire  reg6__CGRA_Clock;
  wire  reg6__CGRA_Enable;
  wire  reg6__CGRA_Reset;
  wire [0:0] reg6__enable;
  wire [31:0] reg6__in;
  wire [31:0] reg6__out;
  cgrame_register_32b #(.contexts(3),.size(32)) reg6(
    .CGRA_Clock(reg6__CGRA_Clock),
    .CGRA_Enable(reg6__CGRA_Enable),
    .CGRA_Reset(reg6__CGRA_Reset),
    .enable(reg6__enable),
    .in(reg6__in),
    .out(reg6__out)
  );

  //Wire declarations for instance 'reg7' (Module cgrame_register_32b)
  wire  reg7__CGRA_Clock;
  wire  reg7__CGRA_Enable;
  wire  reg7__CGRA_Reset;
  wire [0:0] reg7__enable;
  wire [31:0] reg7__in;
  wire [31:0] reg7__out;
  cgrame_register_32b #(.contexts(3),.size(32)) reg7(
    .CGRA_Clock(reg7__CGRA_Clock),
    .CGRA_Enable(reg7__CGRA_Enable),
    .CGRA_Reset(reg7__CGRA_Reset),
    .enable(reg7__enable),
    .in(reg7__in),
    .out(reg7__out)
  );

  //All the connections
  assign reg0__CGRA_Clock = CGRA_Clock;
  assign reg1__CGRA_Clock = CGRA_Clock;
  assign reg2__CGRA_Clock = CGRA_Clock;
  assign reg3__CGRA_Clock = CGRA_Clock;
  assign reg4__CGRA_Clock = CGRA_Clock;
  assign reg5__CGRA_Clock = CGRA_Clock;
  assign reg6__CGRA_Clock = CGRA_Clock;
  assign reg7__CGRA_Clock = CGRA_Clock;
  assign drfInMux0Config__CGRA_Clock = CGRA_Clock;
  assign drfInMux1Config__CGRA_Clock = CGRA_Clock;
  assign drfInMux2Config__CGRA_Clock = CGRA_Clock;
  assign drfInMux3Config__CGRA_Clock = CGRA_Clock;
  assign drfInMux4Config__CGRA_Clock = CGRA_Clock;
  assign drfInMux5Config__CGRA_Clock = CGRA_Clock;
  assign drfInMux6Config__CGRA_Clock = CGRA_Clock;
  assign drfInMux7Config__CGRA_Clock = CGRA_Clock;
  assign drfOutMux0Config__CGRA_Clock = CGRA_Clock;
  assign drfOutMux1Config__CGRA_Clock = CGRA_Clock;
  assign drfOutMux2Config__CGRA_Clock = CGRA_Clock;
  assign drfOutMux3Config__CGRA_Clock = CGRA_Clock;
  assign drfOutMux4Config__CGRA_Clock = CGRA_Clock;
  assign drfOutMux5Config__CGRA_Clock = CGRA_Clock;
  assign drfReg0Config__CGRA_Clock = CGRA_Clock;
  assign drfReg1Config__CGRA_Clock = CGRA_Clock;
  assign drfReg2Config__CGRA_Clock = CGRA_Clock;
  assign drfReg3Config__CGRA_Clock = CGRA_Clock;
  assign drfReg4Config__CGRA_Clock = CGRA_Clock;
  assign drfReg5Config__CGRA_Clock = CGRA_Clock;
  assign drfReg6Config__CGRA_Clock = CGRA_Clock;
  assign drfReg7Config__CGRA_Clock = CGRA_Clock;
  assign reg0__CGRA_Reset = CGRA_Reset;
  assign reg1__CGRA_Reset = CGRA_Reset;
  assign reg2__CGRA_Reset = CGRA_Reset;
  assign reg3__CGRA_Reset = CGRA_Reset;
  assign reg4__CGRA_Reset = CGRA_Reset;
  assign reg5__CGRA_Reset = CGRA_Reset;
  assign reg6__CGRA_Reset = CGRA_Reset;
  assign reg7__CGRA_Reset = CGRA_Reset;
  assign drfInMux0Config__CGRA_Reset = CGRA_Reset;
  assign drfInMux1Config__CGRA_Reset = CGRA_Reset;
  assign drfInMux2Config__CGRA_Reset = CGRA_Reset;
  assign drfInMux3Config__CGRA_Reset = CGRA_Reset;
  assign drfInMux4Config__CGRA_Reset = CGRA_Reset;
  assign drfInMux5Config__CGRA_Reset = CGRA_Reset;
  assign drfInMux6Config__CGRA_Reset = CGRA_Reset;
  assign drfInMux7Config__CGRA_Reset = CGRA_Reset;
  assign drfOutMux0Config__CGRA_Reset = CGRA_Reset;
  assign drfOutMux1Config__CGRA_Reset = CGRA_Reset;
  assign drfOutMux2Config__CGRA_Reset = CGRA_Reset;
  assign drfOutMux3Config__CGRA_Reset = CGRA_Reset;
  assign drfOutMux4Config__CGRA_Reset = CGRA_Reset;
  assign drfOutMux5Config__CGRA_Reset = CGRA_Reset;
  assign drfReg0Config__CGRA_Reset = CGRA_Reset;
  assign drfReg1Config__CGRA_Reset = CGRA_Reset;
  assign drfReg2Config__CGRA_Reset = CGRA_Reset;
  assign drfReg3Config__CGRA_Reset = CGRA_Reset;
  assign drfReg4Config__CGRA_Reset = CGRA_Reset;
  assign drfReg5Config__CGRA_Reset = CGRA_Reset;
  assign drfReg6Config__CGRA_Reset = CGRA_Reset;
  assign drfReg7Config__CGRA_Reset = CGRA_Reset;
  assign reg0__CGRA_Enable = CGRA_Enable;
  assign reg1__CGRA_Enable = CGRA_Enable;
  assign reg2__CGRA_Enable = CGRA_Enable;
  assign reg3__CGRA_Enable = CGRA_Enable;
  assign reg4__CGRA_Enable = CGRA_Enable;
  assign reg5__CGRA_Enable = CGRA_Enable;
  assign reg6__CGRA_Enable = CGRA_Enable;
  assign reg7__CGRA_Enable = CGRA_Enable;
  assign drfInMux0Config__CGRA_Enable = CGRA_Enable;
  assign drfInMux1Config__CGRA_Enable = CGRA_Enable;
  assign drfInMux2Config__CGRA_Enable = CGRA_Enable;
  assign drfInMux3Config__CGRA_Enable = CGRA_Enable;
  assign drfInMux4Config__CGRA_Enable = CGRA_Enable;
  assign drfInMux5Config__CGRA_Enable = CGRA_Enable;
  assign drfInMux6Config__CGRA_Enable = CGRA_Enable;
  assign drfInMux7Config__CGRA_Enable = CGRA_Enable;
  assign drfOutMux0Config__CGRA_Enable = CGRA_Enable;
  assign drfOutMux1Config__CGRA_Enable = CGRA_Enable;
  assign drfOutMux2Config__CGRA_Enable = CGRA_Enable;
  assign drfOutMux3Config__CGRA_Enable = CGRA_Enable;
  assign drfOutMux4Config__CGRA_Enable = CGRA_Enable;
  assign drfOutMux5Config__CGRA_Enable = CGRA_Enable;
  assign drfReg0Config__CGRA_Enable = CGRA_Enable;
  assign drfReg1Config__CGRA_Enable = CGRA_Enable;
  assign drfReg2Config__CGRA_Enable = CGRA_Enable;
  assign drfReg3Config__CGRA_Enable = CGRA_Enable;
  assign drfReg4Config__CGRA_Enable = CGRA_Enable;
  assign drfReg5Config__CGRA_Enable = CGRA_Enable;
  assign drfReg6Config__CGRA_Enable = CGRA_Enable;
  assign drfReg7Config__CGRA_Enable = CGRA_Enable;
  assign drfInMux0Config__Config_Clock = Config_Clock;
  assign drfInMux1Config__Config_Clock = Config_Clock;
  assign drfInMux2Config__Config_Clock = Config_Clock;
  assign drfInMux3Config__Config_Clock = Config_Clock;
  assign drfInMux4Config__Config_Clock = Config_Clock;
  assign drfInMux5Config__Config_Clock = Config_Clock;
  assign drfInMux6Config__Config_Clock = Config_Clock;
  assign drfInMux7Config__Config_Clock = Config_Clock;
  assign drfOutMux0Config__Config_Clock = Config_Clock;
  assign drfOutMux1Config__Config_Clock = Config_Clock;
  assign drfOutMux2Config__Config_Clock = Config_Clock;
  assign drfOutMux3Config__Config_Clock = Config_Clock;
  assign drfOutMux4Config__Config_Clock = Config_Clock;
  assign drfOutMux5Config__Config_Clock = Config_Clock;
  assign drfReg0Config__Config_Clock = Config_Clock;
  assign drfReg1Config__Config_Clock = Config_Clock;
  assign drfReg2Config__Config_Clock = Config_Clock;
  assign drfReg3Config__Config_Clock = Config_Clock;
  assign drfReg4Config__Config_Clock = Config_Clock;
  assign drfReg5Config__Config_Clock = Config_Clock;
  assign drfReg6Config__Config_Clock = Config_Clock;
  assign drfReg7Config__Config_Clock = Config_Clock;
  assign drfInMux0Config__Config_Reset = Config_Reset;
  assign drfInMux1Config__Config_Reset = Config_Reset;
  assign drfInMux2Config__Config_Reset = Config_Reset;
  assign drfInMux3Config__Config_Reset = Config_Reset;
  assign drfInMux4Config__Config_Reset = Config_Reset;
  assign drfInMux5Config__Config_Reset = Config_Reset;
  assign drfInMux6Config__Config_Reset = Config_Reset;
  assign drfInMux7Config__Config_Reset = Config_Reset;
  assign drfOutMux0Config__Config_Reset = Config_Reset;
  assign drfOutMux1Config__Config_Reset = Config_Reset;
  assign drfOutMux2Config__Config_Reset = Config_Reset;
  assign drfOutMux3Config__Config_Reset = Config_Reset;
  assign drfOutMux4Config__Config_Reset = Config_Reset;
  assign drfOutMux5Config__Config_Reset = Config_Reset;
  assign drfReg0Config__Config_Reset = Config_Reset;
  assign drfReg1Config__Config_Reset = Config_Reset;
  assign drfReg2Config__Config_Reset = Config_Reset;
  assign drfReg3Config__Config_Reset = Config_Reset;
  assign drfReg4Config__Config_Reset = Config_Reset;
  assign drfReg5Config__Config_Reset = Config_Reset;
  assign drfReg6Config__Config_Reset = Config_Reset;
  assign drfReg7Config__Config_Reset = Config_Reset;
  assign drfReg0Config__Context[1:0] = Context[1:0];
  assign drfInMux0Config__Context[1:0] = Context[1:0];
  assign drfReg1Config__Context[1:0] = Context[1:0];
  assign drfInMux1Config__Context[1:0] = Context[1:0];
  assign drfReg2Config__Context[1:0] = Context[1:0];
  assign drfInMux2Config__Context[1:0] = Context[1:0];
  assign drfReg3Config__Context[1:0] = Context[1:0];
  assign drfInMux3Config__Context[1:0] = Context[1:0];
  assign drfReg4Config__Context[1:0] = Context[1:0];
  assign drfInMux4Config__Context[1:0] = Context[1:0];
  assign drfReg5Config__Context[1:0] = Context[1:0];
  assign drfInMux5Config__Context[1:0] = Context[1:0];
  assign drfReg6Config__Context[1:0] = Context[1:0];
  assign drfInMux6Config__Context[1:0] = Context[1:0];
  assign drfReg7Config__Context[1:0] = Context[1:0];
  assign drfInMux7Config__Context[1:0] = Context[1:0];
  assign drfOutMux0Config__Context[1:0] = Context[1:0];
  assign drfOutMux1Config__Context[1:0] = Context[1:0];
  assign drfOutMux2Config__Context[1:0] = Context[1:0];
  assign drfOutMux3Config__Context[1:0] = Context[1:0];
  assign drfOutMux4Config__Context[1:0] = Context[1:0];
  assign drfOutMux5Config__Context[1:0] = Context[1:0];
  assign in_mux0__in0[31:0] = in0[31:0];
  assign in_mux1__in0[31:0] = in0[31:0];
  assign in_mux2__in0[31:0] = in0[31:0];
  assign in_mux3__in0[31:0] = in0[31:0];
  assign in_mux4__in0[31:0] = in0[31:0];
  assign in_mux5__in0[31:0] = in0[31:0];
  assign in_mux6__in0[31:0] = in0[31:0];
  assign in_mux7__in0[31:0] = in0[31:0];
  assign in_mux0__in1[31:0] = in1[31:0];
  assign in_mux1__in1[31:0] = in1[31:0];
  assign in_mux2__in1[31:0] = in1[31:0];
  assign in_mux3__in1[31:0] = in1[31:0];
  assign in_mux4__in1[31:0] = in1[31:0];
  assign in_mux5__in1[31:0] = in1[31:0];
  assign in_mux6__in1[31:0] = in1[31:0];
  assign in_mux7__in1[31:0] = in1[31:0];
  assign in_mux0__in2[31:0] = in2[31:0];
  assign in_mux1__in2[31:0] = in2[31:0];
  assign in_mux2__in2[31:0] = in2[31:0];
  assign in_mux3__in2[31:0] = in2[31:0];
  assign in_mux4__in2[31:0] = in2[31:0];
  assign in_mux5__in2[31:0] = in2[31:0];
  assign in_mux6__in2[31:0] = in2[31:0];
  assign in_mux7__in2[31:0] = in2[31:0];
  assign out_mux0__in0[31:0] = reg0__out[31:0];
  assign out_mux1__in0[31:0] = reg0__out[31:0];
  assign out_mux2__in0[31:0] = reg0__out[31:0];
  assign out_mux3__in0[31:0] = reg0__out[31:0];
  assign out_mux4__in0[31:0] = reg0__out[31:0];
  assign out_mux5__in0[31:0] = reg0__out[31:0];
  assign reg0__in[31:0] = in_mux0__out[31:0];
  assign out_mux0__in1[31:0] = reg1__out[31:0];
  assign out_mux1__in1[31:0] = reg1__out[31:0];
  assign out_mux2__in1[31:0] = reg1__out[31:0];
  assign out_mux3__in1[31:0] = reg1__out[31:0];
  assign out_mux4__in1[31:0] = reg1__out[31:0];
  assign out_mux5__in1[31:0] = reg1__out[31:0];
  assign reg1__in[31:0] = in_mux1__out[31:0];
  assign out_mux0__in2[31:0] = reg2__out[31:0];
  assign out_mux1__in2[31:0] = reg2__out[31:0];
  assign out_mux2__in2[31:0] = reg2__out[31:0];
  assign out_mux3__in2[31:0] = reg2__out[31:0];
  assign out_mux4__in2[31:0] = reg2__out[31:0];
  assign out_mux5__in2[31:0] = reg2__out[31:0];
  assign reg2__in[31:0] = in_mux2__out[31:0];
  assign out_mux0__in3[31:0] = reg3__out[31:0];
  assign out_mux1__in3[31:0] = reg3__out[31:0];
  assign out_mux2__in3[31:0] = reg3__out[31:0];
  assign out_mux3__in3[31:0] = reg3__out[31:0];
  assign out_mux4__in3[31:0] = reg3__out[31:0];
  assign out_mux5__in3[31:0] = reg3__out[31:0];
  assign reg3__in[31:0] = in_mux3__out[31:0];
  assign out_mux0__in4[31:0] = reg4__out[31:0];
  assign out_mux1__in4[31:0] = reg4__out[31:0];
  assign out_mux2__in4[31:0] = reg4__out[31:0];
  assign out_mux3__in4[31:0] = reg4__out[31:0];
  assign out_mux4__in4[31:0] = reg4__out[31:0];
  assign out_mux5__in4[31:0] = reg4__out[31:0];
  assign reg4__in[31:0] = in_mux4__out[31:0];
  assign out_mux0__in5[31:0] = reg5__out[31:0];
  assign out_mux1__in5[31:0] = reg5__out[31:0];
  assign out_mux2__in5[31:0] = reg5__out[31:0];
  assign out_mux3__in5[31:0] = reg5__out[31:0];
  assign out_mux4__in5[31:0] = reg5__out[31:0];
  assign out_mux5__in5[31:0] = reg5__out[31:0];
  assign reg5__in[31:0] = in_mux5__out[31:0];
  assign out_mux0__in6[31:0] = reg6__out[31:0];
  assign out_mux1__in6[31:0] = reg6__out[31:0];
  assign out_mux2__in6[31:0] = reg6__out[31:0];
  assign out_mux3__in6[31:0] = reg6__out[31:0];
  assign out_mux4__in6[31:0] = reg6__out[31:0];
  assign out_mux5__in6[31:0] = reg6__out[31:0];
  assign reg6__in[31:0] = in_mux6__out[31:0];
  assign out_mux0__in7[31:0] = reg7__out[31:0];
  assign out_mux1__in7[31:0] = reg7__out[31:0];
  assign out_mux2__in7[31:0] = reg7__out[31:0];
  assign out_mux3__in7[31:0] = reg7__out[31:0];
  assign out_mux4__in7[31:0] = reg7__out[31:0];
  assign out_mux5__in7[31:0] = reg7__out[31:0];
  assign reg7__in[31:0] = in_mux7__out[31:0];
  assign out0[31:0] = out_mux0__out[31:0];
  assign out1[31:0] = out_mux1__out[31:0];
  assign out2[31:0] = out_mux2__out[31:0];
  assign out3[31:0] = out_mux3__out[31:0];
  assign out4[31:0] = out_mux4__out[31:0];
  assign out5[31:0] = out_mux5__out[31:0];
  assign in_mux0__select[1:0] = drfInMux0Config__select[1:0];
  assign in_mux1__select[1:0] = drfInMux1Config__select[1:0];
  assign in_mux2__select[1:0] = drfInMux2Config__select[1:0];
  assign in_mux3__select[1:0] = drfInMux3Config__select[1:0];
  assign in_mux4__select[1:0] = drfInMux4Config__select[1:0];
  assign in_mux5__select[1:0] = drfInMux5Config__select[1:0];
  assign in_mux6__select[1:0] = drfInMux6Config__select[1:0];
  assign in_mux7__select[1:0] = drfInMux7Config__select[1:0];
  assign out_mux0__select[2:0] = drfOutMux0Config__select[2:0];
  assign out_mux1__select[2:0] = drfOutMux1Config__select[2:0];
  assign out_mux2__select[2:0] = drfOutMux2Config__select[2:0];
  assign out_mux3__select[2:0] = drfOutMux3Config__select[2:0];
  assign out_mux4__select[2:0] = drfOutMux4Config__select[2:0];
  assign out_mux5__select[2:0] = drfOutMux5Config__select[2:0];
  assign reg0__enable[0:0] = drfReg0Config__select[0:0];
  assign reg1__enable[0:0] = drfReg1Config__select[0:0];
  assign reg2__enable[0:0] = drfReg2Config__select[0:0];
  assign reg3__enable[0:0] = drfReg3Config__select[0:0];
  assign reg4__enable[0:0] = drfReg4Config__select[0:0];
  assign reg5__enable[0:0] = drfReg5Config__select[0:0];
  assign reg6__enable[0:0] = drfReg6Config__select[0:0];
  assign reg7__enable[0:0] = drfReg7Config__select[0:0];
  assign drfInMux0Config__ConfigIn = ConfigIn;
  assign drfInMux1Config__ConfigIn = drfInMux0Config__ConfigOut;
  assign drfInMux2Config__ConfigIn = drfInMux1Config__ConfigOut;
  assign drfInMux3Config__ConfigIn = drfInMux2Config__ConfigOut;
  assign drfInMux4Config__ConfigIn = drfInMux3Config__ConfigOut;
  assign drfInMux5Config__ConfigIn = drfInMux4Config__ConfigOut;
  assign drfInMux6Config__ConfigIn = drfInMux5Config__ConfigOut;
  assign drfInMux7Config__ConfigIn = drfInMux6Config__ConfigOut;
  assign drfOutMux0Config__ConfigIn = drfInMux7Config__ConfigOut;
  assign drfOutMux1Config__ConfigIn = drfOutMux0Config__ConfigOut;
  assign drfOutMux2Config__ConfigIn = drfOutMux1Config__ConfigOut;
  assign drfOutMux3Config__ConfigIn = drfOutMux2Config__ConfigOut;
  assign drfOutMux4Config__ConfigIn = drfOutMux3Config__ConfigOut;
  assign drfOutMux5Config__ConfigIn = drfOutMux4Config__ConfigOut;
  assign drfReg0Config__ConfigIn = drfOutMux5Config__ConfigOut;
  assign drfReg1Config__ConfigIn = drfReg0Config__ConfigOut;
  assign drfReg2Config__ConfigIn = drfReg1Config__ConfigOut;
  assign drfReg3Config__ConfigIn = drfReg2Config__ConfigOut;
  assign drfReg4Config__ConfigIn = drfReg3Config__ConfigOut;
  assign drfReg5Config__ConfigIn = drfReg4Config__ConfigOut;
  assign drfReg6Config__ConfigIn = drfReg5Config__ConfigOut;
  assign drfReg7Config__ConfigIn = drfReg6Config__ConfigOut;
  assign ConfigOut = drfReg7Config__ConfigOut;

endmodule //registerFile_3in_6out_32b_U3

module registerFile_1in_2out_32b_U9 (
  input  CGRA_Clock,
  input  CGRA_Enable,
  input  CGRA_Reset,
  input  ConfigIn,
  output  ConfigOut,
  input  Config_Clock,
  input  Config_Reset,
  input [1:0] Context,
  input [31:0] in0,
  output [31:0] out0,
  output [31:0] out1
);
  //Wire declarations for instance 'out_mux0' (Module cgrame_mux_2to1_32b)
  wire [31:0] out_mux0__in0;
  wire [31:0] out_mux0__in1;
  wire [31:0] out_mux0__out;
  wire [0:0] out_mux0__select;
  cgrame_mux_2to1_32b #(.contexts(3),.size(32)) out_mux0(
    .in0(out_mux0__in0),
    .in1(out_mux0__in1),
    .out(out_mux0__out),
    .select(out_mux0__select)
  );

  //Wire declarations for instance 'out_mux1' (Module cgrame_mux_2to1_32b)
  wire [31:0] out_mux1__in0;
  wire [31:0] out_mux1__in1;
  wire [31:0] out_mux1__out;
  wire [0:0] out_mux1__select;
  cgrame_mux_2to1_32b #(.contexts(3),.size(32)) out_mux1(
    .in0(out_mux1__in0),
    .in1(out_mux1__in1),
    .out(out_mux1__out),
    .select(out_mux1__select)
  );

  //Wire declarations for instance 'reg0' (Module cgrame_register_32b)
  wire  reg0__CGRA_Clock;
  wire  reg0__CGRA_Enable;
  wire  reg0__CGRA_Reset;
  wire [0:0] reg0__enable;
  wire [31:0] reg0__in;
  wire [31:0] reg0__out;
  cgrame_register_32b #(.contexts(3),.size(32)) reg0(
    .CGRA_Clock(reg0__CGRA_Clock),
    .CGRA_Enable(reg0__CGRA_Enable),
    .CGRA_Reset(reg0__CGRA_Reset),
    .enable(reg0__enable),
    .in(reg0__in),
    .out(reg0__out)
  );

  //Wire declarations for instance 'reg1' (Module cgrame_register_32b)
  wire  reg1__CGRA_Clock;
  wire  reg1__CGRA_Enable;
  wire  reg1__CGRA_Reset;
  wire [0:0] reg1__enable;
  wire [31:0] reg1__in;
  wire [31:0] reg1__out;
  cgrame_register_32b #(.contexts(3),.size(32)) reg1(
    .CGRA_Clock(reg1__CGRA_Clock),
    .CGRA_Enable(reg1__CGRA_Enable),
    .CGRA_Reset(reg1__CGRA_Reset),
    .enable(reg1__enable),
    .in(reg1__in),
    .out(reg1__out)
  );

  //Wire declarations for instance 'rf_c0_r1OutMux0Config' (Module cgrame_configcell_context_II_3_1_size1)
  wire  rf_c0_r1OutMux0Config__CGRA_Clock;
  wire  rf_c0_r1OutMux0Config__CGRA_Enable;
  wire  rf_c0_r1OutMux0Config__CGRA_Reset;
  wire  rf_c0_r1OutMux0Config__ConfigIn;
  wire  rf_c0_r1OutMux0Config__ConfigOut;
  wire  rf_c0_r1OutMux0Config__Config_Clock;
  wire  rf_c0_r1OutMux0Config__Config_Reset;
  wire [1:0] rf_c0_r1OutMux0Config__Context;
  wire [0:0] rf_c0_r1OutMux0Config__select;
  cgrame_configcell_context_II_3_1_size1 #(.contexts(3),.size(1)) rf_c0_r1OutMux0Config(
    .CGRA_Clock(rf_c0_r1OutMux0Config__CGRA_Clock),
    .CGRA_Enable(rf_c0_r1OutMux0Config__CGRA_Enable),
    .CGRA_Reset(rf_c0_r1OutMux0Config__CGRA_Reset),
    .ConfigIn(rf_c0_r1OutMux0Config__ConfigIn),
    .ConfigOut(rf_c0_r1OutMux0Config__ConfigOut),
    .Config_Clock(rf_c0_r1OutMux0Config__Config_Clock),
    .Config_Reset(rf_c0_r1OutMux0Config__Config_Reset),
    .Context(rf_c0_r1OutMux0Config__Context),
    .select(rf_c0_r1OutMux0Config__select)
  );

  //Wire declarations for instance 'rf_c0_r1OutMux1Config' (Module cgrame_configcell_context_II_3_1_size1)
  wire  rf_c0_r1OutMux1Config__CGRA_Clock;
  wire  rf_c0_r1OutMux1Config__CGRA_Enable;
  wire  rf_c0_r1OutMux1Config__CGRA_Reset;
  wire  rf_c0_r1OutMux1Config__ConfigIn;
  wire  rf_c0_r1OutMux1Config__ConfigOut;
  wire  rf_c0_r1OutMux1Config__Config_Clock;
  wire  rf_c0_r1OutMux1Config__Config_Reset;
  wire [1:0] rf_c0_r1OutMux1Config__Context;
  wire [0:0] rf_c0_r1OutMux1Config__select;
  cgrame_configcell_context_II_3_1_size1 #(.contexts(3),.size(1)) rf_c0_r1OutMux1Config(
    .CGRA_Clock(rf_c0_r1OutMux1Config__CGRA_Clock),
    .CGRA_Enable(rf_c0_r1OutMux1Config__CGRA_Enable),
    .CGRA_Reset(rf_c0_r1OutMux1Config__CGRA_Reset),
    .ConfigIn(rf_c0_r1OutMux1Config__ConfigIn),
    .ConfigOut(rf_c0_r1OutMux1Config__ConfigOut),
    .Config_Clock(rf_c0_r1OutMux1Config__Config_Clock),
    .Config_Reset(rf_c0_r1OutMux1Config__Config_Reset),
    .Context(rf_c0_r1OutMux1Config__Context),
    .select(rf_c0_r1OutMux1Config__select)
  );

  //Wire declarations for instance 'rf_c0_r1Reg0Config' (Module cgrame_configcell_context_II_3_1_size1)
  wire  rf_c0_r1Reg0Config__CGRA_Clock;
  wire  rf_c0_r1Reg0Config__CGRA_Enable;
  wire  rf_c0_r1Reg0Config__CGRA_Reset;
  wire  rf_c0_r1Reg0Config__ConfigIn;
  wire  rf_c0_r1Reg0Config__ConfigOut;
  wire  rf_c0_r1Reg0Config__Config_Clock;
  wire  rf_c0_r1Reg0Config__Config_Reset;
  wire [1:0] rf_c0_r1Reg0Config__Context;
  wire [0:0] rf_c0_r1Reg0Config__select;
  cgrame_configcell_context_II_3_1_size1 #(.contexts(3),.size(1)) rf_c0_r1Reg0Config(
    .CGRA_Clock(rf_c0_r1Reg0Config__CGRA_Clock),
    .CGRA_Enable(rf_c0_r1Reg0Config__CGRA_Enable),
    .CGRA_Reset(rf_c0_r1Reg0Config__CGRA_Reset),
    .ConfigIn(rf_c0_r1Reg0Config__ConfigIn),
    .ConfigOut(rf_c0_r1Reg0Config__ConfigOut),
    .Config_Clock(rf_c0_r1Reg0Config__Config_Clock),
    .Config_Reset(rf_c0_r1Reg0Config__Config_Reset),
    .Context(rf_c0_r1Reg0Config__Context),
    .select(rf_c0_r1Reg0Config__select)
  );

  //Wire declarations for instance 'rf_c0_r1Reg1Config' (Module cgrame_configcell_context_II_3_1_size1)
  wire  rf_c0_r1Reg1Config__CGRA_Clock;
  wire  rf_c0_r1Reg1Config__CGRA_Enable;
  wire  rf_c0_r1Reg1Config__CGRA_Reset;
  wire  rf_c0_r1Reg1Config__ConfigIn;
  wire  rf_c0_r1Reg1Config__ConfigOut;
  wire  rf_c0_r1Reg1Config__Config_Clock;
  wire  rf_c0_r1Reg1Config__Config_Reset;
  wire [1:0] rf_c0_r1Reg1Config__Context;
  wire [0:0] rf_c0_r1Reg1Config__select;
  cgrame_configcell_context_II_3_1_size1 #(.contexts(3),.size(1)) rf_c0_r1Reg1Config(
    .CGRA_Clock(rf_c0_r1Reg1Config__CGRA_Clock),
    .CGRA_Enable(rf_c0_r1Reg1Config__CGRA_Enable),
    .CGRA_Reset(rf_c0_r1Reg1Config__CGRA_Reset),
    .ConfigIn(rf_c0_r1Reg1Config__ConfigIn),
    .ConfigOut(rf_c0_r1Reg1Config__ConfigOut),
    .Config_Clock(rf_c0_r1Reg1Config__Config_Clock),
    .Config_Reset(rf_c0_r1Reg1Config__Config_Reset),
    .Context(rf_c0_r1Reg1Config__Context),
    .select(rf_c0_r1Reg1Config__select)
  );

  //All the connections
  assign reg0__CGRA_Clock = CGRA_Clock;
  assign reg1__CGRA_Clock = CGRA_Clock;
  assign rf_c0_r1OutMux0Config__CGRA_Clock = CGRA_Clock;
  assign rf_c0_r1OutMux1Config__CGRA_Clock = CGRA_Clock;
  assign rf_c0_r1Reg0Config__CGRA_Clock = CGRA_Clock;
  assign rf_c0_r1Reg1Config__CGRA_Clock = CGRA_Clock;
  assign reg0__CGRA_Reset = CGRA_Reset;
  assign reg1__CGRA_Reset = CGRA_Reset;
  assign rf_c0_r1OutMux0Config__CGRA_Reset = CGRA_Reset;
  assign rf_c0_r1OutMux1Config__CGRA_Reset = CGRA_Reset;
  assign rf_c0_r1Reg0Config__CGRA_Reset = CGRA_Reset;
  assign rf_c0_r1Reg1Config__CGRA_Reset = CGRA_Reset;
  assign reg0__CGRA_Enable = CGRA_Enable;
  assign reg1__CGRA_Enable = CGRA_Enable;
  assign rf_c0_r1OutMux0Config__CGRA_Enable = CGRA_Enable;
  assign rf_c0_r1OutMux1Config__CGRA_Enable = CGRA_Enable;
  assign rf_c0_r1Reg0Config__CGRA_Enable = CGRA_Enable;
  assign rf_c0_r1Reg1Config__CGRA_Enable = CGRA_Enable;
  assign rf_c0_r1OutMux0Config__Config_Clock = Config_Clock;
  assign rf_c0_r1OutMux1Config__Config_Clock = Config_Clock;
  assign rf_c0_r1Reg0Config__Config_Clock = Config_Clock;
  assign rf_c0_r1Reg1Config__Config_Clock = Config_Clock;
  assign rf_c0_r1OutMux0Config__Config_Reset = Config_Reset;
  assign rf_c0_r1OutMux1Config__Config_Reset = Config_Reset;
  assign rf_c0_r1Reg0Config__Config_Reset = Config_Reset;
  assign rf_c0_r1Reg1Config__Config_Reset = Config_Reset;
  assign rf_c0_r1Reg0Config__Context[1:0] = Context[1:0];
  assign rf_c0_r1Reg1Config__Context[1:0] = Context[1:0];
  assign rf_c0_r1OutMux0Config__Context[1:0] = Context[1:0];
  assign rf_c0_r1OutMux1Config__Context[1:0] = Context[1:0];
  assign reg0__in[31:0] = in0[31:0];
  assign reg1__in[31:0] = in0[31:0];
  assign out_mux0__in0[31:0] = reg0__out[31:0];
  assign out_mux1__in0[31:0] = reg0__out[31:0];
  assign out_mux0__in1[31:0] = reg1__out[31:0];
  assign out_mux1__in1[31:0] = reg1__out[31:0];
  assign out0[31:0] = out_mux0__out[31:0];
  assign out1[31:0] = out_mux1__out[31:0];
  assign out_mux0__select[0:0] = rf_c0_r1OutMux0Config__select[0:0];
  assign out_mux1__select[0:0] = rf_c0_r1OutMux1Config__select[0:0];
  assign reg0__enable[0:0] = rf_c0_r1Reg0Config__select[0:0];
  assign reg1__enable[0:0] = rf_c0_r1Reg1Config__select[0:0];
  assign rf_c0_r1OutMux0Config__ConfigIn = ConfigIn;
  assign rf_c0_r1OutMux1Config__ConfigIn = rf_c0_r1OutMux0Config__ConfigOut;
  assign rf_c0_r1Reg0Config__ConfigIn = rf_c0_r1OutMux1Config__ConfigOut;
  assign rf_c0_r1Reg1Config__ConfigIn = rf_c0_r1Reg0Config__ConfigOut;
  assign ConfigOut = rf_c0_r1Reg1Config__ConfigOut;

endmodule //registerFile_1in_2out_32b_U9

module cgrame_tristate_32b #(parameter contexts=1, parameter size=1) (
  enable,
  in,
  out,
  bidir_in,
  bidir_out
);
    input [0:0] enable;
    input [size-1:0] in;
    output [size-1:0] out;
    input [size-1:0] bidir_in;
    output [size-1:0] bidir_out;
    assign out = enable ? in : bidir_in;
    assign bidir_out = out;

endmodule //cgrame_tristate_32b

module io_32b_U6 (
  input  CGRA_Clock,
  input  CGRA_Enable,
  input  CGRA_Reset,
  input  ConfigIn,
  output  ConfigOut,
  input  Config_Clock,
  input  Config_Reset,
  input [1:0] Context,
  input [31:0] IOPin_bidir_in,
  output [31:0] IOPin_bidir_out,
  input [31:0] in,
  output [31:0] out
);
  //Wire declarations for instance 'IOPin' (Module cgrame_tristate_32b)
  wire [31:0] IOPin__bidir_in;
  wire [31:0] IOPin__bidir_out;
  wire [0:0] IOPin__enable;
  wire [31:0] IOPin__in;
  wire [31:0] IOPin__out;
  cgrame_tristate_32b #(.contexts(3),.size(32)) IOPin(
    .bidir_in(IOPin__bidir_in),
    .bidir_out(IOPin__bidir_out),
    .enable(IOPin__enable),
    .in(IOPin__in),
    .out(IOPin__out)
  );

  //Wire declarations for instance 'IOPinConfig' (Module cgrame_configcell_context_II_3_1_size1)
  wire  IOPinConfig__CGRA_Clock;
  wire  IOPinConfig__CGRA_Enable;
  wire  IOPinConfig__CGRA_Reset;
  wire  IOPinConfig__ConfigIn;
  wire  IOPinConfig__ConfigOut;
  wire  IOPinConfig__Config_Clock;
  wire  IOPinConfig__Config_Reset;
  wire [1:0] IOPinConfig__Context;
  wire [0:0] IOPinConfig__select;
  cgrame_configcell_context_II_3_1_size1 #(.contexts(3),.size(1)) IOPinConfig(
    .CGRA_Clock(IOPinConfig__CGRA_Clock),
    .CGRA_Enable(IOPinConfig__CGRA_Enable),
    .CGRA_Reset(IOPinConfig__CGRA_Reset),
    .ConfigIn(IOPinConfig__ConfigIn),
    .ConfigOut(IOPinConfig__ConfigOut),
    .Config_Clock(IOPinConfig__Config_Clock),
    .Config_Reset(IOPinConfig__Config_Reset),
    .Context(IOPinConfig__Context),
    .select(IOPinConfig__select)
  );

  //Wire declarations for instance 'RegInConfig' (Module cgrame_configcell_context_II_3_1_size1)
  wire  RegInConfig__CGRA_Clock;
  wire  RegInConfig__CGRA_Enable;
  wire  RegInConfig__CGRA_Reset;
  wire  RegInConfig__ConfigIn;
  wire  RegInConfig__ConfigOut;
  wire  RegInConfig__Config_Clock;
  wire  RegInConfig__Config_Reset;
  wire [1:0] RegInConfig__Context;
  wire [0:0] RegInConfig__select;
  cgrame_configcell_context_II_3_1_size1 #(.contexts(3),.size(1)) RegInConfig(
    .CGRA_Clock(RegInConfig__CGRA_Clock),
    .CGRA_Enable(RegInConfig__CGRA_Enable),
    .CGRA_Reset(RegInConfig__CGRA_Reset),
    .ConfigIn(RegInConfig__ConfigIn),
    .ConfigOut(RegInConfig__ConfigOut),
    .Config_Clock(RegInConfig__Config_Clock),
    .Config_Reset(RegInConfig__Config_Reset),
    .Context(RegInConfig__Context),
    .select(RegInConfig__select)
  );

  //Wire declarations for instance 'RegOutConfig' (Module cgrame_configcell_context_II_3_1_size1)
  wire  RegOutConfig__CGRA_Clock;
  wire  RegOutConfig__CGRA_Enable;
  wire  RegOutConfig__CGRA_Reset;
  wire  RegOutConfig__ConfigIn;
  wire  RegOutConfig__ConfigOut;
  wire  RegOutConfig__Config_Clock;
  wire  RegOutConfig__Config_Reset;
  wire [1:0] RegOutConfig__Context;
  wire [0:0] RegOutConfig__select;
  cgrame_configcell_context_II_3_1_size1 #(.contexts(3),.size(1)) RegOutConfig(
    .CGRA_Clock(RegOutConfig__CGRA_Clock),
    .CGRA_Enable(RegOutConfig__CGRA_Enable),
    .CGRA_Reset(RegOutConfig__CGRA_Reset),
    .ConfigIn(RegOutConfig__ConfigIn),
    .ConfigOut(RegOutConfig__ConfigOut),
    .Config_Clock(RegOutConfig__Config_Clock),
    .Config_Reset(RegOutConfig__Config_Reset),
    .Context(RegOutConfig__Context),
    .select(RegOutConfig__select)
  );

  //Wire declarations for instance 'reg_in' (Module cgrame_register_32b)
  wire  reg_in__CGRA_Clock;
  wire  reg_in__CGRA_Enable;
  wire  reg_in__CGRA_Reset;
  wire [0:0] reg_in__enable;
  wire [31:0] reg_in__in;
  wire [31:0] reg_in__out;
  cgrame_register_32b #(.contexts(3),.size(32)) reg_in(
    .CGRA_Clock(reg_in__CGRA_Clock),
    .CGRA_Enable(reg_in__CGRA_Enable),
    .CGRA_Reset(reg_in__CGRA_Reset),
    .enable(reg_in__enable),
    .in(reg_in__in),
    .out(reg_in__out)
  );

  //Wire declarations for instance 'reg_out' (Module cgrame_register_32b)
  wire  reg_out__CGRA_Clock;
  wire  reg_out__CGRA_Enable;
  wire  reg_out__CGRA_Reset;
  wire [0:0] reg_out__enable;
  wire [31:0] reg_out__in;
  wire [31:0] reg_out__out;
  cgrame_register_32b #(.contexts(3),.size(32)) reg_out(
    .CGRA_Clock(reg_out__CGRA_Clock),
    .CGRA_Enable(reg_out__CGRA_Enable),
    .CGRA_Reset(reg_out__CGRA_Reset),
    .enable(reg_out__enable),
    .in(reg_out__in),
    .out(reg_out__out)
  );

  //All the connections
  assign reg_in__CGRA_Clock = CGRA_Clock;
  assign reg_out__CGRA_Clock = CGRA_Clock;
  assign IOPinConfig__CGRA_Clock = CGRA_Clock;
  assign RegInConfig__CGRA_Clock = CGRA_Clock;
  assign RegOutConfig__CGRA_Clock = CGRA_Clock;
  assign reg_in__CGRA_Reset = CGRA_Reset;
  assign reg_out__CGRA_Reset = CGRA_Reset;
  assign IOPinConfig__CGRA_Reset = CGRA_Reset;
  assign RegInConfig__CGRA_Reset = CGRA_Reset;
  assign RegOutConfig__CGRA_Reset = CGRA_Reset;
  assign reg_in__CGRA_Enable = CGRA_Enable;
  assign reg_out__CGRA_Enable = CGRA_Enable;
  assign IOPinConfig__CGRA_Enable = CGRA_Enable;
  assign RegInConfig__CGRA_Enable = CGRA_Enable;
  assign RegOutConfig__CGRA_Enable = CGRA_Enable;
  assign IOPinConfig__Config_Clock = Config_Clock;
  assign RegInConfig__Config_Clock = Config_Clock;
  assign RegOutConfig__Config_Clock = Config_Clock;
  assign IOPinConfig__Config_Reset = Config_Reset;
  assign RegInConfig__Config_Reset = Config_Reset;
  assign RegOutConfig__Config_Reset = Config_Reset;
  assign reg_out__in[31:0] = IOPin__out[31:0];
  assign IOPin__in[31:0] = reg_in__out[31:0];
  assign IOPinConfig__Context[1:0] = Context[1:0];
  assign RegInConfig__Context[1:0] = Context[1:0];
  assign RegOutConfig__Context[1:0] = Context[1:0];
  assign out[31:0] = reg_out__out[31:0];
  assign reg_in__in[31:0] = in[31:0];
  assign IOPin__enable[0:0] = IOPinConfig__select[0:0];
  assign reg_in__enable[0:0] = RegInConfig__select[0:0];
  assign reg_out__enable[0:0] = RegOutConfig__select[0:0];
  assign IOPinConfig__ConfigIn = ConfigIn;
  assign RegInConfig__ConfigIn = IOPinConfig__ConfigOut;
  assign RegOutConfig__ConfigIn = RegInConfig__ConfigOut;
  assign ConfigOut = RegOutConfig__ConfigOut;
  assign IOPin__bidir_in[31:0] = IOPin_bidir_in[31:0];
  assign IOPin_bidir_out[31:0] = IOPin__bidir_out[31:0];

endmodule //io_32b_U6

module cgra_U0 (
  input  CGRA_Clock,
  input  CGRA_Enable,
  input  CGRA_Reset,
  input  ConfigIn,
  output  ConfigOut,
  input  Config_Clock,
  input  Config_Reset,
  input [31:0] io_top_0_IOPin_bidir_in,
  output [31:0] io_top_0_IOPin_bidir_out,
  input [31:0] io_top_1_IOPin_bidir_in,
  output [31:0] io_top_1_IOPin_bidir_out,
  input [31:0] io_top_2_IOPin_bidir_in,
  output [31:0] io_top_2_IOPin_bidir_out
);
  //Wire declarations for instance 'context_cell' (Module contextcell_U1)
  wire  context_cell__CGRA_Clock;
  wire  context_cell__CGRA_Enable;
  wire  context_cell__CGRA_Reset;
  wire  context_cell__ConfigIn;
  wire  context_cell__ConfigOut;
  wire  context_cell__Config_Clock;
  wire  context_cell__Config_Reset;
  wire [1:0] context_cell__Context_Used;
  contextcell_U1 context_cell(
    .CGRA_Clock(context_cell__CGRA_Clock),
    .CGRA_Enable(context_cell__CGRA_Enable),
    .CGRA_Reset(context_cell__CGRA_Reset),
    .ConfigIn(context_cell__ConfigIn),
    .ConfigOut(context_cell__ConfigOut),
    .Config_Clock(context_cell__Config_Clock),
    .Config_Reset(context_cell__Config_Reset),
    .Context_Used(context_cell__Context_Used)
  );

  //Wire declarations for instance 'context_counter_drf' (Module cgrame_contextcounter)
  wire  context_counter_drf__CGRA_Clock;
  wire  context_counter_drf__CGRA_Enable;
  wire  context_counter_drf__CGRA_Reset;
  wire [1:0] context_counter_drf__Context;
  wire [1:0] context_counter_drf__Context_Used;
  cgrame_contextcounter #(.contexts(3),.size(0)) context_counter_drf(
    .CGRA_Clock(context_counter_drf__CGRA_Clock),
    .CGRA_Enable(context_counter_drf__CGRA_Enable),
    .CGRA_Reset(context_counter_drf__CGRA_Reset),
    .Context(context_counter_drf__Context),
    .Context_Used(context_counter_drf__Context_Used)
  );

  //Wire declarations for instance 'context_counter_io0' (Module cgrame_contextcounter)
  wire  context_counter_io0__CGRA_Clock;
  wire  context_counter_io0__CGRA_Enable;
  wire  context_counter_io0__CGRA_Reset;
  wire [1:0] context_counter_io0__Context;
  wire [1:0] context_counter_io0__Context_Used;
  cgrame_contextcounter #(.contexts(3),.size(0)) context_counter_io0(
    .CGRA_Clock(context_counter_io0__CGRA_Clock),
    .CGRA_Enable(context_counter_io0__CGRA_Enable),
    .CGRA_Reset(context_counter_io0__CGRA_Reset),
    .Context(context_counter_io0__Context),
    .Context_Used(context_counter_io0__Context_Used)
  );

  //Wire declarations for instance 'context_counter_io1' (Module cgrame_contextcounter)
  wire  context_counter_io1__CGRA_Clock;
  wire  context_counter_io1__CGRA_Enable;
  wire  context_counter_io1__CGRA_Reset;
  wire [1:0] context_counter_io1__Context;
  wire [1:0] context_counter_io1__Context_Used;
  cgrame_contextcounter #(.contexts(3),.size(0)) context_counter_io1(
    .CGRA_Clock(context_counter_io1__CGRA_Clock),
    .CGRA_Enable(context_counter_io1__CGRA_Enable),
    .CGRA_Reset(context_counter_io1__CGRA_Reset),
    .Context(context_counter_io1__Context),
    .Context_Used(context_counter_io1__Context_Used)
  );

  //Wire declarations for instance 'context_counter_io2' (Module cgrame_contextcounter)
  wire  context_counter_io2__CGRA_Clock;
  wire  context_counter_io2__CGRA_Enable;
  wire  context_counter_io2__CGRA_Reset;
  wire [1:0] context_counter_io2__Context;
  wire [1:0] context_counter_io2__Context_Used;
  cgrame_contextcounter #(.contexts(3),.size(0)) context_counter_io2(
    .CGRA_Clock(context_counter_io2__CGRA_Clock),
    .CGRA_Enable(context_counter_io2__CGRA_Enable),
    .CGRA_Reset(context_counter_io2__CGRA_Reset),
    .Context(context_counter_io2__Context),
    .Context_Used(context_counter_io2__Context_Used)
  );

  //Wire declarations for instance 'context_counter_mem0' (Module cgrame_contextcounter)
  wire  context_counter_mem0__CGRA_Clock;
  wire  context_counter_mem0__CGRA_Enable;
  wire  context_counter_mem0__CGRA_Reset;
  wire [1:0] context_counter_mem0__Context;
  wire [1:0] context_counter_mem0__Context_Used;
  cgrame_contextcounter #(.contexts(3),.size(0)) context_counter_mem0(
    .CGRA_Clock(context_counter_mem0__CGRA_Clock),
    .CGRA_Enable(context_counter_mem0__CGRA_Enable),
    .CGRA_Reset(context_counter_mem0__CGRA_Reset),
    .Context(context_counter_mem0__Context),
    .Context_Used(context_counter_mem0__Context_Used)
  );

  //Wire declarations for instance 'context_counter_mem1' (Module cgrame_contextcounter)
  wire  context_counter_mem1__CGRA_Clock;
  wire  context_counter_mem1__CGRA_Enable;
  wire  context_counter_mem1__CGRA_Reset;
  wire [1:0] context_counter_mem1__Context;
  wire [1:0] context_counter_mem1__Context_Used;
  cgrame_contextcounter #(.contexts(3),.size(0)) context_counter_mem1(
    .CGRA_Clock(context_counter_mem1__CGRA_Clock),
    .CGRA_Enable(context_counter_mem1__CGRA_Enable),
    .CGRA_Reset(context_counter_mem1__CGRA_Reset),
    .Context(context_counter_mem1__Context),
    .Context_Used(context_counter_mem1__Context_Used)
  );

  //Wire declarations for instance 'context_counter_mem2' (Module cgrame_contextcounter)
  wire  context_counter_mem2__CGRA_Clock;
  wire  context_counter_mem2__CGRA_Enable;
  wire  context_counter_mem2__CGRA_Reset;
  wire [1:0] context_counter_mem2__Context;
  wire [1:0] context_counter_mem2__Context_Used;
  cgrame_contextcounter #(.contexts(3),.size(0)) context_counter_mem2(
    .CGRA_Clock(context_counter_mem2__CGRA_Clock),
    .CGRA_Enable(context_counter_mem2__CGRA_Enable),
    .CGRA_Reset(context_counter_mem2__CGRA_Reset),
    .Context(context_counter_mem2__Context),
    .Context_Used(context_counter_mem2__Context_Used)
  );

  //Wire declarations for instance 'context_counter_pe_c0_r0' (Module cgrame_contextcounter)
  wire  context_counter_pe_c0_r0__CGRA_Clock;
  wire  context_counter_pe_c0_r0__CGRA_Enable;
  wire  context_counter_pe_c0_r0__CGRA_Reset;
  wire [1:0] context_counter_pe_c0_r0__Context;
  wire [1:0] context_counter_pe_c0_r0__Context_Used;
  cgrame_contextcounter #(.contexts(3),.size(0)) context_counter_pe_c0_r0(
    .CGRA_Clock(context_counter_pe_c0_r0__CGRA_Clock),
    .CGRA_Enable(context_counter_pe_c0_r0__CGRA_Enable),
    .CGRA_Reset(context_counter_pe_c0_r0__CGRA_Reset),
    .Context(context_counter_pe_c0_r0__Context),
    .Context_Used(context_counter_pe_c0_r0__Context_Used)
  );

  //Wire declarations for instance 'context_counter_pe_c0_r1' (Module cgrame_contextcounter)
  wire  context_counter_pe_c0_r1__CGRA_Clock;
  wire  context_counter_pe_c0_r1__CGRA_Enable;
  wire  context_counter_pe_c0_r1__CGRA_Reset;
  wire [1:0] context_counter_pe_c0_r1__Context;
  wire [1:0] context_counter_pe_c0_r1__Context_Used;
  cgrame_contextcounter #(.contexts(3),.size(0)) context_counter_pe_c0_r1(
    .CGRA_Clock(context_counter_pe_c0_r1__CGRA_Clock),
    .CGRA_Enable(context_counter_pe_c0_r1__CGRA_Enable),
    .CGRA_Reset(context_counter_pe_c0_r1__CGRA_Reset),
    .Context(context_counter_pe_c0_r1__Context),
    .Context_Used(context_counter_pe_c0_r1__Context_Used)
  );

  //Wire declarations for instance 'context_counter_pe_c0_r2' (Module cgrame_contextcounter)
  wire  context_counter_pe_c0_r2__CGRA_Clock;
  wire  context_counter_pe_c0_r2__CGRA_Enable;
  wire  context_counter_pe_c0_r2__CGRA_Reset;
  wire [1:0] context_counter_pe_c0_r2__Context;
  wire [1:0] context_counter_pe_c0_r2__Context_Used;
  cgrame_contextcounter #(.contexts(3),.size(0)) context_counter_pe_c0_r2(
    .CGRA_Clock(context_counter_pe_c0_r2__CGRA_Clock),
    .CGRA_Enable(context_counter_pe_c0_r2__CGRA_Enable),
    .CGRA_Reset(context_counter_pe_c0_r2__CGRA_Reset),
    .Context(context_counter_pe_c0_r2__Context),
    .Context_Used(context_counter_pe_c0_r2__Context_Used)
  );

  //Wire declarations for instance 'context_counter_pe_c1_r0' (Module cgrame_contextcounter)
  wire  context_counter_pe_c1_r0__CGRA_Clock;
  wire  context_counter_pe_c1_r0__CGRA_Enable;
  wire  context_counter_pe_c1_r0__CGRA_Reset;
  wire [1:0] context_counter_pe_c1_r0__Context;
  wire [1:0] context_counter_pe_c1_r0__Context_Used;
  cgrame_contextcounter #(.contexts(3),.size(0)) context_counter_pe_c1_r0(
    .CGRA_Clock(context_counter_pe_c1_r0__CGRA_Clock),
    .CGRA_Enable(context_counter_pe_c1_r0__CGRA_Enable),
    .CGRA_Reset(context_counter_pe_c1_r0__CGRA_Reset),
    .Context(context_counter_pe_c1_r0__Context),
    .Context_Used(context_counter_pe_c1_r0__Context_Used)
  );

  //Wire declarations for instance 'context_counter_pe_c1_r1' (Module cgrame_contextcounter)
  wire  context_counter_pe_c1_r1__CGRA_Clock;
  wire  context_counter_pe_c1_r1__CGRA_Enable;
  wire  context_counter_pe_c1_r1__CGRA_Reset;
  wire [1:0] context_counter_pe_c1_r1__Context;
  wire [1:0] context_counter_pe_c1_r1__Context_Used;
  cgrame_contextcounter #(.contexts(3),.size(0)) context_counter_pe_c1_r1(
    .CGRA_Clock(context_counter_pe_c1_r1__CGRA_Clock),
    .CGRA_Enable(context_counter_pe_c1_r1__CGRA_Enable),
    .CGRA_Reset(context_counter_pe_c1_r1__CGRA_Reset),
    .Context(context_counter_pe_c1_r1__Context),
    .Context_Used(context_counter_pe_c1_r1__Context_Used)
  );

  //Wire declarations for instance 'context_counter_pe_c1_r2' (Module cgrame_contextcounter)
  wire  context_counter_pe_c1_r2__CGRA_Clock;
  wire  context_counter_pe_c1_r2__CGRA_Enable;
  wire  context_counter_pe_c1_r2__CGRA_Reset;
  wire [1:0] context_counter_pe_c1_r2__Context;
  wire [1:0] context_counter_pe_c1_r2__Context_Used;
  cgrame_contextcounter #(.contexts(3),.size(0)) context_counter_pe_c1_r2(
    .CGRA_Clock(context_counter_pe_c1_r2__CGRA_Clock),
    .CGRA_Enable(context_counter_pe_c1_r2__CGRA_Enable),
    .CGRA_Reset(context_counter_pe_c1_r2__CGRA_Reset),
    .Context(context_counter_pe_c1_r2__Context),
    .Context_Used(context_counter_pe_c1_r2__Context_Used)
  );

  //Wire declarations for instance 'context_counter_pe_c2_r0' (Module cgrame_contextcounter)
  wire  context_counter_pe_c2_r0__CGRA_Clock;
  wire  context_counter_pe_c2_r0__CGRA_Enable;
  wire  context_counter_pe_c2_r0__CGRA_Reset;
  wire [1:0] context_counter_pe_c2_r0__Context;
  wire [1:0] context_counter_pe_c2_r0__Context_Used;
  cgrame_contextcounter #(.contexts(3),.size(0)) context_counter_pe_c2_r0(
    .CGRA_Clock(context_counter_pe_c2_r0__CGRA_Clock),
    .CGRA_Enable(context_counter_pe_c2_r0__CGRA_Enable),
    .CGRA_Reset(context_counter_pe_c2_r0__CGRA_Reset),
    .Context(context_counter_pe_c2_r0__Context),
    .Context_Used(context_counter_pe_c2_r0__Context_Used)
  );

  //Wire declarations for instance 'context_counter_pe_c2_r1' (Module cgrame_contextcounter)
  wire  context_counter_pe_c2_r1__CGRA_Clock;
  wire  context_counter_pe_c2_r1__CGRA_Enable;
  wire  context_counter_pe_c2_r1__CGRA_Reset;
  wire [1:0] context_counter_pe_c2_r1__Context;
  wire [1:0] context_counter_pe_c2_r1__Context_Used;
  cgrame_contextcounter #(.contexts(3),.size(0)) context_counter_pe_c2_r1(
    .CGRA_Clock(context_counter_pe_c2_r1__CGRA_Clock),
    .CGRA_Enable(context_counter_pe_c2_r1__CGRA_Enable),
    .CGRA_Reset(context_counter_pe_c2_r1__CGRA_Reset),
    .Context(context_counter_pe_c2_r1__Context),
    .Context_Used(context_counter_pe_c2_r1__Context_Used)
  );

  //Wire declarations for instance 'context_counter_pe_c2_r2' (Module cgrame_contextcounter)
  wire  context_counter_pe_c2_r2__CGRA_Clock;
  wire  context_counter_pe_c2_r2__CGRA_Enable;
  wire  context_counter_pe_c2_r2__CGRA_Reset;
  wire [1:0] context_counter_pe_c2_r2__Context;
  wire [1:0] context_counter_pe_c2_r2__Context_Used;
  cgrame_contextcounter #(.contexts(3),.size(0)) context_counter_pe_c2_r2(
    .CGRA_Clock(context_counter_pe_c2_r2__CGRA_Clock),
    .CGRA_Enable(context_counter_pe_c2_r2__CGRA_Enable),
    .CGRA_Reset(context_counter_pe_c2_r2__CGRA_Reset),
    .Context(context_counter_pe_c2_r2__Context),
    .Context_Used(context_counter_pe_c2_r2__Context_Used)
  );

  //Wire declarations for instance 'context_counter_rf_c0_r1' (Module cgrame_contextcounter)
  wire  context_counter_rf_c0_r1__CGRA_Clock;
  wire  context_counter_rf_c0_r1__CGRA_Enable;
  wire  context_counter_rf_c0_r1__CGRA_Reset;
  wire [1:0] context_counter_rf_c0_r1__Context;
  wire [1:0] context_counter_rf_c0_r1__Context_Used;
  cgrame_contextcounter #(.contexts(3),.size(0)) context_counter_rf_c0_r1(
    .CGRA_Clock(context_counter_rf_c0_r1__CGRA_Clock),
    .CGRA_Enable(context_counter_rf_c0_r1__CGRA_Enable),
    .CGRA_Reset(context_counter_rf_c0_r1__CGRA_Reset),
    .Context(context_counter_rf_c0_r1__Context),
    .Context_Used(context_counter_rf_c0_r1__Context_Used)
  );

  //Wire declarations for instance 'context_counter_rf_c0_r2' (Module cgrame_contextcounter)
  wire  context_counter_rf_c0_r2__CGRA_Clock;
  wire  context_counter_rf_c0_r2__CGRA_Enable;
  wire  context_counter_rf_c0_r2__CGRA_Reset;
  wire [1:0] context_counter_rf_c0_r2__Context;
  wire [1:0] context_counter_rf_c0_r2__Context_Used;
  cgrame_contextcounter #(.contexts(3),.size(0)) context_counter_rf_c0_r2(
    .CGRA_Clock(context_counter_rf_c0_r2__CGRA_Clock),
    .CGRA_Enable(context_counter_rf_c0_r2__CGRA_Enable),
    .CGRA_Reset(context_counter_rf_c0_r2__CGRA_Reset),
    .Context(context_counter_rf_c0_r2__Context),
    .Context_Used(context_counter_rf_c0_r2__Context_Used)
  );

  //Wire declarations for instance 'context_counter_rf_c1_r1' (Module cgrame_contextcounter)
  wire  context_counter_rf_c1_r1__CGRA_Clock;
  wire  context_counter_rf_c1_r1__CGRA_Enable;
  wire  context_counter_rf_c1_r1__CGRA_Reset;
  wire [1:0] context_counter_rf_c1_r1__Context;
  wire [1:0] context_counter_rf_c1_r1__Context_Used;
  cgrame_contextcounter #(.contexts(3),.size(0)) context_counter_rf_c1_r1(
    .CGRA_Clock(context_counter_rf_c1_r1__CGRA_Clock),
    .CGRA_Enable(context_counter_rf_c1_r1__CGRA_Enable),
    .CGRA_Reset(context_counter_rf_c1_r1__CGRA_Reset),
    .Context(context_counter_rf_c1_r1__Context),
    .Context_Used(context_counter_rf_c1_r1__Context_Used)
  );

  //Wire declarations for instance 'context_counter_rf_c1_r2' (Module cgrame_contextcounter)
  wire  context_counter_rf_c1_r2__CGRA_Clock;
  wire  context_counter_rf_c1_r2__CGRA_Enable;
  wire  context_counter_rf_c1_r2__CGRA_Reset;
  wire [1:0] context_counter_rf_c1_r2__Context;
  wire [1:0] context_counter_rf_c1_r2__Context_Used;
  cgrame_contextcounter #(.contexts(3),.size(0)) context_counter_rf_c1_r2(
    .CGRA_Clock(context_counter_rf_c1_r2__CGRA_Clock),
    .CGRA_Enable(context_counter_rf_c1_r2__CGRA_Enable),
    .CGRA_Reset(context_counter_rf_c1_r2__CGRA_Reset),
    .Context(context_counter_rf_c1_r2__Context),
    .Context_Used(context_counter_rf_c1_r2__Context_Used)
  );

  //Wire declarations for instance 'context_counter_rf_c2_r1' (Module cgrame_contextcounter)
  wire  context_counter_rf_c2_r1__CGRA_Clock;
  wire  context_counter_rf_c2_r1__CGRA_Enable;
  wire  context_counter_rf_c2_r1__CGRA_Reset;
  wire [1:0] context_counter_rf_c2_r1__Context;
  wire [1:0] context_counter_rf_c2_r1__Context_Used;
  cgrame_contextcounter #(.contexts(3),.size(0)) context_counter_rf_c2_r1(
    .CGRA_Clock(context_counter_rf_c2_r1__CGRA_Clock),
    .CGRA_Enable(context_counter_rf_c2_r1__CGRA_Enable),
    .CGRA_Reset(context_counter_rf_c2_r1__CGRA_Reset),
    .Context(context_counter_rf_c2_r1__Context),
    .Context_Used(context_counter_rf_c2_r1__Context_Used)
  );

  //Wire declarations for instance 'context_counter_rf_c2_r2' (Module cgrame_contextcounter)
  wire  context_counter_rf_c2_r2__CGRA_Clock;
  wire  context_counter_rf_c2_r2__CGRA_Enable;
  wire  context_counter_rf_c2_r2__CGRA_Reset;
  wire [1:0] context_counter_rf_c2_r2__Context;
  wire [1:0] context_counter_rf_c2_r2__Context_Used;
  cgrame_contextcounter #(.contexts(3),.size(0)) context_counter_rf_c2_r2(
    .CGRA_Clock(context_counter_rf_c2_r2__CGRA_Clock),
    .CGRA_Enable(context_counter_rf_c2_r2__CGRA_Enable),
    .CGRA_Reset(context_counter_rf_c2_r2__CGRA_Reset),
    .Context(context_counter_rf_c2_r2__Context),
    .Context_Used(context_counter_rf_c2_r2__Context_Used)
  );

  //Wire declarations for instance 'drf' (Module registerFile_3in_6out_32b_U3)
  wire  drf__CGRA_Clock;
  wire  drf__CGRA_Enable;
  wire  drf__CGRA_Reset;
  wire  drf__ConfigIn;
  wire  drf__ConfigOut;
  wire  drf__Config_Clock;
  wire  drf__Config_Reset;
  wire [1:0] drf__Context;
  wire [31:0] drf__in0;
  wire [31:0] drf__in1;
  wire [31:0] drf__in2;
  wire [31:0] drf__out0;
  wire [31:0] drf__out1;
  wire [31:0] drf__out2;
  wire [31:0] drf__out3;
  wire [31:0] drf__out4;
  wire [31:0] drf__out5;
  registerFile_3in_6out_32b_U3 drf(
    .CGRA_Clock(drf__CGRA_Clock),
    .CGRA_Enable(drf__CGRA_Enable),
    .CGRA_Reset(drf__CGRA_Reset),
    .ConfigIn(drf__ConfigIn),
    .ConfigOut(drf__ConfigOut),
    .Config_Clock(drf__Config_Clock),
    .Config_Reset(drf__Config_Reset),
    .Context(drf__Context),
    .in0(drf__in0),
    .in1(drf__in1),
    .in2(drf__in2),
    .out0(drf__out0),
    .out1(drf__out1),
    .out2(drf__out2),
    .out3(drf__out3),
    .out4(drf__out4),
    .out5(drf__out5)
  );

  //Wire declarations for instance 'imc_core_0' (Module IMCMemoryUnit)
  wire [31:0] imc_core_0__in0;
  IMCMemoryUnit #(.Input(32),.contexts(3)) imc_core_0(
    .in0(imc_core_0__in0)
  );

  //Wire declarations for instance 'imc_core_1' (Module IMCMemoryUnit)
  wire [31:0] imc_core_1__in0;
  IMCMemoryUnit #(.Input(32),.contexts(3)) imc_core_1(
    .in0(imc_core_1__in0)
  );

  //Wire declarations for instance 'imc_core_2' (Module IMCMemoryUnit)
  wire [31:0] imc_core_2__in0;
  IMCMemoryUnit #(.Input(32),.contexts(3)) imc_core_2(
    .in0(imc_core_2__in0)
  );

  //Wire declarations for instance 'imc_mem_0' (Module IMCMemPort)
  wire [1:0] imc_mem_0__Context;
  wire [31:0] imc_mem_0__in0;
  wire [31:0] imc_mem_0__in1;
  wire [31:0] imc_mem_0__in2;
  wire [31:0] imc_mem_0__out;
  IMCMemPort #(.contexts(3),.size(32)) imc_mem_0(
    .Context(imc_mem_0__Context),
    .in0(imc_mem_0__in0),
    .in1(imc_mem_0__in1),
    .in2(imc_mem_0__in2),
    .out(imc_mem_0__out)
  );

  //Wire declarations for instance 'imc_mem_1' (Module IMCMemPort)
  wire [1:0] imc_mem_1__Context;
  wire [31:0] imc_mem_1__in0;
  wire [31:0] imc_mem_1__in1;
  wire [31:0] imc_mem_1__in2;
  wire [31:0] imc_mem_1__out;
  IMCMemPort #(.contexts(3),.size(32)) imc_mem_1(
    .Context(imc_mem_1__Context),
    .in0(imc_mem_1__in0),
    .in1(imc_mem_1__in1),
    .in2(imc_mem_1__in2),
    .out(imc_mem_1__out)
  );

  //Wire declarations for instance 'imc_mem_2' (Module IMCMemPort)
  wire [1:0] imc_mem_2__Context;
  wire [31:0] imc_mem_2__in0;
  wire [31:0] imc_mem_2__in1;
  wire [31:0] imc_mem_2__in2;
  wire [31:0] imc_mem_2__out;
  IMCMemPort #(.contexts(3),.size(32)) imc_mem_2(
    .Context(imc_mem_2__Context),
    .in0(imc_mem_2__in0),
    .in1(imc_mem_2__in1),
    .in2(imc_mem_2__in2),
    .out(imc_mem_2__out)
  );

  //Wire declarations for instance 'io_top_0' (Module io_32b_U6)
  wire  io_top_0__CGRA_Clock;
  wire  io_top_0__CGRA_Enable;
  wire  io_top_0__CGRA_Reset;
  wire  io_top_0__ConfigIn;
  wire  io_top_0__ConfigOut;
  wire  io_top_0__Config_Clock;
  wire  io_top_0__Config_Reset;
  wire [1:0] io_top_0__Context;
  wire [31:0] io_top_0__IOPin_bidir_in;
  wire [31:0] io_top_0__IOPin_bidir_out;
  wire [31:0] io_top_0__in;
  wire [31:0] io_top_0__out;
  io_32b_U6 io_top_0(
    .CGRA_Clock(io_top_0__CGRA_Clock),
    .CGRA_Enable(io_top_0__CGRA_Enable),
    .CGRA_Reset(io_top_0__CGRA_Reset),
    .ConfigIn(io_top_0__ConfigIn),
    .ConfigOut(io_top_0__ConfigOut),
    .Config_Clock(io_top_0__Config_Clock),
    .Config_Reset(io_top_0__Config_Reset),
    .Context(io_top_0__Context),
    .IOPin_bidir_in(io_top_0__IOPin_bidir_in),
    .IOPin_bidir_out(io_top_0__IOPin_bidir_out),
    .in(io_top_0__in),
    .out(io_top_0__out)
  );

  //Wire declarations for instance 'io_top_1' (Module io_32b_U6)
  wire  io_top_1__CGRA_Clock;
  wire  io_top_1__CGRA_Enable;
  wire  io_top_1__CGRA_Reset;
  wire  io_top_1__ConfigIn;
  wire  io_top_1__ConfigOut;
  wire  io_top_1__Config_Clock;
  wire  io_top_1__Config_Reset;
  wire [1:0] io_top_1__Context;
  wire [31:0] io_top_1__IOPin_bidir_in;
  wire [31:0] io_top_1__IOPin_bidir_out;
  wire [31:0] io_top_1__in;
  wire [31:0] io_top_1__out;
  io_32b_U6 io_top_1(
    .CGRA_Clock(io_top_1__CGRA_Clock),
    .CGRA_Enable(io_top_1__CGRA_Enable),
    .CGRA_Reset(io_top_1__CGRA_Reset),
    .ConfigIn(io_top_1__ConfigIn),
    .ConfigOut(io_top_1__ConfigOut),
    .Config_Clock(io_top_1__Config_Clock),
    .Config_Reset(io_top_1__Config_Reset),
    .Context(io_top_1__Context),
    .IOPin_bidir_in(io_top_1__IOPin_bidir_in),
    .IOPin_bidir_out(io_top_1__IOPin_bidir_out),
    .in(io_top_1__in),
    .out(io_top_1__out)
  );

  //Wire declarations for instance 'io_top_2' (Module io_32b_U6)
  wire  io_top_2__CGRA_Clock;
  wire  io_top_2__CGRA_Enable;
  wire  io_top_2__CGRA_Reset;
  wire  io_top_2__ConfigIn;
  wire  io_top_2__ConfigOut;
  wire  io_top_2__Config_Clock;
  wire  io_top_2__Config_Reset;
  wire [1:0] io_top_2__Context;
  wire [31:0] io_top_2__IOPin_bidir_in;
  wire [31:0] io_top_2__IOPin_bidir_out;
  wire [31:0] io_top_2__in;
  wire [31:0] io_top_2__out;
  io_32b_U6 io_top_2(
    .CGRA_Clock(io_top_2__CGRA_Clock),
    .CGRA_Enable(io_top_2__CGRA_Enable),
    .CGRA_Reset(io_top_2__CGRA_Reset),
    .ConfigIn(io_top_2__ConfigIn),
    .ConfigOut(io_top_2__ConfigOut),
    .Config_Clock(io_top_2__Config_Clock),
    .Config_Reset(io_top_2__Config_Reset),
    .Context(io_top_2__Context),
    .IOPin_bidir_in(io_top_2__IOPin_bidir_in),
    .IOPin_bidir_out(io_top_2__IOPin_bidir_out),
    .in(io_top_2__in),
    .out(io_top_2__out)
  );

  //Wire declarations for instance 'pe_c0_r0' (Module adres_6in_vliw_U7)
  wire  pe_c0_r0__CGRA_Clock;
  wire  pe_c0_r0__CGRA_Enable;
  wire  pe_c0_r0__CGRA_Reset;
  wire  pe_c0_r0__ConfigIn;
  wire  pe_c0_r0__ConfigOut;
  wire  pe_c0_r0__Config_Clock;
  wire  pe_c0_r0__Config_Reset;
  wire [1:0] pe_c0_r0__Context;
  wire [31:0] pe_c0_r0__fu_to_rf;
  wire [31:0] pe_c0_r0__in0;
  wire [31:0] pe_c0_r0__in1;
  wire [31:0] pe_c0_r0__in2;
  wire [31:0] pe_c0_r0__in3;
  wire [31:0] pe_c0_r0__in4;
  wire [31:0] pe_c0_r0__in5;
  wire [31:0] pe_c0_r0__out;
  wire [31:0] pe_c0_r0__rf_to_muxa;
  wire [31:0] pe_c0_r0__rf_to_muxout;
  adres_6in_vliw_U7 pe_c0_r0(
    .CGRA_Clock(pe_c0_r0__CGRA_Clock),
    .CGRA_Enable(pe_c0_r0__CGRA_Enable),
    .CGRA_Reset(pe_c0_r0__CGRA_Reset),
    .ConfigIn(pe_c0_r0__ConfigIn),
    .ConfigOut(pe_c0_r0__ConfigOut),
    .Config_Clock(pe_c0_r0__Config_Clock),
    .Config_Reset(pe_c0_r0__Config_Reset),
    .Context(pe_c0_r0__Context),
    .fu_to_rf(pe_c0_r0__fu_to_rf),
    .in0(pe_c0_r0__in0),
    .in1(pe_c0_r0__in1),
    .in2(pe_c0_r0__in2),
    .in3(pe_c0_r0__in3),
    .in4(pe_c0_r0__in4),
    .in5(pe_c0_r0__in5),
    .out(pe_c0_r0__out),
    .rf_to_muxa(pe_c0_r0__rf_to_muxa),
    .rf_to_muxout(pe_c0_r0__rf_to_muxout)
  );

  //Wire declarations for instance 'pe_c0_r1' (Module adres_5in_vliw_U8)
  wire  pe_c0_r1__CGRA_Clock;
  wire  pe_c0_r1__CGRA_Enable;
  wire  pe_c0_r1__CGRA_Reset;
  wire  pe_c0_r1__ConfigIn;
  wire  pe_c0_r1__ConfigOut;
  wire  pe_c0_r1__Config_Clock;
  wire  pe_c0_r1__Config_Reset;
  wire [1:0] pe_c0_r1__Context;
  wire [31:0] pe_c0_r1__fu_to_rf;
  wire [31:0] pe_c0_r1__in0;
  wire [31:0] pe_c0_r1__in1;
  wire [31:0] pe_c0_r1__in2;
  wire [31:0] pe_c0_r1__in3;
  wire [31:0] pe_c0_r1__in4;
  wire [31:0] pe_c0_r1__out;
  wire [31:0] pe_c0_r1__rf_to_muxa;
  wire [31:0] pe_c0_r1__rf_to_muxout;
  adres_5in_vliw_U8 pe_c0_r1(
    .CGRA_Clock(pe_c0_r1__CGRA_Clock),
    .CGRA_Enable(pe_c0_r1__CGRA_Enable),
    .CGRA_Reset(pe_c0_r1__CGRA_Reset),
    .ConfigIn(pe_c0_r1__ConfigIn),
    .ConfigOut(pe_c0_r1__ConfigOut),
    .Config_Clock(pe_c0_r1__Config_Clock),
    .Config_Reset(pe_c0_r1__Config_Reset),
    .Context(pe_c0_r1__Context),
    .fu_to_rf(pe_c0_r1__fu_to_rf),
    .in0(pe_c0_r1__in0),
    .in1(pe_c0_r1__in1),
    .in2(pe_c0_r1__in2),
    .in3(pe_c0_r1__in3),
    .in4(pe_c0_r1__in4),
    .out(pe_c0_r1__out),
    .rf_to_muxa(pe_c0_r1__rf_to_muxa),
    .rf_to_muxout(pe_c0_r1__rf_to_muxout)
  );

  //Wire declarations for instance 'pe_c0_r2' (Module adres_5in_vliw_U8)
  wire  pe_c0_r2__CGRA_Clock;
  wire  pe_c0_r2__CGRA_Enable;
  wire  pe_c0_r2__CGRA_Reset;
  wire  pe_c0_r2__ConfigIn;
  wire  pe_c0_r2__ConfigOut;
  wire  pe_c0_r2__Config_Clock;
  wire  pe_c0_r2__Config_Reset;
  wire [1:0] pe_c0_r2__Context;
  wire [31:0] pe_c0_r2__fu_to_rf;
  wire [31:0] pe_c0_r2__in0;
  wire [31:0] pe_c0_r2__in1;
  wire [31:0] pe_c0_r2__in2;
  wire [31:0] pe_c0_r2__in3;
  wire [31:0] pe_c0_r2__in4;
  wire [31:0] pe_c0_r2__out;
  wire [31:0] pe_c0_r2__rf_to_muxa;
  wire [31:0] pe_c0_r2__rf_to_muxout;
  adres_5in_vliw_U8 pe_c0_r2(
    .CGRA_Clock(pe_c0_r2__CGRA_Clock),
    .CGRA_Enable(pe_c0_r2__CGRA_Enable),
    .CGRA_Reset(pe_c0_r2__CGRA_Reset),
    .ConfigIn(pe_c0_r2__ConfigIn),
    .ConfigOut(pe_c0_r2__ConfigOut),
    .Config_Clock(pe_c0_r2__Config_Clock),
    .Config_Reset(pe_c0_r2__Config_Reset),
    .Context(pe_c0_r2__Context),
    .fu_to_rf(pe_c0_r2__fu_to_rf),
    .in0(pe_c0_r2__in0),
    .in1(pe_c0_r2__in1),
    .in2(pe_c0_r2__in2),
    .in3(pe_c0_r2__in3),
    .in4(pe_c0_r2__in4),
    .out(pe_c0_r2__out),
    .rf_to_muxa(pe_c0_r2__rf_to_muxa),
    .rf_to_muxout(pe_c0_r2__rf_to_muxout)
  );

  //Wire declarations for instance 'pe_c1_r0' (Module adres_6in_vliw_U7)
  wire  pe_c1_r0__CGRA_Clock;
  wire  pe_c1_r0__CGRA_Enable;
  wire  pe_c1_r0__CGRA_Reset;
  wire  pe_c1_r0__ConfigIn;
  wire  pe_c1_r0__ConfigOut;
  wire  pe_c1_r0__Config_Clock;
  wire  pe_c1_r0__Config_Reset;
  wire [1:0] pe_c1_r0__Context;
  wire [31:0] pe_c1_r0__fu_to_rf;
  wire [31:0] pe_c1_r0__in0;
  wire [31:0] pe_c1_r0__in1;
  wire [31:0] pe_c1_r0__in2;
  wire [31:0] pe_c1_r0__in3;
  wire [31:0] pe_c1_r0__in4;
  wire [31:0] pe_c1_r0__in5;
  wire [31:0] pe_c1_r0__out;
  wire [31:0] pe_c1_r0__rf_to_muxa;
  wire [31:0] pe_c1_r0__rf_to_muxout;
  adres_6in_vliw_U7 pe_c1_r0(
    .CGRA_Clock(pe_c1_r0__CGRA_Clock),
    .CGRA_Enable(pe_c1_r0__CGRA_Enable),
    .CGRA_Reset(pe_c1_r0__CGRA_Reset),
    .ConfigIn(pe_c1_r0__ConfigIn),
    .ConfigOut(pe_c1_r0__ConfigOut),
    .Config_Clock(pe_c1_r0__Config_Clock),
    .Config_Reset(pe_c1_r0__Config_Reset),
    .Context(pe_c1_r0__Context),
    .fu_to_rf(pe_c1_r0__fu_to_rf),
    .in0(pe_c1_r0__in0),
    .in1(pe_c1_r0__in1),
    .in2(pe_c1_r0__in2),
    .in3(pe_c1_r0__in3),
    .in4(pe_c1_r0__in4),
    .in5(pe_c1_r0__in5),
    .out(pe_c1_r0__out),
    .rf_to_muxa(pe_c1_r0__rf_to_muxa),
    .rf_to_muxout(pe_c1_r0__rf_to_muxout)
  );

  //Wire declarations for instance 'pe_c1_r1' (Module adres_5in_vliw_U8)
  wire  pe_c1_r1__CGRA_Clock;
  wire  pe_c1_r1__CGRA_Enable;
  wire  pe_c1_r1__CGRA_Reset;
  wire  pe_c1_r1__ConfigIn;
  wire  pe_c1_r1__ConfigOut;
  wire  pe_c1_r1__Config_Clock;
  wire  pe_c1_r1__Config_Reset;
  wire [1:0] pe_c1_r1__Context;
  wire [31:0] pe_c1_r1__fu_to_rf;
  wire [31:0] pe_c1_r1__in0;
  wire [31:0] pe_c1_r1__in1;
  wire [31:0] pe_c1_r1__in2;
  wire [31:0] pe_c1_r1__in3;
  wire [31:0] pe_c1_r1__in4;
  wire [31:0] pe_c1_r1__out;
  wire [31:0] pe_c1_r1__rf_to_muxa;
  wire [31:0] pe_c1_r1__rf_to_muxout;
  adres_5in_vliw_U8 pe_c1_r1(
    .CGRA_Clock(pe_c1_r1__CGRA_Clock),
    .CGRA_Enable(pe_c1_r1__CGRA_Enable),
    .CGRA_Reset(pe_c1_r1__CGRA_Reset),
    .ConfigIn(pe_c1_r1__ConfigIn),
    .ConfigOut(pe_c1_r1__ConfigOut),
    .Config_Clock(pe_c1_r1__Config_Clock),
    .Config_Reset(pe_c1_r1__Config_Reset),
    .Context(pe_c1_r1__Context),
    .fu_to_rf(pe_c1_r1__fu_to_rf),
    .in0(pe_c1_r1__in0),
    .in1(pe_c1_r1__in1),
    .in2(pe_c1_r1__in2),
    .in3(pe_c1_r1__in3),
    .in4(pe_c1_r1__in4),
    .out(pe_c1_r1__out),
    .rf_to_muxa(pe_c1_r1__rf_to_muxa),
    .rf_to_muxout(pe_c1_r1__rf_to_muxout)
  );

  //Wire declarations for instance 'pe_c1_r2' (Module adres_5in_vliw_U8)
  wire  pe_c1_r2__CGRA_Clock;
  wire  pe_c1_r2__CGRA_Enable;
  wire  pe_c1_r2__CGRA_Reset;
  wire  pe_c1_r2__ConfigIn;
  wire  pe_c1_r2__ConfigOut;
  wire  pe_c1_r2__Config_Clock;
  wire  pe_c1_r2__Config_Reset;
  wire [1:0] pe_c1_r2__Context;
  wire [31:0] pe_c1_r2__fu_to_rf;
  wire [31:0] pe_c1_r2__in0;
  wire [31:0] pe_c1_r2__in1;
  wire [31:0] pe_c1_r2__in2;
  wire [31:0] pe_c1_r2__in3;
  wire [31:0] pe_c1_r2__in4;
  wire [31:0] pe_c1_r2__out;
  wire [31:0] pe_c1_r2__rf_to_muxa;
  wire [31:0] pe_c1_r2__rf_to_muxout;
  adres_5in_vliw_U8 pe_c1_r2(
    .CGRA_Clock(pe_c1_r2__CGRA_Clock),
    .CGRA_Enable(pe_c1_r2__CGRA_Enable),
    .CGRA_Reset(pe_c1_r2__CGRA_Reset),
    .ConfigIn(pe_c1_r2__ConfigIn),
    .ConfigOut(pe_c1_r2__ConfigOut),
    .Config_Clock(pe_c1_r2__Config_Clock),
    .Config_Reset(pe_c1_r2__Config_Reset),
    .Context(pe_c1_r2__Context),
    .fu_to_rf(pe_c1_r2__fu_to_rf),
    .in0(pe_c1_r2__in0),
    .in1(pe_c1_r2__in1),
    .in2(pe_c1_r2__in2),
    .in3(pe_c1_r2__in3),
    .in4(pe_c1_r2__in4),
    .out(pe_c1_r2__out),
    .rf_to_muxa(pe_c1_r2__rf_to_muxa),
    .rf_to_muxout(pe_c1_r2__rf_to_muxout)
  );

  //Wire declarations for instance 'pe_c2_r0' (Module adres_6in_vliw_U7)
  wire  pe_c2_r0__CGRA_Clock;
  wire  pe_c2_r0__CGRA_Enable;
  wire  pe_c2_r0__CGRA_Reset;
  wire  pe_c2_r0__ConfigIn;
  wire  pe_c2_r0__ConfigOut;
  wire  pe_c2_r0__Config_Clock;
  wire  pe_c2_r0__Config_Reset;
  wire [1:0] pe_c2_r0__Context;
  wire [31:0] pe_c2_r0__fu_to_rf;
  wire [31:0] pe_c2_r0__in0;
  wire [31:0] pe_c2_r0__in1;
  wire [31:0] pe_c2_r0__in2;
  wire [31:0] pe_c2_r0__in3;
  wire [31:0] pe_c2_r0__in4;
  wire [31:0] pe_c2_r0__in5;
  wire [31:0] pe_c2_r0__out;
  wire [31:0] pe_c2_r0__rf_to_muxa;
  wire [31:0] pe_c2_r0__rf_to_muxout;
  adres_6in_vliw_U7 pe_c2_r0(
    .CGRA_Clock(pe_c2_r0__CGRA_Clock),
    .CGRA_Enable(pe_c2_r0__CGRA_Enable),
    .CGRA_Reset(pe_c2_r0__CGRA_Reset),
    .ConfigIn(pe_c2_r0__ConfigIn),
    .ConfigOut(pe_c2_r0__ConfigOut),
    .Config_Clock(pe_c2_r0__Config_Clock),
    .Config_Reset(pe_c2_r0__Config_Reset),
    .Context(pe_c2_r0__Context),
    .fu_to_rf(pe_c2_r0__fu_to_rf),
    .in0(pe_c2_r0__in0),
    .in1(pe_c2_r0__in1),
    .in2(pe_c2_r0__in2),
    .in3(pe_c2_r0__in3),
    .in4(pe_c2_r0__in4),
    .in5(pe_c2_r0__in5),
    .out(pe_c2_r0__out),
    .rf_to_muxa(pe_c2_r0__rf_to_muxa),
    .rf_to_muxout(pe_c2_r0__rf_to_muxout)
  );

  //Wire declarations for instance 'pe_c2_r1' (Module adres_5in_vliw_U8)
  wire  pe_c2_r1__CGRA_Clock;
  wire  pe_c2_r1__CGRA_Enable;
  wire  pe_c2_r1__CGRA_Reset;
  wire  pe_c2_r1__ConfigIn;
  wire  pe_c2_r1__ConfigOut;
  wire  pe_c2_r1__Config_Clock;
  wire  pe_c2_r1__Config_Reset;
  wire [1:0] pe_c2_r1__Context;
  wire [31:0] pe_c2_r1__fu_to_rf;
  wire [31:0] pe_c2_r1__in0;
  wire [31:0] pe_c2_r1__in1;
  wire [31:0] pe_c2_r1__in2;
  wire [31:0] pe_c2_r1__in3;
  wire [31:0] pe_c2_r1__in4;
  wire [31:0] pe_c2_r1__out;
  wire [31:0] pe_c2_r1__rf_to_muxa;
  wire [31:0] pe_c2_r1__rf_to_muxout;
  adres_5in_vliw_U8 pe_c2_r1(
    .CGRA_Clock(pe_c2_r1__CGRA_Clock),
    .CGRA_Enable(pe_c2_r1__CGRA_Enable),
    .CGRA_Reset(pe_c2_r1__CGRA_Reset),
    .ConfigIn(pe_c2_r1__ConfigIn),
    .ConfigOut(pe_c2_r1__ConfigOut),
    .Config_Clock(pe_c2_r1__Config_Clock),
    .Config_Reset(pe_c2_r1__Config_Reset),
    .Context(pe_c2_r1__Context),
    .fu_to_rf(pe_c2_r1__fu_to_rf),
    .in0(pe_c2_r1__in0),
    .in1(pe_c2_r1__in1),
    .in2(pe_c2_r1__in2),
    .in3(pe_c2_r1__in3),
    .in4(pe_c2_r1__in4),
    .out(pe_c2_r1__out),
    .rf_to_muxa(pe_c2_r1__rf_to_muxa),
    .rf_to_muxout(pe_c2_r1__rf_to_muxout)
  );

  //Wire declarations for instance 'pe_c2_r2' (Module adres_5in_vliw_U8)
  wire  pe_c2_r2__CGRA_Clock;
  wire  pe_c2_r2__CGRA_Enable;
  wire  pe_c2_r2__CGRA_Reset;
  wire  pe_c2_r2__ConfigIn;
  wire  pe_c2_r2__ConfigOut;
  wire  pe_c2_r2__Config_Clock;
  wire  pe_c2_r2__Config_Reset;
  wire [1:0] pe_c2_r2__Context;
  wire [31:0] pe_c2_r2__fu_to_rf;
  wire [31:0] pe_c2_r2__in0;
  wire [31:0] pe_c2_r2__in1;
  wire [31:0] pe_c2_r2__in2;
  wire [31:0] pe_c2_r2__in3;
  wire [31:0] pe_c2_r2__in4;
  wire [31:0] pe_c2_r2__out;
  wire [31:0] pe_c2_r2__rf_to_muxa;
  wire [31:0] pe_c2_r2__rf_to_muxout;
  adres_5in_vliw_U8 pe_c2_r2(
    .CGRA_Clock(pe_c2_r2__CGRA_Clock),
    .CGRA_Enable(pe_c2_r2__CGRA_Enable),
    .CGRA_Reset(pe_c2_r2__CGRA_Reset),
    .ConfigIn(pe_c2_r2__ConfigIn),
    .ConfigOut(pe_c2_r2__ConfigOut),
    .Config_Clock(pe_c2_r2__Config_Clock),
    .Config_Reset(pe_c2_r2__Config_Reset),
    .Context(pe_c2_r2__Context),
    .fu_to_rf(pe_c2_r2__fu_to_rf),
    .in0(pe_c2_r2__in0),
    .in1(pe_c2_r2__in1),
    .in2(pe_c2_r2__in2),
    .in3(pe_c2_r2__in3),
    .in4(pe_c2_r2__in4),
    .out(pe_c2_r2__out),
    .rf_to_muxa(pe_c2_r2__rf_to_muxa),
    .rf_to_muxout(pe_c2_r2__rf_to_muxout)
  );

  //Wire declarations for instance 'rf_c0_r1' (Module registerFile_1in_2out_32b_U9)
  wire  rf_c0_r1__CGRA_Clock;
  wire  rf_c0_r1__CGRA_Enable;
  wire  rf_c0_r1__CGRA_Reset;
  wire  rf_c0_r1__ConfigIn;
  wire  rf_c0_r1__ConfigOut;
  wire  rf_c0_r1__Config_Clock;
  wire  rf_c0_r1__Config_Reset;
  wire [1:0] rf_c0_r1__Context;
  wire [31:0] rf_c0_r1__in0;
  wire [31:0] rf_c0_r1__out0;
  wire [31:0] rf_c0_r1__out1;
  registerFile_1in_2out_32b_U9 rf_c0_r1(
    .CGRA_Clock(rf_c0_r1__CGRA_Clock),
    .CGRA_Enable(rf_c0_r1__CGRA_Enable),
    .CGRA_Reset(rf_c0_r1__CGRA_Reset),
    .ConfigIn(rf_c0_r1__ConfigIn),
    .ConfigOut(rf_c0_r1__ConfigOut),
    .Config_Clock(rf_c0_r1__Config_Clock),
    .Config_Reset(rf_c0_r1__Config_Reset),
    .Context(rf_c0_r1__Context),
    .in0(rf_c0_r1__in0),
    .out0(rf_c0_r1__out0),
    .out1(rf_c0_r1__out1)
  );

  //Wire declarations for instance 'rf_c0_r2' (Module registerFile_1in_2out_32b_U9)
  wire  rf_c0_r2__CGRA_Clock;
  wire  rf_c0_r2__CGRA_Enable;
  wire  rf_c0_r2__CGRA_Reset;
  wire  rf_c0_r2__ConfigIn;
  wire  rf_c0_r2__ConfigOut;
  wire  rf_c0_r2__Config_Clock;
  wire  rf_c0_r2__Config_Reset;
  wire [1:0] rf_c0_r2__Context;
  wire [31:0] rf_c0_r2__in0;
  wire [31:0] rf_c0_r2__out0;
  wire [31:0] rf_c0_r2__out1;
  registerFile_1in_2out_32b_U9 rf_c0_r2(
    .CGRA_Clock(rf_c0_r2__CGRA_Clock),
    .CGRA_Enable(rf_c0_r2__CGRA_Enable),
    .CGRA_Reset(rf_c0_r2__CGRA_Reset),
    .ConfigIn(rf_c0_r2__ConfigIn),
    .ConfigOut(rf_c0_r2__ConfigOut),
    .Config_Clock(rf_c0_r2__Config_Clock),
    .Config_Reset(rf_c0_r2__Config_Reset),
    .Context(rf_c0_r2__Context),
    .in0(rf_c0_r2__in0),
    .out0(rf_c0_r2__out0),
    .out1(rf_c0_r2__out1)
  );

  //Wire declarations for instance 'rf_c1_r1' (Module registerFile_1in_2out_32b_U9)
  wire  rf_c1_r1__CGRA_Clock;
  wire  rf_c1_r1__CGRA_Enable;
  wire  rf_c1_r1__CGRA_Reset;
  wire  rf_c1_r1__ConfigIn;
  wire  rf_c1_r1__ConfigOut;
  wire  rf_c1_r1__Config_Clock;
  wire  rf_c1_r1__Config_Reset;
  wire [1:0] rf_c1_r1__Context;
  wire [31:0] rf_c1_r1__in0;
  wire [31:0] rf_c1_r1__out0;
  wire [31:0] rf_c1_r1__out1;
  registerFile_1in_2out_32b_U9 rf_c1_r1(
    .CGRA_Clock(rf_c1_r1__CGRA_Clock),
    .CGRA_Enable(rf_c1_r1__CGRA_Enable),
    .CGRA_Reset(rf_c1_r1__CGRA_Reset),
    .ConfigIn(rf_c1_r1__ConfigIn),
    .ConfigOut(rf_c1_r1__ConfigOut),
    .Config_Clock(rf_c1_r1__Config_Clock),
    .Config_Reset(rf_c1_r1__Config_Reset),
    .Context(rf_c1_r1__Context),
    .in0(rf_c1_r1__in0),
    .out0(rf_c1_r1__out0),
    .out1(rf_c1_r1__out1)
  );

  //Wire declarations for instance 'rf_c1_r2' (Module registerFile_1in_2out_32b_U9)
  wire  rf_c1_r2__CGRA_Clock;
  wire  rf_c1_r2__CGRA_Enable;
  wire  rf_c1_r2__CGRA_Reset;
  wire  rf_c1_r2__ConfigIn;
  wire  rf_c1_r2__ConfigOut;
  wire  rf_c1_r2__Config_Clock;
  wire  rf_c1_r2__Config_Reset;
  wire [1:0] rf_c1_r2__Context;
  wire [31:0] rf_c1_r2__in0;
  wire [31:0] rf_c1_r2__out0;
  wire [31:0] rf_c1_r2__out1;
  registerFile_1in_2out_32b_U9 rf_c1_r2(
    .CGRA_Clock(rf_c1_r2__CGRA_Clock),
    .CGRA_Enable(rf_c1_r2__CGRA_Enable),
    .CGRA_Reset(rf_c1_r2__CGRA_Reset),
    .ConfigIn(rf_c1_r2__ConfigIn),
    .ConfigOut(rf_c1_r2__ConfigOut),
    .Config_Clock(rf_c1_r2__Config_Clock),
    .Config_Reset(rf_c1_r2__Config_Reset),
    .Context(rf_c1_r2__Context),
    .in0(rf_c1_r2__in0),
    .out0(rf_c1_r2__out0),
    .out1(rf_c1_r2__out1)
  );

  //Wire declarations for instance 'rf_c2_r1' (Module registerFile_1in_2out_32b_U9)
  wire  rf_c2_r1__CGRA_Clock;
  wire  rf_c2_r1__CGRA_Enable;
  wire  rf_c2_r1__CGRA_Reset;
  wire  rf_c2_r1__ConfigIn;
  wire  rf_c2_r1__ConfigOut;
  wire  rf_c2_r1__Config_Clock;
  wire  rf_c2_r1__Config_Reset;
  wire [1:0] rf_c2_r1__Context;
  wire [31:0] rf_c2_r1__in0;
  wire [31:0] rf_c2_r1__out0;
  wire [31:0] rf_c2_r1__out1;
  registerFile_1in_2out_32b_U9 rf_c2_r1(
    .CGRA_Clock(rf_c2_r1__CGRA_Clock),
    .CGRA_Enable(rf_c2_r1__CGRA_Enable),
    .CGRA_Reset(rf_c2_r1__CGRA_Reset),
    .ConfigIn(rf_c2_r1__ConfigIn),
    .ConfigOut(rf_c2_r1__ConfigOut),
    .Config_Clock(rf_c2_r1__Config_Clock),
    .Config_Reset(rf_c2_r1__Config_Reset),
    .Context(rf_c2_r1__Context),
    .in0(rf_c2_r1__in0),
    .out0(rf_c2_r1__out0),
    .out1(rf_c2_r1__out1)
  );

  //Wire declarations for instance 'rf_c2_r2' (Module registerFile_1in_2out_32b_U9)
  wire  rf_c2_r2__CGRA_Clock;
  wire  rf_c2_r2__CGRA_Enable;
  wire  rf_c2_r2__CGRA_Reset;
  wire  rf_c2_r2__ConfigIn;
  wire  rf_c2_r2__ConfigOut;
  wire  rf_c2_r2__Config_Clock;
  wire  rf_c2_r2__Config_Reset;
  wire [1:0] rf_c2_r2__Context;
  wire [31:0] rf_c2_r2__in0;
  wire [31:0] rf_c2_r2__out0;
  wire [31:0] rf_c2_r2__out1;
  registerFile_1in_2out_32b_U9 rf_c2_r2(
    .CGRA_Clock(rf_c2_r2__CGRA_Clock),
    .CGRA_Enable(rf_c2_r2__CGRA_Enable),
    .CGRA_Reset(rf_c2_r2__CGRA_Reset),
    .ConfigIn(rf_c2_r2__ConfigIn),
    .ConfigOut(rf_c2_r2__ConfigOut),
    .Config_Clock(rf_c2_r2__Config_Clock),
    .Config_Reset(rf_c2_r2__Config_Reset),
    .Context(rf_c2_r2__Context),
    .in0(rf_c2_r2__in0),
    .out0(rf_c2_r2__out0),
    .out1(rf_c2_r2__out1)
  );

  //All the connections
  assign context_cell__Config_Clock = Config_Clock;
  assign drf__Config_Clock = Config_Clock;
  assign io_top_0__Config_Clock = Config_Clock;
  assign io_top_1__Config_Clock = Config_Clock;
  assign io_top_2__Config_Clock = Config_Clock;
  assign pe_c0_r0__Config_Clock = Config_Clock;
  assign pe_c0_r1__Config_Clock = Config_Clock;
  assign pe_c0_r2__Config_Clock = Config_Clock;
  assign pe_c1_r0__Config_Clock = Config_Clock;
  assign pe_c1_r1__Config_Clock = Config_Clock;
  assign pe_c1_r2__Config_Clock = Config_Clock;
  assign pe_c2_r0__Config_Clock = Config_Clock;
  assign pe_c2_r1__Config_Clock = Config_Clock;
  assign pe_c2_r2__Config_Clock = Config_Clock;
  assign rf_c0_r1__Config_Clock = Config_Clock;
  assign rf_c0_r2__Config_Clock = Config_Clock;
  assign rf_c1_r1__Config_Clock = Config_Clock;
  assign rf_c1_r2__Config_Clock = Config_Clock;
  assign rf_c2_r1__Config_Clock = Config_Clock;
  assign rf_c2_r2__Config_Clock = Config_Clock;
  assign context_cell__Config_Reset = Config_Reset;
  assign drf__Config_Reset = Config_Reset;
  assign io_top_0__Config_Reset = Config_Reset;
  assign io_top_1__Config_Reset = Config_Reset;
  assign io_top_2__Config_Reset = Config_Reset;
  assign pe_c0_r0__Config_Reset = Config_Reset;
  assign pe_c0_r1__Config_Reset = Config_Reset;
  assign pe_c0_r2__Config_Reset = Config_Reset;
  assign pe_c1_r0__Config_Reset = Config_Reset;
  assign pe_c1_r1__Config_Reset = Config_Reset;
  assign pe_c1_r2__Config_Reset = Config_Reset;
  assign pe_c2_r0__Config_Reset = Config_Reset;
  assign pe_c2_r1__Config_Reset = Config_Reset;
  assign pe_c2_r2__Config_Reset = Config_Reset;
  assign rf_c0_r1__Config_Reset = Config_Reset;
  assign rf_c0_r2__Config_Reset = Config_Reset;
  assign rf_c1_r1__Config_Reset = Config_Reset;
  assign rf_c1_r2__Config_Reset = Config_Reset;
  assign rf_c2_r1__Config_Reset = Config_Reset;
  assign rf_c2_r2__Config_Reset = Config_Reset;
  assign context_cell__CGRA_Clock = CGRA_Clock;
  assign context_counter_drf__CGRA_Clock = CGRA_Clock;
  assign context_counter_io0__CGRA_Clock = CGRA_Clock;
  assign context_counter_io1__CGRA_Clock = CGRA_Clock;
  assign context_counter_io2__CGRA_Clock = CGRA_Clock;
  assign context_counter_mem0__CGRA_Clock = CGRA_Clock;
  assign context_counter_mem1__CGRA_Clock = CGRA_Clock;
  assign context_counter_mem2__CGRA_Clock = CGRA_Clock;
  assign context_counter_pe_c0_r0__CGRA_Clock = CGRA_Clock;
  assign context_counter_pe_c0_r1__CGRA_Clock = CGRA_Clock;
  assign context_counter_pe_c0_r2__CGRA_Clock = CGRA_Clock;
  assign context_counter_pe_c1_r0__CGRA_Clock = CGRA_Clock;
  assign context_counter_pe_c1_r1__CGRA_Clock = CGRA_Clock;
  assign context_counter_pe_c1_r2__CGRA_Clock = CGRA_Clock;
  assign context_counter_pe_c2_r0__CGRA_Clock = CGRA_Clock;
  assign context_counter_pe_c2_r1__CGRA_Clock = CGRA_Clock;
  assign context_counter_pe_c2_r2__CGRA_Clock = CGRA_Clock;
  assign context_counter_rf_c0_r1__CGRA_Clock = CGRA_Clock;
  assign context_counter_rf_c0_r2__CGRA_Clock = CGRA_Clock;
  assign context_counter_rf_c1_r1__CGRA_Clock = CGRA_Clock;
  assign context_counter_rf_c1_r2__CGRA_Clock = CGRA_Clock;
  assign context_counter_rf_c2_r1__CGRA_Clock = CGRA_Clock;
  assign context_counter_rf_c2_r2__CGRA_Clock = CGRA_Clock;
  assign drf__CGRA_Clock = CGRA_Clock;
  assign io_top_0__CGRA_Clock = CGRA_Clock;
  assign io_top_1__CGRA_Clock = CGRA_Clock;
  assign io_top_2__CGRA_Clock = CGRA_Clock;
  assign pe_c0_r0__CGRA_Clock = CGRA_Clock;
  assign pe_c0_r1__CGRA_Clock = CGRA_Clock;
  assign pe_c0_r2__CGRA_Clock = CGRA_Clock;
  assign pe_c1_r0__CGRA_Clock = CGRA_Clock;
  assign pe_c1_r1__CGRA_Clock = CGRA_Clock;
  assign pe_c1_r2__CGRA_Clock = CGRA_Clock;
  assign pe_c2_r0__CGRA_Clock = CGRA_Clock;
  assign pe_c2_r1__CGRA_Clock = CGRA_Clock;
  assign pe_c2_r2__CGRA_Clock = CGRA_Clock;
  assign rf_c0_r1__CGRA_Clock = CGRA_Clock;
  assign rf_c0_r2__CGRA_Clock = CGRA_Clock;
  assign rf_c1_r1__CGRA_Clock = CGRA_Clock;
  assign rf_c1_r2__CGRA_Clock = CGRA_Clock;
  assign rf_c2_r1__CGRA_Clock = CGRA_Clock;
  assign rf_c2_r2__CGRA_Clock = CGRA_Clock;
  assign context_cell__CGRA_Reset = CGRA_Reset;
  assign context_counter_drf__CGRA_Reset = CGRA_Reset;
  assign context_counter_io0__CGRA_Reset = CGRA_Reset;
  assign context_counter_io1__CGRA_Reset = CGRA_Reset;
  assign context_counter_io2__CGRA_Reset = CGRA_Reset;
  assign context_counter_mem0__CGRA_Reset = CGRA_Reset;
  assign context_counter_mem1__CGRA_Reset = CGRA_Reset;
  assign context_counter_mem2__CGRA_Reset = CGRA_Reset;
  assign context_counter_pe_c0_r0__CGRA_Reset = CGRA_Reset;
  assign context_counter_pe_c0_r1__CGRA_Reset = CGRA_Reset;
  assign context_counter_pe_c0_r2__CGRA_Reset = CGRA_Reset;
  assign context_counter_pe_c1_r0__CGRA_Reset = CGRA_Reset;
  assign context_counter_pe_c1_r1__CGRA_Reset = CGRA_Reset;
  assign context_counter_pe_c1_r2__CGRA_Reset = CGRA_Reset;
  assign context_counter_pe_c2_r0__CGRA_Reset = CGRA_Reset;
  assign context_counter_pe_c2_r1__CGRA_Reset = CGRA_Reset;
  assign context_counter_pe_c2_r2__CGRA_Reset = CGRA_Reset;
  assign context_counter_rf_c0_r1__CGRA_Reset = CGRA_Reset;
  assign context_counter_rf_c0_r2__CGRA_Reset = CGRA_Reset;
  assign context_counter_rf_c1_r1__CGRA_Reset = CGRA_Reset;
  assign context_counter_rf_c1_r2__CGRA_Reset = CGRA_Reset;
  assign context_counter_rf_c2_r1__CGRA_Reset = CGRA_Reset;
  assign context_counter_rf_c2_r2__CGRA_Reset = CGRA_Reset;
  assign drf__CGRA_Reset = CGRA_Reset;
  assign io_top_0__CGRA_Reset = CGRA_Reset;
  assign io_top_1__CGRA_Reset = CGRA_Reset;
  assign io_top_2__CGRA_Reset = CGRA_Reset;
  assign pe_c0_r0__CGRA_Reset = CGRA_Reset;
  assign pe_c0_r1__CGRA_Reset = CGRA_Reset;
  assign pe_c0_r2__CGRA_Reset = CGRA_Reset;
  assign pe_c1_r0__CGRA_Reset = CGRA_Reset;
  assign pe_c1_r1__CGRA_Reset = CGRA_Reset;
  assign pe_c1_r2__CGRA_Reset = CGRA_Reset;
  assign pe_c2_r0__CGRA_Reset = CGRA_Reset;
  assign pe_c2_r1__CGRA_Reset = CGRA_Reset;
  assign pe_c2_r2__CGRA_Reset = CGRA_Reset;
  assign rf_c0_r1__CGRA_Reset = CGRA_Reset;
  assign rf_c0_r2__CGRA_Reset = CGRA_Reset;
  assign rf_c1_r1__CGRA_Reset = CGRA_Reset;
  assign rf_c1_r2__CGRA_Reset = CGRA_Reset;
  assign rf_c2_r1__CGRA_Reset = CGRA_Reset;
  assign rf_c2_r2__CGRA_Reset = CGRA_Reset;
  assign context_cell__CGRA_Enable = CGRA_Enable;
  assign context_counter_drf__CGRA_Enable = CGRA_Enable;
  assign context_counter_io0__CGRA_Enable = CGRA_Enable;
  assign context_counter_io1__CGRA_Enable = CGRA_Enable;
  assign context_counter_io2__CGRA_Enable = CGRA_Enable;
  assign context_counter_mem0__CGRA_Enable = CGRA_Enable;
  assign context_counter_mem1__CGRA_Enable = CGRA_Enable;
  assign context_counter_mem2__CGRA_Enable = CGRA_Enable;
  assign context_counter_pe_c0_r0__CGRA_Enable = CGRA_Enable;
  assign context_counter_pe_c0_r1__CGRA_Enable = CGRA_Enable;
  assign context_counter_pe_c0_r2__CGRA_Enable = CGRA_Enable;
  assign context_counter_pe_c1_r0__CGRA_Enable = CGRA_Enable;
  assign context_counter_pe_c1_r1__CGRA_Enable = CGRA_Enable;
  assign context_counter_pe_c1_r2__CGRA_Enable = CGRA_Enable;
  assign context_counter_pe_c2_r0__CGRA_Enable = CGRA_Enable;
  assign context_counter_pe_c2_r1__CGRA_Enable = CGRA_Enable;
  assign context_counter_pe_c2_r2__CGRA_Enable = CGRA_Enable;
  assign context_counter_rf_c0_r1__CGRA_Enable = CGRA_Enable;
  assign context_counter_rf_c0_r2__CGRA_Enable = CGRA_Enable;
  assign context_counter_rf_c1_r1__CGRA_Enable = CGRA_Enable;
  assign context_counter_rf_c1_r2__CGRA_Enable = CGRA_Enable;
  assign context_counter_rf_c2_r1__CGRA_Enable = CGRA_Enable;
  assign context_counter_rf_c2_r2__CGRA_Enable = CGRA_Enable;
  assign drf__CGRA_Enable = CGRA_Enable;
  assign io_top_0__CGRA_Enable = CGRA_Enable;
  assign io_top_1__CGRA_Enable = CGRA_Enable;
  assign io_top_2__CGRA_Enable = CGRA_Enable;
  assign pe_c0_r0__CGRA_Enable = CGRA_Enable;
  assign pe_c0_r1__CGRA_Enable = CGRA_Enable;
  assign pe_c0_r2__CGRA_Enable = CGRA_Enable;
  assign pe_c1_r0__CGRA_Enable = CGRA_Enable;
  assign pe_c1_r1__CGRA_Enable = CGRA_Enable;
  assign pe_c1_r2__CGRA_Enable = CGRA_Enable;
  assign pe_c2_r0__CGRA_Enable = CGRA_Enable;
  assign pe_c2_r1__CGRA_Enable = CGRA_Enable;
  assign pe_c2_r2__CGRA_Enable = CGRA_Enable;
  assign rf_c0_r1__CGRA_Enable = CGRA_Enable;
  assign rf_c0_r2__CGRA_Enable = CGRA_Enable;
  assign rf_c1_r1__CGRA_Enable = CGRA_Enable;
  assign rf_c1_r2__CGRA_Enable = CGRA_Enable;
  assign rf_c2_r1__CGRA_Enable = CGRA_Enable;
  assign rf_c2_r2__CGRA_Enable = CGRA_Enable;
  assign pe_c0_r0__in0[31:0] = io_top_0__out[31:0];
  assign context_counter_io0__Context_Used[1:0] = context_cell__Context_Used[1:0];
  assign context_counter_io1__Context_Used[1:0] = context_cell__Context_Used[1:0];
  assign context_counter_io2__Context_Used[1:0] = context_cell__Context_Used[1:0];
  assign context_counter_mem0__Context_Used[1:0] = context_cell__Context_Used[1:0];
  assign context_counter_mem1__Context_Used[1:0] = context_cell__Context_Used[1:0];
  assign context_counter_mem2__Context_Used[1:0] = context_cell__Context_Used[1:0];
  assign context_counter_pe_c0_r0__Context_Used[1:0] = context_cell__Context_Used[1:0];
  assign context_counter_pe_c0_r1__Context_Used[1:0] = context_cell__Context_Used[1:0];
  assign context_counter_pe_c0_r2__Context_Used[1:0] = context_cell__Context_Used[1:0];
  assign context_counter_pe_c1_r0__Context_Used[1:0] = context_cell__Context_Used[1:0];
  assign context_counter_pe_c1_r1__Context_Used[1:0] = context_cell__Context_Used[1:0];
  assign context_counter_pe_c1_r2__Context_Used[1:0] = context_cell__Context_Used[1:0];
  assign context_counter_pe_c2_r0__Context_Used[1:0] = context_cell__Context_Used[1:0];
  assign context_counter_pe_c2_r1__Context_Used[1:0] = context_cell__Context_Used[1:0];
  assign context_counter_pe_c2_r2__Context_Used[1:0] = context_cell__Context_Used[1:0];
  assign context_counter_drf__Context_Used[1:0] = context_cell__Context_Used[1:0];
  assign context_counter_rf_c0_r1__Context_Used[1:0] = context_cell__Context_Used[1:0];
  assign context_counter_rf_c0_r2__Context_Used[1:0] = context_cell__Context_Used[1:0];
  assign context_counter_rf_c1_r1__Context_Used[1:0] = context_cell__Context_Used[1:0];
  assign context_counter_rf_c1_r2__Context_Used[1:0] = context_cell__Context_Used[1:0];
  assign context_counter_rf_c2_r1__Context_Used[1:0] = context_cell__Context_Used[1:0];
  assign context_counter_rf_c2_r2__Context_Used[1:0] = context_cell__Context_Used[1:0];
  assign io_top_0__Context[1:0] = context_counter_io0__Context[1:0];
  assign pe_c1_r0__in0[31:0] = io_top_1__out[31:0];
  assign io_top_1__Context[1:0] = context_counter_io1__Context[1:0];
  assign pe_c2_r0__in0[31:0] = io_top_2__out[31:0];
  assign io_top_2__Context[1:0] = context_counter_io2__Context[1:0];
  assign imc_core_0__in0[31:0] = imc_mem_0__out[31:0];
  assign pe_c0_r0__in1[31:0] = imc_mem_0__out[31:0];
  assign pe_c1_r0__in1[31:0] = imc_mem_0__out[31:0];
  assign pe_c2_r0__in1[31:0] = imc_mem_0__out[31:0];
  assign imc_mem_0__Context[1:0] = context_counter_mem0__Context[1:0];
  assign imc_core_1__in0[31:0] = imc_mem_1__out[31:0];
  assign pe_c0_r1__in0[31:0] = imc_mem_1__out[31:0];
  assign pe_c1_r1__in0[31:0] = imc_mem_1__out[31:0];
  assign pe_c2_r1__in0[31:0] = imc_mem_1__out[31:0];
  assign imc_mem_1__Context[1:0] = context_counter_mem1__Context[1:0];
  assign imc_core_2__in0[31:0] = imc_mem_2__out[31:0];
  assign pe_c0_r2__in0[31:0] = imc_mem_2__out[31:0];
  assign pe_c1_r2__in0[31:0] = imc_mem_2__out[31:0];
  assign pe_c2_r2__in0[31:0] = imc_mem_2__out[31:0];
  assign imc_mem_2__Context[1:0] = context_counter_mem2__Context[1:0];
  assign pe_c0_r0__Context[1:0] = context_counter_pe_c0_r0__Context[1:0];
  assign io_top_0__in[31:0] = pe_c0_r0__out[31:0];
  assign imc_mem_0__in0[31:0] = pe_c0_r0__out[31:0];
  assign pe_c0_r1__in1[31:0] = pe_c0_r0__out[31:0];
  assign pe_c0_r2__in3[31:0] = pe_c0_r0__out[31:0];
  assign pe_c1_r0__in4[31:0] = pe_c0_r0__out[31:0];
  assign pe_c2_r0__in5[31:0] = pe_c0_r0__out[31:0];
  assign drf__in0[31:0] = pe_c0_r0__fu_to_rf[31:0];
  assign pe_c0_r1__Context[1:0] = context_counter_pe_c0_r1__Context[1:0];
  assign imc_mem_1__in0[31:0] = pe_c0_r1__out[31:0];
  assign pe_c0_r0__in3[31:0] = pe_c0_r1__out[31:0];
  assign pe_c0_r2__in1[31:0] = pe_c0_r1__out[31:0];
  assign pe_c1_r1__in4[31:0] = pe_c0_r1__out[31:0];
  assign pe_c2_r1__in4[31:0] = pe_c0_r1__out[31:0];
  assign rf_c0_r1__in0[31:0] = pe_c0_r1__fu_to_rf[31:0];
  assign pe_c0_r2__Context[1:0] = context_counter_pe_c0_r2__Context[1:0];
  assign imc_mem_2__in0[31:0] = pe_c0_r2__out[31:0];
  assign pe_c0_r0__in4[31:0] = pe_c0_r2__out[31:0];
  assign pe_c0_r1__in3[31:0] = pe_c0_r2__out[31:0];
  assign pe_c1_r2__in3[31:0] = pe_c0_r2__out[31:0];
  assign pe_c2_r2__in4[31:0] = pe_c0_r2__out[31:0];
  assign rf_c0_r2__in0[31:0] = pe_c0_r2__fu_to_rf[31:0];
  assign pe_c1_r0__Context[1:0] = context_counter_pe_c1_r0__Context[1:0];
  assign io_top_1__in[31:0] = pe_c1_r0__out[31:0];
  assign imc_mem_0__in1[31:0] = pe_c1_r0__out[31:0];
  assign pe_c0_r0__in2[31:0] = pe_c1_r0__out[31:0];
  assign pe_c1_r1__in1[31:0] = pe_c1_r0__out[31:0];
  assign pe_c1_r2__in4[31:0] = pe_c1_r0__out[31:0];
  assign pe_c2_r0__in3[31:0] = pe_c1_r0__out[31:0];
  assign drf__in1[31:0] = pe_c1_r0__fu_to_rf[31:0];
  assign pe_c1_r1__Context[1:0] = context_counter_pe_c1_r1__Context[1:0];
  assign imc_mem_1__in1[31:0] = pe_c1_r1__out[31:0];
  assign pe_c0_r1__in2[31:0] = pe_c1_r1__out[31:0];
  assign pe_c1_r0__in3[31:0] = pe_c1_r1__out[31:0];
  assign pe_c1_r2__in1[31:0] = pe_c1_r1__out[31:0];
  assign pe_c2_r1__in3[31:0] = pe_c1_r1__out[31:0];
  assign rf_c1_r1__in0[31:0] = pe_c1_r1__fu_to_rf[31:0];
  assign pe_c1_r2__Context[1:0] = context_counter_pe_c1_r2__Context[1:0];
  assign imc_mem_2__in1[31:0] = pe_c1_r2__out[31:0];
  assign pe_c0_r2__in2[31:0] = pe_c1_r2__out[31:0];
  assign pe_c1_r0__in5[31:0] = pe_c1_r2__out[31:0];
  assign pe_c1_r1__in3[31:0] = pe_c1_r2__out[31:0];
  assign pe_c2_r2__in2[31:0] = pe_c1_r2__out[31:0];
  assign rf_c1_r2__in0[31:0] = pe_c1_r2__fu_to_rf[31:0];
  assign pe_c2_r0__Context[1:0] = context_counter_pe_c2_r0__Context[1:0];
  assign io_top_2__in[31:0] = pe_c2_r0__out[31:0];
  assign imc_mem_0__in2[31:0] = pe_c2_r0__out[31:0];
  assign pe_c0_r0__in5[31:0] = pe_c2_r0__out[31:0];
  assign pe_c1_r0__in2[31:0] = pe_c2_r0__out[31:0];
  assign pe_c2_r1__in1[31:0] = pe_c2_r0__out[31:0];
  assign pe_c2_r2__in3[31:0] = pe_c2_r0__out[31:0];
  assign drf__in2[31:0] = pe_c2_r0__fu_to_rf[31:0];
  assign pe_c2_r1__Context[1:0] = context_counter_pe_c2_r1__Context[1:0];
  assign imc_mem_1__in2[31:0] = pe_c2_r1__out[31:0];
  assign pe_c0_r1__in4[31:0] = pe_c2_r1__out[31:0];
  assign pe_c1_r1__in2[31:0] = pe_c2_r1__out[31:0];
  assign pe_c2_r0__in2[31:0] = pe_c2_r1__out[31:0];
  assign pe_c2_r2__in1[31:0] = pe_c2_r1__out[31:0];
  assign rf_c2_r1__in0[31:0] = pe_c2_r1__fu_to_rf[31:0];
  assign pe_c2_r2__Context[1:0] = context_counter_pe_c2_r2__Context[1:0];
  assign imc_mem_2__in2[31:0] = pe_c2_r2__out[31:0];
  assign pe_c0_r2__in4[31:0] = pe_c2_r2__out[31:0];
  assign pe_c1_r2__in2[31:0] = pe_c2_r2__out[31:0];
  assign pe_c2_r0__in4[31:0] = pe_c2_r2__out[31:0];
  assign pe_c2_r1__in2[31:0] = pe_c2_r2__out[31:0];
  assign rf_c2_r2__in0[31:0] = pe_c2_r2__fu_to_rf[31:0];
  assign pe_c0_r0__rf_to_muxa[31:0] = drf__out0[31:0];
  assign pe_c0_r0__rf_to_muxout[31:0] = drf__out1[31:0];
  assign pe_c1_r0__rf_to_muxa[31:0] = drf__out2[31:0];
  assign pe_c1_r0__rf_to_muxout[31:0] = drf__out3[31:0];
  assign pe_c2_r0__rf_to_muxa[31:0] = drf__out4[31:0];
  assign pe_c2_r0__rf_to_muxout[31:0] = drf__out5[31:0];
  assign drf__Context[1:0] = context_counter_drf__Context[1:0];
  assign pe_c0_r1__rf_to_muxa[31:0] = rf_c0_r1__out0[31:0];
  assign pe_c0_r1__rf_to_muxout[31:0] = rf_c0_r1__out1[31:0];
  assign rf_c0_r1__Context[1:0] = context_counter_rf_c0_r1__Context[1:0];
  assign pe_c0_r2__rf_to_muxa[31:0] = rf_c0_r2__out0[31:0];
  assign pe_c0_r2__rf_to_muxout[31:0] = rf_c0_r2__out1[31:0];
  assign rf_c0_r2__Context[1:0] = context_counter_rf_c0_r2__Context[1:0];
  assign pe_c1_r1__rf_to_muxa[31:0] = rf_c1_r1__out0[31:0];
  assign pe_c1_r1__rf_to_muxout[31:0] = rf_c1_r1__out1[31:0];
  assign rf_c1_r1__Context[1:0] = context_counter_rf_c1_r1__Context[1:0];
  assign pe_c1_r2__rf_to_muxa[31:0] = rf_c1_r2__out0[31:0];
  assign pe_c1_r2__rf_to_muxout[31:0] = rf_c1_r2__out1[31:0];
  assign rf_c1_r2__Context[1:0] = context_counter_rf_c1_r2__Context[1:0];
  assign pe_c2_r1__rf_to_muxa[31:0] = rf_c2_r1__out0[31:0];
  assign pe_c2_r1__rf_to_muxout[31:0] = rf_c2_r1__out1[31:0];
  assign rf_c2_r1__Context[1:0] = context_counter_rf_c2_r1__Context[1:0];
  assign pe_c2_r2__rf_to_muxa[31:0] = rf_c2_r2__out0[31:0];
  assign pe_c2_r2__rf_to_muxout[31:0] = rf_c2_r2__out1[31:0];
  assign rf_c2_r2__Context[1:0] = context_counter_rf_c2_r2__Context[1:0];
  assign context_cell__ConfigIn = ConfigIn;
  assign drf__ConfigIn = context_cell__ConfigOut;
  assign io_top_0__ConfigIn = drf__ConfigOut;
  assign io_top_1__ConfigIn = io_top_0__ConfigOut;
  assign io_top_2__ConfigIn = io_top_1__ConfigOut;
  assign pe_c0_r0__ConfigIn = io_top_2__ConfigOut;
  assign pe_c0_r1__ConfigIn = pe_c0_r0__ConfigOut;
  assign pe_c0_r2__ConfigIn = pe_c0_r1__ConfigOut;
  assign pe_c1_r0__ConfigIn = pe_c0_r2__ConfigOut;
  assign pe_c1_r1__ConfigIn = pe_c1_r0__ConfigOut;
  assign pe_c1_r2__ConfigIn = pe_c1_r1__ConfigOut;
  assign pe_c2_r0__ConfigIn = pe_c1_r2__ConfigOut;
  assign pe_c2_r1__ConfigIn = pe_c2_r0__ConfigOut;
  assign pe_c2_r2__ConfigIn = pe_c2_r1__ConfigOut;
  assign rf_c0_r1__ConfigIn = pe_c2_r2__ConfigOut;
  assign rf_c0_r2__ConfigIn = rf_c0_r1__ConfigOut;
  assign rf_c1_r1__ConfigIn = rf_c0_r2__ConfigOut;
  assign rf_c1_r2__ConfigIn = rf_c1_r1__ConfigOut;
  assign rf_c2_r1__ConfigIn = rf_c1_r2__ConfigOut;
  assign rf_c2_r2__ConfigIn = rf_c2_r1__ConfigOut;
  assign ConfigOut = rf_c2_r2__ConfigOut;
  assign io_top_0__IOPin_bidir_in[31:0] = io_top_0_IOPin_bidir_in[31:0];
  assign io_top_0_IOPin_bidir_out[31:0] = io_top_0__IOPin_bidir_out[31:0];
  assign io_top_1__IOPin_bidir_in[31:0] = io_top_1_IOPin_bidir_in[31:0];
  assign io_top_1_IOPin_bidir_out[31:0] = io_top_1__IOPin_bidir_out[31:0];
  assign io_top_2__IOPin_bidir_in[31:0] = io_top_2_IOPin_bidir_in[31:0];
  assign io_top_2_IOPin_bidir_out[31:0] = io_top_2__IOPin_bidir_out[31:0];

endmodule //cgra_U0
