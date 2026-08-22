`timescale 1ns/1ps
`default_nettype none

module custom_adder #(
    parameter N = 8
)(
    input  wire [N-1:0] A,
    input  wire [N-1:0] B,
    input  wire         Cin,
    output wire [N-1:0] Sum,
    output wire         Cout
);

    // --------------------------------------------------------------------------
    // 1. The Carry Propagation Chain Wires
    // --------------------------------------------------------------------------
    // We need N + 1 slots. 
    // Slot 0 is the incoming global Cin.
    // Slots 1 to N are the generated MUX outputs (Y) from each column.
    wire [N:0] c_chain;

    // Inject the global external Cin into the very beginning of the chain
    assign c_chain[0] = Cin;

    // --------------------------------------------------------------------------
    // 2. The Custom MUX Column Chain Generation
    // --------------------------------------------------------------------------
    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : gen_mux_columns
            
            // Local cell wires for readability and matching your logic terms
            // wire E, S, P;
            wire S, P;
            
            // Your defined control signals per column
            // assign E = A[i] | B[i];       // Enable = A or B          // Actually we don't need it
            assign S = A[i] & B[i];       // Select line = Generate (A and B)
            assign P = A[i] ^ B[i];       // Propagate = A xor B
            
            // Your exact MUX logical formula: Y = E * (S*G + S'*P*Cin)
            // Note: c_chain[i] acts as the Cin entering this specific column.
            // The output of this MUX (Y) becomes c_chain[i+1], which enters the next column.
            assign c_chain[i+1] = ((S & S) | (~S & (P & c_chain[i])));
            
            // The Sum takes its normal Full Adder route: A xor B xor incoming carry
            assign Sum[i] = P ^ c_chain[i];
            
        end
    endgenerate

    // --------------------------------------------------------------------------
    // 3. Final Output Routing
    // --------------------------------------------------------------------------
    // Ultimate Cout is the MUX output (Y) exiting the absolute last column (bit N-1)
    assign Cout = c_chain[N];

endmodule

`default_nettype wire
