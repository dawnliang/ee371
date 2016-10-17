library verilog;
use verilog.vl_types.all;
entity Camera is
    generic(
        zeroPercent     : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi0);
        halfPercent     : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi1);
        eightyPercent   : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi0);
        ninetyPercent   : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi1);
        hundredPercent  : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi1, Hi0);
        fiftyPercent    : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi0);
        standbySignal   : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi1);
        filmSignal      : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi1);
        noSignal        : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi1);
        lowPower        : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi0);
        standBy         : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi1);
        active          : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi0);
        reaches50       : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi1);
        signalToDownload: vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi0);
        reaches90       : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi1);
        downloading     : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi1, Hi0);
        idle            : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi1, Hi1);
        flushing        : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi0);
        low             : vl_logic_vector(0 to 6) := (Hi1, Hi0, Hi0, Hi0, Hi1, Hi1, Hi1);
        hold            : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi1);
        activeD         : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0);
        downloadD       : vl_logic_vector(0 to 6) := (Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi1);
        idleD           : vl_logic_vector(0 to 6) := (Hi0, Hi1, Hi1, Hi1, Hi1, Hi1, Hi1);
        flush           : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi1, Hi1, Hi1, Hi0);
        fifty           : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi1, Hi0, Hi0, Hi1, Hi0);
        eighty          : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        ninty           : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi1, Hi1, Hi0, Hi0, Hi0)
    );
    port(
        myStandby       : out    vl_logic;
        myFilm          : out    vl_logic;
        pauseBuffer     : out    vl_logic;
        emptyBuffer     : out    vl_logic;
        display         : out    vl_logic_vector(6 downto 0);
        outSignals      : out    vl_logic_vector(2 downto 0);
        rst             : in     vl_logic;
        clock           : in     vl_logic;
        download        : in     vl_logic;
        inSignals       : in     vl_logic_vector(2 downto 0);
        rstBehavior     : in     vl_logic;
        percentVal      : in     vl_logic_vector(3 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of zeroPercent : constant is 1;
    attribute mti_svvh_generic_type of halfPercent : constant is 1;
    attribute mti_svvh_generic_type of eightyPercent : constant is 1;
    attribute mti_svvh_generic_type of ninetyPercent : constant is 1;
    attribute mti_svvh_generic_type of hundredPercent : constant is 1;
    attribute mti_svvh_generic_type of fiftyPercent : constant is 1;
    attribute mti_svvh_generic_type of standbySignal : constant is 1;
    attribute mti_svvh_generic_type of filmSignal : constant is 1;
    attribute mti_svvh_generic_type of noSignal : constant is 1;
    attribute mti_svvh_generic_type of lowPower : constant is 1;
    attribute mti_svvh_generic_type of standBy : constant is 1;
    attribute mti_svvh_generic_type of active : constant is 1;
    attribute mti_svvh_generic_type of reaches50 : constant is 1;
    attribute mti_svvh_generic_type of signalToDownload : constant is 1;
    attribute mti_svvh_generic_type of reaches90 : constant is 1;
    attribute mti_svvh_generic_type of downloading : constant is 1;
    attribute mti_svvh_generic_type of idle : constant is 1;
    attribute mti_svvh_generic_type of flushing : constant is 1;
    attribute mti_svvh_generic_type of low : constant is 1;
    attribute mti_svvh_generic_type of hold : constant is 1;
    attribute mti_svvh_generic_type of activeD : constant is 1;
    attribute mti_svvh_generic_type of downloadD : constant is 1;
    attribute mti_svvh_generic_type of idleD : constant is 1;
    attribute mti_svvh_generic_type of flush : constant is 1;
    attribute mti_svvh_generic_type of fifty : constant is 1;
    attribute mti_svvh_generic_type of eighty : constant is 1;
    attribute mti_svvh_generic_type of ninty : constant is 1;
end Camera;