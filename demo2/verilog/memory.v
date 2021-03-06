//3/5 -- Memory Stage 
module memory(aluResult, readData, writeData, memRead, memWrite, clk, rst, dump);

    input [15:0] aluResult, writeData; 
    input memRead, memWrite, clk, rst, dump;
    output [15:0] readData;
    wire memReadorWrite, halt, mem_err;

    assign memReadorWrite = (memWrite | memRead);
    assign halt = (dump | mem_err);

    //Instruction memory - 2nd instance after fetch
    memory2c_align memmod(.data_out(readData), .data_in(writeData), .addr(aluResult), .enable(memReadorWrite), .wr(memWrite), .createdump(dump), .clk(clk), .rst(rst), .err(mem_err)); 

endmodule
