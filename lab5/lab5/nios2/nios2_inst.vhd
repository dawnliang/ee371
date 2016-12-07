	component nios2 is
		port (
			clk_clk                : in  std_logic                    := 'X';             -- clk
			reset_reset_n          : in  std_logic                    := 'X';             -- reset_n
			ctrl_sps_export        : out std_logic_vector(1 downto 0);                    -- export
			framing_sps_export     : in  std_logic_vector(1 downto 0) := (others => 'X'); -- export
			readytotransfer_export : in  std_logic                    := 'X';             -- export
			ctrl_scanner_export    : out std_logic_vector(1 downto 0);                    -- export
			in_scanner_export      : in  std_logic_vector(7 downto 0) := (others => 'X'); -- export
			out_scanner_export     : out std_logic_vector(7 downto 0);                    -- export
			out_sps_export         : out std_logic_vector(7 downto 0);                    -- export
			in_sps_export          : in  std_logic_vector(7 downto 0) := (others => 'X')  -- export
		);
	end component nios2;

	u0 : component nios2
		port map (
			clk_clk                => CONNECTED_TO_clk_clk,                --             clk.clk
			reset_reset_n          => CONNECTED_TO_reset_reset_n,          --           reset.reset_n
			ctrl_sps_export        => CONNECTED_TO_ctrl_sps_export,        --        ctrl_sps.export
			framing_sps_export     => CONNECTED_TO_framing_sps_export,     --     framing_sps.export
			readytotransfer_export => CONNECTED_TO_readytotransfer_export, -- readytotransfer.export
			ctrl_scanner_export    => CONNECTED_TO_ctrl_scanner_export,    --    ctrl_scanner.export
			in_scanner_export      => CONNECTED_TO_in_scanner_export,      --      in_scanner.export
			out_scanner_export     => CONNECTED_TO_out_scanner_export,     --     out_scanner.export
			out_sps_export         => CONNECTED_TO_out_sps_export,         --         out_sps.export
			in_sps_export          => CONNECTED_TO_in_sps_export           --          in_sps.export
		);

