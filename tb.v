`timescale 1ns / 1ps

module MipsCPU_TB;

    // Parameters
    parameter CLOCK_PERIOD = 10; // Clock period in nanoseconds
    
    // Signals
    reg clock = 0;              // Clock signal
    reg reset = 0;              // Reset signal
    
    wire [31:0] PCin;           // Input PC signal
    reg [31:0] PCout;           // Output PC signal
    
    wire [31:0] inst;           // Instruction signal
    
    wire RegDst, RegWrite, ALUSrc, MemtoReg, MemRead, MemWrite, Branch; // Control signals
    wire [1:0] ALUOp;           // ALU operation signal
    
    wire [4:0] WriteReg;        // Write register signal
    wire [31:0] ReadData1, ReadData2; // Read data signals
    
    wire [31:0] Extend32;       // Sign extension signal
    wire [31:0] ALU_B;          // ALU B signal
    
    wire [31:0] ShiftOut;       // Shift output signal
    
    wire [3:0] ALUCtl;          // ALU control signal
    wire Zero;                  // Zero signal
    wire [31:0] ALUOut;         // ALU output signal
    
    wire [31:0] Add_ALUOut;     // Add ALU output signal
    
    wire AndGateOut;            // AND gate output signal
    
    wire [31:0] ReadData;       // Data memory read data signal
    
    wire [31:0] WriteData_Reg;  // Register file write data signal
    
    // Instantiate the DUT
    MipsCPU dut (
        .clock(clock),
        .reset(reset),
        .PCin(PCin),
        .PCout(PCout),
        .inst(inst),
        .RegDst(RegDst),
        .RegWrite(RegWrite),
        .ALUSrc(ALUSrc),
        .MemtoReg(MemtoReg),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .Branch(Branch),
        .ALUOp(ALUOp),
        .WriteReg(WriteReg),
        .ReadData1(ReadData1),
        .ReadData2(ReadData2),
        .Extend32(Extend32),
        .ALU_B(ALU_B),
        .ShiftOut(ShiftOut),
        .ALUCtl(ALUCtl),
        .Zero(Zero),
        .ALUOut(ALUOut),
        .Add_ALUOut(Add_ALUOut),
        .AndGateOut(AndGateOut),
        .ReadData(ReadData),
        .WriteData_Reg(WriteData_Reg)
    );
    
    // Clock generation
    always #((CLOCK_PERIOD)/2) clock = ~clock;
    
    // Reset generation
    initial begin
        reset = 1;
        #100; // Reset for 100 ns
        reset = 0;
    end
    
    // Stimulus
    initial begin
        // Add your test vectors here
        
        // Example: PCin = 32'h00000000 (initial PC value)
        // Example: inst = 32'h8e120064 (lw $t6, 100($s0))
        // Example: Set other input signals accordingly
        
        // Add more test vectors as needed
        
        #1000; // Simulate for 1000 ns
        
        // End simulation
        $finish;
    end
    
    // Dumpfile generation
    initial begin
        $dumpfile("MipsCPU_TB.vcd");
        $dumpvars(0, MipsCPU_TB);
        #10; // Delay before dumping variables
    end
    
endmodule
