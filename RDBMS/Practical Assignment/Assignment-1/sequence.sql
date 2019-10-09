-- Creating Sequence
create sequence myseq increment by 1 start with 1;

-- Sequence with Cycle Option
create sequence mycyseq
increment by 1 start with 1
minvalue 1 maxvalue 5 cycle cache 2;

-- Modify Sequence
alter sequence mycyseq
increment by 1 start with 1
minvalue 1 maxvalue 3 cycle cache 2;

-- Destroy Sequence
drop sequence myseq;
