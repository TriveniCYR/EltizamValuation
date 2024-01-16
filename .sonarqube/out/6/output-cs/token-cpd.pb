γ
.D:\EltizamLive\Eltizam.Business.Core\Helper.cs
	namespace		 	
Eltizam		
 
.		 
Business		 
.		 
Core		 
{

 
public 

class 
Helper 
: 
IHelper !
{ 
private 
readonly  
IHttpContextAccessor - 
_httpContextAccessor. B
;B C
public 
Helper 
(  
IHttpContextAccessor *
httpContextAccessor+ >
)> ?
{ 	 
_httpContextAccessor  
=! "
httpContextAccessor# 6
;6 7
} 	
public 
UserSessionEntity  
GetLoggedInUser! 0
(0 1
)1 2
{ 	
return 
( 
( 
UserSessionEntity &
)& ' 
_httpContextAccessor' ;
.; <
HttpContext< G
.G H
ItemsH M
[M N
$strN T
]T U
)U V
;V W
} 	
} 
} ‚
/D:\EltizamLive\Eltizam.Business.Core\IHelper.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
{		 
public

 

	interface

 
IHelper

 
{ 
UserSessionEntity 
GetLoggedInUser )
() *
)* +
;+ ,
} 
} …ÿ
FD:\EltizamLive\Eltizam.Business.Core\Implementation\AuditLogService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
Implementation  .
{ 
public 

class 
AuditLogService  
:! "
IAuditLogService# 3
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IMapperFactory '
_mapperFactory( 6
;6 7
private 
readonly 
IHelper  
_helper! (
;( )
private 
readonly 
IExceptionService *
_ExceptionService+ <
;< =
	protected 
readonly 
EltizamDBContext +
	dbContext, 5
;5 6
private 
readonly 
string 
_dbConnection  -
;- .
private 
IRepository 
< 
MasterAuditLog *
>* +
_repository, 7
{8 9
get: =
;= >
set? B
;B C
}D E
private 
IRepository 
< 

MasterUser &
>& '
_user( -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
public"" 
AuditLogService"" 
("" 
EltizamDBContext"" /
Context""0 7
,""7 8
IUnitOfWork""9 D

unitOfWork""E O
,""O P
IMapperFactory""Q _
mapperFactory""` m
,""m n
IHelper""o v
helper""w }
,""} ~
IExceptionService	"" 
exceptionService
""‘ ΅
)
""΅ Ά
{## 	
_unitOfWork$$ 
=$$ 

unitOfWork$$ $
;$$$ %
_mapperFactory%% 
=%% 
mapperFactory%% *
;%%* +
_repository&& 
=&& 
_unitOfWork&& %
.&&% &
GetRepository&&& 3
<&&3 4
MasterAuditLog&&4 B
>&&B C
(&&C D
)&&D E
;&&E F
_helper'' 
='' 
helper'' 
;'' 
_ExceptionService(( 
=(( 
exceptionService((  0
;((0 1
_user)) 
=)) 
_unitOfWork)) 
.))  
GetRepository))  -
<))- .

MasterUser)). 8
>))8 9
())9 :
))): ;
;)); <
	dbContext,, 
=,, 
Context,, 
??,,  "
throw,,# (
new,,) ,!
ArgumentNullException,,- B
(,,B C
nameof,,C I
(,,I J
Context,,J Q
),,Q R
),,R S
;,,S T
_dbConnection-- 
=-- 
DatabaseConnection-- .
.--. /

ConnString--/ 9
;--9 :
}.. 	
public;; 
async;; 
Task;; 
<;; 
bool;; 
>;; 
CreateAuditLog;;  .
<;;. /
TResult;;/ 6
>;;6 7
(;;7 8
AuditActionTypeEnum;;8 K
auditActionType;;L [
,;;[ \
TResult;;] d
	oldEntity;;e n
,;;n o
TResult;;p w
	newEntity	;;x 
,
;; ‚
string<< 
?<< 
PTName<< #
=<<$ %
null<<& *
,<<* +
int<<, /
?<</ 0
PTId<<1 5
=<<6 7
null<<8 <
)<<< =
where<<> C
TResult<<D K
:<<L M
new<<N Q
(<<Q R
)<<R S
{== 	
try>> 
{?? 
PropertyInfoAA 
pInfoAA "
=AA# $
	newEntityAA% .
.AA. /
GetTypeAA/ 6
(AA6 7
)AA7 8
.AA8 9
GetPropertyAA9 D
(AAD E
AppConstantsAAE Q
.AAQ R

ModifiedByAAR \
)AA\ ]
;AA] ^
intBB 
logCreatedByBB  
=BB! "
ConvertBB# *
.BB* +
ToInt32BB+ 2
(BB2 3
pInfoBB3 8
.BB8 9
GetValueBB9 A
(BBA B
	newEntityBBB K
,BBK L
nullBBM Q
)BBQ R
)BBR S
;BBS T
varEE 
	TableNameEE 
=EE 
typeofEE  &
(EE& '
TResultEE' .
)EE. /
.EE/ 0
NameEE0 4
;EE4 5
varFF 

TableKeyIdFF 
=FF  
ConvertFF! (
.FF( )
ToInt32FF) 0
(FF0 1
GetPrimaryKeyFF1 >
<FF> ?
TResultFF? F
>FFF G
(FFG H
	oldEntityFFH Q
)FFQ R
)FFR S
;FFS T
MasterAuditLogII 
objAuditLogII *
;II* +
varJJ 
entityAuditJJ 
=JJ  !
newJJ" %
MasterAuditLogJJ& 4
(JJ4 5
)JJ5 6
{KK 
	CreatedByLL 
=LL 
logCreatedByLL  ,
,LL, -

ActionTypeMM 
=MM  
EnumMM! %
.MM% &
GetNameMM& -
(MM- .
typeofMM. 4
(MM4 5
AuditActionTypeEnumMM5 H
)MMH I
,MMI J
auditActionTypeMMK Z
)MMZ [
,MM[ \
LogNN 
=NN 
	oldEntityNN #
.NN# $

ToAuditLogNN$ .
(NN. /
	newEntityNN/ 8
)NN8 9
,NN9 :

TableKeyIdOO 
=OO  

TableKeyIdOO! +
,OO+ ,
	TableNamePP 
=PP 
	TableNamePP  )
,PP) *
ParentTableKeyIdQQ $
=QQ% &
PTIdQQ' +
,QQ+ ,
ParentTableNameRR #
=RR$ %
PTNameRR& ,
.RR, -
ReplaceRR- 4
(RR4 5
$strRR5 8
,RR8 9
$strRR: <
)RR< =
,RR= >
}SS 
;SS 
ifUU 
(UU 
entityAuditUU 
.UU  
LogUU  #
!=UU$ &
$strUU' +
)UU+ ,
AddAuditLogVV 
(VV  
entityAuditVV  +
)VV+ ,
;VV, -
returnXX 
trueXX 
;XX 
}YY 
catchZZ 
(ZZ 
	ExceptionZZ 
exZZ 
)ZZ  
{[[ 
await\\ 
_ExceptionService\\ '
.\\' (
LogException\\( 4
(\\4 5
ex\\5 7
)\\7 8
;\\8 9
return]] 
false]] 
;]] 
}^^ 
}__ 	
publicaa 
voidaa 
AddAuditLogaa 
(aa  
MasterAuditLogaa  .
logaa/ 2
)aa2 3
{bb 	
DbParametercc 
[cc 
]cc 
dbParameterscc &
=cc' (
{dd 
newee 
DbParameteree  
(ee  !
$stree! -
,ee- .
logee; >
.ee> ?

TableKeyIdee? I
,eeI J
	SqlDbTypeeeK T
.eeT U
InteeU X
)eeX Y
,eeY Z
newff 
DbParameterff  
(ff  !
$strff! ,
,ff, -
logff; >
.ff> ?
	TableNameff? H
,ffH I
	SqlDbTypeffJ S
.ffS T
VarCharffT [
)ff[ \
,ff\ ]
newgg 
DbParametergg  
(gg  !
$strgg! 3
,gg3 4
loggg; >
.gg> ?
ParentTableKeyIdgg? O
,ggO P
	SqlDbTypeggQ Z
.ggZ [
Intgg[ ^
)gg^ _
,gg_ `
newhh 
DbParameterhh  
(hh  !
$strhh! 2
,hh2 3
loghh; >
.hh> ?
ParentTableNamehh? N
,hhN O
	SqlDbTypehhP Y
.hhY Z
VarCharhhZ a
)hha b
,hhb c
newii 
DbParameterii  
(ii  !
$strii! &
,ii& '
logii; >
.ii> ?
Logii? B
,iiB C
	SqlDbTypeiiD M
.iiM N
VarChariiN U
)iiU V
,iiV W
newjj 
DbParameterjj  
(jj  !
$strjj! -
,jj- .
logjj; >
.jj> ?

ActionTypejj? I
,jjI J
	SqlDbTypejjK T
.jjT U
IntjjU X
)jjX Y
,jjY Z
newkk 
DbParameterkk  
(kk  !
$strkk! ,
,kk, -
logkk; >
.kk> ?
	CreatedBykk? H
,kkH I
	SqlDbTypekkJ S
.kkS T
IntkkT W
)kkW X
}ll 
;ll 
EltizamDBHelpernn 
.nn 
ExecuteNonQuerynn +
(nn+ ,
ProcedureMetastorenn, >
.nn> ?
usp_AuditLog_Addnn? O
,nnO P
_dbConnectionnnQ ^
,nn^ _
CommandTypenn` k
.nnk l
StoredProcedurennl {
,nn{ |
dbParameters	nn} ‰
)
nn‰ 
;
nn ‹
}oo 	
publicqq 
virtualqq 
intqq 
GetPrimaryKeyqq (
<qq( )
Tqq) *
>qq* +
(qq+ ,
Tqq, -
entityqq. 4
)qq4 5
{rr 	
varss 
keyNamess 
=ss 
	dbContextss #
.ss# $
Modelss$ )
.ss) *
FindEntityTypess* 8
(ss8 9
typeofss9 ?
(ss? @
Tss@ A
)ssA B
)ssB C
.ssC D
FindPrimaryKeyssD R
(ssR S
)ssS T
.ssT U

PropertiesssU _
.tt 
Selecttt !
(tt! "
xtt" #
=>tt$ &
xtt' (
.tt( )
Namett) -
)tt- .
.tt. /
Singlett/ 5
(tt5 6
)tt6 7
;tt7 8
returnvv 
(vv 
intvv 
)vv 
entityvv 
.vv 
GetTypevv &
(vv& '
)vv' (
.vv( )
GetPropertyvv) 4
(vv4 5
keyNamevv5 <
)vv< =
.vv= >
GetValuevv> F
(vvF G
entityvvG M
,vvM N
nullvvO S
)vvS T
;vvT U
}ww 	
publicyy 
asyncyy 
Taskyy 
<yy 
IEnumerableyy %
<yy% &'
MasterAuditLogWrapperEntityyy& A
<yyA B
AuditLogyyB J
>yyJ K
>yyK L
>yyL M
GetByModuleIdyyN [
(yy[ \
intyy\ _
idyy` b
,yyb c
stringyyd j
	tableNameyyk t
)yyt u
{zz 	
var{{ 
entityAuditLog{{ 
={{  
await{{! &
_repository{{' 2
.{{2 3
FindAllAsync{{3 ?
({{? @
x{{@ A
=>{{B D
x{{E F
.{{F G

TableKeyId{{G Q
=={{R T
id{{U W
&&{{X Z
x{{[ \
.{{\ ]
	TableName{{] f
=={{g i
	tableName{{j s
){{s t
;{{t u
var|| 
auditLog|| 
=|| 
entityAuditLog|| )
.||) *
Select||* 0
(||0 1
xx||1 3
=>||4 6
new||7 :'
MasterAuditLogWrapperEntity||; V
<||V W
AuditLog||W _
>||_ `
{}} 

ActionType~~ 
=~~ 
xx~~ 
.~~  

ActionType~~  *
,~~* +
Id 
= 
xx 
. 
Id 
, 
	CreatedBy
€€ 
=
€€ 
xx
€€ 
.
€€ 
	CreatedBy
€€ (
,
€€( )
CreatedDate
 
=
 
xx
  
.
  !
CreatedDate
! ,
,
, -

TableKeyId
‚‚ 
=
‚‚ 
xx
‚‚ 
.
‚‚  

TableKeyId
‚‚  *
,
‚‚* +
	TableName
ƒƒ 
=
ƒƒ 
xx
ƒƒ 
.
ƒƒ 
	TableName
ƒƒ (
,
ƒƒ( )
Log
„„ 
=
„„ 
JsonConvert
„„ !
.
„„! "
DeserializeObject
„„" 3
<
„„3 4
IEnumerable
„„4 ?
<
„„? @
AuditLog
„„@ H
>
„„H I
>
„„I J
(
„„J K
xx
„„K M
.
„„M N
Log
„„N Q
)
„„Q R
}
…… 
)
…… 
;
…… 
return
‡‡ 
auditLog
‡‡ 
;
‡‡ 
}
 	
public
‹‹ 
async
‹‹ 
Task
‹‹ 
<
‹‹ $
DataTableResponseModel
‹‹ 0
>
‹‹0 1
GetAll
‹‹2 8
(
‹‹8 9$
DataTableAjaxPostModel
‹‹9 O
model
‹‹P U
,
‹‹U V
int
‹‹W Z
?
‹‹Z [
UserName
‹‹\ d
,
‹‹d e
string
‹‹f l
?
‹‹l m
	TableName
‹‹n w
=
‹‹x y
null
‹‹z ~
,
‹‹~ 
DateTime‹‹€ 
?‹‹ ‰
DateFrom‹‹ ’
=‹‹“ ”
null‹‹• ™
,‹‹™ 
DateTime‹‹› £
?‹‹£ ¤
DateTo‹‹¥ «
=‹‹¬ ­
null‹‹® ²
)‹‹² ³
{
 	
string
 

ColumnName
 
=
 
(
  !
model
! &
.
& '
order
' ,
.
, -
Count
- 2
>
3 4
$num
5 6
?
7 8
model
9 >
.
> ?
columns
? F
[
F G
model
G L
.
L M
order
M R
[
R S
$num
S T
]
T U
.
U V
column
V \
]
\ ]
.
] ^
data
^ b
:
c d
string
e k
.
k l
Empty
l q
)
q r
;
r s
string
 
SortDir
 
=
 
(
 
model
 #
.
# $
order
$ )
.
) *
Count
* /
>
0 1
$num
2 3
?
4 5
model
6 ;
.
; <
order
< A
[
A B
$num
B C
]
C D
.
D E
dir
E H
:
I J
string
K Q
.
Q R
Empty
R W
)
W X
;
X Y
System
 
.
 
Data
 
.
 
	SqlClient
 !
.
! "
SqlParameter
" .
[
. /
]
/ 0
osqlParameter
1 >
=
? @
{
‘‘ 
new
’’ 
System
’’ 
.
’’ 
Data
’’ 
.
’’  
	SqlClient
’’  )
.
’’) *
SqlParameter
’’* 6
(
’’6 7
AppConstants
’’7 C
.
’’C D!
P_CurrentPageNumber
’’D W
,
’’W X
model
’’Z _
.
’’_ `
start
’’` e
)
’’e f
,
’’f g
new
““ 
System
““ 
.
““ 
Data
““ 
.
““  
	SqlClient
““  )
.
““) *
SqlParameter
““* 6
(
““6 7
AppConstants
““7 C
.
““C D

P_PageSize
““D N
,
““N O
model
““Z _
.
““_ `
length
““` f
)
““f g
,
““g h
new
”” 
System
”” 
.
”” 
Data
”” 
.
””  
	SqlClient
””  )
.
””) *
SqlParameter
””* 6
(
””6 7
AppConstants
””7 C
.
””C D
P_SortColumn
””D P
,
””P Q

ColumnName
””Z d
)
””d e
,
””e f
new
•• 
System
•• 
.
•• 
Data
•• 
.
••  
	SqlClient
••  )
.
••) *
SqlParameter
••* 6
(
••6 7
AppConstants
••7 C
.
••C D
P_SortDirection
••D S
,
••S T
SortDir
••Z a
)
••a b
,
••b c
new
–– 
System
–– 
.
–– 
Data
–– 
.
––  
	SqlClient
––  )
.
––) *
SqlParameter
––* 6
(
––6 7
AppConstants
––7 C
.
––C D
P_SearchText
––D P
,
––P Q
model
––Z _
.
––_ `
search
––` f
?
––f g
.
––g h
value
––h m
)
––m n
,
––n o
new
—— 
System
—— 
.
—— 
Data
—— 
.
——  
	SqlClient
——  )
.
——) *
SqlParameter
——* 6
(
——6 7
$str
——7 @
,
——@ A
UserName
——Z b
)
——b c
,
——c d
new
 
System
 
.
 
Data
 
.
  
	SqlClient
  )
.
) *
SqlParameter
* 6
(
6 7
$str
7 C
,
C D
	TableName
Z c
)
c d
,
d e
new
™™ 
System
™™ 
.
™™ 
Data
™™ 
.
™™  
	SqlClient
™™  )
.
™™) *
SqlParameter
™™* 6
(
™™6 7
$str
™™7 B
,
™™B C
DateFrom
™™Z b
)
™™b c
,
™™c d
new
 
System
 
.
 
Data
 
.
  
	SqlClient
  )
.
) *
SqlParameter
* 6
(
6 7
$str
7 @
,
@ A
DateTo
Z `
)
` a
}
›› 
;
›› 
var
 
Results
 
=
 
await
 
_repository
  +
.
+ ,
GetBySP
, 3
(
3 4 
ProcedureMetastore
4 F
.
F G(
usp_AuditLog_SearchAllList
G a
,
a b
CommandType
c n
.
n o
StoredProcedure
o ~
,
~ 
osqlParameter€ 
) 
; 
var
   
res
   
=
   
UtilityHelper
   #
.
  # $
GetPaginationInfo
  $ 5
(
  5 6
Results
  6 =
)
  = >
;
  > ?$
DataTableResponseModel
ΆΆ "
resp
ΆΆ# '
=
ΆΆ( )
new
ΆΆ* -$
DataTableResponseModel
ΆΆ. D
(
ΆΆD E
model
ΆΆE J
.
ΆΆJ K
draw
ΆΆK O
,
ΆΆO P
res
ΆΆQ T
.
ΆΆT U
Item1
ΆΆU Z
,
ΆΆZ [
res
ΆΆ\ _
.
ΆΆ_ `
Item1
ΆΆ` e
,
ΆΆe f
Results
ΆΆg n
.
ΆΆn o
DataTableToList
ΆΆo ~
<
ΆΆ~ $
AuditLogModelResponseΆΆ ”
>ΆΆ” •
(ΆΆ• –
)ΆΆ– —
)ΆΆ— 
;ΆΆ ™
return
¤¤ 
resp
¤¤ 
;
¤¤ 
}
¥¥ 	
public
¦¦ 
async
¦¦ 
Task
¦¦ 
<
¦¦ 
List
¦¦ 
<
¦¦ #
AuditLogModelResponse
¦¦ 4
>
¦¦4 5
>
¦¦5 6$
GetLogDetailsByFilters
¦¦7 M
(
¦¦M N
string
¦¦N T
?
¦¦T U
	TableName
¦¦V _
,
¦¦_ `
int
¦¦a d
?
¦¦d e
Id
¦¦f h
=
¦¦i j
null
¦¦k o
,
¦¦o p
int
¦¦q t
?
¦¦t u
TableKey
¦¦v ~
=¦¦ €
null¦¦ …
,¦¦… †
DateTime¦¦‡ 
?¦¦ 
DateFrom¦¦‘ ™
=¦¦ ›
null¦¦  
,¦¦  ΅
DateTime¦¦Ά ª
?¦¦ª «
DateTo¦¦¬ ²
=¦¦³ ΄
null¦¦µ Ή
)¦¦Ή Ί
{
§§ 	
var
¨¨ 
entityAuditLogs
¨¨ 
=
¨¨  !
await
¨¨# (
_repository
¨¨) 4
.
¨¨4 5
FindAllAsync
¨¨5 A
(
¨¨A B
x
¨¨B C
=>
¨¨D F
(
©©# $
	TableName
©©$ -
==
©©. 0
null
©©1 5
||
©©6 8
(
©©9 :
x
©©: ;
.
©©; <
ParentTableName
©©< K
==
©©L N
	TableName
©©O X
||
©©Y [
x
©©\ ]
.
©©] ^
	TableName
©©^ g
==
©©h j
	TableName
©©k t
)
©©t u
)
©©u v
&&
ªª  "
(
ªª# $
TableKey
ªª$ ,
==
ªª- /
null
ªª0 4
||
ªª5 7
(
ªª8 9
x
ªª9 :
.
ªª: ;
ParentTableKeyId
ªª; K
==
ªªL N
TableKey
ªªO W
||
ªªX Z
x
ªª[ \
.
ªª\ ]

TableKeyId
ªª] g
==
ªªh j
TableKey
ªªk s
)
ªªs t
)
ªªt u
&&
««  "
(
««# $
DateFrom
««$ ,
==
««- /
null
««0 4
||
««5 7
x
««8 9
.
««9 :
CreatedDate
««: E
>=
««F H
DateFrom
««I Q
)
««Q R
&&
¬¬  "
(
¬¬# $
DateTo
¬¬$ *
==
¬¬+ -
null
¬¬. 2
||
¬¬3 5
x
¬¬6 7
.
¬¬7 8
CreatedDate
¬¬8 C
<=
¬¬D F
DateTo
¬¬G M
)
¬¬M N
&&
­­  "
(
­­# $
Id
­­$ &
==
­­' )
null
­­* .
||
­­/ 1
x
­­2 3
.
­­3 4
Id
­­4 6
==
­­7 9
Id
­­: <
)
­­< =
)
­­= >
;
­­> ?
var
―― 
res
―― 
=
―― 
new
―― 
List
―― 
<
―― #
AuditLogModelResponse
―― 4
>
――4 5
(
――5 6
)
――6 7
;
――7 8
foreach
°° 
(
°° 
var
°° 
log
°° 
in
°° 
entityAuditLogs
°°  /
)
°°/ 0
{
±± 
var
²² 
_AuditLogListData
²² %
=
²²& '
JsonConvert
²²( 3
.
²²3 4
DeserializeObject
²²4 E
<
²²E F
IEnumerable
²²F Q
<
²²Q R
	AuditLogs
²²R [
>
²²[ \
>
²²\ ]
(
²²] ^
log
²²^ a
.
²²a b
Log
²²b e
)
²²e f
;
²²f g
var
΄΄ 
usr
΄΄ 
=
΄΄ 
_user
΄΄ 
.
΄΄  
GetAll
΄΄  &
(
΄΄& '
)
΄΄' (
.
΄΄( )
Where
΄΄) .
(
΄΄. /
a
΄΄/ 0
=>
΄΄1 3
a
΄΄4 5
.
΄΄5 6
Id
΄΄6 8
==
΄΄9 ;
log
΄΄< ?
.
΄΄? @
	CreatedBy
΄΄@ I
)
΄΄I J
.
΄΄J K
FirstOrDefault
΄΄K Y
(
΄΄Y Z
)
΄΄Z [
;
΄΄[ \
res
µµ 
.
µµ 
Add
µµ 
(
µµ 
new
µµ #
AuditLogModelResponse
µµ 1
(
µµ1 2
)
µµ2 3
{
¶¶ 

ActionType
ΈΈ 
=
ΈΈ  
log
ΈΈ! $
.
ΈΈ$ %

ActionType
ΈΈ% /
,
ΈΈ/ 0
ParentTableKeyId
ΉΉ $
=
ΉΉ% &
log
ΉΉ' *
.
ΉΉ* +
ParentTableKeyId
ΉΉ+ ;
,
ΉΉ; <
ParentTableName
ΊΊ #
=
ΊΊ$ %
log
ΊΊ& )
.
ΊΊ) *
ParentTableName
ΊΊ* 9
,
ΊΊ9 :

TableKeyId
»» 
=
»»  
log
»»! $
.
»»$ %

TableKeyId
»»% /
,
»»/ 0
	TableName
ΌΌ 
=
ΌΌ 
log
ΌΌ  #
.
ΌΌ# $
	TableName
ΌΌ$ -
,
ΌΌ- .
Id
½½ 
=
½½ 
log
½½ 
.
½½ 
Id
½½ 
,
½½  
	CreatedBy
ΎΎ 
=
ΎΎ 
log
ΎΎ  #
.
ΎΎ# $
	CreatedBy
ΎΎ$ -
,
ΎΎ- .
CreatedDate
ΏΏ 
=
ΏΏ  !
log
ΏΏ" %
.
ΏΏ% &
CreatedDate
ΏΏ& 1
,
ΏΏ1 2"
CreatedDateFormatted
ΐΐ (
=
ΐΐ) *
log
ΐΐ+ .
.
ΐΐ. /
CreatedDate
ΐΐ/ :
?
ΐΐ: ;
.
ΐΐ; <
ToString
ΐΐ< D
(
ΐΐD E
$str
ΐΐE Z
)
ΐΐZ [
,
ΐΐ[ \
CreatedByName
ΑΑ !
=
ΑΑ" #
usr
ΑΑ$ '
==
ΑΑ( *
null
ΑΑ+ /
?
ΑΑ0 1
$str
ΑΑ2 4
:
ΑΑ5 6
usr
ΑΑ7 :
.
ΑΑ: ;
	FirstName
ΑΑ; D
+
ΑΑE F
$char
ΑΑG J
+
ΑΑK L
usr
ΑΑM P
.
ΑΑP Q
LastName
ΑΑQ Y
,
ΑΑY Z
AuditLogListData
ΒΒ $
=
ΒΒ% &
_AuditLogListData
ΒΒ' 8
?
ΒΒ8 9
.
ΒΒ9 :
ToList
ΒΒ: @
(
ΒΒ@ A
)
ΒΒA B
,
ΒΒB C
}
ΓΓ 
)
ΓΓ 
;
ΓΓ 
}
ΔΔ 
return
ΕΕ 
res
ΕΕ 
;
ΕΕ 
}
ΖΖ 	
public
““ 
async
““ 
Task
““ 
<
““ 
List
““ 
<
““  
AuditLogTableModel
““ 1
>
““1 2
>
““2 3%
GetAllAuditLogTableName
““4 K
(
““K L
)
““L M
{
”” 	
var
–– 
lstStf
–– 
=
–– 
EltizamDBHelper
–– (
.
––( )!
ExecuteMappedReader
––) <
<
––< = 
AuditLogTableModel
––= O
>
––O P
(
––P Q 
ProcedureMetastore
––Q c
.
––c d#
usp_AuditLog_GetTable
––d y
,
––y z 
DatabaseConnection
—— 
.
——  

ConnString
——  *
,
——* +
CommandType
——, 7
.
——7 8
StoredProcedure
——8 G
,
——G H
null
——I M
)
——M N
;
——N O
return
™™ 
lstStf
™™ 
;
™™ 
}
 	
public
 
async
 
Task
 
<
 $
DataTableResponseModel
 0
>
0 1
GetAllDetailsLog
2 B
(
B C$
DataTableAjaxPostModel
C Y
model
Z _
,
_ `
int
a d
?
d e
UserId
f l
,
l m
string
n t
?
t u
	TableName
v 
, €
string ‡
?‡ 
TableKey‰ ‘
,‘ ’
int“ –
?– —
Id 
, ›
DateTime ¤
?¤ ¥
DateFrom¦ ®
=― °
null± µ
,µ ¶
DateTime· Ώ
?Ώ ΐ
DateToΑ Η
=Θ Ι
nullΚ Ξ
)Ξ Ο
{
 	
string
   

ColumnName
   
=
   
(
    !
model
  ! &
.
  & '
order
  ' ,
.
  , -
Count
  - 2
>
  3 4
$num
  5 6
?
  7 8
model
  9 >
.
  > ?
columns
  ? F
[
  F G
model
  G L
.
  L M
order
  M R
[
  R S
$num
  S T
]
  T U
.
  U V
column
  V \
]
  \ ]
.
  ] ^
data
  ^ b
:
  c d
string
  e k
.
  k l
Empty
  l q
)
  q r
;
  r s
string
΅΅ 
SortDir
΅΅ 
=
΅΅ 
(
΅΅ 
model
΅΅ #
.
΅΅# $
order
΅΅$ )
.
΅΅) *
Count
΅΅* /
>
΅΅0 1
$num
΅΅2 3
?
΅΅4 5
model
΅΅6 ;
.
΅΅; <
order
΅΅< A
[
΅΅A B
$num
΅΅B C
]
΅΅C D
.
΅΅D E
dir
΅΅E H
:
΅΅I J
string
΅΅K Q
.
΅΅Q R
Empty
΅΅R W
)
΅΅W X
;
΅΅X Y
System
££ 
.
££ 
Data
££ 
.
££ 
	SqlClient
££ !
.
££! "
SqlParameter
££" .
[
££. /
]
££/ 0
osqlParameter
££1 >
=
££? @
{
¤¤ 
new
¥¥ 
System
¥¥ 
.
¥¥ 
Data
¥¥ 
.
¥¥  
	SqlClient
¥¥  )
.
¥¥) *
SqlParameter
¥¥* 6
(
¥¥6 7
AppConstants
¥¥7 C
.
¥¥C D!
P_CurrentPageNumber
¥¥D W
,
¥¥W X
model
¥¥Z _
.
¥¥_ `
start
¥¥` e
)
¥¥e f
,
¥¥f g
new
¦¦ 
System
¦¦ 
.
¦¦ 
Data
¦¦ 
.
¦¦  
	SqlClient
¦¦  )
.
¦¦) *
SqlParameter
¦¦* 6
(
¦¦6 7
AppConstants
¦¦7 C
.
¦¦C D

P_PageSize
¦¦D N
,
¦¦N O
model
¦¦Z _
.
¦¦_ `
length
¦¦` f
)
¦¦f g
,
¦¦g h
new
§§ 
System
§§ 
.
§§ 
Data
§§ 
.
§§  
	SqlClient
§§  )
.
§§) *
SqlParameter
§§* 6
(
§§6 7
AppConstants
§§7 C
.
§§C D
P_SortColumn
§§D P
,
§§P Q

ColumnName
§§Z d
)
§§d e
,
§§e f
new
¨¨ 
System
¨¨ 
.
¨¨ 
Data
¨¨ 
.
¨¨  
	SqlClient
¨¨  )
.
¨¨) *
SqlParameter
¨¨* 6
(
¨¨6 7
AppConstants
¨¨7 C
.
¨¨C D
P_SortDirection
¨¨D S
,
¨¨S T
SortDir
¨¨Z a
)
¨¨a b
,
¨¨b c
new
©© 
System
©© 
.
©© 
Data
©© 
.
©©  
	SqlClient
©©  )
.
©©) *
SqlParameter
©©* 6
(
©©6 7
AppConstants
©©7 C
.
©©C D
P_SearchText
©©D P
,
©©P Q
model
©©Z _
.
©©_ `
search
©©` f
?
©©f g
.
©©g h
value
©©h m
)
©©m n
,
©©n o
new
ªª 
System
ªª 
.
ªª 
Data
ªª 
.
ªª  
	SqlClient
ªª  )
.
ªª) *
SqlParameter
ªª* 6
(
ªª6 7
$str
ªª7 @
,
ªª@ A
UserId
ªªZ `
)
ªª` a
,
ªªa b
new
«« 
System
«« 
.
«« 
Data
«« 
.
««  
	SqlClient
««  )
.
««) *
SqlParameter
««* 6
(
««6 7
$str
««7 C
,
««C D
	TableName
««Z c
)
««c d
,
««d e
new
¬¬ 
System
¬¬ 
.
¬¬ 
Data
¬¬ 
.
¬¬  
	SqlClient
¬¬  )
.
¬¬) *
SqlParameter
¬¬* 6
(
¬¬6 7
$str
¬¬7 B
,
¬¬B C
TableKey
¬¬Z b
)
¬¬b c
,
¬¬c d
new
­­ 
System
­­ 
.
­­ 
Data
­­ 
.
­­  
	SqlClient
­­  )
.
­­) *
SqlParameter
­­* 6
(
­­6 7
$str
­­7 <
,
­­< =
Id
­­Z \
)
­­\ ]
,
­­] ^
new
®® 
System
®® 
.
®® 
Data
®® 
.
®®  
	SqlClient
®®  )
.
®®) *
SqlParameter
®®* 6
(
®®6 7
$str
®®7 B
,
®®B C
DateFrom
®®Z b
)
®®b c
,
®®c d
new
―― 
System
―― 
.
―― 
Data
―― 
.
――  
	SqlClient
――  )
.
――) *
SqlParameter
――* 6
(
――6 7
$str
――7 @
,
――@ A
DateTo
――Z `
)
――` a
}
°° 
;
°° 
var
²² 
Results
²² 
=
²² 
await
²² 
_repository
²²  +
.
²²+ ,
GetBySP
²², 3
(
²²3 4 
ProcedureMetastore
²²4 F
.
²²F G0
"usp_AuditLog_SearchDetailsByFilter
²²G i
,
²²i j
CommandType
²²k v
.
²²v w
StoredProcedure²²w †
,²²† ‡
osqlParameter²² •
)²²• –
;²²– —
var
΄΄ 
res
΄΄ 
=
΄΄ 
UtilityHelper
΄΄ #
.
΄΄# $
GetPaginationInfo
΄΄$ 5
(
΄΄5 6
Results
΄΄6 =
)
΄΄= >
;
΄΄> ?$
DataTableResponseModel
µµ "
resp
µµ# '
=
µµ( )
new
µµ* -$
DataTableResponseModel
µµ. D
(
µµD E
model
µµE J
.
µµJ K
draw
µµK O
,
µµO P
res
µµQ T
.
µµT U
Item1
µµU Z
,
µµZ [
res
µµ\ _
.
µµ_ `
Item1
µµ` e
,
µµe f
Results
µµg n
.
µµn o
DataTableToList
µµo ~
<
µµ~  
AuditLogModelDataµµ 
>µµ ‘
(µµ‘ ’
)µµ’ “
)µµ“ ”
;µµ” •
return
·· 
resp
·· 
;
·· 
}
ΈΈ 	
}
ΉΉ 
}»» ÿ
HD:\EltizamLive\Eltizam.Business.Core\Implementation\CityGetAllCommand.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
Implementation  .
{ 
} αf
GD:\EltizamLive\Eltizam.Business.Core\Implementation\DashboardService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
Implementation  .
{ 
public 

class 
DashboardService !
:" #
IDashboardService$ 5
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IMapperFactory '
_mapperFactory( 6
;6 7
private 
readonly 
	Microsoft "
." #

Extensions# -
.- .
Configuration. ;
.; <
IConfiguration< J
configurationK X
;X Y
private 
readonly 
IAuditLogService )
_auditLogService* :
;: ;
private 
readonly 
IHelper  
_helper! (
;( )
private 
readonly 
string 
_dbConnection  -
;- .
private   
IRepository   
<   
ValuationQuotation   .
>  . /
_repository  0 ;
{  < =
get  > A
;  A B
set  C F
;  F G
}  H I
public$$ 
DashboardService$$ 
($$  
IUnitOfWork$$  +

unitOfWork$$, 6
,$$6 7
IMapperFactory$$8 F
mapperFactory$$G T
,$$T U
IAuditLogService$$V f
auditLogService$$g v
,$$v w
IHelper%%
 
helper%% 
,%% 
	Microsoft&& 
.&& 

Extensions&& 
.&&  
Configuration&&  -
.&&- .
IConfiguration&&. <
_configuration&&= K
)&&K L
{'' 	
_unitOfWork(( 
=(( 

unitOfWork(( $
;(($ %
_mapperFactory)) 
=)) 
mapperFactory)) *
;))* +
configuration,, 
=,, 
_configuration,, *
;,,* +
_helper-- 
=-- 
helper-- 
;-- 
_auditLogService.. 
=.. 
auditLogService.. .
;... /
_dbConnection00 
=00 
DatabaseConnection00 .
.00. /

ConnString00/ 9
;009 :
_repository11 
=11 
_unitOfWork11 %
.11% &
GetRepository11& 3
<113 4
ValuationQuotation114 F
>11F G
(11G H
)11H I
;11I J
}22 	
public77 
async77 
Task77 
<77 
DashboardDataModel77 ,
>77, -
GetDashboardData77. >
(77> ? 
DashboardFilterModel77? S
model77T Y
)77Y Z
{88 	
var99 
_dashboarddata99 
=99  
new99! $
DashboardDataModel99% 7
(997 8
)998 9
;999 :
DbParameter<< 
[<< 
]<< 
osqlParameter<< '
=<<( )
{== 
new>> 
DbParameter>> 
(>>  
$str>>  *
,>>* +
model>>= B
.>>B C
ClientId>>C K
,>>K L
	SqlDbType>>T ]
.>>] ^
Int>>^ a
)>>a b
,>>b c
new?? 
DbParameter?? 
(??  
$str??  ,
,??, -
model??= B
.??B C

PropertyId??C M
,??M N
	SqlDbType??T ]
.??] ^
Int??^ a
)??a b
,??b c
new@@ 
DbParameter@@ 
(@@  
$str@@  *
,@@* +
model@@= B
.@@B C
FromDate@@C K
,@@K L
	SqlDbType@@T ]
.@@] ^
VarChar@@^ e
)@@e f
,@@f g
newAA 
DbParameterAA 
(AA  
$strAA  (
,AA( )
modelAA= B
.AAB C
ToDateAAC I
,AAI J
	SqlDbTypeAAT ]
.AA] ^
VarCharAA^ e
)AAe f
,AAf g
newBB 
DbParameterBB 
(BB  
$strBB  *
,BB* +
modelBB= B
.BBB C
PagesizeBBC K
,BBK L
	SqlDbTypeBBT ]
.BB] ^
IntBB^ a
)BBa b
,BBb c
newCC 
DbParameterCC 
(CC  
AppConstantsCC  ,
.CC, -
LogInUserIdCC- 8
,CC8 9
modelCC= B
.CCB C
LogInUserIdCCC N
,CCN O
	SqlDbTypeCCT ]
.CC] ^
IntCC^ a
)CCa b
}DD 
;DD 
ifFF 
(FF 
modelFF 
.FF 
TabIdFF 
==FF 
$numFF  
||FF! #
modelFF$ )
.FF) *
TabIdFF* /
==FF0 2
$numFF3 4
)FF4 5
{GG 
varHH 
latestRequestsHH "
=HH# $
EltizamDBHelperHH% 4
.HH4 5
ExecuteMappedReaderHH5 H
<HHH I"
DashboardLatestRequestHHI _
>HH_ `
(HH` a
ProcedureMetastoreHHa s
.HHs t2
%usp_ValuationRequest_GetLatestRequest	HHt ™
,
HH™ 
_dbConnection
HH› ¨
,
HH¨ ©
System
HHª °
.
HH° ±
Data
HH± µ
.
HHµ ¶
CommandType
HH¶ Α
.
HHΑ Β
StoredProcedure
HHΒ Ρ
,
HHΡ Ò
osqlParameter
HHΣ ΰ
)
HHΰ α
;
HHα β
ifII 
(II 
latestRequestsII "
!=II# %
nullII& *
)II* +
_dashboarddataJJ "
.JJ" #
LatestRequestsJJ# 1
=JJ2 3
latestRequestsJJ4 B
;JJB C
}KK 
ifMM 
(MM 
modelMM 
.MM 
TabIdMM 
==MM 
$numMM  
||MM! #
modelMM$ )
.MM) *
TabIdMM* /
==MM0 2
$numMM3 4
)MM4 5
{NN 
varOO 
latestQuotationsOO $
=OO% &
EltizamDBHelperOO' 6
.OO6 7
ExecuteMappedReaderOO7 J
<OOJ K$
DashboardLatestQuotationOOK c
>OOc d
(OOd e
ProcedureMetastoreOOe w
.OOw x4
'usp_ValuationRequest_GetLatestQuotation	OOx 
,
OO  
_dbConnection
OO΅ ®
,
OO® ―
System
OO° ¶
.
OO¶ ·
Data
OO· »
.
OO» Ό
CommandType
OOΌ Η
.
OOΗ Θ
StoredProcedure
OOΘ Χ
,
OOΧ Ψ
osqlParameter
OOΩ ζ
)
OOζ η
;
OOη θ
ifPP 
(PP 
latestQuotationsPP $
!=PP% '
nullPP( ,
)PP, -
_dashboarddataQQ "
.QQ" #
LatestQuotationsQQ# 3
=QQ4 5
latestQuotationsQQ6 F
;QQF G
}RR 
ifTT 
(TT 
modelTT 
.TT 
TabIdTT 
==TT 
$numTT  
||TT! #
modelTT$ )
.TT) *
TabIdTT* /
==TT0 2
$numTT3 4
)TT4 5
{UU 
varVV 
topValuationsVV !
=VV" #
EltizamDBHelperVV$ 3
.VV3 4
ExecuteMappedReaderVV4 G
<VVG H
TopValuationModelVVH Y
>VVY Z
(VVZ [
ProcedureMetastoreVV[ m
.VVm n1
$usp_ValuationRequest_GetTopValuation	VVn ’
,
VV’ “
_dbConnection
VV” ΅
,
VV΅ Ά
System
VV£ ©
.
VV© ª
Data
VVª ®
.
VV® ―
CommandType
VV― Ί
.
VVΊ »
StoredProcedure
VV» Κ
,
VVΚ Λ
osqlParameter
VVΜ Ω
)
VVΩ Ϊ
;
VVΪ Ϋ
ifWW 
(WW 
topValuationsWW !
!=WW" $
nullWW% )
)WW) *
_dashboarddataXX "
.XX" #
TopValuationsXX# 0
=XX1 2
topValuationsXX3 @
;XX@ A
}YY 
if[[ 
([[ 
model[[ 
.[[ 
TabId[[ 
==[[ 
$num[[  
||[[! #
model[[$ )
.[[) *
TabId[[* /
==[[0 2
$num[[3 4
)[[4 5
{\\ 
var]] 
topQuotationDues]] $
=]]% &
EltizamDBHelper]]' 6
.]]6 7
ExecuteMappedReader]]7 J
<]]J K 
TopQuotationDueModel]]K _
>]]_ `
(]]` a
ProcedureMetastore]]a s
.]]s t4
'usp_ValuationRequest_GetTopQuotationDue	]]t ›
,
]]› 
_dbConnection
]] ª
,
]]ª «
System
]]¬ ²
.
]]² ³
Data
]]³ ·
.
]]· Έ
CommandType
]]Έ Γ
.
]]Γ Δ
StoredProcedure
]]Δ Σ
,
]]Σ Τ
osqlParameter
]]Υ β
)
]]β γ
;
]]γ δ
if^^ 
(^^ 
topQuotationDues^^ $
!=^^% '
null^^( ,
)^^, -
_dashboarddata__ "
.__" #
TopQuotationDues__# 3
=__4 5
topQuotationDues__6 F
;__F G
}`` 
ifbb 
(bb 
modelbb 
.bb 
TabIdbb 
==bb 
$numbb  
)bb  !
{cc 
vardd 
dashboardwidgetsdd $
=dd% &
EltizamDBHelperdd' 6
.dd6 7
ExecuteMappedReaderdd7 J
<ddJ K#
DashboardWidgetsRequestddK b
>ddb c
(ddc d
ProcedureMetastoreddd v
.ddv w2
%usp_ValuationRequest_GetWidgetRequest	ddw 
,
dd 
_dbConnection
dd «
,
dd« ¬
System
dd­ ³
.
dd³ ΄
Data
dd΄ Έ
.
ddΈ Ή
CommandType
ddΉ Δ
.
ddΔ Ε
StoredProcedure
ddΕ Τ
,
ddΤ Υ
osqlParameter
ddΦ γ
)
ddγ δ
;
ddδ ε
ifee 
(ee 
dashboardwidgetsee $
!=ee% '
nullee( ,
)ee, -
_dashboarddataff "
.ff" #
DashboardWidgetsff# 3
=ff4 5
dashboardwidgetsff6 F
?ffF G
.ffG H
FirstOrDefaultffH V
(ffV W
)ffW X
;ffX Y
}gg 
returnii 
_dashboarddataii !
;ii! "
}jj 	
publicll 
asyncll 
Taskll 
<ll 
dynamicll !
>ll! "!
GetClientPieChartDatall# 8
(ll8 9 
DashboardFilterModelll9 M
filterModelllN Y
)llY Z
{mm 	
SqlParameternn 
[nn 
]nn 
osqlParameternn (
=nn) *
{oo 
newpp 
SqlParameterpp  
(pp  !
$strpp! .
,pp. /
filterModelpp0 ;
.pp; <

ModuleNamepp< F
)ppF G
,ppG H
newqq 
SqlParameterqq  
(qq  !
$strqq! /
,qq/ 0
filterModelqq1 <
.qq< =
LogInUserIdqq= H
)qqH I
,qqI J
newrr 
SqlParameterrr  
(rr  !
$strrr! ,
,rr, -
filterModelrr. 9
.rr9 :
ClientIdrr: B
)rrB C
,rrC D
newss 
SqlParameterss  
(ss  !
$strss! .
,ss. /
filterModelss0 ;
.ss; <

PropertyIdss< F
)ssF G
,ssG H
newtt 
SqlParametertt  
(tt  !
$strtt! ,
,tt, -
filterModeltt. 9
.tt9 :
FromDatett: B
)ttB C
,ttC D
newuu 
SqlParameteruu  
(uu  !
$struu! *
,uu* +
filterModeluu, 7
.uu7 8
ToDateuu8 >
)uu> ?
}vv 
;vv 
DataSetxx 
dsmodelxx 
=xx 
awaitxx #
_repositoryxx$ /
.xx/ 0
GetDataSetBySPxx0 >
(xx> ?
$strxx? \
,xx\ ]
Systemxx^ d
.xxd e
Dataxxe i
.xxi j
CommandTypexxj u
.xxu v
StoredProcedure	xxv …
,
xx… †
osqlParameter
xx‡ ”
)
xx” •
;
xx• –
dynamiczz 
DashboardObjectszz $
=zz% &
newzz' *
ExpandoObjectzz+ 8
(zz8 9
)zz9 :
;zz: ;
DashboardObjects{{ 
.{{ 
PieChart{{ %
={{& '
dsmodel{{( /
.{{/ 0
Tables{{0 6
[{{6 7
$num{{7 8
]{{8 9
;{{9 :
DashboardObjects|| 
.|| 
BarChart|| %
=||& '
dsmodel||( /
.||/ 0
Tables||0 6
[||6 7
$num||7 8
]||8 9
;||9 :
DashboardObjects}} 
.}} 
OtheDetails}} (
=}}) *
dsmodel}}+ 2
.}}2 3
Tables}}3 9
[}}9 :
$num}}: ;
]}}; <
;}}< =
return~~ 
DashboardObjects~~ #
;~~# $
}
’’ 	
}
”” 	
}•• ώ#
GD:\EltizamLive\Eltizam.Business.Core\Implementation\ExceptionService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
Implementation  .
{ 
public 

class 
ExceptionService !
:" #
IExceptionService$ 5
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IMapperFactory '
_mapperFactory( 6
;6 7
private 
readonly 
	Microsoft "
." #

Extensions# -
.- .
Configuration. ;
.; <
IConfiguration< J
configurationK X
;X Y
private 
IRepository 
< 
MasterException +
>+ ,
_repository- 8
{9 :
get; >
;> ?
set@ C
;C D
}E F
private 
readonly 
IHelper  
_helper! (
;( )
public 
ExceptionService 
(  
IUnitOfWork  +

unitOfWork, 6
,6 7
IMapperFactory8 F
mapperFactoryG T
,T U
	Microsoft! *
.* +

Extensions+ 5
.5 6
Configuration6 C
.C D
IConfigurationD R
_configurationS a
,a b
IHelperc j
helperk q
)q r
{ 	
_unitOfWork 
= 

unitOfWork $
;$ %
_mapperFactory 
= 
mapperFactory *
;* +
_repository 
= 
_unitOfWork %
.% &
GetRepository& 3
<3 4
MasterException4 C
>C D
(D E
)E F
;F G
configuration 
= 
_configuration *
;* +
_helper 
= 
helper 
; 
}   	
public"" 
async"" 
Task"" 
<"" 
DBOperation"" %
>""% &
LogException""' 3
(""3 4
	Exception""4 =
	exception""> G
)""G H
{## 	
try$$ 
{%% 
var&& 
userId&& 
=&& 
_helper&& $
.&&$ %
GetLoggedInUser&&% 4
(&&4 5
)&&5 6
?&&6 7
.&&7 8
UserId&&8 >
??&&? A
$num&&B C
;&&C D
SqlParameter(( 
[(( 
](( 
osqlParameter(( ,
=((- .
{)) 
new** 
SqlParameter** $
(**$ %
$str**% /
,**/ 0
	exception**1 :
.**: ;
Message**; B
)**B C
,**C D
new++ 
SqlParameter++ $
(++$ %
$str++% .
,++. /
	exception++1 :
.++: ;
Source++; A
)++A B
,++B C
new,, 
SqlParameter,, $
(,,$ %
$str,,% 6
,,,6 7
Convert,,8 ?
.,,? @
ToString,,@ H
(,,H I
	exception,,I R
.,,R S
InnerException,,S a
),,a b
),,b c
,,,c d
new-- 
SqlParameter-- $
(--$ %
$str--% 2
,--2 3
Convert--4 ;
.--; <
ToString--< D
(--D E
	exception--E N
.--N O

StackTrace--O Y
)--Y Z
)--Z [
,--[ \
new.. 
SqlParameter.. $
(..$ %
$str..% 1
,..1 2
userId..4 :
)..: ;
}// 
;// 
await11 
_repository11 !
.11! "
GetBySP11" )
(11) *
ProcedureMetastore11* <
.11< =
usp_InsertException11= P
,11P Q
System11R X
.11X Y
Data11Y ]
.11] ^
CommandType11^ i
.11i j
StoredProcedure11j y
,11y z
osqlParameter	11{ 
)
11 ‰
;
11‰ 
return55 
DBOperation55 "
.55" #
Success55# *
;55* +
}66 
catch77 
(77 
	Exception77 
ex77 
)77  
{88 
return99 
DBOperation99 "
.99" #
Error99# (
;99( )
}:: 
};; 	
}<< 
}== 
HD:\EltizamLive\Eltizam.Business.Core\Implementation\FileUploadService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
Implementation  .
{ 
public 

class 
FileUploadService "
:# $
IFileUploadService% 7
{ 
private 
IRepository 
< 
MasterDocument *
>* +
_documentRepository, ?
;? @
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public 
FileUploadService  
(  !
IUnitOfWork! ,

unitOfWork- 7
)7 8
{ 	
_unitOfWork 
= 

unitOfWork $
;$ %
_documentRepository 
=  !
_unitOfWork" -
.- .
GetRepository. ;
<; <
MasterDocument< J
>J K
(K L
)L M
;M N
} 	
public 
async 
Task 
< 
bool 
> 
UploadFilesAsync  0
(0 1
int1 4

tableKeyId5 ?
,? @
stringA G
	tableNameH Q
,Q R
ListS W
<W X
MasterDocumentModelX k
>k l
uploadDocumentsm |
,| }
int	~ 
?
 ‚
	createdBy
ƒ 
)
 
{ 	
if 
( 
uploadDocuments 
!=  "
null# '
&&( *
uploadDocuments+ :
.: ;
Any; >
(> ?
)? @
)@ A
{ 
foreach 
( 
var 
doc  
in! #
uploadDocuments$ 3
)3 4
{ 
var   
objUserDocument   '
=  ( )
new  * -
MasterDocument  . <
{!! 
IsActive""  
=""! "
doc""# &
.""& '
IsActive""' /
,""/ 0

TableKeyId## "
=### $

tableKeyId##% /
,##/ 0
	TableName$$ !
=$$" #
	tableName$$$ -
,$$- .
DocumentName%% $
=%%% &
doc%%' *
.%%* +
DocumentName%%+ 7
,%%7 8
FileName&&  
=&&! "
doc&&# &
.&&& '
FileName&&' /
,&&/ 0
FilePath''  
=''! "
doc''# &
.''& '
FilePath''' /
,''/ 0
FileType((  
=((! "
doc((# &
.((& '
FileType((' /
,((/ 0
	CreatedBy)) !
=))" #
doc))$ '
.))' (
	CreatedBy))( 1
}** 
;** 
_documentRepository,, '
.,,' (
AddAsync,,( 0
(,,0 1
objUserDocument,,1 @
),,@ A
;,,A B
}-- 
await// 
_unitOfWork// !
.//! "
SaveChangesAsync//" 2
(//2 3
)//3 4
;//4 5
return00 
true00 
;00 
}11 
return33 
false33 
;33 
}44 	
}66 
}88 Ϋq
QD:\EltizamLive\Eltizam.Business.Core\Implementation\MasterApproverLevelService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
Implementation  .
{ 
public 

class &
MasterApproverLevelService +
:, -'
IMasterApproverLevelService. I
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IMapperFactory '
_mapperFactory( 6
;6 7
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
private 
IRepository 
< /
#MasterValuationRequestApproverLevel ?
>? @
_repositoryA L
{M N
getO R
;R S
setT W
;W X
}Y Z
private 
IRepository 
< 

MasterUser &
>& '
_UserRepository( 7
{8 9
get: =
;= >
set? B
;B C
}D E
private!! 
readonly!! 
IAuditLogService!! )
_auditLogService!!* :
;!!: ;
private"" 
readonly"" 
IHelper""  
_helper""! (
;""( )
private## 
readonly## &
IMasterNotificationService## 3 
_notificationService##4 H
;##H I
public(( &
MasterApproverLevelService(( )
((() *
IAuditLogService((* :
auditLogService((; J
,((J K
IUnitOfWork((L W

unitOfWork((X b
,((b c
IMapperFactory((d r
mapperFactory	((s €
,
((€ 
IHelper
((‚ ‰
helper
(( 
,
(( ‘
IConfiguration
((’  
configuration
((΅ ®
,
((® ―(
IMasterNotificationService
((° Κ!
notificationService
((Λ ή
)
((ή ί
{)) 	
_unitOfWork** 
=** 

unitOfWork** $
;**$ %
_mapperFactory++ 
=++ 
mapperFactory++ *
;++* +
_UserRepository,, 
=,, 
_unitOfWork,, )
.,,) *
GetRepository,,* 7
<,,7 8

MasterUser,,8 B
>,,B C
(,,C D
),,D E
;,,E F
_configuration-- 
=-- 
configuration-- *
;--* +
_helper.. 
=.. 
helper.. 
;..  
_notificationService//  
=//! "
notificationService//# 6
;//6 7
_auditLogService00 
=00 
auditLogService00 .
;00. /
_repository11 
=11 
_unitOfWork11 %
.11% &
GetRepository11& 3
<113 4/
#MasterValuationRequestApproverLevel114 W
>11W X
(11X Y
)11Y Z
;11Z [
}22 	
public66 
async66 
Task66 
<66 
DBOperation66 %
>66% &5
)UpsertMasterValuationRequestApproverLevel66' P
(66P Q$
MasterApproverLevelModel66Q i
approver66j r
)66r s
{77 	/
#MasterValuationRequestApproverLevel:: /
requestApprover::0 ?
;::? @
if== 
(== 
approver== 
.== 
Id== 
>== 
$num== 
)==  
{>> 
requestApprover?? 
=??  !
_repository??" -
.??- .
Get??. 1
(??1 2
approver??2 :
.??: ;
Id??; =
)??= >
;??> ?
string@@ 
MainTableName@@ $
=@@% &
Enum@@' +
.@@+ ,
GetName@@, 3
(@@3 4
TableNameEnum@@4 A
.@@A B
MasterApproverLevel@@B U
)@@U V
;@@V W
intAA 
MainTableKeyAA  
=AA! "
requestApproverAA# 2
.AA2 3
IdAA3 5
;AA5 6/
#MasterValuationRequestApproverLevelCC 3
	OldEntityCC4 =
=CC> ?
nullCC@ D
;CCD E
	OldEntityDD 
=DD 
_repositoryDD '
.DD' (
GetNoTrackingDD( 5
(DD5 6
requestApproverDD6 E
.DDE F
IdDDF H
)DDH I
;DDI J
requestApproverEE 
=EE  !
_repositoryEE" -
.EE- .
GetEE. 1
(EE1 2
requestApproverEE2 A
.EEA B
IdEEB D
)EED E
;EEE F
ifHH 
(HH 
requestApproverHH #
!=HH$ &
nullHH' +
)HH+ ,
{II 
requestApproverJJ #
.JJ# $
DescriptionJJ$ /
=JJ0 1
ConvertJJ2 9
.JJ9 :
ToStringJJ: B
(JJB C
approverJJC K
.JJK L
DescriptionJJL W
)JJW X
;JJX Y
requestApproverKK #
.KK# $

FromAmountKK$ .
=KK/ 0
approverKK1 9
.KK9 :

FromAmountKK: D
;KKD E
requestApproverLL #
.LL# $
ToAmountLL$ ,
=LL- .
approverLL/ 7
.LL7 8
ToAmountLL8 @
;LL@ A
requestApproverMM #
.MM# $
	IsDeletedMM$ -
=MM. /
falseMM0 5
;MM5 6
requestApproverNN #
.NN# $
IsActiveNN$ ,
=NN- .
approverNN/ 7
.NN7 8
IsActiveNN8 @
;NN@ A
requestApproverOO #
.OO# $
ModifiedDateOO$ 0
=OO1 2
AppConstantsOO3 ?
.OO? @
DateTimeOO@ H
;OOH I
requestApproverPP #
.PP# $

ModifiedByPP$ .
=PP/ 0
approverPP1 9
.PP9 :

ModifiedByPP: D
;PPD E
_repositorySS 
.SS  
UpdateAsyncSS  +
(SS+ ,
requestApproverSS, ;
)SS; <
;SS< =
awaitTT 
_unitOfWorkTT %
.TT% &
SaveChangesAsyncTT& 6
(TT6 7
)TT7 8
;TT8 9
awaitVV 
_auditLogServiceVV *
.VV* +
CreateAuditLogVV+ 9
<VV9 :/
#MasterValuationRequestApproverLevelVV: ]
>VV] ^
(VV^ _
AuditActionTypeEnumVV_ r
.VVr s
UpdateVVs y
,VVy z
	OldEntity	VV{ „
,
VV„ …
requestApprover
VV† •
,
VV• –
MainTableName
VV— ¤
,
VV¤ ¥
MainTableKey
VV¦ ²
)
VV² ³
;
VV³ ΄
}WW 
elseXX 
{YY 
return[[ 
DBOperation[[ &
.[[& '
NotFound[[' /
;[[/ 0
}\\ 
}]] 
else^^ 
{__ 
requestApproveraa 
=aa  !
_mapperFactoryaa" 0
.aa0 1
Getaa1 4
<aa4 5$
MasterApproverLevelModelaa5 M
,aaM N/
#MasterValuationRequestApproverLevelaaO r
>aar s
(aas t
approveraat |
)aa| }
;aa} ~
requestApproverbb 
.bb  
CreatedDatebb  +
=bb, -
AppConstantsbb. :
.bb: ;
DateTimebb; C
;bbC D
requestApprovercc 
.cc  

ModifiedBycc  *
=cc+ ,
approvercc- 5
.cc5 6

ModifiedBycc6 @
;cc@ A
requestApproverdd 
.dd  
	CreatedBydd  )
=dd* +
(dd, -
intdd- 0
)dd0 1
approverdd1 9
.dd9 :
	CreatedBydd: C
;ddC D
requestApproveree 
.ee  
	IsDeletedee  )
=ee* +
falseee, 1
;ee1 2
_repositoryhh 
.hh 
AddAsynchh $
(hh$ %
requestApproverhh% 4
)hh4 5
;hh5 6
awaitjj 
_unitOfWorkjj !
.jj! "
SaveChangesAsyncjj" 2
(jj2 3
)jj3 4
;jj4 5
}kk 
ifpp 
(pp 
requestApproverpp 
.pp  
Idpp  "
==pp# %
$numpp& '
)pp' (
returnqq 
DBOperationqq "
.qq" #
Errorqq# (
;qq( )
returnss 
DBOperationss 
.ss 
Successss &
;ss& '
}tt 	
publicvv 
asyncvv 
Taskvv 
<vv "
DataTableResponseModelvv 0
>vv0 1
GetAllvv2 8
(vv8 9"
DataTableAjaxPostModelvv9 O
modelvvP U
)vvU V
{ww 	
stringxx 

ColumnNamexx 
=xx 
modelxx  %
.xx% &
orderxx& +
.xx+ ,
Countxx, 1
>xx2 3
$numxx4 5
?xx6 7
modelxx8 =
.xx= >
columnsxx> E
[xxE F
modelxxF K
.xxK L
orderxxL Q
[xxQ R
$numxxR S
]xxS T
.xxT U
columnxxU [
]xx[ \
.xx\ ]
dataxx] a
:xxb c
stringxxd j
.xxj k
Emptyxxk p
;xxp q
stringyy 
SortDiryy 
=yy 
(yy 
modelyy #
.yy# $
orderyy$ )
.yy) *
Countyy* /
>yy0 1
$numyy2 3
?yy4 5
modelyy6 ;
.yy; <
orderyy< A
[yyA B
$numyyB C
]yyC D
.yyD E
diryyE H
:yyI J
stringyyK Q
.yyQ R
EmptyyyR W
)yyW X
;yyX Y
SqlParameter{{ 
[{{ 
]{{ 
osqlParameter{{ (
={{) *
{|| 
new}} 
SqlParameter}}  
(}}  !
AppConstants}}! -
.}}- .
P_CurrentPageNumber}}. A
,}}A B
model}}D I
.}}I J
start}}J O
)}}O P
,}}P Q
new~~ 
SqlParameter~~  
(~~  !
AppConstants~~! -
.~~- .

P_PageSize~~. 8
,~~8 9
model~~D I
.~~I J
length~~J P
)~~P Q
,~~Q R
new 
SqlParameter  
(  !
AppConstants! -
.- .
P_SortColumn. :
,: ;

ColumnNameD N
)N O
,O P
new
€€ 
SqlParameter
€€  
(
€€  !
AppConstants
€€! -
.
€€- .
P_SortDirection
€€. =
,
€€= >
SortDir
€€D K
)
€€K L
,
€€L M
new
 
SqlParameter
  
(
  !
AppConstants
! -
.
- .
P_SearchText
. :
,
: ;
model
D I
.
I J
search
J P
?
P Q
.
Q R
value
R W
)
W X
}
‚‚ 
;
‚‚ 
var
„„ 
Results
„„ 
=
„„ 
await
„„ 
_repository
„„  +
.
„„+ ,
GetBySP
„„, 3
(
„„3 4 
ProcedureMetastore
„„4 F
.
„„F G-
usp_ApproverLevel_SearchAllList
„„G f
,
„„f g
CommandType
„„h s
.
„„s t
StoredProcedure„„t ƒ
,„„ƒ „
osqlParameter„„… ’
)„„’ “
;„„“ ”
var
‡‡ 
res
‡‡ 
=
‡‡ 
UtilityHelper
‡‡ #
.
‡‡# $
GetPaginationInfo
‡‡$ 5
(
‡‡5 6
Results
‡‡6 =
)
‡‡= >
;
‡‡> ?$
DataTableResponseModel
‰‰ "%
oDataTableResponseModel
‰‰# :
=
‰‰; <
new
‰‰= @$
DataTableResponseModel
‰‰A W
(
‰‰W X
model
‰‰X ]
.
‰‰] ^
draw
‰‰^ b
,
‰‰b c
res
‰‰d g
.
‰‰g h
Item1
‰‰h m
,
‰‰m n
res
‰‰o r
.
‰‰r s
Item1
‰‰s x
,
‰‰x y
Results‰‰z 
.‰‰ ‚
DataTableToList‰‰‚ ‘
<‰‰‘ ’(
MasterApproverLevelModel‰‰’ ª
>‰‰ª «
(‰‰« ¬
)‰‰¬ ­
)‰‰­ ®
;‰‰® ―
return
‹‹ %
oDataTableResponseModel
‹‹ *
;
‹‹* +
}
 	
public
 
async
 
Task
 
<
 &
MasterApproverLevelModel
 2
>
2 3
GetById
4 ;
(
; <
int
< ?
Id
@ B
)
B C
{
 	
var
’’ 
result
’’ 
=
’’ 
_repository
’’ $
.
’’$ %
Get
’’% (
(
’’( )
Id
’’) +
)
’’+ ,
;
’’, -
var
““ 
lstStf
““ 
=
““ 
_mapperFactory
““ '
.
““' (
Get
““( +
<
““+ ,1
#MasterValuationRequestApproverLevel
““, O
,
““O P&
MasterApproverLevelModel
““Q i
>
““i j
(
““j k
result
““k q
)
““q r
;
““r s
var
”” 
userlist
”” 
=
”” 
_UserRepository
”” *
.
””* +
FindAll
””+ 2
(
””2 3
x
””3 4
=>
””5 7
x
””8 9
.
””9 :
ApproverLevelId
””: I
==
””J L
Id
””M O
)
””O P
.
””P Q
ToList
””Q W
(
””W X
)
””X Y
;
””Y Z
var
•• 
lst
•• 
=
•• 
new
•• 
List
•• 
<
•• 
ApproverUserModel
•• 0
>
••0 1
(
••1 2
)
••2 3
;
••3 4
foreach
—— 
(
—— 
var
—— 
item
—— 
in
—— !
userlist
——" *
)
——+ ,
{
 
lst
™™ 
.
™™ 
Add
™™ 
(
™™ 
new
™™ 
ApproverUserModel
™™ -
(
™™- .
)
™™. /
{
 
Id
›› 
=
›› 
item
›› 
.
›› 
Id
››  
,
››  !
UserName
 
=
 
item
 #
.
# $
UserName
$ ,
}
 
)
 
;
 
}
 
lstStf
 
.
 
	UsersList
 
=
 
lst
 "
;
" #
return
΅΅ 
lstStf
΅΅ 
;
΅΅ 
}
ΆΆ 	
}
§§ 
}¨¨ γ–
HD:\EltizamLive\Eltizam.Business.Core\Implementation\MasterCityService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
Implementation  .
{ 
public 

class 
MasterCityService "
:# $
IMasterCityService% 7
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IMapperFactory '
_mapperFactory( 6
;6 7
private 
readonly 
IAuditLogService )
_auditLogService* :
;: ;
private 
readonly 
	Microsoft "
." #

Extensions# -
.- .
Configuration. ;
.; <
IConfiguration< J
configurationK X
;X Y
private 
readonly 
string 
_dbConnection  -
;- .
private 
IRepository 
< 

MasterCity &
>& '
_repository( 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
private 
readonly 
IHelper  
_helper! (
;( )
public 
MasterCityService  
(  !
IUnitOfWork! ,

unitOfWork- 7
,7 8
IMapperFactory9 G
mapperFactoryH U
,U V
IAuditLogServiceW g
auditLogServiceh w
,w x
IHelper! (
helper) /
,/ 0
	Microsoft1 :
.: ;

Extensions; E
.E F
ConfigurationF S
.S T
IConfigurationT b
_configurationc q
)q r
{   	
_unitOfWork!! 
=!! 

unitOfWork!! $
;!!$ %
_mapperFactory"" 
="" 
mapperFactory"" *
;""* +
_auditLogService## 
=## 
auditLogService## .
;##. /
_repository%% 
=%% 
_unitOfWork%% %
.%%% &
GetRepository%%& 3
<%%3 4

MasterCity%%4 >
>%%> ?
(%%? @
)%%@ A
;%%A B
configuration&& 
=&& 
_configuration&& *
;&&* +
_helper'' 
='' 
helper'' 
;'' 
_dbConnection(( 
=(( 
_configuration(( *
[((* +
AppConstants((+ 7
.((7 8
ConnectionStringkey((8 K
]((K L
;((L M
})) 	
public,, 
async,, 
Task,, 
<,, "
DataTableResponseModel,, 0
>,,0 1
GetAll,,2 8
(,,8 9"
DataTableAjaxPostModel,,9 O
model,,P U
),,U V
{-- 	
string.. 
SortDir.. 
=.. 
model.. "
..." #
order..# (
==..) +
null.., 0
?..1 2
$str..3 8
:..9 :
model..; @
...@ A
order..A F
[..F G
$num..G H
]..H I
...I J
dir..J M
;..M N
SqlParameter// 
[// 
]// 
osqlParameter// (
=//) *
{00 
new11 
SqlParameter11  
(11  !
AppConstants11! -
.11- .
P_CurrentPageNumber11. A
,11A B
model11D I
.11I J
start11J O
)11O P
,11P Q
new22 
SqlParameter22  
(22  !
AppConstants22! -
.22- .

P_PageSize22. 8
,228 9
model22D I
.22I J
length22J P
)22P Q
,22Q R
new33 
SqlParameter33  
(33  !
AppConstants33! -
.33- .
P_SortColumn33. :
,33: ;
$str33D F
)33F G
,33G H
new44 
SqlParameter44  
(44  !
AppConstants44! -
.44- .
P_SortDirection44. =
,44= >
SortDir44D K
)44K L
,44L M
new55 
SqlParameter55  
(55  !
AppConstants55! -
.55- .
P_SearchText55. :
,55: ;
model55D I
.55I J
search55J P
?55P Q
.55Q R
value55R W
)55W X
}66 
;66 
var88 
Results88 
=88 
await88 
_repository88  +
.88+ ,
GetBySP88, 3
(883 4
ProcedureMetastore884 F
.88F G"
usp_User_SearchAllList88G ]
,88] ^
CommandType88_ j
.88j k
StoredProcedure88k z
,88z {
osqlParameter	88| ‰
)
88‰ 
;
88 ‹
var;; 
res;; 
=;; 
UtilityHelper;; #
.;;# $
GetPaginationInfo;;$ 5
(;;5 6
Results;;6 =
);;= >
;;;> ?"
DataTableResponseModel== "$
oDataTableResponseModel1==# ;
===< =
new==> A"
DataTableResponseModel==B X
(==X Y
model==Y ^
.==^ _
draw==_ c
,==c d
res==e h
.==h i
Item1==i n
,==n o
res==p s
.==s t
Item1==t y
,==y z
Results	=={ ‚
.
==‚ ƒ
DataTableToList
==ƒ ’
<
==’ “!
MasterUserListModel
==“ ¦
>
==¦ §
(
==§ ¨
)
==¨ ©
)
==© ª
;
==ª «
varAA 
	_dbParamsAA 
=AA 
newAA 
[AA  
]AA  !
{BB 
newCC 
DbParameterCC  
(CC  !
$strCC! )
,CC) *
$numCC+ ,
,CC, -
	SqlDbTypeCC- 6
.CC6 7
IntCC7 :
)CC: ;
,CC; <
newDD 
DbParameterDD  
(DD  !
$strDD! +
,DD+ ,
modelDD- 2
.DD2 3
lengthDD3 9
,DD9 :
	SqlDbTypeDD; D
.DDD E
IntDDE H
)DDH I
,DDI J
newEE 
DbParameterEE  
(EE  !
$strEE! -
,EE- .
modelEE/ 4
.EE4 5
startEE5 :
,EE: ;
	SqlDbTypeEE< E
.EEE F
IntEEF I
)EEI J
,EEJ K
newFF 
DbParameterFF  
(FF  !
$strFF! .
,FF. /
$strFF0 :
,FF: ;
	SqlDbTypeFF< E
.FFE F
VarCharFFF M
)FFM N
,FFN O
newGG 
DbParameterGG  
(GG  !
$strGG! .
,GG. /
$numGG0 1
,GG1 2
	SqlDbTypeGG3 <
.GG< =
IntGG= @
)GG@ A
}HH 
;HH 
intJJ 
_countJJ 
=JJ 
$numJJ 
;JJ 
varKK 
lstStfKK 
=KK 
EltizamDBHelperKK (
.KK( )2
&ExecuteMappedReaderWithOutputParameterKK) O
<KKO P
MasterCityEntityKKP `
>KK` a
(KKa b
ProcedureMetastoreKKb t
.KKt u#
usp_City_SearchAllList	KKu ‹
,
KK‹ 
_dbConnectionLL 
,LL 
outLL 
_countLL  &
,LL& '
CommandTypeLL( 3
.LL3 4
StoredProcedureLL4 C
,LLC D
	_dbParamsLLE N
)LLN O
;LLO P"
DataTableResponseModelOO "#
oDataTableResponseModelOO# :
=OO; <
newOO= @"
DataTableResponseModelOOA W
(OOW X
modelOOX ]
.OO] ^
drawOO^ b
,OOb c
_countOOd j
,OOj k
$numOOl m
,OOm n
lstStfOOo u
)OOu v
;OOv w
returnQQ #
oDataTableResponseModelQQ *
;QQ* +
}RR 	
publicTT 
asyncTT 
TaskTT 
<TT 
MasterCityEntityTT *
>TT* +
GetByIdTT, 3
(TT3 4
intTT4 7
idTT8 :
)TT: ;
{UU 	
varYY 
dYY 
=YY 
_repositoryYY 
.YY  
GetYY  #
(YY# $
idYY$ &
)YY& '
;YY' (
var\\ 
_CityEntity\\ 
=\\ 
_mapperFactory\\ ,
.\\, -
Get\\- 0
<\\0 1

MasterCity\\1 ;
,\\; <
MasterCityEntity\\= M
>\\M N
(\\N O
d\\O P
)\\P Q
;\\Q R
return]] 
_CityEntity]] 
;]] 
}^^ 	
public`` 
async`` 
Task`` 
<`` 

MasterCity`` $
?``$ %
>``% &
GetById1``' /
(``/ 0
int``0 3
id``4 6
)``6 7
{aa 	
varcc 
d1cc 
=cc 
awaitcc 
_repositorycc &
.cc& '
GetAsynccc' /
(cc/ 0
idcc0 2
)cc2 3
;cc3 4
varee 
dee 
=ee 
_repositoryee 
.ee  
Getee  #
(ee# $
idee$ &
)ee& '
;ee' (
varhh 
_CityEntityhh 
=hh 
_mapperFactoryhh ,
.hh, -
Gethh- 0
<hh0 1

MasterCityhh1 ;
,hh; <
MasterCityEntityhh= M
>hhM N
(hhN O
dhhO P
)hhP Q
;hhQ R
returnii 
dii 
;ii 
}jj 	
publicll 
asyncll 
Taskll 
<ll 
DBOperationll %
>ll% &
Upsertll' -
(ll- .
MasterCityEntityll. >

entityCityll? I
)llI J
{mm 	
trynn 
{oo 

MasterCitypp 
objCitypp "
;pp" #
ifrr 
(rr 

entityCityrr 
.rr 
Idrr !
>rr" #
$numrr$ %
)rr% &
{ss 
varuu 
MainTableNameuu %
=uu& '
Enumuu( ,
.uu, -
GetNameuu- 4
(uu4 5
TableNameEnumuu5 B
.uuB C
Master_ClientuuC P
)uuP Q
;uuQ R
varvv 
MainTableKeyvv $
=vv% &

entityCityvv' 1
.vv1 2
Idvv2 4
;vv4 5

MasterCityww 
	OldEntityww (
=ww) *
nullww+ /
;ww/ 0
	OldEntityxx 
=xx 
_repositoryxx  +
.xx+ ,
GetNoTrackingxx, 9
(xx9 :

entityCityxx: D
.xxD E
IdxxE G
)xxG H
;xxH I
objCityzz 
=zz 
_repositoryzz )
.zz) *
Getzz* -
(zz- .

entityCityzz. 8
.zz8 9
Idzz9 ;
)zz; <
;zz< =
if{{ 
({{ 
objCity{{ 
!={{  "
null{{# '
){{' (
{|| 
objCity}} 
.}}  
CityName}}  (
=}}) *

entityCity}}+ 5
.}}5 6
CityName}}6 >
;}}> ?
objCity~~ 
.~~  
	CountryId~~  )
=~~* +

entityCity~~, 6
.~~6 7
	CountryId~~7 @
;~~@ A
objCity 
.  
StateId  '
=( )

entityCity* 4
.4 5
StateId5 <
;< =
objCity
€€ 
.
€€  
Stdcode
€€  '
=
€€( )

entityCity
€€* 4
.
€€4 5
STDCode
€€5 <
;
€€< =
objCity
 
.
  
IsActive
  (
=
) *

entityCity
+ 5
.
5 6
IsActive
6 >
;
> ?
objCity
‚‚ 
.
‚‚  
ModifiedDate
‚‚  ,
=
‚‚- .
AppConstants
‚‚/ ;
.
‚‚; <
DateTime
‚‚< D
;
‚‚D E
objCity
ƒƒ 
.
ƒƒ  

ModifiedBy
ƒƒ  *
=
ƒƒ+ ,

entityCity
ƒƒ- 7
.
ƒƒ7 8
	CreatedBy
ƒƒ8 A
;
ƒƒA B
_repository
…… #
.
……# $
UpdateAsync
……$ /
(
……/ 0
objCity
……0 7
)
……7 8
;
……8 9
await
‡‡ 
_unitOfWork
‡‡ )
.
‡‡) *
SaveChangesAsync
‡‡* :
(
‡‡: ;
)
‡‡; <
;
‡‡< =
_auditLogService
 (
.
( )
CreateAuditLog
) 7
<
7 8

MasterCity
8 B
>
B C
(
C D!
AuditActionTypeEnum
D W
.
W X
Update
X ^
,
^ _
	OldEntity
` i
,
i j
objCity
k r
,
r s
MainTableNamet 
, ‚
MainTableKeyƒ 
) 
; ‘
}
‹‹ 
else
 
{
 
return
 
DBOperation
 *
.
* +
NotFound
+ 3
;
3 4
}
 
}
 
else
‘‘ 
{
’’ 
objCity
““ 
=
““ 
_mapperFactory
““ ,
.
““, -
Get
““- 0
<
““0 1
MasterCityEntity
““1 A
,
““A B

MasterCity
““C M
>
““M N
(
““N O

entityCity
““O Y
)
““Y Z
;
““Z [
objCity
•• 
.
•• 
CityName
•• $
=
••% &

entityCity
••' 1
.
••1 2
CityName
••2 :
;
••: ;
objCity
–– 
.
–– 
	CountryId
–– %
=
––& '

entityCity
––( 2
.
––2 3
	CountryId
––3 <
;
––< =
objCity
—— 
.
—— 
StateId
—— #
=
——$ %

entityCity
——& 0
.
——0 1
StateId
——1 8
;
——8 9
objCity
 
.
 
Stdcode
 #
=
$ %

entityCity
& 0
.
0 1
STDCode
1 8
;
8 9
objCity
™™ 
.
™™ 
IsActive
™™ $
=
™™% &

entityCity
™™' 1
.
™™1 2
IsActive
™™2 :
;
™™: ;
objCity
 
.
 
CreatedDate
 '
=
( )
AppConstants
* 6
.
6 7
DateTime
7 ?
;
? @
objCity
›› 
.
›› 
	CreatedBy
›› %
=
››& '

entityCity
››( 2
.
››2 3
	CreatedBy
››3 <
;
››< =
objCity
 
.
 
ModifiedDate
 (
=
) *
AppConstants
+ 7
.
7 8
DateTime
8 @
;
@ A
objCity
 
.
 

ModifiedBy
 &
=
' (

entityCity
) 3
.
3 4
	CreatedBy
4 =
;
= >
_repository
 
.
  
AddAsync
  (
(
( )
objCity
) 0
)
0 1
;
1 2
await
   
_unitOfWork
   %
.
  % &
SaveChangesAsync
  & 6
(
  6 7
)
  7 8
;
  8 9
}
΅΅ 
if
££ 
(
££ 
objCity
££ 
.
££ 
Id
££ 
==
££ !
$num
££" #
)
££# $
return
¤¤ 
DBOperation
¤¤ &
.
¤¤& '
Error
¤¤' ,
;
¤¤, -
return
¦¦ 
DBOperation
¦¦ "
.
¦¦" #
Success
¦¦# *
;
¦¦* +
}
§§ 
catch
¨¨ 
(
¨¨ 
	Exception
¨¨ 
ex
¨¨ 
)
¨¨  
{
©© 
throw
«« 
ex
«« 
;
«« 
}
¬¬ 
}
­­ 	
public
―― 
async
―― 
Task
―― 
<
―― 
DBOperation
―― %
>
――% &
Delete
――' -
(
――- .
int
――. 1
id
――2 4
)
――4 5
{
°° 	
var
±± 

entityCity
±± 
=
±± 
_repository
±± (
.
±±( )
Get
±±) ,
(
±±, -
x
±±- .
=>
±±/ 1
x
±±2 3
.
±±3 4
Id
±±4 6
==
±±7 9
id
±±: <
)
±±< =
;
±±= >
if
³³ 
(
³³ 

entityCity
³³ 
==
³³ 
null
³³ "
)
³³" #
return
΄΄ 
DBOperation
΄΄ "
.
΄΄" #
NotFound
΄΄# +
;
΄΄+ ,
_repository
¶¶ 
.
¶¶ 
Remove
¶¶ 
(
¶¶ 

entityCity
¶¶ )
)
¶¶) *
;
¶¶* +
await
ΈΈ 
_unitOfWork
ΈΈ 
.
ΈΈ 
SaveChangesAsync
ΈΈ .
(
ΈΈ. /
)
ΈΈ/ 0
;
ΈΈ0 1
return
ΊΊ 
DBOperation
ΊΊ 
.
ΊΊ 
Success
ΊΊ &
;
ΊΊ& '
}
»» 	
public
ΎΎ 
async
ΎΎ 
Task
ΎΎ 
<
ΎΎ 
List
ΎΎ 
<
ΎΎ 
MasterCityEntity
ΎΎ /
>
ΎΎ/ 0
>
ΎΎ0 1
GetCityList
ΎΎ2 =
(
ΎΎ= >
)
ΎΎ> ?
{
ΏΏ 	
var
ΑΑ 
lstStf
ΑΑ 
=
ΑΑ 
EltizamDBHelper
ΑΑ (
.
ΑΑ( )!
ExecuteMappedReader
ΑΑ) <
<
ΑΑ< =
MasterCityEntity
ΑΑ= M
>
ΑΑM N
(
ΑΑN O 
ProcedureMetastore
ΑΑO a
.
ΑΑa b
usp_City_AllList
ΑΑb r
,
ΑΑr s 
DatabaseConnection
ΒΒ 
.
ΒΒ  

ConnString
ΒΒ  *
,
ΒΒ* +
CommandType
ΒΒ, 7
.
ΒΒ7 8
StoredProcedure
ΒΒ8 G
,
ΒΒG H
null
ΒΒI M
)
ΒΒM N
;
ΒΒN O
return
ΔΔ 
lstStf
ΔΔ 
;
ΔΔ 
}
ΕΕ 	
public
ΗΗ 
async
ΗΗ 
Task
ΗΗ 
<
ΗΗ 
List
ΗΗ 
<
ΗΗ 
MasterCityEntity
ΗΗ /
>
ΗΗ/ 0
>
ΗΗ0 1"
GetCityListByStateId
ΗΗ2 F
(
ΗΗF G
int
ΗΗG J
stateId
ΗΗK R
)
ΗΗR S
{
ΘΘ 	
var
ΙΙ 
cityList
ΙΙ 
=
ΙΙ 
new
ΙΙ 
List
ΙΙ #
<
ΙΙ# $
MasterCityEntity
ΙΙ$ 4
>
ΙΙ4 5
(
ΙΙ5 6
)
ΙΙ6 7
;
ΙΙ7 8
var
ΚΚ 
stateListAsync
ΚΚ 
=
ΚΚ  
_repository
ΚΚ! ,
.
ΚΚ, -
GetAllAsync
ΚΚ- 8
(
ΚΚ8 9
x
ΚΚ9 :
=>
ΚΚ; =
x
ΚΚ> ?
.
ΚΚ? @
StateId
ΚΚ@ G
==
ΚΚH J
stateId
ΚΚK R
)
ΚΚR S
.
ΚΚS T
Result
ΚΚT Z
.
ΚΚZ [
ToList
ΚΚ[ a
(
ΚΚa b
)
ΚΚb c
;
ΚΚc d
cityList
ΜΜ 
=
ΜΜ 
_mapperFactory
ΜΜ %
.
ΜΜ% &
GetList
ΜΜ& -
<
ΜΜ- .

MasterCity
ΜΜ. 8
,
ΜΜ8 9
MasterCityEntity
ΜΜ: J
>
ΜΜJ K
(
ΜΜK L
stateListAsync
ΜΜL Z
)
ΜΜZ [
;
ΜΜ[ \
return
ΝΝ 
cityList
ΝΝ 
;
ΝΝ 
}
ΞΞ 	
}
ΟΟ 
}ΠΠ  
JD:\EltizamLive\Eltizam.Business.Core\Implementation\MasterClientService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
Implementation  .
{ 
public 

class 
MasterClientService $
:% & 
IMasterClientService' ;
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IMapperFactory '
_mapperFactory( 6
;6 7
private 
readonly 
	Microsoft "
." #

Extensions# -
.- .
Configuration. ;
.; <
IConfiguration< J
configurationK X
;X Y
private 
IRepository 
< 
MasterClient (
>( )
_repository* 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
private 
IRepository 
< 
MasterAddress )
>) *
_repositoryAddress+ =
{> ?
get@ C
;C D
setE H
;H I
}J K
private 
IRepository 
< 
MasterContact )
>) *
_repositoryContact+ =
{> ?
get@ C
;C D
setE H
;H I
}J K
private 
IRepository 
< 
ValuationRequest ,
>, - 
_repositoryValuation. B
{C D
getE H
;H I
setJ M
;M N
}O P
private 
IRepository 
< 
MasterDocument *
>* +
_repositoryDocument, ?
{@ A
getB E
;E F
setG J
;J K
}L M
private 
readonly 
IAuditLogService )
_auditLogService* :
;: ;
private 
readonly 
IFileUploadService +
_fileUploadService, >
;> ?
private 
readonly 
IHelper  
_helper! (
;( )
private 
readonly 
string 
_dbConnection  -
;- .
public## 
MasterClientService## "
(##" #
IUnitOfWork### .

unitOfWork##/ 9
,##9 :
IMapperFactory##; I
mapperFactory##J W
,##W X
IAuditLogService##Y i
auditLogService##j y
,##y z
IHelper$$
 
helper$$ 
,$$ 
	Microsoft%% 
.%% 

Extensions%% 
.%%  
Configuration%%  -
.%%- .
IConfiguration%%. <
_configuration%%= K
,%%K L
IFileUploadService%%M _
fileUploadService%%` q
)%%q r
{&& 	
_unitOfWork'' 
='' 

unitOfWork'' $
;''$ %
_mapperFactory(( 
=(( 
mapperFactory(( *
;((* +
_repository** 
=** 
_unitOfWork** %
.**% &
GetRepository**& 3
<**3 4
MasterClient**4 @
>**@ A
(**A B
)**B C
;**C D
_repositoryAddress++ 
=++  
_unitOfWork++! ,
.++, -
GetRepository++- :
<++: ;
MasterAddress++; H
>++H I
(++I J
)++J K
;++K L
_repositoryContact,, 
=,,  
_unitOfWork,,! ,
.,,, -
GetRepository,,- :
<,,: ;
MasterContact,,; H
>,,H I
(,,I J
),,J K
;,,K L 
_repositoryValuation--  
=--! "
_unitOfWork--# .
.--. /
GetRepository--/ <
<--< =
ValuationRequest--= M
>--M N
(--N O
)--O P
;--P Q
_repositoryDocument.. 
=..  !
_unitOfWork.." -
...- .
GetRepository... ;
<..; <
MasterDocument..< J
>..J K
(..K L
)..L M
;..M N
configuration// 
=// 
_configuration// *
;//* +
_helper00 
=00 
helper00 
;00 
_auditLogService11 
=11 
auditLogService11 .
;11. /
_dbConnection33 
=33 
DatabaseConnection33 .
.33. /

ConnString33/ 9
;339 :
_fileUploadService44 
=44  
fileUploadService44! 2
;442 3
}55 	
publicII 
asyncII 
TaskII 
<II 
MasterClientModelII +
>II+ ,$
GetMasterClientByIdAsyncII- E
(IIE F
intIIF I
idIIJ L
)IIL M
{JJ 	
varLL 
_clientEntityLL 
=LL 
newLL  #
MasterClientModelLL$ 5
(LL5 6
)LL6 7
;LL7 8
_clientEntityMM 
=MM 
_mapperFactoryMM *
.MM* +
GetMM+ .
<MM. /
MasterClientMM/ ;
,MM; <
MasterClientModelMM= N
>MMN O
(MMO P
awaitMMP U
_repositoryMMV a
.MMa b
GetAsyncMMb j
(MMj k
idMMk m
)MMm n
)MMn o
;MMo p
varNN 
	tableNameNN 
=NN 
EnumNN  
.NN  !
GetNameNN! (
(NN( )
TableNameEnumNN) 6
.NN6 7
Master_ClientNN7 D
)NND E
;NNE F
ifPP 
(PP 
_clientEntityPP 
!=PP  
nullPP! %
)PP% &
{QQ 
DbParameterRR 
[RR 
]RR 
osqlParameterRR +
=RR, -
{SS 
newTT 
DbParameterTT $
(TT$ %
AppConstantsTT% 1
.TT1 2

TableKeyIdTT2 <
,TT< =
idTT> @
,TT@ A
	SqlDbTypeTTB K
.TTK L
IntTTL O
)TTO P
,TTP Q
newUU 
DbParameterUU $
(UU$ %
AppConstantsUU% 1
.UU1 2
	TableNameUU2 ;
,UU; <
	tableNameUU> G
,UUG H
	SqlDbTypeUUI R
.UUR S
VarCharUUS Z
)UUZ [
,UU[ \
}VV 
;VV 
varWW 
UserAddressWW 
=WW  !
EltizamDBHelperWW" 1
.WW1 2
ExecuteMappedReaderWW2 E
<WWE F
MasterAddressEntityWWF Y
>WWY Z
(WWZ [
ProcedureMetastoreWW[ m
.WWm n/
"usp_Address_GetAddressByTableKeyId	WWn 
,
WW ‘
_dbConnection
WW’ 
,
WW  
System
WW΅ §
.
WW§ ¨
Data
WW¨ ¬
.
WW¬ ­
CommandType
WW­ Έ
.
WWΈ Ή
StoredProcedure
WWΉ Θ
,
WWΘ Ι
osqlParameter
WWΚ Χ
)
WWΧ Ψ
;
WWΨ Ω
ifYY 
(YY 
UserAddressYY 
!=YY  "
nullYY# '
)YY' (
_clientEntityZZ !
.ZZ! "
	AddressesZZ" +
=ZZ, -
UserAddressZZ. 9
;ZZ9 :
if\\ 
(\\ 
_clientEntity\\ !
.\\! "
ProfileAttachmentId\\" 5
!=\\6 8
null\\9 =
&&\\> @
_clientEntity\\A N
.\\N O
ProfileAttachmentId\\O b
>\\c d
$num\\e f
)\\f g
{]] 
var^^ 
profile^^ 
=^^  !
_repositoryDocument^^" 5
.^^5 6
Get^^6 9
(^^9 :
_clientEntity^^: G
.^^G H
ProfileAttachmentId^^H [
)^^[ \
;^^\ ]
if__ 
(__ 
profile__ 
!=__  "
null__# '
)__' (
{`` 
_clientEntityaa %
.aa% &
ProfilePathaa& 1
=aa2 3
profileaa4 ;
.aa; <
FilePathaa< D
;aaD E
}bb 
}cc 
DbParameterff 
[ff 
]ff 
osqlParameter1ff ,
=ff- .
{gg 
newhh 
DbParameterhh  
(hh  !
AppConstantshh! -
.hh- .

TableKeyIdhh. 8
,hh8 9
idhh: <
,hh< =
	SqlDbTypehh> G
.hhG H
InthhH K
)hhK L
,hhL M
newii 
DbParameterii  
(ii  !
AppConstantsii! -
.ii- .
	TableNameii. 7
,ii7 8
	tableNameii9 B
,iiB C
	SqlDbTypeiiD M
.iiM N
VarChariiN U
)iiU V
,iiV W
}jj 
;jj 
varll 
contactsll 
=ll 
EltizamDBHelperll .
.ll. /
ExecuteMappedReaderll/ B
<llB C
MasterContactModelllC U
>llU V
(llV W
ProcedureMetastorellW i
.lli j/
"usp_Contact_GetContactByTableKeyId	llj 
,
ll  
DatabaseConnection
ll  
.
ll  ΅

ConnString
ll΅ «
,
ll« ¬
System
ll­ ³
.
ll³ ΄
Data
ll΄ Έ
.
llΈ Ή
CommandType
llΉ Δ
.
llΔ Ε
StoredProcedure
llΕ Τ
,
llΤ Υ
osqlParameter1
llΦ δ
)
llδ ε
;
llε ζ
ifmm 
(mm 
contactsmm 
!=mm 
nullmm  $
)mm$ %
{nn 
_clientEntityoo !
.oo! "
Contactsoo" *
=oo+ ,
contactsoo- 5
;oo5 6
}pp 
DbParameterrr 
[rr 
]rr 
osqlParameter2rr ,
=rr- .
{ss 
newtt 
DbParametertt  
(tt  !
AppConstantstt! -
.tt- .

TableKeyIdtt. 8
,tt8 9
idtt: <
,tt< =
	SqlDbTypett> G
.ttG H
IntttH K
)ttK L
,ttL M
newuu 
DbParameteruu  
(uu  !
AppConstantsuu! -
.uu- .
	TableNameuu. 7
,uu7 8
	tableNameuu: C
,uuC D
	SqlDbTypeuuE N
.uuN O
VarCharuuO V
)uuV W
,uuW X
}vv 
;vv 
varxx 
UserDocumentsxx !
=xx" #
EltizamDBHelperxx$ 3
.xx3 4
ExecuteMappedReaderxx4 G
<xxG H
MasterDocumentModelxxH [
>xx[ \
(xx\ ]
ProcedureMetastorexx] o
.xxo p1
$usp_Document_GetDocumentByTableKeyId	xxp ”
,
xx” •
_dbConnection
xx– £
,
xx£ ¤
System
xx¥ «
.
xx« ¬
Data
xx¬ °
.
xx° ±
CommandType
xx± Ό
.
xxΌ ½
StoredProcedure
xx½ Μ
,
xxΜ Ν
osqlParameter2
xxΞ ά
)
xxά έ
;
xxέ ή
ifyy 
(yy 
UserDocumentsyy !
!=yy" $
nullyy% )
)yy) *
_clientEntityzz !
.zz! "
	Documentszz" +
=zz, -
UserDocumentszz. ;
;zz; <
}{{ 
return}} 
_clientEntity}}  
;}}  !
}~~ 	
public
€€ 
async
€€ 
Task
€€ 
<
€€ $
DataTableResponseModel
€€ 0
>
€€0 1
GetAll
€€2 8
(
€€8 9$
DataTableAjaxPostModel
€€9 O
model
€€P U
)
€€U V
{
 	
string
‚‚ 

ColumnName
‚‚ 
=
‚‚ 
(
‚‚  !
model
‚‚! &
.
‚‚& '
order
‚‚' ,
.
‚‚, -
Count
‚‚- 2
>
‚‚3 4
$num
‚‚5 6
?
‚‚7 8
model
‚‚9 >
.
‚‚> ?
columns
‚‚? F
[
‚‚F G
model
‚‚G L
.
‚‚L M
order
‚‚M R
[
‚‚R S
$num
‚‚S T
]
‚‚T U
.
‚‚U V
column
‚‚V \
]
‚‚\ ]
.
‚‚] ^
data
‚‚^ b
:
‚‚c d
string
‚‚e k
.
‚‚k l
Empty
‚‚l q
)
‚‚q r
;
‚‚r s
string
ƒƒ 
SortDir
ƒƒ 
=
ƒƒ 
(
ƒƒ 
model
ƒƒ #
.
ƒƒ# $
order
ƒƒ$ )
.
ƒƒ) *
Count
ƒƒ* /
>
ƒƒ0 1
$num
ƒƒ2 3
?
ƒƒ4 5
model
ƒƒ6 ;
.
ƒƒ; <
order
ƒƒ< A
[
ƒƒA B
$num
ƒƒB C
]
ƒƒC D
.
ƒƒD E
dir
ƒƒE H
:
ƒƒI J
string
ƒƒK Q
.
ƒƒQ R
Empty
ƒƒR W
)
ƒƒW X
;
ƒƒX Y
SqlParameter
…… 
[
…… 
]
…… 
osqlParameter
…… (
=
……) *
{
†† 
new
‡‡ 
SqlParameter
‡‡  
(
‡‡  !
AppConstants
‡‡! -
.
‡‡- .!
P_CurrentPageNumber
‡‡. A
,
‡‡A B
model
‡‡D I
.
‡‡I J
start
‡‡J O
)
‡‡O P
,
‡‡P Q
new
 
SqlParameter
  
(
  !
AppConstants
! -
.
- .

P_PageSize
. 8
,
8 9
model
D I
.
I J
length
J P
)
P Q
,
Q R
new
‰‰ 
SqlParameter
‰‰  
(
‰‰  !
AppConstants
‰‰! -
.
‰‰- .
P_SortColumn
‰‰. :
,
‰‰: ;

ColumnName
‰‰D N
)
‰‰N O
,
‰‰O P
new
 
SqlParameter
  
(
  !
AppConstants
! -
.
- .
P_SortDirection
. =
,
= >
SortDir
D K
)
K L
,
L M
new
‹‹ 
SqlParameter
‹‹  
(
‹‹  !
AppConstants
‹‹! -
.
‹‹- .
P_SearchText
‹‹. :
,
‹‹: ;
model
‹‹D I
.
‹‹I J
search
‹‹J P
?
‹‹P Q
.
‹‹Q R
value
‹‹R W
)
‹‹W X
}
 
;
 
var
 
Results
 
=
 
await
 
_repository
  +
.
+ ,
GetBySP
, 3
(
3 4 
ProcedureMetastore
4 F
.
F G-
usp_Client_Search_GetClientList
G f
,
f g
System
h n
.
n o
Data
o s
.
s t
CommandType
t 
. €
StoredProcedure€ 
, 
osqlParameter‘ 
) 
;  
var
 
res
 
=
 
UtilityHelper
 #
.
# $
GetPaginationInfo
$ 5
(
5 6
Results
6 =
)
= >
;
> ?$
DataTableResponseModel
‘‘ "%
oDataTableResponseModel
‘‘# :
=
‘‘; <
new
‘‘= @$
DataTableResponseModel
‘‘A W
(
‘‘W X
model
‘‘X ]
.
‘‘] ^
draw
‘‘^ b
,
‘‘b c
res
‘‘d g
.
‘‘g h
Item1
‘‘h m
,
‘‘m n
res
‘‘o r
.
‘‘r s
Item1
‘‘s x
,
‘‘x y
Results‘‘z 
.‘‘ ‚
DataTableToList‘‘‚ ‘
<‘‘‘ ’%
MasterClientListModel‘‘’ §
>‘‘§ ¨
(‘‘¨ ©
)‘‘© ª
)‘‘ª «
;‘‘« ¬
return
““ %
oDataTableResponseModel
““ *
;
““* +
}
•• 	
public
—— 
async
—— 
Task
—— 
<
—— 
DBOperation
—— %
>
——% &#
AddUpdateMasterClient
——' <
(
——< =
MasterClientModel
——= N 
master_ClientModel
——O a
)
——a b
{
 	
MasterClient
›› 
	objClient
›› "
;
››" #
MasterAddress
 

objAddress
 $
;
$ %
MasterContact
 

objContact
 $
;
$ %
MasterDocument
 
objDocument
 &
;
& '
string
   
MainTableName
    
=
  ! "
Enum
  # '
.
  ' (
GetName
  ( /
(
  / 0
TableNameEnum
  0 =
.
  = >
Master_Client
  > K
)
  K L
;
  L M
int
΅΅ 
MainTableKey
΅΅ 
=
΅΅  
master_ClientModel
΅΅ 1
.
΅΅1 2
Id
΅΅2 4
;
΅΅4 5
if
¤¤ 
(
¤¤  
master_ClientModel
¤¤ "
.
¤¤" #
Id
¤¤# %
>
¤¤& '
$num
¤¤( )
)
¤¤) *
{
¥¥ 
MasterClient
§§ 
	OldEntity
§§ &
=
§§' (
null
§§) -
;
§§- .
	OldEntity
¨¨ 
=
¨¨ 
_repository
¨¨ '
.
¨¨' (
GetNoTracking
¨¨( 5
(
¨¨5 6 
master_ClientModel
¨¨6 H
.
¨¨H I
Id
¨¨I K
)
¨¨K L
;
¨¨L M
	objClient
ªª 
=
ªª 
_repository
ªª '
.
ªª' (
Get
ªª( +
(
ªª+ , 
master_ClientModel
ªª, >
.
ªª> ?
Id
ªª? A
)
ªªA B
;
ªªB C
if
­­ 
(
­­ 
	objClient
­­ 
!=
­­  
null
­­! %
)
­­% &
{
®® 
	objClient
―― 
=
―― 
_mapperFactory
――  .
.
――. /
Get
――/ 2
<
――2 3
MasterClientModel
――3 D
,
――D E
MasterClient
――F R
>
――R S
(
――S T 
master_ClientModel
――T f
)
――f g
;
――g h
	objClient
°° 
.
°° 
	FirstName
°° '
=
°°( ) 
master_ClientModel
°°* <
.
°°< =
	FirstName
°°= F
;
°°F G
	objClient
±± 
.
±± 

MiddleName
±± (
=
±±) * 
master_ClientModel
±±+ =
.
±±= >

MiddleName
±±> H
==
±±H J
null
±±J N
?
±±N O
$str
±±O Q
:
±±Q R 
master_ClientModel
±±S e
.
±±e f

MiddleName
±±f p
;
±±p q
	objClient
²² 
.
²² 
LastName
²² &
=
²²' ( 
master_ClientModel
²²) ;
.
²²; <
LastName
²²< D
;
²²D E
	objClient
³³ 
.
³³ 
ClientTypeId
³³ *
=
³³+ , 
master_ClientModel
³³- ?
.
³³? @
ClientTypeId
³³@ L
;
³³L M
	objClient
΄΄ 
.
΄΄ 
	Trnnumber
΄΄ '
=
΄΄( ) 
master_ClientModel
΄΄* <
.
΄΄< =
	Trnnumber
΄΄= F
;
΄΄F G
	objClient
µµ 
.
µµ 
TrnexpiryDate
µµ +
=
µµ, - 
master_ClientModel
µµ. @
.
µµ@ A
TrnexpiryDate
µµA N
;
µµN O
	objClient
¶¶ 
.
¶¶ 
LicenseNumber
¶¶ +
=
¶¶, - 
master_ClientModel
¶¶. @
.
¶¶@ A
LicenseNumber
¶¶A N
;
¶¶N O
	objClient
·· 
.
·· 
IsActive
·· &
=
··' ( 
master_ClientModel
··) ;
.
··; <
IsActive
··< D
;
··D E
	objClient
ΈΈ 
.
ΈΈ 
Logo
ΈΈ "
=
ΈΈ# $ 
master_ClientModel
ΈΈ% 7
.
ΈΈ7 8
Logo
ΈΈ8 <
;
ΈΈ< =
	objClient
ΉΉ 
.
ΉΉ 
ModifiedDate
ΉΉ *
=
ΉΉ+ ,
AppConstants
ΉΉ- 9
.
ΉΉ9 :
DateTime
ΉΉ: B
;
ΉΉB C
	objClient
ΊΊ 
.
ΊΊ 

ModifiedBy
ΊΊ (
=
ΊΊ) * 
master_ClientModel
ΊΊ+ =
.
ΊΊ= >

ModifiedBy
ΊΊ> H
;
ΊΊH I
_repository
½½ 
.
½½  
UpdateAsync
½½  +
(
½½+ ,
	objClient
½½, 5
)
½½5 6
;
½½6 7
await
ΐΐ 
_unitOfWork
ΐΐ %
.
ΐΐ% &
SaveChangesAsync
ΐΐ& 6
(
ΐΐ6 7
)
ΐΐ7 8
;
ΐΐ8 9
await
ΒΒ 
_auditLogService
ΒΒ *
.
ΒΒ* +
CreateAuditLog
ΒΒ+ 9
<
ΒΒ9 :
MasterClient
ΒΒ: F
>
ΒΒF G
(
ΒΒG H!
AuditActionTypeEnum
ΒΒH [
.
ΒΒ[ \
Update
ΒΒ\ b
,
ΒΒb c
	OldEntity
ΒΒd m
,
ΒΒm n
	objClient
ΒΒo x
,
ΒΒx y
MainTableNameΒΒz ‡
,ΒΒ‡ 
MainTableKeyΒΒ‰ •
)ΒΒ• –
;ΒΒ– —
}
ΓΓ 
else
ΔΔ 
{
ΕΕ 
return
ΗΗ 
DBOperation
ΗΗ &
.
ΗΗ& '
NotFound
ΗΗ' /
;
ΗΗ/ 0
}
ΘΘ 
}
ΙΙ 
else
ΚΚ 
{
ΛΛ 
	objClient
ΝΝ 
=
ΝΝ 
_mapperFactory
ΝΝ *
.
ΝΝ* +
Get
ΝΝ+ .
<
ΝΝ. /
MasterClientModel
ΝΝ/ @
,
ΝΝ@ A
MasterClient
ΝΝB N
>
ΝΝN O
(
ΝΝO P 
master_ClientModel
ΝΝP b
)
ΝΝb c
;
ΝΝc d
	objClient
ΞΞ 
.
ΞΞ 

MiddleName
ΞΞ $
=
ΞΞ% & 
master_ClientModel
ΞΞ' 9
.
ΞΞ9 :

MiddleName
ΞΞ: D
==
ΞΞE G
null
ΞΞH L
?
ΞΞM N
$str
ΞΞO Q
:
ΞΞR S 
master_ClientModel
ΞΞT f
.
ΞΞf g

MiddleName
ΞΞg q
;
ΞΞq r
	objClient
ΟΟ 
.
ΟΟ 
CreatedDate
ΟΟ %
=
ΟΟ& '
AppConstants
ΟΟ( 4
.
ΟΟ4 5
DateTime
ΟΟ5 =
;
ΟΟ= >
	objClient
ΠΠ 
.
ΠΠ 
	CreatedBy
ΠΠ #
=
ΠΠ$ % 
master_ClientModel
ΠΠ& 8
.
ΠΠ8 9
	CreatedBy
ΠΠ9 B
;
ΠΠB C
_repository
ΣΣ 
.
ΣΣ 
AddAsync
ΣΣ $
(
ΣΣ$ %
	objClient
ΣΣ% .
)
ΣΣ. /
;
ΣΣ/ 0
await
ΤΤ 
_unitOfWork
ΤΤ !
.
ΤΤ! "
SaveChangesAsync
ΤΤ" 2
(
ΤΤ2 3
)
ΤΤ3 4
;
ΤΤ4 5
}
ΥΥ 
if
ΨΨ 
(
ΨΨ 
	objClient
ΨΨ 
.
ΨΨ 
Id
ΨΨ 
==
ΨΨ 
$num
ΨΨ  !
)
ΨΨ! "
{
ΩΩ 
return
ΪΪ 
DBOperation
ΪΪ "
.
ΪΪ" #
Error
ΪΪ# (
;
ΪΪ( )
}
ΫΫ 
else
άά 
{
έέ 
if
ίί 
(
ίί  
master_ClientModel
ίί &
.
ίί& '
uploadProfile
ίί' 4
!=
ίί5 7
null
ίί8 <
)
ίί< =
{
ΰΰ 
objDocument
αα 
=
αα  !
_mapperFactory
αα" 0
.
αα0 1
Get
αα1 4
<
αα4 5!
MasterDocumentModel
αα5 H
,
ααH I
MasterDocument
ααJ X
>
ααX Y
(
ααY Z 
master_ClientModel
ααZ l
.
ααl m
uploadProfile
ααm z
)
ααz {
;
αα{ |
objDocument
ββ 
.
ββ  
IsActive
ββ  (
=
ββ) * 
master_ClientModel
ββ+ =
.
ββ= >
uploadProfile
ββ> K
.
ββK L
IsActive
ββL T
;
ββT U
objDocument
γγ 
.
γγ  

TableKeyId
γγ  *
=
γγ+ ,
	objClient
γγ- 6
.
γγ6 7
Id
γγ7 9
;
γγ9 :
objDocument
δδ 
.
δδ  
	TableName
δδ  )
=
δδ* +
$str
δδ, ;
;
δδ; <
objDocument
εε 
.
εε  
DocumentName
εε  ,
=
εε- . 
master_ClientModel
εε/ A
.
εεA B
uploadProfile
εεB O
.
εεO P
DocumentName
εεP \
;
εε\ ]
objDocument
ζζ 
.
ζζ  
FileName
ζζ  (
=
ζζ) * 
master_ClientModel
ζζ+ =
.
ζζ= >
uploadProfile
ζζ> K
.
ζζK L
FileName
ζζL T
;
ζζT U
objDocument
ηη 
.
ηη  
FilePath
ηη  (
=
ηη) * 
master_ClientModel
ηη+ =
.
ηη= >
uploadProfile
ηη> K
.
ηηK L
FilePath
ηηL T
;
ηηT U
objDocument
θθ 
.
θθ  
FileType
θθ  (
=
θθ) * 
master_ClientModel
θθ+ =
.
θθ= >
uploadProfile
θθ> K
.
θθK L
FileType
θθL T
;
θθT U
objDocument
ιι 
.
ιι  
	CreatedBy
ιι  )
=
ιι* + 
master_ClientModel
ιι, >
.
ιι> ?
uploadProfile
ιι? L
.
ιιL M
	CreatedBy
ιιM V
;
ιιV W!
_repositoryDocument
λλ '
.
λλ' (
AddAsync
λλ( 0
(
λλ0 1
objDocument
λλ1 <
)
λλ< =
;
λλ= >
await
μμ 
_unitOfWork
μμ %
.
μμ% &
SaveChangesAsync
μμ& 6
(
μμ6 7
)
μμ7 8
;
μμ8 9
var
ππ 
client
ππ 
=
ππ  
_repository
ππ! ,
.
ππ, -
Get
ππ- 0
(
ππ0 1
	objClient
ππ1 :
.
ππ: ;
Id
ππ; =
)
ππ= >
;
ππ> ?
client
ρρ 
.
ρρ !
ProfileAttachmentId
ρρ .
=
ρρ/ 0
objDocument
ρρ1 <
.
ρρ< =
Id
ρρ= ?
;
ρρ? @
_repository
σσ 
.
σσ  
UpdateAsync
σσ  +
(
σσ+ ,
client
σσ, 2
)
σσ2 3
;
σσ3 4
await
ττ 
_unitOfWork
ττ %
.
ττ% &
SaveChangesAsync
ττ& 6
(
ττ6 7
)
ττ7 8
;
ττ8 9
}
υυ 
if
φφ 
(
φφ  
master_ClientModel
φφ &
.
φφ& '
	Addresses
φφ' 0
.
φφ0 1
Count
φφ1 6
>
φφ7 8
$num
φφ9 :
)
φφ: ;
{
χχ 
var
ωω 
entityAddressess
ωω (
=
ωω) * 
_repositoryAddress
ωω+ =
.
ωω= >
GetAll
ωω> D
(
ωωD E
)
ωωE F
.
ωωF G
Where
ωωG L
(
ωωL M
x
ωωM N
=>
ωωO Q
x
ωωR S
.
ωωS T

TableKeyId
ωωT ^
==
ωω_ a
	objClient
ωωb k
.
ωωk l
Id
ωωl n
&&
ωωo q
x
ωωr s
.
ωωs t
	TableName
ωωt }
==ωω~ €
$strωω 
&&ωω‘ “
(ωω” •
xωω• –
.ωω– —
	IsDeletedωω—  
==ωω΅ £
falseωω¤ ©
||ωωª ¬
xωω­ ®
.ωω® ―
	IsDeletedωω― Έ
==ωωΉ »
nullωωΌ ΐ
)ωωΐ Α
)ωωΑ Β
.ωωΒ Γ
ToListωωΓ Ι
(ωωΙ Κ
)ωωΚ Λ
;ωωΛ Μ
var
ϊϊ 
allAddressId
ϊϊ $
=
ϊϊ% &
entityAddressess
ϊϊ' 7
.
ϊϊ7 8
Count
ϊϊ8 =
>
ϊϊ> ?
$num
ϊϊ@ A
?
ϊϊB C
entityAddressess
ϊϊD T
.
ϊϊT U
Select
ϊϊU [
(
ϊϊ[ \
x
ϊϊ\ ]
=>
ϊϊ^ `
x
ϊϊa b
.
ϊϊb c
Id
ϊϊc e
)
ϊϊe f
.
ϊϊf g
OrderBy
ϊϊg n
(
ϊϊn o
Id
ϊϊo q
=>
ϊϊr t
Id
ϊϊu w
)
ϊϊw x
.
ϊϊx y
ToList
ϊϊy 
(ϊϊ €
)ϊϊ€ 
:ϊϊ‚ ƒ
nullϊϊ„ 
;ϊϊ ‰
foreach
όό 
(
όό 
var
όό  
address
όό! (
in
όό) + 
master_ClientModel
όό, >
.
όό> ?
	Addresses
όό? H
)
όόH I
{
ύύ 
if
ώώ 
(
ώώ 
address
ώώ #
.
ώώ# $
Id
ώώ$ &
>
ώώ' (
$num
ώώ) *
)
ώώ* +
{
ÿÿ 
if
€€ 
(
€€ 
allAddressId
€€ +
!=
€€, .
null
€€/ 3
&&
€€4 6
allAddressId
€€7 C
.
€€C D
Count
€€D I
>
€€J K
$num
€€L M
)
€€M N
{
 
allAddressId
‚‚  ,
.
‚‚, -
Remove
‚‚- 3
(
‚‚3 4
address
‚‚4 ;
.
‚‚; <
Id
‚‚< >
)
‚‚> ?
;
‚‚? @
}
ƒƒ 
var
…… 
	OldEntity
……  )
=
……* + 
_repositoryAddress
……, >
.
……> ?
GetNoTracking
……? L
(
……L M
address
……M T
.
……T U
Id
……U W
)
……W X
;
……X Y

objAddress
‡‡ &
=
‡‡' ( 
_repositoryAddress
‡‡) ;
.
‡‡; <
Get
‡‡< ?
(
‡‡? @
address
‡‡@ G
.
‡‡G H
Id
‡‡H J
)
‡‡J K
;
‡‡K L
if
 
(
  

objAddress
  *
!=
+ -
null
. 2
)
2 3
{
‰‰ 
var
  #
entityAddress
$ 1
=
2 3
_mapperFactory
4 B
.
B C
Get
C F
<
F G!
MasterAddressEntity
G Z
,
Z [
MasterAddress
\ i
>
i j
(
j k
address
k r
)
r s
;
s t

objAddress
‹‹  *
.
‹‹* +
Address1
‹‹+ 3
=
‹‹4 5
entityAddress
‹‹6 C
.
‹‹C D
Address1
‹‹D L
;
‹‹L M

objAddress
  *
.
* +
Address2
+ 3
=
4 5
entityAddress
6 C
.
C D
Address2
D L
;
L M

objAddress
  *
.
* +
Address3
+ 3
=
4 5
entityAddress
6 C
.
C D
Address3
D L
;
L M

objAddress
  *
.
* +
Landmark
+ 3
=
4 5
entityAddress
6 C
.
C D
Landmark
D L
;
L M

objAddress
  *
.
* +
PinNo
+ 0
=
1 2
entityAddress
3 @
.
@ A
PinNo
A F
;
F G

objAddress
  *
.
* +
	CountryId
+ 4
=
5 6
entityAddress
7 D
.
D E
	CountryId
E N
;
N O

objAddress
‘‘  *
.
‘‘* +
StateId
‘‘+ 2
=
‘‘3 4
entityAddress
‘‘5 B
.
‘‘B C
StateId
‘‘C J
;
‘‘J K

objAddress
’’  *
.
’’* +
CityId
’’+ 1
=
’’2 3
entityAddress
’’4 A
.
’’A B
CityId
’’B H
;
’’H I

objAddress
““  *
.
““* +
PinNo
““+ 0
=
““1 2
entityAddress
““3 @
.
““@ A
PinNo
““A F
;
““F G

objAddress
””  *
.
””* +
Zone
””+ /
=
””0 1
entityAddress
””2 ?
.
””? @
Zone
””@ D
;
””D E

objAddress
••  *
.
••* +
Email
••+ 0
=
••1 2
entityAddress
••3 @
.
••@ A
Email
••A F
;
••F G

objAddress
––  *
.
––* +
AlternateEmail
––+ 9
=
––: ;
entityAddress
––< I
.
––I J
AlternateEmail
––J X
;
––X Y

objAddress
——  *
.
——* +
PhoneExt
——+ 3
=
——4 5
entityAddress
——6 C
.
——C D
PhoneExt
——D L
;
——L M

objAddress
  *
.
* +
Phone
+ 0
=
1 2
entityAddress
3 @
.
@ A
Phone
A F
;
F G

objAddress
™™  *
.
™™* +
AlternatePhone
™™+ 9
=
™™: ;
entityAddress
™™< I
.
™™I J
AlternatePhone
™™J X
;
™™X Y

objAddress
  *
.
* +
AlternatePhoneExt
+ <
=
= >
entityAddress
? L
.
L M
AlternatePhoneExt
M ^
;
^ _

objAddress
››  *
.
››* +
Landlinephone
››+ 8
=
››9 :
entityAddress
››; H
.
››H I
Landlinephone
››I V
;
››V W

objAddress
  *
.
* +

ModifiedBy
+ 5
=
6 7 
master_ClientModel
8 J
.
J K

ModifiedBy
K U
;
U V 
_repositoryAddress
  2
.
2 3
UpdateAsync
3 >
(
> ?

objAddress
? I
)
I J
;
J K
await
΅΅  %
_unitOfWork
΅΅& 1
.
΅΅1 2
SaveChangesAsync
΅΅2 B
(
΅΅B C
)
΅΅C D
;
΅΅D E
await
¤¤  %
_auditLogService
¤¤& 6
.
¤¤6 7
CreateAuditLog
¤¤7 E
<
¤¤E F
MasterAddress
¤¤F S
>
¤¤S T
(
¤¤T U!
AuditActionTypeEnum
¤¤U h
.
¤¤h i
Update
¤¤i o
,
¤¤o p
	OldEntity
¤¤q z
,
¤¤z {

objAddress¤¤| †
,¤¤† ‡
MainTableName¤¤ •
,¤¤• –
MainTableKey¤¤— £
)¤¤£ ¤
;¤¤¤ ¥
}
¥¥ 
}
¦¦ 
else
§§ 
{
¨¨ 

objAddress
ªª &
=
ªª' (
_mapperFactory
ªª) 7
.
ªª7 8
Get
ªª8 ;
<
ªª; <!
MasterAddressEntity
ªª< O
,
ªªO P
MasterAddress
ªªQ ^
>
ªª^ _
(
ªª_ `
address
ªª` g
)
ªªg h
;
ªªh i

objAddress
«« &
.
««& '

TableKeyId
««' 1
=
««2 3
	objClient
««4 =
.
««= >
Id
««> @
;
««@ A

objAddress
¬¬ &
.
¬¬& '
	TableName
¬¬' 0
=
¬¬1 2
Enum
¬¬3 7
.
¬¬7 8
GetName
¬¬8 ?
(
¬¬? @
TableNameEnum
¬¬@ M
.
¬¬M N
Master_Client
¬¬N [
)
¬¬[ \
;
¬¬\ ]

objAddress
­­ &
.
­­& '
	CreatedBy
­­' 0
=
­­1 2 
master_ClientModel
­­3 E
.
­­E F
	CreatedBy
­­F O
;
­­O P

objAddress
®® &
.
®®& '
IsActive
®®' /
=
®®0 1
true
®®2 6
;
®®6 7 
_repositoryAddress
―― .
.
――. /
AddAsync
――/ 7
(
――7 8

objAddress
――8 B
)
――B C
;
――C D
await
±± !
_unitOfWork
±±" -
.
±±- .
SaveChangesAsync
±±. >
(
±±> ?
)
±±? @
;
±±@ A
}
³³ 
}
΄΄ 
if
µµ 
(
µµ 
allAddressId
µµ #
!=
µµ$ &
null
µµ' +
&&
µµ, .
allAddressId
µµ/ ;
.
µµ; <
Count
µµ< A
>
µµB C
$num
µµD E
)
µµE F
{
¶¶ 
foreach
·· 
(
··  
var
··! $
addId
··% *
in
··+ -
allAddressId
··. :
)
··: ;
{
ΈΈ 
var
ΉΉ 
	entityAdd
ΉΉ  )
=
ΉΉ* + 
_repositoryAddress
ΉΉ, >
.
ΉΉ> ?
Get
ΉΉ? B
(
ΉΉB C
x
ΉΉC D
=>
ΉΉE G
x
ΉΉH I
.
ΉΉI J
Id
ΉΉJ L
==
ΉΉM O
addId
ΉΉP U
)
ΉΉU V
;
ΉΉV W
if
ΊΊ 
(
ΊΊ 
	entityAdd
ΊΊ (
!=
ΊΊ) +
null
ΊΊ, 0
)
ΊΊ0 1
{
»»  
_repositoryAddress
ΌΌ  2
.
ΌΌ2 3
Remove
ΌΌ3 9
(
ΌΌ9 :
	entityAdd
ΌΌ: C
)
ΌΌC D
;
ΌΌD E
}
½½ 
}
ΎΎ 
await
ΏΏ 
_unitOfWork
ΏΏ )
.
ΏΏ) *
SaveChangesAsync
ΏΏ* :
(
ΏΏ: ;
)
ΏΏ; <
;
ΏΏ< =
}
ΐΐ 
}
ΑΑ 
if
ΒΒ 
(
ΒΒ  
master_ClientModel
ΒΒ &
.
ΒΒ& '
Contacts
ΒΒ' /
.
ΒΒ/ 0
Count
ΒΒ0 5
>
ΒΒ6 7
$num
ΒΒ8 9
)
ΒΒ9 :
{
ΓΓ 
var
ΕΕ 
entityContacts
ΕΕ &
=
ΕΕ' ( 
_repositoryContact
ΕΕ) ;
.
ΕΕ; <
GetAll
ΕΕ< B
(
ΕΕB C
)
ΕΕC D
.
ΕΕD E
Where
ΕΕE J
(
ΕΕJ K
x
ΕΕK L
=>
ΕΕM O
x
ΕΕP Q
.
ΕΕQ R

TableKeyId
ΕΕR \
==
ΕΕ] _
	objClient
ΕΕ` i
.
ΕΕi j
Id
ΕΕj l
&&
ΕΕm o
x
ΕΕp q
.
ΕΕq r
	TableName
ΕΕr {
==
ΕΕ| ~
$strΕΕ 
&&ΕΕ ‘
(ΕΕ’ “
xΕΕ“ ”
.ΕΕ” •
	IsDeletedΕΕ• 
==ΕΕ ΅
falseΕΕΆ §
||ΕΕ¨ ª
xΕΕ« ¬
.ΕΕ¬ ­
	IsDeletedΕΕ­ ¶
==ΕΕ· Ή
nullΕΕΊ Ύ
)ΕΕΎ Ώ
)ΕΕΏ ΐ
.ΕΕΐ Α
ToListΕΕΑ Η
(ΕΕΗ Θ
)ΕΕΘ Ι
;ΕΕΙ Κ
var
ΖΖ 
allContactId
ΖΖ $
=
ΖΖ% &
entityContacts
ΖΖ' 5
.
ΖΖ5 6
Count
ΖΖ6 ;
>
ΖΖ< =
$num
ΖΖ> ?
?
ΖΖ@ A
entityContacts
ΖΖB P
.
ΖΖP Q
Select
ΖΖQ W
(
ΖΖW X
x
ΖΖX Y
=>
ΖΖZ \
x
ΖΖ] ^
.
ΖΖ^ _
Id
ΖΖ_ a
)
ΖΖa b
.
ΖΖb c
OrderBy
ΖΖc j
(
ΖΖj k
Id
ΖΖk m
=>
ΖΖn p
Id
ΖΖq s
)
ΖΖs t
.
ΖΖt u
ToList
ΖΖu {
(
ΖΖ{ |
)
ΖΖ| }
:
ΖΖ~ 
nullΖΖ€ „
;ΖΖ„ …
foreach
ΘΘ 
(
ΘΘ 
var
ΘΘ  
contact
ΘΘ! (
in
ΘΘ) + 
master_ClientModel
ΘΘ, >
.
ΘΘ> ?
Contacts
ΘΘ? G
)
ΘΘG H
{
ΙΙ 
if
ΚΚ 
(
ΚΚ 
contact
ΚΚ #
.
ΚΚ# $
Id
ΚΚ$ &
>
ΚΚ' (
$num
ΚΚ) *
)
ΚΚ* +
{
ΛΛ 
if
ΜΜ 
(
ΜΜ  
allContactId
ΜΜ  ,
!=
ΜΜ- /
null
ΜΜ0 4
&&
ΜΜ5 7
allContactId
ΜΜ8 D
.
ΜΜD E
Count
ΜΜE J
>
ΜΜK L
$num
ΜΜM N
)
ΜΜN O
{
ΝΝ 
allContactId
ΞΞ  ,
.
ΞΞ, -
Remove
ΞΞ- 3
(
ΞΞ3 4
contact
ΞΞ4 ;
.
ΞΞ; <
Id
ΞΞ< >
)
ΞΞ> ?
;
ΞΞ? @
}
ΟΟ 
var
ΠΠ 
	OldEntity
ΠΠ  )
=
ΠΠ* + 
_repositoryContact
ΠΠ, >
.
ΠΠ> ?
GetNoTracking
ΠΠ? L
(
ΠΠL M
contact
ΠΠM T
.
ΠΠT U
Id
ΠΠU W
)
ΠΠW X
;
ΠΠX Y

objContact
ÒÒ &
=
ÒÒ' ( 
_repositoryContact
ÒÒ) ;
.
ÒÒ; <
Get
ÒÒ< ?
(
ÒÒ? @
contact
ÒÒ@ G
.
ÒÒG H
Id
ÒÒH J
)
ÒÒJ K
;
ÒÒK L
if
ΣΣ 
(
ΣΣ  

objContact
ΣΣ  *
!=
ΣΣ+ -
null
ΣΣ. 2
)
ΣΣ2 3
{
ΤΤ 
var
ΥΥ  #
entityAddress
ΥΥ$ 1
=
ΥΥ2 3
_mapperFactory
ΥΥ4 B
.
ΥΥB C
Get
ΥΥC F
<
ΥΥF G 
MasterContactModel
ΥΥG Y
,
ΥΥY Z
MasterContact
ΥΥ[ h
>
ΥΥh i
(
ΥΥi j
contact
ΥΥj q
)
ΥΥq r
;
ΥΥr s

objContact
ΧΧ  *
.
ΧΧ* +
ContactPersonName
ΧΧ+ <
=
ΧΧ= >
entityAddress
ΧΧ? L
.
ΧΧL M
ContactPersonName
ΧΧM ^
;
ΧΧ^ _

objContact
ΨΨ  *
.
ΨΨ* +
DepartmentId
ΨΨ+ 7
=
ΨΨ8 9
entityAddress
ΨΨ: G
.
ΨΨG H
DepartmentId
ΨΨH T
;
ΨΨT U

objContact
ΩΩ  *
.
ΩΩ* +
DesignationId
ΩΩ+ 8
=
ΩΩ9 :
entityAddress
ΩΩ; H
.
ΩΩH I
DesignationId
ΩΩI V
;
ΩΩV W

objContact
ΪΪ  *
.
ΪΪ* +
Email
ΪΪ+ 0
=
ΪΪ1 2
entityAddress
ΪΪ3 @
.
ΪΪ@ A
Email
ΪΪA F
;
ΪΪF G

objContact
ΫΫ  *
.
ΫΫ* +
Mobile
ΫΫ+ 1
=
ΫΫ2 3
entityAddress
ΫΫ4 A
.
ΫΫA B
Mobile
ΫΫB H
;
ΫΫH I

objContact
άά  *
.
άά* +
	MobileExt
άά+ 4
=
άά5 6
entityAddress
άά7 D
.
άάD E
	MobileExt
άάE N
;
άάN O

objContact
ήή  *
.
ήή* +

ModifiedBy
ήή+ 5
=
ήή6 7 
master_ClientModel
ήή8 J
.
ήήJ K

ModifiedBy
ήήK U
;
ήήU V 
_repositoryContact
ίί  2
.
ίί2 3
UpdateAsync
ίί3 >
(
ίί> ?

objContact
ίί? I
)
ίίI J
;
ίίJ K
await
αα  %
_unitOfWork
αα& 1
.
αα1 2
SaveChangesAsync
αα2 B
(
ααB C
)
ααC D
;
ααD E
await
δδ  %
_auditLogService
δδ& 6
.
δδ6 7
CreateAuditLog
δδ7 E
<
δδE F
MasterContact
δδF S
>
δδS T
(
δδT U!
AuditActionTypeEnum
δδU h
.
δδh i
Update
δδi o
,
δδo p
	OldEntity
δδq z
,
δδz {

objContactδδ| †
,δδ† ‡
MainTableNameδδ •
,δδ• –
MainTableKeyδδ— £
)δδ£ ¤
;δδ¤ ¥
}
εε 
}
ζζ 
else
ηη 
{
θθ 

objContact
κκ &
=
κκ' (
_mapperFactory
κκ) 7
.
κκ7 8
Get
κκ8 ;
<
κκ; < 
MasterContactModel
κκ< N
,
κκN O
MasterContact
κκP ]
>
κκ] ^
(
κκ^ _
contact
κκ_ f
)
κκf g
;
κκg h

objContact
λλ &
.
λλ& '
CreatedDate
λλ' 2
=
λλ3 4
AppConstants
λλ5 A
.
λλA B
DateTime
λλB J
;
λλJ K

objContact
μμ &
.
μμ& '

TableKeyId
μμ' 1
=
μμ2 3
	objClient
μμ4 =
.
μμ= >
Id
μμ> @
;
μμ@ A

objContact
νν &
.
νν& '
	TableName
νν' 0
=
νν1 2
Enum
νν3 7
.
νν7 8
GetName
νν8 ?
(
νν? @
TableNameEnum
νν@ M
.
ννM N
Master_Client
ννN [
)
νν[ \
;
νν\ ]

objContact
ξξ &
.
ξξ& '

ModifiedBy
ξξ' 1
=
ξξ2 3 
master_ClientModel
ξξ4 F
.
ξξF G
	CreatedBy
ξξG P
;
ξξP Q

objContact
οο &
.
οο& '
Status
οο' -
=
οο. /
$num
οο0 1
;
οο1 2 
_repositoryContact
ππ .
.
ππ. /
AddAsync
ππ/ 7
(
ππ7 8

objContact
ππ8 B
)
ππB C
;
ππC D
await
ςς !
_unitOfWork
ςς" -
.
ςς- .
SaveChangesAsync
ςς. >
(
ςς> ?
)
ςς? @
;
ςς@ A
}
σσ 
}
ττ 
if
υυ 
(
υυ 
allContactId
υυ $
!=
υυ% '
null
υυ( ,
&&
υυ- /
allContactId
υυ0 <
.
υυ< =
Count
υυ= B
>
υυC D
$num
υυE F
)
υυF G
{
φφ 
foreach
χχ 
(
χχ  !
var
χχ! $
addId
χχ% *
in
χχ+ -
allContactId
χχ. :
)
χχ: ;
{
ψψ 
var
ωω 
	entityAdd
ωω  )
=
ωω* + 
_repositoryContact
ωω, >
.
ωω> ?
Get
ωω? B
(
ωωB C
x
ωωC D
=>
ωωE G
x
ωωH I
.
ωωI J
Id
ωωJ L
==
ωωM O
addId
ωωP U
)
ωωU V
;
ωωV W
if
ϊϊ 
(
ϊϊ  
	entityAdd
ϊϊ  )
!=
ϊϊ* ,
null
ϊϊ- 1
)
ϊϊ1 2
{
ϋϋ  
_repositoryContact
όό  2
.
όό2 3
Remove
όό3 9
(
όό9 :
	entityAdd
όό: C
)
όόC D
;
όόD E
}
ύύ 
}
ώώ 
await
ÿÿ 
_unitOfWork
ÿÿ )
.
ÿÿ) *
SaveChangesAsync
ÿÿ* :
(
ÿÿ: ;
)
ÿÿ; <
;
ÿÿ< =
}
€€ 
}
 
await
ƒƒ  
_fileUploadService
ƒƒ (
.
ƒƒ( )
UploadFilesAsync
ƒƒ) 9
(
ƒƒ9 :
	objClient
ƒƒ: C
.
ƒƒC D
Id
ƒƒD F
,
ƒƒF G
Enum
ƒƒH L
.
ƒƒL M
GetName
ƒƒM T
(
ƒƒT U
TableNameEnum
ƒƒU b
.
ƒƒb c
Master_Client
ƒƒc p
)
ƒƒp q
,
ƒƒq r!
master_ClientModelƒƒs …
.ƒƒ… †
uploadDocumentƒƒ† ”
,ƒƒ” •
	objClientƒƒ– 
.ƒƒ  
	CreatedByƒƒ  ©
)ƒƒ© ª
;ƒƒª «
try
–– 
{
—— 
await
™™ 
_unitOfWork
™™ %
.
™™% &
SaveChangesAsync
™™& 6
(
™™6 7
)
™™7 8
;
™™8 9
}
 
catch
›› 
(
›› 
	Exception
››  
ex
››! #
)
››# $
{
 
throw
 
ex
 
;
 
}
 
}
 
return
΅΅ 
DBOperation
΅΅ 
.
΅΅ 
Success
΅΅ &
;
΅΅& '
}
ΆΆ 	
public
§§ 
async
§§ 
Task
§§ 
<
§§ 
DBOperation
§§ %
>
§§% &
DeleteClient
§§' 3
(
§§3 4
int
§§4 7
id
§§8 :
,
§§: ;
int
§§< ?
?
§§? @
by
§§A C
)
§§C D
{
¨¨ 	
try
©© 
{
ªª 
var
«« 
old
«« 
=
«« 
_repository
«« %
.
««% &
GetNoTracking
««& 3
(
««3 4
id
««4 6
)
««6 7
;
««7 8
DbParameter
­­ 
[
­­ 
]
­­ 
prm
­­ !
=
­­" #
{
®® 
new
―― 
DbParameter
―― 
(
―― 
$str
―― &
,
――& '
id
――( *
,
――* +
	SqlDbType
――, 5
.
――5 6
Int
――6 9
)
――9 :
,
――: ;
new
°° 
DbParameter
°° 
(
°° 
$str
°°  
,
°°  !
by
°°( *
,
°°* +
	SqlDbType
°°, 5
.
°°5 6
Int
°°6 9
)
°°9 :
}
±± 	
;
±±	 

EltizamDBHelper
³³ 
.
³³  
ExecuteNonQuery
³³  /
(
³³/ 0 
ProcedureMetastore
³³0 B
.
³³B C
usp_Client_Delete
³³C T
,
³³T U 
DatabaseConnection
³³V h
.
³³h i

ConnString
³³i s
,
³³s t
System
³³u {
.
³³{ |
Data³³| €
.³³€ 
CommandType³³ 
.³³ 
StoredProcedure³³ 
,³³ 
prm³³ ΅
)³³΅ Ά
;³³Ά £
var
µµ 
newP
µµ 
=
µµ 
_repository
µµ &
.
µµ& '
Get2
µµ' +
(
µµ+ ,
id
µµ, .
)
µµ. /
;
µµ/ 0
await
ΈΈ 
_auditLogService
ΈΈ &
.
ΈΈ& '
CreateAuditLog
ΈΈ' 5
<
ΈΈ5 6
MasterClient
ΈΈ6 B
>
ΈΈB C
(
ΈΈC D!
AuditActionTypeEnum
ΈΈD W
.
ΈΈW X
Update
ΈΈX ^
,
ΈΈ^ _
old
ΈΈ` c
,
ΈΈc d
newP
ΈΈe i
,
ΈΈi j
Enum
ΈΈk o
.
ΈΈo p
GetName
ΈΈp w
(
ΈΈw x
TableNameEnumΈΈx …
.ΈΈ… †
Master_ClientΈΈ† “
)ΈΈ“ ”
,ΈΈ” •
idΈΈ– 
)ΈΈ ™
;ΈΈ™ 
return
»» 
DBOperation
»» "
.
»»" #
Success
»»# *
;
»»* +
}
ΌΌ 
catch
½½ 
(
½½ 
	Exception
½½ 
ex
½½ 
)
½½  
{
ΎΎ 
throw
ΏΏ 
ex
ΏΏ 
;
ΏΏ 
}
ΐΐ 
}
ΑΑ 	
public
ΓΓ 
async
ΓΓ 
Task
ΓΓ 
<
ΓΓ 
List
ΓΓ 
<
ΓΓ 
MasterClientModel
ΓΓ 0
>
ΓΓ0 1
>
ΓΓ1 20
"GetMasterClientByClientTypeIdAsync
ΓΓ3 U
(
ΓΓU V
int
ΓΓV Y
ClientTypeId
ΓΓZ f
)
ΓΓf g
{
ΔΔ 	
var
ΖΖ 
_Clients
ΖΖ 
=
ΖΖ 
new
ΖΖ 
List
ΖΖ #
<
ΖΖ# $
MasterClientModel
ΖΖ$ 5
>
ΖΖ5 6
(
ΖΖ6 7
)
ΖΖ7 8
;
ΖΖ8 9
var
ΙΙ 
res
ΙΙ 
=
ΙΙ 
_repository
ΙΙ !
.
ΙΙ! "
GetAllAsync
ΙΙ" -
(
ΙΙ- .
x
ΙΙ. /
=>
ΙΙ0 2
(
ΙΙ3 4
x
ΙΙ4 5
.
ΙΙ5 6
ClientTypeId
ΙΙ6 B
==
ΙΙC E
ClientTypeId
ΙΙF R
||
ΙΙS U
ClientTypeId
ΙΙV b
==
ΙΙc e
$num
ΙΙf g
)
ΙΙg h
&&
ΙΙi k
x
ΙΙl m
.
ΙΙm n
IsActive
ΙΙn v
==
ΙΙw y
true
ΙΙz ~
)
ΙΙ~ 
.ΙΙ €
ResultΙΙ€ †
.ΙΙ† ‡
ToListΙΙ‡ 
(ΙΙ 
)ΙΙ 
;ΙΙ 
_Clients
ΛΛ 
=
ΛΛ 
_mapperFactory
ΛΛ %
.
ΛΛ% &
GetList
ΛΛ& -
<
ΛΛ- .
MasterClient
ΛΛ. :
,
ΛΛ: ;
MasterClientModel
ΛΛ< M
>
ΛΛM N
(
ΛΛN O
res
ΛΛO R
)
ΛΛR S
;
ΛΛS T
return
ΞΞ 
_Clients
ΞΞ 
;
ΞΞ 
}
ΟΟ 	
public
ΡΡ 
async
ΡΡ 
Task
ΡΡ 
<
ΡΡ 
DBOperation
ΡΡ %
>
ΡΡ% &
DeleteDocument
ΡΡ' 5
(
ΡΡ5 6
int
ΡΡ6 9
id
ΡΡ: <
,
ΡΡ< =
int
ΡΡ= @
?
ΡΡ@ A
by
ΡΡB D
)
ΡΡD E
{
ÒÒ 	
if
ΣΣ 
(
ΣΣ 
id
ΣΣ 
>
ΣΣ 
$num
ΣΣ 
)
ΣΣ 
{
ΤΤ 
var
ΦΦ 
	entityDoc
ΦΦ 
=
ΦΦ !
_repositoryDocument
ΦΦ  3
.
ΦΦ3 4
Get
ΦΦ4 7
(
ΦΦ7 8
id
ΦΦ8 :
)
ΦΦ: ;
;
ΦΦ; <
if
ΧΧ 
(
ΧΧ 
	entityDoc
ΧΧ 
!=
ΧΧ  
null
ΧΧ! %
)
ΧΧ% &
{
ΨΨ !
_repositoryDocument
ΩΩ '
.
ΩΩ' (
Remove
ΩΩ( .
(
ΩΩ. /
	entityDoc
ΩΩ/ 8
)
ΩΩ8 9
;
ΩΩ9 :
await
ΪΪ 
_unitOfWork
ΪΪ %
.
ΪΪ% &
SaveChangesAsync
ΪΪ& 6
(
ΪΪ6 7
)
ΪΪ7 8
;
ΪΪ8 9
}
ΫΫ 
}
άά 
return
ήή 
DBOperation
ήή 
.
ήή 
Success
ήή &
;
ήή& '
}
ίί 	
}
ββ 
}γγ ¶G
ND:\EltizamLive\Eltizam.Business.Core\Implementation\MasterClientTypeService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
Implementation  .
{ 
public 

class #
MasterClientTypeService (
:( )$
IMasterClientTypeService* B
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IMapperFactory '
_mapperFactory( 6
;6 7
private 
readonly 
	Microsoft "
." #

Extensions# -
.- .
Configuration. ;
.; <
IConfiguration< J
configurationK X
;X Y
private 
IRepository 
< 
MasterClientType ,
>, -
_repository. 9
{: ;
get< ?
;? @
setA D
;D E
}F G
private 
readonly 
IHelper  
_helper! (
;( )
public"" #
MasterClientTypeService"" &
(""& '
IUnitOfWork""' 2

unitOfWork""3 =
,""= >
IMapperFactory""? M
mapperFactory""N [
,""[ \
IHelper##
 
helper## 
,## 
	Microsoft$$ 
.$$ 

Extensions$$ 
.$$  
Configuration$$  -
.$$- .
IConfiguration$$. <
_configuration$$= K
)$$K L
{%% 	
_unitOfWork&& 
=&& 

unitOfWork&& $
;&&$ %
_mapperFactory'' 
='' 
mapperFactory'' *
;''* +
_repository)) 
=)) 
_unitOfWork)) %
.))% &
GetRepository))& 3
<))3 4
MasterClientType))4 D
>))D E
())E F
)))F G
;))G H
configuration** 
=** 
_configuration** *
;*** +
_helper++ 
=++ 
helper++ 
;++ 
},, 	
public@@ 
async@@ 
Task@@ 
<@@ "
Master_ClientTypeModel@@ 0
>@@0 1(
GetMasterClientTypeByIdAsync@@2 N
(@@N O
int@@O R
id@@S U
)@@U V
{AA 	
varCC 
_clientEntityCC 
=CC 
newCC  #"
Master_ClientTypeModelCC$ :
(CC: ;
)CC; <
;CC< =
_clientEntityFF 
=FF 
_mapperFactoryFF *
.FF* +
GetFF+ .
<FF. /
MasterClientTypeFF/ ?
,FF? @"
Master_ClientTypeModelFFA W
>FFW X
(FFX Y
awaitFFY ^
_repositoryFF_ j
.FFj k
GetAsyncFFk s
(FFs t
idFFt v
)FFv w
)FFw x
;FFx y
returnII 
_clientEntityII  
;II  !
}JJ 	
publicMM 
asyncMM 
TaskMM 
<MM 
ListMM 
<MM "
Master_ClientTypeModelMM 5
>MM5 6
>MM6 7
GetAllMM8 >
(MM> ?
)MM? @
{NN 	
returnOO 
_mapperFactoryOO !
.OO! "
GetListOO" )
<OO) *
MasterClientTypeOO* :
,OO: ;"
Master_ClientTypeModelOO< R
>OOR S
(OOS T
awaitOOT Y
_repositoryOOZ e
.OOe f
GetAllAsyncOOf q
(OOq r
)OOr s
)OOs t
;OOt u
}PP 	
publicRR 
asyncRR 
TaskRR 
<RR 
DBOperationRR %
>RR% &%
AddUpdateMasterClientTypeRR' @
(RR@ A"
Master_ClientTypeModelRRA W
entityqualificationRRX k
)RRk l
{SS 	
MasterClientTypeUU 
objUserUU $
;UU$ %
ifXX 
(XX 
entityqualificationXX #
.XX# $
IdXX$ &
>XX' (
$numXX) *
)XX* +
{YY 
objUser[[ 
=[[ 
_repository[[ %
.[[% &
Get[[& )
([[) *
entityqualification[[* =
.[[= >
Id[[> @
)[[@ A
;[[A B
if^^ 
(^^ 
objUser^^ 
!=^^ 
null^^ #
)^^# $
{__ 
objUser`` 
.`` 

ClientType`` &
=``' (
entityqualification``) <
.``< =

ClientType``= G
;``G H
objUseraa 
.aa 
IsActiveaa $
=aa% &
entityqualificationaa' :
.aa: ;
IsActiveaa; C
;aaC D
objUsercc 
.cc 

ModifiedBycc &
=cc' (
entityqualificationcc) <
.cc< =
	CreatedBycc= F
;ccF G
objUserdd 
.dd 
ModifiedDatedd (
=dd) *
AppConstantsdd+ 7
.dd7 8
DateTimedd8 @
;dd@ A
_repositorygg 
.gg  
UpdateAsyncgg  +
(gg+ ,
objUsergg, 3
)gg3 4
;gg4 5
}hh 
elseii 
{jj 
returnll 
DBOperationll &
.ll& '
NotFoundll' /
;ll/ 0
}mm 
}nn 
elseoo 
{pp 
objUserrr 
=rr 
_mapperFactoryrr (
.rr( )
Getrr) ,
<rr, -"
Master_ClientTypeModelrr- C
,rrC D
MasterClientTyperrE U
>rrU V
(rrV W
entityqualificationrrW j
)rrj k
;rrk l
objUserss 
.ss 
CreatedDatess #
=ss$ %
AppConstantsss& 2
.ss2 3
DateTimess3 ;
;ss; <
objUsertt 
.tt 
	CreatedBytt !
=tt" #
entityqualificationtt$ 7
.tt7 8
	CreatedBytt8 A
;ttA B
objUseruu 
.uu 
ModifiedDateuu $
=uu% &
AppConstantsuu' 3
.uu3 4
DateTimeuu4 <
;uu< =
objUservv 
.vv 

ModifiedByvv "
=vv# $
entityqualificationvv% 8
.vv8 9
	CreatedByvv9 B
;vvB C
_repositoryxx 
.xx 
AddAsyncxx $
(xx$ %
objUserxx% ,
)xx, -
;xx- .
}yy 
await|| 
_unitOfWork|| 
.|| 
SaveChangesAsync|| .
(||. /
)||/ 0
;||0 1
if 
( 
objUser 
. 
Id 
== 
$num 
)  
return
€€ 
DBOperation
€€ "
.
€€" #
Error
€€# (
;
€€( )
return
‚‚ 
DBOperation
‚‚ 
.
‚‚ 
Success
‚‚ &
;
‚‚& '
}
ƒƒ 	
public
…… 
async
…… 
Task
…… 
<
…… 
DBOperation
…… %
>
……% &
DeleteClientType
……' 7
(
……7 8
int
……8 ;
id
……< >
)
……> ?
{
†† 	
var
 
entityClientType
  
=
! "
_repository
# .
.
. /
Get
/ 2
(
2 3
x
3 4
=>
5 7
x
8 9
.
9 :
Id
: <
==
= ?
id
@ B
)
B C
;
C D
if
‹‹ 
(
‹‹ 
entityClientType
‹‹  
==
‹‹! #
null
‹‹$ (
)
‹‹( )
return
 
DBOperation
 "
.
" #
NotFound
# +
;
+ ,
_repository
 
.
 
Remove
 
(
 
entityClientType
 /
)
/ 0
;
0 1
await
’’ 
_unitOfWork
’’ 
.
’’ 
SaveChangesAsync
’’ .
(
’’. /
)
’’/ 0
;
’’0 1
return
•• 
DBOperation
•• 
.
•• 
Success
•• &
;
••& '
}
–– 	
public
 
async
 
Task
 
<
 
List
 
<
 $
Master_ClientTypeModel
 5
>
5 6
>
6 7
GetClientTypeList
8 I
(
I J
)
J K
{
™™ 	
var
›› 
lstStf
›› 
=
›› 
EltizamDBHelper
›› (
.
››( )!
ExecuteMappedReader
››) <
<
››< =$
Master_ClientTypeModel
››= S
>
››S T
(
››T U 
ProcedureMetastore
››U g
.
››g h$
usp_ClientType_AllList
››h ~
,
››~  
DatabaseConnection
 
.
  

ConnString
  *
,
* +
CommandType
, 7
.
7 8
StoredProcedure
8 G
,
G H
null
I M
)
M N
;
N O
return
 
lstStf
 
;
 
}
 	
}
ΆΆ 
}££ ΝY
KD:\EltizamLive\Eltizam.Business.Core\Implementation\MasterCountryService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
Implementation  .
{ 
public 

class  
MasterCountryService %
:& '!
IMasterCountryService( =
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IMapperFactory '
_mapperFactory( 6
;6 7
private 
readonly 
	Microsoft "
." #

Extensions# -
.- .
Configuration. ;
.; <
IConfiguration< J
configurationK X
;X Y
private 
readonly 
string 
_dbConnection  -
;- .
private 
IRepository 
< 
MasterCountry )
>) *
_repository+ 6
{7 8
get9 <
;< =
set> A
;A B
}C D
private 
readonly 
IHelper  
_helper! (
;( )
public  
MasterCountryService #
(# $
IUnitOfWork$ /

unitOfWork0 :
,: ;
IMapperFactory< J
mapperFactoryK X
,X Y
IHelper" )
helper* 0
,0 1
	Microsoft  ! *
.  * +

Extensions  + 5
.  5 6
Configuration  6 C
.  C D
IConfiguration  D R
_configuration  S a
)  a b
{!! 	
_unitOfWork"" 
="" 

unitOfWork"" $
;""$ %
_mapperFactory## 
=## 
mapperFactory## *
;##* +
_repository%% 
=%% 
_unitOfWork%% %
.%%% &
GetRepository%%& 3
<%%3 4
MasterCountry%%4 A
>%%A B
(%%B C
)%%C D
;%%D E
configuration&& 
=&& 
_configuration&& *
;&&* +
_helper'' 
='' 
helper'' 
;'' 
_dbConnection(( 
=(( 
DatabaseConnection(( .
.((. /

ConnString((/ 9
;((9 :
})) 	
public,, 
async,, 
Task,, 
<,, "
DataTableResponseModel,, 0
>,,0 1
GetAll,,2 8
(,,8 9"
DataTableAjaxPostModel,,9 O
model,,P U
),,U V
{-- 	
var.. 
	_dbParams.. 
=.. 
new.. 
[..  
]..  !
{// 
new00 
DbParameter00  
(00  !
$str00! ,
,00, -
$num00. /
,00/ 0
	SqlDbType000 9
.009 :
Int00: =
)00= >
,00> ?
new11 
DbParameter11  
(11  !
$str11! +
,11+ ,
model11- 2
.112 3
length113 9
,119 :
	SqlDbType11; D
.11D E
Int11E H
)11H I
,11I J
new22 
DbParameter22  
(22  !
$str22! -
,22- .
model22/ 4
.224 5
start225 :
,22: ;
	SqlDbType22< E
.22E F
Int22F I
)22I J
,22J K
new33 
DbParameter33  
(33  !
$str33! .
,33. /
$str330 =
,33= >
	SqlDbType33? H
.33H I
VarChar33I P
)33P Q
,33Q R
new44 
DbParameter44  
(44  !
$str44! .
,44. /
$num440 1
,441 2
	SqlDbType443 <
.44< =
Int44= @
)44@ A
}55 
;55 
int77 
_count77 
=77 
$num77 
;77 
var88 
lstStf88 
=88 
EltizamDBHelper88 (
.88( )2
&ExecuteMappedReaderWithOutputParameter88) O
<88O P
MasterCountryModel88P b
>88b c
(88c d
ProcedureMetastore88d v
.88v w&
usp_Country_SearchAllList	88w 
,
88 ‘
_dbConnection:: 
,:: 
out:: 
_count::  &
,::& '
CommandType::( 3
.::3 4
StoredProcedure::4 C
,::C D
	_dbParams::E N
)::N O
;::O P"
DataTableResponseModel== "#
oDataTableResponseModel==# :
===; <
new=== @"
DataTableResponseModel==A W
(==W X
model==X ]
.==] ^
draw==^ b
,==b c
_count==d j
,==j k
$num==l m
,==m n
lstStf==o u
)==u v
;==v w
return?? #
oDataTableResponseModel?? *
;??* +
}@@ 	
publicAA 
asyncAA 
TaskAA 
<AA 
MasterCountryModelAA ,
>AA, -
GetByIdAA. 5
(AA5 6
intAA6 9
idAA: <
)AA< =
{BB 	
varCC 
_CountryEntityCC 
=CC  
newCC! $
MasterCountryModelCC% 7
(CC7 8
)CC8 9
;CC9 :
_CountryEntityDD 
=DD 
_mapperFactoryDD +
.DD+ ,
GetDD, /
<DD/ 0
MasterCountryDD0 =
,DD= >
MasterCountryModelDD? Q
>DDQ R
(DDR S
awaitDDS X
_repositoryDDY d
.DDd e
GetAsyncDDe m
(DDm n
idDDn p
)DDp q
)DDq r
;DDr s
returnFF 
_CountryEntityFF !
;FF! "
}GG 	
publicHH 
asyncHH 
TaskHH 
<HH 
DBOperationHH %
>HH% &
UpsertHH' -
(HH- .
MasterCountryModelHH. @
entityCountryHHA N
)HHN O
{II 	
MasterCountryKK 

objCountryKK $
;KK$ %
ifMM 
(MM 
entityCountryMM 
.MM 
IdMM  
>MM! "
$numMM# $
)MM$ %
{NN 

objCountryOO 
=OO 
_repositoryOO (
.OO( )
GetOO) ,
(OO, -
entityCountryOO- :
.OO: ;
IdOO; =
)OO= >
;OO> ?
varPP 
OldObjCountryPP !
=PP" #

objCountryPP$ .
;PP. /
ifQQ 
(QQ 

objCountryQQ 
!=QQ !
nullQQ" &
)QQ& '
{RR 

objCountrySS 
.SS 
CountryNameSS *
=SS+ ,
entityCountrySS- :
.SS: ;
CountryNameSS; F
;SSF G

objCountryTT 
.TT 
CountryCodeTT *
=TT+ ,
entityCountryTT- :
.TT: ;
CountryCodeTT; F
;TTF G

objCountryUU 
.UU 
IsdcountryCodeUU -
=UU. /
entityCountryUU0 =
.UU= >
ISDCountryCodeUU> L
;UUL M

objCountryVV 
.VV 
IsActiveVV '
=VV( )
entityCountryVV* 7
.VV7 8
IsActiveVV8 @
;VV@ A

objCountryWW 
.WW 
ModifiedDateWW +
=WW, -
AppConstantsWW. :
.WW: ;
DateTimeWW; C
;WWC D

objCountryXX 
.XX 

ModifiedByXX )
=XX* +
entityCountryXX, 9
.XX9 :
	CreatedByXX: C
;XXC D
_repositoryYY 
.YY  
UpdateAsyncYY  +
(YY+ ,

objCountryYY, 6
)YY6 7
;YY7 8
}ZZ 
else[[ 
{\\ 
return]] 
DBOperation]] &
.]]& '
NotFound]]' /
;]]/ 0
}^^ 
}__ 
else`` 
{aa 

objCountrybb 
=bb 
_mapperFactorybb +
.bb+ ,
Getbb, /
<bb/ 0
MasterCountryModelbb0 B
,bbB C
MasterCountrybbD Q
>bbQ R
(bbR S
entityCountrybbS `
)bb` a
;bba b

objCountrycc 
.cc 
CreatedDatecc &
=cc' (
AppConstantscc) 5
.cc5 6
DateTimecc6 >
;cc> ?

objCountrydd 
.dd 
	CreatedBydd $
=dd% &
entityCountrydd' 4
.dd4 5
	CreatedBydd5 >
;dd> ?

objCountryee 
.ee 
ModifiedDateee '
=ee( )
AppConstantsee* 6
.ee6 7
DateTimeee7 ?
;ee? @

objCountryff 
.ff 

ModifiedByff %
=ff& '
entityCountryff( 5
.ff5 6
	CreatedByff6 ?
;ff? @
_repositorygg 
.gg 
AddAsyncgg $
(gg$ %

objCountrygg% /
)gg/ 0
;gg0 1
}hh 
awaitii 
_unitOfWorkii 
.ii 
SaveChangesAsyncii .
(ii. /
)ii/ 0
;ii0 1
ifjj 
(jj 

objCountryjj 
.jj 
Idjj 
==jj  
$numjj! "
)jj" #
returnkk 
DBOperationkk "
.kk" #
Errorkk# (
;kk( )
returnmm 
DBOperationmm 
.mm 
Successmm &
;mm& '
}nn 	
publicpp 
asyncpp 
Taskpp 
<pp 
DBOperationpp %
>pp% &
Deletepp' -
(pp- .
intpp. 1
idpp2 4
)pp4 5
{qq 	
varrr 
entityCountryrr 
=rr 
_repositoryrr  +
.rr+ ,
Getrr, /
(rr/ 0
xrr0 1
=>rr2 4
xrr5 6
.rr6 7
Idrr7 9
==rr: <
idrr= ?
)rr? @
;rr@ A
iftt 
(tt 
entityCountrytt 
==tt  
nulltt! %
)tt% &
returnuu 
DBOperationuu "
.uu" #
NotFounduu# +
;uu+ ,
_repositoryww 
.ww 
Removeww 
(ww 
entityCountryww ,
)ww, -
;ww- .
awaityy 
_unitOfWorkyy 
.yy 
SaveChangesAsyncyy .
(yy. /
)yy/ 0
;yy0 1
return{{ 
DBOperation{{ 
.{{ 
Success{{ &
;{{& '
}|| 	
public~~ 
async~~ 
Task~~ 
<~~ 
List~~ 
<~~ 
MasterCountryModel~~ 1
>~~1 2
>~~2 3
GetCountryList~~4 B
(~~B C
)~~C D
{ 	
var
 
lstStf
 
=
 
EltizamDBHelper
 (
.
( )!
ExecuteMappedReader
) <
<
< = 
MasterCountryModel
= O
>
O P
(
P Q 
ProcedureMetastore
Q c
.
c d!
usp_Country_AllList
d w
,
w x 
DatabaseConnection
‚‚ 
.
‚‚  

ConnString
‚‚  *
,
‚‚* +
CommandType
‚‚, 7
.
‚‚7 8
StoredProcedure
‚‚8 G
,
‚‚G H
null
‚‚I M
)
‚‚M N
;
‚‚N O
return
„„ 
lstStf
„„ 
;
„„ 
}
…… 	
}
‡‡ 
} «G
ND:\EltizamLive\Eltizam.Business.Core\Implementation\MasterDepartmentService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
Implementation  .
{ 
public 

class #
MasterDepartmentService (
:) *$
IMasterDepartmentService+ C
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IMapperFactory '
_mapperFactory( 6
;6 7
private 
readonly 
	Microsoft "
." #

Extensions# -
.- .
Configuration. ;
.; <
IConfiguration< J
configurationK X
;X Y
private 
IRepository 
< 
MasterDepartment ,
>, -
_repository. 9
{: ;
get< ?
;? @
setA D
;D E
}F G
private 
readonly 
IHelper  
_helper! (
;( )
public #
MasterDepartmentService &
(& '
IUnitOfWork' 2

unitOfWork3 =
,= >
IMapperFactory? M
mapperFactoryN [
,[ \
IHelper  " )
helper  * 0
,  0 1
	Microsoft!!! *
.!!* +

Extensions!!+ 5
.!!5 6
Configuration!!6 C
.!!C D
IConfiguration!!D R
_configuration!!S a
)!!a b
{"" 	
_unitOfWork## 
=## 

unitOfWork## $
;##$ %
_mapperFactory$$ 
=$$ 
mapperFactory$$ *
;$$* +
_repository&& 
=&& 
_unitOfWork&& %
.&&% &
GetRepository&&& 3
<&&3 4
MasterDepartment&&4 D
>&&D E
(&&E F
)&&F G
;&&G H
configuration'' 
='' 
_configuration'' *
;''* +
_helper(( 
=(( 
helper(( 
;(( 
})) 	
publicBB 
asyncBB 
TaskBB 
<BB 
ListBB 
<BB "
MasterDepartmentEntityBB 5
>BB5 6
>BB6 7
GetAllBB8 >
(BB> ?
)BB? @
{CC 	
returnDD 
_mapperFactoryDD !
.DD! "
GetListDD" )
<DD) *
MasterDepartmentDD* :
,DD: ;"
MasterDepartmentEntityDD< R
>DDR S
(DDS T
awaitDDT Y
_repositoryDDZ e
.DDe f
GetAllAsyncDDf q
(DDq r
)DDr s
)DDs t
;DDt u
}EE 	
publicFF 
asyncFF 
TaskFF 
<FF "
MasterDepartmentEntityFF 0
>FF0 1
GetByIdFF2 9
(FF9 :
intFF: =
idFF> @
)FF@ A
{GG 	
varHH 
_DepartmentEntityHH !
=HH" #
newHH$ '"
MasterDepartmentEntityHH( >
(HH> ?
)HH? @
;HH@ A
_DepartmentEntityII 
=II 
_mapperFactoryII  .
.II. /
GetII/ 2
<II2 3
MasterDepartmentII3 C
,IIC D"
MasterDepartmentEntityIIE [
>II[ \
(II\ ]
awaitII] b
_repositoryIIc n
.IIn o
GetAsyncIIo w
(IIw x
idIIx z
)IIz {
)II{ |
;II| }
returnKK 
_DepartmentEntityKK $
;KK$ %
}LL 	
publicMM 
asyncMM 
TaskMM 
<MM 
DBOperationMM %
>MM% &
UpsertMM' -
(MM- ."
MasterDepartmentEntityMM. D
entityDepartmentMME U
)MMU V
{NN 	
MasterDepartmentPP 
objDepartmentPP *
;PP* +
ifRR 
(RR 
entityDepartmentRR  
.RR  !
IdRR! #
>RR$ %
$numRR& '
)RR' (
{SS 
objDepartmentTT 
=TT 
_repositoryTT  +
.TT+ ,
GetTT, /
(TT/ 0
entityDepartmentTT0 @
.TT@ A
IdTTA C
)TTC D
;TTD E
varUU 
OldObjDepartmentUU $
=UU% &
objDepartmentUU' 4
;UU4 5
ifVV 
(VV 
objDepartmentVV !
!=VV" $
nullVV% )
)VV) *
{WW 
objDepartmentXX !
.XX! "

DepartmentXX" ,
=XX- .
entityDepartmentXX/ ?
.XX? @

DepartmentXX@ J
;XXJ K
objDepartmentYY !
.YY! "
IsActiveYY" *
=YY+ ,
entityDepartmentYY- =
.YY= >
IsActiveYY> F
;YYF G
objDepartmentZZ !
.ZZ! "
ModifiedDateZZ" .
=ZZ/ 0
AppConstantsZZ1 =
.ZZ= >
DateTimeZZ> F
;ZZF G
objDepartment[[ !
.[[! "

ModifiedBy[[" ,
=[[- .
entityDepartment[[/ ?
.[[? @
	CreatedBy[[@ I
;[[I J
_repository\\ 
.\\  
UpdateAsync\\  +
(\\+ ,
objDepartment\\, 9
)\\9 :
;\\: ;
}]] 
else^^ 
{__ 
return`` 
DBOperation`` &
.``& '
NotFound``' /
;``/ 0
}aa 
}bb 
elsecc 
{dd 
objDepartmentee 
=ee 
_mapperFactoryee  .
.ee. /
Getee/ 2
<ee2 3"
MasterDepartmentEntityee3 I
,eeI J
MasterDepartmenteeK [
>ee[ \
(ee\ ]
entityDepartmentee] m
)eem n
;een o
objDepartmentff 
.ff 
CreatedDateff )
=ff* +
AppConstantsff, 8
.ff8 9
DateTimeff9 A
;ffA B
objDepartmentgg 
.gg 
	CreatedBygg '
=gg( )
entityDepartmentgg* :
.gg: ;
	CreatedBygg; D
;ggD E
objDepartmenthh 
.hh 
ModifiedDatehh *
=hh+ ,
AppConstantshh- 9
.hh9 :
DateTimehh: B
;hhB C
objDepartmentii 
.ii 

ModifiedByii (
=ii) *
entityDepartmentii+ ;
.ii; <
	CreatedByii< E
;iiE F
_repositoryjj 
.jj 
AddAsyncjj $
(jj$ %
objDepartmentjj% 2
)jj2 3
;jj3 4
}kk 
awaitll 
_unitOfWorkll 
.ll 
SaveChangesAsyncll .
(ll. /
)ll/ 0
;ll0 1
ifmm 
(mm 
objDepartmentmm 
.mm 
Idmm  
==mm! #
$nummm$ %
)mm% &
returnnn 
DBOperationnn "
.nn" #
Errornn# (
;nn( )
returnpp 
DBOperationpp 
.pp 
Successpp &
;pp& '
}qq 	
publicss 
asyncss 
Taskss 
<ss 
DBOperationss %
>ss% &
Deletess' -
(ss- .
intss. 1
idss2 4
)ss4 5
{tt 	
varuu 
entityDepartmentuu  
=uu! "
_repositoryuu# .
.uu. /
Getuu/ 2
(uu2 3
xuu3 4
=>uu5 7
xuu8 9
.uu9 :
Iduu: <
==uu= ?
iduu@ B
)uuB C
;uuC D
ifww 
(ww 
entityDepartmentww  
==ww! #
nullww$ (
)ww( )
returnxx 
DBOperationxx "
.xx" #
NotFoundxx# +
;xx+ ,
_repositoryzz 
.zz 
Removezz 
(zz 
entityDepartmentzz /
)zz/ 0
;zz0 1
await|| 
_unitOfWork|| 
.|| 
SaveChangesAsync|| .
(||. /
)||/ 0
;||0 1
return~~ 
DBOperation~~ 
.~~ 
Success~~ &
;~~& '
} 	
public
€€ 
async
€€ 
Task
€€ 
<
€€ 
List
€€ 
<
€€ $
MasterDepartmentEntity
€€ 5
>
€€5 6
>
€€6 7
GetDepartmentList
€€8 I
(
€€I J
)
€€J K
{
 	
var
ƒƒ 
lstStf
ƒƒ 
=
ƒƒ 
EltizamDBHelper
ƒƒ (
.
ƒƒ( )!
ExecuteMappedReader
ƒƒ) <
<
ƒƒ< =$
MasterDepartmentEntity
ƒƒ= S
>
ƒƒS T
(
ƒƒT U 
ProcedureMetastore
ƒƒU g
.
ƒƒg h$
usp_Department_AllList
ƒƒh ~
,
ƒƒ~  
DatabaseConnection
„„ 
.
„„  

ConnString
„„  *
,
„„* +
CommandType
„„, 7
.
„„7 8
StoredProcedure
„„8 G
,
„„G H
null
„„I M
)
„„M N
;
„„N O
return
†† 
lstStf
†† 
;
†† 
}
‡‡ 	
}
 
}‰‰ H
OD:\EltizamLive\Eltizam.Business.Core\Implementation\MasterDesignationService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
Implementation  .
{ 
public 

class $
MasterDesignationService )
:* +%
IMasterDesignationService, E
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IMapperFactory '
_mapperFactory( 6
;6 7
private 
readonly 
	Microsoft "
." #

Extensions# -
.- .
Configuration. ;
.; <
IConfiguration< J
configurationK X
;X Y
private 
IRepository 
< 
MasterDesignation -
>- .
_repository/ :
{; <
get= @
;@ A
setB E
;E F
}G H
private 
readonly 
IHelper  
_helper! (
;( )
public   $
MasterDesignationService   '
(  ' (
IUnitOfWork  ( 3

unitOfWork  4 >
,  > ?
IMapperFactory  @ N
mapperFactory  O \
,  \ ]
IHelper!!" )
helper!!* 0
,!!0 1
	Microsoft""! *
.""* +

Extensions""+ 5
.""5 6
Configuration""6 C
.""C D
IConfiguration""D R
_configuration""S a
)""a b
{## 	
_unitOfWork$$ 
=$$ 

unitOfWork$$ $
;$$$ %
_mapperFactory%% 
=%% 
mapperFactory%% *
;%%* +
_repository'' 
='' 
_unitOfWork'' %
.''% &
GetRepository''& 3
<''3 4
MasterDesignation''4 E
>''E F
(''F G
)''G H
;''H I
configuration(( 
=(( 
_configuration(( *
;((* +
_helper)) 
=)) 
helper)) 
;)) 
}** 	
public,, 
async,, 
Task,, 
<,, 
List,, 
<,, #
MasterDesignationEntity,, 6
>,,6 7
>,,7 8
GetAll,,9 ?
(,,? @
),,@ A
{-- 	
return.. 
_mapperFactory.. !
...! "
GetList.." )
<..) *
MasterDesignation..* ;
,..; <#
MasterDesignationEntity..= T
>..T U
(..U V
await..V [
_repository..\ g
...g h
GetAllAsync..h s
(..s t
)..t u
)..u v
;..v w
}// 	
publicII 
asyncII 
TaskII 
<II #
MasterDesignationEntityII 1
>II1 2
GetByIdII3 :
(II: ;
intII; >
idII? A
)IIA B
{JJ 	
varKK 
_DesignationEntityKK "
=KK# $
newKK% (#
MasterDesignationEntityKK) @
(KK@ A
)KKA B
;KKB C
_DesignationEntityLL 
=LL  
_mapperFactoryLL! /
.LL/ 0
GetLL0 3
<LL3 4
MasterDesignationLL4 E
,LLE F#
MasterDesignationEntityLLG ^
>LL^ _
(LL_ `
awaitLL` e
_repositoryLLf q
.LLq r
GetAsyncLLr z
(LLz {
idLL{ }
)LL} ~
)LL~ 
;	LL €
returnNN 
_DesignationEntityNN %
;NN% &
}OO 	
publicRR 
asyncRR 
TaskRR 
<RR 
DBOperationRR %
>RR% &
UpsertRR' -
(RR- .#
MasterDesignationEntityRR. E
entityDesignationRRF W
)RRW X
{SS 	
MasterDesignationUU 
objDesignationUU ,
;UU, -
ifWW 
(WW 
entityDesignationWW !
.WW! "
IdWW" $
>WW% &
$numWW' (
)WW( )
{XX 
objDesignationYY 
=YY  
_repositoryYY! ,
.YY, -
GetYY- 0
(YY0 1
entityDesignationYY1 B
.YYB C
IdYYC E
)YYE F
;YYF G
varZZ 
OldObjDesignationZZ %
=ZZ& '
objDesignationZZ( 6
;ZZ6 7
if[[ 
([[ 
objDesignation[[ "
!=[[# %
null[[& *
)[[* +
{\\ 
objDesignation]] "
.]]" #
Designation]]# .
=]]/ 0
entityDesignation]]1 B
.]]B C
Designation]]C N
;]]N O
objDesignation^^ "
.^^" #
IsActive^^# +
=^^, -
entityDesignation^^. ?
.^^? @
IsActive^^@ H
;^^H I
objDesignation__ "
.__" #
ModifiedDate__# /
=__0 1
AppConstants__2 >
.__> ?
DateTime__? G
;__G H
objDesignation`` "
.``" #

ModifiedBy``# -
=``. /
entityDesignation``0 A
.``A B
	CreatedBy``B K
;``K L
_repositoryaa 
.aa  
UpdateAsyncaa  +
(aa+ ,
objDesignationaa, :
)aa: ;
;aa; <
}bb 
elsecc 
{dd 
returnee 
DBOperationee &
.ee& '
NotFoundee' /
;ee/ 0
}ff 
}gg 
elsehh 
{ii 
objDesignationjj 
=jj  
_mapperFactoryjj! /
.jj/ 0
Getjj0 3
<jj3 4#
MasterDesignationEntityjj4 K
,jjK L
MasterDesignationjjM ^
>jj^ _
(jj_ `
entityDesignationjj` q
)jjq r
;jjr s
objDesignationkk 
.kk 
CreatedDatekk *
=kk+ ,
AppConstantskk- 9
.kk9 :
DateTimekk: B
;kkB C
objDesignationll 
.ll 
	CreatedByll (
=ll) *
entityDesignationll+ <
.ll< =
	CreatedByll= F
;llF G
objDesignationmm 
.mm 
ModifiedDatemm +
=mm, -
AppConstantsmm. :
.mm: ;
DateTimemm; C
;mmC D
objDesignationnn 
.nn 

ModifiedBynn )
=nn* +
entityDesignationnn, =
.nn= >
	CreatedBynn> G
;nnG H
_repositoryoo 
.oo 
AddAsyncoo $
(oo$ %
objDesignationoo% 3
)oo3 4
;oo4 5
}pp 
awaitqq 
_unitOfWorkqq 
.qq 
SaveChangesAsyncqq .
(qq. /
)qq/ 0
;qq0 1
ifrr 
(rr 
objDesignationrr 
.rr 
Idrr !
==rr" $
$numrr% &
)rr& '
returnss 
DBOperationss "
.ss" #
Errorss# (
;ss( )
returnuu 
DBOperationuu 
.uu 
Successuu &
;uu& '
}vv 	
publicyy 
asyncyy 
Taskyy 
<yy 
DBOperationyy %
>yy% &
Deleteyy' -
(yy- .
intyy. 1
idyy2 4
)yy4 5
{zz 	
var{{ 
entityDesignation{{ !
={{" #
_repository{{$ /
.{{/ 0
Get{{0 3
({{3 4
x{{4 5
=>{{6 8
x{{9 :
.{{: ;
Id{{; =
=={{> @
id{{A C
){{C D
;{{D E
if}} 
(}} 
entityDesignation}} !
==}}" $
null}}% )
)}}) *
return~~ 
DBOperation~~ "
.~~" #
NotFound~~# +
;~~+ ,
_repository
€€ 
.
€€ 
Remove
€€ 
(
€€ 
entityDesignation
€€ 0
)
€€0 1
;
€€1 2
await
‚‚ 
_unitOfWork
‚‚ 
.
‚‚ 
SaveChangesAsync
‚‚ .
(
‚‚. /
)
‚‚/ 0
;
‚‚0 1
return
„„ 
DBOperation
„„ 
.
„„ 
Success
„„ &
;
„„& '
}
…… 	
public
‡‡ 
async
‡‡ 
Task
‡‡ 
<
‡‡ 
List
‡‡ 
<
‡‡ %
MasterDesignationEntity
‡‡ 6
>
‡‡6 7
>
‡‡7 8 
GetDesignationList
‡‡9 K
(
‡‡K L
)
‡‡L M
{
 	
var
 
lstStf
 
=
 
EltizamDBHelper
 (
.
( )!
ExecuteMappedReader
) <
<
< =%
MasterDesignationEntity
= T
>
T U
(
U V 
ProcedureMetastore
V h
.
h i&
usp_Designation_AllListi €
,€  
DatabaseConnection
‹‹ 
.
‹‹  

ConnString
‹‹  *
,
‹‹* +
CommandType
‹‹, 7
.
‹‹7 8
StoredProcedure
‹‹8 G
,
‹‹G H
null
‹‹I M
)
‹‹M N
;
‹‹N O
return
 
lstStf
 
;
 
}
 	
}
 
} ίρ
ND:\EltizamLive\Eltizam.Business.Core\Implementation\MasterDictionaryService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
Implementation  .
{ 
public 

class #
MasterDictionaryService (
:) *$
IMasterDictionaryService+ C
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IMapperFactory '
_mapperFactory( 6
;6 7
private 
readonly 
IStringLocalizer )
<) *
Errors* 0
>0 1!
_stringLocalizerError2 G
;G H
private 
readonly 
	Microsoft "
." #

Extensions# -
.- .
Configuration. ;
.; <
IConfiguration< J
configurationK X
;X Y
private 
readonly 
int 
? 
_LoginUserId *
;* +
private!! 
IRepository!! 
<!! 
MasterDictionary!! ,
>!!, -
_repository!!. 9
{!!: ;
get!!< ?
;!!? @
set!!A D
;!!D E
}!!F G
private"" 
IRepository"" 
<"" "
MasterDictionaryDetail"" 2
>""2 3
_repositoryDetail""4 E
{""F G
get""H K
;""K L
set""M P
;""P Q
}""R S
private## 
readonly## 
IHelper##  
_helper##! (
;##( )
private$$ 
readonly$$ 
IAuditLogService$$ )
_auditLogService$$* :
;$$: ;
public&& #
MasterDictionaryService&& &
(&&& '
IUnitOfWork&&' 2

unitOfWork&&3 =
,&&= >
IMapperFactory&&? M
mapperFactory&&N [
,&&[ \
IHelper''! (
helper'') /
,''/ 0
	Microsoft''1 :
.'': ;

Extensions''; E
.''E F
Configuration''F S
.''S T
IConfiguration''T b
_configuration''c q
,''q r
IAuditLogService	''s ƒ
auditLogService
''„ “
)
''“ ”
{(( 	
_unitOfWork)) 
=)) 

unitOfWork)) $
;))$ %
_mapperFactory** 
=** 
mapperFactory** *
;*** +
_repository,, 
=,, 
_unitOfWork,, %
.,,% &
GetRepository,,& 3
<,,3 4
MasterDictionary,,4 D
>,,D E
(,,E F
),,F G
;,,G H
_repositoryDetail-- 
=-- 
_unitOfWork--  +
.--+ ,
GetRepository--, 9
<--9 :"
MasterDictionaryDetail--: P
>--P Q
(--Q R
)--R S
;--S T
configuration.. 
=.. 
_configuration.. *
;..* +
_helper// 
=// 
helper// 
;// 
_auditLogService00 
=00 
auditLogService00 .
;00. /
_LoginUserId11 
=11 
_helper11 "
.11" #
GetLoggedInUser11# 2
(112 3
)113 4
?114 5
.115 6
UserId116 <
;11< =
}22 	
public55 
async55 
Task55 
<55 "
DataTableResponseModel55 0
>550 1
GetAll552 8
(558 9"
DataTableAjaxPostModel559 O
model55P U
)55U V
{66 	
string77 

ColumnName77 
=77 
model77  %
.77% &
order77& +
.77+ ,
Count77, 1
>772 3
$num774 5
?776 7
model778 =
.77= >
columns77> E
[77E F
model77F K
.77K L
order77L Q
[77Q R
$num77R S
]77S T
.77T U
column77U [
]77[ \
.77\ ]
data77] a
:77b c
string77d j
.77j k
Empty77k p
;77p q
string88 
SortDir88 
=88 
model88 "
.88" #
order88# (
[88( )
$num88) *
]88* +
?88+ ,
.88, -
dir88- 0
;880 1
SqlParameter99 
[99 
]99 
osqlParameter99 (
=99) *
{:: 
new;; 
SqlParameter;;  
(;;  !
AppConstants;;! -
.;;- .
P_CurrentPageNumber;;. A
,;;A B
model;;D I
.;;I J
start;;J O
);;O P
,;;P Q
new<< 
SqlParameter<<  
(<<  !
AppConstants<<! -
.<<- .

P_PageSize<<. 8
,<<8 9
model<<D I
.<<I J
length<<J P
)<<P Q
,<<Q R
new== 
SqlParameter==  
(==  !
AppConstants==! -
.==- .
P_SortColumn==. :
,==: ;

ColumnName==D N
)==N O
,==O P
new>> 
SqlParameter>>  
(>>  !
AppConstants>>! -
.>>- .
P_SortDirection>>. =
,>>= >
SortDir>>D K
)>>K L
,>>L M
new?? 
SqlParameter??  
(??  !
AppConstants??! -
.??- .
P_SearchText??. :
,??: ;
model??D I
.??I J
search??J P
???P Q
.??Q R
value??R W
)??W X
}@@ 
;@@ 
varBB 
ResultsBB 
=BB 
awaitBB 
_repositoryBB  +
.BB+ ,
GetBySPBB, 3
(BB3 4
ProcedureMetastoreBB4 F
.BBF G(
usp_Dictionary_SearchAllListBBG c
,BBc d
CommandTypeBBe p
.BBp q
StoredProcedure	BBq €
,
BB€ 
osqlParameter
BB‚ 
)
BB 
;
BB ‘
varEE 
resEE 
=EE 
UtilityHelperEE #
.EE# $
GetPaginationInfoEE$ 5
(EE5 6
ResultsEE6 =
)EE= >
;EE> ?"
DataTableResponseModelFF "
ResFF# &
=FF' (
newFF) ,"
DataTableResponseModelFF- C
(FFC D
modelFFD I
.FFI J
drawFFJ N
,FFN O
resFFP S
.FFS T
Item1FFT Y
,FFY Z
resFF[ ^
.FF^ _
Item1FF_ d
,FFd e
ResultsFFf m
.FFm n
DataTableToListFFn }
<FF} ~#
MasterDictionaryEntity	FF~ ”
>
FF” •
(
FF• –
)
FF– —
)
FF— 
;
FF ™
returnHH 
ResHH 
;HH 
}II 	
publicKK 
asyncKK 
TaskKK 
<KK 
ListKK 
<KK &
MasterDictionaryDetailByIdKK 9
>KK9 :
>KK: ;)
GetDictionaryDetailsByIdAsyncKK< Y
(KKY Z
intKKZ ]
idKK^ `
,KK` a
stringKKb h
descriptionKKi t
)KKt u
{LL 	
DbParameterMM 
[MM 
]MM 
osqlParameterMM '
=MM( )
{NN 
newOO 
DbParameterOO 
(OO  
$strOO  $
,OO$ %
idOO& (
,OO( )
	SqlDbTypeOO* 3
.OO3 4
IntOO4 7
)OO7 8
,OO8 9
newPP 
DbParameterPP 
(PP  
$strPP  -
,PP- .
descriptionPP. 9
,PP9 :
	SqlDbTypePP: C
.PPC D
VarCharPPD K
)PPK L
,PPL M
}QQ 
;QQ 
varSS 
_DictionarySS 
=SS 
EltizamDBHelperSS -
.SS- .
ExecuteMappedReaderSS. A
<SSA B&
MasterDictionaryDetailByIdSSB \
>SS\ ]
(SS] ^
ProcedureMetastoreSS^ p
.SSp q#
usp_Dictionary_GetById	SSq ‡
,
SS‡ 
DatabaseConnectionTT 0
.TT0 1

ConnStringTT1 ;
,TT; <
SystemTT= C
.TTC D
DataTTD H
.TTH I
CommandTypeTTI T
.TTT U
StoredProcedureTTU d
,TTd e
osqlParameterTTf s
)TTs t
;TTt u
returnUU 
_DictionaryUU 
;UU 
}VV 	
publicXX 
asyncXX 
TaskXX 
<XX &
MasterDictionaryDetailByIdXX 4
>XX4 5)
GetDictionaryDetailsByIdAsyncXX6 S
(XXS T
intXXT W
idXXX Z
)XXZ [
{YY 	
tryZZ 
{[[ 
var\\ 
masterDictionary\\ $
=\\% &
await\\' ,
_repositoryDetail\\- >
.\\> ?
GetAsync\\? G
(\\G H
id\\H J
)\\J K
;\\K L
if]] 
(]] 
masterDictionary]] $
==]]% '
null]]( ,
)]], -
{^^ 
return__ 
null__ 
;__  
}`` 
varbb 
_DictionaryEntitybb %
=bb& '
_mapperFactorybb( 6
.bb6 7
Getbb7 :
<bb: ;"
MasterDictionaryDetailbb; Q
,bbQ R&
MasterDictionaryDetailByIdbbS m
>bbm n
(bbn o
masterDictionarybbo 
)	bb €
;
bb€ 
returncc 
_DictionaryEntitycc (
;cc( )
}dd 
catchee 
(ee 
	Exceptionee 
exee 
)ee  
{ff 
returngg 
nullgg 
;gg 
}hh 
}ii 	
publickk 
asynckk 
Taskkk 
<kk 
DBOperationkk %
>kk% &%
AddUpdateMasterDictionarykk' @
(kk@ A&
MasterDictionaryDetailByIdkkA [
entitydictionarykk\ l
)kkl m
{ll 	"
MasterDictionaryDetailnn "
objDicitonarynn# 0
;nn0 1
varpp 
Bypp 
=pp 
_helperpp 
.pp 
GetLoggedInUserpp ,
(pp, -
)pp- .
.pp. /
UserIdpp/ 5
;pp5 6
stringqq 
MainTableNameqq  
=qq! "
Enumqq# '
.qq' (
GetNameqq( /
(qq/ 0
TableNameEnumqq0 =
.qq= >
Master_Locationqq> M
)qqM N
;qqN O
intrr 
MainTableKeyrr 
=rr 
entitydictionaryrr /
.rr/ 0
Idrr0 2
;rr2 3
tryss 
{tt 
ifuu 
(uu 
entitydictionaryuu $
.uu$ %
Iduu% '
>uu( )
$numuu* +
)uu+ ,
{vv "
MasterDictionaryDetailww *
	OldEntityww+ 4
=ww5 6
nullww7 ;
;ww; <
objDicitonaryxx !
=xx" #
_repositoryDetailxx$ 5
.xx5 6
Getxx6 9
(xx9 :
entitydictionaryxx: J
.xxJ K
IdxxK M
)xxM N
;xxN O
varyy 
OldObjLocationyy &
=yy' (
objDicitonaryyy) 6
;yy6 7
ifzz 
(zz 
objDicitonaryzz %
!=zz& (
nullzz) -
)zz- .
{{{ 
objDicitonary}} %
.}}% &
Description}}& 1
=}}2 3
entitydictionary}}4 D
.}}D E
Description}}E P
;}}P Q
objDicitonary~~ %
.~~% &
Sort~~& *
=~~+ ,
entitydictionary~~- =
.~~= >
Sort~~> B
;~~B C
objDicitonary %
.% &
IsActive& .
=/ 0
entitydictionary1 A
.A B
IsActiveB J
;J K
objDicitonary
€€ %
.
€€% &

ModifiedBy
€€& 0
=
€€1 2
entitydictionary
€€3 C
.
€€C D

ModifiedBy
€€D N
??
€€O Q
By
€€R T
;
€€T U
_repositoryDetail
‚‚ )
.
‚‚) *
UpdateAsync
‚‚* 5
(
‚‚5 6
objDicitonary
‚‚6 C
)
‚‚C D
;
‚‚D E
await
„„ 
_unitOfWork
„„ )
.
„„) *
SaveChangesAsync
„„* :
(
„„: ;
)
„„; <
;
„„< =
await
‡‡ 
_auditLogService
‡‡ .
.
‡‡. /
CreateAuditLog
‡‡/ =
<
‡‡= >$
MasterDictionaryDetail
‡‡> T
>
‡‡T U
(
‡‡U V!
AuditActionTypeEnum
‡‡V i
.
‡‡i j
Update
‡‡j p
,
‡‡p q
	OldEntity
‡‡r {
,
‡‡{ |
objDicitonary‡‡} 
,‡‡ ‹
MainTableName‡‡ ™
,‡‡™ 
MainTableKey‡‡› §
)‡‡§ ¨
;‡‡¨ ©
}
 
}
‰‰ 
else
‹‹ 
{
 
objDicitonary
 !
=
" #
_mapperFactory
$ 2
.
2 3
Get
3 6
<
6 7(
MasterDictionaryDetailById
7 Q
,
Q R$
MasterDictionaryDetail
S i
>
i j
(
j k
entitydictionary
k {
)
{ |
;
| }
objDicitonary
 !
.
! "
Description
" -
=
. /
entitydictionary
0 @
.
@ A
Description
A L
;
L M
objDicitonary
 !
.
! "
IsActive
" *
=
+ ,
entitydictionary
- =
.
= >
IsActive
> F
;
F G
objDicitonary
 !
.
! "
	CreatedBy
" +
=
, -
entitydictionary
. >
.
> ?
	CreatedBy
? H
;
H I
_repositoryDetail
’’ %
.
’’% &
AddAsync
’’& .
(
’’. /
objDicitonary
’’/ <
)
’’< =
;
’’= >
await
““ 
_unitOfWork
““ %
.
““% &
SaveChangesAsync
““& 6
(
““6 7
)
““7 8
;
““8 9
}
”” 
if
–– 
(
–– 
objDicitonary
–– !
.
––! "
Id
––" $
==
––% '
$num
––( )
)
––) *
return
—— 
DBOperation
—— &
.
——& '
Error
——' ,
;
——, -
return
™™ 
DBOperation
™™ "
.
™™" #
Success
™™# *
;
™™* +
}
 
catch
›› 
(
›› 
	Exception
›› 
ex
›› 
)
››  
{
 
throw
 
ex
 
;
 
}
 
}
ΆΆ 	
public
¥¥ 
async
¥¥ 
Task
¥¥ 
<
¥¥ 
DBOperation
¥¥ %
>
¥¥% &
Delete
¥¥' -
(
¥¥- .
int
¥¥. 1
id
¥¥2 4
)
¥¥4 5
{
¦¦ 	
var
§§ 
entityDictionary
§§  
=
§§! "
_repositoryDetail
§§# 4
.
§§4 5
Get
§§5 8
(
§§8 9
x
§§9 :
=>
§§; =
x
§§> ?
.
§§? @
Id
§§@ B
==
§§C E
id
§§F H
)
§§H I
;
§§I J
if
©© 
(
©© 
entityDictionary
©©  
==
©©! #
null
©©$ (
)
©©( )
return
ªª 
DBOperation
ªª "
.
ªª" #
NotFound
ªª# +
;
ªª+ ,
_repositoryDetail
¬¬ 
.
¬¬ 
Remove
¬¬ $
(
¬¬$ %
entityDictionary
¬¬% 5
)
¬¬5 6
;
¬¬6 7
await
®® 
_unitOfWork
®® 
.
®® 
SaveChangesAsync
®® .
(
®®. /
)
®®/ 0
;
®®0 1
return
°° 
DBOperation
°° 
.
°° 
Success
°° &
;
°°& '
}
±± 	
public
ΈΈ 
async
ΈΈ 
Task
ΈΈ 
<
ΈΈ 
DBOperation
ΈΈ %
>
ΈΈ% &'
MasterDictionaryAddUpdate
ΈΈ' @
(
ΈΈ@ A$
MasterDictionaryEntity
ΈΈA W
entity
ΈΈX ^
)
ΈΈ^ _
{
ΉΉ 	
if
ΊΊ 
(
ΊΊ 
entity
ΊΊ 
!=
ΊΊ 
null
ΊΊ 
&&
ΊΊ !
entity
ΊΊ" (
.
ΊΊ( )
Description
ΊΊ) 4
!=
ΊΊ5 7
null
ΊΊ8 <
&&
ΊΊ= ?
entity
ΊΊ@ F
.
ΊΊF G
Id
ΊΊG I
==
ΊΊI K
$num
ΊΊK L
)
ΊΊL M
{
»» 
var
ΌΌ 
result
ΌΌ 
=
ΌΌ +
IsDictionaryDescriptionExists
ΌΌ :
(
ΌΌ: ;
entity
ΌΌ; A
.
ΌΌA B
Description
ΌΌB M
)
ΌΌM N
;
ΌΌN O
if
½½ 
(
½½ 
result
½½ 
)
½½ 
{
ΎΎ 
return
ΏΏ 
DBOperation
ΏΏ &
.
ΏΏ& '
AlreadyExist
ΏΏ' 3
;
ΏΏ3 4
}
ΐΐ 
}
ΑΑ 
MasterDictionary
ΔΔ !
objmasterDictionary
ΔΔ 0
;
ΔΔ0 1
string
ΖΖ 
MainTableName
ΖΖ  
=
ΖΖ! "
Enum
ΖΖ# '
.
ΖΖ' (
GetName
ΖΖ( /
(
ΖΖ/ 0
TableNameEnum
ΖΖ0 =
.
ΖΖ= >
Master_Dictionary
ΖΖ> O
)
ΖΖO P
;
ΖΖP Q
int
ΗΗ 
MainTableKey
ΗΗ 
=
ΗΗ 
entity
ΗΗ %
.
ΗΗ% &
Id
ΗΗ& (
;
ΗΗ( )
MasterDictionary
ΘΘ 
	OldEntity
ΘΘ &
=
ΘΘ' (
null
ΘΘ) -
;
ΘΘ- .
if
ΚΚ 
(
ΚΚ 
entity
ΚΚ 
.
ΚΚ 
Id
ΚΚ 
>
ΚΚ 
$num
ΚΚ 
)
ΚΚ 
{
ΛΛ 
	OldEntity
ΜΜ 
=
ΜΜ 
_repository
ΜΜ '
.
ΜΜ' (
GetNoTracking
ΜΜ( 5
(
ΜΜ5 6
entity
ΜΜ6 <
.
ΜΜ< =
Id
ΜΜ= ?
)
ΜΜ? @
;
ΜΜ@ A!
objmasterDictionary
ΝΝ #
=
ΝΝ$ %
_repository
ΝΝ& 1
.
ΝΝ1 2
Get
ΝΝ2 5
(
ΝΝ5 6
entity
ΝΝ6 <
.
ΝΝ< =
Id
ΝΝ= ?
)
ΝΝ? @
;
ΝΝ@ A!
objmasterDictionary
ΟΟ #
=
ΟΟ$ %
_repository
ΟΟ& 1
.
ΟΟ1 2
Get
ΟΟ2 5
(
ΟΟ5 6
entity
ΟΟ6 <
.
ΟΟ< =
Id
ΟΟ= ?
)
ΟΟ? @
;
ΟΟ@ A
if
ΡΡ 
(
ΡΡ !
objmasterDictionary
ΡΡ '
!=
ΡΡ( *
null
ΡΡ+ /
)
ΡΡ/ 0
{
ÒÒ !
objmasterDictionary
ΣΣ '
.
ΣΣ' (
Description
ΣΣ( 3
=
ΣΣ4 5
entity
ΣΣ6 <
.
ΣΣ< =
Description
ΣΣ= H
;
ΣΣH I!
objmasterDictionary
ΤΤ '
.
ΤΤ' (
IsActive
ΤΤ( 0
=
ΤΤ1 2
Convert
ΤΤ3 :
.
ΤΤ: ;
ToInt32
ΤΤ; B
(
ΤΤB C
entity
ΤΤC I
.
ΤΤI J
IsActive
ΤΤJ R
)
ΤΤR S
;
ΤΤS T!
objmasterDictionary
ΥΥ '
.
ΥΥ' (

ModifiedBy
ΥΥ( 2
=
ΥΥ3 4
entity
ΥΥ5 ;
.
ΥΥ; <
LogInUserId
ΥΥ< G
;
ΥΥG H
_repository
ΨΨ 
.
ΨΨ  
UpdateAsync
ΨΨ  +
(
ΨΨ+ ,!
objmasterDictionary
ΨΨ, ?
)
ΨΨ? @
;
ΨΨ@ A
}
ΩΩ 
await
ΫΫ 
_auditLogService
ΫΫ &
.
ΫΫ& '
CreateAuditLog
ΫΫ' 5
<
ΫΫ5 6
MasterDictionary
ΫΫ6 F
>
ΫΫF G
(
ΫΫG H!
AuditActionTypeEnum
ΫΫH [
.
ΫΫ[ \
Update
ΫΫ\ b
,
ΫΫb c
	OldEntity
ΫΫd m
,
ΫΫm n"
objmasterDictionaryΫΫo ‚
,ΫΫ‚ ƒ
MainTableNameΫΫ„ ‘
,ΫΫ‘ ’
MainTableKeyΫΫ“ 
)ΫΫ  
;ΫΫ  ΅
await
άά 
_unitOfWork
άά !
.
άά! "
SaveChangesAsync
άά" 2
(
άά2 3
)
άά3 4
;
άά4 5
}
ήή 
else
ίί 
{
ΰΰ !
objmasterDictionary
αα #
=
αα$ %
new
αα& )
MasterDictionary
αα* :
(
αα: ;
)
αα; <
{
ββ 
IsActive
γγ 
=
γγ 
Convert
γγ &
.
γγ& '
ToInt32
γγ' .
(
γγ. /
entity
γγ/ 5
.
γγ5 6
IsActive
γγ6 >
)
γγ> ?
,
γγ? @
Description
δδ 
=
δδ  !
entity
δδ" (
.
δδ( )
Description
δδ) 4
,
δδ4 5
DictionaryCode
εε "
=
εε# $
entity
εε% +
.
εε+ ,
Description
εε, 7
.
εε7 8
Replace
εε8 ?
(
εε? @
$str
εε@ C
,
εεC D
$str
εεE H
)
εεH I
.
εεI J
ToUpper
εεJ Q
(
εεQ R
)
εεR S
,
εεS T
	CreatedBy
ζζ 
=
ζζ 
entity
ζζ  &
.
ζζ& '
LogInUserId
ζζ' 2
}
ηη 
;
ηη 
_repository
κκ 
.
κκ 
AddAsync
κκ $
(
κκ$ %!
objmasterDictionary
κκ% 8
)
κκ8 9
;
κκ9 :
}
λλ 
await
ξξ 
_unitOfWork
ξξ 
.
ξξ 
SaveChangesAsync
ξξ .
(
ξξ. /
)
ξξ/ 0
;
ξξ0 1
if
ςς 
(
ςς !
objmasterDictionary
ςς #
.
ςς# $
Id
ςς$ &
==
ςς' )
$num
ςς* +
)
ςς+ ,
return
σσ 
DBOperation
σσ "
.
σσ" #
Error
σσ# (
;
σσ( )
else
ττ 
{
υυ 
var
φφ 
subTypes
φφ 
=
φφ 
entity
φφ %
.
φφ% &%
MasterDicitonaryDetails
φφ& =
;
φφ= >
var
χχ 
_Val
χχ 
=
χχ 
$str
χχ 
;
χχ 
if
ψψ 
(
ψψ 
subTypes
ψψ 
!=
ψψ 
null
ψψ  $
)
ψψ$ %
{
ωω 
foreach
ϊϊ 
(
ϊϊ 
var
ϊϊ  
_stype
ϊϊ! '
in
ϊϊ( *
subTypes
ϊϊ+ 3
)
ϊϊ3 4
{
ϋϋ 
_Val
όό 
+=
όό 
string
όό  &
.
όό& '
Format
όό' -
(
όό- .
$str
όό. 8
,
όό8 9
_stype
όό: @
.
όό@ A
Id
όόA C
,
όόC D
_stype
όόE K
.
όόK L
Description
όόL W
)
όόW X
;
όόX Y
}
ύύ 
}
ώώ 
SqlParameter
€€ 
[
€€ 
]
€€ 
_sqlParameter
€€ ,
=
€€- .
{
 
new
‚‚ 
SqlParameter
‚‚ $
(
‚‚$ %
AppConstants
‚‚% 1
.
‚‚1 2
P_Id
‚‚2 6
,
‚‚6 7!
objmasterDictionary
‚‚D W
.
‚‚W X
Id
‚‚X Z
)
‚‚Z [
,
‚‚[ \
new
ƒƒ 
SqlParameter
ƒƒ $
(
ƒƒ$ %
AppConstants
ƒƒ% 1
.
ƒƒ1 2
P_CreatedBy
ƒƒ2 =
,
ƒƒ= >
entity
ƒƒD J
.
ƒƒJ K
LogInUserId
ƒƒK V
)
ƒƒV W
,
ƒƒW X
new
„„ 
SqlParameter
„„ $
(
„„$ %
AppConstants
„„% 1
.
„„1 2
P_RequestData
„„2 ?
,
„„? @
_Val
„„D H
)
„„H I
}
…… 
;
…… 
await
‡‡ 
_repository
‡‡ !
.
‡‡! "
GetBySP
‡‡" )
(
‡‡) * 
ProcedureMetastore
‡‡* <
.
‡‡< =:
,usp_MasterDictionary_UpsertDictionaryDetails
‡‡= i
,
‡‡i j
CommandType
‡‡k v
.
‡‡v w
StoredProcedure‡‡w †
,‡‡† ‡
_sqlParameter‡‡ •
)‡‡• –
;‡‡– —
}
 
return
‰‰ 
DBOperation
‰‰ 
.
‰‰ 
Success
‰‰ &
;
‰‰& '
}
 	
private
‹‹ 
bool
‹‹ +
IsDictionaryDescriptionExists
‹‹ 2
(
‹‹2 3
string
‹‹3 9
description
‹‹: E
)
‹‹E F
{
 	
return
 
_repository
 
.
 
GetAll
 %
(
% &
)
& '
.
 
Any
 
(
 

dictionary
 
=>
  "

dictionary
# -
.
- .
Description
. 9
==
: <
description
= H
)
H I
;
I J
}
 	
public
‘‘ 
async
‘‘ 
Task
‘‘ 
<
‘‘ $
MasterDictionaryEntity
‘‘ 0
>
‘‘0 10
"GetMasterDictionaryDetailByIdAsync
‘‘2 T
(
‘‘T U
int
‘‘U X
id
‘‘Y [
)
‘‘[ \
{
’’ 	
var
”” 
_userEntity
”” 
=
”” 
new
”” !$
MasterDictionaryEntity
””" 8
(
””8 9
)
””9 :
;
””: ;
_userEntity
—— 
=
—— 
_mapperFactory
—— (
.
——( )
Get
——) ,
<
——, -
MasterDictionary
——- =
,
——= >$
MasterDictionaryEntity
——? U
>
——U V
(
——V W
await
——W \
_repository
——] h
.
——h i
GetAsync
——i q
(
——q r
id
——r t
)
——t u
)
——u v
;
——v w
return
 
_userEntity
 
;
 
}
›› 	
public
 
async
 
Task
 
<
 
List
 
<
 (
MasterDictionaryDetailById
 9
>
9 :
>
: ;3
%GetMasterDictionaryDetailSubByIdAsync
< a
(
a b
int
b e
DictionaryId
f r
)
r s
{
 	
var
 
	_SubTypes
 
=
 
new
 
List
  $
<
$ %(
MasterDictionaryDetailById
% ?
>
? @
(
@ A
)
A B
;
B C
var
΅΅ 
res
΅΅ 
=
΅΅ 
_repositoryDetail
΅΅ '
.
΅΅' (
GetAllAsync
΅΅( 3
(
΅΅3 4
x
΅΅4 5
=>
΅΅6 8
x
΅΅9 :
.
΅΅: ;
DictionaryId
΅΅; G
==
΅΅H J
DictionaryId
΅΅K W
&&
΅΅X Z
x
΅΅[ \
.
΅΅\ ]
IsActive
΅΅] e
==
΅΅f h
$num
΅΅i j
)
΅΅j k
.
΅΅k l
Result
΅΅l r
.
΅΅r s
ToList
΅΅s y
(
΅΅y z
)
΅΅z {
;
΅΅{ |
	_SubTypes
¤¤ 
=
¤¤ 
_mapperFactory
¤¤ &
.
¤¤& '
GetList
¤¤' .
<
¤¤. /$
MasterDictionaryDetail
¤¤/ E
,
¤¤E F(
MasterDictionaryDetailById
¤¤G a
>
¤¤a b
(
¤¤b c
res
¤¤c f
)
¤¤f g
;
¤¤g h
return
§§ 
	_SubTypes
§§ 
;
§§ 
}
¨¨ 	
public
±± 
async
±± 
Task
±± 
<
±± %
MasterDictionaryDetails
±± 1
>
±±1 2.
 GetDictionaryWithSubDetailsAsync
±±3 S
(
±±S T
int
±±T W
?
±±W X
DictionaryId
±±Y e
,
±±e f
string
±±g m
?
±±m n
Description
±±o z
,
±±z {
string±±| ‚
?±±‚ ƒ
Code±±„ 
)±± ‰
{
²² 	
var
³³ 
_header
³³ 
=
³³ 
new
³³ %
MasterDictionaryDetails
³³ 5
(
³³5 6
)
³³6 7
;
³³7 8
var
¶¶ 
desc
¶¶ 
=
¶¶ 
await
¶¶ 
_repository
¶¶ (
.
¶¶( )
GetAsync
¶¶) 1
(
¶¶1 2
a
¶¶2 3
=>
¶¶4 6
(
··  
DictionaryId
··  ,
==
··- /
null
··0 4
||
··5 7
a
··8 9
.
··9 :
Id
··: <
==
··= ?
DictionaryId
··@ L
)
··L M
&&
··N P
(
ΈΈ  
Description
ΈΈ  +
==
ΈΈ, .
null
ΈΈ/ 3
||
ΈΈ4 6
a
ΈΈ7 8
.
ΈΈ8 9
Description
ΈΈ9 D
==
ΈΈE G
Description
ΈΈH S
)
ΈΈS T
&&
ΈΈU W
(
ΉΉ  
Code
ΉΉ  $
==
ΉΉ% '
null
ΉΉ( ,
||
ΉΉ- /
a
ΉΉ0 1
.
ΉΉ1 2
DictionaryCode
ΉΉ2 @
==
ΉΉA C
Code
ΉΉD H
)
ΉΉH I
)
ΉΉI J
;
ΉΉJ K
if
»» 
(
»» 
desc
»» 
!=
»» 
null
»» 
)
»» 
{
ΌΌ 
_header
½½ 
=
½½ 
new
½½ %
MasterDictionaryDetails
½½ 5
(
½½5 6
)
½½6 7
{
ΎΎ 
Description
ΏΏ 
=
ΏΏ  !
desc
ΏΏ" &
.
ΏΏ& '
Description
ΏΏ' 2
,
ΏΏ2 3
Id
ΐΐ 
=
ΐΐ 
desc
ΐΐ 
.
ΐΐ 
Id
ΐΐ  
,
ΐΐ  !
IsActive
ΑΑ 
=
ΑΑ 
desc
ΑΑ #
.
ΑΑ# $
IsActive
ΑΑ$ ,
}
ΒΒ 
;
ΒΒ 
var
ΔΔ 
	_SubTypes
ΔΔ 
=
ΔΔ 
_repositoryDetail
ΔΔ  1
.
ΔΔ1 2
GetAllAsync
ΔΔ2 =
(
ΔΔ= >
x
ΔΔ> ?
=>
ΔΔ@ B
x
ΔΔC D
.
ΔΔD E
DictionaryId
ΔΔE Q
==
ΔΔR T
_header
ΔΔU \
.
ΔΔ\ ]
Id
ΔΔ] _
&&
ΔΔ` b
x
ΔΔc d
.
ΔΔd e
IsActive
ΔΔe m
==
ΔΔn p
$num
ΔΔq r
)
ΔΔr s
.
ΔΔs t
Result
ΔΔt z
.
ΔΔz {
ToListΔΔ{ 
(ΔΔ ‚
)ΔΔ‚ ƒ
;ΔΔƒ „
_header
ΕΕ 
.
ΕΕ 
Values
ΕΕ 
=
ΕΕ  
new
ΕΕ! $
List
ΕΕ% )
<
ΕΕ) *)
MasterDictionaryDetailChild
ΕΕ* E
>
ΕΕE F
(
ΕΕF G
)
ΕΕG H
;
ΕΕH I
foreach
ΗΗ 
(
ΗΗ 
var
ΗΗ 
item
ΗΗ !
in
ΗΗ" $
	_SubTypes
ΗΗ% .
)
ΗΗ. /
{
ΘΘ 
_header
ΙΙ 
.
ΙΙ 
Values
ΙΙ "
.
ΙΙ" #
Add
ΙΙ# &
(
ΙΙ& '
new
ΙΙ' *)
MasterDictionaryDetailChild
ΙΙ+ F
(
ΙΙF G
)
ΙΙG H
{
ΚΚ 
Id
ΛΛ 
=
ΛΛ 
item
ΛΛ !
.
ΛΛ! "
Id
ΛΛ" $
,
ΛΛ$ %
IsActive
ΜΜ  
=
ΜΜ! "
item
ΜΜ# '
.
ΜΜ' (
IsActive
ΜΜ( 0
,
ΜΜ0 1
Description
ΝΝ #
=
ΝΝ$ %
item
ΝΝ& *
.
ΝΝ* +
Description
ΝΝ+ 6
}
ΞΞ 
)
ΞΞ 
;
ΞΞ 
}
ΟΟ 
;
ΟΟ 
}
ΠΠ 
return
ΣΣ 
_header
ΣΣ 
;
ΣΣ 
}
ΤΤ 	
}
ΥΥ 
}ΦΦ φ|
LD:\EltizamLive\Eltizam.Business.Core\Implementation\MasterLocationService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
Implementation  .
{ 
public 

class !
MasterLocationService &
:' ("
IMasterLocationService) ?
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IMapperFactory '
_mapperFactory( 6
;6 7
private 
readonly 
IStringLocalizer )
<) *
Errors* 0
>0 1!
_stringLocalizerError2 G
;G H
private 
readonly 
IConfiguration '
configuration( 5
;5 6
private 
IRepository 
< 
MasterLocation *
>* +
_repository, 7
{8 9
get: =
;= >
set? B
;B C
}D E
private 
readonly 
IHelper  
_helper! (
;( )
private 
IRepository 
< 
EmailLogHistory +
>+ ,
	_emailLog- 6
{7 8
get9 <
;< =
set> A
;A B
}C D
private 
readonly 
IAuditLogService )
_auditLogService* :
;: ;
private   
readonly   
int   
?   
_LoginUserId   *
;  * +
public"" !
MasterLocationService"" $
(""$ %
IUnitOfWork""% 0

unitOfWork""1 ;
,""; <
IMapperFactory""= K
mapperFactory""L Y
,""Y Z
IHelper""[ b
helper""c i
,""i j
IConfiguration""k y
_configuration	""z 
,
"" ‰
IAuditLogService
"" 
auditLogService
""› ª
)
""ª «
{## 	
_unitOfWork$$ 
=$$ 

unitOfWork$$ $
;$$$ %
_mapperFactory%% 
=%% 
mapperFactory%% *
;%%* +
_repository'' 
='' 
_unitOfWork'' %
.''% &
GetRepository''& 3
<''3 4
MasterLocation''4 B
>''B C
(''C D
)''D E
;''E F
configuration(( 
=(( 
_configuration(( *
;((* +
_helper)) 
=)) 
helper)) 
;)) 
_auditLogService** 
=** 
auditLogService** .
;**. /
}++ 	
publicAA 
asyncAA 
TaskAA 
<AA "
DataTableResponseModelAA 0
>AA0 1
GetAllAA2 8
(AA8 9"
DataTableAjaxPostModelAA9 O
modelAAP U
)AAU V
{BB 	
stringCC 

ColumnNameCC 
=CC 
modelCC  %
.CC% &
orderCC& +
.CC+ ,
CountCC, 1
>CC2 3
$numCC4 5
?CC6 7
modelCC8 =
.CC= >
columnsCC> E
[CCE F
modelCCF K
.CCK L
orderCCL Q
[CCQ R
$numCCR S
]CCS T
.CCT U
columnCCU [
]CC[ \
.CC\ ]
dataCC] a
:CCb c
stringCCd j
.CCj k
EmptyCCk p
;CCp q
stringDD 
SortDirDD 
=DD 
modelDD "
.DD" #
orderDD# (
[DD( )
$numDD) *
]DD* +
?DD+ ,
.DD, -
dirDD- 0
;DD0 1
SqlParameterFF 
[FF 
]FF 
osqlParameterFF (
=FF) *
{GG 
newHH 
SqlParameterHH  
(HH  !
AppConstantsHH! -
.HH- .
P_CurrentPageNumberHH. A
,HHA B
modelHHD I
.HHI J
startHHJ O
)HHO P
,HHP Q
newII 
SqlParameterII  
(II  !
AppConstantsII! -
.II- .

P_PageSizeII. 8
,II8 9
modelIID I
.III J
lengthIIJ P
)IIP Q
,IIQ R
newJJ 
SqlParameterJJ  
(JJ  !
AppConstantsJJ! -
.JJ- .
P_SortColumnJJ. :
,JJ: ;

ColumnNameJJB L
)JJL M
,JJM N
newKK 
SqlParameterKK  
(KK  !
AppConstantsKK! -
.KK- .
P_SortDirectionKK. =
,KK= >
SortDirKKD K
)KKK L
,KKL M
newLL 
SqlParameterLL  
(LL  !
AppConstantsLL! -
.LL- .
P_SearchTextLL. :
,LL: ;
modelLLD I
.LLI J
searchLLJ P
?LLP Q
.LLQ R
valueLLR W
)LLW X
}MM 
;MM 
varOO 
ResultsOO 
=OO 
awaitOO 
_repositoryOO  +
.OO+ ,
GetBySPOO, 3
(OO3 4
ProcedureMetastoreOO4 F
.OOF G&
usp_Location_SearchAllListOOG a
,OOa b
CommandTypeOOc n
.OOn o
StoredProcedureOOo ~
,OO~ 
osqlParameter
OO€ 
)
OO 
;
OO 
varQQ 
resQQ 
=QQ 
UtilityHelperQQ #
.QQ# $
GetPaginationInfoQQ$ 5
(QQ5 6
ResultsQQ6 =
)QQ= >
;QQ> ?"
DataTableResponseModelSS "#
oDataTableResponseModelSS# :
=SS; <
newSS= @"
DataTableResponseModelSSA W
(SSW X
modelSSX ]
.SS] ^
drawSS^ b
,SSb c
resSSd g
.SSg h
Item1SSh m
,SSm n
resSSo r
.SSr s
Item1SSs x
,SSx y
Results	SSz 
.
SS ‚
DataTableToList
SS‚ ‘
<
SS‘ ’"
MasterLocationEntity
SS’ ¦
>
SS¦ §
(
SS§ ¨
)
SS¨ ©
)
SS© ª
;
SSª «
returnUU #
oDataTableResponseModelUU *
;UU* +
}VV 	
publicWW 
asyncWW 
TaskWW 
<WW  
MasterLocationEntityWW .
>WW. /
GetByIdWW0 7
(WW7 8
intWW8 ;
idWW< >
)WW> ?
{XX 	
varYY 
_LocationEntityYY 
=YY  !
newYY" % 
MasterLocationEntityYY& :
(YY: ;
)YY; <
;YY< =
_LocationEntityZZ 
=ZZ 
_mapperFactoryZZ ,
.ZZ, -
GetZZ- 0
<ZZ0 1
MasterLocationZZ1 ?
,ZZ? @ 
MasterLocationEntityZZA U
>ZZU V
(ZZV W
awaitZZW \
_repositoryZZ] h
.ZZh i
GetAsyncZZi q
(ZZq r
idZZr t
)ZZt u
)ZZu v
;ZZv w
return\\ 
_LocationEntity\\ "
;\\" #
}]] 	
public__ 
async__ 
Task__ 
<__ 
DBOperation__ %
>__% &#
AddUpdateLocationClient__' >
(__> ? 
MasterLocationEntity__? S
entityLocation__T b
)__b c
{`` 	
MasterLocationbb 
objLocationbb &
;bb& '
stringcc 
MainTableNamecc  
=cc! "
Enumcc# '
.cc' (
GetNamecc( /
(cc/ 0
TableNameEnumcc0 =
.cc= >
Master_Locationcc> M
)ccM N
;ccN O
intdd 
MainTableKeydd 
=dd 
entityLocationdd -
.dd- .
Iddd. 0
;dd0 1
ifff 
(ff 
entityLocationff 
.ff 
Idff !
>ff" #
$numff$ %
)ff% &
{gg 
MasterLocationhh 
	OldEntityhh (
=hh) *
nullhh+ /
;hh/ 0
	OldEntityii 
=ii 
_repositoryii '
.ii' (
GetNoTrackingii( 5
(ii5 6
entityLocationii6 D
.iiD E
IdiiE G
)iiG H
;iiH I
objLocationjj 
=jj 
_repositoryjj )
.jj) *
Getjj* -
(jj- .
entityLocationjj. <
.jj< =
Idjj= ?
)jj? @
;jj@ A
ifll 
(ll 
objLocationll 
!=ll  "
nullll# '
)ll' (
{mm 
objLocationoo 
.oo  
	CountryIdoo  )
=oo* +
entityLocationoo, :
.oo: ;
	CountryIdoo; D
;ooD E
objLocationpp 
.pp  
StateIdpp  '
=pp( )
entityLocationpp* 8
.pp8 9
StateIdpp9 @
;pp@ A
objLocationqq 
.qq  
CityIdqq  &
=qq' (
entityLocationqq) 7
.qq7 8
CityIdqq8 >
;qq> ?
objLocationrr 
.rr  
Sectorrr  &
=rr' (
entityLocationrr) 7
.rr7 8
Sectorrr8 >
;rr> ?
objLocationss 
.ss  
Latitudess  (
=ss) *
entityLocationss+ 9
.ss9 :
Latitudess: B
;ssB C
objLocationtt 
.tt  
	Longitudett  )
=tt* +
entityLocationtt, :
.tt: ;
	Longitudett; D
;ttD E
objLocationuu 
.uu  
Statusuu  &
=uu' (
entityLocationuu) 7
.uu7 8
Statusuu8 >
;uu> ?
objLocationvv 
.vv  
LocationNamevv  ,
=vv- .
entityLocationvv/ =
.vv= >
LocationNamevv> J
;vvJ K
objLocationww 
.ww  
ModifiedDateww  ,
=ww- .
AppConstantsww/ ;
.ww; <
DateTimeww< D
;wwD E
objLocationxx 
.xx  
IsActivexx  (
=xx) *
entityLocationxx+ 9
.xx9 :
IsActivexx: B
;xxB C
objLocationyy 
.yy  

ModifiedByyy  *
=yy+ ,
entityLocationyy- ;
.yy; <

ModifiedByyy< F
;yyF G
objLocationzz 
.zz  
HomeCurrencyIdzz  .
=zz/ 0
entityLocationzz1 ?
.zz? @
HomeCurrencyIdzz@ N
;zzN O
objLocation{{ 
.{{  
ForeignCurrencyId{{  1
={{2 3
entityLocation{{4 B
.{{B C
ForeignCurrencyId{{C T
;{{T U
_repository|| 
.||  
UpdateAsync||  +
(||+ ,
objLocation||, 7
)||7 8
;||8 9
await~~ 
_unitOfWork~~ %
.~~% &
SaveChangesAsync~~& 6
(~~6 7
)~~7 8
;~~8 9
await
 
_auditLogService
 *
.
* +
CreateAuditLog
+ 9
<
9 :
MasterLocation
: H
>
H I
(
I J!
AuditActionTypeEnum
J ]
.
] ^
Update
^ d
,
d e
	OldEntity
f o
,
o p
objLocation
q |
,
| }
MainTableName~ ‹
,‹ 
MainTableKey ™
)™ 
; ›
}
‚‚ 
else
ƒƒ 
{
„„ 
return
…… 
DBOperation
…… &
.
……& '
NotFound
……' /
;
……/ 0
}
†† 
}
‡‡ 
else
 
{
‰‰ 
objLocation
 
=
 
_mapperFactory
 ,
.
, -
Get
- 0
<
0 1"
MasterLocationEntity
1 E
,
E F
MasterLocation
G U
>
U V
(
V W
entityLocation
W e
)
e f
;
f g
objLocation
 
.
 
	CountryId
 %
=
& '
entityLocation
( 6
.
6 7
	CountryId
7 @
;
@ A
objLocation
 
.
 
StateId
 #
=
$ %
entityLocation
& 4
.
4 5
StateId
5 <
;
< =
objLocation
 
.
 
CityId
 "
=
# $
entityLocation
% 3
.
3 4
CityId
4 :
;
: ;
objLocation
 
.
 
Sector
 "
=
# $
entityLocation
% 3
.
3 4
Sector
4 :
;
: ;
objLocation
 
.
 
Latitude
 $
=
% &
entityLocation
' 5
.
5 6
Latitude
6 >
;
> ?
objLocation
‘‘ 
.
‘‘ 
	Longitude
‘‘ %
=
‘‘& '
entityLocation
‘‘( 6
.
‘‘6 7
	Longitude
‘‘7 @
;
‘‘@ A
objLocation
’’ 
.
’’ 
HomeCurrencyId
’’ *
=
’’+ ,
entityLocation
’’- ;
.
’’; <
HomeCurrencyId
’’< J
;
’’J K
objLocation
““ 
.
““ 
ForeignCurrencyId
““ -
=
““. /
entityLocation
““0 >
.
““> ?
ForeignCurrencyId
““? P
;
““P Q
objLocation
”” 
.
”” 
Status
”” "
=
””# $
entityLocation
””% 3
.
””3 4
Status
””4 :
;
””: ;
objLocation
•• 
.
•• 
	CreatedBy
•• %
=
••& '
entityLocation
••( 6
.
••6 7
	CreatedBy
••7 @
;
••@ A
objLocation
–– 
.
–– 
IsActive
–– $
=
––% &
entityLocation
––' 5
.
––5 6
IsActive
––6 >
;
––> ?
_repository
—— 
.
—— 
AddAsync
—— $
(
——$ %
objLocation
——% 0
)
——0 1
;
——1 2
await
 
_unitOfWork
 !
.
! "
SaveChangesAsync
" 2
(
2 3
)
3 4
;
4 5
}
™™ 
if
›› 
(
›› 
objLocation
›› 
.
›› 
Id
›› 
==
›› !
$num
››" #
)
››# $
return
 
DBOperation
 "
.
" #
Error
# (
;
( )
return
 
DBOperation
 
.
 
Success
 &
;
& '
}
 	
public
΅΅ 
async
΅΅ 
Task
΅΅ 
<
΅΅ 
DBOperation
΅΅ %
>
΅΅% &
Delete
΅΅' -
(
΅΅- .
int
΅΅. 1
id
΅΅2 4
,
΅΅4 5
int
΅΅6 9
?
΅΅9 :
by
΅΅; =
)
΅΅= >
{
ΆΆ 	
var
££ 
entityLocation
££ 
=
££  
_repository
££! ,
.
££, -
Get
££- 0
(
££0 1
x
££1 2
=>
££3 5
x
££6 7
.
££7 8
Id
££8 :
==
££; =
id
££> @
)
££@ A
;
££A B
entityLocation
¤¤ 
.
¤¤ 

ModifiedBy
¤¤ %
=
¤¤& '
by
¤¤( *
??
¤¤+ -
entityLocation
¤¤. <
.
¤¤< =

ModifiedBy
¤¤= G
;
¤¤G H
if
¦¦ 
(
¦¦ 
entityLocation
¦¦ 
==
¦¦ !
null
¦¦" &
)
¦¦& '
return
§§ 
DBOperation
§§ "
.
§§" #
NotFound
§§# +
;
§§+ ,
_repository
©© 
.
©© 
Remove
©© 
(
©© 
entityLocation
©© -
)
©©- .
;
©©. /
await
«« 
_unitOfWork
«« 
.
«« 
SaveChangesAsync
«« .
(
««. /
)
««/ 0
;
««0 1
return
­­ 
DBOperation
­­ 
.
­­ 
Success
­­ &
;
­­& '
}
®® 	
}
―― 
}°° Μ°
JD:\EltizamLive\Eltizam.Business.Core\Implementation\MasterModuleService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
Implementation  .
{ 
public 

class 
MasterModuleService $
:% & 
IMasterModuleService' ;
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IMapperFactory '
_mapperFactory( 6
;6 7
private 
readonly 
IMemoryCache %
_memoryCache& 2
;2 3
private 
IRepository 
< 
MasterModule (
>( )
_repository* 5
{6 7
get8 ;
;; <
set= @
;@ A
}B C
private 
IRepository 
< 
MasterSubModule +
>+ ,
_repositorySub- ;
{< =
get> A
;A B
setC F
;F G
}H I
private 
IRepository 
< &
MasterRoleModulePermission 6
>6 7%
_repositoryRolePermission8 Q
{R S
getT W
;W X
setY \
;\ ]
}^ _
public 
MasterModuleService "
(" #
IUnitOfWork# .

unitOfWork/ 9
,9 :
IMapperFactory; I
mapperFactoryJ W
,W X
IMemoryCacheY e
memoryCachef q
)q r
{ 	
_unitOfWork 
= 

unitOfWork $
;$ %
_mapperFactory 
= 
mapperFactory *
;* +
_memoryCache 
= 
memoryCache &
;& '
_repository 
= 
_unitOfWork %
.% &
GetRepository& 3
<3 4
MasterModule4 @
>@ A
(A B
)B C
;C D
_repositorySub   
=   
_unitOfWork   (
.  ( )
GetRepository  ) 6
<  6 7
MasterSubModule  7 F
>  F G
(  G H
)  H I
;  I J%
_repositoryRolePermission!! %
=!!& '
_unitOfWork!!( 3
.!!3 4
GetRepository!!4 A
<!!A B&
MasterRoleModulePermission!!B \
>!!\ ]
(!!] ^
)!!^ _
;!!_ `
}"" 	
public$$ 
async$$ 
Task$$ 
<$$ 
List$$ 
<$$ 
MasterModuleEntity$$ 1
>$$1 2
>$$2 3
GetAll$$4 :
($$: ;
)$$; <
{%% 	
var&& 
MasterModuleData&&  
=&&! "
_mapperFactory&&# 1
.&&1 2
GetList&&2 9
<&&9 :
MasterModule&&: F
,&&F G
MasterModuleEntity&&H Z
>&&Z [
(&&[ \
await&&\ a
_repository&&b m
.&&m n
GetAllAsync&&n y
(&&y z
)&&z {
)&&{ |
.&&| }
OrderBy	&&} „
(
&&„ …
x
&&… †
=>
&&‡ ‰
x
&& ‹
.
&&‹ 
	SortOrder
&& •
)
&&• –
.
&&– —
ToList
&&— 
(
&& 
)
&& 
;
&&  
var(( 
MasterSubModuleData(( #
=(($ %
_mapperFactory((& 4
.((4 5
GetList((5 <
<((< =
MasterSubModule((= L
,((L M!
MasterSubModuleEntity((N c
>((c d
(((d e
await((e j
_repositorySub((k y
.((y z
GetAllAsync	((z …
(
((… †
)
((† ‡
)
((‡ 
;
(( ‰
MasterModuleData** 
=** 
MasterModuleData** /
.**/ 0
Select**0 6
(**6 7
xx**7 9
=>**: <
{**= >
xx**? A
.**A B 
RoleModulePermission**B V
.**V W
ModuleId**W _
=**` a
xx**b d
.**d e
ModuleId**e m
;**m n
return**o u
xx**v x
;**x y
}**z {
)**{ |
.**| }
ToList	**} ƒ
(
**ƒ „
)
**„ …
;
**… †
MasterSubModuleData++ 
=++  !
MasterSubModuleData++" 5
.++5 6
Select++6 <
(++< =
xx++= ?
=>++@ B
{++C D
xx++E G
.++G H 
RoleModulePermission++H \
.++\ ]
ModuleId++] e
=++f g
xx++h j
.++j k
ModuleId++k s
;++s t
xx++u w
.++w x!
RoleModulePermission	++x 
.
++ 
SubModuleId
++ 
=
++™ 
xx
++› 
.
++ 
SubModuleId
++ ©
;
++© ª
return
++« ±
xx
++² ΄
;
++΄ µ
}
++¶ ·
)
++· Έ
.
++Έ Ή
ToList
++Ή Ώ
(
++Ώ ΐ
)
++ΐ Α
;
++Α Β
MasterModuleData-- 
=-- 
MasterModuleData-- /
.--/ 0
	GroupJoin--0 9
(--9 :
MasterSubModuleData--: M
,--M N
c.. 
=>..  
c..! "
..." #
ModuleId..# +
,..+ ,
o// 
=>//  
o//! "
.//" #
ModuleId//# +
,//+ ,
(00 
c00 
,00 
o00  !
)00! "
=>00# %
new00& )
MasterModuleEntity00* <
{11 

ModuleName22  *
=22+ ,
c22- .
.22. /

ModuleName22/ 9
,229 :
ModuleId33  (
=33) *
c33+ ,
.33, -
ModuleId33- 5
,335 6
CreatedDate44  +
=44, -
c44. /
.44/ 0
CreatedDate440 ;
,44; <
IsActive55  (
=55) *
c55+ ,
.55, -
IsActive55- 5
,555 6 
RoleModulePermission66  4
=665 6
c667 8
.668 9 
RoleModulePermission669 M
,66M N
MasterSubModules77  0
=771 2
o773 4
.774 5
ToList775 ;
(77; <
)77< =
}88 
)88 
.88 
ToList88 %
(88% &
)88& '
;88' (
return:: 
MasterModuleData:: #
;::# $
};; 	
public== 
async== 
Task== 
<== 
List== 
<== 
MasterModuleEntity== 1
>==1 2
>==2 3
GetByRoleId==4 ?
(==? @
int==@ C
roleId==D J
)==J K
{>> 	
var?? 
Permissions?? 
=?? 
_mapperFactory?? ,
.??, -
GetList??- 4
<??4 5&
MasterRoleModulePermission??5 O
,??O P&
RoleModulePermissionEntity??Q k
>??k l
(??l m
(??m n
List??n r
<??r s'
MasterRoleModulePermission	??s 
>
?? 
)
?? 
await
?? ”'
_repositoryRolePermission
??• ®
.
??® ―
FindAllAsync
??― »
(
??» Ό
xx
??Ό Ύ
=>
??Ώ Α
xx
??Β Δ
.
??Δ Ε
RoleId
??Ε Λ
==
??Μ Ξ
roleId
??Ο Υ
)
??Υ Φ
)
??Φ Χ
.
??Χ Ψ
OrderBy
??Ψ ί
(
??ί ΰ
x
??ΰ α
=>
??β δ
x
??ε ζ
.
??ζ η
	SortOrder
??η π
)
??π ρ
.
??ρ ς
ToList
??ς ψ
(
??ψ ω
)
??ω ϊ
;
??ϊ ϋ
if@@ 
(@@ 
Permissions@@ 
.@@ 
Any@@ 
(@@  
)@@  !
)@@! "
{AA 
varBB 
MasterModuleDataBB $
=BB% &
_mapperFactoryBB' 5
.BB5 6
GetListBB6 =
<BB= >
MasterModuleBB> J
,BBJ K
MasterModuleEntityBBL ^
>BB^ _
(BB_ `
awaitBB` e
_repositoryBBf q
.BBq r
GetAllAsyncBBr }
(BB} ~
)BB~ 
)	BB €
;
BB€ 
varDD 
MasterSubModuleDataDD '
=DD( )
_mapperFactoryDD* 8
.DD8 9
GetListDD9 @
<DD@ A
MasterSubModuleDDA P
,DDP Q!
MasterSubModuleEntityDDR g
>DDg h
(DDh i
awaitDDi n
_repositorySubDDo }
.DD} ~
GetAllAsync	DD~ ‰
(
DD‰ 
)
DD ‹
)
DD‹ 
;
DD 
MasterSubModuleDataEE #
=EE$ %
MasterSubModuleDataEE& 9
.EE9 :
	GroupJoinEE: C
(EEC D
PermissionsEED O
,EEO P
cFF( )
=>FF* ,
cFF- .
.FF. /
ModuleIdFF/ 7
,FF7 8
oFF9 :
=>FF; =
oFF> ?
.FF? @
ModuleIdFF@ H
,FFH I
(GG( )
cGG) *
,GG* +
oGG, -
)GG- .
=>GG/ 1
newGG2 5!
MasterSubModuleEntityGG6 K
{HH( )
CreatedDateII, 7
=II8 9
cII: ;
.II; <
CreatedDateII< G
,IIG H
IsActiveJJ, 4
=JJ5 6
cJJ7 8
.JJ8 9
IsActiveJJ9 A
,JJA B
ModuleIdKK, 4
=KK5 6
cKK7 8
.KK8 9
ModuleIdKK9 A
,KKA B
SubModuleIdLL, 7
=LL8 9
cLL: ;
.LL; <
SubModuleIdLL< G
,LLG H
SubModuleNameMM, 9
=MM: ;
cMM< =
.MM= >
SubModuleNameMM> K
,MMK L
ControlNameNN, 7
=NN8 9
stringNN: @
.NN@ A
IsNullOrEmptyNNA N
(NNN O
cNNO P
.NNP Q
ControlNameNNQ \
)NN\ ]
?NN^ _
$strNN` b
:NNc d
cNNe f
.NNf g
ControlNameNNg r
,NNr s 
RoleModulePermissionOO, @
=OOA B
oOOC D
.OOD E
FirstOrDefaultOOE S
(OOS T
xxOOT V
=>OOW Y
xxOOZ \
.OO\ ]
SubModuleIdOO] h
==OOi k
cOOl m
.OOm n
SubModuleIdOOn y
)OOy z
}PP( )
)PP) *
.PP* +
ToListPP+ 1
(PP1 2
)PP2 3
;PP3 4
foreachRR 
(RR 
varRR 
itemRR !
inRR" $
MasterSubModuleDataRR% 8
)RR8 9
{SS 
ifTT 
(TT 
itemTT 
.TT  
RoleModulePermissionTT 1
==TT2 4
nullTT5 9
)TT9 :
{UU 
varVV !
_roleModulepermissionVV 1
=VV2 3
newVV4 7&
RoleModulePermissionEntityVV8 R
(VVR S
)VVS T
;VVT U!
_roleModulepermissionWW -
.WW- .
AddWW. 1
=WW2 3
falseWW4 9
;WW9 :!
_roleModulepermissionXX -
.XX- .
DeleteXX. 4
=XX5 6
falseXX7 <
;XX< =!
_roleModulepermissionYY -
.YY- .
ViewYY. 2
=YY3 4
falseYY5 :
;YY: ;!
_roleModulepermissionZZ -
.ZZ- .
EditZZ. 2
=ZZ3 4
falseZZ5 :
;ZZ: ;!
_roleModulepermission[[ -
.[[- .
Approve[[. 5
=[[6 7
false[[8 =
;[[= >!
_roleModulepermission\\ -
.\\- .
RoleId\\. 4
=\\5 6
roleId\\7 =
;\\= >!
_roleModulepermission]] -
.]]- .
ModuleId]]. 6
=]]7 8
item]]9 =
.]]= >
ModuleId]]> F
;]]F G!
_roleModulepermission^^ -
.^^- .
SubModuleId^^. 9
=^^: ;
item^^< @
.^^@ A
SubModuleId^^A L
;^^L M
item`` 
.``  
RoleModulePermission`` 1
=``2 3!
_roleModulepermission``4 I
;``I J
}aa 
}bb 
MasterModuleDatacc  
=cc! "
MasterModuleDatacc# 3
.cc3 4
	GroupJoincc4 =
(cc= >
MasterSubModuleDatacc> Q
,ccQ R
cdd  
=>dd! #
cdd$ %
.dd% &
ModuleIddd& .
,dd. /
oee  
=>ee! #
oee$ %
.ee% &
ModuleIdee& .
,ee. /
(ff  
cff  !
,ff! "
off# $
)ff$ %
=>ff& (
newff) ,
MasterModuleEntityff- ?
{gg  

ModuleNamehh# -
=hh. /
chh0 1
.hh1 2

ModuleNamehh2 <
,hh< =
ModuleIdii# +
=ii, -
cii. /
.ii/ 0
ModuleIdii0 8
,ii8 9
CreatedDatejj# .
=jj/ 0
cjj1 2
.jj2 3
CreatedDatejj3 >
,jj> ?
IsActivekk# +
=kk, -
ckk. /
.kk/ 0
IsActivekk0 8
,kk8 9
	SortOrderll# ,
=ll- .
cll/ 0
.ll0 1
	SortOrderll1 :
,ll: ;
ControlNamemm# .
=mm/ 0
stringmm1 7
.mm7 8
IsNullOrEmptymm8 E
(mmE F
cmmF G
.mmG H
ControlNamemmH S
)mmS T
?mmU V
$strmmW Y
:mmZ [
cmm\ ]
.mm] ^
ControlNamemm^ i
,mmi j 
RoleModulePermissionnn# 7
=nn8 9
Permissionsnn: E
.nnE F
FirstOrDefaultnnF T
(nnT U
xxnnU W
=>nnX Z
xxnn[ ]
.nn] ^
ModuleIdnn^ f
==nng i
cnnj k
.nnk l
ModuleIdnnl t
&&nnu w
xxnnx z
.nnz {
SubModuleId	nn{ †
==
nn‡ ‰
$num
nn ‹
)
nn‹ 
,
nn 
MasterSubModulesoo# 3
=oo4 5
ooo6 7
.oo7 8
ToListoo8 >
(oo> ?
)oo? @
}pp  
)pp  !
.pp! "
ToListpp" (
(pp( )
)pp) *
;pp* +
foreachrr 
(rr 
varrr 
itemrr !
inrr" $
MasterModuleDatarr% 5
)rr5 6
{ss 
iftt 
(tt 
itemtt 
.tt  
RoleModulePermissiontt 1
==tt2 4
nulltt5 9
)tt9 :
{uu 
varvv !
_roleModulepermissionvv 1
=vv2 3
newvv4 7&
RoleModulePermissionEntityvv8 R
(vvR S
)vvS T
;vvT U!
_roleModulepermissionww -
.ww- .
Addww. 1
=ww2 3
falseww4 9
;ww9 :!
_roleModulepermissionxx -
.xx- .
Deletexx. 4
=xx5 6
falsexx7 <
;xx< =!
_roleModulepermissionyy -
.yy- .
Viewyy. 2
=yy3 4
falseyy5 :
;yy: ;!
_roleModulepermissionzz -
.zz- .
Editzz. 2
=zz3 4
falsezz5 :
;zz: ;!
_roleModulepermission{{ -
.{{- .
Approve{{. 5
={{6 7
false{{8 =
;{{= >!
_roleModulepermission|| -
.||- .
RoleId||. 4
=||5 6
roleId||7 =
;||= >!
_roleModulepermission}} -
.}}- .
ModuleId}}. 6
=}}7 8
item}}9 =
.}}= >
ModuleId}}> F
;}}F G
item~~ 
.~~  
RoleModulePermission~~ 1
=~~2 3!
_roleModulepermission~~4 I
;~~I J
} 
}
€€ 
return
 
MasterModuleData
 '
;
' (
}
‚‚ 
else
ƒƒ 
{
„„ 
return
…… 
await
…… 
GetAll
…… #
(
……# $
)
……$ %
;
……% &
}
†† 
}
‡‡ 	
public
‰‰ 
async
‰‰ 
Task
‰‰ 
<
‰‰ 
IEnumerable
‰‰ %
<
‰‰% &!
RolePermissionModel
‰‰& 9
>
‰‰9 :
>
‰‰: ;+
GetByPermisionRoleUsingRoleId
‰‰< Y
(
‰‰Y Z
int
‰‰Z ]
roleId
‰‰^ d
)
‰‰d e
{
 	
var
‹‹ 
menu
‹‹ 
=
‹‹ 
AppConstants
‹‹ #
.
‹‹# $

MenusCache
‹‹$ .
+
‹‹/ 0
roleId
‹‹1 7
.
‹‹7 8
ToString
‹‹8 @
(
‹‹@ A
)
‹‹A B
;
‹‹B C
var
 
	cacheData
 
=
 
_memoryCache
 (
.
( )
Get
) ,
<
, -
IEnumerable
- 8
<
8 9!
RolePermissionModel
9 L
>
L M
>
M N
(
N O
menu
O S
)
S T
;
T U
if
 
(
 
	cacheData
 
!=
 
null
 !
)
! "
{
 
return
‘‘ 
	cacheData
‘‘  
;
‘‘  !
}
’’ 
var
”” 
per
”” 
=
”” 
await
”” '
_repositoryRolePermission
”” 5
.
””5 6
FindAllAsync
””6 B
(
””B C
xx
””C E
=>
””F H
xx
””I K
.
””K L
RoleId
””L R
==
””S U
roleId
””V \
)
””\ ]
;
””] ^
var
–– 
Permissions
–– 
=
–– 
_mapperFactory
–– ,
.
––, -
GetList
––- 4
<
––4 5(
MasterRoleModulePermission
––5 O
,
––O P(
RoleModulePermissionEntity
––Q k
>
––k l
(
––l m
(
––m n
List
––n r
<
––r s)
MasterRoleModulePermission––s 
>–– 
)–– 
per–– ’
)––’ “
;––“ ”
if
 
(
 
Permissions
 
.
 
Any
 
(
  
)
  !
)
! "
{
™™ 
var
 
MasterModuleData
 $
=
% &
_mapperFactory
' 5
.
5 6
GetList
6 =
<
= >
MasterModule
> J
,
J K 
MasterModuleEntity
L ^
>
^ _
(
_ `
await
` e
_repository
f q
.
q r
GetAllAsync
r }
(
} ~
)
~ 
) €
;€ 
var
 !
MasterSubModuleData
 '
=
( )
_mapperFactory
* 8
.
8 9
GetList
9 @
<
@ A
MasterSubModule
A P
,
P Q#
MasterSubModuleEntity
R g
>
g h
(
h i
await
i n
_repositorySub
o }
.
} ~
GetAllAsync~ ‰
(‰ 
) ‹
)‹ 
; 
var
 
menuperm
 
=
 
(
  
from
  $
p
% &
in
' )
Permissions
* 5
join
  $
m
% &
in
' )
MasterModuleData
* :
on
; =
p
> ?
.
? @
ModuleId
@ H
equals
I O
m
P Q
.
Q R
ModuleId
R Z
join
    $
s
  % &
in
  ' )!
MasterSubModuleData
  * =
on
  > @
p
  A B
.
  B C
SubModuleId
  C N
equals
  O U
s
  V W
.
  W X
SubModuleId
  X c
into
΅΅  $
SubMS
΅΅% *
from
ΆΆ  $
SubM
ΆΆ% )
in
ΆΆ* ,
SubMS
ΆΆ- 2
.
ΆΆ2 3
DefaultIfEmpty
ΆΆ3 A
(
ΆΆA B
)
ΆΆB C
where
££  %
m
££& '
.
££' (
IsActive
££( 0
==
££1 3
true
££4 8
select
¤¤  &
new
¤¤' *!
RolePermissionModel
¤¤+ >
(
¤¤> ?
)
¤¤? @
{
¥¥  !
RoleModuleId
¦¦$ 0
=
¦¦1 2
p
¦¦3 4
.
¦¦4 5
RoleModuleId
¦¦5 A
,
¦¦A B
RoleId
§§$ *
=
§§+ ,
p
§§- .
.
§§. /
RoleId
§§/ 5
,
§§5 6
ModuleId
¨¨$ ,
=
¨¨- .
p
¨¨/ 0
.
¨¨0 1
ModuleId
¨¨1 9
,
¨¨9 :
SubModuleId
©©$ /
=
©©0 1
p
©©2 3
.
©©3 4
SubModuleId
©©4 ?
,
©©? @
Add
ªª$ '
=
ªª( )
p
ªª* +
.
ªª+ ,
Add
ªª, /
,
ªª/ 0
View
««$ (
=
««) *
p
««+ ,
.
««, -
View
««- 1
,
««1 2
Edit
¬¬$ (
=
¬¬) *
p
¬¬+ ,
.
¬¬, -
Edit
¬¬- 1
,
¬¬1 2
Delete
­­$ *
=
­­+ ,
p
­­- .
.
­­. /
Delete
­­/ 5
,
­­5 6
Approve
®®$ +
=
®®, -
p
®®. /
.
®®/ 0
Approve
®®0 7
,
®®7 8
ControlName
――$ /
=
――0 1
m
――2 3
.
――3 4
ControlName
――4 ?
,
――? @

ModuleName
°°$ .
=
°°/ 0
m
°°1 2
.
°°2 3

ModuleName
°°3 =
,
°°= >
Icon
±±$ (
=
±±) *
m
±±+ ,
.
±±, -
Icon
±±- 1
,
±±1 2
	HoverIcon
²²$ -
=
²². /
m
²²0 1
.
²²1 2
	HoverIcon
²²2 ;
,
²²; <
ViewName
³³$ ,
=
³³- .
m
³³/ 0
.
³³0 1
ViewName
³³1 9
,
³³9 :
Sort
΄΄$ (
=
΄΄) *
m
΄΄+ ,
.
΄΄, -
	SortOrder
΄΄- 6
}
µµ  !
)
µµ! "
.
µµ" #
ToList
µµ# )
(
µµ) *
)
µµ* +
;
µµ+ ,
var
ΈΈ 
expirationTime
ΈΈ "
=
ΈΈ# $
DateTimeOffset
ΈΈ% 3
.
ΈΈ3 4
Now
ΈΈ4 7
.
ΈΈ7 8

AddMinutes
ΈΈ8 B
(
ΈΈB C
$num
ΈΈC G
)
ΈΈG H
;
ΈΈH I
_memoryCache
ΉΉ 
.
ΉΉ 
Set
ΉΉ  
(
ΉΉ  !
menu
ΉΉ! %
,
ΉΉ% &
menuperm
ΉΉ' /
,
ΉΉ/ 0
expirationTime
ΉΉ1 ?
)
ΉΉ? @
;
ΉΉ@ A
return
»» 
menuperm
»» 
;
»»  
}
ΌΌ 
else
½½ 
{
ΎΎ 
return
ΏΏ 
null
ΏΏ 
;
ΏΏ 
}
ΐΐ 
}
ΑΑ 	
}
ΒΒ 
}ΓΓ γΨ
PD:\EltizamLive\Eltizam.Business.Core\Implementation\MasterNotificationService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
Implementation  .
{ 
public 

class %
MasterNotificationService *
:+ ,&
IMasterNotificationService- G
{ 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IMapperFactory '
_mapperFactory( 6
;6 7
private 
IRepository 
< 
MasterNotification .
>. /
_repository0 ;
{< =
get> A
;A B
setC F
;F G
}H I
private 
IRepository 
< 
ValuationRequest ,
>, - 
_valuationrepository. B
{C D
getE H
;H I
setJ M
;M N
}O P
private 
IRepository 
< !
MasterValuationStatus 1
>1 2
_statusrepository3 D
{E F
getG J
;J K
setL O
;O P
}Q R
private 
IRepository 
< 

MasterUser &
>& '
_userrepository( 7
{8 9
get: =
;= >
set? B
;B C
}D E
private 
readonly 
IMemoryCache %
_memoryCache& 2
;2 3
public %
MasterNotificationService (
(( )
IUnitOfWork) 4

unitOfWork5 ?
,? @
IConfigurationA O
configurationP ]
,] ^
IMapperFactory_ m
mapperFactoryn {
,{ |
IMemoryCache	} ‰
memoryCache
 •
)
• –
{   	
_unitOfWork!! 
=!! 

unitOfWork!! $
;!!$ %
_repository"" 
="" 
_unitOfWork"" %
.""% &
GetRepository""& 3
<""3 4
MasterNotification""4 F
>""F G
(""G H
)""H I
;""I J
_configuration## 
=## 
configuration## *
;##* +
_mapperFactory$$ 
=$$ 
mapperFactory$$ *
;$$* + 
_valuationrepository%%  
=%%! "
_unitOfWork%%# .
.%%. /
GetRepository%%/ <
<%%< =
ValuationRequest%%= M
>%%M N
(%%N O
)%%O P
;%%P Q
_statusrepository&& 
=&& 
_unitOfWork&&  +
.&&+ ,
GetRepository&&, 9
<&&9 :!
MasterValuationStatus&&: O
>&&O P
(&&P Q
)&&Q R
;&&R S
_userrepository'' 
='' 
_unitOfWork'' )
.'') *
GetRepository''* 7
<''7 8

MasterUser''8 B
>''B C
(''C D
)''D E
;''E F
_memoryCache(( 
=(( 
memoryCache(( &
;((& '
})) 	
public22 
async22 
Task22 
<22 
DBOperation22 %
>22% &
	SendEmail22' 0
(220 1!
SendNotificationModel221 F
request22G N
)22N O
{33 	
try44 
{55 
request66 
.66 
Body66 
=66 
request66 &
.66& '
Body66' +
?66+ ,
.66, -
Replace66- 4
(664 5
$str665 C
,66C D
request66E L
.66L M
ValRefNo66M U
)66U V
.66V W
Replace66W ^
(66^ _
$str66_ k
,66k l
request66m t
.66t u
Client66u {
)66{ |
.66| }
Replace	66} „
(
66„ …
$str
66… “
,
66“ ”
request
66• 
.
66 
Property
66 ¥
)
66¥ ¦
.77, -
Replace77- 4
(774 5
$str775 C
,77C D
request77E L
.77L M
Location77M U
)77U V
.77V W
Replace77W ^
(77^ _
$str77_ k
,77k l
request77m t
.77t u
Status77u {
)77{ |
.77| }
Replace	77} „
(
77„ …
$str
77… 
,
77 
request
77 –
.
77– —
ValId
77— 
.
77 
ToString
77 ¥
(
77¥ ¦
)
77¦ §
)
77§ ¨
;
77¨ ©
var99 
message99 
=99 
new99 !
MimeMessage99" -
(99- .
)99. /
;99/ 0
message:: 
.:: 
From:: 
.:: 
Add::  
(::  !
MailboxAddress::! /
.::/ 0
Parse::0 5
(::5 6
_configuration::6 D
.::D E

GetSection::E O
(::O P
$str::P g
)::g h
.::h i
Value::i n
)::n o
)::o p
;::p q
var== 
Em== 
=== 
request==  
.==  !
ToEmailList==! ,
;==, -
if>> 
(>> 
Em>> 
.>> 
Contains>> 
(>>  
$char>>  #
)>># $
)>>$ %
{?? 
foreach@@ 
(@@ 
var@@  
mail@@! %
in@@& (
Em@@) +
.@@+ ,
Split@@, 1
(@@1 2
$char@@2 5
)@@5 6
)@@6 7
messageAA 
.AA  
ToAA  "
.AA" #
AddAA# &
(AA& '
MailboxAddressAA' 5
.AA5 6
ParseAA6 ;
(AA; <
mailAA< @
.AA@ A
TrimAAA E
(AAE F
)AAF G
)AAG H
)AAH I
;AAI J
}BB 
elseCC 
messageDD 
.DD 
ToDD 
.DD 
AddDD "
(DD" #
MailboxAddressDD# 1
.DD1 2
ParseDD2 7
(DD7 8
EmDD8 :
)DD: ;
)DD; <
;DD< =
messageGG 
.GG 
SubjectGG 
=GG  !
_configurationGG" 0
.GG0 1

GetSectionGG1 ;
(GG; <
$strGG< Q
)GGQ R
.GGR S
ValueGGS X
+GGY Z
$strGG[ ^
+GG_ `
requestGGa h
.GGh i
SubjectGGi p
;GGp q
messageHH 
.HH 
BodyHH 
=HH 
newHH "
TextPartHH# +
(HH+ ,

TextFormatHH, 6
.HH6 7
HtmlHH7 ;
)HH; <
{HH= >
TextHH? C
=HHD E
requestHHF M
.HHM N
BodyHHN R
}HHS T
;HHT U
usingJJ 
varJJ 
smtpJJ 
=JJ  
newJJ! $

SmtpClientJJ% /
(JJ/ 0
)JJ0 1
;JJ1 2
smtpKK 
.KK 
ConnectKK 
(KK 
_configurationKK +
.KK+ ,

GetSectionKK, 6
(KK6 7
$strKK7 I
)KKI J
.KKJ K
ValueKKK P
,KKP Q
$numKKR U
,KKU V
MailKitKKW ^
.KK^ _
SecurityKK_ g
.KKg h
SecureSocketOptionsKKh {
.KK{ |
StartTls	KK| „
)
KK„ …
;
KK… †
smtpLL 
.LL 
AuthenticateLL !
(LL! "
_configurationLL" 0
.LL0 1

GetSectionLL1 ;
(LL; <
$strLL< R
)LLR S
.LLS T
ValueLLT Y
,LLY Z
_configurationMM "
.MM" #

GetSectionMM# -
(MM- .
$strMM. D
)MMD E
.MME F
ValueMMF K
)MMK L
;MML M
smtpPP 
.PP 
SendPP 
(PP 
messagePP !
)PP! "
;PP" #
smtpQQ 
.QQ 

DisconnectQQ 
(QQ  
trueQQ  $
)QQ$ %
;QQ% &
varTT 
notificationTT  
=TT! "
newTT# &
MasterNotificationTT' 9
{UU 
ValuationRequestIdVV &
=VV' (
requestVV) 0
.VV0 1
ValIdVV1 6
,VV6 7
StatusIdWW 
=WW 
requestWW &
.WW& '
StatusIdWW' /
,WW/ 0
SubjectXX 
=XX 
requestXX %
.XX% &
SubjectXX& -
,XX- .
ToEmailsYY 
=YY 
requestYY &
.YY& '
ToEmailListYY' 2
,YY2 3
BodyZZ 
=ZZ 
requestZZ "
.ZZ" #
BodyZZ# '
,ZZ' (
SentDatetime[[  
=[[! "
DateTime[[# +
.[[+ ,
Now[[, /
,[[/ 0
IsEmailSent\\ 
=\\  !
true\\" &
,\\& '
	CreatedBy]] 
=]] 
$num]]  !
,]]! "
CreatedDate^^ 
=^^  !
DateTime^^" *
.^^* +
Now^^+ .
,^^. /
ReadBy__ 
=__ 
$num__ 
,__ 
ReadDate`` 
=`` 
null`` #
,``# $
}aa 
;aa 
_repositorycc 
.cc 
AddAsynccc $
(cc$ %
notificationcc% 1
)cc1 2
;cc2 3
awaitdd 
_unitOfWorkdd !
.dd! "
SaveChangesAsyncdd" 2
(dd2 3
)dd3 4
;dd4 5
}ee 
catchff 
(ff 
	Exceptionff 
exff 
)ff  
{gg 
}ii 
finallyjj 
{kk 
_memoryCachell 
.ll 
Removell #
(ll# $
AppConstantsll$ 0
.ll0 1
NotificationsCachell1 C
)llC D
;llD E
}nn 
returnpp 
DBOperationpp 
.pp 
Successpp &
;pp& '
}qq 	
publicss 
asyncss 
Taskss 
<ss 
DBOperationss %
>ss% &

SendEmail2ss' 1
(ss1 2!
SendNotificationModelss2 G
requestssH O
)ssO P
{tt 	
tryuu 
{vv 
varww 
messageww 
=ww 
newww !
MimeMessageww" -
(ww- .
)ww. /
;ww/ 0
messagexx 
.xx 
Fromxx 
.xx 
Addxx  
(xx  !
MailboxAddressxx! /
.xx/ 0
Parsexx0 5
(xx5 6
_configurationxx6 D
.xxD E

GetSectionxxE O
(xxO P
$strxxP g
)xxg h
.xxh i
Valuexxi n
)xxn o
)xxo p
;xxp q
var{{ 
Em{{ 
={{ 
request{{  
.{{  !
ToEmailList{{! ,
;{{, -
if|| 
(|| 
Em|| 
.|| 
Contains|| 
(||  
$char||  #
)||# $
)||$ %
{}} 
foreach~~ 
(~~ 
var~~  
mail~~! %
in~~& (
Em~~) +
.~~+ ,
Split~~, 1
(~~1 2
$char~~2 5
)~~5 6
)~~6 7
message 
.  
To  "
." #
Add# &
(& '
MailboxAddress' 5
.5 6
Parse6 ;
(; <
mail< @
.@ A
TrimA E
(E F
)F G
)G H
)H I
;I J
}
€€ 
else
 
message
‚‚ 
.
‚‚ 
To
‚‚ 
.
‚‚ 
Add
‚‚ "
(
‚‚" #
MailboxAddress
‚‚# 1
.
‚‚1 2
Parse
‚‚2 7
(
‚‚7 8
Em
‚‚8 :
)
‚‚: ;
)
‚‚; <
;
‚‚< =
message
…… 
.
…… 
Subject
…… 
=
……  !
_configuration
……" 0
.
……0 1

GetSection
……1 ;
(
……; <
$str
……< Q
)
……Q R
.
……R S
Value
……S X
+
……Y Z
$str
……[ ^
+
……_ `
request
……a h
.
……h i
Subject
……i p
;
……p q
message
†† 
.
†† 
Body
†† 
=
†† 
new
†† "
TextPart
††# +
(
††+ ,

TextFormat
††, 6
.
††6 7
Html
††7 ;
)
††; <
{
††= >
Text
††? C
=
††D E
request
††F M
.
††M N
Body
††N R
}
††S T
;
††T U
using
 
var
 
smtp
 
=
  
new
! $

SmtpClient
% /
(
/ 0
)
0 1
;
1 2
smtp
‰‰ 
.
‰‰ 
Connect
‰‰ 
(
‰‰ 
_configuration
‰‰ +
.
‰‰+ ,

GetSection
‰‰, 6
(
‰‰6 7
$str
‰‰7 I
)
‰‰I J
.
‰‰J K
Value
‰‰K P
,
‰‰P Q
$num
‰‰R U
,
‰‰U V
MailKit
‰‰W ^
.
‰‰^ _
Security
‰‰_ g
.
‰‰g h!
SecureSocketOptions
‰‰h {
.
‰‰{ |
StartTls‰‰| „
)‰‰„ …
;‰‰… †
smtp
 
.
 
Authenticate
 !
(
! "
_configuration
" 0
.
0 1

GetSection
1 ;
(
; <
$str
< R
)
R S
.
S T
Value
T Y
,
Y Z
_configuration
‹‹ "
.
‹‹" #

GetSection
‹‹# -
(
‹‹- .
$str
‹‹. D
)
‹‹D E
.
‹‹E F
Value
‹‹F K
)
‹‹K L
;
‹‹L M
smtp
 
.
 
Send
 
(
 
message
 !
)
! "
;
" #
smtp
 
.
 

Disconnect
 
(
  
true
  $
)
$ %
;
% &
}
 
catch
‘‘ 
(
‘‘ 
	Exception
‘‘ 
ex
‘‘ 
)
‘‘  
{
’’ 
}
”” 
finally
•• 
{
–– 
_memoryCache
—— 
.
—— 
Remove
—— #
(
——# $
AppConstants
——$ 0
.
——0 1 
NotificationsCache
——1 C
)
——C D
;
——D E
}
 
return
 
DBOperation
 
.
 
Success
 &
;
& '
}
›› 	
public
 #
SendNotificationModel
 $*
GetValuationNotificationData
% A
(
A B!
RecepientActionEnum
B U
subjectEnum
V a
,
a b
int
c f!
valiadtionRequestId
g z
)
z {
{
 	
DbParameter
 
[
 
]
 
osqlParameter
 '
=
( )
{
   
new
΅΅ 
DbParameter
΅΅ 
(
΅΅  
$str
΅΅  (
,
΅΅( )
subjectEnum
΅΅* 5
,
΅΅5 6
	SqlDbType
΅΅7 @
.
΅΅@ A
Int
΅΅A D
)
΅΅D E
,
΅΅E F
new
ΆΆ 
DbParameter
ΆΆ 
(
ΆΆ  
$str
ΆΆ  '
,
ΆΆ' (!
valiadtionRequestId
ΆΆ* =
,
ΆΆ= >
	SqlDbType
ΆΆ? H
.
ΆΆH I
Int
ΆΆI L
)
ΆΆL M
,
ΆΆM N
}
££ 
;
££ 
var
¥¥ 
result
¥¥ 
=
¥¥ 
EltizamDBHelper
¥¥ (
.
¥¥( )!
ExecuteMappedReader
¥¥) <
<
¥¥< =#
SendNotificationModel
¥¥= R
>
¥¥R S
(
¥¥S T 
ProcedureMetastore
¥¥T f
.
¥¥f g7
(usp_ValuationRequest_GetNotificationData¥¥g 
,¥¥  
DatabaseConnection
¦¦ +
.
¦¦+ ,

ConnString
¦¦, 6
,
¦¦6 7
System
¦¦8 >
.
¦¦> ?
Data
¦¦? C
.
¦¦C D
CommandType
¦¦D O
.
¦¦O P
StoredProcedure
¦¦P _
,
¦¦_ `
osqlParameter
¦¦a n
)
¦¦n o
.
¦¦o p
FirstOrDefault
¦¦p ~
(
¦¦~ 
)¦¦ €
;¦¦€ 
return
¨¨ 
result
¨¨ 
;
¨¨ 
}
©© 	
public
«« 
List
«« 
<
«« '
MasterNotificationEntitty
«« -
>
««- .
GetAll
««/ 5
(
««5 6
int
««6 9
userId
««: @
,
««@ A
int
««B E
?
««E F
valId
««G L
,
««L M
int
««N Q
?
««Q R
pagenum
««S Z
)
««Z [
{
¬¬ 	
int
­­ 
count
­­ 
=
­­ 
$num
­­ 
;
­­ 
var
®® 
finalResult
®® 
=
®® '
InitiateNotificationCache
®® 7
(
®®7 8
userId
®®8 >
,
®®> ?
valId
®®@ E
,
®®E F
pagenum
®®G N
,
®®N O
out
®®P S
count
®®T Y
)
®®Y Z
;
®®Z [
return
ΟΟ 
finalResult
ΟΟ 
;
ΟΟ 
}
ΠΠ 	
public
ΣΣ 
int
ΣΣ 
GetAllCount
ΣΣ 
(
ΣΣ 
int
ΣΣ "
userId
ΣΣ# )
,
ΣΣ) *
int
ΣΣ+ .
?
ΣΣ. /
valId
ΣΣ0 5
)
ΣΣ5 6
{
ΤΤ 	
int
ΥΥ 
count
ΥΥ 
=
ΥΥ 
$num
ΥΥ 
;
ΥΥ '
InitiateNotificationCache
ΦΦ %
(
ΦΦ% &
userId
ΦΦ& ,
,
ΦΦ, -
valId
ΦΦ. 3
,
ΦΦ3 4
null
ΦΦ5 9
,
ΦΦ9 :
out
ΦΦ; >
count
ΦΦ? D
)
ΦΦD E
;
ΦΦE F
return
ΨΨ 
count
ΨΨ 
;
ΨΨ 
}
ΩΩ 	
public
ΰΰ 
List
ΰΰ 
<
ΰΰ '
MasterNotificationEntitty
ΰΰ -
>
ΰΰ- .'
InitiateNotificationCache
ΰΰ/ H
(
ΰΰH I
int
ΰΰI L
userId
ΰΰM S
,
ΰΰS T
int
ΰΰU X
?
ΰΰX Y
valId
ΰΰZ _
,
ΰΰ_ `
int
ΰΰa d
?
ΰΰd e
pagenum
ΰΰf m
,
ΰΰm n
out
ΰΰo r
int
ΰΰs v
count
ΰΰw |
)
ΰΰ| }
{
αα 	
var
 
finalResult
 
=
 
new
 !
List
" &
<
& ''
MasterNotificationEntitty
' @
>
@ A
(
A B
)
B C
;
C D
bool
‚‚ 
IsCount
‚‚ 
=
‚‚ 
pagenum
‚‚ "
==
‚‚# %
null
‚‚& *
;
‚‚* +
DbParameter
„„ 
[
„„ 
]
„„ 
prm
„„ 
=
„„ 
{
…… 
new
†† 
DbParameter
†† 
(
††  
AppConstants
††  ,
.
††, -
LogInUserId
††- 8
,
††8 9
userId
††: @
,
††@ A
	SqlDbType
††B K
.
††K L
Int
††L O
)
††O P
,
††P Q
new
‡‡ 
DbParameter
‡‡ 
(
‡‡  
$str
‡‡  *
,
‡‡* +
valId
‡‡: ?
,
‡‡? @
	SqlDbType
‡‡B K
.
‡‡K L
Int
‡‡L O
)
‡‡O P
,
‡‡P Q
new
 
DbParameter
 
(
  
$str
  )
,
) *
IsCount
: A
,
A B
	SqlDbType
C L
.
L M
Bit
M P
)
P Q
,
Q R
new
‰‰ 
DbParameter
‰‰ 
(
‰‰  
$str
‰‰  )
,
‰‰) *
pagenum
‰‰: A
,
‰‰A B
	SqlDbType
‰‰C L
.
‰‰L M
Int
‰‰M P
)
‰‰P Q
}
 
;
 
if
 
(
 
IsCount
 
==
 
true
 
)
  
{
 
var
 
cnt
 
=
 
EltizamDBHelper
 )
.
) *!
ExecuteMappedReader
* =
<
= >
NotificationCount
> O
>
O P
(
P Q 
ProcedureMetastore
Q c
.
c d-
usp_MasterNotification_AllListd ‚
,‚ ƒ 
DatabaseConnection
" 4
.
4 5

ConnString
5 ?
,
? @
CommandType
A L
.
L M
StoredProcedure
M \
,
\ ]
prm
^ a
)
a b
;
b c
count
 
=
 
cnt
 
[
 
$num
 
]
 
.
 
TotalRecords
 +
;
+ ,
return
‘‘ 
finalResult
‘‘ "
;
‘‘" #
}
’’ 
else
““ 
{
”” 
finalResult
΅΅ 
=
΅΅ 
EltizamDBHelper
΅΅ -
.
΅΅- .!
ExecuteMappedReader
΅΅. A
<
΅΅A B'
MasterNotificationEntitty
΅΅B [
>
΅΅[ \
(
΅΅\ ] 
ProcedureMetastore
΅΅] o
.
΅΅o p-
usp_MasterNotification_AllList΅΅p 
,΅΅  
DatabaseConnection
ΆΆ 0
.
ΆΆ0 1

ConnString
ΆΆ1 ;
,
ΆΆ; <
CommandType
ΆΆ= H
.
ΆΆH I
StoredProcedure
ΆΆI X
,
ΆΆX Y
prm
ΆΆZ ]
)
ΆΆ] ^
;
ΆΆ^ _
count
¤¤ 
=
¤¤ 
finalResult
¤¤ #
.
¤¤# $
Count
¤¤$ )
;
¤¤) *
return
¥¥ 
finalResult
¥¥ "
;
¥¥" #
}
¦¦ 
}
§§ 	
public
ªª 
async
ªª 
Task
ªª 
<
ªª 
DBOperation
ªª %
>
ªª% & 
UpdateNotification
ªª' 9
(
ªª9 :
int
ªª: =
notificationid
ªª> L
,
ªªL M
int
ªªN Q
readBy
ªªR X
)
ªªX Y
{
«« 	
var
¬¬ 
tobeupdateddata
¬¬ 
=
¬¬  !
_repository
¬¬" -
.
¬¬- .
Get
¬¬. 1
(
¬¬1 2
notificationid
¬¬2 @
)
¬¬@ A
;
¬¬A B
if
­­ 
(
­­ 
tobeupdateddata
­­ 
!=
­­  "
null
­­# '
)
­­' (
{
®® 
tobeupdateddata
―― 
.
――  
ReadBy
――  &
=
――' (
readBy
――) /
;
――/ 0
tobeupdateddata
°° 
.
°°  
ReadDate
°°  (
=
°°) *
DateTime
°°+ 3
.
°°3 4
Now
°°4 7
.
°°7 8
Date
°°8 <
;
°°< =
_repository
±± 
.
±± 
UpdateAsync
±± '
(
±±' (
tobeupdateddata
±±( 7
)
±±7 8
;
±±8 9
await
²² 
_unitOfWork
²² !
.
²²! "
SaveChangesAsync
²²" 2
(
²²2 3
)
²²3 4
;
²²4 5
}
³³ 
return
µµ 
DBOperation
µµ 
.
µµ 
Success
µµ &
;
µµ& '
}
¶¶ 	
public
ΉΉ 
async
ΉΉ 
void
ΉΉ *
UpdateValuationRequestStatus
ΉΉ 6
(
ΉΉ6 7
int
ΉΉ7 :
newStatusId
ΉΉ; F
,
ΉΉF G
int
ΉΉH K
id
ΉΉL N
)
ΉΉN O
{
ΊΊ 	
try
»» 
{
ΌΌ 
ValuationRequest
½½  
result
½½! '
=
½½( )
null
½½* .
;
½½. /
if
ΏΏ 
(
ΏΏ 
newStatusId
ΏΏ 
>
ΏΏ  !
$num
ΏΏ" #
)
ΏΏ# $
{
ΐΐ 
result
ΑΑ 
=
ΑΑ "
_valuationrepository
ΑΑ 1
.
ΑΑ1 2
Get
ΑΑ2 5
(
ΑΑ5 6
id
ΑΑ6 8
)
ΑΑ8 9
;
ΑΑ9 :
result
ΒΒ 
.
ΒΒ 
StatusId
ΒΒ #
=
ΒΒ$ %
newStatusId
ΒΒ& 1
;
ΒΒ1 2"
_valuationrepository
ΓΓ (
.
ΓΓ( )
UpdateAsync
ΓΓ) 4
(
ΓΓ4 5
result
ΓΓ5 ;
)
ΓΓ; <
;
ΓΓ< =
await
ΔΔ 
_unitOfWork
ΔΔ %
.
ΔΔ% &
SaveChangesAsync
ΔΔ& 6
(
ΔΔ6 7
)
ΔΔ7 8
;
ΔΔ8 9
await
ΕΕ !
SenddDetailsToEmail
ΕΕ -
(
ΕΕ- .!
RecepientActionEnum
ΕΕ. A
.
ΕΕA B$
ValuationStatusChanged
ΕΕB X
,
ΕΕX Y
id
ΕΕZ \
)
ΕΕ\ ]
;
ΕΕ] ^
}
ΖΖ 
}
ΗΗ 
catch
ΘΘ 
(
ΘΘ 
	Exception
ΘΘ 
ex
ΘΘ 
)
ΘΘ  
{
ΙΙ 
throw
ΚΚ 
ex
ΚΚ 
;
ΚΚ 
}
ΛΛ 
}
ΜΜ 	
public
ΝΝ 
async
ΝΝ 
Task
ΝΝ 
<
ΝΝ 
bool
ΝΝ 
>
ΝΝ !
SenddDetailsToEmail
ΝΝ  3
(
ΝΝ3 4!
RecepientActionEnum
ΝΝ4 G
subjectEnum
ΝΝH S
,
ΝΝS T
int
ΝΝU X 
valuationrequestId
ΝΝY k
)
ΝΝk l
{
ΞΞ 	
try
ΟΟ 
{
ΠΠ 
var
ΡΡ 
notificationModel
ΡΡ %
=
ΡΡ& '*
GetValuationNotificationData
ΡΡ( D
(
ΡΡD E
subjectEnum
ΡΡE P
,
ΡΡP Q 
valuationrequestId
ΡΡR d
)
ΡΡd e
;
ΡΡe f
string
ΣΣ 
strHtml
ΣΣ 
=
ΣΣ  
File
ΣΣ! %
.
ΣΣ% &
ReadAllText
ΣΣ& 1
(
ΣΣ1 2
$str
ΣΣ2 u
)
ΣΣu v
;
ΣΣv w
if
ΤΤ 
(
ΤΤ 
subjectEnum
ΤΤ 
==
ΤΤ  "!
RecepientActionEnum
ΤΤ# 6
.
ΤΤ6 7
ValuationCreated
ΤΤ7 G
)
ΤΤG H
{
ΥΥ 
strHtml
ΦΦ 
=
ΦΦ 
File
ΦΦ "
.
ΦΦ" #
ReadAllText
ΦΦ# .
(
ΦΦ. /
$str
ΦΦ/ m
)
ΦΦm n
;
ΦΦn o
}
ΧΧ 
strHtml
ΨΨ 
=
ΨΨ 
strHtml
ΨΨ !
.
ΨΨ! "
Replace
ΨΨ" )
(
ΨΨ) *
$str
ΨΨ* 8
,
ΨΨ8 9
notificationModel
ΨΨ: K
.
ΨΨK L
ValRefNo
ΨΨL T
)
ΨΨT U
;
ΨΨU V
strHtml
ΩΩ 
=
ΩΩ 
strHtml
ΩΩ !
.
ΩΩ! "
Replace
ΩΩ" )
(
ΩΩ) *
$str
ΩΩ* 4
,
ΩΩ4 5
DateTime
ΩΩ6 >
.
ΩΩ> ?
Now
ΩΩ? B
.
ΩΩB C
ToString
ΩΩC K
(
ΩΩK L
$str
ΩΩL Y
)
ΩΩY Z
)
ΩΩZ [
;
ΩΩ[ \
strHtml
ΪΪ 
=
ΪΪ 
strHtml
ΪΪ !
.
ΪΪ! "
Replace
ΪΪ" )
(
ΪΪ) *
$str
ΪΪ* 9
,
ΪΪ9 :
notificationModel
ΪΪ; L
.
ΪΪL M
Status
ΪΪM S
)
ΪΪS T
;
ΪΪT U
notificationModel
άά !
.
άά! "
Subject
άά" )
=
άά* +

EnumHelper
άά, 6
.
άά6 7
GetDescription
άά7 E
(
άάE F
subjectEnum
άάF Q
)
άάQ R
;
άάR S
notificationModel
έέ !
.
έέ! "
Body
έέ" &
=
έέ' (
strHtml
έέ) 0
;
έέ0 1
await
ίί 
	SendEmail
ίί 
(
ίί  
notificationModel
ίί  1
)
ίί1 2
;
ίί2 3
return
ΰΰ 
true
ΰΰ 
;
ΰΰ 
}
αα 
catch
ββ 
(
ββ 
	Exception
ββ 
)
ββ 
{
γγ 
return
δδ 
false
δδ 
;
δδ 
}
εε 
}
ζζ 	
}
ηη 
}θθ †V
QD:\EltizamLive\Eltizam.Business.Core\Implementation\MasterOwnershipTypeService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
Implementation  .
{ 
public 

class &
MasterOwnershipTypeService +
:, -'
IMasterOwnershipTypeService. I
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IMapperFactory '
_mapperFactory( 6
;6 7
private 
readonly 
	Microsoft "
." #

Extensions# -
.- .
Configuration. ;
.; <
IConfiguration< J
configurationK X
;X Y
private 
IRepository 
< 
MasterOwnershipType /
>/ 0
_repository1 <
{= >
get? B
;B C
setD G
;G H
}I J
private 
readonly 
IHelper  
_helper! (
;( )
public   &
MasterOwnershipTypeService   )
(  ) *
IUnitOfWork  * 5

unitOfWork  6 @
,  @ A
IMapperFactory  B P
mapperFactory  Q ^
,  ^ _
IHelper!!" )
helper!!* 0
,!!0 1
	Microsoft""! *
.""* +

Extensions""+ 5
.""5 6
Configuration""6 C
.""C D
IConfiguration""D R
_configuration""S a
)""a b
{## 	
_unitOfWork$$ 
=$$ 

unitOfWork$$ $
;$$$ %
_mapperFactory%% 
=%% 
mapperFactory%% *
;%%* +
_repository'' 
='' 
_unitOfWork'' %
.''% &
GetRepository''& 3
<''3 4
MasterOwnershipType''4 G
>''G H
(''H I
)''I J
;''J K
configuration(( 
=(( 
_configuration(( *
;((* +
_helper)) 
=)) 
helper)) 
;)) 
}** 	
public-- 
async-- 
Task-- 
<-- "
DataTableResponseModel-- 0
>--0 1
GetAll--2 8
(--8 9"
DataTableAjaxPostModel--9 O
model--P U
)--U V
{.. 	
var// 
	_dbParams// 
=// 
new// 
[//  
]//  !
{00 
new11 
DbParameter11  
(11  !
$str11! 2
,112 3
$num114 5
,115 6
	SqlDbType116 ?
.11? @
Int11@ C
)11C D
,11D E
new22 
DbParameter22  
(22  !
$str22! +
,22+ ,
model22- 2
.222 3
length223 9
,229 :
	SqlDbType22; D
.22D E
Int22E H
)22H I
,22I J
new33 
DbParameter33  
(33  !
$str33! -
,33- .
model33/ 4
.334 5
start335 :
,33: ;
	SqlDbType33< E
.33E F
Int33F I
)33I J
,33J K
new44 
DbParameter44  
(44  !
$str44! .
,44. /
$str440 ?
,44? @
	SqlDbType44A J
.44J K
VarChar44K R
)44R S
,44S T
new55 
DbParameter55  
(55  !
$str55! .
,55. /
$num550 1
,551 2
	SqlDbType553 <
.55< =
Int55= @
)55@ A
}66 
;66 
int88 
_count88 
=88 
$num88 
;88 
var99 
lstStf99 
=99 
EltizamDBHelper99 (
.99( )2
&ExecuteMappedReaderWithOutputParameter99) O
<99O P%
MasterOwnershipTypeEntity99P i
>99i j
(99j k
ProcedureMetastore99k }
.99} ~,
usp_OwnershipType_SearchAllList	99~ 
,
99 
DatabaseConnection;; 
.;;  

ConnString;;  *
,;;* +
out;;, /
_count;;0 6
,;;6 7
CommandType;;8 C
.;;C D
StoredProcedure;;D S
,;;S T
	_dbParams;;U ^
);;^ _
;;;_ `"
DataTableResponseModel>> "#
oDataTableResponseModel>># :
=>>; <
new>>= @"
DataTableResponseModel>>A W
(>>W X
model>>X ]
.>>] ^
draw>>^ b
,>>b c
_count>>d j
,>>j k
$num>>l m
,>>m n
lstStf>>o u
)>>u v
;>>v w
return@@ #
oDataTableResponseModel@@ *
;@@* +
}AA 	
publicCC 
asyncCC 
TaskCC 
<CC 
ListCC 
<CC %
MasterOwnershipTypeEntityCC 8
>CC8 9
>CC9 : 
GetOwnershipTypeListCC; O
(CCO P
)CCP Q
{DD 	
returnEE 
_mapperFactoryEE !
.EE! "
GetListEE" )
<EE) *
MasterOwnershipTypeEE* =
,EE= >%
MasterOwnershipTypeEntityEE? X
>EEX Y
(EEY Z
awaitEEZ _
_repositoryEE` k
.EEk l
GetAllAsyncEEl w
(EEw x
)EEx y
)EEy z
;EEz {
}FF 	
publicHH 
asyncHH 
TaskHH 
<HH %
MasterOwnershipTypeEntityHH 3
>HH3 4
GetByIdHH5 <
(HH< =
intHH= @
idHHA C
)HHC D
{II 	
varJJ  
_OwnershipTypeEntityJJ $
=JJ% &
newJJ' *%
MasterOwnershipTypeEntityJJ+ D
(JJD E
)JJE F
;JJF G 
_OwnershipTypeEntityKK  
=KK! "
_mapperFactoryKK# 1
.KK1 2
GetKK2 5
<KK5 6
MasterOwnershipTypeKK6 I
,KKI J%
MasterOwnershipTypeEntityKKK d
>KKd e
(KKe f
awaitKKf k
_repositoryKKl w
.KKw x
GetAsync	KKx €
(
KK€ 
id
KK ƒ
)
KKƒ „
)
KK„ …
;
KK… †
returnMM  
_OwnershipTypeEntityMM '
;MM' (
}NN 	
publicOO 
asyncOO 
TaskOO 
<OO 
DBOperationOO %
>OO% &
UpsertOO' -
(OO- .%
MasterOwnershipTypeEntityOO. G
entityOwnershipTypeOOH [
)OO[ \
{PP 	
MasterOwnershipTypeRR 
objOwnershipTypeRR  0
;RR0 1
ifTT 
(TT 
entityOwnershipTypeTT #
.TT# $
IdTT$ &
>TT' (
$numTT) *
)TT* +
{UU 
objOwnershipTypeVV  
=VV! "
_repositoryVV# .
.VV. /
GetVV/ 2
(VV2 3
entityOwnershipTypeVV3 F
.VVF G
IdVVG I
)VVI J
;VVJ K
varWW 
OldObjOwnershipTypeWW '
=WW( )
objOwnershipTypeWW* :
;WW: ;
ifXX 
(XX 
objOwnershipTypeXX $
!=XX% '
nullXX( ,
)XX, -
{YY 
objOwnershipTypeZZ $
.ZZ$ %
OwnershipTypeZZ% 2
=ZZ3 4
entityOwnershipTypeZZ5 H
.ZZH I
OwnershipTypeZZI V
;ZZV W
objOwnershipType[[ $
.[[$ %
IsActive[[% -
=[[. /
entityOwnershipType[[0 C
.[[C D
IsActive[[D L
;[[L M
objOwnershipType\\ $
.\\$ %
ModifiedDate\\% 1
=\\2 3
AppConstants\\4 @
.\\@ A
DateTime\\A I
;\\I J
objOwnershipType]] $
.]]$ %

ModifiedBy]]% /
=]]0 1
entityOwnershipType]]2 E
.]]E F
	CreatedBy]]F O
;]]O P
_repository^^ 
.^^  
UpdateAsync^^  +
(^^+ ,
objOwnershipType^^, <
)^^< =
;^^= >
}__ 
else`` 
{aa 
returnbb 
DBOperationbb &
.bb& '
NotFoundbb' /
;bb/ 0
}cc 
}dd 
elseee 
{ff 
objOwnershipTypegg  
=gg! "
_mapperFactorygg# 1
.gg1 2
Getgg2 5
<gg5 6%
MasterOwnershipTypeEntitygg6 O
,ggO P
MasterOwnershipTypeggQ d
>ggd e
(gge f
entityOwnershipTypeggf y
)ggy z
;ggz {
objOwnershipTypehh  
.hh  !
CreatedDatehh! ,
=hh- .
AppConstantshh/ ;
.hh; <
DateTimehh< D
;hhD E
objOwnershipTypeii  
.ii  !
	CreatedByii! *
=ii+ ,
entityOwnershipTypeii- @
.ii@ A
	CreatedByiiA J
;iiJ K
objOwnershipTypejj  
.jj  !
ModifiedDatejj! -
=jj. /
AppConstantsjj0 <
.jj< =
DateTimejj= E
;jjE F
objOwnershipTypekk  
.kk  !

ModifiedBykk! +
=kk, -
entityOwnershipTypekk. A
.kkA B
	CreatedBykkB K
;kkK L
_repositoryll 
.ll 
AddAsyncll $
(ll$ %
objOwnershipTypell% 5
)ll5 6
;ll6 7
}mm 
awaitnn 
_unitOfWorknn 
.nn 
SaveChangesAsyncnn .
(nn. /
)nn/ 0
;nn0 1
ifoo 
(oo 
objOwnershipTypeoo  
.oo  !
Idoo! #
==oo$ &
$numoo' (
)oo( )
returnpp 
DBOperationpp "
.pp" #
Errorpp# (
;pp( )
returnrr 
DBOperationrr 
.rr 
Successrr &
;rr& '
}ss 	
publicuu 
asyncuu 
Taskuu 
<uu 
DBOperationuu %
>uu% &
Deleteuu' -
(uu- .
intuu. 1
iduu2 4
)uu4 5
{vv 	
varww 
entityOwnershipTypeww #
=ww$ %
_repositoryww& 1
.ww1 2
Getww2 5
(ww5 6
xww6 7
=>ww8 :
xww; <
.ww< =
Idww= ?
==ww@ B
idwwC E
)wwE F
;wwF G
ifyy 
(yy 
entityOwnershipTypeyy #
==yy$ &
nullyy' +
)yy+ ,
returnzz 
DBOperationzz "
.zz" #
NotFoundzz# +
;zz+ ,
_repository|| 
.|| 
Remove|| 
(|| 
entityOwnershipType|| 2
)||2 3
;||3 4
await~~ 
_unitOfWork~~ 
.~~ 
SaveChangesAsync~~ .
(~~. /
)~~/ 0
;~~0 1
return
€€ 
DBOperation
€€ 
.
€€ 
Success
€€ &
;
€€& '
}
 	
}
‚‚ 
}ƒƒ Ύ‘
LD:\EltizamLive\Eltizam.Business.Core\Implementation\MasterPropertyService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
Implementation  .
{ 
public 

class !
MasterPropertyService &
:' ("
IMasterPropertyService) ?
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IMapperFactory '
_mapperFactory( 6
;6 7
private   
readonly   
	Microsoft   "
.  " #

Extensions  # -
.  - .
Configuration  . ;
.  ; <
IConfiguration  < J
_configuration  K Y
;  Y Z
private!! 
readonly!! 
IAuditLogService!! )
_auditLogService!!* :
;!!: ;
private"" 
readonly"" 
IHelper""  
_helper""! (
;""( )
private## 
readonly## 
string## 
_dbConnection##  -
;##- .
private$$ 
readonly$$ 
int$$ 
?$$ 
_LoginUserId$$ *
;$$* +
private'' 
IRepository'' 
<'' 
MasterProperty'' *
>''* +
_repository'', 7
{''8 9
get'': =
;''= >
set''? B
;''B C
}''D E
private(( 
IRepository(( 
<(( "
MasterPropertyLocation(( 2
>((2 3
_detailrepository((4 E
{((F G
get((H K
;((K L
set((M P
;((P Q
}((R S
private)) 
IRepository)) 
<)) !
MasterPropertyAmenity)) 1
>))1 2
_amenityrepository))3 E
{))F G
get))H K
;))K L
set))M P
;))P Q
}))R S
public.. !
MasterPropertyService.. $
(..$ %
IUnitOfWork..% 0

unitOfWork..1 ;
,..; <
IMapperFactory..= K
mapperFactory..L Y
,..Y Z
IAuditLogService..[ k
auditLogService..l {
,..{ |
IHelper//% ,
helper//- 3
,//3 4
	Microsoft//5 >
.//> ?

Extensions//? I
.//I J
Configuration//J W
.//W X
IConfiguration//X f
configuration//g t
)//t u
{00 	
_unitOfWork11 
=11 

unitOfWork11 $
;11$ %
_mapperFactory22 
=22 
mapperFactory22 *
;22* +
_repository44 
=44 
_unitOfWork44 %
.44% &
GetRepository44& 3
<443 4
MasterProperty444 B
>44B C
(44C D
)44D E
;44E F
_detailrepository55 
=55 
_unitOfWork55  +
.55+ ,
GetRepository55, 9
<559 :"
MasterPropertyLocation55: P
>55P Q
(55Q R
)55R S
;55S T
_amenityrepository66 
=66  
_unitOfWork66! ,
.66, -
GetRepository66- :
<66: ;!
MasterPropertyAmenity66; P
>66P Q
(66Q R
)66R S
;66S T
_configuration77 
=77 
configuration77 *
;77* +
_helper88 
=88 
helper88 
;88 
_auditLogService99 
=99 
auditLogService99 .
;99. /
_dbConnection:: 
=:: 
DatabaseConnection:: .
.::. /

ConnString::/ 9
;::9 :
_LoginUserId<< 
=<< 
_helper<< "
.<<" #
GetLoggedInUser<<# 2
(<<2 3
)<<3 4
?<<4 5
.<<5 6
UserId<<6 <
;<<< =
}== 	
publicQQ 
asyncQQ 
TaskQQ 
<QQ 
MasterPropertyModelQQ -
>QQ- .&
GetMasterPropertyByIdAsyncQQ/ I
(QQI J
intQQJ M
idQQN P
)QQP Q
{RR 	
varTT 
_userEntityTT 
=TT 
newTT !
MasterPropertyModelTT" 5
(TT5 6
)TT6 7
;TT7 8
_userEntityWW 
=WW 
_mapperFactoryWW (
.WW( )
GetWW) ,
<WW, -
MasterPropertyWW- ;
,WW; <
MasterPropertyModelWW= P
>WWP Q
(WWQ R
awaitWWR W
_repositoryWWX c
.WWc d
GetAsyncWWd l
(WWl m
idWWm o
)WWo p
)WWp q
;WWq r
ifYY 
(YY 
_userEntityYY 
!=YY 
nullYY #
)YY# $
{ZZ 
_userEntity[[ 
.[[ 
PropertySubTypeId[[ -
=[[. /
_userEntity[[0 ;
.[[; <
PropertySubTypeId[[< M
is[[N P
null[[Q U
?[[V W
$num[[X Y
:[[Z [
_userEntity[[\ g
.[[g h
PropertySubTypeId[[h y
;[[y z
_userEntity\\ 
.\\ 
FurnishedId\\ '
=\\( )
_userEntity\\* 5
.\\5 6
FurnishedId\\6 A
is\\B D
null\\E I
?\\J K
$num\\L M
:\\N O
_userEntity\\P [
.\\[ \
FurnishedId\\\ g
;\\g h
DbParameter]] 
[]] 
]]] 
osqlParameter]] +
=]], -
{^^ 
new__ 
DbParameter__ #
(__# $
$str__$ 0
,__0 1
id__2 4
,__4 5
	SqlDbType__6 ?
.__? @
Int__@ C
)__C D
,__D E
}`` 
;`` 
varaa 
amenityListaa 
=aa  !
EltizamDBHelperaa" 1
.aa1 2
ExecuteMappedReaderaa2 E
<aaE F"
MasterAmenityListModelaaF \
>aa\ ]
(aa] ^
ProcedureMetastoreaa^ p
.aap q)
usp_Property_Amenity_GetById	aaq 
,
aa  
DatabaseConnection
aa ΅
.
aa΅ Ά

ConnString
aaΆ ¬
,
aa¬ ­
System
aa® ΄
.
aa΄ µ
Data
aaµ Ή
.
aaΉ Ί
CommandType
aaΊ Ε
.
aaΕ Ζ
StoredProcedure
aaΖ Υ
,
aaΥ Φ
osqlParameter
aaΧ δ
)
aaδ ε
;
aaε ζ
ifcc 
(cc 
amenityListcc 
!=cc  "
nullcc# '
)cc' (
{dd 
_userEntityee 
.ee  
AmenityListee  +
=ee, -
amenityListee. 9
;ee9 :
}ff 
DbParameterhh 
[hh 
]hh 
osqlParameter1hh ,
=hh- .
{ii 
newjj 
DbParameterjj #
(jj# $
$strjj$ 0
,jj0 1
idjj2 4
,jj4 5
	SqlDbTypejj6 ?
.jj? @
Intjj@ C
)jjC D
,jjD E
}kk 
;kk 
varll 
detailLocationll "
=ll# $
EltizamDBHelperll% 4
.ll4 5%
ExecuteSingleMappedReaderll5 N
<llN O%
MasterPropertyDetailModelllO h
>llh i
(lli j
ProcedureMetastorellj |
.ll| }*
usp_Property_Location_GetById	ll} 
,
ll › 
DatabaseConnection
ll ®
.
ll® ―

ConnString
ll― Ή
,
llΉ Ί
System
ll» Α
.
llΑ Β
Data
llΒ Ζ
.
llΖ Η
CommandType
llΗ Ò
.
llÒ Σ
StoredProcedure
llΣ β
,
llβ γ
osqlParameter1
llδ ς
)
llς σ
;
llσ τ
ifnn 
(nn 
detailLocationnn "
!=nn# %
nullnn& *
)nn* +
{oo 
_userEntitypp 
.pp  
PropertyDetailpp  .
=pp/ 0
detailLocationpp1 ?
;pp? @
}qq 
}rr 
returntt 
_userEntitytt 
;tt 
}uu 	
publicww 
asyncww 
Taskww 
<ww "
DataTableResponseModelww 0
>ww0 1
GetAllww2 8
(ww8 9"
DataTableAjaxPostModelww9 O
modelwwP U
)wwU V
{xx 	
stringzz 

ColumnNamezz 
=zz 
(zz  !
modelzz! &
.zz& '
orderzz' ,
.zz, -
Countzz- 2
>zz3 4
$numzz5 6
?zz7 8
modelzz9 >
.zz> ?
columnszz? F
[zzF G
modelzzG L
.zzL M
orderzzM R
[zzR S
$numzzS T
]zzT U
.zzU V
columnzzV \
]zz\ ]
.zz] ^
datazz^ b
:zzc d
stringzze k
.zzk l
Emptyzzl q
)zzq r
;zzr s
string{{ 
SortDir{{ 
={{ 
({{ 
model{{ #
.{{# $
order{{$ )
.{{) *
Count{{* /
>{{0 1
$num{{2 3
?{{4 5
model{{6 ;
.{{; <
order{{< A
[{{A B
$num{{B C
]{{C D
.{{D E
dir{{E H
:{{I J
string{{K Q
.{{Q R
Empty{{R W
){{W X
;{{X Y
SqlParameter}} 
[}} 
]}} 
osqlParameter}} (
=}}) *
{~~ 
new 
SqlParameter  
(  !
AppConstants! -
.- .
P_CurrentPageNumber. A
,A B
modelD I
.I J
startJ O
)O P
,P Q
new
€€ 
SqlParameter
€€  
(
€€  !
AppConstants
€€! -
.
€€- .

P_PageSize
€€. 8
,
€€8 9
model
€€D I
.
€€I J
length
€€J P
)
€€P Q
,
€€Q R
new
 
SqlParameter
  
(
  !
AppConstants
! -
.
- .
P_SortColumn
. :
,
: ;

ColumnName
D N
)
N O
,
O P
new
‚‚ 
SqlParameter
‚‚  
(
‚‚  !
AppConstants
‚‚! -
.
‚‚- .
P_SortDirection
‚‚. =
,
‚‚= >
SortDir
‚‚D K
)
‚‚K L
,
‚‚L M
new
ƒƒ 
SqlParameter
ƒƒ  
(
ƒƒ  !
AppConstants
ƒƒ! -
.
ƒƒ- .
P_SearchText
ƒƒ. :
,
ƒƒ: ;
model
ƒƒD I
.
ƒƒI J
search
ƒƒJ P
?
ƒƒP Q
.
ƒƒQ R
value
ƒƒR W
)
ƒƒW X
}
„„ 
;
„„ 
var
†† 
Results
†† 
=
†† 
await
†† 
_repository
††  +
.
††+ ,
GetBySP
††, 3
(
††3 4 
ProcedureMetastore
††4 F
.
††F G(
usp_Property_SearchAllList
††G a
,
††a b
System
††c i
.
††i j
Data
††j n
.
††n o
CommandType
††o z
.
††z {
StoredProcedure††{ 
,†† ‹
osqlParameter†† ™
)††™ 
;†† ›
var
 
res
 
=
 
UtilityHelper
 #
.
# $
GetPaginationInfo
$ 5
(
5 6
Results
6 =
)
= >
;
> ?$
DataTableResponseModel
‰‰ "%
oDataTableResponseModel
‰‰# :
=
‰‰; <
new
‰‰= @$
DataTableResponseModel
‰‰A W
(
‰‰W X
model
‰‰X ]
.
‰‰] ^
draw
‰‰^ b
,
‰‰b c
res
‰‰d g
.
‰‰g h
Item1
‰‰h m
,
‰‰m n
res
‰‰o r
.
‰‰r s
Item1
‰‰s x
,
‰‰x y
Results‰‰z 
.‰‰ ‚
DataTableToList‰‰‚ ‘
<‰‰‘ ’'
MasterPropertyListModel‰‰’ ©
>‰‰© ª
(‰‰ª «
)‰‰« ¬
)‰‰¬ ­
;‰‰­ ®
return
‹‹ %
oDataTableResponseModel
‹‹ *
;
‹‹* +
}
 	
public
 
async
 
Task
 
<
 
List
 
<
 $
MasterAmenityListModel
 5
>
5 6
>
6 7$
GetPropertyAmenityList
8 N
(
N O
)
O P
{
 	
DbParameter
 
[
 
]
 
osqlParameter
 '
=
( )
{
‘‘ 
new
’’ 
DbParameter
’’ 
(
’’  
$str
’’  ,
,
’’, -
$num
’’. /
,
’’/ 0
	SqlDbType
’’1 :
.
’’: ;
Int
’’; >
)
’’> ?
,
’’? @
}
““ 
;
““ 
var
•• 
amenityList
•• 
=
•• 
EltizamDBHelper
•• -
.
••- .!
ExecuteMappedReader
••. A
<
••A B$
MasterAmenityListModel
••B X
>
••X Y
(
••Y Z 
ProcedureMetastore
••Z l
.
••l m+
usp_Property_Amenity_GetById••m ‰
,••‰ "
DatabaseConnection••‹ 
.•• 

ConnString•• ¨
,••¨ ©
System••ª °
.••° ±
Data••± µ
.••µ ¶
CommandType••¶ Α
.••Α Β
StoredProcedure••Β Ρ
,••Ρ Ò
osqlParameter••Σ ΰ
)••ΰ α
;••α β
return
–– 
amenityList
–– 
;
–– 
}
—— 	
public
™™ 
async
™™ 
Task
™™ 
<
™™ 
DBOperation
™™ %
>
™™% &%
AddUpdateMasterProperty
™™' >
(
™™> ?!
MasterPropertyModel
™™? R
masterproperty
™™S a
)
™™a b
{
 	
MasterProperty
 
objProperty
 &
;
& '$
MasterPropertyLocation
 "
objLocation
# .
;
. /#
MasterPropertyAmenity
 !

objAmenity
" ,
;
, -
string
   
MainTableName
    
=
  ! "
Enum
  # '
.
  ' (
GetName
  ( /
(
  / 0
TableNameEnum
  0 =
.
  = >
Master_Property
  > M
)
  M N
;
  N O
int
΅΅ 
MainTableKey
΅΅ 
=
΅΅ 
masterproperty
΅΅ -
.
΅΅- .
Id
΅΅. 0
;
΅΅0 1
if
££ 
(
££ 
masterproperty
££ 
.
££ 
Id
££ !
>
££" #
$num
££$ %
)
££% &
{
¤¤ 
MasterProperty
¥¥ 
	OldEntity
¥¥ (
=
¥¥) *
null
¥¥+ /
;
¥¥/ 0
	OldEntity
¦¦ 
=
¦¦ 
_repository
¦¦ '
.
¦¦' (
GetNoTracking
¦¦( 5
(
¦¦5 6
masterproperty
¦¦6 D
.
¦¦D E
Id
¦¦E G
)
¦¦G H
;
¦¦H I
objProperty
¨¨ 
=
¨¨ 
_repository
¨¨ )
.
¨¨) *
Get
¨¨* -
(
¨¨- .
masterproperty
¨¨. <
.
¨¨< =
Id
¨¨= ?
)
¨¨? @
;
¨¨@ A
if
©© 
(
©© 
objProperty
©© 
!=
©©  "
null
©©# '
)
©©' (
{
ªª 
objProperty
«« 
.
««  
PropertyName
««  ,
=
««- .
masterproperty
««/ =
.
««= >
PropertyName
««> J
;
««J K
objProperty
¬¬ 
.
¬¬  
PropertyTypeId
¬¬  .
=
¬¬/ 0
masterproperty
¬¬1 ?
.
¬¬? @
PropertyTypeId
¬¬@ N
;
¬¬N O
objProperty
­­ 
.
­­  
PropertySubTypeId
­­  1
=
­­2 3
masterproperty
­­4 B
.
­­B C
PropertySubTypeId
­­C T
;
­­T U
objProperty
®® 
.
®®  
OwnershipTypeId
®®  /
=
®®0 1
masterproperty
®®2 @
.
®®@ A
OwnershipTypeId
®®A P
;
®®P Q
objProperty
―― 
.
――  

UnitTypeId
――  *
=
――+ ,
masterproperty
――- ;
.
――; <

UnitTypeId
――< F
;
――F G
objProperty
°° 
.
°°  
AdditionalUnits
°°  /
=
°°0 1
masterproperty
°°2 @
.
°°@ A
AdditionalUnits
°°A P
;
°°P Q
objProperty
±± 
.
±±  
FurnishedId
±±  +
=
±±, -
masterproperty
±±. <
.
±±< =
FurnishedId
±±= H
;
±±H I
objProperty
²² 
.
²²  
ValuationPurpose
²²  0
=
²²1 2
masterproperty
²²3 A
.
²²A B
ValuationPurpose
²²B R
;
²²R S
objProperty
³³ 
.
³³  
BuildUpAreaSqFt
³³  /
=
³³0 1
masterproperty
³³2 @
.
³³@ A
BuildUpAreaSqFt
³³A P
;
³³P Q
objProperty
΄΄ 
.
΄΄  
BuildUpAreaSqMtr
΄΄  0
=
΄΄1 2
masterproperty
΄΄3 A
.
΄΄A B
BuildUpAreaSqMtr
΄΄B R
;
΄΄R S
objProperty
µµ 
.
µµ  
AgeOfConstruction
µµ  1
=
µµ2 3
masterproperty
µµ4 B
.
µµB C
AgeOfConstruction
µµC T
;
µµT U
objProperty
¶¶ 
.
¶¶  
IsActive
¶¶  (
=
¶¶) *
masterproperty
¶¶+ 9
.
¶¶9 :
IsActive
¶¶: B
;
¶¶B C
objProperty
·· 
.
··  
Parking
··  '
=
··( )
masterproperty
··* 8
.
··8 9
Parking
··9 @
;
··@ A
objProperty
ΈΈ 
.
ΈΈ  
ParkingBayNo
ΈΈ  ,
=
ΈΈ- .
masterproperty
ΈΈ/ =
.
ΈΈ= >
ParkingBayNo
ΈΈ> J
;
ΈΈJ K
objProperty
ΉΉ 
.
ΉΉ  
Description
ΉΉ  +
=
ΉΉ, -
masterproperty
ΉΉ. <
.
ΉΉ< =
Description
ΉΉ= H
;
ΉΉH I
objProperty
ΊΊ 
.
ΊΊ  

UnitNumber
ΊΊ  *
=
ΊΊ+ ,
masterproperty
ΊΊ- ;
.
ΊΊ; <

UnitNumber
ΊΊ< F
;
ΊΊF G
objProperty
»» 
.
»»  

ModifiedBy
»»  *
=
»»+ ,
masterproperty
»»- ;
.
»»; <

ModifiedBy
»»< F
;
»»F G
_repository
½½ 
.
½½  
UpdateAsync
½½  +
(
½½+ ,
objProperty
½½, 7
)
½½7 8
;
½½8 9
await
ΐΐ 
_unitOfWork
ΐΐ %
.
ΐΐ% &
SaveChangesAsync
ΐΐ& 6
(
ΐΐ6 7
)
ΐΐ7 8
;
ΐΐ8 9
await
ΒΒ 
_auditLogService
ΒΒ *
.
ΒΒ* +
CreateAuditLog
ΒΒ+ 9
<
ΒΒ9 :
MasterProperty
ΒΒ: H
>
ΒΒH I
(
ΒΒI J!
AuditActionTypeEnum
ΒΒJ ]
.
ΒΒ] ^
Update
ΒΒ^ d
,
ΒΒd e
	OldEntity
ΒΒf o
,
ΒΒo p
objProperty
ΒΒq |
,
ΒΒ| }
MainTableNameΒΒ~ ‹
,ΒΒ‹ 
MainTableKeyΒΒ ™
)ΒΒ™ 
;ΒΒ ›
}
ΓΓ 
else
ΔΔ 
return
ΕΕ 
DBOperation
ΕΕ &
.
ΕΕ& '
NotFound
ΕΕ' /
;
ΕΕ/ 0
}
ΖΖ 
else
ΗΗ 
{
ΘΘ 
objProperty
ΙΙ 
=
ΙΙ 
_mapperFactory
ΙΙ ,
.
ΙΙ, -
Get
ΙΙ- 0
<
ΙΙ0 1!
MasterPropertyModel
ΙΙ1 D
,
ΙΙD E
MasterProperty
ΙΙF T
>
ΙΙT U
(
ΙΙU V
masterproperty
ΙΙV d
)
ΙΙd e
;
ΙΙe f
objProperty
ΚΚ 
.
ΚΚ 
IsActive
ΚΚ $
=
ΚΚ% &
masterproperty
ΚΚ' 5
.
ΚΚ5 6
IsActive
ΚΚ6 >
;
ΚΚ> ?
objProperty
ΛΛ 
.
ΛΛ 
	CreatedBy
ΛΛ %
=
ΛΛ& '
masterproperty
ΛΛ( 6
.
ΛΛ6 7
	CreatedBy
ΛΛ7 @
;
ΛΛ@ A
_repository
ΜΜ 
.
ΜΜ 
AddAsync
ΜΜ $
(
ΜΜ$ %
objProperty
ΜΜ% 0
)
ΜΜ0 1
;
ΜΜ1 2
await
ΝΝ 
_unitOfWork
ΝΝ !
.
ΝΝ! "
SaveChangesAsync
ΝΝ" 2
(
ΝΝ2 3
)
ΝΝ3 4
;
ΝΝ4 5
}
ΞΞ 
if
ΠΠ 
(
ΠΠ 
objProperty
ΠΠ 
.
ΠΠ 
Id
ΠΠ 
==
ΠΠ !
$num
ΠΠ" #
)
ΠΠ# $
return
ΡΡ 
DBOperation
ΡΡ "
.
ΡΡ" #
Error
ΡΡ# (
;
ΡΡ( )
else
ΣΣ 
{
ΤΤ 
if
ΥΥ 
(
ΥΥ 
masterproperty
ΥΥ "
.
ΥΥ" #
PropertyDetail
ΥΥ# 1
!=
ΥΥ2 4
null
ΥΥ5 9
)
ΥΥ9 :
{
ΦΦ 
if
ΧΧ 
(
ΧΧ 
masterproperty
ΧΧ &
.
ΧΧ& '
PropertyDetail
ΧΧ' 5
.
ΧΧ5 6
Id
ΧΧ6 8
>
ΧΧ9 :
$num
ΧΧ; <
)
ΧΧ< =
{
ΨΨ 
var
ΩΩ 
	OldEntity
ΩΩ %
=
ΩΩ& '
_detailrepository
ΩΩ( 9
.
ΩΩ9 :
GetNoTracking
ΩΩ: G
(
ΩΩG H
masterproperty
ΩΩH V
.
ΩΩV W
PropertyDetail
ΩΩW e
.
ΩΩe f
Id
ΩΩf h
)
ΩΩh i
;
ΩΩi j
objLocation
ΫΫ #
=
ΫΫ$ %
_detailrepository
ΫΫ& 7
.
ΫΫ7 8
Get
ΫΫ8 ;
(
ΫΫ; <
masterproperty
ΫΫ< J
.
ΫΫJ K
PropertyDetail
ΫΫK Y
.
ΫΫY Z
Id
ΫΫZ \
)
ΫΫ\ ]
;
ΫΫ] ^
if
άά 
(
άά 
objLocation
άά '
!=
άά( *
null
άά+ /
)
άά/ 0
{
έέ 
var
ήή 
entityLocation
ήή  .
=
ήή/ 0
_mapperFactory
ήή1 ?
.
ήή? @
Get
ήή@ C
<
ήήC D'
MasterPropertyDetailModel
ήήD ]
,
ήή] ^$
MasterPropertyLocation
ήή_ u
>
ήήu v
(
ήήv w
masterpropertyήήw …
.ήή… †
PropertyDetailήή† ”
)ήή” •
;ήή• –
objLocation
ίί '
.
ίί' (
	CountryId
ίί( 1
=
ίί2 3
entityLocation
ίί4 B
.
ίίB C
	CountryId
ίίC L
;
ίίL M
objLocation
ΰΰ '
.
ΰΰ' (
StateId
ΰΰ( /
=
ΰΰ0 1
entityLocation
ΰΰ2 @
.
ΰΰ@ A
StateId
ΰΰA H
;
ΰΰH I
objLocation
αα '
.
αα' (
CityId
αα( .
=
αα/ 0
entityLocation
αα1 ?
.
αα? @
CityId
αα@ F
;
ααF G
objLocation
ββ '
.
ββ' (
Zone
ββ( ,
=
ββ- .
entityLocation
ββ/ =
.
ββ= >
Zone
ββ> B
;
ββB C
objLocation
γγ '
.
γγ' (
BuildingProject
γγ( 7
=
γγ8 9
entityLocation
γγ: H
.
γγH I
BuildingProject
γγI X
;
γγX Y
objLocation
δδ '
.
δδ' (
Latitude
δδ( 0
=
δδ1 2
entityLocation
δδ3 A
.
δδA B
Latitude
δδB J
;
δδJ K
objLocation
εε '
.
εε' (
	Longitude
εε( 1
=
εε2 3
entityLocation
εε4 B
.
εεB C
	Longitude
εεC L
;
εεL M
objLocation
ζζ '
.
ζζ' (
Address1
ζζ( 0
=
ζζ1 2
entityLocation
ζζ3 A
.
ζζA B
Address1
ζζB J
;
ζζJ K
objLocation
ηη '
.
ηη' (
Address2
ηη( 0
=
ηη1 2
entityLocation
ηη3 A
.
ηηA B
Address2
ηηB J
;
ηηJ K
objLocation
θθ '
.
θθ' (
Pincode
θθ( /
=
θθ0 1
entityLocation
θθ2 @
.
θθ@ A
Pincode
θθA H
;
θθH I
objLocation
ιι '
.
ιι' (
Landmark
ιι( 0
=
ιι1 2
entityLocation
ιι3 A
.
ιιA B
Landmark
ιιB J
;
ιιJ K
objLocation
κκ '
.
κκ' (

ModifiedBy
κκ( 2
=
κκ3 4
entityLocation
κκ5 C
.
κκC D

ModifiedBy
κκD N
;
κκN O
objLocation
λλ '
.
λλ' (
ModifiedDate
λλ( 4
=
λλ5 6
AppConstants
λλ7 C
.
λλC D
DateTime
λλD L
;
λλL M
_detailrepository
μμ -
.
μμ- .
UpdateAsync
μμ. 9
(
μμ9 :
objLocation
μμ: E
)
μμE F
;
μμF G
await
ξξ !
_unitOfWork
ξξ" -
.
ξξ- .
SaveChangesAsync
ξξ. >
(
ξξ> ?
)
ξξ? @
;
ξξ@ A
}
ςς 
}
σσ 
else
ττ 
{
υυ 
objLocation
φφ #
=
φφ$ %
_mapperFactory
φφ& 4
.
φφ4 5
Get
φφ5 8
<
φφ8 9'
MasterPropertyDetailModel
φφ9 R
,
φφR S$
MasterPropertyLocation
φφT j
>
φφj k
(
φφk l
masterproperty
φφl z
.
φφz {
PropertyDetailφφ{ ‰
)φφ‰ 
;φφ ‹
objLocation
χχ #
.
χχ# $

PropertyId
χχ$ .
=
χχ/ 0
objProperty
χχ1 <
.
χχ< =
Id
χχ= ?
;
χχ? @
objLocation
ψψ #
.
ψψ# $
	CreatedBy
ψψ$ -
=
ψψ. /
objProperty
ψψ0 ;
.
ψψ; <
	CreatedBy
ψψ< E
;
ψψE F
objLocation
ωω #
.
ωω# $
CreatedDate
ωω$ /
=
ωω0 1
AppConstants
ωω2 >
.
ωω> ?
DateTime
ωω? G
;
ωωG H
_detailrepository
ϊϊ )
.
ϊϊ) *
AddAsync
ϊϊ* 2
(
ϊϊ2 3
objLocation
ϊϊ3 >
)
ϊϊ> ?
;
ϊϊ? @
}
ϋϋ 
await
όό 
_unitOfWork
όό %
.
όό% &
SaveChangesAsync
όό& 6
(
όό6 7
)
όό7 8
;
όό8 9
}
ύύ 
if
ÿÿ 
(
ÿÿ 
masterproperty
ÿÿ "
.
ÿÿ" #
AmenityList
ÿÿ# .
!=
ÿÿ/ 1
null
ÿÿ2 6
&&
ÿÿ7 9
masterproperty
ÿÿ: H
.
ÿÿH I
AmenityList
ÿÿI T
.
ÿÿT U
Count
ÿÿU Z
>
ÿÿ[ \
$num
ÿÿ] ^
)
ÿÿ^ _
{
€€ 
foreach
 
(
 
var
  
doc
! $
in
% '
masterproperty
( 6
.
6 7
AmenityList
7 B
)
B C
{
‚‚ 
if
ƒƒ 
(
ƒƒ 
doc
ƒƒ 
.
ƒƒ  
Id
ƒƒ  "
>
ƒƒ# $
$num
ƒƒ% &
)
ƒƒ& '
{
„„ 

objAmenity
…… &
=
……' ( 
_amenityrepository
……) ;
.
……; <
Get
……< ?
(
……? @
doc
……@ C
.
……C D
Id
……D F
)
……F G
;
……G H
if
†† 
(
††  

objAmenity
††  *
!=
††+ -
null
††. 2
)
††2 3
{
‡‡ 

objAmenity
  *
=
+ ,
_mapperFactory
- ;
.
; <
Get
< ?
<
? @$
MasterAmenityListModel
@ V
,
V W#
MasterPropertyAmenity
X m
>
m n
(
n o
doc
o r
)
r s
;
s t

objAmenity
‰‰  *
.
‰‰* +

PropertyId
‰‰+ 5
=
‰‰6 7
objProperty
‰‰8 C
.
‰‰C D
Id
‰‰D F
;
‰‰F G

objAmenity
  *
.
* +
	AmenityId
+ 4
=
5 6
doc
7 :
.
: ;
	AmenityId
; D
;
D E

objAmenity
‹‹  *
.
‹‹* +
IsActive
‹‹+ 3
=
‹‹4 5
doc
‹‹6 9
.
‹‹9 :
IsActive
‹‹: B
;
‹‹B C

objAmenity
  *
.
* +

ModifiedBy
+ 5
=
6 7
objProperty
8 C
.
C D

ModifiedBy
D N
;
N O

objAmenity
  *
.
* +
ModifiedDate
+ 7
=
8 9
AppConstants
: F
.
F G
DateTime
G O
;
O P 
_amenityrepository
  2
.
2 3
UpdateAsync
3 >
(
> ?

objAmenity
? I
)
I J
;
J K
}
 
}
 
else
‘‘ 
{
’’ 

objAmenity
““ &
=
““' (
new
““) ,#
MasterPropertyAmenity
““- B
(
““B C
)
““C D
;
““D E

objAmenity
”” &
.
””& '

PropertyId
””' 1
=
””2 3
objProperty
””4 ?
.
””? @
Id
””@ B
;
””B C

objAmenity
•• &
.
••& '
	AmenityId
••' 0
=
••1 2
doc
••3 6
.
••6 7
	AmenityId
••7 @
;
••@ A

objAmenity
–– &
.
––& '
IsActive
––' /
=
––0 1
doc
––2 5
.
––5 6
IsActive
––6 >
;
––> ?

objAmenity
—— &
.
——& '
	CreatedBy
——' 0
=
——1 2
objProperty
——3 >
.
——> ?
	CreatedBy
——? H
;
——H I

objAmenity
 &
.
& '
CreatedDate
' 2
=
3 4
AppConstants
5 A
.
A B
DateTime
B J
;
J K 
_amenityrepository
™™ .
.
™™. /
AddAsync
™™/ 7
(
™™7 8

objAmenity
™™8 B
)
™™B C
;
™™C D
}
 
await
›› 
_unitOfWork
›› )
.
››) *
SaveChangesAsync
››* :
(
››: ;
)
››; <
;
››< =
}
 
}
 
}
 
return
   
DBOperation
   
.
   
Success
   &
;
  & '
}
΅΅ 	
public
££ 
async
££ 
Task
££ 
<
££ 
DBOperation
££ %
>
££% &
DeleteProperty
££' 5
(
££5 6
int
££6 9
id
££: <
,
££< =
int
££= @
?
££@ A
by
££B D
)
££D E
{
¤¤ 	
try
¥¥ 
{
¦¦ 
var
§§ 
old
§§ 
=
§§ 
_repository
§§ %
.
§§% &
GetNoTracking
§§& 3
(
§§3 4
id
§§4 6
)
§§6 7
;
§§7 8
DbParameter
¨¨ 
[
¨¨ 
]
¨¨ 
prm
¨¨ !
=
¨¨" #
{
©© 
new
ªª 
DbParameter
ªª #
(
ªª# $
$str
ªª$ 0
,
ªª0 1
id
ªª2 4
,
ªª4 5
	SqlDbType
ªª6 ?
.
ªª? @
Int
ªª@ C
)
ªªC D
,
ªªD E
new
«« 
DbParameter
«« #
(
««# $
$str
««$ (
,
««( )
by
««2 4
,
««4 5
	SqlDbType
««6 ?
.
««? @
Int
««@ C
)
««C D
}
¬¬ 
;
¬¬ 
EltizamDBHelper
®® 
.
®®  
ExecuteNonQuery
®®  /
(
®®/ 0 
ProcedureMetastore
®®0 B
.
®®B C!
usp_Property_Delete
®®C V
,
®®V W 
DatabaseConnection
®®X j
.
®®j k

ConnString
®®k u
,
®®u v
System
®®w }
.
®®} ~
Data®®~ ‚
.®®‚ ƒ
CommandType®®ƒ 
.®® 
StoredProcedure®® 
,®® 
prm®®  £
)®®£ ¤
;®®¤ ¥
var
°° 
newP
°° 
=
°° 
_repository
°° &
.
°°& '
Get2
°°' +
(
°°+ ,
id
°°, .
)
°°. /
;
°°/ 0
await
²² 
_auditLogService
²² &
.
²²& '
CreateAuditLog
²²' 5
<
²²5 6
MasterProperty
²²6 D
>
²²D E
(
²²E F!
AuditActionTypeEnum
²²F Y
.
²²Y Z
Update
²²Z `
,
²²` a
old
²²b e
,
²²e f
newP
²²g k
,
²²k l
Enum
²²m q
.
²²q r
GetName
²²r y
(
²²y z
TableNameEnum²²z ‡
.²²‡ 
Master_Property²² —
)²²— 
,²² ™
id²² 
)²² 
;²² 
return
µµ 
DBOperation
µµ "
.
µµ" #
Success
µµ# *
;
µµ* +
}
¶¶ 
catch
·· 
(
·· 
	Exception
·· 
ex
·· 
)
··  
{
ΈΈ 
throw
ΉΉ 
ex
ΉΉ 
;
ΉΉ 
}
ΊΊ 
}
ΙΙ 	
public
ΛΛ 
async
ΛΛ 
Task
ΛΛ 
<
ΛΛ 
List
ΛΛ 
<
ΛΛ !
MasterPropertyModel
ΛΛ 2
>
ΛΛ2 3
>
ΛΛ3 4-
GetMasterPropertyByFiltersAsync
ΛΛ5 T
(
ΛΛT U
int
ΛΛU X
PropertyTypeId
ΛΛY g
,
ΛΛg h
int
ΛΛi l
SubPropertyTypeId
ΛΛm ~
,
ΛΛ~ 
intΛΛ€ ƒ
OwnershipTypeIdΛΛ„ “
)ΛΛ“ ”
{
ΜΜ 	
var
ΞΞ 
_PropertFilter
ΞΞ 
=
ΞΞ  
new
ΞΞ! $
List
ΞΞ% )
<
ΞΞ) *!
MasterPropertyModel
ΞΞ* =
>
ΞΞ= >
(
ΞΞ> ?
)
ΞΞ? @
;
ΞΞ@ A
var
ΣΣ 
res
ΣΣ 
=
ΣΣ 
_repository
ΣΣ !
.
ΣΣ! "
GetAllAsync
ΣΣ" -
(
ΣΣ- .
x
ΣΣ. /
=>
ΣΣ0 2
(
ΣΣ3 4
x
ΣΣ4 5
.
ΣΣ5 6
PropertyTypeId
ΣΣ6 D
==
ΣΣE G
PropertyTypeId
ΣΣH V
||
ΣΣW Y
PropertyTypeId
ΣΣZ h
==
ΣΣi k
$num
ΣΣl m
)
ΣΣm n
&&
ΤΤ" $
(
ΤΤ% &
x
ΤΤ& '
.
ΤΤ' (
PropertySubTypeId
ΤΤ( 9
==
ΤΤ: <
SubPropertyTypeId
ΤΤ= N
||
ΤΤO Q
SubPropertyTypeId
ΤΤR c
==
ΤΤd f
$num
ΤΤg h
)
ΤΤh i
&&
ΥΥ" $
(
ΥΥ% &
x
ΥΥ& '
.
ΥΥ' (
OwnershipTypeId
ΥΥ( 7
==
ΥΥ8 :
OwnershipTypeId
ΥΥ; J
||
ΥΥK M
OwnershipTypeId
ΥΥN ]
==
ΥΥ^ `
$num
ΥΥa b
)
ΥΥb c
&&
ΦΦ" $
x
ΦΦ% &
.
ΦΦ& '
IsActive
ΦΦ' /
==
ΦΦ0 2
true
ΦΦ3 7
)
ΦΦ7 8
.
ΧΧ  !
Result
ΧΧ! '
.
ΧΧ' (
ToList
ΧΧ( .
(
ΧΧ. /
)
ΧΧ/ 0
;
ΧΧ0 1
_PropertFilter
ΪΪ 
=
ΪΪ 
_mapperFactory
ΪΪ +
.
ΪΪ+ ,
GetList
ΪΪ, 3
<
ΪΪ3 4
MasterProperty
ΪΪ4 B
,
ΪΪB C!
MasterPropertyModel
ΪΪD W
>
ΪΪW X
(
ΪΪX Y
res
ΪΪY \
)
ΪΪ\ ]
;
ΪΪ] ^
return
έέ 
_PropertFilter
έέ !
;
έέ! "
}
ήή 	
}
ββ 
}γγ γe
SD:\EltizamLive\Eltizam.Business.Core\Implementation\MasterPropertySubTypeService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
Implementation  .
{ 
public 

class (
MasterPropertySubTypeService -
:. /)
IMasterPropertySubTypeService0 M
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IMapperFactory '
_mapperFactory( 6
;6 7
private 
readonly 
	Microsoft "
." #

Extensions# -
.- .
Configuration. ;
.; <
IConfiguration< J
configurationK X
;X Y
private 
IRepository 
< !
MasterPropertySubType 1
>1 2
_repository3 >
{? @
getA D
;D E
setF I
;I J
}K L
private 
readonly 
IHelper  
_helper! (
;( )
public (
MasterPropertySubTypeService +
(+ ,
IUnitOfWork, 7

unitOfWork8 B
,B C
IMapperFactoryD R
mapperFactoryS `
,` a
IHelper
 
helper 
, 
	Microsoft 
. 

Extensions 
.  
Configuration  -
.- .
IConfiguration. <
_configuration= K
)K L
{   	
_unitOfWork!! 
=!! 

unitOfWork!! $
;!!$ %
_mapperFactory"" 
="" 
mapperFactory"" *
;""* +
_repository$$ 
=$$ 
_unitOfWork$$ %
.$$% &
GetRepository$$& 3
<$$3 4!
MasterPropertySubType$$4 I
>$$I J
($$J K
)$$K L
;$$L M
configuration%% 
=%% 
_configuration%% *
;%%* +
_helper&& 
=&& 
helper&& 
;&& 
}'' 	
public;; 
async;; 
Task;; 
<;; '
Master_PropertySubTypeModel;; 5
>;;5 6)
GetMasterSubPropertyByIdAsync;;7 T
(;;T U
int;;U X
id;;Y [
);;[ \
{<< 	
var>> 
_PropertyTypeEntity>> #
=>>$ %
new>>& )'
Master_PropertySubTypeModel>>* E
(>>E F
)>>F G
;>>G H
_PropertyTypeEntityAA 
=AA  !
_mapperFactoryAA" 0
.AA0 1
GetAA1 4
<AA4 5!
MasterPropertySubTypeAA5 J
,AAJ K'
Master_PropertySubTypeModelAAL g
>AAg h
(AAh i
awaitAAi n
_repositoryAAo z
.AAz {
GetAsync	AA{ ƒ
(
AAƒ „
id
AA„ †
)
AA† ‡
)
AA‡ 
;
AA ‰
returnDD 
_PropertyTypeEntityDD &
;DD& '
}EE 	
publicGG 
asyncGG 
TaskGG 
<GG 
ListGG 
<GG '
Master_PropertySubTypeModelGG :
>GG: ;
>GG; <5
)GetMasterSubPropertyByPropertyTypeIdAsyncGG= f
(GGf g
intGGg j
PropertyTypeIdGGk y
)GGy z
{HH 	
varJJ 
	_SubTypesJJ 
=JJ 
newJJ 
ListJJ  $
<JJ$ %'
Master_PropertySubTypeModelJJ% @
>JJ@ A
(JJA B
)JJB C
;JJC D
varLL 
resLL 
=LL 
_repositoryLL !
.LL! "
GetAllAsyncLL" -
(LL- .
xLL. /
=>LL0 2
xLL3 4
.LL4 5
PropertyTypeIdLL5 C
==LLD F
PropertyTypeIdLLG U
&&LLV X
xLLY Z
.LLZ [
IsActiveLL[ c
==LLd f
trueLLg k
)LLk l
.LLl m
ResultLLm s
.LLs t
ToListLLt z
(LLz {
)LL{ |
;LL| }
	_SubTypesOO 
=OO 
_mapperFactoryOO &
.OO& '
GetListOO' .
<OO. /!
MasterPropertySubTypeOO/ D
,OOD E'
Master_PropertySubTypeModelOOF a
>OOa b
(OOb c
resOOc f
)OOf g
;OOg h
returnRR 
	_SubTypesRR 
;RR 
}SS 	
publicUU 
asyncUU 
TaskUU 
<UU "
DataTableResponseModelUU 0
>UU0 1
GetAllUU2 8
(UU8 9"
DataTableAjaxPostModelUU9 O
modelUUP U
)UUU V
{VV 	
varWW 
	_dbParamsWW 
=WW 
newWW 
[WW  
]WW  !
{XX 
newYY 
DbParameterYY  
(YY  !
$strYY! 4
,YY4 5
$numYY6 7
,YY7 8
	SqlDbTypeYY8 A
.YYA B
IntYYB E
)YYE F
,YYF G
newZZ 
DbParameterZZ  
(ZZ  !
$strZZ! +
,ZZ+ ,
modelZZ- 2
.ZZ2 3
lengthZZ3 9
,ZZ9 :
	SqlDbTypeZZ; D
.ZZD E
IntZZE H
)ZZH I
,ZZI J
new[[ 
DbParameter[[  
([[  !
$str[[! -
,[[- .
model[[/ 4
.[[4 5
start[[5 :
,[[: ;
	SqlDbType[[< E
.[[E F
Int[[F I
)[[I J
,[[J K
new\\ 
DbParameter\\  
(\\  !
$str\\! .
,\\. /
$str\\0 A
,\\A B
	SqlDbType\\C L
.\\L M
VarChar\\M T
)\\T U
,\\U V
new]] 
DbParameter]]  
(]]  !
$str]]! .
,]]. /
$num]]0 1
,]]1 2
	SqlDbType]]3 <
.]]< =
Int]]= @
)]]@ A
}^^ 
;^^ 
int__ 
_count__ 
=__ 
$num__ 
;__ 
var`` 
lstStf`` 
=`` 
EltizamDBHelper`` (
.``( )2
&ExecuteMappedReaderWithOutputParameter``) O
<``O P
MasterCountryModel``P b
>``b c
(``c d
ProcedureMetastore``d v
.``v w&
usp_Country_SearchAllList	``w 
,
`` ‘
DatabaseConnectionaa 
.aa 

ConnStringaa )
,aa) *
outaa+ .
_countaa/ 5
,aa5 6
CommandTypeaa7 B
.aaB C
StoredProcedureaaC R
,aaR S
	_dbParamsaaT ]
)aa] ^
;aa^ _"
DataTableResponseModeldd "#
oDataTableResponseModeldd# :
=dd; <
newdd= @"
DataTableResponseModelddA W
(ddW X
modelddX ]
.dd] ^
drawdd^ b
,ddb c
_countddd j
,ddj k
lstStfddl r
.ddr s
Countdds x
,ddx y
lstStf	ddz €
)
dd€ 
;
dd ‚
returnff #
oDataTableResponseModelff *
;ff* +
}gg 	
publicii 
asyncii 
Taskii 
<ii 
Listii 
<ii '
Master_PropertySubTypeModelii :
>ii: ;
>ii; <
GetAllii= C
(iiC D
)iiD E
{jj 
returnkk 	
_mapperFactorykk
 
.kk 
GetListkk  
<kk  !!
MasterPropertySubTypekk! 6
,kk6 7'
Master_PropertySubTypeModelkk8 S
>kkS T
(kkT U
awaitkkU Z
_repositorykk[ f
.kkf g
GetAllAsynckkg r
(kkr s
)kks t
)kkt u
;kku v
}ll 
publicnn 
asyncnn 
Tasknn 
<nn 
DBOperationnn %
>nn% &&
AddUpdateMasterSubPropertynn' A
(nnA B'
Master_PropertySubTypeModelnnB ]
entitypropertynn^ l
)nnl m
{oo 	!
MasterPropertySubTyperr !
objPropertyTyperr" 1
;rr1 2
ifuu 
(uu 
entitypropertyuu 
.uu 
Iduu !
>uu" #
$numuu$ %
)uu% &
{vv 
objPropertyTypexx 
=xx  !
_repositoryxx" -
.xx- .
Getxx. 1
(xx1 2
entitypropertyxx2 @
.xx@ A
IdxxA C
)xxC D
;xxD E
if{{ 
({{ 
objPropertyType{{ #
!={{$ &
null{{' +
){{+ ,
{|| 
objPropertyType}} #
.}}# $
PropertySubType}}$ 3
=}}4 5
Convert}}6 =
.}}= >
ToString}}> F
(}}F G
entityproperty}}G U
.}}U V
PropertySubType}}V e
)}}e f
;}}f g
objPropertyType~~ #
.~~# $
IsActive~~$ ,
=~~- .
entityproperty~~/ =
.~~= >
IsActive~~> F
;~~F G
objPropertyType #
.# $
ModifiedDate$ 0
=1 2
AppConstants3 ?
.? @
DateTime@ H
;H I
objPropertyType
€€ #
.
€€# $

ModifiedBy
€€$ .
=
€€/ 0
entityproperty
€€1 ?
.
€€? @

ModifiedBy
€€@ J
;
€€J K
_repository
ƒƒ 
.
ƒƒ  
UpdateAsync
ƒƒ  +
(
ƒƒ+ ,
objPropertyType
ƒƒ, ;
)
ƒƒ; <
;
ƒƒ< =
}
„„ 
else
…… 
{
†† 
return
 
DBOperation
 &
.
& '
NotFound
' /
;
/ 0
}
‰‰ 
}
 
else
‹‹ 
{
 
objPropertyType
 
=
  !
_mapperFactory
" 0
.
0 1
Get
1 4
<
4 5)
Master_PropertySubTypeModel
5 P
,
P Q#
MasterPropertySubType
R g
>
g h
(
h i
entityproperty
i w
)
w x
;
x y
objPropertyType
 
.
  
CreatedDate
  +
=
, -
AppConstants
. :
.
: ;
DateTime
; C
;
C D
objPropertyType
 
.
  
ModifiedDate
  ,
=
- .
AppConstants
/ ;
.
; <
DateTime
< D
;
D E
objPropertyType
‘‘ 
.
‘‘  

ModifiedBy
‘‘  *
=
‘‘+ ,
entityproperty
‘‘- ;
.
‘‘; <

ModifiedBy
‘‘< F
;
‘‘F G
objPropertyType
’’ 
.
’’  
	CreatedBy
’’  )
=
’’) *
entityproperty
’’+ 9
.
’’9 :
	CreatedBy
’’: C
;
’’C D
_repository
•• 
.
•• 
AddAsync
•• $
(
••$ %
objPropertyType
••% 4
)
••4 5
;
••5 6
}
–– 
await
™™ 
_unitOfWork
™™ 
.
™™ 
SaveChangesAsync
™™ .
(
™™. /
)
™™/ 0
;
™™0 1
if
 
(
 
objPropertyType
 
.
  
Id
  "
==
# %
$num
& '
)
' (
return
 
DBOperation
 "
.
" #
Error
# (
;
( )
return
 
DBOperation
 
.
 
Success
 &
;
& '
}
   	
public
ΆΆ 
async
ΆΆ 
Task
ΆΆ 
<
ΆΆ 
DBOperation
ΆΆ %
>
ΆΆ% &
DeleteSubProperty
ΆΆ' 8
(
ΆΆ8 9
int
ΆΆ9 <
id
ΆΆ= ?
,
ΆΆ? @
int
ΆΆ@ C
?
ΆΆC D
by
ΆΆE G
)
ΆΆG H
{
££ 	
var
¥¥  
entityPropertyType
¥¥ "
=
¥¥# $
_repository
¥¥% 0
.
¥¥0 1
Get
¥¥1 4
(
¥¥4 5
x
¥¥5 6
=>
¥¥7 9
x
¥¥: ;
.
¥¥; <
Id
¥¥< >
==
¥¥? A
id
¥¥B D
)
¥¥D E
;
¥¥E F 
entityPropertyType
¦¦ 
.
¦¦ 

ModifiedBy
¦¦ )
=
¦¦* +
by
¦¦, .
??
¦¦/ 1 
entityPropertyType
¦¦2 D
.
¦¦D E

ModifiedBy
¦¦E O
;
¦¦O P
if
¨¨ 
(
¨¨  
entityPropertyType
¨¨ "
==
¨¨# %
null
¨¨& *
)
¨¨* +
return
©© 
DBOperation
©© "
.
©©" #
NotFound
©©# +
;
©©+ ,
_repository
¬¬ 
.
¬¬ 
Remove
¬¬ 
(
¬¬  
entityPropertyType
¬¬ 1
)
¬¬1 2
;
¬¬2 3
await
―― 
_unitOfWork
―― 
.
―― 
SaveChangesAsync
―― .
(
――. /
)
――/ 0
;
――0 1
return
²² 
DBOperation
²² 
.
²² 
Success
²² &
;
²²& '
}
³³ 	
}
ΈΈ 
}ΉΉ η’
PD:\EltizamLive\Eltizam.Business.Core\Implementation\MasterPropertyTypeService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
Implementation  .
{ 
public 

class %
MasterPropertyTypeService *
:+ ,&
IMasterPropertyTypeService- G
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IMapperFactory '
_mapperFactory( 6
;6 7
private 
readonly 
	Microsoft "
." #

Extensions# -
.- .
Configuration. ;
.; <
IConfiguration< J
configurationK X
;X Y
private 
IRepository 
< 
MasterPropertyType .
>. /
_repository0 ;
{< =
get> A
;A B
setC F
;F G
}H I
private 
IRepository 
< !
MasterPropertySubType 1
>1 2
_subrepository3 A
{B C
getD G
;G H
setI L
;L M
}N O
private 
readonly 
IHelper  
_helper! (
;( )
private 
readonly 
IAuditLogService )
_auditLogService* :
;: ;
public!! %
MasterPropertyTypeService!! (
(!!( )
IUnitOfWork!!) 4

unitOfWork!!5 ?
,!!? @
IMapperFactory!!A O
mapperFactory!!P ]
,!!] ^
IHelper""
 
helper"" 
,"" 
IAuditLogService"" *
auditLogService""+ :
,"": ;
	Microsoft## 
.## 

Extensions## 
.##  
Configuration##  -
.##- .
IConfiguration##. <
_configuration##= K
)##K L
{$$ 	
_unitOfWork%% 
=%% 

unitOfWork%% $
;%%$ %
_mapperFactory&& 
=&& 
mapperFactory&& *
;&&* +
_repository(( 
=(( 
_unitOfWork(( %
.((% &
GetRepository((& 3
<((3 4
MasterPropertyType((4 F
>((F G
(((G H
)((H I
;((I J
_subrepository)) 
=)) 
_unitOfWork)) (
.))( )
GetRepository))) 6
<))6 7!
MasterPropertySubType))7 L
>))L M
())M N
)))N O
;))O P
configuration** 
=** 
_configuration** *
;*** +
_helper++ 
=++ 
helper++ 
;++ 
_auditLogService,, 
=,, 
auditLogService,, .
;,,. /
}-- 	
publicAA 
asyncAA 
TaskAA 
<AA $
Master_PropertyTypeModelAA 2
>AA2 3*
GetMasterPropertyTypeByIdAsyncAA4 R
(AAR S
intAAS V
idAAW Y
)AAY Z
{BB 	
varDD 
_userEntityDD 
=DD 
newDD !$
Master_PropertyTypeModelDD" :
(DD: ;
)DD; <
;DD< =
_userEntityGG 
=GG 
_mapperFactoryGG (
.GG( )
GetGG) ,
<GG, -
MasterPropertyTypeGG- ?
,GG? @$
Master_PropertyTypeModelGGA Y
>GGY Z
(GGZ [
awaitGG[ `
_repositoryGGa l
.GGl m
GetAsyncGGm u
(GGu v
idGGv x
)GGx y
)GGy z
;GGz {
returnJJ 
_userEntityJJ 
;JJ 
}KK 	
publicMM 
asyncMM 
TaskMM 
<MM "
DataTableResponseModelMM 0
>MM0 1
GetAllMM2 8
(MM8 9"
DataTableAjaxPostModelMM9 O
modelMMP U
)MMU V
{NN 	
stringOO 

ColumnNameOO 
=OO 
modelOO  %
.OO% &
orderOO& +
.OO+ ,
CountOO, 1
>OO2 3
$numOO4 5
?OO6 7
modelOO8 =
.OO= >
columnsOO> E
[OOE F
modelOOF K
.OOK L
orderOOL Q
[OOQ R
$numOOR S
]OOS T
.OOT U
columnOOU [
]OO[ \
.OO\ ]
dataOO] a
:OOb c
stringOOd j
.OOj k
EmptyOOk p
;OOp q
stringPP 
SortDirPP 
=PP 
modelPP "
.PP" #
orderPP# (
[PP( )
$numPP) *
]PP* +
?PP+ ,
.PP, -
dirPP- 0
;PP0 1
SqlParameterRR 
[RR 
]RR 
osqlParameterRR (
=RR) *
{SS 
newTT 
SqlParameterTT  
(TT  !
AppConstantsTT! -
.TT- .
P_CurrentPageNumberTT. A
,TTA B
modelTTD I
.TTI J
startTTJ O
)TTO P
,TTP Q
newUU 
SqlParameterUU  
(UU  !
AppConstantsUU! -
.UU- .

P_PageSizeUU. 8
,UU8 9
modelUUD I
.UUI J
lengthUUJ P
)UUP Q
,UUQ R
newVV 
SqlParameterVV  
(VV  !
AppConstantsVV! -
.VV- .
P_SortColumnVV. :
,VV: ;

ColumnNameVVD N
)VVN O
,VVO P
newWW 
SqlParameterWW  
(WW  !
AppConstantsWW! -
.WW- .
P_SortDirectionWW. =
,WW= >
SortDirWWD K
)WWK L
,WWL M
newXX 
SqlParameterXX  
(XX  !
AppConstantsXX! -
.XX- .
P_SearchTextXX. :
,XX: ;
modelXXD I
.XXI J
searchXXJ P
?XXP Q
.XXQ R
valueXXR W
)XXW X
}YY 
;YY 
var[[ 
Results[[ 
=[[ 
await[[ 
_repository[[  +
.[[+ ,
GetBySP[[, 3
([[3 4
ProcedureMetastore[[4 F
.[[F G*
usp_PropertyType_SearchAllList[[G e
,[[e f
CommandType[[g r
.[[r s
StoredProcedure	[[s ‚
,
[[‚ ƒ
osqlParameter
[[„ ‘
)
[[‘ ’
;
[[’ “
var^^ 
res^^ 
=^^ 
UtilityHelper^^ #
.^^# $
GetPaginationInfo^^$ 5
(^^5 6
Results^^6 =
)^^= >
;^^> ?"
DataTableResponseModel`` "#
oDataTableResponseModel``# :
=``; <
new``= @"
DataTableResponseModel``A W
(``W X
model``X ]
.``] ^
draw``^ b
,``b c
res``d g
.``g h
Item1``h m
,``m n
res``o r
.``r s
Item1``s x
,``x y
Results	``z 
.
`` ‚
DataTableToList
``‚ ‘
<
``‘ ’&
Master_PropertyTypeModel
``’ ª
>
``ª «
(
``« ¬
)
``¬ ­
)
``­ ®
;
``® ―
returnbb #
oDataTableResponseModelbb *
;bb* +
}cc 	
publicee 
asyncee 
Taskee 
<ee 
Listee 
<ee $
Master_PropertyTypeModelee 7
>ee7 8
>ee8 9

GetAllListee: D
(eeD E
)eeE F
{ff 	
vargg 
lstStfgg 
=gg 
EltizamDBHelpergg (
.gg( )
ExecuteMappedReadergg) <
<gg< =$
Master_PropertyTypeModelgg= U
>ggU V
(ggV W
ProcedureMetastoreggW i
.ggi j+
usp_PropertyType_SearchAllList	ggj 
,
gg ‰
DatabaseConnectionhh +
.hh+ ,

ConnStringhh, 6
,hh6 7
CommandTypehh8 C
.hhC D
StoredProcedurehhD S
,hhS T
nullhhU Y
)hhY Z
;hhZ [
returnjj 
lstStfjj 
;jj 
}kk 	
privatell 
boolll '
IsPropertyDescriptionExistsll 0
(ll0 1
stringll1 7
propertyTypell8 D
)llD E
{mm 	
returnnn 
_repositorynn 
.nn 
GetAllnn %
(nn% &
)nn& '
.oo 
Anyoo 
(oo 
propertyoo 
=>oo  
propertyoo! )
.oo) *
PropertyTypeoo* 6
==oo7 9
propertyTypeoo: F
)ooF G
;ooG H
}pp 	
publicqq 
asyncqq 
Taskqq 
<qq 
DBOperationqq %
>qq% &'
AddUpdateMasterPropertyTypeqq' B
(qqB C$
Master_PropertyTypeModelqqC [
masterpropertyqq\ j
)qqj k
{rr 	
ifss 
(ss 
masterpropertyss "
!=ss# %
nullss& *
&&ss+ -
masterpropertyss. <
.ss< =
PropertyTypess= I
!=ssJ L
nullssM Q
&&ssR T
masterpropertyssU c
.ssc d
Idssd f
==ssg i
$numssj k
)ssk l
{tt 
varuu 
resultuu 
=uu  '
IsPropertyDescriptionExistsuu! <
(uu< =
masterpropertyuu= K
.uuK L
PropertyTypeuuL X
)uuX Y
;uuY Z
ifvv 
(vv 
resultvv 
)vv 
{ww 
returnxx 
DBOperationxx *
.xx* +
AlreadyExistxx+ 7
;xx7 8
}yy 
}zz 
MasterPropertyType|| "
type||# '
;||' (
string}} 
MainTableName}}  
=}}! "
Enum}}# '
.}}' (
GetName}}( /
(}}/ 0
TableNameEnum}}0 =
.}}= >
Master_PropertyType}}> Q
)}}Q R
;}}R S
int~~ 
MainTableKey~~ 
=~~ 
masterproperty~~ -
.~~- .
Id~~. 0
;~~0 1
MasterPropertyType 
	OldEntity (
=) *
null+ /
;/ 0
if
‚‚ 
(
‚‚ 
masterproperty
‚‚ 
.
‚‚ 
Id
‚‚ !
>
‚‚" #
$num
‚‚$ %
)
‚‚% &
{
ƒƒ 
	OldEntity
„„ 
=
„„ 
_repository
„„ '
.
„„' (
GetNoTracking
„„( 5
(
„„5 6
masterproperty
„„6 D
.
„„D E
Id
„„E G
)
„„G H
;
„„H I
type
…… 
=
…… 
_repository
…… "
.
……" #
Get
……# &
(
……& '
masterproperty
……' 5
.
……5 6
Id
……6 8
)
……8 9
;
……9 :
type
‡‡ 
=
‡‡ 
_repository
‡‡ "
.
‡‡" #
Get
‡‡# &
(
‡‡& '
masterproperty
‡‡' 5
.
‡‡5 6
Id
‡‡6 8
)
‡‡8 9
;
‡‡9 :
if
 
(
 
type
 
!=
 
null
  
)
  !
{
‹‹ 
type
 
.
 
PropertyType
 %
=
& '
masterproperty
( 6
.
6 7
PropertyType
7 C
;
C D
type
 
.
 
IsActive
 !
=
" #
masterproperty
$ 2
.
2 3
IsActive
3 ;
;
; <
type
 
.
 

ModifiedBy
 #
=
$ %
masterproperty
& 4
.
4 5

ModifiedBy
5 ?
;
? @
_repository
‘‘ 
.
‘‘  
UpdateAsync
‘‘  +
(
‘‘+ ,
type
‘‘, 0
)
‘‘0 1
;
‘‘1 2
await
““ 
_auditLogService
““ +
.
““+ ,
CreateAuditLog
““, :
<
““: ; 
MasterPropertyType
““; M
>
““M N
(
““N O!
AuditActionTypeEnum
““O b
.
““b c
Update
““c i
,
““i j
	OldEntity
““k t
,
““t u
type
““v z
,
““z {
MainTableName““| ‰
,““‰ 
MainTableKey““‹ —
)““— 
;““ ™
}
•• 
}
–– 
else
—— 
{
 
type
™™ 
=
™™ 
new
™™  
MasterPropertyType
™™ -
(
™™- .
)
™™. /
{
 
IsActive
›› 
=
›› 
masterproperty
›› -
.
››- .
IsActive
››. 6
,
››6 7
PropertyType
  
=
! "
masterproperty
# 1
.
1 2
PropertyType
2 >
,
> ?
	CreatedBy
 
=
 
masterproperty
  .
.
. /
	CreatedBy
/ 8
}
 
;
 
_repository
΅΅ 
.
΅΅ 
AddAsync
΅΅ $
(
΅΅$ %
type
΅΅% )
)
΅΅) *
;
΅΅* +
}
ΆΆ 
await
¥¥ 
_unitOfWork
¥¥ 
.
¥¥ 
SaveChangesAsync
¥¥ .
(
¥¥. /
)
¥¥/ 0
;
¥¥0 1
if
«« 
(
«« 
type
«« 
.
«« 
Id
«« 
==
«« 
$num
«« 
)
«« 
return
¬¬ 
DBOperation
¬¬ "
.
¬¬" #
Error
¬¬# (
;
¬¬( )
else
­­ 
{
®® 
var
―― 
subTypes
―― 
=
―― 
masterproperty
―― -
.
――- .$
MasterPropertySubTypes
――. D
;
――D E
var
°° 
_Val
°° 
=
°° 
$str
°° 
;
°° 
if
±± 
(
±± 
subTypes
±± 
!=
±± 
null
±±  $
)
±±$ %
{
²² 
foreach
³³ 
(
³³ 
var
³³  
_stype
³³! '
in
³³( *
subTypes
³³+ 3
)
³³3 4
{
΄΄ 
_Val
µµ 
+=
µµ 
string
µµ  &
.
µµ& '
Format
µµ' -
(
µµ- .
$str
µµ. 8
,
µµ8 9
_stype
µµ: @
.
µµ@ A
Id
µµA C
,
µµC D
_stype
µµE K
.
µµK L
PropertySubType
µµL [
)
µµ[ \
;
µµ\ ]
}
¶¶ 
}
·· 
SqlParameter
ΉΉ 
[
ΉΉ 
]
ΉΉ 
_sqlParameter
ΉΉ ,
=
ΉΉ- .
{
ΊΊ 
new
»» 
SqlParameter
»» $
(
»»$ %
AppConstants
»»% 1
.
»»1 2
P_Id
»»2 6
,
»»6 7
type
»»D H
.
»»H I
Id
»»I K
)
»»K L
,
»»L M
new
ΌΌ 
SqlParameter
ΌΌ $
(
ΌΌ$ %
AppConstants
ΌΌ% 1
.
ΌΌ1 2
P_CreatedBy
ΌΌ2 =
,
ΌΌ= >
masterproperty
ΌΌD R
.
ΌΌR S
LogInUserId
ΌΌS ^
)
ΌΌ^ _
,
ΌΌ_ `
new
½½ 
SqlParameter
½½ $
(
½½$ %
AppConstants
½½% 1
.
½½1 2
P_RequestData
½½2 ?
,
½½? @
_Val
½½D H
)
½½H I
}
ΎΎ 
;
ΎΎ 
await
ΐΐ 
_repository
ΐΐ !
.
ΐΐ! "
GetBySP
ΐΐ" )
(
ΐΐ) * 
ProcedureMetastore
ΐΐ* <
.
ΐΐ< =-
usp_PropertyType_UpsertSubTypes
ΐΐ= \
,
ΐΐ\ ]
CommandType
ΐΐ^ i
.
ΐΐi j
StoredProcedure
ΐΐj y
,
ΐΐy z
_sqlParameterΐΐ{ 
)ΐΐ ‰
;ΐΐ‰ 
}
ΑΑ 
return
ΓΓ 
DBOperation
ΓΓ 
.
ΓΓ 
Success
ΓΓ &
;
ΓΓ& '
}
ΔΔ 	
public
ΖΖ 
async
ΖΖ 
Task
ΖΖ 
<
ΖΖ 
DBOperation
ΖΖ %
>
ΖΖ% & 
DeletePropertyType
ΖΖ' 9
(
ΖΖ9 :
int
ΖΖ: =
id
ΖΖ> @
,
ΖΖ@ A
int
ΖΖA D
?
ΖΖD E
by
ΖΖF H
)
ΖΖH I
{
ΗΗ 	
var
ΘΘ 
entityProperty
ΘΘ 
=
ΘΘ  
_repository
ΘΘ! ,
.
ΘΘ, -
Get
ΘΘ- 0
(
ΘΘ0 1
x
ΘΘ1 2
=>
ΘΘ3 5
x
ΘΘ6 7
.
ΘΘ7 8
Id
ΘΘ8 :
==
ΘΘ; =
id
ΘΘ> @
)
ΘΘ@ A
;
ΘΘA B
entityProperty
ΙΙ 
.
ΙΙ 

ModifiedBy
ΙΙ %
=
ΙΙ& '
by
ΙΙ( *
??
ΙΙ+ -
entityProperty
ΙΙ. <
.
ΙΙ< =

ModifiedBy
ΙΙ= G
;
ΙΙG H
if
ΛΛ 
(
ΛΛ 
entityProperty
ΛΛ 
==
ΛΛ !
null
ΛΛ" &
)
ΛΛ& '
return
ΜΜ 
DBOperation
ΜΜ "
.
ΜΜ" #
NotFound
ΜΜ# +
;
ΜΜ+ ,
else
ΝΝ 
{
ΞΞ 
var
ΟΟ &
subPropertiesByPopertyId
ΟΟ ,
=
ΟΟ- .
_subrepository
ΟΟ/ =
.
ΟΟ= >
GetAll
ΟΟ> D
(
ΟΟD E
)
ΟΟE F
.
ΟΟF G
Where
ΟΟG L
(
ΟΟL M
x
ΟΟM N
=>
ΟΟO Q
x
ΟΟR S
.
ΟΟS T
PropertyTypeId
ΟΟT b
==
ΟΟc e
id
ΟΟf h
)
ΟΟh i
.
ΟΟi j
ToList
ΟΟj p
(
ΟΟp q
)
ΟΟq r
;
ΟΟr s
if
ΠΠ 
(
ΠΠ &
subPropertiesByPopertyId
ΠΠ ,
.
ΠΠ, -
Count
ΠΠ- 2
>
ΠΠ3 4
$num
ΠΠ5 6
)
ΠΠ6 7
{
ΡΡ 
foreach
ÒÒ 
(
ÒÒ 
var
ÒÒ  
item
ÒÒ! %
in
ÒÒ& (&
subPropertiesByPopertyId
ÒÒ) A
)
ÒÒA B
{
ΣΣ 
_subrepository
ΤΤ &
.
ΤΤ& '
Remove
ΤΤ' -
(
ΤΤ- .
item
ΤΤ. 2
)
ΤΤ2 3
;
ΤΤ3 4
}
ΥΥ 
}
ΦΦ 
_repository
ΧΧ 
.
ΧΧ 
Remove
ΧΧ "
(
ΧΧ" #
entityProperty
ΧΧ# 1
)
ΧΧ1 2
;
ΧΧ2 3
await
ΩΩ 
_unitOfWork
ΩΩ !
.
ΩΩ! "
SaveChangesAsync
ΩΩ" 2
(
ΩΩ2 3
)
ΩΩ3 4
;
ΩΩ4 5
return
άά 
DBOperation
άά "
.
άά" #
Success
άά# *
;
άά* +
}
έέ 
}
ίί 	
public
αα 
async
αα 
Task
αα 
<
αα 
bool
αα 
>
αα (
CheckDuplicatePropertyType
αα  :
(
αα: ;
string
αα; A
PropertyType
ααB N
)
ααN O
{
ββ 	
var
γγ 
dd
γγ 
=
γγ 
$num
γγ 
;
γγ 
return
δδ 
false
δδ 
;
δδ 
}
εε 	
}
θθ 
}ιι Φk
RD:\EltizamLive\Eltizam.Business.Core\Implementation\MasterQualificationServices.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
Implementation  .
{ 
public 

class '
MasterQualificationServices ,
:- .(
IMasterQualificationServices/ K
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IMapperFactory '
_mapperFactory( 6
;6 7
private 
readonly 
IStringLocalizer )
<) *
Errors* 0
>0 1!
_stringLocalizerError2 G
;G H
private 
readonly 
	Microsoft "
." #

Extensions# -
.- .
Configuration. ;
.; <
IConfiguration< J
configurationK X
;X Y
private 
IRepository 
<  
Master_Qualification 0
>0 1
_repository2 =
{> ?
get@ C
;C D
setE H
;H I
}J K
private 
readonly 
IHelper  
_helper! (
;( )
private 
readonly 
int 
_LoginUserId )
;) *
public '
MasterQualificationServices *
(* +
IUnitOfWork+ 6

unitOfWork7 A
,A B
IMapperFactoryC Q
mapperFactoryR _
,_ `
IStringLocalizera q
<q r
Errorsr x
>x y!
stringLocalizerError	z 
,
 
IHelper 
helper 
, 
	Microsoft  )
.) *

Extensions* 4
.4 5
Configuration5 B
.B C
IConfigurationC Q
_configurationR `
)` a
{ 	
_unitOfWork   
=   

unitOfWork   $
;  $ %
_mapperFactory!! 
=!! 
mapperFactory!! *
;!!* +
_repository## 
=## 
_unitOfWork## %
.##% &
GetRepository##& 3
<##3 4 
Master_Qualification##4 H
>##H I
(##I J
)##J K
;##K L
configuration$$ 
=$$ 
_configuration$$ *
;$$* +
_helper%% 
=%% 
helper%% 
;%% 
_LoginUserId'' 
='' 
_helper'' "
.''" #
GetLoggedInUser''# 2
(''2 3
)''3 4
.''4 5
UserId''5 ;
;''; <
}(( 	
public<< 
async<< 
Task<< 
<<< %
Master_QualificationModel<< 3
><<3 4+
GetMasterQualificationByIdAsync<<5 T
(<<T U
int<<U X
id<<Y [
)<<[ \
{== 	
var??  
_QualificationEntity?? $
=??% &
new??' *%
Master_QualificationModel??+ D
(??D E
)??E F
;??F G 
_QualificationEntityBB  
=BB! "
_mapperFactoryBB# 1
.BB1 2
GetBB2 5
<BB5 6 
Master_QualificationBB6 J
,BBJ K%
Master_QualificationModelBBL e
>BBe f
(BBf g
awaitBBg l
_repositoryBBm x
.BBx y
GetAsync	BBy 
(
BB ‚
id
BB‚ „
)
BB„ …
)
BB… †
;
BB† ‡
returnEE  
_QualificationEntityEE '
;EE' (
}FF 	
publicHH 
asyncHH 
TaskHH 
<HH "
DataTableResponseModelHH 0
>HH0 1
GetAllHH2 8
(HH8 9"
DataTableAjaxPostModelHH9 O
modelHHP U
)HHU V
{II 	
stringKK 

ColumnNameKK 
=KK 
(KK  !
modelKK! &
.KK& '
orderKK' ,
.KK, -
CountKK- 2
>KK3 4
$numKK5 6
?KK7 8
modelKK9 >
.KK> ?
columnsKK? F
[KKF G
modelKKG L
.KKL M
orderKKM R
[KKR S
$numKKS T
]KKT U
.KKU V
columnKKV \
]KK\ ]
.KK] ^
dataKK^ b
:KKc d
stringKKe k
.KKk l
EmptyKKl q
)KKq r
;KKr s
stringLL 
SortDirLL 
=LL 
(LL 
modelLL #
.LL# $
orderLL$ )
.LL) *
CountLL* /
>LL0 1
$numLL2 3
?LL4 5
modelLL6 ;
.LL; <
orderLL< A
[LLA B
$numLLB C
]LLC D
.LLD E
dirLLE H
:LLI J
stringLLK Q
.LLQ R
EmptyLLR W
)LLW X
;LLX Y
SqlParameterOO 
[OO 
]OO 
osqlParameterOO (
=OO) *
{PP 
newQQ 
SqlParameterQQ  
(QQ  !
$strQQ! &
,QQ& '
$numQQ( )
)QQ) *
,QQ* +
newRR 
SqlParameterRR  
(RR  !
$strRR! 5
,RR5 6
modelRR7 <
.RR< =
startRR= B
)RRB C
,RRC D
newSS 
SqlParameterSS  
(SS  !
$strSS! ,
,SS, -
modelSS. 3
.SS3 4
lengthSS4 :
)SS: ;
,SS; <
newTT 
SqlParameterTT  
(TT  !
$strTT! .
,TT. /

ColumnNameTT0 :
)TT: ;
,TT; <
newUU 
SqlParameterUU  
(UU  !
$strUU! 1
,UU1 2
SortDirUU3 :
)UU: ;
,UU; <
newVV 
SqlParameterVV  
(VV  !
$strVV! .
,VV. /
modelVV0 5
.VV5 6
searchVV6 <
.VV< =
valueVV= B
)VVB C
}WW 
;WW 
varZZ 
QualificationListZZ !
=ZZ" #
awaitZZ$ )
_repositoryZZ* 5
.ZZ5 6
GetBySPZZ6 =
(ZZ= >
$strZZ> l
,ZZl m
SystemZZn t
.ZZt u
DataZZu y
.ZZy z
CommandType	ZZz …
.
ZZ… †
StoredProcedure
ZZ† •
,
ZZ• –
osqlParameter
ZZ— ¤
)
ZZ¤ ¥
;
ZZ¥ ¦
var]] 
TotalRecord]] 
=]] 
(]] 
QualificationList]] 0
!=]]1 3
null]]4 8
&&]]9 ;
QualificationList]]< M
.]]M N
Rows]]N R
.]]R S
Count]]S X
>]]Y Z
$num]][ \
?]]] ^
Convert]]_ f
.]]f g
ToInt32]]g n
(]]n o
QualificationList	]]o €
.
]]€ 
Rows
]] …
[
]]… †
$num
]]† ‡
]
]]‡ 
[
]] ‰
$str
]]‰ –
]
]]– —
)
]]— 
:
]]™ 
$num
]]› 
)
]] 
;
]] 
var^^ 

TotalCount^^ 
=^^ 
(^^ 
QualificationList^^ /
!=^^0 2
null^^3 7
&&^^8 :
QualificationList^^; L
.^^L M
Rows^^M Q
.^^Q R
Count^^R W
>^^X Y
$num^^Z [
?^^\ ]
Convert^^^ e
.^^e f
ToInt32^^f m
(^^m n
QualificationList^^n 
.	^^ €
Rows
^^€ „
[
^^„ …
$num
^^… †
]
^^† ‡
[
^^‡ 
$str
^^ ”
]
^^” •
)
^^• –
:
^^— 
$num
^^™ 
)
^^ ›
;
^^› "
DataTableResponseModelaa "#
oDataTableResponseModelaa# :
=aa; <
newaa= @"
DataTableResponseModelaaA W
(aaW X
modelaaX ]
.aa] ^
drawaa^ b
,aab c
TotalRecordaad o
,aao p

TotalCountaaq {
,aa{ |
QualificationList	aa} 
.
aa 
DataTableToList
aa 
<
aa '
Master_QualificationModel
aa Έ
>
aaΈ Ή
(
aaΉ Ί
)
aaΊ »
)
aa» Ό
;
aaΌ ½
returndd #
oDataTableResponseModeldd *
;dd* +
}ee 	
publicgg 
asyncgg 
Taskgg 
<gg 
DBOperationgg %
>gg% &"
AddUpdateQualificationgg' =
(gg= >%
Master_QualificationModelgg> W
entityqualificationggX k
)ggk l
{hh 	 
Master_Qualificationjj  
objQualificationjj! 1
;jj1 2
ifmm 
(mm 
entityqualificationmm #
.mm# $
Idmm$ &
>mm' (
$nummm) *
)mm* +
{nn 
objQualificationpp  
=pp! "
_repositorypp# .
.pp. /
Getpp/ 2
(pp2 3
entityqualificationpp3 F
.ppF G
IdppG I
)ppI J
;ppJ K
ifss 
(ss 
objQualificationss $
!=ss% '
nullss( ,
)ss, -
{tt 
objQualificationuu $
.uu$ %
Qualificationuu% 2
=uu3 4
entityqualificationuu5 H
.uuH I
QualificationuuI V
;uuV W
objQualificationvv $
.vv$ %
Subjectvv% ,
=vv- .
entityqualificationvv/ B
.vvB C
SubjectvvC J
;vvJ K
objQualificationww $
.ww$ %
	Instituteww% .
=ww/ 0
entityqualificationww1 D
.wwD E
	InstitutewwE N
;wwN O
objQualificationxx $
.xx$ %
Gradexx% *
=xx+ ,
entityqualificationxx- @
.xx@ A
GradexxA F
;xxF G
objQualificationyy $
.yy$ %
YearOfInstituteyy% 4
=yy5 6
entityqualificationyy7 J
.yyJ K
YearOfInstituteyyK Z
;yyZ [
objQualificationzz $
.zz$ %
IsActivezz% -
=zz. /
entityqualificationzz0 C
.zzC D
IsActivezzD L
;zzL M
objQualification{{ $
.{{$ %
ModifiedDate{{% 1
={{2 3
AppConstants{{4 @
.{{@ A
DateTime{{A I
;{{I J
objQualification|| $
.||$ %

ModifiedBy||% /
=||0 1
_LoginUserId||2 >
;||> ?
_repository 
.  
UpdateAsync  +
(+ ,
objQualification, <
)< =
;= >
}
€€ 
else
 
{
‚‚ 
return
„„ 
DBOperation
„„ &
.
„„& '
NotFound
„„' /
;
„„/ 0
}
…… 
}
†† 
else
‡‡ 
{
 
objQualification
  
=
! "
_mapperFactory
# 1
.
1 2
Get
2 5
<
5 6'
Master_QualificationModel
6 O
,
O P"
Master_Qualification
Q e
>
e f
(
f g!
entityqualification
g z
)
z {
;
{ |
objQualification
‹‹  
.
‹‹  !
CreatedDate
‹‹! ,
=
‹‹- .
AppConstants
‹‹/ ;
.
‹‹; <
DateTime
‹‹< D
;
‹‹D E
objQualification
  
.
  !
	CreatedBy
! *
=
+ ,
_LoginUserId
- 9
;
9 :
objQualification
  
.
  !

ModifiedBy
! +
=
, -
_LoginUserId
. :
;
: ;
objQualification
  
.
  !
ModifiedDate
! -
=
. /
AppConstants
0 <
.
< =
DateTime
= E
;
E F
_repository
‘‘ 
.
‘‘ 
AddAsync
‘‘ $
(
‘‘$ %
objQualification
‘‘% 5
)
‘‘5 6
;
‘‘6 7
}
’’ 
await
•• 
_unitOfWork
•• 
.
•• 
SaveChangesAsync
•• .
(
••. /
)
••/ 0
;
••0 1
if
 
(
 
objQualification
  
.
  !
Id
! #
==
$ &
$num
' (
)
( )
return
™™ 
DBOperation
™™ "
.
™™" #
Error
™™# (
;
™™( )
return
›› 
DBOperation
›› 
.
›› 
Success
›› &
;
››& '
}
 	
public
 
async
 
Task
 
<
 
DBOperation
 %
>
% &!
DeleteQualification
' :
(
: ;
int
; >
id
? A
)
A B
{
 	
var
΅΅ !
entityQualification
΅΅ #
=
΅΅$ %
_repository
΅΅& 1
.
΅΅1 2
Get
΅΅2 5
(
΅΅5 6
x
΅΅6 7
=>
΅΅8 :
x
΅΅; <
.
΅΅< =
Id
΅΅= ?
==
΅΅@ B
id
΅΅C E
)
΅΅E F
;
΅΅F G
if
¤¤ 
(
¤¤ !
entityQualification
¤¤ #
==
¤¤$ &
null
¤¤' +
)
¤¤+ ,
return
¥¥ 
DBOperation
¥¥ "
.
¥¥" #
NotFound
¥¥# +
;
¥¥+ ,
_repository
¨¨ 
.
¨¨ 
Remove
¨¨ 
(
¨¨ !
entityQualification
¨¨ 2
)
¨¨2 3
;
¨¨3 4
await
«« 
_unitOfWork
«« 
.
«« 
SaveChangesAsync
«« .
(
««. /
)
««/ 0
;
««0 1
return
®® 
DBOperation
®® 
.
®® 
Success
®® &
;
®®& '
}
―― 	
}
²² 
}³³ λ1
XD:\EltizamLive\Eltizam.Business.Core\Implementation\MasterRoleModulePermissionService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
Implementation  .
{ 
public 

class -
!MasterRoleModulePermissionService 2
:3 4'
IMasterRoleModulePermission5 P
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IMapperFactory '
_mapperFactory( 6
;6 7
private 
IRepository 
< &
MasterRoleModulePermission 6
>6 7
_repository8 C
{D E
getF I
;I J
setK N
;N O
}P Q
public -
!MasterRoleModulePermissionService 0
(0 1
IUnitOfWork1 <

unitOfWork= G
,G H
IMapperFactoryI W
mapperFactoryX e
)e f
{ 	
_unitOfWork 
= 

unitOfWork $
;$ %
_mapperFactory 
= 
mapperFactory *
;* +
_repository 
= 
_unitOfWork %
.% &
GetRepository& 3
<3 4&
MasterRoleModulePermission4 N
>N O
(O P
)P Q
;Q R
} 	
public 
async 
Task 
< 
DBOperation %
>% &)
AddUpdateRoleModulePermission' D
(D E
ListE I
<I J&
RoleModulePermissionEntityJ d
>d e(
roleModulePermissionEntitys	f 
)
 ‚
{ 	
List 
< &
MasterRoleModulePermission +
>+ ,#
objRoleModulePermission- D
;D E
if 
( '
roleModulePermissionEntitys +
.+ ,
Count, 1
>2 3
$num4 5
)5 6
{   
var!! )
objRoleModulePermissionEntity!! 1
=!!2 3'
roleModulePermissionEntitys!!4 O
.!!O P
FirstOrDefault!!P ^
(!!^ _
)!!_ `
;!!` a
await"" &
DeleteRoleModulePermission"" 0
(""0 1)
objRoleModulePermissionEntity""1 N
.""N O
RoleId""O U
)""U V
;""V W
}## #
objRoleModulePermission%% #
=%%$ %
_mapperFactory%%& 4
.%%4 5
GetList%%5 <
<%%< =&
RoleModulePermissionEntity%%= W
,%%W X&
MasterRoleModulePermission%%Y s
>%%s t
(%%t u(
roleModulePermissionEntitys	%%u 
)
%% ‘
;
%%‘ ’
foreach'' 
('' 
var'' 
per'' 
in'' #
objRoleModulePermission''  7
)''7 8
{(( 
if)) 
()) 
per)) 
.)) 
View)) 
==)) 
false))  %
)))% &
per** 
.** 
View** 
=** 
(**  
per**  #
.**# $
Add**$ '
==**( *
true**+ /
||**0 2
per**3 6
.**6 7
Delete**7 =
==**> @
true**A E
||**F H
per**I L
.**L M
Edit**M Q
==**R T
true**U Y
||**Z \
per**] `
.**` a
Approve**a h
==**i k
true**l p
)**p q
?**r s
true**t x
:**y z
false	**{ €
;
**€ 
_repository,, 
.,, 
AddAsync,, $
(,,$ %
per,,% (
),,( )
;,,) *
await-- 
_unitOfWork-- !
.--! "
SaveChangesAsync--" 2
(--2 3
)--3 4
;--4 5
}.. 
if00 
(00 #
objRoleModulePermission00 '
.00' (
Count00( -
==00. 0
$num001 2
)002 3
return11 
DBOperation11 "
.11" #
Error11# (
;11( )
return33 
DBOperation33 
.33 
Success33 &
;33& '
}44 	
public66 
async66 
Task66 
<66 
DBOperation66 %
>66% &&
DeleteRoleModulePermission66' A
(66A B
int66B E
id66F H
)66H I
{77 	
var88 

entityRole88 
=88 
await88 "
_repository88# .
.88. /
GetAllAsync88/ :
(88: ;
x88; <
=>88= ?
x88@ A
.88A B
RoleId88B H
==88I K
id88L N
)88N O
;88O P
if:: 
(:: 
!:: 

entityRole:: 
.:: 
Any:: 
(::  
)::  !
)::! "
return;; 
DBOperation;; "
.;;" #
NotFound;;# +
;;;+ ,
foreach== 
(== 
var== 

roleModule== #
in==$ &

entityRole==' 1
)==1 2
{>> 
_repository?? 
.?? 
Remove?? "
(??" #

roleModule??# -
)??- .
;??. /
await@@ 
_unitOfWork@@ !
.@@! "
SaveChangesAsync@@" 2
(@@2 3
)@@3 4
;@@4 5
}AA 
returnCC 
DBOperationCC 
.CC 
SuccessCC &
;CC& '
}DD 	
publicFF 
TaskFF 
<FF 
ListFF 
<FF &
RoleModulePermissionEntityFF 3
>FF3 4
>FF4 5
GetAllFF6 <
(FF< =
)FF= >
{GG 	
throwHH 
newHH #
NotImplementedExceptionHH -
(HH- .
)HH. /
;HH/ 0
}II 	
publicKK 
TaskKK 
<KK 
MasterRoleEntityKK $
>KK$ %
GetByIdKK& -
(KK- .
intKK. 1
idKK2 4
)KK4 5
{LL 	
throwMM 
newMM #
NotImplementedExceptionMM -
(MM- .
)MM. /
;MM/ 0
}NN 	
}OO 
}PP Φ¤
HD:\EltizamLive\Eltizam.Business.Core\Implementation\MasterRoleService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
Implementation  .
{ 
public 

class 
MasterRoleService "
:# $
IMasterRoleService% 7
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IMapperFactory '
_mapperFactory( 6
;6 7
private 
IRepository 
< 

MasterRole &
>& '
_repository( 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
private 
readonly '
IMasterRoleModulePermission 4!
_roleModulePermission5 J
;J K
private 
IRepository 
< 

MasterUser &
>& '
_Userrepository( 7
{8 9
get: =
;= >
set? B
;B C
}D E
private 
readonly 
IMemoryCache %
_memoryCache& 2
;2 3
private 
readonly 
IAuditLogService )
_auditLogService* :
;: ;
public 
MasterRoleService  
(  !
IUnitOfWork! ,

unitOfWork- 7
,7 8
IMapperFactory9 G
mapperFactoryH U
,U V'
IMasterRoleModulePermissionW r!
roleModulePermission	s ‡
,
‡ 
IMemoryCache
‰ •
memoryCache
– ΅
,
΅ Ά
IAuditLogService
£ ³
auditLogService
΄ Γ
)
Γ Δ
{ 	
_unitOfWork 
= 

unitOfWork $
;$ %
_mapperFactory 
= 
mapperFactory *
;* +!
_roleModulePermission   !
=  " # 
roleModulePermission  $ 8
;  8 9
_memoryCache!! 
=!! 
memoryCache!! &
;!!& '
_repository"" 
="" 
_unitOfWork"" %
.""% &
GetRepository""& 3
<""3 4

MasterRole""4 >
>""> ?
(""? @
)""@ A
;""A B
_Userrepository## 
=## 
_unitOfWork## )
.##) *
GetRepository##* 7
<##7 8

MasterUser##8 B
>##B C
(##C D
)##D E
;##E F
_auditLogService$$ 
=$$ 
auditLogService$$ .
;$$. /
}%% 	
public'' 
async'' 
Task'' 
<'' 
DBOperation'' %
>''% &
AddUpdateRole''' 4
(''4 5
MasterRoleEntity''5 E
masterRoleEntity''F V
)''V W
{(( 	

MasterRole)) 
objRole)) 
;)) 
string** 
MainTableName**  
=**! "
Enum**# '
.**' (
GetName**( /
(**/ 0
TableNameEnum**0 =
.**= >
Master_Role**> I
)**I J
;**J K
int++ 
MainTableKey++ 
=++ 
masterRoleEntity++ /
.++/ 0
Id++0 2
;++2 3
var,, 
LoggedUserId,, 
=,, 
masterRoleEntity,, /
.,,/ 0
LoggedUserId,,0 <
;,,< =

MasterRole-- 
	OldEntity--  
=--! "
null--# '
;--' (
if.. 
(.. 
masterRoleEntity..  
...  !
Id..! #
>..$ %
$num..& '
)..' (
{// 
	OldEntity00 
=00 
_repository00 '
.00' (
GetNoTracking00( 5
(005 6
masterRoleEntity006 F
.00F G
Id00G I
)00I J
;00J K
objRole11 
=11 
_repository11 %
.11% &
Get11& )
(11) *
masterRoleEntity11* :
.11: ;
Id11; =
)11= >
;11> ?
if33 
(33 
!33 
masterRoleEntity33 %
.33% &
IsActive33& .
)33. /
{44 
var55 
IsUserExist55 #
=55$ %
_Userrepository55& 5
.555 6
GetAllQuery556 A
(55A B
)55B C
.55C D
Where55D I
(55I J
x55J K
=>55L N
x55O P
.55P Q
RoleId55Q W
==55X Z
masterRoleEntity55[ k
.55k l
Id55l n
)55n o
.55o p
ToList55p v
(55v w
)55w x
;55x y
if66 
(66 
IsUserExist66 #
.66# $
Count66$ )
>66* +
$num66, -
)66- .
masterRoleEntity77 (
.77( )
IsActive77) 1
=772 3
true774 8
;778 9
}88 
objRole99 
=99 
_repository99 %
.99% &
Get99& )
(99) *
masterRoleEntity99* :
.99: ;
Id99; =
)99= >
;99> ?
var;; 

OldObjRole;; 
=;;  
objRole;;! (
;;;( )
if<< 
(<< 
objRole<< 
!=<< 
null<< #
)<<# $
{== 
objRole>> 
=>> 
_mapperFactory>> ,
.>>, -
Get>>- 0
<>>0 1
MasterRoleEntity>>1 A
,>>A B

MasterRole>>C M
>>>M N
(>>N O
masterRoleEntity>>O _
)>>_ `
;>>` a
objRole?? 
.?? 

ModifiedBy?? &
=??' (
masterRoleEntity??) 9
.??9 :

ModifiedBy??: D
;??D E
objRole@@ 
.@@ 
ModifiedDate@@ (
=@@) *
AppConstants@@+ 7
.@@7 8
DateTime@@8 @
;@@@ A
objRoleAA 
.AA 
IsActiveAA $
=AA% &
masterRoleEntityAA' 7
.AA7 8
IsActiveAA8 @
;AA@ A
_repositoryBB 
.BB  
UpdateAsyncBB  +
(BB+ ,
objRoleBB, 3
)BB3 4
;BB4 5
awaitDD 
_unitOfWorkDD %
.DD% &
SaveChangesAsyncDD& 6
(DD6 7
)DD7 8
;DD8 9
awaitFF 
_auditLogServiceFF *
.FF* +
CreateAuditLogFF+ 9
<FF9 :

MasterRoleFF: D
>FFD E
(FFE F
AuditActionTypeEnumFFF Y
.FFY Z
UpdateFFZ `
,FF` a
	OldEntityFFb k
,FFk l
objRoleFFm t
,FFt u
MainTableName	FFv ƒ
,
FFƒ „
MainTableKey
FF… ‘
)
FF‘ ’
;
FF’ “
}GG 
elseII 
{JJ 
returnKK 
DBOperationKK &
.KK& '
NotFoundKK' /
;KK/ 0
}LL 
}MM 
elseNN 
{OO 
objRolePP 
=PP 
_mapperFactoryPP (
.PP( )
GetPP) ,
<PP, -
MasterRoleEntityPP- =
,PP= >

MasterRolePP? I
>PPI J
(PPJ K
masterRoleEntityPPK [
)PP[ \
;PP\ ]
objRoleQQ 
.QQ 
	CreatedByQQ !
=QQ" #
masterRoleEntityQQ$ 4
.QQ4 5
	CreatedByQQ5 >
;QQ> ?
objRoleRR 
.RR 
CreatedDateRR #
=RR$ %
AppConstantsRR& 2
.RR2 3
DateTimeRR3 ;
;RR; <
objRoleSS 
.SS 
IsActiveSS  
=SS! "
masterRoleEntitySS# 3
.SS3 4
IsActiveSS4 <
;SS< =
_repositoryTT 
.TT 
AddAsyncTT $
(TT$ %
objRoleTT% ,
)TT, -
;TT- .
awaitVV 
_unitOfWorkVV !
.VV! "
SaveChangesAsyncVV" 2
(VV2 3
)VV3 4
;VV4 5
}WW 
ifYY 
(YY 
objRoleYY 
.YY 
IdYY 
==YY 
$numYY 
)YY  
returnZZ 
DBOperationZZ "
.ZZ" #
ErrorZZ# (
;ZZ( )
if^^ 
(^^ 
masterRoleEntity^^  
.^^  !
MasterModules^^! .
.^^. /
Count^^/ 4
>^^5 6
$num^^7 8
)^^8 9
{__ 
var`` 
ModulePermission`` $
=``% &
masterRoleEntity``' 7
.``7 8
MasterModules``8 E
.``E F
Select``F L
(``L M
xx``M O
=>``P R
xx``S U
.``U V 
RoleModulePermission``V j
)``j k
;``k l
varaa 
SubModulePermissionaa '
=aa( )
masterRoleEntityaa* :
.aa: ;
MasterModulesaa; H
.aaH I

SelectManyaaI S
(aaS T
xxaaT V
=>aaW Y
xxaaZ \
.aa\ ]
MasterSubModulesaa] m
?aam n
.aan o
Selectaao u
(aau v
yyaav x
=>aay {
yyaa| ~
.aa~ !
RoleModulePermission	aa “
)
aa“ ”
)
aa” •
;
aa• –
varbb 
Permissionsbb 
=bb  !
ModulePermissionbb" 2
.bb2 3
Concatbb3 9
(bb9 :
SubModulePermissionbb: M
)bbM N
;bbN O
Permissionscc 
=cc 
Permissionscc )
.cc) *
Selectcc* 0
(cc0 1
xxcc1 3
=>cc4 6
{cc7 8
xxcc9 ;
.cc; <
RoleIdcc< B
=ccC D
objRoleccE L
.ccL M
IdccM O
;ccO P
returnccQ W
xxccX Z
;ccZ [
}cc\ ]
)cc] ^
;cc^ _
awaitee !
_roleModulePermissionee +
.ee+ ,)
AddUpdateRoleModulePermissionee, I
(eeI J
PermissionseeJ U
.eeU V
ToListeeV \
(ee\ ]
)ee] ^
)ee^ _
;ee_ `
varhh 
menuhh 
=hh 
AppConstantshh '
.hh' (

MenusCachehh( 2
+hh3 4
objRolehh5 <
.hh< =
Idhh= ?
.hh? @
ToStringhh@ H
(hhH I
)hhI J
;hhJ K
_memoryCacheii 
.ii 
Removeii #
(ii# $
menuii$ (
)ii( )
;ii) *
}jj 
returnnn 
DBOperationnn 
.nn 
Successnn &
;nn& '
}oo 	
publicqq 
asyncqq 
Taskqq 
<qq 
DBOperationqq %
>qq% &

DeleteRoleqq' 1
(qq1 2
intqq2 5
idqq6 8
)qq8 9
{rr 	
varss 

entityRoless 
=ss 
_repositoryss (
.ss( )
Getss) ,
(ss, -
xss- .
=>ss/ 1
xss2 3
.ss3 4
Idss4 6
==ss7 9
idss: <
)ss< =
;ss= >
vartt 
IsUserExisttt 
=tt 
_Userrepositorytt -
.tt- .
GetAllQuerytt. 9
(tt9 :
)tt: ;
.tt; <
Wherett< A
(ttA B
xttB C
=>ttD F
xttG H
.ttH I
RoleIdttI O
==ttP R

entityRolettS ]
.tt] ^
Idtt^ `
)tt` a
.tta b
ToListttb h
(tth i
)tti j
;ttj k
ifuu 
(uu 
IsUserExistuu 
.uu 
Countuu !
<=uu" $
$numuu% &
)uu& '
{vv 
ifww 
(ww 

entityRoleww 
==ww !
nullww" &
)ww& '
returnxx 
DBOperationxx &
.xx& '
NotFoundxx' /
;xx/ 0
_repositoryzz 
.zz 
Removezz "
(zz" #

entityRolezz# -
)zz- .
;zz. /
await|| 
_unitOfWork|| !
.||! "
SaveChangesAsync||" 2
(||2 3
)||3 4
;||4 5
return}} 
DBOperation}} "
.}}" #
Success}}# *
;}}* +
}~~ 
return 
DBOperation 
. 
NotFound '
;' (
}
€€ 	
public
‚‚ 
async
‚‚ 
Task
‚‚ 
<
‚‚ $
DataTableResponseModel
‚‚ 0
>
‚‚0 1
GetAll
‚‚2 8
(
‚‚8 9$
DataTableAjaxPostModel
‚‚9 O
model
‚‚P U
)
‚‚U V
{
ƒƒ 	
string
„„ 

ColumnName
„„ 
=
„„ 
model
„„  %
.
„„% &
order
„„& +
.
„„+ ,
Count
„„, 1
>
„„2 3
$num
„„4 5
?
„„6 7
model
„„8 =
.
„„= >
columns
„„> E
[
„„E F
model
„„F K
.
„„K L
order
„„L Q
[
„„Q R
$num
„„R S
]
„„S T
.
„„T U
column
„„U [
]
„„[ \
.
„„\ ]
data
„„] a
:
„„b c
string
„„d j
.
„„j k
Empty
„„k p
;
„„p q
string
…… 
SortDir
…… 
=
…… 
model
…… "
.
……" #
order
……# (
[
……( )
$num
……) *
]
……* +
?
……+ ,
.
……, -
dir
……- 0
;
……0 1
SqlParameter
‡‡ 
[
‡‡ 
]
‡‡ 
osqlParameter
‡‡ (
=
‡‡) *
{
 
new
‰‰ 
SqlParameter
‰‰  
(
‰‰  !
AppConstants
‰‰! -
.
‰‰- .!
P_CurrentPageNumber
‰‰. A
,
‰‰A B
model
‰‰D I
.
‰‰I J
start
‰‰J O
)
‰‰O P
,
‰‰P Q
new
 
SqlParameter
  
(
  !
AppConstants
! -
.
- .

P_PageSize
. 8
,
8 9
model
D I
.
I J
length
J P
)
P Q
,
Q R
new
‹‹ 
SqlParameter
‹‹  
(
‹‹  !
AppConstants
‹‹! -
.
‹‹- .
P_SortColumn
‹‹. :
,
‹‹: ;

ColumnName
‹‹D N
)
‹‹N O
,
‹‹O P
new
 
SqlParameter
  
(
  !
AppConstants
! -
.
- .
P_SortDirection
. =
,
= >
SortDir
D K
)
K L
,
L M
new
 
SqlParameter
  
(
  !
AppConstants
! -
.
- .
P_SearchText
. :
,
: ;
model
D I
.
I J
search
J P
?
P Q
.
Q R
value
R W
)
W X
}
 
;
 
var
 
Results
 
=
 
await
 
_repository
  +
.
+ ,
GetBySP
, 3
(
3 4 
ProcedureMetastore
4 F
.
F G$
usp_Role_SearchAllList
G ]
,
] ^
CommandType
_ j
.
j k
StoredProcedure
k z
,
z {
osqlParameter| ‰
)‰ 
; ‹
var
““ 
res
““ 
=
““ 
UtilityHelper
““ #
.
““# $
GetPaginationInfo
““$ 5
(
““5 6
Results
““6 =
)
““= >
;
““> ?$
DataTableResponseModel
•• "%
oDataTableResponseModel
••# :
=
••; <
new
••= @$
DataTableResponseModel
••A W
(
••W X
model
••X ]
.
••] ^
draw
••^ b
,
••b c
res
••d g
.
••g h
Item1
••h m
,
••m n
res
••o r
.
••r s
Item1
••s x
,
••x y
Results••z 
.•• ‚
DataTableToList••‚ ‘
<••‘ ’#
MasterRoleListModel••’ ¥
>••¥ ¦
(••¦ §
)••§ ¨
)••¨ ©
;••© ª
return
—— %
oDataTableResponseModel
—— *
;
——* +
}
™™ 	
public
›› 
async
›› 
Task
›› 
<
›› 
List
›› 
<
›› 
MasterRoleEntity
›› /
>
››/ 0
>
››0 1
GetActiveRole
››2 ?
(
››? @
)
››@ A
{
 	
var
 

ActiveRole
 
=
 
await
 "
_repository
# .
.
. /
GetAllAsync
/ :
(
: ;
x
; <
=>
= ?
x
@ A
.
A B
IsActive
B J
==
K M
true
N R
&&
S U
x
V W
.
W X
	IsDeleted
X a
==
b d
false
e j
)
j k
;
k l
return
 
_mapperFactory
 !
.
! "
GetList
" )
<
) *

MasterRole
* 4
,
4 5
MasterRoleEntity
6 F
>
F G
(
G H

ActiveRole
H R
.
R S
ToList
S Y
(
Y Z
)
Z [
)
[ \
;
\ ]
}
 	
public
΅΅ 
async
΅΅ 
Task
΅΅ 
<
΅΅ 
List
΅΅ 
<
΅΅ 
MasterRoleEntity
΅΅ /
>
΅΅/ 0
>
΅΅0 1

RoleSearch
΅΅2 <
(
΅΅< =
string
΅΅= C
searchQuery
΅΅D O
)
΅΅O P
{
ΆΆ 	
var
¤¤ 
allRoles
¤¤ 
=
¤¤ 
await
¤¤  
_repository
¤¤! ,
.
¤¤, -
GetAllAsync
¤¤- 8
(
¤¤8 9
)
¤¤9 :
;
¤¤: ;
if
§§ 
(
§§ 
!
§§ 
string
§§ 
.
§§ 
IsNullOrEmpty
§§ %
(
§§% &
searchQuery
§§& 1
)
§§1 2
)
§§2 3
{
¨¨ 
searchQuery
©© 
=
©© 
searchQuery
©© )
.
©©) *
Trim
©©* .
(
©©. /
)
©©/ 0
.
©©0 1
ToLower
©©1 8
(
©©8 9
)
©©9 :
;
©©: ;
allRoles
ªª 
=
ªª 
allRoles
ªª #
.
ªª# $
Where
ªª$ )
(
ªª) *
role
ªª* .
=>
ªª/ 1
role
ªª2 6
.
ªª6 7
RoleName
ªª7 ?
.
ªª? @
ToLower
ªª@ G
(
ªªG H
)
ªªH I
.
ªªI J
Contains
ªªJ R
(
ªªR S
searchQuery
ªªS ^
)
ªª^ _
)
ªª_ `
.
ªª` a
ToList
ªªa g
(
ªªg h
)
ªªh i
;
ªªi j
}
«« 
return
®® 
_mapperFactory
®® !
.
®®! "
GetList
®®" )
<
®®) *

MasterRole
®®* 4
,
®®4 5
MasterRoleEntity
®®6 F
>
®®F G
(
®®G H
allRoles
®®H P
)
®®P Q
;
®®Q R
}
―― 	
public
²² 
async
²² 
Task
²² 
<
²² 
MasterRoleEntity
²² *
>
²²* +
GetById
²², 3
(
²²3 4
int
²²4 7
id
²²8 :
)
²²: ;
{
³³ 	
try
΄΄ 
{
µµ 
MasterRoleEntity
¶¶  
_roleEntity
¶¶! ,
=
¶¶- .
_mapperFactory
¶¶/ =
.
¶¶= >
Get
¶¶> A
<
¶¶A B

MasterRole
¶¶B L
,
¶¶L M
MasterRoleEntity
¶¶N ^
>
¶¶^ _
(
¶¶_ `
await
¶¶` e
_repository
¶¶f q
.
¶¶q r
GetAsync
¶¶r z
(
¶¶z {
id
¶¶{ }
)
¶¶} ~
)
¶¶~ 
;¶¶ €
var
ΈΈ 
IsUserExist
ΈΈ 
=
ΈΈ  !
_Userrepository
ΈΈ" 1
.
ΈΈ1 2
GetAllQuery
ΈΈ2 =
(
ΈΈ= >
)
ΈΈ> ?
.
ΈΈ? @
Where
ΈΈ@ E
(
ΈΈE F
x
ΈΈF G
=>
ΈΈH J
x
ΈΈK L
.
ΈΈL M
RoleId
ΈΈM S
==
ΈΈT V
_roleEntity
ΈΈW b
.
ΈΈb c
Id
ΈΈc e
)
ΈΈe f
.
ΈΈf g
ToList
ΈΈg m
(
ΈΈm n
)
ΈΈn o
;
ΈΈo p
if
ΉΉ 
(
ΉΉ 
IsUserExist
ΉΉ 
!=
ΉΉ  "
null
ΉΉ# '
&&
ΉΉ( *
IsUserExist
ΉΉ+ 6
.
ΉΉ6 7
Count
ΉΉ7 <
>
ΉΉ= >
$num
ΉΉ? @
)
ΉΉ@ A
_roleEntity
ΊΊ 
.
ΊΊ  
IsUserAssigned
ΊΊ  .
=
ΊΊ/ 0
true
ΊΊ1 5
;
ΊΊ5 6
return
ΌΌ 
_roleEntity
ΌΌ "
;
ΌΌ" #
}
½½ 
catch
ΎΎ 
(
ΎΎ 
	Exception
ΎΎ 
ex
ΎΎ 
)
ΎΎ  
{
ΏΏ 
throw
ΑΑ 
ex
ΑΑ 
;
ΑΑ 
}
ΒΒ 
}
ΔΔ 	
}
ΕΕ 
}ΖΖ g
ID:\EltizamLive\Eltizam.Business.Core\Implementation\MasterStateService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
Implementation  .
{ 
public 

class 
MasterStateService #
:$ %
IMasterStateService& 9
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IMapperFactory '
_mapperFactory( 6
;6 7
private 
readonly 
	Microsoft "
." #

Extensions# -
.- .
Configuration. ;
.; <
IConfiguration< J
configurationK X
;X Y
private 
IRepository 
< 
MasterState '
>' (
_repository) 4
{5 6
get7 :
;: ;
set< ?
;? @
}A B
private 
readonly 
IHelper  
_helper! (
;( )
public   
MasterStateService   !
(  ! "
IUnitOfWork  " -

unitOfWork  . 8
,  8 9
IMapperFactory  : H
mapperFactory  I V
,  V W
IHelper!!" )
helper!!* 0
,!!0 1
	Microsoft""! *
.""* +

Extensions""+ 5
.""5 6
Configuration""6 C
.""C D
IConfiguration""D R
_configuration""S a
)""a b
{## 	
_unitOfWork$$ 
=$$ 

unitOfWork$$ $
;$$$ %
_mapperFactory%% 
=%% 
mapperFactory%% *
;%%* +
_repository'' 
='' 
_unitOfWork'' %
.''% &
GetRepository''& 3
<''3 4
MasterState''4 ?
>''? @
(''@ A
)''A B
;''B C
configuration(( 
=(( 
_configuration(( *
;((* +
_helper)) 
=)) 
helper)) 
;)) 
}** 	
public-- 
async-- 
Task-- 
<-- "
DataTableResponseModel-- 0
>--0 1
GetAll--2 8
(--8 9"
DataTableAjaxPostModel--9 O
model--P U
)--U V
{.. 	
var// 
	_dbParams// 
=// 
new// 
[//  
]//  !
{00 
new11 
DbParameter11  
(11  !
$str11! *
,11* +
$num11, -
,11- .
	SqlDbType11. 7
.117 8
Int118 ;
)11; <
,11< =
new22 
DbParameter22  
(22  !
$str22! +
,22+ ,
model22- 2
.222 3
length223 9
,229 :
	SqlDbType22; D
.22D E
Int22E H
)22H I
,22I J
new33 
DbParameter33  
(33  !
$str33! -
,33- .
model33/ 4
.334 5
start335 :
,33: ;
	SqlDbType33< E
.33E F
Int33F I
)33I J
,33J K
new44 
DbParameter44  
(44  !
$str44! .
,44. /
$str440 ;
,44; <
	SqlDbType44= F
.44F G
VarChar44G N
)44N O
,44O P
new55 
DbParameter55  
(55  !
$str55! .
,55. /
$num550 1
,551 2
	SqlDbType553 <
.55< =
Int55= @
)55@ A
}66 
;66 
int88 
_count88 
=88 
$num88 
;88 
var99 
lstStf99 
=99 
EltizamDBHelper99 (
.99( )2
&ExecuteMappedReaderWithOutputParameter99) O
<99O P 
MasterStateListModel99P d
>99d e
(99e f
ProcedureMetastore99f x
.99x y$
usp_State_SearchAllList	99y 
,
99 ‘
DatabaseConnection;; 
.;;  

ConnString;;  *
,;;* +
out;;, /
_count;;0 6
,;;6 7
CommandType;;8 C
.;;C D
StoredProcedure;;D S
,;;S T
	_dbParams;;U ^
);;^ _
;;;_ `"
DataTableResponseModel>> "#
oDataTableResponseModel>># :
=>>; <
new>>= @"
DataTableResponseModel>>A W
(>>W X
model>>X ]
.>>] ^
draw>>^ b
,>>b c
_count>>d j
,>>j k
lstStf>>l r
.>>r s
Count>>s x
,>>x y
lstStf	>>z €
)
>>€ 
;
>> ‚
return@@ #
oDataTableResponseModel@@ *
;@@* +
}AA 	
publicBB 
asyncBB 
TaskBB 
<BB 
MasterStateEntityBB +
>BB+ ,
GetByIdBB- 4
(BB4 5
intBB5 8
idBB9 ;
)BB; <
{CC 	
varDD 
_StateEntityDD 
=DD 
newDD "
MasterStateEntityDD# 4
(DD4 5
)DD5 6
;DD6 7
_StateEntityEE 
=EE 
_mapperFactoryEE )
.EE) *
GetEE* -
<EE- .
MasterStateEE. 9
,EE9 :
MasterStateEntityEE; L
>EEL M
(EEM N
awaitEEN S
_repositoryEET _
.EE_ `
GetAsyncEE` h
(EEh i
idEEi k
)EEk l
)EEl m
;EEm n
returnGG 
_StateEntityGG 
;GG  
}HH 	
publicII 
asyncII 
TaskII 
<II 
DBOperationII %
>II% &
UpsertII' -
(II- .
MasterStateEntityII. ?
entityStateII@ K
)IIK L
{JJ 	
MasterStateLL 
objStateLL  
;LL  !
ifNN 
(NN 
entityStateNN 
.NN 
IdNN 
>NN  
$numNN! "
)NN" #
{OO 
objStatePP 
=PP 
_repositoryPP &
.PP& '
GetPP' *
(PP* +
entityStatePP+ 6
.PP6 7
IdPP7 9
)PP9 :
;PP: ;
varQQ 
OldObjStateQQ 
=QQ  !
objStateQQ" *
;QQ* +
ifRR 
(RR 
objStateRR 
!=RR 
nullRR  $
)RR$ %
{SS 
objStateTT 
.TT 
	StateNameTT &
=TT' (
entityStateTT) 4
.TT4 5
	StateNameTT5 >
;TT> ?
objStateUU 
.UU 
	CountryIdUU &
=UU' (
entityStateUU) 4
.UU4 5
	CountryIdUU5 >
;UU> ?
objStateVV 
.VV 
	StateCodeVV &
=VV' (
entityStateVV) 4
.VV4 5
	StateCodeVV5 >
;VV> ?
objStateWW 
.WW 
IsActiveWW %
=WW& '
entityStateWW( 3
.WW3 4
IsActiveWW4 <
;WW< =
objStateXX 
.XX 
ModifiedDateXX )
=XX* +
AppConstantsXX, 8
.XX8 9
DateTimeXX9 A
;XXA B
objStateYY 
.YY 

ModifiedByYY '
=YY( )
entityStateYY* 5
.YY5 6
	CreatedByYY6 ?
;YY? @
_repositoryZZ 
.ZZ  
UpdateAsyncZZ  +
(ZZ+ ,
objStateZZ, 4
)ZZ4 5
;ZZ5 6
}[[ 
else\\ 
{]] 
return^^ 
DBOperation^^ &
.^^& '
NotFound^^' /
;^^/ 0
}__ 
}`` 
elseaa 
{bb 
objStatecc 
=cc 
_mapperFactorycc )
.cc) *
Getcc* -
<cc- .
MasterStateEntitycc. ?
,cc? @
MasterStateccA L
>ccL M
(ccM N
entityStateccN Y
)ccY Z
;ccZ [
objStateee 
.ee 
	StateNameee "
=ee# $
entityStateee% 0
.ee0 1
	StateNameee1 :
;ee: ;
objStateff 
.ff 
	CountryIdff "
=ff# $
entityStateff% 0
.ff0 1
	CountryIdff1 :
;ff: ;
objStategg 
.gg 
	StateCodegg "
=gg# $
entityStategg% 0
.gg0 1
	StateCodegg1 :
;gg: ;
objStatehh 
.hh 
IsActivehh !
=hh" #
entityStatehh$ /
.hh/ 0
IsActivehh0 8
;hh8 9
objStateii 
.ii 
CreatedDateii $
=ii% &
AppConstantsii' 3
.ii3 4
DateTimeii4 <
;ii< =
objStatejj 
.jj 
	CreatedByjj "
=jj# $
entityStatejj% 0
.jj0 1
	CreatedByjj1 :
;jj: ;
objStatekk 
.kk 
ModifiedDatekk %
=kk& '
AppConstantskk( 4
.kk4 5
DateTimekk5 =
;kk= >
objStatell 
.ll 

ModifiedByll #
=ll$ %
entityStatell& 1
.ll1 2
	CreatedByll2 ;
;ll; <
_repositorymm 
.mm 
AddAsyncmm $
(mm$ %
objStatemm% -
)mm- .
;mm. /
}nn 
awaitoo 
_unitOfWorkoo 
.oo 
SaveChangesAsyncoo .
(oo. /
)oo/ 0
;oo0 1
ifpp 
(pp 
objStatepp 
.pp 
Idpp 
==pp 
$numpp  
)pp  !
returnqq 
DBOperationqq "
.qq" #
Errorqq# (
;qq( )
returnss 
DBOperationss 
.ss 
Successss &
;ss& '
}tt 	
publicvv 
asyncvv 
Taskvv 
<vv 
DBOperationvv %
>vv% &
Deletevv' -
(vv- .
intvv. 1
idvv2 4
)vv4 5
{ww 	
varxx 
entityStatexx 
=xx 
_repositoryxx )
.xx) *
Getxx* -
(xx- .
xxx. /
=>xx0 2
xxx3 4
.xx4 5
Idxx5 7
==xx8 :
idxx; =
)xx= >
;xx> ?
ifzz 
(zz 
entityStatezz 
==zz 
nullzz #
)zz# $
return{{ 
DBOperation{{ "
.{{" #
NotFound{{# +
;{{+ ,
_repository}} 
.}} 
Remove}} 
(}} 
entityState}} *
)}}* +
;}}+ ,
await 
_unitOfWork 
. 
SaveChangesAsync .
(. /
)/ 0
;0 1
return
 
DBOperation
 
.
 
Success
 &
;
& '
}
‚‚ 	
public
…… 
async
…… 
Task
…… 
<
…… 
List
…… 
<
…… 
MasterStateEntity
…… 0
>
……0 1
>
……1 2
GetStateList
……3 ?
(
……? @
)
……@ A
{
†† 	
var
 
lstStf
 
=
 
EltizamDBHelper
 (
.
( )!
ExecuteMappedReader
) <
<
< =
MasterStateEntity
= N
>
N O
(
O P 
ProcedureMetastore
P b
.
b c
usp_State_AllList
c t
,
t u 
DatabaseConnection
‰‰ 
.
‰‰  

ConnString
‰‰  *
,
‰‰* +
CommandType
‰‰, 7
.
‰‰7 8
StoredProcedure
‰‰8 G
,
‰‰G H
null
‰‰I M
)
‰‰M N
;
‰‰N O
return
‹‹ 
lstStf
‹‹ 
;
‹‹ 
}
 	
public
 
async
 
Task
 
<
 
List
 
<
 
MasterStateEntity
 0
>
0 1
>
1 2%
GetStateListByCountryId
3 J
(
J K
int
K N
	countryId
O X
)
X Y
{
 	
var
 
	stateList
 
=
 
new
 
List
  $
<
$ %
MasterStateEntity
% 6
>
6 7
(
7 8
)
8 9
;
9 :
var
‘‘ 
stateListAsync
‘‘ 
=
‘‘  
_repository
‘‘! ,
.
‘‘, -
GetAllAsync
‘‘- 8
(
‘‘8 9
x
‘‘9 :
=>
‘‘; =
x
‘‘> ?
.
‘‘? @
	CountryId
‘‘@ I
==
‘‘J L
	countryId
‘‘M V
)
‘‘V W
.
‘‘W X
Result
‘‘X ^
.
‘‘^ _
ToList
‘‘_ e
(
‘‘e f
)
‘‘f g
;
‘‘g h
	stateList
““ 
=
““ 
_mapperFactory
““ &
.
““& '
GetList
““' .
<
““. /
MasterState
““/ :
,
““: ;
MasterStateEntity
““< M
>
““M N
(
““N O
stateListAsync
““O ]
)
““] ^
;
““^ _
return
”” 
	stateList
”” 
;
”” 
}
•• 	
}
—— 
} Νώ
HD:\EltizamLive\Eltizam.Business.Core\Implementation\MasterUserService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
Implementation  .
{ 
public 

class 
MasterUserService "
:# $
IMasterUserService% 7
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IMapperFactory '
_mapperFactory( 6
;6 7
private 
readonly &
IMasterNotificationService 3
_notification4 A
;A B
private 
readonly 
	Microsoft "
." #

Extensions# -
.- .
Configuration. ;
.; <
IConfiguration< J
configurationK X
;X Y
private 
IRepository 
< 

MasterUser &
>& '
_repository( 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
private 
IRepository 
< 
MasterAddress )
>) *
_addressRepository+ =
{> ?
get@ C
;C D
setE H
;H I
}J K
private 
IRepository 
< 
MasterQualification /
>/ 0
_qualifyRepository1 C
{D E
getF I
;I J
setK N
;N O
}P Q
private 
IRepository 
< 
MasterDocument *
>* +
_documentRepository, ?
{@ A
getB E
;E F
setG J
;J K
}L M
private 
IRepository 
< 
EmailLogHistory +
>+ ,
	_emailLog- 6
{7 8
get9 <
;< =
set> A
;A B
}C D
private 
IRepository 
< /
#MasterValuationRequestApproverLevel ?
>? @$
_approverLevelRepositoryA Y
{Z [
get\ _
;_ `
seta d
;d e
}f g
private   
readonly   
IAuditLogService   )
_auditLogService  * :
;  : ;
private!! 
readonly!! 
IHelper!!  
_helper!!! (
;!!( )
private"" 
readonly"" 
int"" 
?"" 
_LoginUserId"" *
;""* +
public%% 
MasterUserService%%  
(%%  !
IUnitOfWork%%! ,

unitOfWork%%- 7
,%%7 8
IMapperFactory%%9 G
mapperFactory%%H U
,%%U V
IAuditLogService%%W g
auditLogService%%h w
,%%w x
IHelper&&" )
helper&&* 0
,&&0 1
	Microsoft&&2 ;
.&&; <

Extensions&&< F
.&&F G
Configuration&&G T
.&&T U
IConfiguration&&U c
_configuration&&d r
,&&r s'
IMasterNotificationService	&&t 
notification
&& ›
)
&&› 
{'' 	
_unitOfWork(( 
=(( 

unitOfWork(( $
;(($ %
_mapperFactory)) 
=)) 
mapperFactory)) *
;))* +
	_emailLog++ 
=++ 
_unitOfWork++ #
.++# $
GetRepository++$ 1
<++1 2
EmailLogHistory++2 A
>++A B
(++B C
)++C D
;++D E
_repository,, 
=,, 
_unitOfWork,, %
.,,% &
GetRepository,,& 3
<,,3 4

MasterUser,,4 >
>,,> ?
(,,? @
),,@ A
;,,A B
_addressRepository-- 
=--  
_unitOfWork--! ,
.--, -
GetRepository--- :
<--: ;
MasterAddress--; H
>--H I
(--I J
)--J K
;--K L
_qualifyRepository.. 
=..  
_unitOfWork..! ,
..., -
GetRepository..- :
<..: ;
MasterQualification..; N
>..N O
(..O P
)..P Q
;..Q R
_documentRepository// 
=//  !
_unitOfWork//" -
.//- .
GetRepository//. ;
<//; <
MasterDocument//< J
>//J K
(//K L
)//L M
;//M N$
_approverLevelRepository00 $
=00% &
_unitOfWork00' 2
.002 3
GetRepository003 @
<00@ A/
#MasterValuationRequestApproverLevel00A d
>00d e
(00e f
)00f g
;00g h
configuration11 
=11 
_configuration11 *
;11* +
_helper22 
=22 
helper22 
;22 
_auditLogService33 
=33 
auditLogService33 .
;33. /
_notification44 
=44 
notification44 (
;44( )
}55 	
public77 
async77 
Task77 
<77 
UserSessionEntity77 +
>77+ ,
Login77- 2
(772 3
LoginViewModel773 A
oLogin77B H
)77H I
{88 	
UserSessionEntity99 
oUser99 #
=99$ %
null99& *
;99* +
SqlParameter:: 
[:: 
]:: 
osqlParameter:: (
=::) *
{;; 
new<< 
SqlParameter<<  
(<<  !
$str<<! )
,<<) *
oLogin<<+ 1
.<<1 2
Email<<2 7
)<<7 8
,<<8 9
new== 
SqlParameter==  
(==  !
$str==! ,
,==, -
UtilityHelper==. ;
.==; < 
GenerateSHA256String==< P
(==P Q
oLogin==Q W
.==W X
Password==X `
)==` a
)==a b
}>> 
;>> 
var@@ 
UserList@@ 
=@@ 
await@@  
_repository@@! ,
.@@, -
GetBySP@@- 4
(@@4 5
$str@@5 O
,@@O P
System@@Q W
.@@W X
Data@@X \
.@@\ ]
CommandType@@] h
.@@h i
StoredProcedure@@i x
,@@x y
osqlParameter	@@z ‡
)
@@‡ 
;
@@ ‰
ifBB 
(BB 
UserListBB 
!=BB 
nullBB  
&&BB! #
UserListBB$ ,
.BB, -
RowsBB- 1
.BB1 2
CountBB2 7
>BB8 9
$numBB: ;
)BB; <
{CC 
oUserDD 
=DD 
newDD 
UserSessionEntityDD -
(DD- .
)DD. /
;DD/ 0
oUserEE 
.EE 
UserNameEE 
=EE  
UserListEE! )
.EE) *
RowsEE* .
[EE. /
$numEE/ 0
]EE0 1
[EE1 2
$strEE2 <
]EE< =
.EE= >
ToStringEE> F
(EEF G
)EEG H
;EEH I
oUserFF 
.FF 
EmailFF 
=FF 
UserListFF &
.FF& '
RowsFF' +
[FF+ ,
$numFF, -
]FF- .
[FF. /
$strFF/ =
]FF= >
.FF> ?
ToStringFF? G
(FFG H
)FFH I
;FFI J
oUserGG 
.GG 
RoleNameGG 
=GG  
UserListGG! )
.GG) *
RowsGG* .
[GG. /
$numGG/ 0
]GG0 1
[GG1 2
$strGG2 <
]GG< =
.GG= >
ToStringGG> F
(GGF G
)GGG H
;GGH I
oUserII 
.II 
RoleIdII 
=II 
ConvertII &
.II& '
ToInt32II' .
(II. /
UserListII/ 7
.II7 8
RowsII8 <
[II< =
$numII= >
]II> ?
[II? @
$strII@ H
]IIH I
)III J
;IIJ K
oUserJJ 
.JJ 
UserIdJJ 
=JJ 
ConvertJJ &
.JJ& '
ToInt32JJ' .
(JJ. /
UserListJJ/ 7
.JJ7 8
RowsJJ8 <
[JJ< =
$numJJ= >
]JJ> ?
[JJ? @
$strJJ@ H
]JJH I
)JJI J
;JJJ K
}KK 
returnLL 
oUserLL 
;LL 
}MM 	
publicOO 
asyncOO 
TaskOO 
<OO 
DBOperationOO %
>OO% &

DeleteUserOO' 1
(OO1 2
intOO2 5
idOO6 8
)OO8 9
{PP 	
varQQ 

entityUserQQ 
=QQ 
_repositoryQQ (
.QQ( )
GetQQ) ,
(QQ, -
xQQ- .
=>QQ/ 1
xQQ2 3
.QQ3 4
IdQQ4 6
==QQ7 9
idQQ: <
)QQ< =
;QQ= >
ifSS 
(SS 

entityUserSS 
==SS 
nullSS "
)SS" #
returnTT 
DBOperationTT "
.TT" #
NotFoundTT# +
;TT+ ,
_repositoryVV 
.VV 
RemoveVV 
(VV 

entityUserVV )
)VV) *
;VV* +
awaitXX 
_unitOfWorkXX 
.XX 
SaveChangesAsyncXX .
(XX. /
)XX/ 0
;XX0 1
returnZZ 
DBOperationZZ 
.ZZ 
SuccessZZ &
;ZZ& '
}[[ 	
public^^ 
async^^ 
Task^^ 
<^^ 
bool^^ 
>^^ #
CheckEmailAddressExists^^  7
(^^7 8
string^^8 >
emailAddress^^? K
)^^K L
{__ 	
var`` 
isExists`` 
=`` 
await``  
_repository``! ,
.``, -
GetAllQuery``- 8
(``8 9
)``9 :
.``: ;
AnyAsync``; C
(``C D
x``D E
=>``F H
x``I J
.``J K
Email``K P
.``P Q
ToLower``Q X
(``X Y
)``Y Z
==``[ ]
emailAddress``^ j
.``j k
ToLower``k r
(``r s
)``s t
)``t u
;``u v
returnaa 
isExistsaa 
;aa 
}bb 	
publicdd 
asyncdd 
Taskdd 
<dd 
DBOperationdd %
>dd% &
ForgotPassworddd' 5
(dd5 6#
ForgotPasswordViewModeldd6 M#
forgotPasswordViewModelddN e
)dde f
{ee 	
EmailHelperff 
emailff 
=ff 
newff  #
EmailHelperff$ /
(ff/ 0
)ff0 1
;ff1 2
boolgg 
	IsSuccessgg 
=gg 
falsegg "
;gg" #
stringhh 
baseURLhh 
=hh #
forgotPasswordViewModelhh 4
.hh4 5
WebApplicationUrlhh5 F
;hhF G
varii 

entityUserii 
=ii 
_repositoryii (
.ii( )
Getii) ,
(ii, -
xii- .
=>ii/ 1
xii2 3
.ii3 4
Emailii4 9
==ii: <#
forgotPasswordViewModelii= T
.iiT U
EmailiiU Z
)iiZ [
;ii[ \
ifjj 
(jj 

entityUserjj 
==jj 
nulljj "
)jj" #
returnkk 
DBOperationkk "
.kk" #
NotFoundkk# +
;kk+ ,

entityUsermm 
.mm 
ForgotPasswordTokenmm *
=mm+ ,
UtilityHelpermm- :
.mm: ; 
GenerateSHA256Stringmm; O
(mmO P

entityUsermmP Z
.mmZ [
Idmm[ ]
.mm] ^
ToStringmm^ f
(mmf g
)mmg h
)mmh i
;mmi j

entityUsernn 
.nn "
ForgotPasswordDateTimenn -
=nn. /
AppConstantsnn0 <
.nn< =
DateTimenn= E
;nnE F
_repositoryoo 
.oo 
UpdateAsyncoo #
(oo# $

entityUseroo$ .
)oo. /
;oo/ 0
awaitpp 
_unitOfWorkpp 
.pp 
SaveChangesAsyncpp .
(pp. /
)pp/ 0
;pp0 1
stringrr 
strURLrr 
=rr 
baseURLrr #
+rr$ %
$strrr& J
+rrK L

entityUserrrM W
.rrW X
ForgotPasswordTokenrrX k
;rrk l
stringss 
strHtmlss 
=ss 
Systemss #
.ss# $
IOss$ &
.ss& '
Filess' +
.ss+ ,
ReadAllTextss, 7
(ss7 8
$strss8 l
)ssl m
;ssm n
strHtmltt 
=tt 
strHtmltt 
.tt 
Replacett %
(tt% &
$strtt& 3
,tt3 4
strURLtt5 ;
)tt; <
;tt< =
strHtmluu 
=uu 
strHtmluu 
.uu 
Replaceuu %
(uu% &
$struu& 5
,uu5 6

entityUseruu7 A
.uuA B"
ForgotPasswordDateTimeuuB X
.uuX Y
ValueuuY ^
.uu^ _
AddHoursuu_ g
(uug h
$numuuh i
)uui j
.uuj k
ToStringuuk s
(uus t
)uut u
)uuu v
;uuv w
strHtmlvv 
=vv 
strHtmlvv 
.vv 
Replacevv %
(vv% &
$strvv& ,
,vv, -

entityUservv. 8
.vv8 9
	FirstNamevv9 B
+vvC D

entityUservvE O
.vvO P
LastNamevvP X
)vvX Y
;vvY Z
varxx 
notificationxx 
=xx 
newxx "!
SendNotificationModelxx# 8
(xx8 9
)xx9 :
{yy 
Bodyzz 
=zz 
strHtmlzz 
,zz 
Subject{{ 
={{ 
$str{{ +
,{{+ ,
ToEmailList|| 
=|| 

entityUser|| (
.||( )
Email||) .
}}} 
;}} 
var~~ 
res~~ 
=~~ 
_notification~~ #
.~~# $

SendEmail2~~$ .
(~~. /
notification~~/ ;
)~~; <
;~~< =
EmailLogHistory
‚‚ 
emailLogHistory
‚‚ +
=
‚‚, -
new
‚‚. 1
EmailLogHistory
‚‚2 A
(
‚‚A B
)
‚‚B C
;
‚‚C D
emailLogHistory
ƒƒ 
.
ƒƒ 
FromAddress
ƒƒ '
=
ƒƒ( )
configuration
ƒƒ* 7
.
ƒƒ7 8

GetSection
ƒƒ8 B
(
ƒƒB C
$str
ƒƒC P
)
ƒƒP Q
.
ƒƒQ R

GetSection
ƒƒR \
(
ƒƒ\ ]
$str
ƒƒ] h
)
ƒƒh i
.
ƒƒi j
Value
ƒƒj o
;
ƒƒo p
emailLogHistory
…… 
.
…… 
	ToAddress
…… %
=
……& '
notification
……( 4
.
……4 5
ToEmailList
……5 @
;
……@ A
emailLogHistory
†† 
.
†† 
Subject
†† #
=
††$ %
notification
††& 2
.
††2 3
Subject
††3 :
;
††: ;
emailLogHistory
‡‡ 
.
‡‡ 
EmailResponse
‡‡ )
=
‡‡* +
$str
‡‡, .
;
‡‡. /
emailLogHistory
 
.
 
	CreatedBy
 %
=
& '
$num
( )
;
) *
emailLogHistory
 
.
 
Body
  
=
! "
notification
# /
.
/ 0
Body
0 4
;
4 5
emailLogHistory
‹‹ 
.
‹‹ 
IsSent
‹‹ "
=
‹‹# $
DBOperation
‹‹% 0
.
‹‹0 1
Success
‹‹1 8
==
‹‹9 ;
res
‹‹< ?
.
‹‹? @
Result
‹‹@ F
;
‹‹F G
	_emailLog
 
.
 
AddAsync
 
(
 
emailLogHistory
 .
)
. /
;
/ 0
await
 
_unitOfWork
 
.
 
SaveChangesAsync
 .
(
. /
)
/ 0
;
0 1
return
‘‘ 
res
‘‘ 
.
‘‘ 
Result
‘‘ 
;
‘‘ 
}
’’ 	
public
““ 
async
““ 
Task
““ 
<
““ 
string
““  
>
““  !
ResetPassword
““" /
(
““/ 0+
MasterUserResetPasswordEntity
““0 M!
resetPasswordentity
““N a
)
““a b
{
”” 	
var
•• 

entityUser
•• 
=
•• 
_repository
•• (
.
••( )
Get
••) ,
(
••, -
x
••- .
=>
••/ 1
x
••2 3
.
••3 4!
ForgotPasswordToken
••4 G
==
••H J!
resetPasswordentity
••K ^
.
••^ _!
ForgotPasswordToken
••_ r
)
••r s
;
••s t
if
–– 
(
–– 

entityUser
–– 
==
–– 
null
–– "
)
––" #
return
—— 
$str
—— &
;
——& '
if
™™ 
(
™™ 

entityUser
™™ 
.
™™ $
ForgotPasswordDateTime
™™ 1
.
™™1 2
Value
™™2 7
.
™™7 8
AddHours
™™8 @
(
™™@ A
$num
™™A B
)
™™B C
<
™™D E
AppConstants
™™F R
.
™™R S
DateTime
™™S [
)
™™[ \
{
 
return
›› 
$str
›› %
;
››% &
}
 

entityUser
 
.
 
Password
 
=
  !
UtilityHelper
" /
.
/ 0"
GenerateSHA256String
0 D
(
D E!
resetPasswordentity
E X
.
X Y
Password
Y a
)
a b
;
b c

entityUser
 
.
 !
ForgotPasswordToken
 *
=
+ ,
string
- 3
.
3 4
Empty
4 9
;
9 :

entityUser
 
.
 $
ForgotPasswordDateTime
 -
=
. /
null
0 4
;
4 5
_repository
   
.
   
UpdateAsync
   #
(
  # $

entityUser
  $ .
)
  . /
;
  / 0
await
΅΅ 
_unitOfWork
΅΅ 
.
΅΅ 
SaveChangesAsync
΅΅ .
(
΅΅. /
)
΅΅/ 0
;
΅΅0 1
return
ΆΆ 
$str
ΆΆ &
;
ΆΆ& '
}
££ 	
public
¥¥ !
SMTPEntityViewModel
¥¥ ""
GetSMTPConfiguration
¥¥# 7
(
¥¥7 8
)
¥¥8 9
{
¦¦ 	!
SMTPEntityViewModel
§§ 
_smtp
§§  %
=
§§& '
new
§§( +!
SMTPEntityViewModel
§§, ?
(
§§? @
)
§§@ A
;
§§A B
_smtp
¨¨ 
.
¨¨ 
Host
¨¨ 
=
¨¨ 
configuration
¨¨ &
.
¨¨& '

GetSection
¨¨' 1
(
¨¨1 2
$str
¨¨2 ?
)
¨¨? @
.
¨¨@ A

GetSection
¨¨A K
(
¨¨K L
$str
¨¨L R
)
¨¨R S
.
¨¨S T
Value
¨¨T Y
;
¨¨Y Z
_smtp
©© 
.
©© 
Port
©© 
=
©© 
configuration
©© &
.
©©& '

GetSection
©©' 1
(
©©1 2
$str
©©2 ?
)
©©? @
.
©©@ A

GetSection
©©A K
(
©©K L
$str
©©L R
)
©©R S
.
©©S T
Value
©©T Y
;
©©Y Z
_smtp
ªª 
.
ªª 
	EnableSsl
ªª 
=
ªª 
configuration
ªª +
.
ªª+ ,

GetSection
ªª, 6
(
ªª6 7
$str
ªª7 D
)
ªªD E
.
ªªE F

GetSection
ªªF P
(
ªªP Q
$str
ªªQ ]
)
ªª] ^
.
ªª^ _
Value
ªª_ d
;
ªªd e
_smtp
«« 
.
«« 
	FromEmail
«« 
=
«« 
configuration
«« +
.
««+ ,

GetSection
««, 6
(
««6 7
$str
««7 D
)
««D E
.
««E F

GetSection
««F P
(
««P Q
$str
««Q \
)
««\ ]
.
««] ^
Value
««^ c
;
««c d
_smtp
¬¬ 
.
¬¬ 
UserName
¬¬ 
=
¬¬ 
configuration
¬¬ *
.
¬¬* +

GetSection
¬¬+ 5
(
¬¬5 6
$str
¬¬6 C
)
¬¬C D
.
¬¬D E

GetSection
¬¬E O
(
¬¬O P
$str
¬¬P Z
)
¬¬Z [
.
¬¬[ \
Value
¬¬\ a
;
¬¬a b
_smtp
­­ 
.
­­ 
Password
­­ 
=
­­ 
configuration
­­ *
.
­­* +

GetSection
­­+ 5
(
­­5 6
$str
­­6 C
)
­­C D
.
­­D E

GetSection
­­E O
(
­­O P
$str
­­P Z
)
­­Z [
.
­­[ \
Value
­­\ a
;
­­a b
return
®® 
_smtp
®® 
;
®® 
}
―― 	
public
°° 
async
°° 
Task
°° 
<
°° 
bool
°° 
>
°° 
IsTokenValid
°°  ,
(
°°, -
string
°°- 3
token
°°4 9
)
°°9 :
{
±± 	
var
²² 
isExists
²² 
=
²² 
await
²²  
_repository
²²! ,
.
²², -
GetAllQuery
²²- 8
(
²²8 9
)
²²9 :
.
²²: ;
AnyAsync
²²; C
(
²²C D
x
²²D E
=>
²²F H
x
²²I J
.
²²J K!
ForgotPasswordToken
²²K ^
==
²²_ a
token
²²b g
)
²²g h
;
²²h i
return
³³ 
isExists
³³ 
;
³³ 
}
΄΄ 	
public
¶¶ 
async
¶¶ 
Task
¶¶ 
<
¶¶ $
DataTableResponseModel
¶¶ 0
>
¶¶0 1
GetAll
¶¶2 8
(
¶¶8 9$
DataTableAjaxPostModel
¶¶9 O
model
¶¶P U
)
¶¶U V
{
·· 	
string
ΈΈ 

ColumnName
ΈΈ 
=
ΈΈ 
model
ΈΈ  %
.
ΈΈ% &
order
ΈΈ& +
.
ΈΈ+ ,
Count
ΈΈ, 1
>
ΈΈ2 3
$num
ΈΈ4 5
?
ΈΈ6 7
model
ΈΈ8 =
.
ΈΈ= >
columns
ΈΈ> E
[
ΈΈE F
model
ΈΈF K
.
ΈΈK L
order
ΈΈL Q
[
ΈΈQ R
$num
ΈΈR S
]
ΈΈS T
.
ΈΈT U
column
ΈΈU [
]
ΈΈ[ \
.
ΈΈ\ ]
data
ΈΈ] a
:
ΈΈb c
string
ΈΈd j
.
ΈΈj k
Empty
ΈΈk p
;
ΈΈp q
string
ΉΉ 
SortDir
ΉΉ 
=
ΉΉ 
model
ΉΉ "
.
ΉΉ" #
order
ΉΉ# (
[
ΉΉ( )
$num
ΉΉ) *
]
ΉΉ* +
?
ΉΉ+ ,
.
ΉΉ, -
dir
ΉΉ- 0
;
ΉΉ0 1
SqlParameter
ΊΊ 
[
ΊΊ 
]
ΊΊ 
osqlParameter
ΊΊ (
=
ΊΊ) *
{
»» 
new
ΌΌ 
SqlParameter
ΌΌ  
(
ΌΌ  !
AppConstants
ΌΌ! -
.
ΌΌ- .!
P_CurrentPageNumber
ΌΌ. A
,
ΌΌA B
model
ΌΌD I
.
ΌΌI J
start
ΌΌJ O
)
ΌΌO P
,
ΌΌP Q
new
½½ 
SqlParameter
½½  
(
½½  !
AppConstants
½½! -
.
½½- .

P_PageSize
½½. 8
,
½½8 9
model
½½D I
.
½½I J
length
½½J P
)
½½P Q
,
½½Q R
new
ΎΎ 
SqlParameter
ΎΎ  
(
ΎΎ  !
AppConstants
ΎΎ! -
.
ΎΎ- .
P_SortColumn
ΎΎ. :
,
ΎΎ: ;

ColumnName
ΎΎD N
)
ΎΎN O
,
ΎΎO P
new
ΏΏ 
SqlParameter
ΏΏ  
(
ΏΏ  !
AppConstants
ΏΏ! -
.
ΏΏ- .
P_SortDirection
ΏΏ. =
,
ΏΏ= >
SortDir
ΏΏD K
)
ΏΏK L
,
ΏΏL M
new
ΐΐ 
SqlParameter
ΐΐ  
(
ΐΐ  !
AppConstants
ΐΐ! -
.
ΐΐ- .
P_SearchText
ΐΐ. :
,
ΐΐ: ;
model
ΐΐD I
.
ΐΐI J
search
ΐΐJ P
?
ΐΐP Q
.
ΐΐQ R
value
ΐΐR W
)
ΐΐW X
}
ΑΑ 
;
ΑΑ 
var
ΓΓ 
Results
ΓΓ 
=
ΓΓ 
await
ΓΓ 
_repository
ΓΓ  +
.
ΓΓ+ ,
GetBySP
ΓΓ, 3
(
ΓΓ3 4 
ProcedureMetastore
ΓΓ4 F
.
ΓΓF G$
usp_User_SearchAllList
ΓΓG ]
,
ΓΓ] ^
CommandType
ΓΓ_ j
.
ΓΓj k
StoredProcedure
ΓΓk z
,
ΓΓz {
osqlParameterΓΓ| ‰
)ΓΓ‰ 
;ΓΓ ‹
var
ΖΖ 
res
ΖΖ 
=
ΖΖ 
UtilityHelper
ΖΖ #
.
ΖΖ# $
GetPaginationInfo
ΖΖ$ 5
(
ΖΖ5 6
Results
ΖΖ6 =
)
ΖΖ= >
;
ΖΖ> ?$
DataTableResponseModel
ΘΘ "%
oDataTableResponseModel
ΘΘ# :
=
ΘΘ; <
new
ΘΘ= @$
DataTableResponseModel
ΘΘA W
(
ΘΘW X
model
ΘΘX ]
.
ΘΘ] ^
draw
ΘΘ^ b
,
ΘΘb c
res
ΘΘd g
.
ΘΘg h
Item1
ΘΘh m
,
ΘΘm n
res
ΘΘo r
.
ΘΘr s
Item1
ΘΘs x
,
ΘΘx y
ResultsΘΘz 
.ΘΘ ‚
DataTableToListΘΘ‚ ‘
<ΘΘ‘ ’#
MasterUserListModelΘΘ’ ¥
>ΘΘ¥ ¦
(ΘΘ¦ §
)ΘΘ§ ¨
)ΘΘ¨ ©
;ΘΘ© ª
return
ΚΚ %
oDataTableResponseModel
ΚΚ *
;
ΚΚ* +
}
ΛΛ 	
public
ΝΝ 
async
ΝΝ 
Task
ΝΝ 
<
ΝΝ #
MasterUserDetailModel
ΝΝ /
>
ΝΝ/ 0
GetById
ΝΝ1 8
(
ΝΝ8 9
int
ΝΝ9 <
id
ΝΝ= ?
)
ΝΝ? @
{
ΞΞ 	
var
ΟΟ 
	tableName
ΟΟ 
=
ΟΟ 
Enum
ΟΟ  
.
ΟΟ  !
GetName
ΟΟ! (
(
ΟΟ( )
TableNameEnum
ΟΟ) 6
.
ΟΟ6 7
Master_User
ΟΟ7 B
)
ΟΟB C
;
ΟΟC D
var
ΡΡ 
_userEntity
ΡΡ 
=
ΡΡ 
new
ΡΡ !#
MasterUserDetailModel
ΡΡ" 7
(
ΡΡ7 8
)
ΡΡ8 9
;
ΡΡ9 :
_userEntity
ÒÒ 
=
ÒÒ 
_mapperFactory
ÒÒ (
.
ÒÒ( )
Get
ÒÒ) ,
<
ÒÒ, -

MasterUser
ÒÒ- 7
,
ÒÒ7 8#
MasterUserDetailModel
ÒÒ9 N
>
ÒÒN O
(
ÒÒO P
await
ÒÒP U
_repository
ÒÒV a
.
ÒÒa b
GetAsync
ÒÒb j
(
ÒÒj k
id
ÒÒk m
)
ÒÒm n
)
ÒÒn o
;
ÒÒo p
if
ΣΣ 
(
ΣΣ 
_userEntity
ΣΣ 
!=
ΣΣ 
null
ΣΣ #
)
ΣΣ# $
{
ΤΤ 
_userEntity
ΥΥ 
.
ΥΥ 
DesignationId
ΥΥ )
=
ΥΥ* +
_userEntity
ΥΥ, 7
.
ΥΥ7 8
DesignationId
ΥΥ8 E
is
ΥΥF H
null
ΥΥI M
?
ΥΥN O
$num
ΥΥP Q
:
ΥΥR S
_userEntity
ΥΥT _
.
ΥΥ_ `
DesignationId
ΥΥ` m
;
ΥΥm n
_userEntity
ΦΦ 
.
ΦΦ 
DepartmentId
ΦΦ (
=
ΦΦ) *
_userEntity
ΦΦ+ 6
.
ΦΦ6 7
DepartmentId
ΦΦ7 C
is
ΦΦD F
null
ΦΦG K
?
ΦΦL M
$num
ΦΦN O
:
ΦΦP Q
_userEntity
ΦΦR ]
.
ΦΦ] ^
DepartmentId
ΦΦ^ j
;
ΦΦj k
DbParameter
ΨΨ 
[
ΨΨ 
]
ΨΨ 
osqlParameter
ΨΨ +
=
ΨΨ, -
{
ΩΩ 
new
ΪΪ 
DbParameter
ΪΪ  
(
ΪΪ  !
AppConstants
ΪΪ! -
.
ΪΪ- .

TableKeyId
ΪΪ. 8
,
ΪΪ8 9
id
ΪΪ: <
,
ΪΪ< =
	SqlDbType
ΪΪ> G
.
ΪΪG H
Int
ΪΪH K
)
ΪΪK L
,
ΪΪL M
new
ΫΫ 
DbParameter
ΫΫ  
(
ΫΫ  !
AppConstants
ΫΫ! -
.
ΫΫ- .
	TableName
ΫΫ. 7
,
ΫΫ7 8
	tableName
ΫΫ: C
,
ΫΫC D
	SqlDbType
ΫΫE N
.
ΫΫN O
VarChar
ΫΫO V
)
ΫΫV W
,
ΫΫW X
}
άά 
;
άά 
var
έέ 
UserAddress
έέ 
=
έέ  !
EltizamDBHelper
έέ" 1
.
έέ1 2!
ExecuteMappedReader
έέ2 E
<
έέE F$
MasterUserAddressModel
έέF \
>
έέ\ ]
(
έέ] ^ 
ProcedureMetastore
έέ^ p
.
έέp q1
"usp_Address_GetAddressByTableKeyIdέέq “
,έέ“ ” 
DatabaseConnection
ήή" 4
.
ήή4 5

ConnString
ήή5 ?
,
ήή? @
System
ήήA G
.
ήήG H
Data
ήήH L
.
ήήL M
CommandType
ήήM X
.
ήήX Y
StoredProcedure
ήήY h
,
ήήh i
osqlParameter
ήήj w
)
ήήw x
;
ήήx y
if
ίί 
(
ίί 
UserAddress
ίί 
!=
ίί  "
null
ίί# '
)
ίί' (
{
ΰΰ 
_userEntity
αα 
.
αα  
	Addresses
αα  )
=
αα* +
UserAddress
αα, 7
;
αα7 8
}
ββ 
DbParameter
δδ 
[
δδ 
]
δδ 
osqlParameter1
δδ ,
=
δδ- .
{
εε 
new
ζζ 
DbParameter
ζζ #
(
ζζ# $
AppConstants
ζζ$ 0
.
ζζ0 1

TableKeyId
ζζ1 ;
,
ζζ; <
id
ζζ= ?
,
ζζ? @
	SqlDbType
ζζA J
.
ζζJ K
Int
ζζK N
)
ζζN O
,
ζζO P
new
ηη 
DbParameter
ηη #
(
ηη# $
AppConstants
ηη$ 0
.
ηη0 1
	TableName
ηη1 :
,
ηη: ;
	tableName
ηη< E
,
ηηE F
	SqlDbType
ηηG P
.
ηηP Q
VarChar
ηηQ X
)
ηηX Y
,
ηηY Z
}
θθ 
;
θθ 
var
ιι 
UserQualification
ιι %
=
ιι& '
EltizamDBHelper
ιι( 7
.
ιι7 8!
ExecuteMappedReader
ιι8 K
<
ιιK L'
Master_QualificationModel
ιιL e
>
ιιe f
(
ιιf g 
ProcedureMetastore
ιιg y
.
ιιy z=
.usp_Qualification_GetQualificationByTableKeyIdιιz ¨
,ιι¨ © 
DatabaseConnection
κκ( :
.
κκ: ;

ConnString
κκ; E
,
κκE F
System
κκG M
.
κκM N
Data
κκN R
.
κκR S
CommandType
κκS ^
.
κκ^ _
StoredProcedure
κκ_ n
,
κκn o
osqlParameter1
κκp ~
)
κκ~ 
;κκ €
if
λλ 
(
λλ 
UserQualification
λλ %
!=
λλ& (
null
λλ) -
)
λλ- .
{
μμ 
_userEntity
νν 
.
νν  
Qualifications
νν  .
=
νν/ 0
UserQualification
νν1 B
;
ννB C
}
ξξ 
DbParameter
ππ 
[
ππ 
]
ππ 
osqlParameter2
ππ ,
=
ππ- .
{
ρρ 
new
ςς 
DbParameter
ςς #
(
ςς# $
AppConstants
ςς$ 0
.
ςς0 1

TableKeyId
ςς1 ;
,
ςς; <
id
ςς= ?
,
ςς? @
	SqlDbType
ςςA J
.
ςςJ K
Int
ςςK N
)
ςςN O
,
ςςO P
new
σσ 
DbParameter
σσ #
(
σσ# $
AppConstants
σσ$ 0
.
σσ0 1
	TableName
σσ1 :
,
σσ: ;
	tableName
σσ= F
,
σσF G
	SqlDbType
σσH Q
.
σσQ R
VarChar
σσR Y
)
σσY Z
,
σσZ [
}
ττ 
;
ττ 
var
φφ 
UserDocuments
φφ !
=
φφ" #
EltizamDBHelper
φφ$ 3
.
φφ3 4!
ExecuteMappedReader
φφ4 G
<
φφG H!
MasterDocumentModel
φφH [
>
φφ[ \
(
φφ\ ] 
ProcedureMetastore
φφ] o
.
φφo p3
$usp_Document_GetDocumentByTableKeyIdφφp ”
,φφ” • 
DatabaseConnection
χχ$ 6
.
χχ6 7

ConnString
χχ7 A
,
χχA B
System
χχC I
.
χχI J
Data
χχJ N
.
χχN O
CommandType
χχO Z
.
χχZ [
StoredProcedure
χχ[ j
,
χχj k
osqlParameter2
χχl z
)
χχz {
;
χχ{ |
if
ψψ 
(
ψψ 
UserDocuments
ψψ !
!=
ψψ" $
null
ψψ% )
)
ψψ) *
{
ωω 
_userEntity
ϊϊ 
.
ϊϊ  
	Documents
ϊϊ  )
=
ϊϊ* +
UserDocuments
ϊϊ, 9
;
ϊϊ9 :
}
ϋϋ 
if
ύύ 
(
ύύ 
_userEntity
ύύ 
.
ύύ  !
ProfileAttachmentId
ύύ  3
!=
ύύ4 6
null
ύύ7 ;
&&
ύύ< >
_userEntity
ύύ? J
.
ύύJ K!
ProfileAttachmentId
ύύK ^
>
ύύ_ `
$num
ύύa b
)
ύύb c
{
ώώ 
var
ÿÿ 
profile
ÿÿ 
=
ÿÿ  !!
_documentRepository
ÿÿ" 5
.
ÿÿ5 6
Get
ÿÿ6 9
(
ÿÿ9 :
_userEntity
ÿÿ: E
.
ÿÿE F!
ProfileAttachmentId
ÿÿF Y
)
ÿÿY Z
;
ÿÿZ [
if
€€ 
(
€€ 
profile
€€ 
!=
€€  "
null
€€# '
)
€€' (
{
 
_userEntity
‚‚ #
.
‚‚# $
ProfilePath
‚‚$ /
=
‚‚0 1
profile
‚‚2 9
.
‚‚9 :
FilePath
‚‚: B
;
‚‚B C
}
ƒƒ 
}
„„ 
}
…… 
return
‡‡ 
_userEntity
‡‡ 
;
‡‡ 
}
 	
public
 
async
 
Task
 
<
 
DBOperation
 %
>
% &
Upsert
' -
(
- .
MasterUserModel
. =

entityUser
> H
)
H I
{
‘‘ 	
try
’’ 
{
““ 
if
•• 
(
•• 
!
•• 
string
•• 
.
•• 
IsNullOrEmpty
•• )
(
••) *

entityUser
••* 4
.
••4 5
Password
••5 =
)
••= >
&&
••? A

entityUser
••B L
.
••L M
Id
••M O
<=
••P R
$num
••S T
)
••T U
{
–– 

entityUser
—— 
.
—— 
Password
—— '
=
——( )
UtilityHelper
——* 7
.
——7 8"
GenerateSHA256String
——8 L
(
——L M

entityUser
——M W
.
——W X
Password
——X `
)
——` a
;
——a b

entityUser
 
.
 
ConfirmPassowrd
 .
=
/ 0

entityUser
1 ;
.
; <
Password
< D
;
D E
}
™™ 

MasterUser
 
objUser
 "
;
" #
MasterAddress
 
objUserAddress
 ,
;
, -!
MasterQualification
 #"
objUserQualification
$ 8
;
8 9
MasterDocument
 
objUserDocument
 .
;
. /
string
΅΅ 
MainTableName
΅΅ $
=
΅΅% &
Enum
΅΅' +
.
΅΅+ ,
GetName
΅΅, 3
(
΅΅3 4
TableNameEnum
΅΅4 A
.
΅΅A B
Master_User
΅΅B M
)
΅΅M N
;
΅΅N O
int
ΆΆ 
MainTableKey
ΆΆ  
=
ΆΆ! "

entityUser
ΆΆ# -
.
ΆΆ- .
Id
ΆΆ. 0
;
ΆΆ0 1
if
¥¥ 
(
¥¥ 

entityUser
¥¥ 
.
¥¥ 
Id
¥¥ !
>
¥¥" #
$num
¥¥$ %
)
¥¥% &
{
¦¦ 

MasterUser
¨¨ 
	OldEntity
¨¨ (
=
¨¨) *
null
¨¨+ /
;
¨¨/ 0
	OldEntity
©© 
=
©© 
_repository
©©  +
.
©©+ ,
GetNoTracking
©©, 9
(
©©9 :

entityUser
©©: D
.
©©D E
Id
©©E G
)
©©G H
;
©©H I
objUser
«« 
=
«« 
_repository
«« )
.
««) *
Get
««* -
(
««- .

entityUser
««. 8
.
««8 9
Id
««9 ;
)
««; <
;
««< =
if
­­ 
(
­­ 
objUser
­­ 
!=
­­  "
null
­­# '
)
­­' (
{
®® 
objUser
―― 
.
――  
	FirstName
――  )
=
――* +

entityUser
――, 6
.
――6 7
	FirstName
――7 @
;
――@ A
objUser
°° 
.
°°  

MiddleName
°°  *
=
°°+ ,

entityUser
°°- 7
.
°°7 8

MiddleName
°°8 B
;
°°B C
objUser
±± 
.
±±  
LastName
±±  (
=
±±) *

entityUser
±±+ 5
.
±±5 6
LastName
±±6 >
;
±±> ?
objUser
²² 
.
²²  
UserName
²²  (
=
²²) *

entityUser
²²+ 5
.
²²5 6
UserName
²²6 >
;
²²> ?
objUser
³³ 
.
³³  
GenderId
³³  (
=
³³) *

entityUser
³³+ 5
.
³³5 6
GenderId
³³6 >
;
³³> ?
objUser
΄΄ 
.
΄΄  
DateOfBirth
΄΄  +
=
΄΄, -

entityUser
΄΄. 8
.
΄΄8 9
DateOfBirth
΄΄9 D
;
΄΄D E
objUser
µµ 
.
µµ  
DepartmentId
µµ  ,
=
µµ- .

entityUser
µµ/ 9
.
µµ9 :
DepartmentId
µµ: F
;
µµF G
objUser
¶¶ 
.
¶¶  
DesignationId
¶¶  -
=
¶¶. /

entityUser
¶¶0 :
.
¶¶: ;
DesignationId
¶¶; H
;
¶¶H I
objUser
·· 
.
··  
	LicenseNo
··  )
=
··* +

entityUser
··, 6
.
··6 7
	LicenseNo
··7 @
;
··@ A
objUser
ΈΈ 
.
ΈΈ  
	CompanyId
ΈΈ  )
=
ΈΈ* +

entityUser
ΈΈ, 6
.
ΈΈ6 7
	CompanyId
ΈΈ7 @
;
ΈΈ@ A
objUser
ΉΉ 
.
ΉΉ  
CompanyName
ΉΉ  +
=
ΉΉ, -

entityUser
ΉΉ. 8
.
ΉΉ8 9
CompanyName
ΉΉ9 D
;
ΉΉD E
objUser
ΊΊ 
.
ΊΊ  

ResourceId
ΊΊ  *
=
ΊΊ+ ,

entityUser
ΊΊ- 7
.
ΊΊ7 8

ResourceId
ΊΊ8 B
;
ΊΊB C
objUser
»» 
.
»»  
IsActive
»»  (
=
»») *

entityUser
»»+ 5
.
»»5 6
IsActive
»»6 >
;
»»> ?
objUser
ΌΌ 
.
ΌΌ  
RoleId
ΌΌ  &
=
ΌΌ' (

entityUser
ΌΌ) 3
.
ΌΌ3 4
RoleId
ΌΌ4 :
;
ΌΌ: ;
objUser
½½ 
.
½½  
ApproverLevelId
½½  /
=
½½0 1

entityUser
½½2 <
.
½½< =
RoleId
½½= C
==
½½D F
(
½½G H
int
½½H K
)
½½K L
RoleEnum
½½L T
.
½½T U
Approver
½½U ]
?
½½^ _

entityUser
½½` j
.
½½j k
ApproverLevelId
½½k z
:
½½{ |
null½½} 
;½½ ‚
objUser
ΎΎ 
.
ΎΎ  
Email
ΎΎ  %
=
ΎΎ& '

entityUser
ΎΎ( 2
.
ΎΎ2 3
Email
ΎΎ3 8
;
ΎΎ8 9
objUser
ΏΏ 
.
ΏΏ  

ModifiedBy
ΏΏ  *
=
ΏΏ+ ,

entityUser
ΏΏ- 7
.
ΏΏ7 8

ModifiedBy
ΏΏ8 B
;
ΏΏB C
_repository
ΒΒ #
.
ΒΒ# $
UpdateAsync
ΒΒ$ /
(
ΒΒ/ 0
objUser
ΒΒ0 7
)
ΒΒ7 8
;
ΒΒ8 9
await
ΔΔ 
_unitOfWork
ΔΔ )
.
ΔΔ) *
SaveChangesAsync
ΔΔ* :
(
ΔΔ: ;
)
ΔΔ; <
;
ΔΔ< =
await
ΗΗ 
_auditLogService
ΗΗ .
.
ΗΗ. /
CreateAuditLog
ΗΗ/ =
<
ΗΗ= >

MasterUser
ΗΗ> H
>
ΗΗH I
(
ΗΗI J!
AuditActionTypeEnum
ΗΗJ ]
.
ΗΗ] ^
Update
ΗΗ^ d
,
ΗΗd e
	OldEntity
ΗΗf o
,
ΗΗo p
objUser
ΗΗq x
,
ΗΗx y
MainTableNameΗΗz ‡
,ΗΗ‡ 
MainTableKeyΗΗ‰ •
)ΗΗ• –
;ΗΗ– —
}
ΘΘ 
}
ΙΙ 
else
ΚΚ 
{
ΛΛ 
objUser
ΜΜ 
=
ΜΜ 
_mapperFactory
ΜΜ ,
.
ΜΜ, -
Get
ΜΜ- 0
<
ΜΜ0 1
MasterUserModel
ΜΜ1 @
,
ΜΜ@ A

MasterUser
ΜΜB L
>
ΜΜL M
(
ΜΜM N

entityUser
ΜΜN X
)
ΜΜX Y
;
ΜΜY Z
objUser
ΝΝ 
.
ΝΝ 
IsActive
ΝΝ $
=
ΝΝ% &

entityUser
ΝΝ' 1
.
ΝΝ1 2
IsActive
ΝΝ2 :
;
ΝΝ: ;
objUser
ΞΞ 
.
ΞΞ 
	CreatedBy
ΞΞ %
=
ΞΞ& '

entityUser
ΞΞ( 2
.
ΞΞ2 3
	CreatedBy
ΞΞ3 <
;
ΞΞ< =
_repository
ΠΠ 
.
ΠΠ  
AddAsync
ΠΠ  (
(
ΠΠ( )
objUser
ΠΠ) 0
)
ΠΠ0 1
;
ΠΠ1 2
await
ΡΡ 
_unitOfWork
ΡΡ %
.
ΡΡ% &
SaveChangesAsync
ΡΡ& 6
(
ΡΡ6 7
)
ΡΡ7 8
;
ΡΡ8 9
}
ÒÒ 
if
ΥΥ 
(
ΥΥ 
objUser
ΥΥ 
.
ΥΥ 
Id
ΥΥ 
==
ΥΥ !
$num
ΥΥ" #
)
ΥΥ# $
return
ΦΦ 
DBOperation
ΦΦ &
.
ΦΦ& '
Error
ΦΦ' ,
;
ΦΦ, -
else
ΧΧ 
{
ΨΨ 
if
ΩΩ 
(
ΩΩ 

entityUser
ΩΩ "
.
ΩΩ" #
uploadProfile
ΩΩ# 0
!=
ΩΩ1 3
null
ΩΩ4 8
)
ΩΩ8 9
{
ΪΪ 
objUserDocument
ΫΫ '
=
ΫΫ( )
_mapperFactory
ΫΫ* 8
.
ΫΫ8 9
Get
ΫΫ9 <
<
ΫΫ< =!
MasterDocumentModel
ΫΫ= P
,
ΫΫP Q
MasterDocument
ΫΫR `
>
ΫΫ` a
(
ΫΫa b

entityUser
ΫΫb l
.
ΫΫl m
uploadProfile
ΫΫm z
)
ΫΫz {
;
ΫΫ{ |
objUserDocument
άά '
.
άά' (
IsActive
άά( 0
=
άά1 2

entityUser
άά3 =
.
άά= >
uploadProfile
άά> K
.
άάK L
IsActive
άάL T
;
άάT U
objUserDocument
έέ '
.
έέ' (

TableKeyId
έέ( 2
=
έέ3 4
objUser
έέ5 <
.
έέ< =
Id
έέ= ?
;
έέ? @
objUserDocument
ήή '
.
ήή' (
	TableName
ήή( 1
=
ήή2 3
$str
ήή4 B
;
ήήB C
objUserDocument
ίί '
.
ίί' (
DocumentName
ίί( 4
=
ίί5 6

entityUser
ίί7 A
.
ίίA B
uploadProfile
ίίB O
.
ίίO P
DocumentName
ίίP \
;
ίί\ ]
objUserDocument
ΰΰ '
.
ΰΰ' (
FileName
ΰΰ( 0
=
ΰΰ1 2

entityUser
ΰΰ3 =
.
ΰΰ= >
uploadProfile
ΰΰ> K
.
ΰΰK L
FileName
ΰΰL T
;
ΰΰT U
objUserDocument
αα '
.
αα' (
FilePath
αα( 0
=
αα1 2

entityUser
αα3 =
.
αα= >
uploadProfile
αα> K
.
ααK L
FilePath
ααL T
;
ααT U
objUserDocument
ββ '
.
ββ' (
FileType
ββ( 0
=
ββ1 2

entityUser
ββ3 =
.
ββ= >
uploadProfile
ββ> K
.
ββK L
FileType
ββL T
;
ββT U
objUserDocument
γγ '
.
γγ' (
	CreatedBy
γγ( 1
=
γγ2 3

entityUser
γγ4 >
.
γγ> ?
uploadProfile
γγ? L
.
γγL M
	CreatedBy
γγM V
;
γγV W!
_documentRepository
εε +
.
εε+ ,
AddAsync
εε, 4
(
εε4 5
objUserDocument
εε5 D
)
εεD E
;
εεE F
await
ζζ 
_unitOfWork
ζζ )
.
ζζ) *
SaveChangesAsync
ζζ* :
(
ζζ: ;
)
ζζ; <
;
ζζ< =
var
θθ 
user
θθ  
=
θθ! "
_repository
θθ# .
.
θθ. /
Get
θθ/ 2
(
θθ2 3

entityUser
θθ3 =
.
θθ= >
Id
θθ> @
)
θθ@ A
;
θθA B
user
ιι 
.
ιι !
ProfileAttachmentId
ιι 0
=
ιι1 2
objUserDocument
ιι3 B
.
ιιB C
Id
ιιC E
;
ιιE F
_repository
λλ #
.
λλ# $
UpdateAsync
λλ$ /
(
λλ/ 0
user
λλ0 4
)
λλ4 5
;
λλ5 6
await
μμ 
_unitOfWork
μμ )
.
μμ) *
SaveChangesAsync
μμ* :
(
μμ: ;
)
μμ; <
;
μμ< =
}
νν 
if
ππ 
(
ππ 

entityUser
ππ "
.
ππ" #
	Addresses
ππ# ,
.
ππ, -
Count
ππ- 2
>
ππ3 4
$num
ππ5 6
)
ππ6 7
{
ρρ 
var
σσ 
entityAddressess
σσ ,
=
σσ- . 
_addressRepository
σσ/ A
.
σσA B
GetAll
σσB H
(
σσH I
)
σσI J
.
σσJ K
Where
σσK P
(
σσP Q
x
σσQ R
=>
σσS U
x
σσV W
.
σσW X

TableKeyId
σσX b
==
σσc e

entityUser
σσf p
.
σσp q
Id
σσq s
&&
σσt v
x
σσw x
.
σσx y
	TableNameσσy ‚
==σσƒ …
$strσσ† “
&&σσ” –
(σσ— 
xσσ ™
.σσ™ 
	IsDeletedσσ £
==σσ¤ ¦
falseσσ§ ¬
||σσ­ ―
xσσ° ±
.σσ± ²
	IsDeletedσσ² »
==σσΌ Ύ
nullσσΏ Γ
)σσΓ Δ
)σσΔ Ε
.σσΕ Ζ
ToListσσΖ Μ
(σσΜ Ν
)σσΝ Ξ
;σσΞ Ο
var
ττ 
allAddressId
ττ (
=
ττ) *
entityAddressess
ττ+ ;
.
ττ; <
Count
ττ< A
>
ττB C
$num
ττD E
?
ττF G
entityAddressess
ττH X
.
ττX Y
Select
ττY _
(
ττ_ `
x
ττ` a
=>
ττb d
x
ττe f
.
ττf g
Id
ττg i
)
ττi j
.
ττj k
OrderBy
ττk r
(
ττr s
Id
ττs u
=>
ττv x
Id
ττy {
)
ττ{ |
.
ττ| }
ToListττ} ƒ
(ττƒ „
)ττ„ …
:ττ† ‡
nullττ 
;ττ 
foreach
φφ 
(
φφ  !
var
φφ! $
address
φφ% ,
in
φφ- /

entityUser
φφ0 :
.
φφ: ;
	Addresses
φφ; D
)
φφD E
{
χχ 
if
ψψ 
(
ψψ  
address
ψψ  '
.
ψψ' (
Id
ψψ( *
>
ψψ+ ,
$num
ψψ- .
)
ψψ. /
{
ωω 
if
ϊϊ  "
(
ϊϊ# $
allAddressId
ϊϊ$ 0
!=
ϊϊ1 3
null
ϊϊ4 8
&&
ϊϊ9 ;
allAddressId
ϊϊ< H
.
ϊϊH I
Count
ϊϊI N
>
ϊϊO P
$num
ϊϊQ R
)
ϊϊR S
{
ϋϋ  !
allAddressId
όό$ 0
.
όό0 1
Remove
όό1 7
(
όό7 8
address
όό8 ?
.
όό? @
Id
όό@ B
)
όόB C
;
όόC D
}
ύύ  !
var
ÿÿ  #
	OldEntity
ÿÿ$ -
=
ÿÿ. / 
_addressRepository
ÿÿ0 B
.
ÿÿB C
GetNoTracking
ÿÿC P
(
ÿÿP Q
address
ÿÿQ X
.
ÿÿX Y
Id
ÿÿY [
)
ÿÿ[ \
;
ÿÿ\ ]
objUserAddress
€€  .
=
€€/ 0 
_addressRepository
€€1 C
.
€€C D
Get
€€D G
(
€€G H
address
€€H O
.
€€O P
Id
€€P R
)
€€R S
;
€€S T
if
‚‚  "
(
‚‚# $
objUserAddress
‚‚$ 2
!=
‚‚3 5
null
‚‚6 :
)
‚‚: ;
{
ƒƒ  !
var
„„$ '
entityAddress
„„( 5
=
„„6 7
_mapperFactory
„„8 F
.
„„F G
Get
„„G J
<
„„J K$
MasterUserAddressModel
„„K a
,
„„a b
MasterAddress
„„c p
>
„„p q
(
„„q r
address
„„r y
)
„„y z
;
„„z {
objUserAddress
……$ 2
.
……2 3
Address1
……3 ;
=
……< =
entityAddress
……> K
.
……K L
Address1
……L T
;
……T U
objUserAddress
††$ 2
.
††2 3
Address1
††3 ;
=
††< =
entityAddress
††> K
.
††K L
Address1
††L T
;
††T U
objUserAddress
‡‡$ 2
.
‡‡2 3
Address2
‡‡3 ;
=
‡‡< =
entityAddress
‡‡> K
.
‡‡K L
Address2
‡‡L T
;
‡‡T U
objUserAddress
$ 2
.
2 3
Address3
3 ;
=
< =
entityAddress
> K
.
K L
Address3
L T
;
T U
objUserAddress
‰‰$ 2
.
‰‰2 3
Landmark
‰‰3 ;
=
‰‰< =
entityAddress
‰‰> K
.
‰‰K L
Landmark
‰‰L T
;
‰‰T U
objUserAddress
$ 2
.
2 3
	CountryId
3 <
=
= >
entityAddress
? L
.
L M
	CountryId
M V
;
V W
objUserAddress
‹‹$ 2
.
‹‹2 3
StateId
‹‹3 :
=
‹‹; <
entityAddress
‹‹= J
.
‹‹J K
StateId
‹‹K R
;
‹‹R S
;
‹‹T U
objUserAddress
$ 2
.
2 3
CityId
3 9
=
: ;
entityAddress
< I
.
I J
CityId
J P
;
P Q
objUserAddress
$ 2
.
2 3
PinNo
3 8
=
9 :
entityAddress
; H
.
H I
PinNo
I N
;
N O
objUserAddress
$ 2
.
2 3
Zone
3 7
=
8 9
entityAddress
: G
.
G H
Zone
H L
;
L M
objUserAddress
$ 2
.
2 3
Email
3 8
=
9 :
entityAddress
; H
.
H I
Email
I N
;
N O
objUserAddress
$ 2
.
2 3
AlternateEmail
3 A
=
B C
entityAddress
D Q
.
Q R
AlternateEmail
R `
;
` a
objUserAddress
‘‘$ 2
.
‘‘2 3
Phone
‘‘3 8
=
‘‘9 :
entityAddress
‘‘; H
.
‘‘H I
Phone
‘‘I N
;
‘‘N O
objUserAddress
’’$ 2
.
’’2 3
PhoneExt
’’3 ;
=
’’< =
entityAddress
’’> K
.
’’K L
PhoneExt
’’L T
;
’’T U
objUserAddress
““$ 2
.
““2 3
AlternatePhone
““3 A
=
““B C
entityAddress
““D Q
.
““Q R
AlternatePhone
““R `
;
““` a
objUserAddress
””$ 2
.
””2 3
AlternatePhoneExt
””3 D
=
””E F
entityAddress
””G T
.
””T U
AlternatePhoneExt
””U f
;
””f g
objUserAddress
••$ 2
.
••2 3
Landlinephone
••3 @
=
••A B
entityAddress
••C P
.
••P Q
Landlinephone
••Q ^
;
••^ _
objUserAddress
——$ 2
.
——2 3

ModifiedBy
——3 =
=
——> ?

entityUser
——@ J
.
——J K

ModifiedBy
——K U
;
——U V 
_addressRepository
™™$ 6
.
™™6 7
UpdateAsync
™™7 B
(
™™B C
objUserAddress
™™C Q
)
™™Q R
;
™™R S
await
››$ )
_unitOfWork
››* 5
.
››5 6
SaveChangesAsync
››6 F
(
››F G
)
››G H
;
››H I
await
$ )
_auditLogService
* :
.
: ;
CreateAuditLog
; I
<
I J
MasterAddress
J W
>
W X
(
X Y!
AuditActionTypeEnum
Y l
.
l m
Update
m s
,
s t
	OldEntity
u ~
,
~ 
objUserAddress€ 
, 
MainTableName 
, 
MainTableKey «
)« ¬
;¬ ­
}
  !
}
   
else
΅΅  
{
ΆΆ 
objUserAddress
££  .
=
££/ 0
_mapperFactory
££1 ?
.
££? @
Get
££@ C
<
££C D$
MasterUserAddressModel
££D Z
,
££Z [
MasterAddress
££\ i
>
££i j
(
££j k
address
££k r
)
££r s
;
££s t
objUserAddress
¤¤  .
.
¤¤. /
IsActive
¤¤/ 7
=
¤¤8 9
true
¤¤: >
;
¤¤> ?
objUserAddress
¥¥  .
.
¥¥. /

TableKeyId
¥¥/ 9
=
¥¥: ;
objUser
¥¥< C
.
¥¥C D
Id
¥¥D F
;
¥¥F G
objUserAddress
¦¦  .
.
¦¦. /
	TableName
¦¦/ 8
=
¦¦9 :
Enum
¦¦; ?
.
¦¦? @
GetName
¦¦@ G
(
¦¦G H
TableNameEnum
¦¦H U
.
¦¦U V
Master_User
¦¦V a
)
¦¦a b
;
¦¦b c
objUserAddress
§§  .
.
§§. /
	CreatedBy
§§/ 8
=
§§9 :

entityUser
§§; E
.
§§E F
	CreatedBy
§§F O
;
§§O P 
_addressRepository
©©  2
.
©©2 3
AddAsync
©©3 ;
(
©©; <
objUserAddress
©©< J
)
©©J K
;
©©K L
await
ªª  %
_unitOfWork
ªª& 1
.
ªª1 2
SaveChangesAsync
ªª2 B
(
ªªB C
)
ªªC D
;
ªªD E
}
«« 
}
¬¬ 
if
­­ 
(
­­ 
allAddressId
­­ (
!=
­­) +
null
­­, 0
&&
­­1 3
allAddressId
­­4 @
.
­­@ A
Count
­­A F
>
­­G H
$num
­­I J
)
­­J K
{
®® 
foreach
―― #
(
――$ %
var
――% (
addId
――) .
in
――/ 1
allAddressId
――2 >
)
――> ?
{
°° 
var
±±  #
	entityAdd
±±$ -
=
±±. / 
_addressRepository
±±0 B
.
±±B C
Get
±±C F
(
±±F G
x
±±G H
=>
±±I K
x
±±L M
.
±±M N
Id
±±N P
==
±±Q S
addId
±±T Y
)
±±Y Z
;
±±Z [
if
²²  "
(
²²# $
	entityAdd
²²$ -
!=
²². 0
null
²²1 5
)
²²5 6
{
³³  ! 
_addressRepository
΄΄$ 6
.
΄΄6 7
Remove
΄΄7 =
(
΄΄= >
	entityAdd
΄΄> G
)
΄΄G H
;
΄΄H I
}
µµ  !
}
¶¶ 
await
·· !
_unitOfWork
··" -
.
··- .
SaveChangesAsync
··. >
(
··> ?
)
··? @
;
··@ A
}
ΈΈ 
}
ΉΉ 
if
ΌΌ 
(
ΌΌ 

entityUser
ΌΌ "
.
ΌΌ" #
Qualifications
ΌΌ# 1
.
ΌΌ1 2
Count
ΌΌ2 7
>
ΌΌ8 9
$num
ΌΌ: ;
)
ΌΌ; <
{
½½ 
var
ΏΏ 
entityContacts
ΏΏ *
=
ΏΏ+ , 
_qualifyRepository
ΏΏ- ?
.
ΏΏ? @
GetAll
ΏΏ@ F
(
ΏΏF G
)
ΏΏG H
.
ΏΏH I
Where
ΏΏI N
(
ΏΏN O
x
ΏΏO P
=>
ΏΏQ S
x
ΏΏT U
.
ΏΏU V

TableKeyId
ΏΏV `
==
ΏΏa c

entityUser
ΏΏd n
.
ΏΏn o
Id
ΏΏo q
&&
ΏΏr t
x
ΏΏu v
.
ΏΏv w
	TableNameΏΏw €
==ΏΏ ƒ
$strΏΏ„ ‘
&&ΏΏ’ ”
(ΏΏ• –
xΏΏ– —
.ΏΏ— 
	IsDeletedΏΏ ΅
==ΏΏΆ ¤
falseΏΏ¥ ª
||ΏΏ« ­
xΏΏ® ―
.ΏΏ― °
	IsDeletedΏΏ° Ή
==ΏΏΊ Ό
nullΏΏ½ Α
)ΏΏΑ Β
)ΏΏΒ Γ
.ΏΏΓ Δ
ToListΏΏΔ Κ
(ΏΏΚ Λ
)ΏΏΛ Μ
;ΏΏΜ Ν
var
ΐΐ 
allContactId
ΐΐ (
=
ΐΐ) *
entityContacts
ΐΐ+ 9
.
ΐΐ9 :
Count
ΐΐ: ?
>
ΐΐ@ A
$num
ΐΐB C
?
ΐΐD E
entityContacts
ΐΐF T
.
ΐΐT U
Select
ΐΐU [
(
ΐΐ[ \
x
ΐΐ\ ]
=>
ΐΐ^ `
x
ΐΐa b
.
ΐΐb c
Id
ΐΐc e
)
ΐΐe f
.
ΐΐf g
OrderBy
ΐΐg n
(
ΐΐn o
Id
ΐΐo q
=>
ΐΐr t
Id
ΐΐu w
)
ΐΐw x
.
ΐΐx y
ToList
ΐΐy 
(ΐΐ €
)ΐΐ€ 
:ΐΐ‚ ƒ
nullΐΐ„ 
;ΐΐ ‰
foreach
ΒΒ 
(
ΒΒ  !
var
ΒΒ! $
qualify
ΒΒ% ,
in
ΒΒ- /

entityUser
ΒΒ0 :
.
ΒΒ: ;
Qualifications
ΒΒ; I
)
ΒΒI J
{
ΓΓ 
var
ΔΔ 
Qlfc
ΔΔ  $
=
ΔΔ% &
qualify
ΔΔ' .
;
ΔΔ. /
if
ΕΕ 
(
ΕΕ  
Qlfc
ΕΕ  $
.
ΕΕ$ %
Id
ΕΕ% '
>
ΕΕ( )
$num
ΕΕ* +
)
ΕΕ+ ,
{
ΖΖ 
if
ΗΗ  "
(
ΗΗ# $
allContactId
ΗΗ$ 0
!=
ΗΗ1 3
null
ΗΗ4 8
&&
ΗΗ9 ;
allContactId
ΗΗ< H
.
ΗΗH I
Count
ΗΗI N
>
ΗΗO P
$num
ΗΗQ R
)
ΗΗR S
{
ΘΘ  !
allContactId
ΙΙ$ 0
.
ΙΙ0 1
Remove
ΙΙ1 7
(
ΙΙ7 8
qualify
ΙΙ8 ?
.
ΙΙ? @
Id
ΙΙ@ B
)
ΙΙB C
;
ΙΙC D
}
ΚΚ  !
var
ΜΜ  #
	OldEntity
ΜΜ$ -
=
ΜΜ. / 
_qualifyRepository
ΜΜ0 B
.
ΜΜB C
GetNoTracking
ΜΜC P
(
ΜΜP Q
Qlfc
ΜΜQ U
.
ΜΜU V
Id
ΜΜV X
)
ΜΜX Y
;
ΜΜY Z"
objUserQualification
ΝΝ  4
=
ΝΝ5 6 
_qualifyRepository
ΝΝ7 I
.
ΝΝI J
Get
ΝΝJ M
(
ΝΝM N
Qlfc
ΝΝN R
.
ΝΝR S
Id
ΝΝS U
)
ΝΝU V
;
ΝΝV W
if
ΟΟ  "
(
ΟΟ# $"
objUserQualification
ΟΟ$ 8
!=
ΟΟ9 ;
null
ΟΟ< @
)
ΟΟ@ A
{
ΠΠ  !"
objUserQualification
ΡΡ$ 8
.
ΡΡ8 9
Qualification
ΡΡ9 F
=
ΡΡG H
Qlfc
ΡΡI M
.
ΡΡM N
Qualification
ΡΡN [
;
ΡΡ[ \"
objUserQualification
ÒÒ$ 8
.
ÒÒ8 9
Subject
ÒÒ9 @
=
ÒÒA B
Qlfc
ÒÒC G
.
ÒÒG H
Subject
ÒÒH O
;
ÒÒO P"
objUserQualification
ΣΣ$ 8
.
ΣΣ8 9
	Institute
ΣΣ9 B
=
ΣΣC D
Qlfc
ΣΣE I
.
ΣΣI J
	Institute
ΣΣJ S
;
ΣΣS T"
objUserQualification
ΤΤ$ 8
.
ΤΤ8 9
Grade
ΤΤ9 >
=
ΤΤ? @
Qlfc
ΤΤA E
.
ΤΤE F
Grade
ΤΤF K
;
ΤΤK L"
objUserQualification
ΥΥ$ 8
.
ΥΥ8 9
YearOfInstitute
ΥΥ9 H
=
ΥΥI J
Qlfc
ΥΥK O
.
ΥΥO P
YearOfInstitute
ΥΥP _
;
ΥΥ_ `"
objUserQualification
ΧΧ$ 8
.
ΧΧ8 9

ModifiedBy
ΧΧ9 C
=
ΧΧD E

entityUser
ΧΧF P
.
ΧΧP Q

ModifiedBy
ΧΧQ [
;
ΧΧ[ \ 
_qualifyRepository
ΩΩ$ 6
.
ΩΩ6 7
UpdateAsync
ΩΩ7 B
(
ΩΩB C"
objUserQualification
ΩΩC W
)
ΩΩW X
;
ΩΩX Y
await
ΫΫ$ )
_unitOfWork
ΫΫ* 5
.
ΫΫ5 6
SaveChangesAsync
ΫΫ6 F
(
ΫΫF G
)
ΫΫG H
;
ΫΫH I
await
ήή$ )
_auditLogService
ήή* :
.
ήή: ;
CreateAuditLog
ήή; I
<
ήήI J!
MasterQualification
ήήJ ]
>
ήή] ^
(
ήή^ _!
AuditActionTypeEnum
ήή_ r
.
ήήr s
Update
ήήs y
,
ήήy z
	OldEntityήή{ „
,ήή„ …$
objUserQualificationήή† 
,ήή ›
MainTableNameήή ©
,ήή© ª
MainTableKeyήή« ·
)ήή· Έ
;ήήΈ Ή
}
ίί  !
}
ΰΰ 
else
αα  
{
ββ "
objUserQualification
γγ  4
=
γγ5 6
_mapperFactory
γγ7 E
.
γγE F
Get
γγF I
<
γγI J'
Master_QualificationModel
γγJ c
,
γγc d!
MasterQualification
γγe x
>
γγx y
(
γγy z
qualifyγγz 
)γγ ‚
;γγ‚ ƒ"
objUserQualification
δδ  4
.
δδ4 5
IsActive
δδ5 =
=
δδ> ?
$num
δδ@ A
;
δδA B"
objUserQualification
εε  4
.
εε4 5

TableKeyId
εε5 ?
=
εε@ A
objUser
εεB I
.
εεI J
Id
εεJ L
;
εεL M"
objUserQualification
ζζ  4
.
ζζ4 5
	TableName
ζζ5 >
=
ζζ? @
Enum
ζζA E
.
ζζE F
GetName
ζζF M
(
ζζM N
TableNameEnum
ζζN [
.
ζζ[ \
Master_User
ζζ\ g
)
ζζg h
;
ζζh i"
objUserQualification
ηη  4
.
ηη4 5
	CreatedBy
ηη5 >
=
ηη? @

entityUser
ηηA K
.
ηηK L
	CreatedBy
ηηL U
;
ηηU V 
_qualifyRepository
ιι  2
.
ιι2 3
AddAsync
ιι3 ;
(
ιι; <"
objUserQualification
ιι< P
)
ιιP Q
;
ιιQ R
await
κκ  %
_unitOfWork
κκ& 1
.
κκ1 2
SaveChangesAsync
κκ2 B
(
κκB C
)
κκC D
;
κκD E
}
λλ 
}
μμ 
if
νν 
(
νν 
allContactId
νν (
!=
νν) +
null
νν, 0
&&
νν1 3
allContactId
νν4 @
.
νν@ A
Count
ννA F
>
ννG H
$num
ννI J
)
ννJ K
{
ξξ 
foreach
οο #
(
οο$ %
var
οο% (
addId
οο) .
in
οο/ 1
allContactId
οο2 >
)
οο> ?
{
ππ 
var
ρρ  #
	entityAdd
ρρ$ -
=
ρρ. / 
_qualifyRepository
ρρ0 B
.
ρρB C
Get
ρρC F
(
ρρF G
x
ρρG H
=>
ρρI K
x
ρρL M
.
ρρM N
Id
ρρN P
==
ρρQ S
addId
ρρT Y
)
ρρY Z
;
ρρZ [
if
ςς  "
(
ςς# $
	entityAdd
ςς$ -
!=
ςς. 0
null
ςς1 5
)
ςς5 6
{
σσ  ! 
_qualifyRepository
ττ$ 6
.
ττ6 7
Remove
ττ7 =
(
ττ= >
	entityAdd
ττ> G
)
ττG H
;
ττH I
}
υυ  !
}
φφ 
await
χχ !
_unitOfWork
χχ" -
.
χχ- .
SaveChangesAsync
χχ. >
(
χχ> ?
)
χχ? @
;
χχ@ A
}
ψψ 
}
ωω 
if
ϋϋ 
(
ϋϋ 

entityUser
ϋϋ "
.
ϋϋ" #
uploadDocument
ϋϋ# 1
!=
ϋϋ2 4
null
ϋϋ5 9
)
ϋϋ9 :
{
όό 
foreach
ύύ 
(
ύύ  !
var
ύύ! $
doc
ύύ% (
in
ύύ) +

entityUser
ύύ, 6
.
ύύ6 7
uploadDocument
ύύ7 E
)
ύύE F
{
ώώ 
objUserDocument
ÿÿ +
=
ÿÿ, -
_mapperFactory
ÿÿ. <
.
ÿÿ< =
Get
ÿÿ= @
<
ÿÿ@ A!
MasterDocumentModel
ÿÿA T
,
ÿÿT U
MasterDocument
ÿÿV d
>
ÿÿd e
(
ÿÿe f
doc
ÿÿf i
)
ÿÿi j
;
ÿÿj k
objUserDocument
€€ +
.
€€+ ,
IsActive
€€, 4
=
€€5 6
doc
€€7 :
.
€€: ;
IsActive
€€; C
;
€€C D
objUserDocument
 +
.
+ ,

TableKeyId
, 6
=
7 8
objUser
9 @
.
@ A
Id
A C
;
C D
objUserDocument
‚‚ +
.
‚‚+ ,
	TableName
‚‚, 5
=
‚‚6 7
Enum
‚‚8 <
.
‚‚< =
GetName
‚‚= D
(
‚‚D E
TableNameEnum
‚‚E R
.
‚‚R S
Master_User
‚‚S ^
)
‚‚^ _
;
‚‚_ `
objUserDocument
ƒƒ +
.
ƒƒ+ ,
DocumentName
ƒƒ, 8
=
ƒƒ9 :
doc
ƒƒ; >
.
ƒƒ> ?
DocumentName
ƒƒ? K
;
ƒƒK L
objUserDocument
„„ +
.
„„+ ,
FileName
„„, 4
=
„„5 6
doc
„„7 :
.
„„: ;
FileName
„„; C
;
„„C D
objUserDocument
…… +
.
……+ ,
FilePath
……, 4
=
……5 6
doc
……7 :
.
……: ;
FilePath
……; C
;
……C D
objUserDocument
†† +
.
††+ ,
FileType
††, 4
=
††5 6
doc
††7 :
.
††: ;
FileType
††; C
;
††C D
objUserDocument
‡‡ +
.
‡‡+ ,
	CreatedBy
‡‡, 5
=
‡‡6 7
doc
‡‡8 ;
.
‡‡; <
	CreatedBy
‡‡< E
;
‡‡E F!
_documentRepository
‰‰ /
.
‰‰/ 0
AddAsync
‰‰0 8
(
‰‰8 9
objUserDocument
‰‰9 H
)
‰‰H I
;
‰‰I J
await
 !
_unitOfWork
" -
.
- .
SaveChangesAsync
. >
(
> ?
)
? @
;
@ A
}
‹‹ 
}
 
}
 
return
 
DBOperation
 "
.
" #
Success
# *
;
* +
}
 
catch
‘‘ 
(
‘‘ 
	Exception
‘‘ 
ex
‘‘ 
)
‘‘  
{
’’ 
throw
““ 
ex
““ 
;
““ 
}
”” 
}
•• 	
public
—— 
async
—— 
Task
—— 
<
—— 
List
—— 
<
—— %
MasterResourceTypeModel
—— 6
>
——6 7
>
——7 8!
GetResourceTypeList
——9 L
(
——L M
)
——M N
{
 	
var
™™ 
lstStf
™™ 
=
™™ 
EltizamDBHelper
™™ (
.
™™( )!
ExecuteMappedReader
™™) <
<
™™< =%
MasterResourceTypeModel
™™= T
>
™™T U
(
™™U V 
ProcedureMetastore
™™V h
.
™™h i'
usp_ResourceType_AllList™™i 
,™™ ‚ 
DatabaseConnection
 
.
  

ConnString
  *
,
* +
CommandType
, 7
.
7 8
StoredProcedure
8 G
,
G H
null
I M
)
M N
;
N O
return
 
lstStf
 
;
 
}
 	
public
 
async
 
Task
 
<
 
List
 
<
 &
MasterApproverLevelModel
 7
>
7 8
>
8 9"
GetApproverLevelList
: N
(
N O
)
O P
{
 	
var
   
lstStf
   
=
   
_mapperFactory
   '
.
  ' (
GetList
  ( /
<
  / 01
#MasterValuationRequestApproverLevel
  0 S
,
  S T&
MasterApproverLevelModel
  U m
>
  m n
(
  n o'
_approverLevelRepository  o ‡
.  ‡ 
GetAll   
(   
)   
.   ‘
ToList  ‘ —
(  — 
)   ™
)  ™ 
;   ›
return
΅΅ 
lstStf
΅΅ 
;
΅΅ 
}
ΆΆ 	
public
££ 
async
££ 
Task
££ 
<
££ 
List
££ 
<
££ 
MasterRoleModel
££ .
>
££. /
>
££/ 0
GetRoleList
££1 <
(
££< =
)
££= >
{
¤¤ 	
var
¥¥ 
lId
¥¥ 
=
¥¥ 
_helper
¥¥ 
.
¥¥ 
GetLoggedInUser
¥¥ -
(
¥¥- .
)
¥¥. /
?
¥¥/ 0
.
¥¥0 1
UserId
¥¥1 7
;
¥¥7 8
var
§§ 
lstStf
§§ 
=
§§ 
EltizamDBHelper
§§ (
.
§§( )!
ExecuteMappedReader
§§) <
<
§§< =
MasterRoleModel
§§= L
>
§§L M
(
§§M N 
ProcedureMetastore
§§N `
.
§§` a$
usp_Role_SearchAllList
§§a w
,
§§w x 
DatabaseConnection
¨¨ 
.
¨¨  

ConnString
¨¨  *
,
¨¨* +
CommandType
¨¨, 7
.
¨¨7 8
StoredProcedure
¨¨8 G
,
¨¨G H
null
¨¨I M
)
¨¨M N
;
¨¨N O
return
ªª 
lstStf
ªª 
;
ªª 
}
«« 	
public
­­ 
async
­­ 
Task
­­ 
<
­­ 
DBOperation
­­ %
>
­­% &
Delete
­­' -
(
­­- .
int
­­. 1
id
­­2 4
)
­­4 5
{
®® 	
var
―― 

entityUser
―― 
=
―― 
_repository
―― (
.
――( )
Get
――) ,
(
――, -
x
――- .
=>
――/ 1
x
――2 3
.
――3 4
Id
――4 6
==
――7 9
id
――: <
)
――< =
;
――= >
if
°° 
(
°° 

entityUser
°° 
==
°° 
null
°° "
)
°°" #
return
±± 
DBOperation
±± "
.
±±" #
NotFound
±±# +
;
±±+ ,
else
²² 
{
³³ 
var
΄΄ 
entityLocation
΄΄ "
=
΄΄# $ 
_addressRepository
΄΄% 7
.
΄΄7 8
Get
΄΄8 ;
(
΄΄; <
x
΄΄< =
=>
΄΄> @
x
΄΄A B
.
΄΄B C

TableKeyId
΄΄C M
==
΄΄N P
id
΄΄Q S
&&
΄΄T V
x
΄΄W X
.
΄΄X Y
	TableName
΄΄Y b
==
΄΄c e
$str
΄΄f s
)
΄΄s t
;
΄΄t u
if
µµ 
(
µµ 
entityLocation
µµ "
!=
µµ# %
null
µµ& *
)
µµ* + 
_addressRepository
¶¶ &
.
¶¶& '
Remove
¶¶' -
(
¶¶- .
entityLocation
¶¶. <
)
¶¶< =
;
¶¶= >
var
ΈΈ 
entityContact
ΈΈ !
=
ΈΈ" #!
_documentRepository
ΈΈ$ 7
.
ΈΈ7 8
Get
ΈΈ8 ;
(
ΈΈ; <
x
ΈΈ< =
=>
ΈΈ> @
x
ΈΈA B
.
ΈΈB C

TableKeyId
ΈΈC M
==
ΈΈN P
id
ΈΈQ S
&&
ΈΈT V
x
ΈΈW X
.
ΈΈX Y
	TableName
ΈΈY b
==
ΈΈc e
$str
ΈΈf s
)
ΈΈs t
;
ΈΈt u
if
ΉΉ 
(
ΉΉ 
entityContact
ΉΉ !
!=
ΉΉ" $
null
ΉΉ% )
)
ΉΉ) *!
_documentRepository
ΊΊ '
.
ΊΊ' (
Remove
ΊΊ( .
(
ΊΊ. /
entityContact
ΊΊ/ <
)
ΊΊ< =
;
ΊΊ= >
_repository
ΌΌ 
.
ΌΌ 
Remove
ΌΌ "
(
ΌΌ" #

entityUser
ΌΌ# -
)
ΌΌ- .
;
ΌΌ. /
await
ΎΎ 
_unitOfWork
ΎΎ !
.
ΎΎ! "
SaveChangesAsync
ΎΎ" 2
(
ΎΎ2 3
)
ΎΎ3 4
;
ΎΎ4 5
return
ΑΑ 
DBOperation
ΑΑ "
.
ΑΑ" #
Success
ΑΑ# *
;
ΑΑ* +
}
ΒΒ 
}
ΓΓ 	
public
ΕΕ 
async
ΕΕ 
Task
ΕΕ 
<
ΕΕ 
DBOperation
ΕΕ %
>
ΕΕ% &
ChangePassword
ΕΕ' 5
(
ΕΕ5 6!
ChangePasswordModel
ΕΕ6 I

entityUser
ΕΕJ T
)
ΕΕT U
{
ΖΖ 	
if
ΗΗ 
(
ΗΗ 

entityUser
ΗΗ 
.
ΗΗ 
UserId
ΗΗ !
>=
ΗΗ" $
$num
ΗΗ% &
&&
ΗΗ' )

entityUser
ΗΗ* 4
.
ΗΗ4 5
NewPassword
ΗΗ5 @
==
ΗΗA C

entityUser
ΗΗD N
.
ΗΗN O
ConfirmPassword
ΗΗO ^
)
ΗΗ^ _
{
ΘΘ 

entityUser
ΙΙ 
.
ΙΙ 
NewPassword
ΙΙ &
=
ΙΙ' (
Utility
ΙΙ) 0
.
ΙΙ0 1
Utility
ΙΙ1 8
.
ΙΙ8 9
UtilityHelper
ΙΙ9 F
.
ΙΙF G"
GenerateSHA256String
ΙΙG [
(
ΙΙ[ \

entityUser
ΙΙ\ f
.
ΙΙf g
NewPassword
ΙΙg r
)
ΙΙr s
;
ΙΙs t

entityUser
ΚΚ 
.
ΚΚ 
ConfirmPassword
ΚΚ *
=
ΚΚ+ ,

entityUser
ΚΚ- 7
.
ΚΚ7 8
NewPassword
ΚΚ8 C
;
ΚΚC D
}
ΛΛ 

MasterUser
ΝΝ 
objUser
ΝΝ 
;
ΝΝ 
if
ΞΞ 
(
ΞΞ 

entityUser
ΞΞ 
.
ΞΞ 
UserId
ΞΞ !
>
ΞΞ" #
$num
ΞΞ$ %
)
ΞΞ% &
{
ΟΟ 
objUser
ΠΠ 
=
ΠΠ 
_repository
ΠΠ %
.
ΠΠ% &
Get
ΠΠ& )
(
ΠΠ) *

entityUser
ΠΠ* 4
.
ΠΠ4 5
UserId
ΠΠ5 ;
)
ΠΠ; <
;
ΠΠ< =
var
ΡΡ 

OldObjUser
ΡΡ 
=
ΡΡ  
objUser
ΡΡ! (
;
ΡΡ( )
if
ÒÒ 
(
ÒÒ 
objUser
ÒÒ 
!=
ÒÒ 
null
ÒÒ #
)
ÒÒ# $
{
ΣΣ 
objUser
ΤΤ 
.
ΤΤ 
Password
ΤΤ $
=
ΤΤ% &

entityUser
ΤΤ' 1
.
ΤΤ1 2
NewPassword
ΤΤ2 =
;
ΤΤ= >
objUser
ΦΦ 
.
ΦΦ 

ModifiedBy
ΦΦ &
=
ΦΦ' (
_LoginUserId
ΦΦ) 5
;
ΦΦ5 6
objUser
ΧΧ 
.
ΧΧ 
ModifiedDate
ΧΧ (
=
ΧΧ) *
AppConstants
ΧΧ+ 7
.
ΧΧ7 8
DateTime
ΧΧ8 @
;
ΧΧ@ A
_repository
ΨΨ 
.
ΨΨ  
UpdateAsync
ΨΨ  +
(
ΨΨ+ ,
objUser
ΨΨ, 3
)
ΨΨ3 4
;
ΨΨ4 5
await
ΫΫ 
_unitOfWork
ΫΫ %
.
ΫΫ% &
SaveChangesAsync
ΫΫ& 6
(
ΫΫ6 7
)
ΫΫ7 8
;
ΫΫ8 9
}
άά 
else
έέ 
{
ήή 
return
ίί 
DBOperation
ίί &
.
ίί& '
NotFound
ίί' /
;
ίί/ 0
}
ΰΰ 
}
αα 
return
γγ 
DBOperation
γγ 
.
γγ 
Success
γγ &
;
γγ& '
}
δδ 	
public
ζζ 
async
ζζ 
Task
ζζ 
<
ζζ 
List
ζζ 
<
ζζ !
MasterUserListModel
ζζ 2
>
ζζ2 3
>
ζζ3 4
GetApproverList
ζζ5 D
(
ζζD E
int
ζζE H
id
ζζI K
,
ζζK L
string
ζζM S
roleName
ζζT \
)
ζζ\ ]
{
ηη 	
DbParameter
θθ 
[
θθ 
]
θθ 
osqlParameter1
θθ (
=
θθ) *
{
ιι 
new
κκ 
DbParameter
κκ  
(
κκ  !
$str
κκ! )
,
κκ) *
id
κκ+ -
,
κκ- .
	SqlDbType
κκ/ 8
.
κκ8 9
Int
κκ9 <
)
κκ< =
,
κκ= >
new
λλ 
DbParameter
λλ  
(
λλ  !
$str
λλ! +
,
λλ+ ,
roleName
λλ- 5
,
λλ5 6
	SqlDbType
λλ7 @
.
λλ@ A
VarChar
λλA H
)
λλH I
}
μμ 
;
μμ 
var
ξξ 
lstStf
ξξ 
=
ξξ 
EltizamDBHelper
ξξ (
.
ξξ( )!
ExecuteMappedReader
ξξ) <
<
ξξ< =!
MasterUserListModel
ξξ= P
>
ξξP Q
(
ξξQ R 
ProcedureMetastore
ξξR d
.
ξξd e"
usp_Approver_AllList
ξξe y
,
ξξy z 
DatabaseConnection
οο +
.
οο+ ,

ConnString
οο, 6
,
οο6 7
CommandType
οο8 C
.
οοC D
StoredProcedure
οοD S
,
οοS T
osqlParameter1
οοU c
)
οοc d
;
οοd e
return
ρρ 
lstStf
ρρ 
;
ρρ 
}
ςς 	
public
ϋϋ 
async
ϋϋ 
Task
ϋϋ 
<
ϋϋ 
GlobalAuditFields
ϋϋ +
?
ϋϋ+ ,
>
ϋϋ, -"
GetGlobalAuditFields
ϋϋ. B
(
ϋϋB C
int
ϋϋC F

TableKeyId
ϋϋG Q
,
ϋϋQ R
string
ϋϋS Y
	TableName
ϋϋZ c
)
ϋϋc d
{
όό 	
DbParameter
ύύ 
[
ύύ 
]
ύύ 
p1
ύύ 
=
ύύ 
{
ώώ 
new
ÿÿ 
DbParameter
ÿÿ  
(
ÿÿ  !
AppConstants
ÿÿ! -
.
ÿÿ- .

TableKeyId
ÿÿ. 8
,
ÿÿ8 9

TableKeyId
ÿÿ: D
,
ÿÿD E
	SqlDbType
ÿÿF O
.
ÿÿO P
Int
ÿÿP S
)
ÿÿS T
,
ÿÿT U
new
€€ 
DbParameter
€€  
(
€€  !
AppConstants
€€! -
.
€€- .
	TableName
€€. 7
,
€€7 8
	TableName
€€9 B
,
€€B C
	SqlDbType
€€D M
.
€€M N
VarChar
€€N U
)
€€U V
}
 
;
 
var
ƒƒ 
data
ƒƒ 
=
ƒƒ 
EltizamDBHelper
ƒƒ &
.
ƒƒ& ''
ExecuteSingleMappedReader
ƒƒ' @
<
ƒƒ@ A
GlobalAuditFields
ƒƒA R
>
ƒƒR S
(
ƒƒS T 
ProcedureMetastore
ƒƒT f
.
ƒƒf g&
usp_GetPageFooterDetails
ƒƒg 
,ƒƒ € 
DatabaseConnection
„„ )
.
„„) *

ConnString
„„* 4
,
„„4 5
CommandType
„„6 A
.
„„A B
StoredProcedure
„„B Q
,
„„Q R
p1
„„S U
)
„„U V
;
„„V W
data
…… 
.
…… 
	TableName
…… 
=
…… 
	TableName
…… &
;
……& '
return
‡‡ 
data
‡‡ 
;
‡‡ 
}
 	
public
 
async
 
Task
 
<
 
List
 
<
 
MasterUserModel
 .
>
. /
>
/ 0
GetAllUserList
1 ?
(
? @
)
@ A
{
‹‹ 	
var
 
lstStf
 
=
 
EltizamDBHelper
 (
.
( )!
ExecuteMappedReader
) <
<
< =
MasterUserModel
= L
>
L M
(
M N 
ProcedureMetastore
N `
.
` a$
usp_User_SearchAllList
a w
,
w x 
DatabaseConnection
 +
.
+ ,

ConnString
, 6
,
6 7
CommandType
8 C
.
C D
StoredProcedure
D S
,
S T
null
U Y
)
Y Z
;
Z [
return
 
lstStf
 
;
 
}
 	
public
’’ 
async
’’ 
Task
’’ 
<
’’ 
DBOperation
’’ %
>
’’% &
DeleteDocument
’’' 5
(
’’5 6
int
’’6 9
id
’’: <
)
’’< =
{
““ 	
if
”” 
(
”” 
id
”” 
>
”” 
$num
”” 
)
”” 
{
•• 
var
—— 
	entityDoc
—— 
=
—— !
_documentRepository
——  3
.
——3 4
Get
——4 7
(
——7 8
id
——8 :
)
——: ;
;
——; <
if
 
(
 
	entityDoc
 
!=
  
null
! %
)
% &
{
™™ !
_documentRepository
 '
.
' (
Remove
( .
(
. /
	entityDoc
/ 8
)
8 9
;
9 :
await
›› 
_unitOfWork
›› %
.
››% &
SaveChangesAsync
››& 6
(
››6 7
)
››7 8
;
››8 9
}
 
}
 
return
 
DBOperation
 
.
 
Success
 &
;
& '
}
   	
public
΅΅ 
async
΅΅ 
Task
΅΅ 
<
΅΅ 
bool
΅΅ 
>
΅΅ 
IsEmailExists
΅΅  -
(
΅΅- .
string
΅΅. 4
email
΅΅5 :
,
΅΅: ;
int
΅΅< ?
?
΅΅? @
userId
΅΅A G
)
΅΅G H
{
ΆΆ 	
if
££ 
(
££ 
email
££ 
!=
££ 
null
££ 
)
££ 
{
¤¤ 
if
¥¥ 
(
¥¥ 
userId
¥¥ 
==
¥¥ 
null
¥¥ "
||
¥¥# %
userId
¥¥& ,
==
¥¥- /
$num
¥¥0 1
)
¥¥1 2
{
¦¦ 
var
§§ 
isExistWithEmail
§§ (
=
§§) *
_repository
§§+ 6
.
§§6 7
GetAll
§§7 =
(
§§= >
)
§§> ?
.
¨¨ 
Any
¨¨ 
(
¨¨ 
user
¨¨ !
=>
¨¨" $
user
¨¨% )
.
¨¨) *
Email
¨¨* /
==
¨¨0 2
email
¨¨3 8
)
¨¨8 9
;
¨¨9 :
if
ªª 
(
ªª 
isExistWithEmail
ªª (
)
ªª( )
{
«« 
return
¬¬ 
true
¬¬ #
;
¬¬# $
}
­­ 
}
®® 
else
―― 
{
°° 
var
±± 
isExistWithUserId
±± )
=
±±* +
_repository
±±, 7
.
±±7 8
GetAll
±±8 >
(
±±> ?
)
±±? @
.
²² 
Any
²² 
(
²² 
user
²² !
=>
²²" $
user
²²% )
.
²²) *
Email
²²* /
==
²²0 2
email
²²3 8
&&
²²9 ;
user
²²< @
.
²²@ A
Id
²²A C
!=
²²D F
userId
²²G M
)
²²M N
;
²²N O
if
΄΄ 
(
΄΄ 
isExistWithUserId
΄΄ )
)
΄΄) *
{
µµ 
return
¶¶ 
true
¶¶ #
;
¶¶# $
}
·· 
}
ΈΈ 
}
ΉΉ 
return
»» 
false
»» 
;
»» 
}
ΌΌ 	
}
ΏΏ 
}ΐΐ ³u
QD:\EltizamLive\Eltizam.Business.Core\Implementation\MasterValuationFeesService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
Implementation  .
{ 
public 

class &
MasterValuationFeesService +
:, -'
IMasterValuationFeesService. I
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IMapperFactory '
_mapperFactory( 6
;6 7
private 
readonly 
string 
_dbConnection  -
;- .
private   
readonly   
IAuditLogService   )
_auditLogService  * :
;  : ;
private!! 
IRepository!! 
<!! 
MasterValuationFee!! .
>!!. /
_repository!!0 ;
{!!< =
get!!> A
;!!A B
set!!C F
;!!F G
}!!H I
private"" 
readonly"" 
IHelper""  
_helper""! (
;""( )
public## &
MasterValuationFeesService## )
(##) *
IUnitOfWork##* 5

unitOfWork##6 @
,##@ A
IMapperFactory##B P
mapperFactory##Q ^
,##^ _
IHelper##` g
helper##h n
,##n o
IAuditLogService	##p €
auditLogService
## 
)
## ‘
{$$ 	
_unitOfWork%% 
=%% 

unitOfWork%% $
;%%$ %
_mapperFactory&& 
=&& 
mapperFactory&& *
;&&* +
_repository(( 
=(( 
_unitOfWork(( %
.((% &
GetRepository((& 3
<((3 4
MasterValuationFee((4 F
>((F G
(((G H
)((H I
;((I J
_helper** 
=** 
helper** 
;** 
_dbConnection++ 
=++ 
DatabaseConnection++ .
.++. /

ConnString++/ 9
;++9 :
_auditLogService,, 
=,, 
auditLogService,, .
;,,. /
}-- 	
public00 
async00 
Task00 
<00 "
DataTableResponseModel00 0
>000 1
GetAll002 8
(008 9"
DataTableAjaxPostModel009 O
model00P U
)00U V
{11 	
string22 

ColumnName22 
=22 
(22  !
model22! &
.22& '
order22' ,
.22, -
Count22- 2
>223 4
$num225 6
?227 8
model229 >
.22> ?
columns22? F
[22F G
model22G L
.22L M
order22M R
[22R S
$num22S T
]22T U
.22U V
column22V \
]22\ ]
.22] ^
data22^ b
:22c d
string22e k
.22k l
Empty22l q
)22q r
;22r s
string33 
SortDir33 
=33 
model33 "
.33" #
order33# (
[33( )
$num33) *
]33* +
?33+ ,
.33, -
dir33- 0
;330 1
SqlParameter55 
[55 
]55 
osqlParameter55 (
=55) *
{66 
new77 
SqlParameter77  
(77  !
AppConstants77! -
.77- .
P_CurrentPageNumber77. A
,77A B
model77D I
.77I J
start77J O
)77O P
,77P Q
new88 
SqlParameter88  
(88  !
AppConstants88! -
.88- .

P_PageSize88. 8
,888 9
model88D I
.88I J
length88J P
)88P Q
,88Q R
new99 
SqlParameter99  
(99  !
AppConstants99! -
.99- .
P_SortColumn99. :
,99: ;

ColumnName99D N
)99N O
,99O P
new:: 
SqlParameter::  
(::  !
AppConstants::! -
.::- .
P_SortDirection::. =
,::= >
SortDir::D K
)::K L
,::L M
new;; 
SqlParameter;;  
(;;  !
AppConstants;;! -
.;;- .
P_SearchText;;. :
,;;: ;
model;;D I
.;;I J
search;;J P
?;;P Q
.;;Q R
value;;R W
);;W X
}<< 
;<< 
var>> 
ListRes>> 
=>> 
await>> 
_repository>>  +
.>>+ ,
GetBySP>>, 3
(>>3 4
ProcedureMetastore>>4 F
.>>F G+
usp_ValuationFees_SearchAllList>>G f
,>>f g
System>>h n
.>>n o
Data>>o s
.>>s t
CommandType>>t 
.	>> €
StoredProcedure
>>€ 
,
>> 
osqlParameter
>>‘ 
)
>> 
;
>>  
varAA 
resAA 
=AA 
UtilityHelperAA #
.AA# $
GetPaginationInfoAA$ 5
(AA5 6
ListResAA6 =
)AA= >
;AA> ?"
DataTableResponseModelCC "#
oDataTableResponseModelCC# :
=CC; <
newCC= @"
DataTableResponseModelCCA W
(CCW X
modelCCX ]
.CC] ^
drawCC^ b
,CCb c
resCCd g
.CCg h
Item1CCh m
,CCm n
resCCo r
.CCr s
Item1CCs x
,CCx y
ListRes	CCz 
)
CC ‚
;
CC‚ ƒ
returnEE #
oDataTableResponseModelEE *
;EE* +
}FF 	
publicGG 
asyncGG 
TaskGG 
<GG $
MasterValuationFeesModelGG 2
>GG2 3
GetByIdGG4 ;
(GG; <
intGG< ?
idGG@ B
)GGB C
{HH 	
varII  
_ValuationFeesEntityII $
=II% &
newII' *$
MasterValuationFeesModelII+ C
(IIC D
)IID E
;IIE F 
_ValuationFeesEntityJJ  
=JJ! "
_mapperFactoryJJ# 1
.JJ1 2
GetJJ2 5
<JJ5 6
MasterValuationFeeJJ6 H
,JJH I$
MasterValuationFeesModelJJJ b
>JJb c
(JJc d
awaitJJd i
_repositoryJJj u
.JJu v
GetAsyncJJv ~
(JJ~ 
id	JJ 
)
JJ ‚
)
JJ‚ ƒ
;
JJƒ „
returnLL  
_ValuationFeesEntityLL '
;LL' (
}MM 	
publicNN 
asyncNN 
TaskNN 
<NN 
DBOperationNN %
>NN% &
UpsertNN' -
(NN- .$
MasterValuationFeesModelNN. F
entityValuationFeesNNG Z
)NNZ [
{OO 	
MasterValuationFeeQQ 
objValuationFeesQQ /
;QQ/ 0
stringRR 
MainTableNameRR  
=RR! "
EnumRR# '
.RR' (
GetNameRR( /
(RR/ 0
TableNameEnumRR0 =
.RR= >
Master_ValuationFeeRR> Q
)RRQ R
;RRR S
intSS 
MainTableKeySS 
=SS 
entityValuationFeesSS 2
.SS2 3
IdSS3 5
;SS5 6
ifUU 
(UU 
entityValuationFeesUU #
.UU# $
IdUU$ &
>UU' (
$numUU) *
)UU* +
{VV 
MasterValuationFeeWW "
	OldEntityWW# ,
=WW- .
nullWW/ 3
;WW3 4
	OldEntityXX 
=XX 
_repositoryXX '
.XX' (
GetNoTrackingXX( 5
(XX5 6
entityValuationFeesXX6 I
.XXI J
IdXXJ L
)XXL M
;XXM N
objValuationFeesZZ  
=ZZ! "
_repositoryZZ# .
.ZZ. /
GetZZ/ 2
(ZZ2 3
entityValuationFeesZZ3 F
.ZZF G
IdZZG I
)ZZI J
;ZZJ K
if\\ 
(\\ 
objValuationFees\\ $
!=\\% '
null\\( ,
)\\, -
{]] 
objValuationFees^^ $
.^^$ %
PropertyTypeId^^% 3
=^^4 5
entityValuationFees^^6 I
.^^I J
PropertyTypeId^^J X
;^^X Y
objValuationFees__ $
.__$ %
PropertySubTypeId__% 6
=__7 8
entityValuationFees__9 L
.__L M
PropertySubTypeId__M ^
;__^ _
objValuationFees`` $
.``$ %
OwnershipTypeId``% 4
=``5 6
entityValuationFees``7 J
.``J K
OwnershipTypeId``K Z
;``Z [
objValuationFeesaa $
.aa$ %
CarpetAreaInSqFtaa% 5
=aa6 7
entityValuationFeesaa8 K
.aaK L
CarpetAreaInSqFtaaL \
;aa\ ]
objValuationFeesbb $
.bb$ %
CarpetAreaInSqMtrbb% 6
=bb7 8
entityValuationFeesbb9 L
.bbL M
CarpetAreaInSqMtrbbM ^
;bb^ _
objValuationFeescc $
.cc$ %
ClientTypeIdcc% 1
=cc2 3
entityValuationFeescc4 G
.ccG H
ClientTypeIdccH T
;ccT U
objValuationFeesdd $
.dd$ %
ValuationTypedd% 2
=dd3 4
entityValuationFeesdd5 H
.ddH I
ValuationTypeddI V
;ddV W
objValuationFeesee $
.ee$ %
ValuationFeeTypeIdee% 7
=ee8 9
entityValuationFeesee: M
.eeM N
ValuationFeeTypeIdeeN `
;ee` a
objValuationFeesff $
.ff$ %
ValuationFeesff% 2
=ff3 4
entityValuationFeesff5 H
.ffH I
ValuationFeesffI V
;ffV W
objValuationFeesgg $
.gg$ %
Vatgg% (
=gg) *
entityValuationFeesgg+ >
.gg> ?
Vatgg? B
;ggB C
objValuationFeeshh $
.hh$ %
OtherChargeshh% 1
=hh2 3
entityValuationFeeshh4 G
.hhG H
OtherChargeshhH T
;hhT U
objValuationFeesii $
.ii$ %
TotalValuationFeesii% 7
=ii8 9
entityValuationFeesii: M
.iiM N
TotalValuationFeesiiN `
;ii` a
objValuationFeesjj $
.jj$ %
FixedvaluationFeesjj% 7
=jj8 9
entityValuationFeesjj: M
.jjM N
FixedvaluationFeesjjN `
;jj` a
objValuationFeeskk $
.kk$ %
ModifiedDatekk% 1
=kk2 3
AppConstantskk4 @
.kk@ A
DateTimekkA I
;kkI J
objValuationFeesll $
.ll$ %

ModifiedByll% /
=ll0 1
entityValuationFeesll2 E
.llE F

ModifiedByllF P
;llP Q
objValuationFeesmm $
.mm$ %
IsActivemm% -
=mm. /
entityValuationFeesmm0 C
.mmC D
IsActivemmD L
;mmL M
_repositorynn 
.nn  
UpdateAsyncnn  +
(nn+ ,
objValuationFeesnn, <
)nn< =
;nn= >
awaitqq 
_unitOfWorkqq %
.qq% &
SaveChangesAsyncqq& 6
(qq6 7
)qq7 8
;qq8 9
awaittt 
_auditLogServicett *
.tt* +
CreateAuditLogtt+ 9
<tt9 :
MasterValuationFeett: L
>ttL M
(ttM N
AuditActionTypeEnumttN a
.tta b
Updatettb h
,tth i
	OldEntityttj s
,tts t
objValuationFees	ttu …
,
tt… †
MainTableName
tt‡ ”
,
tt” •
MainTableKey
tt– Ά
)
ttΆ £
;
tt£ ¤
}vv 
elseww 
{xx 
returnyy 
DBOperationyy &
.yy& '
NotFoundyy' /
;yy/ 0
}zz 
}{{ 
else|| 
{}} 
objValuationFees~~  
=~~! "
_mapperFactory~~# 1
.~~1 2
Get~~2 5
<~~5 6$
MasterValuationFeesModel~~6 N
,~~N O
MasterValuationFee~~P b
>~~b c
(~~c d
entityValuationFees~~d w
)~~w x
;~~x y
objValuationFees  
.  !
CreatedDate! ,
=- .
AppConstants/ ;
.; <
DateTime< D
;D E
objValuationFees
€€  
.
€€  !
	CreatedBy
€€! *
=
€€+ ,!
entityValuationFees
€€- @
.
€€@ A
	CreatedBy
€€A J
;
€€J K
objValuationFees
  
.
  !
ModifiedDate
! -
=
. /
AppConstants
0 <
.
< =
DateTime
= E
;
E F
objValuationFees
‚‚  
.
‚‚  !
	CreatedBy
‚‚! *
=
‚‚+ ,!
entityValuationFees
‚‚- @
.
‚‚@ A
	CreatedBy
‚‚A J
;
‚‚J K
_repository
ƒƒ 
.
ƒƒ 
AddAsync
ƒƒ $
(
ƒƒ$ %
objValuationFees
ƒƒ% 5
)
ƒƒ5 6
;
ƒƒ6 7
}
„„ 
await
…… 
_unitOfWork
…… 
.
…… 
SaveChangesAsync
…… .
(
……. /
)
……/ 0
;
……0 1
if
†† 
(
†† 
objValuationFees
††  
.
††  !
Id
††! #
==
††$ &
$num
††' (
)
††( )
return
‡‡ 
DBOperation
‡‡ "
.
‡‡" #
Error
‡‡# (
;
‡‡( )
return
‰‰ 
DBOperation
‰‰ 
.
‰‰ 
Success
‰‰ &
;
‰‰& '
}
 	
public
 
async
 
Task
 
<
 
DBOperation
 %
>
% &
Delete
' -
(
- .
int
. 1
id
2 4
,
4 5
int
5 8
?
8 9
by
: <
)
< =
{
 	
var
 !
entityValuationFees
 #
=
$ %
_repository
& 1
.
1 2
Get
2 5
(
5 6
x
6 7
=>
8 :
x
; <
.
< =
Id
= ?
==
@ B
id
C E
)
E F
;
F G!
entityValuationFees
 
.
  

ModifiedBy
  *
=
+ ,
by
- /
??
0 2!
entityValuationFees
3 F
.
F G

ModifiedBy
G Q
;
Q R
if
 
(
 !
entityValuationFees
 #
==
$ &
null
' +
)
+ ,
return
‘‘ 
DBOperation
‘‘ "
.
‘‘" #
NotFound
‘‘# +
;
‘‘+ ,
_repository
““ 
.
““ 
Remove
““ 
(
““ !
entityValuationFees
““ 2
)
““2 3
;
““3 4
await
•• 
_unitOfWork
•• 
.
•• 
SaveChangesAsync
•• .
(
••. /
)
••/ 0
;
••0 1
return
—— 
DBOperation
—— 
.
—— 
Success
—— &
;
——& '
}
 	
}
™™ 
} •\
TD:\EltizamLive\Eltizam.Business.Core\Implementation\MasterValuationFeeTypeService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
Implementation  .
{ 
public 

class )
MasterValuationFeeTypeService .
:/ 0*
IMasterValuationFeeTypeService1 O
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IMapperFactory '
_mapperFactory( 6
;6 7
private 
readonly 
	Microsoft "
." #

Extensions# -
.- .
Configuration. ;
.; <
IConfiguration< J
configurationK X
;X Y
private 
readonly 
string 
_dbConnection  -
;- .
private 
IRepository 
< "
MasterValuationFeeType 2
>2 3
_repository4 ?
{@ A
getB E
;E F
setG J
;J K
}L M
private 
readonly 
IHelper  
_helper! (
;( )
public )
MasterValuationFeeTypeService ,
(, -
IUnitOfWork- 8

unitOfWork9 C
,C D
IMapperFactoryE S
mapperFactoryT a
,a b
IHelper- 4
helper5 ;
,; <
	Microsoft= F
.F G

ExtensionsG Q
.Q R
ConfigurationR _
._ `
IConfiguration` n
_configurationo }
)} ~
{ 	
_unitOfWork 
= 

unitOfWork $
;$ %
_mapperFactory 
= 
mapperFactory *
;* +
_repository   
=   
_unitOfWork   %
.  % &
GetRepository  & 3
<  3 4"
MasterValuationFeeType  4 J
>  J K
(  K L
)  L M
;  M N
configuration!! 
=!! 
_configuration!! *
;!!* +
_helper"" 
="" 
helper"" 
;"" 
_dbConnection## 
=## 
DatabaseConnection## .
.##. /

ConnString##/ 9
;##9 :
}$$ 	
public'' 
async'' 
Task'' 
<'' "
DataTableResponseModel'' 0
>''0 1
GetAll''2 8
(''8 9"
DataTableAjaxPostModel''9 O
model''P U
)''U V
{(( 	
var)) 
	_dbParams)) 
=)) 
new)) 
[))  
]))  !
{** 
new++ 
DbParameter++  
(++  !
$str++! 5
,++5 6
$num++7 8
,++8 9
	SqlDbType++9 B
.++B C
Int++C F
)++F G
,++G H
new,, 
DbParameter,,  
(,,  !
$str,,! +
,,,+ ,
model,,- 2
.,,2 3
length,,3 9
,,,9 :
	SqlDbType,,; D
.,,D E
Int,,E H
),,H I
,,,I J
new-- 
DbParameter--  
(--  !
$str--! -
,--- .
model--/ 4
.--4 5
start--5 :
,--: ;
	SqlDbType--< E
.--E F
Int--F I
)--I J
,--J K
new.. 
DbParameter..  
(..  !
$str..! .
,... /
$str..0 ;
,..; <
	SqlDbType..= F
...F G
VarChar..G N
)..N O
,..O P
new// 
DbParameter//  
(//  !
$str//! .
,//. /
$num//0 1
,//1 2
	SqlDbType//3 <
.//< =
Int//= @
)//@ A
}00 
;00 
int22 
_count22 
=22 
$num22 
;22 
var33 
lstStf33 
=33 
EltizamDBHelper33 (
.33( )2
&ExecuteMappedReaderWithOutputParameter33) O
<33O P'
MasterValuationFeeTypeModel33P k
>33k l
(33l m
ProcedureMetastore33m 
.	33 €0
"usp_ValuationFeeType_SearchAllList
33€ Ά
,
33Ά £
DatabaseConnection55 
.55  

ConnString55  *
,55* +
out55, /
_count550 6
,556 7
CommandType558 C
.55C D
StoredProcedure55D S
,55S T
	_dbParams55U ^
)55^ _
;55_ `"
DataTableResponseModel88 "#
oDataTableResponseModel88# :
=88; <
new88= @"
DataTableResponseModel88A W
(88W X
model88X ]
.88] ^
draw88^ b
,88b c
_count88d j
,88j k
lstStf88l r
.88r s
Count88s x
,88x y
lstStf	88z €
)
88€ 
;
88 ‚
return:: #
oDataTableResponseModel:: *
;::* +
};; 	
public== 
async== 
Task== 
<== 
List== 
<== '
MasterValuationFeeTypeModel== :
>==: ;
>==; <"
GetAllValuationFeeType=== S
(==S T
)==T U
{>> 	
return?? 
_mapperFactory?? !
.??! "
GetList??" )
<??) *"
MasterValuationFeeType??* @
,??@ A'
MasterValuationFeeTypeModel??B ]
>??] ^
(??^ _
await??_ d
_repository??e p
.??p q
GetAllAsync??q |
(??| }
)??} ~
)??~ 
;	?? €
}@@ 	
publicAA 
asyncAA 
TaskAA 
<AA '
MasterValuationFeeTypeModelAA 5
>AA5 6
GetByIdAA7 >
(AA> ?
intAA? B
idAAC E
)AAE F
{BB 	
varCC #
_ValuationFeeTypeEntityCC '
=CC( )
newCC* -'
MasterValuationFeeTypeModelCC. I
(CCI J
)CCJ K
;CCK L#
_ValuationFeeTypeEntityDD #
=DD$ %
_mapperFactoryDD& 4
.DD4 5
GetDD5 8
<DD8 9"
MasterValuationFeeTypeDD9 O
,DDO P'
MasterValuationFeeTypeModelDDQ l
>DDl m
(DDm n
awaitDDn s
_repositoryDDt 
.	DD €
GetAsync
DD€ 
(
DD ‰
id
DD‰ ‹
)
DD‹ 
)
DD 
;
DD 
returnFF #
_ValuationFeeTypeEntityFF *
;FF* +
}GG 	
publicHH 
asyncHH 
TaskHH 
<HH 
DBOperationHH %
>HH% &
UpsertHH' -
(HH- .'
MasterValuationFeeTypeModelHH. I"
entityValuationFeeTypeHHJ `
)HH` a
{II 	"
MasterValuationFeeTypeKK "
objValuationFeeTypeKK# 6
;KK6 7
ifMM 
(MM "
entityValuationFeeTypeMM &
.MM& '
IdMM' )
>MM* +
$numMM, -
)MM- .
{NN 
objValuationFeeTypeOO #
=OO$ %
_repositoryOO& 1
.OO1 2
GetOO2 5
(OO5 6"
entityValuationFeeTypeOO6 L
.OOL M
IdOOM O
)OOO P
;OOP Q
varPP "
OldObjValuationFeeTypePP *
=PP+ ,
objValuationFeeTypePP- @
;PP@ A
ifQQ 
(QQ 
objValuationFeeTypeQQ '
!=QQ( *
nullQQ+ /
)QQ/ 0
{RR 
objValuationFeeTypeSS '
.SS' (
ValuationFeeTypeSS( 8
=SS9 :"
entityValuationFeeTypeSS; Q
.SSQ R
ValuationFeeTypeSSR b
;SSb c
objValuationFeeTypeTT '
.TT' (
IsActiveTT( 0
=TT1 2"
entityValuationFeeTypeTT3 I
.TTI J
IsActiveTTJ R
;TTR S
objValuationFeeTypeUU '
.UU' (
ModifiedDateUU( 4
=UU5 6
AppConstantsUU7 C
.UUC D
DateTimeUUD L
;UUL M
objValuationFeeTypeVV '
.VV' (

ModifiedByVV( 2
=VV3 4"
entityValuationFeeTypeVV5 K
.VVK L
	CreatedByVVL U
;VVU V
_repositoryWW 
.WW  
UpdateAsyncWW  +
(WW+ ,
objValuationFeeTypeWW, ?
)WW? @
;WW@ A
}XX 
elseYY 
{ZZ 
return[[ 
DBOperation[[ &
.[[& '
NotFound[[' /
;[[/ 0
}\\ 
}]] 
else^^ 
{__ 
objValuationFeeType`` #
=``$ %
_mapperFactory``& 4
.``4 5
Get``5 8
<``8 9'
MasterValuationFeeTypeModel``9 T
,``T U"
MasterValuationFeeType``V l
>``l m
(``m n#
entityValuationFeeType	``n „
)
``„ …
;
``… †
objValuationFeeTypebb #
.bb# $
ValuationFeeTypebb$ 4
=bb5 6"
entityValuationFeeTypebb7 M
.bbM N
ValuationFeeTypebbN ^
;bb^ _
objValuationFeeTypecc #
.cc# $
IsActivecc$ ,
=cc- ."
entityValuationFeeTypecc/ E
.ccE F
IsActiveccF N
;ccN O
objValuationFeeTypedd #
.dd# $
CreatedDatedd$ /
=dd0 1
AppConstantsdd2 >
.dd> ?
DateTimedd? G
;ddG H
objValuationFeeTypeee #
.ee# $
	CreatedByee$ -
=ee. /"
entityValuationFeeTypeee0 F
.eeF G
	CreatedByeeG P
;eeP Q
objValuationFeeTypeff #
.ff# $
ModifiedDateff$ 0
=ff1 2
AppConstantsff3 ?
.ff? @
DateTimeff@ H
;ffH I
objValuationFeeTypegg #
.gg# $

ModifiedBygg$ .
=gg/ 0"
entityValuationFeeTypegg1 G
.ggG H
	CreatedByggH Q
;ggQ R
_repositoryhh 
.hh 
AddAsynchh $
(hh$ %
objValuationFeeTypehh% 8
)hh8 9
;hh9 :
}ii 
awaitjj 
_unitOfWorkjj 
.jj 
SaveChangesAsyncjj .
(jj. /
)jj/ 0
;jj0 1
ifkk 
(kk 
objValuationFeeTypekk #
.kk# $
Idkk$ &
==kk' )
$numkk* +
)kk+ ,
returnll 
DBOperationll "
.ll" #
Errorll# (
;ll( )
returnnn 
DBOperationnn 
.nn 
Successnn &
;nn& '
}oo 	
publicqq 
asyncqq 
Taskqq 
<qq 
DBOperationqq %
>qq% &
Deleteqq' -
(qq- .
intqq. 1
idqq2 4
)qq4 5
{rr 	
varss "
entityValuationFeeTypess &
=ss' (
_repositoryss) 4
.ss4 5
Getss5 8
(ss8 9
xss9 :
=>ss; =
xss> ?
.ss? @
Idss@ B
==ssC E
idssF H
)ssH I
;ssI J
ifuu 
(uu "
entityValuationFeeTypeuu &
==uu' )
nulluu* .
)uu. /
returnvv 
DBOperationvv "
.vv" #
NotFoundvv# +
;vv+ ,
_repositoryxx 
.xx 
Removexx 
(xx "
entityValuationFeeTypexx 5
)xx5 6
;xx6 7
awaitzz 
_unitOfWorkzz 
.zz 
SaveChangesAsynczz .
(zz. /
)zz/ 0
;zz0 1
return|| 
DBOperation|| 
.|| 
Success|| &
;||& '
}}} 	
}~~ 
} αΩ
JD:\EltizamLive\Eltizam.Business.Core\Implementation\MasterVendorService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
Implementation  .
{ 
public 

class 
MasterVendorService $
:% & 
IMasterVendorService' ;
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IMapperFactory '
_mapperFactory( 6
;6 7
private 
readonly 
	Microsoft "
." #

Extensions# -
.- .
Configuration. ;
.; <
IConfiguration< J
configurationK X
;X Y
private   
IRepository   
<   
MasterVendor   (
>  ( )
_repository  * 5
{  6 7
get  8 ;
;  ; <
set  = @
;  @ A
}  B C
private!! 
IRepository!! 
<!! 
MasterContact!! )
>!!) *
_repositoryContact!!+ =
{!!> ?
get!!@ C
;!!C D
set!!E H
;!!H I
}!!J K
private"" 
IRepository"" 
<"" 
MasterAddress"" )
>"") *
_repositoryAddress""+ =
{""> ?
get""@ C
;""C D
set""E H
;""H I
}""J K
private## 
IRepository## 
<## 
MasterDocument## *
>##* +
_documentRepository##, ?
{##@ A
get##B E
;##E F
set##G J
;##J K
}##L M
private$$ 
readonly$$ 
IAuditLogService$$ )
_auditLogService$$* :
;$$: ;
private%% 
readonly%% 
IHelper%%  
_helper%%! (
;%%( )
private&& 
readonly&& 
string&& 
_dbConnection&&  -
;&&- .
public** 
MasterVendorService** "
(**" #
IUnitOfWork**# .

unitOfWork**/ 9
,**9 :
IMapperFactory**; I
mapperFactory**J W
,**W X
IAuditLogService**Y i
auditLogService**j y
,**y z
IHelper++
 
helper++ 
,++ 
	Microsoft,, 
.,, 

Extensions,, 
.,,  
Configuration,,  -
.,,- .
IConfiguration,,. <
_configuration,,= K
),,K L
{-- 	
_unitOfWork.. 
=.. 

unitOfWork.. $
;..$ %
_mapperFactory// 
=// 
mapperFactory// *
;//* +
_repository11 
=11 
_unitOfWork11 %
.11% &
GetRepository11& 3
<113 4
MasterVendor114 @
>11@ A
(11A B
)11B C
;11C D
_repositoryContact22 
=22  
_unitOfWork22! ,
.22, -
GetRepository22- :
<22: ;
MasterContact22; H
>22H I
(22I J
)22J K
;22K L
_repositoryAddress33 
=33  
_unitOfWork33! ,
.33, -
GetRepository33- :
<33: ;
MasterAddress33; H
>33H I
(33I J
)33J K
;33K L
configuration44 
=44 
_configuration44 *
;44* +
_helper55 
=55 
helper55 
;55 
_auditLogService66 
=66 
auditLogService66 .
;66. /
_dbConnection77 
=77 
DatabaseConnection77 .
.77. /

ConnString77/ 9
;779 :
_documentRepository88 
=88  !
_unitOfWork88" -
.88- .
GetRepository88. ;
<88; <
MasterDocument88< J
>88J K
(88K L
)88L M
;88M N
}99 	
publicNN 
asyncNN 
TaskNN 
<NN 
MasterVendorModelNN +
>NN+ ,$
GetMasterVendorByIdAsyncNN- E
(NNE F
intNNF I
idNNJ L
)NNL M
{OO 	
varQQ 
masterVendorQQ 
=QQ 
newQQ "
MasterVendorModelQQ# 4
(QQ4 5
)QQ5 6
;QQ6 7
masterVendorRR 
=RR 
_mapperFactoryRR )
.RR) *
GetRR* -
<RR- .
MasterVendorRR. :
,RR: ;
MasterVendorModelRR< M
>RRM N
(RRN O
awaitRRO T
_repositoryRRU `
.RR` a
GetAsyncRRa i
(RRi j
idRRj l
)RRl m
)RRm n
;RRn o
varSS 
	tableNameSS 
=SS 
EnumSS  
.SS  !
GetNameSS! (
(SS( )
TableNameEnumSS) 6
.SS6 7
Master_VendorSS7 D
)SSD E
;SSE F
ifUU 
(UU 
masterVendorUU 
!=UU 
nullUU  $
)UU$ %
{VV 
DbParameterWW 
[WW 
]WW 
osqlParameterWW +
=WW, -
{XX 
newYY 
DbParameterYY  
(YY  !
AppConstantsYY! -
.YY- .

TableKeyIdYY. 8
,YY8 9
idYY: <
,YY< =
	SqlDbTypeYY> G
.YYG H
IntYYH K
)YYK L
,YYL M
newZZ 
DbParameterZZ  
(ZZ  !
AppConstantsZZ! -
.ZZ- .
	TableNameZZ. 7
,ZZ7 8
	tableNameZZ9 B
,ZZB C
	SqlDbTypeZZD M
.ZZM N
VarCharZZN U
)ZZU V
,ZZV W
}[[ 
;[[ 
var]] 
Address]] 
=]] 
EltizamDBHelper]] -
.]]- .
ExecuteMappedReader]]. A
<]]A B
MasterAddressEntity]]B U
>]]U V
(]]V W
ProcedureMetastore]]W i
.]]i j/
"usp_Address_GetAddressByTableKeyId	]]j 
,
]]  
DatabaseConnection
]]  
.
]]  ΅

ConnString
]]΅ «
,
]]« ¬
System
]]­ ³
.
]]³ ΄
Data
]]΄ Έ
.
]]Έ Ή
CommandType
]]Ή Δ
.
]]Δ Ε
StoredProcedure
]]Ε Τ
,
]]Τ Υ
osqlParameter
]]Φ γ
)
]]γ δ
;
]]δ ε
if^^ 
(^^ 
Address^^ 
!=^^ 
null^^ #
)^^# $
{__ 
masterVendor``  
.``  !
	Addresses``! *
=``+ ,
Address``- 4
;``4 5
}bb 
DbParameterdd 
[dd 
]dd 
osqlParameter1dd ,
=dd- .
{ee 
newff 
DbParameterff  
(ff  !
AppConstantsff! -
.ff- .

TableKeyIdff. 8
,ff8 9
idff: <
,ff< =
	SqlDbTypeff> G
.ffG H
IntffH K
)ffK L
,ffL M
newgg 
DbParametergg  
(gg  !
AppConstantsgg! -
.gg- .
	TableNamegg. 7
,gg7 8
	tableNamegg9 B
,ggB C
	SqlDbTypeggD M
.ggM N
VarCharggN U
)ggU V
,ggV W
}hh 
;hh 
varkk 
contactskk 
=kk 
EltizamDBHelperkk .
.kk. /
ExecuteMappedReaderkk/ B
<kkB C
MasterContactModelkkC U
>kkU V
(kkV W
ProcedureMetastorekkW i
.kki j/
"usp_Contact_GetContactByTableKeyId	kkj 
,
kk  
DatabaseConnection
kk  
.
kk  ΅

ConnString
kk΅ «
,
kk« ¬
System
kk­ ³
.
kk³ ΄
Data
kk΄ Έ
.
kkΈ Ή
CommandType
kkΉ Δ
.
kkΔ Ε
StoredProcedure
kkΕ Τ
,
kkΤ Υ
osqlParameter1
kkΦ δ
)
kkδ ε
;
kkε ζ
ifll 
(ll 
contactsll 
!=ll 
nullll  $
)ll$ %
{mm 
masterVendornn  
.nn  !
Contactsnn! )
=nn* +
contactsnn, 4
;nn4 5
}oo 
ifqq 
(qq 
masterVendorqq  
.qq  !
ProfileAttachmentIdqq! 4
!=qq5 7
nullqq8 <
&&qq= ?
masterVendorqq@ L
.qqL M
ProfileAttachmentIdqqM `
>qqa b
$numqqc d
)qqd e
{rr 
varss 
profiless 
=ss  !
_documentRepositoryss" 5
.ss5 6
Getss6 9
(ss9 :
masterVendorss: F
.ssF G
ProfileAttachmentIdssG Z
)ssZ [
;ss[ \
iftt 
(tt 
profilett 
!=tt  "
nulltt# '
)tt' (
{uu 
masterVendorvv $
.vv$ %
ProfilePathvv% 0
=vv1 2
profilevv3 :
.vv: ;
FilePathvv; C
;vvC D
}ww 
}xx 
}yy 
return|| 
masterVendor|| 
;||  
}}} 	
public
 
async
 
Task
 
<
 $
DataTableResponseModel
 0
>
0 1
GetAll
2 8
(
8 9$
DataTableAjaxPostModel
9 O
model
P U
)
U V
{
‚‚ 	
string
ƒƒ 

ColumnName
ƒƒ 
=
ƒƒ 
(
ƒƒ  !
model
ƒƒ! &
.
ƒƒ& '
order
ƒƒ' ,
.
ƒƒ, -
Count
ƒƒ- 2
>
ƒƒ3 4
$num
ƒƒ5 6
?
ƒƒ7 8
model
ƒƒ9 >
.
ƒƒ> ?
columns
ƒƒ? F
[
ƒƒF G
model
ƒƒG L
.
ƒƒL M
order
ƒƒM R
[
ƒƒR S
$num
ƒƒS T
]
ƒƒT U
.
ƒƒU V
column
ƒƒV \
]
ƒƒ\ ]
.
ƒƒ] ^
data
ƒƒ^ b
:
ƒƒc d
string
ƒƒe k
.
ƒƒk l
Empty
ƒƒl q
)
ƒƒq r
;
ƒƒr s
string
„„ 
SortDir
„„ 
=
„„ 
(
„„ 
model
„„ #
.
„„# $
order
„„$ )
.
„„) *
Count
„„* /
>
„„0 1
$num
„„2 3
?
„„4 5
model
„„6 ;
.
„„; <
order
„„< A
[
„„A B
$num
„„B C
]
„„C D
.
„„D E
dir
„„E H
:
„„I J
string
„„K Q
.
„„Q R
Empty
„„R W
)
„„W X
;
„„X Y
SqlParameter
†† 
[
†† 
]
†† 
osqlParameter
†† (
=
††) *
{
‡‡ 
new
 
SqlParameter
  
(
  !
AppConstants
! -
.
- .!
P_CurrentPageNumber
. A
,
A B
model
D I
.
I J
start
J O
)
O P
,
P Q
new
‰‰ 
SqlParameter
‰‰  
(
‰‰  !
AppConstants
‰‰! -
.
‰‰- .

P_PageSize
‰‰. 8
,
‰‰8 9
model
‰‰D I
.
‰‰I J
length
‰‰J P
)
‰‰P Q
,
‰‰Q R
new
 
SqlParameter
  
(
  !
AppConstants
! -
.
- .
P_SortColumn
. :
,
: ;

ColumnName
D N
)
N O
,
O P
new
‹‹ 
SqlParameter
‹‹  
(
‹‹  !
AppConstants
‹‹! -
.
‹‹- .
P_SortDirection
‹‹. =
,
‹‹= >
SortDir
‹‹D K
)
‹‹K L
,
‹‹L M
new
 
SqlParameter
  
(
  !
AppConstants
! -
.
- .
P_SearchText
. :
,
: ;
model
D I
.
I J
search
J P
?
P Q
.
Q R
value
R W
)
W X
}
 
;
 
var
 
Results
 
=
 
await
 
_repository
  +
.
+ ,
GetBySP
, 3
(
3 4 
ProcedureMetastore
4 F
.
F G-
usp_Vendor_Search_GetVendorList
G f
,
f g
CommandType
h s
.
s t
StoredProceduret ƒ
,ƒ „
osqlParameter… ’
)’ “
;“ ”
var
’’ 
res
’’ 
=
’’ 
UtilityHelper
’’ #
.
’’# $
GetPaginationInfo
’’$ 5
(
’’5 6
Results
’’6 =
)
’’= >
;
’’> ?$
DataTableResponseModel
”” "%
oDataTableResponseModel
””# :
=
””; <
new
””= @$
DataTableResponseModel
””A W
(
””W X
model
””X ]
.
””] ^
draw
””^ b
,
””b c
res
””d g
.
””g h
Item1
””h m
,
””m n
res
””o r
.
””r s
Item1
””s x
,
””x y
Results””z 
.”” ‚
DataTableToList””‚ ‘
<””‘ ’
VendorListModel””’ ΅
>””΅ Ά
(””Ά £
)””£ ¤
)””¤ ¥
;””¥ ¦
return
–– %
oDataTableResponseModel
–– *
;
––* +
}
—— 	
public
™™ 
async
™™ 
Task
™™ 
<
™™ 
DBOperation
™™ %
>
™™% &#
AddUpdateMasterVendor
™™' <
(
™™< =
MasterVendorModel
™™= N 
masterVendortModel
™™O a
)
™™a b
{
 	
MasterVendor
 
	objVendor
 "
;
" #
MasterAddress
 

objAddress
 $
;
$ %
MasterContact
 

objContact
 $
;
$ %
MasterDocument
 
objUserDocument
 *
;
* +
string
΅΅ 
MainTableName
΅΅  
=
΅΅! "
Enum
΅΅# '
.
΅΅' (
GetName
΅΅( /
(
΅΅/ 0
TableNameEnum
΅΅0 =
.
΅΅= >
Master_Vendor
΅΅> K
)
΅΅K L
;
΅΅L M
int
ΆΆ 
MainTableKey
ΆΆ 
=
ΆΆ  
masterVendortModel
ΆΆ 1
.
ΆΆ1 2
Id
ΆΆ2 4
;
ΆΆ4 5
if
¥¥ 
(
¥¥  
masterVendortModel
¥¥ "
.
¥¥" #
Id
¥¥# %
>
¥¥& '
$num
¥¥( )
)
¥¥) *
{
¦¦ 
MasterVendor
¨¨ 
	OldEntity
¨¨ &
=
¨¨' (
null
¨¨) -
;
¨¨- .
	OldEntity
©© 
=
©© 
_repository
©© '
.
©©' (
GetNoTracking
©©( 5
(
©©5 6 
masterVendortModel
©©6 H
.
©©H I
Id
©©I K
)
©©K L
;
©©L M
	objVendor
«« 
=
«« 
_repository
«« '
.
««' (
Get
««( +
(
««+ , 
masterVendortModel
««, >
.
««> ?
Id
««? A
)
««A B
;
««B C
if
®® 
(
®® 
	objVendor
®® 
!=
®®  
null
®®! %
)
®®% &
{
―― 
	objVendor
°° 
=
°° 
_mapperFactory
°°  .
.
°°. /
Get
°°/ 2
<
°°2 3
MasterVendorModel
°°3 D
,
°°D E
MasterVendor
°°F R
>
°°R S
(
°°S T 
masterVendortModel
°°T f
)
°°f g
;
°°g h
	objVendor
±± 
.
±± 

VendorName
±± (
=
±±) * 
masterVendortModel
±±+ =
.
±±= >

VendorName
±±> H
;
±±H I
	objVendor
²² 
.
²² 
CompanyName
²² )
=
²²* + 
masterVendortModel
²², >
.
²²> ?
CompanyName
²²? J
;
²²J K
	objVendor
³³ 
.
³³ 
EstimattionDate
³³ -
=
³³. / 
masterVendortModel
³³0 B
.
³³B C
EstimattionDate
³³C R
;
³³R S
	objVendor
΄΄ 
.
΄΄ 
BusinessType
΄΄ *
=
΄΄+ , 
masterVendortModel
΄΄- ?
.
΄΄? @
BusinessType
΄΄@ L
;
΄΄L M
	objVendor
µµ 
.
µµ  
CompanyDescription
µµ 0
=
µµ1 2 
masterVendortModel
µµ3 E
.
µµE F 
CompanyDescription
µµF X
;
µµX Y
	objVendor
¶¶ 
.
¶¶ 
Status
¶¶ $
=
¶¶% & 
masterVendortModel
¶¶' 9
.
¶¶9 :
Status
¶¶: @
;
¶¶@ A
	objVendor
·· 
.
·· 

ModifiedBy
·· (
=
··) * 
masterVendortModel
··+ =
.
··= >

ModifiedBy
··> H
;
··H I
_repository
ΊΊ 
.
ΊΊ  
UpdateAsync
ΊΊ  +
(
ΊΊ+ ,
	objVendor
ΊΊ, 5
)
ΊΊ5 6
;
ΊΊ6 7
await
½½ 
_unitOfWork
½½ %
.
½½% &
SaveChangesAsync
½½& 6
(
½½6 7
)
½½7 8
;
½½8 9
await
ΏΏ 
_auditLogService
ΏΏ *
.
ΏΏ* +
CreateAuditLog
ΏΏ+ 9
<
ΏΏ9 :
MasterVendor
ΏΏ: F
>
ΏΏF G
(
ΏΏG H!
AuditActionTypeEnum
ΏΏH [
.
ΏΏ[ \
Update
ΏΏ\ b
,
ΏΏb c
	OldEntity
ΏΏd m
,
ΏΏm n
	objVendor
ΏΏo x
,
ΏΏx y
MainTableNameΏΏz ‡
,ΏΏ‡ 
MainTableKeyΏΏ‰ •
)ΏΏ• –
;ΏΏ– —
}
ΐΐ 
else
ΒΒ 
{
ΓΓ 
return
ΕΕ 
DBOperation
ΕΕ &
.
ΕΕ& '
NotFound
ΕΕ' /
;
ΕΕ/ 0
}
ΖΖ 
}
ΗΗ 
else
ΘΘ 
{
ΙΙ 
	objVendor
ΜΜ 
=
ΜΜ 
_mapperFactory
ΜΜ *
.
ΜΜ* +
Get
ΜΜ+ .
<
ΜΜ. /
MasterVendorModel
ΜΜ/ @
,
ΜΜ@ A
MasterVendor
ΜΜB N
>
ΜΜN O
(
ΜΜO P 
masterVendortModel
ΜΜP b
)
ΜΜb c
;
ΜΜc d
	objVendor
ΝΝ 
.
ΝΝ 
CreatedDate
ΝΝ %
=
ΝΝ& '
AppConstants
ΝΝ( 4
.
ΝΝ4 5
DateTime
ΝΝ5 =
;
ΝΝ= >
	objVendor
ΞΞ 
.
ΞΞ 
	CreatedBy
ΞΞ #
=
ΞΞ$ % 
masterVendortModel
ΞΞ& 8
.
ΞΞ8 9
	CreatedBy
ΞΞ9 B
;
ΞΞB C
_repository
ΠΠ 
.
ΠΠ 
AddAsync
ΠΠ $
(
ΠΠ$ %
	objVendor
ΠΠ% .
)
ΠΠ. /
;
ΠΠ/ 0
await
ÒÒ 
_unitOfWork
ÒÒ !
.
ÒÒ! "
SaveChangesAsync
ÒÒ" 2
(
ÒÒ2 3
)
ÒÒ3 4
;
ÒÒ4 5
}
ΣΣ 
if
ΦΦ 
(
ΦΦ 
	objVendor
ΦΦ 
.
ΦΦ 
Id
ΦΦ 
==
ΦΦ 
$num
ΦΦ  !
)
ΦΦ! "
return
ΧΧ 
DBOperation
ΧΧ "
.
ΧΧ" #
Error
ΧΧ# (
;
ΧΧ( )
else
ΩΩ 
{
ΪΪ 
if
άά 
(
άά  
masterVendortModel
άά &
.
άά& '
uploadProfile
άά' 4
!=
άά5 7
null
άά8 <
)
άά< =
{
έέ 
objUserDocument
ήή #
=
ήή$ %
_mapperFactory
ήή& 4
.
ήή4 5
Get
ήή5 8
<
ήή8 9!
MasterDocumentModel
ήή9 L
,
ήήL M
MasterDocument
ήήN \
>
ήή\ ]
(
ήή] ^ 
masterVendortModel
ήή^ p
.
ήήp q
uploadProfile
ήήq ~
)
ήή~ 
;ήή €
objUserDocument
ίί #
.
ίί# $
IsActive
ίί$ ,
=
ίί- . 
masterVendortModel
ίί/ A
.
ίίA B
uploadProfile
ίίB O
.
ίίO P
IsActive
ίίP X
;
ίίX Y
objUserDocument
ΰΰ #
.
ΰΰ# $

TableKeyId
ΰΰ$ .
=
ΰΰ/ 0
	objVendor
ΰΰ1 :
.
ΰΰ: ;
Id
ΰΰ; =
;
ΰΰ= >
objUserDocument
αα #
.
αα# $
	TableName
αα$ -
=
αα. /
$str
αα0 ?
;
αα? @
objUserDocument
ββ #
.
ββ# $
DocumentName
ββ$ 0
=
ββ1 2 
masterVendortModel
ββ3 E
.
ββE F
uploadProfile
ββF S
.
ββS T
DocumentName
ββT `
;
ββ` a
objUserDocument
γγ #
.
γγ# $
FileName
γγ$ ,
=
γγ- . 
masterVendortModel
γγ/ A
.
γγA B
uploadProfile
γγB O
.
γγO P
FileName
γγP X
;
γγX Y
objUserDocument
δδ #
.
δδ# $
FilePath
δδ$ ,
=
δδ- . 
masterVendortModel
δδ/ A
.
δδA B
uploadProfile
δδB O
.
δδO P
FilePath
δδP X
;
δδX Y
objUserDocument
εε #
.
εε# $
FileType
εε$ ,
=
εε- . 
masterVendortModel
εε/ A
.
εεA B
uploadProfile
εεB O
.
εεO P
FileType
εεP X
;
εεX Y
objUserDocument
ζζ #
.
ζζ# $
	CreatedBy
ζζ$ -
=
ζζ. / 
masterVendortModel
ζζ0 B
.
ζζB C
uploadProfile
ζζC P
.
ζζP Q
	CreatedBy
ζζQ Z
;
ζζZ [!
_documentRepository
θθ '
.
θθ' (
AddAsync
θθ( 0
(
θθ0 1
objUserDocument
θθ1 @
)
θθ@ A
;
θθA B
await
ιι 
_unitOfWork
ιι %
.
ιι% &
SaveChangesAsync
ιι& 6
(
ιι6 7
)
ιι7 8
;
ιι8 9
var
νν 
user
νν 
=
νν 
_repository
νν *
.
νν* +
Get
νν+ .
(
νν. /
	objVendor
νν/ 8
.
νν8 9
Id
νν9 ;
)
νν; <
;
νν< =
user
ξξ 
.
ξξ !
ProfileAttachmentId
ξξ ,
=
ξξ- .
objUserDocument
ξξ/ >
.
ξξ> ?
Id
ξξ? A
;
ξξA B
_repository
ππ 
.
ππ  
UpdateAsync
ππ  +
(
ππ+ ,
user
ππ, 0
)
ππ0 1
;
ππ1 2
await
ρρ 
_unitOfWork
ρρ %
.
ρρ% &
SaveChangesAsync
ρρ& 6
(
ρρ6 7
)
ρρ7 8
;
ρρ8 9
}
ςς 
if
σσ 
(
σσ  
masterVendortModel
σσ &
.
σσ& '
	Addresses
σσ' 0
.
σσ0 1
Count
σσ1 6
>
σσ7 8
$num
σσ9 :
)
σσ: ;
{
ττ 
var
υυ 
entityAddressess
υυ (
=
υυ) * 
_repositoryAddress
υυ+ =
.
υυ= >
GetAll
υυ> D
(
υυD E
)
υυE F
.
υυF G
Where
υυG L
(
υυL M
x
υυM N
=>
υυO Q
x
υυR S
.
υυS T

TableKeyId
υυT ^
==
υυ_ a 
masterVendortModel
υυb t
.
υυt u
Id
υυu w
&&
υυx z
x
υυ{ |
.
υυ| }
	TableNameυυ} †
==υυ‡ ‰
$strυυ ™
&&υυ 
(υυ 
xυυ 
.υυ  
	IsDeletedυυ  ©
==υυª ¬
falseυυ­ ²
||υυ³ µ
xυυ¶ ·
.υυ· Έ
	IsDeletedυυΈ Α
==υυΒ Δ
nullυυΕ Ι
)υυΙ Κ
)υυΚ Λ
.υυΛ Μ
ToListυυΜ Ò
(υυÒ Σ
)υυΣ Τ
;υυΤ Υ
var
φφ 
allAddressId
φφ $
=
φφ% &
entityAddressess
φφ' 7
.
φφ7 8
Count
φφ8 =
>
φφ> ?
$num
φφ@ A
?
φφB C
entityAddressess
φφD T
.
φφT U
Select
φφU [
(
φφ[ \
x
φφ\ ]
=>
φφ^ `
x
φφa b
.
φφb c
Id
φφc e
)
φφe f
.
φφf g
OrderBy
φφg n
(
φφn o
Id
φφo q
=>
φφr t
Id
φφu w
)
φφw x
.
φφx y
ToList
φφy 
(φφ €
)φφ€ 
:φφ‚ ƒ
nullφφ„ 
;φφ ‰
foreach
ψψ 
(
ψψ 
var
ψψ  
address
ψψ! (
in
ψψ) + 
masterVendortModel
ψψ, >
.
ψψ> ?
	Addresses
ψψ? H
)
ψψH I
{
ωω 
if
ϊϊ 
(
ϊϊ 
address
ϊϊ #
.
ϊϊ# $
Id
ϊϊ$ &
>
ϊϊ' (
$num
ϊϊ) *
)
ϊϊ* +
{
ϋϋ 
if
όό 
(
όό  
allAddressId
όό  ,
!=
όό- /
null
όό0 4
&&
όό5 7
allAddressId
όό8 D
.
όόD E
Count
όόE J
>
όόK L
$num
όόM N
)
όόN O
{
ύύ 
allAddressId
ώώ  ,
.
ώώ, -
Remove
ώώ- 3
(
ώώ3 4
address
ώώ4 ;
.
ώώ; <
Id
ώώ< >
)
ώώ> ?
;
ώώ? @
}
ÿÿ 
var
€€ 
	OldEntity
€€  )
=
€€* + 
_repositoryAddress
€€, >
.
€€> ?
GetNoTracking
€€? L
(
€€L M
address
€€M T
.
€€T U
Id
€€U W
)
€€W X
;
€€X Y

objAddress
‚‚ &
=
‚‚' ( 
_repositoryAddress
‚‚) ;
.
‚‚; <
Get
‚‚< ?
(
‚‚? @
address
‚‚@ G
.
‚‚G H
Id
‚‚H J
)
‚‚J K
;
‚‚K L
if
ƒƒ 
(
ƒƒ  

objAddress
ƒƒ  *
!=
ƒƒ+ -
null
ƒƒ. 2
)
ƒƒ2 3
{
„„ 
var
……  #
entityAddress
……$ 1
=
……2 3
_mapperFactory
……4 B
.
……B C
Get
……C F
<
……F G!
MasterAddressEntity
……G Z
,
……Z [
MasterAddress
……\ i
>
……i j
(
……j k
address
……k r
)
……r s
;
……s t

objAddress
††  *
.
††* +
Address1
††+ 3
=
††4 5
entityAddress
††6 C
.
††C D
Address1
††D L
;
††L M

objAddress
‡‡  *
.
‡‡* +
Address1
‡‡+ 3
=
‡‡4 5
entityAddress
‡‡6 C
.
‡‡C D
Address1
‡‡D L
;
‡‡L M

objAddress
  *
.
* +
Address2
+ 3
=
4 5
entityAddress
6 C
.
C D
Address2
D L
;
L M

objAddress
‰‰  *
.
‰‰* +
Address3
‰‰+ 3
=
‰‰4 5
entityAddress
‰‰6 C
.
‰‰C D
Address3
‰‰D L
;
‰‰L M

objAddress
  *
.
* +
Landmark
+ 3
=
4 5
entityAddress
6 C
.
C D
Landmark
D L
;
L M

objAddress
‹‹  *
.
‹‹* +
	CountryId
‹‹+ 4
=
‹‹5 6
entityAddress
‹‹7 D
.
‹‹D E
	CountryId
‹‹E N
;
‹‹N O

objAddress
  *
.
* +
StateId
+ 2
=
3 4
entityAddress
5 B
.
B C
StateId
C J
;
J K

objAddress
  *
.
* +
CityId
+ 1
=
2 3
entityAddress
4 A
.
A B
CityId
B H
;
H I

objAddress
  *
.
* +
PinNo
+ 0
=
1 2
entityAddress
3 @
.
@ A
PinNo
A F
;
F G

objAddress
  *
.
* +
Zone
+ /
=
0 1
entityAddress
2 ?
.
? @
Zone
@ D
;
D E

objAddress
  *
.
* +
Email
+ 0
=
1 2
entityAddress
3 @
.
@ A
Email
A F
;
F G

objAddress
‘‘  *
.
‘‘* +
AlternateEmail
‘‘+ 9
=
‘‘: ;
entityAddress
‘‘< I
.
‘‘I J
AlternateEmail
‘‘J X
;
‘‘X Y

objAddress
’’  *
.
’’* +
PhoneExt
’’+ 3
=
’’4 5
entityAddress
’’6 C
.
’’C D
PhoneExt
’’D L
;
’’L M

objAddress
““  *
.
““* +
Phone
““+ 0
=
““1 2
entityAddress
““3 @
.
““@ A
Phone
““A F
;
““F G

objAddress
””  *
.
””* +
AlternatePhone
””+ 9
=
””: ;
entityAddress
””< I
.
””I J
AlternatePhone
””J X
;
””X Y

objAddress
••  *
.
••* +
AlternatePhoneExt
••+ <
=
••= >
entityAddress
••? L
.
••L M
AlternatePhoneExt
••M ^
;
••^ _

objAddress
––  *
.
––* +
Landlinephone
––+ 8
=
––9 :
entityAddress
––; H
.
––H I
Landlinephone
––I V
;
––V W

objAddress
  *
.
* +

ModifiedBy
+ 5
=
6 7 
masterVendortModel
8 J
.
J K

ModifiedBy
K U
;
U V 
_repositoryAddress
™™  2
.
™™2 3
UpdateAsync
™™3 >
(
™™> ?

objAddress
™™? I
)
™™I J
;
™™J K
await
››  %
_unitOfWork
››& 1
.
››1 2
SaveChangesAsync
››2 B
(
››B C
)
››C D
;
››D E
await
  %
_auditLogService
& 6
.
6 7
CreateAuditLog
7 E
<
E F
MasterAddress
F S
>
S T
(
T U!
AuditActionTypeEnum
U h
.
h i
Update
i o
,
o p
	OldEntity
q z
,
z {

objAddress| †
,† ‡
MainTableName •
,• –
MainTableKey— £
)£ ¤
;¤ ¥
}
 
}
   
else
΅΅ 
{
ΆΆ 

objAddress
££ &
=
££' (
_mapperFactory
££) 7
.
££7 8
Get
££8 ;
<
££; <!
MasterAddressEntity
££< O
,
££O P
MasterAddress
££Q ^
>
££^ _
(
££_ `
address
££` g
)
££g h
;
££h i

objAddress
¥¥ &
.
¥¥& '

TableKeyId
¥¥' 1
=
¥¥2 3
	objVendor
¥¥4 =
.
¥¥= >
Id
¥¥> @
;
¥¥@ A

objAddress
¦¦ &
.
¦¦& '
	TableName
¦¦' 0
=
¦¦1 2
$str
¦¦3 B
;
¦¦B C

objAddress
§§ &
.
§§& '
	CreatedBy
§§' 0
=
§§1 2 
masterVendortModel
§§3 E
.
§§E F
	CreatedBy
§§F O
;
§§O P

objAddress
¨¨ &
.
¨¨& '
IsActive
¨¨' /
=
¨¨0 1
true
¨¨2 6
;
¨¨6 7 
_repositoryAddress
©© .
.
©©. /
AddAsync
©©/ 7
(
©©7 8

objAddress
©©8 B
)
©©B C
;
©©C D
await
ªª !
_unitOfWork
ªª" -
.
ªª- .
SaveChangesAsync
ªª. >
(
ªª> ?
)
ªª? @
;
ªª@ A
}
¬¬ 
}
­­ 
if
®® 
(
®® 
allAddressId
®® $
!=
®®% '
null
®®( ,
&&
®®- /
allAddressId
®®0 <
.
®®< =
Count
®®= B
>
®®C D
$num
®®E F
)
®®F G
{
―― 
foreach
°° 
(
°°  !
var
°°! $
addId
°°% *
in
°°+ -
allAddressId
°°. :
)
°°: ;
{
±± 
var
²² 
	entityAdd
²²  )
=
²²* + 
_repositoryAddress
²², >
.
²²> ?
Get
²²? B
(
²²B C
x
²²C D
=>
²²E G
x
²²H I
.
²²I J
Id
²²J L
==
²²M O
addId
²²P U
)
²²U V
;
²²V W
if
³³ 
(
³³  
	entityAdd
³³  )
!=
³³* ,
null
³³- 1
)
³³1 2
{
΄΄  
_repositoryAddress
µµ  2
.
µµ2 3
Remove
µµ3 9
(
µµ9 :
	entityAdd
µµ: C
)
µµC D
;
µµD E
}
¶¶ 
}
·· 
await
ΈΈ 
_unitOfWork
ΈΈ )
.
ΈΈ) *
SaveChangesAsync
ΈΈ* :
(
ΈΈ: ;
)
ΈΈ; <
;
ΈΈ< =
}
ΉΉ 
}
ΊΊ 
if
»» 
(
»»  
masterVendortModel
»» &
.
»»& '
Contacts
»»' /
.
»»/ 0
Count
»»0 5
>
»»6 7
$num
»»8 9
)
»»9 :
{
ΌΌ 
var
½½ 
entityContacts
½½ &
=
½½' ( 
_repositoryContact
½½) ;
.
½½; <
GetAll
½½< B
(
½½B C
)
½½C D
.
½½D E
Where
½½E J
(
½½J K
x
½½K L
=>
½½M O
x
½½P Q
.
½½Q R

TableKeyId
½½R \
==
½½] _ 
masterVendortModel
½½` r
.
½½r s
Id
½½s u
&&
½½v x
x
½½y z
.
½½z {
	TableName½½{ „
==½½… ‡
$str½½ •
&&½½– 
(½½™ 
x½½ ›
.½½› 
	IsDeleted½½ ¥
==½½¦ ¨
false½½© ®
||½½― ±
x½½² ³
.½½³ ΄
	IsDeleted½½΄ ½
==½½Ύ ΐ
null½½Α Ε
)½½Ε Ζ
)½½Ζ Η
.½½Η Θ
ToList½½Θ Ξ
(½½Ξ Ο
)½½Ο Π
;½½Π Ρ
var
ΎΎ 
allContactId
ΎΎ $
=
ΎΎ% &
entityContacts
ΎΎ' 5
.
ΎΎ5 6
Count
ΎΎ6 ;
>
ΎΎ< =
$num
ΎΎ> ?
?
ΎΎ@ A
entityContacts
ΎΎB P
.
ΎΎP Q
Select
ΎΎQ W
(
ΎΎW X
x
ΎΎX Y
=>
ΎΎZ \
x
ΎΎ] ^
.
ΎΎ^ _
Id
ΎΎ_ a
)
ΎΎa b
.
ΎΎb c
OrderBy
ΎΎc j
(
ΎΎj k
Id
ΎΎk m
=>
ΎΎn p
Id
ΎΎq s
)
ΎΎs t
.
ΎΎt u
ToList
ΎΎu {
(
ΎΎ{ |
)
ΎΎ| }
:
ΎΎ~ 
nullΎΎ€ „
;ΎΎ„ …
foreach
ΐΐ 
(
ΐΐ 
var
ΐΐ  
contact
ΐΐ! (
in
ΐΐ) + 
masterVendortModel
ΐΐ, >
.
ΐΐ> ?
Contacts
ΐΐ? G
)
ΐΐG H
{
ΑΑ 
if
ΒΒ 
(
ΒΒ 
contact
ΒΒ #
.
ΒΒ# $
Id
ΒΒ$ &
>
ΒΒ' (
$num
ΒΒ) *
)
ΒΒ* +
{
ΓΓ 
if
ΔΔ 
(
ΔΔ  
allContactId
ΔΔ  ,
!=
ΔΔ- /
null
ΔΔ0 4
&&
ΔΔ5 7
allContactId
ΔΔ8 D
.
ΔΔD E
Count
ΔΔE J
>
ΔΔK L
$num
ΔΔM N
)
ΔΔN O
{
ΕΕ 
allContactId
ΖΖ  ,
.
ΖΖ, -
Remove
ΖΖ- 3
(
ΖΖ3 4
contact
ΖΖ4 ;
.
ΖΖ; <
Id
ΖΖ< >
)
ΖΖ> ?
;
ΖΖ? @
}
ΗΗ 
var
ΘΘ 
	OldEntity
ΘΘ  )
=
ΘΘ* + 
_repositoryContact
ΘΘ, >
.
ΘΘ> ?
GetNoTracking
ΘΘ? L
(
ΘΘL M
contact
ΘΘM T
.
ΘΘT U
Id
ΘΘU W
)
ΘΘW X
;
ΘΘX Y

objContact
ΚΚ &
=
ΚΚ' ( 
_repositoryContact
ΚΚ) ;
.
ΚΚ; <
Get
ΚΚ< ?
(
ΚΚ? @
contact
ΚΚ@ G
.
ΚΚG H
Id
ΚΚH J
)
ΚΚJ K
;
ΚΚK L
if
ΛΛ 
(
ΛΛ  

objContact
ΛΛ  *
!=
ΛΛ+ -
null
ΛΛ. 2
)
ΛΛ2 3
{
ΜΜ 
var
ΝΝ  #
entityAddress
ΝΝ$ 1
=
ΝΝ2 3
_mapperFactory
ΝΝ4 B
.
ΝΝB C
Get
ΝΝC F
<
ΝΝF G 
MasterContactModel
ΝΝG Y
,
ΝΝY Z
MasterContact
ΝΝ[ h
>
ΝΝh i
(
ΝΝi j
contact
ΝΝj q
)
ΝΝq r
;
ΝΝr s

objContact
ΟΟ  *
.
ΟΟ* +
ContactPersonName
ΟΟ+ <
=
ΟΟ= >
entityAddress
ΟΟ? L
.
ΟΟL M
ContactPersonName
ΟΟM ^
;
ΟΟ^ _

objContact
ΠΠ  *
.
ΠΠ* +
DepartmentId
ΠΠ+ 7
=
ΠΠ8 9
entityAddress
ΠΠ: G
.
ΠΠG H
DepartmentId
ΠΠH T
;
ΠΠT U

objContact
ΡΡ  *
.
ΡΡ* +
DesignationId
ΡΡ+ 8
=
ΡΡ9 :
entityAddress
ΡΡ; H
.
ΡΡH I
DesignationId
ΡΡI V
;
ΡΡV W

objContact
ÒÒ  *
.
ÒÒ* +
Email
ÒÒ+ 0
=
ÒÒ1 2
entityAddress
ÒÒ3 @
.
ÒÒ@ A
Email
ÒÒA F
;
ÒÒF G

objContact
ΣΣ  *
.
ΣΣ* +
	MobileExt
ΣΣ+ 4
=
ΣΣ5 6
entityAddress
ΣΣ7 D
.
ΣΣD E
	MobileExt
ΣΣE N
;
ΣΣN O

objContact
ΤΤ  *
.
ΤΤ* +
Mobile
ΤΤ+ 1
=
ΤΤ2 3
entityAddress
ΤΤ4 A
.
ΤΤA B
Mobile
ΤΤB H
;
ΤΤH I

objContact
ΦΦ  *
.
ΦΦ* +

ModifiedBy
ΦΦ+ 5
=
ΦΦ6 7 
masterVendortModel
ΦΦ8 J
.
ΦΦJ K

ModifiedBy
ΦΦK U
;
ΦΦU V 
_repositoryContact
ΧΧ  2
.
ΧΧ2 3
UpdateAsync
ΧΧ3 >
(
ΧΧ> ?

objContact
ΧΧ? I
)
ΧΧI J
;
ΧΧJ K
await
ΩΩ  %
_unitOfWork
ΩΩ& 1
.
ΩΩ1 2
SaveChangesAsync
ΩΩ2 B
(
ΩΩB C
)
ΩΩC D
;
ΩΩD E
await
άά  %
_auditLogService
άά& 6
.
άά6 7
CreateAuditLog
άά7 E
<
άάE F
MasterContact
άάF S
>
άάS T
(
άάT U!
AuditActionTypeEnum
άάU h
.
άάh i
Update
άάi o
,
άάo p
	OldEntity
άάq z
,
άάz {

objContactάά| †
,άά† ‡
MainTableNameάά •
,άά• –
MainTableKeyάά— £
)άά£ ¤
;άά¤ ¥
}
έέ 
}
ήή 
else
ίί 
{
ΰΰ 

objContact
ββ &
=
ββ' (
_mapperFactory
ββ) 7
.
ββ7 8
Get
ββ8 ;
<
ββ; < 
MasterContactModel
ββ< N
,
ββN O
MasterContact
ββP ]
>
ββ] ^
(
ββ^ _
contact
ββ_ f
)
ββf g
;
ββg h

objContact
γγ &
.
γγ& '
CreatedDate
γγ' 2
=
γγ3 4
AppConstants
γγ5 A
.
γγA B
DateTime
γγB J
;
γγJ K

objContact
δδ &
.
δδ& '

TableKeyId
δδ' 1
=
δδ2 3
	objVendor
δδ4 =
.
δδ= >
Id
δδ> @
;
δδ@ A

objContact
εε &
.
εε& '
	TableName
εε' 0
=
εε1 2
$str
εε3 B
;
εεB C

objContact
ζζ &
.
ζζ& '

ModifiedBy
ζζ' 1
=
ζζ2 3 
masterVendortModel
ζζ4 F
.
ζζF G
	CreatedBy
ζζG P
;
ζζP Q

objContact
ηη &
.
ηη& '
Status
ηη' -
=
ηη. /
$num
ηη0 1
;
ηη1 2 
_repositoryContact
θθ .
.
θθ. /
AddAsync
θθ/ 7
(
θθ7 8

objContact
θθ8 B
)
θθB C
;
θθC D
await
κκ !
_unitOfWork
κκ" -
.
κκ- .
SaveChangesAsync
κκ. >
(
κκ> ?
)
κκ? @
;
κκ@ A
}
λλ 
}
μμ 
if
νν 
(
νν 
allContactId
νν $
!=
νν% '
null
νν( ,
&&
νν- /
allContactId
νν0 <
.
νν< =
Count
νν= B
>
ννC D
$num
ννE F
)
ννF G
{
ξξ 
foreach
οο 
(
οο  !
var
οο! $
addId
οο% *
in
οο+ -
allContactId
οο. :
)
οο: ;
{
ππ 
var
ρρ 
	entityAdd
ρρ  )
=
ρρ* + 
_repositoryContact
ρρ, >
.
ρρ> ?
Get
ρρ? B
(
ρρB C
x
ρρC D
=>
ρρE G
x
ρρH I
.
ρρI J
Id
ρρJ L
==
ρρM O
addId
ρρP U
)
ρρU V
;
ρρV W
if
ςς 
(
ςς  
	entityAdd
ςς  )
!=
ςς* ,
null
ςς- 1
)
ςς1 2
{
σσ  
_repositoryContact
ττ  2
.
ττ2 3
Remove
ττ3 9
(
ττ9 :
	entityAdd
ττ: C
)
ττC D
;
ττD E
}
υυ 
}
φφ 
await
χχ 
_unitOfWork
χχ )
.
χχ) *
SaveChangesAsync
χχ* :
(
χχ: ;
)
χχ; <
;
χχ< =
}
ψψ 
}
ωω 
}
ϊϊ 
return
όό 
DBOperation
όό 
.
όό 
Success
όό &
;
όό& '
}
ύύ 	
public
€€ 
async
€€ 
Task
€€ 
<
€€ 
DBOperation
€€ %
>
€€% &
DeleteVendor
€€' 3
(
€€3 4
int
€€4 7
id
€€8 :
,
€€: ;
int
€€; >
?
€€> ?
by
€€@ B
)
€€B C
{
 	
var
ƒƒ 

entityUser
ƒƒ 
=
ƒƒ 
_repository
ƒƒ (
.
ƒƒ( )
Get
ƒƒ) ,
(
ƒƒ, -
x
ƒƒ- .
=>
ƒƒ/ 1
x
ƒƒ2 3
.
ƒƒ3 4
Id
ƒƒ4 6
==
ƒƒ7 9
id
ƒƒ: <
)
ƒƒ< =
;
ƒƒ= >

entityUser
„„ 
.
„„ 

ModifiedBy
„„ !
=
„„" #
by
„„$ &
??
„„' )

entityUser
„„* 4
.
„„4 5

ModifiedBy
„„5 ?
;
„„? @
if
†† 
(
†† 

entityUser
†† 
==
†† 
null
†† "
)
††" #
return
‡‡ 
DBOperation
‡‡ "
.
‡‡" #
NotFound
‡‡# +
;
‡‡+ ,
else
 
{
‰‰ 
var
 
entityLocation
 "
=
# $ 
_repositoryAddress
% 7
.
7 8
GetAll
8 >
(
> ?
)
? @
.
@ A
Where
A F
(
F G
x
G H
=>
I K
x
L M
.
M N

TableKeyId
N X
==
Y [
id
\ ^
&&
_ a
x
b c
.
c d
	TableName
d m
==
n p
$strq €
)€ 
. ‚
ToList‚ 
( ‰
)‰ 
; ‹
if
‹‹ 
(
‹‹ 
entityLocation
‹‹ "
.
‹‹" #
Count
‹‹# (
>
‹‹) *
$num
‹‹+ ,
)
‹‹, -
{
 
foreach
 
(
 
var
  
addrs
! &
in
' )
entityLocation
* 8
)
8 9
{
  
_repositoryAddress
 *
.
* +
Remove
+ 1
(
1 2
addrs
2 7
)
7 8
;
8 9
}
 
}
‘‘ 
var
’’ 
entityContact
’’ !
=
’’" # 
_repositoryContact
’’$ 6
.
’’6 7
GetAll
’’7 =
(
’’= >
)
’’> ?
.
’’? @
Where
’’@ E
(
’’E F
x
’’F G
=>
’’H J
x
’’K L
.
’’L M

TableKeyId
’’M W
==
’’X Z
id
’’[ ]
&&
’’^ `
x
’’a b
.
’’b c
	TableName
’’c l
==
’’m o
$str
’’p 
)’’ €
.’’€ 
ToList’’ ‡
(’’‡ 
)’’ ‰
;’’‰ 
if
““ 
(
““ 
entityContact
““ !
.
““! "
Count
““" '
>
““( )
$num
““* +
)
““+ ,
{
”” 
foreach
•• 
(
•• 
var
••  
contct
••! '
in
••( *
entityContact
••+ 8
)
••8 9
{
––  
_repositoryContact
—— *
.
——* +
Remove
——+ 1
(
——1 2
contct
——2 8
)
——8 9
;
——9 :
}
 
}
™™ 
_repository
›› 
.
›› 
Remove
›› "
(
››" #

entityUser
››# -
)
››- .
;
››. /
await
 
_unitOfWork
 !
.
! "
SaveChangesAsync
" 2
(
2 3
)
3 4
;
4 5
return
   
DBOperation
   "
.
  " #
Success
  # *
;
  * +
}
΅΅ 
}
ΆΆ 	
}
¦¦ 
}§§ —K
DD:\EltizamLive\Eltizam.Business.Core\Implementation\UploadService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
Implementation  .
{ 
public 
class 
UploadService 
: 
IUploadService ,
{ 
private 	
readonly
 
string 
_uploadsFolderPath ,
;, -
private 	
readonly
 
IUnitOfWork 
_unitOfWork *
;* +
private 	
readonly
 
IMapperFactory !
_mapperFactory" 0
;0 1
private 	
readonly
 
IStringLocalizer #
<# $
Errors$ *
>* +!
_stringLocalizerError, A
;A B
private 	
readonly
 
	Microsoft 
. 

Extensions '
.' (
Configuration( 5
.5 6
IConfiguration6 D
configurationE R
;R S
private 	
IRepository
 
< 
Upload 
> 
_repository )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
private 	
readonly
 
IHelper 
_helper "
;" #
public!! 
UploadService!!	 
(!! 
IUnitOfWork!! "

unitOfWork!!# -
,!!- .
IMapperFactory!!/ =
mapperFactory!!> K
,!!K L
IStringLocalizer!!M ]
<!!] ^
Errors!!^ d
>!!d e 
stringLocalizerError!!f z
,!!z {
IHelper""
 
helper"" 
,"" 
	Microsoft##	 
.## 

Extensions## 
.## 
Configuration## +
.##+ ,
IConfiguration##, :
_configuration##; I
)##I J
{$$ 
_unitOfWork%% 
=%% 

unitOfWork%% 
;%% 
_mapperFactory&& 
=&& 
mapperFactory&& !
;&&! "
_repository(( 
=(( 
_unitOfWork(( 
.(( 
GetRepository(( *
<((* +
Upload((+ 1
>((1 2
(((2 3
)((3 4
;((4 5
configuration)) 
=)) 
_configuration)) !
;))! "
_helper** 

=** 
helper** 
;** 
_uploadsFolderPath++ 
=++ 
configuration++ %
[++% &
$str++& 9
]++9 :
;++: ;
},, 
public== 
async==	 
Task== 
<== 
DBOperation== 
>==  
SaveFilesAsync==! /
(==/ 0
List==0 4
<==4 5
	IFormFile==5 >
>==> ?
files==@ E
)==E F
{>> 
if?? 
(?? 
files?? 
==?? 
null?? 
||?? 
files?? 
.?? 
Count?? #
==??$ &
$num??' (
)??( )
{@@ 
throwAA 	
newAA
 
ArgumentExceptionAA 
(AA  
$strAA  9
)AA9 :
;AA: ;
}BB 
varDD 
savedFileNamesDD 
=DD 
newDD 
ListDD  
<DD  !
stringDD! '
>DD' (
(DD( )
)DD) *
;DD* +
foreachFF 

(FF 
varFF 
fileFF 
inFF 
filesFF 
)FF 
{GG 
ifHH 
(HH 
fileHH 
==HH 
nullHH 
||HH 
fileHH 
.HH 
LengthHH #
==HH$ &
$numHH' (
)HH( )
{II 
continueJJ 
;JJ 
}KK 
varNN 
allowedFileTypesNN 
=NN 
newNN 
ListNN #
<NN# $
stringNN$ *
>NN* +
{NN, -
$strNN. :
,NN: ;
$strNN< G
,NNG H
$strNNI ]
,NN] ^
$strNN_ p
}NNq r
;NNr s
ifOO 
(OO 
!OO 	
allowedFileTypesOO	 
.OO 
ContainsOO "
(OO" #
fileOO# '
.OO' (
ContentTypeOO( 3
)OO3 4
)OO4 5
{PP 
throwQQ 

newQQ 
ArgumentExceptionQQ  
(QQ  !
$"QQ! #
$strQQ# .
{QQ. /
fileQQ/ 3
.QQ3 4
ContentTypeQQ4 ?
}QQ? @
$strQQ@ Q
"QQQ R
)QQR S
;QQS T
}RR 
varTT 
fileNameTT 
=TT 
GuidTT 
.TT 
NewGuidTT 
(TT  
)TT  !
.TT! "
ToStringTT" *
(TT* +
)TT+ ,
+TT- .
PathTT/ 3
.TT3 4
GetExtensionTT4 @
(TT@ A
fileTTA E
.TTE F
FileNameTTF N
)TTN O
;TTO P
varUU 
filePathUU 
=UU 
PathUU 
.UU 
CombineUU 
(UU  
$strUU  1
,UU1 2
fileNameUU3 ;
)UU; <
;UU< =
usingXX 	
(XX
 
varXX 
streamXX 
=XX 
newXX 

FileStreamXX &
(XX& '
filePathXX' /
,XX/ 0
FileModeXX1 9
.XX9 :
CreateXX: @
)XX@ A
)XXA B
{YY 
awaitZZ 

fileZZ 
.ZZ 
CopyToAsyncZZ 
(ZZ 
streamZZ "
)ZZ" #
;ZZ# $
}[[ 
var^^ 
upload^^ 
=^^ 
new^^ 
Upload^^ 
{__ 
FileName`` 
=`` 
fileName`` 
,`` 
ContentTypeaa 
=aa 
fileaa 
.aa 
ContentTypeaa #
,aa# $
CreatedDatebb 
=bb 
AppConstantsbb 
.bb  
DateTimebb  (
,bb( )
FileTypecc 
=cc 
GetFileTypecc 
(cc 
filecc  
.cc  !
ContentTypecc! ,
)cc, -
}dd 
;dd 
_repositoryff 
.ff 
AddAsyncff 
(ff 
uploadff 
)ff  
;ff  !
awaitgg 	
_unitOfWorkgg
 
.gg 
SaveChangesAsyncgg &
(gg& '
)gg' (
;gg( )
}ii 
returnkk 	
DBOperationkk
 
.kk 
Successkk 
;kk 
}mm 
publicoo 
asyncoo	 
Taskoo 
<oo 
IEnumerableoo 
<oo  
Uploadoo  &
>oo& '
>oo' (
GetAllUploadsAsyncoo) ;
(oo; <
)oo< =
{pp 
tryqq 
{rr 
vartt 
uploadstt 
=tt 
_repositorytt 
.tt 
GetAlltt $
(tt$ %
)tt% &
;tt& '
returnuu 

uploadsuu 
;uu 
}vv 
catchww 
(ww	 

	Exceptionww
 
exww 
)ww 
{xx 
throw{{ 	
new{{
 
	Exception{{ 
({{ 
$str{{ J
,{{J K
ex{{L N
){{N O
;{{O P
}|| 
}}} 
private
€€ 	
string
€€
 
GetFileType
€€ 
(
€€ 
string
€€ #
contentType
€€$ /
)
€€/ 0
{
 
switch
‚‚ 	
(
‚‚
 
contentType
‚‚ 
)
‚‚ 
{
ƒƒ 
case
„„ 
$str
„„	 
:
„„ 
case
…… 
$str
……	 
:
…… 
return
†† 
$str
†† 
;
†† 
case
‡‡ 
$str
‡‡	 
:
‡‡ 
return
 
$str
 
;
 
case
‰‰ 
$str
‰‰	 
:
‰‰ 
return
 
$str
 
;
 
default
‹‹ 
:
‹‹ 
return
 
$str
 
;
 
}
 
}
 
public
 
async
	 
Task
 
<
 
DBOperation
 
>
   
GetUploadByIdAsync
! 3
(
3 4
int
4 7
id
8 :
)
: ;
{
‘‘ 
try
’’ 
{
““ 
var
•• 
upload
•• 
=
•• 
await
•• 
_repository
•• "
.
••" #
GetAsync
••# +
(
••+ ,
id
••, .
)
••. /
;
••/ 0
if
–– 
(
–– 
upload
–– 
==
–– 
null
–– 
)
–– 
return
—— 
DBOperation
—— 
.
—— 
NotFound
——  
;
——  !
return
 

DBOperation
 
.
 
Success
 
;
 
}
™™ 
catch
 
(
	 

	Exception

 
ex
 
)
 
{
›› 
throw
 	
new

 
	Exception
 
(
 
$"
 
$str
 L
{
L M
id
M O
}
O P
$str
P Q
"
Q R
,
R S
ex
T V
)
V W
;
W X
}
 
}
   
}
¤¤ 
}¥¥ ½ϊ
QD:\EltizamLive\Eltizam.Business.Core\Implementation\ValuationAssessmentService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
Implementation  .
{ 
public 

class &
ValuationAssessmentService +
:+ ,'
IValuationAssessmentService- H
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IMapperFactory '
_mapperFactory( 6
;6 7
private 
readonly 
	Microsoft "
." #

Extensions# -
.- .
Configuration. ;
.; <
IConfiguration< J
configurationK X
;X Y
private 
IRepository 
< '
ValuationComparableEvidence 7
>7 8
_repository9 D
{E F
getG J
;J K
setL O
;O P
}Q R
private 
IRepository 
< 
ValuationAssesment .
>. /
_valutionrepository0 C
{D E
getF I
;I J
setK N
;N O
}P Q
private 
IRepository 
< $
ValuationSiteDescription 4
>4 5
_siteRepository6 E
{F G
getH K
;K L
setM P
;P Q
}R S
private   
IRepository   
<   
MasterAddress   )
>  ) *
_addressRepository  + =
{  > ?
get  @ C
;  C D
set  E H
;  H I
}  J K
private"" 
IRepository"" 
<"" 
MasterDocument"" *
>""* +
_documentRepository"", ?
{""@ A
get""B E
;""E F
set""G J
;""J K
}""L M
private## 
readonly## 
IFileUploadService## +
_fileUploadService##, >
;##> ?
private%% 
readonly%% 
IAuditLogService%% )
_auditLogService%%* :
;%%: ;
private&& 
readonly&& 
IHelper&&  
_helper&&! (
;&&( )
private'' 
readonly'' 
int'' 
?'' 
_LoginUserId'' *
;''* +
public)) &
ValuationAssessmentService)) )
())) *
IUnitOfWork))* 5

unitOfWork))6 @
,))@ A
IMapperFactory))B P
mapperFactory))Q ^
,))^ _
IAuditLogService))` p
auditLogService	))q €
,
))€ 
IHelper** &
helper**' -
,**- .
	Microsoft**/ 8
.**8 9

Extensions**9 C
.**C D
Configuration**D Q
.**Q R
IConfiguration**R `
_configuration**a o
,**o p
IFileUploadService	**q ƒ
fileUploadService
**„ •
)
**• –
{++ 	
_unitOfWork,, 
=,, 

unitOfWork,, $
;,,$ %
_mapperFactory-- 
=-- 
mapperFactory-- *
;--* +
_repository00 
=00 
_unitOfWork00 %
.00% &
GetRepository00& 3
<003 4'
ValuationComparableEvidence004 O
>00O P
(00P Q
)00Q R
;00R S
_siteRepository11 
=11 
_unitOfWork11 )
.11) *
GetRepository11* 7
<117 8$
ValuationSiteDescription118 P
>11P Q
(11Q R
)11R S
;11S T
_valutionrepository22 
=22  !
_unitOfWork22" -
.22- .
GetRepository22. ;
<22; <
ValuationAssesment22< N
>22N O
(22O P
)22P Q
;22Q R
_addressRepository33 
=33  
_unitOfWork33! ,
.33, -
GetRepository33- :
<33: ;
MasterAddress33; H
>33H I
(33I J
)33J K
;33K L
_documentRepository55 
=55  !
_unitOfWork55" -
.55- .
GetRepository55. ;
<55; <
MasterDocument55< J
>55J K
(55K L
)55L M
;55M N
configuration66 
=66 
_configuration66 *
;66* +
_helper77 
=77 
helper77 
;77 
_auditLogService88 
=88 
auditLogService88 .
;88. /
_fileUploadService99 
=99  
fileUploadService99! 2
;992 3
}:: 	
public== 
async== 
Task== 
<== 
DBOperation== %
>==% &$
ValuationAssesmentUpsert==' ?
(==? @)
ValuationAssesmentActionModel==@ ]
model==^ c
)==c d
{>> 	$
ValuationSiteDescription@@ $
objUser@@% ,
;@@, -'
ValuationComparableEvidenceBB '

comparableBB( 2
;BB2 3
ValuationAssesmentCC 
objUser1CC '
;CC' (
MasterDocumentDD 
objUserDocumentDD *
;DD* +
objUserEE 
=EE 
_siteRepositoryEE %
.EE% &
GetAllEE& ,
(EE, -
)EE- .
.EE. /
WhereEE/ 4
(EE4 5
xEE5 6
=>EE7 9
xEE: ;
.EE; <
ValuationRequestIdEE< N
==EEO Q
modelEER W
.EEW X
SiteDescriptionEEX g
.EEg h
ValuationRequestIdEEh z
)EEz {
.EE{ |
FirstOrDefault	EE| 
(
EE ‹
)
EE‹ 
;
EE 
ifKK 
(KK 
objUserKK 
!=KK 
nullKK 
)KK 
{LL 
stringMM 
MainTableNameMM $
=MM% &
EnumMM' +
.MM+ ,
GetNameMM, 3
(MM3 4
TableNameEnumMM4 A
.MMA B
SiteDescriptionMMB Q
)MMQ R
;MMR S
intNN 
MainTableKeyNN  
=NN! "
objUserNN# *
.NN* +
IdNN+ -
;NN- .$
ValuationSiteDescriptionPP (
	OldEntityPP) 2
=PP3 4
nullPP5 9
;PP9 :
	OldEntityQQ 
=QQ 
_siteRepositoryQQ +
.QQ+ ,
GetNoTrackingQQ, 9
(QQ9 :
objUserQQ: A
.QQA B
IdQQB D
)QQD E
;QQE F
objUserRR 
=RR 
_siteRepositoryRR )
.RR) *
GetRR* -
(RR- .
objUserRR. 5
.RR5 6
IdRR6 8
)RR8 9
;RR9 :
ifVV 
(VV 
objUserVV 
!=VV 
nullVV #
)VV# $
{WW 
objUserXX 
.XX 
LocationXX $
=XX% &
modelXX' ,
.XX, -
SiteDescriptionXX- <
.XX< =
LocationXX= E
;XXE F
objUserYY 
.YY 
InternalAreaYY (
=YY) *
modelYY+ 0
.YY0 1
SiteDescriptionYY1 @
.YY@ A
InternalAreaYYA M
;YYM N
objUserZZ 
.ZZ 
ExternalAreaZZ (
=ZZ) *
modelZZ+ 0
.ZZ0 1
SiteDescriptionZZ1 @
.ZZ@ A
ExternalAreaZZA M
;ZZM N
objUser[[ 
.[[ 
Floor[[ !
=[[" #
model[[$ )
.[[) *
SiteDescription[[* 9
.[[9 :
Floor[[: ?
;[[? @
objUser\\ 
.\\ 
Room\\  
=\\! "
model\\# (
.\\( )
SiteDescription\\) 8
.\\8 9
Room\\9 =
;\\= >
objUser]] 
.]] 
Bedrooms]] $
=]]% &
model]]' ,
.]], -
SiteDescription]]- <
.]]< =
Bedrooms]]= E
;]]E F
objUser^^ 
.^^ 
Storage^^ #
=^^$ %
model^^& +
.^^+ ,
SiteDescription^^, ;
.^^; <
Storage^^< C
;^^C D
objUser__ 
.__ 
Quantity__ $
=__% &
model__' ,
.__, -
SiteDescription__- <
.__< =
Quantity__= E
;__E F
objUser`` 
.`` 
AdditionComment`` +
=``, -
model``. 3
.``3 4
SiteDescription``4 C
.``C D
AdditionComment``D S
;``S T
objUseraa 
.aa 
PropertyConditionaa -
=aa. /
modelaa0 5
.aa5 6
SiteDescriptionaa6 E
.aaE F
PropertyConditionaaF W
;aaW X
objUserbb 
.bb 
AdditionalNotesbb +
=bb, -
modelbb. 3
.bb3 4
SiteDescriptionbb4 C
.bbC D
AdditionalNotesbbD S
;bbS T
objUsercc 
.cc 
Otherscc "
=cc# $
modelcc% *
.cc* +
SiteDescriptioncc+ :
.cc: ;
Otherscc; A
;ccA B
objUseree 
.ee 

ModifiedByee &
=ee' (
modelee) .
.ee. /
SiteDescriptionee/ >
.ee> ?

ModifiedByee? I
;eeI J
_siteRepositoryhh #
.hh# $
UpdateAsynchh$ /
(hh/ 0
objUserhh0 7
)hh7 8
;hh8 9
awaitjj 
_unitOfWorkjj %
.jj% &
SaveChangesAsyncjj& 6
(jj6 7
)jj7 8
;jj8 9
awaitmm 
_auditLogServicemm *
.mm* +
CreateAuditLogmm+ 9
<mm9 :$
ValuationSiteDescriptionmm: R
>mmR S
(mmS T
AuditActionTypeEnummmT g
.mmg h
Updatemmh n
,mmn o
	OldEntitymmp y
,mmy z
objUser	mm{ ‚
,
mm‚ ƒ
MainTableName
mm„ ‘
,
mm‘ ’
MainTableKey
mm“ 
)
mm  
;
mm  ΅
}nn 
}oo 
elsepp 
{qq 
objUserrr 
=rr 
_mapperFactoryrr (
.rr( )
Getrr) ,
<rr, - 
SiteDescriptionModelrr- A
,rrA B$
ValuationSiteDescriptionrrC [
>rr[ \
(rr\ ]
modelrr] b
.rrb c
SiteDescriptionrrc r
)rrr s
;rrs t
objUsertt 
.tt 
	CreatedBytt !
=tt" #
modeltt$ )
.tt) *
SiteDescriptiontt* 9
.tt9 :
	CreatedBytt: C
;ttC D
_siteRepositoryvv 
.vv  
AddAsyncvv  (
(vv( )
objUservv) 0
)vv0 1
;vv1 2
awaitww 
_unitOfWorkww !
.ww! "
SaveChangesAsyncww" 2
(ww2 3
)ww3 4
;ww4 5
}xx 
if{{ 
({{ 
objUser{{ 
.{{ 
Id{{ 
=={{ 
$num{{ 
){{  
return|| 
DBOperation|| "
.||" #
Error||# (
;||( )
else}} 
{~~ 
await
€€  
_fileUploadService
€€ (
.
€€( )
UploadFilesAsync
€€) 9
(
€€9 :
objUser
€€: A
.
€€A B
Id
€€B D
,
€€D E
Enum
€€F J
.
€€J K
GetName
€€K R
(
€€R S
TableNameEnum
€€S `
.
€€` a
SiteDescription
€€a p
)
€€p q
,
€€q r
model
€€s x
.
€€x y
SiteDescription€€y 
.€€ ‰
uploadDocument€€‰ —
,€€— 
model€€™ 
.€€ 
SiteDescription€€ ®
.€€® ―
	CreatedBy€€― Έ
)€€Έ Ή
;€€Ή Ί
}
““ 

comparable
–– 
=
–– 
_repository
–– $
.
––$ %
GetAll
––% +
(
––+ ,
)
––, -
.
––- .
Where
––. 3
(
––3 4
x
––4 5
=>
––6 8
x
––9 :
.
––: ;
	RequestId
––; D
==
––E G
model
––H M
.
––M N%
comparableEvidenceModel
––N e
.
––e f
	RequestId
––f o
)
––o p
.
––p q
FirstOrDefault
––q 
(–– €
)––€ 
;–– ‚
if
 
(
 

comparable
 
!=
 
null
 "
)
" #
{
™™ 
int
 $
MaincomparableTableKey
 *
=
+ ,

comparable
- 7
.
7 8
Id
8 :
;
: ;
string
›› %
MaincomparableTableName
›› .
=
››/ 0
Enum
››1 5
.
››5 6
GetName
››6 =
(
››= >
TableNameEnum
››> K
.
››K L!
Comparable_Evidence
››L _
)
››_ `
;
››` a)
ValuationComparableEvidence
 +
	OldEntity
, 5
=
6 7
null
8 <
;
< =
	OldEntity
 
=
 
_repository
 '
.
' (
GetNoTracking
( 5
(
5 6

comparable
6 @
.
@ A
Id
A C
)
C D
;
D E

comparable
΅΅ 
=
΅΅ 
_repository
΅΅ (
.
΅΅( )
Get
΅΅) ,
(
΅΅, -

comparable
΅΅- 7
.
΅΅7 8
Id
΅΅8 :
)
΅΅: ;
;
΅΅; <
if
££ 
(
££ 

comparable
££ 
!=
££ !
null
££" &
)
££& '
{
¤¤ 

comparable
¥¥ 
.
¥¥ 
Type
¥¥ #
=
¥¥$ %
model
¥¥& +
.
¥¥+ ,%
comparableEvidenceModel
¥¥, C
.
¥¥C D
Type
¥¥D H
;
¥¥H I

comparable
¦¦ 
.
¦¦ 
Size
¦¦ #
=
¦¦$ %
model
¦¦& +
.
¦¦+ ,%
comparableEvidenceModel
¦¦, C
.
¦¦C D
Size
¦¦D H
;
¦¦H I

comparable
§§ 
.
§§ 
Remarks
§§ &
=
§§' (
model
§§) .
.
§§. /%
comparableEvidenceModel
§§/ F
.
§§F G
Remarks
§§G N
;
§§N O

comparable
¨¨ 
.
¨¨ 
Price
¨¨ $
=
¨¨% &
model
¨¨' ,
.
¨¨, -%
comparableEvidenceModel
¨¨- D
.
¨¨D E
Price
¨¨E J
;
¨¨J K

comparable
©© 
.
©© 
RateSqFt
©© '
=
©©( )
model
©©* /
.
©©/ 0%
comparableEvidenceModel
©©0 G
.
©©G H
RateSqFt
©©H P
;
©©P Q

comparable
«« 
.
«« 

ModifiedBy
«« )
=
««* +
model
««, 1
.
««1 2%
comparableEvidenceModel
««2 I
.
««I J

ModifiedBy
««J T
;
««T U
_repository
®® 
.
®®  
UpdateAsync
®®  +
(
®®+ ,

comparable
®®, 6
)
®®6 7
;
®®7 8
await
°° 
_unitOfWork
°° %
.
°°% &
SaveChangesAsync
°°& 6
(
°°6 7
)
°°7 8
;
°°8 9
await
³³ 
_auditLogService
³³ *
.
³³* +
CreateAuditLog
³³+ 9
<
³³9 :)
ValuationComparableEvidence
³³: U
>
³³U V
(
³³V W!
AuditActionTypeEnum
³³W j
.
³³j k
Update
³³k q
,
³³q r
	OldEntity
³³s |
,
³³| }

comparable³³~ 
,³³ ‰'
MaincomparableTableName³³ ΅
,³³΅ Ά&
MaincomparableTableKey³³£ Ή
)³³Ή Ί
;³³Ί »
}
΄΄ 
}
µµ 
else
¶¶ 
{
·· 

comparable
ΈΈ 
=
ΈΈ 
_mapperFactory
ΈΈ +
.
ΈΈ+ ,
Get
ΈΈ, /
<
ΈΈ/ 0%
ComparableEvidenceModel
ΈΈ0 G
,
ΈΈG H)
ValuationComparableEvidence
ΈΈI d
>
ΈΈd e
(
ΈΈe f
model
ΈΈf k
.
ΈΈk l&
comparableEvidenceModelΈΈl ƒ
)ΈΈƒ „
;ΈΈ„ …

comparable
ΊΊ 
.
ΊΊ 
	CreatedBy
ΊΊ $
=
ΊΊ% &
model
ΊΊ' ,
.
ΊΊ, -%
comparableEvidenceModel
ΊΊ- D
.
ΊΊD E
	CreatedBy
ΊΊE N
;
ΊΊN O

comparable
»» 
.
»» 
IsActive
»» #
=
»»$ %
model
»»& +
.
»»+ ,%
comparableEvidenceModel
»», C
.
»»C D
IsActive
»»D L
;
»»L M
_repository
½½ 
.
½½ 
AddAsync
½½ $
(
½½$ %

comparable
½½% /
)
½½/ 0
;
½½0 1
await
ΎΎ 
_unitOfWork
ΎΎ !
.
ΎΎ! "
SaveChangesAsync
ΎΎ" 2
(
ΎΎ2 3
)
ΎΎ3 4
;
ΎΎ4 5
}
ΏΏ 
if
ΒΒ 
(
ΒΒ 
objUser
ΒΒ 
.
ΒΒ 
Id
ΒΒ 
==
ΒΒ 
$num
ΒΒ 
)
ΒΒ  
return
ΓΓ 
DBOperation
ΓΓ "
.
ΓΓ" #
Error
ΓΓ# (
;
ΓΓ( )
else
ΔΔ 
{
ΕΕ 
await
ΖΖ  
_fileUploadService
ΖΖ (
.
ΖΖ( )
UploadFilesAsync
ΖΖ) 9
(
ΖΖ9 :

comparable
ΖΖ: D
.
ΖΖD E
Id
ΖΖE G
,
ΖΖG H
Enum
ΖΖI M
.
ΖΖM N
GetName
ΖΖN U
(
ΖΖU V
TableNameEnum
ΖΖV c
.
ΖΖc d!
Comparable_Evidence
ΖΖd w
)
ΖΖw x
,
ΖΖx y
model
ΖΖz 
.ΖΖ €'
comparableEvidenceModelΖΖ€ —
.ΖΖ— 
uploadDocumentΖΖ ¦
,ΖΖ¦ §
modelΖΖ¨ ­
.ΖΖ­ ®'
comparableEvidenceModelΖΖ® Ε
.ΖΖΕ Ζ
	CreatedByΖΖΖ Ο
)ΖΖΟ Π
;ΖΖΠ Ρ
}
ΪΪ 
objUser1
άά 
=
άά !
_valutionrepository
άά *
.
άά* +
GetAll
άά+ 1
(
άά1 2
)
άά2 3
.
άά3 4
Where
άά4 9
(
άά9 :
x
άά: ;
=>
άά< >
x
άά? @
.
άά@ A
	RequestId
άάA J
==
άάK M
model
άάN S
.
άάS T'
valuationAssessementModel
άάT m
.
άάm n
	RequestId
άάn w
)
άάw x
.
άάx y
FirstOrDefaultάάy ‡
(άά‡ 
)άά ‰
;άά‰ 
if
ήή 
(
ήή 
objUser1
ήή 
!=
ήή 
null
ήή  
)
ήή  !
{
ίί 
string
ΰΰ $
MainAssesmentTableName
ΰΰ -
=
ΰΰ. /
Enum
ΰΰ0 4
.
ΰΰ4 5
GetName
ΰΰ5 <
(
ΰΰ< =
TableNameEnum
ΰΰ= J
.
ΰΰJ K#
Valuation_Assessement
ΰΰK `
)
ΰΰ` a
;
ΰΰa b
int
αα #
MainTableAssesmentKey
αα )
=
αα* +
objUser1
αα, 4
.
αα4 5
Id
αα5 7
;
αα7 8 
ValuationAssesment
δδ "
	OldEntity
δδ# ,
=
δδ- .
null
δδ/ 3
;
δδ3 4
	OldEntity
εε 
=
εε !
_valutionrepository
εε /
.
εε/ 0
GetNoTracking
εε0 =
(
εε= >
objUser1
εε> F
.
εεF G
Id
εεG I
)
εεI J
;
εεJ K
objUser1
ηη 
=
ηη !
_valutionrepository
ηη .
.
ηη. /
Get
ηη/ 2
(
ηη2 3
objUser1
ηη3 ;
.
ηη; <
Id
ηη< >
)
ηη> ?
;
ηη? @
if
ιι 
(
ιι 
objUser1
ιι 
!=
ιι 
null
ιι  $
)
ιι$ %
{
κκ 
objUser1
λλ 
.
λλ 
MarketValue
λλ (
=
λλ) *
model
λλ+ 0
.
λλ0 1'
valuationAssessementModel
λλ1 J
.
λλJ K
MarketValue
λλK V
;
λλV W
objUser1
μμ 
.
μμ 

MarketRate
μμ '
=
μμ( )
model
μμ* /
.
μμ/ 0'
valuationAssessementModel
μμ0 I
.
μμI J

MarketRate
μμJ T
;
μμT U
objUser1
νν 
.
νν 
LifeOfBuilding
νν +
=
νν, -
model
νν. 3
.
νν3 4'
valuationAssessementModel
νν4 M
.
ννM N
LifeOfBuilding
ννN \
;
νν\ ]
objUser1
ξξ 
.
ξξ "
AnnualMaintainceCost
ξξ 1
=
ξξ2 3
model
ξξ4 9
.
ξξ9 :'
valuationAssessementModel
ξξ: S
.
ξξS T"
AnnualMaintainceCost
ξξT h
;
ξξh i
objUser1
οο 
.
οο 

Insuarance
οο '
=
οο( )
model
οο* /
.
οο/ 0'
valuationAssessementModel
οο0 I
.
οοI J

Insuarance
οοJ T
;
οοT U
objUser1
ππ 
.
ππ 
InsuranceDetails
ππ -
=
ππ. /
model
ππ0 5
.
ππ5 6'
valuationAssessementModel
ππ6 O
.
ππO P
InsuranceDetails
ππP `
;
ππ` a
objUser1
ρρ 
.
ρρ 

ModifiedBy
ρρ '
=
ρρ( )
model
ρρ* /
.
ρρ/ 0'
valuationAssessementModel
ρρ0 I
.
ρρI J

ModifiedBy
ρρJ T
;
ρρT U!
_valutionrepository
ττ '
.
ττ' (
UpdateAsync
ττ( 3
(
ττ3 4
objUser1
ττ4 <
)
ττ< =
;
ττ= >
await
φφ 
_unitOfWork
φφ %
.
φφ% &
SaveChangesAsync
φφ& 6
(
φφ6 7
)
φφ7 8
;
φφ8 9
await
ωω 
_auditLogService
ωω *
.
ωω* +
CreateAuditLog
ωω+ 9
<
ωω9 : 
ValuationAssesment
ωω: L
>
ωωL M
(
ωωM N!
AuditActionTypeEnum
ωωN a
.
ωωa b
Update
ωωb h
,
ωωh i
	OldEntity
ωωj s
,
ωωs t
objUser1
ωωu }
,
ωω} ~%
MainAssesmentTableNameωω •
,ωω• –%
MainTableAssesmentKeyωω— ¬
)ωω¬ ­
;ωω­ ®
}
ϊϊ 
}
ϋϋ 
else
όό 
{
ύύ 
objUser1
ώώ 
=
ώώ 
_mapperFactory
ώώ )
.
ώώ) *
Get
ώώ* -
<
ώώ- .'
ValuationAssessementModel
ώώ. G
,
ώώG H 
ValuationAssesment
ώώI [
>
ώώ[ \
(
ώώ\ ]
model
ώώ] b
.
ώώb c'
valuationAssessementModel
ώώc |
)
ώώ| }
;
ώώ} ~
objUser1
€€ 
.
€€ 
	CreatedBy
€€ "
=
€€# $
model
€€% *
.
€€* +'
valuationAssessementModel
€€+ D
.
€€D E
	CreatedBy
€€E N
;
€€N O!
_valutionrepository
‚‚ #
.
‚‚# $
AddAsync
‚‚$ ,
(
‚‚, -
objUser1
‚‚- 5
)
‚‚5 6
;
‚‚6 7
await
ƒƒ 
_unitOfWork
ƒƒ !
.
ƒƒ! "
SaveChangesAsync
ƒƒ" 2
(
ƒƒ2 3
)
ƒƒ3 4
;
ƒƒ4 5
}
„„ 
if
‡‡ 
(
‡‡ 
objUser1
‡‡ 
.
‡‡ 
Id
‡‡ 
==
‡‡ 
$num
‡‡  
)
‡‡  !
return
 
DBOperation
 "
.
" #
Error
# (
;
( )
else
‰‰ 
{
 
await
‹‹  
_fileUploadService
‹‹ (
.
‹‹( )
UploadFilesAsync
‹‹) 9
(
‹‹9 :
objUser1
‹‹: B
.
‹‹B C
Id
‹‹C E
,
‹‹E F
Enum
‹‹G K
.
‹‹K L
GetName
‹‹L S
(
‹‹S T
TableNameEnum
‹‹T a
.
‹‹a b#
Valuation_Assessement
‹‹b w
)
‹‹w x
,
‹‹x y
model
‹‹z 
.‹‹ €)
valuationAssessementModel‹‹€ ™
.‹‹™ 
uploadDocument‹‹ ¨
,‹‹¨ ©
model‹‹ª ―
.‹‹― °)
valuationAssessementModel‹‹° Ι
.‹‹Ι Κ
	CreatedBy‹‹Κ Σ
)‹‹Σ Τ
;‹‹Τ Υ
}
 
return
££ 
DBOperation
££ 
.
££ 
Success
££ &
;
££& '
}
¤¤ 	
public
¦¦ 
async
¦¦ 
Task
¦¦ 
<
¦¦ "
SiteDescriptionModel
¦¦ .
>
¦¦. /$
GetSiteDescriptionList
¦¦0 F
(
¦¦F G
int
¦¦G J
	requestId
¦¦K T
)
¦¦T U
{
§§ 	
DbParameter
¨¨ 
[
¨¨ 
]
¨¨ 
osqlParameter2
¨¨ (
=
¨¨) *
{
©© 
new
ªª 
DbParameter
ªª #
(
ªª# $
$str
ªª$ /
,
ªª/ 0
	requestId
ªª1 :
,
ªª: ;
	SqlDbType
ªª< E
.
ªªE F
Int
ªªF I
)
ªªI J
,
ªªJ K
}
«« 
;
«« 
var
­­ 
quottationList
­­ 
=
­­  
EltizamDBHelper
­­! 0
.
­­0 1'
ExecuteSingleMappedReader
­­1 J
<
­­J K"
SiteDescriptionModel
­­K _
>
­­_ `
(
­­` a 
ProcedureMetastore
­­a s
.
­­s t5
&usp_Site_GetSiteDescriptionByRequestId­­t 
,­­ › 
DatabaseConnection
®®  2
.
®®2 3

ConnString
®®3 =
,
®®= >
System
®®? E
.
®®E F
Data
®®F J
.
®®J K
CommandType
®®K V
.
®®V W
StoredProcedure
®®W f
,
®®f g
osqlParameter2
®®h v
)
®®v w
;
®®w x
return
°° 
quottationList
°° !
;
°°! "
}
³³ 	
public
µµ 
async
µµ 
Task
µµ 
<
µµ 
DBOperation
µµ %
>
µµ% &#
SideDescriptionUpsert
µµ' <
(
µµ< ="
SiteDescriptionModel
µµ= Q
model
µµR W
)
µµW X
{
¶¶ 	&
ValuationSiteDescription
ΈΈ $
objUser
ΈΈ% ,
;
ΈΈ, -
MasterDocument
ΉΉ 
objUserDocument
ΉΉ *
;
ΉΉ* +
string
»» 
MainTableName
»»  
=
»»! "
Enum
»»# '
.
»»' (
GetName
»»( /
(
»»/ 0
TableNameEnum
»»0 =
.
»»= >
SiteDescription
»»> M
)
»»M N
;
»»N O
int
ΌΌ 
MainTableKey
ΌΌ 
=
ΌΌ 
model
ΌΌ $
.
ΌΌ$ %
Id
ΌΌ% '
;
ΌΌ' (
if
ΏΏ 
(
ΏΏ 
model
ΏΏ 
.
ΏΏ 
Id
ΏΏ 
>
ΏΏ 
$num
ΏΏ 
)
ΏΏ 
{
ΐΐ &
ValuationSiteDescription
ΒΒ (
	OldEntity
ΒΒ) 2
=
ΒΒ3 4
null
ΒΒ5 9
;
ΒΒ9 :
	OldEntity
ΓΓ 
=
ΓΓ 
_siteRepository
ΓΓ +
.
ΓΓ+ ,
GetNoTracking
ΓΓ, 9
(
ΓΓ9 :
model
ΓΓ: ?
.
ΓΓ? @
Id
ΓΓ@ B
)
ΓΓB C
;
ΓΓC D
objUser
ΕΕ 
=
ΕΕ 
_siteRepository
ΕΕ )
.
ΕΕ) *
Get
ΕΕ* -
(
ΕΕ- .
model
ΕΕ. 3
.
ΕΕ3 4
Id
ΕΕ4 6
)
ΕΕ6 7
;
ΕΕ7 8
if
ΗΗ 
(
ΗΗ 
objUser
ΗΗ 
!=
ΗΗ 
null
ΗΗ #
)
ΗΗ# $
{
ΘΘ 
objUser
ΙΙ 
.
ΙΙ 
Location
ΙΙ $
=
ΙΙ% &
model
ΙΙ' ,
.
ΙΙ, -
Location
ΙΙ- 5
;
ΙΙ5 6
objUser
ΚΚ 
.
ΚΚ 
InternalArea
ΚΚ (
=
ΚΚ) *
model
ΚΚ+ 0
.
ΚΚ0 1
InternalArea
ΚΚ1 =
;
ΚΚ= >
objUser
ΛΛ 
.
ΛΛ 
ExternalArea
ΛΛ (
=
ΛΛ) *
model
ΛΛ+ 0
.
ΛΛ0 1
ExternalArea
ΛΛ1 =
;
ΛΛ= >
objUser
ΜΜ 
.
ΜΜ 
Floor
ΜΜ !
=
ΜΜ" #
model
ΜΜ$ )
.
ΜΜ) *
Floor
ΜΜ* /
;
ΜΜ/ 0
objUser
ΝΝ 
.
ΝΝ 
Room
ΝΝ  
=
ΝΝ! "
model
ΝΝ# (
.
ΝΝ( )
Room
ΝΝ) -
;
ΝΝ- .
objUser
ΞΞ 
.
ΞΞ 
Bedrooms
ΞΞ $
=
ΞΞ% &
model
ΞΞ' ,
.
ΞΞ, -
Bedrooms
ΞΞ- 5
;
ΞΞ5 6
objUser
ΟΟ 
.
ΟΟ 
Storage
ΟΟ #
=
ΟΟ$ %
model
ΟΟ& +
.
ΟΟ+ ,
Storage
ΟΟ, 3
;
ΟΟ3 4
objUser
ΠΠ 
.
ΠΠ 
Quantity
ΠΠ $
=
ΠΠ% &
model
ΠΠ' ,
.
ΠΠ, -
Quantity
ΠΠ- 5
;
ΠΠ5 6
objUser
ΡΡ 
.
ΡΡ 
AdditionComment
ΡΡ +
=
ΡΡ, -
model
ΡΡ. 3
.
ΡΡ3 4
AdditionComment
ΡΡ4 C
;
ΡΡC D
objUser
ÒÒ 
.
ÒÒ 
PropertyCondition
ÒÒ -
=
ÒÒ. /
model
ÒÒ0 5
.
ÒÒ5 6
PropertyCondition
ÒÒ6 G
;
ÒÒG H
objUser
ΣΣ 
.
ΣΣ 
AdditionalNotes
ΣΣ +
=
ΣΣ, -
model
ΣΣ. 3
.
ΣΣ3 4
AdditionalNotes
ΣΣ4 C
;
ΣΣC D
objUser
ΤΤ 
.
ΤΤ 
Others
ΤΤ "
=
ΤΤ# $
model
ΤΤ% *
.
ΤΤ* +
Others
ΤΤ+ 1
;
ΤΤ1 2
objUser
ΦΦ 
.
ΦΦ 

ModifiedBy
ΦΦ &
=
ΦΦ' (
model
ΦΦ) .
.
ΦΦ. /

ModifiedBy
ΦΦ/ 9
;
ΦΦ9 :
_siteRepository
ΩΩ #
.
ΩΩ# $
UpdateAsync
ΩΩ$ /
(
ΩΩ/ 0
objUser
ΩΩ0 7
)
ΩΩ7 8
;
ΩΩ8 9
await
ΫΫ 
_unitOfWork
ΫΫ %
.
ΫΫ% &
SaveChangesAsync
ΫΫ& 6
(
ΫΫ6 7
)
ΫΫ7 8
;
ΫΫ8 9
await
ήή 
_auditLogService
ήή *
.
ήή* +
CreateAuditLog
ήή+ 9
<
ήή9 :&
ValuationSiteDescription
ήή: R
>
ήήR S
(
ήήS T!
AuditActionTypeEnum
ήήT g
.
ήήg h
Update
ήήh n
,
ήήn o
	OldEntity
ήήp y
,
ήήy z
objUserήή{ ‚
,ήή‚ ƒ
MainTableNameήή„ ‘
,ήή‘ ’
MainTableKeyήή“ 
)ήή  
;ήή  ΅
}
ίί 
}
ΰΰ 
else
αα 
{
ββ 
objUser
γγ 
=
γγ 
_mapperFactory
γγ (
.
γγ( )
Get
γγ) ,
<
γγ, -"
SiteDescriptionModel
γγ- A
,
γγA B&
ValuationSiteDescription
γγC [
>
γγ[ \
(
γγ\ ]
model
γγ] b
)
γγb c
;
γγc d
objUser
εε 
.
εε 
	CreatedBy
εε !
=
εε" #
model
εε$ )
.
εε) *
	CreatedBy
εε* 3
;
εε3 4
_siteRepository
ηη 
.
ηη  
AddAsync
ηη  (
(
ηη( )
objUser
ηη) 0
)
ηη0 1
;
ηη1 2
await
θθ 
_unitOfWork
θθ !
.
θθ! "
SaveChangesAsync
θθ" 2
(
θθ2 3
)
θθ3 4
;
θθ4 5
}
ιι 
if
μμ 
(
μμ 
objUser
μμ 
.
μμ 
Id
μμ 
==
μμ 
$num
μμ 
)
μμ  
return
νν 
DBOperation
νν "
.
νν" #
Error
νν# (
;
νν( )
else
ξξ 
{
οο 
await
ππ  
_fileUploadService
ππ (
.
ππ( )
UploadFilesAsync
ππ) 9
(
ππ9 :
objUser
ππ: A
.
ππA B
Id
ππB D
,
ππD E
Enum
ππF J
.
ππJ K
GetName
ππK R
(
ππR S
TableNameEnum
ππS `
.
ππ` a
SiteDescription
ππa p
)
ππp q
,
ππq r
model
ππs x
.
ππx y
uploadDocumentππy ‡
,ππ‡ 
modelππ‰ 
.ππ 
	CreatedByππ 
)ππ ™
;ππ™ 
}
ƒƒ 
return
…… 
DBOperation
…… 
.
…… 
Success
…… &
;
……& '
}
†† 	
public
‡‡ 
async
‡‡ 
Task
‡‡ 
<
‡‡ 
DBOperation
‡‡ %
>
‡‡% &
EvidenceUpsert
‡‡' 5
(
‡‡5 6%
ComparableEvidenceModel
‡‡6 M
evidence
‡‡N V
)
‡‡V W
{
 	)
ValuationComparableEvidence
 '
objUser
( /
;
/ 0
MasterAddress
‹‹ 
objUserAddress
‹‹ (
;
‹‹( )!
MasterQualification
 "
objUserQualification
  4
;
4 5
MasterDocument
 
objUserDocument
 *
;
* +
string
 
MainTableName
  
=
! "
Enum
# '
.
' (
GetName
( /
(
/ 0
TableNameEnum
0 =
.
= >!
Comparable_Evidence
> Q
)
Q R
;
R S
int
 
MainTableKey
 
=
 
evidence
 '
.
' (
Id
( *
;
* +
if
““ 
(
““ 
evidence
““ 
.
““ 
Id
““ 
>
““ 
$num
““ 
)
““  
{
”” )
ValuationComparableEvidence
–– +
	OldEntity
––, 5
=
––6 7
null
––8 <
;
––< =
	OldEntity
—— 
=
—— 
_repository
—— '
.
——' (
GetNoTracking
——( 5
(
——5 6
evidence
——6 >
.
——> ?
Id
——? A
)
——A B
;
——B C
objUser
™™ 
=
™™ 
_repository
™™ %
.
™™% &
Get
™™& )
(
™™) *
evidence
™™* 2
.
™™2 3
Id
™™3 5
)
™™5 6
;
™™6 7
if
›› 
(
›› 
objUser
›› 
!=
›› 
null
›› #
)
››# $
{
 
objUser
 
.
 
Type
  
=
! "
evidence
# +
.
+ ,
Type
, 0
;
0 1
objUser
 
.
 
Size
  
=
! "
evidence
# +
.
+ ,
Size
, 0
;
0 1
objUser
 
.
 
Remarks
 #
=
$ %
evidence
& .
.
. /
Remarks
/ 6
;
6 7
objUser
   
.
   
RateSqFt
   $
=
  % &
evidence
  ' /
.
  / 0
RateSqFt
  0 8
;
  8 9
objUser
΅΅ 
.
΅΅ 
Price
΅΅ !
=
΅΅" #
evidence
΅΅$ ,
.
΅΅, -
Price
΅΅- 2
;
΅΅2 3
objUser
££ 
.
££ 

ModifiedBy
££ &
=
££' (
evidence
££) 1
.
££1 2

ModifiedBy
££2 <
;
££< =
_repository
¦¦ 
.
¦¦  
UpdateAsync
¦¦  +
(
¦¦+ ,
objUser
¦¦, 3
)
¦¦3 4
;
¦¦4 5
await
¨¨ 
_unitOfWork
¨¨ %
.
¨¨% &
SaveChangesAsync
¨¨& 6
(
¨¨6 7
)
¨¨7 8
;
¨¨8 9
await
«« 
_auditLogService
«« *
.
««* +
CreateAuditLog
««+ 9
<
««9 :)
ValuationComparableEvidence
««: U
>
««U V
(
««V W!
AuditActionTypeEnum
««W j
.
««j k
Update
««k q
,
««q r
	OldEntity
««s |
,
««| }
objUser««~ …
,««… †
MainTableName««‡ ”
,««” •
MainTableKey««– Ά
)««Ά £
;««£ ¤
}
¬¬ 
}
­­ 
else
®® 
{
―― 
objUser
°° 
=
°° 
_mapperFactory
°° (
.
°°( )
Get
°°) ,
<
°°, -%
ComparableEvidenceModel
°°- D
,
°°D E)
ValuationComparableEvidence
°°F a
>
°°a b
(
°°b c
evidence
°°c k
)
°°k l
;
°°l m
objUser
²² 
.
²² 
	CreatedBy
²² !
=
²²" #
evidence
²²$ ,
.
²², -
	CreatedBy
²²- 6
;
²²6 7
objUser
³³ 
.
³³ 
IsActive
³³  
=
³³! "
evidence
³³# +
.
³³+ ,
IsActive
³³, 4
;
³³4 5
_repository
µµ 
.
µµ 
AddAsync
µµ $
(
µµ$ %
objUser
µµ% ,
)
µµ, -
;
µµ- .
await
¶¶ 
_unitOfWork
¶¶ !
.
¶¶! "
SaveChangesAsync
¶¶" 2
(
¶¶2 3
)
¶¶3 4
;
¶¶4 5
}
·· 
if
ΊΊ 
(
ΊΊ 
objUser
ΊΊ 
.
ΊΊ 
Id
ΊΊ 
==
ΊΊ 
$num
ΊΊ 
)
ΊΊ  
return
»» 
DBOperation
»» "
.
»»" #
Error
»»# (
;
»»( )
else
ΌΌ 
{
½½ 
if
ΏΏ 
(
ΏΏ 
evidence
ΏΏ 
.
ΏΏ 
uploadDocument
ΏΏ +
!=
ΏΏ, .
null
ΏΏ/ 3
)
ΏΏ3 4
{
ΐΐ 
foreach
ΑΑ 
(
ΑΑ 
var
ΑΑ  
doc
ΑΑ! $
in
ΑΑ% '
evidence
ΑΑ( 0
.
ΑΑ0 1
uploadDocument
ΑΑ1 ?
)
ΑΑ? @
{
ΒΒ 
objUserDocument
ΓΓ '
=
ΓΓ( )
_mapperFactory
ΓΓ* 8
.
ΓΓ8 9
Get
ΓΓ9 <
<
ΓΓ< =!
MasterDocumentModel
ΓΓ= P
,
ΓΓP Q
MasterDocument
ΓΓR `
>
ΓΓ` a
(
ΓΓa b
doc
ΓΓb e
)
ΓΓe f
;
ΓΓf g
objUserDocument
ΔΔ '
.
ΔΔ' (
IsActive
ΔΔ( 0
=
ΔΔ1 2
doc
ΔΔ3 6
.
ΔΔ6 7
IsActive
ΔΔ7 ?
;
ΔΔ? @
objUserDocument
ΕΕ '
.
ΕΕ' (

TableKeyId
ΕΕ( 2
=
ΕΕ3 4
objUser
ΕΕ5 <
.
ΕΕ< =
Id
ΕΕ= ?
;
ΕΕ? @
objUserDocument
ΖΖ '
.
ΖΖ' (
	TableName
ΖΖ( 1
=
ΖΖ2 3
Enum
ΖΖ4 8
.
ΖΖ8 9
GetName
ΖΖ9 @
(
ΖΖ@ A
TableNameEnum
ΖΖA N
.
ΖΖN O!
Comparable_Evidence
ΖΖO b
)
ΖΖb c
;
ΖΖc d
objUserDocument
ΗΗ '
.
ΗΗ' (
DocumentName
ΗΗ( 4
=
ΗΗ5 6
doc
ΗΗ7 :
.
ΗΗ: ;
DocumentName
ΗΗ; G
;
ΗΗG H
objUserDocument
ΘΘ '
.
ΘΘ' (
FileName
ΘΘ( 0
=
ΘΘ1 2
doc
ΘΘ3 6
.
ΘΘ6 7
FileName
ΘΘ7 ?
;
ΘΘ? @
objUserDocument
ΙΙ '
.
ΙΙ' (
FilePath
ΙΙ( 0
=
ΙΙ1 2
doc
ΙΙ3 6
.
ΙΙ6 7
FilePath
ΙΙ7 ?
;
ΙΙ? @
objUserDocument
ΚΚ '
.
ΚΚ' (
FileType
ΚΚ( 0
=
ΚΚ1 2
doc
ΚΚ3 6
.
ΚΚ6 7
FileType
ΚΚ7 ?
;
ΚΚ? @
objUserDocument
ΛΛ '
.
ΛΛ' (
	CreatedBy
ΛΛ( 1
=
ΛΛ2 3
evidence
ΛΛ4 <
.
ΛΛ< =
	CreatedBy
ΛΛ= F
;
ΛΛF G!
_documentRepository
ΝΝ +
.
ΝΝ+ ,
AddAsync
ΝΝ, 4
(
ΝΝ4 5
objUserDocument
ΝΝ5 D
)
ΝΝD E
;
ΝΝE F
await
ΞΞ 
_unitOfWork
ΞΞ )
.
ΞΞ) *
SaveChangesAsync
ΞΞ* :
(
ΞΞ: ;
)
ΞΞ; <
;
ΞΞ< =
}
ΟΟ 
}
ΠΠ 
}
ΡΡ 
return
ΣΣ 
DBOperation
ΣΣ 
.
ΣΣ 
Success
ΣΣ &
;
ΣΣ& '
}
ΤΤ 	
public
ΦΦ 
async
ΦΦ 
Task
ΦΦ 
<
ΦΦ 
DBOperation
ΦΦ %
>
ΦΦ% &
AssesmentUpsert
ΦΦ' 6
(
ΦΦ6 7'
ValuationAssessementModel
ΦΦ7 P
	assesment
ΦΦQ Z
)
ΦΦZ [
{
ΧΧ 	 
ValuationAssesment
ΩΩ 
objUser1
ΩΩ '
;
ΩΩ' (
MasterAddress
ΪΪ 
objUserAddress
ΪΪ (
;
ΪΪ( )!
MasterQualification
ΫΫ "
objUserQualification
ΫΫ  4
;
ΫΫ4 5
MasterDocument
άά 
objUserDocument
άά *
;
άά* +
string
ήή 
MainTableName
ήή  
=
ήή! "
Enum
ήή# '
.
ήή' (
GetName
ήή( /
(
ήή/ 0
TableNameEnum
ήή0 =
.
ήή= >#
Valuation_Assessement
ήή> S
)
ήήS T
;
ήήT U
int
ίί 
MainTableKey
ίί 
=
ίί 
	assesment
ίί (
.
ίί( )
Id
ίί) +
;
ίί+ ,
if
ββ 
(
ββ 
	assesment
ββ 
.
ββ 
Id
ββ 
>
ββ 
$num
ββ  
)
ββ  !
{
γγ  
ValuationAssesment
εε "
	OldEntity
εε# ,
=
εε- .
null
εε/ 3
;
εε3 4
	OldEntity
ζζ 
=
ζζ !
_valutionrepository
ζζ /
.
ζζ/ 0
GetNoTracking
ζζ0 =
(
ζζ= >
	assesment
ζζ> G
.
ζζG H
Id
ζζH J
)
ζζJ K
;
ζζK L
objUser1
θθ 
=
θθ !
_valutionrepository
θθ .
.
θθ. /
Get
θθ/ 2
(
θθ2 3
	assesment
θθ3 <
.
θθ< =
Id
θθ= ?
)
θθ? @
;
θθ@ A
if
κκ 
(
κκ 
objUser1
κκ 
!=
κκ 
null
κκ  $
)
κκ$ %
{
λλ 
objUser1
μμ 
.
μμ 
MarketValue
μμ (
=
μμ) *
	assesment
μμ+ 4
.
μμ4 5
MarketValue
μμ5 @
;
μμ@ A
objUser1
νν 
.
νν 

MarketRate
νν '
=
νν( )
	assesment
νν* 3
.
νν3 4

MarketRate
νν4 >
;
νν> ?
objUser1
ξξ 
.
ξξ 
LifeOfBuilding
ξξ +
=
ξξ, -
	assesment
ξξ. 7
.
ξξ7 8
LifeOfBuilding
ξξ8 F
;
ξξF G
objUser1
οο 
.
οο "
AnnualMaintainceCost
οο 1
=
οο2 3
	assesment
οο4 =
.
οο= >"
AnnualMaintainceCost
οο> R
;
οοR S
objUser1
ππ 
.
ππ 

Insuarance
ππ '
=
ππ( )
	assesment
ππ* 3
.
ππ3 4

Insuarance
ππ4 >
;
ππ> ?
objUser1
ςς 
.
ςς 

ModifiedBy
ςς '
=
ςς( )
	assesment
ςς* 3
.
ςς3 4

ModifiedBy
ςς4 >
;
ςς> ?!
_valutionrepository
υυ '
.
υυ' (
UpdateAsync
υυ( 3
(
υυ3 4
objUser1
υυ4 <
)
υυ< =
;
υυ= >
await
χχ 
_unitOfWork
χχ %
.
χχ% &
SaveChangesAsync
χχ& 6
(
χχ6 7
)
χχ7 8
;
χχ8 9
await
ϊϊ 
_auditLogService
ϊϊ *
.
ϊϊ* +
CreateAuditLog
ϊϊ+ 9
<
ϊϊ9 : 
ValuationAssesment
ϊϊ: L
>
ϊϊL M
(
ϊϊM N!
AuditActionTypeEnum
ϊϊN a
.
ϊϊa b
Update
ϊϊb h
,
ϊϊh i
	OldEntity
ϊϊj s
,
ϊϊs t
objUser1
ϊϊu }
,
ϊϊ} ~
MainTableNameϊϊ 
,ϊϊ 
MainTableKeyϊϊ 
)ϊϊ ›
;ϊϊ› 
}
ϋϋ 
}
όό 
else
ύύ 
{
ώώ 
objUser1
ÿÿ 
=
ÿÿ 
_mapperFactory
ÿÿ )
.
ÿÿ) *
Get
ÿÿ* -
<
ÿÿ- .'
ValuationAssessementModel
ÿÿ. G
,
ÿÿG H 
ValuationAssesment
ÿÿI [
>
ÿÿ[ \
(
ÿÿ\ ]
	assesment
ÿÿ] f
)
ÿÿf g
;
ÿÿg h
objUser1
 
.
 
	CreatedBy
 "
=
# $
	assesment
% .
.
. /
	CreatedBy
/ 8
;
8 9!
_valutionrepository
ƒƒ #
.
ƒƒ# $
AddAsync
ƒƒ$ ,
(
ƒƒ, -
objUser1
ƒƒ- 5
)
ƒƒ5 6
;
ƒƒ6 7
await
„„ 
_unitOfWork
„„ !
.
„„! "
SaveChangesAsync
„„" 2
(
„„2 3
)
„„3 4
;
„„4 5
}
…… 
if
 
(
 
objUser1
 
.
 
Id
 
==
 
$num
  
)
  !
return
‰‰ 
DBOperation
‰‰ "
.
‰‰" #
Error
‰‰# (
;
‰‰( )
else
 
{
‹‹ 
if
 
(
 
	assesment
 
.
 
uploadDocument
 ,
!=
- /
null
0 4
)
4 5
{
 
foreach
 
(
 
var
  
doc
! $
in
% '
	assesment
( 1
.
1 2
uploadDocument
2 @
)
@ A
{
 
objUserDocument
‘‘ '
=
‘‘( )
_mapperFactory
‘‘* 8
.
‘‘8 9
Get
‘‘9 <
<
‘‘< =!
MasterDocumentModel
‘‘= P
,
‘‘P Q
MasterDocument
‘‘R `
>
‘‘` a
(
‘‘a b
doc
‘‘b e
)
‘‘e f
;
‘‘f g
objUserDocument
’’ '
.
’’' (
IsActive
’’( 0
=
’’1 2
doc
’’3 6
.
’’6 7
IsActive
’’7 ?
;
’’? @
objUserDocument
““ '
.
““' (

TableKeyId
““( 2
=
““3 4
objUser1
““5 =
.
““= >
Id
““> @
;
““@ A
objUserDocument
”” '
.
””' (
	TableName
””( 1
=
””2 3
Enum
””4 8
.
””8 9
GetName
””9 @
(
””@ A
TableNameEnum
””A N
.
””N O#
Valuation_Assessement
””O d
)
””d e
;
””e f
objUserDocument
•• '
.
••' (
DocumentName
••( 4
=
••5 6
doc
••7 :
.
••: ;
DocumentName
••; G
;
••G H
objUserDocument
–– '
.
––' (
FileName
––( 0
=
––1 2
doc
––3 6
.
––6 7
FileName
––7 ?
;
––? @
objUserDocument
—— '
.
——' (
FilePath
——( 0
=
——1 2
doc
——3 6
.
——6 7
FilePath
——7 ?
;
——? @
objUserDocument
 '
.
' (
FileType
( 0
=
1 2
doc
3 6
.
6 7
FileType
7 ?
;
? @
objUserDocument
™™ '
.
™™' (
	CreatedBy
™™( 1
=
™™2 3
	assesment
™™4 =
.
™™= >
	CreatedBy
™™> G
;
™™G H!
_documentRepository
›› +
.
››+ ,
AddAsync
››, 4
(
››4 5
objUserDocument
››5 D
)
››D E
;
››E F
await
 
_unitOfWork
 )
.
) *
SaveChangesAsync
* :
(
: ;
)
; <
;
< =
}
 
}
 
}
 
return
΅΅ 
DBOperation
΅΅ 
.
΅΅ 
Success
΅΅ &
;
΅΅& '
}
ΆΆ 	
public
¥¥ 
async
¥¥ 
Task
¥¥ 
<
¥¥ 
DBOperation
¥¥ %
>
¥¥% &
DeleteDocument
¥¥' 5
(
¥¥5 6
int
¥¥6 9
id
¥¥: <
,
¥¥< =
int
¥¥= @
?
¥¥@ A
by
¥¥B D
)
¥¥D E
{
¦¦ 	
if
§§ 
(
§§ 
id
§§ 
>
§§ 
$num
§§ 
)
§§ 
{
¨¨ 
var
ªª 
	entityDoc
ªª 
=
ªª !
_documentRepository
ªª  3
.
ªª3 4
Get
ªª4 7
(
ªª7 8
id
ªª8 :
)
ªª: ;
;
ªª; <
if
«« 
(
«« 
	entityDoc
«« 
!=
««  
null
««! %
)
««% &
{
¬¬ !
_documentRepository
­­ '
.
­­' (
Remove
­­( .
(
­­. /
	entityDoc
­­/ 8
)
­­8 9
;
­­9 :
await
®® 
_unitOfWork
®® %
.
®®% &
SaveChangesAsync
®®& 6
(
®®6 7
)
®®7 8
;
®®8 9
}
―― 
}
°° 
return
²² 
DBOperation
²² 
.
²² 
Success
²² &
;
²²& '
}
³³ 	
}
·· 
}ΈΈ ς
ND:\EltizamLive\Eltizam.Business.Core\Implementation\ValuationInvoiceService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
Implementation  .
{ 
public 

class #
ValuationInvoiceService (
:) *$
IValuationInvoiceService+ C
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IMapperFactory '
_mapperFactory( 6
;6 7
private 
IRepository 
< 
ValuationInvoice ,
>, -
_repository. 9
;9 :
private 
IRepository 
< #
ValuationPaymentInvoice 3
>3 4
_invoiceRepo5 A
;A B
private 
IRepository 
< 
MasterDocument *
>* +
_repositoryDocument, ?
{@ A
getB E
;E F
setG J
;J K
}L M
private 
readonly 
IHelper  
_helper! (
;( )
private 
readonly &
IMasterNotificationService 3 
_notificationService4 H
;H I
private 
readonly 
IRepository $
<$ %

MasterUser% /
>/ 0!
_masteruserrepository1 F
;F G
private 
readonly 
IAuditLogService )
_auditLogService* :
;: ;
private   
IRepository   
<   !
MasterValuationStatus   1
>  1 2
_statusrepository  3 D
{  E F
get  G J
;  J K
set  L O
;  O P
}  Q R
public$$ #
ValuationInvoiceService$$ &
($$& '
IUnitOfWork$$' 2

unitOfWork$$3 =
,$$= >
IMapperFactory$$? M
mapperFactory$$N [
,$$[ \
IHelper$$] d
helper$$e k
,$$k l
IAuditLogService$$m }
auditLogService	$$~ 
,
$$ (
IMasterNotificationService
$$ ©!
notificationService
$$ª ½
)
$$½ Ύ
{%% 	
_unitOfWork&& 
=&& 

unitOfWork&& $
;&&$ %
_mapperFactory'' 
='' 
mapperFactory'' *
;''* +
_repository(( 
=(( 
_unitOfWork(( %
.((% &
GetRepository((& 3
<((3 4
ValuationInvoice((4 D
>((D E
(((E F
)((F G
;((G H
_repositoryDocument)) 
=))  !
_unitOfWork))" -
.))- .
GetRepository)). ;
<)); <
MasterDocument))< J
>))J K
())K L
)))L M
;))M N
_helper** 
=** 
helper** 
;** 
_auditLogService++ 
=++ 
auditLogService++ .
;++. / 
_notificationService,,  
=,,! "
notificationService,,# 6
;,,6 7!
_masteruserrepository-- !
=--" #
_unitOfWork--$ /
.--/ 0
GetRepository--0 =
<--= >

MasterUser--> H
>--H I
(--I J
)--J K
;--K L
_statusrepository.. 
=.. 
_unitOfWork..  +
...+ ,
GetRepository.., 9
<..9 :!
MasterValuationStatus..: O
>..O P
(..P Q
)..Q R
;..R S
_invoiceRepo// 
=// 
_unitOfWork// &
.//& '
GetRepository//' 4
<//4 5#
ValuationPaymentInvoice//5 L
>//L M
(//M N
)//N O
;//O P
}00 	
public44 
async44 
Task44 
<44 
List44 
<44 %
ValuationInvoiceListModel44 8
>448 9
>449 :
GetInvoiceList44; I
(44I J
int44J M
	requestId44N W
)44W X
{55 	
DbParameter66 
[66 
]66 
osqlParameter266 (
=66) *
{77 
new88 
DbParameter88 
(88  
$str88  +
,88+ ,
	requestId88- 6
,886 7
	SqlDbType888 A
.88A B
Int88B E
)88E F
,88F G
}99 
;99 
var;; 
invoiceList;; 
=;; 
EltizamDBHelper;; -
.;;- .
ExecuteMappedReader;;. A
<;;A B%
ValuationInvoiceListModel;;B [
>;;[ \
(;;\ ]
ProcedureMetastore;;] o
.;;o p.
!usp_Invoice_GetInvoiceByRequestId	;;p ‘
,
;;‘ ’
DatabaseConnection<< 0
.<<0 1

ConnString<<1 ;
,<<; <
System<<= C
.<<C D
Data<<D H
.<<H I
CommandType<<I T
.<<T U
StoredProcedure<<U d
,<<d e
osqlParameter2<<f t
)<<t u
;<<u v
return>> 
invoiceList>> 
;>> 
}?? 	
publicAA 
asyncAA 
TaskAA 
<AA 
DBOperationAA %
>AA% &
UpsertAA' -
(AA- .%
ValuationInvoiceListModelAA. G
entityInvoiceAAH U
)AAU V
{BB 	
ValuationInvoiceCC 

objInvoiceCC '
;CC' (
MasterDocumentDD 
objDocumentDD &
;DD& '
stringEE 
MainTableNameEE  
=EE! "
EnumEE# '
.EE' (
GetNameEE( /
(EE/ 0
TableNameEnumEE0 =
.EE= >
ValuationInvoiceEE> N
)EEN O
;EEO P
intFF 
MainTableKeyFF 
=FF 
entityInvoiceFF ,
.FF, -
IdFF- /
;FF/ 0
ifHH 
(HH 
entityInvoiceHH 
.HH 
IdHH  
>HH! "
$numHH# $
)HH$ %
{II 
ValuationInvoiceJJ  
	OldEntityJJ! *
=JJ+ ,
nullJJ- 1
;JJ1 2
	OldEntityKK 
=KK 
_repositoryKK '
.KK' (
GetNoTrackingKK( 5
(KK5 6
entityInvoiceKK6 C
.KKC D
IdKKD F
)KKF G
;KKG H

objInvoiceMM 
=MM 
_repositoryMM (
.MM( )
GetMM) ,
(MM, -
entityInvoiceMM- :
.MM: ;
IdMM; =
)MM= >
;MM> ?
ifOO 
(OO 

objInvoiceOO "
!=OO# %
nullOO& *
)OO* +
{PP 

objInvoiceQQ "
.QQ" #
ReferenceNoQQ# .
=QQ/ 0

objInvoiceQQ1 ;
.QQ; <
ReferenceNoQQ< G
;QQG H

objInvoiceRR "
.RR" #
ValuationRequestIdRR# 5
=RR6 7

objInvoiceRR8 B
.RRB C
ValuationRequestIdRRC U
;RRU V

objInvoiceSS "
.SS" #
TransactionModeIdSS# 4
=SS5 6
entityInvoiceSS7 D
.SSD E
TransactionModeIdSSE V
;SSV W

objInvoiceTT "
.TT" #
TransactionStatusIdTT# 6
=TT7 8
entityInvoiceTT9 F
.TTF G
TransactionStatusIdTTG Z
;TTZ [

objInvoiceUU "
.UU" #
AmountUU# )
=UU* +
entityInvoiceUU, 9
.UU9 :
AmountUU: @
;UU@ A

objInvoiceVV "
.VV" #

CheckNumerVV# -
=VV. /
entityInvoiceVV0 =
.VV= >

CheckNumerVV> H
;VVH I

objInvoiceWW "
.WW" #
CheckBankNameWW# 0
=WW1 2
entityInvoiceWW3 @
.WW@ A
CheckBankNameWWA N
;WWN O

objInvoiceXX "
.XX" #
	CheckDateXX# ,
=XX- .
entityInvoiceXX/ <
.XX< =
	CheckDateXX= F
;XXF G

objInvoiceYY "
.YY" #

CardNumberYY# -
=YY. /
entityInvoiceYY0 =
.YY= >

CardNumberYY> H
;YYH I

objInvoiceZZ "
.ZZ" #
CardBankNameZZ# /
=ZZ0 1
entityInvoiceZZ2 ?
.ZZ? @
CardBankNameZZ@ L
;ZZL M

objInvoice[[ "
.[[" #
CardHolderName[[# 1
=[[2 3
entityInvoice[[4 A
.[[A B
CardHolderName[[B P
;[[P Q

objInvoice\\ "
.\\" #

ExpireDate\\# -
=\\. /
entityInvoice\\0 =
.\\= >

ExpireDate\\> H
;\\H I

objInvoice]] "
.]]" #
AccountBankName]]# 2
=]]3 4
entityInvoice]]5 B
.]]B C
AccountBankName]]C R
;]]R S

objInvoice^^ "
.^^" #
AccountHolderName^^# 4
=^^5 6
entityInvoice^^7 D
.^^D E
AccountHolderName^^E V
;^^V W

objInvoice__ "
.__" #
Note__# '
=__( )
entityInvoice__* 7
.__7 8
Note__8 <
;__< =

objInvoice`` "
.``" #
ModifiedDate``# /
=``0 1
AppConstants``2 >
.``> ?
DateTime``? G
;``G H

objInvoiceaa "
.aa" #

ModifiedByaa# -
=aa. /
entityInvoiceaa0 =
.aa= >

ModifiedByaa> H
;aaH I
_repositorycc 
.cc  
UpdateAsynccc  +
(cc+ ,

objInvoicecc, 6
)cc6 7
;cc7 8
awaitdd 
_unitOfWorkdd %
.dd% &
SaveChangesAsyncdd& 6
(dd6 7
)dd7 8
;dd8 9
awaitgg 
_auditLogServicegg *
.gg* +
CreateAuditLoggg+ 9
<gg9 :
ValuationInvoicegg: J
>ggJ K
(ggK L
AuditActionTypeEnumggL _
.gg_ `
Updategg` f
,ggf g
	OldEntityggh q
,ggq r

objInvoiceggs }
,gg} ~
MainTableName	gg 
,
gg 
MainTableKey
gg 
)
gg ›
;
gg› 
}hh 
elseii 
{jj 
returnkk 
DBOperationkk &
.kk& '
NotFoundkk' /
;kk/ 0
}ll 
}mm 
elsenn 
{oo 

objInvoicepp 
=pp 
_mapperFactorypp +
.pp+ ,
Getpp, /
<pp/ 0%
ValuationInvoiceListModelpp0 I
,ppI J
ValuationInvoiceppK [
>pp[ \
(pp\ ]
entityInvoicepp] j
)ppj k
;ppk l
varrr 
lastReqrr 
=rr 
_repositoryrr )
.rr) *
GetAllrr* 0
(rr0 1
)rr1 2
.rr2 3
OrderByDescendingrr3 D
(rrD E
arrE F
=>rrG I
arrJ K
.rrK L
IdrrL N
)rrN O
.rrO P
FirstOrDefaultrrP ^
(rr^ _
)rr_ `
;rr` a
vartt 
idtt 
=tt 
stringtt #
.tt# $
Formattt$ *
(tt* +
$strtt+ 4
,tt4 5
AppConstantstt6 B
.ttB C
ID_PaymentRequestttC T
,ttT U

objInvoicettV `
.tt` a
ValuationRequestIdtta s
)tts t
;ttt u

objInvoiceuu 
.uu 
ReferenceNouu *
=uu+ ,
stringuu- 3
.uu3 4
Formatuu4 :
(uu: ;
$struu; C
,uuC D
iduuE G
,uuG H
lastRequuI P
?uuP Q
.uuQ R
IduuR T
+uuU V
$numuuW X
)uuX Y
;uuY Z

objInvoiceww 
.ww 
CreatedDateww &
=ww' (
AppConstantsww) 5
.ww5 6
DateTimeww6 >
;ww> ?

objInvoicexx 
.xx 
	CreatedByxx $
=xx% &
entityInvoicexx' 4
.xx4 5
	CreatedByxx5 >
??xx? A
$numxxB C
;xxC D
_repositoryzz 
.zz 
AddAsynczz $
(zz$ %

objInvoicezz% /
)zz/ 0
;zz0 1
await{{ 
_unitOfWork{{ !
.{{! "
SaveChangesAsync{{" 2
({{2 3
){{3 4
;{{4 5
}|| 
if~~ 
(~~ 

objInvoice~~ 
.~~ 
Id~~ 
==~~  
$num~~! "
)~~" #
return 
DBOperation "
." #
Error# (
;( )
else
 
{
‚‚ 
if
ƒƒ 
(
ƒƒ 

objInvoice
ƒƒ 
.
ƒƒ 
Id
ƒƒ !
>
ƒƒ" #
$num
ƒƒ$ %
&&
ƒƒ& (
entityInvoice
ƒƒ) 6
.
ƒƒ6 7

InvoiceIds
ƒƒ7 A
.
ƒƒA B
Length
ƒƒB H
>
ƒƒI J
$num
ƒƒK L
)
ƒƒL M
{
„„ 
DbParameter
…… 
[
……  
]
……  !
osqlParameter
……" /
=
……0 1
{
†† 
new
‡‡ 
DbParameter
‡‡ '
(
‡‡' (
$str
‡‡( 3
,
‡‡3 4

objInvoice
‡‡8 B
.
‡‡B C
Id
‡‡C E
,
‡‡E F
	SqlDbType
‡‡G P
.
‡‡P Q
Int
‡‡Q T
)
‡‡T U
,
‡‡U V
new
 
DbParameter
 '
(
' (
$str
( 3
,
3 4
entityInvoice
7 D
.
D E
	CreatedBy
E N
,
N O
	SqlDbType
P Y
.
Y Z
Int
Z ]
)
] ^
,
^ _
new
‰‰ 
DbParameter
‰‰ '
(
‰‰' (
$str
‰‰( ;
,
‰‰; <
entityInvoice
‰‰? L
.
‰‰L M

InvoiceIds
‰‰M W
,
‰‰W X
	SqlDbType
‰‰Y b
.
‰‰b c
Int
‰‰c f
)
‰‰f g
,
‰‰g h
}
 
;
 
EltizamDBHelper
 #
.
# $
ExecuteNonQuery
$ 3
(
3 4 
ProcedureMetastore
4 F
.
F G4
&usp_ValuationPayment_UpsertInvoicesMap
G m
,
m n!
DatabaseConnectiono 
. ‚

ConnString‚ 
, 
CommandType ™
.™ 
StoredProcedure ©
,© ª
osqlParameter« Έ
)Έ Ή
;Ή Ί
}
 
if
 
(
 
entityInvoice
 !
.
! "
uploadDocument
" 0
!=
1 3
null
4 8
)
8 9
{
 
foreach
‘‘ 
(
‘‘ 
var
‘‘  
doc
‘‘! $
in
‘‘% '
entityInvoice
‘‘( 5
.
‘‘5 6
uploadDocument
‘‘6 D
)
‘‘D E
{
’’ 
objDocument
““ #
=
““$ %
_mapperFactory
““& 4
.
““4 5
Get
““5 8
<
““8 9!
MasterDocumentModel
““9 L
,
““L M
MasterDocument
““N \
>
““\ ]
(
““] ^
doc
““^ a
)
““a b
;
““b c
objDocument
”” #
.
””# $
IsActive
””$ ,
=
””- .
doc
””/ 2
.
””2 3
IsActive
””3 ;
;
””; <
objDocument
•• #
.
••# $

TableKeyId
••$ .
=
••/ 0

objInvoice
••1 ;
.
••; <
Id
••< >
;
••> ?
objDocument
–– #
.
––# $
	TableName
––$ -
=
––. /
Enum
––0 4
.
––4 5
GetName
––5 <
(
––< =
TableNameEnum
––= J
.
––J K
ValuationInvoice
––K [
)
––[ \
;
––\ ]
objDocument
—— #
.
——# $
DocumentName
——$ 0
=
——1 2
doc
——3 6
.
——6 7
DocumentName
——7 C
;
——C D
objDocument
 #
.
# $
FileName
$ ,
=
- .
doc
/ 2
.
2 3
FileName
3 ;
;
; <
objDocument
™™ #
.
™™# $
FilePath
™™$ ,
=
™™- .
doc
™™/ 2
.
™™2 3
FilePath
™™3 ;
;
™™; <
objDocument
 #
.
# $
FileType
$ ,
=
- .
doc
/ 2
.
2 3
FileType
3 ;
;
; <
objDocument
›› #
.
››# $
	CreatedBy
››$ -
=
››. /

objInvoice
››0 :
.
››: ;
	CreatedBy
››; D
;
››D E!
_repositoryDocument
 +
.
+ ,
AddAsync
, 4
(
4 5
objDocument
5 @
)
@ A
;
A B
await
 
_unitOfWork
 )
.
) *
SaveChangesAsync
* :
(
: ;
)
; <
;
< =
}
 
}
   
}
΅΅ 
try
ΆΆ 
{
££ 
var
¤¤ 
statusid
¤¤ 
=
¤¤ 
_statusrepository
¤¤ 0
.
¤¤0 1
GetAll
¤¤1 7
(
¤¤7 8
)
¤¤8 9
.
¤¤9 :
Where
¤¤: ?
(
¤¤? @
x
¤¤@ A
=>
¤¤B D
x
¤¤E F
.
¤¤F G
Status
¤¤G M
==
¤¤N P
$str
¤¤Q \
)
¤¤\ ]
.
¤¤] ^
Select
¤¤^ d
(
¤¤d e
x
¤¤e f
=>
¤¤g i
x
¤¤j k
.
¤¤k l
Id
¤¤l n
)
¤¤n o
.
¤¤o p
FirstOrDefault
¤¤p ~
(
¤¤~ 
)¤¤ €
;¤¤€ "
_notificationService
¥¥ $
.
¥¥$ %*
UpdateValuationRequestStatus
¥¥% A
(
¥¥A B
statusid
¥¥B J
,
¥¥J K

objInvoice
¥¥L V
.
¥¥V W 
ValuationRequestId
¥¥W i
)
¥¥i j
;
¥¥j k
string
§§ 
?
§§ 
username
§§  
=
§§! "#
_masteruserrepository
§§# 8
.
§§8 9
GetAll
§§9 ?
(
§§? @
)
§§@ A
.
§§A B
Where
§§B G
(
§§G H
x
§§H I
=>
§§J L
x
§§M N
.
§§N O
Id
§§O Q
==
§§R T

objInvoice
§§U _
.
§§_ `
	CreatedBy
§§` i
)
§§i j
.
§§j k
Select
§§k q
(
§§q r
x
§§r s
=>
§§t v
x
§§w x
.
§§x y
UserName§§y 
)§§ ‚
.§§‚ ƒ
FirstOrDefault§§ƒ ‘
(§§‘ ’
)§§’ “
;§§“ ”
string
¨¨ 
transactionstatus
¨¨ (
=
¨¨) *
_statusrepository
¨¨+ <
.
¨¨< =
Get
¨¨= @
(
¨¨@ A
x
¨¨A B
=>
¨¨C E
x
¨¨F G
.
¨¨G H
Id
¨¨H J
==
¨¨K M

objInvoice
¨¨N X
.
¨¨X Y!
TransactionStatusId
¨¨Y l
)
¨¨l m
.
¨¨m n
Status
¨¨n t
;
¨¨t u!
TransactionModeEnum
©© #
mode
©©$ (
=
©©) *
(
©©+ ,!
TransactionModeEnum
©©, ?
)
©©? @

objInvoice
©©@ J
.
©©J K
TransactionModeId
©©K \
;
©©\ ]
string
ªª 
?
ªª 
paymentmode
ªª #
=
ªª$ %
Enum
ªª& *
.
ªª* +
GetName
ªª+ 2
(
ªª2 3
typeof
ªª3 9
(
ªª9 :!
TransactionModeEnum
ªª: M
)
ªªM N
,
ªªN O
mode
ªªP T
)
ªªT U
;
ªªU V
string
¬¬ 
strHtml
¬¬ 
=
¬¬  
File
¬¬! %
.
¬¬% &
ReadAllText
¬¬& 1
(
¬¬1 2
$str
¬¬2 v
)
¬¬v w
;
¬¬w x
strHtml
­­ 
=
­­ 
strHtml
­­ !
.
­­! "
Replace
­­" )
(
­­) *
$str
­­* 4
,
­­4 5

objInvoice
­­6 @
.
­­@ A
CreatedDate
­­A L
.
­­L M
ToString
­­M U
(
­­U V
$str
­­V c
)
­­c d
)
­­d e
;
­­e f
strHtml
®® 
=
®® 
strHtml
®® !
.
®®! "
Replace
®®" )
(
®®) *
$str
®®* 4
,
®®4 5

objInvoice
®®6 @
.
®®@ A
Amount
®®A G
.
®®G H
ToString
®®H P
(
®®P Q
)
®®Q R
)
®®R S
;
®®S T
strHtml
―― 
=
―― 
strHtml
―― !
.
――! "
Replace
――" )
(
――) *
$str
――* 9
,
――9 :
transactionstatus
――; L
)
――L M
;
――M N
strHtml
°° 
=
°° 
strHtml
°° !
.
°°! "
Replace
°°" )
(
°°) *
$str
°°* 9
,
°°9 :
paymentmode
°°; F
)
°°F G
;
°°G H
strHtml
±± 
=
±± 
strHtml
±± !
.
±±! "
Replace
±±" )
(
±±) *
$str
±±* 2
,
±±2 3

objInvoice
±±4 >
.
±±> ?
TransactionDate
±±? N
?
±±N O
.
±±O P
ToString
±±P X
(
±±X Y
$str
±±Y f
)
±±f g
)
±±g h
;
±±h i
var
³³ 
notificationModel
³³ %
=
³³& '"
_notificationService
³³( <
.
³³< =*
GetValuationNotificationData
³³= Y
(
³³Y Z!
RecepientActionEnum
³³Z m
.
³³m n
InvoiceCreation
³³n }
,
³³} ~

objInvoice³³ ‰
.³³‰ "
ValuationRequestId³³ 
)³³ 
;³³ 
notificationModel
΄΄ !
.
΄΄! "
Body
΄΄" &
=
΄΄' (
strHtml
΄΄) 0
;
΄΄0 1
notificationModel
µµ !
.
µµ! "
Subject
µµ" )
=
µµ* +

EnumHelper
µµ, 6
.
µµ6 7
GetDescription
µµ7 E
(
µµE F!
RecepientActionEnum
µµF Y
.
µµY Z
InvoiceCreation
µµZ i
)
µµi j
;
µµj k
await
·· "
_notificationService
·· *
.
··* +
	SendEmail
··+ 4
(
··4 5
notificationModel
··5 F
)
··F G
;
··G H
}
ΈΈ 
catch
ΉΉ 
(
ΉΉ 
	Exception
ΉΉ 
ex
ΉΉ 
)
ΉΉ  
{
ΊΊ 
}
»» 
return
ΌΌ 
DBOperation
ΌΌ 
.
ΌΌ 
Success
ΌΌ &
;
ΌΌ& '
}
½½ 	
public
ΏΏ 
async
ΏΏ 
Task
ΏΏ 
<
ΏΏ '
ValuationInvoiceListModel
ΏΏ 3
>
ΏΏ3 4
GetInvoiceById
ΏΏ5 C
(
ΏΏC D
int
ΏΏD G
id
ΏΏH J
)
ΏΏJ K
{
ΐΐ 	
var
ΑΑ 
	tableName
ΑΑ 
=
ΑΑ 
Enum
ΑΑ  
.
ΑΑ  !
GetName
ΑΑ! (
(
ΑΑ( )
TableNameEnum
ΑΑ) 6
.
ΑΑ6 7
ValuationInvoice
ΑΑ7 G
)
ΑΑG H
;
ΑΑH I
var
ΔΔ 
_quatationEntity
ΔΔ  
=
ΔΔ! "
_mapperFactory
ΔΔ# 1
.
ΔΔ1 2
Get
ΔΔ2 5
<
ΔΔ5 6
ValuationInvoice
ΔΔ6 F
,
ΔΔF G'
ValuationInvoiceListModel
ΔΔH a
>
ΔΔa b
(
ΔΔb c
await
ΔΔc h
_repository
ΔΔi t
.
ΔΔt u
GetAsync
ΔΔu }
(
ΔΔ} ~
idΔΔ~ €
)ΔΔ€ 
)ΔΔ ‚
;ΔΔ‚ ƒ
if
ΖΖ 
(
ΖΖ 
_quatationEntity
ΖΖ  
!=
ΖΖ! #
null
ΖΖ$ (
)
ΖΖ( )
{
ΗΗ 
DbParameter
ΘΘ 
[
ΘΘ 
]
ΘΘ 
osqlParameter2
ΘΘ ,
=
ΘΘ- .
{
ΙΙ 
new
ΚΚ 
DbParameter
ΚΚ #
(
ΚΚ# $
AppConstants
ΚΚ$ 0
.
ΚΚ0 1

TableKeyId
ΚΚ1 ;
,
ΚΚ; <
id
ΚΚ= ?
,
ΚΚ? @
	SqlDbType
ΚΚA J
.
ΚΚJ K
Int
ΚΚK N
)
ΚΚN O
,
ΚΚO P
new
ΛΛ 
DbParameter
ΛΛ #
(
ΛΛ# $
AppConstants
ΛΛ$ 0
.
ΛΛ0 1
	TableName
ΛΛ1 :
,
ΛΛ: ;
	tableName
ΛΛ= F
,
ΛΛF G
	SqlDbType
ΛΛH Q
.
ΛΛQ R
VarChar
ΛΛR Y
)
ΛΛY Z
,
ΛΛZ [
}
ΜΜ 
;
ΜΜ 
var
ΞΞ  
quatationDocuments
ΞΞ &
=
ΞΞ' (
EltizamDBHelper
ΞΞ) 8
.
ΞΞ8 9!
ExecuteMappedReader
ΞΞ9 L
<
ΞΞL M!
MasterDocumentModel
ΞΞM `
>
ΞΞ` a
(
ΞΞa b 
ProcedureMetastore
ΞΞb t
.
ΞΞt u3
$usp_Document_GetDocumentByTableKeyIdΞΞu ™
,ΞΞ™  
DatabaseConnection
ΟΟ$ 6
.
ΟΟ6 7

ConnString
ΟΟ7 A
,
ΟΟA B
System
ΟΟC I
.
ΟΟI J
Data
ΟΟJ N
.
ΟΟN O
CommandType
ΟΟO Z
.
ΟΟZ [
StoredProcedure
ΟΟ[ j
,
ΟΟj k
osqlParameter2
ΟΟl z
)
ΟΟz {
;
ΟΟ{ |
if
ΡΡ 
(
ΡΡ  
quatationDocuments
ΡΡ &
!=
ΡΡ' )
null
ΡΡ* .
)
ΡΡ. /
_quatationEntity
ÒÒ $
.
ÒÒ$ %
	Documents
ÒÒ% .
=
ÒÒ/ 0 
quatationDocuments
ÒÒ1 C
;
ÒÒC D
}
ΣΣ 
return
ΤΤ 
_quatationEntity
ΤΤ #
;
ΤΤ# $
}
ΥΥ 	
public
ΧΧ 
async
ΧΧ 
Task
ΧΧ 
<
ΧΧ 
DBOperation
ΧΧ %
>
ΧΧ% &
InvoiceDelete
ΧΧ' 4
(
ΧΧ4 5
int
ΧΧ5 8
id
ΧΧ9 ;
,
ΧΧ; <
int
ΧΧ= @
?
ΧΧ@ A
by
ΧΧB D
)
ΧΧD E
{
ΨΨ 	
var
ΩΩ 
entityInvoice
ΩΩ 
=
ΩΩ 
_repository
ΩΩ  +
.
ΩΩ+ ,
Get
ΩΩ, /
(
ΩΩ/ 0
x
ΩΩ0 1
=>
ΩΩ2 4
x
ΩΩ5 6
.
ΩΩ6 7
Id
ΩΩ7 9
==
ΩΩ: <
id
ΩΩ= ?
)
ΩΩ? @
;
ΩΩ@ A
entityInvoice
ΪΪ 
.
ΪΪ 

ModifiedBy
ΪΪ $
=
ΪΪ% &
by
ΪΪ' )
??
ΪΪ* ,
entityInvoice
ΪΪ- :
.
ΪΪ: ;

ModifiedBy
ΪΪ; E
;
ΪΪE F
if
ΫΫ 
(
ΫΫ 
entityInvoice
ΫΫ 
==
ΫΫ  
null
ΫΫ! %
)
ΫΫ% &
return
άά 
DBOperation
άά "
.
άά" #
NotFound
άά# +
;
άά+ ,
_repository
ήή 
.
ήή 
Remove
ήή 
(
ήή 
entityInvoice
ήή ,
)
ήή, -
;
ήή- .
await
ΰΰ 
_unitOfWork
ΰΰ 
.
ΰΰ 
SaveChangesAsync
ΰΰ .
(
ΰΰ. /
)
ΰΰ/ 0
;
ΰΰ0 1
return
ββ 
DBOperation
ββ 
.
ββ 
Success
ββ &
;
ββ& '
}
γγ 	
public
εε 
async
εε 
Task
εε 
<
εε 
DBOperation
εε %
>
εε% &
DeleteDocument
εε' 5
(
εε5 6
int
εε6 9
id
εε: <
,
εε< =
int
εε> A
?
εεA B
by
εεC E
)
εεE F
{
ζζ 	
if
ηη 
(
ηη 
id
ηη 
>
ηη 
$num
ηη 
)
ηη 
{
θθ 
var
κκ 
	entityDoc
κκ 
=
κκ !
_repositoryDocument
κκ  3
.
κκ3 4
Get
κκ4 7
(
κκ7 8
id
κκ8 :
)
κκ: ;
;
κκ; <
if
λλ 
(
λλ 
	entityDoc
λλ 
!=
λλ  
null
λλ! %
)
λλ% &
{
μμ !
_repositoryDocument
νν '
.
νν' (
Remove
νν( .
(
νν. /
	entityDoc
νν/ 8
)
νν8 9
;
νν9 :
await
ξξ 
_unitOfWork
ξξ %
.
ξξ% &
SaveChangesAsync
ξξ& 6
(
ξξ6 7
)
ξξ7 8
;
ξξ8 9
}
οο 
}
ππ 
return
ςς 
DBOperation
ςς 
.
ςς 
Success
ςς &
;
ςς& '
}
σσ 	
public
υυ 
async
υυ 
Task
υυ 
<
υυ 
DBOperation
υυ %
>
υυ% &
UpsertInvoice
υυ' 4
(
υυ4 5*
ValuationInvoicePaymentModel
υυ5 Q
invoice
υυR Y
)
υυY Z
{
φφ 	
try
χχ 
{
ψψ %
ValuationPaymentInvoice
ωω '
objIvoiceType
ωω( 5
;
ωω5 6
if
όό 
(
όό 
invoice
όό 
.
όό 
Id
όό 
>
όό  
$num
όό! "
)
όό" #
{
ύύ 
objIvoiceType
ÿÿ !
=
ÿÿ" #
_invoiceRepo
ÿÿ$ 0
.
ÿÿ0 1
Get
ÿÿ1 4
(
ÿÿ4 5
invoice
ÿÿ5 <
.
ÿÿ< =
Id
ÿÿ= ?
)
ÿÿ? @
;
ÿÿ@ A
if
‚‚ 
(
‚‚ 
objIvoiceType
‚‚ %
!=
‚‚& (
null
‚‚) -
)
‚‚- .
{
ƒƒ 
objIvoiceType
„„ %
.
„„% &
	InvoiceNo
„„& /
=
„„0 1
invoice
„„2 9
.
„„9 :
	InvoiceNo
„„: C
;
„„C D
objIvoiceType
…… %
.
……% &
Amount
……& ,
=
……- .
invoice
……/ 6
.
……6 7
Amount
……7 =
;
……= >
objIvoiceType
†† %
.
††% &
Balance
††& -
=
††. /
invoice
††0 7
.
††7 8
Balance
††8 ?
;
††? @
objIvoiceType
‡‡ %
.
‡‡% &
Note
‡‡& *
=
‡‡+ ,
invoice
‡‡- 4
.
‡‡4 5
Note
‡‡5 9
;
‡‡9 :
objIvoiceType
 %
.
% &
TransactionModeId
& 7
=
8 9
invoice
: A
.
A B
TransactionModeId
B S
;
S T
objIvoiceType
‰‰ %
.
‰‰% &
TransactionDate
‰‰& 5
=
‰‰6 7
invoice
‰‰8 ?
.
‰‰? @
TransactionDate
‰‰@ O
;
‰‰O P
objIvoiceType
‹‹ %
.
‹‹% &

ModifiedBy
‹‹& 0
=
‹‹1 2
invoice
‹‹3 :
.
‹‹: ;

ModifiedBy
‹‹; E
;
‹‹E F
_invoiceRepo
 $
.
$ %
UpdateAsync
% 0
(
0 1
objIvoiceType
1 >
)
> ?
;
? @
}
 
else
 
{
‘‘ 
return
““ 
DBOperation
““ *
.
““* +
NotFound
““+ 3
;
““3 4
}
”” 
}
•• 
else
–– 
{
—— 
var
 
id
 
=
 
string
 #
.
# $
Format
$ *
(
* +
$str
+ 4
,
4 5
AppConstants
6 B
.
B C
ID_InvoiceRequest
C T
,
T U
invoice
V ]
.
] ^ 
ValuationRequestId
^ p
)
p q
;
q r
var
™™ 
lastReq
™™ 
=
™™  !
_invoiceRepo
™™" .
.
™™. /
GetAll
™™/ 5
(
™™5 6
)
™™6 7
.
™™7 8
OrderByDescending
™™8 I
(
™™I J
a
™™J K
=>
™™L N
a
™™O P
.
™™P Q
Id
™™Q S
)
™™S T
.
™™T U
FirstOrDefault
™™U c
(
™™c d
)
™™d e
;
™™e f
objIvoiceType
›› !
=
››" #
_mapperFactory
››$ 2
.
››2 3
Get
››3 6
<
››6 7*
ValuationInvoicePaymentModel
››7 S
,
››S T%
ValuationPaymentInvoice
››U l
>
››l m
(
››m n
invoice
››n u
)
››u v
;
››v w
objIvoiceType
 !
.
! "
ReferenceNo
" -
=
. /
string
0 6
.
6 7
Format
7 =
(
= >
$str
> F
,
F G
id
H J
,
J K
lastReq
L S
?
S T
.
T U
Id
U W
+
X Y
$num
Z [
)
[ \
;
\ ]
objIvoiceType
   !
.
  ! "
	CreatedBy
  " +
=
  , -
invoice
  . 5
.
  5 6
	CreatedBy
  6 ?
;
  ? @
_invoiceRepo
££  
.
££  !
AddAsync
££! )
(
££) *
objIvoiceType
££* 7
)
££7 8
;
££8 9
}
¤¤ 
await
§§ 
_unitOfWork
§§ !
.
§§! "
SaveChangesAsync
§§" 2
(
§§2 3
)
§§3 4
;
§§4 5
if
ªª 
(
ªª 
objIvoiceType
ªª !
.
ªª! "
Id
ªª" $
==
ªª% '
$num
ªª( )
)
ªª) *
return
«« 
DBOperation
«« &
.
««& '
Error
««' ,
;
««, -
return
­­ 
DBOperation
­­ "
.
­­" #
Success
­­# *
;
­­* +
}
®® 
catch
―― 
(
―― 
	Exception
―― 
ex
―― 
)
――  
{
°° 
throw
±± 
ex
±± 
;
±± 
}
²² 
}
³³ 	
public
µµ 
async
µµ 
Task
µµ 
<
µµ *
ValuationInvoicePaymentModel
µµ 6
>
µµ6 7 
PaymentInvoiceById
µµ8 J
(
µµJ K
int
µµK N
id
µµO Q
)
µµQ R
{
¶¶ 	
var
·· 
_LocationEntity
·· 
=
··  !
new
··" %*
ValuationInvoicePaymentModel
··& B
(
··B C
)
··C D
;
··D E
_LocationEntity
ΈΈ 
=
ΈΈ 
_mapperFactory
ΈΈ ,
.
ΈΈ, -
Get
ΈΈ- 0
<
ΈΈ0 1%
ValuationPaymentInvoice
ΈΈ1 H
,
ΈΈH I*
ValuationInvoicePaymentModel
ΈΈJ f
>
ΈΈf g
(
ΈΈg h
await
ΈΈh m
_invoiceRepo
ΈΈn z
.
ΈΈz {
GetAsyncΈΈ{ ƒ
(ΈΈƒ „
idΈΈ„ †
)ΈΈ† ‡
)ΈΈ‡ 
;ΈΈ ‰
return
ΊΊ 
_LocationEntity
ΊΊ "
;
ΊΊ" #
}
»» 	
public
ΎΎ 
async
ΎΎ 
Task
ΎΎ 
<
ΎΎ 
List
ΎΎ 
<
ΎΎ *
ValuationInvoicePaymentModel
ΎΎ ;
>
ΎΎ; <
>
ΎΎ< =#
GetPaymentInvoiceById
ΎΎ> S
(
ΎΎS T
int
ΎΎT W
	requestId
ΎΎX a
)
ΎΎa b
{
ΏΏ 	
DbParameter
ΐΐ 
[
ΐΐ 
]
ΐΐ 
osqlParameter
ΐΐ '
=
ΐΐ( )
{
ΑΑ 
new
ΒΒ 
DbParameter
ΒΒ 
(
ΒΒ  
$str
ΒΒ  +
,
ΒΒ+ ,
	requestId
ΒΒ- 6
,
ΒΒ6 7
	SqlDbType
ΒΒ8 A
.
ΒΒA B
Int
ΒΒB E
)
ΒΒE F
,
ΒΒF G
}
ΓΓ 
;
ΓΓ 
var
ΔΔ 
res
ΔΔ 
=
ΔΔ 
EltizamDBHelper
ΔΔ %
.
ΔΔ% &!
ExecuteMappedReader
ΔΔ& 9
<
ΔΔ9 :*
ValuationInvoicePaymentModel
ΔΔ: V
>
ΔΔV W
(
ΔΔW X 
ProcedureMetastore
ΔΔX j
.
ΔΔj k1
"usp_ValuationInvoice_SearchAllListΔΔk 
,ΔΔ  
DatabaseConnection
ΕΕ (
.
ΕΕ( )

ConnString
ΕΕ) 3
,
ΕΕ3 4
CommandType
ΕΕ5 @
.
ΕΕ@ A
StoredProcedure
ΕΕA P
,
ΕΕP Q
osqlParameter
ΕΕR _
)
ΕΕ_ `
;
ΕΕ` a
return
ΗΗ 
res
ΗΗ 
;
ΗΗ 
}
ΘΘ 	
public
ΛΛ 
async
ΛΛ 
Task
ΛΛ 
<
ΛΛ 
DBOperation
ΛΛ %
>
ΛΛ% &"
DeletePyamentInvoice
ΛΛ' ;
(
ΛΛ; <
int
ΛΛ< ?
id
ΛΛ@ B
,
ΛΛB C
int
ΛΛD G
?
ΛΛG H
by
ΛΛI K
)
ΛΛK L
{
ΜΜ 	
if
ΝΝ 
(
ΝΝ 
id
ΝΝ 
>
ΝΝ 
$num
ΝΝ 
)
ΝΝ 
{
ΞΞ 
var
ΠΠ 
payment
ΠΠ 
=
ΠΠ 
_invoiceRepo
ΠΠ *
.
ΠΠ* +
Get
ΠΠ+ .
(
ΠΠ. /
id
ΠΠ/ 1
)
ΠΠ1 2
;
ΠΠ2 3
if
ΡΡ 
(
ΡΡ 
payment
ΡΡ 
!=
ΡΡ 
null
ΡΡ #
)
ΡΡ# $
{
ÒÒ 
_invoiceRepo
ΣΣ  
.
ΣΣ  !
Remove
ΣΣ! '
(
ΣΣ' (
payment
ΣΣ( /
)
ΣΣ/ 0
;
ΣΣ0 1
await
ΤΤ 
_unitOfWork
ΤΤ %
.
ΤΤ% &
SaveChangesAsync
ΤΤ& 6
(
ΤΤ6 7
)
ΤΤ7 8
;
ΤΤ8 9
}
ΥΥ 
}
ΦΦ 
return
ΩΩ 
DBOperation
ΩΩ 
.
ΩΩ 
Success
ΩΩ &
;
ΩΩ& '
}
ΪΪ 	
}
έέ 
}ήή ς
PD:\EltizamLive\Eltizam.Business.Core\Implementation\ValuationQuatationService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
Implementation  .
{ 
public 

class %
ValuationQuatationService *
:+ ,&
IValuationQuatationService- G
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IMapperFactory '
_mapperFactory( 6
;6 7
private 
IRepository 
< 
ValuationQuotation .
>. /
_repository0 ;
{< =
get> A
;A B
setC F
;F G
}H I
private 
IRepository 
< 
MasterDocument *
>* +
_repositoryDocument, ?
{@ A
getB E
;E F
setG J
;J K
}L M
private 
IRepository 
< )
ValuationRequestApproverLevel 9
>9 :$
_repositoryApproverLevel; S
{T U
getV Y
;Y Z
set[ ^
;^ _
}` a
private 
readonly 
IHelper  
_helper! (
;( )
private 
readonly 
IAuditLogService )
_auditLogService* :
;: ;
private 
readonly 
int 
? 
_LoginUserId *
;* +
private 
readonly &
IMasterNotificationService 3 
_notificationService4 H
;H I
private   
readonly   
IHostingEnvironment   ,
_hostingEnvironment  - @
;  @ A
private!! 
readonly!! 
IRepository!! $
<!!$ %

MasterUser!!% /
>!!/ 0!
_masteruserrepository!!1 F
;!!F G
private"" 
IRepository"" 
<"" !
MasterValuationStatus"" 1
>""1 2
_statusrepository""3 D
{""E F
get""G J
;""J K
set""L O
;""O P
}""Q R
public&& %
ValuationQuatationService&& (
(&&( )
IUnitOfWork&&) 4

unitOfWork&&5 ?
,&&? @
IMapperFactory&&A O
mapperFactory&&P ]
,&&] ^
IHelper&&_ f
helper&&g m
,&&m n
IAuditLogService&&o 
auditLogService
&&€ 
,
&& (
IMasterNotificationService
&&‘ «!
notificationService
&&¬ Ώ
)
&&Ώ ΐ
{'' 	
_unitOfWork(( 
=(( 

unitOfWork(( $
;(($ %
_mapperFactory)) 
=)) 
mapperFactory)) *
;))* +
_repository** 
=** 
_unitOfWork** %
.**% &
GetRepository**& 3
<**3 4
ValuationQuotation**4 F
>**F G
(**G H
)**H I
;**I J
_repositoryDocument++ 
=++  !
_unitOfWork++" -
.++- .
GetRepository++. ;
<++; <
MasterDocument++< J
>++J K
(++K L
)++L M
;++M N
_helper,, 
=,, 
helper,, 
;,, 
_auditLogService-- 
=-- 
auditLogService-- .
;--. /
_LoginUserId.. 
=.. 
_helper.. "
..." #
GetLoggedInUser..# 2
(..2 3
)..3 4
?..4 5
...5 6
UserId..6 <
;..< = 
_notificationService//  
=//! "
notificationService//# 6
;//6 7!
_masteruserrepository00 !
=00" #
_unitOfWork00$ /
.00/ 0
GetRepository000 =
<00= >

MasterUser00> H
>00H I
(00I J
)00J K
;00K L
_statusrepository11 
=11 
_unitOfWork11  +
.11+ ,
GetRepository11, 9
<119 :!
MasterValuationStatus11: O
>11O P
(11P Q
)11Q R
;11R S$
_repositoryApproverLevel22 $
=22% &
_unitOfWork22' 2
.222 3
GetRepository223 @
<22@ A)
ValuationRequestApproverLevel22A ^
>22^ _
(22_ `
)22` a
;22a b
}33 	
public88 
async88 
Task88 
<88 
dynamic88 !
>88! "
GetValuationPDFData88# 6
(886 7
int887 :
valId88; @
)88@ A
{99 	
SqlParameter:: 
[:: 
]:: 
osqlParameter:: (
=::) *
{;; 
new<< 
SqlParameter<<  
(<<  !
$str<<! &
,<<& '
valId<<( -
)<<- .
}== 
;== 
DataSet?? 
dsCommercial??  
=??! "
await??# (
_repository??) 4
.??4 5
GetDataSetBySP??5 C
(??C D
$str??D e
,??e f
System??g m
.??m n
Data??n r
.??r s
CommandType??s ~
.??~ 
StoredProcedure	?? 
,
?? 
osqlParameter
?? 
)
?? 
;
?? 
dynamicAA 

pdfObjectsAA 
=AA  
newAA! $
ExpandoObjectAA% 2
(AA2 3
)AA3 4
;AA4 5

pdfObjectsBB 
.BB 
ValuationRequestBB '
=BB( )
dsCommercialBB* 6
.BB6 7
TablesBB7 =
[BB= >
$numBB> ?
]BB? @
;BB@ A
returnCC 
dsCommercialCC 
;CC  
}DD 	
publicFF 
asyncFF 
TaskFF 
<FF 
ListFF 
<FF '
ValuationQuatationListModelFF :
>FF: ;
>FF; <
GetQuatationListFF= M
(FFM N
intFFN Q
	requestIdFFR [
)FF[ \
{GG 	
DbParameterHH 
[HH 
]HH 
osqlParameter2HH (
=HH) *
{II 
newJJ 
DbParameterJJ #
(JJ# $
$strJJ$ /
,JJ/ 0
	requestIdJJ1 :
,JJ: ;
	SqlDbTypeJJ< E
.JJE F
IntJJF I
)JJI J
,JJJ K
}KK 
;KK 
varMM 
quottationListMM 
=MM  
EltizamDBHelperMM! 0
.MM0 1
ExecuteMappedReaderMM1 D
<MMD E'
ValuationQuatationListModelMME `
>MM` a
(MMa b
ProcedureMetastoreMMb t
.MMt u2
%usp_Quotation_GetQuotationByRequestId	MMu 
,
MM ›
DatabaseConnectionNN  2
.NN2 3

ConnStringNN3 =
,NN= >
SystemNN? E
.NNE F
DataNNF J
.NNJ K
CommandTypeNNK V
.NNV W
StoredProcedureNNW f
,NNf g
osqlParameter2NNh v
)NNv w
;NNw x
returnPP 
quottationListPP !
;PP! "
}QQ 	
publicSS 
asyncSS 
TaskSS 
<SS '
ValuationQuatationListModelSS 5
>SS5 6
GetQuatationByIdSS7 G
(SSG H
intSSH K
idSSL N
)SSN O
{TT 	
varUU 
	tableNameUU 
=UU 
EnumUU  
.UU  !
GetNameUU! (
(UU( )
TableNameEnumUU) 6
.UU6 7
ValuationQuotationUU7 I
)UUI J
;UUJ K
varXX 
_quatationEntityXX  
=XX! "
_mapperFactoryXX# 1
.XX1 2
GetXX2 5
<XX5 6
ValuationQuotationXX6 H
,XXH I'
ValuationQuatationListModelXXJ e
>XXe f
(XXf g
awaitXXg l
_repositoryXXm x
.XXx y
GetAsync	XXy 
(
XX ‚
id
XX‚ „
)
XX„ …
)
XX… †
;
XX† ‡
ifZZ 
(ZZ 
_quatationEntityZZ  
!=ZZ! #
nullZZ$ (
)ZZ( )
{[[ 
DbParameter\\ 
[\\ 
]\\ 
osqlParameter2\\ ,
=\\- .
{]] 
new^^ 
DbParameter^^ #
(^^# $
AppConstants^^$ 0
.^^0 1

TableKeyId^^1 ;
,^^; <
id^^= ?
,^^? @
	SqlDbType^^A J
.^^J K
Int^^K N
)^^N O
,^^O P
new__ 
DbParameter__ #
(__# $
AppConstants__$ 0
.__0 1
	TableName__1 :
,__: ;
	tableName__= F
,__F G
	SqlDbType__H Q
.__Q R
VarChar__R Y
)__Y Z
,__Z [
}`` 
;`` 
varbb 
quatationDocumentsbb &
=bb' (
EltizamDBHelperbb) 8
.bb8 9
ExecuteMappedReaderbb9 L
<bbL M
MasterDocumentModelbbM `
>bb` a
(bba b
ProcedureMetastorebbb t
.bbt u1
$usp_Document_GetDocumentByTableKeyId	bbu ™
,
bb™ 
DatabaseConnectioncc$ 6
.cc6 7

ConnStringcc7 A
,ccA B
SystemccC I
.ccI J
DataccJ N
.ccN O
CommandTypeccO Z
.ccZ [
StoredProcedurecc[ j
,ccj k
osqlParameter2ccl z
)ccz {
;cc{ |
ifee 
(ee 
quatationDocumentsee &
!=ee' )
nullee* .
)ee. /
_quatationEntityff $
.ff$ %
	Documentsff% .
=ff/ 0
quatationDocumentsff1 C
;ffC D
}gg 
returnii 
_quatationEntityii #
;ii# $
}jj 	
publicmm 
asyncmm 
Taskmm 
<mm 
DBOperationmm %
>mm% &
QuatationDeletemm' 6
(mm6 7
intmm7 :
idmm; =
,mm= >
intmm? B
?mmB C
bymmD F
)mmF G
{nn 	
tryoo 
{pp 
varqq 
	applevelsqq 
=qq $
_repositoryApproverLevelqq  8
.qq8 9
GetAllAsyncqq9 D
(qqD E
aqqE F
=>qqG I
aqqJ K
.qqK L 
ValuationQuotationIdqqL `
==qqa c
idqqd f
)qqf g
.qqg h
Resultqqh n
.qqn o
ToListqqo u
(qqu v
)qqv w
;qqw x
ifss 
(ss 
	applevelsss 
!=ss  
nullss! %
&&ss& (
	applevelsss) 2
.ss2 3
Countss3 8
>ss9 :
$numss; <
)ss< =
{tt 
foreachuu 
(uu 
varuu  
appleveluu! )
inuu* ,
	applevelsuu- 6
)uu6 7
{vv 
varxx 
applevlxx #
=xx$ %$
_repositoryApproverLevelxx& >
.xx> ?
Getxx? B
(xxB C
xxxC D
=>xxE G
xxxH I
.xxI J
IdxxJ L
==xxM O
applevelxxP X
.xxX Y
IdxxY [
)xx[ \
;xx\ ]$
_repositoryApproverLevelzz 0
.zz0 1
Removezz1 7
(zz7 8
applevlzz8 ?
)zz? @
;zz@ A
await{{ 
_unitOfWork{{ )
.{{) *
SaveChangesAsync{{* :
({{: ;
){{; <
;{{< =
}|| 
}}} 
var
 
entityQuatation
 #
=
$ %
_repository
& 1
.
1 2
Get
2 5
(
5 6
x
6 7
=>
8 :
x
; <
.
< =
Id
= ?
==
@ B
id
C E
)
E F
;
F G
if
‚‚ 
(
‚‚ 
entityQuatation
‚‚ #
==
‚‚$ &
null
‚‚' +
)
‚‚+ ,
return
ƒƒ 
DBOperation
ƒƒ &
.
ƒƒ& '
NotFound
ƒƒ' /
;
ƒƒ/ 0
_repository
…… 
.
…… 
Remove
…… "
(
……" #
entityQuatation
……# 2
)
……2 3
;
……3 4
await
†† 
_unitOfWork
†† !
.
††! "
SaveChangesAsync
††" 2
(
††2 3
)
††3 4
;
††4 5
return
‰‰ 
DBOperation
‰‰ "
.
‰‰" #
Success
‰‰# *
;
‰‰* +
}
 
catch
‹‹ 
(
‹‹ 
	Exception
‹‹ 
ex
‹‹ 
)
‹‹  
{
 
throw
 
ex
 
;
 
}
 
}
 	
public
’’ 
async
’’ 
Task
’’ 
<
’’ 
DBOperation
’’ %
>
’’% &
Upsert
’’' -
(
’’- .)
ValuationQuatationListModel
’’. I
entityQuatation
’’J Y
)
’’Y Z
{
““ 	 
ValuationQuotation
•• 
objQuatation
•• +
;
••+ ,
MasterDocument
–– 
objDocument
–– &
;
––& '+
ValuationRequestApproverLevel
—— )
objApproverLevel
——* :
;
——: ;
string
™™ 
MainTableName
™™  
=
™™! "
Enum
™™# '
.
™™' (
GetName
™™( /
(
™™/ 0
TableNameEnum
™™0 =
.
™™= > 
ValuationQuotation
™™> P
)
™™P Q
;
™™Q R
int
 
MainTableKey
 
=
 
entityQuatation
 .
.
. /
Id
/ 1
;
1 2
if
 
(
 
entityQuatation
 
.
  
Id
  "
>
# $
$num
% &
)
& '
{
  
ValuationQuotation
 "
	OldEntity
# ,
=
- .
null
/ 3
;
3 4
	OldEntity
 
=
 
_repository
 '
.
' (
GetNoTracking
( 5
(
5 6
entityQuatation
6 E
.
E F
Id
F H
)
H I
;
I J
objQuatation
΅΅ 
=
΅΅ 
_repository
΅΅ *
.
΅΅* +
Get
΅΅+ .
(
΅΅. /
entityQuatation
΅΅/ >
.
΅΅> ?
Id
΅΅? A
)
΅΅A B
;
΅΅B C
var
££ 
OldObjDepartment
££ $
=
££% &
objQuatation
££' 3
;
££3 4
if
¤¤ 
(
¤¤ 
objQuatation
¤¤  
!=
¤¤! #
null
¤¤$ (
)
¤¤( )
{
¥¥ 
objQuatation
¦¦  
.
¦¦  !
ReferenceNo
¦¦! ,
=
¦¦- .
objQuatation
¦¦/ ;
.
¦¦; <
ReferenceNo
¦¦< G
;
¦¦G H
objQuatation
§§  
.
§§  ! 
ValuationRequestId
§§! 3
=
§§4 5
entityQuatation
§§6 E
.
§§E F 
ValuationRequestId
§§F X
;
§§X Y
objQuatation
¨¨  
.
¨¨  !
ValuationFee
¨¨! -
=
¨¨. /
(
¨¨0 1
decimal
¨¨1 8
)
¨¨8 9
entityQuatation
¨¨9 H
.
¨¨H I
ValuationFee
¨¨I U
;
¨¨U V
objQuatation
©©  
.
©©  !
Vat
©©! $
=
©©% &
(
©©' (
decimal
©©( /
)
©©/ 0
entityQuatation
©©0 ?
.
©©? @
Vat
©©@ C
;
©©C D
objQuatation
ªª  
.
ªª  !
OtherCharges
ªª! -
=
ªª. /
entityQuatation
ªª0 ?
.
ªª? @
OtherCharges
ªª@ L
;
ªªL M
objQuatation
««  
.
««  !
InstructorCharges
««! 2
=
««3 4
entityQuatation
««5 D
.
««D E
InstructorCharges
««E V
;
««V W
objQuatation
¬¬  
.
¬¬  !
Discount
¬¬! )
=
¬¬* +
entityQuatation
¬¬, ;
.
¬¬; <
Discount
¬¬< D
;
¬¬D E
objQuatation
­­  
.
­­  !
TotalFee
­­! )
=
­­* +
entityQuatation
­­, ;
.
­­; <
TotalFee
­­< D
;
­­D E
objQuatation
®®  
.
®®  !
StatusId
®®! )
=
®®* +
objQuatation
®®, 8
.
®®8 9
StatusId
®®9 A
;
®®A B
objQuatation
°°  
.
°°  !

ModifiedBy
°°! +
=
°°, -
entityQuatation
°°. =
.
°°= >

ModifiedBy
°°> H
;
°°H I
_repository
²² 
.
²²  
UpdateAsync
²²  +
(
²²+ ,
objQuatation
²², 8
)
²²8 9
;
²²9 :
await
³³ 
_unitOfWork
³³ %
.
³³% &
SaveChangesAsync
³³& 6
(
³³6 7
)
³³7 8
;
³³8 9
await
¶¶ 
_auditLogService
¶¶ *
.
¶¶* +
CreateAuditLog
¶¶+ 9
<
¶¶9 : 
ValuationQuotation
¶¶: L
>
¶¶L M
(
¶¶M N!
AuditActionTypeEnum
¶¶N a
.
¶¶a b
Update
¶¶b h
,
¶¶h i
	OldEntity
¶¶j s
,
¶¶s t
objQuatation¶¶u 
,¶¶ ‚
MainTableName¶¶ƒ 
,¶¶ ‘
MainTableKey¶¶’ 
)¶¶ 
;¶¶  
}
·· 
else
ΈΈ 
{
ΉΉ 
return
ΊΊ 
DBOperation
ΊΊ &
.
ΊΊ& '
NotFound
ΊΊ' /
;
ΊΊ/ 0
}
»» 
}
ΌΌ 
else
½½ 
{
ΎΎ 
var
ΏΏ 
lastReq
ΏΏ 
=
ΏΏ 
_repository
ΏΏ )
.
ΏΏ) *
GetAll
ΏΏ* 0
(
ΏΏ0 1
)
ΏΏ1 2
.
ΏΏ2 3
OrderByDescending
ΏΏ3 D
(
ΏΏD E
a
ΏΏE F
=>
ΏΏG I
a
ΏΏJ K
.
ΏΏK L
Id
ΏΏL N
)
ΏΏN O
.
ΏΏO P
FirstOrDefault
ΏΏP ^
(
ΏΏ^ _
)
ΏΏ_ `
;
ΏΏ` a
objQuatation
ΐΐ 
=
ΐΐ 
_mapperFactory
ΐΐ -
.
ΐΐ- .
Get
ΐΐ. 1
<
ΐΐ1 2)
ValuationQuatationListModel
ΐΐ2 M
,
ΐΐM N 
ValuationQuotation
ΐΐO a
>
ΐΐa b
(
ΐΐb c
entityQuatation
ΐΐc r
)
ΐΐr s
;
ΐΐs t
var
ΒΒ 
id
ΒΒ 
=
ΒΒ 
string
ΒΒ 
.
ΒΒ  
Format
ΒΒ  &
(
ΒΒ& '
$str
ΒΒ' 0
,
ΒΒ0 1
AppConstants
ΒΒ2 >
.
ΒΒ> ?"
ID_QuotationsRequest
ΒΒ? S
,
ΒΒS T
entityQuatation
ΒΒU d
.
ΒΒd e 
ValuationRequestId
ΒΒe w
)
ΒΒw x
;
ΒΒx y
objQuatation
ΓΓ 
.
ΓΓ 
ReferenceNo
ΓΓ (
=
ΓΓ) *
string
ΓΓ+ 1
.
ΓΓ1 2
Format
ΓΓ2 8
(
ΓΓ8 9
$str
ΓΓ9 A
,
ΓΓA B
id
ΓΓC E
,
ΓΓE F
lastReq
ΓΓG N
?
ΓΓN O
.
ΓΓO P
Id
ΓΓP R
+
ΓΓS T
$num
ΓΓU V
)
ΓΓV W
;
ΓΓW X
objQuatation
ΔΔ 
.
ΔΔ 
CreatedDate
ΔΔ (
=
ΔΔ) *
AppConstants
ΔΔ+ 7
.
ΔΔ7 8
DateTime
ΔΔ8 @
;
ΔΔ@ A
objQuatation
ΕΕ 
.
ΕΕ 
	CreatedBy
ΕΕ &
=
ΕΕ' (
entityQuatation
ΕΕ) 8
.
ΕΕ8 9
	CreatedBy
ΕΕ9 B
??
ΕΕC E
$num
ΕΕF G
;
ΕΕG H
_repository
ΗΗ 
.
ΗΗ 
AddAsync
ΗΗ $
(
ΗΗ$ %
objQuatation
ΗΗ% 1
)
ΗΗ1 2
;
ΗΗ2 3
await
ΘΘ 
_unitOfWork
ΘΘ !
.
ΘΘ! "
SaveChangesAsync
ΘΘ" 2
(
ΘΘ2 3
)
ΘΘ3 4
;
ΘΘ4 5
}
ΙΙ 
if
ΛΛ 
(
ΛΛ 
objQuatation
ΛΛ 
.
ΛΛ 
Id
ΛΛ 
==
ΛΛ  "
$num
ΛΛ# $
)
ΛΛ$ %
return
ΜΜ 
DBOperation
ΜΜ "
.
ΜΜ" #
Error
ΜΜ# (
;
ΜΜ( )
else
ΞΞ 
{
ΟΟ 
if
ΠΠ 
(
ΠΠ 
entityQuatation
ΠΠ #
.
ΠΠ# $
uploadDocument
ΠΠ$ 2
!=
ΠΠ3 5
null
ΠΠ6 :
)
ΠΠ: ;
{
ΡΡ 
foreach
ÒÒ 
(
ÒÒ 
var
ÒÒ  
doc
ÒÒ! $
in
ÒÒ% '
entityQuatation
ÒÒ( 7
.
ÒÒ7 8
uploadDocument
ÒÒ8 F
)
ÒÒF G
{
ΣΣ 
objDocument
ΤΤ #
=
ΤΤ$ %
_mapperFactory
ΤΤ& 4
.
ΤΤ4 5
Get
ΤΤ5 8
<
ΤΤ8 9!
MasterDocumentModel
ΤΤ9 L
,
ΤΤL M
MasterDocument
ΤΤN \
>
ΤΤ\ ]
(
ΤΤ] ^
doc
ΤΤ^ a
)
ΤΤa b
;
ΤΤb c
objDocument
ΥΥ #
.
ΥΥ# $
IsActive
ΥΥ$ ,
=
ΥΥ- .
doc
ΥΥ/ 2
.
ΥΥ2 3
IsActive
ΥΥ3 ;
;
ΥΥ; <
objDocument
ΦΦ #
.
ΦΦ# $

TableKeyId
ΦΦ$ .
=
ΦΦ/ 0
objQuatation
ΦΦ1 =
.
ΦΦ= >
Id
ΦΦ> @
;
ΦΦ@ A
objDocument
ΧΧ #
.
ΧΧ# $
	TableName
ΧΧ$ -
=
ΧΧ. /
Enum
ΧΧ0 4
.
ΧΧ4 5
GetName
ΧΧ5 <
(
ΧΧ< =
TableNameEnum
ΧΧ= J
.
ΧΧJ K 
ValuationQuotation
ΧΧK ]
)
ΧΧ] ^
;
ΧΧ^ _
objDocument
ΨΨ #
.
ΨΨ# $
DocumentName
ΨΨ$ 0
=
ΨΨ1 2
doc
ΨΨ3 6
.
ΨΨ6 7
DocumentName
ΨΨ7 C
;
ΨΨC D
objDocument
ΩΩ #
.
ΩΩ# $
FileName
ΩΩ$ ,
=
ΩΩ- .
doc
ΩΩ/ 2
.
ΩΩ2 3
FileName
ΩΩ3 ;
;
ΩΩ; <
objDocument
ΪΪ #
.
ΪΪ# $
FilePath
ΪΪ$ ,
=
ΪΪ- .
doc
ΪΪ/ 2
.
ΪΪ2 3
FilePath
ΪΪ3 ;
;
ΪΪ; <
objDocument
ΫΫ #
.
ΫΫ# $
FileType
ΫΫ$ ,
=
ΫΫ- .
doc
ΫΫ/ 2
.
ΫΫ2 3
FileType
ΫΫ3 ;
;
ΫΫ; <
objDocument
άά #
.
άά# $
	CreatedBy
άά$ -
=
άά. /
entityQuatation
άά0 ?
.
άά? @
	CreatedBy
άά@ I
;
άάI J!
_repositoryDocument
ήή +
.
ήή+ ,
AddAsync
ήή, 4
(
ήή4 5
objDocument
ήή5 @
)
ήή@ A
;
ήήA B
await
ίί 
_unitOfWork
ίί )
.
ίί) *
SaveChangesAsync
ίί* :
(
ίί: ;
)
ίί; <
;
ίί< =
}
ΰΰ 
}
αα 
}
ββ 
{
εε 
DbParameter
ζζ 
[
ζζ 
]
ζζ 
osqlParameter
ζζ +
=
ζζ, -
{
ηη 
new
θθ 
DbParameter
θθ #
(
θθ# $
$str
θθ$ .
,
θθ. /
entityQuatation
θθ0 ?
.
θθ? @ 
ValuationRequestId
θθ@ R
,
θθR S
	SqlDbType
θθT ]
.
θθ] ^
Int
θθ^ a
)
θθa b
,
θθb c
new
ιι 
DbParameter
ιι #
(
ιι# $
$str
ιι$ /
,
ιι/ 0
entityQuatation
ιι1 @
.
ιι@ A
	CreatedBy
ιιA J
,
ιιJ K
	SqlDbType
ιιL U
.
ιιU V
Int
ιιV Y
)
ιιY Z
,
ιιZ [
new
κκ 
DbParameter
κκ #
(
κκ# $
$str
κκ$ /
,
κκ/ 0
objQuatation
κκ1 =
.
κκ= >
Id
κκ> @
,
κκ@ A
	SqlDbType
κκL U
.
κκU V
Int
κκV Y
)
κκY Z
,
κκZ [
new
λλ 
DbParameter
λλ #
(
λλ# $
$str
λλ$ 1
,
λλ1 2
entityQuatation
λλ3 B
.
λλB C
ApproverIds
λλC N
,
λλN O
	SqlDbType
λλP Y
.
λλY Z
VarChar
λλZ a
)
λλa b
,
λλb c
}
μμ 
;
μμ 
EltizamDBHelper
ξξ 
.
ξξ  
ExecuteNonQuery
ξξ  /
(
ξξ/ 0 
ProcedureMetastore
ξξ0 B
.
ξξB C7
)usp_ValuationRequest_UpsertApproverLevels
ξξC l
,
ξξl m!
DatabaseConnectionξξn €
.ξξ€ 

ConnStringξξ ‹
,ξξ‹ 
CommandTypeξξ 
.ξξ ™
StoredProcedureξξ™ ¨
,ξξ¨ ©
osqlParameterξξª ·
)ξξ· Έ
;ξξΈ Ή
}
οο 
try
ςς 
{
σσ 
var
ττ 
statusid
ττ 
=
ττ 
_statusrepository
ττ 0
.
ττ0 1
GetAll
ττ1 7
(
ττ7 8
)
ττ8 9
.
ττ9 :
Where
ττ: ?
(
ττ? @
x
ττ@ A
=>
ττB D
x
ττE F
.
ττF G
Status
ττG M
==
ττN P
$str
ττQ Y
)
ττY Z
.
ττZ [
Select
ττ[ a
(
ττa b
x
ττb c
=>
ττd f
x
ττg h
.
ττh i
Id
ττi k
)
ττk l
.
ττl m
FirstOrDefault
ττm {
(
ττ{ |
)
ττ| }
;
ττ} ~"
_notificationService
υυ $
.
υυ$ %*
UpdateValuationRequestStatus
υυ% A
(
υυA B
statusid
υυB J
,
υυJ K
objQuatation
υυL X
.
υυX Y 
ValuationRequestId
υυY k
)
υυk l
;
υυl m
string
χχ 
strHtml
χχ 
=
χχ  
File
χχ! %
.
χχ% &
ReadAllText
χχ& 1
(
χχ1 2
$str
χχ2 x
)
χχx y
;
χχy z
strHtml
ωω 
=
ωω 
strHtml
ωω !
.
ωω! "
Replace
ωω" )
(
ωω) *
$str
ωω* 4
,
ωω4 5
objQuatation
ωω6 B
.
ωωB C
CreatedDate
ωωC N
.
ωωN O
ToString
ωωO W
(
ωωW X
$str
ωωX e
)
ωωe f
)
ωωf g
;
ωωg h
strHtml
ϊϊ 
=
ϊϊ 
strHtml
ϊϊ !
.
ϊϊ! "
Replace
ϊϊ" )
(
ϊϊ) *
$str
ϊϊ* ;
,
ϊϊ; <
objQuatation
ϊϊ= I
.
ϊϊI J
ValuationFee
ϊϊJ V
.
ϊϊV W
ToString
ϊϊW _
(
ϊϊ_ `
)
ϊϊ` a
)
ϊϊa b
;
ϊϊb c
strHtml
ϋϋ 
=
ϋϋ 
strHtml
ϋϋ !
.
ϋϋ! "
Replace
ϋϋ" )
(
ϋϋ) *
$str
ϋϋ* 1
,
ϋϋ1 2
objQuatation
ϋϋ3 ?
.
ϋϋ? @
Vat
ϋϋ@ C
.
ϋϋC D
ToString
ϋϋD L
(
ϋϋL M
)
ϋϋM N
)
ϋϋN O
;
ϋϋO P
strHtml
όό 
=
όό 
strHtml
όό !
.
όό! "
Replace
όό" )
(
όό) *
$str
όό* :
,
όό: ;
objQuatation
όό< H
.
όόH I
OtherCharges
όόI U
.
όόU V
ToString
όόV ^
(
όό^ _
)
όό_ `
)
όό` a
;
όόa b
strHtml
ύύ 
=
ύύ 
strHtml
ύύ !
.
ύύ! "
Replace
ύύ" )
(
ύύ) *
$str
ύύ* H
,
ύύH I
objQuatation
ύύJ V
.
ύύV W
InstructorCharges
ύύW h
.
ύύh i
ToString
ύύi q
(
ύύq r
)
ύύr s
)
ύύs t
;
ύύt u
strHtml
ώώ 
=
ώώ 
strHtml
ώώ !
.
ώώ! "
Replace
ώώ" )
(
ώώ) *
$str
ώώ* 6
,
ώώ6 7
objQuatation
ώώ8 D
.
ώώD E
Discount
ώώE M
.
ώώM N
ToString
ώώN V
(
ώώV W
)
ώώW X
)
ώώX Y
;
ώώY Z
strHtml
ÿÿ 
=
ÿÿ 
strHtml
ÿÿ !
.
ÿÿ! "
Replace
ÿÿ" )
(
ÿÿ) *
$str
ÿÿ* A
,
ÿÿA B
objQuatation
ÿÿC O
.
ÿÿO P
TotalFee
ÿÿP X
.
ÿÿX Y
ToString
ÿÿY a
(
ÿÿa b
)
ÿÿb c
)
ÿÿc d
;
ÿÿd e
var
 
notificationModel
 %
=
& '"
_notificationService
( <
.
< =*
GetValuationNotificationData
= Y
(
Y Z!
RecepientActionEnum
Z m
.
m n!
QuaotationCreationn €
,€ 
objQuatation‚ 
. "
ValuationRequestId ΅
)΅ Ά
;Ά £
notificationModel
‚‚ !
.
‚‚! "
Subject
‚‚" )
=
‚‚* +

EnumHelper
‚‚, 6
.
‚‚6 7
GetDescription
‚‚7 E
(
‚‚E F!
RecepientActionEnum
‚‚F Y
.
‚‚Y Z 
QuaotationCreation
‚‚Z l
)
‚‚l m
;
‚‚m n
notificationModel
ƒƒ !
.
ƒƒ! "
Body
ƒƒ" &
=
ƒƒ' (
strHtml
ƒƒ) 0
;
ƒƒ0 1
await
…… "
_notificationService
…… *
.
……* +
	SendEmail
……+ 4
(
……4 5
notificationModel
……5 F
)
……F G
;
……G H
}
†† 
catch
‡‡ 
(
‡‡ 
	Exception
‡‡ 
ex
‡‡ 
)
‡‡  
{
 
throw
‰‰ 
ex
‰‰ 
;
‰‰ 
}
 
return
 
DBOperation
 
.
 
Success
 &
;
& '
}
 	
public
 
async
 
Task
 
<
 
List
 
<
 0
"ValuationRequestApproverLevelModel
 A
>
A B
>
B C
GetApproverLevel
D T
(
T U
decimal
U \
Amount
] c
,
c d
int
e h
ValReqId
i q
)
q r
{
 	
DbParameter
‘‘ 
[
‘‘ 
]
‘‘ 
osqlParameter
‘‘ '
=
‘‘( )
{
’’ 
new
““ 
DbParameter
““ 
(
““  
$str
““  (
,
““( )
Amount
““* 0
,
““0 1
	SqlDbType
““2 ;
.
““; <
Decimal
““< C
)
““C D
,
““D E
new
”” 
DbParameter
”” 
(
””  
$str
””  *
,
””* +
ValReqId
””, 4
,
””4 5
	SqlDbType
””6 ?
.
””? @
Int
””@ C
)
””C D
,
””D E
}
•• 
;
•• 
var
—— 
lstStf
—— 
=
—— 
EltizamDBHelper
—— (
.
——( )!
ExecuteMappedReader
——) <
<
——< =0
"ValuationRequestApproverLevelModel
——= _
>
——_ `
(
——` a 
ProcedureMetastore
——a s
.
——s t1
"usp_ValuationRequest_ApproverLevel——t –
,——– —"
DatabaseConnection—— ª
.——ª «

ConnString——« µ
,——µ ¶
CommandType——· Β
.——Β Γ
StoredProcedure——Γ Ò
,——Ò Σ
osqlParameter——Τ α
)——α β
;——β γ
return
™™ 
lstStf
™™ 
;
™™ 
}
 	
}
 
} €9
TD:\EltizamLive\Eltizam.Business.Core\Implementation\ValuationRequestStatusService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
Implementation  .
{ 
public 

class )
ValuationRequestStatusService .
:. /*
IValuationRequestStatusService0 N
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IMapperFactory '
_mapperFactory( 6
;6 7
private 
readonly 
	Microsoft "
." #

Extensions# -
.- .
Configuration. ;
.; <
IConfiguration< J
configurationK X
;X Y
private 
IRepository 
< !
MasterValuationStatus 1
>1 2
_repository3 >
{? @
getA D
;D E
setF I
;I J
}K L
private 
readonly 
IHelper  
_helper! (
;( )
public )
ValuationRequestStatusService ,
(, -
IUnitOfWork- 8

unitOfWork9 C
,C D
IMapperFactoryE S
mapperFactoryT a
,a b
IHelper- 4
helper5 ;
,; <
	Microsoft= F
.F G

ExtensionsG Q
.Q R
ConfigurationR _
._ `
IConfiguration` n
_configurationo }
)} ~
{ 	
_unitOfWork 
= 

unitOfWork $
;$ %
_mapperFactory 
= 
mapperFactory *
;* +
_repository 
= 
_unitOfWork %
.% &
GetRepository& 3
<3 4!
MasterValuationStatus4 I
>I J
(J K
)K L
;L M
configuration 
= 
_configuration *
;* +
_helper 
= 
helper 
; 
} 	
public"" 
async"" 
Task"" 
<"" 
List"" 
<"" '
ValuationRequestStatusModel"" :
>"": ;
>""; <
GetAll""= C
(""C D
int""D G
?""G H
roleId""I O
=""P Q
null""R V
,""V W
string""X ^
?""^ _
action""` f
=""g h
null""i m
,""m n
int""o r
?""r s
ValReqId""t |
=""} ~
null	"" ƒ
)
""ƒ „
{## 	
DbParameter$$ 
[$$ 
]$$ 
osqlParameter$$ '
=$$( )
{%% 
new&& 
DbParameter&& 
(&&  
$str&&  (
,&&( )
roleId&&* 0
,&&0 1
	SqlDbType&&2 ;
.&&; <
Int&&< ?
)&&? @
,&&@ A
new'' 
DbParameter'' 
(''  
$str''  (
,''( )
action''* 0
,''0 1
	SqlDbType''2 ;
.''; <
VarChar''< C
)''C D
,''D E
new(( 
DbParameter(( 
(((  
$str((  *
,((* +
ValReqId((, 4
,((4 5
	SqlDbType((6 ?
.((? @
Int((@ C
)((C D
,((D E
})) 
;)) 
var** 
lstStf** 
=** 
EltizamDBHelper** (
.**( )
ExecuteMappedReader**) <
<**< ='
ValuationRequestStatusModel**= X
>**X Y
(**Y Z
ProcedureMetastore**Z l
.**l m,
usp_Master_ValuationStatus_List	**m 
,
**  
DatabaseConnection
**  
.
**  ΅

ConnString
**΅ «
,
**« ¬
CommandType
**­ Έ
.
**Έ Ή
StoredProcedure
**Ή Θ
,
**Θ Ι
osqlParameter
**Κ Χ
)
**Χ Ψ
;
**Ψ Ω
return,, 
lstStf,, 
;,, 
}-- 	
public// 
async// 
Task// 
<// 
List// 
<// '
ValuationRequestStatusModel// :
>//: ;
>//; <
GetAllStatus//= I
(//I J
)//J K
{00 	
var11 
lstStf11 
=11 
await11 
GetAll11 %
(11% &
)11& '
;11' (
return22 
lstStf22 
;22 
}33 	
public55 
async55 
Task55 
<55 
List55 
<55 '
ValuationRequestStatusModel55 :
>55: ;
>55; <'
GetInvoiceTransactionStatus55= X
(55X Y
int55Y \
type55] a
)55a b
{66 	
DbParameter77 
[77 
]77 
osqlParameter77 '
=77( )
{88 
new99 
DbParameter99 
(99  
$str99  &
,99& '
type99( ,
,99, -
	SqlDbType99. 7
.997 8
Int998 ;
)99; <
}:: 
;:: 
var;; 
lstStf;; 
=;; 
EltizamDBHelper;; (
.;;( )
ExecuteMappedReader;;) <
<;;< ='
ValuationRequestStatusModel;;= X
>;;X Y
(;;Y Z
ProcedureMetastore;;Z l
.;;l m4
'usp_Master_Valuation_InvoiceStatus_List	;;m ”
,
;;” • 
DatabaseConnection
;;– ¨
.
;;¨ ©

ConnString
;;© ³
,
;;³ ΄
CommandType
;;µ ΐ
.
;;ΐ Α
StoredProcedure
;;Α Π
,
;;Π Ρ
osqlParameter
;;Ò ί
)
;;ί ΰ
;
;;ΰ α
return== 
lstStf== 
;== 
}>> 	
public@@ 
async@@ 
Task@@ 
<@@ 
List@@ 
<@@ .
"ValuationRequestHistoryStatusModel@@ A
>@@A B
>@@B C
GetAllStatusHistory@@D W
(@@W X
int@@Y \
?@@\ ]
ValReqId@@^ f
=@@g h
null@@i m
)@@m n
{AA 	
DbParameterBB 
[BB 
]BB 
osqlParameterBB '
=BB( )
{CC 
newEE 
DbParameterEE 
(EE  
$strEE  *
,EE* +
ValReqIdEE, 4
,EE4 5
	SqlDbTypeEE6 ?
.EE? @
IntEE@ C
)EEC D
,EED E
}FF 
;FF 
varGG 
lstStfGG 
=GG 
EltizamDBHelperGG (
.GG( )
ExecuteMappedReaderGG) <
<GG< =.
"ValuationRequestHistoryStatusModelGG= _
>GG_ `
(GG` a
ProcedureMetastoreGGa s
.GGs t/
"usp_ValuationRequest_StatusHistory	GGt –
,
GG– — 
DatabaseConnection
GG ª
.
GGª «

ConnString
GG« µ
,
GGµ ¶
CommandType
GG· Β
.
GGΒ Γ
StoredProcedure
GGΓ Ò
,
GGÒ Σ
osqlParameter
GGΤ α
)
GGα β
;
GGβ γ
returnII 
lstStfII 
;II 
}JJ 	
}KK 
}LL ¤±
MD:\EltizamLive\Eltizam.Business.Core\Implementation\ValutionRequestService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
Implementation  .
{ 
public 

class #
ValuationRequestService (
:) *$
IValuationRequestService+ C
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IMapperFactory '
_mapperFactory( 6
;6 7
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
private 
IRepository 
< 

MasterUser &
>& '
	_userrepo( 1
{2 3
get4 7
;7 8
set9 <
;< =
}> ?
private 
IRepository 
< 
ValuationRequest ,
>, -
_repository. 9
{: ;
get< ?
;? @
setA D
;D E
}F G
private 
IRepository 
< $
ValuationSiteDescription 4
>4 5
_siterepository6 E
{F G
getH K
;K L
setM P
;P Q
}R S
private 
IRepository 
< '
ValuationComparableEvidence 7
>7 8
_evidencerepository9 L
{M N
getO R
;R S
setT W
;W X
}Y Z
private 
IRepository 
< 
ValuationAssesment .
>. /!
_assesmenterepository0 E
{F G
getH K
;K L
setM P
;P Q
}R S
private 
IRepository 
< !
MasterValuationStatus 1
>1 2
_statusrepository3 D
{E F
getG J
;J K
setL O
;O P
}Q R
private   
IRepository   
<   )
ValuationRequestApproverLevel   9
>  9 :*
_valuationRequestApproverLevel  ; Y
{  Z [
get  \ _
;  _ `
set  a d
;  d e
}  f g
private!! 
readonly!! 
IAuditLogService!! )
_auditLogService!!* :
;!!: ;
private"" 
readonly"" 
IHelper""  
_helper""! (
;""( )
private$$ 
readonly$$ &
IMasterNotificationService$$ 3 
_notificationService$$4 H
;$$H I
public)) #
ValuationRequestService)) &
())& '
IAuditLogService))' 7
auditLogService))8 G
,))G H
IUnitOfWork))I T

unitOfWork))U _
,))_ `
IMapperFactory))a o
mapperFactory))p }
,))} ~
IHelper	)) †
helper
))‡ 
,
)) 
IConfiguration
)) 
configuration
)) «
,
))« ¬(
IMasterNotificationService
))­ Η!
notificationService
))Θ Ϋ
)
))Ϋ ά
{** 	
_unitOfWork++ 
=++ 

unitOfWork++ $
;++$ %
_mapperFactory,, 
=,, 
mapperFactory,, *
;,,* +
_statusrepository-- 
=-- 
_unitOfWork--  +
.--+ ,
GetRepository--, 9
<--9 :!
MasterValuationStatus--: O
>--O P
(--P Q
)--Q R
;--R S
_repository.. 
=.. 
_unitOfWork.. %
...% &
GetRepository..& 3
<..3 4
ValuationRequest..4 D
>..D E
(..E F
)..F G
;..G H
_siterepository// 
=// 
_unitOfWork// )
.//) *
GetRepository//* 7
<//7 8$
ValuationSiteDescription//8 P
>//P Q
(//Q R
)//R S
;//S T
_evidencerepository00 
=00  !
_unitOfWork00" -
.00- .
GetRepository00. ;
<00; <'
ValuationComparableEvidence00< W
>00W X
(00X Y
)00Y Z
;00Z [!
_assesmenterepository11 !
=11" #
_unitOfWork11$ /
.11/ 0
GetRepository110 =
<11= >
ValuationAssesment11> P
>11P Q
(11Q R
)11R S
;11S T
_configuration22 
=22 
configuration22 *
;22* +
_helper33 
=33 
helper33 
;33  
_notificationService44  
=44! "
notificationService44# 6
;446 7
_auditLogService55 
=55 
auditLogService55 .
;55. /*
_valuationRequestApproverLevel66 *
=66+ ,
_unitOfWork66- 8
.668 9
GetRepository669 F
<66F G)
ValuationRequestApproverLevel66G d
>66d e
(66e f
)66f g
;66g h
	_userrepo77 
=77 
_unitOfWork77 #
.77# $
GetRepository77$ 1
<771 2

MasterUser772 <
>77< =
(77= >
)77> ?
;77? @
}88 	
public<< 
async<< 
Task<< 
<<< "
DataTableResponseModel<< 0
><<0 1
GetAll<<2 8
(<<8 9"
DataTableAjaxPostModel<<9 O
model<<P U
,<<U V#
ValuationRequestFilters<<W n
filters<<o v
)<<v w
{== 	
string>> 

ColumnName>> 
=>> 
model>>  %
.>>% &
order>>& +
.>>+ ,
Count>>, 1
>>>2 3
$num>>4 5
?>>6 7
model>>8 =
.>>= >
columns>>> E
[>>E F
model>>F K
.>>K L
order>>L Q
[>>Q R
$num>>R S
]>>S T
.>>T U
column>>U [
]>>[ \
.>>\ ]
data>>] a
:>>b c
string>>d j
.>>j k
Empty>>k p
;>>p q
string?? 
SortDir?? 
=?? 
model?? "
.??" #
order??# (
[??( )
$num??) *
]??* +
???+ ,
.??, -
dir??- 0
;??0 1
SqlParameterBB 
[BB 
]BB 
osqlParameterBB (
=BB) *
{CC 
newDD 
SqlParameterDD  
(DD  !
AppConstantsDD! -
.DD- .
P_CurrentPageNumberDD. A
,DDA B
modelDDD I
.DDI J
startDDJ O
)DDO P
,DDP Q
newEE 
SqlParameterEE  
(EE  !
AppConstantsEE! -
.EE- .

P_PageSizeEE. 8
,EE8 9
modelEED I
.EEI J
lengthEEJ P
)EEP Q
,EEQ R
newFF 
SqlParameterFF  
(FF  !
AppConstantsFF! -
.FF- .
P_SortColumnFF. :
,FF: ;

ColumnNameFFD N
)FFN O
,FFO P
newGG 
SqlParameterGG  
(GG  !
AppConstantsGG! -
.GG- .
P_SortDirectionGG. =
,GG= >
SortDirGGD K
)GGK L
,GGL M
newHH 
SqlParameterHH  
(HH  !
AppConstantsHH! -
.HH- .
P_SearchTextHH. :
,HH: ;
modelHHD I
.HHI J
searchHHJ P
?HHP Q
.HHQ R
valueHHR W
)HHW X
,HHX Y
newII 
SqlParameterII !
(II! "
AppConstantsII" .
.II. /
LogInUserIdII/ :
,II: ;
filtersIIE L
.IIL M
logInUserIdIIM X
)IIX Y
,IIY Z
newJJ 
SqlParameterJJ  
(JJ  !
$strJJ! +
,JJ+ ,
filtersJJD K
.JJK L
userNameJJL T
)JJT U
,JJU V
newKK 
SqlParameterKK  
(KK  !
$strKK! -
,KK- .
filtersKKD K
.KKK L

clientNameKKL V
)KKV W
,KKW X
newLL 
SqlParameterLL  
(LL  !
$strLL! /
,LL/ 0
filtersLLD K
.LLK L
propertyNameLLL X
)LLX Y
,LLY Z
newMM 
SqlParameterMM  
(MM  !
$strMM! 2
,MM2 3
filtersMMD K
.MMK L
requestStatusIdMML [
)MM[ \
,MM\ ]
newNN 
SqlParameterNN  
(NN  !
$strNN! 2
,NN2 3
filtersNND K
.NNK L

resourceIdNNL V
)NNV W
,NNW X
newOO 
SqlParameterOO  
(OO  !
$strOO! 2
,OO2 3
filtersOOD K
.OOK L
propertyTypeIdOOL Z
)OOZ [
,OO[ \
newPP 
SqlParameterPP  
(PP  !
$strPP! ,
,PP, -
filtersPPD K
.PPK L
	countryIdPPL U
)PPU V
,PPV W
newQQ 
SqlParameterQQ  
(QQ  !
$strQQ! *
,QQ* +
filtersQQD K
.QQK L
stateIdQQL S
)QQS T
,QQT U
newRR 
SqlParameterRR  
(RR  !
$strRR! )
,RR) *
filtersRRD K
.RRK L
cityIdRRL R
)RRR S
,RRS T
newSS 
SqlParameterSS  
(SS  !
$strSS! +
,SS+ ,
filtersSSD K
.SSK L
fromDateSSL T
)SST U
,SSU V
newTT 
SqlParameterTT  
(TT  !
$strTT! )
,TT) *
filtersTTD K
.TTK L
toDateTTL R
)TTR S
,TTS T
newUU 
SqlParameterUU  
(UU  !
$strUU! )
,UU) *
filtersUUD K
.UUK L
valRefUUL R
)UUR S
}VV 
;VV 
varXX 
ResultsXX 
=XX 
awaitXX 
_repositoryXX  +
.XX+ ,
GetBySPXX, 3
(XX3 4
ProcedureMetastoreXX4 F
.XXF G)
usp_Valution_GetValuationListXXG d
,XXd e
CommandTypeXXf q
.XXq r
StoredProcedure	XXr 
,
XX ‚
osqlParameter
XXƒ 
)
XX ‘
;
XX‘ ’
var[[ 
res[[ 
=[[ 
UtilityHelper[[ #
.[[# $
GetPaginationInfo[[$ 5
([[5 6
Results[[6 =
)[[= >
;[[> ?"
DataTableResponseModel]] "#
oDataTableResponseModel]]# :
=]]; <
new]]= @"
DataTableResponseModel]]A W
(]]W X
model]]X ]
.]]] ^
draw]]^ b
,]]b c
res]]d g
.]]g h
Item1]]h m
,]]m n
res]]o r
.]]r s
Item1]]s x
,]]x y
Results	]]z 
.
]] ‚
DataTableToList
]]‚ ‘
<
]]‘ ’&
ValutionRequestListModel
]]’ ª
>
]]ª «
(
]]« ¬
)
]]¬ ­
)
]]­ ®
;
]]® ―
return^^ #
oDataTableResponseModel^^ *
;^^* +
}__ 	
publicaa 
asyncaa 
Taskaa 
<aa 
DBOperationaa %
>aa% &
AssignApproveraa' 5
(aa5 6&
AssignApprovorRequestModelaa6 P
modelaaQ V
)aaV W
{bb 	
varcc 
VRIDscc 
=cc 
modelcc 
.cc 

RequestIdscc (
;cc( )
ifdd 
(dd 
modeldd 
.dd 

ApprovorIddd  
>dd! "
$numdd# $
)dd$ %
{ee 
ifff 
(ff 
VRIDsff 
!=ff 
nullff !
&&ff" $
VRIDsff% *
.ff* +
Lengthff+ 1
>ff2 3
$numff4 5
)ff5 6
{gg 
inthh 
[hh 
]hh 
idshh 
=hh 
VRIDshh  %
.hh% &
Splithh& +
(hh+ ,
$charhh, /
)hh/ 0
.hh0 1
Selecthh1 7
(hh7 8
inthh8 ;
.hh; <
Parsehh< A
)hhA B
.hhB C
ToArrayhhC J
(hhJ K
)hhK L
;hhL M
ifjj 
(jj 
idsjj 
.jj 
Lengthjj "
>jj# $
$numjj% &
)jj& '
{kk 
foreachll 
(ll  !
intll! $
idll% '
inll( *
idsll+ .
)ll. /
{mm 
ValuationRequestnn ,
	OldEntitynn- 6
=nn7 8
nullnn9 =
;nn= >
	OldEntityoo %
=oo& '
_repositoryoo( 3
.oo3 4
GetNoTrackingoo4 A
(ooA B
idooB D
)ooD E
;ooE F
varpp 
	TableNamepp  )
=pp* +
Enumpp, 0
.pp0 1
GetNamepp1 8
(pp8 9
TableNameEnumpp9 F
.ppF G
ValuationRequestppG W
)ppW X
;ppX Y
varrr 
valuationEntityrr  /
=rr0 1
_repositoryrr2 =
.rr= >
Getrr> A
(rrA B
idrrB D
)rrD E
;rrE F
valuationEntityss +
.ss+ ,

ApproverIdss, 6
=ss7 8
modelss9 >
.ss> ?

ApprovorIdss? I
;ssI J
valuationEntitytt +
.tt+ ,
AssignRemarktt, 8
=tt9 :
modeltt; @
.tt@ A
RemarksttA H
;ttH I
valuationEntityuu +
.uu+ ,

ModifiedByuu, 6
=uu7 8
modeluu9 >
.uu> ?
LogInUserIduu? J
;uuJ K
_repositoryww '
.ww' (
UpdateAsyncww( 3
(ww3 4
valuationEntityww4 C
)wwC D
;wwD E
await{{ !
_auditLogService{{" 2
.{{2 3
CreateAuditLog{{3 A
<{{A B
ValuationRequest{{B R
>{{R S
({{S T
AuditActionTypeEnum{{T g
.{{g h
Update{{h n
,{{n o
	OldEntity{{p y
,{{y z
valuationEntity	{{{ 
,
{{ ‹
	TableName
{{ •
,
{{• –
id
{{— ™
)
{{™ 
;
{{ ›
}
‚‚ 
await
ƒƒ 
_unitOfWork
ƒƒ )
.
ƒƒ) *
SaveChangesAsync
ƒƒ* :
(
ƒƒ: ;
)
ƒƒ; <
;
ƒƒ< =
}
„„ 
return
†† 
DBOperation
†† &
.
††& '
Success
††' .
;
††. /
}
‡‡ 
}
 
else
‰‰ 
{
 
return
‹‹ 
DBOperation
‹‹ "
.
‹‹" #
NotFound
‹‹# +
;
‹‹+ ,
}
 
return
 
DBOperation
 
.
 
Success
 &
;
& '
}
 	
public
 
async
 
Task
 
<
 
DBOperation
 %
>
% &"
AssignApproverStatus
' ;
(
; <(
ApprovorStatusRequestModel
< V
model
W \
)
\ ]
{
‘‘ 	
if
’’ 
(
’’ 
model
’’ 
.
’’ 

ApprovorId
’’  
>
’’! "
$num
’’# $
&&
’’% '
model
’’( -
.
’’- . 
ValuationRequestId
’’. @
>
’’A B
$num
’’C D
)
’’D E
{
““ 
if
”” 
(
”” 
model
”” 
.
”” 
StatusId
”” "
>
””# $
$num
””% &
)
””& '
{
•• 
ValuationRequest
–– $
	OldEntity
––% .
=
––/ 0
null
––1 5
;
––5 6
	OldEntity
—— 
=
—— 
_repository
——  +
.
——+ ,
GetNoTracking
——, 9
(
——9 :
model
——: ?
.
——? @ 
ValuationRequestId
——@ R
)
——R S
;
——S T
var
 
	TableName
 !
=
" #
Enum
$ (
.
( )
GetName
) 0
(
0 1
TableNameEnum
1 >
.
> ?
ValuationRequest
? O
)
O P
;
P Q
var
 
valuationEntity
 '
=
( )
_repository
* 5
.
5 6
Get
6 9
(
9 :
model
: ?
.
? @ 
ValuationRequestId
@ R
)
R S
;
S T
valuationEntity
›› #
.
››# $

ApproverId
››$ .
=
››/ 0
model
››1 6
.
››6 7

ApprovorId
››7 A
;
››A B
valuationEntity
 #
.
# $
ApproverComment
$ 3
=
4 5
model
6 ;
.
; <
ApprovorComment
< K
;
K L
valuationEntity
 #
.
# $
StatusId
$ ,
=
- .
model
/ 4
.
4 5
StatusId
5 =
;
= >
valuationEntity
 #
.
# $

ModifiedBy
$ .
=
/ 0
model
1 6
.
6 7
LogInUserId
7 B
;
B C
_repository
   
.
    
UpdateAsync
    +
(
  + ,
valuationEntity
  , ;
)
  ; <
;
  < =
await
££ 
_unitOfWork
££ %
.
££% &
SaveChangesAsync
££& 6
(
££6 7
)
££7 8
;
££8 9
try
¥¥ 
{
¦¦ 
await
¨¨ 
_auditLogService
¨¨ .
.
¨¨. /
CreateAuditLog
¨¨/ =
<
¨¨= >
ValuationRequest
¨¨> N
>
¨¨N O
(
¨¨O P!
AuditActionTypeEnum
¨¨P c
.
¨¨c d
Update
¨¨d j
,
¨¨j k
	OldEntity
¨¨l u
,
¨¨u v
valuationEntity¨¨w †
,¨¨† ‡
	TableName¨¨ ‘
,¨¨‘ ’
model¨¨“ 
.¨¨ ™"
ValuationRequestId¨¨™ «
)¨¨« ¬
;¨¨¬ ­
var
ªª 
newstatusname
ªª )
=
ªª* +
_statusrepository
ªª, =
.
ªª= >
GetAll
ªª> D
(
ªªD E
)
ªªE F
.
ªªF G
Where
ªªG L
(
ªªL M
x
ªªM N
=>
ªªO Q
x
ªªR S
.
ªªS T
Id
ªªT V
==
ªªW Y
valuationEntity
ªªZ i
.
ªªi j
StatusId
ªªj r
)
ªªr s
.
ªªs t
Select
ªªt z
(
ªªz {
x
ªª{ |
=>
ªª} 
xªª€ 
.ªª ‚
Statusªª‚ 
)ªª ‰
.ªª‰ 
FirstOrDefaultªª 
(ªª ™
)ªª™ 
;ªª ›
var
«« 
oldstatusname
«« )
=
««* +
_statusrepository
««, =
.
««= >
GetAll
««> D
(
««D E
)
««E F
.
««F G
Where
««G L
(
««L M
x
««M N
=>
««O Q
x
««R S
.
««S T
Id
««T V
==
««W Y
	OldEntity
««Z c
.
««c d
StatusId
««d l
)
««l m
.
««m n
Select
««n t
(
««t u
x
««u v
=>
««w y
x
««z {
.
««{ |
Status««| ‚
)««‚ ƒ
.««ƒ „
FirstOrDefault««„ ’
(««’ “
)««“ ”
;««” •
if
¬¬ 
(
¬¬ 
newstatusname
¬¬ )
!=
¬¬* ,
oldstatusname
¬¬- :
)
¬¬: ;
await
­­ !!
SenddDetailsToEmail
­­" 5
(
­­5 6!
RecepientActionEnum
­­6 I
.
­­I J$
ValuationStatusChanged
­­J `
,
­­` a
valuationEntity
­­b q
.
­­q r
Id
­­r t
)
­­t u
;
­­u v
}
®® 
catch
―― 
(
―― 
	Exception
―― $
ex
――% '
)
――' (
{
°° 
}
²² 
}
³³ 
else
΄΄ 
{
µµ 
return
¶¶ 
DBOperation
¶¶ &
.
¶¶& '
NotFound
¶¶' /
;
¶¶/ 0
}
·· 
}
ΈΈ 
else
ΉΉ 
{
ΊΊ 
return
»» 
DBOperation
»» "
.
»»" #
NotFound
»»# +
;
»»+ ,
}
ΌΌ 
return
½½ 
DBOperation
½½ 
.
½½ 
Success
½½ &
;
½½& '
}
ΎΎ 	
public
ΐΐ 
async
ΐΐ 
Task
ΐΐ 
<
ΐΐ 
DBOperation
ΐΐ %
>
ΐΐ% &!
UpdateRequestStatus
ΐΐ' :
(
ΐΐ: ;.
 ValutionRequestStatusChangeModel
ΐΐ; [
model
ΐΐ\ a
)
ΐΐa b
{
ΑΑ 	
int
ΒΒ 
?
ΒΒ 
By
ΒΒ 
=
ΒΒ 
model
ΒΒ 
.
ΒΒ 
LogInUserId
ΒΒ '
;
ΒΒ' (
var
ΓΓ 
	TableName
ΓΓ 
=
ΓΓ 
Enum
ΓΓ  
.
ΓΓ  !
GetName
ΓΓ! (
(
ΓΓ( )
TableNameEnum
ΓΓ) 6
.
ΓΓ6 7
ValuationRequest
ΓΓ7 G
)
ΓΓG H
;
ΓΓH I
if
ΕΕ 
(
ΕΕ 
model
ΕΕ 
.
ΕΕ 
StatusId
ΕΕ 
>
ΕΕ  
$num
ΕΕ! "
&&
ΕΕ# %
model
ΕΕ& +
.
ΕΕ+ ,
Id
ΕΕ, .
>
ΕΕ/ 0
$num
ΕΕ1 2
)
ΕΕ2 3
{
ΖΖ 
ValuationRequest
ΗΗ  
	OldEntity
ΗΗ! *
=
ΗΗ+ ,
null
ΗΗ- 1
;
ΗΗ1 2
	OldEntity
ΘΘ 
=
ΘΘ 
_repository
ΘΘ '
.
ΘΘ' (
GetNoTracking
ΘΘ( 5
(
ΘΘ5 6
model
ΘΘ6 ;
.
ΘΘ; <
Id
ΘΘ< >
)
ΘΘ> ?
;
ΘΘ? @
var
ΚΚ 
valuationEntity
ΚΚ #
=
ΚΚ$ %
_repository
ΚΚ& 1
.
ΚΚ1 2
Get
ΚΚ2 5
(
ΚΚ5 6
model
ΚΚ6 ;
.
ΚΚ; <
Id
ΚΚ< >
)
ΚΚ> ?
;
ΚΚ? @
var
ΝΝ 
user
ΝΝ 
=
ΝΝ 
	_userrepo
ΝΝ $
.
ΝΝ$ %
Get
ΝΝ% (
(
ΝΝ( )
model
ΝΝ) .
.
ΝΝ. /
LogInUserId
ΝΝ/ :
??
ΝΝ; =
$num
ΝΝ> ?
)
ΝΝ? @
;
ΝΝ@ A
if
ΠΠ 
(
ΠΠ 
user
ΠΠ 
!=
ΠΠ 
null
ΠΠ  
&&
ΠΠ! #
user
ΠΠ$ (
.
ΠΠ( )
RoleId
ΠΠ) /
==
ΠΠ0 2
(
ΠΠ3 4
int
ΠΠ4 7
)
ΠΠ7 8
RoleEnum
ΠΠ8 @
.
ΠΠ@ A
Approver
ΠΠA I
)
ΠΠI J
{
ΡΡ 
var
ÒÒ 
openApproval
ÒÒ $
=
ÒÒ% &,
_valuationRequestApproverLevel
ÒÒ' E
.
ÒÒE F
Get
ÒÒF I
(
ÒÒI J
a
ÒÒJ K
=>
ÒÒL N
a
ÒÒO P
.
ÒÒP Q 
ValuationRequestId
ÒÒQ c
==
ÒÒd f
model
ÒÒg l
.
ÒÒl m
Id
ÒÒm o
&&
ÒÒp r
a
ÒÒs t
.
ÒÒt u

ApproverId
ÒÒu 
==ÒÒ€ ‚
ByÒÒƒ …
)ÒÒ… †
;ÒÒ† ‡
if
ΣΣ 
(
ΣΣ 
openApproval
ΣΣ $
!=
ΣΣ% '
null
ΣΣ( ,
)
ΣΣ, -
{
ΤΤ +
ValuationRequestApproverLevel
ΥΥ 5
	oldentity
ΥΥ6 ?
=
ΥΥ@ A
null
ΥΥB F
;
ΥΥF G
	oldentity
ΦΦ !
=
ΦΦ" #,
_valuationRequestApproverLevel
ΦΦ$ B
.
ΦΦB C
GetNoTracking
ΦΦC P
(
ΦΦP Q
openApproval
ΦΦQ ]
.
ΦΦ] ^
Id
ΦΦ^ `
)
ΦΦ` a
;
ΦΦa b
var
ΨΨ 
ent
ΨΨ 
=
ΨΨ  !,
_valuationRequestApproverLevel
ΨΨ" @
.
ΨΨ@ A
Get
ΨΨA D
(
ΨΨD E
openApproval
ΨΨE Q
.
ΨΨQ R
Id
ΨΨR T
)
ΨΨT U
;
ΨΨU V
ent
ΩΩ 
.
ΩΩ 
ApproverComment
ΩΩ +
=
ΩΩ, -
model
ΩΩ. 3
.
ΩΩ3 4
ApproverComment
ΩΩ4 C
;
ΩΩC D
ent
ΪΪ 
.
ΪΪ 
StatusId
ΪΪ $
=
ΪΪ% &
model
ΪΪ' ,
.
ΪΪ, -
StatusId
ΪΪ- 5
;
ΪΪ5 6
ent
ΫΫ 
.
ΫΫ 

ModifiedBy
ΫΫ &
=
ΫΫ' (
By
ΫΫ) +
;
ΫΫ+ ,,
_valuationRequestApproverLevel
ήή 6
.
ήή6 7
UpdateAsync
ήή7 B
(
ήήB C
ent
ήήC F
)
ήήF G
;
ήήG H
await
ίί 
_unitOfWork
ίί )
.
ίί) *
SaveChangesAsync
ίί* :
(
ίί: ;
)
ίί; <
;
ίί< =
}
γγ 
var
ζζ 
openApprovals
ζζ %
=
ζζ& ',
_valuationRequestApproverLevel
ζζ( F
.
ζζF G
GetAllAsync
ζζG R
(
ζζR S
a
ζζS T
=>
ζζU W
a
ζζX Y
.
ζζY Z 
ValuationRequestId
ζζZ l
==
ζζm o
model
ζζp u
.
ζζu v
Id
ζζv x
&&
ζζy {
a
ζζ| }
.
ζζ} ~
StatusIdζζ~ †
==ζζ‡ ‰
nullζζ 
)ζζ 
.ζζ 
Resultζζ –
.ζζ– —
ToListζζ— 
(ζζ 
)ζζ 
;ζζ  
if
ηη 
(
ηη 
openApprovals
ηη %
!=
ηη& (
null
ηη) -
&&
ηη. 0
openApprovals
ηη1 >
.
ηη> ?
Count
ηη? D
>
ηηE F
$num
ηηG H
)
ηηH I
{
θθ 
var
ιι 
nxtapp
ιι "
=
ιι# $
openApprovals
ιι% 2
.
ιι2 3
OrderBy
ιι3 :
(
ιι: ;
a
ιι; <
=>
ιι= ?
a
ιι@ A
.
ιιA B
ApproverLevelId
ιιB Q
)
ιιQ R
.
ιιR S
FirstOrDefault
ιιS a
(
ιιa b
)
ιιb c
;
ιιc d
valuationEntity
κκ '
.
κκ' (

ApproverId
κκ( 2
=
κκ3 4
nxtapp
κκ5 ;
?
κκ; <
.
κκ< =

ApproverId
κκ= G
;
κκG H
}
λλ 
else
μμ 
valuationEntity
νν '
.
νν' (
StatusId
νν( 0
=
νν1 2
model
νν3 8
.
νν8 9
StatusId
νν9 A
;
ννA B
valuationEntity
ππ #
.
ππ# $
ApproverComment
ππ$ 3
=
ππ4 5
model
ππ6 ;
.
ππ; <
ApproverComment
ππ< K
;
ππK L
valuationEntity
ρρ #
.
ρρ# $ 
ApproverUpdateDate
ρρ$ 6
=
ρρ7 8
AppConstants
ρρ9 E
.
ρρE F
DateTime
ρρF N
;
ρρN O
}
ςς 
else
υυ 
if
υυ 
(
υυ 
user
υυ 
!=
υυ  
null
υυ! %
&&
υυ& (
user
υυ) -
.
υυ- .
RoleId
υυ. 4
==
υυ5 7
(
υυ8 9
int
υυ9 <
)
υυ< =
RoleEnum
υυ= E
.
υυE F
Valuer
υυF L
)
υυL M
{
φφ 
valuationEntity
χχ #
.
χχ# $
StatusId
χχ$ ,
=
χχ- .
model
χχ/ 4
.
χχ4 5
StatusId
χχ5 =
;
χχ= >
valuationEntity
ψψ #
.
ψψ# $
ValuerUpdateDate
ψψ$ 4
=
ψψ5 6
AppConstants
ψψ7 C
.
ψψC D
DateTime
ψψD L
;
ψψL M
valuationEntity
ωω #
.
ωω# $
ValuerComment
ωω$ 1
=
ωω2 3
model
ωω4 9
.
ωω9 :
Comment
ωω: A
;
ωωA B
}
ϊϊ 
else
ύύ 
{
ώώ 
valuationEntity
ÿÿ #
.
ÿÿ# $
StatusId
ÿÿ$ ,
=
ÿÿ- .
model
ÿÿ/ 4
.
ÿÿ4 5
StatusId
ÿÿ5 =
;
ÿÿ= >
}
€€ 
valuationEntity
‚‚ 
.
‚‚  

ModifiedBy
‚‚  *
=
‚‚+ ,
By
‚‚- /
;
‚‚/ 0
valuationEntity
ƒƒ 
.
ƒƒ  
StatusComment
ƒƒ  -
=
ƒƒ. /
model
ƒƒ0 5
.
ƒƒ5 6
Comment
ƒƒ6 =
;
ƒƒ= >
_repository
…… 
.
…… 
UpdateAsync
…… '
(
……' (
valuationEntity
……( 7
)
……7 8
;
……8 9
await
†† 
_unitOfWork
†† !
.
††! "
SaveChangesAsync
††" 2
(
††2 3
)
††3 4
;
††4 5
try
 
{
‰‰ 
await
‹‹ 
_auditLogService
‹‹ *
.
‹‹* +
CreateAuditLog
‹‹+ 9
<
‹‹9 :
ValuationRequest
‹‹: J
>
‹‹J K
(
‹‹K L!
AuditActionTypeEnum
‹‹L _
.
‹‹_ `
Update
‹‹` f
,
‹‹f g
	OldEntity
‹‹h q
,
‹‹q r
valuationEntity‹‹s ‚
,‹‹‚ ƒ
	TableName‹‹„ 
,‹‹ 
model‹‹ ”
.‹‹” •
Id‹‹• —
)‹‹— 
;‹‹ ™
var
 
newstatusname
 %
=
& '
_statusrepository
( 9
.
9 :
GetAll
: @
(
@ A
)
A B
.
B C
Where
C H
(
H I
x
I J
=>
K M
x
N O
.
O P
Id
P R
==
S U
valuationEntity
V e
.
e f
StatusId
f n
)
n o
.
o p
Select
p v
(
v w
x
w x
=>
y {
x
| }
.
} ~
Status~ „
)„ …
.… †
FirstOrDefault† ”
(” •
)• –
;– —
var
 
oldstatusname
 %
=
& '
_statusrepository
( 9
.
9 :
GetAll
: @
(
@ A
)
A B
.
B C
Where
C H
(
H I
x
I J
=>
K M
x
N O
.
O P
Id
P R
==
S U
	OldEntity
V _
.
_ `
StatusId
` h
)
h i
.
i j
Select
j p
(
p q
x
q r
=>
s u
x
v w
.
w x
Status
x ~
)
~ 
. €
FirstOrDefault€ 
( 
) 
; ‘
if
 
(
 
newstatusname
 %
!=
& (
oldstatusname
) 6
)
6 7
await
 !
SenddDetailsToEmail
 1
(
1 2!
RecepientActionEnum
2 E
.
E F$
ValuationStatusChanged
F \
,
\ ]
valuationEntity
^ m
.
m n
Id
n p
)
p q
;
q r
}
‘‘ 
catch
’’ 
(
’’ 
	Exception
’’  
ex
’’! #
)
’’# $
{
““ 
}
•• 
}
–– 
else
—— 
{
 
return
™™ 
DBOperation
™™ "
.
™™" #
NotFound
™™# +
;
™™+ ,
}
 
return
›› 
DBOperation
›› 
.
›› 
Success
›› &
;
››& '
}
 	
public
 
async
 
Task
 
<
 
List
 
<
 
ValuationMethod
 .
>
. /
>
/ 0#
GetAllValuationMethod
1 F
(
F G
)
G H
{
 	
var
΅΅ 
lstStf
΅΅ 
=
΅΅ 
EltizamDBHelper
΅΅ (
.
΅΅( )!
ExecuteMappedReader
΅΅) <
<
΅΅< =
ValuationMethod
΅΅= L
>
΅΅L M
(
΅΅M N 
ProcedureMetastore
΅΅N `
.
΅΅` a)
usp_ValuationMethod_AllList
΅΅a |
,
΅΅| } 
DatabaseConnection
ΆΆ ,
.
ΆΆ, -

ConnString
ΆΆ- 7
,
ΆΆ7 8
CommandType
ΆΆ9 D
.
ΆΆD E
StoredProcedure
ΆΆE T
,
ΆΆT U
null
ΆΆV Z
)
ΆΆZ [
;
ΆΆ[ \
return
¤¤ 
lstStf
¤¤ 
;
¤¤ 
}
¥¥ 	
public
§§ 
async
§§ 
Task
§§ 
<
§§ 
DBOperation
§§ %
>
§§% &
Upsert
§§' -
(
§§- .#
ValuationRequestModel
§§. C
entityValuation
§§D S
)
§§S T
{
¨¨ 	
ValuationRequest
©© 
objValuation
©© )
;
©©) *
string
ªª 
MainTableName
ªª  
=
ªª! "
Enum
ªª# '
.
ªª' (
GetName
ªª( /
(
ªª/ 0
TableNameEnum
ªª0 =
.
ªª= >
ValuationRequest
ªª> N
)
ªªN O
;
ªªO P
int
«« 
MainTableKey
«« 
=
«« 
entityValuation
«« .
.
««. /
Id
««/ 1
;
««1 2
try
­­ 
{
®® 
ValuationRequest
――  
	OldEntity
――! *
=
――+ ,
null
――- 1
;
――1 2
if
±± 
(
±± 
entityValuation
±± #
.
±±# $
Id
±±$ &
>
±±' (
$num
±±) *
)
±±* +
{
²² 
	OldEntity
³³ 
=
³³ 
_repository
³³  +
.
³³+ ,
GetNoTracking
³³, 9
(
³³9 :
entityValuation
³³: I
.
³³I J
Id
³³J L
)
³³L M
;
³³M N
objValuation
΄΄  
=
΄΄! "
_repository
΄΄# .
.
΄΄. /
Get
΄΄/ 2
(
΄΄2 3
entityValuation
΄΄3 B
.
΄΄B C
Id
΄΄C E
)
΄΄E F
;
΄΄F G
if
¶¶ 
(
¶¶ 
objValuation
¶¶ $
!=
¶¶% '
null
¶¶( ,
)
¶¶, -
{
·· 
objValuation
ΈΈ $
.
ΈΈ$ %
ReferenceNo
ΈΈ% 0
=
ΈΈ1 2
entityValuation
ΈΈ3 B
.
ΈΈB C
ReferenceNo
ΈΈC N
??
ΈΈO Q
$str
ΈΈR T
;
ΈΈT U
objValuation
ΉΉ $
.
ΉΉ$ %
OtherReferenceNo
ΉΉ% 5
=
ΉΉ6 7
entityValuation
ΉΉ8 G
.
ΉΉG H
OtherReferenceNo
ΉΉH X
;
ΉΉX Y
objValuation
ΊΊ $
.
ΊΊ$ %
StatusId
ΊΊ% -
=
ΊΊ. /
entityValuation
ΊΊ0 ?
.
ΊΊ? @
StatusId
ΊΊ@ H
;
ΊΊH I
objValuation
»» $
.
»»$ % 
ValuationTimeFrame
»»% 7
=
»»8 9
entityValuation
»»: I
.
»»I J 
ValuationTimeFrame
»»J \
;
»»\ ]
objValuation
ΌΌ $
.
ΌΌ$ %

ApproverId
ΌΌ% /
=
ΌΌ0 1
entityValuation
ΌΌ2 A
.
ΌΌA B

ApproverId
ΌΌB L
==
ΌΌM O
$num
ΌΌP Q
?
ΌΌR S
null
ΌΌT X
:
ΌΌY Z
entityValuation
ΌΌ[ j
.
ΌΌj k

ApproverId
ΌΌk u
;
ΌΌu v
objValuation
½½ $
.
½½$ %
ValuerId
½½% -
=
½½. /
entityValuation
½½0 ?
.
½½? @
ValuerId
½½@ H
==
½½I K
$num
½½L M
?
½½N O
null
½½P T
:
½½U V
entityValuation
½½W f
.
½½f g
ValuerId
½½g o
;
½½o p
objValuation
ΎΎ $
.
ΎΎ$ %
ValuationDate
ΎΎ% 2
=
ΎΎ3 4
entityValuation
ΎΎ5 D
.
ΎΎD E
ValuationDate
ΎΎE R
;
ΎΎR S
objValuation
ΏΏ $
.
ΏΏ$ %
ValuationModeId
ΏΏ% 4
=
ΏΏ5 6
entityValuation
ΏΏ7 F
.
ΏΏF G
ValuationModeId
ΏΏG V
;
ΏΏV W
objValuation
ΐΐ $
.
ΐΐ$ %

PropertyId
ΐΐ% /
=
ΐΐ0 1
entityValuation
ΐΐ2 A
.
ΐΐA B

PropertyId
ΐΐB L
;
ΐΐL M
objValuation
ΑΑ $
.
ΑΑ$ %
ClientId
ΑΑ% -
=
ΑΑ. /
entityValuation
ΑΑ0 ?
.
ΑΑ? @
ClientId
ΑΑ@ H
;
ΑΑH I
objValuation
ΒΒ $
.
ΒΒ$ %
ApproverComment
ΒΒ% 4
=
ΒΒ5 6
entityValuation
ΒΒ7 F
.
ΒΒF G
ApproverComment
ΒΒG V
;
ΒΒV W
objValuation
ΓΓ $
.
ΓΓ$ %

ModifiedBy
ΓΓ% /
=
ΓΓ0 1
entityValuation
ΓΓ2 A
.
ΓΓA B

ModifiedBy
ΓΓB L
;
ΓΓL M
_repository
ΕΕ #
.
ΕΕ# $
UpdateAsync
ΕΕ$ /
(
ΕΕ/ 0
objValuation
ΕΕ0 <
)
ΕΕ< =
;
ΕΕ= >
await
ΖΖ 
_unitOfWork
ΖΖ )
.
ΖΖ) *
SaveChangesAsync
ΖΖ* :
(
ΖΖ: ;
)
ΖΖ; <
;
ΖΖ< =
await
ΙΙ !"
UpsertApproverLevels
ΙΙ" 6
(
ΙΙ6 7
entityValuation
ΙΙ7 F
.
ΙΙF G
Id
ΙΙG I
,
ΙΙI J
entityValuation
ΙΙK Z
.
ΙΙZ [%
ValuationApprovalValues
ΙΙ[ r
,
ΙΙr s
entityValuationΙΙt ƒ
.ΙΙƒ „

ModifiedByΙΙ„ 
)ΙΙ 
;ΙΙ 
try
ΛΛ 
{
ΜΜ 
var
ΝΝ 
newstatusname
ΝΝ  -
=
ΝΝ. /
_statusrepository
ΝΝ0 A
.
ΝΝA B
GetAll
ΝΝB H
(
ΝΝH I
)
ΝΝI J
.
ΝΝJ K
Where
ΝΝK P
(
ΝΝP Q
x
ΝΝQ R
=>
ΝΝS U
x
ΝΝV W
.
ΝΝW X
Id
ΝΝX Z
==
ΝΝ[ ]
objValuation
ΝΝ^ j
.
ΝΝj k
StatusId
ΝΝk s
)
ΝΝs t
.
ΝΝt u
Select
ΝΝu {
(
ΝΝ{ |
x
ΝΝ| }
=>ΝΝ~ €
xΝΝ ‚
.ΝΝ‚ ƒ
StatusΝΝƒ ‰
)ΝΝ‰ 
.ΝΝ ‹
FirstOrDefaultΝΝ‹ ™
(ΝΝ™ 
)ΝΝ ›
;ΝΝ› 
var
ΞΞ 
oldstatusname
ΞΞ  -
=
ΞΞ. /
_statusrepository
ΞΞ0 A
.
ΞΞA B
GetAll
ΞΞB H
(
ΞΞH I
)
ΞΞI J
.
ΞΞJ K
Where
ΞΞK P
(
ΞΞP Q
x
ΞΞQ R
=>
ΞΞS U
x
ΞΞV W
.
ΞΞW X
Id
ΞΞX Z
==
ΞΞ[ ]
	OldEntity
ΞΞ^ g
.
ΞΞg h
StatusId
ΞΞh p
)
ΞΞp q
.
ΞΞq r
Select
ΞΞr x
(
ΞΞx y
x
ΞΞy z
=>
ΞΞ{ }
x
ΞΞ~ 
.ΞΞ €
StatusΞΞ€ †
)ΞΞ† ‡
.ΞΞ‡ 
FirstOrDefaultΞΞ –
(ΞΞ– —
)ΞΞ— 
;ΞΞ ™
if
ΠΠ 
(
ΠΠ  
newstatusname
ΠΠ  -
!=
ΠΠ. 0
oldstatusname
ΠΠ1 >
)
ΠΠ> ?
await
ΡΡ  %!
SenddDetailsToEmail
ΡΡ& 9
(
ΡΡ9 :!
RecepientActionEnum
ΡΡ: M
.
ΡΡM N$
ValuationStatusChanged
ΡΡN d
,
ΡΡd e
objValuation
ΡΡf r
.
ΡΡr s
Id
ΡΡs u
)
ΡΡu v
;
ΡΡv w
await
ΤΤ !
_auditLogService
ΤΤ" 2
.
ΤΤ2 3
CreateAuditLog
ΤΤ3 A
<
ΤΤA B
ValuationRequest
ΤΤB R
>
ΤΤR S
(
ΤΤS T!
AuditActionTypeEnum
ΤΤT g
.
ΤΤg h
Update
ΤΤh n
,
ΤΤn o
	OldEntity
ΤΤp y
,
ΤΤy z
objValuationΤΤ{ ‡
,ΤΤ‡ 
MainTableNameΤΤ‰ –
,ΤΤ– —
MainTableKeyΤΤ ¤
)ΤΤ¤ ¥
;ΤΤ¥ ¦
}
ΥΥ 
catch
ΦΦ 
(
ΦΦ 
	Exception
ΦΦ (
ex
ΦΦ) +
)
ΦΦ+ ,
{
ΧΧ 
}
ΨΨ 
}
ΩΩ 
else
ΪΪ 
{
ΫΫ 
return
άά 
DBOperation
άά *
.
άά* +
NotFound
άά+ 3
;
άά3 4
}
έέ 
}
ήή 
else
ίί 
{
ΰΰ 
var
αα 
lastReq
αα 
=
αα  !
_repository
αα" -
.
αα- .
GetAll
αα. 4
(
αα4 5
)
αα5 6
.
αα6 7
OrderByDescending
αα7 H
(
ααH I
a
ααI J
=>
ααK M
a
ααN O
.
ααO P
Id
ααP R
)
ααR S
.
ααS T
FirstOrDefault
ααT b
(
ααb c
)
ααc d
;
ααd e
objValuation
γγ  
=
γγ! "
_mapperFactory
γγ# 1
.
γγ1 2
Get
γγ2 5
<
γγ5 6#
ValuationRequestModel
γγ6 K
,
γγK L
ValuationRequest
γγM ]
>
γγ] ^
(
γγ^ _
entityValuation
γγ_ n
)
γγn o
;
γγo p
objValuation
δδ  
.
δδ  !
	CreatedBy
δδ! *
=
δδ+ ,
(
δδ- .
int
δδ. 1
)
δδ1 2
entityValuation
δδ2 A
.
δδA B
	CreatedBy
δδB K
;
δδK L
objValuation
εε  
.
εε  !
ReferenceNo
εε! ,
=
εε- .
string
εε/ 5
.
εε5 6
Format
εε6 <
(
εε< =
$str
εε= E
,
εεE F
AppConstants
εεG S
.
εεS T!
ID_ValuationRequest
εεT g
,
εεg h
lastReq
εεi p
?
εεp q
.
εεq r
Id
εεr t
+
εεu v
$num
εεw x
)
εεx y
;
εεy z
objValuation
ζζ  
.
ζζ  !

ApproverId
ζζ! +
=
ζζ, -
objValuation
ζζ. :
.
ζζ: ;

ApproverId
ζζ; E
==
ζζF H
$num
ζζI J
?
ζζK L
null
ζζM Q
:
ζζR S
objValuation
ζζT `
.
ζζ` a

ApproverId
ζζa k
;
ζζk l
objValuation
ηη  
.
ηη  !
ValuerId
ηη! )
=
ηη* +
objValuation
ηη, 8
.
ηη8 9
ValuerId
ηη9 A
==
ηηB D
$num
ηηE F
?
ηηG H
null
ηηI M
:
ηηN O
objValuation
ηηP \
.
ηη\ ]
ValuerId
ηη] e
;
ηηe f
_repository
ιι 
.
ιι  
AddAsync
ιι  (
(
ιι( )
objValuation
ιι) 5
)
ιι5 6
;
ιι6 7
await
κκ 
_unitOfWork
κκ %
.
κκ% &
SaveChangesAsync
κκ& 6
(
κκ6 7
)
κκ7 8
;
κκ8 9
try
μμ 
{
νν 
await
ξξ !
SenddDetailsToEmail
ξξ 1
(
ξξ1 2!
RecepientActionEnum
ξξ2 E
.
ξξE F
ValuationCreated
ξξF V
,
ξξV W
objValuation
ξξX d
.
ξξd e
Id
ξξe g
)
ξξg h
;
ξξh i
}
οο 
catch
ππ 
(
ππ 
	Exception
ππ $
ex
ππ% '
)
ππ' (
{
ρρ 
}
ςς 
}
σσ 
if
υυ 
(
υυ 
objValuation
υυ  
.
υυ  !
Id
υυ! #
==
υυ$ &
$num
υυ' (
)
υυ( )
return
φφ 
DBOperation
φφ &
.
φφ& '
Error
φφ' ,
;
φφ, -
return
ψψ 
DBOperation
ψψ "
.
ψψ" #
Success
ψψ# *
;
ψψ* +
}
ωω 
catch
ϊϊ 
(
ϊϊ 
	Exception
ϊϊ 
ex
ϊϊ 
)
ϊϊ  
{
ϋϋ 
throw
όό 
ex
όό 
;
όό 
}
ύύ 
}
ώώ 	
public
€€ 
async
€€ 
Task
€€ 
<
€€ *
ValuationRequestDependencies
€€ 6
>
€€6 7%
GetValuationRequestInfo
€€8 O
(
€€O P
int
€€P S
Id
€€T V
)
€€V W
{
 	
DbParameter
‚‚ 
[
‚‚ 
]
‚‚ 
osqlParameter
‚‚ '
=
‚‚( )
{
ƒƒ 
new
„„ 
DbParameter
„„ 
(
„„  
$str
„„  $
,
„„$ %
Id
„„& (
,
„„( )
	SqlDbType
„„* 3
.
„„3 4
Int
„„4 7
)
„„7 8
,
„„8 9
}
…… 
;
…… 
var
†† 
res
†† 
=
†† 
EltizamDBHelper
†† %
.
††% &!
ExecuteMappedReader
††& 9
<
††9 :*
ValuationRequestDependencies
††: V
>
††V W
(
††W X 
ProcedureMetastore
††X j
.
††j k3
$usp_ValuationRequest_GetDependencies††k 
,††  
DatabaseConnection
‡‡ (
.
‡‡( )

ConnString
‡‡) 3
,
‡‡3 4
CommandType
‡‡5 @
.
‡‡@ A
StoredProcedure
‡‡A P
,
‡‡P Q
osqlParameter
‡‡R _
)
‡‡_ `
.
‡‡` a
FirstOrDefault
‡‡a o
(
‡‡o p
)
‡‡p q
;
‡‡q r
return
 
res
 
;
 
}
‰‰ 	
public
‹‹ 
async
‹‹ 
Task
‹‹ 
<
‹‹ #
ValuationRequestModel
‹‹ /
>
‹‹/ 0
GetById
‹‹1 8
(
‹‹8 9
int
‹‹9 <
id
‹‹= ?
)
‹‹? @
{
 	
try
 
{
 
var
 
sitetableName
 !
=
" #
Enum
$ (
.
( )
GetName
) 0
(
0 1
TableNameEnum
1 >
.
> ?
SiteDescription
? N
)
N O
;
O P
var
 
evidencetableName
 %
=
& '
Enum
( ,
.
, -
GetName
- 4
(
4 5
TableNameEnum
5 B
.
B C!
Comparable_Evidence
C V
)
V W
;
W X
var
‘‘  
assesmenttableName
‘‘ &
=
‘‘' (
Enum
‘‘) -
.
‘‘- .
GetName
‘‘. 5
(
‘‘5 6
TableNameEnum
‘‘6 C
.
‘‘C D#
Valuation_Assessement
‘‘D Y
)
‘‘Y Z
;
‘‘Z [
var
’’ 
_ValuationEntity
’’ $
=
’’% &
new
’’' *#
ValuationRequestModel
’’+ @
(
’’@ A
)
’’A B
;
’’B C
var
”” 
_assesmentAction
”” $
=
””% &
new
””' *+
ValuationAssesmentActionModel
””+ H
(
””H I
)
””I J
;
””J K
var
•• 
siteDescription
•• #
=
••$ %
new
••& )"
SiteDescriptionModel
••* >
(
••> ?
)
••? @
;
••@ A
var
–– 
compevidence
––  
=
––! "
new
––# &%
ComparableEvidenceModel
––' >
(
––> ?
)
––? @
;
––@ A
var
—— 
assement
—— 
=
—— 
new
—— "'
ValuationAssessementModel
——# <
(
——< =
)
——= >
;
——> ?
var
 
approvellevel
 !
=
" #
new
$ '
List
( ,
<
, -0
"ValuationRequestApproverLevelModel
- O
>
O P
(
P Q
)
Q R
;
R S
_ValuationEntity
™™  
=
™™! "
_mapperFactory
™™# 1
.
™™1 2
Get
™™2 5
<
™™5 6
ValuationRequest
™™6 F
,
™™F G#
ValuationRequestModel
™™H ]
>
™™] ^
(
™™^ _
await
™™_ d
_repository
™™e p
.
™™p q
GetAsync
™™q y
(
™™y z
id
™™z |
)
™™| }
)
™™} ~
;
™™~ 
_ValuationEntity
  
.
  ! 
ValuationAssesment
! 3
=
4 5
new
6 9+
ValuationAssesmentActionModel
: W
(
W X
)
X Y
;
Y Z
_ValuationEntity
››  
.
››  ! 
ValuationAssesment
››! 3
.
››3 4
SiteDescription
››4 C
=
››D E
new
››F I"
SiteDescriptionModel
››J ^
(
››^ _
)
››_ `
;
››` a
_ValuationEntity
  
.
  ! 
ValuationAssesment
! 3
.
3 4%
comparableEvidenceModel
4 K
=
L M
new
N Q%
ComparableEvidenceModel
R i
(
i j
)
j k
;
k l
_ValuationEntity
  
.
  ! 
ValuationAssesment
! 3
.
3 4'
valuationAssessementModel
4 M
=
N O
new
P S'
ValuationAssessementModel
T m
(
m n
)
n o
;
o p
_ValuationEntity
  
.
  !+
ValuationRequestApproverLevel
! >
=
? @
new
A D
List
E I
<
I J0
"ValuationRequestApproverLevelModel
J l
>
l m
(
m n
)
n o
;
o p
var
   
res
   
=
   
await
   %
GetValuationRequestInfo
    7
(
  7 8
id
  8 :
)
  : ;
;
  ; <
if
ΆΆ 
(
ΆΆ 
res
ΆΆ 
!=
ΆΆ 
null
ΆΆ 
)
ΆΆ  
{
££ 
_ValuationEntity
¤¤ $
.
¤¤$ %
ClientId
¤¤% -
=
¤¤. /
res
¤¤0 3
.
¤¤3 4
ClientId
¤¤4 <
;
¤¤< =
_ValuationEntity
¥¥ $
.
¥¥$ %
ClientTypeId
¥¥% 1
=
¥¥2 3
res
¥¥4 7
.
¥¥7 8
ClientTypeId
¥¥8 D
;
¥¥D E
_ValuationEntity
¦¦ $
.
¦¦$ %

ClientName
¦¦% /
=
¦¦0 1
res
¦¦2 5
.
¦¦5 6

ClientName
¦¦6 @
;
¦¦@ A
_ValuationEntity
§§ $
.
§§$ %
PropertyTypeId
§§% 3
=
§§4 5
res
§§6 9
.
§§9 :
PropertyTypeId
§§: H
;
§§H I
_ValuationEntity
¨¨ $
.
¨¨$ %
PropertyName
¨¨% 1
=
¨¨2 3
res
¨¨4 7
.
¨¨7 8
PropertyType
¨¨8 D
;
¨¨D E
_ValuationEntity
©© $
.
©©$ %
PropertySubTypeId
©©% 6
=
©©7 8
res
©©9 <
.
©©< =
PropertySubTypeId
©©= N
;
©©N O
_ValuationEntity
ªª $
.
ªª$ %
PropertySubType
ªª% 4
=
ªª5 6
res
ªª7 :
.
ªª: ;
PropertySubType
ªª; J
;
ªªJ K
_ValuationEntity
«« $
.
««$ %
OwnershipTypeId
««% 4
=
««5 6
res
««7 :
.
««: ;
OwnershipTypeId
««; J
;
««J K
_ValuationEntity
¬¬ $
.
¬¬$ %
OwnershipType
¬¬% 2
=
¬¬3 4
res
¬¬5 8
.
¬¬8 9
OwnershipType
¬¬9 F
;
¬¬F G
_ValuationEntity
­­ $
.
­­$ %

PropertyId
­­% /
=
­­0 1
res
­­2 5
.
­­5 6

PropertyId
­­6 @
;
­­@ A
_ValuationEntity
®® $
.
®®$ %
PropertyName
®®% 1
=
®®2 3
res
®®4 7
.
®®7 8
PropertyName
®®8 D
;
®®D E
_ValuationEntity
―― $
.
――$ %

UnitTypeId
――% /
=
――0 1
res
――2 5
.
――5 6

UnitTypeId
――6 @
;
――@ A
_ValuationEntity
°° $
.
°°$ %
FurnishedId
°°% 0
=
°°1 2
res
°°3 6
.
°°6 7
FurnishedId
°°7 B
;
°°B C
_ValuationEntity
±± $
.
±±$ %
LocationCountryId
±±% 6
=
±±7 8
res
±±9 <
.
±±< =
LocationCountryId
±±= N
;
±±N O
_ValuationEntity
²² $
.
²²$ %
LocationStateId
²²% 4
=
²²5 6
res
²²7 :
.
²²: ;
LocationStateId
²²; J
;
²²J K
_ValuationEntity
³³ $
.
³³$ %
LocationCityId
³³% 3
=
³³4 5
res
³³6 9
.
³³9 :
LocationCityId
³³: H
;
³³H I
_ValuationEntity
΄΄ $
.
΄΄$ %

StatusName
΄΄% /
=
΄΄0 1
res
΄΄2 5
.
΄΄5 6

StatusName
΄΄6 @
;
΄΄@ A
_ValuationEntity
µµ $
.
µµ$ %
	ColorCode
µµ% .
=
µµ/ 0
res
µµ1 4
.
µµ4 5
	ColorCode
µµ5 >
;
µµ> ?
_ValuationEntity
¶¶ $
.
¶¶$ %
BackGroundColor
¶¶% 4
=
¶¶5 6
res
¶¶7 :
.
¶¶: ;
BackGroundColor
¶¶; J
;
¶¶J K
siteDescription
ΈΈ #
=
ΈΈ$ %
_mapperFactory
ΈΈ& 4
.
ΈΈ4 5
Get
ΈΈ5 8
<
ΈΈ8 9&
ValuationSiteDescription
ΈΈ9 Q
,
ΈΈQ R"
SiteDescriptionModel
ΈΈS g
>
ΈΈg h
(
ΈΈh i
_siterepository
ΈΈi x
.
ΈΈx y
Get
ΈΈy |
(
ΈΈ| }
x
ΈΈ} ~
=>ΈΈ 
xΈΈ‚ ƒ
.ΈΈƒ „"
ValuationRequestIdΈΈ„ –
==ΈΈ— ™
idΈΈ 
)ΈΈ 
)ΈΈ 
;ΈΈ 
approvellevel
»» !
=
»»" #
await
»»$ )
GetApproverLevel
»»* :
(
»»: ;
id
»»; =
)
»»= >
;
»»> ?
_ValuationEntity
ΌΌ $
.
ΌΌ$ %+
ValuationRequestApproverLevel
ΌΌ% B
=
ΌΌC D
approvellevel
ΌΌE R
;
ΌΌR S
if
ΏΏ 
(
ΏΏ 
siteDescription
ΏΏ '
!=
ΏΏ( *
null
ΏΏ+ /
)
ΏΏ/ 0
{
ΐΐ 
_ValuationEntity
ΑΑ (
.
ΑΑ( ) 
ValuationAssesment
ΑΑ) ;
.
ΑΑ; <
SiteDescription
ΑΑ< K
=
ΑΑL M
siteDescription
ΑΑN ]
;
ΑΑ] ^
DbParameter
ΒΒ #
[
ΒΒ# $
]
ΒΒ$ %
osqlParameter2
ΒΒ& 4
=
ΒΒ5 6
{
ΓΓ 
new
ΔΔ 
DbParameter
ΔΔ '
(
ΔΔ' (
AppConstants
ΔΔ( 4
.
ΔΔ4 5

TableKeyId
ΔΔ5 ?
,
ΔΔ? @
siteDescription
ΔΔA P
.
ΔΔP Q
Id
ΔΔQ S
,
ΔΔS T
	SqlDbType
ΔΔU ^
.
ΔΔ^ _
Int
ΔΔ_ b
)
ΔΔb c
,
ΔΔc d
new
ΕΕ 
DbParameter
ΕΕ '
(
ΕΕ' (
AppConstants
ΕΕ( 4
.
ΕΕ4 5
	TableName
ΕΕ5 >
,
ΕΕ> ?
sitetableName
ΕΕA N
,
ΕΕN O
	SqlDbType
ΕΕP Y
.
ΕΕY Z
VarChar
ΕΕZ a
)
ΕΕa b
,
ΕΕb c
}
ΖΖ 
;
ΖΖ 
var
ΘΘ 
siteDocuments
ΘΘ )
=
ΘΘ* +
EltizamDBHelper
ΘΘ, ;
.
ΘΘ; <!
ExecuteMappedReader
ΘΘ< O
<
ΘΘO P!
MasterDocumentModel
ΘΘP c
>
ΘΘc d
(
ΘΘd e 
ProcedureMetastore
ΘΘe w
.
ΘΘw x3
$usp_Document_GetDocumentByTableKeyIdΘΘx 
,ΘΘ  
DatabaseConnection
ΙΙ, >
.
ΙΙ> ?

ConnString
ΙΙ? I
,
ΙΙI J
System
ΙΙK Q
.
ΙΙQ R
Data
ΙΙR V
.
ΙΙV W
CommandType
ΙΙW b
.
ΙΙb c
StoredProcedure
ΙΙc r
,
ΙΙr s
osqlParameter2ΙΙt ‚
)ΙΙ‚ ƒ
;ΙΙƒ „
if
ΛΛ 
(
ΛΛ 
siteDocuments
ΛΛ )
!=
ΛΛ* ,
null
ΛΛ- 1
)
ΛΛ1 2
_ValuationEntity
ΜΜ ,
.
ΜΜ, - 
ValuationAssesment
ΜΜ- ?
.
ΜΜ? @
SiteDescription
ΜΜ@ O
.
ΜΜO P
	Documents
ΜΜP Y
=
ΜΜZ [
siteDocuments
ΜΜ\ i
;
ΜΜi j
}
ΝΝ 
compevidence
ΡΡ  
=
ΡΡ! "
_mapperFactory
ΡΡ# 1
.
ΡΡ1 2
Get
ΡΡ2 5
<
ΡΡ5 6)
ValuationComparableEvidence
ΡΡ6 Q
,
ΡΡQ R%
ComparableEvidenceModel
ΡΡS j
>
ΡΡj k
(
ΡΡk l!
_evidencerepository
ΡΡl 
.ΡΡ €
GetΡΡ€ ƒ
(ΡΡƒ „
xΡΡ„ …
=>ΡΡ† 
xΡΡ‰ 
.ΡΡ ‹
	RequestIdΡΡ‹ ”
==ΡΡ• —
idΡΡ 
)ΡΡ ›
)ΡΡ› 
;ΡΡ 
if
ΣΣ 
(
ΣΣ 
compevidence
ΣΣ $
!=
ΣΣ% '
null
ΣΣ( ,
)
ΣΣ, -
{
ΤΤ 
_ValuationEntity
ΥΥ (
.
ΥΥ( ) 
ValuationAssesment
ΥΥ) ;
.
ΥΥ; <%
comparableEvidenceModel
ΥΥ< S
=
ΥΥT U
compevidence
ΥΥV b
;
ΥΥb c
DbParameter
ΦΦ #
[
ΦΦ# $
]
ΦΦ$ %
osqlParameter3
ΦΦ& 4
=
ΦΦ5 6
{
ΧΧ 
new
ΨΨ 
DbParameter
ΨΨ '
(
ΨΨ' (
AppConstants
ΨΨ( 4
.
ΨΨ4 5

TableKeyId
ΨΨ5 ?
,
ΨΨ? @
compevidence
ΨΨA M
.
ΨΨM N
Id
ΨΨN P
,
ΨΨP Q
	SqlDbType
ΨΨR [
.
ΨΨ[ \
Int
ΨΨ\ _
)
ΨΨ_ `
,
ΨΨ` a
new
ΩΩ 
DbParameter
ΩΩ '
(
ΩΩ' (
AppConstants
ΩΩ( 4
.
ΩΩ4 5
	TableName
ΩΩ5 >
,
ΩΩ> ?
evidencetableName
ΩΩA R
,
ΩΩR S
	SqlDbType
ΩΩT ]
.
ΩΩ] ^
VarChar
ΩΩ^ e
)
ΩΩe f
,
ΩΩf g
}
ΪΪ 
;
ΪΪ 
var
έέ 
compDocument
έέ (
=
έέ) *
EltizamDBHelper
έέ+ :
.
έέ: ;!
ExecuteMappedReader
έέ; N
<
έέN O!
MasterDocumentModel
έέO b
>
έέb c
(
έέc d 
ProcedureMetastore
έέd v
.
έέv w3
$usp_Document_GetDocumentByTableKeyIdέέw ›
,έέ›  
DatabaseConnection
ήή+ =
.
ήή= >

ConnString
ήή> H
,
ήήH I
System
ήήJ P
.
ήήP Q
Data
ήήQ U
.
ήήU V
CommandType
ήήV a
.
ήήa b
StoredProcedure
ήήb q
,
ήήq r
osqlParameter3ήήs 
)ήή ‚
;ήή‚ ƒ
if
ίί 
(
ίί 
compDocument
ίί (
!=
ίί) +
null
ίί, 0
)
ίί0 1
{
ΰΰ 
_ValuationEntity
αα ,
.
αα, - 
ValuationAssesment
αα- ?
.
αα? @%
comparableEvidenceModel
αα@ W
.
ααW X
	Documents
ααX a
=
ααb c
compDocument
ααd p
;
ααp q
}
ββ 
}
γγ 
assement
ζζ 
=
ζζ 
_mapperFactory
ζζ -
.
ζζ- .
Get
ζζ. 1
<
ζζ1 2 
ValuationAssesment
ζζ2 D
,
ζζD E'
ValuationAssessementModel
ζζF _
>
ζζ_ `
(
ζζ` a#
_assesmenterepository
ζζa v
.
ζζv w
Get
ζζw z
(
ζζz {
x
ζζ{ |
=>
ζζ} 
xζζ€ 
.ζζ ‚
	RequestIdζζ‚ ‹
==ζζ 
idζζ ‘
)ζζ‘ ’
)ζζ’ “
;ζζ“ ”
if
ηη 
(
ηη 
assement
ηη  
!=
ηη! #
null
ηη$ (
)
ηη( )
{
θθ 
_ValuationEntity
ιι (
.
ιι( ) 
ValuationAssesment
ιι) ;
.
ιι; <'
valuationAssessementModel
ιι< U
=
ιιV W
assement
ιιX `
;
ιι` a
DbParameter
λλ #
[
λλ# $
]
λλ$ %
osqlParameter4
λλ& 4
=
λλ5 6
{
μμ 
new
νν 
DbParameter
νν '
(
νν' (
AppConstants
νν( 4
.
νν4 5

TableKeyId
νν5 ?
,
νν? @
compevidence
ννA M
.
ννM N
Id
ννN P
,
ννP Q
	SqlDbType
ννR [
.
νν[ \
Int
νν\ _
)
νν_ `
,
νν` a
new
ξξ 
DbParameter
ξξ '
(
ξξ' (
AppConstants
ξξ( 4
.
ξξ4 5
	TableName
ξξ5 >
,
ξξ> ? 
assesmenttableName
ξξA S
,
ξξS T
	SqlDbType
ξξU ^
.
ξξ^ _
VarChar
ξξ_ f
)
ξξf g
,
ξξg h
}
οο 
;
οο 
var
ρρ 
assesmentDocument
ρρ -
=
ρρ. /
EltizamDBHelper
ρρ0 ?
.
ρρ? @!
ExecuteMappedReader
ρρ@ S
<
ρρS T!
MasterDocumentModel
ρρT g
>
ρρg h
(
ρρh i 
ProcedureMetastore
ρρi {
.
ρρ{ |3
$usp_Document_GetDocumentByTableKeyIdρρ|  
,ρρ  ΅ 
DatabaseConnection
ςς0 B
.
ςςB C

ConnString
ςςC M
,
ςςM N
System
ςςO U
.
ςςU V
Data
ςςV Z
.
ςςZ [
CommandType
ςς[ f
.
ςςf g
StoredProcedure
ςςg v
,
ςςv w
osqlParameter4ςςx †
)ςς† ‡
;ςς‡ 
if
σσ 
(
σσ 
assesmentDocument
σσ -
!=
σσ. 0
null
σσ1 5
)
σσ5 6
{
ττ 
_ValuationEntity
υυ ,
.
υυ, - 
ValuationAssesment
υυ- ?
.
υυ? @'
valuationAssessementModel
υυ@ Y
.
υυY Z
	Documents
υυZ c
=
υυd e
assesmentDocument
υυf w
;
υυw x
}
φφ 
}
χχ 
}
ψψ 
return
ϊϊ 
_ValuationEntity
ϊϊ '
;
ϊϊ' (
}
ϋϋ 
catch
όό 
(
όό 
	Exception
όό 
ex
όό 
)
όό  
{
ύύ 
throw
ώώ 
ex
ώώ 
;
ώώ 
}
ÿÿ 
}
€€ 	
public
ƒƒ 
async
ƒƒ 
Task
ƒƒ 
<
ƒƒ 
DBOperation
ƒƒ %
>
ƒƒ% &
Delete
ƒƒ' -
(
ƒƒ- .
int
ƒƒ. 1
id
ƒƒ2 4
)
ƒƒ4 5
{
„„ 	
var
…… 
entityValuation
…… 
=
……  !
_repository
……" -
.
……- .
Get
……. 1
(
……1 2
x
……2 3
=>
……4 6
x
……7 8
.
……8 9
Id
……9 ;
==
……< >
id
……? A
)
……A B
;
……B C
if
‡‡ 
(
‡‡ 
entityValuation
‡‡ 
==
‡‡  "
null
‡‡# '
)
‡‡' (
return
 
DBOperation
 "
.
" #
NotFound
# +
;
+ ,
_repository
 
.
 
Remove
 
(
 
entityValuation
 .
)
. /
;
/ 0
await
 
_unitOfWork
 
.
 
SaveChangesAsync
 .
(
. /
)
/ 0
;
0 1
return
 
DBOperation
 
.
 
Success
 &
;
& '
}
 	
public
‘‘ 
async
‘‘ 
Task
‘‘ 
<
‘‘ 
bool
‘‘ 
>
‘‘ !
SenddDetailsToEmail
‘‘  3
(
‘‘3 4!
RecepientActionEnum
‘‘4 G
subjectEnum
‘‘H S
,
‘‘S T
int
‘‘U X 
valuationrequestId
‘‘Y k
)
‘‘k l
{
’’ 	
try
““ 
{
”” 
var
•• 
notificationModel
•• %
=
••& '"
_notificationService
••( <
.
••< =*
GetValuationNotificationData
••= Y
(
••Y Z
subjectEnum
••Z e
,
••e f 
valuationrequestId
••g y
)
••y z
;
••z {
string
—— 
strHtml
—— 
=
——  
File
——! %
.
——% &
ReadAllText
——& 1
(
——1 2
$str
——2 u
)
——u v
;
——v w
if
 
(
 
subjectEnum
 
==
  "!
RecepientActionEnum
# 6
.
6 7
ValuationCreated
7 G
)
G H
{
™™ 
strHtml
 
=
 
File
 "
.
" #
ReadAllText
# .
(
. /
$str
/ m
)
m n
;
n o
}
›› 
strHtml
 
=
 
strHtml
 !
.
! "
Replace
" )
(
) *
$str
* 8
,
8 9
notificationModel
: K
.
K L
ValRefNo
L T
)
T U
;
U V
strHtml
 
=
 
strHtml
 !
.
! "
Replace
" )
(
) *
$str
* 4
,
4 5
DateTime
6 >
.
> ?
Now
? B
.
B C
ToString
C K
(
K L
$str
L Y
)
Y Z
)
Z [
;
[ \
strHtml
 
=
 
strHtml
 !
.
! "
Replace
" )
(
) *
$str
* 9
,
9 :
notificationModel
; L
.
L M
Status
M S
)
S T
;
T U
notificationModel
   !
.
  ! "
Subject
  " )
=
  * +

EnumHelper
  , 6
.
  6 7
GetDescription
  7 E
(
  E F
subjectEnum
  F Q
)
  Q R
;
  R S
notificationModel
΅΅ !
.
΅΅! "
Body
΅΅" &
=
΅΅' (
strHtml
΅΅) 0
;
΅΅0 1
await
££ "
_notificationService
££ *
.
££* +
	SendEmail
££+ 4
(
££4 5
notificationModel
££5 F
)
££F G
;
££G H
return
¤¤ 
true
¤¤ 
;
¤¤ 
}
¥¥ 
catch
¦¦ 
(
¦¦ 
	Exception
¦¦ 
)
¦¦ 
{
§§ 
return
¨¨ 
false
¨¨ 
;
¨¨ 
}
©© 
}
ªª 	
public
­­ 
async
­­ 
Task
­­ 
<
­­ 
DBOperation
­­ %
>
­­% &"
UpsertApproverLevels
­­' ;
(
­­; <
int
­­< ?
ValReqId
­­@ H
,
­­H I
string
­­J P
RequestData
­­Q \
,
­­\ ]
int
­­^ a
?
­­a b
	CreatedBy
­­c l
,
­­l m
int
­­n q
?
­­q r
	ValQuotId
­­s |
=
­­} ~
null­­ ƒ
)­­ƒ „
{
®® 	
DbParameter
―― 
[
―― 
]
―― 
osqlParameter
―― '
=
――( )
{
°° 
new
±± 
DbParameter
±± 
(
±±  
$str
±±  *
,
±±* +
ValReqId
±±/ 7
,
±±7 8
	SqlDbType
±±9 B
.
±±B C
Int
±±C F
)
±±F G
,
±±G H
new
²² 
DbParameter
²² 
(
²²  
$str
²²  +
,
²²+ ,
	CreatedBy
²²/ 8
,
²²8 9
	SqlDbType
²²: C
.
²²C D
Int
²²D G
)
²²G H
,
²²H I
new
³³ 
DbParameter
³³ 
(
³³  
$str
³³  +
,
³³+ ,
	ValQuotId
³³/ 8
,
³³8 9
	SqlDbType
³³: C
.
³³C D
Int
³³D G
)
³³G H
,
³³H I
new
΄΄ 
DbParameter
΄΄ 
(
΄΄  
$str
΄΄  -
,
΄΄- .
RequestData
΄΄/ :
,
΄΄: ;
	SqlDbType
΄΄< E
.
΄΄E F
VarChar
΄΄F M
)
΄΄M N
,
΄΄N O
}
µµ 
;
µµ 
EltizamDBHelper
·· 
.
·· 
ExecuteNonQuery
·· +
(
··+ , 
ProcedureMetastore
··, >
.
··> ?7
)usp_ValuationRequest_UpsertApproverLevels
··? h
,
··h i 
DatabaseConnection
··j |
.
··| }

ConnString··} ‡
,··‡ 
CommandType··‰ ”
.··” •
StoredProcedure··• ¤
,··¤ ¥
osqlParameter··¦ ³
)··³ ΄
;··΄ µ
return
ΈΈ 
DBOperation
ΈΈ 
.
ΈΈ 
Success
ΈΈ &
;
ΈΈ& '
}
ΉΉ 	
public
ΌΌ 
async
ΌΌ 
Task
ΌΌ 
<
ΌΌ 
List
ΌΌ 
<
ΌΌ 0
"ValuationRequestApproverLevelModel
ΌΌ A
>
ΌΌA B
>
ΌΌB C
GetApproverLevel
ΌΌD T
(
ΌΌT U
int
ΌΌU X
ValReqId
ΌΌY a
,
ΌΌa b
decimal
ΌΌc j
?
ΌΌj k
Amount
ΌΌl r
=
ΌΌs t
null
ΌΌu y
)
ΌΌy z
{
½½ 	
DbParameter
ΎΎ 
[
ΎΎ 
]
ΎΎ 
osqlParameter
ΎΎ '
=
ΎΎ( )
{
ΏΏ 
new
ΐΐ 
DbParameter
ΐΐ 
(
ΐΐ  
$str
ΐΐ  *
,
ΐΐ* +
ValReqId
ΐΐ, 4
,
ΐΐ4 5
	SqlDbType
ΐΐ6 ?
.
ΐΐ? @
Int
ΐΐ@ C
)
ΐΐC D
,
ΐΐD E
new
ΑΑ 
DbParameter
ΑΑ 
(
ΑΑ  
$str
ΑΑ  (
,
ΑΑ( )
Amount
ΑΑ* 0
,
ΑΑ0 1
	SqlDbType
ΑΑ6 ?
.
ΑΑ? @
Decimal
ΑΑ@ G
)
ΑΑG H
}
ΒΒ 
;
ΒΒ 
var
ΔΔ 
lstStf
ΔΔ 
=
ΔΔ 
EltizamDBHelper
ΔΔ (
.
ΔΔ( )!
ExecuteMappedReader
ΔΔ) <
<
ΔΔ< =0
"ValuationRequestApproverLevelModel
ΔΔ= _
>
ΔΔ_ `
(
ΔΔ` a 
ProcedureMetastore
ΔΔa s
.
ΔΔs t1
"usp_ValuationRequest_ApproverLevelΔΔt –
,ΔΔ– —"
DatabaseConnectionΔΔ ª
.ΔΔª «

ConnStringΔΔ« µ
,ΔΔµ ¶
CommandTypeΔΔ· Β
.ΔΔΒ Γ
StoredProcedureΔΔΓ Ò
,ΔΔÒ Σ
osqlParameterΔΔΤ α
)ΔΔα β
;ΔΔβ γ
return
ΕΕ 
lstStf
ΕΕ 
;
ΕΕ 
}
ΖΖ 	
public
ΘΘ 
async
ΘΘ 
Task
ΘΘ 
<
ΘΘ 
DBOperation
ΘΘ %
>
ΘΘ% &#
ApproverActionComment
ΘΘ' <
(
ΘΘ< =(
ApproverActionCommentModel
ΘΘ= W
model
ΘΘX ]
)
ΘΘ] ^
{
ΙΙ 	
if
ΚΚ 
(
ΚΚ 
model
ΚΚ 
.
ΚΚ 
	RequestId
ΚΚ 
>
ΚΚ  !
$num
ΚΚ" #
)
ΚΚ# $
{
ΛΛ 
DbParameter
ΜΜ 
[
ΜΜ 
]
ΜΜ 
osqlParameter
ΜΜ +
=
ΜΜ, -
{
ΝΝ 
new
ΞΞ 
DbParameter
ΞΞ #
(
ΞΞ# $
$str
ΞΞ$ .
,
ΞΞ. /
model
ΞΞ3 8
.
ΞΞ8 9
	RequestId
ΞΞ9 B
,
ΞΞB C
	SqlDbType
ΞΞD M
.
ΞΞM N
Int
ΞΞN Q
)
ΞΞQ R
,
ΞΞR S
new
ΟΟ 
DbParameter
ΟΟ #
(
ΟΟ# $
$str
ΟΟ$ /
,
ΟΟ/ 0
model
ΟΟ3 8
.
ΟΟ8 9
	CreatedBy
ΟΟ9 B
,
ΟΟB C
	SqlDbType
ΟΟD M
.
ΟΟM N
Int
ΟΟN Q
)
ΟΟQ R
,
ΟΟR S
new
ΠΠ 
DbParameter
ΠΠ #
(
ΠΠ# $
$str
ΠΠ$ -
,
ΠΠ- .
model
ΠΠ1 6
.
ΠΠ6 7
Comment
ΠΠ7 >
,
ΠΠ> ?
	SqlDbType
ΠΠ@ I
.
ΠΠI J
VarChar
ΠΠJ Q
)
ΠΠQ R
,
ΠΠR S
new
ΡΡ 
DbParameter
ΡΡ #
(
ΡΡ# $
$str
ΡΡ$ 0
,
ΡΡ0 1
model
ΡΡ4 9
.
ΡΡ9 :

StatusCode
ΡΡ: D
,
ΡΡD E
	SqlDbType
ΡΡF O
.
ΡΡO P
VarChar
ΡΡP W
)
ΡΡW X
,
ΡΡX Y
}
ÒÒ 
;
ÒÒ 
EltizamDBHelper
ΤΤ 
.
ΤΤ  
ExecuteNonQuery
ΤΤ  /
(
ΤΤ/ 0 
ProcedureMetastore
ΤΤ0 B
.
ΤΤB C1
#usp_ValuationRequest_PerformActions
ΤΤC f
,
ΤΤf g 
DatabaseConnection
ΤΤh z
.
ΤΤz {

ConnStringΤΤ{ …
,ΤΤ… †
CommandTypeΤΤ‡ ’
.ΤΤ’ “
StoredProcedureΤΤ“ Ά
,ΤΤΆ £
osqlParameterΤΤ¤ ±
)ΤΤ± ²
;ΤΤ² ³
return
ΦΦ 
DBOperation
ΦΦ "
.
ΦΦ" #
Success
ΦΦ# *
;
ΦΦ* +
}
ΨΨ 
else
ΩΩ 
{
ΪΪ 
return
ΫΫ 
DBOperation
ΫΫ "
.
ΫΫ" #
NotFound
ΫΫ# +
;
ΫΫ+ ,
}
άά 
return
έέ 
DBOperation
έέ 
.
έέ 
Success
έέ &
;
έέ& '
}
ήή 	
}
ίί 
}ΰΰ 
BD:\EltizamLive\Eltizam.Business.Core\Interface\IAuditLogService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
	Interface  )
{ 
public 

	interface 
IAuditLogService %
{ 
Task		 
<		 
bool		 
>		 
CreateAuditLog		 !
<		! "
TResult		" )
>		) *
(		* +
AuditActionTypeEnum		+ >
auditActionType		? N
,		N O
TResult		P W
	oldEntity		X a
,		a b
TResult		c j
	newEntity		k t
,		t u
string		v |
?		| }
ParentTableName			~ 
=
		 
null
		 ”
,
		” •
int
		– ™
?
		™ 
ParentTableId
		› ¨
=
		© ª
null
		« ―
)
		― °
where
		± ¶
TResult
		· Ύ
:
		Ώ ΐ
new
		Α Δ
(
		Δ Ε
)
		Ε Ζ
;
		Ζ Η
Task 
< "
DataTableResponseModel #
># $
GetAll% +
(+ ,"
DataTableAjaxPostModel, B
modelC H
,H I
intJ M
?M N
UserNameO W
,W X
stringY _
?_ `
	TableNamea j
=k l
nullm q
,q r
DateTimes {
?{ |
DateFrom	} …
=
† ‡
null
 
,
 
DateTime
 –
?
– —
DateTo
 
=
  
null
΅ ¥
)
¥ ¦
;
¦ §
Task 
< 
List 
< !
AuditLogModelResponse '
>' (
>( )"
GetLogDetailsByFilters* @
(@ A
stringA G
?G H
	TableNameI R
,R S
intT W
?W X
IdY [
=\ ]
null^ b
,b c
intd g
?g h
TableKeyi q
=r s
nullt x
,x y
DateTime	z ‚
?
‚ ƒ
DateFrom
„ 
=
 
null
 “
,
“ ”
DateTime
• 
?
 
DateTo
 ¥
=
¦ §
null
¨ ¬
)
¬ ­
;
­ ®
Task 
< 
List 
< 
AuditLogTableModel $
>$ %
>% &#
GetAllAuditLogTableName' >
(> ?
)? @
;@ A
Task 
< "
DataTableResponseModel #
># $
GetAllDetailsLog% 5
(5 6"
DataTableAjaxPostModel6 L
modelM R
,R S
intT W
?W X
UserIdY _
,_ `
stringa g
?g h
	TableNamei r
,r s
stringt z
?z {
TableKey	| „
,
„ …
int
† ‰
?
‰ 
Id
‹ 
,
 
DateTime
 —
?
— 
DateFrom
™ ΅
=
Ά £
null
¤ ¨
,
¨ ©
DateTime
ª ²
?
² ³
DateTo
΄ Ί
=
» Ό
null
½ Α
)
Α Β
;
Β Γ
} 
} χ
CD:\EltizamLive\Eltizam.Business.Core\Interface\IDashboardService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
	Interface  )
{		 
public

 

	interface

 
IDashboardService

 &
{ 
Task 
< 
DashboardDataModel 
>  
GetDashboardData! 1
(1 2 
DashboardFilterModel2 F
modelG L
)L M
;M N
Task 
< 
dynamic 
> !
GetClientPieChartData +
(+ , 
DashboardFilterModel, @
modelA F
)F G
;G H
} 
} ›
CD:\EltizamLive\Eltizam.Business.Core\Interface\IExceptionService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
	Interface  )
{ 
public 

	interface 
IExceptionService &
{ 
Task		 
<		 
DBOperation		 
>		 
LogException		 &
(		& '
	Exception		' 0
	exception		1 :
)		: ;
;		; <
}

 
} —
DD:\EltizamLive\Eltizam.Business.Core\Interface\IFileUploadService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
	Interface  )
{		 
public

 

	interface

 
IFileUploadService

 '
{ 
Task	 
< 
bool 
> 
UploadFilesAsync $
($ %
int% (

tableKeyId) 3
,3 4
string5 ;
	tableName< E
,E F
ListG K
<K L
MasterDocumentModelL _
>_ `
uploadDocumentsa p
,p q
intr u
?u v
	createdBy	w €
)
€ 
;
 ‚
} 
} ί
MD:\EltizamLive\Eltizam.Business.Core\Interface\IMasterApproverLevelService.cs
	namespace		 	
Eltizam		
 
.		 
Business		 
.		 
Core		 
.		  
	Interface		  )
{

 
public 

	interface '
IMasterApproverLevelService 0
{ 
Task	 
< 
DBOperation 
> 5
)UpsertMasterValuationRequestApproverLevel D
(D E$
MasterApproverLevelModelE ]
approver^ f
)f g
;g h
Task 
< $
MasterApproverLevelModel %
>% &
GetById' .
(. /
int/ 2
Id3 5
)5 6
;6 7
Task 
< "
DataTableResponseModel #
># $
GetAll% +
(+ ,"
DataTableAjaxPostModel, B
modelC H
)H I
;I J
} 
} Ή
DD:\EltizamLive\Eltizam.Business.Core\Interface\IMasterCityService.cs
	namespace

 	
Eltizam


 
.

 
Business

 
.

 
Core

 
.

  
	Interface

  )
{ 
public 

	interface 
IMasterCityService '
{ 
Task 
< 
DBOperation 
> 
Upsert  
(  !
MasterCityEntity! 1

entityUser2 <
)< =
;= >
Task 
< 
MasterCityEntity 
> 
GetById &
(& '
int' *
id+ -
)- .
;. /
Task 
< 

MasterCity 
? 
> 
GetById1 "
(" #
int# &
id' )
)) *
;* +
Task 
< "
DataTableResponseModel #
># $
GetAll% +
(+ ,"
DataTableAjaxPostModel, B
modelC H
)H I
;I J
Task 
< 
DBOperation 
> 
Delete  
(  !
int! $
id% '
)' (
;( )
Task 
< 
List 
< 
MasterCityEntity "
>" #
># $
GetCityList% 0
(0 1
)1 2
;2 3
Task 
< 
List 
< 
MasterCityEntity "
>" #
># $ 
GetCityListByStateId% 9
(9 :
int: =
stateId> E
)E F
;F G
} 
} ¦
FD:\EltizamLive\Eltizam.Business.Core\Interface\IMasterClientService.cs
	namespace		 	
Eltizam		
 
.		 
Business		 
.		 
Core		 
.		  
	Interface		  )
{

 
public 

	interface  
IMasterClientService )
{ 
Task 
< 
MasterClientModel 
> $
GetMasterClientByIdAsync  8
(8 9
int9 <
id= ?
)? @
;@ A
Task 
< 
List 
< 
MasterClientModel #
># $
>$ %.
"GetMasterClientByClientTypeIdAsync& H
(H I
intI L
ClientTypeIdM Y
)Y Z
;Z [
Task 
< "
DataTableResponseModel #
># $
GetAll% +
(+ ,"
DataTableAjaxPostModel, B
modelC H
)H I
;I J
Task 
< 
DBOperation 
> !
AddUpdateMasterClient /
(/ 0
MasterClientModel0 A
modelB G
)G H
;H I
Task 
< 
DBOperation 
> 
DeleteClient &
(& '
int' *
id+ -
,- .
int/ 2
?2 3
by4 6
)6 7
;7 8
Task 
< 
DBOperation 
> 
DeleteDocument (
(( )
int) ,
id- /
,/ 0
int1 4
?4 5
by6 8
)8 9
;9 :
} 
} γ

JD:\EltizamLive\Eltizam.Business.Core\Interface\IMasterClientTypeService.cs
	namespace		 	
Eltizam		
 
.		 
Business		 
.		 
Core		 
.		  
	Interface		  )
{

 
public 

	interface $
IMasterClientTypeService -
{ 
Task 
< "
Master_ClientTypeModel #
># $(
GetMasterClientTypeByIdAsync% A
(A B
intB E
idF H
)H I
;I J
Task 
< 
List 
< "
Master_ClientTypeModel (
>( )
>) *
GetAll+ 1
(1 2
)2 3
;3 4
Task 
< 
DBOperation 
> %
AddUpdateMasterClientType 3
(3 4"
Master_ClientTypeModel4 J
entityqualificationK ^
)^ _
;_ `
Task 
< 
DBOperation 
> 
DeleteClientType *
(* +
int+ .
id/ 1
)1 2
;2 3
Task 
< 
List 
< "
Master_ClientTypeModel (
>( )
>) *
GetClientTypeList+ <
(< =
)= >
;> ?
} 
} 

GD:\EltizamLive\Eltizam.Business.Core\Interface\IMasterCountryService.cs
	namespace		 	
Eltizam		
 
.		 
Business		 
.		 
Core		 
.		  
	Interface		  )
{

 
public 

	interface !
IMasterCountryService *
{ 
Task 
< 
DBOperation 
> 
Upsert  
(  !
MasterCountryModel! 3

entityUser4 >
)> ?
;? @
Task 
< 
MasterCountryModel 
>  
GetById! (
(( )
int) ,
id- /
)/ 0
;0 1
Task 
< "
DataTableResponseModel #
># $
GetAll% +
(+ ,"
DataTableAjaxPostModel, B
modelC H
)H I
;I J
Task 
< 
DBOperation 
> 
Delete  
(  !
int! $
id% '
)' (
;( )
Task 
< 
List 
< 
MasterCountryModel $
>$ %
>% &
GetCountryList' 5
(5 6
)6 7
;7 8
} 
} ¨

JD:\EltizamLive\Eltizam.Business.Core\Interface\IMasterDepartmentService.cs
	namespace

 	
Eltizam


 
.

 
Business

 
.

 
Core

 
.

  
	Interface

  )
{ 
public 

	interface $
IMasterDepartmentService -
{ 
Task 
< 
DBOperation 
> 
Upsert  
(  !"
MasterDepartmentEntity! 7

entityUser8 B
)B C
;C D
Task 
< "
MasterDepartmentEntity #
># $
GetById% ,
(, -
int- 0
id1 3
)3 4
;4 5
Task 
< 
List 
< "
MasterDepartmentEntity (
>( )
>) *
GetAll+ 1
(1 2
)2 3
;3 4
Task 
< 
DBOperation 
> 
Delete  
(  !
int! $
id% '
)' (
;( )
Task 
< 
List 
< "
MasterDepartmentEntity (
>( )
>) *
GetDepartmentList+ <
(< =
)= >
;> ?
} 
} ―

KD:\EltizamLive\Eltizam.Business.Core\Interface\IMasterDesignationService.cs
	namespace		 	
Eltizam		
 
.		 
Business		 
.		 
Core		 
.		  
	Interface		  )
{

 
public 

	interface %
IMasterDesignationService .
{ 
Task 
< 
DBOperation 
> 
Upsert  
(  !#
MasterDesignationEntity! 8

entityUser9 C
)C D
;D E
Task 
< #
MasterDesignationEntity $
>$ %
GetById& -
(- .
int. 1
id2 4
)4 5
;5 6
Task 
< 
List 
< #
MasterDesignationEntity )
>) *
>* +
GetAll, 2
(2 3
)3 4
;4 5
Task 
< 
DBOperation 
> 
Delete  
(  !
int! $
id% '
)' (
;( )
Task 
< 
List 
< #
MasterDesignationEntity )
>) *
>* +
GetDesignationList, >
(> ?
)? @
;@ A
} 
} ‘
JD:\EltizamLive\Eltizam.Business.Core\Interface\IMasterDictionaryService.cs
	namespace		 	
Eltizam		
 
.		 
Business		 
.		 
Core		 
.		  
	Interface		  )
{

 
public 

	interface $
IMasterDictionaryService -
{ 
Task 
< "
DataTableResponseModel #
># $
GetAll% +
(+ ,"
DataTableAjaxPostModel, B
modelC H
)H I
;I J
Task 
< 
List 
< &
MasterDictionaryDetailById ,
>, -
>- .)
GetDictionaryDetailsByIdAsync/ L
(L M
intM P
idQ S
,S T
stringU [
description\ g
)g h
;h i
Task 
< &
MasterDictionaryDetailById '
>' ()
GetDictionaryDetailsByIdAsync) F
(F G
intG J
idK M
)M N
;N O
Task 
< 
DBOperation 
> %
AddUpdateMasterDictionary 3
(3 4&
MasterDictionaryDetailById4 N
entitydictionaryO _
)_ `
;` a
Task 
< 
DBOperation 
> 
Delete  
(  !
int! $
id% '
)' (
;( )
Task 
< 
DBOperation 
> %
MasterDictionaryAddUpdate 3
(3 4"
MasterDictionaryEntity4 J
entity_dictionaryK \
)\ ]
;] ^
Task 
< "
MasterDictionaryEntity #
># $.
"GetMasterDictionaryDetailByIdAsync% G
(G H
intH K
idL N
)N O
;O P
Task 
< 
List 
< &
MasterDictionaryDetailById ,
>, -
>- .1
%GetMasterDictionaryDetailSubByIdAsync/ T
(T U
intU X
DictionaryIdY e
)e f
;f g
Task 
< #
MasterDictionaryDetails $
>$ %,
 GetDictionaryWithSubDetailsAsync& F
(F G
intG J
?J K
DictionaryIdL X
,X Y
stringZ `
?` a
Descriptionb m
,m n
stringo u
?u v
Codew {
){ |
;| }
} 
} §	
HD:\EltizamLive\Eltizam.Business.Core\Interface\IMasterLocationService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
	Interface  )
{ 
public 

	interface "
IMasterLocationService +
{ 
Task		 
<		 
DBOperation		 
>		 #
AddUpdateLocationClient		 1
(		1 2 
MasterLocationEntity		2 F

entityUser		G Q
)		Q R
;		R S
Task

 
<

  
MasterLocationEntity

 !
>

! "
GetById

# *
(

* +
int

+ .
id

/ 1
)

1 2
;

2 3
Task 
< "
DataTableResponseModel #
># $
GetAll% +
(+ ,"
DataTableAjaxPostModel, B
modelC H
)H I
;I J
Task 
< 
DBOperation 
> 
Delete  
(  !
int! $
id% '
,' (
int) ,
?, -
by. 0
)0 1
;1 2
} 
} ”
FD:\EltizamLive\Eltizam.Business.Core\Interface\IMasterModuleService.cs
	namespace		 	
Eltizam		
 
.		 
Business		 
.		 
Core		 
.		  
	Interface		  )
{

 
public 

	interface  
IMasterModuleService )
{ 
Task 
< 
List 
< 
MasterModuleEntity $
>$ %
>% &
GetAll' -
(- .
). /
;/ 0
Task 
< 
List 
< 
MasterModuleEntity $
>$ %
>% &
GetByRoleId' 2
(2 3
int3 6
roleId7 =
)= >
;> ?
Task 
< 
IEnumerable 
< 
RolePermissionModel ,
>, -
>- .)
GetByPermisionRoleUsingRoleId/ L
(L M
intM P
roleIdQ W
)W X
;X Y
} 
} Ξ
LD:\EltizamLive\Eltizam.Business.Core\Interface\IMasterNotificationService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
	Interface  )
{ 
public 

	interface &
IMasterNotificationService /
{ 
Task		 
<		 
DBOperation		 
>		 
	SendEmail		 "
(		" #!
SendNotificationModel		# 8
notificationModel		9 J
)		J K
;		K L
Task

 
<

 
DBOperation

 
>

 

SendEmail2

 $
(

$ %!
SendNotificationModel

% :
notificationModel

; L
)

L M
;

M N!
SendNotificationModel (
GetValuationNotificationData :
(: ;
RecepientActionEnum; N
subjectEnumO Z
,Z [
int\ _
valiadtionRequestId` s
)s t
;t u
List 
< %
MasterNotificationEntitty &
>& '
GetAll( .
(. /
int/ 2
userId3 9
,9 :
int; >
?> ?
valId@ E
,E F
intG J
?J K
pagenumL S
)S T
;T U
Task 
< 
DBOperation 
> 
UpdateNotification ,
(, -
int- 0
notificationid1 ?
,? @
intA D
readByE K
)K L
;L M
void (
UpdateValuationRequestStatus )
() *
int* -
newStatusId. 9
,9 :
int; >
valuationRequestId? Q
)Q R
;R S
int 
GetAllCount 
( 
int 
userId "
," #
int$ '
?' (
valId) .
). /
;/ 0
} 
} Α

MD:\EltizamLive\Eltizam.Business.Core\Interface\IMasterOwnershipTypeService.cs
	namespace		 	
Eltizam		
 
.		 
Business		 
.		 
Core		 
.		  
	Interface		  )
{

 
public 

	interface '
IMasterOwnershipTypeService 0
{ 
Task 
< 
DBOperation 
> 
Upsert  
(  !%
MasterOwnershipTypeEntity! :

entityUser; E
)E F
;F G
Task 
< %
MasterOwnershipTypeEntity &
>& '
GetById( /
(/ 0
int0 3
id4 6
)6 7
;7 8
Task 
< "
DataTableResponseModel #
># $
GetAll% +
(+ ,"
DataTableAjaxPostModel, B
modelC H
)H I
;I J
Task 
< 
List 
< %
MasterOwnershipTypeEntity +
>+ ,
>, - 
GetOwnershipTypeList. B
(B C
)C D
;D E
Task 
< 
DBOperation 
> 
Delete  
(  !
int! $
id% '
)' (
;( )
} 
} §
HD:\EltizamLive\Eltizam.Business.Core\Interface\IMasterPropertyService.cs
	namespace		 	
Eltizam		
 
.		 
Business		 
.		 
Core		 
.		  
	Interface		  )
{

 
public 

	interface "
IMasterPropertyService +
{ 
Task 
< 
MasterPropertyModel  
>  !&
GetMasterPropertyByIdAsync" <
(< =
int= @
idA C
)C D
;D E
Task 
< "
DataTableResponseModel #
># $
GetAll% +
(+ ,"
DataTableAjaxPostModel, B
modelC H
)H I
;I J
Task 
< 
DBOperation 
> #
AddUpdateMasterProperty 1
(1 2
MasterPropertyModel2 E
entityqualificationF Y
)Y Z
;Z [
Task 
< 
DBOperation 
> 
DeleteProperty (
(( )
int) ,
id- /
,/ 0
int1 4
?4 5
by6 8
)8 9
;9 :
Task 
< 
List 
< "
MasterAmenityListModel (
>( )
>) *"
GetPropertyAmenityList+ A
(A B
)B C
;C D
Task 
< 
List 
< 
MasterPropertyModel %
>% &
>& '+
GetMasterPropertyByFiltersAsync( G
(G H
intH K
propertyTypeIdL Z
,Z [
int\ _
subPropertyTypeId` q
,q r
ints v
ownershipTypeId	w †
)
† ‡
;
‡ 
} 
} Τ
OD:\EltizamLive\Eltizam.Business.Core\Interface\IMasterPropertySubTypeService.cs
	namespace		 	
Eltizam		
 
.		 
Business		 
.		 
Core		 
.		  
	Interface		  )
{

 
public 

	interface )
IMasterPropertySubTypeService 2
{ 
Task 
< '
Master_PropertySubTypeModel (
>( ))
GetMasterSubPropertyByIdAsync* G
(G H
intH K
idL N
)N O
;O P
Task 
< 
List 
< '
Master_PropertySubTypeModel -
>- .
>. /5
)GetMasterSubPropertyByPropertyTypeIdAsync0 Y
(Y Z
intZ ]
PropertyTypeId^ l
)l m
;m n
Task 
< "
DataTableResponseModel #
># $
GetAll% +
(+ ,"
DataTableAjaxPostModel, B
modelC H
)H I
;I J
Task 
< 
DBOperation 
> &
AddUpdateMasterSubProperty 4
(4 5'
Master_PropertySubTypeModel5 P
entityqualificationQ d
)d e
;e f
Task 
< 
DBOperation 
> 
DeleteSubProperty +
(+ ,
int, /
id0 2
,2 3
int4 7
?7 8
by9 ;
); <
;< =
Task 
< 
List 
< '
Master_PropertySubTypeModel -
>- .
>. /
GetAll0 6
(6 7
)7 8
;8 9
} 
} χ
LD:\EltizamLive\Eltizam.Business.Core\Interface\IMasterPropertyTypeService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
	Interface  )
{ 
public 

	interface &
IMasterPropertyTypeService /
{ 
Task 
< $
Master_PropertyTypeModel %
>% &*
GetMasterPropertyTypeByIdAsync' E
(E F
intF I
idJ L
)L M
;M N
Task		 
<		 "
DataTableResponseModel		 #
>		# $
GetAll		% +
(		+ ,"
DataTableAjaxPostModel		, B
model		C H
)		H I
;		I J
Task

 
<

 
DBOperation

 
>

 '
AddUpdateMasterPropertyType

 5
(

5 6$
Master_PropertyTypeModel

6 N
entityqualification

O b
)

b c
;

c d
Task 
< 
DBOperation 
> 
DeletePropertyType ,
(, -
int- 0
id1 3
,3 4
int5 8
?8 9
by: <
)< =
;= >
Task 
< 
List 
< $
Master_PropertyTypeModel )
>) *
>* +

GetAllList, 6
(6 7
)7 8
;8 9
Task 
< 
bool 
> &
CheckDuplicatePropertyType -
(- .
string. 4
PropertyType5 A
)A B
;B C
} 
} «	
ND:\EltizamLive\Eltizam.Business.Core\Interface\IMasterQualificationServices.cs
	namespace

 	
Eltizam


 
.

 
Business

 
.

 
Core

 
.

  
	Interface

  )
{ 
public 

	interface (
IMasterQualificationServices 1
{ 
Task 
< 
DBOperation 
> "
AddUpdateQualification 0
(0 1%
Master_QualificationModel1 J
entityqualificationK ^
)^ _
;_ `
Task 
< %
Master_QualificationModel &
>& '+
GetMasterQualificationByIdAsync( G
(G H
intH K
idL N
)N O
;O P
Task 
< "
DataTableResponseModel #
># $
GetAll% +
(+ ,"
DataTableAjaxPostModel, B
modelC H
)H I
;I J
Task 
< 
DBOperation 
> 
DeleteQualification -
(- .
int. 1
id2 4
)4 5
;5 6
} 
} Μ	
MD:\EltizamLive\Eltizam.Business.Core\Interface\IMasterRoleModulePermission.cs
	namespace		 	
Eltizam		
 
.		 
Business		 
.		 
Core		 
.		  
	Interface		  )
{

 
public 

	interface '
IMasterRoleModulePermission 0
{ 
Task 
< 
List 
< &
RoleModulePermissionEntity ,
>, -
>- .
GetAll/ 5
(5 6
)6 7
;7 8
Task 
< 
MasterRoleEntity 
> 
GetById &
(& '
int' *
id+ -
)- .
;. /
Task 
< 
DBOperation 
> )
AddUpdateRoleModulePermission 7
(7 8
List8 <
<< =&
RoleModulePermissionEntity= W
>W X'
roleModulePermissionEntitysY t
)t u
;u v
Task 
< 
DBOperation 
> &
DeleteRoleModulePermission 4
(4 5
int5 8
id9 ;
); <
;< =
} 
} 
DD:\EltizamLive\Eltizam.Business.Core\Interface\IMasterRoleService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
	Interface  )
{ 
public 

	interface 
IMasterRoleService '
{ 
Task 
< "
DataTableResponseModel #
># $
GetAll% +
(+ ,"
DataTableAjaxPostModel, B
modelC H
)H I
;I J
Task

 
<

 
MasterRoleEntity

 
>

 
GetById

 &
(

& '
int

' *
id

+ -
)

- .
;

. /
Task 
< 
DBOperation 
> 
AddUpdateRole '
(' (
MasterRoleEntity( 8
masterRoleEntity9 I
)I J
;J K
Task 
< 
DBOperation 
> 

DeleteRole $
($ %
int% (
id) +
)+ ,
;, -
Task 
< 
List 
< 
MasterRoleEntity "
>" #
># $
GetActiveRole% 2
(2 3
)3 4
;4 5
Task 
< 
List 
< 
MasterRoleEntity "
>" #
># $

RoleSearch% /
(/ 0
string0 6
searchQuery7 B
)B C
;C D
} 
} 
ED:\EltizamLive\Eltizam.Business.Core\Interface\IMasterStateService.cs
	namespace		 	
Eltizam		
 
.		 
Business		 
.		 
Core		 
.		  
	Interface		  )
{

 
public 

	interface 
IMasterStateService (
{ 
Task 
< 
DBOperation 
> 
Upsert  
(  !
MasterStateEntity! 2

entityUser3 =
)= >
;> ?
Task 
< 
MasterStateEntity 
> 
GetById  '
(' (
int( +
id, .
). /
;/ 0
Task 
< "
DataTableResponseModel #
># $
GetAll% +
(+ ,"
DataTableAjaxPostModel, B
modelC H
)H I
;I J
Task 
< 
DBOperation 
> 
Delete  
(  !
int! $
id% '
)' (
;( )
Task 
< 
List 
< 
MasterStateEntity #
># $
>$ %
GetStateList& 2
(2 3
)3 4
;4 5
Task 
< 
List 
< 
MasterStateEntity #
># $
>$ %#
GetStateListByCountryId& =
(= >
int> A
	countryIdB K
)K L
;L M
} 
} Β!
DD:\EltizamLive\Eltizam.Business.Core\Interface\IMasterUserService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
	Interface  )
{ 
public 

	interface 
IMasterUserService '
{		 
Task

 
<

 
UserSessionEntity

 
>

 
Login

  %
(

% &
LoginViewModel

& 4
oLogin

5 ;
)

; <
;

< =
Task 
< "
DataTableResponseModel #
># $
GetAll% +
(+ ,"
DataTableAjaxPostModel, B
modelC H
)H I
;I J
Task 
< 
DBOperation 
> 

DeleteUser $
($ %
int% (
id) +
)+ ,
;, -
Task 
< 
bool 
> #
CheckEmailAddressExists *
(* +
string+ 1
emailAddress2 >
)> ?
;? @
Task 
< 
DBOperation 
> 
ForgotPassword (
(( )#
ForgotPasswordViewModel) @#
forgotPasswordViewModelA X
)X Y
;Y Z
Task 
< 
string 
> 
ResetPassword "
(" #)
MasterUserResetPasswordEntity# @
entityA G
)G H
;H I
Task 
< 
bool 
> 
IsTokenValid 
(  
string  &
token' ,
), -
;- .
Task 
< 
DBOperation 
> 
Upsert  
(  !
MasterUserModel! 0

entityUser1 ;
); <
;< =
Task 
< !
MasterUserDetailModel "
>" #
GetById$ +
(+ ,
int, /
id0 2
)2 3
;3 4
Task 
< 
List 
< #
MasterResourceTypeModel )
>) *
>* +
GetResourceTypeList, ?
(? @
)@ A
;A B
Task 
< 
List 
< $
MasterApproverLevelModel *
>* +
>+ , 
GetApproverLevelList- A
(A B
)B C
;C D
Task 
< 
List 
< 
MasterRoleModel !
>! "
>" #
GetRoleList$ /
(/ 0
)0 1
;1 2
Task 
< 
List 
< 
MasterUserListModel %
>% &
>& '
GetApproverList( 7
(7 8
int8 ;
id< >
,> ?
string@ F
?F G
roleNameH P
)P Q
;Q R
Task 
< 
DBOperation 
> 
Delete  
(  !
int! $
id% '
)' (
;( )
Task 
< 
DBOperation 
> 
ChangePassword (
(( )
ChangePasswordModel) <
changePasswordModel= P
)P Q
;Q R
Task 
< 
GlobalAuditFields 
? 
>   
GetGlobalAuditFields! 5
(5 6
int6 9

TableKeyId: D
,D E
stringF L
	TableNameM V
)V W
;W X
Task 
< 
List 
< 
MasterUserModel !
>! "
>" #
GetAllUserList$ 2
(2 3
)3 4
;4 5
Task 
< 
bool 
> 
IsEmailExists  
(  !
string! '
email( -
,- .
int/ 2
?2 3
userId4 :
): ;
;; <
Task 
< 
DBOperation 
> 
DeleteDocument (
(( )
int) ,
id- /
)/ 0
;0 1
} 
}   ¨	
MD:\EltizamLive\Eltizam.Business.Core\Interface\IMasterValuationFeesService.cs
	namespace		 	
Eltizam		
 
.		 
Business		 
.		 
Core		 
.		  
	Interface		  )
{

 
public 

	interface '
IMasterValuationFeesService 0
{ 
Task 
< 
DBOperation 
> 
Upsert  
(  !$
MasterValuationFeesModel! 9

entityUser: D
)D E
;E F
Task 
< $
MasterValuationFeesModel %
>% &
GetById' .
(. /
int/ 2
id3 5
)5 6
;6 7
Task 
< "
DataTableResponseModel #
># $
GetAll% +
(+ ,"
DataTableAjaxPostModel, B
modelC H
)H I
;I J
Task 
< 
DBOperation 
> 
Delete  
(  !
int! $
id% '
,' (
int) ,
?, -
by. 0
)0 1
;1 2
} 
} Ο

PD:\EltizamLive\Eltizam.Business.Core\Interface\IMasterValuationFeeTypeService.cs
	namespace		 	
Eltizam		
 
.		 
Business		 
.		 
Core		 
.		  
	Interface		  )
{

 
public 

	interface *
IMasterValuationFeeTypeService 3
{ 
Task 
< 
DBOperation 
> 
Upsert  
(  !'
MasterValuationFeeTypeModel! <

entityUser= G
)G H
;H I
Task 
< '
MasterValuationFeeTypeModel (
>( )
GetById* 1
(1 2
int2 5
id6 8
)8 9
;9 :
Task 
< "
DataTableResponseModel #
># $
GetAll% +
(+ ,"
DataTableAjaxPostModel, B
modelC H
)H I
;I J
Task 
< 
List 
< '
MasterValuationFeeTypeModel -
>- .
>. /"
GetAllValuationFeeType0 F
(F G
)G H
;H I
Task 
< 
DBOperation 
> 
Delete  
(  !
int! $
id% '
)' (
;( )
} 
} Ί	
FD:\EltizamLive\Eltizam.Business.Core\Interface\IMasterVendorService.cs
	namespace		 	
Eltizam		
 
.		 
Business		 
.		 
Core		 
.		  
	Interface		  )
{

 
public 

	interface  
IMasterVendorService )
{ 
Task 
< 
MasterVendorModel 
> $
GetMasterVendorByIdAsync  8
(8 9
int9 <
id= ?
)? @
;@ A
Task 
< "
DataTableResponseModel #
># $
GetAll% +
(+ ,"
DataTableAjaxPostModel, B
modelC H
)H I
;I J
Task 
< 
DBOperation 
> !
AddUpdateMasterVendor /
(/ 0
MasterVendorModel0 A
masterVendortModelB T
)T U
;U V
Task 
< 
DBOperation 
> 
DeleteVendor &
(& '
int' *
id+ -
,- .
int/ 2
?2 3
by4 6
)6 7
;7 8
} 
} Β
@D:\EltizamLive\Eltizam.Business.Core\Interface\IUploadService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
	Interface  )
{ 
public 

	interface 
IUploadService #
{ 
Task		 
<		 
DBOperation		 
>		 
SaveFilesAsync		 (
(		( )
List		) -
<		- .
	IFormFile		. 7
>		7 8
files		9 >
)		> ?
;		? @
Task

 
<

 
IEnumerable

 
<

 
Upload

 
>

  
>

  !
GetAllUploadsAsync

" 4
(

4 5
)

5 6
;

6 7
Task 
< 
DBOperation 
> 
GetUploadByIdAsync ,
(, -
int- 0
id1 3
)3 4
;4 5
} 
} 
MD:\EltizamLive\Eltizam.Business.Core\Interface\IValuationAssessmentService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
	Interface  )
{ 
public 

	interface '
IValuationAssessmentService 0
{ 
Task 
< 
DBOperation 
> $
ValuationAssesmentUpsert 2
(2 3)
ValuationAssesmentActionModel3 P
modelQ V
)V W
;W X
Task 
<  
SiteDescriptionModel !
>! ""
GetSiteDescriptionList# 9
(9 :
int: =
	requestId> G
)G H
;H I
Task 
< 
DBOperation 
> 
DeleteDocument (
(( )
int) ,
id- /
,/ 0
int1 4
?4 5
by6 8
)8 9
;9 :
} 
} η
JD:\EltizamLive\Eltizam.Business.Core\Interface\IValuationInvoiceService.cs
	namespace		 	
Eltizam		
 
.		 
Business		 
.		 
Core		 
.		  
	Interface		  )
{

 
public 

	interface $
IValuationInvoiceService -
{ 
Task 
< 
List 
< %
ValuationInvoiceListModel +
>+ ,
>, -
GetInvoiceList. <
(< =
int= @
	requestIdA J
)J K
;K L
Task 
< %
ValuationInvoiceListModel &
>& '
GetInvoiceById( 6
(6 7
int7 :
id; =
)= >
;> ?
Task 
< 
DBOperation 
> 
InvoiceDelete '
(' (
int( +
id, .
,. /
int0 3
?3 4
by5 7
)7 8
;8 9
Task 
< 
DBOperation 
> 
Upsert  
(  !%
ValuationInvoiceListModel! :
entityQuatation; J
)J K
;K L
Task 
< 
DBOperation 
> 
DeleteDocument (
(( )
int) ,
id- /
,/ 0
int1 4
?4 5
by6 8
)8 9
;9 :
Task 
< 
DBOperation 
> 
UpsertInvoice '
(' ((
ValuationInvoicePaymentModel( D
invoiceE L
)L M
;M N
Task 
< (
ValuationInvoicePaymentModel )
>) *
PaymentInvoiceById+ =
(= >
int> A
idB D
)D E
;E F
Task 
< 
List 
< (
ValuationInvoicePaymentModel .
>. /
>/ 0!
GetPaymentInvoiceById1 F
(F G
intG J
	requestIdK T
)T U
;U V
Task 
< 
DBOperation 
>  
DeletePyamentInvoice .
(. /
int/ 2
id3 5
,5 6
int7 :
?: ;
by< >
)> ?
;? @
} 
} ε
MD:\EltizamLive\Eltizam.Business.Core\Interface\IValuationQuatatiionService.cs
	namespace		 	
Eltizam		
 
.		 
Business		 
.		 
Core		 
.		  
	Interface		  )
{

 
public 

	interface &
IValuationQuatationService /
{ 
Task 
< 
List 
< '
ValuationQuatationListModel -
>- .
>. /
GetQuatationList0 @
(@ A
intA D
	requestIdE N
)N O
;O P
Task 
< '
ValuationQuatationListModel (
>( )
GetQuatationById* :
(: ;
int; >
id? A
)A B
;B C
Task 
< 
DBOperation 
> 
QuatationDelete )
() *
int* -
id. 0
,0 1
int2 5
?5 6
by7 9
)9 :
;: ;
Task 
< 
DBOperation 
> 
Upsert  
(  !'
ValuationQuatationListModel! <
entityQuatation= L
)L M
;M N
Task 
< 
dynamic 
> 
GetValuationPDFData )
() *
int* -
valId. 3
)3 4
;4 5
Task 
< 
List 
< .
"ValuationRequestApproverLevelModel 4
>4 5
>5 6
GetApproverLevel7 G
(G H
decimalH O
AmountP V
,V W
intX [
ValReqId\ d
)d e
;e f
} 
} κ
PD:\EltizamLive\Eltizam.Business.Core\Interface\IValuationRequestStatusService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
	Interface  )
{		 
public

 

	interface

 *
IValuationRequestStatusService

 3
{ 
Task 
< 
List 
< '
ValuationRequestStatusModel -
>- .
>. /
GetAll0 6
(6 7
int7 :
?: ;
roleId< B
=C D
nullE I
,I J
stringK Q
?Q R
actionS Y
=Z [
null\ `
,` a
intb e
?e f
ValReqIdg o
=p q
nullr v
)v w
;w x
Task 
< 
List 
< '
ValuationRequestStatusModel -
>- .
>. /
GetAllStatus0 <
(< =
)= >
;> ?
Task 
< 
List 
< '
ValuationRequestStatusModel -
>- .
>. /'
GetInvoiceTransactionStatus0 K
(K L
intL O
typeP T
)T U
;U V
Task 
< 
List 
< .
"ValuationRequestHistoryStatusModel 4
>4 5
>5 6
GetAllStatusHistory7 J
(J K
intK N
?N O
ValReqIdP X
=Y Z
null[ _
)_ `
;` a
} 
} ³
ID:\EltizamLive\Eltizam.Business.Core\Interface\IValutionRequestService.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
	Interface  )
{ 
public 

	interface $
IValuationRequestService -
{ 
Task 
< "
DataTableResponseModel #
># $
GetAll% +
(+ ,"
DataTableAjaxPostModel, B
modelC H
,H I#
ValuationRequestFiltersJ a
filtersb i
)i j
;j k
Task		 
<		 
DBOperation		 
>		 
AssignApprover		 (
(		( )&
AssignApprovorRequestModel		) C
model		D I
)		I J
;		J K
Task

 
<

 
DBOperation

 
>

 !
ApproverActionComment

 /
(

/ 0&
ApproverActionCommentModel

0 J
model

K P
)

P Q
;

Q R
Task 
< 
DBOperation 
>  
AssignApproverStatus .
(. /&
ApprovorStatusRequestModel/ I
modelJ O
)O P
;P Q
Task 
< 
List 
< 
ValuationMethod !
>! "
>" #!
GetAllValuationMethod$ 9
(9 :
): ;
;; <
Task 
< 
DBOperation 
> 
Upsert  
(  !!
ValuationRequestModel! 6

entityUser7 A
)A B
;B C
Task 
< !
ValuationRequestModel "
>" #
GetById$ +
(+ ,
int, /
id0 2
)2 3
;3 4
Task 
< 
DBOperation 
> 
Delete  
(  !
int! $
id% '
)' (
;( )
Task 
< 
DBOperation 
> 
UpdateRequestStatus -
(- .,
 ValutionRequestStatusChangeModel. N
modelO T
)T U
;U V
Task 
< 
DBOperation 
>  
UpsertApproverLevels .
(. /
int/ 2
ValReqId3 ;
,; <
string= C
RequestDataD O
,O P
intQ T
?T U
	CreatedByV _
,_ `
inta d
?d e
	ValQuotIdf o
=p q
nullr v
)v w
;w x
Task 
< (
ValuationRequestDependencies )
>) *#
GetValuationRequestInfo+ B
(B C
intC F
IdG I
)I J
;J K
} 
} ω
BD:\EltizamLive\Eltizam.Business.Core\ModelMapper\IMapperFactory.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
ModelMapper  +
{ 
public		 

	interface		 
IMapperFactory		 #
{

 
TDestination 
Get 
< 
TSource  
,  !
TDestination" .
>. /
(/ 0
TSource0 7
source8 >
)> ?
;? @
List 
< 
TDestination 
> 
GetList "
<" #
TSource# *
,* +
TDestination, 8
>8 9
(9 :
List: >
<> ?
TSource? F
>F G
sourceH N
)N O
;O P
} 
} μ
AD:\EltizamLive\Eltizam.Business.Core\ModelMapper\MapperFactory.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
ModelMapper  +
{ 
public 

class 
MapperFactory 
:  
IMapperFactory! /
{ 
public 
MapperFactory 
( 
) 
{ 	
}		 	
public 
TDestination 
Get 
<  
TSource  '
,' (
TDestination) 5
>5 6
(6 7
TSource7 >
source? E
)E F
{ 	
IMapper 
mapper 
= 
	setConfig &
<& '
TSource' .
,. /
TDestination0 <
>< =
(= >
)> ?
;? @
return 
mapper 
. 
Map 
< 
TSource %
,% &
TDestination' 3
>3 4
(4 5
source5 ;
); <
;< =
} 	
public 
List 
< 
TDestination  
>  !
GetList" )
<) *
TSource* 1
,1 2
TDestination3 ?
>? @
(@ A
ListA E
<E F
TSourceF M
>M N
sourceO U
)U V
{ 	
IMapper 
mapper 
= 
	setConfig &
<& '
TSource' .
,. /
TDestination0 <
>< =
(= >
)> ?
;? @
return 
mapper 
. 
Map 
< 
List "
<" #
TSource# *
>* +
,+ ,
List- 1
<1 2
TDestination2 >
>> ?
>? @
(@ A
sourceA G
)G H
;H I
} 	
public 
IMapper 
	setConfig  
<  !
TSource! (
,( )
TDestination* 6
>6 7
(7 8
)8 9
{   	
var!! 
config!! 
=!! 
new!! 
MapperConfiguration!! 0
(!!0 1
cfg!!1 4
=>!!5 7
{"" 
cfg## 
.## 
	CreateMap## 
<## 
TSource## %
,##% &
TDestination##' 3
>##3 4
(##4 5
)##5 6
;##6 7
}$$ 
)$$ 
;$$ 
IMapper%% 
mapper%% 
=%% 
config%% #
.%%# $
CreateMapper%%$ 0
(%%0 1
)%%1 2
;%%2 3
return&& 
mapper&& 
;&& 
}'' 	
}(( 
})) ±
ED:\EltizamLive\Eltizam.Business.Core\ModelMapper\UserMapperProfile.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
ModelMapper  +
{ 
public 

class 
MapperProfile 
< 
TSource &
,& '
TDestination( 4
>4 5
:6 7
Profile8 ?
{ 
public 
MapperProfile 
( 
) 
{		 	
	CreateMap

 
<

 
TSource

 
,

 
TDestination

 +
>

+ ,
(

, -
)

- .
.

. / 
IgnoreAllNonExisting

/ C
(

C D
)

D E
;

E F
} 	
} 
public 

static 
class 
IMappingExpression *
{ 
public 
static 
IMappingExpression (
<( )
TSource) 0
,0 1
TDestination2 >
>> ? 
IgnoreAllNonExisting@ T
<T U
TSourceU \
,\ ]
TDestination^ j
>j k
( 
this 
IMappingExpression 
< 
TSource  
,  !
TDestination" .
>. /

expression0 :
): ;
{ 	
var 
flags 
= 
BindingFlags $
.$ %
Public% +
|, -
BindingFlags. :
.: ;
Instance; C
;C D
var 

sourceType 
= 
typeof #
(# $
TSource$ +
)+ ,
;, -
var !
destinationProperties %
=& '
typeof( .
(. /
TDestination/ ;
); <
.< =
GetProperties= J
(J K
flagsK P
)P Q
;Q R
foreach 
( 
var 
property !
in" $!
destinationProperties% :
): ;
{ 
if 
( 

sourceType 
. 
GetProperty *
(* +
property+ 3
.3 4
Name4 8
,8 9
flags: ?
)? @
==A C
nullD H
)H I
{ 

expression 
. 
	ForMember (
(( )
property) 1
.1 2
Name2 6
,6 7
opt8 ;
=>< >
opt? B
.B C
IgnoreC I
(I J
)J K
)K L
;L M
} 
} 
return 

expression 
; 
} 	
}   
}!! A
CD:\EltizamLive\Eltizam.Business.Core\Resolver\DependencyResolver.cs
	namespace 	
Eltizam
 
. 
Business 
. 
Core 
.  
Resolver  (
{ 
public 

static 
class 
DependencyResolver *
{ 
public 
static 
IServiceCollection (
ContainerResolver) :
(: ;
this; ?
IServiceCollection@ R
servicesS [
)[ \
{ 	
services 
. 
AddTransient !
<! "(
IMasterQualificationServices" >
,> ?'
MasterQualificationServices@ [
>[ \
(\ ]
)] ^
;^ _
services 
. 
AddTransient !
<! ""
IMasterPropertyService" 8
,8 9!
MasterPropertyService: O
>O P
(P Q
)Q R
;R S
services 
. 
AddTransient !
<! "&
IMasterPropertyTypeService" <
,< =%
MasterPropertyTypeService> W
>W X
(X Y
)Y Z
;Z [
services 
. 
AddTransient !
<! ")
IMasterPropertySubTypeService" ?
,? @(
MasterPropertySubTypeServiceA ]
>] ^
(^ _
)_ `
;` a
services 
. 
AddTransient !
<! " 
IMasterVendorService" 6
,6 7
MasterVendorService8 K
>K L
(L M
)M N
;N O
services 
. 
	AddScoped 
< 
	DbContext (
,( )
EltizamDBContext* :
>: ;
(; <
)< =
;= >
services 
. 
	AddScoped 
< 
IMapperFactory -
,- .
MapperFactory/ <
>< =
(= >
)> ?
;? @
services 
. 
	AddScoped 
< 
IUnitOfWork *
,* +

UnitOfWork, 6
>6 7
(7 8
)8 9
;9 :
services 
. 
	AddScoped 
( 
typeof %
(% &
IRepository& 1
<1 2
>2 3
)3 4
,4 5
typeof6 <
(< =

Repository= G
<G H
>H I
)I J
)J K
;K L
services 
. 
AddTransient !
<! "
IMasterRoleService" 4
,4 5
MasterRoleService6 G
>G H
(H I
)I J
;J K
services 
. 
AddTransient !
<! "'
IMasterRoleModulePermission" =
,= >-
!MasterRoleModulePermissionService? `
>` a
(a b
)b c
;c d
services 
. 
AddTransient !
<! "
IMasterRoleService" 4
,4 5
MasterRoleService6 G
>G H
(H I
)I J
;J K
services 
. 
AddTransient !
<! "
IMasterUserService" 4
,4 5
MasterUserService6 G
>G H
(H I
)I J
;J K
services   
.   
AddTransient   !
<  ! "
IMasterCityService  " 4
,  4 5
MasterCityService  6 G
>  G H
(  H I
)  I J
;  J K
services!! 
.!! 
AddTransient!! !
<!!! "
IMasterStateService!!" 5
,!!5 6
MasterStateService!!7 I
>!!I J
(!!J K
)!!K L
;!!L M
services"" 
."" 
AddTransient"" !
<""! "!
IMasterCountryService""" 7
,""7 8 
MasterCountryService""9 M
>""M N
(""N O
)""O P
;""P Q
services## 
.## 
AddTransient## !
<##! "$
IMasterDepartmentService##" :
,##: ;#
MasterDepartmentService##< S
>##S T
(##T U
)##U V
;##V W
services$$ 
.$$ 
AddTransient$$ !
<$$! "%
IMasterDesignationService$$" ;
,$$; <$
MasterDesignationService$$= U
>$$U V
($$V W
)$$W X
;$$X Y
services%% 
.%% 
AddTransient%% !
<%%! "'
IMasterOwnershipTypeService%%" =
,%%= >&
MasterOwnershipTypeService%%? Y
>%%Y Z
(%%Z [
)%%[ \
;%%\ ]
services&& 
.&& 
AddTransient&& !
<&&! "'
IMasterValuationFeesService&&" =
,&&= >&
MasterValuationFeesService&&? Y
>&&Y Z
(&&Z [
)&&[ \
;&&\ ]
services'' 
.'' 
AddTransient'' !
<''! "*
IMasterValuationFeeTypeService''" @
,''@ A)
MasterValuationFeeTypeService''B _
>''_ `
(''` a
)''a b
;''b c
services(( 
.(( 
AddTransient(( !
<((! ""
IMasterLocationService((" 8
,((8 9!
MasterLocationService((: O
>((O P
(((P Q
)((Q R
;((R S
services)) 
.)) 
AddTransient)) !
<))! " 
IMasterModuleService))" 6
,))6 7
MasterModuleService))8 K
>))K L
())L M
)))M N
;))N O
services** 
.** 
AddTransient** !
<**! " 
IMasterClientService**" 6
,**6 7
MasterClientService**8 K
>**K L
(**L M
)**M N
;**N O
services++ 
.++ 
AddTransient++ !
<++! "$
IMasterClientTypeService++" :
,++: ;#
MasterClientTypeService++< S
>++S T
(++T U
)++U V
;++V W
services,, 
.,, 
AddTransient,, !
<,,! "$
IMasterDictionaryService,," :
,,,: ;#
MasterDictionaryService,,< S
>,,S T
(,,T U
),,U V
;,,V W
services-- 
.-- 
AddTransient-- !
<--! "$
IValuationRequestService--" :
,--: ;#
ValuationRequestService--< S
>--S T
(--T U
)--U V
;--V W
services.. 
... 
AddTransient.. !
<..! "*
IValuationRequestStatusService.." @
,..@ A)
ValuationRequestStatusService..B _
>.._ `
(..` a
)..a b
;..b c
services// 
.// 
AddTransient// !
<//! "&
IValuationQuatationService//" <
,//< =%
ValuationQuatationService//> W
>//W X
(//X Y
)//Y Z
;//Z [
services00 
.00 
AddTransient00 !
<00! "$
IValuationInvoiceService00" :
,00: ;#
ValuationInvoiceService00< S
>00S T
(00T U
)00U V
;00V W
services11 
.11 
AddTransient11 !
<11! "
IHelper11" )
,11) *
Helper11+ 1
>111 2
(112 3
)113 4
;114 5
services33 
.33 
AddTransient33 !
<33! "
IExceptionService33" 3
,333 4
ExceptionService335 E
>33E F
(33F G
)33G H
;33H I
services44 
.44 
AddTransient44 !
<44! "
IUploadService44" 0
,440 1
UploadService442 ?
>44? @
(44@ A
)44A B
;44B C
services66 
.66 
AddTransient66 !
<66! "
IAuditLogService66" 2
,662 3
AuditLogService664 C
>66C D
(66D E
)66E F
;66F G
return88 
services88 
;88 
}99 	
};; 
}<< 