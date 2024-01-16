�
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
} �
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
} ��
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
IExceptionService	"" �
exceptionService
""� �
)
""� �
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
	newEntity	;;x �
,
;;� �
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
dbParameters	nn} �
)
nn� �
;
nn� �
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
�� 
=
�� 
xx
�� 
.
�� 
	CreatedBy
�� (
,
��( )
CreatedDate
�� 
=
�� 
xx
��  
.
��  !
CreatedDate
��! ,
,
��, -

TableKeyId
�� 
=
�� 
xx
�� 
.
��  

TableKeyId
��  *
,
��* +
	TableName
�� 
=
�� 
xx
�� 
.
�� 
	TableName
�� (
,
��( )
Log
�� 
=
�� 
JsonConvert
�� !
.
��! "
DeserializeObject
��" 3
<
��3 4
IEnumerable
��4 ?
<
��? @
AuditLog
��@ H
>
��H I
>
��I J
(
��J K
xx
��K M
.
��M N
Log
��N Q
)
��Q R
}
�� 
)
�� 
;
�� 
return
�� 
auditLog
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� $
DataTableResponseModel
�� 0
>
��0 1
GetAll
��2 8
(
��8 9$
DataTableAjaxPostModel
��9 O
model
��P U
,
��U V
int
��W Z
?
��Z [
UserName
��\ d
,
��d e
string
��f l
?
��l m
	TableName
��n w
=
��x y
null
��z ~
,
��~ 
DateTime��� �
?��� �
DateFrom��� �
=��� �
null��� �
,��� �
DateTime��� �
?��� �
DateTo��� �
=��� �
null��� �
)��� �
{
�� 	
string
�� 

ColumnName
�� 
=
�� 
(
��  !
model
��! &
.
��& '
order
��' ,
.
��, -
Count
��- 2
>
��3 4
$num
��5 6
?
��7 8
model
��9 >
.
��> ?
columns
��? F
[
��F G
model
��G L
.
��L M
order
��M R
[
��R S
$num
��S T
]
��T U
.
��U V
column
��V \
]
��\ ]
.
��] ^
data
��^ b
:
��c d
string
��e k
.
��k l
Empty
��l q
)
��q r
;
��r s
string
�� 
SortDir
�� 
=
�� 
(
�� 
model
�� #
.
��# $
order
��$ )
.
��) *
Count
��* /
>
��0 1
$num
��2 3
?
��4 5
model
��6 ;
.
��; <
order
��< A
[
��A B
$num
��B C
]
��C D
.
��D E
dir
��E H
:
��I J
string
��K Q
.
��Q R
Empty
��R W
)
��W X
;
��X Y
System
�� 
.
�� 
Data
�� 
.
�� 
	SqlClient
�� !
.
��! "
SqlParameter
��" .
[
��. /
]
��/ 0
osqlParameter
��1 >
=
��? @
{
�� 
new
�� 
System
�� 
.
�� 
Data
�� 
.
��  
	SqlClient
��  )
.
��) *
SqlParameter
��* 6
(
��6 7
AppConstants
��7 C
.
��C D!
P_CurrentPageNumber
��D W
,
��W X
model
��Z _
.
��_ `
start
��` e
)
��e f
,
��f g
new
�� 
System
�� 
.
�� 
Data
�� 
.
��  
	SqlClient
��  )
.
��) *
SqlParameter
��* 6
(
��6 7
AppConstants
��7 C
.
��C D

P_PageSize
��D N
,
��N O
model
��Z _
.
��_ `
length
��` f
)
��f g
,
��g h
new
�� 
System
�� 
.
�� 
Data
�� 
.
��  
	SqlClient
��  )
.
��) *
SqlParameter
��* 6
(
��6 7
AppConstants
��7 C
.
��C D
P_SortColumn
��D P
,
��P Q

ColumnName
��Z d
)
��d e
,
��e f
new
�� 
System
�� 
.
�� 
Data
�� 
.
��  
	SqlClient
��  )
.
��) *
SqlParameter
��* 6
(
��6 7
AppConstants
��7 C
.
��C D
P_SortDirection
��D S
,
��S T
SortDir
��Z a
)
��a b
,
��b c
new
�� 
System
�� 
.
�� 
Data
�� 
.
��  
	SqlClient
��  )
.
��) *
SqlParameter
��* 6
(
��6 7
AppConstants
��7 C
.
��C D
P_SearchText
��D P
,
��P Q
model
��Z _
.
��_ `
search
��` f
?
��f g
.
��g h
value
��h m
)
��m n
,
��n o
new
�� 
System
�� 
.
�� 
Data
�� 
.
��  
	SqlClient
��  )
.
��) *
SqlParameter
��* 6
(
��6 7
$str
��7 @
,
��@ A
UserName
��Z b
)
��b c
,
��c d
new
�� 
System
�� 
.
�� 
Data
�� 
.
��  
	SqlClient
��  )
.
��) *
SqlParameter
��* 6
(
��6 7
$str
��7 C
,
��C D
	TableName
��Z c
)
��c d
,
��d e
new
�� 
System
�� 
.
�� 
Data
�� 
.
��  
	SqlClient
��  )
.
��) *
SqlParameter
��* 6
(
��6 7
$str
��7 B
,
��B C
DateFrom
��Z b
)
��b c
,
��c d
new
�� 
System
�� 
.
�� 
Data
�� 
.
��  
	SqlClient
��  )
.
��) *
SqlParameter
��* 6
(
��6 7
$str
��7 @
,
��@ A
DateTo
��Z `
)
��` a
}
�� 
;
�� 
var
�� 
Results
�� 
=
�� 
await
�� 
_repository
��  +
.
��+ ,
GetBySP
��, 3
(
��3 4 
ProcedureMetastore
��4 F
.
��F G(
usp_AuditLog_SearchAllList
��G a
,
��a b
CommandType
��c n
.
��n o
StoredProcedure
��o ~
,
��~ 
osqlParameter��� �
)��� �
;��� �
var
�� 
res
�� 
=
�� 
UtilityHelper
�� #
.
��# $
GetPaginationInfo
��$ 5
(
��5 6
Results
��6 =
)
��= >
;
��> ?$
DataTableResponseModel
�� "
resp
��# '
=
��( )
new
��* -$
DataTableResponseModel
��. D
(
��D E
model
��E J
.
��J K
draw
��K O
,
��O P
res
��Q T
.
��T U
Item1
��U Z
,
��Z [
res
��\ _
.
��_ `
Item1
��` e
,
��e f
Results
��g n
.
��n o
DataTableToList
��o ~
<
��~ $
AuditLogModelResponse�� �
>��� �
(��� �
)��� �
)��� �
;��� �
return
�� 
resp
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� #
AuditLogModelResponse
�� 4
>
��4 5
>
��5 6$
GetLogDetailsByFilters
��7 M
(
��M N
string
��N T
?
��T U
	TableName
��V _
,
��_ `
int
��a d
?
��d e
Id
��f h
=
��i j
null
��k o
,
��o p
int
��q t
?
��t u
TableKey
��v ~
=�� �
null��� �
,��� �
DateTime��� �
?��� �
DateFrom��� �
=��� �
null��� �
,��� �
DateTime��� �
?��� �
DateTo��� �
=��� �
null��� �
)��� �
{
�� 	
var
�� 
entityAuditLogs
�� 
=
��  !
await
��# (
_repository
��) 4
.
��4 5
FindAllAsync
��5 A
(
��A B
x
��B C
=>
��D F
(
��# $
	TableName
��$ -
==
��. 0
null
��1 5
||
��6 8
(
��9 :
x
��: ;
.
��; <
ParentTableName
��< K
==
��L N
	TableName
��O X
||
��Y [
x
��\ ]
.
��] ^
	TableName
��^ g
==
��h j
	TableName
��k t
)
��t u
)
��u v
&&
��  "
(
��# $
TableKey
��$ ,
==
��- /
null
��0 4
||
��5 7
(
��8 9
x
��9 :
.
��: ;
ParentTableKeyId
��; K
==
��L N
TableKey
��O W
||
��X Z
x
��[ \
.
��\ ]

TableKeyId
��] g
==
��h j
TableKey
��k s
)
��s t
)
��t u
&&
��  "
(
��# $
DateFrom
��$ ,
==
��- /
null
��0 4
||
��5 7
x
��8 9
.
��9 :
CreatedDate
��: E
>=
��F H
DateFrom
��I Q
)
��Q R
&&
��  "
(
��# $
DateTo
��$ *
==
��+ -
null
��. 2
||
��3 5
x
��6 7
.
��7 8
CreatedDate
��8 C
<=
��D F
DateTo
��G M
)
��M N
&&
��  "
(
��# $
Id
��$ &
==
��' )
null
��* .
||
��/ 1
x
��2 3
.
��3 4
Id
��4 6
==
��7 9
Id
��: <
)
��< =
)
��= >
;
��> ?
var
�� 
res
�� 
=
�� 
new
�� 
List
�� 
<
�� #
AuditLogModelResponse
�� 4
>
��4 5
(
��5 6
)
��6 7
;
��7 8
foreach
�� 
(
�� 
var
�� 
log
�� 
in
�� 
entityAuditLogs
��  /
)
��/ 0
{
�� 
var
�� 
_AuditLogListData
�� %
=
��& '
JsonConvert
��( 3
.
��3 4
DeserializeObject
��4 E
<
��E F
IEnumerable
��F Q
<
��Q R
	AuditLogs
��R [
>
��[ \
>
��\ ]
(
��] ^
log
��^ a
.
��a b
Log
��b e
)
��e f
;
��f g
var
�� 
usr
�� 
=
�� 
_user
�� 
.
��  
GetAll
��  &
(
��& '
)
��' (
.
��( )
Where
��) .
(
��. /
a
��/ 0
=>
��1 3
a
��4 5
.
��5 6
Id
��6 8
==
��9 ;
log
��< ?
.
��? @
	CreatedBy
��@ I
)
��I J
.
��J K
FirstOrDefault
��K Y
(
��Y Z
)
��Z [
;
��[ \
res
�� 
.
�� 
Add
�� 
(
�� 
new
�� #
AuditLogModelResponse
�� 1
(
��1 2
)
��2 3
{
�� 

ActionType
�� 
=
��  
log
��! $
.
��$ %

ActionType
��% /
,
��/ 0
ParentTableKeyId
�� $
=
��% &
log
��' *
.
��* +
ParentTableKeyId
��+ ;
,
��; <
ParentTableName
�� #
=
��$ %
log
��& )
.
��) *
ParentTableName
��* 9
,
��9 :

TableKeyId
�� 
=
��  
log
��! $
.
��$ %

TableKeyId
��% /
,
��/ 0
	TableName
�� 
=
�� 
log
��  #
.
��# $
	TableName
��$ -
,
��- .
Id
�� 
=
�� 
log
�� 
.
�� 
Id
�� 
,
��  
	CreatedBy
�� 
=
�� 
log
��  #
.
��# $
	CreatedBy
��$ -
,
��- .
CreatedDate
�� 
=
��  !
log
��" %
.
��% &
CreatedDate
��& 1
,
��1 2"
CreatedDateFormatted
�� (
=
��) *
log
��+ .
.
��. /
CreatedDate
��/ :
?
��: ;
.
��; <
ToString
��< D
(
��D E
$str
��E Z
)
��Z [
,
��[ \
CreatedByName
�� !
=
��" #
usr
��$ '
==
��( *
null
��+ /
?
��0 1
$str
��2 4
:
��5 6
usr
��7 :
.
��: ;
	FirstName
��; D
+
��E F
$char
��G J
+
��K L
usr
��M P
.
��P Q
LastName
��Q Y
,
��Y Z
AuditLogListData
�� $
=
��% &
_AuditLogListData
��' 8
?
��8 9
.
��9 :
ToList
��: @
(
��@ A
)
��A B
,
��B C
}
�� 
)
�� 
;
�� 
}
�� 
return
�� 
res
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
��  
AuditLogTableModel
�� 1
>
��1 2
>
��2 3%
GetAllAuditLogTableName
��4 K
(
��K L
)
��L M
{
�� 	
var
�� 
lstStf
�� 
=
�� 
EltizamDBHelper
�� (
.
��( )!
ExecuteMappedReader
��) <
<
��< = 
AuditLogTableModel
��= O
>
��O P
(
��P Q 
ProcedureMetastore
��Q c
.
��c d#
usp_AuditLog_GetTable
��d y
,
��y z 
DatabaseConnection
�� 
.
��  

ConnString
��  *
,
��* +
CommandType
��, 7
.
��7 8
StoredProcedure
��8 G
,
��G H
null
��I M
)
��M N
;
��N O
return
�� 
lstStf
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� $
DataTableResponseModel
�� 0
>
��0 1
GetAllDetailsLog
��2 B
(
��B C$
DataTableAjaxPostModel
��C Y
model
��Z _
,
��_ `
int
��a d
?
��d e
UserId
��f l
,
��l m
string
��n t
?
��t u
	TableName
��v 
,�� �
string��� �
?��� �
TableKey��� �
,��� �
int��� �
?��� �
Id��� �
,��� �
DateTime��� �
?��� �
DateFrom��� �
=��� �
null��� �
,��� �
DateTime��� �
?��� �
DateTo��� �
=��� �
null��� �
)��� �
{
�� 	
string
�� 

ColumnName
�� 
=
�� 
(
��  !
model
��! &
.
��& '
order
��' ,
.
��, -
Count
��- 2
>
��3 4
$num
��5 6
?
��7 8
model
��9 >
.
��> ?
columns
��? F
[
��F G
model
��G L
.
��L M
order
��M R
[
��R S
$num
��S T
]
��T U
.
��U V
column
��V \
]
��\ ]
.
��] ^
data
��^ b
:
��c d
string
��e k
.
��k l
Empty
��l q
)
��q r
;
��r s
string
�� 
SortDir
�� 
=
�� 
(
�� 
model
�� #
.
��# $
order
��$ )
.
��) *
Count
��* /
>
��0 1
$num
��2 3
?
��4 5
model
��6 ;
.
��; <
order
��< A
[
��A B
$num
��B C
]
��C D
.
��D E
dir
��E H
:
��I J
string
��K Q
.
��Q R
Empty
��R W
)
��W X
;
��X Y
System
�� 
.
�� 
Data
�� 
.
�� 
	SqlClient
�� !
.
��! "
SqlParameter
��" .
[
��. /
]
��/ 0
osqlParameter
��1 >
=
��? @
{
�� 
new
�� 
System
�� 
.
�� 
Data
�� 
.
��  
	SqlClient
��  )
.
��) *
SqlParameter
��* 6
(
��6 7
AppConstants
��7 C
.
��C D!
P_CurrentPageNumber
��D W
,
��W X
model
��Z _
.
��_ `
start
��` e
)
��e f
,
��f g
new
�� 
System
�� 
.
�� 
Data
�� 
.
��  
	SqlClient
��  )
.
��) *
SqlParameter
��* 6
(
��6 7
AppConstants
��7 C
.
��C D

P_PageSize
��D N
,
��N O
model
��Z _
.
��_ `
length
��` f
)
��f g
,
��g h
new
�� 
System
�� 
.
�� 
Data
�� 
.
��  
	SqlClient
��  )
.
��) *
SqlParameter
��* 6
(
��6 7
AppConstants
��7 C
.
��C D
P_SortColumn
��D P
,
��P Q

ColumnName
��Z d
)
��d e
,
��e f
new
�� 
System
�� 
.
�� 
Data
�� 
.
��  
	SqlClient
��  )
.
��) *
SqlParameter
��* 6
(
��6 7
AppConstants
��7 C
.
��C D
P_SortDirection
��D S
,
��S T
SortDir
��Z a
)
��a b
,
��b c
new
�� 
System
�� 
.
�� 
Data
�� 
.
��  
	SqlClient
��  )
.
��) *
SqlParameter
��* 6
(
��6 7
AppConstants
��7 C
.
��C D
P_SearchText
��D P
,
��P Q
model
��Z _
.
��_ `
search
��` f
?
��f g
.
��g h
value
��h m
)
��m n
,
��n o
new
�� 
System
�� 
.
�� 
Data
�� 
.
��  
	SqlClient
��  )
.
��) *
SqlParameter
��* 6
(
��6 7
$str
��7 @
,
��@ A
UserId
��Z `
)
��` a
,
��a b
new
�� 
System
�� 
.
�� 
Data
�� 
.
��  
	SqlClient
��  )
.
��) *
SqlParameter
��* 6
(
��6 7
$str
��7 C
,
��C D
	TableName
��Z c
)
��c d
,
��d e
new
�� 
System
�� 
.
�� 
Data
�� 
.
��  
	SqlClient
��  )
.
��) *
SqlParameter
��* 6
(
��6 7
$str
��7 B
,
��B C
TableKey
��Z b
)
��b c
,
��c d
new
�� 
System
�� 
.
�� 
Data
�� 
.
��  
	SqlClient
��  )
.
��) *
SqlParameter
��* 6
(
��6 7
$str
��7 <
,
��< =
Id
��Z \
)
��\ ]
,
��] ^
new
�� 
System
�� 
.
�� 
Data
�� 
.
��  
	SqlClient
��  )
.
��) *
SqlParameter
��* 6
(
��6 7
$str
��7 B
,
��B C
DateFrom
��Z b
)
��b c
,
��c d
new
�� 
System
�� 
.
�� 
Data
�� 
.
��  
	SqlClient
��  )
.
��) *
SqlParameter
��* 6
(
��6 7
$str
��7 @
,
��@ A
DateTo
��Z `
)
��` a
}
�� 
;
�� 
var
�� 
Results
�� 
=
�� 
await
�� 
_repository
��  +
.
��+ ,
GetBySP
��, 3
(
��3 4 
ProcedureMetastore
��4 F
.
��F G0
"usp_AuditLog_SearchDetailsByFilter
��G i
,
��i j
CommandType
��k v
.
��v w
StoredProcedure��w �
,��� �
osqlParameter��� �
)��� �
;��� �
var
�� 
res
�� 
=
�� 
UtilityHelper
�� #
.
��# $
GetPaginationInfo
��$ 5
(
��5 6
Results
��6 =
)
��= >
;
��> ?$
DataTableResponseModel
�� "
resp
��# '
=
��( )
new
��* -$
DataTableResponseModel
��. D
(
��D E
model
��E J
.
��J K
draw
��K O
,
��O P
res
��Q T
.
��T U
Item1
��U Z
,
��Z [
res
��\ _
.
��_ `
Item1
��` e
,
��e f
Results
��g n
.
��n o
DataTableToList
��o ~
<
��~  
AuditLogModelData�� �
>��� �
(��� �
)��� �
)��� �
;��� �
return
�� 
resp
�� 
;
�� 
}
�� 	
}
�� 
}�� �
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
} �f
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
%usp_ValuationRequest_GetLatestRequest	HHt �
,
HH� �
_dbConnection
HH� �
,
HH� �
System
HH� �
.
HH� �
Data
HH� �
.
HH� �
CommandType
HH� �
.
HH� �
StoredProcedure
HH� �
,
HH� �
osqlParameter
HH� �
)
HH� �
;
HH� �
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
'usp_ValuationRequest_GetLatestQuotation	OOx �
,
OO� �
_dbConnection
OO� �
,
OO� �
System
OO� �
.
OO� �
Data
OO� �
.
OO� �
CommandType
OO� �
.
OO� �
StoredProcedure
OO� �
,
OO� �
osqlParameter
OO� �
)
OO� �
;
OO� �
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
$usp_ValuationRequest_GetTopValuation	VVn �
,
VV� �
_dbConnection
VV� �
,
VV� �
System
VV� �
.
VV� �
Data
VV� �
.
VV� �
CommandType
VV� �
.
VV� �
StoredProcedure
VV� �
,
VV� �
osqlParameter
VV� �
)
VV� �
;
VV� �
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
'usp_ValuationRequest_GetTopQuotationDue	]]t �
,
]]� �
_dbConnection
]]� �
,
]]� �
System
]]� �
.
]]� �
Data
]]� �
.
]]� �
CommandType
]]� �
.
]]� �
StoredProcedure
]]� �
,
]]� �
osqlParameter
]]� �
)
]]� �
;
]]� �
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
%usp_ValuationRequest_GetWidgetRequest	ddw �
,
dd� �
_dbConnection
dd� �
,
dd� �
System
dd� �
.
dd� �
Data
dd� �
.
dd� �
CommandType
dd� �
.
dd� �
StoredProcedure
dd� �
,
dd� �
osqlParameter
dd� �
)
dd� �
;
dd� �
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
StoredProcedure	xxv �
,
xx� �
osqlParameter
xx� �
)
xx� �
;
xx� �
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
�� 	
}
�� 	
}�� �#
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
osqlParameter	11{ �
)
11� �
;
11� �
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
}== �
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
int	~ �
?
� �
	createdBy
� �
)
� �
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
}88 �q
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
mapperFactory	((s �
,
((� �
IHelper
((� �
helper
((� �
,
((� �
IConfiguration
((� �
configuration
((� �
,
((� �(
IMasterNotificationService
((� �!
notificationService
((� �
)
((� �
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
	OldEntity	VV{ �
,
VV� �
requestApprover
VV� �
,
VV� �
MainTableName
VV� �
,
VV� �
MainTableKey
VV� �
)
VV� �
;
VV� �
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
�� 
SqlParameter
��  
(
��  !
AppConstants
��! -
.
��- .
P_SortDirection
��. =
,
��= >
SortDir
��D K
)
��K L
,
��L M
new
�� 
SqlParameter
��  
(
��  !
AppConstants
��! -
.
��- .
P_SearchText
��. :
,
��: ;
model
��D I
.
��I J
search
��J P
?
��P Q
.
��Q R
value
��R W
)
��W X
}
�� 
;
�� 
var
�� 
Results
�� 
=
�� 
await
�� 
_repository
��  +
.
��+ ,
GetBySP
��, 3
(
��3 4 
ProcedureMetastore
��4 F
.
��F G-
usp_ApproverLevel_SearchAllList
��G f
,
��f g
CommandType
��h s
.
��s t
StoredProcedure��t �
,��� �
osqlParameter��� �
)��� �
;��� �
var
�� 
res
�� 
=
�� 
UtilityHelper
�� #
.
��# $
GetPaginationInfo
��$ 5
(
��5 6
Results
��6 =
)
��= >
;
��> ?$
DataTableResponseModel
�� "%
oDataTableResponseModel
��# :
=
��; <
new
��= @$
DataTableResponseModel
��A W
(
��W X
model
��X ]
.
��] ^
draw
��^ b
,
��b c
res
��d g
.
��g h
Item1
��h m
,
��m n
res
��o r
.
��r s
Item1
��s x
,
��x y
Results��z �
.��� �
DataTableToList��� �
<��� �(
MasterApproverLevelModel��� �
>��� �
(��� �
)��� �
)��� �
;��� �
return
�� %
oDataTableResponseModel
�� *
;
��* +
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� &
MasterApproverLevelModel
�� 2
>
��2 3
GetById
��4 ;
(
��; <
int
��< ?
Id
��@ B
)
��B C
{
�� 	
var
�� 
result
�� 
=
�� 
_repository
�� $
.
��$ %
Get
��% (
(
��( )
Id
��) +
)
��+ ,
;
��, -
var
�� 
lstStf
�� 
=
�� 
_mapperFactory
�� '
.
��' (
Get
��( +
<
��+ ,1
#MasterValuationRequestApproverLevel
��, O
,
��O P&
MasterApproverLevelModel
��Q i
>
��i j
(
��j k
result
��k q
)
��q r
;
��r s
var
�� 
userlist
�� 
=
�� 
_UserRepository
�� *
.
��* +
FindAll
��+ 2
(
��2 3
x
��3 4
=>
��5 7
x
��8 9
.
��9 :
ApproverLevelId
��: I
==
��J L
Id
��M O
)
��O P
.
��P Q
ToList
��Q W
(
��W X
)
��X Y
;
��Y Z
var
�� 
lst
�� 
=
�� 
new
�� 
List
�� 
<
�� 
ApproverUserModel
�� 0
>
��0 1
(
��1 2
)
��2 3
;
��3 4
foreach
�� 
(
�� 
var
�� 
item
�� 
in
�� !
userlist
��" *
)
��+ ,
{
�� 
lst
�� 
.
�� 
Add
�� 
(
�� 
new
�� 
ApproverUserModel
�� -
(
��- .
)
��. /
{
�� 
Id
�� 
=
�� 
item
�� 
.
�� 
Id
��  
,
��  !
UserName
�� 
=
�� 
item
�� #
.
��# $
UserName
��$ ,
}
�� 
)
�� 
;
�� 
}
�� 
lstStf
�� 
.
�� 
	UsersList
�� 
=
�� 
lst
�� "
;
��" #
return
�� 
lstStf
�� 
;
�� 
}
�� 	
}
�� 
}�� �
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
osqlParameter	88| �
)
88� �
;
88� �
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
Results	=={ �
.
==� �
DataTableToList
==� �
<
==� �!
MasterUserListModel
==� �
>
==� �
(
==� �
)
==� �
)
==� �
;
==� �
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
usp_City_SearchAllList	KKu �
,
KK� �
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
�� 
.
��  
Stdcode
��  '
=
��( )

entityCity
��* 4
.
��4 5
STDCode
��5 <
;
��< =
objCity
�� 
.
��  
IsActive
��  (
=
��) *

entityCity
��+ 5
.
��5 6
IsActive
��6 >
;
��> ?
objCity
�� 
.
��  
ModifiedDate
��  ,
=
��- .
AppConstants
��/ ;
.
��; <
DateTime
��< D
;
��D E
objCity
�� 
.
��  

ModifiedBy
��  *
=
��+ ,

entityCity
��- 7
.
��7 8
	CreatedBy
��8 A
;
��A B
_repository
�� #
.
��# $
UpdateAsync
��$ /
(
��/ 0
objCity
��0 7
)
��7 8
;
��8 9
await
�� 
_unitOfWork
�� )
.
��) *
SaveChangesAsync
��* :
(
��: ;
)
��; <
;
��< =
_auditLogService
�� (
.
��( )
CreateAuditLog
��) 7
<
��7 8

MasterCity
��8 B
>
��B C
(
��C D!
AuditActionTypeEnum
��D W
.
��W X
Update
��X ^
,
��^ _
	OldEntity
��` i
,
��i j
objCity
��k r
,
��r s
MainTableName��t �
,��� �
MainTableKey��� �
)��� �
;��� �
}
�� 
else
�� 
{
�� 
return
�� 
DBOperation
�� *
.
��* +
NotFound
��+ 3
;
��3 4
}
�� 
}
�� 
else
�� 
{
�� 
objCity
�� 
=
�� 
_mapperFactory
�� ,
.
��, -
Get
��- 0
<
��0 1
MasterCityEntity
��1 A
,
��A B

MasterCity
��C M
>
��M N
(
��N O

entityCity
��O Y
)
��Y Z
;
��Z [
objCity
�� 
.
�� 
CityName
�� $
=
��% &

entityCity
��' 1
.
��1 2
CityName
��2 :
;
��: ;
objCity
�� 
.
�� 
	CountryId
�� %
=
��& '

entityCity
��( 2
.
��2 3
	CountryId
��3 <
;
��< =
objCity
�� 
.
�� 
StateId
�� #
=
��$ %

entityCity
��& 0
.
��0 1
StateId
��1 8
;
��8 9
objCity
�� 
.
�� 
Stdcode
�� #
=
��$ %

entityCity
��& 0
.
��0 1
STDCode
��1 8
;
��8 9
objCity
�� 
.
�� 
IsActive
�� $
=
��% &

entityCity
��' 1
.
��1 2
IsActive
��2 :
;
��: ;
objCity
�� 
.
�� 
CreatedDate
�� '
=
��( )
AppConstants
��* 6
.
��6 7
DateTime
��7 ?
;
��? @
objCity
�� 
.
�� 
	CreatedBy
�� %
=
��& '

entityCity
��( 2
.
��2 3
	CreatedBy
��3 <
;
��< =
objCity
�� 
.
�� 
ModifiedDate
�� (
=
��) *
AppConstants
��+ 7
.
��7 8
DateTime
��8 @
;
��@ A
objCity
�� 
.
�� 

ModifiedBy
�� &
=
��' (

entityCity
��) 3
.
��3 4
	CreatedBy
��4 =
;
��= >
_repository
�� 
.
��  
AddAsync
��  (
(
��( )
objCity
��) 0
)
��0 1
;
��1 2
await
�� 
_unitOfWork
�� %
.
��% &
SaveChangesAsync
��& 6
(
��6 7
)
��7 8
;
��8 9
}
�� 
if
�� 
(
�� 
objCity
�� 
.
�� 
Id
�� 
==
�� !
$num
��" #
)
��# $
return
�� 
DBOperation
�� &
.
��& '
Error
��' ,
;
��, -
return
�� 
DBOperation
�� "
.
��" #
Success
��# *
;
��* +
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
throw
�� 
ex
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
DBOperation
�� %
>
��% &
Delete
��' -
(
��- .
int
��. 1
id
��2 4
)
��4 5
{
�� 	
var
�� 

entityCity
�� 
=
�� 
_repository
�� (
.
��( )
Get
��) ,
(
��, -
x
��- .
=>
��/ 1
x
��2 3
.
��3 4
Id
��4 6
==
��7 9
id
��: <
)
��< =
;
��= >
if
�� 
(
�� 

entityCity
�� 
==
�� 
null
�� "
)
��" #
return
�� 
DBOperation
�� "
.
��" #
NotFound
��# +
;
��+ ,
_repository
�� 
.
�� 
Remove
�� 
(
�� 

entityCity
�� )
)
��) *
;
��* +
await
�� 
_unitOfWork
�� 
.
�� 
SaveChangesAsync
�� .
(
��. /
)
��/ 0
;
��0 1
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� 
MasterCityEntity
�� /
>
��/ 0
>
��0 1
GetCityList
��2 =
(
��= >
)
��> ?
{
�� 	
var
�� 
lstStf
�� 
=
�� 
EltizamDBHelper
�� (
.
��( )!
ExecuteMappedReader
��) <
<
��< =
MasterCityEntity
��= M
>
��M N
(
��N O 
ProcedureMetastore
��O a
.
��a b
usp_City_AllList
��b r
,
��r s 
DatabaseConnection
�� 
.
��  

ConnString
��  *
,
��* +
CommandType
��, 7
.
��7 8
StoredProcedure
��8 G
,
��G H
null
��I M
)
��M N
;
��N O
return
�� 
lstStf
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� 
MasterCityEntity
�� /
>
��/ 0
>
��0 1"
GetCityListByStateId
��2 F
(
��F G
int
��G J
stateId
��K R
)
��R S
{
�� 	
var
�� 
cityList
�� 
=
�� 
new
�� 
List
�� #
<
��# $
MasterCityEntity
��$ 4
>
��4 5
(
��5 6
)
��6 7
;
��7 8
var
�� 
stateListAsync
�� 
=
��  
_repository
��! ,
.
��, -
GetAllAsync
��- 8
(
��8 9
x
��9 :
=>
��; =
x
��> ?
.
��? @
StateId
��@ G
==
��H J
stateId
��K R
)
��R S
.
��S T
Result
��T Z
.
��Z [
ToList
��[ a
(
��a b
)
��b c
;
��c d
cityList
�� 
=
�� 
_mapperFactory
�� %
.
��% &
GetList
��& -
<
��- .

MasterCity
��. 8
,
��8 9
MasterCityEntity
��: J
>
��J K
(
��K L
stateListAsync
��L Z
)
��Z [
;
��[ \
return
�� 
cityList
�� 
;
�� 
}
�� 	
}
�� 
}�� ��
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
"usp_Address_GetAddressByTableKeyId	WWn �
,
WW� �
_dbConnection
WW� �
,
WW� �
System
WW� �
.
WW� �
Data
WW� �
.
WW� �
CommandType
WW� �
.
WW� �
StoredProcedure
WW� �
,
WW� �
osqlParameter
WW� �
)
WW� �
;
WW� �
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
"usp_Contact_GetContactByTableKeyId	llj �
,
ll� � 
DatabaseConnection
ll� �
.
ll� �

ConnString
ll� �
,
ll� �
System
ll� �
.
ll� �
Data
ll� �
.
ll� �
CommandType
ll� �
.
ll� �
StoredProcedure
ll� �
,
ll� �
osqlParameter1
ll� �
)
ll� �
;
ll� �
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
$usp_Document_GetDocumentByTableKeyId	xxp �
,
xx� �
_dbConnection
xx� �
,
xx� �
System
xx� �
.
xx� �
Data
xx� �
.
xx� �
CommandType
xx� �
.
xx� �
StoredProcedure
xx� �
,
xx� �
osqlParameter2
xx� �
)
xx� �
;
xx� �
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
�� 
async
�� 
Task
�� 
<
�� $
DataTableResponseModel
�� 0
>
��0 1
GetAll
��2 8
(
��8 9$
DataTableAjaxPostModel
��9 O
model
��P U
)
��U V
{
�� 	
string
�� 

ColumnName
�� 
=
�� 
(
��  !
model
��! &
.
��& '
order
��' ,
.
��, -
Count
��- 2
>
��3 4
$num
��5 6
?
��7 8
model
��9 >
.
��> ?
columns
��? F
[
��F G
model
��G L
.
��L M
order
��M R
[
��R S
$num
��S T
]
��T U
.
��U V
column
��V \
]
��\ ]
.
��] ^
data
��^ b
:
��c d
string
��e k
.
��k l
Empty
��l q
)
��q r
;
��r s
string
�� 
SortDir
�� 
=
�� 
(
�� 
model
�� #
.
��# $
order
��$ )
.
��) *
Count
��* /
>
��0 1
$num
��2 3
?
��4 5
model
��6 ;
.
��; <
order
��< A
[
��A B
$num
��B C
]
��C D
.
��D E
dir
��E H
:
��I J
string
��K Q
.
��Q R
Empty
��R W
)
��W X
;
��X Y
SqlParameter
�� 
[
�� 
]
�� 
osqlParameter
�� (
=
��) *
{
�� 
new
�� 
SqlParameter
��  
(
��  !
AppConstants
��! -
.
��- .!
P_CurrentPageNumber
��. A
,
��A B
model
��D I
.
��I J
start
��J O
)
��O P
,
��P Q
new
�� 
SqlParameter
��  
(
��  !
AppConstants
��! -
.
��- .

P_PageSize
��. 8
,
��8 9
model
��D I
.
��I J
length
��J P
)
��P Q
,
��Q R
new
�� 
SqlParameter
��  
(
��  !
AppConstants
��! -
.
��- .
P_SortColumn
��. :
,
��: ;

ColumnName
��D N
)
��N O
,
��O P
new
�� 
SqlParameter
��  
(
��  !
AppConstants
��! -
.
��- .
P_SortDirection
��. =
,
��= >
SortDir
��D K
)
��K L
,
��L M
new
�� 
SqlParameter
��  
(
��  !
AppConstants
��! -
.
��- .
P_SearchText
��. :
,
��: ;
model
��D I
.
��I J
search
��J P
?
��P Q
.
��Q R
value
��R W
)
��W X
}
�� 
;
�� 
var
�� 
Results
�� 
=
�� 
await
�� 
_repository
��  +
.
��+ ,
GetBySP
��, 3
(
��3 4 
ProcedureMetastore
��4 F
.
��F G-
usp_Client_Search_GetClientList
��G f
,
��f g
System
��h n
.
��n o
Data
��o s
.
��s t
CommandType
��t 
.�� �
StoredProcedure��� �
,��� �
osqlParameter��� �
)��� �
;��� �
var
�� 
res
�� 
=
�� 
UtilityHelper
�� #
.
��# $
GetPaginationInfo
��$ 5
(
��5 6
Results
��6 =
)
��= >
;
��> ?$
DataTableResponseModel
�� "%
oDataTableResponseModel
��# :
=
��; <
new
��= @$
DataTableResponseModel
��A W
(
��W X
model
��X ]
.
��] ^
draw
��^ b
,
��b c
res
��d g
.
��g h
Item1
��h m
,
��m n
res
��o r
.
��r s
Item1
��s x
,
��x y
Results��z �
.��� �
DataTableToList��� �
<��� �%
MasterClientListModel��� �
>��� �
(��� �
)��� �
)��� �
;��� �
return
�� %
oDataTableResponseModel
�� *
;
��* +
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
DBOperation
�� %
>
��% &#
AddUpdateMasterClient
��' <
(
��< =
MasterClientModel
��= N 
master_ClientModel
��O a
)
��a b
{
�� 	
MasterClient
�� 
	objClient
�� "
;
��" #
MasterAddress
�� 

objAddress
�� $
;
��$ %
MasterContact
�� 

objContact
�� $
;
��$ %
MasterDocument
�� 
objDocument
�� &
;
��& '
string
�� 
MainTableName
��  
=
��! "
Enum
��# '
.
��' (
GetName
��( /
(
��/ 0
TableNameEnum
��0 =
.
��= >
Master_Client
��> K
)
��K L
;
��L M
int
�� 
MainTableKey
�� 
=
��  
master_ClientModel
�� 1
.
��1 2
Id
��2 4
;
��4 5
if
�� 
(
��  
master_ClientModel
�� "
.
��" #
Id
��# %
>
��& '
$num
��( )
)
��) *
{
�� 
MasterClient
�� 
	OldEntity
�� &
=
��' (
null
��) -
;
��- .
	OldEntity
�� 
=
�� 
_repository
�� '
.
��' (
GetNoTracking
��( 5
(
��5 6 
master_ClientModel
��6 H
.
��H I
Id
��I K
)
��K L
;
��L M
	objClient
�� 
=
�� 
_repository
�� '
.
��' (
Get
��( +
(
��+ , 
master_ClientModel
��, >
.
��> ?
Id
��? A
)
��A B
;
��B C
if
�� 
(
�� 
	objClient
�� 
!=
��  
null
��! %
)
��% &
{
�� 
	objClient
�� 
=
�� 
_mapperFactory
��  .
.
��. /
Get
��/ 2
<
��2 3
MasterClientModel
��3 D
,
��D E
MasterClient
��F R
>
��R S
(
��S T 
master_ClientModel
��T f
)
��f g
;
��g h
	objClient
�� 
.
�� 
	FirstName
�� '
=
��( ) 
master_ClientModel
��* <
.
��< =
	FirstName
��= F
;
��F G
	objClient
�� 
.
�� 

MiddleName
�� (
=
��) * 
master_ClientModel
��+ =
.
��= >

MiddleName
��> H
==
��H J
null
��J N
?
��N O
$str
��O Q
:
��Q R 
master_ClientModel
��S e
.
��e f

MiddleName
��f p
;
��p q
	objClient
�� 
.
�� 
LastName
�� &
=
��' ( 
master_ClientModel
��) ;
.
��; <
LastName
��< D
;
��D E
	objClient
�� 
.
�� 
ClientTypeId
�� *
=
��+ , 
master_ClientModel
��- ?
.
��? @
ClientTypeId
��@ L
;
��L M
	objClient
�� 
.
�� 
	Trnnumber
�� '
=
��( ) 
master_ClientModel
��* <
.
��< =
	Trnnumber
��= F
;
��F G
	objClient
�� 
.
�� 
TrnexpiryDate
�� +
=
��, - 
master_ClientModel
��. @
.
��@ A
TrnexpiryDate
��A N
;
��N O
	objClient
�� 
.
�� 
LicenseNumber
�� +
=
��, - 
master_ClientModel
��. @
.
��@ A
LicenseNumber
��A N
;
��N O
	objClient
�� 
.
�� 
IsActive
�� &
=
��' ( 
master_ClientModel
��) ;
.
��; <
IsActive
��< D
;
��D E
	objClient
�� 
.
�� 
Logo
�� "
=
��# $ 
master_ClientModel
��% 7
.
��7 8
Logo
��8 <
;
��< =
	objClient
�� 
.
�� 
ModifiedDate
�� *
=
��+ ,
AppConstants
��- 9
.
��9 :
DateTime
��: B
;
��B C
	objClient
�� 
.
�� 

ModifiedBy
�� (
=
��) * 
master_ClientModel
��+ =
.
��= >

ModifiedBy
��> H
;
��H I
_repository
�� 
.
��  
UpdateAsync
��  +
(
��+ ,
	objClient
��, 5
)
��5 6
;
��6 7
await
�� 
_unitOfWork
�� %
.
��% &
SaveChangesAsync
��& 6
(
��6 7
)
��7 8
;
��8 9
await
�� 
_auditLogService
�� *
.
��* +
CreateAuditLog
��+ 9
<
��9 :
MasterClient
��: F
>
��F G
(
��G H!
AuditActionTypeEnum
��H [
.
��[ \
Update
��\ b
,
��b c
	OldEntity
��d m
,
��m n
	objClient
��o x
,
��x y
MainTableName��z �
,��� �
MainTableKey��� �
)��� �
;��� �
}
�� 
else
�� 
{
�� 
return
�� 
DBOperation
�� &
.
��& '
NotFound
��' /
;
��/ 0
}
�� 
}
�� 
else
�� 
{
�� 
	objClient
�� 
=
�� 
_mapperFactory
�� *
.
��* +
Get
��+ .
<
��. /
MasterClientModel
��/ @
,
��@ A
MasterClient
��B N
>
��N O
(
��O P 
master_ClientModel
��P b
)
��b c
;
��c d
	objClient
�� 
.
�� 

MiddleName
�� $
=
��% & 
master_ClientModel
��' 9
.
��9 :

MiddleName
��: D
==
��E G
null
��H L
?
��M N
$str
��O Q
:
��R S 
master_ClientModel
��T f
.
��f g

MiddleName
��g q
;
��q r
	objClient
�� 
.
�� 
CreatedDate
�� %
=
��& '
AppConstants
��( 4
.
��4 5
DateTime
��5 =
;
��= >
	objClient
�� 
.
�� 
	CreatedBy
�� #
=
��$ % 
master_ClientModel
��& 8
.
��8 9
	CreatedBy
��9 B
;
��B C
_repository
�� 
.
�� 
AddAsync
�� $
(
��$ %
	objClient
��% .
)
��. /
;
��/ 0
await
�� 
_unitOfWork
�� !
.
��! "
SaveChangesAsync
��" 2
(
��2 3
)
��3 4
;
��4 5
}
�� 
if
�� 
(
�� 
	objClient
�� 
.
�� 
Id
�� 
==
�� 
$num
��  !
)
��! "
{
�� 
return
�� 
DBOperation
�� "
.
��" #
Error
��# (
;
��( )
}
�� 
else
�� 
{
�� 
if
�� 
(
��  
master_ClientModel
�� &
.
��& '
uploadProfile
��' 4
!=
��5 7
null
��8 <
)
��< =
{
�� 
objDocument
�� 
=
��  !
_mapperFactory
��" 0
.
��0 1
Get
��1 4
<
��4 5!
MasterDocumentModel
��5 H
,
��H I
MasterDocument
��J X
>
��X Y
(
��Y Z 
master_ClientModel
��Z l
.
��l m
uploadProfile
��m z
)
��z {
;
��{ |
objDocument
�� 
.
��  
IsActive
��  (
=
��) * 
master_ClientModel
��+ =
.
��= >
uploadProfile
��> K
.
��K L
IsActive
��L T
;
��T U
objDocument
�� 
.
��  

TableKeyId
��  *
=
��+ ,
	objClient
��- 6
.
��6 7
Id
��7 9
;
��9 :
objDocument
�� 
.
��  
	TableName
��  )
=
��* +
$str
��, ;
;
��; <
objDocument
�� 
.
��  
DocumentName
��  ,
=
��- . 
master_ClientModel
��/ A
.
��A B
uploadProfile
��B O
.
��O P
DocumentName
��P \
;
��\ ]
objDocument
�� 
.
��  
FileName
��  (
=
��) * 
master_ClientModel
��+ =
.
��= >
uploadProfile
��> K
.
��K L
FileName
��L T
;
��T U
objDocument
�� 
.
��  
FilePath
��  (
=
��) * 
master_ClientModel
��+ =
.
��= >
uploadProfile
��> K
.
��K L
FilePath
��L T
;
��T U
objDocument
�� 
.
��  
FileType
��  (
=
��) * 
master_ClientModel
��+ =
.
��= >
uploadProfile
��> K
.
��K L
FileType
��L T
;
��T U
objDocument
�� 
.
��  
	CreatedBy
��  )
=
��* + 
master_ClientModel
��, >
.
��> ?
uploadProfile
��? L
.
��L M
	CreatedBy
��M V
;
��V W!
_repositoryDocument
�� '
.
��' (
AddAsync
��( 0
(
��0 1
objDocument
��1 <
)
��< =
;
��= >
await
�� 
_unitOfWork
�� %
.
��% &
SaveChangesAsync
��& 6
(
��6 7
)
��7 8
;
��8 9
var
�� 
client
�� 
=
��  
_repository
��! ,
.
��, -
Get
��- 0
(
��0 1
	objClient
��1 :
.
��: ;
Id
��; =
)
��= >
;
��> ?
client
�� 
.
�� !
ProfileAttachmentId
�� .
=
��/ 0
objDocument
��1 <
.
��< =
Id
��= ?
;
��? @
_repository
�� 
.
��  
UpdateAsync
��  +
(
��+ ,
client
��, 2
)
��2 3
;
��3 4
await
�� 
_unitOfWork
�� %
.
��% &
SaveChangesAsync
��& 6
(
��6 7
)
��7 8
;
��8 9
}
�� 
if
�� 
(
��  
master_ClientModel
�� &
.
��& '
	Addresses
��' 0
.
��0 1
Count
��1 6
>
��7 8
$num
��9 :
)
��: ;
{
�� 
var
�� 
entityAddressess
�� (
=
��) * 
_repositoryAddress
��+ =
.
��= >
GetAll
��> D
(
��D E
)
��E F
.
��F G
Where
��G L
(
��L M
x
��M N
=>
��O Q
x
��R S
.
��S T

TableKeyId
��T ^
==
��_ a
	objClient
��b k
.
��k l
Id
��l n
&&
��o q
x
��r s
.
��s t
	TableName
��t }
==��~ �
$str��� �
&&��� �
(��� �
x��� �
.��� �
	IsDeleted��� �
==��� �
false��� �
||��� �
x��� �
.��� �
	IsDeleted��� �
==��� �
null��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
var
�� 
allAddressId
�� $
=
��% &
entityAddressess
��' 7
.
��7 8
Count
��8 =
>
��> ?
$num
��@ A
?
��B C
entityAddressess
��D T
.
��T U
Select
��U [
(
��[ \
x
��\ ]
=>
��^ `
x
��a b
.
��b c
Id
��c e
)
��e f
.
��f g
OrderBy
��g n
(
��n o
Id
��o q
=>
��r t
Id
��u w
)
��w x
.
��x y
ToList
��y 
(�� �
)��� �
:��� �
null��� �
;��� �
foreach
�� 
(
�� 
var
��  
address
��! (
in
��) + 
master_ClientModel
��, >
.
��> ?
	Addresses
��? H
)
��H I
{
�� 
if
�� 
(
�� 
address
�� #
.
��# $
Id
��$ &
>
��' (
$num
��) *
)
��* +
{
�� 
if
�� 
(
�� 
allAddressId
�� +
!=
��, .
null
��/ 3
&&
��4 6
allAddressId
��7 C
.
��C D
Count
��D I
>
��J K
$num
��L M
)
��M N
{
�� 
allAddressId
��  ,
.
��, -
Remove
��- 3
(
��3 4
address
��4 ;
.
��; <
Id
��< >
)
��> ?
;
��? @
}
�� 
var
�� 
	OldEntity
��  )
=
��* + 
_repositoryAddress
��, >
.
��> ?
GetNoTracking
��? L
(
��L M
address
��M T
.
��T U
Id
��U W
)
��W X
;
��X Y

objAddress
�� &
=
��' ( 
_repositoryAddress
��) ;
.
��; <
Get
��< ?
(
��? @
address
��@ G
.
��G H
Id
��H J
)
��J K
;
��K L
if
�� 
(
��  

objAddress
��  *
!=
��+ -
null
��. 2
)
��2 3
{
�� 
var
��  #
entityAddress
��$ 1
=
��2 3
_mapperFactory
��4 B
.
��B C
Get
��C F
<
��F G!
MasterAddressEntity
��G Z
,
��Z [
MasterAddress
��\ i
>
��i j
(
��j k
address
��k r
)
��r s
;
��s t

objAddress
��  *
.
��* +
Address1
��+ 3
=
��4 5
entityAddress
��6 C
.
��C D
Address1
��D L
;
��L M

objAddress
��  *
.
��* +
Address2
��+ 3
=
��4 5
entityAddress
��6 C
.
��C D
Address2
��D L
;
��L M

objAddress
��  *
.
��* +
Address3
��+ 3
=
��4 5
entityAddress
��6 C
.
��C D
Address3
��D L
;
��L M

objAddress
��  *
.
��* +
Landmark
��+ 3
=
��4 5
entityAddress
��6 C
.
��C D
Landmark
��D L
;
��L M

objAddress
��  *
.
��* +
PinNo
��+ 0
=
��1 2
entityAddress
��3 @
.
��@ A
PinNo
��A F
;
��F G

objAddress
��  *
.
��* +
	CountryId
��+ 4
=
��5 6
entityAddress
��7 D
.
��D E
	CountryId
��E N
;
��N O

objAddress
��  *
.
��* +
StateId
��+ 2
=
��3 4
entityAddress
��5 B
.
��B C
StateId
��C J
;
��J K

objAddress
��  *
.
��* +
CityId
��+ 1
=
��2 3
entityAddress
��4 A
.
��A B
CityId
��B H
;
��H I

objAddress
��  *
.
��* +
PinNo
��+ 0
=
��1 2
entityAddress
��3 @
.
��@ A
PinNo
��A F
;
��F G

objAddress
��  *
.
��* +
Zone
��+ /
=
��0 1
entityAddress
��2 ?
.
��? @
Zone
��@ D
;
��D E

objAddress
��  *
.
��* +
Email
��+ 0
=
��1 2
entityAddress
��3 @
.
��@ A
Email
��A F
;
��F G

objAddress
��  *
.
��* +
AlternateEmail
��+ 9
=
��: ;
entityAddress
��< I
.
��I J
AlternateEmail
��J X
;
��X Y

objAddress
��  *
.
��* +
PhoneExt
��+ 3
=
��4 5
entityAddress
��6 C
.
��C D
PhoneExt
��D L
;
��L M

objAddress
��  *
.
��* +
Phone
��+ 0
=
��1 2
entityAddress
��3 @
.
��@ A
Phone
��A F
;
��F G

objAddress
��  *
.
��* +
AlternatePhone
��+ 9
=
��: ;
entityAddress
��< I
.
��I J
AlternatePhone
��J X
;
��X Y

objAddress
��  *
.
��* +
AlternatePhoneExt
��+ <
=
��= >
entityAddress
��? L
.
��L M
AlternatePhoneExt
��M ^
;
��^ _

objAddress
��  *
.
��* +
Landlinephone
��+ 8
=
��9 :
entityAddress
��; H
.
��H I
Landlinephone
��I V
;
��V W

objAddress
��  *
.
��* +

ModifiedBy
��+ 5
=
��6 7 
master_ClientModel
��8 J
.
��J K

ModifiedBy
��K U
;
��U V 
_repositoryAddress
��  2
.
��2 3
UpdateAsync
��3 >
(
��> ?

objAddress
��? I
)
��I J
;
��J K
await
��  %
_unitOfWork
��& 1
.
��1 2
SaveChangesAsync
��2 B
(
��B C
)
��C D
;
��D E
await
��  %
_auditLogService
��& 6
.
��6 7
CreateAuditLog
��7 E
<
��E F
MasterAddress
��F S
>
��S T
(
��T U!
AuditActionTypeEnum
��U h
.
��h i
Update
��i o
,
��o p
	OldEntity
��q z
,
��z {

objAddress��| �
,��� �
MainTableName��� �
,��� �
MainTableKey��� �
)��� �
;��� �
}
�� 
}
�� 
else
�� 
{
�� 

objAddress
�� &
=
��' (
_mapperFactory
��) 7
.
��7 8
Get
��8 ;
<
��; <!
MasterAddressEntity
��< O
,
��O P
MasterAddress
��Q ^
>
��^ _
(
��_ `
address
��` g
)
��g h
;
��h i

objAddress
�� &
.
��& '

TableKeyId
��' 1
=
��2 3
	objClient
��4 =
.
��= >
Id
��> @
;
��@ A

objAddress
�� &
.
��& '
	TableName
��' 0
=
��1 2
Enum
��3 7
.
��7 8
GetName
��8 ?
(
��? @
TableNameEnum
��@ M
.
��M N
Master_Client
��N [
)
��[ \
;
��\ ]

objAddress
�� &
.
��& '
	CreatedBy
��' 0
=
��1 2 
master_ClientModel
��3 E
.
��E F
	CreatedBy
��F O
;
��O P

objAddress
�� &
.
��& '
IsActive
��' /
=
��0 1
true
��2 6
;
��6 7 
_repositoryAddress
�� .
.
��. /
AddAsync
��/ 7
(
��7 8

objAddress
��8 B
)
��B C
;
��C D
await
�� !
_unitOfWork
��" -
.
��- .
SaveChangesAsync
��. >
(
��> ?
)
��? @
;
��@ A
}
�� 
}
�� 
if
�� 
(
�� 
allAddressId
�� #
!=
��$ &
null
��' +
&&
��, .
allAddressId
��/ ;
.
��; <
Count
��< A
>
��B C
$num
��D E
)
��E F
{
�� 
foreach
�� 
(
��  
var
��! $
addId
��% *
in
��+ -
allAddressId
��. :
)
��: ;
{
�� 
var
�� 
	entityAdd
��  )
=
��* + 
_repositoryAddress
��, >
.
��> ?
Get
��? B
(
��B C
x
��C D
=>
��E G
x
��H I
.
��I J
Id
��J L
==
��M O
addId
��P U
)
��U V
;
��V W
if
�� 
(
�� 
	entityAdd
�� (
!=
��) +
null
��, 0
)
��0 1
{
��  
_repositoryAddress
��  2
.
��2 3
Remove
��3 9
(
��9 :
	entityAdd
��: C
)
��C D
;
��D E
}
�� 
}
�� 
await
�� 
_unitOfWork
�� )
.
��) *
SaveChangesAsync
��* :
(
��: ;
)
��; <
;
��< =
}
�� 
}
�� 
if
�� 
(
��  
master_ClientModel
�� &
.
��& '
Contacts
��' /
.
��/ 0
Count
��0 5
>
��6 7
$num
��8 9
)
��9 :
{
�� 
var
�� 
entityContacts
�� &
=
��' ( 
_repositoryContact
��) ;
.
��; <
GetAll
��< B
(
��B C
)
��C D
.
��D E
Where
��E J
(
��J K
x
��K L
=>
��M O
x
��P Q
.
��Q R

TableKeyId
��R \
==
��] _
	objClient
��` i
.
��i j
Id
��j l
&&
��m o
x
��p q
.
��q r
	TableName
��r {
==
��| ~
$str�� �
&&��� �
(��� �
x��� �
.��� �
	IsDeleted��� �
==��� �
false��� �
||��� �
x��� �
.��� �
	IsDeleted��� �
==��� �
null��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
var
�� 
allContactId
�� $
=
��% &
entityContacts
��' 5
.
��5 6
Count
��6 ;
>
��< =
$num
��> ?
?
��@ A
entityContacts
��B P
.
��P Q
Select
��Q W
(
��W X
x
��X Y
=>
��Z \
x
��] ^
.
��^ _
Id
��_ a
)
��a b
.
��b c
OrderBy
��c j
(
��j k
Id
��k m
=>
��n p
Id
��q s
)
��s t
.
��t u
ToList
��u {
(
��{ |
)
��| }
:
��~ 
null��� �
;��� �
foreach
�� 
(
�� 
var
��  
contact
��! (
in
��) + 
master_ClientModel
��, >
.
��> ?
Contacts
��? G
)
��G H
{
�� 
if
�� 
(
�� 
contact
�� #
.
��# $
Id
��$ &
>
��' (
$num
��) *
)
��* +
{
�� 
if
�� 
(
��  
allContactId
��  ,
!=
��- /
null
��0 4
&&
��5 7
allContactId
��8 D
.
��D E
Count
��E J
>
��K L
$num
��M N
)
��N O
{
�� 
allContactId
��  ,
.
��, -
Remove
��- 3
(
��3 4
contact
��4 ;
.
��; <
Id
��< >
)
��> ?
;
��? @
}
�� 
var
�� 
	OldEntity
��  )
=
��* + 
_repositoryContact
��, >
.
��> ?
GetNoTracking
��? L
(
��L M
contact
��M T
.
��T U
Id
��U W
)
��W X
;
��X Y

objContact
�� &
=
��' ( 
_repositoryContact
��) ;
.
��; <
Get
��< ?
(
��? @
contact
��@ G
.
��G H
Id
��H J
)
��J K
;
��K L
if
�� 
(
��  

objContact
��  *
!=
��+ -
null
��. 2
)
��2 3
{
�� 
var
��  #
entityAddress
��$ 1
=
��2 3
_mapperFactory
��4 B
.
��B C
Get
��C F
<
��F G 
MasterContactModel
��G Y
,
��Y Z
MasterContact
��[ h
>
��h i
(
��i j
contact
��j q
)
��q r
;
��r s

objContact
��  *
.
��* +
ContactPersonName
��+ <
=
��= >
entityAddress
��? L
.
��L M
ContactPersonName
��M ^
;
��^ _

objContact
��  *
.
��* +
DepartmentId
��+ 7
=
��8 9
entityAddress
��: G
.
��G H
DepartmentId
��H T
;
��T U

objContact
��  *
.
��* +
DesignationId
��+ 8
=
��9 :
entityAddress
��; H
.
��H I
DesignationId
��I V
;
��V W

objContact
��  *
.
��* +
Email
��+ 0
=
��1 2
entityAddress
��3 @
.
��@ A
Email
��A F
;
��F G

objContact
��  *
.
��* +
Mobile
��+ 1
=
��2 3
entityAddress
��4 A
.
��A B
Mobile
��B H
;
��H I

objContact
��  *
.
��* +
	MobileExt
��+ 4
=
��5 6
entityAddress
��7 D
.
��D E
	MobileExt
��E N
;
��N O

objContact
��  *
.
��* +

ModifiedBy
��+ 5
=
��6 7 
master_ClientModel
��8 J
.
��J K

ModifiedBy
��K U
;
��U V 
_repositoryContact
��  2
.
��2 3
UpdateAsync
��3 >
(
��> ?

objContact
��? I
)
��I J
;
��J K
await
��  %
_unitOfWork
��& 1
.
��1 2
SaveChangesAsync
��2 B
(
��B C
)
��C D
;
��D E
await
��  %
_auditLogService
��& 6
.
��6 7
CreateAuditLog
��7 E
<
��E F
MasterContact
��F S
>
��S T
(
��T U!
AuditActionTypeEnum
��U h
.
��h i
Update
��i o
,
��o p
	OldEntity
��q z
,
��z {

objContact��| �
,��� �
MainTableName��� �
,��� �
MainTableKey��� �
)��� �
;��� �
}
�� 
}
�� 
else
�� 
{
�� 

objContact
�� &
=
��' (
_mapperFactory
��) 7
.
��7 8
Get
��8 ;
<
��; < 
MasterContactModel
��< N
,
��N O
MasterContact
��P ]
>
��] ^
(
��^ _
contact
��_ f
)
��f g
;
��g h

objContact
�� &
.
��& '
CreatedDate
��' 2
=
��3 4
AppConstants
��5 A
.
��A B
DateTime
��B J
;
��J K

objContact
�� &
.
��& '

TableKeyId
��' 1
=
��2 3
	objClient
��4 =
.
��= >
Id
��> @
;
��@ A

objContact
�� &
.
��& '
	TableName
��' 0
=
��1 2
Enum
��3 7
.
��7 8
GetName
��8 ?
(
��? @
TableNameEnum
��@ M
.
��M N
Master_Client
��N [
)
��[ \
;
��\ ]

objContact
�� &
.
��& '

ModifiedBy
��' 1
=
��2 3 
master_ClientModel
��4 F
.
��F G
	CreatedBy
��G P
;
��P Q

objContact
�� &
.
��& '
Status
��' -
=
��. /
$num
��0 1
;
��1 2 
_repositoryContact
�� .
.
��. /
AddAsync
��/ 7
(
��7 8

objContact
��8 B
)
��B C
;
��C D
await
�� !
_unitOfWork
��" -
.
��- .
SaveChangesAsync
��. >
(
��> ?
)
��? @
;
��@ A
}
�� 
}
�� 
if
�� 
(
�� 
allContactId
�� $
!=
��% '
null
��( ,
&&
��- /
allContactId
��0 <
.
��< =
Count
��= B
>
��C D
$num
��E F
)
��F G
{
�� 
foreach
�� 
(
��  !
var
��! $
addId
��% *
in
��+ -
allContactId
��. :
)
��: ;
{
�� 
var
�� 
	entityAdd
��  )
=
��* + 
_repositoryContact
��, >
.
��> ?
Get
��? B
(
��B C
x
��C D
=>
��E G
x
��H I
.
��I J
Id
��J L
==
��M O
addId
��P U
)
��U V
;
��V W
if
�� 
(
��  
	entityAdd
��  )
!=
��* ,
null
��- 1
)
��1 2
{
��  
_repositoryContact
��  2
.
��2 3
Remove
��3 9
(
��9 :
	entityAdd
��: C
)
��C D
;
��D E
}
�� 
}
�� 
await
�� 
_unitOfWork
�� )
.
��) *
SaveChangesAsync
��* :
(
��: ;
)
��; <
;
��< =
}
�� 
}
�� 
await
��  
_fileUploadService
�� (
.
��( )
UploadFilesAsync
��) 9
(
��9 :
	objClient
��: C
.
��C D
Id
��D F
,
��F G
Enum
��H L
.
��L M
GetName
��M T
(
��T U
TableNameEnum
��U b
.
��b c
Master_Client
��c p
)
��p q
,
��q r!
master_ClientModel��s �
.��� �
uploadDocument��� �
,��� �
	objClient��� �
.��� �
	CreatedBy��� �
)��� �
;��� �
try
�� 
{
�� 
await
�� 
_unitOfWork
�� %
.
��% &
SaveChangesAsync
��& 6
(
��6 7
)
��7 8
;
��8 9
}
�� 
catch
�� 
(
�� 
	Exception
��  
ex
��! #
)
��# $
{
�� 
throw
�� 
ex
�� 
;
�� 
}
�� 
}
�� 
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
DBOperation
�� %
>
��% &
DeleteClient
��' 3
(
��3 4
int
��4 7
id
��8 :
,
��: ;
int
��< ?
?
��? @
by
��A C
)
��C D
{
�� 	
try
�� 
{
�� 
var
�� 
old
�� 
=
�� 
_repository
�� %
.
��% &
GetNoTracking
��& 3
(
��3 4
id
��4 6
)
��6 7
;
��7 8
DbParameter
�� 
[
�� 
]
�� 
prm
�� !
=
��" #
{
�� 
new
�� 
DbParameter
�� 
(
�� 
$str
�� &
,
��& '
id
��( *
,
��* +
	SqlDbType
��, 5
.
��5 6
Int
��6 9
)
��9 :
,
��: ;
new
�� 
DbParameter
�� 
(
�� 
$str
��  
,
��  !
by
��( *
,
��* +
	SqlDbType
��, 5
.
��5 6
Int
��6 9
)
��9 :
}
�� 	
;
��	 

EltizamDBHelper
�� 
.
��  
ExecuteNonQuery
��  /
(
��/ 0 
ProcedureMetastore
��0 B
.
��B C
usp_Client_Delete
��C T
,
��T U 
DatabaseConnection
��V h
.
��h i

ConnString
��i s
,
��s t
System
��u {
.
��{ |
Data��| �
.��� �
CommandType��� �
.��� �
StoredProcedure��� �
,��� �
prm��� �
)��� �
;��� �
var
�� 
newP
�� 
=
�� 
_repository
�� &
.
��& '
Get2
��' +
(
��+ ,
id
��, .
)
��. /
;
��/ 0
await
�� 
_auditLogService
�� &
.
��& '
CreateAuditLog
��' 5
<
��5 6
MasterClient
��6 B
>
��B C
(
��C D!
AuditActionTypeEnum
��D W
.
��W X
Update
��X ^
,
��^ _
old
��` c
,
��c d
newP
��e i
,
��i j
Enum
��k o
.
��o p
GetName
��p w
(
��w x
TableNameEnum��x �
.��� �
Master_Client��� �
)��� �
,��� �
id��� �
)��� �
;��� �
return
�� 
DBOperation
�� "
.
��" #
Success
��# *
;
��* +
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
throw
�� 
ex
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� 
MasterClientModel
�� 0
>
��0 1
>
��1 20
"GetMasterClientByClientTypeIdAsync
��3 U
(
��U V
int
��V Y
ClientTypeId
��Z f
)
��f g
{
�� 	
var
�� 
_Clients
�� 
=
�� 
new
�� 
List
�� #
<
��# $
MasterClientModel
��$ 5
>
��5 6
(
��6 7
)
��7 8
;
��8 9
var
�� 
res
�� 
=
�� 
_repository
�� !
.
��! "
GetAllAsync
��" -
(
��- .
x
��. /
=>
��0 2
(
��3 4
x
��4 5
.
��5 6
ClientTypeId
��6 B
==
��C E
ClientTypeId
��F R
||
��S U
ClientTypeId
��V b
==
��c e
$num
��f g
)
��g h
&&
��i k
x
��l m
.
��m n
IsActive
��n v
==
��w y
true
��z ~
)
��~ 
.�� �
Result��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
_Clients
�� 
=
�� 
_mapperFactory
�� %
.
��% &
GetList
��& -
<
��- .
MasterClient
��. :
,
��: ;
MasterClientModel
��< M
>
��M N
(
��N O
res
��O R
)
��R S
;
��S T
return
�� 
_Clients
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
DBOperation
�� %
>
��% &
DeleteDocument
��' 5
(
��5 6
int
��6 9
id
��: <
,
��< =
int
��= @
?
��@ A
by
��B D
)
��D E
{
�� 	
if
�� 
(
�� 
id
�� 
>
�� 
$num
�� 
)
�� 
{
�� 
var
�� 
	entityDoc
�� 
=
�� !
_repositoryDocument
��  3
.
��3 4
Get
��4 7
(
��7 8
id
��8 :
)
��: ;
;
��; <
if
�� 
(
�� 
	entityDoc
�� 
!=
��  
null
��! %
)
��% &
{
�� !
_repositoryDocument
�� '
.
��' (
Remove
��( .
(
��. /
	entityDoc
��/ 8
)
��8 9
;
��9 :
await
�� 
_unitOfWork
�� %
.
��% &
SaveChangesAsync
��& 6
(
��6 7
)
��7 8
;
��8 9
}
�� 
}
�� 
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
}
�� 
}�� �G
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
�� 
DBOperation
�� "
.
��" #
Error
��# (
;
��( )
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
DBOperation
�� %
>
��% &
DeleteClientType
��' 7
(
��7 8
int
��8 ;
id
��< >
)
��> ?
{
�� 	
var
�� 
entityClientType
��  
=
��! "
_repository
��# .
.
��. /
Get
��/ 2
(
��2 3
x
��3 4
=>
��5 7
x
��8 9
.
��9 :
Id
��: <
==
��= ?
id
��@ B
)
��B C
;
��C D
if
�� 
(
�� 
entityClientType
��  
==
��! #
null
��$ (
)
��( )
return
�� 
DBOperation
�� "
.
��" #
NotFound
��# +
;
��+ ,
_repository
�� 
.
�� 
Remove
�� 
(
�� 
entityClientType
�� /
)
��/ 0
;
��0 1
await
�� 
_unitOfWork
�� 
.
�� 
SaveChangesAsync
�� .
(
��. /
)
��/ 0
;
��0 1
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� $
Master_ClientTypeModel
�� 5
>
��5 6
>
��6 7
GetClientTypeList
��8 I
(
��I J
)
��J K
{
�� 	
var
�� 
lstStf
�� 
=
�� 
EltizamDBHelper
�� (
.
��( )!
ExecuteMappedReader
��) <
<
��< =$
Master_ClientTypeModel
��= S
>
��S T
(
��T U 
ProcedureMetastore
��U g
.
��g h$
usp_ClientType_AllList
��h ~
,
��~  
DatabaseConnection
�� 
.
��  

ConnString
��  *
,
��* +
CommandType
��, 7
.
��7 8
StoredProcedure
��8 G
,
��G H
null
��I M
)
��M N
;
��N O
return
�� 
lstStf
�� 
;
�� 
}
�� 	
}
�� 
}�� �Y
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
usp_Country_SearchAllList	88w �
,
88� �
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
�� 
lstStf
�� 
=
�� 
EltizamDBHelper
�� (
.
��( )!
ExecuteMappedReader
��) <
<
��< = 
MasterCountryModel
��= O
>
��O P
(
��P Q 
ProcedureMetastore
��Q c
.
��c d!
usp_Country_AllList
��d w
,
��w x 
DatabaseConnection
�� 
.
��  

ConnString
��  *
,
��* +
CommandType
��, 7
.
��7 8
StoredProcedure
��8 G
,
��G H
null
��I M
)
��M N
;
��N O
return
�� 
lstStf
�� 
;
�� 
}
�� 	
}
�� 
}�� �G
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
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� $
MasterDepartmentEntity
�� 5
>
��5 6
>
��6 7
GetDepartmentList
��8 I
(
��I J
)
��J K
{
�� 	
var
�� 
lstStf
�� 
=
�� 
EltizamDBHelper
�� (
.
��( )!
ExecuteMappedReader
��) <
<
��< =$
MasterDepartmentEntity
��= S
>
��S T
(
��T U 
ProcedureMetastore
��U g
.
��g h$
usp_Department_AllList
��h ~
,
��~  
DatabaseConnection
�� 
.
��  

ConnString
��  *
,
��* +
CommandType
��, 7
.
��7 8
StoredProcedure
��8 G
,
��G H
null
��I M
)
��M N
;
��N O
return
�� 
lstStf
�� 
;
�� 
}
�� 	
}
�� 
}�� �H
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
;	LL �
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
�� 
.
�� 
Remove
�� 
(
�� 
entityDesignation
�� 0
)
��0 1
;
��1 2
await
�� 
_unitOfWork
�� 
.
�� 
SaveChangesAsync
�� .
(
��. /
)
��/ 0
;
��0 1
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� %
MasterDesignationEntity
�� 6
>
��6 7
>
��7 8 
GetDesignationList
��9 K
(
��K L
)
��L M
{
�� 	
var
�� 
lstStf
�� 
=
�� 
EltizamDBHelper
�� (
.
��( )!
ExecuteMappedReader
��) <
<
��< =%
MasterDesignationEntity
��= T
>
��T U
(
��U V 
ProcedureMetastore
��V h
.
��h i&
usp_Designation_AllList��i �
,��� � 
DatabaseConnection
�� 
.
��  

ConnString
��  *
,
��* +
CommandType
��, 7
.
��7 8
StoredProcedure
��8 G
,
��G H
null
��I M
)
��M N
;
��N O
return
�� 
lstStf
�� 
;
�� 
}
�� 	
}
�� 
}�� ��
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
IAuditLogService	''s �
auditLogService
''� �
)
''� �
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
StoredProcedure	BBq �
,
BB� �
osqlParameter
BB� �
)
BB� �
;
BB� �
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
MasterDictionaryEntity	FF~ �
>
FF� �
(
FF� �
)
FF� �
)
FF� �
;
FF� �
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
usp_Dictionary_GetById	SSq �
,
SS� �
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
)	bb �
;
bb� �
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
�� %
.
��% &

ModifiedBy
��& 0
=
��1 2
entitydictionary
��3 C
.
��C D

ModifiedBy
��D N
??
��O Q
By
��R T
;
��T U
_repositoryDetail
�� )
.
��) *
UpdateAsync
��* 5
(
��5 6
objDicitonary
��6 C
)
��C D
;
��D E
await
�� 
_unitOfWork
�� )
.
��) *
SaveChangesAsync
��* :
(
��: ;
)
��; <
;
��< =
await
�� 
_auditLogService
�� .
.
��. /
CreateAuditLog
��/ =
<
��= >$
MasterDictionaryDetail
��> T
>
��T U
(
��U V!
AuditActionTypeEnum
��V i
.
��i j
Update
��j p
,
��p q
	OldEntity
��r {
,
��{ |
objDicitonary��} �
,��� �
MainTableName��� �
,��� �
MainTableKey��� �
)��� �
;��� �
}
�� 
}
�� 
else
�� 
{
�� 
objDicitonary
�� !
=
��" #
_mapperFactory
��$ 2
.
��2 3
Get
��3 6
<
��6 7(
MasterDictionaryDetailById
��7 Q
,
��Q R$
MasterDictionaryDetail
��S i
>
��i j
(
��j k
entitydictionary
��k {
)
��{ |
;
��| }
objDicitonary
�� !
.
��! "
Description
��" -
=
��. /
entitydictionary
��0 @
.
��@ A
Description
��A L
;
��L M
objDicitonary
�� !
.
��! "
IsActive
��" *
=
��+ ,
entitydictionary
��- =
.
��= >
IsActive
��> F
;
��F G
objDicitonary
�� !
.
��! "
	CreatedBy
��" +
=
��, -
entitydictionary
��. >
.
��> ?
	CreatedBy
��? H
;
��H I
_repositoryDetail
�� %
.
��% &
AddAsync
��& .
(
��. /
objDicitonary
��/ <
)
��< =
;
��= >
await
�� 
_unitOfWork
�� %
.
��% &
SaveChangesAsync
��& 6
(
��6 7
)
��7 8
;
��8 9
}
�� 
if
�� 
(
�� 
objDicitonary
�� !
.
��! "
Id
��" $
==
��% '
$num
��( )
)
��) *
return
�� 
DBOperation
�� &
.
��& '
Error
��' ,
;
��, -
return
�� 
DBOperation
�� "
.
��" #
Success
��# *
;
��* +
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
throw
�� 
ex
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
DBOperation
�� %
>
��% &
Delete
��' -
(
��- .
int
��. 1
id
��2 4
)
��4 5
{
�� 	
var
�� 
entityDictionary
��  
=
��! "
_repositoryDetail
��# 4
.
��4 5
Get
��5 8
(
��8 9
x
��9 :
=>
��; =
x
��> ?
.
��? @
Id
��@ B
==
��C E
id
��F H
)
��H I
;
��I J
if
�� 
(
�� 
entityDictionary
��  
==
��! #
null
��$ (
)
��( )
return
�� 
DBOperation
�� "
.
��" #
NotFound
��# +
;
��+ ,
_repositoryDetail
�� 
.
�� 
Remove
�� $
(
��$ %
entityDictionary
��% 5
)
��5 6
;
��6 7
await
�� 
_unitOfWork
�� 
.
�� 
SaveChangesAsync
�� .
(
��. /
)
��/ 0
;
��0 1
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
DBOperation
�� %
>
��% &'
MasterDictionaryAddUpdate
��' @
(
��@ A$
MasterDictionaryEntity
��A W
entity
��X ^
)
��^ _
{
�� 	
if
�� 
(
�� 
entity
�� 
!=
�� 
null
�� 
&&
�� !
entity
��" (
.
��( )
Description
��) 4
!=
��5 7
null
��8 <
&&
��= ?
entity
��@ F
.
��F G
Id
��G I
==
��I K
$num
��K L
)
��L M
{
�� 
var
�� 
result
�� 
=
�� +
IsDictionaryDescriptionExists
�� :
(
��: ;
entity
��; A
.
��A B
Description
��B M
)
��M N
;
��N O
if
�� 
(
�� 
result
�� 
)
�� 
{
�� 
return
�� 
DBOperation
�� &
.
��& '
AlreadyExist
��' 3
;
��3 4
}
�� 
}
�� 
MasterDictionary
�� !
objmasterDictionary
�� 0
;
��0 1
string
�� 
MainTableName
��  
=
��! "
Enum
��# '
.
��' (
GetName
��( /
(
��/ 0
TableNameEnum
��0 =
.
��= >
Master_Dictionary
��> O
)
��O P
;
��P Q
int
�� 
MainTableKey
�� 
=
�� 
entity
�� %
.
��% &
Id
��& (
;
��( )
MasterDictionary
�� 
	OldEntity
�� &
=
��' (
null
��) -
;
��- .
if
�� 
(
�� 
entity
�� 
.
�� 
Id
�� 
>
�� 
$num
�� 
)
�� 
{
�� 
	OldEntity
�� 
=
�� 
_repository
�� '
.
��' (
GetNoTracking
��( 5
(
��5 6
entity
��6 <
.
��< =
Id
��= ?
)
��? @
;
��@ A!
objmasterDictionary
�� #
=
��$ %
_repository
��& 1
.
��1 2
Get
��2 5
(
��5 6
entity
��6 <
.
��< =
Id
��= ?
)
��? @
;
��@ A!
objmasterDictionary
�� #
=
��$ %
_repository
��& 1
.
��1 2
Get
��2 5
(
��5 6
entity
��6 <
.
��< =
Id
��= ?
)
��? @
;
��@ A
if
�� 
(
�� !
objmasterDictionary
�� '
!=
��( *
null
��+ /
)
��/ 0
{
�� !
objmasterDictionary
�� '
.
��' (
Description
��( 3
=
��4 5
entity
��6 <
.
��< =
Description
��= H
;
��H I!
objmasterDictionary
�� '
.
��' (
IsActive
��( 0
=
��1 2
Convert
��3 :
.
��: ;
ToInt32
��; B
(
��B C
entity
��C I
.
��I J
IsActive
��J R
)
��R S
;
��S T!
objmasterDictionary
�� '
.
��' (

ModifiedBy
��( 2
=
��3 4
entity
��5 ;
.
��; <
LogInUserId
��< G
;
��G H
_repository
�� 
.
��  
UpdateAsync
��  +
(
��+ ,!
objmasterDictionary
��, ?
)
��? @
;
��@ A
}
�� 
await
�� 
_auditLogService
�� &
.
��& '
CreateAuditLog
��' 5
<
��5 6
MasterDictionary
��6 F
>
��F G
(
��G H!
AuditActionTypeEnum
��H [
.
��[ \
Update
��\ b
,
��b c
	OldEntity
��d m
,
��m n"
objmasterDictionary��o �
,��� �
MainTableName��� �
,��� �
MainTableKey��� �
)��� �
;��� �
await
�� 
_unitOfWork
�� !
.
��! "
SaveChangesAsync
��" 2
(
��2 3
)
��3 4
;
��4 5
}
�� 
else
�� 
{
�� !
objmasterDictionary
�� #
=
��$ %
new
��& )
MasterDictionary
��* :
(
��: ;
)
��; <
{
�� 
IsActive
�� 
=
�� 
Convert
�� &
.
��& '
ToInt32
��' .
(
��. /
entity
��/ 5
.
��5 6
IsActive
��6 >
)
��> ?
,
��? @
Description
�� 
=
��  !
entity
��" (
.
��( )
Description
��) 4
,
��4 5
DictionaryCode
�� "
=
��# $
entity
��% +
.
��+ ,
Description
��, 7
.
��7 8
Replace
��8 ?
(
��? @
$str
��@ C
,
��C D
$str
��E H
)
��H I
.
��I J
ToUpper
��J Q
(
��Q R
)
��R S
,
��S T
	CreatedBy
�� 
=
�� 
entity
��  &
.
��& '
LogInUserId
��' 2
}
�� 
;
�� 
_repository
�� 
.
�� 
AddAsync
�� $
(
��$ %!
objmasterDictionary
��% 8
)
��8 9
;
��9 :
}
�� 
await
�� 
_unitOfWork
�� 
.
�� 
SaveChangesAsync
�� .
(
��. /
)
��/ 0
;
��0 1
if
�� 
(
�� !
objmasterDictionary
�� #
.
��# $
Id
��$ &
==
��' )
$num
��* +
)
��+ ,
return
�� 
DBOperation
�� "
.
��" #
Error
��# (
;
��( )
else
�� 
{
�� 
var
�� 
subTypes
�� 
=
�� 
entity
�� %
.
��% &%
MasterDicitonaryDetails
��& =
;
��= >
var
�� 
_Val
�� 
=
�� 
$str
�� 
;
�� 
if
�� 
(
�� 
subTypes
�� 
!=
�� 
null
��  $
)
��$ %
{
�� 
foreach
�� 
(
�� 
var
��  
_stype
��! '
in
��( *
subTypes
��+ 3
)
��3 4
{
�� 
_Val
�� 
+=
�� 
string
��  &
.
��& '
Format
��' -
(
��- .
$str
��. 8
,
��8 9
_stype
��: @
.
��@ A
Id
��A C
,
��C D
_stype
��E K
.
��K L
Description
��L W
)
��W X
;
��X Y
}
�� 
}
�� 
SqlParameter
�� 
[
�� 
]
�� 
_sqlParameter
�� ,
=
��- .
{
�� 
new
�� 
SqlParameter
�� $
(
��$ %
AppConstants
��% 1
.
��1 2
P_Id
��2 6
,
��6 7!
objmasterDictionary
��D W
.
��W X
Id
��X Z
)
��Z [
,
��[ \
new
�� 
SqlParameter
�� $
(
��$ %
AppConstants
��% 1
.
��1 2
P_CreatedBy
��2 =
,
��= >
entity
��D J
.
��J K
LogInUserId
��K V
)
��V W
,
��W X
new
�� 
SqlParameter
�� $
(
��$ %
AppConstants
��% 1
.
��1 2
P_RequestData
��2 ?
,
��? @
_Val
��D H
)
��H I
}
�� 
;
�� 
await
�� 
_repository
�� !
.
��! "
GetBySP
��" )
(
��) * 
ProcedureMetastore
��* <
.
��< =:
,usp_MasterDictionary_UpsertDictionaryDetails
��= i
,
��i j
CommandType
��k v
.
��v w
StoredProcedure��w �
,��� �
_sqlParameter��� �
)��� �
;��� �
}
�� 
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
private
�� 
bool
�� +
IsDictionaryDescriptionExists
�� 2
(
��2 3
string
��3 9
description
��: E
)
��E F
{
�� 	
return
�� 
_repository
�� 
.
�� 
GetAll
�� %
(
��% &
)
��& '
.
�� 
Any
�� 
(
�� 

dictionary
�� 
=>
��  "

dictionary
��# -
.
��- .
Description
��. 9
==
��: <
description
��= H
)
��H I
;
��I J
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� $
MasterDictionaryEntity
�� 0
>
��0 10
"GetMasterDictionaryDetailByIdAsync
��2 T
(
��T U
int
��U X
id
��Y [
)
��[ \
{
�� 	
var
�� 
_userEntity
�� 
=
�� 
new
�� !$
MasterDictionaryEntity
��" 8
(
��8 9
)
��9 :
;
��: ;
_userEntity
�� 
=
�� 
_mapperFactory
�� (
.
��( )
Get
��) ,
<
��, -
MasterDictionary
��- =
,
��= >$
MasterDictionaryEntity
��? U
>
��U V
(
��V W
await
��W \
_repository
��] h
.
��h i
GetAsync
��i q
(
��q r
id
��r t
)
��t u
)
��u v
;
��v w
return
�� 
_userEntity
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� (
MasterDictionaryDetailById
�� 9
>
��9 :
>
��: ;3
%GetMasterDictionaryDetailSubByIdAsync
��< a
(
��a b
int
��b e
DictionaryId
��f r
)
��r s
{
�� 	
var
�� 
	_SubTypes
�� 
=
�� 
new
�� 
List
��  $
<
��$ %(
MasterDictionaryDetailById
��% ?
>
��? @
(
��@ A
)
��A B
;
��B C
var
�� 
res
�� 
=
�� 
_repositoryDetail
�� '
.
��' (
GetAllAsync
��( 3
(
��3 4
x
��4 5
=>
��6 8
x
��9 :
.
��: ;
DictionaryId
��; G
==
��H J
DictionaryId
��K W
&&
��X Z
x
��[ \
.
��\ ]
IsActive
��] e
==
��f h
$num
��i j
)
��j k
.
��k l
Result
��l r
.
��r s
ToList
��s y
(
��y z
)
��z {
;
��{ |
	_SubTypes
�� 
=
�� 
_mapperFactory
�� &
.
��& '
GetList
��' .
<
��. /$
MasterDictionaryDetail
��/ E
,
��E F(
MasterDictionaryDetailById
��G a
>
��a b
(
��b c
res
��c f
)
��f g
;
��g h
return
�� 
	_SubTypes
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� %
MasterDictionaryDetails
�� 1
>
��1 2.
 GetDictionaryWithSubDetailsAsync
��3 S
(
��S T
int
��T W
?
��W X
DictionaryId
��Y e
,
��e f
string
��g m
?
��m n
Description
��o z
,
��z {
string��| �
?��� �
Code��� �
)��� �
{
�� 	
var
�� 
_header
�� 
=
�� 
new
�� %
MasterDictionaryDetails
�� 5
(
��5 6
)
��6 7
;
��7 8
var
�� 
desc
�� 
=
�� 
await
�� 
_repository
�� (
.
��( )
GetAsync
��) 1
(
��1 2
a
��2 3
=>
��4 6
(
��  
DictionaryId
��  ,
==
��- /
null
��0 4
||
��5 7
a
��8 9
.
��9 :
Id
��: <
==
��= ?
DictionaryId
��@ L
)
��L M
&&
��N P
(
��  
Description
��  +
==
��, .
null
��/ 3
||
��4 6
a
��7 8
.
��8 9
Description
��9 D
==
��E G
Description
��H S
)
��S T
&&
��U W
(
��  
Code
��  $
==
��% '
null
��( ,
||
��- /
a
��0 1
.
��1 2
DictionaryCode
��2 @
==
��A C
Code
��D H
)
��H I
)
��I J
;
��J K
if
�� 
(
�� 
desc
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
_header
�� 
=
�� 
new
�� %
MasterDictionaryDetails
�� 5
(
��5 6
)
��6 7
{
�� 
Description
�� 
=
��  !
desc
��" &
.
��& '
Description
��' 2
,
��2 3
Id
�� 
=
�� 
desc
�� 
.
�� 
Id
��  
,
��  !
IsActive
�� 
=
�� 
desc
�� #
.
��# $
IsActive
��$ ,
}
�� 
;
�� 
var
�� 
	_SubTypes
�� 
=
�� 
_repositoryDetail
��  1
.
��1 2
GetAllAsync
��2 =
(
��= >
x
��> ?
=>
��@ B
x
��C D
.
��D E
DictionaryId
��E Q
==
��R T
_header
��U \
.
��\ ]
Id
��] _
&&
��` b
x
��c d
.
��d e
IsActive
��e m
==
��n p
$num
��q r
)
��r s
.
��s t
Result
��t z
.
��z {
ToList��{ �
(��� �
)��� �
;��� �
_header
�� 
.
�� 
Values
�� 
=
��  
new
��! $
List
��% )
<
��) *)
MasterDictionaryDetailChild
��* E
>
��E F
(
��F G
)
��G H
;
��H I
foreach
�� 
(
�� 
var
�� 
item
�� !
in
��" $
	_SubTypes
��% .
)
��. /
{
�� 
_header
�� 
.
�� 
Values
�� "
.
��" #
Add
��# &
(
��& '
new
��' *)
MasterDictionaryDetailChild
��+ F
(
��F G
)
��G H
{
�� 
Id
�� 
=
�� 
item
�� !
.
��! "
Id
��" $
,
��$ %
IsActive
��  
=
��! "
item
��# '
.
��' (
IsActive
��( 0
,
��0 1
Description
�� #
=
��$ %
item
��& *
.
��* +
Description
��+ 6
}
�� 
)
�� 
;
�� 
}
�� 
;
�� 
}
�� 
return
�� 
_header
�� 
;
�� 
}
�� 	
}
�� 
}�� �|
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
_configuration	""z �
,
""� �
IAuditLogService
""� �
auditLogService
""� �
)
""� �
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
OO� �
)
OO� �
;
OO� �
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
Results	SSz �
.
SS� �
DataTableToList
SS� �
<
SS� �"
MasterLocationEntity
SS� �
>
SS� �
(
SS� �
)
SS� �
)
SS� �
;
SS� �
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
�� 
_auditLogService
�� *
.
��* +
CreateAuditLog
��+ 9
<
��9 :
MasterLocation
��: H
>
��H I
(
��I J!
AuditActionTypeEnum
��J ]
.
��] ^
Update
��^ d
,
��d e
	OldEntity
��f o
,
��o p
objLocation
��q |
,
��| }
MainTableName��~ �
,��� �
MainTableKey��� �
)��� �
;��� �
}
�� 
else
�� 
{
�� 
return
�� 
DBOperation
�� &
.
��& '
NotFound
��' /
;
��/ 0
}
�� 
}
�� 
else
�� 
{
�� 
objLocation
�� 
=
�� 
_mapperFactory
�� ,
.
��, -
Get
��- 0
<
��0 1"
MasterLocationEntity
��1 E
,
��E F
MasterLocation
��G U
>
��U V
(
��V W
entityLocation
��W e
)
��e f
;
��f g
objLocation
�� 
.
�� 
	CountryId
�� %
=
��& '
entityLocation
��( 6
.
��6 7
	CountryId
��7 @
;
��@ A
objLocation
�� 
.
�� 
StateId
�� #
=
��$ %
entityLocation
��& 4
.
��4 5
StateId
��5 <
;
��< =
objLocation
�� 
.
�� 
CityId
�� "
=
��# $
entityLocation
��% 3
.
��3 4
CityId
��4 :
;
��: ;
objLocation
�� 
.
�� 
Sector
�� "
=
��# $
entityLocation
��% 3
.
��3 4
Sector
��4 :
;
��: ;
objLocation
�� 
.
�� 
Latitude
�� $
=
��% &
entityLocation
��' 5
.
��5 6
Latitude
��6 >
;
��> ?
objLocation
�� 
.
�� 
	Longitude
�� %
=
��& '
entityLocation
��( 6
.
��6 7
	Longitude
��7 @
;
��@ A
objLocation
�� 
.
�� 
HomeCurrencyId
�� *
=
��+ ,
entityLocation
��- ;
.
��; <
HomeCurrencyId
��< J
;
��J K
objLocation
�� 
.
�� 
ForeignCurrencyId
�� -
=
��. /
entityLocation
��0 >
.
��> ?
ForeignCurrencyId
��? P
;
��P Q
objLocation
�� 
.
�� 
Status
�� "
=
��# $
entityLocation
��% 3
.
��3 4
Status
��4 :
;
��: ;
objLocation
�� 
.
�� 
	CreatedBy
�� %
=
��& '
entityLocation
��( 6
.
��6 7
	CreatedBy
��7 @
;
��@ A
objLocation
�� 
.
�� 
IsActive
�� $
=
��% &
entityLocation
��' 5
.
��5 6
IsActive
��6 >
;
��> ?
_repository
�� 
.
�� 
AddAsync
�� $
(
��$ %
objLocation
��% 0
)
��0 1
;
��1 2
await
�� 
_unitOfWork
�� !
.
��! "
SaveChangesAsync
��" 2
(
��2 3
)
��3 4
;
��4 5
}
�� 
if
�� 
(
�� 
objLocation
�� 
.
�� 
Id
�� 
==
�� !
$num
��" #
)
��# $
return
�� 
DBOperation
�� "
.
��" #
Error
��# (
;
��( )
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
DBOperation
�� %
>
��% &
Delete
��' -
(
��- .
int
��. 1
id
��2 4
,
��4 5
int
��6 9
?
��9 :
by
��; =
)
��= >
{
�� 	
var
�� 
entityLocation
�� 
=
��  
_repository
��! ,
.
��, -
Get
��- 0
(
��0 1
x
��1 2
=>
��3 5
x
��6 7
.
��7 8
Id
��8 :
==
��; =
id
��> @
)
��@ A
;
��A B
entityLocation
�� 
.
�� 

ModifiedBy
�� %
=
��& '
by
��( *
??
��+ -
entityLocation
��. <
.
��< =

ModifiedBy
��= G
;
��G H
if
�� 
(
�� 
entityLocation
�� 
==
�� !
null
��" &
)
��& '
return
�� 
DBOperation
�� "
.
��" #
NotFound
��# +
;
��+ ,
_repository
�� 
.
�� 
Remove
�� 
(
�� 
entityLocation
�� -
)
��- .
;
��. /
await
�� 
_unitOfWork
�� 
.
�� 
SaveChangesAsync
�� .
(
��. /
)
��/ 0
;
��0 1
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
}
�� 
}�� ̰
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
OrderBy	&&} �
(
&&� �
x
&&� �
=>
&&� �
x
&&� �
.
&&� �
	SortOrder
&&� �
)
&&� �
.
&&� �
ToList
&&� �
(
&&� �
)
&&� �
;
&&� �
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
GetAllAsync	((z �
(
((� �
)
((� �
)
((� �
;
((� �
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
ToList	**} �
(
**� �
)
**� �
;
**� �
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
RoleModulePermission	++x �
.
++� �
SubModuleId
++� �
=
++� �
xx
++� �
.
++� �
SubModuleId
++� �
;
++� �
return
++� �
xx
++� �
;
++� �
}
++� �
)
++� �
.
++� �
ToList
++� �
(
++� �
)
++� �
;
++� �
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
MasterRoleModulePermission	??s �
>
??� �
)
??� �
await
??� �'
_repositoryRolePermission
??� �
.
??� �
FindAllAsync
??� �
(
??� �
xx
??� �
=>
??� �
xx
??� �
.
??� �
RoleId
??� �
==
??� �
roleId
??� �
)
??� �
)
??� �
.
??� �
OrderBy
??� �
(
??� �
x
??� �
=>
??� �
x
??� �
.
??� �
	SortOrder
??� �
)
??� �
.
??� �
ToList
??� �
(
??� �
)
??� �
;
??� �
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
)	BB �
;
BB� �
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
GetAllAsync	DD~ �
(
DD� �
)
DD� �
)
DD� �
;
DD� �
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
SubModuleId	nn{ �
==
nn� �
$num
nn� �
)
nn� �
,
nn� �
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
�� 
return
�� 
MasterModuleData
�� '
;
��' (
}
�� 
else
�� 
{
�� 
return
�� 
await
�� 
GetAll
�� #
(
��# $
)
��$ %
;
��% &
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
IEnumerable
�� %
<
��% &!
RolePermissionModel
��& 9
>
��9 :
>
��: ;+
GetByPermisionRoleUsingRoleId
��< Y
(
��Y Z
int
��Z ]
roleId
��^ d
)
��d e
{
�� 	
var
�� 
menu
�� 
=
�� 
AppConstants
�� #
.
��# $

MenusCache
��$ .
+
��/ 0
roleId
��1 7
.
��7 8
ToString
��8 @
(
��@ A
)
��A B
;
��B C
var
�� 
	cacheData
�� 
=
�� 
_memoryCache
�� (
.
��( )
Get
��) ,
<
��, -
IEnumerable
��- 8
<
��8 9!
RolePermissionModel
��9 L
>
��L M
>
��M N
(
��N O
menu
��O S
)
��S T
;
��T U
if
�� 
(
�� 
	cacheData
�� 
!=
�� 
null
�� !
)
��! "
{
�� 
return
�� 
	cacheData
��  
;
��  !
}
�� 
var
�� 
per
�� 
=
�� 
await
�� '
_repositoryRolePermission
�� 5
.
��5 6
FindAllAsync
��6 B
(
��B C
xx
��C E
=>
��F H
xx
��I K
.
��K L
RoleId
��L R
==
��S U
roleId
��V \
)
��\ ]
;
��] ^
var
�� 
Permissions
�� 
=
�� 
_mapperFactory
�� ,
.
��, -
GetList
��- 4
<
��4 5(
MasterRoleModulePermission
��5 O
,
��O P(
RoleModulePermissionEntity
��Q k
>
��k l
(
��l m
(
��m n
List
��n r
<
��r s)
MasterRoleModulePermission��s �
>��� �
)��� �
per��� �
)��� �
;��� �
if
�� 
(
�� 
Permissions
�� 
.
�� 
Any
�� 
(
��  
)
��  !
)
��! "
{
�� 
var
�� 
MasterModuleData
�� $
=
��% &
_mapperFactory
��' 5
.
��5 6
GetList
��6 =
<
��= >
MasterModule
��> J
,
��J K 
MasterModuleEntity
��L ^
>
��^ _
(
��_ `
await
��` e
_repository
��f q
.
��q r
GetAllAsync
��r }
(
��} ~
)
��~ 
)�� �
;��� �
var
�� !
MasterSubModuleData
�� '
=
��( )
_mapperFactory
��* 8
.
��8 9
GetList
��9 @
<
��@ A
MasterSubModule
��A P
,
��P Q#
MasterSubModuleEntity
��R g
>
��g h
(
��h i
await
��i n
_repositorySub
��o }
.
��} ~
GetAllAsync��~ �
(��� �
)��� �
)��� �
;��� �
var
�� 
menuperm
�� 
=
�� 
(
��  
from
��  $
p
��% &
in
��' )
Permissions
��* 5
join
��  $
m
��% &
in
��' )
MasterModuleData
��* :
on
��; =
p
��> ?
.
��? @
ModuleId
��@ H
equals
��I O
m
��P Q
.
��Q R
ModuleId
��R Z
join
��  $
s
��% &
in
��' )!
MasterSubModuleData
��* =
on
��> @
p
��A B
.
��B C
SubModuleId
��C N
equals
��O U
s
��V W
.
��W X
SubModuleId
��X c
into
��  $
SubMS
��% *
from
��  $
SubM
��% )
in
��* ,
SubMS
��- 2
.
��2 3
DefaultIfEmpty
��3 A
(
��A B
)
��B C
where
��  %
m
��& '
.
��' (
IsActive
��( 0
==
��1 3
true
��4 8
select
��  &
new
��' *!
RolePermissionModel
��+ >
(
��> ?
)
��? @
{
��  !
RoleModuleId
��$ 0
=
��1 2
p
��3 4
.
��4 5
RoleModuleId
��5 A
,
��A B
RoleId
��$ *
=
��+ ,
p
��- .
.
��. /
RoleId
��/ 5
,
��5 6
ModuleId
��$ ,
=
��- .
p
��/ 0
.
��0 1
ModuleId
��1 9
,
��9 :
SubModuleId
��$ /
=
��0 1
p
��2 3
.
��3 4
SubModuleId
��4 ?
,
��? @
Add
��$ '
=
��( )
p
��* +
.
��+ ,
Add
��, /
,
��/ 0
View
��$ (
=
��) *
p
��+ ,
.
��, -
View
��- 1
,
��1 2
Edit
��$ (
=
��) *
p
��+ ,
.
��, -
Edit
��- 1
,
��1 2
Delete
��$ *
=
��+ ,
p
��- .
.
��. /
Delete
��/ 5
,
��5 6
Approve
��$ +
=
��, -
p
��. /
.
��/ 0
Approve
��0 7
,
��7 8
ControlName
��$ /
=
��0 1
m
��2 3
.
��3 4
ControlName
��4 ?
,
��? @

ModuleName
��$ .
=
��/ 0
m
��1 2
.
��2 3

ModuleName
��3 =
,
��= >
Icon
��$ (
=
��) *
m
��+ ,
.
��, -
Icon
��- 1
,
��1 2
	HoverIcon
��$ -
=
��. /
m
��0 1
.
��1 2
	HoverIcon
��2 ;
,
��; <
ViewName
��$ ,
=
��- .
m
��/ 0
.
��0 1
ViewName
��1 9
,
��9 :
Sort
��$ (
=
��) *
m
��+ ,
.
��, -
	SortOrder
��- 6
}
��  !
)
��! "
.
��" #
ToList
��# )
(
��) *
)
��* +
;
��+ ,
var
�� 
expirationTime
�� "
=
��# $
DateTimeOffset
��% 3
.
��3 4
Now
��4 7
.
��7 8

AddMinutes
��8 B
(
��B C
$num
��C G
)
��G H
;
��H I
_memoryCache
�� 
.
�� 
Set
��  
(
��  !
menu
��! %
,
��% &
menuperm
��' /
,
��/ 0
expirationTime
��1 ?
)
��? @
;
��@ A
return
�� 
menuperm
�� 
;
��  
}
�� 
else
�� 
{
�� 
return
�� 
null
�� 
;
�� 
}
�� 
}
�� 	
}
�� 
}�� ��
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
IMemoryCache	} �
memoryCache
� �
)
� �
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
Replace	66} �
(
66� �
$str
66� �
,
66� �
request
66� �
.
66� �
Property
66� �
)
66� �
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
Replace	77} �
(
77� �
$str
77� �
,
77� �
request
77� �
.
77� �
ValId
77� �
.
77� �
ToString
77� �
(
77� �
)
77� �
)
77� �
;
77� �
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
StartTls	KK| �
)
KK� �
;
KK� �
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
�� 
else
�� 
message
�� 
.
�� 
To
�� 
.
�� 
Add
�� "
(
��" #
MailboxAddress
��# 1
.
��1 2
Parse
��2 7
(
��7 8
Em
��8 :
)
��: ;
)
��; <
;
��< =
message
�� 
.
�� 
Subject
�� 
=
��  !
_configuration
��" 0
.
��0 1

GetSection
��1 ;
(
��; <
$str
��< Q
)
��Q R
.
��R S
Value
��S X
+
��Y Z
$str
��[ ^
+
��_ `
request
��a h
.
��h i
Subject
��i p
;
��p q
message
�� 
.
�� 
Body
�� 
=
�� 
new
�� "
TextPart
��# +
(
��+ ,

TextFormat
��, 6
.
��6 7
Html
��7 ;
)
��; <
{
��= >
Text
��? C
=
��D E
request
��F M
.
��M N
Body
��N R
}
��S T
;
��T U
using
�� 
var
�� 
smtp
�� 
=
��  
new
��! $

SmtpClient
��% /
(
��/ 0
)
��0 1
;
��1 2
smtp
�� 
.
�� 
Connect
�� 
(
�� 
_configuration
�� +
.
��+ ,

GetSection
��, 6
(
��6 7
$str
��7 I
)
��I J
.
��J K
Value
��K P
,
��P Q
$num
��R U
,
��U V
MailKit
��W ^
.
��^ _
Security
��_ g
.
��g h!
SecureSocketOptions
��h {
.
��{ |
StartTls��| �
)��� �
;��� �
smtp
�� 
.
�� 
Authenticate
�� !
(
��! "
_configuration
��" 0
.
��0 1

GetSection
��1 ;
(
��; <
$str
��< R
)
��R S
.
��S T
Value
��T Y
,
��Y Z
_configuration
�� "
.
��" #

GetSection
��# -
(
��- .
$str
��. D
)
��D E
.
��E F
Value
��F K
)
��K L
;
��L M
smtp
�� 
.
�� 
Send
�� 
(
�� 
message
�� !
)
��! "
;
��" #
smtp
�� 
.
�� 

Disconnect
�� 
(
��  
true
��  $
)
��$ %
;
��% &
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
}
�� 
finally
�� 
{
�� 
_memoryCache
�� 
.
�� 
Remove
�� #
(
��# $
AppConstants
��$ 0
.
��0 1 
NotificationsCache
��1 C
)
��C D
;
��D E
}
�� 
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
public
�� #
SendNotificationModel
�� $*
GetValuationNotificationData
��% A
(
��A B!
RecepientActionEnum
��B U
subjectEnum
��V a
,
��a b
int
��c f!
valiadtionRequestId
��g z
)
��z {
{
�� 	
DbParameter
�� 
[
�� 
]
�� 
osqlParameter
�� '
=
��( )
{
�� 
new
�� 
DbParameter
�� 
(
��  
$str
��  (
,
��( )
subjectEnum
��* 5
,
��5 6
	SqlDbType
��7 @
.
��@ A
Int
��A D
)
��D E
,
��E F
new
�� 
DbParameter
�� 
(
��  
$str
��  '
,
��' (!
valiadtionRequestId
��* =
,
��= >
	SqlDbType
��? H
.
��H I
Int
��I L
)
��L M
,
��M N
}
�� 
;
�� 
var
�� 
result
�� 
=
�� 
EltizamDBHelper
�� (
.
��( )!
ExecuteMappedReader
��) <
<
��< =#
SendNotificationModel
��= R
>
��R S
(
��S T 
ProcedureMetastore
��T f
.
��f g7
(usp_ValuationRequest_GetNotificationData��g �
,��� � 
DatabaseConnection
�� +
.
��+ ,

ConnString
��, 6
,
��6 7
System
��8 >
.
��> ?
Data
��? C
.
��C D
CommandType
��D O
.
��O P
StoredProcedure
��P _
,
��_ `
osqlParameter
��a n
)
��n o
.
��o p
FirstOrDefault
��p ~
(
��~ 
)�� �
;��� �
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� 
List
�� 
<
�� '
MasterNotificationEntitty
�� -
>
��- .
GetAll
��/ 5
(
��5 6
int
��6 9
userId
��: @
,
��@ A
int
��B E
?
��E F
valId
��G L
,
��L M
int
��N Q
?
��Q R
pagenum
��S Z
)
��Z [
{
�� 	
int
�� 
count
�� 
=
�� 
$num
�� 
;
�� 
var
�� 
finalResult
�� 
=
�� '
InitiateNotificationCache
�� 7
(
��7 8
userId
��8 >
,
��> ?
valId
��@ E
,
��E F
pagenum
��G N
,
��N O
out
��P S
count
��T Y
)
��Y Z
;
��Z [
return
�� 
finalResult
�� 
;
�� 
}
�� 	
public
�� 
int
�� 
GetAllCount
�� 
(
�� 
int
�� "
userId
��# )
,
��) *
int
��+ .
?
��. /
valId
��0 5
)
��5 6
{
�� 	
int
�� 
count
�� 
=
�� 
$num
�� 
;
�� '
InitiateNotificationCache
�� %
(
��% &
userId
��& ,
,
��, -
valId
��. 3
,
��3 4
null
��5 9
,
��9 :
out
��; >
count
��? D
)
��D E
;
��E F
return
�� 
count
�� 
;
�� 
}
�� 	
public
�� 
List
�� 
<
�� '
MasterNotificationEntitty
�� -
>
��- .'
InitiateNotificationCache
��/ H
(
��H I
int
��I L
userId
��M S
,
��S T
int
��U X
?
��X Y
valId
��Z _
,
��_ `
int
��a d
?
��d e
pagenum
��f m
,
��m n
out
��o r
int
��s v
count
��w |
)
��| }
{
�� 	
var
�� 
finalResult
�� 
=
�� 
new
�� !
List
��" &
<
��& ''
MasterNotificationEntitty
��' @
>
��@ A
(
��A B
)
��B C
;
��C D
bool
�� 
IsCount
�� 
=
�� 
pagenum
�� "
==
��# %
null
��& *
;
��* +
DbParameter
�� 
[
�� 
]
�� 
prm
�� 
=
�� 
{
�� 
new
�� 
DbParameter
�� 
(
��  
AppConstants
��  ,
.
��, -
LogInUserId
��- 8
,
��8 9
userId
��: @
,
��@ A
	SqlDbType
��B K
.
��K L
Int
��L O
)
��O P
,
��P Q
new
�� 
DbParameter
�� 
(
��  
$str
��  *
,
��* +
valId
��: ?
,
��? @
	SqlDbType
��B K
.
��K L
Int
��L O
)
��O P
,
��P Q
new
�� 
DbParameter
�� 
(
��  
$str
��  )
,
��) *
IsCount
��: A
,
��A B
	SqlDbType
��C L
.
��L M
Bit
��M P
)
��P Q
,
��Q R
new
�� 
DbParameter
�� 
(
��  
$str
��  )
,
��) *
pagenum
��: A
,
��A B
	SqlDbType
��C L
.
��L M
Int
��M P
)
��P Q
}
�� 
;
�� 
if
�� 
(
�� 
IsCount
�� 
==
�� 
true
�� 
)
��  
{
�� 
var
�� 
cnt
�� 
=
�� 
EltizamDBHelper
�� )
.
��) *!
ExecuteMappedReader
��* =
<
��= >
NotificationCount
��> O
>
��O P
(
��P Q 
ProcedureMetastore
��Q c
.
��c d-
usp_MasterNotification_AllList��d �
,��� � 
DatabaseConnection
��" 4
.
��4 5

ConnString
��5 ?
,
��? @
CommandType
��A L
.
��L M
StoredProcedure
��M \
,
��\ ]
prm
��^ a
)
��a b
;
��b c
count
�� 
=
�� 
cnt
�� 
[
�� 
$num
�� 
]
�� 
.
�� 
TotalRecords
�� +
;
��+ ,
return
�� 
finalResult
�� "
;
��" #
}
�� 
else
�� 
{
�� 
finalResult
�� 
=
�� 
EltizamDBHelper
�� -
.
��- .!
ExecuteMappedReader
��. A
<
��A B'
MasterNotificationEntitty
��B [
>
��[ \
(
��\ ] 
ProcedureMetastore
��] o
.
��o p-
usp_MasterNotification_AllList��p �
,��� � 
DatabaseConnection
�� 0
.
��0 1

ConnString
��1 ;
,
��; <
CommandType
��= H
.
��H I
StoredProcedure
��I X
,
��X Y
prm
��Z ]
)
��] ^
;
��^ _
count
�� 
=
�� 
finalResult
�� #
.
��# $
Count
��$ )
;
��) *
return
�� 
finalResult
�� "
;
��" #
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
DBOperation
�� %
>
��% & 
UpdateNotification
��' 9
(
��9 :
int
��: =
notificationid
��> L
,
��L M
int
��N Q
readBy
��R X
)
��X Y
{
�� 	
var
�� 
tobeupdateddata
�� 
=
��  !
_repository
��" -
.
��- .
Get
��. 1
(
��1 2
notificationid
��2 @
)
��@ A
;
��A B
if
�� 
(
�� 
tobeupdateddata
�� 
!=
��  "
null
��# '
)
��' (
{
�� 
tobeupdateddata
�� 
.
��  
ReadBy
��  &
=
��' (
readBy
��) /
;
��/ 0
tobeupdateddata
�� 
.
��  
ReadDate
��  (
=
��) *
DateTime
��+ 3
.
��3 4
Now
��4 7
.
��7 8
Date
��8 <
;
��< =
_repository
�� 
.
�� 
UpdateAsync
�� '
(
��' (
tobeupdateddata
��( 7
)
��7 8
;
��8 9
await
�� 
_unitOfWork
�� !
.
��! "
SaveChangesAsync
��" 2
(
��2 3
)
��3 4
;
��4 5
}
�� 
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
public
�� 
async
�� 
void
�� *
UpdateValuationRequestStatus
�� 6
(
��6 7
int
��7 :
newStatusId
��; F
,
��F G
int
��H K
id
��L N
)
��N O
{
�� 	
try
�� 
{
�� 
ValuationRequest
��  
result
��! '
=
��( )
null
��* .
;
��. /
if
�� 
(
�� 
newStatusId
�� 
>
��  !
$num
��" #
)
��# $
{
�� 
result
�� 
=
�� "
_valuationrepository
�� 1
.
��1 2
Get
��2 5
(
��5 6
id
��6 8
)
��8 9
;
��9 :
result
�� 
.
�� 
StatusId
�� #
=
��$ %
newStatusId
��& 1
;
��1 2"
_valuationrepository
�� (
.
��( )
UpdateAsync
��) 4
(
��4 5
result
��5 ;
)
��; <
;
��< =
await
�� 
_unitOfWork
�� %
.
��% &
SaveChangesAsync
��& 6
(
��6 7
)
��7 8
;
��8 9
await
�� !
SenddDetailsToEmail
�� -
(
��- .!
RecepientActionEnum
��. A
.
��A B$
ValuationStatusChanged
��B X
,
��X Y
id
��Z \
)
��\ ]
;
��] ^
}
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
throw
�� 
ex
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� !
SenddDetailsToEmail
��  3
(
��3 4!
RecepientActionEnum
��4 G
subjectEnum
��H S
,
��S T
int
��U X 
valuationrequestId
��Y k
)
��k l
{
�� 	
try
�� 
{
�� 
var
�� 
notificationModel
�� %
=
��& '*
GetValuationNotificationData
��( D
(
��D E
subjectEnum
��E P
,
��P Q 
valuationrequestId
��R d
)
��d e
;
��e f
string
�� 
strHtml
�� 
=
��  
File
��! %
.
��% &
ReadAllText
��& 1
(
��1 2
$str
��2 u
)
��u v
;
��v w
if
�� 
(
�� 
subjectEnum
�� 
==
��  "!
RecepientActionEnum
��# 6
.
��6 7
ValuationCreated
��7 G
)
��G H
{
�� 
strHtml
�� 
=
�� 
File
�� "
.
��" #
ReadAllText
��# .
(
��. /
$str
��/ m
)
��m n
;
��n o
}
�� 
strHtml
�� 
=
�� 
strHtml
�� !
.
��! "
Replace
��" )
(
��) *
$str
��* 8
,
��8 9
notificationModel
��: K
.
��K L
ValRefNo
��L T
)
��T U
;
��U V
strHtml
�� 
=
�� 
strHtml
�� !
.
��! "
Replace
��" )
(
��) *
$str
��* 4
,
��4 5
DateTime
��6 >
.
��> ?
Now
��? B
.
��B C
ToString
��C K
(
��K L
$str
��L Y
)
��Y Z
)
��Z [
;
��[ \
strHtml
�� 
=
�� 
strHtml
�� !
.
��! "
Replace
��" )
(
��) *
$str
��* 9
,
��9 :
notificationModel
��; L
.
��L M
Status
��M S
)
��S T
;
��T U
notificationModel
�� !
.
��! "
Subject
��" )
=
��* +

EnumHelper
��, 6
.
��6 7
GetDescription
��7 E
(
��E F
subjectEnum
��F Q
)
��Q R
;
��R S
notificationModel
�� !
.
��! "
Body
��" &
=
��' (
strHtml
��) 0
;
��0 1
await
�� 
	SendEmail
�� 
(
��  
notificationModel
��  1
)
��1 2
;
��2 3
return
�� 
true
�� 
;
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
)
�� 
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
}
�� 	
}
�� 
}�� �V
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
usp_OwnershipType_SearchAllList	99~ �
,
99� �
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
GetAsync	KKx �
(
KK� �
id
KK� �
)
KK� �
)
KK� �
;
KK� �
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
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
}
�� 
}�� ��
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
usp_Property_Amenity_GetById	aaq �
,
aa� � 
DatabaseConnection
aa� �
.
aa� �

ConnString
aa� �
,
aa� �
System
aa� �
.
aa� �
Data
aa� �
.
aa� �
CommandType
aa� �
.
aa� �
StoredProcedure
aa� �
,
aa� �
osqlParameter
aa� �
)
aa� �
;
aa� �
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
usp_Property_Location_GetById	ll} �
,
ll� � 
DatabaseConnection
ll� �
.
ll� �

ConnString
ll� �
,
ll� �
System
ll� �
.
ll� �
Data
ll� �
.
ll� �
CommandType
ll� �
.
ll� �
StoredProcedure
ll� �
,
ll� �
osqlParameter1
ll� �
)
ll� �
;
ll� �
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
�� 
SqlParameter
��  
(
��  !
AppConstants
��! -
.
��- .

P_PageSize
��. 8
,
��8 9
model
��D I
.
��I J
length
��J P
)
��P Q
,
��Q R
new
�� 
SqlParameter
��  
(
��  !
AppConstants
��! -
.
��- .
P_SortColumn
��. :
,
��: ;

ColumnName
��D N
)
��N O
,
��O P
new
�� 
SqlParameter
��  
(
��  !
AppConstants
��! -
.
��- .
P_SortDirection
��. =
,
��= >
SortDir
��D K
)
��K L
,
��L M
new
�� 
SqlParameter
��  
(
��  !
AppConstants
��! -
.
��- .
P_SearchText
��. :
,
��: ;
model
��D I
.
��I J
search
��J P
?
��P Q
.
��Q R
value
��R W
)
��W X
}
�� 
;
�� 
var
�� 
Results
�� 
=
�� 
await
�� 
_repository
��  +
.
��+ ,
GetBySP
��, 3
(
��3 4 
ProcedureMetastore
��4 F
.
��F G(
usp_Property_SearchAllList
��G a
,
��a b
System
��c i
.
��i j
Data
��j n
.
��n o
CommandType
��o z
.
��z {
StoredProcedure��{ �
,��� �
osqlParameter��� �
)��� �
;��� �
var
�� 
res
�� 
=
�� 
UtilityHelper
�� #
.
��# $
GetPaginationInfo
��$ 5
(
��5 6
Results
��6 =
)
��= >
;
��> ?$
DataTableResponseModel
�� "%
oDataTableResponseModel
��# :
=
��; <
new
��= @$
DataTableResponseModel
��A W
(
��W X
model
��X ]
.
��] ^
draw
��^ b
,
��b c
res
��d g
.
��g h
Item1
��h m
,
��m n
res
��o r
.
��r s
Item1
��s x
,
��x y
Results��z �
.��� �
DataTableToList��� �
<��� �'
MasterPropertyListModel��� �
>��� �
(��� �
)��� �
)��� �
;��� �
return
�� %
oDataTableResponseModel
�� *
;
��* +
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� $
MasterAmenityListModel
�� 5
>
��5 6
>
��6 7$
GetPropertyAmenityList
��8 N
(
��N O
)
��O P
{
�� 	
DbParameter
�� 
[
�� 
]
�� 
osqlParameter
�� '
=
��( )
{
�� 
new
�� 
DbParameter
�� 
(
��  
$str
��  ,
,
��, -
$num
��. /
,
��/ 0
	SqlDbType
��1 :
.
��: ;
Int
��; >
)
��> ?
,
��? @
}
�� 
;
�� 
var
�� 
amenityList
�� 
=
�� 
EltizamDBHelper
�� -
.
��- .!
ExecuteMappedReader
��. A
<
��A B$
MasterAmenityListModel
��B X
>
��X Y
(
��Y Z 
ProcedureMetastore
��Z l
.
��l m+
usp_Property_Amenity_GetById��m �
,��� �"
DatabaseConnection��� �
.��� �

ConnString��� �
,��� �
System��� �
.��� �
Data��� �
.��� �
CommandType��� �
.��� �
StoredProcedure��� �
,��� �
osqlParameter��� �
)��� �
;��� �
return
�� 
amenityList
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
DBOperation
�� %
>
��% &%
AddUpdateMasterProperty
��' >
(
��> ?!
MasterPropertyModel
��? R
masterproperty
��S a
)
��a b
{
�� 	
MasterProperty
�� 
objProperty
�� &
;
��& '$
MasterPropertyLocation
�� "
objLocation
��# .
;
��. /#
MasterPropertyAmenity
�� !

objAmenity
��" ,
;
��, -
string
�� 
MainTableName
��  
=
��! "
Enum
��# '
.
��' (
GetName
��( /
(
��/ 0
TableNameEnum
��0 =
.
��= >
Master_Property
��> M
)
��M N
;
��N O
int
�� 
MainTableKey
�� 
=
�� 
masterproperty
�� -
.
��- .
Id
��. 0
;
��0 1
if
�� 
(
�� 
masterproperty
�� 
.
�� 
Id
�� !
>
��" #
$num
��$ %
)
��% &
{
�� 
MasterProperty
�� 
	OldEntity
�� (
=
��) *
null
��+ /
;
��/ 0
	OldEntity
�� 
=
�� 
_repository
�� '
.
��' (
GetNoTracking
��( 5
(
��5 6
masterproperty
��6 D
.
��D E
Id
��E G
)
��G H
;
��H I
objProperty
�� 
=
�� 
_repository
�� )
.
��) *
Get
��* -
(
��- .
masterproperty
��. <
.
��< =
Id
��= ?
)
��? @
;
��@ A
if
�� 
(
�� 
objProperty
�� 
!=
��  "
null
��# '
)
��' (
{
�� 
objProperty
�� 
.
��  
PropertyName
��  ,
=
��- .
masterproperty
��/ =
.
��= >
PropertyName
��> J
;
��J K
objProperty
�� 
.
��  
PropertyTypeId
��  .
=
��/ 0
masterproperty
��1 ?
.
��? @
PropertyTypeId
��@ N
;
��N O
objProperty
�� 
.
��  
PropertySubTypeId
��  1
=
��2 3
masterproperty
��4 B
.
��B C
PropertySubTypeId
��C T
;
��T U
objProperty
�� 
.
��  
OwnershipTypeId
��  /
=
��0 1
masterproperty
��2 @
.
��@ A
OwnershipTypeId
��A P
;
��P Q
objProperty
�� 
.
��  

UnitTypeId
��  *
=
��+ ,
masterproperty
��- ;
.
��; <

UnitTypeId
��< F
;
��F G
objProperty
�� 
.
��  
AdditionalUnits
��  /
=
��0 1
masterproperty
��2 @
.
��@ A
AdditionalUnits
��A P
;
��P Q
objProperty
�� 
.
��  
FurnishedId
��  +
=
��, -
masterproperty
��. <
.
��< =
FurnishedId
��= H
;
��H I
objProperty
�� 
.
��  
ValuationPurpose
��  0
=
��1 2
masterproperty
��3 A
.
��A B
ValuationPurpose
��B R
;
��R S
objProperty
�� 
.
��  
BuildUpAreaSqFt
��  /
=
��0 1
masterproperty
��2 @
.
��@ A
BuildUpAreaSqFt
��A P
;
��P Q
objProperty
�� 
.
��  
BuildUpAreaSqMtr
��  0
=
��1 2
masterproperty
��3 A
.
��A B
BuildUpAreaSqMtr
��B R
;
��R S
objProperty
�� 
.
��  
AgeOfConstruction
��  1
=
��2 3
masterproperty
��4 B
.
��B C
AgeOfConstruction
��C T
;
��T U
objProperty
�� 
.
��  
IsActive
��  (
=
��) *
masterproperty
��+ 9
.
��9 :
IsActive
��: B
;
��B C
objProperty
�� 
.
��  
Parking
��  '
=
��( )
masterproperty
��* 8
.
��8 9
Parking
��9 @
;
��@ A
objProperty
�� 
.
��  
ParkingBayNo
��  ,
=
��- .
masterproperty
��/ =
.
��= >
ParkingBayNo
��> J
;
��J K
objProperty
�� 
.
��  
Description
��  +
=
��, -
masterproperty
��. <
.
��< =
Description
��= H
;
��H I
objProperty
�� 
.
��  

UnitNumber
��  *
=
��+ ,
masterproperty
��- ;
.
��; <

UnitNumber
��< F
;
��F G
objProperty
�� 
.
��  

ModifiedBy
��  *
=
��+ ,
masterproperty
��- ;
.
��; <

ModifiedBy
��< F
;
��F G
_repository
�� 
.
��  
UpdateAsync
��  +
(
��+ ,
objProperty
��, 7
)
��7 8
;
��8 9
await
�� 
_unitOfWork
�� %
.
��% &
SaveChangesAsync
��& 6
(
��6 7
)
��7 8
;
��8 9
await
�� 
_auditLogService
�� *
.
��* +
CreateAuditLog
��+ 9
<
��9 :
MasterProperty
��: H
>
��H I
(
��I J!
AuditActionTypeEnum
��J ]
.
��] ^
Update
��^ d
,
��d e
	OldEntity
��f o
,
��o p
objProperty
��q |
,
��| }
MainTableName��~ �
,��� �
MainTableKey��� �
)��� �
;��� �
}
�� 
else
�� 
return
�� 
DBOperation
�� &
.
��& '
NotFound
��' /
;
��/ 0
}
�� 
else
�� 
{
�� 
objProperty
�� 
=
�� 
_mapperFactory
�� ,
.
��, -
Get
��- 0
<
��0 1!
MasterPropertyModel
��1 D
,
��D E
MasterProperty
��F T
>
��T U
(
��U V
masterproperty
��V d
)
��d e
;
��e f
objProperty
�� 
.
�� 
IsActive
�� $
=
��% &
masterproperty
��' 5
.
��5 6
IsActive
��6 >
;
��> ?
objProperty
�� 
.
�� 
	CreatedBy
�� %
=
��& '
masterproperty
��( 6
.
��6 7
	CreatedBy
��7 @
;
��@ A
_repository
�� 
.
�� 
AddAsync
�� $
(
��$ %
objProperty
��% 0
)
��0 1
;
��1 2
await
�� 
_unitOfWork
�� !
.
��! "
SaveChangesAsync
��" 2
(
��2 3
)
��3 4
;
��4 5
}
�� 
if
�� 
(
�� 
objProperty
�� 
.
�� 
Id
�� 
==
�� !
$num
��" #
)
��# $
return
�� 
DBOperation
�� "
.
��" #
Error
��# (
;
��( )
else
�� 
{
�� 
if
�� 
(
�� 
masterproperty
�� "
.
��" #
PropertyDetail
��# 1
!=
��2 4
null
��5 9
)
��9 :
{
�� 
if
�� 
(
�� 
masterproperty
�� &
.
��& '
PropertyDetail
��' 5
.
��5 6
Id
��6 8
>
��9 :
$num
��; <
)
��< =
{
�� 
var
�� 
	OldEntity
�� %
=
��& '
_detailrepository
��( 9
.
��9 :
GetNoTracking
��: G
(
��G H
masterproperty
��H V
.
��V W
PropertyDetail
��W e
.
��e f
Id
��f h
)
��h i
;
��i j
objLocation
�� #
=
��$ %
_detailrepository
��& 7
.
��7 8
Get
��8 ;
(
��; <
masterproperty
��< J
.
��J K
PropertyDetail
��K Y
.
��Y Z
Id
��Z \
)
��\ ]
;
��] ^
if
�� 
(
�� 
objLocation
�� '
!=
��( *
null
��+ /
)
��/ 0
{
�� 
var
�� 
entityLocation
��  .
=
��/ 0
_mapperFactory
��1 ?
.
��? @
Get
��@ C
<
��C D'
MasterPropertyDetailModel
��D ]
,
��] ^$
MasterPropertyLocation
��_ u
>
��u v
(
��v w
masterproperty��w �
.��� �
PropertyDetail��� �
)��� �
;��� �
objLocation
�� '
.
��' (
	CountryId
��( 1
=
��2 3
entityLocation
��4 B
.
��B C
	CountryId
��C L
;
��L M
objLocation
�� '
.
��' (
StateId
��( /
=
��0 1
entityLocation
��2 @
.
��@ A
StateId
��A H
;
��H I
objLocation
�� '
.
��' (
CityId
��( .
=
��/ 0
entityLocation
��1 ?
.
��? @
CityId
��@ F
;
��F G
objLocation
�� '
.
��' (
Zone
��( ,
=
��- .
entityLocation
��/ =
.
��= >
Zone
��> B
;
��B C
objLocation
�� '
.
��' (
BuildingProject
��( 7
=
��8 9
entityLocation
��: H
.
��H I
BuildingProject
��I X
;
��X Y
objLocation
�� '
.
��' (
Latitude
��( 0
=
��1 2
entityLocation
��3 A
.
��A B
Latitude
��B J
;
��J K
objLocation
�� '
.
��' (
	Longitude
��( 1
=
��2 3
entityLocation
��4 B
.
��B C
	Longitude
��C L
;
��L M
objLocation
�� '
.
��' (
Address1
��( 0
=
��1 2
entityLocation
��3 A
.
��A B
Address1
��B J
;
��J K
objLocation
�� '
.
��' (
Address2
��( 0
=
��1 2
entityLocation
��3 A
.
��A B
Address2
��B J
;
��J K
objLocation
�� '
.
��' (
Pincode
��( /
=
��0 1
entityLocation
��2 @
.
��@ A
Pincode
��A H
;
��H I
objLocation
�� '
.
��' (
Landmark
��( 0
=
��1 2
entityLocation
��3 A
.
��A B
Landmark
��B J
;
��J K
objLocation
�� '
.
��' (

ModifiedBy
��( 2
=
��3 4
entityLocation
��5 C
.
��C D

ModifiedBy
��D N
;
��N O
objLocation
�� '
.
��' (
ModifiedDate
��( 4
=
��5 6
AppConstants
��7 C
.
��C D
DateTime
��D L
;
��L M
_detailrepository
�� -
.
��- .
UpdateAsync
��. 9
(
��9 :
objLocation
��: E
)
��E F
;
��F G
await
�� !
_unitOfWork
��" -
.
��- .
SaveChangesAsync
��. >
(
��> ?
)
��? @
;
��@ A
}
�� 
}
�� 
else
�� 
{
�� 
objLocation
�� #
=
��$ %
_mapperFactory
��& 4
.
��4 5
Get
��5 8
<
��8 9'
MasterPropertyDetailModel
��9 R
,
��R S$
MasterPropertyLocation
��T j
>
��j k
(
��k l
masterproperty
��l z
.
��z {
PropertyDetail��{ �
)��� �
;��� �
objLocation
�� #
.
��# $

PropertyId
��$ .
=
��/ 0
objProperty
��1 <
.
��< =
Id
��= ?
;
��? @
objLocation
�� #
.
��# $
	CreatedBy
��$ -
=
��. /
objProperty
��0 ;
.
��; <
	CreatedBy
��< E
;
��E F
objLocation
�� #
.
��# $
CreatedDate
��$ /
=
��0 1
AppConstants
��2 >
.
��> ?
DateTime
��? G
;
��G H
_detailrepository
�� )
.
��) *
AddAsync
��* 2
(
��2 3
objLocation
��3 >
)
��> ?
;
��? @
}
�� 
await
�� 
_unitOfWork
�� %
.
��% &
SaveChangesAsync
��& 6
(
��6 7
)
��7 8
;
��8 9
}
�� 
if
�� 
(
�� 
masterproperty
�� "
.
��" #
AmenityList
��# .
!=
��/ 1
null
��2 6
&&
��7 9
masterproperty
��: H
.
��H I
AmenityList
��I T
.
��T U
Count
��U Z
>
��[ \
$num
��] ^
)
��^ _
{
�� 
foreach
�� 
(
�� 
var
��  
doc
��! $
in
��% '
masterproperty
��( 6
.
��6 7
AmenityList
��7 B
)
��B C
{
�� 
if
�� 
(
�� 
doc
�� 
.
��  
Id
��  "
>
��# $
$num
��% &
)
��& '
{
�� 

objAmenity
�� &
=
��' ( 
_amenityrepository
��) ;
.
��; <
Get
��< ?
(
��? @
doc
��@ C
.
��C D
Id
��D F
)
��F G
;
��G H
if
�� 
(
��  

objAmenity
��  *
!=
��+ -
null
��. 2
)
��2 3
{
�� 

objAmenity
��  *
=
��+ ,
_mapperFactory
��- ;
.
��; <
Get
��< ?
<
��? @$
MasterAmenityListModel
��@ V
,
��V W#
MasterPropertyAmenity
��X m
>
��m n
(
��n o
doc
��o r
)
��r s
;
��s t

objAmenity
��  *
.
��* +

PropertyId
��+ 5
=
��6 7
objProperty
��8 C
.
��C D
Id
��D F
;
��F G

objAmenity
��  *
.
��* +
	AmenityId
��+ 4
=
��5 6
doc
��7 :
.
��: ;
	AmenityId
��; D
;
��D E

objAmenity
��  *
.
��* +
IsActive
��+ 3
=
��4 5
doc
��6 9
.
��9 :
IsActive
��: B
;
��B C

objAmenity
��  *
.
��* +

ModifiedBy
��+ 5
=
��6 7
objProperty
��8 C
.
��C D

ModifiedBy
��D N
;
��N O

objAmenity
��  *
.
��* +
ModifiedDate
��+ 7
=
��8 9
AppConstants
��: F
.
��F G
DateTime
��G O
;
��O P 
_amenityrepository
��  2
.
��2 3
UpdateAsync
��3 >
(
��> ?

objAmenity
��? I
)
��I J
;
��J K
}
�� 
}
�� 
else
�� 
{
�� 

objAmenity
�� &
=
��' (
new
��) ,#
MasterPropertyAmenity
��- B
(
��B C
)
��C D
;
��D E

objAmenity
�� &
.
��& '

PropertyId
��' 1
=
��2 3
objProperty
��4 ?
.
��? @
Id
��@ B
;
��B C

objAmenity
�� &
.
��& '
	AmenityId
��' 0
=
��1 2
doc
��3 6
.
��6 7
	AmenityId
��7 @
;
��@ A

objAmenity
�� &
.
��& '
IsActive
��' /
=
��0 1
doc
��2 5
.
��5 6
IsActive
��6 >
;
��> ?

objAmenity
�� &
.
��& '
	CreatedBy
��' 0
=
��1 2
objProperty
��3 >
.
��> ?
	CreatedBy
��? H
;
��H I

objAmenity
�� &
.
��& '
CreatedDate
��' 2
=
��3 4
AppConstants
��5 A
.
��A B
DateTime
��B J
;
��J K 
_amenityrepository
�� .
.
��. /
AddAsync
��/ 7
(
��7 8

objAmenity
��8 B
)
��B C
;
��C D
}
�� 
await
�� 
_unitOfWork
�� )
.
��) *
SaveChangesAsync
��* :
(
��: ;
)
��; <
;
��< =
}
�� 
}
�� 
}
�� 
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
DBOperation
�� %
>
��% &
DeleteProperty
��' 5
(
��5 6
int
��6 9
id
��: <
,
��< =
int
��= @
?
��@ A
by
��B D
)
��D E
{
�� 	
try
�� 
{
�� 
var
�� 
old
�� 
=
�� 
_repository
�� %
.
��% &
GetNoTracking
��& 3
(
��3 4
id
��4 6
)
��6 7
;
��7 8
DbParameter
�� 
[
�� 
]
�� 
prm
�� !
=
��" #
{
�� 
new
�� 
DbParameter
�� #
(
��# $
$str
��$ 0
,
��0 1
id
��2 4
,
��4 5
	SqlDbType
��6 ?
.
��? @
Int
��@ C
)
��C D
,
��D E
new
�� 
DbParameter
�� #
(
��# $
$str
��$ (
,
��( )
by
��2 4
,
��4 5
	SqlDbType
��6 ?
.
��? @
Int
��@ C
)
��C D
}
�� 
;
�� 
EltizamDBHelper
�� 
.
��  
ExecuteNonQuery
��  /
(
��/ 0 
ProcedureMetastore
��0 B
.
��B C!
usp_Property_Delete
��C V
,
��V W 
DatabaseConnection
��X j
.
��j k

ConnString
��k u
,
��u v
System
��w }
.
��} ~
Data��~ �
.��� �
CommandType��� �
.��� �
StoredProcedure��� �
,��� �
prm��� �
)��� �
;��� �
var
�� 
newP
�� 
=
�� 
_repository
�� &
.
��& '
Get2
��' +
(
��+ ,
id
��, .
)
��. /
;
��/ 0
await
�� 
_auditLogService
�� &
.
��& '
CreateAuditLog
��' 5
<
��5 6
MasterProperty
��6 D
>
��D E
(
��E F!
AuditActionTypeEnum
��F Y
.
��Y Z
Update
��Z `
,
��` a
old
��b e
,
��e f
newP
��g k
,
��k l
Enum
��m q
.
��q r
GetName
��r y
(
��y z
TableNameEnum��z �
.��� �
Master_Property��� �
)��� �
,��� �
id��� �
)��� �
;��� �
return
�� 
DBOperation
�� "
.
��" #
Success
��# *
;
��* +
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
throw
�� 
ex
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� !
MasterPropertyModel
�� 2
>
��2 3
>
��3 4-
GetMasterPropertyByFiltersAsync
��5 T
(
��T U
int
��U X
PropertyTypeId
��Y g
,
��g h
int
��i l
SubPropertyTypeId
��m ~
,
��~ 
int��� �
OwnershipTypeId��� �
)��� �
{
�� 	
var
�� 
_PropertFilter
�� 
=
��  
new
��! $
List
��% )
<
��) *!
MasterPropertyModel
��* =
>
��= >
(
��> ?
)
��? @
;
��@ A
var
�� 
res
�� 
=
�� 
_repository
�� !
.
��! "
GetAllAsync
��" -
(
��- .
x
��. /
=>
��0 2
(
��3 4
x
��4 5
.
��5 6
PropertyTypeId
��6 D
==
��E G
PropertyTypeId
��H V
||
��W Y
PropertyTypeId
��Z h
==
��i k
$num
��l m
)
��m n
&&
��" $
(
��% &
x
��& '
.
��' (
PropertySubTypeId
��( 9
==
��: <
SubPropertyTypeId
��= N
||
��O Q
SubPropertyTypeId
��R c
==
��d f
$num
��g h
)
��h i
&&
��" $
(
��% &
x
��& '
.
��' (
OwnershipTypeId
��( 7
==
��8 :
OwnershipTypeId
��; J
||
��K M
OwnershipTypeId
��N ]
==
��^ `
$num
��a b
)
��b c
&&
��" $
x
��% &
.
��& '
IsActive
��' /
==
��0 2
true
��3 7
)
��7 8
.
��  !
Result
��! '
.
��' (
ToList
��( .
(
��. /
)
��/ 0
;
��0 1
_PropertFilter
�� 
=
�� 
_mapperFactory
�� +
.
��+ ,
GetList
��, 3
<
��3 4
MasterProperty
��4 B
,
��B C!
MasterPropertyModel
��D W
>
��W X
(
��X Y
res
��Y \
)
��\ ]
;
��] ^
return
�� 
_PropertFilter
�� !
;
��! "
}
�� 	
}
�� 
}�� �e
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
GetAsync	AA{ �
(
AA� �
id
AA� �
)
AA� �
)
AA� �
;
AA� �
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
usp_Country_SearchAllList	``w �
,
``� �
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
lstStf	ddz �
)
dd� �
;
dd� �
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
�� #
.
��# $

ModifiedBy
��$ .
=
��/ 0
entityproperty
��1 ?
.
��? @

ModifiedBy
��@ J
;
��J K
_repository
�� 
.
��  
UpdateAsync
��  +
(
��+ ,
objPropertyType
��, ;
)
��; <
;
��< =
}
�� 
else
�� 
{
�� 
return
�� 
DBOperation
�� &
.
��& '
NotFound
��' /
;
��/ 0
}
�� 
}
�� 
else
�� 
{
�� 
objPropertyType
�� 
=
��  !
_mapperFactory
��" 0
.
��0 1
Get
��1 4
<
��4 5)
Master_PropertySubTypeModel
��5 P
,
��P Q#
MasterPropertySubType
��R g
>
��g h
(
��h i
entityproperty
��i w
)
��w x
;
��x y
objPropertyType
�� 
.
��  
CreatedDate
��  +
=
��, -
AppConstants
��. :
.
��: ;
DateTime
��; C
;
��C D
objPropertyType
�� 
.
��  
ModifiedDate
��  ,
=
��- .
AppConstants
��/ ;
.
��; <
DateTime
��< D
;
��D E
objPropertyType
�� 
.
��  

ModifiedBy
��  *
=
��+ ,
entityproperty
��- ;
.
��; <

ModifiedBy
��< F
;
��F G
objPropertyType
�� 
.
��  
	CreatedBy
��  )
=
��) *
entityproperty
��+ 9
.
��9 :
	CreatedBy
��: C
;
��C D
_repository
�� 
.
�� 
AddAsync
�� $
(
��$ %
objPropertyType
��% 4
)
��4 5
;
��5 6
}
�� 
await
�� 
_unitOfWork
�� 
.
�� 
SaveChangesAsync
�� .
(
��. /
)
��/ 0
;
��0 1
if
�� 
(
�� 
objPropertyType
�� 
.
��  
Id
��  "
==
��# %
$num
��& '
)
��' (
return
�� 
DBOperation
�� "
.
��" #
Error
��# (
;
��( )
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
DBOperation
�� %
>
��% &
DeleteSubProperty
��' 8
(
��8 9
int
��9 <
id
��= ?
,
��? @
int
��@ C
?
��C D
by
��E G
)
��G H
{
�� 	
var
��  
entityPropertyType
�� "
=
��# $
_repository
��% 0
.
��0 1
Get
��1 4
(
��4 5
x
��5 6
=>
��7 9
x
��: ;
.
��; <
Id
��< >
==
��? A
id
��B D
)
��D E
;
��E F 
entityPropertyType
�� 
.
�� 

ModifiedBy
�� )
=
��* +
by
��, .
??
��/ 1 
entityPropertyType
��2 D
.
��D E

ModifiedBy
��E O
;
��O P
if
�� 
(
��  
entityPropertyType
�� "
==
��# %
null
��& *
)
��* +
return
�� 
DBOperation
�� "
.
��" #
NotFound
��# +
;
��+ ,
_repository
�� 
.
�� 
Remove
�� 
(
��  
entityPropertyType
�� 1
)
��1 2
;
��2 3
await
�� 
_unitOfWork
�� 
.
�� 
SaveChangesAsync
�� .
(
��. /
)
��/ 0
;
��0 1
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
}
�� 
}�� �
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
StoredProcedure	[[s �
,
[[� �
osqlParameter
[[� �
)
[[� �
;
[[� �
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
Results	``z �
.
``� �
DataTableToList
``� �
<
``� �&
Master_PropertyTypeModel
``� �
>
``� �
(
``� �
)
``� �
)
``� �
;
``� �
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
usp_PropertyType_SearchAllList	ggj �
,
gg� �
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
�� 
(
�� 
masterproperty
�� 
.
�� 
Id
�� !
>
��" #
$num
��$ %
)
��% &
{
�� 
	OldEntity
�� 
=
�� 
_repository
�� '
.
��' (
GetNoTracking
��( 5
(
��5 6
masterproperty
��6 D
.
��D E
Id
��E G
)
��G H
;
��H I
type
�� 
=
�� 
_repository
�� "
.
��" #
Get
��# &
(
��& '
masterproperty
��' 5
.
��5 6
Id
��6 8
)
��8 9
;
��9 :
type
�� 
=
�� 
_repository
�� "
.
��" #
Get
��# &
(
��& '
masterproperty
��' 5
.
��5 6
Id
��6 8
)
��8 9
;
��9 :
if
�� 
(
�� 
type
�� 
!=
�� 
null
��  
)
��  !
{
�� 
type
�� 
.
�� 
PropertyType
�� %
=
��& '
masterproperty
��( 6
.
��6 7
PropertyType
��7 C
;
��C D
type
�� 
.
�� 
IsActive
�� !
=
��" #
masterproperty
��$ 2
.
��2 3
IsActive
��3 ;
;
��; <
type
�� 
.
�� 

ModifiedBy
�� #
=
��$ %
masterproperty
��& 4
.
��4 5

ModifiedBy
��5 ?
;
��? @
_repository
�� 
.
��  
UpdateAsync
��  +
(
��+ ,
type
��, 0
)
��0 1
;
��1 2
await
�� 
_auditLogService
�� +
.
��+ ,
CreateAuditLog
��, :
<
��: ; 
MasterPropertyType
��; M
>
��M N
(
��N O!
AuditActionTypeEnum
��O b
.
��b c
Update
��c i
,
��i j
	OldEntity
��k t
,
��t u
type
��v z
,
��z {
MainTableName��| �
,��� �
MainTableKey��� �
)��� �
;��� �
}
�� 
}
�� 
else
�� 
{
�� 
type
�� 
=
�� 
new
��  
MasterPropertyType
�� -
(
��- .
)
��. /
{
�� 
IsActive
�� 
=
�� 
masterproperty
�� -
.
��- .
IsActive
��. 6
,
��6 7
PropertyType
��  
=
��! "
masterproperty
��# 1
.
��1 2
PropertyType
��2 >
,
��> ?
	CreatedBy
�� 
=
�� 
masterproperty
��  .
.
��. /
	CreatedBy
��/ 8
}
�� 
;
�� 
_repository
�� 
.
�� 
AddAsync
�� $
(
��$ %
type
��% )
)
��) *
;
��* +
}
�� 
await
�� 
_unitOfWork
�� 
.
�� 
SaveChangesAsync
�� .
(
��. /
)
��/ 0
;
��0 1
if
�� 
(
�� 
type
�� 
.
�� 
Id
�� 
==
�� 
$num
�� 
)
�� 
return
�� 
DBOperation
�� "
.
��" #
Error
��# (
;
��( )
else
�� 
{
�� 
var
�� 
subTypes
�� 
=
�� 
masterproperty
�� -
.
��- .$
MasterPropertySubTypes
��. D
;
��D E
var
�� 
_Val
�� 
=
�� 
$str
�� 
;
�� 
if
�� 
(
�� 
subTypes
�� 
!=
�� 
null
��  $
)
��$ %
{
�� 
foreach
�� 
(
�� 
var
��  
_stype
��! '
in
��( *
subTypes
��+ 3
)
��3 4
{
�� 
_Val
�� 
+=
�� 
string
��  &
.
��& '
Format
��' -
(
��- .
$str
��. 8
,
��8 9
_stype
��: @
.
��@ A
Id
��A C
,
��C D
_stype
��E K
.
��K L
PropertySubType
��L [
)
��[ \
;
��\ ]
}
�� 
}
�� 
SqlParameter
�� 
[
�� 
]
�� 
_sqlParameter
�� ,
=
��- .
{
�� 
new
�� 
SqlParameter
�� $
(
��$ %
AppConstants
��% 1
.
��1 2
P_Id
��2 6
,
��6 7
type
��D H
.
��H I
Id
��I K
)
��K L
,
��L M
new
�� 
SqlParameter
�� $
(
��$ %
AppConstants
��% 1
.
��1 2
P_CreatedBy
��2 =
,
��= >
masterproperty
��D R
.
��R S
LogInUserId
��S ^
)
��^ _
,
��_ `
new
�� 
SqlParameter
�� $
(
��$ %
AppConstants
��% 1
.
��1 2
P_RequestData
��2 ?
,
��? @
_Val
��D H
)
��H I
}
�� 
;
�� 
await
�� 
_repository
�� !
.
��! "
GetBySP
��" )
(
��) * 
ProcedureMetastore
��* <
.
��< =-
usp_PropertyType_UpsertSubTypes
��= \
,
��\ ]
CommandType
��^ i
.
��i j
StoredProcedure
��j y
,
��y z
_sqlParameter��{ �
)��� �
;��� �
}
�� 
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
DBOperation
�� %
>
��% & 
DeletePropertyType
��' 9
(
��9 :
int
��: =
id
��> @
,
��@ A
int
��A D
?
��D E
by
��F H
)
��H I
{
�� 	
var
�� 
entityProperty
�� 
=
��  
_repository
��! ,
.
��, -
Get
��- 0
(
��0 1
x
��1 2
=>
��3 5
x
��6 7
.
��7 8
Id
��8 :
==
��; =
id
��> @
)
��@ A
;
��A B
entityProperty
�� 
.
�� 

ModifiedBy
�� %
=
��& '
by
��( *
??
��+ -
entityProperty
��. <
.
��< =

ModifiedBy
��= G
;
��G H
if
�� 
(
�� 
entityProperty
�� 
==
�� !
null
��" &
)
��& '
return
�� 
DBOperation
�� "
.
��" #
NotFound
��# +
;
��+ ,
else
�� 
{
�� 
var
�� &
subPropertiesByPopertyId
�� ,
=
��- .
_subrepository
��/ =
.
��= >
GetAll
��> D
(
��D E
)
��E F
.
��F G
Where
��G L
(
��L M
x
��M N
=>
��O Q
x
��R S
.
��S T
PropertyTypeId
��T b
==
��c e
id
��f h
)
��h i
.
��i j
ToList
��j p
(
��p q
)
��q r
;
��r s
if
�� 
(
�� &
subPropertiesByPopertyId
�� ,
.
��, -
Count
��- 2
>
��3 4
$num
��5 6
)
��6 7
{
�� 
foreach
�� 
(
�� 
var
��  
item
��! %
in
��& (&
subPropertiesByPopertyId
��) A
)
��A B
{
�� 
_subrepository
�� &
.
��& '
Remove
��' -
(
��- .
item
��. 2
)
��2 3
;
��3 4
}
�� 
}
�� 
_repository
�� 
.
�� 
Remove
�� "
(
��" #
entityProperty
��# 1
)
��1 2
;
��2 3
await
�� 
_unitOfWork
�� !
.
��! "
SaveChangesAsync
��" 2
(
��2 3
)
��3 4
;
��4 5
return
�� 
DBOperation
�� "
.
��" #
Success
��# *
;
��* +
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� (
CheckDuplicatePropertyType
��  :
(
��: ;
string
��; A
PropertyType
��B N
)
��N O
{
�� 	
var
�� 
dd
�� 
=
�� 
$num
�� 
;
�� 
return
�� 
false
�� 
;
�� 
}
�� 	
}
�� 
}�� �k
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
stringLocalizerError	z �
,
� �
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
GetAsync	BBy �
(
BB� �
id
BB� �
)
BB� �
)
BB� �
;
BB� �
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
CommandType	ZZz �
.
ZZ� �
StoredProcedure
ZZ� �
,
ZZ� �
osqlParameter
ZZ� �
)
ZZ� �
;
ZZ� �
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
QualificationList	]]o �
.
]]� �
Rows
]]� �
[
]]� �
$num
]]� �
]
]]� �
[
]]� �
$str
]]� �
]
]]� �
)
]]� �
:
]]� �
$num
]]� �
)
]]� �
;
]]� �
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
.	^^ �
Rows
^^� �
[
^^� �
$num
^^� �
]
^^� �
[
^^� �
$str
^^� �
]
^^� �
)
^^� �
:
^^� �
$num
^^� �
)
^^� �
;
^^� �"
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
QualificationList	aa} �
.
aa� �
DataTableToList
aa� �
<
aa� �'
Master_QualificationModel
aa� �
>
aa� �
(
aa� �
)
aa� �
)
aa� �
;
aa� �
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
�� 
else
�� 
{
�� 
return
�� 
DBOperation
�� &
.
��& '
NotFound
��' /
;
��/ 0
}
�� 
}
�� 
else
�� 
{
�� 
objQualification
��  
=
��! "
_mapperFactory
��# 1
.
��1 2
Get
��2 5
<
��5 6'
Master_QualificationModel
��6 O
,
��O P"
Master_Qualification
��Q e
>
��e f
(
��f g!
entityqualification
��g z
)
��z {
;
��{ |
objQualification
��  
.
��  !
CreatedDate
��! ,
=
��- .
AppConstants
��/ ;
.
��; <
DateTime
��< D
;
��D E
objQualification
��  
.
��  !
	CreatedBy
��! *
=
��+ ,
_LoginUserId
��- 9
;
��9 :
objQualification
��  
.
��  !

ModifiedBy
��! +
=
��, -
_LoginUserId
��. :
;
��: ;
objQualification
��  
.
��  !
ModifiedDate
��! -
=
��. /
AppConstants
��0 <
.
��< =
DateTime
��= E
;
��E F
_repository
�� 
.
�� 
AddAsync
�� $
(
��$ %
objQualification
��% 5
)
��5 6
;
��6 7
}
�� 
await
�� 
_unitOfWork
�� 
.
�� 
SaveChangesAsync
�� .
(
��. /
)
��/ 0
;
��0 1
if
�� 
(
�� 
objQualification
��  
.
��  !
Id
��! #
==
��$ &
$num
��' (
)
��( )
return
�� 
DBOperation
�� "
.
��" #
Error
��# (
;
��( )
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
DBOperation
�� %
>
��% &!
DeleteQualification
��' :
(
��: ;
int
��; >
id
��? A
)
��A B
{
�� 	
var
�� !
entityQualification
�� #
=
��$ %
_repository
��& 1
.
��1 2
Get
��2 5
(
��5 6
x
��6 7
=>
��8 :
x
��; <
.
��< =
Id
��= ?
==
��@ B
id
��C E
)
��E F
;
��F G
if
�� 
(
�� !
entityQualification
�� #
==
��$ &
null
��' +
)
��+ ,
return
�� 
DBOperation
�� "
.
��" #
NotFound
��# +
;
��+ ,
_repository
�� 
.
�� 
Remove
�� 
(
�� !
entityQualification
�� 2
)
��2 3
;
��3 4
await
�� 
_unitOfWork
�� 
.
�� 
SaveChangesAsync
�� .
(
��. /
)
��/ 0
;
��0 1
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
}
�� 
}�� �1
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
roleModulePermissionEntitys	f �
)
� �
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
roleModulePermissionEntitys	%%u �
)
%%� �
;
%%� �
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
false	**{ �
;
**� �
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
}PP ֤
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
roleModulePermission	s �
,
� �
IMemoryCache
� �
memoryCache
� �
,
� �
IAuditLogService
� �
auditLogService
� �
)
� �
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
MainTableName	FFv �
,
FF� �
MainTableKey
FF� �
)
FF� �
;
FF� �
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
RoleModulePermission	aa �
)
aa� �
)
aa� �
;
aa� �
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
�� 	
public
�� 
async
�� 
Task
�� 
<
�� $
DataTableResponseModel
�� 0
>
��0 1
GetAll
��2 8
(
��8 9$
DataTableAjaxPostModel
��9 O
model
��P U
)
��U V
{
�� 	
string
�� 

ColumnName
�� 
=
�� 
model
��  %
.
��% &
order
��& +
.
��+ ,
Count
��, 1
>
��2 3
$num
��4 5
?
��6 7
model
��8 =
.
��= >
columns
��> E
[
��E F
model
��F K
.
��K L
order
��L Q
[
��Q R
$num
��R S
]
��S T
.
��T U
column
��U [
]
��[ \
.
��\ ]
data
��] a
:
��b c
string
��d j
.
��j k
Empty
��k p
;
��p q
string
�� 
SortDir
�� 
=
�� 
model
�� "
.
��" #
order
��# (
[
��( )
$num
��) *
]
��* +
?
��+ ,
.
��, -
dir
��- 0
;
��0 1
SqlParameter
�� 
[
�� 
]
�� 
osqlParameter
�� (
=
��) *
{
�� 
new
�� 
SqlParameter
��  
(
��  !
AppConstants
��! -
.
��- .!
P_CurrentPageNumber
��. A
,
��A B
model
��D I
.
��I J
start
��J O
)
��O P
,
��P Q
new
�� 
SqlParameter
��  
(
��  !
AppConstants
��! -
.
��- .

P_PageSize
��. 8
,
��8 9
model
��D I
.
��I J
length
��J P
)
��P Q
,
��Q R
new
�� 
SqlParameter
��  
(
��  !
AppConstants
��! -
.
��- .
P_SortColumn
��. :
,
��: ;

ColumnName
��D N
)
��N O
,
��O P
new
�� 
SqlParameter
��  
(
��  !
AppConstants
��! -
.
��- .
P_SortDirection
��. =
,
��= >
SortDir
��D K
)
��K L
,
��L M
new
�� 
SqlParameter
��  
(
��  !
AppConstants
��! -
.
��- .
P_SearchText
��. :
,
��: ;
model
��D I
.
��I J
search
��J P
?
��P Q
.
��Q R
value
��R W
)
��W X
}
�� 
;
�� 
var
�� 
Results
�� 
=
�� 
await
�� 
_repository
��  +
.
��+ ,
GetBySP
��, 3
(
��3 4 
ProcedureMetastore
��4 F
.
��F G$
usp_Role_SearchAllList
��G ]
,
��] ^
CommandType
��_ j
.
��j k
StoredProcedure
��k z
,
��z {
osqlParameter��| �
)��� �
;��� �
var
�� 
res
�� 
=
�� 
UtilityHelper
�� #
.
��# $
GetPaginationInfo
��$ 5
(
��5 6
Results
��6 =
)
��= >
;
��> ?$
DataTableResponseModel
�� "%
oDataTableResponseModel
��# :
=
��; <
new
��= @$
DataTableResponseModel
��A W
(
��W X
model
��X ]
.
��] ^
draw
��^ b
,
��b c
res
��d g
.
��g h
Item1
��h m
,
��m n
res
��o r
.
��r s
Item1
��s x
,
��x y
Results��z �
.��� �
DataTableToList��� �
<��� �#
MasterRoleListModel��� �
>��� �
(��� �
)��� �
)��� �
;��� �
return
�� %
oDataTableResponseModel
�� *
;
��* +
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� 
MasterRoleEntity
�� /
>
��/ 0
>
��0 1
GetActiveRole
��2 ?
(
��? @
)
��@ A
{
�� 	
var
�� 

ActiveRole
�� 
=
�� 
await
�� "
_repository
��# .
.
��. /
GetAllAsync
��/ :
(
��: ;
x
��; <
=>
��= ?
x
��@ A
.
��A B
IsActive
��B J
==
��K M
true
��N R
&&
��S U
x
��V W
.
��W X
	IsDeleted
��X a
==
��b d
false
��e j
)
��j k
;
��k l
return
�� 
_mapperFactory
�� !
.
��! "
GetList
��" )
<
��) *

MasterRole
��* 4
,
��4 5
MasterRoleEntity
��6 F
>
��F G
(
��G H

ActiveRole
��H R
.
��R S
ToList
��S Y
(
��Y Z
)
��Z [
)
��[ \
;
��\ ]
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� 
MasterRoleEntity
�� /
>
��/ 0
>
��0 1

RoleSearch
��2 <
(
��< =
string
��= C
searchQuery
��D O
)
��O P
{
�� 	
var
�� 
allRoles
�� 
=
�� 
await
��  
_repository
��! ,
.
��, -
GetAllAsync
��- 8
(
��8 9
)
��9 :
;
��: ;
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� %
(
��% &
searchQuery
��& 1
)
��1 2
)
��2 3
{
�� 
searchQuery
�� 
=
�� 
searchQuery
�� )
.
��) *
Trim
��* .
(
��. /
)
��/ 0
.
��0 1
ToLower
��1 8
(
��8 9
)
��9 :
;
��: ;
allRoles
�� 
=
�� 
allRoles
�� #
.
��# $
Where
��$ )
(
��) *
role
��* .
=>
��/ 1
role
��2 6
.
��6 7
RoleName
��7 ?
.
��? @
ToLower
��@ G
(
��G H
)
��H I
.
��I J
Contains
��J R
(
��R S
searchQuery
��S ^
)
��^ _
)
��_ `
.
��` a
ToList
��a g
(
��g h
)
��h i
;
��i j
}
�� 
return
�� 
_mapperFactory
�� !
.
��! "
GetList
��" )
<
��) *

MasterRole
��* 4
,
��4 5
MasterRoleEntity
��6 F
>
��F G
(
��G H
allRoles
��H P
)
��P Q
;
��Q R
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
MasterRoleEntity
�� *
>
��* +
GetById
��, 3
(
��3 4
int
��4 7
id
��8 :
)
��: ;
{
�� 	
try
�� 
{
�� 
MasterRoleEntity
��  
_roleEntity
��! ,
=
��- .
_mapperFactory
��/ =
.
��= >
Get
��> A
<
��A B

MasterRole
��B L
,
��L M
MasterRoleEntity
��N ^
>
��^ _
(
��_ `
await
��` e
_repository
��f q
.
��q r
GetAsync
��r z
(
��z {
id
��{ }
)
��} ~
)
��~ 
;�� �
var
�� 
IsUserExist
�� 
=
��  !
_Userrepository
��" 1
.
��1 2
GetAllQuery
��2 =
(
��= >
)
��> ?
.
��? @
Where
��@ E
(
��E F
x
��F G
=>
��H J
x
��K L
.
��L M
RoleId
��M S
==
��T V
_roleEntity
��W b
.
��b c
Id
��c e
)
��e f
.
��f g
ToList
��g m
(
��m n
)
��n o
;
��o p
if
�� 
(
�� 
IsUserExist
�� 
!=
��  "
null
��# '
&&
��( *
IsUserExist
��+ 6
.
��6 7
Count
��7 <
>
��= >
$num
��? @
)
��@ A
_roleEntity
�� 
.
��  
IsUserAssigned
��  .
=
��/ 0
true
��1 5
;
��5 6
return
�� 
_roleEntity
�� "
;
��" #
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
throw
�� 
ex
�� 
;
�� 
}
�� 
}
�� 	
}
�� 
}�� �g
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
usp_State_SearchAllList	99y �
,
99� �
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
lstStf	>>z �
)
>>� �
;
>>� �
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
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� 
MasterStateEntity
�� 0
>
��0 1
>
��1 2
GetStateList
��3 ?
(
��? @
)
��@ A
{
�� 	
var
�� 
lstStf
�� 
=
�� 
EltizamDBHelper
�� (
.
��( )!
ExecuteMappedReader
��) <
<
��< =
MasterStateEntity
��= N
>
��N O
(
��O P 
ProcedureMetastore
��P b
.
��b c
usp_State_AllList
��c t
,
��t u 
DatabaseConnection
�� 
.
��  

ConnString
��  *
,
��* +
CommandType
��, 7
.
��7 8
StoredProcedure
��8 G
,
��G H
null
��I M
)
��M N
;
��N O
return
�� 
lstStf
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� 
MasterStateEntity
�� 0
>
��0 1
>
��1 2%
GetStateListByCountryId
��3 J
(
��J K
int
��K N
	countryId
��O X
)
��X Y
{
�� 	
var
�� 
	stateList
�� 
=
�� 
new
�� 
List
��  $
<
��$ %
MasterStateEntity
��% 6
>
��6 7
(
��7 8
)
��8 9
;
��9 :
var
�� 
stateListAsync
�� 
=
��  
_repository
��! ,
.
��, -
GetAllAsync
��- 8
(
��8 9
x
��9 :
=>
��; =
x
��> ?
.
��? @
	CountryId
��@ I
==
��J L
	countryId
��M V
)
��V W
.
��W X
Result
��X ^
.
��^ _
ToList
��_ e
(
��e f
)
��f g
;
��g h
	stateList
�� 
=
�� 
_mapperFactory
�� &
.
��& '
GetList
��' .
<
��. /
MasterState
��/ :
,
��: ;
MasterStateEntity
��< M
>
��M N
(
��N O
stateListAsync
��O ]
)
��] ^
;
��^ _
return
�� 
	stateList
�� 
;
�� 
}
�� 	
}
�� 
}�� ��
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
IMasterNotificationService	&&t �
notification
&&� �
)
&&� �
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
osqlParameter	@@z �
)
@@� �
;
@@� �
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
�� 
emailLogHistory
�� +
=
��, -
new
��. 1
EmailLogHistory
��2 A
(
��A B
)
��B C
;
��C D
emailLogHistory
�� 
.
�� 
FromAddress
�� '
=
��( )
configuration
��* 7
.
��7 8

GetSection
��8 B
(
��B C
$str
��C P
)
��P Q
.
��Q R

GetSection
��R \
(
��\ ]
$str
��] h
)
��h i
.
��i j
Value
��j o
;
��o p
emailLogHistory
�� 
.
�� 
	ToAddress
�� %
=
��& '
notification
��( 4
.
��4 5
ToEmailList
��5 @
;
��@ A
emailLogHistory
�� 
.
�� 
Subject
�� #
=
��$ %
notification
��& 2
.
��2 3
Subject
��3 :
;
��: ;
emailLogHistory
�� 
.
�� 
EmailResponse
�� )
=
��* +
$str
��, .
;
��. /
emailLogHistory
�� 
.
�� 
	CreatedBy
�� %
=
��& '
$num
��( )
;
��) *
emailLogHistory
�� 
.
�� 
Body
��  
=
��! "
notification
��# /
.
��/ 0
Body
��0 4
;
��4 5
emailLogHistory
�� 
.
�� 
IsSent
�� "
=
��# $
DBOperation
��% 0
.
��0 1
Success
��1 8
==
��9 ;
res
��< ?
.
��? @
Result
��@ F
;
��F G
	_emailLog
�� 
.
�� 
AddAsync
�� 
(
�� 
emailLogHistory
�� .
)
��. /
;
��/ 0
await
�� 
_unitOfWork
�� 
.
�� 
SaveChangesAsync
�� .
(
��. /
)
��/ 0
;
��0 1
return
�� 
res
�� 
.
�� 
Result
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
string
��  
>
��  !
ResetPassword
��" /
(
��/ 0+
MasterUserResetPasswordEntity
��0 M!
resetPasswordentity
��N a
)
��a b
{
�� 	
var
�� 

entityUser
�� 
=
�� 
_repository
�� (
.
��( )
Get
��) ,
(
��, -
x
��- .
=>
��/ 1
x
��2 3
.
��3 4!
ForgotPasswordToken
��4 G
==
��H J!
resetPasswordentity
��K ^
.
��^ _!
ForgotPasswordToken
��_ r
)
��r s
;
��s t
if
�� 
(
�� 

entityUser
�� 
==
�� 
null
�� "
)
��" #
return
�� 
$str
�� &
;
��& '
if
�� 
(
�� 

entityUser
�� 
.
�� $
ForgotPasswordDateTime
�� 1
.
��1 2
Value
��2 7
.
��7 8
AddHours
��8 @
(
��@ A
$num
��A B
)
��B C
<
��D E
AppConstants
��F R
.
��R S
DateTime
��S [
)
��[ \
{
�� 
return
�� 
$str
�� %
;
��% &
}
�� 

entityUser
�� 
.
�� 
Password
�� 
=
��  !
UtilityHelper
��" /
.
��/ 0"
GenerateSHA256String
��0 D
(
��D E!
resetPasswordentity
��E X
.
��X Y
Password
��Y a
)
��a b
;
��b c

entityUser
�� 
.
�� !
ForgotPasswordToken
�� *
=
��+ ,
string
��- 3
.
��3 4
Empty
��4 9
;
��9 :

entityUser
�� 
.
�� $
ForgotPasswordDateTime
�� -
=
��. /
null
��0 4
;
��4 5
_repository
�� 
.
�� 
UpdateAsync
�� #
(
��# $

entityUser
��$ .
)
��. /
;
��/ 0
await
�� 
_unitOfWork
�� 
.
�� 
SaveChangesAsync
�� .
(
��. /
)
��/ 0
;
��0 1
return
�� 
$str
�� &
;
��& '
}
�� 	
public
�� !
SMTPEntityViewModel
�� ""
GetSMTPConfiguration
��# 7
(
��7 8
)
��8 9
{
�� 	!
SMTPEntityViewModel
�� 
_smtp
��  %
=
��& '
new
��( +!
SMTPEntityViewModel
��, ?
(
��? @
)
��@ A
;
��A B
_smtp
�� 
.
�� 
Host
�� 
=
�� 
configuration
�� &
.
��& '

GetSection
��' 1
(
��1 2
$str
��2 ?
)
��? @
.
��@ A

GetSection
��A K
(
��K L
$str
��L R
)
��R S
.
��S T
Value
��T Y
;
��Y Z
_smtp
�� 
.
�� 
Port
�� 
=
�� 
configuration
�� &
.
��& '

GetSection
��' 1
(
��1 2
$str
��2 ?
)
��? @
.
��@ A

GetSection
��A K
(
��K L
$str
��L R
)
��R S
.
��S T
Value
��T Y
;
��Y Z
_smtp
�� 
.
�� 
	EnableSsl
�� 
=
�� 
configuration
�� +
.
��+ ,

GetSection
��, 6
(
��6 7
$str
��7 D
)
��D E
.
��E F

GetSection
��F P
(
��P Q
$str
��Q ]
)
��] ^
.
��^ _
Value
��_ d
;
��d e
_smtp
�� 
.
�� 
	FromEmail
�� 
=
�� 
configuration
�� +
.
��+ ,

GetSection
��, 6
(
��6 7
$str
��7 D
)
��D E
.
��E F

GetSection
��F P
(
��P Q
$str
��Q \
)
��\ ]
.
��] ^
Value
��^ c
;
��c d
_smtp
�� 
.
�� 
UserName
�� 
=
�� 
configuration
�� *
.
��* +

GetSection
��+ 5
(
��5 6
$str
��6 C
)
��C D
.
��D E

GetSection
��E O
(
��O P
$str
��P Z
)
��Z [
.
��[ \
Value
��\ a
;
��a b
_smtp
�� 
.
�� 
Password
�� 
=
�� 
configuration
�� *
.
��* +

GetSection
��+ 5
(
��5 6
$str
��6 C
)
��C D
.
��D E

GetSection
��E O
(
��O P
$str
��P Z
)
��Z [
.
��[ \
Value
��\ a
;
��a b
return
�� 
_smtp
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� 
IsTokenValid
��  ,
(
��, -
string
��- 3
token
��4 9
)
��9 :
{
�� 	
var
�� 
isExists
�� 
=
�� 
await
��  
_repository
��! ,
.
��, -
GetAllQuery
��- 8
(
��8 9
)
��9 :
.
��: ;
AnyAsync
��; C
(
��C D
x
��D E
=>
��F H
x
��I J
.
��J K!
ForgotPasswordToken
��K ^
==
��_ a
token
��b g
)
��g h
;
��h i
return
�� 
isExists
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� $
DataTableResponseModel
�� 0
>
��0 1
GetAll
��2 8
(
��8 9$
DataTableAjaxPostModel
��9 O
model
��P U
)
��U V
{
�� 	
string
�� 

ColumnName
�� 
=
�� 
model
��  %
.
��% &
order
��& +
.
��+ ,
Count
��, 1
>
��2 3
$num
��4 5
?
��6 7
model
��8 =
.
��= >
columns
��> E
[
��E F
model
��F K
.
��K L
order
��L Q
[
��Q R
$num
��R S
]
��S T
.
��T U
column
��U [
]
��[ \
.
��\ ]
data
��] a
:
��b c
string
��d j
.
��j k
Empty
��k p
;
��p q
string
�� 
SortDir
�� 
=
�� 
model
�� "
.
��" #
order
��# (
[
��( )
$num
��) *
]
��* +
?
��+ ,
.
��, -
dir
��- 0
;
��0 1
SqlParameter
�� 
[
�� 
]
�� 
osqlParameter
�� (
=
��) *
{
�� 
new
�� 
SqlParameter
��  
(
��  !
AppConstants
��! -
.
��- .!
P_CurrentPageNumber
��. A
,
��A B
model
��D I
.
��I J
start
��J O
)
��O P
,
��P Q
new
�� 
SqlParameter
��  
(
��  !
AppConstants
��! -
.
��- .

P_PageSize
��. 8
,
��8 9
model
��D I
.
��I J
length
��J P
)
��P Q
,
��Q R
new
�� 
SqlParameter
��  
(
��  !
AppConstants
��! -
.
��- .
P_SortColumn
��. :
,
��: ;

ColumnName
��D N
)
��N O
,
��O P
new
�� 
SqlParameter
��  
(
��  !
AppConstants
��! -
.
��- .
P_SortDirection
��. =
,
��= >
SortDir
��D K
)
��K L
,
��L M
new
�� 
SqlParameter
��  
(
��  !
AppConstants
��! -
.
��- .
P_SearchText
��. :
,
��: ;
model
��D I
.
��I J
search
��J P
?
��P Q
.
��Q R
value
��R W
)
��W X
}
�� 
;
�� 
var
�� 
Results
�� 
=
�� 
await
�� 
_repository
��  +
.
��+ ,
GetBySP
��, 3
(
��3 4 
ProcedureMetastore
��4 F
.
��F G$
usp_User_SearchAllList
��G ]
,
��] ^
CommandType
��_ j
.
��j k
StoredProcedure
��k z
,
��z {
osqlParameter��| �
)��� �
;��� �
var
�� 
res
�� 
=
�� 
UtilityHelper
�� #
.
��# $
GetPaginationInfo
��$ 5
(
��5 6
Results
��6 =
)
��= >
;
��> ?$
DataTableResponseModel
�� "%
oDataTableResponseModel
��# :
=
��; <
new
��= @$
DataTableResponseModel
��A W
(
��W X
model
��X ]
.
��] ^
draw
��^ b
,
��b c
res
��d g
.
��g h
Item1
��h m
,
��m n
res
��o r
.
��r s
Item1
��s x
,
��x y
Results��z �
.��� �
DataTableToList��� �
<��� �#
MasterUserListModel��� �
>��� �
(��� �
)��� �
)��� �
;��� �
return
�� %
oDataTableResponseModel
�� *
;
��* +
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� #
MasterUserDetailModel
�� /
>
��/ 0
GetById
��1 8
(
��8 9
int
��9 <
id
��= ?
)
��? @
{
�� 	
var
�� 
	tableName
�� 
=
�� 
Enum
��  
.
��  !
GetName
��! (
(
��( )
TableNameEnum
��) 6
.
��6 7
Master_User
��7 B
)
��B C
;
��C D
var
�� 
_userEntity
�� 
=
�� 
new
�� !#
MasterUserDetailModel
��" 7
(
��7 8
)
��8 9
;
��9 :
_userEntity
�� 
=
�� 
_mapperFactory
�� (
.
��( )
Get
��) ,
<
��, -

MasterUser
��- 7
,
��7 8#
MasterUserDetailModel
��9 N
>
��N O
(
��O P
await
��P U
_repository
��V a
.
��a b
GetAsync
��b j
(
��j k
id
��k m
)
��m n
)
��n o
;
��o p
if
�� 
(
�� 
_userEntity
�� 
!=
�� 
null
�� #
)
��# $
{
�� 
_userEntity
�� 
.
�� 
DesignationId
�� )
=
��* +
_userEntity
��, 7
.
��7 8
DesignationId
��8 E
is
��F H
null
��I M
?
��N O
$num
��P Q
:
��R S
_userEntity
��T _
.
��_ `
DesignationId
��` m
;
��m n
_userEntity
�� 
.
�� 
DepartmentId
�� (
=
��) *
_userEntity
��+ 6
.
��6 7
DepartmentId
��7 C
is
��D F
null
��G K
?
��L M
$num
��N O
:
��P Q
_userEntity
��R ]
.
��] ^
DepartmentId
��^ j
;
��j k
DbParameter
�� 
[
�� 
]
�� 
osqlParameter
�� +
=
��, -
{
�� 
new
�� 
DbParameter
��  
(
��  !
AppConstants
��! -
.
��- .

TableKeyId
��. 8
,
��8 9
id
��: <
,
��< =
	SqlDbType
��> G
.
��G H
Int
��H K
)
��K L
,
��L M
new
�� 
DbParameter
��  
(
��  !
AppConstants
��! -
.
��- .
	TableName
��. 7
,
��7 8
	tableName
��: C
,
��C D
	SqlDbType
��E N
.
��N O
VarChar
��O V
)
��V W
,
��W X
}
�� 
;
�� 
var
�� 
UserAddress
�� 
=
��  !
EltizamDBHelper
��" 1
.
��1 2!
ExecuteMappedReader
��2 E
<
��E F$
MasterUserAddressModel
��F \
>
��\ ]
(
��] ^ 
ProcedureMetastore
��^ p
.
��p q1
"usp_Address_GetAddressByTableKeyId��q �
,��� � 
DatabaseConnection
��" 4
.
��4 5

ConnString
��5 ?
,
��? @
System
��A G
.
��G H
Data
��H L
.
��L M
CommandType
��M X
.
��X Y
StoredProcedure
��Y h
,
��h i
osqlParameter
��j w
)
��w x
;
��x y
if
�� 
(
�� 
UserAddress
�� 
!=
��  "
null
��# '
)
��' (
{
�� 
_userEntity
�� 
.
��  
	Addresses
��  )
=
��* +
UserAddress
��, 7
;
��7 8
}
�� 
DbParameter
�� 
[
�� 
]
�� 
osqlParameter1
�� ,
=
��- .
{
�� 
new
�� 
DbParameter
�� #
(
��# $
AppConstants
��$ 0
.
��0 1

TableKeyId
��1 ;
,
��; <
id
��= ?
,
��? @
	SqlDbType
��A J
.
��J K
Int
��K N
)
��N O
,
��O P
new
�� 
DbParameter
�� #
(
��# $
AppConstants
��$ 0
.
��0 1
	TableName
��1 :
,
��: ;
	tableName
��< E
,
��E F
	SqlDbType
��G P
.
��P Q
VarChar
��Q X
)
��X Y
,
��Y Z
}
�� 
;
�� 
var
�� 
UserQualification
�� %
=
��& '
EltizamDBHelper
��( 7
.
��7 8!
ExecuteMappedReader
��8 K
<
��K L'
Master_QualificationModel
��L e
>
��e f
(
��f g 
ProcedureMetastore
��g y
.
��y z=
.usp_Qualification_GetQualificationByTableKeyId��z �
,��� � 
DatabaseConnection
��( :
.
��: ;

ConnString
��; E
,
��E F
System
��G M
.
��M N
Data
��N R
.
��R S
CommandType
��S ^
.
��^ _
StoredProcedure
��_ n
,
��n o
osqlParameter1
��p ~
)
��~ 
;�� �
if
�� 
(
�� 
UserQualification
�� %
!=
��& (
null
��) -
)
��- .
{
�� 
_userEntity
�� 
.
��  
Qualifications
��  .
=
��/ 0
UserQualification
��1 B
;
��B C
}
�� 
DbParameter
�� 
[
�� 
]
�� 
osqlParameter2
�� ,
=
��- .
{
�� 
new
�� 
DbParameter
�� #
(
��# $
AppConstants
��$ 0
.
��0 1

TableKeyId
��1 ;
,
��; <
id
��= ?
,
��? @
	SqlDbType
��A J
.
��J K
Int
��K N
)
��N O
,
��O P
new
�� 
DbParameter
�� #
(
��# $
AppConstants
��$ 0
.
��0 1
	TableName
��1 :
,
��: ;
	tableName
��= F
,
��F G
	SqlDbType
��H Q
.
��Q R
VarChar
��R Y
)
��Y Z
,
��Z [
}
�� 
;
�� 
var
�� 
UserDocuments
�� !
=
��" #
EltizamDBHelper
��$ 3
.
��3 4!
ExecuteMappedReader
��4 G
<
��G H!
MasterDocumentModel
��H [
>
��[ \
(
��\ ] 
ProcedureMetastore
��] o
.
��o p3
$usp_Document_GetDocumentByTableKeyId��p �
,��� � 
DatabaseConnection
��$ 6
.
��6 7

ConnString
��7 A
,
��A B
System
��C I
.
��I J
Data
��J N
.
��N O
CommandType
��O Z
.
��Z [
StoredProcedure
��[ j
,
��j k
osqlParameter2
��l z
)
��z {
;
��{ |
if
�� 
(
�� 
UserDocuments
�� !
!=
��" $
null
��% )
)
��) *
{
�� 
_userEntity
�� 
.
��  
	Documents
��  )
=
��* +
UserDocuments
��, 9
;
��9 :
}
�� 
if
�� 
(
�� 
_userEntity
�� 
.
��  !
ProfileAttachmentId
��  3
!=
��4 6
null
��7 ;
&&
��< >
_userEntity
��? J
.
��J K!
ProfileAttachmentId
��K ^
>
��_ `
$num
��a b
)
��b c
{
�� 
var
�� 
profile
�� 
=
��  !!
_documentRepository
��" 5
.
��5 6
Get
��6 9
(
��9 :
_userEntity
��: E
.
��E F!
ProfileAttachmentId
��F Y
)
��Y Z
;
��Z [
if
�� 
(
�� 
profile
�� 
!=
��  "
null
��# '
)
��' (
{
�� 
_userEntity
�� #
.
��# $
ProfilePath
��$ /
=
��0 1
profile
��2 9
.
��9 :
FilePath
��: B
;
��B C
}
�� 
}
�� 
}
�� 
return
�� 
_userEntity
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
DBOperation
�� %
>
��% &
Upsert
��' -
(
��- .
MasterUserModel
��. =

entityUser
��> H
)
��H I
{
�� 	
try
�� 
{
�� 
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 
IsNullOrEmpty
�� )
(
��) *

entityUser
��* 4
.
��4 5
Password
��5 =
)
��= >
&&
��? A

entityUser
��B L
.
��L M
Id
��M O
<=
��P R
$num
��S T
)
��T U
{
�� 

entityUser
�� 
.
�� 
Password
�� '
=
��( )
UtilityHelper
��* 7
.
��7 8"
GenerateSHA256String
��8 L
(
��L M

entityUser
��M W
.
��W X
Password
��X `
)
��` a
;
��a b

entityUser
�� 
.
�� 
ConfirmPassowrd
�� .
=
��/ 0

entityUser
��1 ;
.
��; <
Password
��< D
;
��D E
}
�� 

MasterUser
�� 
objUser
�� "
;
��" #
MasterAddress
�� 
objUserAddress
�� ,
;
��, -!
MasterQualification
�� #"
objUserQualification
��$ 8
;
��8 9
MasterDocument
�� 
objUserDocument
�� .
;
��. /
string
�� 
MainTableName
�� $
=
��% &
Enum
��' +
.
��+ ,
GetName
��, 3
(
��3 4
TableNameEnum
��4 A
.
��A B
Master_User
��B M
)
��M N
;
��N O
int
�� 
MainTableKey
��  
=
��! "

entityUser
��# -
.
��- .
Id
��. 0
;
��0 1
if
�� 
(
�� 

entityUser
�� 
.
�� 
Id
�� !
>
��" #
$num
��$ %
)
��% &
{
�� 

MasterUser
�� 
	OldEntity
�� (
=
��) *
null
��+ /
;
��/ 0
	OldEntity
�� 
=
�� 
_repository
��  +
.
��+ ,
GetNoTracking
��, 9
(
��9 :

entityUser
��: D
.
��D E
Id
��E G
)
��G H
;
��H I
objUser
�� 
=
�� 
_repository
�� )
.
��) *
Get
��* -
(
��- .

entityUser
��. 8
.
��8 9
Id
��9 ;
)
��; <
;
��< =
if
�� 
(
�� 
objUser
�� 
!=
��  "
null
��# '
)
��' (
{
�� 
objUser
�� 
.
��  
	FirstName
��  )
=
��* +

entityUser
��, 6
.
��6 7
	FirstName
��7 @
;
��@ A
objUser
�� 
.
��  

MiddleName
��  *
=
��+ ,

entityUser
��- 7
.
��7 8

MiddleName
��8 B
;
��B C
objUser
�� 
.
��  
LastName
��  (
=
��) *

entityUser
��+ 5
.
��5 6
LastName
��6 >
;
��> ?
objUser
�� 
.
��  
UserName
��  (
=
��) *

entityUser
��+ 5
.
��5 6
UserName
��6 >
;
��> ?
objUser
�� 
.
��  
GenderId
��  (
=
��) *

entityUser
��+ 5
.
��5 6
GenderId
��6 >
;
��> ?
objUser
�� 
.
��  
DateOfBirth
��  +
=
��, -

entityUser
��. 8
.
��8 9
DateOfBirth
��9 D
;
��D E
objUser
�� 
.
��  
DepartmentId
��  ,
=
��- .

entityUser
��/ 9
.
��9 :
DepartmentId
��: F
;
��F G
objUser
�� 
.
��  
DesignationId
��  -
=
��. /

entityUser
��0 :
.
��: ;
DesignationId
��; H
;
��H I
objUser
�� 
.
��  
	LicenseNo
��  )
=
��* +

entityUser
��, 6
.
��6 7
	LicenseNo
��7 @
;
��@ A
objUser
�� 
.
��  
	CompanyId
��  )
=
��* +

entityUser
��, 6
.
��6 7
	CompanyId
��7 @
;
��@ A
objUser
�� 
.
��  
CompanyName
��  +
=
��, -

entityUser
��. 8
.
��8 9
CompanyName
��9 D
;
��D E
objUser
�� 
.
��  

ResourceId
��  *
=
��+ ,

entityUser
��- 7
.
��7 8

ResourceId
��8 B
;
��B C
objUser
�� 
.
��  
IsActive
��  (
=
��) *

entityUser
��+ 5
.
��5 6
IsActive
��6 >
;
��> ?
objUser
�� 
.
��  
RoleId
��  &
=
��' (

entityUser
��) 3
.
��3 4
RoleId
��4 :
;
��: ;
objUser
�� 
.
��  
ApproverLevelId
��  /
=
��0 1

entityUser
��2 <
.
��< =
RoleId
��= C
==
��D F
(
��G H
int
��H K
)
��K L
RoleEnum
��L T
.
��T U
Approver
��U ]
?
��^ _

entityUser
��` j
.
��j k
ApproverLevelId
��k z
:
��{ |
null��} �
;��� �
objUser
�� 
.
��  
Email
��  %
=
��& '

entityUser
��( 2
.
��2 3
Email
��3 8
;
��8 9
objUser
�� 
.
��  

ModifiedBy
��  *
=
��+ ,

entityUser
��- 7
.
��7 8

ModifiedBy
��8 B
;
��B C
_repository
�� #
.
��# $
UpdateAsync
��$ /
(
��/ 0
objUser
��0 7
)
��7 8
;
��8 9
await
�� 
_unitOfWork
�� )
.
��) *
SaveChangesAsync
��* :
(
��: ;
)
��; <
;
��< =
await
�� 
_auditLogService
�� .
.
��. /
CreateAuditLog
��/ =
<
��= >

MasterUser
��> H
>
��H I
(
��I J!
AuditActionTypeEnum
��J ]
.
��] ^
Update
��^ d
,
��d e
	OldEntity
��f o
,
��o p
objUser
��q x
,
��x y
MainTableName��z �
,��� �
MainTableKey��� �
)��� �
;��� �
}
�� 
}
�� 
else
�� 
{
�� 
objUser
�� 
=
�� 
_mapperFactory
�� ,
.
��, -
Get
��- 0
<
��0 1
MasterUserModel
��1 @
,
��@ A

MasterUser
��B L
>
��L M
(
��M N

entityUser
��N X
)
��X Y
;
��Y Z
objUser
�� 
.
�� 
IsActive
�� $
=
��% &

entityUser
��' 1
.
��1 2
IsActive
��2 :
;
��: ;
objUser
�� 
.
�� 
	CreatedBy
�� %
=
��& '

entityUser
��( 2
.
��2 3
	CreatedBy
��3 <
;
��< =
_repository
�� 
.
��  
AddAsync
��  (
(
��( )
objUser
��) 0
)
��0 1
;
��1 2
await
�� 
_unitOfWork
�� %
.
��% &
SaveChangesAsync
��& 6
(
��6 7
)
��7 8
;
��8 9
}
�� 
if
�� 
(
�� 
objUser
�� 
.
�� 
Id
�� 
==
�� !
$num
��" #
)
��# $
return
�� 
DBOperation
�� &
.
��& '
Error
��' ,
;
��, -
else
�� 
{
�� 
if
�� 
(
�� 

entityUser
�� "
.
��" #
uploadProfile
��# 0
!=
��1 3
null
��4 8
)
��8 9
{
�� 
objUserDocument
�� '
=
��( )
_mapperFactory
��* 8
.
��8 9
Get
��9 <
<
��< =!
MasterDocumentModel
��= P
,
��P Q
MasterDocument
��R `
>
��` a
(
��a b

entityUser
��b l
.
��l m
uploadProfile
��m z
)
��z {
;
��{ |
objUserDocument
�� '
.
��' (
IsActive
��( 0
=
��1 2

entityUser
��3 =
.
��= >
uploadProfile
��> K
.
��K L
IsActive
��L T
;
��T U
objUserDocument
�� '
.
��' (

TableKeyId
��( 2
=
��3 4
objUser
��5 <
.
��< =
Id
��= ?
;
��? @
objUserDocument
�� '
.
��' (
	TableName
��( 1
=
��2 3
$str
��4 B
;
��B C
objUserDocument
�� '
.
��' (
DocumentName
��( 4
=
��5 6

entityUser
��7 A
.
��A B
uploadProfile
��B O
.
��O P
DocumentName
��P \
;
��\ ]
objUserDocument
�� '
.
��' (
FileName
��( 0
=
��1 2

entityUser
��3 =
.
��= >
uploadProfile
��> K
.
��K L
FileName
��L T
;
��T U
objUserDocument
�� '
.
��' (
FilePath
��( 0
=
��1 2

entityUser
��3 =
.
��= >
uploadProfile
��> K
.
��K L
FilePath
��L T
;
��T U
objUserDocument
�� '
.
��' (
FileType
��( 0
=
��1 2

entityUser
��3 =
.
��= >
uploadProfile
��> K
.
��K L
FileType
��L T
;
��T U
objUserDocument
�� '
.
��' (
	CreatedBy
��( 1
=
��2 3

entityUser
��4 >
.
��> ?
uploadProfile
��? L
.
��L M
	CreatedBy
��M V
;
��V W!
_documentRepository
�� +
.
��+ ,
AddAsync
��, 4
(
��4 5
objUserDocument
��5 D
)
��D E
;
��E F
await
�� 
_unitOfWork
�� )
.
��) *
SaveChangesAsync
��* :
(
��: ;
)
��; <
;
��< =
var
�� 
user
��  
=
��! "
_repository
��# .
.
��. /
Get
��/ 2
(
��2 3

entityUser
��3 =
.
��= >
Id
��> @
)
��@ A
;
��A B
user
�� 
.
�� !
ProfileAttachmentId
�� 0
=
��1 2
objUserDocument
��3 B
.
��B C
Id
��C E
;
��E F
_repository
�� #
.
��# $
UpdateAsync
��$ /
(
��/ 0
user
��0 4
)
��4 5
;
��5 6
await
�� 
_unitOfWork
�� )
.
��) *
SaveChangesAsync
��* :
(
��: ;
)
��; <
;
��< =
}
�� 
if
�� 
(
�� 

entityUser
�� "
.
��" #
	Addresses
��# ,
.
��, -
Count
��- 2
>
��3 4
$num
��5 6
)
��6 7
{
�� 
var
�� 
entityAddressess
�� ,
=
��- . 
_addressRepository
��/ A
.
��A B
GetAll
��B H
(
��H I
)
��I J
.
��J K
Where
��K P
(
��P Q
x
��Q R
=>
��S U
x
��V W
.
��W X

TableKeyId
��X b
==
��c e

entityUser
��f p
.
��p q
Id
��q s
&&
��t v
x
��w x
.
��x y
	TableName��y �
==��� �
$str��� �
&&��� �
(��� �
x��� �
.��� �
	IsDeleted��� �
==��� �
false��� �
||��� �
x��� �
.��� �
	IsDeleted��� �
==��� �
null��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
var
�� 
allAddressId
�� (
=
��) *
entityAddressess
��+ ;
.
��; <
Count
��< A
>
��B C
$num
��D E
?
��F G
entityAddressess
��H X
.
��X Y
Select
��Y _
(
��_ `
x
��` a
=>
��b d
x
��e f
.
��f g
Id
��g i
)
��i j
.
��j k
OrderBy
��k r
(
��r s
Id
��s u
=>
��v x
Id
��y {
)
��{ |
.
��| }
ToList��} �
(��� �
)��� �
:��� �
null��� �
;��� �
foreach
�� 
(
��  !
var
��! $
address
��% ,
in
��- /

entityUser
��0 :
.
��: ;
	Addresses
��; D
)
��D E
{
�� 
if
�� 
(
��  
address
��  '
.
��' (
Id
��( *
>
��+ ,
$num
��- .
)
��. /
{
�� 
if
��  "
(
��# $
allAddressId
��$ 0
!=
��1 3
null
��4 8
&&
��9 ;
allAddressId
��< H
.
��H I
Count
��I N
>
��O P
$num
��Q R
)
��R S
{
��  !
allAddressId
��$ 0
.
��0 1
Remove
��1 7
(
��7 8
address
��8 ?
.
��? @
Id
��@ B
)
��B C
;
��C D
}
��  !
var
��  #
	OldEntity
��$ -
=
��. / 
_addressRepository
��0 B
.
��B C
GetNoTracking
��C P
(
��P Q
address
��Q X
.
��X Y
Id
��Y [
)
��[ \
;
��\ ]
objUserAddress
��  .
=
��/ 0 
_addressRepository
��1 C
.
��C D
Get
��D G
(
��G H
address
��H O
.
��O P
Id
��P R
)
��R S
;
��S T
if
��  "
(
��# $
objUserAddress
��$ 2
!=
��3 5
null
��6 :
)
��: ;
{
��  !
var
��$ '
entityAddress
��( 5
=
��6 7
_mapperFactory
��8 F
.
��F G
Get
��G J
<
��J K$
MasterUserAddressModel
��K a
,
��a b
MasterAddress
��c p
>
��p q
(
��q r
address
��r y
)
��y z
;
��z {
objUserAddress
��$ 2
.
��2 3
Address1
��3 ;
=
��< =
entityAddress
��> K
.
��K L
Address1
��L T
;
��T U
objUserAddress
��$ 2
.
��2 3
Address1
��3 ;
=
��< =
entityAddress
��> K
.
��K L
Address1
��L T
;
��T U
objUserAddress
��$ 2
.
��2 3
Address2
��3 ;
=
��< =
entityAddress
��> K
.
��K L
Address2
��L T
;
��T U
objUserAddress
��$ 2
.
��2 3
Address3
��3 ;
=
��< =
entityAddress
��> K
.
��K L
Address3
��L T
;
��T U
objUserAddress
��$ 2
.
��2 3
Landmark
��3 ;
=
��< =
entityAddress
��> K
.
��K L
Landmark
��L T
;
��T U
objUserAddress
��$ 2
.
��2 3
	CountryId
��3 <
=
��= >
entityAddress
��? L
.
��L M
	CountryId
��M V
;
��V W
objUserAddress
��$ 2
.
��2 3
StateId
��3 :
=
��; <
entityAddress
��= J
.
��J K
StateId
��K R
;
��R S
;
��T U
objUserAddress
��$ 2
.
��2 3
CityId
��3 9
=
��: ;
entityAddress
��< I
.
��I J
CityId
��J P
;
��P Q
objUserAddress
��$ 2
.
��2 3
PinNo
��3 8
=
��9 :
entityAddress
��; H
.
��H I
PinNo
��I N
;
��N O
objUserAddress
��$ 2
.
��2 3
Zone
��3 7
=
��8 9
entityAddress
��: G
.
��G H
Zone
��H L
;
��L M
objUserAddress
��$ 2
.
��2 3
Email
��3 8
=
��9 :
entityAddress
��; H
.
��H I
Email
��I N
;
��N O
objUserAddress
��$ 2
.
��2 3
AlternateEmail
��3 A
=
��B C
entityAddress
��D Q
.
��Q R
AlternateEmail
��R `
;
��` a
objUserAddress
��$ 2
.
��2 3
Phone
��3 8
=
��9 :
entityAddress
��; H
.
��H I
Phone
��I N
;
��N O
objUserAddress
��$ 2
.
��2 3
PhoneExt
��3 ;
=
��< =
entityAddress
��> K
.
��K L
PhoneExt
��L T
;
��T U
objUserAddress
��$ 2
.
��2 3
AlternatePhone
��3 A
=
��B C
entityAddress
��D Q
.
��Q R
AlternatePhone
��R `
;
��` a
objUserAddress
��$ 2
.
��2 3
AlternatePhoneExt
��3 D
=
��E F
entityAddress
��G T
.
��T U
AlternatePhoneExt
��U f
;
��f g
objUserAddress
��$ 2
.
��2 3
Landlinephone
��3 @
=
��A B
entityAddress
��C P
.
��P Q
Landlinephone
��Q ^
;
��^ _
objUserAddress
��$ 2
.
��2 3

ModifiedBy
��3 =
=
��> ?

entityUser
��@ J
.
��J K

ModifiedBy
��K U
;
��U V 
_addressRepository
��$ 6
.
��6 7
UpdateAsync
��7 B
(
��B C
objUserAddress
��C Q
)
��Q R
;
��R S
await
��$ )
_unitOfWork
��* 5
.
��5 6
SaveChangesAsync
��6 F
(
��F G
)
��G H
;
��H I
await
��$ )
_auditLogService
��* :
.
��: ;
CreateAuditLog
��; I
<
��I J
MasterAddress
��J W
>
��W X
(
��X Y!
AuditActionTypeEnum
��Y l
.
��l m
Update
��m s
,
��s t
	OldEntity
��u ~
,
��~ 
objUserAddress��� �
,��� �
MainTableName��� �
,��� �
MainTableKey��� �
)��� �
;��� �
}
��  !
}
�� 
else
��  
{
�� 
objUserAddress
��  .
=
��/ 0
_mapperFactory
��1 ?
.
��? @
Get
��@ C
<
��C D$
MasterUserAddressModel
��D Z
,
��Z [
MasterAddress
��\ i
>
��i j
(
��j k
address
��k r
)
��r s
;
��s t
objUserAddress
��  .
.
��. /
IsActive
��/ 7
=
��8 9
true
��: >
;
��> ?
objUserAddress
��  .
.
��. /

TableKeyId
��/ 9
=
��: ;
objUser
��< C
.
��C D
Id
��D F
;
��F G
objUserAddress
��  .
.
��. /
	TableName
��/ 8
=
��9 :
Enum
��; ?
.
��? @
GetName
��@ G
(
��G H
TableNameEnum
��H U
.
��U V
Master_User
��V a
)
��a b
;
��b c
objUserAddress
��  .
.
��. /
	CreatedBy
��/ 8
=
��9 :

entityUser
��; E
.
��E F
	CreatedBy
��F O
;
��O P 
_addressRepository
��  2
.
��2 3
AddAsync
��3 ;
(
��; <
objUserAddress
��< J
)
��J K
;
��K L
await
��  %
_unitOfWork
��& 1
.
��1 2
SaveChangesAsync
��2 B
(
��B C
)
��C D
;
��D E
}
�� 
}
�� 
if
�� 
(
�� 
allAddressId
�� (
!=
��) +
null
��, 0
&&
��1 3
allAddressId
��4 @
.
��@ A
Count
��A F
>
��G H
$num
��I J
)
��J K
{
�� 
foreach
�� #
(
��$ %
var
��% (
addId
��) .
in
��/ 1
allAddressId
��2 >
)
��> ?
{
�� 
var
��  #
	entityAdd
��$ -
=
��. / 
_addressRepository
��0 B
.
��B C
Get
��C F
(
��F G
x
��G H
=>
��I K
x
��L M
.
��M N
Id
��N P
==
��Q S
addId
��T Y
)
��Y Z
;
��Z [
if
��  "
(
��# $
	entityAdd
��$ -
!=
��. 0
null
��1 5
)
��5 6
{
��  ! 
_addressRepository
��$ 6
.
��6 7
Remove
��7 =
(
��= >
	entityAdd
��> G
)
��G H
;
��H I
}
��  !
}
�� 
await
�� !
_unitOfWork
��" -
.
��- .
SaveChangesAsync
��. >
(
��> ?
)
��? @
;
��@ A
}
�� 
}
�� 
if
�� 
(
�� 

entityUser
�� "
.
��" #
Qualifications
��# 1
.
��1 2
Count
��2 7
>
��8 9
$num
��: ;
)
��; <
{
�� 
var
�� 
entityContacts
�� *
=
��+ , 
_qualifyRepository
��- ?
.
��? @
GetAll
��@ F
(
��F G
)
��G H
.
��H I
Where
��I N
(
��N O
x
��O P
=>
��Q S
x
��T U
.
��U V

TableKeyId
��V `
==
��a c

entityUser
��d n
.
��n o
Id
��o q
&&
��r t
x
��u v
.
��v w
	TableName��w �
==��� �
$str��� �
&&��� �
(��� �
x��� �
.��� �
	IsDeleted��� �
==��� �
false��� �
||��� �
x��� �
.��� �
	IsDeleted��� �
==��� �
null��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
var
�� 
allContactId
�� (
=
��) *
entityContacts
��+ 9
.
��9 :
Count
��: ?
>
��@ A
$num
��B C
?
��D E
entityContacts
��F T
.
��T U
Select
��U [
(
��[ \
x
��\ ]
=>
��^ `
x
��a b
.
��b c
Id
��c e
)
��e f
.
��f g
OrderBy
��g n
(
��n o
Id
��o q
=>
��r t
Id
��u w
)
��w x
.
��x y
ToList
��y 
(�� �
)��� �
:��� �
null��� �
;��� �
foreach
�� 
(
��  !
var
��! $
qualify
��% ,
in
��- /

entityUser
��0 :
.
��: ;
Qualifications
��; I
)
��I J
{
�� 
var
�� 
Qlfc
��  $
=
��% &
qualify
��' .
;
��. /
if
�� 
(
��  
Qlfc
��  $
.
��$ %
Id
��% '
>
��( )
$num
��* +
)
��+ ,
{
�� 
if
��  "
(
��# $
allContactId
��$ 0
!=
��1 3
null
��4 8
&&
��9 ;
allContactId
��< H
.
��H I
Count
��I N
>
��O P
$num
��Q R
)
��R S
{
��  !
allContactId
��$ 0
.
��0 1
Remove
��1 7
(
��7 8
qualify
��8 ?
.
��? @
Id
��@ B
)
��B C
;
��C D
}
��  !
var
��  #
	OldEntity
��$ -
=
��. / 
_qualifyRepository
��0 B
.
��B C
GetNoTracking
��C P
(
��P Q
Qlfc
��Q U
.
��U V
Id
��V X
)
��X Y
;
��Y Z"
objUserQualification
��  4
=
��5 6 
_qualifyRepository
��7 I
.
��I J
Get
��J M
(
��M N
Qlfc
��N R
.
��R S
Id
��S U
)
��U V
;
��V W
if
��  "
(
��# $"
objUserQualification
��$ 8
!=
��9 ;
null
��< @
)
��@ A
{
��  !"
objUserQualification
��$ 8
.
��8 9
Qualification
��9 F
=
��G H
Qlfc
��I M
.
��M N
Qualification
��N [
;
��[ \"
objUserQualification
��$ 8
.
��8 9
Subject
��9 @
=
��A B
Qlfc
��C G
.
��G H
Subject
��H O
;
��O P"
objUserQualification
��$ 8
.
��8 9
	Institute
��9 B
=
��C D
Qlfc
��E I
.
��I J
	Institute
��J S
;
��S T"
objUserQualification
��$ 8
.
��8 9
Grade
��9 >
=
��? @
Qlfc
��A E
.
��E F
Grade
��F K
;
��K L"
objUserQualification
��$ 8
.
��8 9
YearOfInstitute
��9 H
=
��I J
Qlfc
��K O
.
��O P
YearOfInstitute
��P _
;
��_ `"
objUserQualification
��$ 8
.
��8 9

ModifiedBy
��9 C
=
��D E

entityUser
��F P
.
��P Q

ModifiedBy
��Q [
;
��[ \ 
_qualifyRepository
��$ 6
.
��6 7
UpdateAsync
��7 B
(
��B C"
objUserQualification
��C W
)
��W X
;
��X Y
await
��$ )
_unitOfWork
��* 5
.
��5 6
SaveChangesAsync
��6 F
(
��F G
)
��G H
;
��H I
await
��$ )
_auditLogService
��* :
.
��: ;
CreateAuditLog
��; I
<
��I J!
MasterQualification
��J ]
>
��] ^
(
��^ _!
AuditActionTypeEnum
��_ r
.
��r s
Update
��s y
,
��y z
	OldEntity��{ �
,��� �$
objUserQualification��� �
,��� �
MainTableName��� �
,��� �
MainTableKey��� �
)��� �
;��� �
}
��  !
}
�� 
else
��  
{
�� "
objUserQualification
��  4
=
��5 6
_mapperFactory
��7 E
.
��E F
Get
��F I
<
��I J'
Master_QualificationModel
��J c
,
��c d!
MasterQualification
��e x
>
��x y
(
��y z
qualify��z �
)��� �
;��� �"
objUserQualification
��  4
.
��4 5
IsActive
��5 =
=
��> ?
$num
��@ A
;
��A B"
objUserQualification
��  4
.
��4 5

TableKeyId
��5 ?
=
��@ A
objUser
��B I
.
��I J
Id
��J L
;
��L M"
objUserQualification
��  4
.
��4 5
	TableName
��5 >
=
��? @
Enum
��A E
.
��E F
GetName
��F M
(
��M N
TableNameEnum
��N [
.
��[ \
Master_User
��\ g
)
��g h
;
��h i"
objUserQualification
��  4
.
��4 5
	CreatedBy
��5 >
=
��? @

entityUser
��A K
.
��K L
	CreatedBy
��L U
;
��U V 
_qualifyRepository
��  2
.
��2 3
AddAsync
��3 ;
(
��; <"
objUserQualification
��< P
)
��P Q
;
��Q R
await
��  %
_unitOfWork
��& 1
.
��1 2
SaveChangesAsync
��2 B
(
��B C
)
��C D
;
��D E
}
�� 
}
�� 
if
�� 
(
�� 
allContactId
�� (
!=
��) +
null
��, 0
&&
��1 3
allContactId
��4 @
.
��@ A
Count
��A F
>
��G H
$num
��I J
)
��J K
{
�� 
foreach
�� #
(
��$ %
var
��% (
addId
��) .
in
��/ 1
allContactId
��2 >
)
��> ?
{
�� 
var
��  #
	entityAdd
��$ -
=
��. / 
_qualifyRepository
��0 B
.
��B C
Get
��C F
(
��F G
x
��G H
=>
��I K
x
��L M
.
��M N
Id
��N P
==
��Q S
addId
��T Y
)
��Y Z
;
��Z [
if
��  "
(
��# $
	entityAdd
��$ -
!=
��. 0
null
��1 5
)
��5 6
{
��  ! 
_qualifyRepository
��$ 6
.
��6 7
Remove
��7 =
(
��= >
	entityAdd
��> G
)
��G H
;
��H I
}
��  !
}
�� 
await
�� !
_unitOfWork
��" -
.
��- .
SaveChangesAsync
��. >
(
��> ?
)
��? @
;
��@ A
}
�� 
}
�� 
if
�� 
(
�� 

entityUser
�� "
.
��" #
uploadDocument
��# 1
!=
��2 4
null
��5 9
)
��9 :
{
�� 
foreach
�� 
(
��  !
var
��! $
doc
��% (
in
��) +

entityUser
��, 6
.
��6 7
uploadDocument
��7 E
)
��E F
{
�� 
objUserDocument
�� +
=
��, -
_mapperFactory
��. <
.
��< =
Get
��= @
<
��@ A!
MasterDocumentModel
��A T
,
��T U
MasterDocument
��V d
>
��d e
(
��e f
doc
��f i
)
��i j
;
��j k
objUserDocument
�� +
.
��+ ,
IsActive
��, 4
=
��5 6
doc
��7 :
.
��: ;
IsActive
��; C
;
��C D
objUserDocument
�� +
.
��+ ,

TableKeyId
��, 6
=
��7 8
objUser
��9 @
.
��@ A
Id
��A C
;
��C D
objUserDocument
�� +
.
��+ ,
	TableName
��, 5
=
��6 7
Enum
��8 <
.
��< =
GetName
��= D
(
��D E
TableNameEnum
��E R
.
��R S
Master_User
��S ^
)
��^ _
;
��_ `
objUserDocument
�� +
.
��+ ,
DocumentName
��, 8
=
��9 :
doc
��; >
.
��> ?
DocumentName
��? K
;
��K L
objUserDocument
�� +
.
��+ ,
FileName
��, 4
=
��5 6
doc
��7 :
.
��: ;
FileName
��; C
;
��C D
objUserDocument
�� +
.
��+ ,
FilePath
��, 4
=
��5 6
doc
��7 :
.
��: ;
FilePath
��; C
;
��C D
objUserDocument
�� +
.
��+ ,
FileType
��, 4
=
��5 6
doc
��7 :
.
��: ;
FileType
��; C
;
��C D
objUserDocument
�� +
.
��+ ,
	CreatedBy
��, 5
=
��6 7
doc
��8 ;
.
��; <
	CreatedBy
��< E
;
��E F!
_documentRepository
�� /
.
��/ 0
AddAsync
��0 8
(
��8 9
objUserDocument
��9 H
)
��H I
;
��I J
await
�� !
_unitOfWork
��" -
.
��- .
SaveChangesAsync
��. >
(
��> ?
)
��? @
;
��@ A
}
�� 
}
�� 
}
�� 
return
�� 
DBOperation
�� "
.
��" #
Success
��# *
;
��* +
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
throw
�� 
ex
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� %
MasterResourceTypeModel
�� 6
>
��6 7
>
��7 8!
GetResourceTypeList
��9 L
(
��L M
)
��M N
{
�� 	
var
�� 
lstStf
�� 
=
�� 
EltizamDBHelper
�� (
.
��( )!
ExecuteMappedReader
��) <
<
��< =%
MasterResourceTypeModel
��= T
>
��T U
(
��U V 
ProcedureMetastore
��V h
.
��h i'
usp_ResourceType_AllList��i �
,��� � 
DatabaseConnection
�� 
.
��  

ConnString
��  *
,
��* +
CommandType
��, 7
.
��7 8
StoredProcedure
��8 G
,
��G H
null
��I M
)
��M N
;
��N O
return
�� 
lstStf
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� &
MasterApproverLevelModel
�� 7
>
��7 8
>
��8 9"
GetApproverLevelList
��: N
(
��N O
)
��O P
{
�� 	
var
�� 
lstStf
�� 
=
�� 
_mapperFactory
�� '
.
��' (
GetList
��( /
<
��/ 01
#MasterValuationRequestApproverLevel
��0 S
,
��S T&
MasterApproverLevelModel
��U m
>
��m n
(
��n o'
_approverLevelRepository��o �
.��� �
GetAll��� �
(��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
)��� �
;��� �
return
�� 
lstStf
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� 
MasterRoleModel
�� .
>
��. /
>
��/ 0
GetRoleList
��1 <
(
��< =
)
��= >
{
�� 	
var
�� 
lId
�� 
=
�� 
_helper
�� 
.
�� 
GetLoggedInUser
�� -
(
��- .
)
��. /
?
��/ 0
.
��0 1
UserId
��1 7
;
��7 8
var
�� 
lstStf
�� 
=
�� 
EltizamDBHelper
�� (
.
��( )!
ExecuteMappedReader
��) <
<
��< =
MasterRoleModel
��= L
>
��L M
(
��M N 
ProcedureMetastore
��N `
.
��` a$
usp_Role_SearchAllList
��a w
,
��w x 
DatabaseConnection
�� 
.
��  

ConnString
��  *
,
��* +
CommandType
��, 7
.
��7 8
StoredProcedure
��8 G
,
��G H
null
��I M
)
��M N
;
��N O
return
�� 
lstStf
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
DBOperation
�� %
>
��% &
Delete
��' -
(
��- .
int
��. 1
id
��2 4
)
��4 5
{
�� 	
var
�� 

entityUser
�� 
=
�� 
_repository
�� (
.
��( )
Get
��) ,
(
��, -
x
��- .
=>
��/ 1
x
��2 3
.
��3 4
Id
��4 6
==
��7 9
id
��: <
)
��< =
;
��= >
if
�� 
(
�� 

entityUser
�� 
==
�� 
null
�� "
)
��" #
return
�� 
DBOperation
�� "
.
��" #
NotFound
��# +
;
��+ ,
else
�� 
{
�� 
var
�� 
entityLocation
�� "
=
��# $ 
_addressRepository
��% 7
.
��7 8
Get
��8 ;
(
��; <
x
��< =
=>
��> @
x
��A B
.
��B C

TableKeyId
��C M
==
��N P
id
��Q S
&&
��T V
x
��W X
.
��X Y
	TableName
��Y b
==
��c e
$str
��f s
)
��s t
;
��t u
if
�� 
(
�� 
entityLocation
�� "
!=
��# %
null
��& *
)
��* + 
_addressRepository
�� &
.
��& '
Remove
��' -
(
��- .
entityLocation
��. <
)
��< =
;
��= >
var
�� 
entityContact
�� !
=
��" #!
_documentRepository
��$ 7
.
��7 8
Get
��8 ;
(
��; <
x
��< =
=>
��> @
x
��A B
.
��B C

TableKeyId
��C M
==
��N P
id
��Q S
&&
��T V
x
��W X
.
��X Y
	TableName
��Y b
==
��c e
$str
��f s
)
��s t
;
��t u
if
�� 
(
�� 
entityContact
�� !
!=
��" $
null
��% )
)
��) *!
_documentRepository
�� '
.
��' (
Remove
��( .
(
��. /
entityContact
��/ <
)
��< =
;
��= >
_repository
�� 
.
�� 
Remove
�� "
(
��" #

entityUser
��# -
)
��- .
;
��. /
await
�� 
_unitOfWork
�� !
.
��! "
SaveChangesAsync
��" 2
(
��2 3
)
��3 4
;
��4 5
return
�� 
DBOperation
�� "
.
��" #
Success
��# *
;
��* +
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
DBOperation
�� %
>
��% &
ChangePassword
��' 5
(
��5 6!
ChangePasswordModel
��6 I

entityUser
��J T
)
��T U
{
�� 	
if
�� 
(
�� 

entityUser
�� 
.
�� 
UserId
�� !
>=
��" $
$num
��% &
&&
��' )

entityUser
��* 4
.
��4 5
NewPassword
��5 @
==
��A C

entityUser
��D N
.
��N O
ConfirmPassword
��O ^
)
��^ _
{
�� 

entityUser
�� 
.
�� 
NewPassword
�� &
=
��' (
Utility
��) 0
.
��0 1
Utility
��1 8
.
��8 9
UtilityHelper
��9 F
.
��F G"
GenerateSHA256String
��G [
(
��[ \

entityUser
��\ f
.
��f g
NewPassword
��g r
)
��r s
;
��s t

entityUser
�� 
.
�� 
ConfirmPassword
�� *
=
��+ ,

entityUser
��- 7
.
��7 8
NewPassword
��8 C
;
��C D
}
�� 

MasterUser
�� 
objUser
�� 
;
�� 
if
�� 
(
�� 

entityUser
�� 
.
�� 
UserId
�� !
>
��" #
$num
��$ %
)
��% &
{
�� 
objUser
�� 
=
�� 
_repository
�� %
.
��% &
Get
��& )
(
��) *

entityUser
��* 4
.
��4 5
UserId
��5 ;
)
��; <
;
��< =
var
�� 

OldObjUser
�� 
=
��  
objUser
��! (
;
��( )
if
�� 
(
�� 
objUser
�� 
!=
�� 
null
�� #
)
��# $
{
�� 
objUser
�� 
.
�� 
Password
�� $
=
��% &

entityUser
��' 1
.
��1 2
NewPassword
��2 =
;
��= >
objUser
�� 
.
�� 

ModifiedBy
�� &
=
��' (
_LoginUserId
��) 5
;
��5 6
objUser
�� 
.
�� 
ModifiedDate
�� (
=
��) *
AppConstants
��+ 7
.
��7 8
DateTime
��8 @
;
��@ A
_repository
�� 
.
��  
UpdateAsync
��  +
(
��+ ,
objUser
��, 3
)
��3 4
;
��4 5
await
�� 
_unitOfWork
�� %
.
��% &
SaveChangesAsync
��& 6
(
��6 7
)
��7 8
;
��8 9
}
�� 
else
�� 
{
�� 
return
�� 
DBOperation
�� &
.
��& '
NotFound
��' /
;
��/ 0
}
�� 
}
�� 
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� !
MasterUserListModel
�� 2
>
��2 3
>
��3 4
GetApproverList
��5 D
(
��D E
int
��E H
id
��I K
,
��K L
string
��M S
roleName
��T \
)
��\ ]
{
�� 	
DbParameter
�� 
[
�� 
]
�� 
osqlParameter1
�� (
=
��) *
{
�� 
new
�� 
DbParameter
��  
(
��  !
$str
��! )
,
��) *
id
��+ -
,
��- .
	SqlDbType
��/ 8
.
��8 9
Int
��9 <
)
��< =
,
��= >
new
�� 
DbParameter
��  
(
��  !
$str
��! +
,
��+ ,
roleName
��- 5
,
��5 6
	SqlDbType
��7 @
.
��@ A
VarChar
��A H
)
��H I
}
�� 
;
�� 
var
�� 
lstStf
�� 
=
�� 
EltizamDBHelper
�� (
.
��( )!
ExecuteMappedReader
��) <
<
��< =!
MasterUserListModel
��= P
>
��P Q
(
��Q R 
ProcedureMetastore
��R d
.
��d e"
usp_Approver_AllList
��e y
,
��y z 
DatabaseConnection
�� +
.
��+ ,

ConnString
��, 6
,
��6 7
CommandType
��8 C
.
��C D
StoredProcedure
��D S
,
��S T
osqlParameter1
��U c
)
��c d
;
��d e
return
�� 
lstStf
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
GlobalAuditFields
�� +
?
��+ ,
>
��, -"
GetGlobalAuditFields
��. B
(
��B C
int
��C F

TableKeyId
��G Q
,
��Q R
string
��S Y
	TableName
��Z c
)
��c d
{
�� 	
DbParameter
�� 
[
�� 
]
�� 
p1
�� 
=
�� 
{
�� 
new
�� 
DbParameter
��  
(
��  !
AppConstants
��! -
.
��- .

TableKeyId
��. 8
,
��8 9

TableKeyId
��: D
,
��D E
	SqlDbType
��F O
.
��O P
Int
��P S
)
��S T
,
��T U
new
�� 
DbParameter
��  
(
��  !
AppConstants
��! -
.
��- .
	TableName
��. 7
,
��7 8
	TableName
��9 B
,
��B C
	SqlDbType
��D M
.
��M N
VarChar
��N U
)
��U V
}
�� 
;
�� 
var
�� 
data
�� 
=
�� 
EltizamDBHelper
�� &
.
��& ''
ExecuteSingleMappedReader
��' @
<
��@ A
GlobalAuditFields
��A R
>
��R S
(
��S T 
ProcedureMetastore
��T f
.
��f g&
usp_GetPageFooterDetails
��g 
,�� � 
DatabaseConnection
�� )
.
��) *

ConnString
��* 4
,
��4 5
CommandType
��6 A
.
��A B
StoredProcedure
��B Q
,
��Q R
p1
��S U
)
��U V
;
��V W
data
�� 
.
�� 
	TableName
�� 
=
�� 
	TableName
�� &
;
��& '
return
�� 
data
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� 
MasterUserModel
�� .
>
��. /
>
��/ 0
GetAllUserList
��1 ?
(
��? @
)
��@ A
{
�� 	
var
�� 
lstStf
�� 
=
�� 
EltizamDBHelper
�� (
.
��( )!
ExecuteMappedReader
��) <
<
��< =
MasterUserModel
��= L
>
��L M
(
��M N 
ProcedureMetastore
��N `
.
��` a$
usp_User_SearchAllList
��a w
,
��w x 
DatabaseConnection
�� +
.
��+ ,

ConnString
��, 6
,
��6 7
CommandType
��8 C
.
��C D
StoredProcedure
��D S
,
��S T
null
��U Y
)
��Y Z
;
��Z [
return
�� 
lstStf
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
DBOperation
�� %
>
��% &
DeleteDocument
��' 5
(
��5 6
int
��6 9
id
��: <
)
��< =
{
�� 	
if
�� 
(
�� 
id
�� 
>
�� 
$num
�� 
)
�� 
{
�� 
var
�� 
	entityDoc
�� 
=
�� !
_documentRepository
��  3
.
��3 4
Get
��4 7
(
��7 8
id
��8 :
)
��: ;
;
��; <
if
�� 
(
�� 
	entityDoc
�� 
!=
��  
null
��! %
)
��% &
{
�� !
_documentRepository
�� '
.
��' (
Remove
��( .
(
��. /
	entityDoc
��/ 8
)
��8 9
;
��9 :
await
�� 
_unitOfWork
�� %
.
��% &
SaveChangesAsync
��& 6
(
��6 7
)
��7 8
;
��8 9
}
�� 
}
�� 
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� 
IsEmailExists
��  -
(
��- .
string
��. 4
email
��5 :
,
��: ;
int
��< ?
?
��? @
userId
��A G
)
��G H
{
�� 	
if
�� 
(
�� 
email
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
if
�� 
(
�� 
userId
�� 
==
�� 
null
�� "
||
��# %
userId
��& ,
==
��- /
$num
��0 1
)
��1 2
{
�� 
var
�� 
isExistWithEmail
�� (
=
��) *
_repository
��+ 6
.
��6 7
GetAll
��7 =
(
��= >
)
��> ?
.
�� 
Any
�� 
(
�� 
user
�� !
=>
��" $
user
��% )
.
��) *
Email
��* /
==
��0 2
email
��3 8
)
��8 9
;
��9 :
if
�� 
(
�� 
isExistWithEmail
�� (
)
��( )
{
�� 
return
�� 
true
�� #
;
��# $
}
�� 
}
�� 
else
�� 
{
�� 
var
�� 
isExistWithUserId
�� )
=
��* +
_repository
��, 7
.
��7 8
GetAll
��8 >
(
��> ?
)
��? @
.
�� 
Any
�� 
(
�� 
user
�� !
=>
��" $
user
��% )
.
��) *
Email
��* /
==
��0 2
email
��3 8
&&
��9 ;
user
��< @
.
��@ A
Id
��A C
!=
��D F
userId
��G M
)
��M N
;
��N O
if
�� 
(
�� 
isExistWithUserId
�� )
)
��) *
{
�� 
return
�� 
true
�� #
;
��# $
}
�� 
}
�� 
}
�� 
return
�� 
false
�� 
;
�� 
}
�� 	
}
�� 
}�� �u
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
IAuditLogService	##p �
auditLogService
##� �
)
##� �
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
.	>> �
StoredProcedure
>>� �
,
>>� �
osqlParameter
>>� �
)
>>� �
;
>>� �
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
ListRes	CCz �
)
CC� �
;
CC� �
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
id	JJ �
)
JJ� �
)
JJ� �
;
JJ� �
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
objValuationFees	ttu �
,
tt� �
MainTableName
tt� �
,
tt� �
MainTableKey
tt� �
)
tt� �
;
tt� �
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
��  
.
��  !
	CreatedBy
��! *
=
��+ ,!
entityValuationFees
��- @
.
��@ A
	CreatedBy
��A J
;
��J K
objValuationFees
��  
.
��  !
ModifiedDate
��! -
=
��. /
AppConstants
��0 <
.
��< =
DateTime
��= E
;
��E F
objValuationFees
��  
.
��  !
	CreatedBy
��! *
=
��+ ,!
entityValuationFees
��- @
.
��@ A
	CreatedBy
��A J
;
��J K
_repository
�� 
.
�� 
AddAsync
�� $
(
��$ %
objValuationFees
��% 5
)
��5 6
;
��6 7
}
�� 
await
�� 
_unitOfWork
�� 
.
�� 
SaveChangesAsync
�� .
(
��. /
)
��/ 0
;
��0 1
if
�� 
(
�� 
objValuationFees
��  
.
��  !
Id
��! #
==
��$ &
$num
��' (
)
��( )
return
�� 
DBOperation
�� "
.
��" #
Error
��# (
;
��( )
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
DBOperation
�� %
>
��% &
Delete
��' -
(
��- .
int
��. 1
id
��2 4
,
��4 5
int
��5 8
?
��8 9
by
��: <
)
��< =
{
�� 	
var
�� !
entityValuationFees
�� #
=
��$ %
_repository
��& 1
.
��1 2
Get
��2 5
(
��5 6
x
��6 7
=>
��8 :
x
��; <
.
��< =
Id
��= ?
==
��@ B
id
��C E
)
��E F
;
��F G!
entityValuationFees
�� 
.
��  

ModifiedBy
��  *
=
��+ ,
by
��- /
??
��0 2!
entityValuationFees
��3 F
.
��F G

ModifiedBy
��G Q
;
��Q R
if
�� 
(
�� !
entityValuationFees
�� #
==
��$ &
null
��' +
)
��+ ,
return
�� 
DBOperation
�� "
.
��" #
NotFound
��# +
;
��+ ,
_repository
�� 
.
�� 
Remove
�� 
(
�� !
entityValuationFees
�� 2
)
��2 3
;
��3 4
await
�� 
_unitOfWork
�� 
.
�� 
SaveChangesAsync
�� .
(
��. /
)
��/ 0
;
��0 1
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
}
�� 
}�� �\
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
.	33 �0
"usp_ValuationFeeType_SearchAllList
33� �
,
33� �
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
lstStf	88z �
)
88� �
;
88� �
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
;	?? �
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
.	DD �
GetAsync
DD� �
(
DD� �
id
DD� �
)
DD� �
)
DD� �
;
DD� �
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
entityValuationFeeType	``n �
)
``� �
;
``� �
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
} ��
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
"usp_Address_GetAddressByTableKeyId	]]j �
,
]]� � 
DatabaseConnection
]]� �
.
]]� �

ConnString
]]� �
,
]]� �
System
]]� �
.
]]� �
Data
]]� �
.
]]� �
CommandType
]]� �
.
]]� �
StoredProcedure
]]� �
,
]]� �
osqlParameter
]]� �
)
]]� �
;
]]� �
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
"usp_Contact_GetContactByTableKeyId	kkj �
,
kk� � 
DatabaseConnection
kk� �
.
kk� �

ConnString
kk� �
,
kk� �
System
kk� �
.
kk� �
Data
kk� �
.
kk� �
CommandType
kk� �
.
kk� �
StoredProcedure
kk� �
,
kk� �
osqlParameter1
kk� �
)
kk� �
;
kk� �
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
�� 
async
�� 
Task
�� 
<
�� $
DataTableResponseModel
�� 0
>
��0 1
GetAll
��2 8
(
��8 9$
DataTableAjaxPostModel
��9 O
model
��P U
)
��U V
{
�� 	
string
�� 

ColumnName
�� 
=
�� 
(
��  !
model
��! &
.
��& '
order
��' ,
.
��, -
Count
��- 2
>
��3 4
$num
��5 6
?
��7 8
model
��9 >
.
��> ?
columns
��? F
[
��F G
model
��G L
.
��L M
order
��M R
[
��R S
$num
��S T
]
��T U
.
��U V
column
��V \
]
��\ ]
.
��] ^
data
��^ b
:
��c d
string
��e k
.
��k l
Empty
��l q
)
��q r
;
��r s
string
�� 
SortDir
�� 
=
�� 
(
�� 
model
�� #
.
��# $
order
��$ )
.
��) *
Count
��* /
>
��0 1
$num
��2 3
?
��4 5
model
��6 ;
.
��; <
order
��< A
[
��A B
$num
��B C
]
��C D
.
��D E
dir
��E H
:
��I J
string
��K Q
.
��Q R
Empty
��R W
)
��W X
;
��X Y
SqlParameter
�� 
[
�� 
]
�� 
osqlParameter
�� (
=
��) *
{
�� 
new
�� 
SqlParameter
��  
(
��  !
AppConstants
��! -
.
��- .!
P_CurrentPageNumber
��. A
,
��A B
model
��D I
.
��I J
start
��J O
)
��O P
,
��P Q
new
�� 
SqlParameter
��  
(
��  !
AppConstants
��! -
.
��- .

P_PageSize
��. 8
,
��8 9
model
��D I
.
��I J
length
��J P
)
��P Q
,
��Q R
new
�� 
SqlParameter
��  
(
��  !
AppConstants
��! -
.
��- .
P_SortColumn
��. :
,
��: ;

ColumnName
��D N
)
��N O
,
��O P
new
�� 
SqlParameter
��  
(
��  !
AppConstants
��! -
.
��- .
P_SortDirection
��. =
,
��= >
SortDir
��D K
)
��K L
,
��L M
new
�� 
SqlParameter
��  
(
��  !
AppConstants
��! -
.
��- .
P_SearchText
��. :
,
��: ;
model
��D I
.
��I J
search
��J P
?
��P Q
.
��Q R
value
��R W
)
��W X
}
�� 
;
�� 
var
�� 
Results
�� 
=
�� 
await
�� 
_repository
��  +
.
��+ ,
GetBySP
��, 3
(
��3 4 
ProcedureMetastore
��4 F
.
��F G-
usp_Vendor_Search_GetVendorList
��G f
,
��f g
CommandType
��h s
.
��s t
StoredProcedure��t �
,��� �
osqlParameter��� �
)��� �
;��� �
var
�� 
res
�� 
=
�� 
UtilityHelper
�� #
.
��# $
GetPaginationInfo
��$ 5
(
��5 6
Results
��6 =
)
��= >
;
��> ?$
DataTableResponseModel
�� "%
oDataTableResponseModel
��# :
=
��; <
new
��= @$
DataTableResponseModel
��A W
(
��W X
model
��X ]
.
��] ^
draw
��^ b
,
��b c
res
��d g
.
��g h
Item1
��h m
,
��m n
res
��o r
.
��r s
Item1
��s x
,
��x y
Results��z �
.��� �
DataTableToList��� �
<��� �
VendorListModel��� �
>��� �
(��� �
)��� �
)��� �
;��� �
return
�� %
oDataTableResponseModel
�� *
;
��* +
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
DBOperation
�� %
>
��% &#
AddUpdateMasterVendor
��' <
(
��< =
MasterVendorModel
��= N 
masterVendortModel
��O a
)
��a b
{
�� 	
MasterVendor
�� 
	objVendor
�� "
;
��" #
MasterAddress
�� 

objAddress
�� $
;
��$ %
MasterContact
�� 

objContact
�� $
;
��$ %
MasterDocument
�� 
objUserDocument
�� *
;
��* +
string
�� 
MainTableName
��  
=
��! "
Enum
��# '
.
��' (
GetName
��( /
(
��/ 0
TableNameEnum
��0 =
.
��= >
Master_Vendor
��> K
)
��K L
;
��L M
int
�� 
MainTableKey
�� 
=
��  
masterVendortModel
�� 1
.
��1 2
Id
��2 4
;
��4 5
if
�� 
(
��  
masterVendortModel
�� "
.
��" #
Id
��# %
>
��& '
$num
��( )
)
��) *
{
�� 
MasterVendor
�� 
	OldEntity
�� &
=
��' (
null
��) -
;
��- .
	OldEntity
�� 
=
�� 
_repository
�� '
.
��' (
GetNoTracking
��( 5
(
��5 6 
masterVendortModel
��6 H
.
��H I
Id
��I K
)
��K L
;
��L M
	objVendor
�� 
=
�� 
_repository
�� '
.
��' (
Get
��( +
(
��+ , 
masterVendortModel
��, >
.
��> ?
Id
��? A
)
��A B
;
��B C
if
�� 
(
�� 
	objVendor
�� 
!=
��  
null
��! %
)
��% &
{
�� 
	objVendor
�� 
=
�� 
_mapperFactory
��  .
.
��. /
Get
��/ 2
<
��2 3
MasterVendorModel
��3 D
,
��D E
MasterVendor
��F R
>
��R S
(
��S T 
masterVendortModel
��T f
)
��f g
;
��g h
	objVendor
�� 
.
�� 

VendorName
�� (
=
��) * 
masterVendortModel
��+ =
.
��= >

VendorName
��> H
;
��H I
	objVendor
�� 
.
�� 
CompanyName
�� )
=
��* + 
masterVendortModel
��, >
.
��> ?
CompanyName
��? J
;
��J K
	objVendor
�� 
.
�� 
EstimattionDate
�� -
=
��. / 
masterVendortModel
��0 B
.
��B C
EstimattionDate
��C R
;
��R S
	objVendor
�� 
.
�� 
BusinessType
�� *
=
��+ , 
masterVendortModel
��- ?
.
��? @
BusinessType
��@ L
;
��L M
	objVendor
�� 
.
��  
CompanyDescription
�� 0
=
��1 2 
masterVendortModel
��3 E
.
��E F 
CompanyDescription
��F X
;
��X Y
	objVendor
�� 
.
�� 
Status
�� $
=
��% & 
masterVendortModel
��' 9
.
��9 :
Status
��: @
;
��@ A
	objVendor
�� 
.
�� 

ModifiedBy
�� (
=
��) * 
masterVendortModel
��+ =
.
��= >

ModifiedBy
��> H
;
��H I
_repository
�� 
.
��  
UpdateAsync
��  +
(
��+ ,
	objVendor
��, 5
)
��5 6
;
��6 7
await
�� 
_unitOfWork
�� %
.
��% &
SaveChangesAsync
��& 6
(
��6 7
)
��7 8
;
��8 9
await
�� 
_auditLogService
�� *
.
��* +
CreateAuditLog
��+ 9
<
��9 :
MasterVendor
��: F
>
��F G
(
��G H!
AuditActionTypeEnum
��H [
.
��[ \
Update
��\ b
,
��b c
	OldEntity
��d m
,
��m n
	objVendor
��o x
,
��x y
MainTableName��z �
,��� �
MainTableKey��� �
)��� �
;��� �
}
�� 
else
�� 
{
�� 
return
�� 
DBOperation
�� &
.
��& '
NotFound
��' /
;
��/ 0
}
�� 
}
�� 
else
�� 
{
�� 
	objVendor
�� 
=
�� 
_mapperFactory
�� *
.
��* +
Get
��+ .
<
��. /
MasterVendorModel
��/ @
,
��@ A
MasterVendor
��B N
>
��N O
(
��O P 
masterVendortModel
��P b
)
��b c
;
��c d
	objVendor
�� 
.
�� 
CreatedDate
�� %
=
��& '
AppConstants
��( 4
.
��4 5
DateTime
��5 =
;
��= >
	objVendor
�� 
.
�� 
	CreatedBy
�� #
=
��$ % 
masterVendortModel
��& 8
.
��8 9
	CreatedBy
��9 B
;
��B C
_repository
�� 
.
�� 
AddAsync
�� $
(
��$ %
	objVendor
��% .
)
��. /
;
��/ 0
await
�� 
_unitOfWork
�� !
.
��! "
SaveChangesAsync
��" 2
(
��2 3
)
��3 4
;
��4 5
}
�� 
if
�� 
(
�� 
	objVendor
�� 
.
�� 
Id
�� 
==
�� 
$num
��  !
)
��! "
return
�� 
DBOperation
�� "
.
��" #
Error
��# (
;
��( )
else
�� 
{
�� 
if
�� 
(
��  
masterVendortModel
�� &
.
��& '
uploadProfile
��' 4
!=
��5 7
null
��8 <
)
��< =
{
�� 
objUserDocument
�� #
=
��$ %
_mapperFactory
��& 4
.
��4 5
Get
��5 8
<
��8 9!
MasterDocumentModel
��9 L
,
��L M
MasterDocument
��N \
>
��\ ]
(
��] ^ 
masterVendortModel
��^ p
.
��p q
uploadProfile
��q ~
)
��~ 
;�� �
objUserDocument
�� #
.
��# $
IsActive
��$ ,
=
��- . 
masterVendortModel
��/ A
.
��A B
uploadProfile
��B O
.
��O P
IsActive
��P X
;
��X Y
objUserDocument
�� #
.
��# $

TableKeyId
��$ .
=
��/ 0
	objVendor
��1 :
.
��: ;
Id
��; =
;
��= >
objUserDocument
�� #
.
��# $
	TableName
��$ -
=
��. /
$str
��0 ?
;
��? @
objUserDocument
�� #
.
��# $
DocumentName
��$ 0
=
��1 2 
masterVendortModel
��3 E
.
��E F
uploadProfile
��F S
.
��S T
DocumentName
��T `
;
��` a
objUserDocument
�� #
.
��# $
FileName
��$ ,
=
��- . 
masterVendortModel
��/ A
.
��A B
uploadProfile
��B O
.
��O P
FileName
��P X
;
��X Y
objUserDocument
�� #
.
��# $
FilePath
��$ ,
=
��- . 
masterVendortModel
��/ A
.
��A B
uploadProfile
��B O
.
��O P
FilePath
��P X
;
��X Y
objUserDocument
�� #
.
��# $
FileType
��$ ,
=
��- . 
masterVendortModel
��/ A
.
��A B
uploadProfile
��B O
.
��O P
FileType
��P X
;
��X Y
objUserDocument
�� #
.
��# $
	CreatedBy
��$ -
=
��. / 
masterVendortModel
��0 B
.
��B C
uploadProfile
��C P
.
��P Q
	CreatedBy
��Q Z
;
��Z [!
_documentRepository
�� '
.
��' (
AddAsync
��( 0
(
��0 1
objUserDocument
��1 @
)
��@ A
;
��A B
await
�� 
_unitOfWork
�� %
.
��% &
SaveChangesAsync
��& 6
(
��6 7
)
��7 8
;
��8 9
var
�� 
user
�� 
=
�� 
_repository
�� *
.
��* +
Get
��+ .
(
��. /
	objVendor
��/ 8
.
��8 9
Id
��9 ;
)
��; <
;
��< =
user
�� 
.
�� !
ProfileAttachmentId
�� ,
=
��- .
objUserDocument
��/ >
.
��> ?
Id
��? A
;
��A B
_repository
�� 
.
��  
UpdateAsync
��  +
(
��+ ,
user
��, 0
)
��0 1
;
��1 2
await
�� 
_unitOfWork
�� %
.
��% &
SaveChangesAsync
��& 6
(
��6 7
)
��7 8
;
��8 9
}
�� 
if
�� 
(
��  
masterVendortModel
�� &
.
��& '
	Addresses
��' 0
.
��0 1
Count
��1 6
>
��7 8
$num
��9 :
)
��: ;
{
�� 
var
�� 
entityAddressess
�� (
=
��) * 
_repositoryAddress
��+ =
.
��= >
GetAll
��> D
(
��D E
)
��E F
.
��F G
Where
��G L
(
��L M
x
��M N
=>
��O Q
x
��R S
.
��S T

TableKeyId
��T ^
==
��_ a 
masterVendortModel
��b t
.
��t u
Id
��u w
&&
��x z
x
��{ |
.
��| }
	TableName��} �
==��� �
$str��� �
&&��� �
(��� �
x��� �
.��� �
	IsDeleted��� �
==��� �
false��� �
||��� �
x��� �
.��� �
	IsDeleted��� �
==��� �
null��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
var
�� 
allAddressId
�� $
=
��% &
entityAddressess
��' 7
.
��7 8
Count
��8 =
>
��> ?
$num
��@ A
?
��B C
entityAddressess
��D T
.
��T U
Select
��U [
(
��[ \
x
��\ ]
=>
��^ `
x
��a b
.
��b c
Id
��c e
)
��e f
.
��f g
OrderBy
��g n
(
��n o
Id
��o q
=>
��r t
Id
��u w
)
��w x
.
��x y
ToList
��y 
(�� �
)��� �
:��� �
null��� �
;��� �
foreach
�� 
(
�� 
var
��  
address
��! (
in
��) + 
masterVendortModel
��, >
.
��> ?
	Addresses
��? H
)
��H I
{
�� 
if
�� 
(
�� 
address
�� #
.
��# $
Id
��$ &
>
��' (
$num
��) *
)
��* +
{
�� 
if
�� 
(
��  
allAddressId
��  ,
!=
��- /
null
��0 4
&&
��5 7
allAddressId
��8 D
.
��D E
Count
��E J
>
��K L
$num
��M N
)
��N O
{
�� 
allAddressId
��  ,
.
��, -
Remove
��- 3
(
��3 4
address
��4 ;
.
��; <
Id
��< >
)
��> ?
;
��? @
}
�� 
var
�� 
	OldEntity
��  )
=
��* + 
_repositoryAddress
��, >
.
��> ?
GetNoTracking
��? L
(
��L M
address
��M T
.
��T U
Id
��U W
)
��W X
;
��X Y

objAddress
�� &
=
��' ( 
_repositoryAddress
��) ;
.
��; <
Get
��< ?
(
��? @
address
��@ G
.
��G H
Id
��H J
)
��J K
;
��K L
if
�� 
(
��  

objAddress
��  *
!=
��+ -
null
��. 2
)
��2 3
{
�� 
var
��  #
entityAddress
��$ 1
=
��2 3
_mapperFactory
��4 B
.
��B C
Get
��C F
<
��F G!
MasterAddressEntity
��G Z
,
��Z [
MasterAddress
��\ i
>
��i j
(
��j k
address
��k r
)
��r s
;
��s t

objAddress
��  *
.
��* +
Address1
��+ 3
=
��4 5
entityAddress
��6 C
.
��C D
Address1
��D L
;
��L M

objAddress
��  *
.
��* +
Address1
��+ 3
=
��4 5
entityAddress
��6 C
.
��C D
Address1
��D L
;
��L M

objAddress
��  *
.
��* +
Address2
��+ 3
=
��4 5
entityAddress
��6 C
.
��C D
Address2
��D L
;
��L M

objAddress
��  *
.
��* +
Address3
��+ 3
=
��4 5
entityAddress
��6 C
.
��C D
Address3
��D L
;
��L M

objAddress
��  *
.
��* +
Landmark
��+ 3
=
��4 5
entityAddress
��6 C
.
��C D
Landmark
��D L
;
��L M

objAddress
��  *
.
��* +
	CountryId
��+ 4
=
��5 6
entityAddress
��7 D
.
��D E
	CountryId
��E N
;
��N O

objAddress
��  *
.
��* +
StateId
��+ 2
=
��3 4
entityAddress
��5 B
.
��B C
StateId
��C J
;
��J K

objAddress
��  *
.
��* +
CityId
��+ 1
=
��2 3
entityAddress
��4 A
.
��A B
CityId
��B H
;
��H I

objAddress
��  *
.
��* +
PinNo
��+ 0
=
��1 2
entityAddress
��3 @
.
��@ A
PinNo
��A F
;
��F G

objAddress
��  *
.
��* +
Zone
��+ /
=
��0 1
entityAddress
��2 ?
.
��? @
Zone
��@ D
;
��D E

objAddress
��  *
.
��* +
Email
��+ 0
=
��1 2
entityAddress
��3 @
.
��@ A
Email
��A F
;
��F G

objAddress
��  *
.
��* +
AlternateEmail
��+ 9
=
��: ;
entityAddress
��< I
.
��I J
AlternateEmail
��J X
;
��X Y

objAddress
��  *
.
��* +
PhoneExt
��+ 3
=
��4 5
entityAddress
��6 C
.
��C D
PhoneExt
��D L
;
��L M

objAddress
��  *
.
��* +
Phone
��+ 0
=
��1 2
entityAddress
��3 @
.
��@ A
Phone
��A F
;
��F G

objAddress
��  *
.
��* +
AlternatePhone
��+ 9
=
��: ;
entityAddress
��< I
.
��I J
AlternatePhone
��J X
;
��X Y

objAddress
��  *
.
��* +
AlternatePhoneExt
��+ <
=
��= >
entityAddress
��? L
.
��L M
AlternatePhoneExt
��M ^
;
��^ _

objAddress
��  *
.
��* +
Landlinephone
��+ 8
=
��9 :
entityAddress
��; H
.
��H I
Landlinephone
��I V
;
��V W

objAddress
��  *
.
��* +

ModifiedBy
��+ 5
=
��6 7 
masterVendortModel
��8 J
.
��J K

ModifiedBy
��K U
;
��U V 
_repositoryAddress
��  2
.
��2 3
UpdateAsync
��3 >
(
��> ?

objAddress
��? I
)
��I J
;
��J K
await
��  %
_unitOfWork
��& 1
.
��1 2
SaveChangesAsync
��2 B
(
��B C
)
��C D
;
��D E
await
��  %
_auditLogService
��& 6
.
��6 7
CreateAuditLog
��7 E
<
��E F
MasterAddress
��F S
>
��S T
(
��T U!
AuditActionTypeEnum
��U h
.
��h i
Update
��i o
,
��o p
	OldEntity
��q z
,
��z {

objAddress��| �
,��� �
MainTableName��� �
,��� �
MainTableKey��� �
)��� �
;��� �
}
�� 
}
�� 
else
�� 
{
�� 

objAddress
�� &
=
��' (
_mapperFactory
��) 7
.
��7 8
Get
��8 ;
<
��; <!
MasterAddressEntity
��< O
,
��O P
MasterAddress
��Q ^
>
��^ _
(
��_ `
address
��` g
)
��g h
;
��h i

objAddress
�� &
.
��& '

TableKeyId
��' 1
=
��2 3
	objVendor
��4 =
.
��= >
Id
��> @
;
��@ A

objAddress
�� &
.
��& '
	TableName
��' 0
=
��1 2
$str
��3 B
;
��B C

objAddress
�� &
.
��& '
	CreatedBy
��' 0
=
��1 2 
masterVendortModel
��3 E
.
��E F
	CreatedBy
��F O
;
��O P

objAddress
�� &
.
��& '
IsActive
��' /
=
��0 1
true
��2 6
;
��6 7 
_repositoryAddress
�� .
.
��. /
AddAsync
��/ 7
(
��7 8

objAddress
��8 B
)
��B C
;
��C D
await
�� !
_unitOfWork
��" -
.
��- .
SaveChangesAsync
��. >
(
��> ?
)
��? @
;
��@ A
}
�� 
}
�� 
if
�� 
(
�� 
allAddressId
�� $
!=
��% '
null
��( ,
&&
��- /
allAddressId
��0 <
.
��< =
Count
��= B
>
��C D
$num
��E F
)
��F G
{
�� 
foreach
�� 
(
��  !
var
��! $
addId
��% *
in
��+ -
allAddressId
��. :
)
��: ;
{
�� 
var
�� 
	entityAdd
��  )
=
��* + 
_repositoryAddress
��, >
.
��> ?
Get
��? B
(
��B C
x
��C D
=>
��E G
x
��H I
.
��I J
Id
��J L
==
��M O
addId
��P U
)
��U V
;
��V W
if
�� 
(
��  
	entityAdd
��  )
!=
��* ,
null
��- 1
)
��1 2
{
��  
_repositoryAddress
��  2
.
��2 3
Remove
��3 9
(
��9 :
	entityAdd
��: C
)
��C D
;
��D E
}
�� 
}
�� 
await
�� 
_unitOfWork
�� )
.
��) *
SaveChangesAsync
��* :
(
��: ;
)
��; <
;
��< =
}
�� 
}
�� 
if
�� 
(
��  
masterVendortModel
�� &
.
��& '
Contacts
��' /
.
��/ 0
Count
��0 5
>
��6 7
$num
��8 9
)
��9 :
{
�� 
var
�� 
entityContacts
�� &
=
��' ( 
_repositoryContact
��) ;
.
��; <
GetAll
��< B
(
��B C
)
��C D
.
��D E
Where
��E J
(
��J K
x
��K L
=>
��M O
x
��P Q
.
��Q R

TableKeyId
��R \
==
��] _ 
masterVendortModel
��` r
.
��r s
Id
��s u
&&
��v x
x
��y z
.
��z {
	TableName��{ �
==��� �
$str��� �
&&��� �
(��� �
x��� �
.��� �
	IsDeleted��� �
==��� �
false��� �
||��� �
x��� �
.��� �
	IsDeleted��� �
==��� �
null��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
var
�� 
allContactId
�� $
=
��% &
entityContacts
��' 5
.
��5 6
Count
��6 ;
>
��< =
$num
��> ?
?
��@ A
entityContacts
��B P
.
��P Q
Select
��Q W
(
��W X
x
��X Y
=>
��Z \
x
��] ^
.
��^ _
Id
��_ a
)
��a b
.
��b c
OrderBy
��c j
(
��j k
Id
��k m
=>
��n p
Id
��q s
)
��s t
.
��t u
ToList
��u {
(
��{ |
)
��| }
:
��~ 
null��� �
;��� �
foreach
�� 
(
�� 
var
��  
contact
��! (
in
��) + 
masterVendortModel
��, >
.
��> ?
Contacts
��? G
)
��G H
{
�� 
if
�� 
(
�� 
contact
�� #
.
��# $
Id
��$ &
>
��' (
$num
��) *
)
��* +
{
�� 
if
�� 
(
��  
allContactId
��  ,
!=
��- /
null
��0 4
&&
��5 7
allContactId
��8 D
.
��D E
Count
��E J
>
��K L
$num
��M N
)
��N O
{
�� 
allContactId
��  ,
.
��, -
Remove
��- 3
(
��3 4
contact
��4 ;
.
��; <
Id
��< >
)
��> ?
;
��? @
}
�� 
var
�� 
	OldEntity
��  )
=
��* + 
_repositoryContact
��, >
.
��> ?
GetNoTracking
��? L
(
��L M
contact
��M T
.
��T U
Id
��U W
)
��W X
;
��X Y

objContact
�� &
=
��' ( 
_repositoryContact
��) ;
.
��; <
Get
��< ?
(
��? @
contact
��@ G
.
��G H
Id
��H J
)
��J K
;
��K L
if
�� 
(
��  

objContact
��  *
!=
��+ -
null
��. 2
)
��2 3
{
�� 
var
��  #
entityAddress
��$ 1
=
��2 3
_mapperFactory
��4 B
.
��B C
Get
��C F
<
��F G 
MasterContactModel
��G Y
,
��Y Z
MasterContact
��[ h
>
��h i
(
��i j
contact
��j q
)
��q r
;
��r s

objContact
��  *
.
��* +
ContactPersonName
��+ <
=
��= >
entityAddress
��? L
.
��L M
ContactPersonName
��M ^
;
��^ _

objContact
��  *
.
��* +
DepartmentId
��+ 7
=
��8 9
entityAddress
��: G
.
��G H
DepartmentId
��H T
;
��T U

objContact
��  *
.
��* +
DesignationId
��+ 8
=
��9 :
entityAddress
��; H
.
��H I
DesignationId
��I V
;
��V W

objContact
��  *
.
��* +
Email
��+ 0
=
��1 2
entityAddress
��3 @
.
��@ A
Email
��A F
;
��F G

objContact
��  *
.
��* +
	MobileExt
��+ 4
=
��5 6
entityAddress
��7 D
.
��D E
	MobileExt
��E N
;
��N O

objContact
��  *
.
��* +
Mobile
��+ 1
=
��2 3
entityAddress
��4 A
.
��A B
Mobile
��B H
;
��H I

objContact
��  *
.
��* +

ModifiedBy
��+ 5
=
��6 7 
masterVendortModel
��8 J
.
��J K

ModifiedBy
��K U
;
��U V 
_repositoryContact
��  2
.
��2 3
UpdateAsync
��3 >
(
��> ?

objContact
��? I
)
��I J
;
��J K
await
��  %
_unitOfWork
��& 1
.
��1 2
SaveChangesAsync
��2 B
(
��B C
)
��C D
;
��D E
await
��  %
_auditLogService
��& 6
.
��6 7
CreateAuditLog
��7 E
<
��E F
MasterContact
��F S
>
��S T
(
��T U!
AuditActionTypeEnum
��U h
.
��h i
Update
��i o
,
��o p
	OldEntity
��q z
,
��z {

objContact��| �
,��� �
MainTableName��� �
,��� �
MainTableKey��� �
)��� �
;��� �
}
�� 
}
�� 
else
�� 
{
�� 

objContact
�� &
=
��' (
_mapperFactory
��) 7
.
��7 8
Get
��8 ;
<
��; < 
MasterContactModel
��< N
,
��N O
MasterContact
��P ]
>
��] ^
(
��^ _
contact
��_ f
)
��f g
;
��g h

objContact
�� &
.
��& '
CreatedDate
��' 2
=
��3 4
AppConstants
��5 A
.
��A B
DateTime
��B J
;
��J K

objContact
�� &
.
��& '

TableKeyId
��' 1
=
��2 3
	objVendor
��4 =
.
��= >
Id
��> @
;
��@ A

objContact
�� &
.
��& '
	TableName
��' 0
=
��1 2
$str
��3 B
;
��B C

objContact
�� &
.
��& '

ModifiedBy
��' 1
=
��2 3 
masterVendortModel
��4 F
.
��F G
	CreatedBy
��G P
;
��P Q

objContact
�� &
.
��& '
Status
��' -
=
��. /
$num
��0 1
;
��1 2 
_repositoryContact
�� .
.
��. /
AddAsync
��/ 7
(
��7 8

objContact
��8 B
)
��B C
;
��C D
await
�� !
_unitOfWork
��" -
.
��- .
SaveChangesAsync
��. >
(
��> ?
)
��? @
;
��@ A
}
�� 
}
�� 
if
�� 
(
�� 
allContactId
�� $
!=
��% '
null
��( ,
&&
��- /
allContactId
��0 <
.
��< =
Count
��= B
>
��C D
$num
��E F
)
��F G
{
�� 
foreach
�� 
(
��  !
var
��! $
addId
��% *
in
��+ -
allContactId
��. :
)
��: ;
{
�� 
var
�� 
	entityAdd
��  )
=
��* + 
_repositoryContact
��, >
.
��> ?
Get
��? B
(
��B C
x
��C D
=>
��E G
x
��H I
.
��I J
Id
��J L
==
��M O
addId
��P U
)
��U V
;
��V W
if
�� 
(
��  
	entityAdd
��  )
!=
��* ,
null
��- 1
)
��1 2
{
��  
_repositoryContact
��  2
.
��2 3
Remove
��3 9
(
��9 :
	entityAdd
��: C
)
��C D
;
��D E
}
�� 
}
�� 
await
�� 
_unitOfWork
�� )
.
��) *
SaveChangesAsync
��* :
(
��: ;
)
��; <
;
��< =
}
�� 
}
�� 
}
�� 
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
DBOperation
�� %
>
��% &
DeleteVendor
��' 3
(
��3 4
int
��4 7
id
��8 :
,
��: ;
int
��; >
?
��> ?
by
��@ B
)
��B C
{
�� 	
var
�� 

entityUser
�� 
=
�� 
_repository
�� (
.
��( )
Get
��) ,
(
��, -
x
��- .
=>
��/ 1
x
��2 3
.
��3 4
Id
��4 6
==
��7 9
id
��: <
)
��< =
;
��= >

entityUser
�� 
.
�� 

ModifiedBy
�� !
=
��" #
by
��$ &
??
��' )

entityUser
��* 4
.
��4 5

ModifiedBy
��5 ?
;
��? @
if
�� 
(
�� 

entityUser
�� 
==
�� 
null
�� "
)
��" #
return
�� 
DBOperation
�� "
.
��" #
NotFound
��# +
;
��+ ,
else
�� 
{
�� 
var
�� 
entityLocation
�� "
=
��# $ 
_repositoryAddress
��% 7
.
��7 8
GetAll
��8 >
(
��> ?
)
��? @
.
��@ A
Where
��A F
(
��F G
x
��G H
=>
��I K
x
��L M
.
��M N

TableKeyId
��N X
==
��Y [
id
��\ ^
&&
��_ a
x
��b c
.
��c d
	TableName
��d m
==
��n p
$str��q �
)��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
if
�� 
(
�� 
entityLocation
�� "
.
��" #
Count
��# (
>
��) *
$num
��+ ,
)
��, -
{
�� 
foreach
�� 
(
�� 
var
��  
addrs
��! &
in
��' )
entityLocation
��* 8
)
��8 9
{
��  
_repositoryAddress
�� *
.
��* +
Remove
��+ 1
(
��1 2
addrs
��2 7
)
��7 8
;
��8 9
}
�� 
}
�� 
var
�� 
entityContact
�� !
=
��" # 
_repositoryContact
��$ 6
.
��6 7
GetAll
��7 =
(
��= >
)
��> ?
.
��? @
Where
��@ E
(
��E F
x
��F G
=>
��H J
x
��K L
.
��L M

TableKeyId
��M W
==
��X Z
id
��[ ]
&&
��^ `
x
��a b
.
��b c
	TableName
��c l
==
��m o
$str
��p 
)�� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
if
�� 
(
�� 
entityContact
�� !
.
��! "
Count
��" '
>
��( )
$num
��* +
)
��+ ,
{
�� 
foreach
�� 
(
�� 
var
��  
contct
��! '
in
��( *
entityContact
��+ 8
)
��8 9
{
��  
_repositoryContact
�� *
.
��* +
Remove
��+ 1
(
��1 2
contct
��2 8
)
��8 9
;
��9 :
}
�� 
}
�� 
_repository
�� 
.
�� 
Remove
�� "
(
��" #

entityUser
��# -
)
��- .
;
��. /
await
�� 
_unitOfWork
�� !
.
��! "
SaveChangesAsync
��" 2
(
��2 3
)
��3 4
;
��4 5
return
�� 
DBOperation
�� "
.
��" #
Success
��# *
;
��* +
}
�� 
}
�� 	
}
�� 
}�� �K
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
�� 	
string
��
 
GetFileType
�� 
(
�� 
string
�� #
contentType
��$ /
)
��/ 0
{
�� 
switch
�� 	
(
��
 
contentType
�� 
)
�� 
{
�� 
case
�� 
$str
��	 
:
�� 
case
�� 
$str
��	 
:
�� 
return
�� 
$str
�� 
;
�� 
case
�� 
$str
��	 
:
�� 
return
�� 
$str
�� 
;
�� 
case
�� 
$str
��	 
:
�� 
return
�� 
$str
�� 
;
�� 
default
�� 
:
�� 
return
�� 
$str
�� 
;
�� 
}
�� 
}
�� 
public
�� 
async
��	 
Task
�� 
<
�� 
DBOperation
�� 
>
��   
GetUploadByIdAsync
��! 3
(
��3 4
int
��4 7
id
��8 :
)
��: ;
{
�� 
try
�� 
{
�� 
var
�� 
upload
�� 
=
�� 
await
�� 
_repository
�� "
.
��" #
GetAsync
��# +
(
��+ ,
id
��, .
)
��. /
;
��/ 0
if
�� 
(
�� 
upload
�� 
==
�� 
null
�� 
)
�� 
return
�� 
DBOperation
�� 
.
�� 
NotFound
��  
;
��  !
return
�� 

DBOperation
�� 
.
�� 
Success
�� 
;
�� 
}
�� 
catch
�� 
(
��	 

	Exception
��
 
ex
�� 
)
�� 
{
�� 
throw
�� 	
new
��
 
	Exception
�� 
(
�� 
$"
�� 
$str
�� L
{
��L M
id
��M O
}
��O P
$str
��P Q
"
��Q R
,
��R S
ex
��T V
)
��V W
;
��W X
}
�� 
}
�� 
}
�� 
}�� ��
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
auditLogService	))q �
,
))� �
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
IFileUploadService	**q �
fileUploadService
**� �
)
**� �
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
FirstOrDefault	EE| �
(
EE� �
)
EE� �
;
EE� �
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
objUser	mm{ �
,
mm� �
MainTableName
mm� �
,
mm� �
MainTableKey
mm� �
)
mm� �
;
mm� �
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
��  
_fileUploadService
�� (
.
��( )
UploadFilesAsync
��) 9
(
��9 :
objUser
��: A
.
��A B
Id
��B D
,
��D E
Enum
��F J
.
��J K
GetName
��K R
(
��R S
TableNameEnum
��S `
.
��` a
SiteDescription
��a p
)
��p q
,
��q r
model
��s x
.
��x y
SiteDescription��y �
.��� �
uploadDocument��� �
,��� �
model��� �
.��� �
SiteDescription��� �
.��� �
	CreatedBy��� �
)��� �
;��� �
}
�� 

comparable
�� 
=
�� 
_repository
�� $
.
��$ %
GetAll
��% +
(
��+ ,
)
��, -
.
��- .
Where
��. 3
(
��3 4
x
��4 5
=>
��6 8
x
��9 :
.
��: ;
	RequestId
��; D
==
��E G
model
��H M
.
��M N%
comparableEvidenceModel
��N e
.
��e f
	RequestId
��f o
)
��o p
.
��p q
FirstOrDefault
��q 
(�� �
)��� �
;��� �
if
�� 
(
�� 

comparable
�� 
!=
�� 
null
�� "
)
��" #
{
�� 
int
�� $
MaincomparableTableKey
�� *
=
��+ ,

comparable
��- 7
.
��7 8
Id
��8 :
;
��: ;
string
�� %
MaincomparableTableName
�� .
=
��/ 0
Enum
��1 5
.
��5 6
GetName
��6 =
(
��= >
TableNameEnum
��> K
.
��K L!
Comparable_Evidence
��L _
)
��_ `
;
��` a)
ValuationComparableEvidence
�� +
	OldEntity
��, 5
=
��6 7
null
��8 <
;
��< =
	OldEntity
�� 
=
�� 
_repository
�� '
.
��' (
GetNoTracking
��( 5
(
��5 6

comparable
��6 @
.
��@ A
Id
��A C
)
��C D
;
��D E

comparable
�� 
=
�� 
_repository
�� (
.
��( )
Get
��) ,
(
��, -

comparable
��- 7
.
��7 8
Id
��8 :
)
��: ;
;
��; <
if
�� 
(
�� 

comparable
�� 
!=
�� !
null
��" &
)
��& '
{
�� 

comparable
�� 
.
�� 
Type
�� #
=
��$ %
model
��& +
.
��+ ,%
comparableEvidenceModel
��, C
.
��C D
Type
��D H
;
��H I

comparable
�� 
.
�� 
Size
�� #
=
��$ %
model
��& +
.
��+ ,%
comparableEvidenceModel
��, C
.
��C D
Size
��D H
;
��H I

comparable
�� 
.
�� 
Remarks
�� &
=
��' (
model
��) .
.
��. /%
comparableEvidenceModel
��/ F
.
��F G
Remarks
��G N
;
��N O

comparable
�� 
.
�� 
Price
�� $
=
��% &
model
��' ,
.
��, -%
comparableEvidenceModel
��- D
.
��D E
Price
��E J
;
��J K

comparable
�� 
.
�� 
RateSqFt
�� '
=
��( )
model
��* /
.
��/ 0%
comparableEvidenceModel
��0 G
.
��G H
RateSqFt
��H P
;
��P Q

comparable
�� 
.
�� 

ModifiedBy
�� )
=
��* +
model
��, 1
.
��1 2%
comparableEvidenceModel
��2 I
.
��I J

ModifiedBy
��J T
;
��T U
_repository
�� 
.
��  
UpdateAsync
��  +
(
��+ ,

comparable
��, 6
)
��6 7
;
��7 8
await
�� 
_unitOfWork
�� %
.
��% &
SaveChangesAsync
��& 6
(
��6 7
)
��7 8
;
��8 9
await
�� 
_auditLogService
�� *
.
��* +
CreateAuditLog
��+ 9
<
��9 :)
ValuationComparableEvidence
��: U
>
��U V
(
��V W!
AuditActionTypeEnum
��W j
.
��j k
Update
��k q
,
��q r
	OldEntity
��s |
,
��| }

comparable��~ �
,��� �'
MaincomparableTableName��� �
,��� �&
MaincomparableTableKey��� �
)��� �
;��� �
}
�� 
}
�� 
else
�� 
{
�� 

comparable
�� 
=
�� 
_mapperFactory
�� +
.
��+ ,
Get
��, /
<
��/ 0%
ComparableEvidenceModel
��0 G
,
��G H)
ValuationComparableEvidence
��I d
>
��d e
(
��e f
model
��f k
.
��k l&
comparableEvidenceModel��l �
)��� �
;��� �

comparable
�� 
.
�� 
	CreatedBy
�� $
=
��% &
model
��' ,
.
��, -%
comparableEvidenceModel
��- D
.
��D E
	CreatedBy
��E N
;
��N O

comparable
�� 
.
�� 
IsActive
�� #
=
��$ %
model
��& +
.
��+ ,%
comparableEvidenceModel
��, C
.
��C D
IsActive
��D L
;
��L M
_repository
�� 
.
�� 
AddAsync
�� $
(
��$ %

comparable
��% /
)
��/ 0
;
��0 1
await
�� 
_unitOfWork
�� !
.
��! "
SaveChangesAsync
��" 2
(
��2 3
)
��3 4
;
��4 5
}
�� 
if
�� 
(
�� 
objUser
�� 
.
�� 
Id
�� 
==
�� 
$num
�� 
)
��  
return
�� 
DBOperation
�� "
.
��" #
Error
��# (
;
��( )
else
�� 
{
�� 
await
��  
_fileUploadService
�� (
.
��( )
UploadFilesAsync
��) 9
(
��9 :

comparable
��: D
.
��D E
Id
��E G
,
��G H
Enum
��I M
.
��M N
GetName
��N U
(
��U V
TableNameEnum
��V c
.
��c d!
Comparable_Evidence
��d w
)
��w x
,
��x y
model
��z 
.�� �'
comparableEvidenceModel��� �
.��� �
uploadDocument��� �
,��� �
model��� �
.��� �'
comparableEvidenceModel��� �
.��� �
	CreatedBy��� �
)��� �
;��� �
}
�� 
objUser1
�� 
=
�� !
_valutionrepository
�� *
.
��* +
GetAll
��+ 1
(
��1 2
)
��2 3
.
��3 4
Where
��4 9
(
��9 :
x
��: ;
=>
��< >
x
��? @
.
��@ A
	RequestId
��A J
==
��K M
model
��N S
.
��S T'
valuationAssessementModel
��T m
.
��m n
	RequestId
��n w
)
��w x
.
��x y
FirstOrDefault��y �
(��� �
)��� �
;��� �
if
�� 
(
�� 
objUser1
�� 
!=
�� 
null
��  
)
��  !
{
�� 
string
�� $
MainAssesmentTableName
�� -
=
��. /
Enum
��0 4
.
��4 5
GetName
��5 <
(
��< =
TableNameEnum
��= J
.
��J K#
Valuation_Assessement
��K `
)
��` a
;
��a b
int
�� #
MainTableAssesmentKey
�� )
=
��* +
objUser1
��, 4
.
��4 5
Id
��5 7
;
��7 8 
ValuationAssesment
�� "
	OldEntity
��# ,
=
��- .
null
��/ 3
;
��3 4
	OldEntity
�� 
=
�� !
_valutionrepository
�� /
.
��/ 0
GetNoTracking
��0 =
(
��= >
objUser1
��> F
.
��F G
Id
��G I
)
��I J
;
��J K
objUser1
�� 
=
�� !
_valutionrepository
�� .
.
��. /
Get
��/ 2
(
��2 3
objUser1
��3 ;
.
��; <
Id
��< >
)
��> ?
;
��? @
if
�� 
(
�� 
objUser1
�� 
!=
�� 
null
��  $
)
��$ %
{
�� 
objUser1
�� 
.
�� 
MarketValue
�� (
=
��) *
model
��+ 0
.
��0 1'
valuationAssessementModel
��1 J
.
��J K
MarketValue
��K V
;
��V W
objUser1
�� 
.
�� 

MarketRate
�� '
=
��( )
model
��* /
.
��/ 0'
valuationAssessementModel
��0 I
.
��I J

MarketRate
��J T
;
��T U
objUser1
�� 
.
�� 
LifeOfBuilding
�� +
=
��, -
model
��. 3
.
��3 4'
valuationAssessementModel
��4 M
.
��M N
LifeOfBuilding
��N \
;
��\ ]
objUser1
�� 
.
�� "
AnnualMaintainceCost
�� 1
=
��2 3
model
��4 9
.
��9 :'
valuationAssessementModel
��: S
.
��S T"
AnnualMaintainceCost
��T h
;
��h i
objUser1
�� 
.
�� 

Insuarance
�� '
=
��( )
model
��* /
.
��/ 0'
valuationAssessementModel
��0 I
.
��I J

Insuarance
��J T
;
��T U
objUser1
�� 
.
�� 
InsuranceDetails
�� -
=
��. /
model
��0 5
.
��5 6'
valuationAssessementModel
��6 O
.
��O P
InsuranceDetails
��P `
;
��` a
objUser1
�� 
.
�� 

ModifiedBy
�� '
=
��( )
model
��* /
.
��/ 0'
valuationAssessementModel
��0 I
.
��I J

ModifiedBy
��J T
;
��T U!
_valutionrepository
�� '
.
��' (
UpdateAsync
��( 3
(
��3 4
objUser1
��4 <
)
��< =
;
��= >
await
�� 
_unitOfWork
�� %
.
��% &
SaveChangesAsync
��& 6
(
��6 7
)
��7 8
;
��8 9
await
�� 
_auditLogService
�� *
.
��* +
CreateAuditLog
��+ 9
<
��9 : 
ValuationAssesment
��: L
>
��L M
(
��M N!
AuditActionTypeEnum
��N a
.
��a b
Update
��b h
,
��h i
	OldEntity
��j s
,
��s t
objUser1
��u }
,
��} ~%
MainAssesmentTableName�� �
,��� �%
MainTableAssesmentKey��� �
)��� �
;��� �
}
�� 
}
�� 
else
�� 
{
�� 
objUser1
�� 
=
�� 
_mapperFactory
�� )
.
��) *
Get
��* -
<
��- .'
ValuationAssessementModel
��. G
,
��G H 
ValuationAssesment
��I [
>
��[ \
(
��\ ]
model
��] b
.
��b c'
valuationAssessementModel
��c |
)
��| }
;
��} ~
objUser1
�� 
.
�� 
	CreatedBy
�� "
=
��# $
model
��% *
.
��* +'
valuationAssessementModel
��+ D
.
��D E
	CreatedBy
��E N
;
��N O!
_valutionrepository
�� #
.
��# $
AddAsync
��$ ,
(
��, -
objUser1
��- 5
)
��5 6
;
��6 7
await
�� 
_unitOfWork
�� !
.
��! "
SaveChangesAsync
��" 2
(
��2 3
)
��3 4
;
��4 5
}
�� 
if
�� 
(
�� 
objUser1
�� 
.
�� 
Id
�� 
==
�� 
$num
��  
)
��  !
return
�� 
DBOperation
�� "
.
��" #
Error
��# (
;
��( )
else
�� 
{
�� 
await
��  
_fileUploadService
�� (
.
��( )
UploadFilesAsync
��) 9
(
��9 :
objUser1
��: B
.
��B C
Id
��C E
,
��E F
Enum
��G K
.
��K L
GetName
��L S
(
��S T
TableNameEnum
��T a
.
��a b#
Valuation_Assessement
��b w
)
��w x
,
��x y
model
��z 
.�� �)
valuationAssessementModel��� �
.��� �
uploadDocument��� �
,��� �
model��� �
.��� �)
valuationAssessementModel��� �
.��� �
	CreatedBy��� �
)��� �
;��� �
}
�� 
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� "
SiteDescriptionModel
�� .
>
��. /$
GetSiteDescriptionList
��0 F
(
��F G
int
��G J
	requestId
��K T
)
��T U
{
�� 	
DbParameter
�� 
[
�� 
]
�� 
osqlParameter2
�� (
=
��) *
{
�� 
new
�� 
DbParameter
�� #
(
��# $
$str
��$ /
,
��/ 0
	requestId
��1 :
,
��: ;
	SqlDbType
��< E
.
��E F
Int
��F I
)
��I J
,
��J K
}
�� 
;
�� 
var
�� 
quottationList
�� 
=
��  
EltizamDBHelper
��! 0
.
��0 1'
ExecuteSingleMappedReader
��1 J
<
��J K"
SiteDescriptionModel
��K _
>
��_ `
(
��` a 
ProcedureMetastore
��a s
.
��s t5
&usp_Site_GetSiteDescriptionByRequestId��t �
,��� � 
DatabaseConnection
��  2
.
��2 3

ConnString
��3 =
,
��= >
System
��? E
.
��E F
Data
��F J
.
��J K
CommandType
��K V
.
��V W
StoredProcedure
��W f
,
��f g
osqlParameter2
��h v
)
��v w
;
��w x
return
�� 
quottationList
�� !
;
��! "
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
DBOperation
�� %
>
��% &#
SideDescriptionUpsert
��' <
(
��< ="
SiteDescriptionModel
��= Q
model
��R W
)
��W X
{
�� 	&
ValuationSiteDescription
�� $
objUser
��% ,
;
��, -
MasterDocument
�� 
objUserDocument
�� *
;
��* +
string
�� 
MainTableName
��  
=
��! "
Enum
��# '
.
��' (
GetName
��( /
(
��/ 0
TableNameEnum
��0 =
.
��= >
SiteDescription
��> M
)
��M N
;
��N O
int
�� 
MainTableKey
�� 
=
�� 
model
�� $
.
��$ %
Id
��% '
;
��' (
if
�� 
(
�� 
model
�� 
.
�� 
Id
�� 
>
�� 
$num
�� 
)
�� 
{
�� &
ValuationSiteDescription
�� (
	OldEntity
��) 2
=
��3 4
null
��5 9
;
��9 :
	OldEntity
�� 
=
�� 
_siteRepository
�� +
.
��+ ,
GetNoTracking
��, 9
(
��9 :
model
��: ?
.
��? @
Id
��@ B
)
��B C
;
��C D
objUser
�� 
=
�� 
_siteRepository
�� )
.
��) *
Get
��* -
(
��- .
model
��. 3
.
��3 4
Id
��4 6
)
��6 7
;
��7 8
if
�� 
(
�� 
objUser
�� 
!=
�� 
null
�� #
)
��# $
{
�� 
objUser
�� 
.
�� 
Location
�� $
=
��% &
model
��' ,
.
��, -
Location
��- 5
;
��5 6
objUser
�� 
.
�� 
InternalArea
�� (
=
��) *
model
��+ 0
.
��0 1
InternalArea
��1 =
;
��= >
objUser
�� 
.
�� 
ExternalArea
�� (
=
��) *
model
��+ 0
.
��0 1
ExternalArea
��1 =
;
��= >
objUser
�� 
.
�� 
Floor
�� !
=
��" #
model
��$ )
.
��) *
Floor
��* /
;
��/ 0
objUser
�� 
.
�� 
Room
��  
=
��! "
model
��# (
.
��( )
Room
��) -
;
��- .
objUser
�� 
.
�� 
Bedrooms
�� $
=
��% &
model
��' ,
.
��, -
Bedrooms
��- 5
;
��5 6
objUser
�� 
.
�� 
Storage
�� #
=
��$ %
model
��& +
.
��+ ,
Storage
��, 3
;
��3 4
objUser
�� 
.
�� 
Quantity
�� $
=
��% &
model
��' ,
.
��, -
Quantity
��- 5
;
��5 6
objUser
�� 
.
�� 
AdditionComment
�� +
=
��, -
model
��. 3
.
��3 4
AdditionComment
��4 C
;
��C D
objUser
�� 
.
�� 
PropertyCondition
�� -
=
��. /
model
��0 5
.
��5 6
PropertyCondition
��6 G
;
��G H
objUser
�� 
.
�� 
AdditionalNotes
�� +
=
��, -
model
��. 3
.
��3 4
AdditionalNotes
��4 C
;
��C D
objUser
�� 
.
�� 
Others
�� "
=
��# $
model
��% *
.
��* +
Others
��+ 1
;
��1 2
objUser
�� 
.
�� 

ModifiedBy
�� &
=
��' (
model
��) .
.
��. /

ModifiedBy
��/ 9
;
��9 :
_siteRepository
�� #
.
��# $
UpdateAsync
��$ /
(
��/ 0
objUser
��0 7
)
��7 8
;
��8 9
await
�� 
_unitOfWork
�� %
.
��% &
SaveChangesAsync
��& 6
(
��6 7
)
��7 8
;
��8 9
await
�� 
_auditLogService
�� *
.
��* +
CreateAuditLog
��+ 9
<
��9 :&
ValuationSiteDescription
��: R
>
��R S
(
��S T!
AuditActionTypeEnum
��T g
.
��g h
Update
��h n
,
��n o
	OldEntity
��p y
,
��y z
objUser��{ �
,��� �
MainTableName��� �
,��� �
MainTableKey��� �
)��� �
;��� �
}
�� 
}
�� 
else
�� 
{
�� 
objUser
�� 
=
�� 
_mapperFactory
�� (
.
��( )
Get
��) ,
<
��, -"
SiteDescriptionModel
��- A
,
��A B&
ValuationSiteDescription
��C [
>
��[ \
(
��\ ]
model
��] b
)
��b c
;
��c d
objUser
�� 
.
�� 
	CreatedBy
�� !
=
��" #
model
��$ )
.
��) *
	CreatedBy
��* 3
;
��3 4
_siteRepository
�� 
.
��  
AddAsync
��  (
(
��( )
objUser
��) 0
)
��0 1
;
��1 2
await
�� 
_unitOfWork
�� !
.
��! "
SaveChangesAsync
��" 2
(
��2 3
)
��3 4
;
��4 5
}
�� 
if
�� 
(
�� 
objUser
�� 
.
�� 
Id
�� 
==
�� 
$num
�� 
)
��  
return
�� 
DBOperation
�� "
.
��" #
Error
��# (
;
��( )
else
�� 
{
�� 
await
��  
_fileUploadService
�� (
.
��( )
UploadFilesAsync
��) 9
(
��9 :
objUser
��: A
.
��A B
Id
��B D
,
��D E
Enum
��F J
.
��J K
GetName
��K R
(
��R S
TableNameEnum
��S `
.
��` a
SiteDescription
��a p
)
��p q
,
��q r
model
��s x
.
��x y
uploadDocument��y �
,��� �
model��� �
.��� �
	CreatedBy��� �
)��� �
;��� �
}
�� 
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
DBOperation
�� %
>
��% &
EvidenceUpsert
��' 5
(
��5 6%
ComparableEvidenceModel
��6 M
evidence
��N V
)
��V W
{
�� 	)
ValuationComparableEvidence
�� '
objUser
��( /
;
��/ 0
MasterAddress
�� 
objUserAddress
�� (
;
��( )!
MasterQualification
�� "
objUserQualification
��  4
;
��4 5
MasterDocument
�� 
objUserDocument
�� *
;
��* +
string
�� 
MainTableName
��  
=
��! "
Enum
��# '
.
��' (
GetName
��( /
(
��/ 0
TableNameEnum
��0 =
.
��= >!
Comparable_Evidence
��> Q
)
��Q R
;
��R S
int
�� 
MainTableKey
�� 
=
�� 
evidence
�� '
.
��' (
Id
��( *
;
��* +
if
�� 
(
�� 
evidence
�� 
.
�� 
Id
�� 
>
�� 
$num
�� 
)
��  
{
�� )
ValuationComparableEvidence
�� +
	OldEntity
��, 5
=
��6 7
null
��8 <
;
��< =
	OldEntity
�� 
=
�� 
_repository
�� '
.
��' (
GetNoTracking
��( 5
(
��5 6
evidence
��6 >
.
��> ?
Id
��? A
)
��A B
;
��B C
objUser
�� 
=
�� 
_repository
�� %
.
��% &
Get
��& )
(
��) *
evidence
��* 2
.
��2 3
Id
��3 5
)
��5 6
;
��6 7
if
�� 
(
�� 
objUser
�� 
!=
�� 
null
�� #
)
��# $
{
�� 
objUser
�� 
.
�� 
Type
��  
=
��! "
evidence
��# +
.
��+ ,
Type
��, 0
;
��0 1
objUser
�� 
.
�� 
Size
��  
=
��! "
evidence
��# +
.
��+ ,
Size
��, 0
;
��0 1
objUser
�� 
.
�� 
Remarks
�� #
=
��$ %
evidence
��& .
.
��. /
Remarks
��/ 6
;
��6 7
objUser
�� 
.
�� 
RateSqFt
�� $
=
��% &
evidence
��' /
.
��/ 0
RateSqFt
��0 8
;
��8 9
objUser
�� 
.
�� 
Price
�� !
=
��" #
evidence
��$ ,
.
��, -
Price
��- 2
;
��2 3
objUser
�� 
.
�� 

ModifiedBy
�� &
=
��' (
evidence
��) 1
.
��1 2

ModifiedBy
��2 <
;
��< =
_repository
�� 
.
��  
UpdateAsync
��  +
(
��+ ,
objUser
��, 3
)
��3 4
;
��4 5
await
�� 
_unitOfWork
�� %
.
��% &
SaveChangesAsync
��& 6
(
��6 7
)
��7 8
;
��8 9
await
�� 
_auditLogService
�� *
.
��* +
CreateAuditLog
��+ 9
<
��9 :)
ValuationComparableEvidence
��: U
>
��U V
(
��V W!
AuditActionTypeEnum
��W j
.
��j k
Update
��k q
,
��q r
	OldEntity
��s |
,
��| }
objUser��~ �
,��� �
MainTableName��� �
,��� �
MainTableKey��� �
)��� �
;��� �
}
�� 
}
�� 
else
�� 
{
�� 
objUser
�� 
=
�� 
_mapperFactory
�� (
.
��( )
Get
��) ,
<
��, -%
ComparableEvidenceModel
��- D
,
��D E)
ValuationComparableEvidence
��F a
>
��a b
(
��b c
evidence
��c k
)
��k l
;
��l m
objUser
�� 
.
�� 
	CreatedBy
�� !
=
��" #
evidence
��$ ,
.
��, -
	CreatedBy
��- 6
;
��6 7
objUser
�� 
.
�� 
IsActive
��  
=
��! "
evidence
��# +
.
��+ ,
IsActive
��, 4
;
��4 5
_repository
�� 
.
�� 
AddAsync
�� $
(
��$ %
objUser
��% ,
)
��, -
;
��- .
await
�� 
_unitOfWork
�� !
.
��! "
SaveChangesAsync
��" 2
(
��2 3
)
��3 4
;
��4 5
}
�� 
if
�� 
(
�� 
objUser
�� 
.
�� 
Id
�� 
==
�� 
$num
�� 
)
��  
return
�� 
DBOperation
�� "
.
��" #
Error
��# (
;
��( )
else
�� 
{
�� 
if
�� 
(
�� 
evidence
�� 
.
�� 
uploadDocument
�� +
!=
��, .
null
��/ 3
)
��3 4
{
�� 
foreach
�� 
(
�� 
var
��  
doc
��! $
in
��% '
evidence
��( 0
.
��0 1
uploadDocument
��1 ?
)
��? @
{
�� 
objUserDocument
�� '
=
��( )
_mapperFactory
��* 8
.
��8 9
Get
��9 <
<
��< =!
MasterDocumentModel
��= P
,
��P Q
MasterDocument
��R `
>
��` a
(
��a b
doc
��b e
)
��e f
;
��f g
objUserDocument
�� '
.
��' (
IsActive
��( 0
=
��1 2
doc
��3 6
.
��6 7
IsActive
��7 ?
;
��? @
objUserDocument
�� '
.
��' (

TableKeyId
��( 2
=
��3 4
objUser
��5 <
.
��< =
Id
��= ?
;
��? @
objUserDocument
�� '
.
��' (
	TableName
��( 1
=
��2 3
Enum
��4 8
.
��8 9
GetName
��9 @
(
��@ A
TableNameEnum
��A N
.
��N O!
Comparable_Evidence
��O b
)
��b c
;
��c d
objUserDocument
�� '
.
��' (
DocumentName
��( 4
=
��5 6
doc
��7 :
.
��: ;
DocumentName
��; G
;
��G H
objUserDocument
�� '
.
��' (
FileName
��( 0
=
��1 2
doc
��3 6
.
��6 7
FileName
��7 ?
;
��? @
objUserDocument
�� '
.
��' (
FilePath
��( 0
=
��1 2
doc
��3 6
.
��6 7
FilePath
��7 ?
;
��? @
objUserDocument
�� '
.
��' (
FileType
��( 0
=
��1 2
doc
��3 6
.
��6 7
FileType
��7 ?
;
��? @
objUserDocument
�� '
.
��' (
	CreatedBy
��( 1
=
��2 3
evidence
��4 <
.
��< =
	CreatedBy
��= F
;
��F G!
_documentRepository
�� +
.
��+ ,
AddAsync
��, 4
(
��4 5
objUserDocument
��5 D
)
��D E
;
��E F
await
�� 
_unitOfWork
�� )
.
��) *
SaveChangesAsync
��* :
(
��: ;
)
��; <
;
��< =
}
�� 
}
�� 
}
�� 
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
DBOperation
�� %
>
��% &
AssesmentUpsert
��' 6
(
��6 7'
ValuationAssessementModel
��7 P
	assesment
��Q Z
)
��Z [
{
�� 	 
ValuationAssesment
�� 
objUser1
�� '
;
��' (
MasterAddress
�� 
objUserAddress
�� (
;
��( )!
MasterQualification
�� "
objUserQualification
��  4
;
��4 5
MasterDocument
�� 
objUserDocument
�� *
;
��* +
string
�� 
MainTableName
��  
=
��! "
Enum
��# '
.
��' (
GetName
��( /
(
��/ 0
TableNameEnum
��0 =
.
��= >#
Valuation_Assessement
��> S
)
��S T
;
��T U
int
�� 
MainTableKey
�� 
=
�� 
	assesment
�� (
.
��( )
Id
��) +
;
��+ ,
if
�� 
(
�� 
	assesment
�� 
.
�� 
Id
�� 
>
�� 
$num
��  
)
��  !
{
��  
ValuationAssesment
�� "
	OldEntity
��# ,
=
��- .
null
��/ 3
;
��3 4
	OldEntity
�� 
=
�� !
_valutionrepository
�� /
.
��/ 0
GetNoTracking
��0 =
(
��= >
	assesment
��> G
.
��G H
Id
��H J
)
��J K
;
��K L
objUser1
�� 
=
�� !
_valutionrepository
�� .
.
��. /
Get
��/ 2
(
��2 3
	assesment
��3 <
.
��< =
Id
��= ?
)
��? @
;
��@ A
if
�� 
(
�� 
objUser1
�� 
!=
�� 
null
��  $
)
��$ %
{
�� 
objUser1
�� 
.
�� 
MarketValue
�� (
=
��) *
	assesment
��+ 4
.
��4 5
MarketValue
��5 @
;
��@ A
objUser1
�� 
.
�� 

MarketRate
�� '
=
��( )
	assesment
��* 3
.
��3 4

MarketRate
��4 >
;
��> ?
objUser1
�� 
.
�� 
LifeOfBuilding
�� +
=
��, -
	assesment
��. 7
.
��7 8
LifeOfBuilding
��8 F
;
��F G
objUser1
�� 
.
�� "
AnnualMaintainceCost
�� 1
=
��2 3
	assesment
��4 =
.
��= >"
AnnualMaintainceCost
��> R
;
��R S
objUser1
�� 
.
�� 

Insuarance
�� '
=
��( )
	assesment
��* 3
.
��3 4

Insuarance
��4 >
;
��> ?
objUser1
�� 
.
�� 

ModifiedBy
�� '
=
��( )
	assesment
��* 3
.
��3 4

ModifiedBy
��4 >
;
��> ?!
_valutionrepository
�� '
.
��' (
UpdateAsync
��( 3
(
��3 4
objUser1
��4 <
)
��< =
;
��= >
await
�� 
_unitOfWork
�� %
.
��% &
SaveChangesAsync
��& 6
(
��6 7
)
��7 8
;
��8 9
await
�� 
_auditLogService
�� *
.
��* +
CreateAuditLog
��+ 9
<
��9 : 
ValuationAssesment
��: L
>
��L M
(
��M N!
AuditActionTypeEnum
��N a
.
��a b
Update
��b h
,
��h i
	OldEntity
��j s
,
��s t
objUser1
��u }
,
��} ~
MainTableName�� �
,��� �
MainTableKey��� �
)��� �
;��� �
}
�� 
}
�� 
else
�� 
{
�� 
objUser1
�� 
=
�� 
_mapperFactory
�� )
.
��) *
Get
��* -
<
��- .'
ValuationAssessementModel
��. G
,
��G H 
ValuationAssesment
��I [
>
��[ \
(
��\ ]
	assesment
��] f
)
��f g
;
��g h
objUser1
�� 
.
�� 
	CreatedBy
�� "
=
��# $
	assesment
��% .
.
��. /
	CreatedBy
��/ 8
;
��8 9!
_valutionrepository
�� #
.
��# $
AddAsync
��$ ,
(
��, -
objUser1
��- 5
)
��5 6
;
��6 7
await
�� 
_unitOfWork
�� !
.
��! "
SaveChangesAsync
��" 2
(
��2 3
)
��3 4
;
��4 5
}
�� 
if
�� 
(
�� 
objUser1
�� 
.
�� 
Id
�� 
==
�� 
$num
��  
)
��  !
return
�� 
DBOperation
�� "
.
��" #
Error
��# (
;
��( )
else
�� 
{
�� 
if
�� 
(
�� 
	assesment
�� 
.
�� 
uploadDocument
�� ,
!=
��- /
null
��0 4
)
��4 5
{
�� 
foreach
�� 
(
�� 
var
��  
doc
��! $
in
��% '
	assesment
��( 1
.
��1 2
uploadDocument
��2 @
)
��@ A
{
�� 
objUserDocument
�� '
=
��( )
_mapperFactory
��* 8
.
��8 9
Get
��9 <
<
��< =!
MasterDocumentModel
��= P
,
��P Q
MasterDocument
��R `
>
��` a
(
��a b
doc
��b e
)
��e f
;
��f g
objUserDocument
�� '
.
��' (
IsActive
��( 0
=
��1 2
doc
��3 6
.
��6 7
IsActive
��7 ?
;
��? @
objUserDocument
�� '
.
��' (

TableKeyId
��( 2
=
��3 4
objUser1
��5 =
.
��= >
Id
��> @
;
��@ A
objUserDocument
�� '
.
��' (
	TableName
��( 1
=
��2 3
Enum
��4 8
.
��8 9
GetName
��9 @
(
��@ A
TableNameEnum
��A N
.
��N O#
Valuation_Assessement
��O d
)
��d e
;
��e f
objUserDocument
�� '
.
��' (
DocumentName
��( 4
=
��5 6
doc
��7 :
.
��: ;
DocumentName
��; G
;
��G H
objUserDocument
�� '
.
��' (
FileName
��( 0
=
��1 2
doc
��3 6
.
��6 7
FileName
��7 ?
;
��? @
objUserDocument
�� '
.
��' (
FilePath
��( 0
=
��1 2
doc
��3 6
.
��6 7
FilePath
��7 ?
;
��? @
objUserDocument
�� '
.
��' (
FileType
��( 0
=
��1 2
doc
��3 6
.
��6 7
FileType
��7 ?
;
��? @
objUserDocument
�� '
.
��' (
	CreatedBy
��( 1
=
��2 3
	assesment
��4 =
.
��= >
	CreatedBy
��> G
;
��G H!
_documentRepository
�� +
.
��+ ,
AddAsync
��, 4
(
��4 5
objUserDocument
��5 D
)
��D E
;
��E F
await
�� 
_unitOfWork
�� )
.
��) *
SaveChangesAsync
��* :
(
��: ;
)
��; <
;
��< =
}
�� 
}
�� 
}
�� 
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
DBOperation
�� %
>
��% &
DeleteDocument
��' 5
(
��5 6
int
��6 9
id
��: <
,
��< =
int
��= @
?
��@ A
by
��B D
)
��D E
{
�� 	
if
�� 
(
�� 
id
�� 
>
�� 
$num
�� 
)
�� 
{
�� 
var
�� 
	entityDoc
�� 
=
�� !
_documentRepository
��  3
.
��3 4
Get
��4 7
(
��7 8
id
��8 :
)
��: ;
;
��; <
if
�� 
(
�� 
	entityDoc
�� 
!=
��  
null
��! %
)
��% &
{
�� !
_documentRepository
�� '
.
��' (
Remove
��( .
(
��. /
	entityDoc
��/ 8
)
��8 9
;
��9 :
await
�� 
_unitOfWork
�� %
.
��% &
SaveChangesAsync
��& 6
(
��6 7
)
��7 8
;
��8 9
}
�� 
}
�� 
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
}
�� 
}�� �
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
auditLogService	$$~ �
,
$$� �(
IMasterNotificationService
$$� �!
notificationService
$$� �
)
$$� �
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
!usp_Invoice_GetInvoiceByRequestId	;;p �
,
;;� �
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
MainTableName	gg �
,
gg� �
MainTableKey
gg� �
)
gg� �
;
gg� �
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
�� 
{
�� 
if
�� 
(
�� 

objInvoice
�� 
.
�� 
Id
�� !
>
��" #
$num
��$ %
&&
��& (
entityInvoice
��) 6
.
��6 7

InvoiceIds
��7 A
.
��A B
Length
��B H
>
��I J
$num
��K L
)
��L M
{
�� 
DbParameter
�� 
[
��  
]
��  !
osqlParameter
��" /
=
��0 1
{
�� 
new
�� 
DbParameter
�� '
(
��' (
$str
��( 3
,
��3 4

objInvoice
��8 B
.
��B C
Id
��C E
,
��E F
	SqlDbType
��G P
.
��P Q
Int
��Q T
)
��T U
,
��U V
new
�� 
DbParameter
�� '
(
��' (
$str
��( 3
,
��3 4
entityInvoice
��7 D
.
��D E
	CreatedBy
��E N
,
��N O
	SqlDbType
��P Y
.
��Y Z
Int
��Z ]
)
��] ^
,
��^ _
new
�� 
DbParameter
�� '
(
��' (
$str
��( ;
,
��; <
entityInvoice
��? L
.
��L M

InvoiceIds
��M W
,
��W X
	SqlDbType
��Y b
.
��b c
Int
��c f
)
��f g
,
��g h
}
�� 
;
�� 
EltizamDBHelper
�� #
.
��# $
ExecuteNonQuery
��$ 3
(
��3 4 
ProcedureMetastore
��4 F
.
��F G4
&usp_ValuationPayment_UpsertInvoicesMap
��G m
,
��m n!
DatabaseConnection��o �
.��� �

ConnString��� �
,��� �
CommandType��� �
.��� �
StoredProcedure��� �
,��� �
osqlParameter��� �
)��� �
;��� �
}
�� 
if
�� 
(
�� 
entityInvoice
�� !
.
��! "
uploadDocument
��" 0
!=
��1 3
null
��4 8
)
��8 9
{
�� 
foreach
�� 
(
�� 
var
��  
doc
��! $
in
��% '
entityInvoice
��( 5
.
��5 6
uploadDocument
��6 D
)
��D E
{
�� 
objDocument
�� #
=
��$ %
_mapperFactory
��& 4
.
��4 5
Get
��5 8
<
��8 9!
MasterDocumentModel
��9 L
,
��L M
MasterDocument
��N \
>
��\ ]
(
��] ^
doc
��^ a
)
��a b
;
��b c
objDocument
�� #
.
��# $
IsActive
��$ ,
=
��- .
doc
��/ 2
.
��2 3
IsActive
��3 ;
;
��; <
objDocument
�� #
.
��# $

TableKeyId
��$ .
=
��/ 0

objInvoice
��1 ;
.
��; <
Id
��< >
;
��> ?
objDocument
�� #
.
��# $
	TableName
��$ -
=
��. /
Enum
��0 4
.
��4 5
GetName
��5 <
(
��< =
TableNameEnum
��= J
.
��J K
ValuationInvoice
��K [
)
��[ \
;
��\ ]
objDocument
�� #
.
��# $
DocumentName
��$ 0
=
��1 2
doc
��3 6
.
��6 7
DocumentName
��7 C
;
��C D
objDocument
�� #
.
��# $
FileName
��$ ,
=
��- .
doc
��/ 2
.
��2 3
FileName
��3 ;
;
��; <
objDocument
�� #
.
��# $
FilePath
��$ ,
=
��- .
doc
��/ 2
.
��2 3
FilePath
��3 ;
;
��; <
objDocument
�� #
.
��# $
FileType
��$ ,
=
��- .
doc
��/ 2
.
��2 3
FileType
��3 ;
;
��; <
objDocument
�� #
.
��# $
	CreatedBy
��$ -
=
��. /

objInvoice
��0 :
.
��: ;
	CreatedBy
��; D
;
��D E!
_repositoryDocument
�� +
.
��+ ,
AddAsync
��, 4
(
��4 5
objDocument
��5 @
)
��@ A
;
��A B
await
�� 
_unitOfWork
�� )
.
��) *
SaveChangesAsync
��* :
(
��: ;
)
��; <
;
��< =
}
�� 
}
�� 
}
�� 
try
�� 
{
�� 
var
�� 
statusid
�� 
=
�� 
_statusrepository
�� 0
.
��0 1
GetAll
��1 7
(
��7 8
)
��8 9
.
��9 :
Where
��: ?
(
��? @
x
��@ A
=>
��B D
x
��E F
.
��F G
Status
��G M
==
��N P
$str
��Q \
)
��\ ]
.
��] ^
Select
��^ d
(
��d e
x
��e f
=>
��g i
x
��j k
.
��k l
Id
��l n
)
��n o
.
��o p
FirstOrDefault
��p ~
(
��~ 
)�� �
;��� �"
_notificationService
�� $
.
��$ %*
UpdateValuationRequestStatus
��% A
(
��A B
statusid
��B J
,
��J K

objInvoice
��L V
.
��V W 
ValuationRequestId
��W i
)
��i j
;
��j k
string
�� 
?
�� 
username
��  
=
��! "#
_masteruserrepository
��# 8
.
��8 9
GetAll
��9 ?
(
��? @
)
��@ A
.
��A B
Where
��B G
(
��G H
x
��H I
=>
��J L
x
��M N
.
��N O
Id
��O Q
==
��R T

objInvoice
��U _
.
��_ `
	CreatedBy
��` i
)
��i j
.
��j k
Select
��k q
(
��q r
x
��r s
=>
��t v
x
��w x
.
��x y
UserName��y �
)��� �
.��� �
FirstOrDefault��� �
(��� �
)��� �
;��� �
string
�� 
transactionstatus
�� (
=
��) *
_statusrepository
��+ <
.
��< =
Get
��= @
(
��@ A
x
��A B
=>
��C E
x
��F G
.
��G H
Id
��H J
==
��K M

objInvoice
��N X
.
��X Y!
TransactionStatusId
��Y l
)
��l m
.
��m n
Status
��n t
;
��t u!
TransactionModeEnum
�� #
mode
��$ (
=
��) *
(
��+ ,!
TransactionModeEnum
��, ?
)
��? @

objInvoice
��@ J
.
��J K
TransactionModeId
��K \
;
��\ ]
string
�� 
?
�� 
paymentmode
�� #
=
��$ %
Enum
��& *
.
��* +
GetName
��+ 2
(
��2 3
typeof
��3 9
(
��9 :!
TransactionModeEnum
��: M
)
��M N
,
��N O
mode
��P T
)
��T U
;
��U V
string
�� 
strHtml
�� 
=
��  
File
��! %
.
��% &
ReadAllText
��& 1
(
��1 2
$str
��2 v
)
��v w
;
��w x
strHtml
�� 
=
�� 
strHtml
�� !
.
��! "
Replace
��" )
(
��) *
$str
��* 4
,
��4 5

objInvoice
��6 @
.
��@ A
CreatedDate
��A L
.
��L M
ToString
��M U
(
��U V
$str
��V c
)
��c d
)
��d e
;
��e f
strHtml
�� 
=
�� 
strHtml
�� !
.
��! "
Replace
��" )
(
��) *
$str
��* 4
,
��4 5

objInvoice
��6 @
.
��@ A
Amount
��A G
.
��G H
ToString
��H P
(
��P Q
)
��Q R
)
��R S
;
��S T
strHtml
�� 
=
�� 
strHtml
�� !
.
��! "
Replace
��" )
(
��) *
$str
��* 9
,
��9 :
transactionstatus
��; L
)
��L M
;
��M N
strHtml
�� 
=
�� 
strHtml
�� !
.
��! "
Replace
��" )
(
��) *
$str
��* 9
,
��9 :
paymentmode
��; F
)
��F G
;
��G H
strHtml
�� 
=
�� 
strHtml
�� !
.
��! "
Replace
��" )
(
��) *
$str
��* 2
,
��2 3

objInvoice
��4 >
.
��> ?
TransactionDate
��? N
?
��N O
.
��O P
ToString
��P X
(
��X Y
$str
��Y f
)
��f g
)
��g h
;
��h i
var
�� 
notificationModel
�� %
=
��& '"
_notificationService
��( <
.
��< =*
GetValuationNotificationData
��= Y
(
��Y Z!
RecepientActionEnum
��Z m
.
��m n
InvoiceCreation
��n }
,
��} ~

objInvoice�� �
.��� �"
ValuationRequestId��� �
)��� �
;��� �
notificationModel
�� !
.
��! "
Body
��" &
=
��' (
strHtml
��) 0
;
��0 1
notificationModel
�� !
.
��! "
Subject
��" )
=
��* +

EnumHelper
��, 6
.
��6 7
GetDescription
��7 E
(
��E F!
RecepientActionEnum
��F Y
.
��Y Z
InvoiceCreation
��Z i
)
��i j
;
��j k
await
�� "
_notificationService
�� *
.
��* +
	SendEmail
��+ 4
(
��4 5
notificationModel
��5 F
)
��F G
;
��G H
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
}
�� 
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� '
ValuationInvoiceListModel
�� 3
>
��3 4
GetInvoiceById
��5 C
(
��C D
int
��D G
id
��H J
)
��J K
{
�� 	
var
�� 
	tableName
�� 
=
�� 
Enum
��  
.
��  !
GetName
��! (
(
��( )
TableNameEnum
��) 6
.
��6 7
ValuationInvoice
��7 G
)
��G H
;
��H I
var
�� 
_quatationEntity
��  
=
��! "
_mapperFactory
��# 1
.
��1 2
Get
��2 5
<
��5 6
ValuationInvoice
��6 F
,
��F G'
ValuationInvoiceListModel
��H a
>
��a b
(
��b c
await
��c h
_repository
��i t
.
��t u
GetAsync
��u }
(
��} ~
id��~ �
)��� �
)��� �
;��� �
if
�� 
(
�� 
_quatationEntity
��  
!=
��! #
null
��$ (
)
��( )
{
�� 
DbParameter
�� 
[
�� 
]
�� 
osqlParameter2
�� ,
=
��- .
{
�� 
new
�� 
DbParameter
�� #
(
��# $
AppConstants
��$ 0
.
��0 1

TableKeyId
��1 ;
,
��; <
id
��= ?
,
��? @
	SqlDbType
��A J
.
��J K
Int
��K N
)
��N O
,
��O P
new
�� 
DbParameter
�� #
(
��# $
AppConstants
��$ 0
.
��0 1
	TableName
��1 :
,
��: ;
	tableName
��= F
,
��F G
	SqlDbType
��H Q
.
��Q R
VarChar
��R Y
)
��Y Z
,
��Z [
}
�� 
;
�� 
var
��  
quatationDocuments
�� &
=
��' (
EltizamDBHelper
��) 8
.
��8 9!
ExecuteMappedReader
��9 L
<
��L M!
MasterDocumentModel
��M `
>
��` a
(
��a b 
ProcedureMetastore
��b t
.
��t u3
$usp_Document_GetDocumentByTableKeyId��u �
,��� � 
DatabaseConnection
��$ 6
.
��6 7

ConnString
��7 A
,
��A B
System
��C I
.
��I J
Data
��J N
.
��N O
CommandType
��O Z
.
��Z [
StoredProcedure
��[ j
,
��j k
osqlParameter2
��l z
)
��z {
;
��{ |
if
�� 
(
��  
quatationDocuments
�� &
!=
��' )
null
��* .
)
��. /
_quatationEntity
�� $
.
��$ %
	Documents
��% .
=
��/ 0 
quatationDocuments
��1 C
;
��C D
}
�� 
return
�� 
_quatationEntity
�� #
;
��# $
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
DBOperation
�� %
>
��% &
InvoiceDelete
��' 4
(
��4 5
int
��5 8
id
��9 ;
,
��; <
int
��= @
?
��@ A
by
��B D
)
��D E
{
�� 	
var
�� 
entityInvoice
�� 
=
�� 
_repository
��  +
.
��+ ,
Get
��, /
(
��/ 0
x
��0 1
=>
��2 4
x
��5 6
.
��6 7
Id
��7 9
==
��: <
id
��= ?
)
��? @
;
��@ A
entityInvoice
�� 
.
�� 

ModifiedBy
�� $
=
��% &
by
��' )
??
��* ,
entityInvoice
��- :
.
��: ;

ModifiedBy
��; E
;
��E F
if
�� 
(
�� 
entityInvoice
�� 
==
��  
null
��! %
)
��% &
return
�� 
DBOperation
�� "
.
��" #
NotFound
��# +
;
��+ ,
_repository
�� 
.
�� 
Remove
�� 
(
�� 
entityInvoice
�� ,
)
��, -
;
��- .
await
�� 
_unitOfWork
�� 
.
�� 
SaveChangesAsync
�� .
(
��. /
)
��/ 0
;
��0 1
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
DBOperation
�� %
>
��% &
DeleteDocument
��' 5
(
��5 6
int
��6 9
id
��: <
,
��< =
int
��> A
?
��A B
by
��C E
)
��E F
{
�� 	
if
�� 
(
�� 
id
�� 
>
�� 
$num
�� 
)
�� 
{
�� 
var
�� 
	entityDoc
�� 
=
�� !
_repositoryDocument
��  3
.
��3 4
Get
��4 7
(
��7 8
id
��8 :
)
��: ;
;
��; <
if
�� 
(
�� 
	entityDoc
�� 
!=
��  
null
��! %
)
��% &
{
�� !
_repositoryDocument
�� '
.
��' (
Remove
��( .
(
��. /
	entityDoc
��/ 8
)
��8 9
;
��9 :
await
�� 
_unitOfWork
�� %
.
��% &
SaveChangesAsync
��& 6
(
��6 7
)
��7 8
;
��8 9
}
�� 
}
�� 
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
DBOperation
�� %
>
��% &
UpsertInvoice
��' 4
(
��4 5*
ValuationInvoicePaymentModel
��5 Q
invoice
��R Y
)
��Y Z
{
�� 	
try
�� 
{
�� %
ValuationPaymentInvoice
�� '
objIvoiceType
��( 5
;
��5 6
if
�� 
(
�� 
invoice
�� 
.
�� 
Id
�� 
>
��  
$num
��! "
)
��" #
{
�� 
objIvoiceType
�� !
=
��" #
_invoiceRepo
��$ 0
.
��0 1
Get
��1 4
(
��4 5
invoice
��5 <
.
��< =
Id
��= ?
)
��? @
;
��@ A
if
�� 
(
�� 
objIvoiceType
�� %
!=
��& (
null
��) -
)
��- .
{
�� 
objIvoiceType
�� %
.
��% &
	InvoiceNo
��& /
=
��0 1
invoice
��2 9
.
��9 :
	InvoiceNo
��: C
;
��C D
objIvoiceType
�� %
.
��% &
Amount
��& ,
=
��- .
invoice
��/ 6
.
��6 7
Amount
��7 =
;
��= >
objIvoiceType
�� %
.
��% &
Balance
��& -
=
��. /
invoice
��0 7
.
��7 8
Balance
��8 ?
;
��? @
objIvoiceType
�� %
.
��% &
Note
��& *
=
��+ ,
invoice
��- 4
.
��4 5
Note
��5 9
;
��9 :
objIvoiceType
�� %
.
��% &
TransactionModeId
��& 7
=
��8 9
invoice
��: A
.
��A B
TransactionModeId
��B S
;
��S T
objIvoiceType
�� %
.
��% &
TransactionDate
��& 5
=
��6 7
invoice
��8 ?
.
��? @
TransactionDate
��@ O
;
��O P
objIvoiceType
�� %
.
��% &

ModifiedBy
��& 0
=
��1 2
invoice
��3 :
.
��: ;

ModifiedBy
��; E
;
��E F
_invoiceRepo
�� $
.
��$ %
UpdateAsync
��% 0
(
��0 1
objIvoiceType
��1 >
)
��> ?
;
��? @
}
�� 
else
�� 
{
�� 
return
�� 
DBOperation
�� *
.
��* +
NotFound
��+ 3
;
��3 4
}
�� 
}
�� 
else
�� 
{
�� 
var
�� 
id
�� 
=
�� 
string
�� #
.
��# $
Format
��$ *
(
��* +
$str
��+ 4
,
��4 5
AppConstants
��6 B
.
��B C
ID_InvoiceRequest
��C T
,
��T U
invoice
��V ]
.
��] ^ 
ValuationRequestId
��^ p
)
��p q
;
��q r
var
�� 
lastReq
�� 
=
��  !
_invoiceRepo
��" .
.
��. /
GetAll
��/ 5
(
��5 6
)
��6 7
.
��7 8
OrderByDescending
��8 I
(
��I J
a
��J K
=>
��L N
a
��O P
.
��P Q
Id
��Q S
)
��S T
.
��T U
FirstOrDefault
��U c
(
��c d
)
��d e
;
��e f
objIvoiceType
�� !
=
��" #
_mapperFactory
��$ 2
.
��2 3
Get
��3 6
<
��6 7*
ValuationInvoicePaymentModel
��7 S
,
��S T%
ValuationPaymentInvoice
��U l
>
��l m
(
��m n
invoice
��n u
)
��u v
;
��v w
objIvoiceType
�� !
.
��! "
ReferenceNo
��" -
=
��. /
string
��0 6
.
��6 7
Format
��7 =
(
��= >
$str
��> F
,
��F G
id
��H J
,
��J K
lastReq
��L S
?
��S T
.
��T U
Id
��U W
+
��X Y
$num
��Z [
)
��[ \
;
��\ ]
objIvoiceType
�� !
.
��! "
	CreatedBy
��" +
=
��, -
invoice
��. 5
.
��5 6
	CreatedBy
��6 ?
;
��? @
_invoiceRepo
��  
.
��  !
AddAsync
��! )
(
��) *
objIvoiceType
��* 7
)
��7 8
;
��8 9
}
�� 
await
�� 
_unitOfWork
�� !
.
��! "
SaveChangesAsync
��" 2
(
��2 3
)
��3 4
;
��4 5
if
�� 
(
�� 
objIvoiceType
�� !
.
��! "
Id
��" $
==
��% '
$num
��( )
)
��) *
return
�� 
DBOperation
�� &
.
��& '
Error
��' ,
;
��, -
return
�� 
DBOperation
�� "
.
��" #
Success
��# *
;
��* +
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
throw
�� 
ex
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� *
ValuationInvoicePaymentModel
�� 6
>
��6 7 
PaymentInvoiceById
��8 J
(
��J K
int
��K N
id
��O Q
)
��Q R
{
�� 	
var
�� 
_LocationEntity
�� 
=
��  !
new
��" %*
ValuationInvoicePaymentModel
��& B
(
��B C
)
��C D
;
��D E
_LocationEntity
�� 
=
�� 
_mapperFactory
�� ,
.
��, -
Get
��- 0
<
��0 1%
ValuationPaymentInvoice
��1 H
,
��H I*
ValuationInvoicePaymentModel
��J f
>
��f g
(
��g h
await
��h m
_invoiceRepo
��n z
.
��z {
GetAsync��{ �
(��� �
id��� �
)��� �
)��� �
;��� �
return
�� 
_LocationEntity
�� "
;
��" #
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� *
ValuationInvoicePaymentModel
�� ;
>
��; <
>
��< =#
GetPaymentInvoiceById
��> S
(
��S T
int
��T W
	requestId
��X a
)
��a b
{
�� 	
DbParameter
�� 
[
�� 
]
�� 
osqlParameter
�� '
=
��( )
{
�� 
new
�� 
DbParameter
�� 
(
��  
$str
��  +
,
��+ ,
	requestId
��- 6
,
��6 7
	SqlDbType
��8 A
.
��A B
Int
��B E
)
��E F
,
��F G
}
�� 
;
�� 
var
�� 
res
�� 
=
�� 
EltizamDBHelper
�� %
.
��% &!
ExecuteMappedReader
��& 9
<
��9 :*
ValuationInvoicePaymentModel
��: V
>
��V W
(
��W X 
ProcedureMetastore
��X j
.
��j k1
"usp_ValuationInvoice_SearchAllList��k �
,��� � 
DatabaseConnection
�� (
.
��( )

ConnString
��) 3
,
��3 4
CommandType
��5 @
.
��@ A
StoredProcedure
��A P
,
��P Q
osqlParameter
��R _
)
��_ `
;
��` a
return
�� 
res
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
DBOperation
�� %
>
��% &"
DeletePyamentInvoice
��' ;
(
��; <
int
��< ?
id
��@ B
,
��B C
int
��D G
?
��G H
by
��I K
)
��K L
{
�� 	
if
�� 
(
�� 
id
�� 
>
�� 
$num
�� 
)
�� 
{
�� 
var
�� 
payment
�� 
=
�� 
_invoiceRepo
�� *
.
��* +
Get
��+ .
(
��. /
id
��/ 1
)
��1 2
;
��2 3
if
�� 
(
�� 
payment
�� 
!=
�� 
null
�� #
)
��# $
{
�� 
_invoiceRepo
��  
.
��  !
Remove
��! '
(
��' (
payment
��( /
)
��/ 0
;
��0 1
await
�� 
_unitOfWork
�� %
.
��% &
SaveChangesAsync
��& 6
(
��6 7
)
��7 8
;
��8 9
}
�� 
}
�� 
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
}
�� 
}�� ��
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
&&� �
,
&&� �(
IMasterNotificationService
&&� �!
notificationService
&&� �
)
&&� �
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
StoredProcedure	?? �
,
??� �
osqlParameter
??� �
)
??� �
;
??� �
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
%usp_Quotation_GetQuotationByRequestId	MMu �
,
MM� �
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
GetAsync	XXy �
(
XX� �
id
XX� �
)
XX� �
)
XX� �
;
XX� �
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
$usp_Document_GetDocumentByTableKeyId	bbu �
,
bb� �
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
�� 
entityQuatation
�� #
=
��$ %
_repository
��& 1
.
��1 2
Get
��2 5
(
��5 6
x
��6 7
=>
��8 :
x
��; <
.
��< =
Id
��= ?
==
��@ B
id
��C E
)
��E F
;
��F G
if
�� 
(
�� 
entityQuatation
�� #
==
��$ &
null
��' +
)
��+ ,
return
�� 
DBOperation
�� &
.
��& '
NotFound
��' /
;
��/ 0
_repository
�� 
.
�� 
Remove
�� "
(
��" #
entityQuatation
��# 2
)
��2 3
;
��3 4
await
�� 
_unitOfWork
�� !
.
��! "
SaveChangesAsync
��" 2
(
��2 3
)
��3 4
;
��4 5
return
�� 
DBOperation
�� "
.
��" #
Success
��# *
;
��* +
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
throw
�� 
ex
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
DBOperation
�� %
>
��% &
Upsert
��' -
(
��- .)
ValuationQuatationListModel
��. I
entityQuatation
��J Y
)
��Y Z
{
�� 	 
ValuationQuotation
�� 
objQuatation
�� +
;
��+ ,
MasterDocument
�� 
objDocument
�� &
;
��& '+
ValuationRequestApproverLevel
�� )
objApproverLevel
��* :
;
��: ;
string
�� 
MainTableName
��  
=
��! "
Enum
��# '
.
��' (
GetName
��( /
(
��/ 0
TableNameEnum
��0 =
.
��= > 
ValuationQuotation
��> P
)
��P Q
;
��Q R
int
�� 
MainTableKey
�� 
=
�� 
entityQuatation
�� .
.
��. /
Id
��/ 1
;
��1 2
if
�� 
(
�� 
entityQuatation
�� 
.
��  
Id
��  "
>
��# $
$num
��% &
)
��& '
{
��  
ValuationQuotation
�� "
	OldEntity
��# ,
=
��- .
null
��/ 3
;
��3 4
	OldEntity
�� 
=
�� 
_repository
�� '
.
��' (
GetNoTracking
��( 5
(
��5 6
entityQuatation
��6 E
.
��E F
Id
��F H
)
��H I
;
��I J
objQuatation
�� 
=
�� 
_repository
�� *
.
��* +
Get
��+ .
(
��. /
entityQuatation
��/ >
.
��> ?
Id
��? A
)
��A B
;
��B C
var
�� 
OldObjDepartment
�� $
=
��% &
objQuatation
��' 3
;
��3 4
if
�� 
(
�� 
objQuatation
��  
!=
��! #
null
��$ (
)
��( )
{
�� 
objQuatation
��  
.
��  !
ReferenceNo
��! ,
=
��- .
objQuatation
��/ ;
.
��; <
ReferenceNo
��< G
;
��G H
objQuatation
��  
.
��  ! 
ValuationRequestId
��! 3
=
��4 5
entityQuatation
��6 E
.
��E F 
ValuationRequestId
��F X
;
��X Y
objQuatation
��  
.
��  !
ValuationFee
��! -
=
��. /
(
��0 1
decimal
��1 8
)
��8 9
entityQuatation
��9 H
.
��H I
ValuationFee
��I U
;
��U V
objQuatation
��  
.
��  !
Vat
��! $
=
��% &
(
��' (
decimal
��( /
)
��/ 0
entityQuatation
��0 ?
.
��? @
Vat
��@ C
;
��C D
objQuatation
��  
.
��  !
OtherCharges
��! -
=
��. /
entityQuatation
��0 ?
.
��? @
OtherCharges
��@ L
;
��L M
objQuatation
��  
.
��  !
InstructorCharges
��! 2
=
��3 4
entityQuatation
��5 D
.
��D E
InstructorCharges
��E V
;
��V W
objQuatation
��  
.
��  !
Discount
��! )
=
��* +
entityQuatation
��, ;
.
��; <
Discount
��< D
;
��D E
objQuatation
��  
.
��  !
TotalFee
��! )
=
��* +
entityQuatation
��, ;
.
��; <
TotalFee
��< D
;
��D E
objQuatation
��  
.
��  !
StatusId
��! )
=
��* +
objQuatation
��, 8
.
��8 9
StatusId
��9 A
;
��A B
objQuatation
��  
.
��  !

ModifiedBy
��! +
=
��, -
entityQuatation
��. =
.
��= >

ModifiedBy
��> H
;
��H I
_repository
�� 
.
��  
UpdateAsync
��  +
(
��+ ,
objQuatation
��, 8
)
��8 9
;
��9 :
await
�� 
_unitOfWork
�� %
.
��% &
SaveChangesAsync
��& 6
(
��6 7
)
��7 8
;
��8 9
await
�� 
_auditLogService
�� *
.
��* +
CreateAuditLog
��+ 9
<
��9 : 
ValuationQuotation
��: L
>
��L M
(
��M N!
AuditActionTypeEnum
��N a
.
��a b
Update
��b h
,
��h i
	OldEntity
��j s
,
��s t
objQuatation��u �
,��� �
MainTableName��� �
,��� �
MainTableKey��� �
)��� �
;��� �
}
�� 
else
�� 
{
�� 
return
�� 
DBOperation
�� &
.
��& '
NotFound
��' /
;
��/ 0
}
�� 
}
�� 
else
�� 
{
�� 
var
�� 
lastReq
�� 
=
�� 
_repository
�� )
.
��) *
GetAll
��* 0
(
��0 1
)
��1 2
.
��2 3
OrderByDescending
��3 D
(
��D E
a
��E F
=>
��G I
a
��J K
.
��K L
Id
��L N
)
��N O
.
��O P
FirstOrDefault
��P ^
(
��^ _
)
��_ `
;
��` a
objQuatation
�� 
=
�� 
_mapperFactory
�� -
.
��- .
Get
��. 1
<
��1 2)
ValuationQuatationListModel
��2 M
,
��M N 
ValuationQuotation
��O a
>
��a b
(
��b c
entityQuatation
��c r
)
��r s
;
��s t
var
�� 
id
�� 
=
�� 
string
�� 
.
��  
Format
��  &
(
��& '
$str
��' 0
,
��0 1
AppConstants
��2 >
.
��> ?"
ID_QuotationsRequest
��? S
,
��S T
entityQuatation
��U d
.
��d e 
ValuationRequestId
��e w
)
��w x
;
��x y
objQuatation
�� 
.
�� 
ReferenceNo
�� (
=
��) *
string
��+ 1
.
��1 2
Format
��2 8
(
��8 9
$str
��9 A
,
��A B
id
��C E
,
��E F
lastReq
��G N
?
��N O
.
��O P
Id
��P R
+
��S T
$num
��U V
)
��V W
;
��W X
objQuatation
�� 
.
�� 
CreatedDate
�� (
=
��) *
AppConstants
��+ 7
.
��7 8
DateTime
��8 @
;
��@ A
objQuatation
�� 
.
�� 
	CreatedBy
�� &
=
��' (
entityQuatation
��) 8
.
��8 9
	CreatedBy
��9 B
??
��C E
$num
��F G
;
��G H
_repository
�� 
.
�� 
AddAsync
�� $
(
��$ %
objQuatation
��% 1
)
��1 2
;
��2 3
await
�� 
_unitOfWork
�� !
.
��! "
SaveChangesAsync
��" 2
(
��2 3
)
��3 4
;
��4 5
}
�� 
if
�� 
(
�� 
objQuatation
�� 
.
�� 
Id
�� 
==
��  "
$num
��# $
)
��$ %
return
�� 
DBOperation
�� "
.
��" #
Error
��# (
;
��( )
else
�� 
{
�� 
if
�� 
(
�� 
entityQuatation
�� #
.
��# $
uploadDocument
��$ 2
!=
��3 5
null
��6 :
)
��: ;
{
�� 
foreach
�� 
(
�� 
var
��  
doc
��! $
in
��% '
entityQuatation
��( 7
.
��7 8
uploadDocument
��8 F
)
��F G
{
�� 
objDocument
�� #
=
��$ %
_mapperFactory
��& 4
.
��4 5
Get
��5 8
<
��8 9!
MasterDocumentModel
��9 L
,
��L M
MasterDocument
��N \
>
��\ ]
(
��] ^
doc
��^ a
)
��a b
;
��b c
objDocument
�� #
.
��# $
IsActive
��$ ,
=
��- .
doc
��/ 2
.
��2 3
IsActive
��3 ;
;
��; <
objDocument
�� #
.
��# $

TableKeyId
��$ .
=
��/ 0
objQuatation
��1 =
.
��= >
Id
��> @
;
��@ A
objDocument
�� #
.
��# $
	TableName
��$ -
=
��. /
Enum
��0 4
.
��4 5
GetName
��5 <
(
��< =
TableNameEnum
��= J
.
��J K 
ValuationQuotation
��K ]
)
��] ^
;
��^ _
objDocument
�� #
.
��# $
DocumentName
��$ 0
=
��1 2
doc
��3 6
.
��6 7
DocumentName
��7 C
;
��C D
objDocument
�� #
.
��# $
FileName
��$ ,
=
��- .
doc
��/ 2
.
��2 3
FileName
��3 ;
;
��; <
objDocument
�� #
.
��# $
FilePath
��$ ,
=
��- .
doc
��/ 2
.
��2 3
FilePath
��3 ;
;
��; <
objDocument
�� #
.
��# $
FileType
��$ ,
=
��- .
doc
��/ 2
.
��2 3
FileType
��3 ;
;
��; <
objDocument
�� #
.
��# $
	CreatedBy
��$ -
=
��. /
entityQuatation
��0 ?
.
��? @
	CreatedBy
��@ I
;
��I J!
_repositoryDocument
�� +
.
��+ ,
AddAsync
��, 4
(
��4 5
objDocument
��5 @
)
��@ A
;
��A B
await
�� 
_unitOfWork
�� )
.
��) *
SaveChangesAsync
��* :
(
��: ;
)
��; <
;
��< =
}
�� 
}
�� 
}
�� 
{
�� 
DbParameter
�� 
[
�� 
]
�� 
osqlParameter
�� +
=
��, -
{
�� 
new
�� 
DbParameter
�� #
(
��# $
$str
��$ .
,
��. /
entityQuatation
��0 ?
.
��? @ 
ValuationRequestId
��@ R
,
��R S
	SqlDbType
��T ]
.
��] ^
Int
��^ a
)
��a b
,
��b c
new
�� 
DbParameter
�� #
(
��# $
$str
��$ /
,
��/ 0
entityQuatation
��1 @
.
��@ A
	CreatedBy
��A J
,
��J K
	SqlDbType
��L U
.
��U V
Int
��V Y
)
��Y Z
,
��Z [
new
�� 
DbParameter
�� #
(
��# $
$str
��$ /
,
��/ 0
objQuatation
��1 =
.
��= >
Id
��> @
,
��@ A
	SqlDbType
��L U
.
��U V
Int
��V Y
)
��Y Z
,
��Z [
new
�� 
DbParameter
�� #
(
��# $
$str
��$ 1
,
��1 2
entityQuatation
��3 B
.
��B C
ApproverIds
��C N
,
��N O
	SqlDbType
��P Y
.
��Y Z
VarChar
��Z a
)
��a b
,
��b c
}
�� 
;
�� 
EltizamDBHelper
�� 
.
��  
ExecuteNonQuery
��  /
(
��/ 0 
ProcedureMetastore
��0 B
.
��B C7
)usp_ValuationRequest_UpsertApproverLevels
��C l
,
��l m!
DatabaseConnection��n �
.��� �

ConnString��� �
,��� �
CommandType��� �
.��� �
StoredProcedure��� �
,��� �
osqlParameter��� �
)��� �
;��� �
}
�� 
try
�� 
{
�� 
var
�� 
statusid
�� 
=
�� 
_statusrepository
�� 0
.
��0 1
GetAll
��1 7
(
��7 8
)
��8 9
.
��9 :
Where
��: ?
(
��? @
x
��@ A
=>
��B D
x
��E F
.
��F G
Status
��G M
==
��N P
$str
��Q Y
)
��Y Z
.
��Z [
Select
��[ a
(
��a b
x
��b c
=>
��d f
x
��g h
.
��h i
Id
��i k
)
��k l
.
��l m
FirstOrDefault
��m {
(
��{ |
)
��| }
;
��} ~"
_notificationService
�� $
.
��$ %*
UpdateValuationRequestStatus
��% A
(
��A B
statusid
��B J
,
��J K
objQuatation
��L X
.
��X Y 
ValuationRequestId
��Y k
)
��k l
;
��l m
string
�� 
strHtml
�� 
=
��  
File
��! %
.
��% &
ReadAllText
��& 1
(
��1 2
$str
��2 x
)
��x y
;
��y z
strHtml
�� 
=
�� 
strHtml
�� !
.
��! "
Replace
��" )
(
��) *
$str
��* 4
,
��4 5
objQuatation
��6 B
.
��B C
CreatedDate
��C N
.
��N O
ToString
��O W
(
��W X
$str
��X e
)
��e f
)
��f g
;
��g h
strHtml
�� 
=
�� 
strHtml
�� !
.
��! "
Replace
��" )
(
��) *
$str
��* ;
,
��; <
objQuatation
��= I
.
��I J
ValuationFee
��J V
.
��V W
ToString
��W _
(
��_ `
)
��` a
)
��a b
;
��b c
strHtml
�� 
=
�� 
strHtml
�� !
.
��! "
Replace
��" )
(
��) *
$str
��* 1
,
��1 2
objQuatation
��3 ?
.
��? @
Vat
��@ C
.
��C D
ToString
��D L
(
��L M
)
��M N
)
��N O
;
��O P
strHtml
�� 
=
�� 
strHtml
�� !
.
��! "
Replace
��" )
(
��) *
$str
��* :
,
��: ;
objQuatation
��< H
.
��H I
OtherCharges
��I U
.
��U V
ToString
��V ^
(
��^ _
)
��_ `
)
��` a
;
��a b
strHtml
�� 
=
�� 
strHtml
�� !
.
��! "
Replace
��" )
(
��) *
$str
��* H
,
��H I
objQuatation
��J V
.
��V W
InstructorCharges
��W h
.
��h i
ToString
��i q
(
��q r
)
��r s
)
��s t
;
��t u
strHtml
�� 
=
�� 
strHtml
�� !
.
��! "
Replace
��" )
(
��) *
$str
��* 6
,
��6 7
objQuatation
��8 D
.
��D E
Discount
��E M
.
��M N
ToString
��N V
(
��V W
)
��W X
)
��X Y
;
��Y Z
strHtml
�� 
=
�� 
strHtml
�� !
.
��! "
Replace
��" )
(
��) *
$str
��* A
,
��A B
objQuatation
��C O
.
��O P
TotalFee
��P X
.
��X Y
ToString
��Y a
(
��a b
)
��b c
)
��c d
;
��d e
var
�� 
notificationModel
�� %
=
��& '"
_notificationService
��( <
.
��< =*
GetValuationNotificationData
��= Y
(
��Y Z!
RecepientActionEnum
��Z m
.
��m n!
QuaotationCreation��n �
,��� �
objQuatation��� �
.��� �"
ValuationRequestId��� �
)��� �
;��� �
notificationModel
�� !
.
��! "
Subject
��" )
=
��* +

EnumHelper
��, 6
.
��6 7
GetDescription
��7 E
(
��E F!
RecepientActionEnum
��F Y
.
��Y Z 
QuaotationCreation
��Z l
)
��l m
;
��m n
notificationModel
�� !
.
��! "
Body
��" &
=
��' (
strHtml
��) 0
;
��0 1
await
�� "
_notificationService
�� *
.
��* +
	SendEmail
��+ 4
(
��4 5
notificationModel
��5 F
)
��F G
;
��G H
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
throw
�� 
ex
�� 
;
�� 
}
�� 
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� 0
"ValuationRequestApproverLevelModel
�� A
>
��A B
>
��B C
GetApproverLevel
��D T
(
��T U
decimal
��U \
Amount
��] c
,
��c d
int
��e h
ValReqId
��i q
)
��q r
{
�� 	
DbParameter
�� 
[
�� 
]
�� 
osqlParameter
�� '
=
��( )
{
�� 
new
�� 
DbParameter
�� 
(
��  
$str
��  (
,
��( )
Amount
��* 0
,
��0 1
	SqlDbType
��2 ;
.
��; <
Decimal
��< C
)
��C D
,
��D E
new
�� 
DbParameter
�� 
(
��  
$str
��  *
,
��* +
ValReqId
��, 4
,
��4 5
	SqlDbType
��6 ?
.
��? @
Int
��@ C
)
��C D
,
��D E
}
�� 
;
�� 
var
�� 
lstStf
�� 
=
�� 
EltizamDBHelper
�� (
.
��( )!
ExecuteMappedReader
��) <
<
��< =0
"ValuationRequestApproverLevelModel
��= _
>
��_ `
(
��` a 
ProcedureMetastore
��a s
.
��s t1
"usp_ValuationRequest_ApproverLevel��t �
,��� �"
DatabaseConnection��� �
.��� �

ConnString��� �
,��� �
CommandType��� �
.��� �
StoredProcedure��� �
,��� �
osqlParameter��� �
)��� �
;��� �
return
�� 
lstStf
�� 
;
�� 
}
�� 	
}
�� 
}�� �9
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
null	"" �
)
""� �
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
usp_Master_ValuationStatus_List	**m �
,
**� � 
DatabaseConnection
**� �
.
**� �

ConnString
**� �
,
**� �
CommandType
**� �
.
**� �
StoredProcedure
**� �
,
**� �
osqlParameter
**� �
)
**� �
;
**� �
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
'usp_Master_Valuation_InvoiceStatus_List	;;m �
,
;;� � 
DatabaseConnection
;;� �
.
;;� �

ConnString
;;� �
,
;;� �
CommandType
;;� �
.
;;� �
StoredProcedure
;;� �
,
;;� �
osqlParameter
;;� �
)
;;� �
;
;;� �
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
"usp_ValuationRequest_StatusHistory	GGt �
,
GG� � 
DatabaseConnection
GG� �
.
GG� �

ConnString
GG� �
,
GG� �
CommandType
GG� �
.
GG� �
StoredProcedure
GG� �
,
GG� �
osqlParameter
GG� �
)
GG� �
;
GG� �
returnII 
lstStfII 
;II 
}JJ 	
}KK 
}LL ��
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
IHelper	)) �
helper
))� �
,
))� �
IConfiguration
))� �
configuration
))� �
,
))� �(
IMasterNotificationService
))� �!
notificationService
))� �
)
))� �
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
StoredProcedure	XXr �
,
XX� �
osqlParameter
XX� �
)
XX� �
;
XX� �
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
Results	]]z �
.
]]� �
DataTableToList
]]� �
<
]]� �&
ValutionRequestListModel
]]� �
>
]]� �
(
]]� �
)
]]� �
)
]]� �
;
]]� �
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
valuationEntity	{{{ �
,
{{� �
	TableName
{{� �
,
{{� �
id
{{� �
)
{{� �
;
{{� �
}
�� 
await
�� 
_unitOfWork
�� )
.
��) *
SaveChangesAsync
��* :
(
��: ;
)
��; <
;
��< =
}
�� 
return
�� 
DBOperation
�� &
.
��& '
Success
��' .
;
��. /
}
�� 
}
�� 
else
�� 
{
�� 
return
�� 
DBOperation
�� "
.
��" #
NotFound
��# +
;
��+ ,
}
�� 
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
DBOperation
�� %
>
��% &"
AssignApproverStatus
��' ;
(
��; <(
ApprovorStatusRequestModel
��< V
model
��W \
)
��\ ]
{
�� 	
if
�� 
(
�� 
model
�� 
.
�� 

ApprovorId
��  
>
��! "
$num
��# $
&&
��% '
model
��( -
.
��- . 
ValuationRequestId
��. @
>
��A B
$num
��C D
)
��D E
{
�� 
if
�� 
(
�� 
model
�� 
.
�� 
StatusId
�� "
>
��# $
$num
��% &
)
��& '
{
�� 
ValuationRequest
�� $
	OldEntity
��% .
=
��/ 0
null
��1 5
;
��5 6
	OldEntity
�� 
=
�� 
_repository
��  +
.
��+ ,
GetNoTracking
��, 9
(
��9 :
model
��: ?
.
��? @ 
ValuationRequestId
��@ R
)
��R S
;
��S T
var
�� 
	TableName
�� !
=
��" #
Enum
��$ (
.
��( )
GetName
��) 0
(
��0 1
TableNameEnum
��1 >
.
��> ?
ValuationRequest
��? O
)
��O P
;
��P Q
var
�� 
valuationEntity
�� '
=
��( )
_repository
��* 5
.
��5 6
Get
��6 9
(
��9 :
model
��: ?
.
��? @ 
ValuationRequestId
��@ R
)
��R S
;
��S T
valuationEntity
�� #
.
��# $

ApproverId
��$ .
=
��/ 0
model
��1 6
.
��6 7

ApprovorId
��7 A
;
��A B
valuationEntity
�� #
.
��# $
ApproverComment
��$ 3
=
��4 5
model
��6 ;
.
��; <
ApprovorComment
��< K
;
��K L
valuationEntity
�� #
.
��# $
StatusId
��$ ,
=
��- .
model
��/ 4
.
��4 5
StatusId
��5 =
;
��= >
valuationEntity
�� #
.
��# $

ModifiedBy
��$ .
=
��/ 0
model
��1 6
.
��6 7
LogInUserId
��7 B
;
��B C
_repository
�� 
.
��  
UpdateAsync
��  +
(
��+ ,
valuationEntity
��, ;
)
��; <
;
��< =
await
�� 
_unitOfWork
�� %
.
��% &
SaveChangesAsync
��& 6
(
��6 7
)
��7 8
;
��8 9
try
�� 
{
�� 
await
�� 
_auditLogService
�� .
.
��. /
CreateAuditLog
��/ =
<
��= >
ValuationRequest
��> N
>
��N O
(
��O P!
AuditActionTypeEnum
��P c
.
��c d
Update
��d j
,
��j k
	OldEntity
��l u
,
��u v
valuationEntity��w �
,��� �
	TableName��� �
,��� �
model��� �
.��� �"
ValuationRequestId��� �
)��� �
;��� �
var
�� 
newstatusname
�� )
=
��* +
_statusrepository
��, =
.
��= >
GetAll
��> D
(
��D E
)
��E F
.
��F G
Where
��G L
(
��L M
x
��M N
=>
��O Q
x
��R S
.
��S T
Id
��T V
==
��W Y
valuationEntity
��Z i
.
��i j
StatusId
��j r
)
��r s
.
��s t
Select
��t z
(
��z {
x
��{ |
=>
��} 
x��� �
.��� �
Status��� �
)��� �
.��� �
FirstOrDefault��� �
(��� �
)��� �
;��� �
var
�� 
oldstatusname
�� )
=
��* +
_statusrepository
��, =
.
��= >
GetAll
��> D
(
��D E
)
��E F
.
��F G
Where
��G L
(
��L M
x
��M N
=>
��O Q
x
��R S
.
��S T
Id
��T V
==
��W Y
	OldEntity
��Z c
.
��c d
StatusId
��d l
)
��l m
.
��m n
Select
��n t
(
��t u
x
��u v
=>
��w y
x
��z {
.
��{ |
Status��| �
)��� �
.��� �
FirstOrDefault��� �
(��� �
)��� �
;��� �
if
�� 
(
�� 
newstatusname
�� )
!=
��* ,
oldstatusname
��- :
)
��: ;
await
�� !!
SenddDetailsToEmail
��" 5
(
��5 6!
RecepientActionEnum
��6 I
.
��I J$
ValuationStatusChanged
��J `
,
��` a
valuationEntity
��b q
.
��q r
Id
��r t
)
��t u
;
��u v
}
�� 
catch
�� 
(
�� 
	Exception
�� $
ex
��% '
)
��' (
{
�� 
}
�� 
}
�� 
else
�� 
{
�� 
return
�� 
DBOperation
�� &
.
��& '
NotFound
��' /
;
��/ 0
}
�� 
}
�� 
else
�� 
{
�� 
return
�� 
DBOperation
�� "
.
��" #
NotFound
��# +
;
��+ ,
}
�� 
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
DBOperation
�� %
>
��% &!
UpdateRequestStatus
��' :
(
��: ;.
 ValutionRequestStatusChangeModel
��; [
model
��\ a
)
��a b
{
�� 	
int
�� 
?
�� 
By
�� 
=
�� 
model
�� 
.
�� 
LogInUserId
�� '
;
��' (
var
�� 
	TableName
�� 
=
�� 
Enum
��  
.
��  !
GetName
��! (
(
��( )
TableNameEnum
��) 6
.
��6 7
ValuationRequest
��7 G
)
��G H
;
��H I
if
�� 
(
�� 
model
�� 
.
�� 
StatusId
�� 
>
��  
$num
��! "
&&
��# %
model
��& +
.
��+ ,
Id
��, .
>
��/ 0
$num
��1 2
)
��2 3
{
�� 
ValuationRequest
��  
	OldEntity
��! *
=
��+ ,
null
��- 1
;
��1 2
	OldEntity
�� 
=
�� 
_repository
�� '
.
��' (
GetNoTracking
��( 5
(
��5 6
model
��6 ;
.
��; <
Id
��< >
)
��> ?
;
��? @
var
�� 
valuationEntity
�� #
=
��$ %
_repository
��& 1
.
��1 2
Get
��2 5
(
��5 6
model
��6 ;
.
��; <
Id
��< >
)
��> ?
;
��? @
var
�� 
user
�� 
=
�� 
	_userrepo
�� $
.
��$ %
Get
��% (
(
��( )
model
��) .
.
��. /
LogInUserId
��/ :
??
��; =
$num
��> ?
)
��? @
;
��@ A
if
�� 
(
�� 
user
�� 
!=
�� 
null
��  
&&
��! #
user
��$ (
.
��( )
RoleId
��) /
==
��0 2
(
��3 4
int
��4 7
)
��7 8
RoleEnum
��8 @
.
��@ A
Approver
��A I
)
��I J
{
�� 
var
�� 
openApproval
�� $
=
��% &,
_valuationRequestApproverLevel
��' E
.
��E F
Get
��F I
(
��I J
a
��J K
=>
��L N
a
��O P
.
��P Q 
ValuationRequestId
��Q c
==
��d f
model
��g l
.
��l m
Id
��m o
&&
��p r
a
��s t
.
��t u

ApproverId
��u 
==��� �
By��� �
)��� �
;��� �
if
�� 
(
�� 
openApproval
�� $
!=
��% '
null
��( ,
)
��, -
{
�� +
ValuationRequestApproverLevel
�� 5
	oldentity
��6 ?
=
��@ A
null
��B F
;
��F G
	oldentity
�� !
=
��" #,
_valuationRequestApproverLevel
��$ B
.
��B C
GetNoTracking
��C P
(
��P Q
openApproval
��Q ]
.
��] ^
Id
��^ `
)
��` a
;
��a b
var
�� 
ent
�� 
=
��  !,
_valuationRequestApproverLevel
��" @
.
��@ A
Get
��A D
(
��D E
openApproval
��E Q
.
��Q R
Id
��R T
)
��T U
;
��U V
ent
�� 
.
�� 
ApproverComment
�� +
=
��, -
model
��. 3
.
��3 4
ApproverComment
��4 C
;
��C D
ent
�� 
.
�� 
StatusId
�� $
=
��% &
model
��' ,
.
��, -
StatusId
��- 5
;
��5 6
ent
�� 
.
�� 

ModifiedBy
�� &
=
��' (
By
��) +
;
��+ ,,
_valuationRequestApproverLevel
�� 6
.
��6 7
UpdateAsync
��7 B
(
��B C
ent
��C F
)
��F G
;
��G H
await
�� 
_unitOfWork
�� )
.
��) *
SaveChangesAsync
��* :
(
��: ;
)
��; <
;
��< =
}
�� 
var
�� 
openApprovals
�� %
=
��& ',
_valuationRequestApproverLevel
��( F
.
��F G
GetAllAsync
��G R
(
��R S
a
��S T
=>
��U W
a
��X Y
.
��Y Z 
ValuationRequestId
��Z l
==
��m o
model
��p u
.
��u v
Id
��v x
&&
��y {
a
��| }
.
��} ~
StatusId��~ �
==��� �
null��� �
)��� �
.��� �
Result��� �
.��� �
ToList��� �
(��� �
)��� �
;��� �
if
�� 
(
�� 
openApprovals
�� %
!=
��& (
null
��) -
&&
��. 0
openApprovals
��1 >
.
��> ?
Count
��? D
>
��E F
$num
��G H
)
��H I
{
�� 
var
�� 
nxtapp
�� "
=
��# $
openApprovals
��% 2
.
��2 3
OrderBy
��3 :
(
��: ;
a
��; <
=>
��= ?
a
��@ A
.
��A B
ApproverLevelId
��B Q
)
��Q R
.
��R S
FirstOrDefault
��S a
(
��a b
)
��b c
;
��c d
valuationEntity
�� '
.
��' (

ApproverId
��( 2
=
��3 4
nxtapp
��5 ;
?
��; <
.
��< =

ApproverId
��= G
;
��G H
}
�� 
else
�� 
valuationEntity
�� '
.
��' (
StatusId
��( 0
=
��1 2
model
��3 8
.
��8 9
StatusId
��9 A
;
��A B
valuationEntity
�� #
.
��# $
ApproverComment
��$ 3
=
��4 5
model
��6 ;
.
��; <
ApproverComment
��< K
;
��K L
valuationEntity
�� #
.
��# $ 
ApproverUpdateDate
��$ 6
=
��7 8
AppConstants
��9 E
.
��E F
DateTime
��F N
;
��N O
}
�� 
else
�� 
if
�� 
(
�� 
user
�� 
!=
��  
null
��! %
&&
��& (
user
��) -
.
��- .
RoleId
��. 4
==
��5 7
(
��8 9
int
��9 <
)
��< =
RoleEnum
��= E
.
��E F
Valuer
��F L
)
��L M
{
�� 
valuationEntity
�� #
.
��# $
StatusId
��$ ,
=
��- .
model
��/ 4
.
��4 5
StatusId
��5 =
;
��= >
valuationEntity
�� #
.
��# $
ValuerUpdateDate
��$ 4
=
��5 6
AppConstants
��7 C
.
��C D
DateTime
��D L
;
��L M
valuationEntity
�� #
.
��# $
ValuerComment
��$ 1
=
��2 3
model
��4 9
.
��9 :
Comment
��: A
;
��A B
}
�� 
else
�� 
{
�� 
valuationEntity
�� #
.
��# $
StatusId
��$ ,
=
��- .
model
��/ 4
.
��4 5
StatusId
��5 =
;
��= >
}
�� 
valuationEntity
�� 
.
��  

ModifiedBy
��  *
=
��+ ,
By
��- /
;
��/ 0
valuationEntity
�� 
.
��  
StatusComment
��  -
=
��. /
model
��0 5
.
��5 6
Comment
��6 =
;
��= >
_repository
�� 
.
�� 
UpdateAsync
�� '
(
��' (
valuationEntity
��( 7
)
��7 8
;
��8 9
await
�� 
_unitOfWork
�� !
.
��! "
SaveChangesAsync
��" 2
(
��2 3
)
��3 4
;
��4 5
try
�� 
{
�� 
await
�� 
_auditLogService
�� *
.
��* +
CreateAuditLog
��+ 9
<
��9 :
ValuationRequest
��: J
>
��J K
(
��K L!
AuditActionTypeEnum
��L _
.
��_ `
Update
��` f
,
��f g
	OldEntity
��h q
,
��q r
valuationEntity��s �
,��� �
	TableName��� �
,��� �
model��� �
.��� �
Id��� �
)��� �
;��� �
var
�� 
newstatusname
�� %
=
��& '
_statusrepository
��( 9
.
��9 :
GetAll
��: @
(
��@ A
)
��A B
.
��B C
Where
��C H
(
��H I
x
��I J
=>
��K M
x
��N O
.
��O P
Id
��P R
==
��S U
valuationEntity
��V e
.
��e f
StatusId
��f n
)
��n o
.
��o p
Select
��p v
(
��v w
x
��w x
=>
��y {
x
��| }
.
��} ~
Status��~ �
)��� �
.��� �
FirstOrDefault��� �
(��� �
)��� �
;��� �
var
�� 
oldstatusname
�� %
=
��& '
_statusrepository
��( 9
.
��9 :
GetAll
��: @
(
��@ A
)
��A B
.
��B C
Where
��C H
(
��H I
x
��I J
=>
��K M
x
��N O
.
��O P
Id
��P R
==
��S U
	OldEntity
��V _
.
��_ `
StatusId
��` h
)
��h i
.
��i j
Select
��j p
(
��p q
x
��q r
=>
��s u
x
��v w
.
��w x
Status
��x ~
)
��~ 
.�� �
FirstOrDefault��� �
(��� �
)��� �
;��� �
if
�� 
(
�� 
newstatusname
�� %
!=
��& (
oldstatusname
��) 6
)
��6 7
await
�� !
SenddDetailsToEmail
�� 1
(
��1 2!
RecepientActionEnum
��2 E
.
��E F$
ValuationStatusChanged
��F \
,
��\ ]
valuationEntity
��^ m
.
��m n
Id
��n p
)
��p q
;
��q r
}
�� 
catch
�� 
(
�� 
	Exception
��  
ex
��! #
)
��# $
{
�� 
}
�� 
}
�� 
else
�� 
{
�� 
return
�� 
DBOperation
�� "
.
��" #
NotFound
��# +
;
��+ ,
}
�� 
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� 
ValuationMethod
�� .
>
��. /
>
��/ 0#
GetAllValuationMethod
��1 F
(
��F G
)
��G H
{
�� 	
var
�� 
lstStf
�� 
=
�� 
EltizamDBHelper
�� (
.
��( )!
ExecuteMappedReader
��) <
<
��< =
ValuationMethod
��= L
>
��L M
(
��M N 
ProcedureMetastore
��N `
.
��` a)
usp_ValuationMethod_AllList
��a |
,
��| } 
DatabaseConnection
�� ,
.
��, -

ConnString
��- 7
,
��7 8
CommandType
��9 D
.
��D E
StoredProcedure
��E T
,
��T U
null
��V Z
)
��Z [
;
��[ \
return
�� 
lstStf
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
DBOperation
�� %
>
��% &
Upsert
��' -
(
��- .#
ValuationRequestModel
��. C
entityValuation
��D S
)
��S T
{
�� 	
ValuationRequest
�� 
objValuation
�� )
;
��) *
string
�� 
MainTableName
��  
=
��! "
Enum
��# '
.
��' (
GetName
��( /
(
��/ 0
TableNameEnum
��0 =
.
��= >
ValuationRequest
��> N
)
��N O
;
��O P
int
�� 
MainTableKey
�� 
=
�� 
entityValuation
�� .
.
��. /
Id
��/ 1
;
��1 2
try
�� 
{
�� 
ValuationRequest
��  
	OldEntity
��! *
=
��+ ,
null
��- 1
;
��1 2
if
�� 
(
�� 
entityValuation
�� #
.
��# $
Id
��$ &
>
��' (
$num
��) *
)
��* +
{
�� 
	OldEntity
�� 
=
�� 
_repository
��  +
.
��+ ,
GetNoTracking
��, 9
(
��9 :
entityValuation
��: I
.
��I J
Id
��J L
)
��L M
;
��M N
objValuation
��  
=
��! "
_repository
��# .
.
��. /
Get
��/ 2
(
��2 3
entityValuation
��3 B
.
��B C
Id
��C E
)
��E F
;
��F G
if
�� 
(
�� 
objValuation
�� $
!=
��% '
null
��( ,
)
��, -
{
�� 
objValuation
�� $
.
��$ %
ReferenceNo
��% 0
=
��1 2
entityValuation
��3 B
.
��B C
ReferenceNo
��C N
??
��O Q
$str
��R T
;
��T U
objValuation
�� $
.
��$ %
OtherReferenceNo
��% 5
=
��6 7
entityValuation
��8 G
.
��G H
OtherReferenceNo
��H X
;
��X Y
objValuation
�� $
.
��$ %
StatusId
��% -
=
��. /
entityValuation
��0 ?
.
��? @
StatusId
��@ H
;
��H I
objValuation
�� $
.
��$ % 
ValuationTimeFrame
��% 7
=
��8 9
entityValuation
��: I
.
��I J 
ValuationTimeFrame
��J \
;
��\ ]
objValuation
�� $
.
��$ %

ApproverId
��% /
=
��0 1
entityValuation
��2 A
.
��A B

ApproverId
��B L
==
��M O
$num
��P Q
?
��R S
null
��T X
:
��Y Z
entityValuation
��[ j
.
��j k

ApproverId
��k u
;
��u v
objValuation
�� $
.
��$ %
ValuerId
��% -
=
��. /
entityValuation
��0 ?
.
��? @
ValuerId
��@ H
==
��I K
$num
��L M
?
��N O
null
��P T
:
��U V
entityValuation
��W f
.
��f g
ValuerId
��g o
;
��o p
objValuation
�� $
.
��$ %
ValuationDate
��% 2
=
��3 4
entityValuation
��5 D
.
��D E
ValuationDate
��E R
;
��R S
objValuation
�� $
.
��$ %
ValuationModeId
��% 4
=
��5 6
entityValuation
��7 F
.
��F G
ValuationModeId
��G V
;
��V W
objValuation
�� $
.
��$ %

PropertyId
��% /
=
��0 1
entityValuation
��2 A
.
��A B

PropertyId
��B L
;
��L M
objValuation
�� $
.
��$ %
ClientId
��% -
=
��. /
entityValuation
��0 ?
.
��? @
ClientId
��@ H
;
��H I
objValuation
�� $
.
��$ %
ApproverComment
��% 4
=
��5 6
entityValuation
��7 F
.
��F G
ApproverComment
��G V
;
��V W
objValuation
�� $
.
��$ %

ModifiedBy
��% /
=
��0 1
entityValuation
��2 A
.
��A B

ModifiedBy
��B L
;
��L M
_repository
�� #
.
��# $
UpdateAsync
��$ /
(
��/ 0
objValuation
��0 <
)
��< =
;
��= >
await
�� 
_unitOfWork
�� )
.
��) *
SaveChangesAsync
��* :
(
��: ;
)
��; <
;
��< =
await
�� !"
UpsertApproverLevels
��" 6
(
��6 7
entityValuation
��7 F
.
��F G
Id
��G I
,
��I J
entityValuation
��K Z
.
��Z [%
ValuationApprovalValues
��[ r
,
��r s
entityValuation��t �
.��� �

ModifiedBy��� �
)��� �
;��� �
try
�� 
{
�� 
var
�� 
newstatusname
��  -
=
��. /
_statusrepository
��0 A
.
��A B
GetAll
��B H
(
��H I
)
��I J
.
��J K
Where
��K P
(
��P Q
x
��Q R
=>
��S U
x
��V W
.
��W X
Id
��X Z
==
��[ ]
objValuation
��^ j
.
��j k
StatusId
��k s
)
��s t
.
��t u
Select
��u {
(
��{ |
x
��| }
=>��~ �
x��� �
.��� �
Status��� �
)��� �
.��� �
FirstOrDefault��� �
(��� �
)��� �
;��� �
var
�� 
oldstatusname
��  -
=
��. /
_statusrepository
��0 A
.
��A B
GetAll
��B H
(
��H I
)
��I J
.
��J K
Where
��K P
(
��P Q
x
��Q R
=>
��S U
x
��V W
.
��W X
Id
��X Z
==
��[ ]
	OldEntity
��^ g
.
��g h
StatusId
��h p
)
��p q
.
��q r
Select
��r x
(
��x y
x
��y z
=>
��{ }
x
��~ 
.�� �
Status��� �
)��� �
.��� �
FirstOrDefault��� �
(��� �
)��� �
;��� �
if
�� 
(
��  
newstatusname
��  -
!=
��. 0
oldstatusname
��1 >
)
��> ?
await
��  %!
SenddDetailsToEmail
��& 9
(
��9 :!
RecepientActionEnum
��: M
.
��M N$
ValuationStatusChanged
��N d
,
��d e
objValuation
��f r
.
��r s
Id
��s u
)
��u v
;
��v w
await
�� !
_auditLogService
��" 2
.
��2 3
CreateAuditLog
��3 A
<
��A B
ValuationRequest
��B R
>
��R S
(
��S T!
AuditActionTypeEnum
��T g
.
��g h
Update
��h n
,
��n o
	OldEntity
��p y
,
��y z
objValuation��{ �
,��� �
MainTableName��� �
,��� �
MainTableKey��� �
)��� �
;��� �
}
�� 
catch
�� 
(
�� 
	Exception
�� (
ex
��) +
)
��+ ,
{
�� 
}
�� 
}
�� 
else
�� 
{
�� 
return
�� 
DBOperation
�� *
.
��* +
NotFound
��+ 3
;
��3 4
}
�� 
}
�� 
else
�� 
{
�� 
var
�� 
lastReq
�� 
=
��  !
_repository
��" -
.
��- .
GetAll
��. 4
(
��4 5
)
��5 6
.
��6 7
OrderByDescending
��7 H
(
��H I
a
��I J
=>
��K M
a
��N O
.
��O P
Id
��P R
)
��R S
.
��S T
FirstOrDefault
��T b
(
��b c
)
��c d
;
��d e
objValuation
��  
=
��! "
_mapperFactory
��# 1
.
��1 2
Get
��2 5
<
��5 6#
ValuationRequestModel
��6 K
,
��K L
ValuationRequest
��M ]
>
��] ^
(
��^ _
entityValuation
��_ n
)
��n o
;
��o p
objValuation
��  
.
��  !
	CreatedBy
��! *
=
��+ ,
(
��- .
int
��. 1
)
��1 2
entityValuation
��2 A
.
��A B
	CreatedBy
��B K
;
��K L
objValuation
��  
.
��  !
ReferenceNo
��! ,
=
��- .
string
��/ 5
.
��5 6
Format
��6 <
(
��< =
$str
��= E
,
��E F
AppConstants
��G S
.
��S T!
ID_ValuationRequest
��T g
,
��g h
lastReq
��i p
?
��p q
.
��q r
Id
��r t
+
��u v
$num
��w x
)
��x y
;
��y z
objValuation
��  
.
��  !

ApproverId
��! +
=
��, -
objValuation
��. :
.
��: ;

ApproverId
��; E
==
��F H
$num
��I J
?
��K L
null
��M Q
:
��R S
objValuation
��T `
.
��` a

ApproverId
��a k
;
��k l
objValuation
��  
.
��  !
ValuerId
��! )
=
��* +
objValuation
��, 8
.
��8 9
ValuerId
��9 A
==
��B D
$num
��E F
?
��G H
null
��I M
:
��N O
objValuation
��P \
.
��\ ]
ValuerId
��] e
;
��e f
_repository
�� 
.
��  
AddAsync
��  (
(
��( )
objValuation
��) 5
)
��5 6
;
��6 7
await
�� 
_unitOfWork
�� %
.
��% &
SaveChangesAsync
��& 6
(
��6 7
)
��7 8
;
��8 9
try
�� 
{
�� 
await
�� !
SenddDetailsToEmail
�� 1
(
��1 2!
RecepientActionEnum
��2 E
.
��E F
ValuationCreated
��F V
,
��V W
objValuation
��X d
.
��d e
Id
��e g
)
��g h
;
��h i
}
�� 
catch
�� 
(
�� 
	Exception
�� $
ex
��% '
)
��' (
{
�� 
}
�� 
}
�� 
if
�� 
(
�� 
objValuation
��  
.
��  !
Id
��! #
==
��$ &
$num
��' (
)
��( )
return
�� 
DBOperation
�� &
.
��& '
Error
��' ,
;
��, -
return
�� 
DBOperation
�� "
.
��" #
Success
��# *
;
��* +
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
throw
�� 
ex
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� *
ValuationRequestDependencies
�� 6
>
��6 7%
GetValuationRequestInfo
��8 O
(
��O P
int
��P S
Id
��T V
)
��V W
{
�� 	
DbParameter
�� 
[
�� 
]
�� 
osqlParameter
�� '
=
��( )
{
�� 
new
�� 
DbParameter
�� 
(
��  
$str
��  $
,
��$ %
Id
��& (
,
��( )
	SqlDbType
��* 3
.
��3 4
Int
��4 7
)
��7 8
,
��8 9
}
�� 
;
�� 
var
�� 
res
�� 
=
�� 
EltizamDBHelper
�� %
.
��% &!
ExecuteMappedReader
��& 9
<
��9 :*
ValuationRequestDependencies
��: V
>
��V W
(
��W X 
ProcedureMetastore
��X j
.
��j k3
$usp_ValuationRequest_GetDependencies��k �
,��� � 
DatabaseConnection
�� (
.
��( )

ConnString
��) 3
,
��3 4
CommandType
��5 @
.
��@ A
StoredProcedure
��A P
,
��P Q
osqlParameter
��R _
)
��_ `
.
��` a
FirstOrDefault
��a o
(
��o p
)
��p q
;
��q r
return
�� 
res
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� #
ValuationRequestModel
�� /
>
��/ 0
GetById
��1 8
(
��8 9
int
��9 <
id
��= ?
)
��? @
{
�� 	
try
�� 
{
�� 
var
�� 
sitetableName
�� !
=
��" #
Enum
��$ (
.
��( )
GetName
��) 0
(
��0 1
TableNameEnum
��1 >
.
��> ?
SiteDescription
��? N
)
��N O
;
��O P
var
�� 
evidencetableName
�� %
=
��& '
Enum
��( ,
.
��, -
GetName
��- 4
(
��4 5
TableNameEnum
��5 B
.
��B C!
Comparable_Evidence
��C V
)
��V W
;
��W X
var
��  
assesmenttableName
�� &
=
��' (
Enum
��) -
.
��- .
GetName
��. 5
(
��5 6
TableNameEnum
��6 C
.
��C D#
Valuation_Assessement
��D Y
)
��Y Z
;
��Z [
var
�� 
_ValuationEntity
�� $
=
��% &
new
��' *#
ValuationRequestModel
��+ @
(
��@ A
)
��A B
;
��B C
var
�� 
_assesmentAction
�� $
=
��% &
new
��' *+
ValuationAssesmentActionModel
��+ H
(
��H I
)
��I J
;
��J K
var
�� 
siteDescription
�� #
=
��$ %
new
��& )"
SiteDescriptionModel
��* >
(
��> ?
)
��? @
;
��@ A
var
�� 
compevidence
��  
=
��! "
new
��# &%
ComparableEvidenceModel
��' >
(
��> ?
)
��? @
;
��@ A
var
�� 
assement
�� 
=
�� 
new
�� "'
ValuationAssessementModel
��# <
(
��< =
)
��= >
;
��> ?
var
�� 
approvellevel
�� !
=
��" #
new
��$ '
List
��( ,
<
��, -0
"ValuationRequestApproverLevelModel
��- O
>
��O P
(
��P Q
)
��Q R
;
��R S
_ValuationEntity
��  
=
��! "
_mapperFactory
��# 1
.
��1 2
Get
��2 5
<
��5 6
ValuationRequest
��6 F
,
��F G#
ValuationRequestModel
��H ]
>
��] ^
(
��^ _
await
��_ d
_repository
��e p
.
��p q
GetAsync
��q y
(
��y z
id
��z |
)
��| }
)
��} ~
;
��~ 
_ValuationEntity
��  
.
��  ! 
ValuationAssesment
��! 3
=
��4 5
new
��6 9+
ValuationAssesmentActionModel
��: W
(
��W X
)
��X Y
;
��Y Z
_ValuationEntity
��  
.
��  ! 
ValuationAssesment
��! 3
.
��3 4
SiteDescription
��4 C
=
��D E
new
��F I"
SiteDescriptionModel
��J ^
(
��^ _
)
��_ `
;
��` a
_ValuationEntity
��  
.
��  ! 
ValuationAssesment
��! 3
.
��3 4%
comparableEvidenceModel
��4 K
=
��L M
new
��N Q%
ComparableEvidenceModel
��R i
(
��i j
)
��j k
;
��k l
_ValuationEntity
��  
.
��  ! 
ValuationAssesment
��! 3
.
��3 4'
valuationAssessementModel
��4 M
=
��N O
new
��P S'
ValuationAssessementModel
��T m
(
��m n
)
��n o
;
��o p
_ValuationEntity
��  
.
��  !+
ValuationRequestApproverLevel
��! >
=
��? @
new
��A D
List
��E I
<
��I J0
"ValuationRequestApproverLevelModel
��J l
>
��l m
(
��m n
)
��n o
;
��o p
var
�� 
res
�� 
=
�� 
await
�� %
GetValuationRequestInfo
��  7
(
��7 8
id
��8 :
)
��: ;
;
��; <
if
�� 
(
�� 
res
�� 
!=
�� 
null
�� 
)
��  
{
�� 
_ValuationEntity
�� $
.
��$ %
ClientId
��% -
=
��. /
res
��0 3
.
��3 4
ClientId
��4 <
;
��< =
_ValuationEntity
�� $
.
��$ %
ClientTypeId
��% 1
=
��2 3
res
��4 7
.
��7 8
ClientTypeId
��8 D
;
��D E
_ValuationEntity
�� $
.
��$ %

ClientName
��% /
=
��0 1
res
��2 5
.
��5 6

ClientName
��6 @
;
��@ A
_ValuationEntity
�� $
.
��$ %
PropertyTypeId
��% 3
=
��4 5
res
��6 9
.
��9 :
PropertyTypeId
��: H
;
��H I
_ValuationEntity
�� $
.
��$ %
PropertyName
��% 1
=
��2 3
res
��4 7
.
��7 8
PropertyType
��8 D
;
��D E
_ValuationEntity
�� $
.
��$ %
PropertySubTypeId
��% 6
=
��7 8
res
��9 <
.
��< =
PropertySubTypeId
��= N
;
��N O
_ValuationEntity
�� $
.
��$ %
PropertySubType
��% 4
=
��5 6
res
��7 :
.
��: ;
PropertySubType
��; J
;
��J K
_ValuationEntity
�� $
.
��$ %
OwnershipTypeId
��% 4
=
��5 6
res
��7 :
.
��: ;
OwnershipTypeId
��; J
;
��J K
_ValuationEntity
�� $
.
��$ %
OwnershipType
��% 2
=
��3 4
res
��5 8
.
��8 9
OwnershipType
��9 F
;
��F G
_ValuationEntity
�� $
.
��$ %

PropertyId
��% /
=
��0 1
res
��2 5
.
��5 6

PropertyId
��6 @
;
��@ A
_ValuationEntity
�� $
.
��$ %
PropertyName
��% 1
=
��2 3
res
��4 7
.
��7 8
PropertyName
��8 D
;
��D E
_ValuationEntity
�� $
.
��$ %

UnitTypeId
��% /
=
��0 1
res
��2 5
.
��5 6

UnitTypeId
��6 @
;
��@ A
_ValuationEntity
�� $
.
��$ %
FurnishedId
��% 0
=
��1 2
res
��3 6
.
��6 7
FurnishedId
��7 B
;
��B C
_ValuationEntity
�� $
.
��$ %
LocationCountryId
��% 6
=
��7 8
res
��9 <
.
��< =
LocationCountryId
��= N
;
��N O
_ValuationEntity
�� $
.
��$ %
LocationStateId
��% 4
=
��5 6
res
��7 :
.
��: ;
LocationStateId
��; J
;
��J K
_ValuationEntity
�� $
.
��$ %
LocationCityId
��% 3
=
��4 5
res
��6 9
.
��9 :
LocationCityId
��: H
;
��H I
_ValuationEntity
�� $
.
��$ %

StatusName
��% /
=
��0 1
res
��2 5
.
��5 6

StatusName
��6 @
;
��@ A
_ValuationEntity
�� $
.
��$ %
	ColorCode
��% .
=
��/ 0
res
��1 4
.
��4 5
	ColorCode
��5 >
;
��> ?
_ValuationEntity
�� $
.
��$ %
BackGroundColor
��% 4
=
��5 6
res
��7 :
.
��: ;
BackGroundColor
��; J
;
��J K
siteDescription
�� #
=
��$ %
_mapperFactory
��& 4
.
��4 5
Get
��5 8
<
��8 9&
ValuationSiteDescription
��9 Q
,
��Q R"
SiteDescriptionModel
��S g
>
��g h
(
��h i
_siterepository
��i x
.
��x y
Get
��y |
(
��| }
x
��} ~
=>�� �
x��� �
.��� �"
ValuationRequestId��� �
==��� �
id��� �
)��� �
)��� �
;��� �
approvellevel
�� !
=
��" #
await
��$ )
GetApproverLevel
��* :
(
��: ;
id
��; =
)
��= >
;
��> ?
_ValuationEntity
�� $
.
��$ %+
ValuationRequestApproverLevel
��% B
=
��C D
approvellevel
��E R
;
��R S
if
�� 
(
�� 
siteDescription
�� '
!=
��( *
null
��+ /
)
��/ 0
{
�� 
_ValuationEntity
�� (
.
��( ) 
ValuationAssesment
��) ;
.
��; <
SiteDescription
��< K
=
��L M
siteDescription
��N ]
;
��] ^
DbParameter
�� #
[
��# $
]
��$ %
osqlParameter2
��& 4
=
��5 6
{
�� 
new
�� 
DbParameter
�� '
(
��' (
AppConstants
��( 4
.
��4 5

TableKeyId
��5 ?
,
��? @
siteDescription
��A P
.
��P Q
Id
��Q S
,
��S T
	SqlDbType
��U ^
.
��^ _
Int
��_ b
)
��b c
,
��c d
new
�� 
DbParameter
�� '
(
��' (
AppConstants
��( 4
.
��4 5
	TableName
��5 >
,
��> ?
sitetableName
��A N
,
��N O
	SqlDbType
��P Y
.
��Y Z
VarChar
��Z a
)
��a b
,
��b c
}
�� 
;
�� 
var
�� 
siteDocuments
�� )
=
��* +
EltizamDBHelper
��, ;
.
��; <!
ExecuteMappedReader
��< O
<
��O P!
MasterDocumentModel
��P c
>
��c d
(
��d e 
ProcedureMetastore
��e w
.
��w x3
$usp_Document_GetDocumentByTableKeyId��x �
,��� � 
DatabaseConnection
��, >
.
��> ?

ConnString
��? I
,
��I J
System
��K Q
.
��Q R
Data
��R V
.
��V W
CommandType
��W b
.
��b c
StoredProcedure
��c r
,
��r s
osqlParameter2��t �
)��� �
;��� �
if
�� 
(
�� 
siteDocuments
�� )
!=
��* ,
null
��- 1
)
��1 2
_ValuationEntity
�� ,
.
��, - 
ValuationAssesment
��- ?
.
��? @
SiteDescription
��@ O
.
��O P
	Documents
��P Y
=
��Z [
siteDocuments
��\ i
;
��i j
}
�� 
compevidence
��  
=
��! "
_mapperFactory
��# 1
.
��1 2
Get
��2 5
<
��5 6)
ValuationComparableEvidence
��6 Q
,
��Q R%
ComparableEvidenceModel
��S j
>
��j k
(
��k l!
_evidencerepository
��l 
.�� �
Get��� �
(��� �
x��� �
=>��� �
x��� �
.��� �
	RequestId��� �
==��� �
id��� �
)��� �
)��� �
;��� �
if
�� 
(
�� 
compevidence
�� $
!=
��% '
null
��( ,
)
��, -
{
�� 
_ValuationEntity
�� (
.
��( ) 
ValuationAssesment
��) ;
.
��; <%
comparableEvidenceModel
��< S
=
��T U
compevidence
��V b
;
��b c
DbParameter
�� #
[
��# $
]
��$ %
osqlParameter3
��& 4
=
��5 6
{
�� 
new
�� 
DbParameter
�� '
(
��' (
AppConstants
��( 4
.
��4 5

TableKeyId
��5 ?
,
��? @
compevidence
��A M
.
��M N
Id
��N P
,
��P Q
	SqlDbType
��R [
.
��[ \
Int
��\ _
)
��_ `
,
��` a
new
�� 
DbParameter
�� '
(
��' (
AppConstants
��( 4
.
��4 5
	TableName
��5 >
,
��> ?
evidencetableName
��A R
,
��R S
	SqlDbType
��T ]
.
��] ^
VarChar
��^ e
)
��e f
,
��f g
}
�� 
;
�� 
var
�� 
compDocument
�� (
=
��) *
EltizamDBHelper
��+ :
.
��: ;!
ExecuteMappedReader
��; N
<
��N O!
MasterDocumentModel
��O b
>
��b c
(
��c d 
ProcedureMetastore
��d v
.
��v w3
$usp_Document_GetDocumentByTableKeyId��w �
,��� � 
DatabaseConnection
��+ =
.
��= >

ConnString
��> H
,
��H I
System
��J P
.
��P Q
Data
��Q U
.
��U V
CommandType
��V a
.
��a b
StoredProcedure
��b q
,
��q r
osqlParameter3��s �
)��� �
;��� �
if
�� 
(
�� 
compDocument
�� (
!=
��) +
null
��, 0
)
��0 1
{
�� 
_ValuationEntity
�� ,
.
��, - 
ValuationAssesment
��- ?
.
��? @%
comparableEvidenceModel
��@ W
.
��W X
	Documents
��X a
=
��b c
compDocument
��d p
;
��p q
}
�� 
}
�� 
assement
�� 
=
�� 
_mapperFactory
�� -
.
��- .
Get
��. 1
<
��1 2 
ValuationAssesment
��2 D
,
��D E'
ValuationAssessementModel
��F _
>
��_ `
(
��` a#
_assesmenterepository
��a v
.
��v w
Get
��w z
(
��z {
x
��{ |
=>
��} 
x��� �
.��� �
	RequestId��� �
==��� �
id��� �
)��� �
)��� �
;��� �
if
�� 
(
�� 
assement
��  
!=
��! #
null
��$ (
)
��( )
{
�� 
_ValuationEntity
�� (
.
��( ) 
ValuationAssesment
��) ;
.
��; <'
valuationAssessementModel
��< U
=
��V W
assement
��X `
;
��` a
DbParameter
�� #
[
��# $
]
��$ %
osqlParameter4
��& 4
=
��5 6
{
�� 
new
�� 
DbParameter
�� '
(
��' (
AppConstants
��( 4
.
��4 5

TableKeyId
��5 ?
,
��? @
compevidence
��A M
.
��M N
Id
��N P
,
��P Q
	SqlDbType
��R [
.
��[ \
Int
��\ _
)
��_ `
,
��` a
new
�� 
DbParameter
�� '
(
��' (
AppConstants
��( 4
.
��4 5
	TableName
��5 >
,
��> ? 
assesmenttableName
��A S
,
��S T
	SqlDbType
��U ^
.
��^ _
VarChar
��_ f
)
��f g
,
��g h
}
�� 
;
�� 
var
�� 
assesmentDocument
�� -
=
��. /
EltizamDBHelper
��0 ?
.
��? @!
ExecuteMappedReader
��@ S
<
��S T!
MasterDocumentModel
��T g
>
��g h
(
��h i 
ProcedureMetastore
��i {
.
��{ |3
$usp_Document_GetDocumentByTableKeyId��| �
,��� � 
DatabaseConnection
��0 B
.
��B C

ConnString
��C M
,
��M N
System
��O U
.
��U V
Data
��V Z
.
��Z [
CommandType
��[ f
.
��f g
StoredProcedure
��g v
,
��v w
osqlParameter4��x �
)��� �
;��� �
if
�� 
(
�� 
assesmentDocument
�� -
!=
��. 0
null
��1 5
)
��5 6
{
�� 
_ValuationEntity
�� ,
.
��, - 
ValuationAssesment
��- ?
.
��? @'
valuationAssessementModel
��@ Y
.
��Y Z
	Documents
��Z c
=
��d e
assesmentDocument
��f w
;
��w x
}
�� 
}
�� 
}
�� 
return
�� 
_ValuationEntity
�� '
;
��' (
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
throw
�� 
ex
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
DBOperation
�� %
>
��% &
Delete
��' -
(
��- .
int
��. 1
id
��2 4
)
��4 5
{
�� 	
var
�� 
entityValuation
�� 
=
��  !
_repository
��" -
.
��- .
Get
��. 1
(
��1 2
x
��2 3
=>
��4 6
x
��7 8
.
��8 9
Id
��9 ;
==
��< >
id
��? A
)
��A B
;
��B C
if
�� 
(
�� 
entityValuation
�� 
==
��  "
null
��# '
)
��' (
return
�� 
DBOperation
�� "
.
��" #
NotFound
��# +
;
��+ ,
_repository
�� 
.
�� 
Remove
�� 
(
�� 
entityValuation
�� .
)
��. /
;
��/ 0
await
�� 
_unitOfWork
�� 
.
�� 
SaveChangesAsync
�� .
(
��. /
)
��/ 0
;
��0 1
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� !
SenddDetailsToEmail
��  3
(
��3 4!
RecepientActionEnum
��4 G
subjectEnum
��H S
,
��S T
int
��U X 
valuationrequestId
��Y k
)
��k l
{
�� 	
try
�� 
{
�� 
var
�� 
notificationModel
�� %
=
��& '"
_notificationService
��( <
.
��< =*
GetValuationNotificationData
��= Y
(
��Y Z
subjectEnum
��Z e
,
��e f 
valuationrequestId
��g y
)
��y z
;
��z {
string
�� 
strHtml
�� 
=
��  
File
��! %
.
��% &
ReadAllText
��& 1
(
��1 2
$str
��2 u
)
��u v
;
��v w
if
�� 
(
�� 
subjectEnum
�� 
==
��  "!
RecepientActionEnum
��# 6
.
��6 7
ValuationCreated
��7 G
)
��G H
{
�� 
strHtml
�� 
=
�� 
File
�� "
.
��" #
ReadAllText
��# .
(
��. /
$str
��/ m
)
��m n
;
��n o
}
�� 
strHtml
�� 
=
�� 
strHtml
�� !
.
��! "
Replace
��" )
(
��) *
$str
��* 8
,
��8 9
notificationModel
��: K
.
��K L
ValRefNo
��L T
)
��T U
;
��U V
strHtml
�� 
=
�� 
strHtml
�� !
.
��! "
Replace
��" )
(
��) *
$str
��* 4
,
��4 5
DateTime
��6 >
.
��> ?
Now
��? B
.
��B C
ToString
��C K
(
��K L
$str
��L Y
)
��Y Z
)
��Z [
;
��[ \
strHtml
�� 
=
�� 
strHtml
�� !
.
��! "
Replace
��" )
(
��) *
$str
��* 9
,
��9 :
notificationModel
��; L
.
��L M
Status
��M S
)
��S T
;
��T U
notificationModel
�� !
.
��! "
Subject
��" )
=
��* +

EnumHelper
��, 6
.
��6 7
GetDescription
��7 E
(
��E F
subjectEnum
��F Q
)
��Q R
;
��R S
notificationModel
�� !
.
��! "
Body
��" &
=
��' (
strHtml
��) 0
;
��0 1
await
�� "
_notificationService
�� *
.
��* +
	SendEmail
��+ 4
(
��4 5
notificationModel
��5 F
)
��F G
;
��G H
return
�� 
true
�� 
;
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
)
�� 
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
DBOperation
�� %
>
��% &"
UpsertApproverLevels
��' ;
(
��; <
int
��< ?
ValReqId
��@ H
,
��H I
string
��J P
RequestData
��Q \
,
��\ ]
int
��^ a
?
��a b
	CreatedBy
��c l
,
��l m
int
��n q
?
��q r
	ValQuotId
��s |
=
��} ~
null�� �
)��� �
{
�� 	
DbParameter
�� 
[
�� 
]
�� 
osqlParameter
�� '
=
��( )
{
�� 
new
�� 
DbParameter
�� 
(
��  
$str
��  *
,
��* +
ValReqId
��/ 7
,
��7 8
	SqlDbType
��9 B
.
��B C
Int
��C F
)
��F G
,
��G H
new
�� 
DbParameter
�� 
(
��  
$str
��  +
,
��+ ,
	CreatedBy
��/ 8
,
��8 9
	SqlDbType
��: C
.
��C D
Int
��D G
)
��G H
,
��H I
new
�� 
DbParameter
�� 
(
��  
$str
��  +
,
��+ ,
	ValQuotId
��/ 8
,
��8 9
	SqlDbType
��: C
.
��C D
Int
��D G
)
��G H
,
��H I
new
�� 
DbParameter
�� 
(
��  
$str
��  -
,
��- .
RequestData
��/ :
,
��: ;
	SqlDbType
��< E
.
��E F
VarChar
��F M
)
��M N
,
��N O
}
�� 
;
�� 
EltizamDBHelper
�� 
.
�� 
ExecuteNonQuery
�� +
(
��+ , 
ProcedureMetastore
��, >
.
��> ?7
)usp_ValuationRequest_UpsertApproverLevels
��? h
,
��h i 
DatabaseConnection
��j |
.
��| }

ConnString��} �
,��� �
CommandType��� �
.��� �
StoredProcedure��� �
,��� �
osqlParameter��� �
)��� �
;��� �
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
�� 0
"ValuationRequestApproverLevelModel
�� A
>
��A B
>
��B C
GetApproverLevel
��D T
(
��T U
int
��U X
ValReqId
��Y a
,
��a b
decimal
��c j
?
��j k
Amount
��l r
=
��s t
null
��u y
)
��y z
{
�� 	
DbParameter
�� 
[
�� 
]
�� 
osqlParameter
�� '
=
��( )
{
�� 
new
�� 
DbParameter
�� 
(
��  
$str
��  *
,
��* +
ValReqId
��, 4
,
��4 5
	SqlDbType
��6 ?
.
��? @
Int
��@ C
)
��C D
,
��D E
new
�� 
DbParameter
�� 
(
��  
$str
��  (
,
��( )
Amount
��* 0
,
��0 1
	SqlDbType
��6 ?
.
��? @
Decimal
��@ G
)
��G H
}
�� 
;
�� 
var
�� 
lstStf
�� 
=
�� 
EltizamDBHelper
�� (
.
��( )!
ExecuteMappedReader
��) <
<
��< =0
"ValuationRequestApproverLevelModel
��= _
>
��_ `
(
��` a 
ProcedureMetastore
��a s
.
��s t1
"usp_ValuationRequest_ApproverLevel��t �
,��� �"
DatabaseConnection��� �
.��� �

ConnString��� �
,��� �
CommandType��� �
.��� �
StoredProcedure��� �
,��� �
osqlParameter��� �
)��� �
;��� �
return
�� 
lstStf
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
DBOperation
�� %
>
��% &#
ApproverActionComment
��' <
(
��< =(
ApproverActionCommentModel
��= W
model
��X ]
)
��] ^
{
�� 	
if
�� 
(
�� 
model
�� 
.
�� 
	RequestId
�� 
>
��  !
$num
��" #
)
��# $
{
�� 
DbParameter
�� 
[
�� 
]
�� 
osqlParameter
�� +
=
��, -
{
�� 
new
�� 
DbParameter
�� #
(
��# $
$str
��$ .
,
��. /
model
��3 8
.
��8 9
	RequestId
��9 B
,
��B C
	SqlDbType
��D M
.
��M N
Int
��N Q
)
��Q R
,
��R S
new
�� 
DbParameter
�� #
(
��# $
$str
��$ /
,
��/ 0
model
��3 8
.
��8 9
	CreatedBy
��9 B
,
��B C
	SqlDbType
��D M
.
��M N
Int
��N Q
)
��Q R
,
��R S
new
�� 
DbParameter
�� #
(
��# $
$str
��$ -
,
��- .
model
��1 6
.
��6 7
Comment
��7 >
,
��> ?
	SqlDbType
��@ I
.
��I J
VarChar
��J Q
)
��Q R
,
��R S
new
�� 
DbParameter
�� #
(
��# $
$str
��$ 0
,
��0 1
model
��4 9
.
��9 :

StatusCode
��: D
,
��D E
	SqlDbType
��F O
.
��O P
VarChar
��P W
)
��W X
,
��X Y
}
�� 
;
�� 
EltizamDBHelper
�� 
.
��  
ExecuteNonQuery
��  /
(
��/ 0 
ProcedureMetastore
��0 B
.
��B C1
#usp_ValuationRequest_PerformActions
��C f
,
��f g 
DatabaseConnection
��h z
.
��z {

ConnString��{ �
,��� �
CommandType��� �
.��� �
StoredProcedure��� �
,��� �
osqlParameter��� �
)��� �
;��� �
return
�� 
DBOperation
�� "
.
��" #
Success
��# *
;
��* +
}
�� 
else
�� 
{
�� 
return
�� 
DBOperation
�� "
.
��" #
NotFound
��# +
;
��+ ,
}
�� 
return
�� 
DBOperation
�� 
.
�� 
Success
�� &
;
��& '
}
�� 	
}
�� 
}�� �
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
ParentTableName			~ �
=
		� �
null
		� �
,
		� �
int
		� �
?
		� �
ParentTableId
		� �
=
		� �
null
		� �
)
		� �
where
		� �
TResult
		� �
:
		� �
new
		� �
(
		� �
)
		� �
;
		� �
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
DateFrom	} �
=
� �
null
� �
,
� �
DateTime
� �
?
� �
DateTo
� �
=
� �
null
� �
)
� �
;
� �
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
DateTime	z �
?
� �
DateFrom
� �
=
� �
null
� �
,
� �
DateTime
� �
?
� �
DateTo
� �
=
� �
null
� �
)
� �
;
� �
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
TableKey	| �
,
� �
int
� �
?
� �
Id
� �
,
� �
DateTime
� �
?
� �
DateFrom
� �
=
� �
null
� �
,
� �
DateTime
� �
?
� �
DateTo
� �
=
� �
null
� �
)
� �
;
� �
} 
} �
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
} �
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
} �
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
	createdBy	w �
)
� �
;
� �
} 
} �
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
} �
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
} �
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
} �

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
} �

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
} �

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
} �

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
} �
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
} �	
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
} �
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
} �
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
} �

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
} �
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
ownershipTypeId	w �
)
� �
;
� �
} 
} �
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
} �
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
} �	
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
} �	
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
} �
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
} �
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
} �!
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
}   �	
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
} �

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
} �	
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
} �
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
} �
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
} �
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
} �
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
} �
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
} �
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
} �
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
} �
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
})) �
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
}!! �A
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