module Counter #(
    parameter CLK_FREQ = 25_000_000 
) (
    input  wire clk,
    input  wire rst_n,
    output wire [7:0] leds
);

localparam ONE_SECOND  = CLK_FREQ;
localparam HALF_SECOND = CLK_FREQ / 2;

reg [31:0] counter;

always @( posedge clk ) 
begin
    if(!rst_n) 
    begin
        counter <= 32'h0;
        leds    <= 8'b0;
    end 
    else 
    begin
        if( counter >= HALF_SECOND - 1 ) 
        begin
            counter <= 32'h0;
            leds    <= leds + 1;
        end 
        else 
        begin
            counter <= counter + 1;
        end
    end
end

endmodule
