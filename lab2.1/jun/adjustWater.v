module adjustWater2(insideWaterLvl, diffOkInArr, diffOkInDept, up, down, enable, arrOutsideLvl, deptOutsideLvl, clk, reset); //enable input is the negated insideWaterLvlput of absDiff module 
	output reg [3:0] insideWaterLvl;									                           //while proper water difference is not met keep adjusting water level 
	output reg diffOkInArr, diffOkInDept; 
	input up, down, enable, clk, reset;                                                //otherwise stop adjusting aka stop counting up or down
	input [3:0] arrOutsideLvl, deptOutsideLvl;
	
	reg en2;
	
	reg [3:0] diffArrIns;
	reg [3:0] diffOutsIns;
	reg [3:0] absArrIns; 
	reg [3:0] absOutsIns;
	/*always@(*) begin
		diffArrIns = (arrOutsideLvl-insideWaterLvl); 
		diffOutsIns = (deptOutsideLvl-insideWaterLvl);
		if (diffArrIns[3] == 1) begin //if difference is negative 
		  absArrIns = (~diffArrIns)+1'b1;
		end else begin
			absArrIns = diffArrIns;
		end 
		
	    if(diffOutsIns[3] == 1) begin
		  absOutsIns = (~diffOutsIns)+1'b1;
		end else begin
		  absOutsIns = diffOutsIns;
		end 
	end */
	
	/*always@(*) begin
		//diffArrIns = (arrOutsideLvl-insideWaterLvl); 
		//diffOutsIns = (deptOutsideLvl-insideWaterLvl);
		if (arrOutsideLvl > insideWaterLvl) begin //if difference is negative 
			absArrIns = arrOutsideLvl-insideWaterLvl;
		end else begin
			absArrIns = insideWaterLvl - arrOutsideLvl;
		end 
		
	    if(deptOutsideLvl > insideWaterLvl) begin
		  absOutsIns = deptOutsideLvl-insideWaterLvl;
		end else begin
		  absOutsIns = insideWaterLvl-deptOutsideLvl;
		end 
	end*/
	
	
	always @(posedge clk) begin
		if (reset) begin
			insideWaterLvl <= 4'b0000;
			diffOkInArr <= 1'b0;
			diffOkInDept <= 1'b0; 
			//absArrIns <= 4'b1111;  //<<
			//absOutsIns <= 4'b1111;  //<<
            //en2 <= 1; //<<			
		end else begin
			if (enable) begin  //<< enable&&en2	
				if (up && down) begin
					insideWaterLvl <= insideWaterLvl; 
				end else if (up && (insideWaterLvl < 4'b1111)) begin
					insideWaterLvl <= insideWaterLvl + 1'b1;
				end else if (down && (insideWaterLvl > 4'b0000))begin
					insideWaterLvl <= insideWaterLvl - 1'b1;
				end else begin
					insideWaterLvl <= insideWaterLvl; 
				end //good 
				
				//---------------------------------------------------------------------------
				/*if (up && down) begin
					insideWaterLvl <= insideWaterLvl; 
				end else if (up && (insideWaterLvl < 4'b1111)) begin
					insideWaterLvl <= insideWaterLvl + 1'b1;
					//
					if ((insideWaterLvl == arrOutsideLvl -4'b0001) || (insideWaterLvl == arrOutsideLvl+4'b0001) || (insideWaterLvl == arrOutsideLvl) ) begin  // if (absArrIns <= 4'b0001) begin                       
						diffOkInArr <= 1'b1;
					end else begin
						diffOkInArr <= 1'b0;
					end 
					if ((insideWaterLvl == deptOutsideLvl-4'b0010) || (insideWaterLvl == deptOutsideLvl-4'b0001) || (insideWaterLvl == deptOutsideLvl) ) begin  // if (absOutsIns <= 4'b0001) begin                      
						diffOkInDept <= 1'b1;
					end else begin
						diffOkInDept <= 1'b0;
					end  //
				end else if (down && (insideWaterLvl > 4'b0000))begin
					insideWaterLvl <= insideWaterLvl - 1'b1;
					//
					if ((insideWaterLvl == arrOutsideLvl -4'b0001) || (insideWaterLvl == arrOutsideLvl+4'b0001) || (insideWaterLvl == arrOutsideLvl) ) begin  // if (absArrIns <= 4'b0001) begin                       
						diffOkInArr <= 1'b1;
					end else begin
						diffOkInArr <= 1'b0;
					end 
					if ((insideWaterLvl == deptOutsideLvl-4'b0010) || (insideWaterLvl == deptOutsideLvl-4'b0001) || (insideWaterLvl == deptOutsideLvl) ) begin  // if (absOutsIns <= 4'b0001) begin                      
						diffOkInDept <= 1'b1;
					end else begin
						diffOkInDept <= 1'b0;
					end  //
				end else begin
					insideWaterLvl <= insideWaterLvl; 
				end  */
				
				
				
				//--------------------------------------------------------------------------------
			    //(insideWaterLvl == (arrOutsideLvl-4'b0001)) || (insideWaterLvl == (arrOutsideLvl+4'b0001)) ||(insideWaterLvl == arrOutsideLvl) 
				
				if (up) begin
					if ((insideWaterLvl == arrOutsideLvl -4'b0010) || (insideWaterLvl == arrOutsideLvl-4'b0001) || (insideWaterLvl == arrOutsideLvl) ) begin  // if (absArrIns <= 4'b0001) begin                       
						diffOkInArr <= 1'b1;
						//en2 <= 0;//<<
					end else begin
						diffOkInArr <= 1'b0;
					end 
					
					// (insideWaterLvl == (deptOutsideLvl-4'b0001)) || (insideWaterLvl == (deptOutsideLvl+4'b0001)) ||(insideWaterLvl == deptOutsideLvl)
					if ((insideWaterLvl == deptOutsideLvl-4'b0010) || (insideWaterLvl == deptOutsideLvl-4'b0001) || (insideWaterLvl == deptOutsideLvl) ) begin  // if (absOutsIns <= 4'b0001) begin                      
						diffOkInDept <= 1'b1;//<<<<<<<<<<<<<<<<<<<<<
						//en2 <= 0;//<< 
					end else begin
						diffOkInDept <= 1'b0;
					end 
				end
				
				if (down) begin
				     //(insideWaterLvl == arrOutsideLvl -4'b0010) || (insideWaterLvl == arrOutsideLvl-4'b0001) || 
					if ((insideWaterLvl == arrOutsideLvl+4'b0010) || (insideWaterLvl == arrOutsideLvl+4'b0001) ||(insideWaterLvl == arrOutsideLvl) ) begin  // if (absArrIns <= 4'b0001) begin                       
						diffOkInArr <= 1'b1;
						//en2 <= 0;//<<
					end else begin
						diffOkInArr <= 1'b0;
					end 
					
					//(insideWaterLvl == deptOutsideLvl-4'b0010) || (insideWaterLvl == deptOutsideLvl-4'b0001) || 
					if ((insideWaterLvl == deptOutsideLvl+4'b0010) || (insideWaterLvl == deptOutsideLvl+4'b0001) ||(insideWaterLvl == deptOutsideLvl) ) begin  // if (absOutsIns <= 4'b0001) begin                      
						diffOkInDept <= 1'b1;//<<<<<<<<<<<<<<<<<<<<<
						//en2 <= 0;//<< 
					end else begin
						diffOkInDept <= 1'b0;
					end 
				end
				
				//-------------------------------------------------------------------------------
				/*if (absArrIns <= 4'b0001) begin  // if (absArrIns <= 4'b0001) begin                       
					diffOkInArr <= 1'b1;
					//en2 <= 0;//<<
				end else begin
					diffOkInArr <= 1'b0;
				end 
				
				if (absOutsIns <= 4'b0001) begin  // if (absOutsIns <= 4'b0001) begin                      
					diffOkInDept <= 1'b1;//<<<<<<<<<<<<<<<<<<<<<
					//en2 <= 0;//<< 
				end else begin
					diffOkInDept <= 1'b0;
				end */
				
				
				
				
			end else begin //good
				insideWaterLvl <= insideWaterLvl; //diffOk is true therefore stop changing the inner water level 
			end 
			
		end
	end
endmodule

