`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:05:41 05/01/2020 
// Design Name: 
// Module Name:    alu 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module alu(
           input [15:0] A,B,  // ALU 16-bit Inputs                 
           input [3:0] ALU_Sel,// ALU Selection
           output [15:0] ALU_Out, // ALU 16-bit Output
           output zerobit // Zero bit Flag
    );
    reg [15:0] ALU_Result;
	 reg zero;
    //wire [8:0] tmp;
    assign ALU_Out = ALU_Result; // ALU out
	 assign zerobit = zero;
    //assign tmp = {1'b0,A} + {1'b0,B};
    //assign CarryOut = tmp[8]; // Carryout flag
    always @(*)
    begin
        case(ALU_Sel)
        4'b0000: // Addition
           ALU_Result = A + B ; 
        4'b0100: // XOR
           ALU_Result = A ^ B ;
        4'b0110: // OR
           ALU_Result = A | B;
        4'b0111: // AND
           ALU_Result = A & B;
        4'b1000: // IS EQUAL
				if(A == B)
           ALU_Result = 16'b0000000000000001;
         4'b1001: // IS NOT EQUAL
				if(A !=B )
           ALU_Result = 16'b0000000000000001;
         4'b1010: // Substraction
           ALU_Result = A - B;
         4'b1100: // A less than B
            if($signed(A) < $signed(B))
				ALU_Result = 16'b0000000000000001;
          4'b1101: //  A greater than equal B 
            if($signed(A) >= $signed(B))
				ALU_Result = 16'b0000000000000001;
          4'b1110: //  A less than B Unsigned
           if(A < B)
				ALU_Result = 16'b0000000000000001;
          4'b1111: //  A greater than equal to B unsigned 
           if(A >= B)
				ALU_Result = 16'b0000000000000001;
          default: ALU_Result = 0 ; 
        endcase
		  
		  if(ALU_Result)
				zero =0;
			else
				zero =1;
		  
    end

endmodule
