--
-- VMM registers and configuration
-- this block handles the 1616 bit serial configuration
-- streams
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
-- use IEEE.std_logic_arith.all;
-- use IEEE.numeric_bit.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_unsigned.all;
--use IEEE.std_logic_signed.all;

Library UNISIM;
use UNISIM.vcomponents.all;

entity vmm_cfg is
--generic(addr_width : natural := 6);
port
(
	clk_ila				    : in 	STD_LOGIC;
	clk200				    : in 	STD_LOGIC;
    vmm_clk_200             : in 	STD_LOGIC; 
    	
	clk100                  : in    STD_LOGIC;
    vmm_clk_100             : in 	STD_LOGIC; 
    	
	reset					: in 	STD_LOGIC;

	cfg_bit_in			     : in	std_logic ;
	cfg_bit_out			     : out	std_logic ;

    vmm_ena                   : out   std_logic ;
    vmm_wen                   : out   std_logic ;
  
    vmm_ckdt_en               : out   std_logic ;
    vmm_ckdt                  : in    std_logic ;
  
    vmm_ckart_en              : out   std_logic ;
    vmm_ckart                 : in    std_logic ;
  
    vmm_cktk_en		        : out   std_logic ;
    vmm_cktk                  : in    std_logic ; 
  
    vmm_cktp_en               : out   std_logic ;
    vmm_cktp                  : in    std_logic ; 
  
    vmm_ckbc_en               : out std_logic ;
    vmm_ckbc                  : in std_logic ; 
   
    vmm_data1                 : in    std_logic;
    vmm_data0                 : in    std_logic;
    vmm_art                   : in    std_logic;
    wr_en                     : buffer   std_logic;
    din                       : buffer   std_logic_vector(31 DOWNTO 0);
    dt_cntr_intg0_i           : out   integer ;
    dt_cntr_intg1_i           : out   integer ;
    vmm_data_buf_i            : out   std_logic_vector(37 downto 0) ;
    
    vmm_2cfg                  : out   std_logic_vector(2 downto 0) ;
    vmm_2display              : out   std_logic_vector(2 downto 0) ;
    mmfeID                    : out   std_logic_vector(3 downto 0) ;    
  -- bill did this using vio
  -- in future we will use registers
  --vmm_sel                   : out   std_logic_vector( 2 downto 0);
  --display_sel               : out   std_logic;

    LEDx                       : out   std_logic_vector( 2 downto 0);
    testX                      : in    std_logic;
  
	axi_reg_4 : in STD_LOGIC_VECTOR(31 downto 0);  
    axi_reg_5       ,axi_reg_6       ,axi_reg_7       ,axi_reg_8       ,axi_reg_9 :  in STD_LOGIC_VECTOR(31 downto 0);    
    axi_reg_10      ,axi_reg_11      ,axi_reg_12      ,axi_reg_13      ,axi_reg_14 : in STD_LOGIC_VECTOR(31 downto 0);  
    axi_reg_15      ,axi_reg_16      ,axi_reg_17      ,axi_reg_18      ,axi_reg_19 : in STD_LOGIC_VECTOR(31 downto 0);    
    axi_reg_20      ,axi_reg_21      ,axi_reg_22      ,axi_reg_23      ,axi_reg_24 : in STD_LOGIC_VECTOR(31 downto 0);  
    axi_reg_25      ,axi_reg_26      ,axi_reg_27      ,axi_reg_28      ,axi_reg_29 : in STD_LOGIC_VECTOR(31 downto 0); 
    axi_reg_30      ,axi_reg_31      ,axi_reg_32      ,axi_reg_33      ,axi_reg_34 : in STD_LOGIC_VECTOR(31 downto 0);  
    axi_reg_35      ,axi_reg_36      ,axi_reg_37      ,axi_reg_38      ,axi_reg_39 : in STD_LOGIC_VECTOR(31 downto 0);
    axi_reg_40      ,axi_reg_41      ,axi_reg_42      ,axi_reg_43      ,axi_reg_44 : in STD_LOGIC_VECTOR(31 downto 0);  
    axi_reg_45      ,axi_reg_46      ,axi_reg_47      ,axi_reg_48      ,axi_reg_49 : in STD_LOGIC_VECTOR(31 downto 0); 
    axi_reg_50      ,axi_reg_51      ,axi_reg_52      ,axi_reg_53      ,axi_reg_54 : in STD_LOGIC_VECTOR(31 downto 0);
    vmm_cfg_sel : in STD_LOGIC_VECTOR(31 downto 0);
    -- AXI bus interface to the FIFO --
    axi_clk : in std_logic;
    axi_pop_vmm1 : in std_logic;                              -- Pop (WE)
    axi_rdata_ls_vmm1 : out std_logic_vector(31 downto 0);    -- Data port for reading
    axi_rdata_rcnt_vmm1 : out std_logic_vector(31 downto 0)  -- how many values are in the FIFO?  

);
	
end vmm_cfg;

architecture rtl of vmm_cfg is

-- components are here
COMPONENT fifo_generator_0
  PORT (
  rst : IN STD_LOGIC;
  wr_clk : IN STD_LOGIC;
  rd_clk : IN STD_LOGIC;
  din : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
  wr_en : IN STD_LOGIC;
  rd_en : IN STD_LOGIC;
  dout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
  full : OUT STD_LOGIC;
  almost_full : OUT STD_LOGIC;
  empty : OUT STD_LOGIC;
  almost_empty : OUT STD_LOGIC;
  rd_data_count : OUT STD_LOGIC_VECTOR(14 DOWNTO 0);
  wr_data_count : OUT STD_LOGIC_VECTOR(14 DOWNTO 0)
);
END COMPONENT; 

-- need to ask bill how to add this
--COMPONENT ila_1
--    PORT (
--	   clk : IN STD_LOGIC;
--	   probe0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
--	   probe1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
--    );
--END COMPONENT  ;

--COMPONENT vio_0
--    PORT (
--	   clk : IN STD_LOGIC;
--	   probe_in0 : IN STD_LOGIC_VECTOR( 7 DOWNTO 0); 
--	   probe_out0 : OUT STD_LOGIC_VECTOR( 7 DOWNTO 0)
--    );
--END COMPONENT  ;

--    signal clk_ila         : std_logic;
	signal probe0       : STD_LOGIC_VECTOR(31 DOWNTO 0); 
    signal probe1       : STD_LOGIC_VECTOR(31 DOWNTO 0);
--	signal probe_in0    : STD_LOGIC_VECTOR(7 DOWNTO 0); 
--  signal probe_out0   : STD_LOGIC_VECTOR(7 DOWNTO 0);

    signal testX_i              : std_logic := '0';
    signal vmm_data0_ii         : std_logic := '0';
    signal vmm_data0_ii_ack     : std_logic := '0';
    signal vmm_ckdt_en_i        : std_logic ;
    signal vmm_ckdt_i           : std_logic ;
    signal dt_cntr              : std_logic_vector( 4 downto 0);
    signal dt_cntr_p1           : std_logic_vector( 4 downto 0);
    signal dt_cntr_p2           : std_logic_vector( 4 downto 0);
    signal dt_cntr_p3           : std_logic_vector( 4 downto 0);
    signal dt_cntr_p4           : std_logic_vector( 4 downto 0);
    signal dt_state             : std_logic_vector( 7 downto 0);
    signal dt_reset             : std_logic ;
    signal dt_done              : std_logic ;
        
    signal vmm_ckart_en_i       : std_logic ;
    signal vmm_ckart_i          : std_logic ;
    signal vmm_data1_i          : std_logic;
    signal vmm_data0_i          : std_logic;
    signal vmm_art_i            : std_logic;
    signal art_reset            : std_logic;
    signal art_done             : std_logic;
    signal art_data             : std_logic_vector( 7 downto 0) := x"00";
    signal art_state            : std_logic_vector( 3 downto 0) := x"0";
    
    signal clk_tk_sync_cnt : STD_LOGIC_VECTOR( 31 DOWNTO 0) :=x"00004047";
   
	signal vmm_clk_int_en       : std_logic;
    signal vmm_cktk_en_1_i      : std_logic;
    signal vmm_cktk_en_2_i      : std_logic;

    signal cktp_i               : std_logic;
    signal ckbc_i               : std_logic;
    signal vmm_ckbc_en_i        : std_logic ;
    signal vmm_cktp_en_i        : std_logic ;
    signal vmm_ena_vmm_cfg_sm   : std_logic ;    
--    signal ena_enable           : std_logic ;
    signal vmm_clk_token_i      : std_logic ;
    
	signal cfg_bit_in_i	   : std_logic;
	signal cfg_bit_out_i   : std_logic;		
	
    signal cfg_sm_cntr	   : std_logic_vector(31 downto 0);
    signal cfg_rst_ctr	   : std_logic_vector(31 downto 0);

	constant cfg_bits : integer := 1616 ; -- the useful bits
	constant cfg_bits_max : integer := 1632 ;
	
	type array_64x32bit  is array (0 to 63)  of std_logic_vector(31 downto 0);
	signal regs_out, regs_in: array_64x32bit;		

	signal statex : std_logic_vector(3 downto 0) ;
	signal bit_cntrx : std_logic_vector( 11 downto 0) ;
	
	signal vmm_run              : std_logic;
    signal cfg_sr_done          : std_logic ;
	signal vmm_ena_cfg_sr          : std_logic ; -- from VMM cfg SM
    signal vmm_wen_cfg_sr          : std_logic ; -- from VMM cfg SM
    signal vmm_rst_done         : std_logic ; -- from VMM cfg SM
    signal vmm_ena_cfg_rst         : std_logic ; -- from VMM reset SM
    signal vmm_wen_cfg_rst          : std_logic ; -- from VMM reset SM
    signal gbl_rst               : std_logic ;
    signal acq_rst               : std_logic ;
    	
	-- make two shift registers 1616 bits long.
	-- one for writing to VMM and one for reading from VMM
	signal vmm_cfg_in, vmm_cfg_out : std_logic_vector(cfg_bits_max-1 downto 0) ;
	
	-- a larger number here will lengthen the time between token pulses
	signal token_cntr : std_logic_vector(4 downto 0) ; -- 32 ns pulse every 640 ns
		
    type state_t is (s0, s1, s2, s3, s4, s5, s6, s7, s8);
-- s1 is global reset
-- s2 is config
-- s3 is config again
-- s4 is ckbc_enable
-- s5 is set enable high
-- s6 is cktp enable

   signal state  : state_t;
	
	signal counter1 : std_logic_vector (31 downto 0) := X"00000000";	
	signal ckbc_cntr : std_logic_vector (0 downto 0) := (others=>'0');
	signal delay_cntr : std_logic_vector (31 downto 0) := X"00000000";

    signal LEDxi    : std_logic_vector( 2 downto 0);
    signal rst_state    : std_logic_vector( 2 downto 0);		
    
     SIGNAL wr_clk_i                       :   STD_LOGIC := '0';
     SIGNAL rd_clk_i                       :   STD_LOGIC := '0';
     SIGNAL wr_data_count                  :   STD_LOGIC_VECTOR(14 DOWNTO 0) := (OTHERS => '0');
     SIGNAL rd_data_count                  :   STD_LOGIC_VECTOR(14 DOWNTO 0) := (OTHERS => '0');
     SIGNAL almost_full                    :   STD_LOGIC := '0';
     SIGNAL almost_empty                   :   STD_LOGIC := '1';
     SIGNAL rst                            :   STD_LOGIC := '0';
     SIGNAL prog_full                      :   STD_LOGIC := '0';
     SIGNAL prog_empty                     :   STD_LOGIC := '1';
     SIGNAL rd_en                          :   STD_LOGIC := '0';
     SIGNAL din_i                          :   STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
     -- SIGNAL din                            :   STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');    
     SIGNAL dout                           :   STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
     SIGNAL full                           :   STD_LOGIC := '0';
     SIGNAL empty                          :   STD_LOGIC := '1';
 
    SIGNAL vmm_data_buf                     :  STD_LOGIC_VECTOR( 37 DOWNTO 0) := (OTHERS => '0');
 
    signal dt_cntr_intg                     :  integer := 0;
    signal dt_cntr_intg0                    :  integer := 0;
    signal dt_cntr_intg1                    :  integer := 1;
    SIGNAL vmm_2cfg_i                       :  STD_LOGIC_VECTOR( 2 DOWNTO 0) := (OTHERS => '0');
    signal vmm_2display_i                   :  STD_LOGIC_VECTOR( 2 DOWNTO 0) := (OTHERS => '0');
    signal mmfeID_i                         :  STD_LOGIC_VECTOR( 3 DOWNTO 0) := (OTHERS => '0');
  
begin
		
--	--=============================--
	process( reset, clk100)
--	--=============================--

begin
    if rising_edge( clk100) then 
        vmm_2cfg_i        <= vmm_cfg_sel(2 downto 0) ;
        vmm_2display_i    <= vmm_cfg_sel(6 downto 4) ;
        mmfeID_i          <= vmm_cfg_sel(11 downto 8) ;
	  if (reset='1') then
		-- put config data here
		regs_out(	 0	  ) <= axi_reg_4 ;
        regs_out(    1    ) <= axi_reg_5 ;
        regs_out(    2    ) <= axi_reg_6 ;
        regs_out(    3    ) <= axi_reg_7 ;
        regs_out(    4    ) <= axi_reg_8 ;
        regs_out(    5    ) <= axi_reg_9 ;
        regs_out(    6    ) <= axi_reg_10 ;
        regs_out(    7    ) <= axi_reg_11 ;
        regs_out(    8    ) <= axi_reg_12 ;
        regs_out(    9    ) <= axi_reg_13 ;
        regs_out(    10    ) <= axi_reg_14 ;
        regs_out(    11    ) <= axi_reg_15 ;
        regs_out(    12    ) <= axi_reg_16 ;
        regs_out(    13    ) <= axi_reg_17 ;
        regs_out(    14    ) <= axi_reg_18 ;
        regs_out(    15    ) <= axi_reg_19 ;
        regs_out(    16    ) <= axi_reg_20 ;
        regs_out(    17    ) <= axi_reg_21 ;
        regs_out(    18    ) <= axi_reg_22 ;
        regs_out(    19    ) <= axi_reg_23 ;
        regs_out(    20    ) <= axi_reg_24 ;
        regs_out(    21    ) <= axi_reg_25 ;
        regs_out(    22    ) <= axi_reg_26 ;
        regs_out(    23    ) <= axi_reg_27 ;
        regs_out(    24    ) <= axi_reg_28 ;
        regs_out(    25    ) <= axi_reg_29 ;
        regs_out(    26    ) <= axi_reg_30 ;
        regs_out(    27    ) <= axi_reg_31 ;
        regs_out(    28    ) <= axi_reg_32 ;
        regs_out(    29    ) <= axi_reg_33 ;
        regs_out(    30    ) <= axi_reg_34 ;
        regs_out(    31    ) <= axi_reg_35 ;
        regs_out(    32    ) <= axi_reg_36 ;
        regs_out(    33    ) <= axi_reg_37 ;
        regs_out(    34    ) <= axi_reg_38 ;
        regs_out(    35    ) <= axi_reg_39 ;
        regs_out(    36    ) <= axi_reg_40 ;
        regs_out(    37    ) <= axi_reg_41 ;
        regs_out(    38    ) <= axi_reg_42 ; --
        regs_out(    39    ) <= axi_reg_43 ;
        regs_out(    40    ) <= axi_reg_44 ;
        regs_out(    41    ) <= axi_reg_45 ;
        regs_out(    42    ) <= axi_reg_46 ;
        regs_out(    43    ) <= axi_reg_47 ;
        regs_out(    44    ) <= axi_reg_48 ;
        regs_out(    45    ) <= axi_reg_49 ;
        regs_out(    46    ) <= axi_reg_50 ;
        regs_out(    47    ) <= axi_reg_51 ;
        regs_out(    48    ) <= axi_reg_52 ;
        regs_out(    49    ) <= axi_reg_53 ;
        regs_out(    50    ) <= axi_reg_54 ; -- only low 16 used
        regs_out(    51    ) <= (others => '0') ;
        regs_out(    52    ) <= (others => '0') ;
        regs_out(    53    ) <= (others => '0') ;
        regs_out(    54    ) <= (others => '0') ;
        regs_out(    55    ) <= (others => '0') ;
        regs_out(    56    ) <= (others => '0') ;
        regs_out(    57    ) <= (others => '0') ;
        regs_out(    58    ) <= (others => '0') ;
        regs_out(    59    ) <= (others => '0') ;
        regs_out(    61    ) <= (others => '0') ;
        regs_out(    62    ) <= (others => '0') ;
        regs_out(    63    ) <= (others => '0') ;
      else NULL;        
	  end if;
	else NULL;  
    end if;
	end process;

    vmm_2cfg <= vmm_2cfg_i; 
    vmm_2display <= vmm_2display_i ;
    mmfeID <= mmfeID_i ;
--	

	-- VMM config mux select
--	vmm_vmm_sel <= regs_out(63)(14 downto 12) ;

-- kjohns - we have to add the read in of the do bits later
-- commented out for now
-- the comparison of di and do is also commented out for now
-- and we need to add this back in later
	-- config in
--	process(vmm_clk_int_i, reset)
--	begin -- a load here will reset the 1616 bit word.
--		if (reset = '1') then
--			 vmm_cfg_in <= (others=>'1') ; -- in from VMM
--			 -- need 51 32 bit words for test value 
--		else
--			if falling_edge(vmm_clk_int_i) then -- we need to watch how the serial stream gets captured
--				if (vmm_rx_en_int = '1') then
--					-- if we send out LSB first
--					vmm_cfg_in <= cfg_bit_in & vmm_cfg_in(cfg_bits_max-1 downto 1) ; -- shift -> (only use top 1616)
--					-- if we send out MSB first
--					--- vmm_cfg_in <= vmm_cfg_in(cfg_bits_max-2 downto 0) & cfg_bit_in ; -- shift <- (only use low 1616)
--				end if ;
--			end if ;
--		end if ;
--	end process ;

	-- map vmm cfg to reg_in registers
	-- a continuous assignment
	process( clk200, reset, vmm_cfg_in, cfg_sr_done, regs_in)
    begin
        if (reset = '1') then
            regs_in <= (others => (others => '0')) ;
        else

		regs_in(	0	) <= vmm_cfg_in(	 31	 downto 	 0   );
		regs_in(	1	) <= vmm_cfg_in(	 63	 downto 	 32	);
		regs_in(	2	) <= vmm_cfg_in(	 95	 downto      64	);
		regs_in(	3	) <= vmm_cfg_in(	127	 downto 	 96	);
		regs_in(	4	) <= vmm_cfg_in(	159	 downto 	128	);
		regs_in(	5	) <= vmm_cfg_in(	191	 downto 	160	);
		regs_in(	6	) <= vmm_cfg_in(	223	 downto 	192	);
		regs_in(	7	) <= vmm_cfg_in(	255	 downto 	224	);
		regs_in(	8	) <= vmm_cfg_in(	287	 downto 	256	);
		regs_in(	9	) <= vmm_cfg_in(	319	 downto 	288	);
		regs_in(	10	) <= vmm_cfg_in(	351	 downto 	320	);
		regs_in(	11	) <= vmm_cfg_in(	383	 downto 	352	);
		regs_in(	12	) <= vmm_cfg_in(	415	 downto 	384	);
		regs_in(	13	) <= vmm_cfg_in(	447	 downto 	416	);
		regs_in(	14	) <= vmm_cfg_in(	479	 downto 	448	);
		regs_in(	15	) <= vmm_cfg_in(	511	 downto 	480	);
		regs_in(	16	) <= vmm_cfg_in(	543	 downto 	512	);
		regs_in(	17	) <= vmm_cfg_in(	575	 downto 	544	);
		regs_in(	18	) <= vmm_cfg_in(	607	 downto 	576	);
		regs_in(	19	) <= vmm_cfg_in(	639	 downto 	608	);
		regs_in(	20	) <= vmm_cfg_in(	671	 downto 	640	);
		regs_in(	21	) <= vmm_cfg_in(	703	 downto 	672	);
		regs_in(	22	) <= vmm_cfg_in(	735	 downto 	704	);
		regs_in(	23	) <= vmm_cfg_in(	767	 downto 	736	);
		regs_in(	24	) <= vmm_cfg_in(	799	 downto 	768	);
		regs_in(	25	) <= vmm_cfg_in(	831	 downto 	800	);
		regs_in(	26	) <= vmm_cfg_in(	863	 downto 	832	);
		regs_in(	27	) <= vmm_cfg_in(	895	 downto 	864	);
		regs_in(	28	) <= vmm_cfg_in(	927	 downto 	896	);
		regs_in(	29	) <= vmm_cfg_in(	959	 downto 	928	);
		regs_in(	30	) <= vmm_cfg_in(	991	 downto 	960	);
		regs_in(	31	) <= vmm_cfg_in(	1023	 downto 	992	);
		regs_in(	32	) <= vmm_cfg_in(	1055	 downto 	1024	);
		regs_in(	33	) <= vmm_cfg_in(	1087	 downto 	1056	);
		regs_in(	34	) <= vmm_cfg_in(	1119	 downto 	1088	);
		regs_in(	35	) <= vmm_cfg_in(	1151	 downto 	1120	);
		regs_in(	36	) <= vmm_cfg_in(	1183	 downto 	1152	);
		regs_in(	37	) <= vmm_cfg_in(	1215	 downto 	1184	);
		regs_in(	38	) <= vmm_cfg_in(	1247	 downto 	1216	);
		regs_in(	39	) <= vmm_cfg_in(	1279	 downto 	1248	);
		regs_in(	40	) <= vmm_cfg_in(	1311	 downto 	1280	);
		regs_in(	41	) <= vmm_cfg_in(	1343	 downto 	1312	);
		regs_in(	42	) <= vmm_cfg_in(	1375	 downto 	1344	);
		regs_in(	43	) <= vmm_cfg_in(	1407	 downto 	1376	);
		regs_in(	44	) <= vmm_cfg_in(	1439	 downto 	1408	);
		regs_in(	45	) <= vmm_cfg_in(	1471	 downto 	1440	);
		regs_in(	46	) <= vmm_cfg_in(	1503	 downto 	1472	);
		regs_in(	47	) <= vmm_cfg_in(	1535	 downto 	1504	);
		regs_in(	48	) <= vmm_cfg_in(	1567	 downto 	1536	);
		regs_in(	49	) <= vmm_cfg_in(	1599	 downto 	1568	);
		regs_in(	50	) <= vmm_cfg_in(	1631	 downto 	1600	);
			
		end if ;
	end process ;

-- send out most significant bit
--	cfg_bit_out <= vmm_cfg_out(cfg_bits-1) ; -- send out bit 1616
	
	-- compare the two 1616 bit strings
--	comp_vectr : entity work.comp_vect
--	generic map(max_bits => cfg_bits) 
--	port map(A => vmm_cfg_out(cfg_bits-1 downto 0), -- tx stream. hi 16 unused
--				B => vmm_cfg_in(cfg_bits_max-1 downto 16), -- rx stream. low 16 unused -- changed to 17 by SAJONES, change back to 16
--				res => vect_eq -- 1=equal
--				) ;

	--
	-- state machine
	--

    config_vmm_fsm : process( vmm_clk_200)
-- cfg_sm_cntr is the state machine counter

    begin
	if rising_edge( vmm_clk_200) then
		if (reset = '1') then

			state <= s0 ;
			cfg_sm_cntr <= (others =>'0');
			
			vmm_run <= '0' ; -- cfg run
            gbl_rst <= '0' ; -- gbl rst
            acq_rst <= '0' ; -- acq rst
			vmm_ena_vmm_cfg_sm <= '0' ; -- enable ENA            
            vmm_ckart_en_i <= '0' ;
            vmm_cktp_en_i <= '0' ; -- enable cktp
            vmm_ckbc_en_i <= '0' ; -- enable ckbc
            vmm_cktk_en_1_i <= '0' ; -- enable token clock        

		else	
		
         case state is
               when s0 => -- initialize and do the global reset
                      LEDxi <= b"000";

                      if( cfg_sm_cntr = x"00000000") then
--  at cfg_sm_cntr = 0, start global reset
--  have to find where this is done exactly
--  but at the moment is does occur
                          vmm_run <= '0' ; -- cfg run
                          acq_rst <= '0' ; -- acq rst
			     	      vmm_ena_vmm_cfg_sm <= '0' ; -- enable ENA                          
                          vmm_ckart_en_i <= '0' ;
                          vmm_cktp_en_i <= '0' ; -- enable cktp
                          vmm_ckbc_en_i <= '0' ; -- enable ckbc
                          vmm_cktk_en_1_i <= '0' ; -- enable token clock

                          gbl_rst <= '1' ; 
                          cfg_sm_cntr <= cfg_sm_cntr + '1';
 
				    else 
				    
                              if( cfg_sm_cntr = x"00000040") then
-- at cfg_sm_cntr = 40, turn the global reset off                              
                                  gbl_rst <= '0' ; 
                                  cfg_sm_cntr <= cfg_sm_cntr + '1';
                              else
-- at cfg_cm_cntr = 100000, go to the next state and also reset the counter 
                                   if( cfg_sm_cntr = x"00100000") then
                                      state <= s1 ; 
                                      cfg_sm_cntr <= (others =>'0');
                                  else
--  otherwise, just increment the counter                                  
                                      cfg_sm_cntr <= cfg_sm_cntr + '1';
                                  end if ;
                              end if ;
                          end if ;
                                                    
                when s1 => -- send the config bits

							LEDxi <= b"001";
--  the config state follows the same form as the global reset
--  in this case vmm_run turns the config on
--  and the same cfg_cm_cntr are used to turn it off and then wait to go
--  to state s2
							if( cfg_sm_cntr = x"00000000") then
								vmm_run <= '1' ; -- cfg run
								cfg_sm_cntr <= cfg_sm_cntr + '1';
							else 
								if( cfg_sm_cntr = x"00000040") then
									vmm_run <= '0' ; -- cfg run
									cfg_sm_cntr <= cfg_sm_cntr + '1';
								else
--									if( cfg_sm_cntr = x"01ffffff") then
									if( cfg_sm_cntr = x"00100000") then
										state <= s2 ; 
										cfg_sm_cntr <= (others =>'0');
									else
										cfg_sm_cntr <= cfg_sm_cntr + '1';
									end if ;
								end if ;
							end if ;
							
			 when s2 => -- send the config bits again
--  and then we do the configuration again in the same way as in s1
							LEDxi <= b"010";
							
							if( cfg_sm_cntr = x"00000000") then
								vmm_run <= '1' ; -- cfg run
								cfg_sm_cntr <= cfg_sm_cntr + '1';
							else 
								if( cfg_sm_cntr = x"00000040") then
									vmm_run <= '0' ; -- cfg run
									cfg_sm_cntr <= cfg_sm_cntr + '1';
								else
									if( cfg_sm_cntr = x"00100000") then
										state <= s3 ; 
										cfg_sm_cntr <= (others =>'0');
									else
										cfg_sm_cntr <= cfg_sm_cntr + '1';
									end if ;
								end if ;
							end if ;


-- break code here!!!!!!!!!!!!!!

                when s3 => -- now start ckbc and ckart
--  starting the ckbc and the ckart is done in the same way
--  i don't know why the cfg_sm_cntr numbers are different here
--  also note nothing is "turned off" 
--  this state could be written more neatly					 
							LEDxi <= b"011";

							if( cfg_sm_cntr = x"00000000") then
								vmm_ckbc_en_i   <= '1' ;
								vmm_ckart_en_i  <= '1' ;
								cfg_sm_cntr     <= cfg_sm_cntr + '1';
 							else 
								if( cfg_sm_cntr = x"00000010") then
									cfg_sm_cntr <= cfg_sm_cntr + '1';
								else
									if( cfg_sm_cntr = x"00010000") then
										state <= s4 ; 
										cfg_sm_cntr <= (others =>'0');
									else
										cfg_sm_cntr <= cfg_sm_cntr + '1';
									end if ;
								end if ;
							end if ;

                when s4 => -- do the acquisition reset
							LEDxi <= b"100"; 
							if( cfg_sm_cntr = x"00000000") then
                                acq_rst <= '1' ; -- acq rst
                                cfg_sm_cntr <= cfg_sm_cntr + '1';
                            else 
                              if( cfg_sm_cntr = x"00000002") then
                                acq_rst <= '1' ; -- acq rst
                                cfg_sm_cntr <= cfg_sm_cntr + '1';
                              else 
                                if( cfg_sm_cntr = x"00000040") then
                                  acq_rst <= '0' ; 
                                  cfg_sm_cntr <= cfg_sm_cntr + '1';
                                else
                                  if( cfg_sm_cntr = x"00100000") then
                                    state <= s5 ; 
                                    cfg_sm_cntr <= (others =>'0');
                                  else
                                    cfg_sm_cntr <= cfg_sm_cntr + '1';
                                end if ;
                              end if ;
                           end if ;
                        end if ;

                when s5 => --  now set ena high - clear tk sync so can re-sync
                             
                                    LEDxi <= b"101";
        
                                    if( cfg_sm_cntr = x"00000400") then
                                        state <= s6; 
                                           vmm_ena_vmm_cfg_sm <= '1' ; 
                                        cfg_sm_cntr <= (others =>'0');
                                    else
                                        cfg_sm_cntr <= cfg_sm_cntr + '1';
                                    end if ;
         
        
                       when s6 =>    --  now enable test pulse clock
        
                                    LEDxi <= b"110";
        
                                    if( cfg_sm_cntr = x"00004000") then -- for ckbc = 40MHz --x-21
                                        vmm_cktp_en_i <= '1' ;
                                        state <= s7; 
                                        cfg_sm_cntr <= (others =>'0');
                                    else
                                        cfg_sm_cntr <= cfg_sm_cntr + '1';
                                    end if ;
        
        
                        when s7 =>    --  now enable token clock
                                    LEDxi <= b"111";
                                    
                                    if( cfg_sm_cntr = x"00004000") then
                                        vmm_cktk_en_1_i <= '1' ;
                                        cfg_sm_cntr <= (others =>'0');
                                    else
                                        cfg_sm_cntr <= cfg_sm_cntr + '1';
                                    end if ;
                                    
        
                        when others => 
                                    state <= s1 ;
                                    vmm_run <= '0' ; -- cfg run
                                    acq_rst <= '0' ; -- acq rst
                                    vmm_ena_vmm_cfg_sm <= '0' ; -- enable ENA
                                    vmm_ckart_en_i <= '0' ;
                                    vmm_cktp_en_i <= '0' ; -- enable cktp
                                    vmm_ckbc_en_i <= '0' ; -- enable ckbc
                                    vmm_cktk_en_1_i <= '0' ; -- enable token clock
                                    gbl_rst <= '0' ; 
                                    cfg_sm_cntr <= (others =>'0');
        
                            
                    end case;
                end if;
              end if;
                  
            end process config_vmm_fsm ;

	-- map output reg to vmm cfg
	-- this is really a continuous assignment....
	vmmcfgout_gen:
	for i in 0 to (cfg_bits_max/32)-1 generate -- 0 to 50 is 51x32=1632
			vmm_cfg_out( ((i*32)+32)-1 downto (i*32) ) <= regs_out(i) ;
	end generate ;


	vmm_ena  <= vmm_ena_vmm_cfg_sm or (vmm_ena_cfg_sr or vmm_ena_cfg_rst) ; -- let register set it high -- Sajones

    vmm_wen  <= vmm_wen_cfg_sr or vmm_wen_cfg_rst ;
    

	-- config out
	vmm_cfg_sr_inst : entity work.vmm_cfg_sr 
    generic map(cfg_bits => cfg_bits) -- for test use default of 32 not 1616
--    port map(   clk100           => clk100, -- main clock
    port map(   clk              => vmm_cktk, -- main clock
                rst              => reset, -- reset
                load_en          => '0', -- vmm_load_en_pulse, -- load word to be sent
                run              => vmm_run, -- start state machine cfg bit
                vmm_cfg_out      => vmm_cfg_out(cfg_bits-1 downto 0), -- only the low 1616 of 1632
                cfg_bit_out      => cfg_bit_out_i, -- serial out
                vmm_clk_int_en     => vmm_clk_int_en,
--                vmm_rx_en        => vmm_rx_en_int, -- enable the 1616 bit (rx) shift register
                vmm_ena          => vmm_ena_cfg_sr, -- or with cfg sm
                vmm_wen          => vmm_wen_cfg_sr, -- or with cfg sm
                statex           => statex,
                bit_cntrx        => bit_cntrx
    );

	vmm_cfg_rst_inst : entity work.vmm_cfg_rst
	port map(   clk            => vmm_clk_100, -- main clock
				rst            => reset, -- reset
				gbl_rst        => gbl_rst, -- input
				acq_rst        => acq_rst, -- input
    			vmm_ena        => vmm_ena_cfg_rst, -- or with cfg sm
				vmm_wen        => vmm_wen_cfg_rst, -- or with cfg sm
				rst_state       => rst_state,
				cfg_rst_ctr_e   => cfg_rst_ctr,
				done            => vmm_rst_done -- pulse
	);			
				
	LEDx <= LEDxi;

-- data0 edge trigger
-- the clock is the edge of data0
-- the output is held high until cleared by vmm_data0_ii_ack
   FDCE_inst_1 : FDCE
   generic map (
      INIT => '0') -- Initial value of register ('0' or '1')  
   port map (
      Q => vmm_data0_ii,        -- Data output
      C => vmm_data0_i,         -- Clock input
      CE => '1',                -- Clock enable input
      CLR => vmm_data0_ii_ack,  -- Asynchronous clear input which is active high
      D => '1'                  -- Data input
   );
    
    -- acquisition read out to fifo process
	process( vmm_clk_200, reset, dt_cntr, vmm_cktk_en_2_i, vmm_data0_ii, vmm_data0_ii_ack)

	begin
	--	if falling_edge( clk200) then
		if rising_edge( vmm_clk_200) then
			if( reset = '1') then
				vmm_data0_ii_ack <='1';             -- reset the trigger FF
				dt_state <= (others => '0');        -- init readout seq state
                vmm_cktk_en_2_i <= '1';             -- en cktk
                wr_en <= '0';                       -- no fifo writes
                art_reset <= '1';
                dt_reset <= '1';                    -- hold the ro process in reset
                
			else
			    case dt_state is
		   	        when x"00" =>                    -- init the RO sequence
                         vmm_data0_ii_ack <='0';            -- clear the FF reset - arms the trigger
                         vmm_cktk_en_2_i <= '1';            -- cktk enabled
                         wr_en <= '0';                      -- no fifo writes
                         dt_reset <= '1';                   -- hold ro process in reset
                         art_reset <= '0';
                         dt_state <= x"01";                 -- go tto wait state
                                         
		   	        when x"01" =>                     --wait for data0
                        if( vmm_data0_ii = '1') then        -- gotta live one
                            vmm_cktk_en_2_i <= '0';         -- turn off the cktk
                            art_reset <= '0';
                            dt_reset <= '0';                -- enable the readout process
                            dt_state <= x"03";              -- start the readout sequence
                        else
                            art_reset <= '0';
                            dt_state <= x"01";              -- else wait
                         end if;                       
                  
-- kjohns removes this state, unclear if it is necessary                  
-- 		   	       when x"02" =>
--                        vmm_cktk_en_2_i <= '0';         -- turn off the cktk -- added redundant to make it work -- vivado bug?
--                        dt_state <= x"03";                --start the readout

                   when x"03" =>
                        if( dt_done = '1') then
                            dt_state <= x"04";               
                        else
                            dt_state <= x"03";             -- else we are waiting               
                        end if;

                   when x"04" =>                          -- copy first half of buffer to fifo  
                        din_i <= b"000000" & vmm_data_buf( 25 downto 0);  
                        art_reset <= '1';
                        dt_state <= x"05";               

                   when x"05" =>
                        wr_en <= '1';
                        art_reset <= '1';
                        dt_state <= x"06";               

                   when x"06" =>
                        wr_en <= '0';
                        art_reset <= '1';
                        dt_state <= x"07";               

                   when x"07" =>                           -- copy second half of buffer to fifo  
                        din_i <= x"beef" & b"0000" & vmm_data_buf( 37 downto 26);
                        art_reset <= '1';
                        dt_state <= x"08";               

                   when x"08" =>
                        wr_en <= '1';
                        art_reset <= '0';
                        dt_state <= x"09";               

                   when x"09" =>
                        wr_en <= '0';
                        art_reset <= '0';
                        dt_state <= x"0A";               

		   	       when x"0A" =>                          -- start the cleanup
                        vmm_cktk_en_2_i <= '1';           -- cktk enabled 
        				vmm_data0_ii_ack <='1';           -- set the FF reset
        				dt_reset <= '1';                  -- hold ro process in reset
                        art_reset <= '0';
                        dt_state <= x"00";                -- start the readout

                   when others => 
        				vmm_data0_ii_ack <='1';             -- reset the trigger FF
                        vmm_cktk_en_2_i <= '1';             -- en cktk
                        wr_en <= '0';                       -- no fifo writes
                        dt_reset <= '1';                    -- hold the ro process in reset
                        art_reset <= '1';
                        dt_state <= (others => '0');        -- init readout seq state
                        
                end case;
            end if;
        end if;
	end process ;

    din <= din_i;
    
     --Clock in data0 and data1 on ckdt
	process( vmm_ckdt_i, reset, dt_reset, vmm_data0_i, vmm_data1_i, dt_cntr_intg0, dt_cntr_intg1)
     begin
         if rising_edge( vmm_ckdt_i) then
 
             if( ( reset = '1') or (dt_reset = '1')) then                    -- reset
                   vmm_data_buf <=  (others => '0');
                   dt_cntr <= (others => '0');
                   dt_cntr_intg0 <= 0;     --use 2 delays at 100MHz, use 200MHz
                   dt_cntr_intg1 <= 1;
                   dt_cntr_intg <= 0;
                   vmm_ckdt_en_i <= '0';               -- disable ckdt
                   dt_done <= '0';
             
             else
                                
                   case dt_cntr_intg is
                   
                       when 0 =>  -- enable ckdt
                           vmm_ckdt_en_i <= '1'; 
                           dt_cntr_intg <= dt_cntr_intg + 1;
                       
                       when 1 =>  -- clock 1 sent, no data collected
                                  -- bill says clock will not actually start until next cycle after vmm_ckdt_en_i
                                  -- that is, it is sent here    
                           dt_cntr_intg <= dt_cntr_intg + 1;  -- but we have to wait for the data to come back from vmm
    
                        when 2 to 18 =>  --  clock 2 - 18 sent, data from clock 1 - 17 collected 
                           vmm_data_buf( dt_cntr_intg0) <= vmm_data0_i;   
                           vmm_data_buf( dt_cntr_intg1) <= vmm_data1_i; 
                           vmm_data_buf_i <= vmm_data_buf;                          
                           dt_cntr_intg <= dt_cntr_intg + 1;                                 -- increment the counter
                           dt_cntr_intg0 <= dt_cntr_intg0 + 2;     
                           dt_cntr_intg1 <= dt_cntr_intg1 + 2;                       
                       
                        when 19 => -- clock 19 (last) is sent, data from clock 18 collected
                           vmm_data_buf( dt_cntr_intg0) <= vmm_data0_i;   
                           vmm_data_buf( dt_cntr_intg1) <= vmm_data1_i; 
                           vmm_data_buf_i <= vmm_data_buf;                                                      
                           dt_cntr_intg <= dt_cntr_intg + 1;                                 -- increment the counter
                           dt_cntr_intg0 <= dt_cntr_intg0 + 2;     
                           dt_cntr_intg1 <= dt_cntr_intg1 + 2; 
                           vmm_ckdt_en_i <= '0'; -- disable ckdt, hopefully clock 20 is not sent                     
                           
                        when 20 =>  -- no more clocks are sent, data from clock 19 is collected
                           vmm_data_buf( dt_cntr_intg0) <= vmm_data0_i;   
                           vmm_data_buf( dt_cntr_intg1) <= vmm_data1_i;
                           vmm_data_buf_i <= vmm_data_buf;                            
                           dt_cntr_intg <= dt_cntr_intg + 1; 
                           dt_cntr_intg0 <= 0;
                           dt_cntr_intg1 <= 1; 
                           vmm_ckdt_en_i <= '0'; -- disable ckdt, hopefully clock 20 is not sent
                           
                        when 21 =>
                           dt_done <= '1';  -- end this mess
                           
                        when others =>  
                           vmm_ckdt_en_i <= '0';   -- continue to disable ckdt
                           dt_cntr_intg <= 22;
    
                   end case;
             end if;
         end if;
     end process ;
        
--   vmm_data_buf_i <= vmm_data_buf;


--control output assignments
    vmm_ckdt_en  <= vmm_ckdt_en_i;
    vmm_ckart_en <= vmm_ckart_en_i;
    vmm_cktp_en  <= vmm_cktp_en_i;
    vmm_ckbc_en  <= vmm_ckbc_en_i;
    vmm_cktk_en  <= ( vmm_cktk_en_1_i and vmm_cktk_en_2_i) or vmm_clk_int_en;

--clock input assignments
    vmm_ckdt_i  <= vmm_ckdt;
    vmm_ckart_i <= vmm_ckart;
  
--data input assignments
        vmm_data1_i  <= vmm_data1;
        vmm_data0_i  <= vmm_data0;
        vmm_art_i    <= vmm_art;
        cfg_bit_in_i <= cfg_bit_in;
    
        testX_i      <= testX;
	
-- data output assignments
	 cfg_bit_out <= cfg_bit_out_i;

     
fifo_inst_1 : fifo_generator_0
  PORT MAP (
    rst => reset,
    wr_clk => clk200,
    rd_clk => axi_clk,
    din => din_i,
    wr_en => wr_en,
    rd_en => axi_pop_vmm1,
    dout => axi_rdata_ls_vmm1,
    full => open,
    almost_full => open,
    empty => open,
    almost_empty => open,
    rd_data_count => axi_rdata_rcnt_vmm1(14 downto 0),
    wr_data_count => wr_data_count
  );
  
axi_rdata_rcnt_vmm1(31 downto 15) <= (others => '0');  -- Optimizer will take care of this.  


end rtl;
