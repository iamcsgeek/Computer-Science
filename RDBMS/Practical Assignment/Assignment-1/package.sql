create or replace package trans_mgmt as
	function f_check_accno( p_acc_no in varchar2) return number;
	procedure p_transaction( p_acc_no varchar2, p_trans_type char, p_trans_amt number );
end trans_mgmt;
/

