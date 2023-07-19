clos data

lcRootPath = addBs(justPath(_vfp.activeProject.name))
lcDbPath = lcRootPath + "db\"

create table lcDbPath + "score_distr" ( ;
    all_score N(3), ;
    stu_count N(6), ;
    acc_count N(8) ;
)
use in score_distr

CLOSE DATABASES
CLEAR ALL && clear