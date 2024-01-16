��
FD:\EltizamLive\Eltizam.WebApi\src\API\Controllers\AccountController.cs
	namespace 	
Eltizam
 
. 
WebApi 
. 
Controllers $
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
Route 

(
 
$str 3
)3 4
]4 5
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class 
AccountController "
:# $
ControllerBase% 3
{ 
private 	
readonly
 
IConfiguration !
_configuration" 0
;0 1
private 	
readonly
 
IResponseHandler #
<# $
dynamic$ +
>+ ,
_ObjectResponse- <
;< =
private 	
readonly
 
IMasterUserService %
_MasterUserService& 8
;8 9
private 	
readonly
 
IExceptionService $
_ExceptionService% 6
;6 7
private 
readonly 
IHelper  
_helper! (
;( )
public   
AccountController    
(    !
IConfiguration  ! /
configuration  0 =
,  = >
IResponseHandler  ? O
<  O P
dynamic  P W
>  W X
ObjectResponse  Y g
,  g h
IMasterUserService  i {
MasterUserService	  | �
,
  � �
IExceptionService
  � �
exceptionService
  � �
,
  � �
IHelper
  � �
helper
  � �
)
  � �
{!! 
_configuration"" 
="" 
configuration"" !
;""! "
_ObjectResponse## 
=## 
ObjectResponse## #
;### $
_MasterUserService$$ 
=$$ 
MasterUserService$$ )
;$$) *
_ExceptionService&& 
=&& 
exceptionService&& '
;&&' (
_helper'' 
='' 
helper'' 
;'' 
}(( 	
[;; 
AllowAnonymous;; 
];; 
[<< 
HttpPost<< 
,<< 
Route<< 
(<< 
$str<< 
)<< 
]<< 
public== 
async==	 
Task== 
<== 
IActionResult== !
>==! "
Login==# (
(==( )
[==) *
FromBody==* 2
]==2 3
LoginViewModel==4 B
oLogin==C I
)==I J
{>> 
try?? 
{@@ 
varAA 
_UserAA 
=AA 
awaitAA 
_MasterUserServiceAA (
.AA( )
LoginAA) .
(AA. /
oLoginAA/ 5
)AA5 6
;AA6 7
ifCC 
(CC 
_UserCC 
!=CC 
nullCC 
)CC 
{DD 
intEE 

expMinutesEE	 
=EE 
ConvertEE 
.EE 
ToInt32EE %
(EE% &
_configurationEE& 4
[EE4 5
$strEE5 H
]EEH I
)EEI J
;EEJ K
varGG 

userEntityGG	 
=GG *
JwtAuthenticationServiceConfigGG 4
.GG4 5
ValidateTokenGG5 B
(GGB C
_UserGGC H
,GGH I
_configurationGGJ X
[GGX Y
$strGGY g
]GGg h
.GGh i
ToStringGGi q
(GGq r
)GGr s
,GGs t
_configurationHH 
[HH 
$strHH !
]HH! "
.HH" #
ToStringHH# +
(HH+ ,
)HH, -
,HH- .
GuidHH/ 3
.HH3 4
NewGuidHH4 ;
(HH; <
)HH< =
,HH= >
AppConstantsHH? K
.HHK L
DateTimeHHL T
.HHT U

AddMinutesHHU _
(HH_ `

expMinutesHH` j
)HHj k
,HHk l
_configurationHHm {
[HH{ |
$str	HH| �
]
HH� �
)
HH� �
;
HH� �
returnJJ 
_ObjectResponseJJ 
.JJ 
CreateJJ "
(JJ" #

userEntityJJ# -
,JJ- .
(JJ/ 0
Int32JJ0 5
)JJ5 6
HttpStatusCodeJJ6 D
.JJD E
OKJJE G
)JJG H
;JJH I
}KK 
elseLL 
returnMM 
_ObjectResponseMM 
.MM 
CreateMM "
(MM" #
stringMM# )
.MM) *
EmptyMM* /
,MM/ 0
(MM1 2
Int32MM2 7
)MM7 8
HttpStatusCodeMM8 F
.MMF G
UnauthorizedMMG S
,MMS T
$strMMU j
)MMj k
;MMk l
}NN 
catchOO 
(OO	 

	ExceptionOO
 
exOO 
)OO 
{PP 
awaitQQ 	
_ExceptionServiceQQ
 
.QQ 
LogExceptionQQ (
(QQ( )
exQQ) +
)QQ+ ,
;QQ, -
returnRR 

_ObjectResponseRR 
.RR 
CreateRR !
(RR! "
falseRR" '
,RR' (
(RR) *
Int32RR* /
)RR/ 0
HttpStatusCodeRR0 >
.RR> ?
InternalServerErrorRR? R
,RRR S
ConvertRRT [
.RR[ \
ToStringRR\ d
(RRd e
exRRe g
.RRg h

StackTraceRRh r
)RRr s
)RRs t
;RRt u
}SS 
}TT 
[VV 	
AllowAnonymousVV	 
]VV 
[WW 	
HttpPostWW	 
,WW 
RouteWW 
(WW 
$strWW )
)WW) *
]WW* +
publicXX 
asyncXX 
TaskXX 
<XX 
IActionResultXX '
>XX' (
ForgotPasswordXX) 7
(XX7 8
[XX8 9
FromBodyXX9 A
]XXA B#
ForgotPasswordViewModelXXC Z#
forgotPasswordViewModelXX[ r
)XXr s
{YY 	
tryZZ 
{[[ 
var\\ $
_forgotPasswordOperation\\ ,
=\\- .
await\\/ 4
_MasterUserService\\5 G
.\\G H
ForgotPassword\\H V
(\\V W#
forgotPasswordViewModel\\W n
)\\n o
;\\o p
if^^ 
(^^ $
_forgotPasswordOperation^^ ,
==^^- /
DBOperation^^0 ;
.^^; <
Success^^< C
)^^C D
return__ 
_ObjectResponse__ *
.__* +
Create__+ 1
(__1 2$
_forgotPasswordOperation__2 J
,__J K
(__L M
Int32__M R
)__R S
HttpStatusCode__S a
.__a b
OK__b d
)__d e
;__e f
else`` 
if`` 
(`` $
_forgotPasswordOperation`` 1
==``2 4
DBOperation``5 @
.``@ A
NotFound``A I
)``I J
{aa 
returnbb 
_ObjectResponsebb *
.bb* +
Createbb+ 1
(bb1 2
nullbb2 6
,bb6 7
(bb8 9
Int32bb9 >
)bb> ?
HttpStatusCodebb? M
.bbM N

BadRequestbbN X
,bbX Y
AppConstantsbbZ f
.bbf g
NoRecordFoundbbg t
)bbt u
;bbu v
}cc 
returndd 
_ObjectResponsedd &
.dd& '
Createdd' -
(dd- .
nulldd. 2
,dd2 3
(dd4 5
Int32dd5 :
)dd: ;
HttpStatusCodedd; I
.ddI J
InternalServerErrorddJ ]
,dd] ^
$strdd_ v
)ddv w
;ddw x
}ee 
catchff 
(ff 
	Exceptionff 
exff 
)ff  
{gg 
awaithh 
_ExceptionServicehh '
.hh' (
LogExceptionhh( 4
(hh4 5
exhh5 7
)hh7 8
;hh8 9
returnii 
_ObjectResponseii &
.ii& '
Createii' -
(ii- .
falseii. 3
,ii3 4
(ii5 6
Int32ii6 ;
)ii; <
HttpStatusCodeii< J
.iiJ K
InternalServerErroriiK ^
,ii^ _
Convertii` g
.iig h
ToStringiih p
(iip q
exiiq s
.iis t

StackTraceiit ~
)ii~ 
)	ii �
;
ii� �
}jj 
}kk 	
[mm 	
AllowAnonymousmm	 
]mm 
[nn 	
HttpPostnn	 
,nn 
Routenn 
(nn 
$strnn (
)nn( )
]nn) *
publicoo 
asyncoo 
Taskoo 
<oo 
IActionResultoo '
>oo' (
ResetPasswordoo) 6
(oo6 7
[oo7 8
FromBodyoo8 @
]oo@ A)
MasterUserResetPasswordEntityooB _"
ResetPasswordViewModeloo` v
)oov w
{pp 	
tryqq 
{rr 
varss 
resetOperationss "
=ss# $
awaitss% *
_MasterUserServicess+ =
.ss= >
ResetPasswordss> K
(ssK L"
ResetPasswordViewModelssL b
)ssb c
;ssc d
iftt 
(tt 
resetOperationtt "
==tt# %
$strtt& 9
)tt9 :
returnuu 
_ObjectResponseuu *
.uu* +
Createuu+ 1
(uu1 2
resetOperationuu2 @
,uu@ A
(uuB C
Int32uuC H
)uuH I
HttpStatusCodeuuI W
.uuW X
OKuuX Z
)uuZ [
;uu[ \
elsevv 
ifvv 
(vv 
resetOperationvv '
==vv( *
$strvv+ 9
)vv9 :
{ww 
returnxx 
_ObjectResponsexx *
.xx* +
Createxx+ 1
(xx1 2
resetOperationxx2 @
,xx@ A
(xxB C
Int32xxC H
)xxH I
HttpStatusCodexxI W
.xxW X
NotExtendedxxX c
,xxc d
$strxxe s
)xxs t
;xxt u
}yy 
elsezz 
return{{ 
_ObjectResponse{{ *
.{{* +
Create{{+ 1
({{1 2
null{{2 6
,{{6 7
({{8 9
Int32{{9 >
){{> ?
HttpStatusCode{{? M
.{{M N

BadRequest{{N X
,{{X Y
AppConstants{{Z f
.{{f g
NoRecordFound{{g t
){{t u
;{{u v
}|| 
catch}} 
(}} 
	Exception}} 
ex}} 
)}}  
{~~ 
await 
_ExceptionService '
.' (
LogException( 4
(4 5
ex5 7
)7 8
;8 9
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
Convert
��` g
.
��g h
ToString
��h p
(
��p q
ex
��q s
.
��s t

StackTrace
��t ~
)
��~ 
)�� �
;��� �
}
�� 
}
�� 	
[
�� 	
AllowAnonymous
��	 
]
�� 
[
�� 	
HttpGet
��	 
,
�� 
Route
�� 
(
�� 
$str
�� @
)
��@ A
]
��A B
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
�� %
CheckEmailAddressExists
��  7
(
��7 8
[
��8 9
	FromRoute
��9 B
]
��B C
string
��D J
emailAddress
��K W
)
��W X
{
�� 	
try
�� 
{
�� 
return
�� 
await
��  
_MasterUserService
�� /
.
��/ 0%
CheckEmailAddressExists
��0 G
(
��G H
emailAddress
��H T
)
��T U
;
��U V
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
await
�� 
_ExceptionService
�� '
.
��' (
LogException
��( 4
(
��4 5
ex
��5 7
)
��7 8
;
��8 9
return
�� 
false
�� 
;
�� 
}
�� 
}
�� 	
[
�� 	
AllowAnonymous
��	 
]
�� 
[
�� 	
HttpGet
��	 
,
�� 
Route
�� 
(
�� 
$str
�� .
)
��. /
]
��/ 0
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
��, -
[
��- .
	FromRoute
��. 7
]
��7 8
string
��9 ?
token
��@ E
)
��E F
{
�� 	
try
�� 
{
�� 
return
�� 
await
��  
_MasterUserService
�� /
.
��/ 0
IsTokenValid
��0 <
(
��< =
token
��= B
)
��B C
;
��C D
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
await
�� 
_ExceptionService
�� '
.
��' (
LogException
��( 4
(
��4 5
ex
��5 7
)
��7 8
;
��8 9
return
�� 
false
�� 
;
�� 
}
�� 
}
�� 	
[
�� 	
AllowAnonymous
��	 
]
�� 
[
�� 	
HttpPost
��	 
,
�� 
Route
�� 
(
�� 
$str
�� )
)
��) *
]
��* +
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
ChangePassword
��) 7
(
��7 8
[
��8 9
FromBody
��9 A
]
��A B!
ChangePasswordModel
��C V!
changePasswordModel
��W j
)
��j k
{
�� 	
var
�� 
response
�� 
=
�� 
new
�� 
ApiResponse
�� *
(
��* +
)
��+ ,
;
��, -
if
�� 
(
�� 
!
�� 

ModelState
�� 
.
�� 
IsValid
�� #
)
��# $
{
�� 
response
�� 
.
�� 
Success
��  
=
��! "
false
��# (
;
��( )
response
�� 
.
�� 
Errors
�� 
=
��  !

ModelState
��" ,
.
��, -
Values
��- 3
.
�� 

SelectMany
�� 
(
��  
x
��  !
=>
��" $
x
��% &
.
��& '
Errors
��' -
)
��- .
.
�� 
Select
�� 
(
�� 
x
�� 
=>
��  
x
��! "
.
��" #
ErrorMessage
��# /
)
��/ 0
.
�� 
ToList
�� 
(
�� 
)
�� 
;
�� 
return
�� 
Ok
�� 
(
�� 
response
�� "
)
��" #
;
��# $
}
�� 
try
�� 
{
�� 
var
�� 
changeOperation
�� #
=
��$ %
await
��& + 
_MasterUserService
��, >
.
��> ?
ChangePassword
��? M
(
��M N!
changePasswordModel
��N a
)
��a b
;
��b c
if
�� 
(
�� 
changeOperation
�� #
==
��$ &
DBOperation
��' 2
.
��2 3
Success
��3 :
)
��: ;
{
�� 
response
�� 
.
�� 
Success
�� $
=
��% &
true
��' +
;
��+ ,
return
�� 
Ok
�� 
(
�� 
response
�� &
)
��& '
;
��' (
}
�� 
else
�� 
if
�� 
(
�� 
changeOperation
�� (
==
��) +
DBOperation
��, 7
.
��7 8
NotFound
��8 @
)
��@ A
{
�� 
response
�� 
.
�� 
Success
�� $
=
��% &
false
��' ,
;
��, -
response
�� 
.
�� 
Errors
�� #
=
��$ %
new
��& )
List
��* .
<
��. /
string
��/ 5
>
��5 6
{
��7 8
AppConstants
��9 E
.
��E F
NoRecordFound
��F S
}
��T U
;
��U V
return
�� 

BadRequest
�� %
(
��% &
response
��& .
)
��. /
;
��/ 0
}
�� 
response
�� 
.
�� 
Success
��  
=
��! "
false
��# (
;
��( )
response
�� 
.
�� 
Errors
�� 
=
��  !
new
��" %
List
��& *
<
��* +
string
��+ 1
>
��1 2
{
��3 4
$str
��5 L
}
��M N
;
��N O
return
�� 

StatusCode
�� !
(
��! "
$num
��" %
,
��% &
response
��' /
)
��/ 0
;
��0 1
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
await
�� 
_ExceptionService
�� '
.
��' (
LogException
��( 4
(
��4 5
ex
��5 7
)
��7 8
;
��8 9
response
�� 
.
�� 
Success
��  
=
��! "
false
��# (
;
��( )
response
�� 
.
�� 
Errors
�� 
=
��  !
new
��" %
List
��& *
<
��* +
string
��+ 1
>
��1 2
{
��3 4
ex
��5 7
.
��7 8

StackTrace
��8 B
}
��C D
;
��D E
return
�� 

StatusCode
�� !
(
��! "
$num
��" %
,
��% &
response
��' /
)
��/ 0
;
��0 1
}
�� 
}
�� 	
}
�� 
}�� �
ID:\EltizamLive\Eltizam.WebApi\src\API\Controllers\AttachmentController.cs
	namespace 	
EltizamValuation
 
. 
WebApi !
.! "
Controllers" -
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
Route 

(
 
$str 3
)3 4
]4 5
[ 
ApiController 
] 
[		 
AuthorizeAttribute		 
]		 
public

 

class

  
AttachmentController

 %
:

& '
ControllerBase

( 6
{ 
} 
} �Q
GD:\EltizamLive\Eltizam.WebApi\src\API\Controllers\AuditLogController.cs
	namespace		 	
Eltizam		
 
.		 
WebApi		 
.		 
Controllers		 $
{

 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
Route 

(
 
$str 3
)3 4
]4 5
[ 
ApiController 
] 
public 

class 
AuditLogController #
:$ %
ControllerBase& 4
{ 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
private 
readonly 
IResponseHandler )
<) *
dynamic* 1
>1 2
_ObjectResponse3 B
;B C
private 
readonly 
IExceptionService *
_ExceptionService+ <
;< =
private 
readonly 
IAuditLogService )
_auditLogService* :
;: ;
public 
AuditLogController !
(! "
IConfiguration" 0
configuration1 >
,> ?
IResponseHandler@ P
<P Q
dynamicQ X
>X Y
ObjectResponseZ h
,h i
IExceptionServicej {
exceptionService	| �
,
� �
IAuditLogService
� �
auditLog
� �
)
� �
{ 	
_configuration 
= 
configuration *
;* +
_ObjectResponse 
= 
ObjectResponse ,
;, -
_ExceptionService 
= 
exceptionService  0
;0 1
_auditLogService   
=   
auditLog   '
;  ' (
}!! 	
[(( 	
HttpPost((	 
,(( 
Route(( 
((( 
$str(( !
)((! "
]((" #
public)) 
async)) 
Task)) 
<)) 
IActionResult)) '
>))' (
GetAll))) /
())/ 0
[))0 1
FromForm))1 9
]))9 :"
DataTableAjaxPostModel)); Q
model))R W
,))W X
int))Y \
?))\ ]
UserName))^ f
,))f g
string))h n
?))n o
	TableName))p y
=))z {
null	))| �
,
))� �
DateTime
))� �
?
))� �
DateFrom
))� �
=
))� �
null
))� �
,
))� �
DateTime
))� �
?
))� �
DateTo
))� �
=
))� �
null
))� �
)
))� �
{** 	
try++ 
{,, 
return33 
_ObjectResponse33 &
.33& '

CreateData33' 1
(331 2
await332 7
_auditLogService338 H
.33H I
GetAll33I O
(33O P
model33P U
,33U V
UserName33W _
,33_ `
	TableName33a j
,33j k
DateFrom33l t
,33t u
DateTo33v |
)33| }
,33} ~
(	33 �
Int32
33� �
)
33� �
HttpStatusCode
33� �
.
33� �
OK
33� �
)
33� �
;
33� �
}44 
catch55 
(55 
	Exception55 
ex55 
)55  
{66 
await77 
_ExceptionService77 '
.77' (
LogException77( 4
(774 5
ex775 7
)777 8
;778 9
return88 
_ObjectResponse88 &
.88& '
Create88' -
(88- .
false88. 3
,883 4
(885 6
Int32886 ;
)88; <
HttpStatusCode88< J
.88J K
InternalServerError88K ^
,88^ _
Convert88` g
.88g h
ToString88h p
(88p q
ex88q s
.88s t

StackTrace88t ~
)88~ 
)	88 �
;
88� �
}99 
}:: 	
[<< 	
HttpPost<<	 
,<< 
Route<< 
(<< 
$str<< +
)<<+ ,
]<<, -
public== 
async== 
Task== 
<== 
IActionResult== '
>==' (
GetAllDetailsLog==) 9
(==9 :
[==: ;
FromForm==; C
]==C D"
DataTableAjaxPostModel==E [
model==\ a
,==a b
int==c f
?==f g
UserId==h n
,==n o
string==p v
?==v w
	TableName	==x �
=
==� �
null
==� �
,
==� �
string
==� �
?
==� �
TableKey
==� �
=
==� �
null
==� �
,
==� �
int
==� �
?
==� �
Id
==� �
=
==� �
null
==� �
,
==� �
DateTime
==� �
?
==� �
DateFrom
==� �
=
==� �
null
==� �
,
==� �
DateTime
==� �
?
==� �
DateTo
==� �
=
==� �
null
==� �
)
==� �
{>> 	
try?? 
{@@ 
returnBB 
_ObjectResponseBB &
.BB& '

CreateDataBB' 1
(BB1 2
awaitBB2 7
_auditLogServiceBB8 H
.BBH I
GetAllDetailsLogBBI Y
(BBY Z
modelBBZ _
,BB_ `
UserIdBBa g
,BBg h
	TableNameBBi r
,BBr s
TableKeyBBt |
,BB| }
Id	BB~ �
,
BB� �
DateFrom
BB� �
,
BB� �
DateTo
BB� �
)
BB� �
,
BB� �
(
BB� �
Int32
BB� �
)
BB� �
HttpStatusCode
BB� �
.
BB� �
OK
BB� �
)
BB� �
;
BB� �
}CC 
catchDD 
(DD 
	ExceptionDD 
exDD 
)DD  
{EE 
awaitFF 
_ExceptionServiceFF '
.FF' (
LogExceptionFF( 4
(FF4 5
exFF5 7
)FF7 8
;FF8 9
returnGG 
_ObjectResponseGG &
.GG& '
CreateGG' -
(GG- .
falseGG. 3
,GG3 4
(GG5 6
Int32GG6 ;
)GG; <
HttpStatusCodeGG< J
.GGJ K
InternalServerErrorGGK ^
,GG^ _
ConvertGG` g
.GGg h
ToStringGGh p
(GGp q
exGGq s
.GGs t

StackTraceGGt ~
)GG~ 
)	GG �
;
GG� �
}HH 
}II 	
[LL 	
HttpGetLL	 
,LL 
RouteLL 
(LL 
$strLL 0
)LL0 1
]LL1 2
publicMM 
asyncMM 
TaskMM 
<MM 
IActionResultMM '
>MM' (
GetLogDetailsMM) 6
(MM6 7
stringMM7 =
?MM= >
	TableNameMM? H
,MMH I
intMMJ M
?MMM N
IdMMO Q
,MMQ R
intMMS V
?MMV W
TableKeyMMX `
,MM` a
DateTimeMMb j
?MMj k
DateFromMMl t
,MMt u
DateTimeMMv ~
?MM~ 
DateTo
MM� �
)
MM� �
{NN 	
tryOO 
{PP 
varQQ 
listQQ 
=QQ 
awaitQQ  
_auditLogServiceQQ! 1
.QQ1 2"
GetLogDetailsByFiltersQQ2 H
(QQH I
	TableNameQQI R
,QQR S
IdQQT V
,QQV W
TableKeyQQX `
,QQ` a
DateFromQQb j
,QQj k
DateToQQl r
)QQr s
;QQs t
ifSS 
(SS 
listSS 
!=SS 
nullSS  
)SS  !
returnTT 
_ObjectResponseTT *
.TT* +
CreateTT+ 1
(TT1 2
listTT2 6
,TT6 7
(TT8 9
Int32TT9 >
)TT> ?
HttpStatusCodeTT? M
.TTM N
OKTTN P
)TTP Q
;TTQ R
elseUU 
returnVV 
_ObjectResponseVV *
.VV* +
CreateVV+ 1
(VV1 2
nullVV2 6
,VV6 7
(VV8 9
Int32VV9 >
)VV> ?
HttpStatusCodeVV? M
.VVM N

BadRequestVVN X
,VVX Y
AppConstantsVVZ f
.VVf g
NoRecordFoundVVg t
)VVt u
;VVu v
}WW 
catchXX 
(XX 
	ExceptionXX 
exXX 
)XX  
{YY 
awaitZZ 
_ExceptionServiceZZ '
.ZZ' (
LogExceptionZZ( 4
(ZZ4 5
exZZ5 7
)ZZ7 8
;ZZ8 9
return[[ 
_ObjectResponse[[ &
.[[& '
Create[[' -
([[- .
false[[. 3
,[[3 4
([[5 6
Int32[[6 ;
)[[; <
HttpStatusCode[[< J
.[[J K
InternalServerError[[K ^
,[[^ _
Convert[[` g
.[[g h
ToString[[h p
([[p q
ex[[q s
.[[s t

StackTrace[[t ~
)[[~ 
)	[[ �
;
[[� �
}\\ 
}]] 	
[__ 	
HttpGet__	 
(__ 
$str__ *
)__* +
]__+ ,
public`` 
async`` 
Task`` 
<`` 
IActionResult`` '
>``' (#
GetAllAuditLogTableName``) @
(``@ A
)``A B
{aa 	
trybb 
{cc 
returndd 
_ObjectResponsedd &
.dd& '

CreateDatadd' 1
(dd1 2
awaitdd2 7
_auditLogServicedd8 H
.ddH I#
GetAllAuditLogTableNameddI `
(dd` a
)dda b
,ddb c
(ddd e
Int32dde j
)ddj k
HttpStatusCodeddk y
.ddy z
OKddz |
)dd| }
;dd} ~
}ee 
catchff 
(ff 
	Exceptionff 
exff 
)ff  
{gg 
returnhh 
_ObjectResponsehh &
.hh& '
Createhh' -
(hh- .
falsehh. 3
,hh3 4
(hh5 6
Int32hh6 ;
)hh; <
HttpStatusCodehh< J
.hhJ K
InternalServerErrorhhK ^
,hh^ _
Converthh` g
.hhg h
ToStringhhh p
(hhp q
exhhq s
.hhs t

StackTracehht ~
)hh~ 
)	hh �
;
hh� �
}ii 
}jj 	
}ll 
}mm �2
HD:\EltizamLive\Eltizam.WebApi\src\API\Controllers\DashboardController.cs
	namespace

 	
EltizamValuation


 
.

 
WebApi

 !
.

! "
Controllers

" -
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
Route 

(
 
$str 3
)3 4
]4 5
[ 
ApiController 
] 
public 

class 
DashboardController $
:% &
ControllerBase' 5
{ 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
private 
readonly 
IResponseHandler )
<) *
dynamic* 1
>1 2
_ObjectResponse3 B
;B C
private 
readonly 
IDashboardService *
_dashboardService+ <
;< =
private 
readonly 
IExceptionService *
_ExceptionService+ <
;< =
private 
readonly 
IHelper  
_helper! (
;( )
public 
DashboardController "
(" #
IConfiguration# 1
configuration2 ?
,? @
IResponseHandlerA Q
<Q R
dynamicR Y
>Y Z
ObjectResponse[ i
,i j
IDashboardServicek |
dashboardService	} �
,
� �
IExceptionService
� �
exceptionService
� �
,
� �
IHelper
� �
helper
� �
)
� �
{ 	
_configuration 
= 
configuration *
;* +
_ObjectResponse   
=   
ObjectResponse   ,
;  , -
_dashboardService!! 
=!! 
dashboardService!!  0
;!!0 1
_ExceptionService## 
=## 
exceptionService##  0
;##0 1
_helper$$ 
=$$ 
helper$$ 
;$$ 
}%% 	
[88 	
HttpPost88	 
]88 
[99 	
Route99	 
(99 
$str99 
)99 
]99  
public:: 
async:: 
Task:: 
<:: 
IActionResult:: '
>::' (
DashboardData::) 6
(::6 7
[::7 8
FromBody::8 @
]::@ A 
DashboardFilterModel::B V
model::W \
)::\ ]
{;; 	
try<< 
{== 
var>> 
_data>> 
=>> 
await>> !
_dashboardService>>" 3
.>>3 4
GetDashboardData>>4 D
(>>D E
model>>E J
)>>J K
;>>K L
if@@ 
(@@ 
_data@@ 
!=@@ 
null@@ !
)@@! "
{AA 
returnBB 
_ObjectResponseBB *
.BB* +
CreateBB+ 1
(BB1 2
_dataBB2 7
,BB7 8
(BB9 :
Int32BB: ?
)BB? @
HttpStatusCodeBB@ N
.BBN O
OKBBO Q
)BBQ R
;BBR S
}CC 
elseDD 
returnEE 
_ObjectResponseEE *
.EE* +
CreateEE+ 1
(EE1 2
stringEE2 8
.EE8 9
EmptyEE9 >
,EE> ?
(EE@ A
Int32EEA F
)EEF G
HttpStatusCodeEEG U
.EEU V
NotFoundEEV ^
)EE^ _
;EE_ `
}FF 
catchGG 
(GG 
	ExceptionGG 
exGG 
)GG  
{HH 
awaitII 
_ExceptionServiceII '
.II' (
LogExceptionII( 4
(II4 5
exII5 7
)II7 8
;II8 9
returnJJ 
_ObjectResponseJJ &
.JJ& '
CreateJJ' -
(JJ- .
falseJJ. 3
,JJ3 4
(JJ5 6
Int32JJ6 ;
)JJ; <
HttpStatusCodeJJ< J
.JJJ K
InternalServerErrorJJK ^
,JJ^ _
ConvertJJ` g
.JJg h
ToStringJJh p
(JJp q
exJJq s
.JJs t

StackTraceJJt ~
)JJ~ 
)	JJ �
;
JJ� �
}KK 
}LL 	
[OO 	
HttpPostOO	 
]OO 
[PP 	
RoutePP	 
(PP 
$strPP "
)PP" #
]PP# $
publicQQ 
asyncQQ 
TaskQQ 
<QQ 
IActionResultQQ '
>QQ' (
GetClientPieChartQQ) :
(QQ: ;
[QQ; <
FromBodyQQ< D
]QQD E 
DashboardFilterModelQQF Z
modelQQ[ `
)QQ` a
{RR 	
trySS 
{TT 
varUU 
_dataUU 
=UU 
awaitUU !
_dashboardServiceUU" 3
.UU3 4!
GetClientPieChartDataUU4 I
(UUI J
modelUUJ O
)UUO P
;UUP Q
ifWW 
(WW 
_dataWW 
!=WW 
nullWW !
)WW! "
{XX 
returnYY 
_ObjectResponseYY *
.YY* +
CreateYY+ 1
(YY1 2
_dataYY2 7
,YY7 8
(YY9 :
Int32YY: ?
)YY? @
HttpStatusCodeYY@ N
.YYN O
OKYYO Q
)YYQ R
;YYR S
}ZZ 
else[[ 
return\\ 
_ObjectResponse\\ *
.\\* +
Create\\+ 1
(\\1 2
string\\2 8
.\\8 9
Empty\\9 >
,\\> ?
(\\@ A
Int32\\A F
)\\F G
HttpStatusCode\\G U
.\\U V
NotFound\\V ^
)\\^ _
;\\_ `
}]] 
catch^^ 
(^^ 
	Exception^^ 
ex^^ 
)^^  
{__ 
await`` 
_ExceptionService`` '
.``' (
LogException``( 4
(``4 5
ex``5 7
)``7 8
;``8 9
returnaa 
_ObjectResponseaa &
.aa& '
Createaa' -
(aa- .
falseaa. 3
,aa3 4
(aa5 6
Int32aa6 ;
)aa; <
HttpStatusCodeaa< J
.aaJ K
InternalServerErroraaK ^
,aa^ _
Convertaa` g
.aag h
ToStringaah p
(aap q
exaaq s
.aas t

StackTraceaat ~
)aa~ 
)	aa �
;
aa� �
}bb 
}cc 	
}ff 
}gg �;
JD:\EltizamLive\Eltizam.WebApi\src\API\Controllers\FileUploadController .cs
	namespace		 	
Eltizam		
 
.		 
WebApi		 
.		 
Controllers		 $
{

 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
Route 

(
 
$str 3
)3 4
]4 5
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class  
FileUploadController %
:& '
ControllerBase( 6
{ 
private 	
readonly
 
IUploadService !
_UploadService" 0
;0 1
private 	
readonly
 
IResponseHandler #
<# $
dynamic$ +
>+ ,
_ObjectResponse- <
;< =
private 	
readonly
 
IExceptionService $
_ExceptionService% 6
;6 7
public  
FileUploadController	 
( 
IUploadService ,
UploadService- :
,: ;
IResponseHandler< L
<L M
dynamicM T
>T U
ObjectResponseV d
,d e
IExceptionServicef w
exceptionService	x �
)
� �
{ 
_UploadService 
= 
UploadService !
;! "
_ObjectResponse 
= 
ObjectResponse #
;# $
_ExceptionService 
= 
exceptionService '
;' (
} 
[00 
HttpPost00 
(00 
$str00 
)00 
]00 
public11 
async11	 
Task11 
<11 
IActionResult11 !
>11! "
Upload11# )
(11) *
List11* .
<11. /
	IFormFile11/ 8
>118 9
files11: ?
)11? @
{22 
try33 
{44 
DBOperation55 
	oResponse55 
=55 
await55 !
_UploadService55" 0
.550 1
SaveFilesAsync551 ?
(55? @
files55@ E
)55E F
;55F G
if66 
(66 
	oResponse66 
==66 
DBOperation66  
.66  !
Success66! (
)66( )
{77 
return88 
_ObjectResponse88 
.88 
Create88 "
(88" #
true88# '
,88' (
(88) *
Int3288* /
)88/ 0
HttpStatusCode880 >
.88> ?
OK88? A
,88A B
(88C D
AppConstants88D P
.88P Q
InsertSuccess88Q ^
)88^ _
)88_ `
;88` a
}99 
else:: 
return;; 
_ObjectResponse;; 
.;; 
Create;; "
(;;" #
false;;# (
,;;( )
(;;* +
Int32;;+ 0
);;0 1
HttpStatusCode;;1 ?
.;;? @

BadRequest;;@ J
,;;J K
(;;L M
	oResponse;;M V
==;;W Y
DBOperation;;Z e
.;;e f
NotFound;;f n
?;;o p
$str	;;q �
:
;;� �
AppConstants
;;� �
.
;;� �

BadRequest
;;� �
)
;;� �
)
;;� �
;
;;� �
}<< 
catch== 
(==	 

ArgumentException==
 
ex== 
)== 
{>> 
return?? 


BadRequest?? 
(?? 
ex?? 
.?? 
Message??  
)??  !
;??! "
}@@ 
catchAA 
(AA	 

	ExceptionAA
 
exAA 
)AA 
{BB 
awaitCC 	
_ExceptionServiceCC
 
.CC 
LogExceptionCC (
(CC( )
exCC) +
)CC+ ,
;CC, -
returnDD 

_ObjectResponseDD 
.DD 
CreateDD !
(DD! "
falseDD" '
,DD' (
(DD) *
Int32DD* /
)DD/ 0
HttpStatusCodeDD0 >
.DD> ?
InternalServerErrorDD? R
,DDR S
ConvertDDT [
.DD[ \
ToStringDD\ d
(DDd e
exDDe g
.DDg h

StackTraceDDh r
)DDr s
)DDs t
;DDt u
}EE 
}FF 
[HH 
HttpGetHH 

(HH
 
$strHH 
)HH 
]HH 
publicII 
asyncII	 
TaskII 
<II 
IActionResultII !
>II! "
GetAllFilesII# .
(II. /
)II/ 0
{JJ 
tryKK 
{LL 
varNN 
uploadsNN 
=NN 
awaitNN 
_UploadServiceNN &
.NN& '
GetAllUploadsAsyncNN' 9
(NN9 :
)NN: ;
;NN; <
returnOO 

OkOO 
(OO 
uploadsOO 
)OO 
;OO 
}PP 
catchQQ 
(QQ	 

	ExceptionQQ
 
exQQ 
)QQ 
{RR 
returnUU 


StatusCodeUU 
(UU 
$numUU 
,UU 
$"UU 
$strUU 4
{UU4 5
exUU5 7
.UU7 8
MessageUU8 ?
}UU? @
"UU@ A
)UUA B
;UUB C
}VV 
}WW 
[YY 
HttpGetYY 

(YY
 
$strYY 
)YY 
]YY 
publicZZ 
asyncZZ	 
TaskZZ 
<ZZ 
IActionResultZZ !
>ZZ! "
GetFileByIdZZ# .
(ZZ. /
intZZ/ 2
idZZ3 5
)ZZ5 6
{[[ 
try\\ 
{]] 
DBOperation__ 
	oResponse__ 
=__ 
await__ !
_UploadService__" 0
.__0 1
GetUploadByIdAsync__1 C
(__C D
id__D F
)__F G
;__G H
if`` 
(`` 
	oResponse`` 
==`` 
DBOperation``  
.``  !
Success``! (
)``( )
returnaa 
_ObjectResponseaa 
.aa 
Createaa "
(aa" #
trueaa# '
,aa' (
(aa) *
Int32aa* /
)aa/ 0
HttpStatusCodeaa0 >
.aa> ?
OKaa? A
,aaA B
$straaC U
)aaU V
;aaV W
elsebb 
returncc 
_ObjectResponsecc 
.cc 
Createcc "
(cc" #
nullcc# '
,cc' (
(cc) *
Int32cc* /
)cc/ 0
HttpStatusCodecc0 >
.cc> ?

BadRequestcc? I
,ccI J
AppConstantsccK W
.ccW X
NoRecordFoundccX e
)cce f
;ccf g
}dd 
catchee 
(ee	 

	Exceptionee
 
exee 
)ee 
{ff 
awaitii 	
_ExceptionServiceii
 
.ii 
LogExceptionii (
(ii( )
exii) +
)ii+ ,
;ii, -
returnjj 

_ObjectResponsejj 
.jj 
Createjj !
(jj! "
falsejj" '
,jj' (
(jj) *
Int32jj* /
)jj/ 0
HttpStatusCodejj0 >
.jj> ?
InternalServerErrorjj? R
,jjR S
ConvertjjT [
.jj[ \
ToStringjj\ d
(jjd e
exjje g
.jjg h

StackTracejjh r
)jjr s
)jjs t
;jjt u
}ll 
}mm 
}qq 
}rr �A
RD:\EltizamLive\Eltizam.WebApi\src\API\Controllers\MasterApproverLevelController.cs
	namespace 	
EltizamValuation
 
. 
WebApi !
.! "
Controllers" -
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
Route 

(
 
$str 3
)3 4
]4 5
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class )
MasterApproverLevelController .
:/ 0
ControllerBase1 ?
{ 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
private 
readonly 
IResponseHandler )
<) *
dynamic* 1
>1 2
_ObjectResponse3 B
;B C
private 
	Microsoft 
. 

Extensions $
.$ %
Hosting% ,
., -
IHostingEnvironment- @
_envA E
;E F
private 
readonly 
IExceptionService *
_ExceptionService+ <
;< =
private 
readonly '
IMasterApproverLevelService 4!
_approverLevelService5 J
;J K
public )
MasterApproverLevelController ,
(, -
IConfiguration- ;
configuration< I
,I J
IResponseHandlerK [
<[ \
dynamic\ c
>c d
ObjectResponsee s
,s t
IExceptionService	u �
exceptionService
� �
,
� �)
IMasterApproverLevelService
� �"
approverLevelService
� �
)
� �
{ 	
_configuration   
=   
configuration   *
;  * +
_ObjectResponse!! 
=!! 
ObjectResponse!! ,
;!!, -
_ExceptionService"" 
="" 
exceptionService""  0
;""0 1!
_approverLevelService## !
=##" # 
approverLevelService##$ 8
;##8 9
}$$ 	
[(( 	
HttpPost((	 
](( 
[)) 	
Route))	 
()) 
$str)) 
))) 
])) 
public** 
async** 
Task** 
<** 
IActionResult** '
>**' (
Upsert**( .
(**. /$
MasterApproverLevelModel**/ G
approverLevel**H U
)**U V
{++ 	
try,, 
{-- 
DBOperation.. 
	oResponse.. %
=..& '
await..( -!
_approverLevelService... C
...C D5
)UpsertMasterValuationRequestApproverLevel..D m
(..m n
approverLevel..n {
)..{ |
;..| }
if// 
(// 
	oResponse// 
==//  
DBOperation//! ,
.//, -
Success//- 4
)//4 5
{00 
return11 
_ObjectResponse11 *
.11* +
Create11+ 1
(111 2
true112 6
,116 7
(118 9
Int32119 >
)11> ?
HttpStatusCode11? M
.11M N
OK11N P
,11P Q
(11R S
approverLevel11S `
.11` a
Id11a c
>11d e
$num11f g
?11h i
AppConstants11j v
.11v w
UpdateSuccess	11w �
:
11� �
AppConstants
11� �
.
11� �
InsertSuccess
11� �
)
11� �
)
11� �
;
11� �
}22 
else33 
return44 
_ObjectResponse44 *
.44* +
Create44+ 1
(441 2
false442 7
,447 8
(449 :
Int3244: ?
)44? @
HttpStatusCode44@ N
.44N O

BadRequest44O Y
,44Y Z
(44[ \
	oResponse44\ e
==44f h
DBOperation44i t
.44t u
NotFound44u }
?44~ 
AppConstants
44� �
.
44� �
NoRecordFound
44� �
:
44� �
AppConstants
44� �
.
44� �

BadRequest
44� �
)
44� �
)
44� �
;
44� �
}55 
catch66 
(66 
	Exception66 
ex66 
)66  
{77 
return88 
_ObjectResponse88 &
.88& '
Create88' -
(88- .
false88. 3
,883 4
(885 6
Int32886 ;
)88; <
HttpStatusCode88< J
.88J K
InternalServerError88K ^
,88^ _
Convert88` g
.88g h
ToString88h p
(88p q
ex88q s
.88s t

StackTrace88t ~
)88~ 
)	88 �
;
88� �
}99 
}:: 	
[>> 	
HttpPost>>	 
,>> 
Route>> 
(>> 
$str>> !
)>>! "
]>>" #
public?? 
async?? 
Task?? 
<?? 
IActionResult?? '
>??' (
GetAll??) /
(??/ 0
[??0 1
FromForm??1 9
]??9 :"
DataTableAjaxPostModel??; Q
model??R W
)??W X
{@@ 	
tryAA 
{BB 
returnCC 
_ObjectResponseCC &
.CC& '

CreateDataCC' 1
(CC1 2
awaitCC2 7!
_approverLevelServiceCC8 M
.CCM N
GetAllCCN T
(CCT U
modelCCU Z
)CCZ [
,CC[ \
(CC] ^
Int32CC^ c
)CCc d
HttpStatusCodeCCd r
.CCr s
OKCCs u
)CCu v
;CCv w
}DD 
catchEE 
(EE 
	ExceptionEE 
exEE 
)EE  
{FF 
returnGG 
_ObjectResponseGG &
.GG& '
CreateGG' -
(GG- .
falseGG. 3
,GG3 4
(GG5 6
Int32GG6 ;
)GG; <
HttpStatusCodeGG< J
.GGJ K
InternalServerErrorGGK ^
,GG^ _
ConvertGG` g
.GGg h
ToStringGGh p
(GGp q
exGGq s
.GGs t

StackTraceGGt ~
)GG~ 
)	GG �
;
GG� �
}HH 
}II 	
[KK 	
HttpGetKK	 
(KK 
$strKK 
)KK  
]KK  !
publicLL 
asyncLL 
TaskLL 
<LL 
IActionResultLL '
>LL' (
GetByIdLL) 0
(LL0 1
intLL1 4
IdLL5 7
)LL7 8
{MM 	
tryNN 
{OO 
varPP 
resultPP 
=PP 
awaitPP "!
_approverLevelServicePP# 8
.PP8 9
GetByIdPP9 @
(PP@ A
IdPPA C
)PPC D
;PPD E
ifQQ 
(QQ 
resultQQ 
!=QQ 
nullQQ "
&&QQ# %
resultQQ& ,
.QQ, -
IdQQ- /
>QQ0 1
$numQQ2 3
)QQ3 4
returnRR 
_ObjectResponseRR *
.RR* +
CreateRR+ 1
(RR1 2
resultRR2 8
,RR8 9
(RR: ;
Int32RR; @
)RR@ A
HttpStatusCodeRRA O
.RRO P
OKRRP R
)RRR S
;RRS T
elseSS 
returnTT 
_ObjectResponseTT *
.TT* +
CreateTT+ 1
(TT1 2
nullTT2 6
,TT6 7
(TT8 9
Int32TT9 >
)TT> ?
HttpStatusCodeTT? M
.TTM N

BadRequestTTN X
,TTX Y
AppConstantsTTZ f
.TTf g
NoRecordFoundTTg t
)TTt u
;TTu v
}UU 
catchVV 
(VV 
	ExceptionVV 
exVV 
)VV  
{WW 
returnXX 
_ObjectResponseXX &
.XX& '
CreateXX' -
(XX- .
falseXX. 3
,XX3 4
(XX5 6
Int32XX6 ;
)XX; <
HttpStatusCodeXX< J
.XXJ K
InternalServerErrorXXK ^
,XX^ _
ConvertXX` g
.XXg h
ToStringXXh p
(XXp q
exXXq s
.XXs t

StackTraceXXt ~
)XX~ 
)	XX �
;
XX� �
}YY 
}ZZ 	
}[[ 
}\\ �h
ID:\EltizamLive\Eltizam.WebApi\src\API\Controllers\MasterCityController.cs
	namespace 	
Eltizam
 
. 
WebApi 
. 
Controllers $
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
Route 

(
 
$str 3
)3 4
]4 5
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class  
MasterCityController %
:& '
ControllerBase( 6
{ 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
private 
readonly 
IResponseHandler )
<) *
dynamic* 1
>1 2
_ObjectResponse3 B
;B C
private 
	Microsoft 
. 

Extensions $
.$ %
Hosting% ,
., -
IHostingEnvironment- @
_envA E
;E F
private 
readonly 
IExceptionService *
_ExceptionService+ <
;< =
private 
readonly 
IMasterCityService +
_CityService, 8
;8 9
public  
MasterCityController #
(# $
IConfiguration$ 2
configuration3 @
,@ A
IResponseHandlerB R
<R S
dynamicS Z
>Z [
ObjectResponse\ j
,j k
IExceptionServicel }
exceptionService	~ �
,
� � 
IMasterCityService
� �
CityService
� �
)
� �
{   	
_configuration!! 
=!! 
configuration!! *
;!!* +
_ObjectResponse"" 
="" 
ObjectResponse"" ,
;"", -
_ExceptionService## 
=## 
exceptionService##  0
;##0 1
_CityService$$ 
=$$ 
CityService$$ &
;$$& '
}%% 	
[99 	
HttpPost99	 
,99 
Route99 
(99 
$str99 !
)99! "
]99" #
public:: 
async:: 
Task:: 
<:: 
IActionResult:: '
>::' (
GetAll::) /
(::/ 0
[::0 1
FromForm::1 9
]::9 :"
DataTableAjaxPostModel::; Q
model::R W
)::W X
{;; 	
try<< 
{== 
return>> 
_ObjectResponse>> &
.>>& '

CreateData>>' 1
(>>1 2
await>>2 7
_CityService>>8 D
.>>D E
GetAll>>E K
(>>K L
model>>L Q
)>>Q R
,>>R S
(>>T U
Int32>>U Z
)>>Z [
HttpStatusCode>>[ i
.>>i j
OK>>j l
)>>l m
;>>m n
}?? 
catch@@ 
(@@ 
	Exception@@ 
ex@@ 
)@@  
{AA 
returnBB 
_ObjectResponseBB &
.BB& '
CreateBB' -
(BB- .
falseBB. 3
,BB3 4
(BB5 6
Int32BB6 ;
)BB; <
HttpStatusCodeBB< J
.BBJ K
InternalServerErrorBBK ^
,BB^ _
ConvertBB` g
.BBg h
ToStringBBh p
(BBp q
exBBq s
.BBs t

StackTraceBBt ~
)BB~ 
)	BB �
;
BB� �
}CC 
}DD 	
[GG 	
HttpGetGG	 
,GG 
RouteGG 
(GG 
$strGG &
)GG& '
]GG' (
publicHH 
asyncHH 
TaskHH 
<HH 
IActionResultHH '
>HH' (
GetByIdHH) 0
(HH0 1
[HH1 2
	FromRouteHH2 ;
]HH; <
intHH= @
idHHA C
)HHC D
{II 	
tryJJ 
{KK 
varLL 
oCityEntityLL 
=LL  !
awaitLL" '
_CityServiceLL( 4
.LL4 5
GetByIdLL5 <
(LL< =
idLL= ?
)LL? @
;LL@ A
ifMM 
(MM 
oCityEntityMM 
!=MM  "
nullMM# '
&&MM( *
oCityEntityMM+ 6
.MM6 7
IdMM7 9
>MM: ;
$numMM< =
)MM= >
returnNN 
_ObjectResponseNN *
.NN* +
CreateNN+ 1
(NN1 2
oCityEntityNN2 =
,NN= >
(NN? @
Int32NN@ E
)NNE F
HttpStatusCodeNNF T
.NNT U
OKNNU W
)NNW X
;NNX Y
elseOO 
returnPP 
_ObjectResponsePP *
.PP* +
CreatePP+ 1
(PP1 2
nullPP2 6
,PP6 7
(PP8 9
Int32PP9 >
)PP> ?
HttpStatusCodePP? M
.PPM N

BadRequestPPN X
,PPX Y
AppConstantsPPZ f
.PPf g
NoRecordFoundPPg t
)PPt u
;PPu v
}QQ 
catchRR 
(RR 
	ExceptionRR 
exRR 
)RR  
{SS 
returnTT 
_ObjectResponseTT &
.TT& '
CreateTT' -
(TT- .
falseTT. 3
,TT3 4
(TT5 6
Int32TT6 ;
)TT; <
HttpStatusCodeTT< J
.TTJ K
InternalServerErrorTTK ^
,TT^ _
ConvertTT` g
.TTg h
ToStringTTh p
(TTp q
exTTq s
.TTs t

StackTraceTTt ~
)TT~ 
)	TT �
;
TT� �
}UU 
}VV 	
[YY 	
HttpPostYY	 
]YY 
[ZZ 	
RouteZZ	 
(ZZ 
$strZZ 
)ZZ 
]ZZ 
public[[ 
async[[ 
Task[[ 
<[[ 
IActionResult[[ '
>[[' (
Upsert[[) /
([[/ 0
MasterCityEntity[[0 @
oCity[[A F
)[[F G
{\\ 	
try]] 
{^^ 
DBOperation__ 
	oResponse__ %
=__& '
await__( -
_CityService__. :
.__: ;
Upsert__; A
(__A B
oCity__B G
)__G H
;__H I
if`` 
(`` 
	oResponse`` 
==``  
DBOperation``! ,
.``, -
Success``- 4
)``4 5
{aa 
returnbb 
_ObjectResponsebb *
.bb* +
Createbb+ 1
(bb1 2
truebb2 6
,bb6 7
(bb8 9
Int32bb9 >
)bb> ?
HttpStatusCodebb? M
.bbM N
OKbbN P
,bbP Q
(bbR S
oCitybbS X
.bbX Y
IdbbY [
>bb\ ]
$numbb^ _
?bb` a
AppConstantsbbb n
.bbn o
UpdateSuccessbbo |
:bb} ~
AppConstants	bb �
.
bb� �
InsertSuccess
bb� �
)
bb� �
)
bb� �
;
bb� �
}cc 
elsedd 
returnee 
_ObjectResponseee *
.ee* +
Createee+ 1
(ee1 2
falseee2 7
,ee7 8
(ee9 :
Int32ee: ?
)ee? @
HttpStatusCodeee@ N
.eeN O

BadRequesteeO Y
,eeY Z
(ee[ \
	oResponseee\ e
==eef h
DBOperationeei t
.eet u
NotFoundeeu }
?ee~ 
AppConstants
ee� �
.
ee� �
NoRecordFound
ee� �
:
ee� �
AppConstants
ee� �
.
ee� �

BadRequest
ee� �
)
ee� �
)
ee� �
;
ee� �
}ff 
catchgg 
(gg 
	Exceptiongg 
exgg 
)gg  
{hh 
returnii 
_ObjectResponseii &
.ii& '
Createii' -
(ii- .
falseii. 3
,ii3 4
(ii5 6
Int32ii6 ;
)ii; <
HttpStatusCodeii< J
.iiJ K
InternalServerErroriiK ^
,ii^ _
Convertii` g
.iig h
ToStringiih p
(iip q
exiiq s
.iis t

StackTraceiit ~
)ii~ 
)	ii �
;
ii� �
}jj 
}kk 	
[nn 	

HttpDeletenn	 
(nn 
$strnn !
)nn! "
]nn" #
publicoo 
asyncoo 
Taskoo 
<oo 
IActionResultoo '
>oo' (
Deleteoo) /
(oo/ 0
[oo0 1
	FromRouteoo1 :
]oo: ;
intoo< ?
idoo@ B
)ooB C
{pp 	
tryqq 
{rr 
DBOperationss 
	oResponsess %
=ss& '
awaitss( -
_CityServicess. :
.ss: ;
Deletess; A
(ssA B
idssB D
)ssD E
;ssE F
iftt 
(tt 
	oResponsett 
==tt  
DBOperationtt! ,
.tt, -
Successtt- 4
)tt4 5
returnuu 
_ObjectResponseuu *
.uu* +
Createuu+ 1
(uu1 2
trueuu2 6
,uu6 7
(uu8 9
Int32uu9 >
)uu> ?
HttpStatusCodeuu? M
.uuM N
OKuuN P
,uuP Q
AppConstantsuuR ^
.uu^ _
DeleteSuccessuu_ l
)uul m
;uum n
elsevv 
returnww 
_ObjectResponseww *
.ww* +
Createww+ 1
(ww1 2
nullww2 6
,ww6 7
(ww8 9
Int32ww9 >
)ww> ?
HttpStatusCodeww? M
.wwM N

BadRequestwwN X
,wwX Y
AppConstantswwZ f
.wwf g
NoRecordFoundwwg t
)wwt u
;wwu v
}xx 
catchyy 
(yy 
	Exceptionyy 
exyy 
)yy  
{zz 
return{{ 
_ObjectResponse{{ &
.{{& '
Create{{' -
({{- .
false{{. 3
,{{3 4
({{5 6
Int32{{6 ;
){{; <
HttpStatusCode{{< J
.{{J K
InternalServerError{{K ^
,{{^ _
Convert{{` g
.{{g h
ToString{{h p
({{p q
ex{{q s
.{{s t

StackTrace{{t ~
){{~ 
)	{{ �
;
{{� �
}|| 
}}} 	
[ 	
HttpGet	 
( 
$str 
) 
]  
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
GetCityList
��) 4
(
��4 5
)
��5 6
{
�� 	
try
�� 
{
�� 
return
�� 
_ObjectResponse
�� &
.
��& '

CreateData
��' 1
(
��1 2
await
��2 7
_CityService
��8 D
.
��D E
GetCityList
��E P
(
��P Q
)
��Q R
,
��R S
(
��T U
Int32
��U Z
)
��Z [
HttpStatusCode
��[ i
.
��i j
OK
��j l
)
��l m
;
��m n
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
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
Convert
��` g
.
��g h
ToString
��h p
(
��p q
ex
��q s
.
��s t

StackTrace
��t ~
)
��~ 
)�� �
;��� �
}
�� 
}
�� 	
[
�� 	
HttpGet
��	 
(
�� 
$str
�� 1
)
��1 2
]
��2 3
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' ("
GetCityListByStateId
��) =
(
��= >
[
��> ?
	FromRoute
��? H
]
��H I
int
��J M
stateId
��N U
)
��U V
{
�� 	
try
�� 
{
�� 
return
�� 
_ObjectResponse
�� &
.
��& '

CreateData
��' 1
(
��1 2
await
��2 7
_CityService
��8 D
.
��D E"
GetCityListByStateId
��E Y
(
��Y Z
stateId
��Z a
)
��a b
,
��b c
(
��d e
Int32
��e j
)
��j k
HttpStatusCode
��k y
.
��y z
OK
��z |
)
��| }
;
��} ~
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
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
Convert
��` g
.
��g h
ToString
��h p
(
��p q
ex
��q s
.
��s t

StackTrace
��t ~
)
��~ 
)�� �
;��� �
}
�� 
}
�� 	
}
�� 
}�� �W
MD:\EltizamLive\Eltizam.WebApi\src\API\Controllers\MasterCityTestController.cs
	namespace 	
Eltizam
 
. 
WebApi 
. 
Controllers $
{ 
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
Route 

(
 
$str 3
)3 4
]4 5
public 

class $
MasterCityTestController )
:* +
ControllerBase, :
{ 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
private 
readonly 
IResponseHandler )
<) *
dynamic* 1
>1 2
_ObjectResponse3 B
;B C
private 
readonly 
	IMediator "
	_mediator# ,
;, -
private 
readonly 
IMasterCityService +
_cityServices, 9
;9 :
private 
readonly !
IMasterCityRepository .
_cityrepository/ >
;> ?
private 
readonly 
IMapper  
_mapper! (
;( )
public## $
MasterCityTestController## '
(##' (
	IMediator##( 1
mediator##2 :
,##: ;
IResponseHandler##< L
<##L M
dynamic##M T
>##T U
ObjectResponse##V d
,##d e
IMapper##f m
mapper##n t
,##t u
IMasterCityService	##v �
cityService
##� �
,
##� �!
IMasterCityRepository$$$ 9
cityrepository$$: H
)$$H I
{%% 	
	_mediator&& 
=&& 
mediator&&  
;&&  !
_ObjectResponse'' 
='' 
ObjectResponse'' ,
;'', -
_cityServices(( 
=(( 
cityService(( '
;((' (
_cityrepository)) 
=)) 
cityrepository)) ,
;)), -
_mapper** 
=** 
mapper** 
;** 
}++ 	
[?? 	
HttpPost??	 
,?? 
Route?? 
(?? 
$str?? !
)??! "
]??" #
public@@ 
async@@ 
Task@@ 
<@@ 
IActionResult@@ '
>@@' (
GetAll@@) /
(@@/ 0
[@@0 1
FromForm@@1 9
]@@9 :"
DataTableAjaxPostModel@@; Q
model@@R W
)@@W X
{AA 	
tryBB 
{CC 
varDD 
ressDD 
=DD 
_cityServicesDD (
.DD( )
GetAllDD) /
(DD/ 0
modelDD0 5
)DD5 6
;DD6 7
returnFF 
_ObjectResponseFF &
.FF& '

CreateDataFF' 1
(FF1 2
ressFF2 6
,FF6 7
(FF8 9
Int32FF9 >
)FF> ?
HttpStatusCodeFF? M
.FFM N
OKFFN P
)FFP Q
;FFQ R
}SS 
catchTT 
(TT 
	ExceptionTT 
exTT 
)TT  
{UU 
returnVV 
_ObjectResponseVV &
.VV& '
CreateErrorVV' 2
(VV2 3
falseVV3 8
,VV8 9
(VV: ;
Int32VV; @
)VV@ A
HttpStatusCodeVVA O
.VVO P
InternalServerErrorVVP c
,VVc d
exVVe g
)VVg h
;VVh i
}WW 
}XX 	
[ZZ 	
HttpGetZZ	 
,ZZ 
RouteZZ 
(ZZ 
$strZZ !
)ZZ! "
]ZZ" #
public[[ 
async[[ 
Task[[ 
<[[ 
IActionResult[[ '
>[[' (
GetDate[[) 0
([[0 1
)[[1 2
{\\ 	
return]] 
_ObjectResponse]] "
.]]" #
Create]]# )
(]]) *
DateTime]]* 2
.]]2 3
Now]]3 6
,]]6 7
(]]8 9
Int32]]9 >
)]]> ?
HttpStatusCode]]? M
.]]M N
OK]]N P
)]]P Q
;]]Q R
}^^ 	
[bb 	
HttpGetbb	 
,bb 
Routebb 
(bb 
$strbb &
)bb& '
]bb' (
publiccc 
asynccc 
Taskcc 
<cc 
IActionResultcc '
>cc' (
GetByIdcc) 0
(cc0 1
[cc1 2
	FromRoutecc2 ;
]cc; <
intcc= @
idccA C
)ccC D
{dd 	
tryee 
{ff 
vargg 
valgg 
=gg 
awaitgg 
_cityServicesgg  -
.gg- .
GetById1gg. 6
(gg6 7
idgg7 9
)gg9 :
;gg: ;
varjj 
mdjj 
=jj 
_mapperjj  
.jj  !
Mapjj! $
<jj$ %
MasterCityEntityjj% 5
>jj5 6
(jj6 7
valjj7 :
)jj: ;
;jj; <
varll 
cmdll 
=ll 
newll $
MasterCityGetByIdCommandll 6
(ll6 7
)ll7 8
{mm 
Idnn 
=nn 
idnn 
}oo 
;oo 
varqq 
oCityEntityqq 
=qq  !
awaitqq" '
	_mediatorqq( 1
.qq1 2
Sendqq2 6
(qq6 7
cmdqq7 :
)qq: ;
;qq; <
ifss 
(ss 
oCityEntityss 
.ss  
Idss  "
>ss# $
$numss% &
)ss& '
returntt 
_ObjectResponsett *
.tt* +
Creatett+ 1
(tt1 2
oCityEntitytt2 =
,tt= >
(tt? @
Int32tt@ E
)ttE F
HttpStatusCodettF T
.ttT U
OKttU W
)ttW X
;ttX Y
elseuu 
returnvv 
_ObjectResponsevv *
.vv* +
Createvv+ 1
(vv1 2
nullvv2 6
,vv6 7
(vv8 9
Int32vv9 >
)vv> ?
HttpStatusCodevv? M
.vvM N

BadRequestvvN X
,vvX Y
AppConstantsvvZ f
.vvf g
NoRecordFoundvvg t
)vvt u
;vvu v
}ww 
catchxx 
(xx 
	Exceptionxx 
exxx 
)xx  
{yy 
returnzz 
_ObjectResponsezz &
.zz& '
CreateErrorzz' 2
(zz2 3
falsezz3 8
,zz8 9
(zz: ;
Int32zz; @
)zz@ A
HttpStatusCodezzA O
.zzO P
InternalServerErrorzzP c
,zzc d
exzze g
)zzg h
;zzh i
}{{ 
}|| 	
[ 	
HttpPost	 
( 
$str 
) 
] 
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
Upsert
��) /
(
��/ 0%
MasterCityUpsertCommand
��0 G
model
��H M
)
��M N
{
�� 	
var
�� 
entity
�� 
=
�� 
new
�� 
MasterCityEntity
�� -
(
��- .
)
��. /
{
�� 
CityName
�� 
=
�� 
model
��  
.
��  !
CityName
��! )
,
��) *
StateId
�� 
=
�� 
$num
�� 
,
�� 
IsActive
�� 
=
�� 
$num
�� 
,
�� 
	CountryId
�� 
=
�� 
model
�� !
.
��! "
	CountryId
��" +
,
��+ ,
}
�� 
;
�� 
var
�� 
ent
�� 
=
�� 
_mapper
�� 
.
�� 
Map
�� !
<
��! "

MasterCity
��" ,
>
��, -
(
��- .
entity
��. 4
)
��4 5
;
��5 6
var
�� 
val
�� 
=
�� 
_cityServices
�� #
.
��# $
Upsert
��$ *
(
��* +
entity
��+ 1
)
��1 2
;
��2 3
return
�� 
_ObjectResponse
�� "
.
��" #
Create
��# )
(
��) *
val
��* -
,
��- .
(
��/ 0
Int32
��0 5
)
��5 6
HttpStatusCode
��6 D
.
��D E
OK
��E G
)
��G H
;
��H I
}
�� 	
[
�� 	
HttpPost
��	 
(
�� 
$str
�� 
)
�� 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
Upsert1
��) 0
(
��0 1
MasterCityEntity
��1 A
model
��B G
)
��G H
{
�� 	
var
�� 
val
�� 
=
�� 
_cityServices
�� #
.
��# $
Upsert
��$ *
(
��* +
model
��+ 0
)
��0 1
;
��1 2
return
�� 
_ObjectResponse
�� "
.
��" #
Create
��# )
(
��) *
val
��* -
,
��- .
(
��/ 0
Int32
��0 5
)
��5 6
HttpStatusCode
��6 D
.
��D E
OK
��E G
)
��G H
;
��H I
}
�� 	
[
�� 	

HttpDelete
��	 
(
�� 
$str
�� !
)
��! "
]
��" #
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
Delete
��) /
(
��/ 0
[
��0 1
	FromRoute
��1 :
]
��: ;
int
��< ?
id
��@ B
)
��B C
{
�� 	
var
�� 
cmd
�� 
=
�� 
new
�� %
MasterCityDeleteCommand
�� 1
(
��1 2
)
��2 3
{
�� 
Id
�� 
=
�� 
id
�� 
}
�� 
;
�� 
var
�� 
oCityEntity
�� 
=
�� 
await
�� #
	_mediator
��$ -
.
��- .
Send
��. 2
(
��2 3
cmd
��3 6
)
��6 7
;
��7 8
if
�� 
(
�� 
oCityEntity
�� 
)
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
oCityEntity
��. 9
,
��9 :
(
��; <
Int32
��< A
)
��A B
HttpStatusCode
��B P
.
��P Q
OK
��Q S
)
��S T
;
��T U
else
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
null
��. 2
,
��2 3
(
��4 5
Int32
��5 :
)
��: ;
HttpStatusCode
��; I
.
��I J

BadRequest
��J T
,
��T U
AppConstants
��V b
.
��b c
NoRecordFound
��c p
)
��p q
;
��q r
}
�� 	
}
�� 
}�� �v
KD:\EltizamLive\Eltizam.WebApi\src\API\Controllers\MasterClientController.cs
	namespace 	
Eltizam
 
. 
WebApi 
. 
Controllers $
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
Route 

(
 
$str 3
)3 4
]4 5
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class "
MasterClientController '
:( )
ControllerBase* 8
{ 
private 
readonly  
IMasterClientService -
_clientServices. =
;= >
private 
readonly 
IResponseHandler )
<) *
dynamic* 1
>1 2
_ObjectResponse3 B
;B C
private 
readonly 
IExceptionService *
_ExceptionService+ <
;< =
public "
MasterClientController %
(% & 
IMasterClientService& :
clientServices; I
,I J
IResponseHandlerK [
<[ \
dynamic\ c
>c d
ObjectResponsee s
,s t
IExceptionService	u �
exceptionService
� �
)
� �
{ 	
_clientServices 
= 
clientServices ,
;, -
_ObjectResponse 
= 
ObjectResponse ,
;, -
_ExceptionService 
= 
exceptionService  0
;0 1
} 	
[## 	
HttpPost##	 
]## 
[$$ 	
Route$$	 
($$ 
$str$$ 
)$$ 
]$$ 
public%% 
async%% 
Task%% 
<%% 
IActionResult%% '
>%%' (
Upsert%%) /
(%%/ 0
MasterClientModel%%0 A
client%%B H
)%%H I
{&& 	
try'' 
{(( 
DBOperation)) 
	oResponse)) %
=))& '
await))( -
_clientServices)). =
.))= >!
AddUpdateMasterClient))> S
())S T
client))T Z
)))Z [
;))[ \
if** 
(** 
	oResponse** 
==**  
DBOperation**! ,
.**, -
Success**- 4
)**4 5
{++ 
return,, 
_ObjectResponse,, *
.,,* +
Create,,+ 1
(,,1 2
true,,2 6
,,,6 7
(,,8 9
Int32,,9 >
),,> ?
HttpStatusCode,,? M
.,,M N
OK,,N P
,,,P Q
(,,R S
client,,S Y
.,,Y Z
Id,,Z \
>,,] ^
$num,,_ `
?,,a b
AppConstants,,c o
.,,o p
UpdateSuccess,,p }
:,,~ 
AppConstants
,,� �
.
,,� �
InsertSuccess
,,� �
)
,,� �
)
,,� �
;
,,� �
}-- 
else.. 
return// 
_ObjectResponse// *
.//* +
Create//+ 1
(//1 2
false//2 7
,//7 8
(//9 :
Int32//: ?
)//? @
HttpStatusCode//@ N
.//N O

BadRequest//O Y
,//Y Z
(//[ \
	oResponse//\ e
==//f h
DBOperation//i t
.//t u
NotFound//u }
?//~ 
AppConstants
//� �
.
//� �
NoRecordFound
//� �
:
//� �
AppConstants
//� �
.
//� �

BadRequest
//� �
)
//� �
)
//� �
;
//� �
}00 
catch11 
(11 
	Exception11 
ex11 
)11  
{22 
return33 
_ObjectResponse33 &
.33& '
Create33' -
(33- .
false33. 3
,333 4
(335 6
Int32336 ;
)33; <
HttpStatusCode33< J
.33J K
InternalServerError33K ^
,33^ _
Convert33` g
.33g h
ToString33h p
(33p q
ex33q s
.33s t

StackTrace33t ~
)33~ 
)	33 �
;
33� �
}44 
}55 	
[77 	
HttpGet77	 
]77 
[88 	
Route88	 
(88 
$str88 
)88 
]88 
public99 
async99 
Task99 
<99 
IActionResult99 '
>99' (!
GetMasterPropertyById99) >
(99> ?
[99? @
	FromRoute99@ I
]99I J
int99K N
id99O Q
)99Q R
{:: 	
try;; 
{<< 
var== 
clientClient==  
===! "
await==# (
_clientServices==) 8
.==8 9$
GetMasterClientByIdAsync==9 Q
(==Q R
id==R T
)==T U
;==U V
if?? 
(?? 
clientClient??  
!=??! #
null??$ (
&&??) +
clientClient??, 8
.??8 9
Id??9 ;
>??< =
$num??> ?
)??? @
{@@ 
returnBB 
_ObjectResponseBB *
.BB* +
CreateBB+ 1
(BB1 2
clientClientBB2 >
,BB> ?
(BB@ A
intBBA D
)BBD E
HttpStatusCodeBBE S
.BBS T
OKBBT V
)BBV W
;BBW X
}CC 
elseDD 
{EE 
returnFF 
_ObjectResponseFF *
.FF* +
CreateFF+ 1
(FF1 2
nullFF2 6
,FF6 7
(FF8 9
intFF9 <
)FF< =
HttpStatusCodeFF= K
.FFK L

BadRequestFFL V
,FFV W
AppConstantsFFX d
.FFd e
NoRecordFoundFFe r
)FFr s
;FFs t
}GG 
}HH 
catchII 
(II 
	ExceptionII 
exII 
)II  
{JJ 
returnKK 
_ObjectResponseKK &
.KK& '
CreateKK' -
(KK- .
nullKK. 2
,KK2 3
(KK4 5
intKK5 8
)KK8 9
HttpStatusCodeKK9 G
.KKG H
InternalServerErrorKKH [
,KK[ \
ConvertKK] d
.KKd e
ToStringKKe m
(KKm n
exKKn p
.KKp q

StackTraceKKq {
)KK{ |
)KK| }
;KK} ~
}LL 
}MM 	
[PP 	
HttpPostPP	 
,PP 
RoutePP 
(PP 
$strPP '
)PP' (
]PP( )
publicQQ 
asyncQQ 
TaskQQ 
<QQ 
IActionResultQQ '
>QQ' (
GetAllClientQQ) 5
(QQ5 6
[QQ6 7
FromFormQQ7 ?
]QQ? @"
DataTableAjaxPostModelQQA W
modelQQX ]
)QQ] ^
{RR 	
trySS 
{TT 
returnUU 
_ObjectResponseUU &
.UU& '

CreateDataUU' 1
(UU1 2
awaitUU2 7
_clientServicesUU8 G
.UUG H
GetAllUUH N
(UUN O
modelUUO T
)UUT U
,UUU V
(UUW X
Int32UUX ]
)UU] ^
HttpStatusCodeUU^ l
.UUl m
OKUUm o
)UUo p
;UUp q
}VV 
catchWW 
(WW 
	ExceptionWW 
exWW 
)WW  
{XX 
returnYY 
_ObjectResponseYY &
.YY& '
CreateYY' -
(YY- .
falseYY. 3
,YY3 4
(YY5 6
Int32YY6 ;
)YY; <
HttpStatusCodeYY< J
.YYJ K
InternalServerErrorYYK ^
,YY^ _
ConvertYY` g
.YYg h
ToStringYYh p
(YYp q
exYYq s
.YYs t

StackTraceYYt ~
)YY~ 
)	YY �
;
YY� �
}ZZ 
}[[ 	
[]] 	
HttpPost]]	 
(]] 
$str]] %
)]]% &
]]]& '
public^^ 
async^^ 
Task^^ 
<^^ 
IActionResult^^ '
>^^' (
Delete^^) /
(^^/ 0
[^^0 1
	FromRoute^^1 :
]^^: ;
int^^< ?
id^^@ B
,^^B C
int^^D G
?^^G H
by^^I K
)^^K L
{__ 	
try`` 
{aa 
DBOperationbb 
	oResponsebb %
=bb& '
awaitbb( -
_clientServicesbb. =
.bb= >
DeleteClientbb> J
(bbJ K
idbbK M
,bbM N
bybbO Q
)bbQ R
;bbR S
ifcc 
(cc 
	oResponsecc 
==cc  
DBOperationcc! ,
.cc, -
Successcc- 4
)cc4 5
returndd 
_ObjectResponsedd *
.dd* +
Createdd+ 1
(dd1 2
truedd2 6
,dd6 7
(dd8 9
Int32dd9 >
)dd> ?
HttpStatusCodedd? M
.ddM N
OKddN P
,ddP Q
AppConstantsddR ^
.dd^ _
DeleteSuccessdd_ l
)ddl m
;ddm n
elseee 
ifee 
(ee 
	oResponseee "
==ee# %
DBOperationee& 1
.ee1 2
AlreadyExistee2 >
)ee> ?
returnff 
_ObjectResponseff *
.ff* +
Createff+ 1
(ff1 2
nullff2 6
,ff6 7
(ff8 9
Int32ff9 >
)ff> ?
HttpStatusCodeff? M
.ffM N
OKffN P
,ffP Q
$str	ffR �
)
ff� �
;
ff� �
elsegg 
returnhh 
_ObjectResponsehh *
.hh* +
Createhh+ 1
(hh1 2
nullhh2 6
,hh6 7
(hh8 9
Int32hh9 >
)hh> ?
HttpStatusCodehh? M
.hhM N

BadRequesthhN X
,hhX Y
AppConstantshhZ f
.hhf g
NoRecordFoundhhg t
)hht u
;hhu v
}ii 
catchjj 
(jj 
	Exceptionjj 
exjj 
)jj  
{kk 
awaitll 
_ExceptionServicell '
.ll' (
LogExceptionll( 4
(ll4 5
exll5 7
)ll7 8
;ll8 9
returnmm 
_ObjectResponsemm &
.mm& '
Createmm' -
(mm- .
falsemm. 3
,mm3 4
(mm5 6
Int32mm6 ;
)mm; <
HttpStatusCodemm< J
.mmJ K
InternalServerErrormmK ^
,mm^ _
exmm` b
.mmb c
Messagemmc j
)mmj k
;mmk l
}nn 
}oo 	
[qq 	
HttpGetqq	 
]qq 
[rr 	
Routerr	 
(rr 
$strrr '
)rr' (
]rr( )
publicss 
asyncss 
Taskss 
<ss 
IActionResultss '
>ss' ()
GetMasterClientByClientTypeIdss) F
(ssF G
[ssG H
	FromRoutessH Q
]ssQ R
intssS V
idssW Y
)ssY Z
{tt 	
tryuu 
{vv 
varww 
oPrpoertyTypeEntityww '
=ww( )
awaitww* /
_clientServicesww0 ?
.ww? @.
"GetMasterClientByClientTypeIdAsyncww@ b
(wwb c
idwwc e
)wwe f
;wwf g
ifxx 
(xx 
oPrpoertyTypeEntityxx '
!=xx( *
nullxx+ /
)xx/ 0
returnyy 
_ObjectResponseyy *
.yy* +

CreateDatayy+ 5
(yy5 6
oPrpoertyTypeEntityyy6 I
,yyI J
(yyK L
Int32yyL Q
)yyQ R
HttpStatusCodeyyR `
.yy` a
OKyya c
)yyc d
;yyd e
elsezz 
return{{ 
_ObjectResponse{{ *
.{{* +
Create{{+ 1
({{1 2
null{{2 6
,{{6 7
({{8 9
Int32{{9 >
){{> ?
HttpStatusCode{{? M
.{{M N

BadRequest{{N X
,{{X Y
AppConstants{{Z f
.{{f g
NoRecordFound{{g t
){{t u
;{{u v
}|| 
catch}} 
(}} 
	Exception}} 
ex}} 
)}}  
{~~ 
return 
_ObjectResponse &
.& '
Create' -
(- .
false. 3
,3 4
(5 6
Int326 ;
); <
HttpStatusCode< J
.J K
InternalServerErrorK ^
,^ _
Convert` g
.g h
ToStringh p
(p q
exq s
.s t

StackTracet ~
)~ 
)	 �
;
� �
}
�� 
}
�� 	
[
�� 	

HttpDelete
��	 
(
�� 
$str
�� )
)
��) *
]
��* +
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
DeleteDocument
��) 7
(
��7 8
[
��8 9
	FromRoute
��9 B
]
��B C
int
��D G
id
��H J
,
��J K
int
��K N
?
��N O
by
��P R
)
��R S
{
�� 	
try
�� 
{
�� 
DBOperation
�� 
	oResponse
�� %
=
��& '
await
��( -
_clientServices
��. =
.
��= >
DeleteDocument
��> L
(
��L M
id
��M O
,
��O P
by
��P R
)
��R S
;
��S T
if
�� 
(
�� 
	oResponse
�� 
==
��  
DBOperation
��! ,
.
��, -
Success
��- 4
)
��4 5
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
true
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N
OK
��N P
,
��P Q
AppConstants
��R ^
.
��^ _
DeleteSuccess
��_ l
)
��l m
;
��m n
else
�� 
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
null
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N

BadRequest
��N X
,
��X Y
AppConstants
��Z f
.
��f g
NoRecordFound
��g t
)
��t u
;
��u v
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
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
Convert
��` g
.
��g h
ToString
��h p
(
��p q
ex
��q s
.
��s t

StackTrace
��t ~
)
��~ 
)�� �
;��� �
}
�� 
}
�� 	
}
�� 
}�� �^
OD:\EltizamLive\Eltizam.WebApi\src\API\Controllers\MasterClientTypeController.cs
	namespace

 	
Eltizam


 
.

 
WebApi

 
.

 
Controllers

 $
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
Route 

(
 
$str 3
)3 4
]4 5
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class &
MasterClientTypeController +
:, -
ControllerBase. <
{ 
private 
readonly $
IMasterClientTypeService 1
_clienttypeServices2 E
;E F
private 
readonly 
IResponseHandler )
<) *
dynamic* 1
>1 2
_ObjectResponse3 B
;B C
private 
readonly 
IExceptionService *
_ExceptionService+ <
;< =
IExceptionService 
exceptionService *
;* +
public &
MasterClientTypeController )
() *$
IMasterClientTypeService* B
clienttypeServicesC U
,U V
IResponseHandlerW g
<g h
dynamich o
>o p
ObjectResponseq 
)	 �
{ 	
_clienttypeServices 
=  !
clienttypeServices" 4
;4 5
_ObjectResponse 
= 
ObjectResponse ,
;, -
_ExceptionService 
= 
exceptionService  0
;0 1
} 	
[## 	
HttpPost##	 
]## 
[$$ 	
Route$$	 
($$ 
$str$$ 
)$$ 
]$$ 
public%% 
async%% 
Task%% 
<%% 
IActionResult%% '
>%%' (
Upsert%%) /
(%%/ 0"
Master_ClientTypeModel%%0 F

clientType%%G Q
)%%Q R
{&& 	
try'' 
{(( 
DBOperation)) 
	oResponse)) %
=))& '
await))( -
_clienttypeServices)). A
.))A B%
AddUpdateMasterClientType))B [
())[ \

clientType))\ f
)))f g
;))g h
if** 
(** 
	oResponse** 
==**  
DBOperation**! ,
.**, -
Success**- 4
)**4 5
{++ 
return,, 
_ObjectResponse,, *
.,,* +
Create,,+ 1
(,,1 2
true,,2 6
,,,6 7
(,,8 9
Int32,,9 >
),,> ?
HttpStatusCode,,? M
.,,M N
OK,,N P
,,,P Q
(,,R S

clientType,,S ]
.,,] ^
Id,,^ `
>,,a b
$num,,c d
?,,e f
AppConstants,,g s
.,,s t
UpdateSuccess	,,t �
:
,,� �
AppConstants
,,� �
.
,,� �
InsertSuccess
,,� �
)
,,� �
)
,,� �
;
,,� �
}-- 
else.. 
return// 
_ObjectResponse// *
.//* +
Create//+ 1
(//1 2
false//2 7
,//7 8
(//9 :
Int32//: ?
)//? @
HttpStatusCode//@ N
.//N O

BadRequest//O Y
,//Y Z
(//[ \
	oResponse//\ e
==//f h
DBOperation//i t
.//t u
NotFound//u }
?//~ 
AppConstants
//� �
.
//� �
NoRecordFound
//� �
:
//� �
AppConstants
//� �
.
//� �

BadRequest
//� �
)
//� �
)
//� �
;
//� �
}00 
catch11 
(11 
	Exception11 
ex11 
)11  
{22 
return44 
_ObjectResponse44 &
.44& '
Create44' -
(44- .
false44. 3
,443 4
(445 6
Int32446 ;
)44; <
HttpStatusCode44< J
.44J K
InternalServerError44K ^
,44^ _
Convert44` g
.44g h
ToString44h p
(44p q
ex44q s
.44s t

StackTrace44t ~
)44~ 
)	44 �
;
44� �
}55 
}66 	
[88 	
HttpGet88	 
]88 
[99 	
Route99	 
(99 
$str99 
)99 
]99 
public:: 
async:: 
Task:: 
<:: 
IActionResult:: '
>::' (#
GetMasterClientTypeById::) @
(::@ A
[::A B
	FromRoute::B K
]::K L
int::M P
id::Q S
)::S T
{;; 	
try<< 
{== 
var>> 
oClientTypeEntity>> %
=>>& '
await>>( -
_clienttypeServices>>. A
.>>A B(
GetMasterClientTypeByIdAsync>>B ^
(>>^ _
id>>_ a
)>>a b
;>>b c
if?? 
(?? 
oClientTypeEntity?? %
!=??& (
null??) -
&&??. 0
oClientTypeEntity??1 B
.??B C
Id??C E
>??F G
$num??H I
)??I J
return@@ 
_ObjectResponse@@ *
.@@* +
Create@@+ 1
(@@1 2
oClientTypeEntity@@2 C
,@@C D
(@@E F
Int32@@F K
)@@K L
HttpStatusCode@@L Z
.@@Z [
OK@@[ ]
)@@] ^
;@@^ _
elseAA 
returnBB 
_ObjectResponseBB *
.BB* +
CreateBB+ 1
(BB1 2
nullBB2 6
,BB6 7
(BB8 9
Int32BB9 >
)BB> ?
HttpStatusCodeBB? M
.BBM N

BadRequestBBN X
,BBX Y
AppConstantsBBZ f
.BBf g
NoRecordFoundBBg t
)BBt u
;BBu v
}CC 
catchDD 
(DD 
	ExceptionDD 
exDD 
)DD  
{EE 
returnFF 
_ObjectResponseFF &
.FF& '
CreateFF' -
(FF- .
falseFF. 3
,FF3 4
(FF5 6
Int32FF6 ;
)FF; <
HttpStatusCodeFF< J
.FFJ K
InternalServerErrorFFK ^
,FF^ _
ConvertFF` g
.FFg h
ToStringFFh p
(FFp q
exFFq s
.FFs t

StackTraceFFt ~
)FF~ 
)	FF �
;
FF� �
}GG 
}HH 	
[JJ 	
HttpGetJJ	 
,JJ 
RouteJJ 
(JJ 
$strJJ *
)JJ* +
]JJ+ ,
publicKK 
asyncKK 
TaskKK 
<KK 
IActionResultKK '
>KK' (
GetAllClientTypeKK) 9
(KK9 :
)KK: ;
{LL 	
tryMM 
{NN 
varOO 
	oRoleListOO 
=OO 
awaitOO  %
_clienttypeServicesOO& 9
.OO9 :
GetAllOO: @
(OO@ A
)OOA B
;OOB C
ifPP 
(PP 
	oRoleListPP 
!=PP  
nullPP! %
)PP% &
returnQQ 
_ObjectResponseQQ *
.QQ* +

CreateDataQQ+ 5
(QQ5 6
	oRoleListQQ6 ?
,QQ? @
(QQA B
Int32QQB G
)QQG H
HttpStatusCodeQQH V
.QQV W
OKQQW Y
)QQY Z
;QQZ [
elseRR 
returnSS 
_ObjectResponseSS *
.SS* +
CreateSS+ 1
(SS1 2
nullSS2 6
,SS6 7
(SS8 9
Int32SS9 >
)SS> ?
HttpStatusCodeSS? M
.SSM N

BadRequestSSN X
,SSX Y
AppConstantsSSZ f
.SSf g
NoRecordFoundSSg t
)SSt u
;SSu v
}TT 
catchUU 
(UU 
	ExceptionUU 
exUU 
)UU  
{VV 
returnWW 
_ObjectResponseWW &
.WW& '
CreateWW' -
(WW- .
falseWW. 3
,WW3 4
(WW5 6
Int32WW6 ;
)WW; <
HttpStatusCodeWW< J
.WWJ K
InternalServerErrorWWK ^
,WW^ _
ConvertWW` g
.WWg h
ToStringWWh p
(WWp q
exWWq s
.WWs t

StackTraceWWt ~
)WW~ 
)	WW �
;
WW� �
}XX 
}YY 	
[[[ 	
HttpPost[[	 
([[ 
$str[[ )
)[[) *
][[* +
public\\ 
async\\ 
Task\\ 
<\\ 
IActionResult\\ '
>\\' (
DeleteClientType\\) 9
(\\9 :
[\\: ;
	FromRoute\\; D
]\\D E
int\\F I
id\\J L
)\\L M
{]] 	
try^^ 
{__ 
DBOperation`` 
	oResponse`` %
=``& '
await``( -
_clienttypeServices``. A
.``A B
DeleteClientType``B R
(``R S
id``S U
)``U V
;``V W
ifaa 
(aa 
	oResponseaa 
==aa  
DBOperationaa! ,
.aa, -
Successaa- 4
)aa4 5
returnbb 
_ObjectResponsebb *
.bb* +
Createbb+ 1
(bb1 2
truebb2 6
,bb6 7
(bb8 9
Int32bb9 >
)bb> ?
HttpStatusCodebb? M
.bbM N
OKbbN P
,bbP Q
AppConstantsbbR ^
.bb^ _
DeleteSuccessbb_ l
)bbl m
;bbm n
elsecc 
returndd 
_ObjectResponsedd *
.dd* +
Createdd+ 1
(dd1 2
nulldd2 6
,dd6 7
(dd8 9
Int32dd9 >
)dd> ?
HttpStatusCodedd? M
.ddM N

BadRequestddN X
,ddX Y
AppConstantsddZ f
.ddf g
NoRecordFoundddg t
)ddt u
;ddu v
}ee 
catchff 
(ff 
	Exceptionff 
exff 
)ff  
{gg 
awaithh 
_ExceptionServicehh '
.hh' (
LogExceptionhh( 4
(hh4 5
exhh5 7
)hh7 8
;hh8 9
returnii 
_ObjectResponseii &
.ii& '
Createii' -
(ii- .
falseii. 3
,ii3 4
(ii5 6
Int32ii6 ;
)ii; <
HttpStatusCodeii< J
.iiJ K
InternalServerErroriiK ^
,ii^ _
Convertii` g
.iig h
ToStringiih p
(iip q
exiiq s
.iis t

StackTraceiit ~
)ii~ 
)	ii �
;
ii� �
}jj 
}kk 	
[mm 	
HttpGetmm	 
]mm 
[nn 	
Routenn	 
(nn 
$strnn "
)nn" #
]nn# $
publicoo 
asyncoo 
Taskoo 
<oo 
IActionResultoo '
>oo' (
GetClientTypeListoo) :
(oo: ;
)oo; <
{pp 	
tryqq 
{rr 
returnss 
_ObjectResponsess &
.ss& '

CreateDatass' 1
(ss1 2
awaitss2 7
_clienttypeServicesss8 K
.ssK L
GetClientTypeListssL ]
(ss] ^
)ss^ _
,ss_ `
(ssa b
Int32ssb g
)ssg h
HttpStatusCodessh v
.ssv w
OKssw y
)ssy z
;ssz {
}tt 
catchuu 
(uu 
	Exceptionuu 
exuu 
)uu  
{vv 
returnww 
_ObjectResponseww &
.ww& '
Createww' -
(ww- .
falseww. 3
,ww3 4
(ww5 6
Int32ww6 ;
)ww; <
HttpStatusCodeww< J
.wwJ K
InternalServerErrorwwK ^
,ww^ _
Convertww` g
.wwg h
ToStringwwh p
(wwp q
exwwq s
.wws t

StackTracewwt ~
)ww~ 
)	ww �
;
ww� �
}xx 
}yy 	
}{{ 
}|| �\
LD:\EltizamLive\Eltizam.WebApi\src\API\Controllers\MasterCountryController.cs
	namespace 	
Eltizam
 
. 
WebApi 
. 
Controllers $
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
Route 

(
 
$str 3
)3 4
]4 5
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class #
MasterCountryController (
:) *
ControllerBase+ 9
{ 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
private 
readonly 
IResponseHandler )
<) *
dynamic* 1
>1 2
_ObjectResponse3 B
;B C
private 
	Microsoft 
. 

Extensions $
.$ %
Hosting% ,
., -
IHostingEnvironment- @
_envA E
;E F
private 
readonly 
IExceptionService *
_ExceptionService+ <
;< =
private 
readonly !
IMasterCountryService .
_CountryService/ >
;> ?
public #
MasterCountryController &
(& '
IConfiguration' 5
configuration6 C
,C D
IResponseHandlerE U
<U V
dynamicV ]
>] ^
ObjectResponse_ m
,m n
IExceptionService	o �
exceptionService
� �
,
� �#
IMasterCountryService
� �
CountryService
� �
)
� �
{ 	
_configuration   
=   
configuration   *
;  * +
_ObjectResponse!! 
=!! 
ObjectResponse!! ,
;!!, -
_ExceptionService"" 
="" 
exceptionService""  0
;""0 1
_CountryService## 
=## 
CountryService## ,
;##, -
}$$ 	
[88 	
HttpPost88	 
,88 
Route88 
(88 
$str88 !
)88! "
]88" #
public99 
async99 
Task99 
<99 
IActionResult99 '
>99' (
GetAll99) /
(99/ 0
[990 1
FromForm991 9
]999 :"
DataTableAjaxPostModel99; Q
model99R W
)99W X
{:: 	
try;; 
{<< 
return== 
_ObjectResponse== &
.==& '

CreateData==' 1
(==1 2
await==2 7
_CountryService==8 G
.==G H
GetAll==H N
(==N O
model==O T
)==T U
,==U V
(==W X
Int32==X ]
)==] ^
HttpStatusCode==^ l
.==l m
OK==m o
)==o p
;==p q
}>> 
catch?? 
(?? 
	Exception?? 
ex?? 
)??  
{@@ 
returnAA 
_ObjectResponseAA &
.AA& '
CreateAA' -
(AA- .
falseAA. 3
,AA3 4
(AA5 6
Int32AA6 ;
)AA; <
HttpStatusCodeAA< J
.AAJ K
InternalServerErrorAAK ^
,AA^ _
ConvertAA` g
.AAg h
ToStringAAh p
(AAp q
exAAq s
.AAs t

StackTraceAAt ~
)AA~ 
)	AA �
;
AA� �
}BB 
}CC 	
[FF 	
HttpGetFF	 
,FF 
RouteFF 
(FF 
$strFF &
)FF& '
]FF' (
publicGG 
asyncGG 
TaskGG 
<GG 
IActionResultGG '
>GG' (
GetByIdGG) 0
(GG0 1
[GG1 2
	FromRouteGG2 ;
]GG; <
intGG= @
idGGA C
)GGC D
{HH 	
tryII 
{JJ 
varKK 
oCountryEntityKK "
=KK# $
awaitKK% *
_CountryServiceKK+ :
.KK: ;
GetByIdKK; B
(KKB C
idKKC E
)KKE F
;KKF G
ifLL 
(LL 
oCountryEntityLL "
!=LL# %
nullLL& *
&&LL+ -
oCountryEntityLL. <
.LL< =
IdLL= ?
>LL@ A
$numLLB C
)LLC D
returnMM 
_ObjectResponseMM *
.MM* +
CreateMM+ 1
(MM1 2
oCountryEntityMM2 @
,MM@ A
(MMB C
Int32MMC H
)MMH I
HttpStatusCodeMMI W
.MMW X
OKMMX Z
)MMZ [
;MM[ \
elseNN 
returnOO 
_ObjectResponseOO *
.OO* +
CreateOO+ 1
(OO1 2
nullOO2 6
,OO6 7
(OO8 9
Int32OO9 >
)OO> ?
HttpStatusCodeOO? M
.OOM N

BadRequestOON X
,OOX Y
AppConstantsOOZ f
.OOf g
NoRecordFoundOOg t
)OOt u
;OOu v
}PP 
catchQQ 
(QQ 
	ExceptionQQ 
exQQ 
)QQ  
{RR 
returnSS 
_ObjectResponseSS &
.SS& '
CreateSS' -
(SS- .
falseSS. 3
,SS3 4
(SS5 6
Int32SS6 ;
)SS; <
HttpStatusCodeSS< J
.SSJ K
InternalServerErrorSSK ^
,SS^ _
ConvertSS` g
.SSg h
ToStringSSh p
(SSp q
exSSq s
.SSs t

StackTraceSSt ~
)SS~ 
)	SS �
;
SS� �
}TT 
}UU 	
[XX 	
HttpPostXX	 
]XX 
[YY 	
RouteYY	 
(YY 
$strYY 
)YY 
]YY 
publicZZ 
asyncZZ 
TaskZZ 
<ZZ 
IActionResultZZ '
>ZZ' (
UpsertZZ) /
(ZZ/ 0
MasterCountryModelZZ0 B
oCountryZZC K
)ZZK L
{[[ 	
try\\ 
{]] 
DBOperation^^ 
	oResponse^^ %
=^^& '
await^^( -
_CountryService^^. =
.^^= >
Upsert^^> D
(^^D E
oCountry^^E M
)^^M N
;^^N O
if__ 
(__ 
	oResponse__ 
==__  
DBOperation__! ,
.__, -
Success__- 4
)__4 5
{`` 
returnaa 
_ObjectResponseaa *
.aa* +
Createaa+ 1
(aa1 2
trueaa2 6
,aa6 7
(aa8 9
Int32aa9 >
)aa> ?
HttpStatusCodeaa? M
.aaM N
OKaaN P
,aaP Q
(aaR S
oCountryaaS [
.aa[ \
Idaa\ ^
>aa_ `
$numaaa b
?aac d
AppConstantsaae q
.aaq r
UpdateSuccessaar 
:
aa� �
AppConstants
aa� �
.
aa� �
InsertSuccess
aa� �
)
aa� �
)
aa� �
;
aa� �
}bb 
elsecc 
returndd 
_ObjectResponsedd *
.dd* +
Createdd+ 1
(dd1 2
falsedd2 7
,dd7 8
(dd9 :
Int32dd: ?
)dd? @
HttpStatusCodedd@ N
.ddN O

BadRequestddO Y
,ddY Z
(dd[ \
	oResponsedd\ e
==ddf h
DBOperationddi t
.ddt u
NotFoundddu }
?dd~ 
AppConstants
dd� �
.
dd� �
NoRecordFound
dd� �
:
dd� �
AppConstants
dd� �
.
dd� �

BadRequest
dd� �
)
dd� �
)
dd� �
;
dd� �
}ee 
catchff 
(ff 
	Exceptionff 
exff 
)ff  
{gg 
returnhh 
_ObjectResponsehh &
.hh& '
Createhh' -
(hh- .
falsehh. 3
,hh3 4
(hh5 6
Int32hh6 ;
)hh; <
HttpStatusCodehh< J
.hhJ K
InternalServerErrorhhK ^
,hh^ _
Converthh` g
.hhg h
ToStringhhh p
(hhp q
exhhq s
.hhs t

StackTracehht ~
)hh~ 
)	hh �
;
hh� �
}ii 
}jj 	
[mm 	

HttpDeletemm	 
(mm 
$strmm !
)mm! "
]mm" #
publicnn 
asyncnn 
Tasknn 
<nn 
IActionResultnn '
>nn' (
Deletenn) /
(nn/ 0
[nn0 1
	FromRoutenn1 :
]nn: ;
intnn< ?
idnn@ B
)nnB C
{oo 	
trypp 
{qq 
DBOperationrr 
	oResponserr %
=rr& '
awaitrr( -
_CountryServicerr. =
.rr= >
Deleterr> D
(rrD E
idrrE G
)rrG H
;rrH I
ifss 
(ss 
	oResponsess 
==ss  
DBOperationss! ,
.ss, -
Successss- 4
)ss4 5
returntt 
_ObjectResponsett *
.tt* +
Creatett+ 1
(tt1 2
truett2 6
,tt6 7
(tt8 9
Int32tt9 >
)tt> ?
HttpStatusCodett? M
.ttM N
OKttN P
,ttP Q
AppConstantsttR ^
.tt^ _
DeleteSuccesstt_ l
)ttl m
;ttm n
elseuu 
returnvv 
_ObjectResponsevv *
.vv* +
Createvv+ 1
(vv1 2
nullvv2 6
,vv6 7
(vv8 9
Int32vv9 >
)vv> ?
HttpStatusCodevv? M
.vvM N

BadRequestvvN X
,vvX Y
AppConstantsvvZ f
.vvf g
NoRecordFoundvvg t
)vvt u
;vvu v
}ww 
catchxx 
(xx 
	Exceptionxx 
exxx 
)xx  
{yy 
returnzz 
_ObjectResponsezz &
.zz& '
Createzz' -
(zz- .
falsezz. 3
,zz3 4
(zz5 6
Int32zz6 ;
)zz; <
HttpStatusCodezz< J
.zzJ K
InternalServerErrorzzK ^
,zz^ _
Convertzz` g
.zzg h
ToStringzzh p
(zzp q
exzzq s
.zzs t

StackTracezzt ~
)zz~ 
)	zz �
;
zz� �
}{{ 
}|| 	
[~~ 	
HttpGet~~	 
(~~ 
$str~~ !
)~~! "
]~~" #
public 
async 
Task 
< 
IActionResult '
>' (
GetCountryList) 7
(7 8
)8 9
{
�� 	
try
�� 
{
�� 
return
�� 
_ObjectResponse
�� &
.
��& '

CreateData
��' 1
(
��1 2
await
��2 7
_CountryService
��8 G
.
��G H
GetCountryList
��H V
(
��V W
)
��W X
,
��X Y
(
��Z [
Int32
��[ `
)
��` a
HttpStatusCode
��a o
.
��o p
OK
��p r
)
��r s
;
��s t
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
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
Convert
��` g
.
��g h
ToString
��h p
(
��p q
ex
��q s
.
��s t

StackTrace
��t ~
)
��~ 
)�� �
;��� �
}
�� 
}
�� 	
}
�� 
}�� �c
OD:\EltizamLive\Eltizam.WebApi\src\API\Controllers\MasterDepartmentController.cs
	namespace 	
Eltizam
 
. 
WebApi 
. 
Controllers $
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
Route 

(
 
$str 3
)3 4
]4 5
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class &
MasterDepartmentController +
:, -
ControllerBase. <
{ 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
private 
readonly 
IResponseHandler )
<) *
dynamic* 1
>1 2
_ObjectResponse3 B
;B C
private 
	Microsoft 
. 

Extensions $
.$ %
Hosting% ,
., -
IHostingEnvironment- @
_envA E
;E F
private 
readonly 
IExceptionService *
_ExceptionService+ <
;< =
private 
readonly $
IMasterDepartmentService 1
_DepartmentService2 D
;D E
public &
MasterDepartmentController )
() *
IConfiguration* 8
configuration9 F
,F G
IResponseHandlerH X
<X Y
dynamicY `
>` a
ObjectResponseb p
,p q
IExceptionService	r �
exceptionService
� �
,
� �&
IMasterDepartmentService
� �
DepartmentService
� �
)
� �
{   	
_configuration!! 
=!! 
configuration!! *
;!!* +
_ObjectResponse"" 
="" 
ObjectResponse"" ,
;"", -
_ExceptionService## 
=## 
exceptionService##  0
;##0 1
_DepartmentService$$ 
=$$  
DepartmentService$$! 2
;$$2 3
}%% 	
[FF 	
HttpGetFF	 
,FF 
RouteFF 
(FF 
$strFF  
)FF  !
]FF! "
publicGG 
asyncGG 
TaskGG 
<GG 
IActionResultGG '
>GG' (
GetAllGG) /
(GG/ 0
)GG0 1
{HH 	
tryII 
{JJ 
varKK 
	oRoleListKK 
=KK 
awaitKK  %
_DepartmentServiceKK& 8
.KK8 9
GetAllKK9 ?
(KK? @
)KK@ A
;KKA B
ifLL 
(LL 
	oRoleListLL 
!=LL  
nullLL! %
)LL% &
returnMM 
_ObjectResponseMM *
.MM* +
CreateMM+ 1
(MM1 2
	oRoleListMM2 ;
,MM; <
(MM= >
Int32MM> C
)MMC D
HttpStatusCodeMMD R
.MMR S
OKMMS U
)MMU V
;MMV W
elseNN 
returnOO 
_ObjectResponseOO *
.OO* +
CreateOO+ 1
(OO1 2
nullOO2 6
,OO6 7
(OO8 9
Int32OO9 >
)OO> ?
HttpStatusCodeOO? M
.OOM N

BadRequestOON X
,OOX Y
AppConstantsOOZ f
.OOf g
NoRecordFoundOOg t
)OOt u
;OOu v
}PP 
catchQQ 
(QQ 
	ExceptionQQ 
exQQ 
)QQ  
{RR 
awaitSS 
_ExceptionServiceSS '
.SS' (
LogExceptionSS( 4
(SS4 5
exSS5 7
)SS7 8
;SS8 9
returnTT 
_ObjectResponseTT &
.TT& '
CreateTT' -
(TT- .
falseTT. 3
,TT3 4
(TT5 6
Int32TT6 ;
)TT; <
HttpStatusCodeTT< J
.TTJ K
InternalServerErrorTTK ^
,TT^ _
ConvertTT` g
.TTg h
ToStringTTh p
(TTp q
exTTq s
.TTs t

StackTraceTTt ~
)TT~ 
)	TT �
;
TT� �
}UU 
}VV 	
[YY 	
HttpGetYY	 
,YY 
RouteYY 
(YY 
$strYY &
)YY& '
]YY' (
publicZZ 
asyncZZ 
TaskZZ 
<ZZ 
IActionResultZZ '
>ZZ' (
GetByIdZZ) 0
(ZZ0 1
[ZZ1 2
	FromRouteZZ2 ;
]ZZ; <
intZZ= @
idZZA C
)ZZC D
{[[ 	
try\\ 
{]] 
var^^ 
oDepartmentEntity^^ %
=^^& '
await^^( -
_DepartmentService^^. @
.^^@ A
GetById^^A H
(^^H I
id^^I K
)^^K L
;^^L M
if__ 
(__ 
oDepartmentEntity__ %
!=__& (
null__) -
&&__. 0
oDepartmentEntity__1 B
.__B C
Id__C E
>__F G
$num__H I
)__I J
return`` 
_ObjectResponse`` *
.``* +
Create``+ 1
(``1 2
oDepartmentEntity``2 C
,``C D
(``E F
Int32``F K
)``K L
HttpStatusCode``L Z
.``Z [
OK``[ ]
)``] ^
;``^ _
elseaa 
returnbb 
_ObjectResponsebb *
.bb* +
Createbb+ 1
(bb1 2
nullbb2 6
,bb6 7
(bb8 9
Int32bb9 >
)bb> ?
HttpStatusCodebb? M
.bbM N

BadRequestbbN X
,bbX Y
AppConstantsbbZ f
.bbf g
NoRecordFoundbbg t
)bbt u
;bbu v
}cc 
catchdd 
(dd 
	Exceptiondd 
exdd 
)dd  
{ee 
returnff 
_ObjectResponseff &
.ff& '
Createff' -
(ff- .
falseff. 3
,ff3 4
(ff5 6
Int32ff6 ;
)ff; <
HttpStatusCodeff< J
.ffJ K
InternalServerErrorffK ^
,ff^ _
Convertff` g
.ffg h
ToStringffh p
(ffp q
exffq s
.ffs t

StackTracefft ~
)ff~ 
)	ff �
;
ff� �
}gg 
}hh 	
[kk 	
HttpPostkk	 
]kk 
[ll 	
Routell	 
(ll 
$strll 
)ll 
]ll 
publicmm 
asyncmm 
Taskmm 
<mm 
IActionResultmm '
>mm' (
Upsertmm) /
(mm/ 0"
MasterDepartmentEntitymm0 F
oDepartmentmmG R
)mmR S
{nn 	
tryoo 
{pp 
DBOperationqq 
	oResponseqq %
=qq& '
awaitqq( -
_DepartmentServiceqq. @
.qq@ A
UpsertqqA G
(qqG H
oDepartmentqqH S
)qqS T
;qqT U
ifrr 
(rr 
	oResponserr 
==rr  
DBOperationrr! ,
.rr, -
Successrr- 4
)rr4 5
{ss 
returntt 
_ObjectResponsett *
.tt* +
Creatett+ 1
(tt1 2
truett2 6
,tt6 7
(tt8 9
Int32tt9 >
)tt> ?
HttpStatusCodett? M
.ttM N
OKttN P
,ttP Q
(ttR S
oDepartmentttS ^
.tt^ _
Idtt_ a
>ttb c
$numttd e
?ttf g
AppConstantstth t
.ttt u
UpdateSuccess	ttu �
:
tt� �
AppConstants
tt� �
.
tt� �
InsertSuccess
tt� �
)
tt� �
)
tt� �
;
tt� �
}uu 
elsevv 
returnww 
_ObjectResponseww *
.ww* +
Createww+ 1
(ww1 2
falseww2 7
,ww7 8
(ww9 :
Int32ww: ?
)ww? @
HttpStatusCodeww@ N
.wwN O

BadRequestwwO Y
,wwY Z
(ww[ \
	oResponseww\ e
==wwf h
DBOperationwwi t
.wwt u
NotFoundwwu }
?ww~ 
AppConstants
ww� �
.
ww� �
NoRecordFound
ww� �
:
ww� �
AppConstants
ww� �
.
ww� �

BadRequest
ww� �
)
ww� �
)
ww� �
;
ww� �
}xx 
catchyy 
(yy 
	Exceptionyy 
exyy 
)yy  
{zz 
return{{ 
_ObjectResponse{{ &
.{{& '
Create{{' -
({{- .
false{{. 3
,{{3 4
({{5 6
Int32{{6 ;
){{; <
HttpStatusCode{{< J
.{{J K
InternalServerError{{K ^
,{{^ _
Convert{{` g
.{{g h
ToString{{h p
({{p q
ex{{q s
.{{s t

StackTrace{{t ~
){{~ 
)	{{ �
;
{{� �
}|| 
}}} 	
[
�� 	
HttpPost
��	 
(
�� 
$str
�� 
)
��  
]
��  !
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
Delete
��) /
(
��/ 0
[
��0 1
	FromRoute
��1 :
]
��: ;
int
��< ?
id
��@ B
)
��B C
{
�� 	
try
�� 
{
�� 
DBOperation
�� 
	oResponse
�� %
=
��& '
await
��( - 
_DepartmentService
��. @
.
��@ A
Delete
��A G
(
��G H
id
��H J
)
��J K
;
��K L
if
�� 
(
�� 
	oResponse
�� 
==
��  
DBOperation
��! ,
.
��, -
Success
��- 4
)
��4 5
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
true
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N
OK
��N P
,
��P Q
AppConstants
��R ^
.
��^ _
DeleteSuccess
��_ l
)
��l m
;
��m n
else
�� 
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
null
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N

BadRequest
��N X
,
��X Y
AppConstants
��Z f
.
��f g
NoRecordFound
��g t
)
��t u
;
��u v
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
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
Convert
��` g
.
��g h
ToString
��h p
(
��p q
ex
��q s
.
��s t

StackTrace
��t ~
)
��~ 
)�� �
;��� �
}
�� 
}
�� 	
[
�� 	
HttpGet
��	 
(
�� 
$str
�� $
)
��$ %
]
��% &
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
GetDepartmentList
��) :
(
��: ;
)
��; <
{
�� 	
try
�� 
{
�� 
return
�� 
_ObjectResponse
�� &
.
��& '

CreateData
��' 1
(
��1 2
await
��2 7 
_DepartmentService
��8 J
.
��J K
GetDepartmentList
��K \
(
��\ ]
)
��] ^
,
��^ _
(
��` a
Int32
��a f
)
��f g
HttpStatusCode
��g u
.
��u v
OK
��v x
)
��x y
;
��y z
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
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
Convert
��` g
.
��g h
ToString
��h p
(
��p q
ex
��q s
.
��s t

StackTrace
��t ~
)
��~ 
)�� �
;��� �
}
�� 
}
�� 	
}
�� 
}�� �d
PD:\EltizamLive\Eltizam.WebApi\src\API\Controllers\MasterDesignationController.cs
	namespace 	
Eltizam
 
. 
WebApi 
. 
Controllers $
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
Route 

(
 
$str 3
)3 4
]4 5
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class '
MasterDesignationController ,
:- .
ControllerBase/ =
{ 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
private 
readonly 
IResponseHandler )
<) *
dynamic* 1
>1 2
_ObjectResponse3 B
;B C
private 
	Microsoft 
. 

Extensions $
.$ %
Hosting% ,
., -
IHostingEnvironment- @
_envA E
;E F
private 
readonly 
IExceptionService *
_ExceptionService+ <
;< =
private 
readonly %
IMasterDesignationService 2
_DesignationService3 F
;F G
public '
MasterDesignationController *
(* +
IConfiguration+ 9
configuration: G
,G H
IResponseHandlerI Y
<Y Z
dynamicZ a
>a b
ObjectResponsec q
,q r
IExceptionService	s �
exceptionService
� �
,
� �'
IMasterDesignationService
� � 
DesignationService
� �
)
� �
{   	
_configuration!! 
=!! 
configuration!! *
;!!* +
_ObjectResponse"" 
="" 
ObjectResponse"" ,
;"", -
_ExceptionService## 
=## 
exceptionService##  0
;##0 1
_DesignationService$$ 
=$$  !
DesignationService$$" 4
;$$4 5
}%% 	
[EE 	
HttpGetEE	 
,EE 
RouteEE 
(EE 
$strEE  
)EE  !
]EE! "
publicFF 
asyncFF 
TaskFF 
<FF 
IActionResultFF '
>FF' (
GetAllFF) /
(FF/ 0
)FF0 1
{GG 	
tryHH 
{II 
varJJ 
	oRoleListJJ 
=JJ 
awaitJJ  %
_DesignationServiceJJ& 9
.JJ9 :
GetAllJJ: @
(JJ@ A
)JJA B
;JJB C
ifKK 
(KK 
	oRoleListKK 
!=KK  
nullKK! %
)KK% &
returnLL 
_ObjectResponseLL *
.LL* +
CreateLL+ 1
(LL1 2
	oRoleListLL2 ;
,LL; <
(LL= >
Int32LL> C
)LLC D
HttpStatusCodeLLD R
.LLR S
OKLLS U
)LLU V
;LLV W
elseMM 
returnNN 
_ObjectResponseNN *
.NN* +
CreateNN+ 1
(NN1 2
nullNN2 6
,NN6 7
(NN8 9
Int32NN9 >
)NN> ?
HttpStatusCodeNN? M
.NNM N

BadRequestNNN X
,NNX Y
AppConstantsNNZ f
.NNf g
NoRecordFoundNNg t
)NNt u
;NNu v
}OO 
catchPP 
(PP 
	ExceptionPP 
exPP 
)PP  
{QQ 
awaitRR 
_ExceptionServiceRR '
.RR' (
LogExceptionRR( 4
(RR4 5
exRR5 7
)RR7 8
;RR8 9
returnSS 
_ObjectResponseSS &
.SS& '
CreateSS' -
(SS- .
falseSS. 3
,SS3 4
(SS5 6
Int32SS6 ;
)SS; <
HttpStatusCodeSS< J
.SSJ K
InternalServerErrorSSK ^
,SS^ _
ConvertSS` g
.SSg h
ToStringSSh p
(SSp q
exSSq s
.SSs t

StackTraceSSt ~
)SS~ 
)	SS �
;
SS� �
}TT 
}UU 	
[YY 	
HttpGetYY	 
,YY 
RouteYY 
(YY 
$strYY &
)YY& '
]YY' (
publicZZ 
asyncZZ 
TaskZZ 
<ZZ 
IActionResultZZ '
>ZZ' (
GetByIdZZ) 0
(ZZ0 1
[ZZ1 2
	FromRouteZZ2 ;
]ZZ; <
intZZ= @
idZZA C
)ZZC D
{[[ 	
try\\ 
{]] 
var^^ 
oDesignationEntity^^ &
=^^' (
await^^) .
_DesignationService^^/ B
.^^B C
GetById^^C J
(^^J K
id^^K M
)^^M N
;^^N O
if__ 
(__ 
oDesignationEntity__ &
!=__' )
null__* .
&&__/ 1
oDesignationEntity__2 D
.__D E
Id__E G
>__H I
$num__J K
)__K L
return`` 
_ObjectResponse`` *
.``* +
Create``+ 1
(``1 2
oDesignationEntity``2 D
,``D E
(``F G
Int32``G L
)``L M
HttpStatusCode``M [
.``[ \
OK``\ ^
)``^ _
;``_ `
elseaa 
returnbb 
_ObjectResponsebb *
.bb* +
Createbb+ 1
(bb1 2
nullbb2 6
,bb6 7
(bb8 9
Int32bb9 >
)bb> ?
HttpStatusCodebb? M
.bbM N

BadRequestbbN X
,bbX Y
AppConstantsbbZ f
.bbf g
NoRecordFoundbbg t
)bbt u
;bbu v
}cc 
catchdd 
(dd 
	Exceptiondd 
exdd 
)dd  
{ee 
returnff 
_ObjectResponseff &
.ff& '
Createff' -
(ff- .
falseff. 3
,ff3 4
(ff5 6
Int32ff6 ;
)ff; <
HttpStatusCodeff< J
.ffJ K
InternalServerErrorffK ^
,ff^ _
Convertff` g
.ffg h
ToStringffh p
(ffp q
exffq s
.ffs t

StackTracefft ~
)ff~ 
)	ff �
;
ff� �
}gg 
}hh 	
[kk 	
HttpPostkk	 
]kk 
[ll 	
Routell	 
(ll 
$strll 
)ll 
]ll 
publicmm 
asyncmm 
Taskmm 
<mm 
IActionResultmm '
>mm' (
Upsertmm) /
(mm/ 0#
MasterDesignationEntitymm0 G
oDepartmentmmH S
)mmS T
{nn 	
tryoo 
{pp 
DBOperationqq 
	oResponseqq %
=qq& '
awaitqq( -
_DesignationServiceqq. A
.qqA B
UpsertqqB H
(qqH I
oDepartmentqqI T
)qqT U
;qqU V
ifrr 
(rr 
	oResponserr 
==rr  
DBOperationrr! ,
.rr, -
Successrr- 4
)rr4 5
{ss 
returntt 
_ObjectResponsett *
.tt* +
Creatett+ 1
(tt1 2
truett2 6
,tt6 7
(tt8 9
Int32tt9 >
)tt> ?
HttpStatusCodett? M
.ttM N
OKttN P
,ttP Q
(ttR S
oDepartmentttS ^
.tt^ _
Idtt_ a
>ttb c
$numttd e
?ttf g
AppConstantstth t
.ttt u
UpdateSuccess	ttu �
:
tt� �
AppConstants
tt� �
.
tt� �
InsertSuccess
tt� �
)
tt� �
)
tt� �
;
tt� �
}uu 
elsevv 
returnww 
_ObjectResponseww *
.ww* +
Createww+ 1
(ww1 2
falseww2 7
,ww7 8
(ww9 :
Int32ww: ?
)ww? @
HttpStatusCodeww@ N
.wwN O

BadRequestwwO Y
,wwY Z
(ww[ \
	oResponseww\ e
==wwf h
DBOperationwwi t
.wwt u
NotFoundwwu }
?ww~ 
AppConstants
ww� �
.
ww� �
NoRecordFound
ww� �
:
ww� �
AppConstants
ww� �
.
ww� �

BadRequest
ww� �
)
ww� �
)
ww� �
;
ww� �
}xx 
catchyy 
(yy 
	Exceptionyy 
exyy 
)yy  
{zz 
return{{ 
_ObjectResponse{{ &
.{{& '
Create{{' -
({{- .
false{{. 3
,{{3 4
({{5 6
Int32{{6 ;
){{; <
HttpStatusCode{{< J
.{{J K
InternalServerError{{K ^
,{{^ _
Convert{{` g
.{{g h
ToString{{h p
({{p q
ex{{q s
.{{s t

StackTrace{{t ~
){{~ 
)	{{ �
;
{{� �
}|| 
}}} 	
[
�� 	
HttpPost
��	 
(
�� 
$str
�� 
)
��  
]
��  !
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
Delete
��) /
(
��/ 0
[
��0 1
	FromRoute
��1 :
]
��: ;
int
��< ?
id
��@ B
)
��B C
{
�� 	
try
�� 
{
�� 
DBOperation
�� 
	oResponse
�� %
=
��& '
await
��( -!
_DesignationService
��. A
.
��A B
Delete
��B H
(
��H I
id
��I K
)
��K L
;
��L M
if
�� 
(
�� 
	oResponse
�� 
==
��  
DBOperation
��! ,
.
��, -
Success
��- 4
)
��4 5
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
true
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N
OK
��N P
,
��P Q
AppConstants
��R ^
.
��^ _
DeleteSuccess
��_ l
)
��l m
;
��m n
else
�� 
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
null
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N

BadRequest
��N X
,
��X Y
AppConstants
��Z f
.
��f g
NoRecordFound
��g t
)
��t u
;
��u v
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
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
Convert
��` g
.
��g h
ToString
��h p
(
��p q
ex
��q s
.
��s t

StackTrace
��t ~
)
��~ 
)�� �
;��� �
}
�� 
}
�� 	
[
�� 	
HttpGet
��	 
(
�� 
$str
�� %
)
��% &
]
��& '
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' ( 
GetDesignationList
��) ;
(
��; <
)
��< =
{
�� 	
try
�� 
{
�� 
return
�� 
_ObjectResponse
�� &
.
��& '

CreateData
��' 1
(
��1 2
await
��2 7!
_DesignationService
��8 K
.
��K L 
GetDesignationList
��L ^
(
��^ _
)
��_ `
,
��` a
(
��b c
Int32
��c h
)
��h i
HttpStatusCode
��i w
.
��w x
OK
��x z
)
��z {
;
��{ |
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
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
Convert
��` g
.
��g h
ToString
��h p
(
��p q
ex
��q s
.
��s t

StackTrace
��t ~
)
��~ 
)�� �
;��� �
}
�� 
}
�� 	
}
�� 
}�� ��
OD:\EltizamLive\Eltizam.WebApi\src\API\Controllers\MasterDictionaryController.cs
	namespace 	
Eltizam
 
. 
WebApi 
. 
Controllers $
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
Route 

(
 
$str 3
)3 4
]4 5
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class &
MasterDictionaryController +
:, -
ControllerBase. <
{ 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
private 
readonly 
IResponseHandler )
<) *
dynamic* 1
>1 2
_ObjectResponse3 B
;B C
private 
	Microsoft 
. 

Extensions $
.$ %
Hosting% ,
., -
IHostingEnvironment- @
_envA E
;E F
private 
readonly 
IExceptionService *
_ExceptionService+ <
;< =
private 
readonly $
IMasterDictionaryService 1
_DictionaryService2 D
;D E
public &
MasterDictionaryController )
() *
IConfiguration* 8
configuration9 F
,F G
IResponseHandlerH X
<X Y
dynamicY `
>` a
ObjectResponseb p
,p q
IExceptionService	r �
exceptionService
� �
,
� �&
IMasterDictionaryService
� �
DictionaryService
� �
)
� �
{ 	
_configuration 
= 
configuration *
;* +
_ObjectResponse   
=   
ObjectResponse   ,
;  , -
_ExceptionService!! 
=!! 
exceptionService!!  0
;!!0 1
_DictionaryService"" 
=""  
DictionaryService""! 2
;""2 3
}## 	
[)) 	
HttpPost))	 
,)) 
Route)) 
()) 
$str)) !
)))! "
]))" #
public** 
async** 
Task** 
<** 
IActionResult** '
>**' (
GetAll**) /
(**/ 0
[**0 1
FromForm**1 9
]**9 :"
DataTableAjaxPostModel**; Q
?**Q R
model**S X
)**X Y
{++ 	
try,, 
{-- 
return.. 
_ObjectResponse.. &
...& '

CreateData..' 1
(..1 2
await..2 7
_DictionaryService..8 J
...J K
GetAll..K Q
(..Q R
model..R W
)..W X
,..X Y
(..Z [
Int32..[ `
)..` a
HttpStatusCode..a o
...o p
OK..p r
)..r s
;..s t
}// 
catch00 
(00 
	Exception00 
ex00 
)00  
{11 
return22 
_ObjectResponse22 &
.22& '
Create22' -
(22- .
false22. 3
,223 4
(225 6
Int32226 ;
)22; <
HttpStatusCode22< J
.22J K
InternalServerError22K ^
,22^ _
Convert22` g
.22g h
ToString22h p
(22p q
ex22q s
.22s t

StackTrace22t ~
)22~ 
)	22 �
;
22� �
}33 
}44 	
[66 	
HttpGet66	 
]66 
[77 	
Route77	 
(77 
$str77 +
)77+ ,
]77, -
public88 
async88 
Task88 
<88 
IActionResult88 '
>88' (
GetById88) 0
(880 1
int881 4
id885 7
,887 8
string889 ?
?88? @
description88A L
)88L M
{99 	
try:: 
{;; 
var== 
masterDictionary== $
===% &
await==' ,
_DictionaryService==- ?
.==? @)
GetDictionaryDetailsByIdAsync==@ ]
(==] ^
id==^ `
,==` a
description==b m
)==m n
;==n o
if?? 
(?? 
masterDictionary?? $
!=??% '
null??( ,
)??, -
{@@ 
returnBB 
_ObjectResponseBB *
.BB* +

CreateDataBB+ 5
(BB5 6
masterDictionaryBB6 F
,BBF G
(BBH I
intBBI L
)BBL M
HttpStatusCodeBBM [
.BB[ \
OKBB\ ^
)BB^ _
;BB_ `
}CC 
elseDD 
{EE 
returnFF 
_ObjectResponseFF *
.FF* +
CreateFF+ 1
(FF1 2
nullFF2 6
,FF6 7
(FF8 9
intFF9 <
)FF< =
HttpStatusCodeFF= K
.FFK L

BadRequestFFL V
,FFV W
AppConstantsFFX d
.FFd e
NoRecordFoundFFe r
)FFr s
;FFs t
}GG 
}HH 
catchII 
(II 
	ExceptionII 
exII 
)II  
{JJ 
returnKK 
_ObjectResponseKK &
.KK& '
CreateKK' -
(KK- .
nullKK. 2
,KK2 3
(KK4 5
intKK5 8
)KK8 9
HttpStatusCodeKK9 G
.KKG H
InternalServerErrorKKH [
,KK[ \
ConvertKK] d
.KKd e
ToStringKKe m
(KKm n
exKKn p
.KKp q

StackTraceKKq {
)KK{ |
)KK| }
;KK} ~
}LL 
}MM 	
[OO 	
HttpGetOO	 
]OO 
[PP 	
RoutePP	 
(PP 
$strPP ,
)PP, -
]PP- .
publicQQ 
asyncQQ 
TaskQQ 
<QQ 
IActionResultQQ '
>QQ' ('
GetDictionaryWithSubDetailsQQ) D
(QQD E
intQQE H
?QQH I
idQQJ L
=QQM N
nullQQO S
,QQS T
stringQQU [
?QQ[ \
descriptionQQ] h
=QQi j
nullQQk o
,QQo p
stringQQq w
?QQw x
codeQQy }
=QQ~ 
null
QQ� �
)
QQ� �
{RR 	
trySS 
{TT 
varUU 
masterDictionaryUU $
=UU% &
awaitUU' ,
_DictionaryServiceUU- ?
.UU? @,
 GetDictionaryWithSubDetailsAsyncUU@ `
(UU` a
idUUa c
,UUc d
descriptionUUe p
,UUp q
codeUUr v
)UUv w
;UUw x
ifWW 
(WW 
masterDictionaryWW $
!=WW% '
nullWW( ,
)WW, -
{XX 
returnZZ 
_ObjectResponseZZ *
.ZZ* +

CreateDataZZ+ 5
(ZZ5 6
masterDictionaryZZ6 F
,ZZF G
(ZZH I
intZZI L
)ZZL M
HttpStatusCodeZZM [
.ZZ[ \
OKZZ\ ^
)ZZ^ _
;ZZ_ `
}[[ 
else\\ 
{]] 
return^^ 
_ObjectResponse^^ *
.^^* +
Create^^+ 1
(^^1 2
null^^2 6
,^^6 7
(^^8 9
int^^9 <
)^^< =
HttpStatusCode^^= K
.^^K L

BadRequest^^L V
,^^V W
AppConstants^^X d
.^^d e
NoRecordFound^^e r
)^^r s
;^^s t
}__ 
}`` 
catchaa 
(aa 
	Exceptionaa 
exaa 
)aa  
{bb 
returncc 
_ObjectResponsecc &
.cc& '
Createcc' -
(cc- .
nullcc. 2
,cc2 3
(cc4 5
intcc5 8
)cc8 9
HttpStatusCodecc9 G
.ccG H
InternalServerErrorccH [
,cc[ \
Convertcc] d
.ccd e
ToStringcce m
(ccm n
exccn p
.ccp q

StackTraceccq {
)cc{ |
)cc| }
;cc} ~
}dd 
}ee 	
[gg 	
HttpGetgg	 
]gg 
[hh 	
Routehh	 
(hh 
$strhh 
)hh 
]hh 
publicii 
asyncii 
Taskii 
<ii 
IActionResultii '
>ii' (
GetByIdii) 0
(ii0 1
intii1 4
idii5 7
)ii7 8
{jj 	
trykk 
{ll 
varnn 
masterDictionarynn $
=nn% &
awaitnn' ,
_DictionaryServicenn- ?
.nn? @)
GetDictionaryDetailsByIdAsyncnn@ ]
(nn] ^
idnn^ `
)nn` a
;nna b
ifpp 
(pp 
masterDictionarypp $
!=pp% '
nullpp( ,
)pp, -
{qq 
returnss 
_ObjectResponsess *
.ss* +

CreateDatass+ 5
(ss5 6
masterDictionaryss6 F
,ssF G
(ssH I
intssI L
)ssL M
HttpStatusCodessM [
.ss[ \
OKss\ ^
)ss^ _
;ss_ `
}tt 
elseuu 
{vv 
returnww 
_ObjectResponseww *
.ww* +
Createww+ 1
(ww1 2
nullww2 6
,ww6 7
(ww8 9
intww9 <
)ww< =
HttpStatusCodeww= K
.wwK L

BadRequestwwL V
,wwV W
AppConstantswwX d
.wwd e
NoRecordFoundwwe r
)wwr s
;wws t
}xx 
}yy 
catchzz 
(zz 
	Exceptionzz 
exzz 
)zz  
{{{ 
return|| 
_ObjectResponse|| &
.||& '
Create||' -
(||- .
null||. 2
,||2 3
(||4 5
int||5 8
)||8 9
HttpStatusCode||9 G
.||G H
InternalServerError||H [
,||[ \
Convert||] d
.||d e
ToString||e m
(||m n
ex||n p
.||p q

StackTrace||q {
)||{ |
)||| }
;||} ~
}}} 
}~~ 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	
Route
��	 
(
�� 
$str
�� 
)
�� 
]
�� 
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
Upsert
��) /
(
��/ 0(
MasterDictionaryDetailById
��0 J
dictionarydetail
��K [
)
��[ \
{
�� 	
try
�� 
{
�� 
DBOperation
�� 
	oResponse
�� %
=
��& '
await
��( - 
_DictionaryService
��. @
.
��@ A'
AddUpdateMasterDictionary
��A Z
(
��Z [
dictionarydetail
��[ k
)
��k l
;
��l m
if
�� 
(
�� 
	oResponse
�� 
==
��  
DBOperation
��! ,
.
��, -
Success
��- 4
)
��4 5
{
�� 
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
true
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N
OK
��N P
,
��P Q
(
��R S
dictionarydetail
��S c
.
��c d
Id
��d f
>
��g h
$num
��i j
?
��k l
AppConstants
��m y
.
��y z
UpdateSuccess��z �
:��� �
AppConstants��� �
.��� �
InsertSuccess��� �
)��� �
)��� �
;��� �
}
�� 
else
�� 
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
false
��2 7
,
��7 8
(
��9 :
Int32
��: ?
)
��? @
HttpStatusCode
��@ N
.
��N O

BadRequest
��O Y
,
��Y Z
(
��[ \
	oResponse
��\ e
==
��f h
DBOperation
��i t
.
��t u
NotFound
��u }
?
��~ 
AppConstants��� �
.��� �
NoRecordFound��� �
:��� �
AppConstants��� �
.��� �

BadRequest��� �
)��� �
)��� �
;��� �
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
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
Convert
��` g
.
��g h
ToString
��h p
(
��p q
ex
��q s
.
��s t

StackTrace
��t ~
)
��~ 
)�� �
;��� �
}
�� 
}
�� 	
[
�� 	
HttpPost
��	 
(
�� 
$str
�� 
)
��  
]
��  !
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
Delete
��) /
(
��/ 0
[
��0 1
	FromRoute
��1 :
]
��: ;
int
��< ?
id
��@ B
)
��B C
{
�� 	
try
�� 
{
�� 
DBOperation
�� 
	oResponse
�� %
=
��& '
await
��( - 
_DictionaryService
��. @
.
��@ A
Delete
��A G
(
��G H
id
��H J
)
��J K
;
��K L
if
�� 
(
�� 
	oResponse
�� 
==
��  
DBOperation
��! ,
.
��, -
Success
��- 4
)
��4 5
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
true
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N
OK
��N P
,
��P Q
$str
��R h
)
��h i
;
��i j
else
�� 
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
null
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N

BadRequest
��N X
,
��X Y
AppConstants
��Z f
.
��f g
NoRecordFound
��g t
)
��t u
;
��u v
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
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
Convert
��` g
.
��g h
ToString
��h p
(
��p q
ex
��q s
.
��s t

StackTrace
��t ~
)
��~ 
)�� �
;��� �
}
�� 
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	
Route
��	 
(
�� 
$str
�� '
)
��' (
]
��( )
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' ($
UpsertMasterDictionary
��) ?
(
��? @$
MasterDictionaryEntity
��@ V
oPrpoertyType
��W d
)
��d e
{
�� 	
try
�� 
{
�� 
DBOperation
�� 
	oResponse
�� %
=
��& '
await
��( - 
_DictionaryService
��. @
.
��@ A'
MasterDictionaryAddUpdate
��A Z
(
��Z [
oPrpoertyType
��[ h
)
��h i
;
��i j
if
�� 
(
�� 
	oResponse
�� 
==
��  
DBOperation
��! ,
.
��, -
Success
��- 4
)
��4 5
{
�� 
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
true
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N
OK
��N P
,
��P Q
(
��R S
oPrpoertyType
��S `
.
��` a
Id
��a c
>
��d e
$num
��f g
?
��h i
AppConstants
��j v
.
��v w
UpdateSuccess��w �
:��� �
AppConstants��� �
.��� �
InsertSuccess��� �
)��� �
)��� �
;��� �
}
�� 
else
�� 
if
�� 
(
�� 
	oResponse
�� "
==
��# %
DBOperation
��& 1
.
��1 2
AlreadyExist
��2 >
)
��> ?
{
�� 
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
true
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N
Conflict
��N V
,
��V W
(
��X Y
AppConstants
��Y e
.
��e f"
DuplicateRecordFound
��f z
)
��z {
)
��{ |
;
��| }
}
�� 
else
�� 
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
false
��2 7
,
��7 8
(
��9 :
Int32
��: ?
)
��? @
HttpStatusCode
��@ N
.
��N O

BadRequest
��O Y
,
��Y Z
(
��[ \
	oResponse
��\ e
==
��f h
DBOperation
��i t
.
��t u
NotFound
��u }
?
��~ 
AppConstants��� �
.��� �
NoRecordFound��� �
:��� �
AppConstants��� �
.��� �

BadRequest��� �
)��� �
)��� �
;��� �
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
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
Convert
��` g
.
��g h
ToString
��h p
(
��p q
ex
��q s
.
��s t

StackTrace
��t ~
)
��~ 
)�� �
;��� �
}
�� 
}
�� 	
[
�� 	
HttpGet
��	 
]
�� 
[
�� 	
Route
��	 
(
�� 
$str
�� .
)
��. /
]
��/ 0
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (&
GetDictionaryDetailsById
��) A
(
��A B
[
��B C
	FromRoute
��C L
]
��L M
int
��N Q
id
��R T
)
��T U
{
�� 	
try
�� 
{
�� 
var
�� 
MasterDictEntity
�� $
=
��% &
await
��' , 
_DictionaryService
��- ?
.
��? @0
"GetMasterDictionaryDetailByIdAsync
��@ b
(
��b c
id
��c e
)
��e f
;
��f g
if
�� 
(
�� 
MasterDictEntity
�� $
!=
��% '
null
��( ,
&&
��- /
MasterDictEntity
��0 @
.
��@ A
Id
��A C
>
��D E
$num
��F G
)
��G H
{
�� 
var
�� 
subtypes
��  
=
��! "
await
��# ( 
_DictionaryService
��) ;
.
��; <3
%GetMasterDictionaryDetailSubByIdAsync
��< a
(
��a b
MasterDictEntity
��b r
.
��r s
Id
��s u
)
��u v
;
��v w
MasterDictEntity
�� $
.
��$ %%
MasterDicitonaryDetails
��% <
=
��= >
subtypes
��? G
;
��G H
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
MasterDictEntity
��2 B
,
��B C
(
��D E
Int32
��E J
)
��J K
HttpStatusCode
��K Y
.
��Y Z
OK
��Z \
)
��\ ]
;
��] ^
}
�� 
else
�� 
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
null
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N

BadRequest
��N X
,
��X Y
AppConstants
��Z f
.
��f g
NoRecordFound
��g t
)
��t u
;
��u v
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
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
Convert
��` g
.
��g h
ToString
��h p
(
��p q
ex
��q s
.
��s t

StackTrace
��t ~
)
��~ 
)�� �
;��� �
}
�� 
}
�� 	
[
�� 	
HttpGet
��	 
]
�� 
[
�� 	
Route
��	 
(
�� 
$str
�� 2
)
��2 3
]
��3 4
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (*
GetDictionaryDescriptionById
��) E
(
��E F
[
��F G
	FromRoute
��G P
]
��P Q
int
��R U
id
��V X
)
��X Y
{
�� 	
try
�� 
{
�� 
var
�� 
subtypes
�� 
=
��  
_DictionaryService
�� 1
.
��1 23
%GetMasterDictionaryDetailSubByIdAsync
��2 W
(
��W X
id
��X Z
)
��Z [
;
��[ \
var
�� 
res
�� 
=
�� 
subtypes
�� "
.
��" #
Result
��# )
;
��) *
if
�� 
(
�� 
subtypes
�� 
!=
�� 
null
��  $
)
��$ %
{
�� 
return
�� 
_ObjectResponse
�� *
.
��* +

CreateData
��+ 5
(
��5 6
res
��6 9
,
��9 :
(
��; <
int
��< ?
)
��? @
HttpStatusCode
��@ N
.
��N O
OK
��O Q
)
��Q R
;
��R S
}
�� 
else
�� 
{
�� 
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
null
��2 6
,
��6 7
(
��8 9
int
��9 <
)
��< =
HttpStatusCode
��= K
.
��K L

BadRequest
��L V
,
��V W
AppConstants
��X d
.
��d e
NoRecordFound
��e r
)
��r s
;
��s t
}
�� 
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
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
null
��. 2
,
��2 3
(
��4 5
int
��5 8
)
��8 9
HttpStatusCode
��9 G
.
��G H!
InternalServerError
��H [
,
��[ \
Convert
��] d
.
��d e
ToString
��e m
(
��m n
ex
��n p
.
��p q

StackTrace
��q {
)
��{ |
)
��| }
;
��} ~
}
�� 
}
�� 	
}
�� 
}�� �T
MD:\EltizamLive\Eltizam.WebApi\src\API\Controllers\MasterLocationController.cs
	namespace 	
Eltizam
 
. 
WebApi 
. 
Controllers $
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
Route 

(
 
$str 3
)3 4
]4 5
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class $
MasterLocationController )
:* +
ControllerBase, :
{ 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
private 
readonly 
IResponseHandler )
<) *
dynamic* 1
>1 2
_ObjectResponse3 B
;B C
private 
	Microsoft 
. 

Extensions $
.$ %
Hosting% ,
., -
IHostingEnvironment- @
_envA E
;E F
private 
readonly 
IExceptionService *
_ExceptionService+ <
;< =
private 
readonly "
IMasterLocationService /
_LocationService0 @
;@ A
public   $
MasterLocationController   '
(  ' (
IConfiguration  ( 6
configuration  7 D
,  D E
IResponseHandler  F V
<  V W
dynamic  W ^
>  ^ _
ObjectResponse  ` n
,  n o
IExceptionService	  p �
exceptionService
  � �
,
  � �$
IMasterLocationService
  � �
LocationService
  � �
)
  � �
{!! 	
_configuration"" 
="" 
configuration"" *
;""* +
_ObjectResponse## 
=## 
ObjectResponse## ,
;##, -
_ExceptionService%% 
=%% 
exceptionService%%  0
;%%0 1
_LocationService&& 
=&& 
LocationService&& .
;&&. /
}'' 	
[<< 	
HttpPost<<	 
,<< 
Route<< 
(<< 
$str<< !
)<<! "
]<<" #
public== 
async== 
Task== 
<== 
IActionResult== '
>==' (
GetAll==) /
(==/ 0
[==0 1
FromForm==1 9
]==9 :"
DataTableAjaxPostModel==; Q
?==Q R
model==S X
)==X Y
{>> 	
try?? 
{@@ 
returnAA 
_ObjectResponseAA &
.AA& '

CreateDataAA' 1
(AA1 2
awaitAA2 7
_LocationServiceAA8 H
.AAH I
GetAllAAI O
(AAO P
modelAAP U
)AAU V
,AAV W
(AAX Y
Int32AAY ^
)AA^ _
HttpStatusCodeAA_ m
.AAm n
OKAAn p
)AAp q
;AAq r
}BB 
catchCC 
(CC 
	ExceptionCC 
exCC 
)CC  
{DD 
returnEE 
_ObjectResponseEE &
.EE& '
CreateEE' -
(EE- .
falseEE. 3
,EE3 4
(EE5 6
Int32EE6 ;
)EE; <
HttpStatusCodeEE< J
.EEJ K
InternalServerErrorEEK ^
,EE^ _
ConvertEE` g
.EEg h
ToStringEEh p
(EEp q
exEEq s
.EEs t

StackTraceEEt ~
)EE~ 
)	EE �
;
EE� �
}FF 
}GG 	
[[[ 	
HttpGet[[	 
,[[ 
Route[[ 
([[ 
$str[[ &
)[[& '
][[' (
public\\ 
async\\ 
Task\\ 
<\\ 
IActionResult\\ '
>\\' (
GetById\\) 0
(\\0 1
[\\1 2
	FromRoute\\2 ;
]\\; <
int\\= @
id\\A C
)\\C D
{]] 	
try^^ 
{__ 
var`` 
oLocationEntity`` #
=``$ %
await``& +
_LocationService``, <
.``< =
GetById``= D
(``D E
id``E G
)``G H
;``H I
ifaa 
(aa 
oLocationEntityaa #
!=aa$ &
nullaa' +
&&aa, .
oLocationEntityaa/ >
.aa> ?
Idaa? A
>aaB C
$numaaD E
)aaE F
returnbb 
_ObjectResponsebb *
.bb* +
Createbb+ 1
(bb1 2
oLocationEntitybb2 A
,bbA B
(bbC D
Int32bbD I
)bbI J
HttpStatusCodebbJ X
.bbX Y
OKbbY [
)bb[ \
;bb\ ]
elsecc 
returndd 
_ObjectResponsedd *
.dd* +
Createdd+ 1
(dd1 2
nulldd2 6
,dd6 7
(dd8 9
Int32dd9 >
)dd> ?
HttpStatusCodedd? M
.ddM N

BadRequestddN X
,ddX Y
AppConstantsddZ f
.ddf g
NoRecordFoundddg t
)ddt u
;ddu v
}ee 
catchff 
(ff 
	Exceptionff 
exff 
)ff  
{gg 
returnhh 
_ObjectResponsehh &
.hh& '
Createhh' -
(hh- .
falsehh. 3
,hh3 4
(hh5 6
Int32hh6 ;
)hh; <
HttpStatusCodehh< J
.hhJ K
InternalServerErrorhhK ^
,hh^ _
Converthh` g
.hhg h
ToStringhhh p
(hhp q
exhhq s
.hhs t

StackTracehht ~
)hh~ 
)	hh �
;
hh� �
}ii 
}jj 	
[mm 	
HttpPostmm	 
]mm 
[nn 	
Routenn	 
(nn 
$strnn 
)nn 
]nn 
publicoo 
asyncoo 
Taskoo 
<oo 
IActionResultoo '
>oo' (
Upsertoo) /
(oo/ 0 
MasterLocationEntityoo0 D
	oLocationooE N
)ooN O
{pp 	
tryqq 
{rr 
DBOperationss 
	oResponsess %
=ss& '
awaitss( -
_LocationServicess. >
.ss> ?#
AddUpdateLocationClientss? V
(ssV W
	oLocationssW `
)ss` a
;ssa b
iftt 
(tt 
	oResponsett 
==tt  
DBOperationtt! ,
.tt, -
Successtt- 4
)tt4 5
{uu 
returnvv 
_ObjectResponsevv *
.vv* +
Createvv+ 1
(vv1 2
truevv2 6
,vv6 7
(vv8 9
Int32vv9 >
)vv> ?
HttpStatusCodevv? M
.vvM N
OKvvN P
,vvP Q
(vvR S
	oLocationvvS \
.vv\ ]
Idvv] _
>vv` a
$numvvb c
?vvd e
AppConstantsvvf r
.vvr s
UpdateSuccess	vvs �
:
vv� �
AppConstants
vv� �
.
vv� �
InsertSuccess
vv� �
)
vv� �
)
vv� �
;
vv� �
}ww 
elsexx 
returnyy 
_ObjectResponseyy *
.yy* +
Createyy+ 1
(yy1 2
falseyy2 7
,yy7 8
(yy9 :
Int32yy: ?
)yy? @
HttpStatusCodeyy@ N
.yyN O

BadRequestyyO Y
,yyY Z
(yy[ \
	oResponseyy\ e
==yyf h
DBOperationyyi t
.yyt u
NotFoundyyu }
?yy~ 
AppConstants
yy� �
.
yy� �
NoRecordFound
yy� �
:
yy� �
AppConstants
yy� �
.
yy� �

BadRequest
yy� �
)
yy� �
)
yy� �
;
yy� �
}zz 
catch{{ 
({{ 
	Exception{{ 
ex{{ 
){{  
{|| 
return}} 
_ObjectResponse}} &
.}}& '
Create}}' -
(}}- .
false}}. 3
,}}3 4
(}}5 6
Int32}}6 ;
)}}; <
HttpStatusCode}}< J
.}}J K
InternalServerError}}K ^
,}}^ _
Convert}}` g
.}}g h
ToString}}h p
(}}p q
ex}}q s
.}}s t

StackTrace}}t ~
)}}~ 
)	}} �
;
}}� �
}~~ 
} 	
[
�� 	
HttpPost
��	 
(
�� 
$str
�� 
)
��  
]
��  !
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
Delete
��) /
(
��/ 0
[
��0 1
	FromRoute
��1 :
]
��: ;
int
��< ?
id
��@ B
,
��B C
int
��D G
?
��G H
by
��I K
)
��K L
{
�� 	
try
�� 
{
�� 
DBOperation
�� 
	oResponse
�� %
=
��& '
await
��( -
_LocationService
��. >
.
��> ?
Delete
��? E
(
��E F
id
��F H
,
��H I
by
��I K
)
��K L
;
��L M
if
�� 
(
�� 
	oResponse
�� 
==
��  
DBOperation
��! ,
.
��, -
Success
��- 4
)
��4 5
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
true
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N
OK
��N P
,
��P Q
AppConstants
��R ^
.
��^ _
DeleteSuccess
��_ l
)
��l m
;
��m n
else
�� 
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
null
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N

BadRequest
��N X
,
��X Y
AppConstants
��Z f
.
��f g
NoRecordFound
��g t
)
��t u
;
��u v
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
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
Convert
��` g
.
��g h
ToString
��h p
(
��p q
ex
��q s
.
��s t

StackTrace
��t ~
)
��~ 
)�� �
;��� �
}
�� 
}
�� 	
}
�� 
}�� �
KD:\EltizamLive\Eltizam.WebApi\src\API\Controllers\MasterModuleController.cs
	namespace 	
Eltizam
 
. 
WebApi 
. 
Controllers $
{		 
[

 

ApiVersion

 
(

 
$str

 
)

 
]

 
[ 
Route 

(
 
$str 3
)3 4
]4 5
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class "
MasterModuleController '
:( )
ControllerBase* 8
{ 
private 
readonly  
IMasterModuleService - 
_MasterModuleService. B
;B C
private 
readonly 
IResponseHandler )
<) *
dynamic* 1
>1 2
_ObjectResponse3 B
;B C
public "
MasterModuleController %
(% & 
IMasterModuleService& :
MasterModuleService; N
,N O
IResponseHandlerP `
<` a
dynamica h
>h i
ObjectResponsej x
)x y
{ 	 
_MasterModuleService  
=! "
MasterModuleService# 6
;6 7
_ObjectResponse 
= 
ObjectResponse ,
;, -
} 	
[++ 	
HttpGet++	 
,++ 
Route++ 
(++ 
$str++ &
)++& '
]++' (
public,, 
async,, 
Task,, 
<,, 
IActionResult,, '
>,,' (
GetAllModule,,) 5
(,,5 6
),,6 7
{-- 	
try.. 
{// 
var00 
oModuleList00 
=00  !
await00" ' 
_MasterModuleService00( <
.00< =
GetAll00= C
(00C D
)00D E
;00E F
if11 
(11 
oModuleList11 
!=11  "
null11# '
)11' (
return22 
_ObjectResponse22 *
.22* +
Create22+ 1
(221 2
oModuleList222 =
,22= >
(22? @
Int3222@ E
)22E F
HttpStatusCode22F T
.22T U
OK22U W
)22W X
;22X Y
else33 
return44 
_ObjectResponse44 *
.44* +
Create44+ 1
(441 2
null442 6
,446 7
(448 9
Int32449 >
)44> ?
HttpStatusCode44? M
.44M N

BadRequest44N X
,44X Y
AppConstants44Z f
.44f g
NoRecordFound44g t
)44t u
;44u v
}55 
catch66 
(66 
	Exception66 
ex66 
)66  
{77 
return88 
_ObjectResponse88 &
.88& '
Create88' -
(88- .
false88. 3
,883 4
(885 6
Int32886 ;
)88; <
HttpStatusCode88< J
.88J K
InternalServerError88K ^
,88^ _
Convert88` g
.88g h
ToString88h p
(88p q
ex88q s
.88s t

StackTrace88t ~
)88~ 
)	88 �
;
88� �
}99 
}:: 	
};; 
}<< �c
RD:\EltizamLive\Eltizam.WebApi\src\API\Controllers\MasterOwnershipTypeController.cs
	namespace 	
Eltizam
 
. 
WebApi 
. 
Controllers $
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
Route 

(
 
$str 3
)3 4
]4 5
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class )
MasterOwnershipTypeController .
:/ 0
ControllerBase1 ?
{ 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
private 
readonly 
IResponseHandler )
<) *
dynamic* 1
>1 2
_ObjectResponse3 B
;B C
private 
	Microsoft 
. 

Extensions $
.$ %
Hosting% ,
., -
IHostingEnvironment- @
_envA E
;E F
private 
readonly 
IExceptionService *
_ExceptionService+ <
;< =
private 
readonly '
IMasterOwnershipTypeService 4!
_OwnershipTypeService5 J
;J K
public )
MasterOwnershipTypeController ,
(, -
IConfiguration- ;
configuration< I
,I J
IResponseHandlerK [
<[ \
dynamic\ c
>c d
ObjectResponsee s
,s t
IExceptionService	u �
exceptionService
� �
,
� �)
IMasterOwnershipTypeService
� �"
OwnershipTypeService
� �
)
� �
{   	
_configuration!! 
=!! 
configuration!! *
;!!* +
_ObjectResponse"" 
="" 
ObjectResponse"" ,
;"", -
_ExceptionService## 
=## 
exceptionService##  0
;##0 1!
_OwnershipTypeService$$ !
=$$" # 
OwnershipTypeService$$$ 8
;$$8 9
}%% 	
[:: 	
HttpPost::	 
,:: 
Route:: 
(:: 
$str:: !
)::! "
]::" #
public;; 
async;; 
Task;; 
<;; 
IActionResult;; '
>;;' (
GetAll;;) /
(;;/ 0
[;;0 1
FromForm;;1 9
];;9 :"
DataTableAjaxPostModel;;; Q
model;;R W
);;W X
{<< 	
try== 
{>> 
return?? 
_ObjectResponse?? &
.??& '

CreateData??' 1
(??1 2
await??2 7!
_OwnershipTypeService??8 M
.??M N
GetAll??N T
(??T U
model??U Z
)??Z [
,??[ \
(??] ^
Int32??^ c
)??c d
HttpStatusCode??d r
.??r s
OK??s u
)??u v
;??v w
}@@ 
catchAA 
(AA 
	ExceptionAA 
exAA 
)AA  
{BB 
returnCC 
_ObjectResponseCC &
.CC& '
CreateCC' -
(CC- .
falseCC. 3
,CC3 4
(CC5 6
Int32CC6 ;
)CC; <
HttpStatusCodeCC< J
.CCJ K
InternalServerErrorCCK ^
,CC^ _
ConvertCC` g
.CCg h
ToStringCCh p
(CCp q
exCCq s
.CCs t

StackTraceCCt ~
)CC~ 
)	CC �
;
CC� �
}DD 
}EE 	
[GG 	
HttpGetGG	 
,GG 
RouteGG 
(GG 
$strGG -
)GG- .
]GG. /
publicHH 
asyncHH 
TaskHH 
<HH 
IActionResultHH '
>HH' (
GetAllOwnershipTypeHH) <
(HH< =
)HH= >
{II 	
tryJJ 
{KK 
varLL 
	oRoleListLL 
=LL 
awaitLL  %!
_OwnershipTypeServiceLL& ;
.LL; < 
GetOwnershipTypeListLL< P
(LLP Q
)LLQ R
;LLR S
ifMM 
(MM 
	oRoleListMM 
!=MM  
nullMM! %
)MM% &
returnNN 
_ObjectResponseNN *
.NN* +

CreateDataNN+ 5
(NN5 6
	oRoleListNN6 ?
,NN? @
(NNA B
Int32NNB G
)NNG H
HttpStatusCodeNNH V
.NNV W
OKNNW Y
)NNY Z
;NNZ [
elseOO 
returnPP 
_ObjectResponsePP *
.PP* +
CreatePP+ 1
(PP1 2
nullPP2 6
,PP6 7
(PP8 9
Int32PP9 >
)PP> ?
HttpStatusCodePP? M
.PPM N

BadRequestPPN X
,PPX Y
AppConstantsPPZ f
.PPf g
NoRecordFoundPPg t
)PPt u
;PPu v
}QQ 
catchRR 
(RR 
	ExceptionRR 
exRR 
)RR  
{SS 
returnTT 
_ObjectResponseTT &
.TT& '
CreateTT' -
(TT- .
falseTT. 3
,TT3 4
(TT5 6
Int32TT6 ;
)TT; <
HttpStatusCodeTT< J
.TTJ K
InternalServerErrorTTK ^
,TT^ _
ConvertTT` g
.TTg h
ToStringTTh p
(TTp q
exTTq s
.TTs t

StackTraceTTt ~
)TT~ 
)	TT �
;
TT� �
}UU 
}VV 	
[YY 	
HttpGetYY	 
,YY 
RouteYY 
(YY 
$strYY &
)YY& '
]YY' (
publicZZ 
asyncZZ 
TaskZZ 
<ZZ 
IActionResultZZ '
>ZZ' (
GetByIdZZ) 0
(ZZ0 1
[ZZ1 2
	FromRouteZZ2 ;
]ZZ; <
intZZ= @
idZZA C
)ZZC D
{[[ 	
try\\ 
{]] 
var^^  
oOwnershipTypeEntity^^ (
=^^) *
await^^+ 0!
_OwnershipTypeService^^1 F
.^^F G
GetById^^G N
(^^N O
id^^O Q
)^^Q R
;^^R S
if__ 
(__  
oOwnershipTypeEntity__ (
!=__) +
null__, 0
&&__1 3 
oOwnershipTypeEntity__4 H
.__H I
Id__I K
>__L M
$num__N O
)__O P
return`` 
_ObjectResponse`` *
.``* +
Create``+ 1
(``1 2 
oOwnershipTypeEntity``2 F
,``F G
(``H I
Int32``I N
)``N O
HttpStatusCode``O ]
.``] ^
OK``^ `
)``` a
;``a b
elseaa 
returnbb 
_ObjectResponsebb *
.bb* +
Createbb+ 1
(bb1 2
nullbb2 6
,bb6 7
(bb8 9
Int32bb9 >
)bb> ?
HttpStatusCodebb? M
.bbM N

BadRequestbbN X
,bbX Y
AppConstantsbbZ f
.bbf g
NoRecordFoundbbg t
)bbt u
;bbu v
}cc 
catchdd 
(dd 
	Exceptiondd 
exdd 
)dd  
{ee 
returnff 
_ObjectResponseff &
.ff& '
Createff' -
(ff- .
falseff. 3
,ff3 4
(ff5 6
Int32ff6 ;
)ff; <
HttpStatusCodeff< J
.ffJ K
InternalServerErrorffK ^
,ff^ _
Convertff` g
.ffg h
ToStringffh p
(ffp q
exffq s
.ffs t

StackTracefft ~
)ff~ 
)	ff �
;
ff� �
}gg 
}hh 	
[kk 	
HttpPostkk	 
]kk 
[ll 	
Routell	 
(ll 
$strll 
)ll 
]ll 
publicmm 
asyncmm 
Taskmm 
<mm 
IActionResultmm '
>mm' (
Upsertmm) /
(mm/ 0%
MasterOwnershipTypeEntitymm0 I
oOwnershipTypemmJ X
)mmX Y
{nn 	
tryoo 
{pp 
DBOperationqq 
	oResponseqq %
=qq& '
awaitqq( -!
_OwnershipTypeServiceqq. C
.qqC D
UpsertqqD J
(qqJ K
oOwnershipTypeqqK Y
)qqY Z
;qqZ [
ifrr 
(rr 
	oResponserr 
==rr  
DBOperationrr! ,
.rr, -
Successrr- 4
)rr4 5
{ss 
returntt 
_ObjectResponsett *
.tt* +
Creatett+ 1
(tt1 2
truett2 6
,tt6 7
(tt8 9
Int32tt9 >
)tt> ?
HttpStatusCodett? M
.ttM N
OKttN P
,ttP Q
(ttR S
oOwnershipTypettS a
.tta b
Idttb d
>tte f
$numttg h
?tti j
AppConstantsttk w
.ttw x
UpdateSuccess	ttx �
:
tt� �
AppConstants
tt� �
.
tt� �
InsertSuccess
tt� �
)
tt� �
)
tt� �
;
tt� �
}uu 
elsevv 
returnww 
_ObjectResponseww *
.ww* +
Createww+ 1
(ww1 2
falseww2 7
,ww7 8
(ww9 :
Int32ww: ?
)ww? @
HttpStatusCodeww@ N
.wwN O

BadRequestwwO Y
,wwY Z
(ww[ \
	oResponseww\ e
==wwf h
DBOperationwwi t
.wwt u
NotFoundwwu }
?ww~ 
AppConstants
ww� �
.
ww� �
NoRecordFound
ww� �
:
ww� �
AppConstants
ww� �
.
ww� �

BadRequest
ww� �
)
ww� �
)
ww� �
;
ww� �
}xx 
catchyy 
(yy 
	Exceptionyy 
exyy 
)yy  
{zz 
return{{ 
_ObjectResponse{{ &
.{{& '
Create{{' -
({{- .
false{{. 3
,{{3 4
({{5 6
Int32{{6 ;
){{; <
HttpStatusCode{{< J
.{{J K
InternalServerError{{K ^
,{{^ _
Convert{{` g
.{{g h
ToString{{h p
({{p q
ex{{q s
.{{s t

StackTrace{{t ~
){{~ 
)	{{ �
;
{{� �
}|| 
}}} 	
[
�� 	

HttpDelete
��	 
(
�� 
$str
�� !
)
��! "
]
��" #
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
Delete
��) /
(
��/ 0
[
��0 1
	FromRoute
��1 :
]
��: ;
int
��< ?
id
��@ B
)
��B C
{
�� 	
try
�� 
{
�� 
DBOperation
�� 
	oResponse
�� %
=
��& '
await
��( -#
_OwnershipTypeService
��. C
.
��C D
Delete
��D J
(
��J K
id
��K M
)
��M N
;
��N O
if
�� 
(
�� 
	oResponse
�� 
==
��  
DBOperation
��! ,
.
��, -
Success
��- 4
)
��4 5
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
true
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N
OK
��N P
,
��P Q
AppConstants
��R ^
.
��^ _
DeleteSuccess
��_ l
)
��l m
;
��m n
else
�� 
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
null
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N

BadRequest
��N X
,
��X Y
AppConstants
��Z f
.
��f g
NoRecordFound
��g t
)
��t u
;
��u v
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
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
Convert
��` g
.
��g h
ToString
��h p
(
��p q
ex
��q s
.
��s t

StackTrace
��t ~
)
��~ 
)�� �
;��� �
}
�� 
}
�� 	
}
�� 
}�� �q
MD:\EltizamLive\Eltizam.WebApi\src\API\Controllers\MasterPropertyController.cs
	namespace

 	
Eltizam


 
.

 
WebApi

 
.

 
Controllers

 $
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
Route 

(
 
$str 3
)3 4
]4 5
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class $
MasterPropertyController )
:* +
ControllerBase, :
{ 
private 
readonly "
IMasterPropertyService /
_propertyServices0 A
;A B
private 
readonly 
IResponseHandler )
<) *
dynamic* 1
>1 2
_ObjectResponse3 B
;B C
private 
readonly 
IExceptionService *
_ExceptionService+ <
;< =
public $
MasterPropertyController '
(' ("
IMasterPropertyService( >
propertyServices? O
,O P
IResponseHandlerQ a
<a b
dynamicb i
>i j
ObjectResponsek y
,y z
IExceptionService	{ �
exceptionService
� �
)
� �
{ 	
_propertyServices 
= 
propertyServices  0
;0 1
_ObjectResponse 
= 
ObjectResponse ,
;, -
_ExceptionService 
= 
exceptionService  0
;0 1
} 	
["" 	
HttpPost""	 
]"" 
[## 	
Route##	 
(## 
$str## 
)## 
]## 
public$$ 
async$$ 
Task$$ 
<$$ 
IActionResult$$ '
>$$' (
Upsert$$) /
($$/ 0
MasterPropertyModel$$0 C
oPrpoertyType$$D Q
)$$Q R
{%% 	
try&& 
{'' 
DBOperation(( 
	oResponse(( %
=((& '
await((( -
_propertyServices((. ?
.((? @#
AddUpdateMasterProperty((@ W
(((W X
oPrpoertyType((X e
)((e f
;((f g
if)) 
()) 
	oResponse)) 
==))  
DBOperation))! ,
.)), -
Success))- 4
)))4 5
{** 
return++ 
_ObjectResponse++ *
.++* +
Create+++ 1
(++1 2
true++2 6
,++6 7
(++8 9
Int32++9 >
)++> ?
HttpStatusCode++? M
.++M N
OK++N P
,++P Q
(++R S
oPrpoertyType++S `
.++` a
Id++a c
>++d e
$num++f g
?++h i
AppConstants++j v
.++v w
UpdateSuccess	++w �
:
++� �
AppConstants
++� �
.
++� �
InsertSuccess
++� �
)
++� �
)
++� �
;
++� �
},, 
else-- 
return.. 
_ObjectResponse.. *
...* +
Create..+ 1
(..1 2
false..2 7
,..7 8
(..9 :
Int32..: ?
)..? @
HttpStatusCode..@ N
...N O

BadRequest..O Y
,..Y Z
(..[ \
	oResponse..\ e
==..f h
DBOperation..i t
...t u
NotFound..u }
?..~ 
AppConstants
..� �
.
..� �
NoRecordFound
..� �
:
..� �
AppConstants
..� �
.
..� �

BadRequest
..� �
)
..� �
)
..� �
;
..� �
}// 
catch00 
(00 
	Exception00 
ex00 
)00  
{11 
return33 
_ObjectResponse33 &
.33& '
Create33' -
(33- .
false33. 3
,333 4
(335 6
Int32336 ;
)33; <
HttpStatusCode33< J
.33J K
InternalServerError33K ^
,33^ _
Convert33` g
.33g h
ToString33h p
(33p q
ex33q s
.33s t

StackTrace33t ~
)33~ 
)	33 �
;
33� �
}44 
}55 	
[77 	
HttpGet77	 
]77 
[88 	
Route88	 
(88 
$str88 
)88 
]88 
public99 
async99 
Task99 
<99 
IActionResult99 '
>99' (!
GetMasterPropertyById99) >
(99> ?
[99? @
	FromRoute99@ I
]99I J
int99K N
id99O Q
)99Q R
{:: 	
try;; 
{<< 
var== 
oPrpoertyTypeEntity== '
===( )
await==* /
_propertyServices==0 A
.==A B&
GetMasterPropertyByIdAsync==B \
(==\ ]
id==] _
)==_ `
;==` a
if>> 
(>> 
oPrpoertyTypeEntity>> '
!=>>( *
null>>+ /
&&>>0 2
oPrpoertyTypeEntity>>3 F
.>>F G
Id>>G I
>>>J K
$num>>L M
)>>M N
return?? 
_ObjectResponse?? *
.??* +
Create??+ 1
(??1 2
oPrpoertyTypeEntity??2 E
,??E F
(??G H
Int32??H M
)??M N
HttpStatusCode??N \
.??\ ]
OK??] _
)??_ `
;??` a
else@@ 
returnAA 
_ObjectResponseAA *
.AA* +
CreateAA+ 1
(AA1 2
nullAA2 6
,AA6 7
(AA8 9
Int32AA9 >
)AA> ?
HttpStatusCodeAA? M
.AAM N

BadRequestAAN X
,AAX Y
AppConstantsAAZ f
.AAf g
NoRecordFoundAAg t
)AAt u
;AAu v
}BB 
catchCC 
(CC 
	ExceptionCC 
exCC 
)CC  
{DD 
returnEE 
_ObjectResponseEE &
.EE& '
CreateEE' -
(EE- .
falseEE. 3
,EE3 4
(EE5 6
Int32EE6 ;
)EE; <
HttpStatusCodeEE< J
.EEJ K
InternalServerErrorEEK ^
,EE^ _
ConvertEE` g
.EEg h
ToStringEEh p
(EEp q
exEEq s
.EEs t

StackTraceEEt ~
)EE~ 
)	EE �
;
EE� �
}FF 
}GG 	
[II 	
HttpPostII	 
,II 
RouteII 
(II 
$strII !
)II! "
]II" #
publicJJ 
asyncJJ 
TaskJJ 
<JJ 
IActionResultJJ '
>JJ' (
GetAllPropertyJJ) 7
(JJ7 8
[JJ8 9
FromFormJJ9 A
]JJA B"
DataTableAjaxPostModelJJC Y
modelJJZ _
)JJ_ `
{KK 	
tryLL 
{MM 
returnNN 
_ObjectResponseNN &
.NN& '

CreateDataNN' 1
(NN1 2
awaitNN2 7
_propertyServicesNN8 I
.NNI J
GetAllNNJ P
(NNP Q
modelNNQ V
)NNV W
,NNW X
(NNY Z
Int32NNZ _
)NN_ `
HttpStatusCodeNN` n
.NNn o
OKNNo q
)NNq r
;NNr s
}OO 
catchPP 
(PP 
	ExceptionPP 
exPP 
)PP  
{QQ 
returnRR 
_ObjectResponseRR &
.RR& '
CreateRR' -
(RR- .
falseRR. 3
,RR3 4
(RR5 6
Int32RR6 ;
)RR; <
HttpStatusCodeRR< J
.RRJ K
InternalServerErrorRRK ^
,RR^ _
ConvertRR` g
.RRg h
ToStringRRh p
(RRp q
exRRq s
.RRs t

StackTraceRRt ~
)RR~ 
)	RR �
;
RR� �
}SS 
}TT 	
[WW 	
HttpGetWW	 
,WW 
RouteWW 
(WW 
$strWW 0
)WW0 1
]WW1 2
publicXX 
asyncXX 
TaskXX 
<XX 
IActionResultXX '
>XX' ("
GetPropertyAmenityListXX) ?
(XX? @
)XX@ A
{YY 	
tryZZ 
{[[ 
return\\ 
_ObjectResponse\\ &
.\\& '

CreateData\\' 1
(\\1 2
await\\2 7
_propertyServices\\8 I
.\\I J"
GetPropertyAmenityList\\J `
(\\` a
)\\a b
,\\b c
(\\d e
Int32\\e j
)\\j k
HttpStatusCode\\k y
.\\y z
OK\\z |
)\\| }
;\\} ~
}]] 
catch^^ 
(^^ 
	Exception^^ 
ex^^ 
)^^  
{__ 
return`` 
_ObjectResponse`` &
.``& '
Create``' -
(``- .
false``. 3
,``3 4
(``5 6
Int32``6 ;
)``; <
HttpStatusCode``< J
.``J K
InternalServerError``K ^
,``^ _
Convert``` g
.``g h
ToString``h p
(``p q
ex``q s
.``s t

StackTrace``t ~
)``~ 
)	`` �
;
``� �
}aa 
}bb 	
[dd 	

HttpDeletedd	 
(dd 
$strdd !
)dd! "
]dd" #
publicee 
asyncee 
Taskee 
<ee 
IActionResultee '
>ee' (
DeletePropertyee) 7
(ee7 8
[ee8 9
	FromRouteee9 B
]eeB C
inteeD G
ideeH J
,eeJ K
inteeL O
?eeO P
byeeQ S
)eeS T
{ff 	
trygg 
{hh 
DBOperationii 
	oResponseii %
=ii& '
awaitii( -
_propertyServicesii. ?
.ii? @
DeletePropertyii@ N
(iiN O
idiiO Q
,iiQ R
byiiR T
)iiT U
;iiU V
ifjj 
(jj 
	oResponsejj 
==jj  
DBOperationjj! ,
.jj, -
Successjj- 4
)jj4 5
returnkk 
_ObjectResponsekk *
.kk* +
Createkk+ 1
(kk1 2
truekk2 6
,kk6 7
(kk8 9
Int32kk9 >
)kk> ?
HttpStatusCodekk? M
.kkM N
OKkkN P
,kkP Q
AppConstantskkR ^
.kk^ _
DeleteSuccesskk_ l
)kkl m
;kkm n
elsell 
ifll 
(ll 
	oResponsell "
==ll# %
DBOperationll& 1
.ll1 2
AlreadyExistll2 >
)ll> ?
returnmm 
_ObjectResponsemm *
.mm* +
Createmm+ 1
(mm1 2
nullmm2 6
,mm6 7
(mm8 9
Int32mm9 >
)mm> ?
HttpStatusCodemm? M
.mmM N
OKmmN P
,mmP Q
$str	mmR �
)
mm� �
;
mm� �
elsenn 
returnoo 
_ObjectResponseoo *
.oo* +
Createoo+ 1
(oo1 2
nulloo2 6
,oo6 7
(oo8 9
Int32oo9 >
)oo> ?
HttpStatusCodeoo? M
.ooM N

BadRequestooN X
,ooX Y
AppConstantsooZ f
.oof g
NoRecordFoundoog t
)oot u
;oou v
}pp 
catchqq 
(qq 
	Exceptionqq 
exqq 
)qq  
{rr 
awaitss 
_ExceptionServicess '
.ss' (
LogExceptionss( 4
(ss4 5
exss5 7
)ss7 8
;ss8 9
returntt 
_ObjectResponsett &
.tt& '
Creatett' -
(tt- .
falsett. 3
,tt3 4
(tt5 6
Int32tt6 ;
)tt; <
HttpStatusCodett< J
.ttJ K
InternalServerErrorttK ^
,tt^ _
extt` b
.ttb c
Messagettc j
)ttj k
;ttk l
}uu 
}vv 	
[yy 	
HttpGetyy	 
]yy 
[zz 	
Routezz	 
(zz 
$strzz \
)zz\ ]
]zz] ^
public{{ 
async{{ 
Task{{ 
<{{ 
IActionResult{{ '
>{{' (&
GetMasterPropertyByFilters{{) C
({{C D
[{{D E
	FromRoute{{E N
]{{N O
int{{P S
propertyTypeId{{T b
,{{b c
int{{d g
subPropertyTypeId{{h y
,{{y z
int{{{ ~
ownershipTypeId	{{ �
)
{{� �
{|| 	
try}} 
{~~ 
var 
oPrpoertyTypeEntity '
=( )
await* /
_propertyServices0 A
.A B+
GetMasterPropertyByFiltersAsyncB a
(a b
propertyTypeIdb p
,p q
subPropertyTypeId	q �
,
� �
ownershipTypeId
� �
)
� �
;
� �
if
�� 
(
�� !
oPrpoertyTypeEntity
�� '
!=
��( *
null
��+ /
)
��/ 0
return
�� 
_ObjectResponse
�� *
.
��* +

CreateData
��+ 5
(
��5 6!
oPrpoertyTypeEntity
��6 I
,
��I J
(
��K L
Int32
��L Q
)
��Q R
HttpStatusCode
��R `
.
��` a
OK
��a c
)
��c d
;
��d e
else
�� 
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
null
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N

BadRequest
��N X
,
��X Y
AppConstants
��Z f
.
��f g
NoRecordFound
��g t
)
��t u
;
��u v
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
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
Convert
��` g
.
��g h
ToString
��h p
(
��p q
ex
��q s
.
��s t

StackTrace
��t ~
)
��~ 
)�� �
;��� �
}
�� 
}
�� 	
}
�� 
}�� �X
TD:\EltizamLive\Eltizam.WebApi\src\API\Controllers\MasterPropertySubTypeController.cs
	namespace

 	
Eltizam


 
.

 
WebApi

 
.

 
Controllers

 $
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
Route 

(
 
$str 3
)3 4
]4 5
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class +
MasterPropertySubTypeController 0
:1 2
ControllerBase3 A
{ 
private 
readonly )
IMasterPropertySubTypeService 6 
_subpropertyServices7 K
;K L
private 
readonly 
IResponseHandler )
<) *
dynamic* 1
>1 2
_ObjectResponse3 B
;B C
private 
readonly 
IExceptionService *
_ExceptionService+ <
;< =
IExceptionService 
exceptionService *
;* +
public +
MasterPropertySubTypeController .
(. /)
IMasterPropertySubTypeService/ L
subpropertyServicesM `
,` a
IResponseHandlerb r
<r s
dynamics z
>z {
ObjectResponse	| �
)
� �
{ 	 
_subpropertyServices  
=! "
subpropertyServices# 6
;6 7
_ObjectResponse 
= 
ObjectResponse ,
;, -
_ExceptionService 
= 
exceptionService  0
;0 1
} 	
["" 	
HttpPost""	 
]"" 
[## 	
Route##	 
(## 
$str## 
)## 
]## 
public$$ 
async$$ 
Task$$ 
<$$ 
IActionResult$$ '
>$$' (
Upsert$$) /
($$/ 0'
Master_PropertySubTypeModel$$0 K
oPrpoertyType$$L Y
)$$Y Z
{%% 	
try&& 
{'' 
DBOperation(( 
	oResponse(( %
=((& '
await((( - 
_subpropertyServices((. B
.((B C&
AddUpdateMasterSubProperty((C ]
(((] ^
oPrpoertyType((^ k
)((k l
;((l m
if)) 
()) 
	oResponse)) 
==))  
DBOperation))! ,
.)), -
Success))- 4
)))4 5
{** 
return++ 
_ObjectResponse++ *
.++* +
Create+++ 1
(++1 2
true++2 6
,++6 7
(++8 9
Int32++9 >
)++> ?
HttpStatusCode++? M
.++M N
OK++N P
,++P Q
(++R S
oPrpoertyType++S `
.++` a
Id++a c
>++d e
$num++f g
?++h i
AppConstants++j v
.++v w
UpdateSuccess	++w �
:
++� �
AppConstants
++� �
.
++� �
InsertSuccess
++� �
)
++� �
)
++� �
;
++� �
},, 
else-- 
return.. 
_ObjectResponse.. *
...* +
Create..+ 1
(..1 2
false..2 7
,..7 8
(..9 :
Int32..: ?
)..? @
HttpStatusCode..@ N
...N O

BadRequest..O Y
,..Y Z
(..[ \
	oResponse..\ e
==..f h
DBOperation..i t
...t u
NotFound..u }
?..~ 
AppConstants
..� �
.
..� �
NoRecordFound
..� �
:
..� �
AppConstants
..� �
.
..� �

BadRequest
..� �
)
..� �
)
..� �
;
..� �
}// 
catch00 
(00 
	Exception00 
ex00 
)00  
{11 
return33 
_ObjectResponse33 &
.33& '
Create33' -
(33- .
false33. 3
,333 4
(335 6
Int32336 ;
)33; <
HttpStatusCode33< J
.33J K
InternalServerError33K ^
,33^ _
Convert33` g
.33g h
ToString33h p
(33p q
ex33q s
.33s t

StackTrace33t ~
)33~ 
)	33 �
;
33� �
}44 
}55 	
[77 	
HttpGet77	 
]77 
[88 	
Route88	 
(88 
$str88 
)88 
]88 
public99 
async99 
Task99 
<99 
IActionResult99 '
>99' ($
GetMasterSubPropertyById99) A
(99A B
[99B C
	FromRoute99C L
]99L M
int99N Q
id99R T
)99T U
{:: 	
try;; 
{<< 
var== 
oPrpoertyTypeEntity== '
===( )
await==* / 
_subpropertyServices==0 D
.==D E)
GetMasterSubPropertyByIdAsync==E b
(==b c
id==c e
)==e f
;==f g
if>> 
(>> 
oPrpoertyTypeEntity>> '
!=>>( *
null>>+ /
&&>>0 2
oPrpoertyTypeEntity>>3 F
.>>F G
Id>>G I
>>>J K
$num>>L M
)>>M N
return?? 
_ObjectResponse?? *
.??* +
Create??+ 1
(??1 2
oPrpoertyTypeEntity??2 E
,??E F
(??G H
Int32??H M
)??M N
HttpStatusCode??N \
.??\ ]
OK??] _
)??_ `
;??` a
else@@ 
returnAA 
_ObjectResponseAA *
.AA* +
CreateAA+ 1
(AA1 2
nullAA2 6
,AA6 7
(AA8 9
Int32AA9 >
)AA> ?
HttpStatusCodeAA? M
.AAM N

BadRequestAAN X
,AAX Y
AppConstantsAAZ f
.AAf g
NoRecordFoundAAg t
)AAt u
;AAu v
}BB 
catchCC 
(CC 
	ExceptionCC 
exCC 
)CC  
{DD 
returnEE 
_ObjectResponseEE &
.EE& '
CreateEE' -
(EE- .
falseEE. 3
,EE3 4
(EE5 6
Int32EE6 ;
)EE; <
HttpStatusCodeEE< J
.EEJ K
InternalServerErrorEEK ^
,EE^ _
ConvertEE` g
.EEg h
ToStringEEh p
(EEp q
exEEq s
.EEs t

StackTraceEEt ~
)EE~ 
)	EE �
;
EE� �
}FF 
}GG 	
[II 	
HttpGetII	 
]II 
[JJ 	
RouteJJ	 
(JJ 
$strJJ )
)JJ) *
]JJ* +
publicKK 
asyncKK 
TaskKK 
<KK 
IActionResultKK '
>KK' (0
$GetMasterSubPropertyByPropertyTypeIdKK) M
(KKM N
[KKN O
	FromRouteKKO X
]KKX Y
intKKZ ]
idKK^ `
)KK` a
{LL 	
tryMM 
{NN 
varOO 
oPrpoertyTypeEntityOO '
=OO( )
awaitOO* / 
_subpropertyServicesOO0 D
.OOD E5
)GetMasterSubPropertyByPropertyTypeIdAsyncOOE n
(OOn o
idOOo q
)OOq r
;OOr s
ifPP 
(PP 
oPrpoertyTypeEntityPP '
!=PP( *
nullPP+ /
)PP/ 0
returnQQ 
_ObjectResponseQQ *
.QQ* +

CreateDataQQ+ 5
(QQ5 6
oPrpoertyTypeEntityQQ6 I
,QQI J
(QQK L
Int32QQL Q
)QQQ R
HttpStatusCodeQQR `
.QQ` a
OKQQa c
)QQc d
;QQd e
elseRR 
returnSS 
_ObjectResponseSS *
.SS* +
CreateSS+ 1
(SS1 2
nullSS2 6
,SS6 7
(SS8 9
Int32SS9 >
)SS> ?
HttpStatusCodeSS? M
.SSM N

BadRequestSSN X
,SSX Y
AppConstantsSSZ f
.SSf g
NoRecordFoundSSg t
)SSt u
;SSu v
}TT 
catchUU 
(UU 
	ExceptionUU 
exUU 
)UU  
{VV 
returnWW 
_ObjectResponseWW &
.WW& '
CreateWW' -
(WW- .
falseWW. 3
,WW3 4
(WW5 6
Int32WW6 ;
)WW; <
HttpStatusCodeWW< J
.WWJ K
InternalServerErrorWWK ^
,WW^ _
ConvertWW` g
.WWg h
ToStringWWh p
(WWp q
exWWq s
.WWs t

StackTraceWWt ~
)WW~ 
)	WW �
;
WW� �
}XX 
}YY 	
[yy 	

HttpDeleteyy	 
(yy 
$stryy )
)yy) *
]yy* +
publiczz 
asynczz 
Taskzz 
<zz 
IActionResultzz '
>zz' (
DeleteSubPropertyzz) :
(zz: ;
[zz; <
	FromRoutezz< E
]zzE F
intzzG J
idzzK M
,zzM N
intzzO R
?zzR S
byzzT V
)zzV W
{{{ 	
try|| 
{}} 
DBOperation~~ 
	oResponse~~ %
=~~& '
await~~( - 
_subpropertyServices~~. B
.~~B C
DeleteSubProperty~~C T
(~~T U
id~~U W
,~~W X
by~~X Z
)~~Z [
;~~[ \
if 
( 
	oResponse 
==  
DBOperation! ,
., -
Success- 4
)4 5
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
true
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N
OK
��N P
,
��P Q
AppConstants
��R ^
.
��^ _
DeleteSuccess
��_ l
)
��l m
;
��m n
else
�� 
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
null
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N

BadRequest
��N X
,
��X Y
AppConstants
��Z f
.
��f g
NoRecordFound
��g t
)
��t u
;
��u v
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
await
�� 
_ExceptionService
�� '
.
��' (
LogException
��( 4
(
��4 5
ex
��5 7
)
��7 8
;
��8 9
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
Convert
��` g
.
��g h
ToString
��h p
(
��p q
ex
��q s
.
��s t

StackTrace
��t ~
)
��~ 
)�� �
;��� �
}
�� 
}
�� 	
}
�� 
}�� �v
QD:\EltizamLive\Eltizam.WebApi\src\API\Controllers\MasterPropertyTypeController.cs
	namespace 	
Eltizam
 
. 
WebApi 
. 
Controllers $
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
Route 

(
 
$str 3
)3 4
]4 5
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class (
MasterPropertyTypeController -
:. /
ControllerBase0 >
{ 
private 
readonly &
IMasterPropertyTypeService 3!
_propertyTypeServices4 I
;I J
private 
readonly )
IMasterPropertySubTypeService 6$
_propertySubTypeServices7 O
;O P
private 
readonly 
IResponseHandler )
<) *
dynamic* 1
>1 2
_ObjectResponse3 B
;B C
private 
readonly 
IExceptionService *
_ExceptionService+ <
;< =
public (
MasterPropertyTypeController +
(+ ,&
IMasterPropertyTypeService, F 
propertyTypeServicesG [
,[ \)
IMasterPropertySubTypeService] z$
propertySubTypeServices	{ �
,
� �
IExceptionService  
exceptionService! 1
,1 2
IResponseHandler3 C
<C D
dynamicD K
>K L
ObjectResponseM [
)[ \
{ 	!
_propertyTypeServices !
=" # 
propertyTypeServices$ 8
;8 9
_ObjectResponse 
= 
ObjectResponse ,
;, -
_ExceptionService   
=   
exceptionService    0
;  0 1$
_propertySubTypeServices!! $
=!!% &#
propertySubTypeServices!!' >
;!!> ?
}"" 	
[&& 	
HttpPost&&	 
]&& 
['' 	
Route''	 
('' 
$str'' 
)'' 
]'' 
public(( 
async(( 
Task(( 
<(( 
IActionResult(( '
>((' (
Upsert(() /
(((/ 0$
Master_PropertyTypeModel((0 H
oPrpoertyType((I V
)((V W
{)) 	
try** 
{++ 
DBOperation,, 
	oResponse,, %
=,,& '
await,,( -!
_propertyTypeServices,,. C
.,,C D'
AddUpdateMasterPropertyType,,D _
(,,_ `
oPrpoertyType,,` m
),,m n
;,,n o
if-- 
(-- 
	oResponse-- 
==--  
DBOperation--! ,
.--, -
Success--- 4
)--4 5
{.. 
return// 
_ObjectResponse// *
.//* +
Create//+ 1
(//1 2
true//2 6
,//6 7
(//8 9
Int32//9 >
)//> ?
HttpStatusCode//? M
.//M N
OK//N P
,//P Q
(//R S
oPrpoertyType//S `
.//` a
Id//a c
>//d e
$num//f g
?//h i
AppConstants//j v
.//v w
UpdateSuccess	//w �
:
//� �
AppConstants
//� �
.
//� �
InsertSuccess
//� �
)
//� �
)
//� �
;
//� �
}00 
else11 
if11 
(11 
	oResponse11 "
==11# %
DBOperation11& 1
.111 2
AlreadyExist112 >
)11> ?
{22 
return33 
_ObjectResponse33 *
.33* +
Create33+ 1
(331 2
true332 6
,336 7
(338 9
Int32339 >
)33> ?
HttpStatusCode33? M
.33M N
Conflict33N V
,33V W
(33X Y
AppConstants33Y e
.33e f 
DuplicateRecordFound33f z
)33z {
)33{ |
;33| }
}44 
else55 
return66 
_ObjectResponse66 *
.66* +
Create66+ 1
(661 2
false662 7
,667 8
(669 :
Int3266: ?
)66? @
HttpStatusCode66@ N
.66N O

BadRequest66O Y
,66Y Z
(66[ \
	oResponse66\ e
==66f h
DBOperation66i t
.66t u
NotFound66u }
?66~ 
AppConstants
66� �
.
66� �
NoRecordFound
66� �
:
66� �
AppConstants
66� �
.
66� �

BadRequest
66� �
)
66� �
)
66� �
;
66� �
}77 
catch88 
(88 
	Exception88 
ex88 
)88  
{99 
return;; 
_ObjectResponse;; &
.;;& '
Create;;' -
(;;- .
false;;. 3
,;;3 4
(;;5 6
Int32;;6 ;
);;; <
HttpStatusCode;;< J
.;;J K
InternalServerError;;K ^
,;;^ _
Convert;;` g
.;;g h
ToString;;h p
(;;p q
ex;;q s
.;;s t

StackTrace;;t ~
);;~ 
)	;; �
;
;;� �
}<< 
}== 	
[?? 	
HttpGet??	 
]?? 
[@@ 	
Route@@	 
(@@ 
$str@@ 
)@@ 
]@@ 
publicAA 
asyncAA 
TaskAA 
<AA 
IActionResultAA '
>AA' (!
GetMasterPropertyByIdAA) >
(AA> ?
[AA? @
	FromRouteAA@ I
]AAI J
intAAK N
idAAO Q
)AAQ R
{BB 	
tryCC 
{DD 
varEE 
oPrpoertyTypeEntityEE '
=EE( )
awaitEE* /!
_propertyTypeServicesEE0 E
.EEE F*
GetMasterPropertyTypeByIdAsyncEEF d
(EEd e
idEEe g
)EEg h
;EEh i
ifGG 
(GG 
oPrpoertyTypeEntityGG '
!=GG( *
nullGG+ /
&&GG0 2
oPrpoertyTypeEntityGG3 F
.GGF G
IdGGG I
>GGJ K
$numGGL M
)GGM N
{HH 
varII 
subtypesII  
=II! "
awaitII# ($
_propertySubTypeServicesII) A
.IIA B5
)GetMasterSubPropertyByPropertyTypeIdAsyncIIB k
(IIk l
oPrpoertyTypeEntityIIl 
.	II �
Id
II� �
)
II� �
;
II� �
oPrpoertyTypeEntityJJ '
.JJ' ("
MasterPropertySubTypesJJ( >
=JJ? @
subtypesJJA I
;JJI J
returnLL 
_ObjectResponseLL *
.LL* +
CreateLL+ 1
(LL1 2
oPrpoertyTypeEntityLL2 E
,LLE F
(LLG H
Int32LLH M
)LLM N
HttpStatusCodeLLN \
.LL\ ]
OKLL] _
)LL_ `
;LL` a
}MM 
elseNN 
returnOO 
_ObjectResponseOO *
.OO* +
CreateOO+ 1
(OO1 2
nullOO2 6
,OO6 7
(OO8 9
Int32OO9 >
)OO> ?
HttpStatusCodeOO? M
.OOM N

BadRequestOON X
,OOX Y
AppConstantsOOZ f
.OOf g
NoRecordFoundOOg t
)OOt u
;OOu v
}PP 
catchQQ 
(QQ 
	ExceptionQQ 
exQQ 
)QQ  
{RR 
returnSS 
_ObjectResponseSS &
.SS& '
CreateSS' -
(SS- .
falseSS. 3
,SS3 4
(SS5 6
Int32SS6 ;
)SS; <
HttpStatusCodeSS< J
.SSJ K
InternalServerErrorSSK ^
,SS^ _
ConvertSS` g
.SSg h
ToStringSSh p
(SSp q
exSSq s
.SSs t

StackTraceSSt ~
)SS~ 
)	SS �
;
SS� �
}TT 
}UU 	
[WW 	
HttpPostWW	 
,WW 
RouteWW 
(WW 
$strWW !
)WW! "
]WW" #
publicXX 
asyncXX 
TaskXX 
<XX 
IActionResultXX '
>XX' (
GetAllPropertyXX) 7
(XX7 8
[XX8 9
FromFormXX9 A
]XXA B"
DataTableAjaxPostModelXXC Y
modelXXZ _
)XX_ `
{YY 	
tryZZ 
{[[ 
return\\ 
_ObjectResponse\\ &
.\\& '

CreateData\\' 1
(\\1 2
await\\2 7!
_propertyTypeServices\\8 M
.\\M N
GetAll\\N T
(\\T U
model\\U Z
)\\Z [
,\\[ \
(\\] ^
Int32\\^ c
)\\c d
HttpStatusCode\\d r
.\\r s
OK\\s u
)\\u v
;\\v w
}]] 
catch^^ 
(^^ 
	Exception^^ 
ex^^ 
)^^  
{__ 
return`` 
_ObjectResponse`` &
.``& '
Create``' -
(``- .
false``. 3
,``3 4
(``5 6
Int32``6 ;
)``; <
HttpStatusCode``< J
.``J K
InternalServerError``K ^
,``^ _
Convert``` g
.``g h
ToString``h p
(``p q
ex``q s
.``s t

StackTrace``t ~
)``~ 
)	`` �
;
``� �
}aa 
}bb 	
[ee 	
HttpGetee	 
,ee 
Routeee 
(ee 
$stree $
)ee$ %
]ee% &
publicff 
asyncff 
Taskff 
<ff 
IActionResultff '
>ff' (

GetAllListff) 3
(ff3 4
)ff4 5
{gg 	
tryhh 
{ii 
returnjj 
_ObjectResponsejj &
.jj& '

CreateDatajj' 1
(jj1 2
awaitjj2 7!
_propertyTypeServicesjj8 M
.jjM N

GetAllListjjN X
(jjX Y
)jjY Z
,jjZ [
(jj\ ]
Int32jj] b
)jjb c
HttpStatusCodejjc q
.jjq r
OKjjr t
)jjt u
;jju v
}kk 
catchll 
(ll 
	Exceptionll 
exll 
)ll  
{mm 
returnnn 
_ObjectResponsenn &
.nn& '
Createnn' -
(nn- .
falsenn. 3
,nn3 4
(nn5 6
Int32nn6 ;
)nn; <
HttpStatusCodenn< J
.nnJ K
InternalServerErrornnK ^
,nn^ _
Convertnn` g
.nng h
ToStringnnh p
(nnp q
exnnq s
.nns t

StackTracennt ~
)nn~ 
)	nn �
;
nn� �
}oo 
}pp 	
[rr 	

HttpDeleterr	 
(rr 
$strrr !
)rr! "
]rr" #
publicss 
asyncss 
Taskss 
<ss 
IActionResultss '
>ss' (
DeletePropertyss) 7
(ss7 8
[ss8 9
	FromRoutess9 B
]ssB C
intssD G
idssH J
,ssJ K
intssK N
?ssN O
byssP R
)ssR S
{tt 	
tryuu 
{vv 
DBOperationww 
	oResponseww %
=ww& '
awaitww( -!
_propertyTypeServicesww. C
.wwC D
DeletePropertyTypewwD V
(wwV W
idwwW Y
,wwY Z
bywwZ \
)ww\ ]
;ww] ^
ifxx 
(xx 
	oResponsexx 
==xx  
DBOperationxx! ,
.xx, -
Successxx- 4
)xx4 5
returnyy 
_ObjectResponseyy *
.yy* +
Createyy+ 1
(yy1 2
trueyy2 6
,yy6 7
(yy8 9
Int32yy9 >
)yy> ?
HttpStatusCodeyy? M
.yyM N
OKyyN P
,yyP Q
AppConstantsyyR ^
.yy^ _
DeleteSuccessyy_ l
)yyl m
;yym n
elsezz 
return{{ 
_ObjectResponse{{ *
.{{* +
Create{{+ 1
({{1 2
null{{2 6
,{{6 7
({{8 9
Int32{{9 >
){{> ?
HttpStatusCode{{? M
.{{M N

BadRequest{{N X
,{{X Y
AppConstants{{Z f
.{{f g
NoRecordFound{{g t
){{t u
;{{u v
}|| 
catch}} 
(}} 
	Exception}} 
ex}} 
)}}  
{~~ 
await 
_ExceptionService '
.' (
LogException( 4
(4 5
ex5 7
)7 8
;8 9
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
Convert
��` g
.
��g h
ToString
��h p
(
��p q
ex
��q s
.
��s t

StackTrace
��t ~
)
��~ 
)�� �
;��� �
}
�� 
}
�� 	
[
�� 	
HttpGet
��	 
(
�� 
$str
�� )
)
��) *
]
��* +
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' ($
CheckPropertTypeExists
��) ?
(
��? @
string
��@ F
PropertyType
��G S
)
��S T
{
�� 	
try
�� 
{
�� 
int
�� 
id
�� 
=
�� 
$num
�� 
;
�� 
var
�� 
	oResponse
�� 
=
�� 
await
��  %#
_propertyTypeServices
��& ;
.
��; <(
CheckDuplicatePropertyType
��< V
(
��V W
PropertyType
��W c
)
��c d
;
��d e
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
	oResponse
��. 7
,
��7 8
(
��9 :
Int32
��: ?
)
��? @
HttpStatusCode
��@ N
.
��N O
OK
��O Q
,
��Q R
AppConstants
��S _
.
��_ `
DeleteSuccess
��` m
)
��m n
;
��n o
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
await
�� 
_ExceptionService
�� '
.
��' (
LogException
��( 4
(
��4 5
ex
��5 7
)
��7 8
;
��8 9
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
Convert
��` g
.
��g h
ToString
��h p
(
��p q
ex
��q s
.
��s t

StackTrace
��t ~
)
��~ 
)�� �
;��� �
}
�� 
}
�� 	
}
�� 
}�� �R
RD:\EltizamLive\Eltizam.WebApi\src\API\Controllers\MasterQualificationController.cs
	namespace

 	
Eltizam


 
.

 
WebApi

 
.

 
Controllers

 $
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
Route 

(
 
$str 3
)3 4
]4 5
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class )
MasterQualificationController .
:/ 0
ControllerBase1 ?
{ 
private 
readonly (
IMasterQualificationServices 5"
_qualificationServices6 L
;L M
private 
readonly 
IResponseHandler )
<) *
dynamic* 1
>1 2
_ObjectResponse3 B
;B C
private 
readonly 
IExceptionService *
_ExceptionService+ <
;< =
IExceptionService 
exceptionService *
;* +
public )
MasterQualificationController ,
(, -(
IMasterQualificationServices- I!
qualificationServicesJ _
,_ `
IResponseHandlera q
<q r
dynamicr y
>y z
ObjectResponse	{ �
)
� �
{ 	"
_qualificationServices "
=# $!
qualificationServices% :
;: ;
_ObjectResponse 
= 
ObjectResponse ,
;, -
_ExceptionService 
= 
exceptionService  0
;0 1
} 	
[## 	
HttpPost##	 
]## 
[$$ 	
Route$$	 
($$ 
$str$$ 
)$$ 
]$$ 
public%% 
async%% 
Task%% 
<%% 
IActionResult%% '
>%%' (
Upsert%%) /
(%%/ 0%
Master_QualificationModel%%0 I
oQualification%%J X
)%%X Y
{&& 	
try'' 
{(( 
DBOperation)) 
	oResponse)) %
=))& '
await))( -"
_qualificationServices)). D
.))D E"
AddUpdateQualification))E [
())[ \
oQualification))\ j
)))j k
;))k l
if** 
(** 
	oResponse** 
==**  
DBOperation**! ,
.**, -
Success**- 4
)**4 5
{++ 
return,, 
_ObjectResponse,, *
.,,* +
Create,,+ 1
(,,1 2
true,,2 6
,,,6 7
(,,8 9
Int32,,9 >
),,> ?
HttpStatusCode,,? M
.,,M N
OK,,N P
,,,P Q
(,,R S
oQualification,,S a
.,,a b
Id,,b d
>,,e f
$num,,g h
?,,i j
AppConstants,,k w
.,,w x
UpdateSuccess	,,x �
:
,,� �
AppConstants
,,� �
.
,,� �
InsertSuccess
,,� �
)
,,� �
)
,,� �
;
,,� �
}-- 
else.. 
return// 
_ObjectResponse// *
.//* +
Create//+ 1
(//1 2
false//2 7
,//7 8
(//9 :
Int32//: ?
)//? @
HttpStatusCode//@ N
.//N O

BadRequest//O Y
,//Y Z
(//[ \
	oResponse//\ e
==//f h
DBOperation//i t
.//t u
NotFound//u }
?//~ 
AppConstants
//� �
.
//� �
NoRecordFound
//� �
:
//� �
AppConstants
//� �
.
//� �

BadRequest
//� �
)
//� �
)
//� �
;
//� �
}00 
catch11 
(11 
	Exception11 
ex11 
)11  
{22 
return33 
_ObjectResponse33 &
.33& '
Create33' -
(33- .
false33. 3
,333 4
(335 6
Int32336 ;
)33; <
HttpStatusCode33< J
.33J K
InternalServerError33K ^
,33^ _
Convert33` g
.33g h
ToString33h p
(33p q
ex33q s
.33s t

StackTrace33t ~
)33~ 
)	33 �
;
33� �
}44 
}55 	
[77 	
HttpGet77	 
]77 
[88 	
Route88	 
(88 
$str88 
)88 
]88 
public99 
async99 
Task99 
<99 
IActionResult99 '
>99' ( 
GetQualificationById99) =
(99= >
[99> ?
	FromRoute99? H
]99H I
int99J M
id99N P
)99P Q
{:: 	
try;; 
{<< 
var==  
oQualificationEntity== (
===) *
await==+ 0"
_qualificationServices==1 G
.==G H+
GetMasterQualificationByIdAsync==H g
(==g h
id==h j
)==j k
;==k l
if>> 
(>>  
oQualificationEntity>> (
!=>>) +
null>>, 0
&&>>1 3 
oQualificationEntity>>4 H
.>>H I
Id>>I K
>>>L M
$num>>N O
)>>O P
return?? 
_ObjectResponse?? *
.??* +
Create??+ 1
(??1 2 
oQualificationEntity??2 F
,??F G
(??H I
Int32??I N
)??N O
HttpStatusCode??O ]
.??] ^
OK??^ `
)??` a
;??a b
else@@ 
returnAA 
_ObjectResponseAA *
.AA* +
CreateAA+ 1
(AA1 2
nullAA2 6
,AA6 7
(AA8 9
Int32AA9 >
)AA> ?
HttpStatusCodeAA? M
.AAM N

BadRequestAAN X
,AAX Y
AppConstantsAAZ f
.AAf g
NoRecordFoundAAg t
)AAt u
;AAu v
}BB 
catchCC 
(CC 
	ExceptionCC 
exCC 
)CC  
{DD 
returnEE 
_ObjectResponseEE &
.EE& '
CreateEE' -
(EE- .
falseEE. 3
,EE3 4
(EE5 6
Int32EE6 ;
)EE; <
HttpStatusCodeEE< J
.EEJ K
InternalServerErrorEEK ^
,EE^ _
ConvertEE` g
.EEg h
ToStringEEh p
(EEp q
exEEq s
.EEs t

StackTraceEEt ~
)EE~ 
)	EE �
;
EE� �
}FF 
}GG 	
[II 	
HttpPostII	 
,II 
RouteII 
(II 
$strII .
)II. /
]II/ 0
publicJJ 
asyncJJ 
TaskJJ 
<JJ 
IActionResultJJ '
>JJ' (
GetAllQualificationJJ) <
(JJ< =
[JJ= >
FromFormJJ> F
]JJF G"
DataTableAjaxPostModelJJH ^
modelJJ_ d
)JJd e
{KK 	
tryLL 
{MM 
returnNN 
_ObjectResponseNN &
.NN& '

CreateDataNN' 1
(NN1 2
awaitNN2 7"
_qualificationServicesNN8 N
.NNN O
GetAllNNO U
(NNU V
modelNNV [
)NN[ \
,NN\ ]
(NN^ _
Int32NN_ d
)NNd e
HttpStatusCodeNNe s
.NNs t
OKNNt v
)NNv w
;NNw x
}OO 
catchPP 
(PP 
	ExceptionPP 
exPP 
)PP  
{QQ 
awaitRR 
_ExceptionServiceRR '
.RR' (
LogExceptionRR( 4
(RR4 5
exRR5 7
)RR7 8
;RR8 9
returnSS 
_ObjectResponseSS &
.SS& '
CreateSS' -
(SS- .
falseSS. 3
,SS3 4
(SS5 6
Int32SS6 ;
)SS; <
HttpStatusCodeSS< J
.SSJ K
InternalServerErrorSSK ^
,SS^ _
ConvertSS` g
.SSg h
ToStringSSh p
(SSp q
exSSq s
.SSs t

StackTraceSSt ~
)SS~ 
)	SS �
;
SS� �
}TT 
}UU 	
[WW 	

HttpDeleteWW	 
(WW 
$strWW .
)WW. /
]WW/ 0
publicXX 
asyncXX 
TaskXX 
<XX 
IActionResultXX '
>XX' (
DeleteQualificationXX) <
(XX< =
[XX= >
	FromRouteXX> G
]XXG H
intXXI L
idXXM O
)XXO P
{YY 	
tryZZ 
{[[ 
DBOperation\\ 
	oResponse\\ %
=\\& '
await\\( -"
_qualificationServices\\. D
.\\D E
DeleteQualification\\E X
(\\X Y
id\\Y [
)\\[ \
;\\\ ]
if]] 
(]] 
	oResponse]] 
==]]  
DBOperation]]! ,
.]], -
Success]]- 4
)]]4 5
return^^ 
_ObjectResponse^^ *
.^^* +
Create^^+ 1
(^^1 2
true^^2 6
,^^6 7
(^^8 9
Int32^^9 >
)^^> ?
HttpStatusCode^^? M
.^^M N
OK^^N P
,^^P Q
AppConstants^^R ^
.^^^ _
DeleteSuccess^^_ l
)^^l m
;^^m n
else__ 
return`` 
_ObjectResponse`` *
.``* +
Create``+ 1
(``1 2
null``2 6
,``6 7
(``8 9
Int32``9 >
)``> ?
HttpStatusCode``? M
.``M N

BadRequest``N X
,``X Y
AppConstants``Z f
.``f g
NoRecordFound``g t
)``t u
;``u v
}aa 
catchbb 
(bb 
	Exceptionbb 
exbb 
)bb  
{cc 
awaitdd 
_ExceptionServicedd '
.dd' (
LogExceptiondd( 4
(dd4 5
exdd5 7
)dd7 8
;dd8 9
returnee 
_ObjectResponseee &
.ee& '
Createee' -
(ee- .
falseee. 3
,ee3 4
(ee5 6
Int32ee6 ;
)ee; <
HttpStatusCodeee< J
.eeJ K
InternalServerErroreeK ^
,ee^ _
Convertee` g
.eeg h
ToStringeeh p
(eep q
exeeq s
.ees t

StackTraceeet ~
)ee~ 
)	ee �
;
ee� �
}ff 
}gg 	
}kk 
}ll ˕
ID:\EltizamLive\Eltizam.WebApi\src\API\Controllers\MasterRoleController.cs
	namespace

 	
Eltizam


 
.

 
WebApi

 
.

 
Controllers

 $
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
Route 

(
 
$str 3
)3 4
]4 5
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class  
MasterRoleController %
:& '
ControllerBase( 6
{ 
private 
readonly 
IMasterRoleService +
_MasterRoleService, >
;> ?
private 
readonly  
IMasterModuleService - 
_MasterModuleService. B
;B C
private 
readonly 
IResponseHandler )
<) *
dynamic* 1
>1 2
_ObjectResponse3 B
;B C
private 
readonly 
IExceptionService *
_ExceptionService+ <
;< =
public  
MasterRoleController #
(# $
IMasterRoleService$ 6
MasterRoleService7 H
,H I
IResponseHandlerJ Z
<Z [
dynamic[ b
>b c
ObjectResponsed r
,r s!
IMasterModuleService	t �!
MasterModuleService
� �
,
� �
IExceptionService
� �
exceptionService
� �
)
� �
{ 	
_MasterRoleService 
=  
MasterRoleService! 2
;2 3
_ObjectResponse   
=   
ObjectResponse   ,
;  , - 
_MasterModuleService!!  
=!!! "
MasterModuleService!!# 6
;!!6 7
_ExceptionService"" 
="" 
exceptionService""  0
;""0 1
}## 	
[44 	
HttpPost44	 
]44 
[55 	
Route55	 
(55 
$str55 !
)55! "
]55" #
public66 
async66 
Task66 
<66 
IActionResult66 '
>66' (
InsertUpdateRole66) 9
(669 :
MasterRoleEntity66: J
oRole66K P
)66P Q
{77 	
try88 
{99 
DBOperation:: 
	oResponse:: %
=::& '
await::( -
_MasterRoleService::. @
.::@ A
AddUpdateRole::A N
(::N O
oRole::O T
)::T U
;::U V
if;; 
(;; 
	oResponse;; 
==;;  
DBOperation;;! ,
.;;, -
Success;;- 4
);;4 5
return<< 
_ObjectResponse<< *
.<<* +
Create<<+ 1
(<<1 2
true<<2 6
,<<6 7
(<<8 9
Int32<<9 >
)<<> ?
HttpStatusCode<<? M
.<<M N
OK<<N P
,<<P Q
(<<R S
oRole<<S X
.<<X Y
Id<<Y [
><<\ ]
$num<<^ _
?<<` a
AppConstants<<b n
.<<n o
UpdateSuccess<<o |
:<<} ~
AppConstants	<< �
.
<<� �
InsertSuccess
<<� �
)
<<� �
)
<<� �
;
<<� �
else== 
return>> 
_ObjectResponse>> *
.>>* +
Create>>+ 1
(>>1 2
false>>2 7
,>>7 8
(>>9 :
Int32>>: ?
)>>? @
HttpStatusCode>>@ N
.>>N O

BadRequest>>O Y
,>>Y Z
(>>[ \
	oResponse>>\ e
==>>f h
DBOperation>>i t
.>>t u
NotFound>>u }
?>>~ 
AppConstants
>>� �
.
>>� �
NoRecordFound
>>� �
:
>>� �
AppConstants
>>� �
.
>>� �

BadRequest
>>� �
)
>>� �
)
>>� �
;
>>� �
}?? 
catch@@ 
(@@ 
	Exception@@ 
ex@@ 
)@@  
{AA 
awaitBB 
_ExceptionServiceBB '
.BB' (
LogExceptionBB( 4
(BB4 5
exBB5 7
)BB7 8
;BB8 9
returnCC 
_ObjectResponseCC &
.CC& '
CreateCC' -
(CC- .
falseCC. 3
,CC3 4
(CC5 6
Int32CC6 ;
)CC; <
HttpStatusCodeCC< J
.CCJ K
InternalServerErrorCCK ^
,CC^ _
ConvertCC` g
.CCg h
ToStringCCh p
(CCp q
exCCq s
.CCs t

StackTraceCCt ~
)CC~ 
)	CC �
;
CC� �
}DD 
}EE 	
[SS 	
HttpGetSS	 
,SS 
RouteSS 
(SS 
$strSS *
)SS* +
]SS+ ,
publicTT 
asyncTT 
TaskTT 
<TT 
IActionResultTT '
>TT' (
GetRoleByIdTT) 4
(TT4 5
[TT5 6
	FromRouteTT6 ?
]TT? @
intTTA D
idTTE G
)TTG H
{UU 	
tryVV 
{WW 
varXX 
oRoleEntityXX 
=XX  !
awaitXX" '
_MasterRoleServiceXX( :
.XX: ;
GetByIdXX; B
(XXB C
idXXC E
)XXE F
;XXF G
oRoleEntityYY 
.YY 
MasterModulesYY )
=YY* +
awaitYY, 1 
_MasterModuleServiceYY2 F
.YYF G
GetByRoleIdYYG R
(YYR S
idYYS U
)YYU V
;YYV W
if[[ 
([[ 
oRoleEntity[[ 
is[[  "
not[[# &
null[[' +
&&[[, .
oRoleEntity[[/ :
.[[: ;
Id[[; =
>[[> ?
$num[[@ A
)[[A B
return\\ 
_ObjectResponse\\ *
.\\* +
Create\\+ 1
(\\1 2
oRoleEntity\\2 =
,\\= >
(\\? @
Int32\\@ E
)\\E F
HttpStatusCode\\F T
.\\T U
OK\\U W
)\\W X
;\\X Y
else]] 
return^^ 
_ObjectResponse^^ *
.^^* +
Create^^+ 1
(^^1 2
null^^2 6
,^^6 7
(^^8 9
Int32^^9 >
)^^> ?
HttpStatusCode^^? M
.^^M N

BadRequest^^N X
,^^X Y
AppConstants^^Z f
.^^f g
NoRecordFound^^g t
)^^t u
;^^u v
}__ 
catch`` 
(`` 
	Exception`` 
ex`` 
)``  
{aa 
awaitbb 
_ExceptionServicebb '
.bb' (
LogExceptionbb( 4
(bb4 5
exbb5 7
)bb7 8
;bb8 9
returncc 
_ObjectResponsecc &
.cc& '
Createcc' -
(cc- .
falsecc. 3
,cc3 4
(cc5 6
Int32cc6 ;
)cc; <
HttpStatusCodecc< J
.ccJ K
InternalServerErrorccK ^
,cc^ _
Convertcc` g
.ccg h
ToStringcch p
(ccp q
exccq s
.ccs t

StackTracecct ~
)cc~ 
)	cc �
;
cc� �
}dd 
}ee 	
[
�� 	
HttpPost
��	 
,
�� 
Route
�� 
(
�� 
$str
�� !
)
��! "
]
��" #
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
GetAll
��) /
(
��/ 0
[
��0 1
FromForm
��1 9
]
��9 :$
DataTableAjaxPostModel
��; Q
model
��R W
)
��W X
{
�� 	
try
�� 
{
�� 
return
�� 
_ObjectResponse
�� &
.
��& '

CreateData
��' 1
(
��1 2
await
��2 7 
_MasterRoleService
��8 J
.
��J K
GetAll
��K Q
(
��Q R
model
��R W
)
��W X
,
��X Y
(
��Z [
Int32
��[ `
)
��` a
HttpStatusCode
��a o
.
��o p
OK
��p r
)
��r s
;
��s t
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
await
�� 
_ExceptionService
�� '
.
��' (
LogException
��( 4
(
��4 5
ex
��5 7
)
��7 8
;
��8 9
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
Convert
��` g
.
��g h
ToString
��h p
(
��p q
ex
��q s
.
��s t

StackTrace
��t ~
)
��~ 
)�� �
;��� �
}
�� 
}
�� 	
[
�� 	
HttpGet
��	 
,
�� 
Route
�� 
(
�� 
$str
�� $
)
��$ %
]
��% &
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (

RoleSearch
��) 3
(
��3 4
string
��4 :
searchQuery
��; F
)
��F G
{
�� 	
try
�� 
{
�� 
var
�� 
	oRoleList
�� 
=
�� 
await
��  % 
_MasterRoleService
��& 8
.
��8 9

RoleSearch
��9 C
(
��C D
searchQuery
��D O
)
��O P
;
��P Q
if
�� 
(
�� 
	oRoleList
�� 
!=
��  
null
��! %
)
��% &
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
	oRoleList
��2 ;
,
��; <
(
��= >
Int32
��> C
)
��C D
HttpStatusCode
��D R
.
��R S
OK
��S U
)
��U V
;
��V W
else
�� 
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
null
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N

BadRequest
��N X
,
��X Y
AppConstants
��Z f
.
��f g
NoRecordFound
��g t
)
��t u
;
��u v
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
await
�� 
_ExceptionService
�� '
.
��' (
LogException
��( 4
(
��4 5
ex
��5 7
)
��7 8
;
��8 9
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
Convert
��` g
.
��g h
ToString
��h p
(
��p q
ex
��q s
.
��s t

StackTrace
��t ~
)
��~ 
)�� �
;��� �
}
�� 
}
�� 	
[
�� 	
HttpGet
��	 
,
�� 
Route
�� 
(
�� 
$str
�� *
)
��* +
]
��+ ,
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
GetAllActiveRole
��) 9
(
��9 :
)
��: ;
{
�� 	
try
�� 
{
�� 
var
�� 
	oRoleList
�� 
=
�� 
await
��  % 
_MasterRoleService
��& 8
.
��8 9
GetActiveRole
��9 F
(
��F G
)
��G H
;
��H I
if
�� 
(
�� 
	oRoleList
�� 
!=
��  
null
��! %
)
��% &
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
	oRoleList
��2 ;
,
��; <
(
��= >
Int32
��> C
)
��C D
HttpStatusCode
��D R
.
��R S
OK
��S U
)
��U V
;
��V W
else
�� 
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
null
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N

BadRequest
��N X
,
��X Y
AppConstants
��Z f
.
��f g
NoRecordFound
��g t
)
��t u
;
��u v
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
await
�� 
_ExceptionService
�� '
.
��' (
LogException
��( 4
(
��4 5
ex
��5 7
)
��7 8
;
��8 9
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
Convert
��` g
.
��g h
ToString
��h p
(
��p q
ex
��q s
.
��s t

StackTrace
��t ~
)
��~ 
)�� �
;��� �
}
�� 
}
�� 	
[
�� 	
HttpPost
��	 
(
�� 
$str
�� #
)
��# $
]
��$ %
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (

DeleteRole
��) 3
(
��3 4
[
��4 5
	FromRoute
��5 >
]
��> ?
int
��@ C
id
��D F
)
��F G
{
�� 	
try
�� 
{
�� 
DBOperation
�� 
	oResponse
�� %
=
��& '
await
��( - 
_MasterRoleService
��. @
.
��@ A

DeleteRole
��A K
(
��K L
id
��L N
)
��N O
;
��O P
if
�� 
(
�� 
	oResponse
�� 
==
��  
DBOperation
��! ,
.
��, -
Success
��- 4
)
��4 5
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
true
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N
OK
��N P
,
��P Q
AppConstants
��R ^
.
��^ _
DeleteSuccess
��_ l
)
��l m
;
��m n
else
�� 
if
�� 
(
�� 
	oResponse
�� "
==
��# %
DBOperation
��& 1
.
��1 2
NotFound
��2 :
)
��: ;
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
null
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N
OK
��N P
,
��P Q
$str
��R `
)
��` a
;
��a b
else
�� 
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
null
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N

BadRequest
��N X
,
��X Y
AppConstants
��Z f
.
��f g
NoRecordFound
��g t
)
��t u
;
��u v
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
await
�� 
_ExceptionService
�� '
.
��' (
LogException
��( 4
(
��4 5
ex
��5 7
)
��7 8
;
��8 9
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
Convert
��` g
.
��g h
ToString
��h p
(
��p q
ex
��q s
.
��s t

StackTrace
��t ~
)
��~ 
)�� �
;��� �
}
�� 
}
�� 	
[
�� 	
HttpGet
��	 
,
�� 
Route
�� 
(
�� 
$str
�� <
)
��< =
]
��= >
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (+
GetByPermisionRoleUsingRoleId
��) F
(
��F G
[
��G H
	FromRoute
��H Q
]
��Q R
int
��S V
id
��W Y
)
��Y Z
{
�� 	
try
�� 
{
�� 
dynamic
�� 
oRoleEntity
�� #
=
��$ %
await
��& +"
_MasterModuleService
��, @
.
��@ A+
GetByPermisionRoleUsingRoleId
��A ^
(
��^ _
id
��_ a
)
��a b
;
��b c
if
�� 
(
�� 
oRoleEntity
�� 
is
��  "
not
��# &
null
��' +
)
��+ ,
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
oRoleEntity
��2 =
,
��= >
(
��? @
Int32
��@ E
)
��E F
HttpStatusCode
��F T
.
��T U
OK
��U W
)
��W X
;
��X Y
else
�� 
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
null
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N

BadRequest
��N X
,
��X Y
AppConstants
��Z f
.
��f g
NoRecordFound
��g t
)
��t u
;
��u v
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
await
�� 
_ExceptionService
�� '
.
��' (
LogException
��( 4
(
��4 5
ex
��5 7
)
��7 8
;
��8 9
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
Convert
��` g
.
��g h
ToString
��h p
(
��p q
ex
��q s
.
��s t

StackTrace
��t ~
)
��~ 
)�� �
;��� �
}
�� 
}
�� 	
}
�� 
}�� �h
JD:\EltizamLive\Eltizam.WebApi\src\API\Controllers\MasterStateController.cs
	namespace 	
Eltizam
 
. 
WebApi 
. 
Controllers $
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
Route 

(
 
$str 3
)3 4
]4 5
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class !
MasterStateController &
:' (
ControllerBase) 7
{ 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
private 
readonly 
IResponseHandler )
<) *
dynamic* 1
>1 2
_ObjectResponse3 B
;B C
private 
	Microsoft 
. 

Extensions $
.$ %
Hosting% ,
., -
IHostingEnvironment- @
_envA E
;E F
private 
readonly 
IExceptionService *
_ExceptionService+ <
;< =
private 
readonly 
IMasterStateService ,
_StateService- :
;: ;
public !
MasterStateController $
($ %
IConfiguration% 3
configuration4 A
,A B
IResponseHandlerC S
<S T
dynamicT [
>[ \
ObjectResponse] k
,k l
IExceptionServicem ~
exceptionService	 �
,
� �!
IMasterStateService
� �
StateService
� �
)
� �
{ 	
_configuration   
=   
configuration   *
;  * +
_ObjectResponse!! 
=!! 
ObjectResponse!! ,
;!!, -
_ExceptionService"" 
="" 
exceptionService""  0
;""0 1
_StateService## 
=## 
StateService## (
;##( )
}$$ 	
[99 	
HttpPost99	 
,99 
Route99 
(99 
$str99 !
)99! "
]99" #
public:: 
async:: 
Task:: 
<:: 
IActionResult:: '
>::' (
GetAll::) /
(::/ 0
[::0 1
FromForm::1 9
]::9 :"
DataTableAjaxPostModel::; Q
model::R W
)::W X
{;; 	
try<< 
{== 
return>> 
_ObjectResponse>> &
.>>& '

CreateData>>' 1
(>>1 2
await>>2 7
_StateService>>8 E
.>>E F
GetAll>>F L
(>>L M
model>>M R
)>>R S
,>>S T
(>>U V
Int32>>V [
)>>[ \
HttpStatusCode>>\ j
.>>j k
OK>>k m
)>>m n
;>>n o
}?? 
catch@@ 
(@@ 
	Exception@@ 
ex@@ 
)@@  
{AA 
returnBB 
_ObjectResponseBB &
.BB& '
CreateBB' -
(BB- .
falseBB. 3
,BB3 4
(BB5 6
Int32BB6 ;
)BB; <
HttpStatusCodeBB< J
.BBJ K
InternalServerErrorBBK ^
,BB^ _
ConvertBB` g
.BBg h
ToStringBBh p
(BBp q
exBBq s
.BBs t

StackTraceBBt ~
)BB~ 
)	BB �
;
BB� �
}CC 
}DD 	
[GG 	
HttpGetGG	 
,GG 
RouteGG 
(GG 
$strGG &
)GG& '
]GG' (
publicHH 
asyncHH 
TaskHH 
<HH 
IActionResultHH '
>HH' (
GetByIdHH) 0
(HH0 1
[HH1 2
	FromRouteHH2 ;
]HH; <
intHH= @
idHHA C
)HHC D
{II 	
tryJJ 
{KK 
varLL 
oStateEntityLL  
=LL! "
awaitLL# (
_StateServiceLL) 6
.LL6 7
GetByIdLL7 >
(LL> ?
idLL? A
)LLA B
;LLB C
ifMM 
(MM 
oStateEntityMM  
!=MM! #
nullMM$ (
&&MM) +
oStateEntityMM, 8
.MM8 9
IdMM9 ;
>MM< =
$numMM> ?
)MM? @
returnNN 
_ObjectResponseNN *
.NN* +
CreateNN+ 1
(NN1 2
oStateEntityNN2 >
,NN> ?
(NN@ A
Int32NNA F
)NNF G
HttpStatusCodeNNG U
.NNU V
OKNNV X
)NNX Y
;NNY Z
elseOO 
returnPP 
_ObjectResponsePP *
.PP* +
CreatePP+ 1
(PP1 2
nullPP2 6
,PP6 7
(PP8 9
Int32PP9 >
)PP> ?
HttpStatusCodePP? M
.PPM N

BadRequestPPN X
,PPX Y
AppConstantsPPZ f
.PPf g
NoRecordFoundPPg t
)PPt u
;PPu v
}QQ 
catchRR 
(RR 
	ExceptionRR 
exRR 
)RR  
{SS 
returnTT 
_ObjectResponseTT &
.TT& '
CreateTT' -
(TT- .
falseTT. 3
,TT3 4
(TT5 6
Int32TT6 ;
)TT; <
HttpStatusCodeTT< J
.TTJ K
InternalServerErrorTTK ^
,TT^ _
ConvertTT` g
.TTg h
ToStringTTh p
(TTp q
exTTq s
.TTs t

StackTraceTTt ~
)TT~ 
)	TT �
;
TT� �
}UU 
}VV 	
[YY 	
HttpPostYY	 
]YY 
[ZZ 	
RouteZZ	 
(ZZ 
$strZZ 
)ZZ 
]ZZ 
public[[ 
async[[ 
Task[[ 
<[[ 
IActionResult[[ '
>[[' (
Upsert[[) /
([[/ 0
MasterStateEntity[[0 A
oState[[B H
)[[H I
{\\ 	
try]] 
{^^ 
DBOperation__ 
	oResponse__ %
=__& '
await__( -
_StateService__. ;
.__; <
Upsert__< B
(__B C
oState__C I
)__I J
;__J K
if`` 
(`` 
	oResponse`` 
==``  
DBOperation``! ,
.``, -
Success``- 4
)``4 5
{aa 
returnbb 
_ObjectResponsebb *
.bb* +
Createbb+ 1
(bb1 2
truebb2 6
,bb6 7
(bb8 9
Int32bb9 >
)bb> ?
HttpStatusCodebb? M
.bbM N
OKbbN P
,bbP Q
(bbR S
oStatebbS Y
.bbY Z
IdbbZ \
>bb] ^
$numbb_ `
?bba b
AppConstantsbbc o
.bbo p
UpdateSuccessbbp }
:bb~ 
AppConstants
bb� �
.
bb� �
InsertSuccess
bb� �
)
bb� �
)
bb� �
;
bb� �
}cc 
elsedd 
returnee 
_ObjectResponseee *
.ee* +
Createee+ 1
(ee1 2
falseee2 7
,ee7 8
(ee9 :
Int32ee: ?
)ee? @
HttpStatusCodeee@ N
.eeN O

BadRequesteeO Y
,eeY Z
(ee[ \
	oResponseee\ e
==eef h
DBOperationeei t
.eet u
NotFoundeeu }
?ee~ 
AppConstants
ee� �
.
ee� �
NoRecordFound
ee� �
:
ee� �
AppConstants
ee� �
.
ee� �

BadRequest
ee� �
)
ee� �
)
ee� �
;
ee� �
}ff 
catchgg 
(gg 
	Exceptiongg 
exgg 
)gg  
{hh 
returnii 
_ObjectResponseii &
.ii& '
Createii' -
(ii- .
falseii. 3
,ii3 4
(ii5 6
Int32ii6 ;
)ii; <
HttpStatusCodeii< J
.iiJ K
InternalServerErroriiK ^
,ii^ _
Convertii` g
.iig h
ToStringiih p
(iip q
exiiq s
.iis t

StackTraceiit ~
)ii~ 
)	ii �
;
ii� �
}jj 
}kk 	
[nn 	

HttpDeletenn	 
(nn 
$strnn !
)nn! "
]nn" #
publicoo 
asyncoo 
Taskoo 
<oo 
IActionResultoo '
>oo' (
Deleteoo) /
(oo/ 0
[oo0 1
	FromRouteoo1 :
]oo: ;
intoo< ?
idoo@ B
)ooB C
{pp 	
tryqq 
{rr 
DBOperationss 
	oResponsess %
=ss& '
awaitss( -
_StateServicess. ;
.ss; <
Deletess< B
(ssB C
idssC E
)ssE F
;ssF G
iftt 
(tt 
	oResponsett 
==tt  
DBOperationtt! ,
.tt, -
Successtt- 4
)tt4 5
returnuu 
_ObjectResponseuu *
.uu* +
Createuu+ 1
(uu1 2
trueuu2 6
,uu6 7
(uu8 9
Int32uu9 >
)uu> ?
HttpStatusCodeuu? M
.uuM N
OKuuN P
,uuP Q
AppConstantsuuR ^
.uu^ _
DeleteSuccessuu_ l
)uul m
;uum n
elsevv 
returnww 
_ObjectResponseww *
.ww* +
Createww+ 1
(ww1 2
nullww2 6
,ww6 7
(ww8 9
Int32ww9 >
)ww> ?
HttpStatusCodeww? M
.wwM N

BadRequestwwN X
,wwX Y
AppConstantswwZ f
.wwf g
NoRecordFoundwwg t
)wwt u
;wwu v
}xx 
catchyy 
(yy 
	Exceptionyy 
exyy 
)yy  
{zz 
return{{ 
_ObjectResponse{{ &
.{{& '
Create{{' -
({{- .
false{{. 3
,{{3 4
({{5 6
Int32{{6 ;
){{; <
HttpStatusCode{{< J
.{{J K
InternalServerError{{K ^
,{{^ _
Convert{{` g
.{{g h
ToString{{h p
({{p q
ex{{q s
.{{s t

StackTrace{{t ~
){{~ 
)	{{ �
;
{{� �
}|| 
}}} 	
[ 	
HttpGet	 
( 
$str 
)  
]  !
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
GetStateList
��) 5
(
��5 6
)
��6 7
{
�� 	
try
�� 
{
�� 
return
�� 
_ObjectResponse
�� &
.
��& '

CreateData
��' 1
(
��1 2
await
��2 7
_StateService
��8 E
.
��E F
GetStateList
��F R
(
��R S
)
��S T
,
��T U
(
��V W
Int32
��W \
)
��\ ]
HttpStatusCode
��] k
.
��k l
OK
��l n
)
��n o
;
��o p
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
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
Convert
��` g
.
��g h
ToString
��h p
(
��p q
ex
��q s
.
��s t

StackTrace
��t ~
)
��~ 
)�� �
;��� �
}
�� 
}
�� 	
[
�� 	
HttpGet
��	 
(
�� 
$str
�� 6
)
��6 7
]
��7 8
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (%
GetStateListByCountryId
��) @
(
��@ A
[
��A B
	FromRoute
��B K
]
��K L
int
��M P
	countryId
��Q Z
)
��Z [
{
�� 	
try
�� 
{
�� 
return
�� 
_ObjectResponse
�� &
.
��& '

CreateData
��' 1
(
��1 2
await
��2 7
_StateService
��8 E
.
��E F%
GetStateListByCountryId
��F ]
(
��] ^
	countryId
��^ g
)
��g h
,
��h i
(
��j k
Int32
��k p
)
��p q
HttpStatusCode
��q 
.�� �
OK��� �
)��� �
;��� �
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
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
Convert
��` g
.
��g h
ToString
��h p
(
��p q
ex
��q s
.
��s t

StackTrace
��t ~
)
��~ 
)�� �
;��� �
}
�� 
}
�� 	
}
�� 
}�� ��
ID:\EltizamLive\Eltizam.WebApi\src\API\Controllers\MasterUserController.cs
	namespace 	
Eltizam
 
. 
WebApi 
. 
Controllers $
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
Route 

(
 
$str 3
)3 4
]4 5
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class  
MasterUserController %
:& '
ControllerBase( 6
{ 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
private 
readonly 
IResponseHandler )
<) *
dynamic* 1
>1 2
_ObjectResponse3 B
;B C
private 
	Microsoft 
. 

Extensions $
.$ %
Hosting% ,
., -
IHostingEnvironment- @
_envA E
;E F
private 
readonly 
IExceptionService *
_ExceptionService+ <
;< =
private 
readonly 
IMasterUserService +
_MasterUserService, >
;> ?
public""  
MasterUserController"" #
(""# $
IConfiguration""$ 2
configuration""3 @
,""@ A
IMasterUserService""B T
MasterUserService""U f
,""f g
IResponseHandler""h x
<""x y
dynamic	""y �
>
""� �
ObjectResponse
""� �
,
""� �
IExceptionService
""� �
exceptionService
""� �
)
""� �
{## 	
_configuration$$ 
=$$ 
configuration$$ *
;$$* +
_MasterUserService%% 
=%%  
MasterUserService%%! 2
;%%2 3
_ObjectResponse&& 
=&& 
ObjectResponse&& ,
;&&, -
_ExceptionService(( 
=(( 
exceptionService((  0
;((0 1
})) 	
[;; 	
HttpPost;;	 
,;; 
Route;; 
(;; 
$str;; !
);;! "
];;" #
public<< 
async<< 
Task<< 
<<< 
IActionResult<< '
><<' (
GetAll<<) /
(<</ 0
[<<0 1
FromForm<<1 9
]<<9 :"
DataTableAjaxPostModel<<; Q
model<<R W
)<<W X
{== 	
try>> 
{?? 
return@@ 
_ObjectResponse@@ &
.@@& '

CreateData@@' 1
(@@1 2
await@@2 7
_MasterUserService@@8 J
.@@J K
GetAll@@K Q
(@@Q R
model@@R W
)@@W X
,@@X Y
(@@Z [
Int32@@[ `
)@@` a
HttpStatusCode@@a o
.@@o p
OK@@p r
)@@r s
;@@s t
}AA 
catchBB 
(BB 
	ExceptionBB 
exBB 
)BB  
{CC 
awaitDD 
_ExceptionServiceDD '
.DD' (
LogExceptionDD( 4
(DD4 5
exDD5 7
)DD7 8
;DD8 9
returnEE 
_ObjectResponseEE &
.EE& '
CreateEE' -
(EE- .
falseEE. 3
,EE3 4
(EE5 6
Int32EE6 ;
)EE; <
HttpStatusCodeEE< J
.EEJ K
InternalServerErrorEEK ^
,EE^ _
exEE` b
.EEb c
InnerExceptionEEc q
?EEq r
.EEr s
MessageEEs z
)EEz {
;EE{ |
}FF 
}GG 	
[JJ 	
HttpGetJJ	 
,JJ 
RouteJJ 
(JJ 
$strJJ &
)JJ& '
]JJ' (
publicKK 
asyncKK 
TaskKK 
<KK 
IActionResultKK '
>KK' (
GetByIdKK) 0
(KK0 1
[KK1 2
	FromRouteKK2 ;
]KK; <
intKK= @
idKKA C
)KKC D
{LL 	
tryMM 
{NN 
varOO 
oUserEntityOO 
=OO  !
awaitOO" '
_MasterUserServiceOO( :
.OO: ;
GetByIdOO; B
(OOB C
idOOC E
)OOE F
;OOF G
ifPP 
(PP 
oUserEntityPP 
!=PP  "
nullPP# '
&&PP( *
oUserEntityPP+ 6
.PP6 7
IdPP7 9
>PP: ;
$numPP< =
)PP= >
returnQQ 
_ObjectResponseQQ *
.QQ* +
CreateQQ+ 1
(QQ1 2
oUserEntityQQ2 =
,QQ= >
(QQ? @
Int32QQ@ E
)QQE F
HttpStatusCodeQQF T
.QQT U
OKQQU W
)QQW X
;QQX Y
elseRR 
returnSS 
_ObjectResponseSS *
.SS* +
CreateSS+ 1
(SS1 2
nullSS2 6
,SS6 7
(SS8 9
Int32SS9 >
)SS> ?
HttpStatusCodeSS? M
.SSM N

BadRequestSSN X
,SSX Y
AppConstantsSSZ f
.SSf g
NoRecordFoundSSg t
)SSt u
;SSu v
}TT 
catchUU 
(UU 
	ExceptionUU 
exUU 
)UU  
{VV 
awaitWW 
_ExceptionServiceWW '
.WW' (
LogExceptionWW( 4
(WW4 5
exWW5 7
)WW7 8
;WW8 9
returnXX 
_ObjectResponseXX &
.XX& '
CreateXX' -
(XX- .
falseXX. 3
,XX3 4
(XX5 6
Int32XX6 ;
)XX; <
HttpStatusCodeXX< J
.XXJ K
InternalServerErrorXXK ^
,XX^ _
exXX` b
.XXb c
InnerExceptionXXc q
?XXq r
.XXr s
MessageXXs z
)XXz {
;XX{ |
}YY 
}ZZ 	
[\\ 	
HttpPost\\	 
]\\ 
[]] 	
Route]]	 
(]] 
$str]] 
)]] 
]]] 
public^^ 
async^^ 
Task^^ 
<^^ 
IActionResult^^ '
>^^' (
Upsert^^) /
(^^/ 0
MasterUserModel^^0 ?
oUser^^@ E
)^^E F
{__ 	
try`` 
{aa 
DBOperationbb 
	oResponsebb %
=bb& '
awaitbb( -
_MasterUserServicebb. @
.bb@ A
UpsertbbA G
(bbG H
oUserbbH M
)bbM N
;bbN O
ifcc 
(cc 
	oResponsecc 
==cc  
DBOperationcc! ,
.cc, -
Successcc- 4
)cc4 5
{dd 
returnee 
_ObjectResponseee *
.ee* +
Createee+ 1
(ee1 2
trueee2 6
,ee6 7
(ee8 9
Int32ee9 >
)ee> ?
HttpStatusCodeee? M
.eeM N
OKeeN P
,eeP Q
(eeR S
oUsereeS X
.eeX Y
IdeeY [
>ee\ ]
$numee^ _
?ee` a
AppConstantseeb n
.een o
UpdateSuccesseeo |
:ee} ~
AppConstants	ee �
.
ee� �
InsertSuccess
ee� �
)
ee� �
)
ee� �
;
ee� �
}ff 
elsegg 
returnhh 
_ObjectResponsehh *
.hh* +
Createhh+ 1
(hh1 2
falsehh2 7
,hh7 8
(hh9 :
Int32hh: ?
)hh? @
HttpStatusCodehh@ N
.hhN O

BadRequesthhO Y
,hhY Z
(hh[ \
	oResponsehh\ e
==hhf h
DBOperationhhi t
.hht u
NotFoundhhu }
?hh~ 
AppConstants
hh� �
.
hh� �
NoRecordFound
hh� �
:
hh� �
AppConstants
hh� �
.
hh� �

BadRequest
hh� �
)
hh� �
)
hh� �
;
hh� �
}ii 
catchjj 
(jj 
	Exceptionjj 
exjj 
)jj  
{kk 
awaitll 
_ExceptionServicell '
.ll' (
LogExceptionll( 4
(ll4 5
exll5 7
)ll7 8
;ll8 9
returnmm 
_ObjectResponsemm &
.mm& '
Createmm' -
(mm- .
falsemm. 3
,mm3 4
(mm5 6
Int32mm6 ;
)mm; <
HttpStatusCodemm< J
.mmJ K
InternalServerErrormmK ^
,mm^ _
exmm` b
.mmb c
InnerExceptionmmc q
?mmq r
.mmr s
Messagemms z
)mmz {
;mm{ |
}nn 
}oo 	
[rr 	
HttpGetrr	 
(rr 
$strrr &
)rr& '
]rr' (
publicss 
asyncss 
Taskss 
<ss 
IActionResultss '
>ss' (
GetResourceTypeListss) <
(ss< =
)ss= >
{tt 	
tryuu 
{vv 
returnww 
_ObjectResponseww &
.ww& '

CreateDataww' 1
(ww1 2
awaitww2 7
_MasterUserServiceww8 J
.wwJ K
GetResourceTypeListwwK ^
(ww^ _
)ww_ `
,ww` a
(wwb c
Int32wwc h
)wwh i
HttpStatusCodewwi w
.www x
OKwwx z
)wwz {
;ww{ |
}xx 
catchyy 
(yy 
	Exceptionyy 
exyy 
)yy  
{zz 
return{{ 
_ObjectResponse{{ &
.{{& '
Create{{' -
({{- .
false{{. 3
,{{3 4
({{5 6
Int32{{6 ;
){{; <
HttpStatusCode{{< J
.{{J K
InternalServerError{{K ^
,{{^ _
ex{{` b
.{{b c
InnerException{{c q
?{{q r
.{{r s
Message{{s z
){{z {
;{{{ |
}|| 
}}} 	
[ 	
HttpGet	 
( 
$str '
)' (
]( )
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' ("
GetApproverLevelList
��) =
(
��= >
)
��> ?
{
�� 	
try
�� 
{
�� 
return
�� 
_ObjectResponse
�� &
.
��& '

CreateData
��' 1
(
��1 2
await
��2 7 
_MasterUserService
��8 J
.
��J K"
GetApproverLevelList
��K _
(
��_ `
)
��` a
,
��a b
(
��c d
Int32
��d i
)
��i j
HttpStatusCode
��j x
.
��x y
OK
��y {
)
��{ |
;
��| }
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
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
ex
��` b
.
��b c
InnerException
��c q
?
��q r
.
��r s
Message
��s z
)
��z {
;
��{ |
}
�� 
}
�� 	
[
�� 	
HttpGet
��	 
(
�� 
$str
�� 
)
�� 
]
��  
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
GetRoleList
��) 4
(
��4 5
)
��5 6
{
�� 	
try
�� 
{
�� 
return
�� 
_ObjectResponse
�� &
.
��& '

CreateData
��' 1
(
��1 2
await
��2 7 
_MasterUserService
��8 J
.
��J K
GetRoleList
��K V
(
��V W
)
��W X
,
��X Y
(
��Z [
Int32
��[ `
)
��` a
HttpStatusCode
��a o
.
��o p
OK
��p r
)
��r s
;
��s t
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
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
ex
��` b
.
��b c
InnerException
��c q
?
��q r
.
��r s
Message
��s z
)
��z {
;
��{ |
}
�� 
}
�� 	
[
�� 	

HttpDelete
��	 
(
�� 
$str
�� !
)
��! "
]
��" #
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
Delete
��) /
(
��/ 0
[
��0 1
	FromRoute
��1 :
]
��: ;
int
��< ?
id
��@ B
)
��B C
{
�� 	
try
�� 
{
�� 
DBOperation
�� 
	oResponse
�� %
=
��& '
await
��( - 
_MasterUserService
��. @
.
��@ A
Delete
��A G
(
��G H
id
��H J
)
��J K
;
��K L
if
�� 
(
�� 
	oResponse
�� 
==
��  
DBOperation
��! ,
.
��, -
Success
��- 4
)
��4 5
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
true
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N
OK
��N P
,
��P Q
AppConstants
��R ^
.
��^ _
DeleteSuccess
��_ l
)
��l m
;
��m n
else
�� 
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
null
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N

BadRequest
��N X
,
��X Y
AppConstants
��Z f
.
��f g
NoRecordFound
��g t
)
��t u
;
��u v
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
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
ex
��` b
.
��b c
InnerException
��c q
?
��q r
.
��r s
Message
��s z
)
��z {
;
��{ |
}
�� 
}
�� 	
[
�� 	
HttpGet
��	 
(
�� 
$str
�� 2
)
��2 3
]
��3 4
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
GetApproverList
��) 8
(
��8 9
[
��9 :
	FromRoute
��: C
]
��C D
int
��E H
id
��I K
,
��K L
string
��M S
?
��S T
roleName
��U ]
)
��] ^
{
�� 	
try
�� 
{
�� 
return
�� 
_ObjectResponse
�� &
.
��& '

CreateData
��' 1
(
��1 2
await
��2 7 
_MasterUserService
��8 J
.
��J K
GetApproverList
��K Z
(
��Z [
id
��[ ]
,
��] ^
roleName
��_ g
)
��g h
,
��h i
(
��j k
Int32
��k p
)
��p q
HttpStatusCode
��q 
.�� �
OK��� �
)��� �
;��� �
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
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
ex
��` b
.
��b c
InnerException
��c q
?
��q r
.
��r s
Message
��s z
)
��z {
;
��{ |
}
�� 
}
�� 	
[
�� 	
HttpGet
��	 
(
�� 
$str
�� 8
)
��8 9
]
��9 :
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' ("
GetGlobalAuditFields
��) =
(
��= >
int
��> A
id
��B D
,
��D E
string
��F L
	tablename
��M V
)
��V W
{
�� 	
try
�� 
{
�� 
var
�� 
_user
�� 
=
�� 
await
�� ! 
_MasterUserService
��" 4
.
��4 5"
GetGlobalAuditFields
��5 I
(
��I J
id
��J L
,
��L M
	tablename
��N W
)
��W X
;
��X Y
return
�� 
_ObjectResponse
�� &
.
��& '

CreateData
��' 1
(
��1 2
_user
��2 7
,
��7 8
(
��9 :
Int32
��: ?
)
��? @
HttpStatusCode
��@ N
.
��N O
OK
��O Q
)
��Q R
;
��R S
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
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
ex
��` b
.
��b c
InnerException
��c q
?
��q r
.
��r s
Message
��s z
)
��z {
;
��{ |
}
�� 
}
�� 	
[
�� 	
HttpGet
��	 
(
�� 
$str
�� !
)
��! "
]
��" #
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
GetAllUserList
��) 7
(
��7 8
)
��8 9
{
�� 	
try
�� 
{
�� 
return
�� 
_ObjectResponse
�� &
.
��& '

CreateData
��' 1
(
��1 2
await
��2 7 
_MasterUserService
��8 J
.
��J K
GetAllUserList
��K Y
(
��Y Z
)
��Z [
,
��[ \
(
��] ^
Int32
��^ c
)
��c d
HttpStatusCode
��d r
.
��r s
OK
��s u
)
��u v
;
��v w
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
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
ex
��` b
.
��b c
InnerException
��c q
?
��q r
.
��r s
Message
��s z
)
��z {
;
��{ |
}
�� 
}
�� 	
[
�� 	

HttpDelete
��	 
(
�� 
$str
�� )
)
��) *
]
��* +
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
DeleteDocument
��) 7
(
��7 8
[
��8 9
	FromRoute
��9 B
]
��B C
int
��D G
id
��H J
)
��J K
{
�� 	
try
�� 
{
�� 
DBOperation
�� 
	oResponse
�� %
=
��& '
await
��( - 
_MasterUserService
��. @
.
��@ A
DeleteDocument
��A O
(
��O P
id
��P R
)
��R S
;
��S T
if
�� 
(
�� 
	oResponse
�� 
==
��  
DBOperation
��! ,
.
��, -
Success
��- 4
)
��4 5
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
true
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N
OK
��N P
,
��P Q
AppConstants
��R ^
.
��^ _
DeleteSuccess
��_ l
)
��l m
;
��m n
else
�� 
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
null
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N

BadRequest
��N X
,
��X Y
AppConstants
��Z f
.
��f g
NoRecordFound
��g t
)
��t u
;
��u v
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
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
ex
��` b
.
��b c
InnerException
��c q
?
��q r
.
��r s
Message
��s z
)
��z {
;
��{ |
}
�� 
}
�� 	
[
�� 	
HttpGet
��	 
(
�� 
$str
�� "
)
��" #
]
��# $
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
CheckEmailExist
��) 8
(
��8 9
string
��: @
email
��A F
,
��G H
int
��H K
?
��K L
userid
��M S
)
��S T
{
�� 	
try
�� 
{
�� 
bool
�� 
	oResponse
�� 
=
��  
await
��! & 
_MasterUserService
��' 9
.
��9 :
IsEmailExists
��: G
(
��G H
email
��H M
,
��M N
userid
��O U
)
��U V
;
��V W
if
�� 
(
�� 
	oResponse
�� 
==
��  
true
��! %
)
��% &
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
true
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N
OK
��N P
,
��P Q
AppConstants
��R ^
.
��^ _"
DuplicateRecordFound
��_ s
)
��s t
;
��t u
else
�� 
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
null
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N

BadRequest
��N X
,
��X Y
AppConstants
��Z f
.
��f g
NoRecordFound
��g t
)
��t u
;
��u v
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
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
ex
��` b
.
��b c
InnerException
��c q
?
��q r
.
��r s
Message
��s z
)
��z {
;
��{ |
}
�� 
}
�� 	
}
�� 
}�� �U
RD:\EltizamLive\Eltizam.WebApi\src\API\Controllers\MasterValuationFeesController.cs
	namespace 	
Eltizam
 
. 
WebApi 
. 
Controllers $
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
Route 

(
 
$str 3
)3 4
]4 5
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class )
MasterValuationFeesController .
:/ 0
ControllerBase1 ?
{ 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
private 
readonly 
IResponseHandler )
<) *
dynamic* 1
>1 2
_ObjectResponse3 B
;B C
private 
	Microsoft 
. 

Extensions $
.$ %
Hosting% ,
., -
IHostingEnvironment- @
_envA E
;E F
private 
readonly 
IExceptionService *
_ExceptionService+ <
;< =
private 
readonly '
IMasterValuationFeesService 4!
_ValuationFeesService5 J
;J K
public   )
MasterValuationFeesController   ,
(  , -
IConfiguration  - ;
configuration  < I
,  I J
IResponseHandler  K [
<  [ \
dynamic  \ c
>  c d
ObjectResponse  e s
,  s t
IExceptionService	  u �
exceptionService
  � �
,
  � �)
IMasterValuationFeesService
  � �"
ValuationFeesService
  � �
)
  � �
{!! 	
_configuration"" 
="" 
configuration"" *
;""* +
_ObjectResponse## 
=## 
ObjectResponse## ,
;##, -
_ExceptionService%% 
=%% 
exceptionService%%  0
;%%0 1!
_ValuationFeesService&& !
=&&" # 
ValuationFeesService&&$ 8
;&&8 9
}'' 	
[;; 	
HttpPost;;	 
,;; 
Route;; 
(;; 
$str;; !
);;! "
];;" #
public<< 
async<< 
Task<< 
<<< 
IActionResult<< '
><<' (
GetAll<<) /
(<</ 0
[<<0 1
FromForm<<1 9
]<<9 :"
DataTableAjaxPostModel<<; Q
model<<R W
)<<W X
{== 	
try>> 
{?? 
return@@ 
_ObjectResponse@@ &
.@@& '

CreateData@@' 1
(@@1 2
await@@2 7!
_ValuationFeesService@@8 M
.@@M N
GetAll@@N T
(@@T U
model@@U Z
)@@Z [
,@@[ \
(@@] ^
Int32@@^ c
)@@c d
HttpStatusCode@@d r
.@@r s
OK@@s u
)@@u v
;@@v w
}AA 
catchBB 
(BB 
	ExceptionBB 
exBB 
)BB  
{CC 
returnDD 
_ObjectResponseDD &
.DD& '
CreateDD' -
(DD- .
falseDD. 3
,DD3 4
(DD5 6
Int32DD6 ;
)DD; <
HttpStatusCodeDD< J
.DDJ K
InternalServerErrorDDK ^
,DD^ _
ConvertDD` g
.DDg h
ToStringDDh p
(DDp q
exDDq s
.DDs t

StackTraceDDt ~
)DD~ 
)	DD �
;
DD� �
}EE 
}FF 	
[[[ 	
HttpGet[[	 
,[[ 
Route[[ 
([[ 
$str[[ &
)[[& '
][[' (
public\\ 
async\\ 
Task\\ 
<\\ 
IActionResult\\ '
>\\' (
GetById\\) 0
(\\0 1
[\\1 2
	FromRoute\\2 ;
]\\; <
int\\= @
id\\A C
)\\C D
{]] 	
try^^ 
{__ 
var``  
oValuationFeesEntity`` (
=``) *
await``+ 0!
_ValuationFeesService``1 F
.``F G
GetById``G N
(``N O
id``O Q
)``Q R
;``R S
ifaa 
(aa  
oValuationFeesEntityaa (
!=aa) +
nullaa, 0
&&aa1 3 
oValuationFeesEntityaa4 H
.aaH I
IdaaI K
>aaL M
$numaaN O
)aaO P
returnbb 
_ObjectResponsebb *
.bb* +
Createbb+ 1
(bb1 2 
oValuationFeesEntitybb2 F
,bbF G
(bbH I
Int32bbI N
)bbN O
HttpStatusCodebbO ]
.bb] ^
OKbb^ `
)bb` a
;bba b
elsecc 
returndd 
_ObjectResponsedd *
.dd* +
Createdd+ 1
(dd1 2
nulldd2 6
,dd6 7
(dd8 9
Int32dd9 >
)dd> ?
HttpStatusCodedd? M
.ddM N

BadRequestddN X
,ddX Y
AppConstantsddZ f
.ddf g
NoRecordFoundddg t
)ddt u
;ddu v
}ee 
catchff 
(ff 
	Exceptionff 
exff 
)ff  
{gg 
returnhh 
_ObjectResponsehh &
.hh& '
Createhh' -
(hh- .
falsehh. 3
,hh3 4
(hh5 6
Int32hh6 ;
)hh; <
HttpStatusCodehh< J
.hhJ K
InternalServerErrorhhK ^
,hh^ _
Converthh` g
.hhg h
ToStringhhh p
(hhp q
exhhq s
.hhs t

StackTracehht ~
)hh~ 
)	hh �
;
hh� �
}ii 
}jj 	
[mm 	
HttpPostmm	 
]mm 
[nn 	
Routenn	 
(nn 
$strnn 
)nn 
]nn 
publicoo 
asyncoo 
Taskoo 
<oo 
IActionResultoo '
>oo' (
Upsertoo) /
(oo/ 0$
MasterValuationFeesModeloo0 H
oValuationFeesooI W
)ooW X
{pp 	
tryqq 
{rr 
DBOperationss 
	oResponsess %
=ss& '
awaitss( -!
_ValuationFeesServicess. C
.ssC D
UpsertssD J
(ssJ K
oValuationFeesssK Y
)ssY Z
;ssZ [
iftt 
(tt 
	oResponsett 
==tt  
DBOperationtt! ,
.tt, -
Successtt- 4
)tt4 5
{uu 
returnvv 
_ObjectResponsevv *
.vv* +
Createvv+ 1
(vv1 2
truevv2 6
,vv6 7
(vv8 9
Int32vv9 >
)vv> ?
HttpStatusCodevv? M
.vvM N
OKvvN P
,vvP Q
(vvR S
oValuationFeesvvS a
.vva b
Idvvb d
>vve f
$numvvg h
?vvi j
AppConstantsvvk w
.vvw x
UpdateSuccess	vvx �
:
vv� �
AppConstants
vv� �
.
vv� �
InsertSuccess
vv� �
)
vv� �
)
vv� �
;
vv� �
}ww 
elsexx 
returnyy 
_ObjectResponseyy *
.yy* +
Createyy+ 1
(yy1 2
falseyy2 7
,yy7 8
(yy9 :
Int32yy: ?
)yy? @
HttpStatusCodeyy@ N
.yyN O

BadRequestyyO Y
,yyY Z
(yy[ \
	oResponseyy\ e
==yyf h
DBOperationyyi t
.yyt u
NotFoundyyu }
?yy~ 
AppConstants
yy� �
.
yy� �
NoRecordFound
yy� �
:
yy� �
AppConstants
yy� �
.
yy� �

BadRequest
yy� �
)
yy� �
)
yy� �
;
yy� �
}zz 
catch{{ 
({{ 
	Exception{{ 
ex{{ 
){{  
{|| 
return}} 
_ObjectResponse}} &
.}}& '
Create}}' -
(}}- .
false}}. 3
,}}3 4
(}}5 6
Int32}}6 ;
)}}; <
HttpStatusCode}}< J
.}}J K
InternalServerError}}K ^
,}}^ _
Convert}}` g
.}}g h
ToString}}h p
(}}p q
ex}}q s
.}}s t

StackTrace}}t ~
)}}~ 
)	}} �
;
}}� �
}~~ 
} 	
[
�� 	

HttpDelete
��	 
(
�� 
$str
�� !
)
��! "
]
��" #
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
Delete
��) /
(
��/ 0
[
��0 1
	FromRoute
��1 :
]
��: ;
int
��< ?
id
��@ B
,
��B C
int
��C F
?
��F G
by
��H J
)
��J K
{
�� 	
try
�� 
{
�� 
DBOperation
�� 
	oResponse
�� %
=
��& '
await
��( -#
_ValuationFeesService
��. C
.
��C D
Delete
��D J
(
��J K
id
��K M
,
��M N
by
��N P
)
��P Q
;
��Q R
if
�� 
(
�� 
	oResponse
�� 
==
��  
DBOperation
��! ,
.
��, -
Success
��- 4
)
��4 5
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
true
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N
OK
��N P
,
��P Q
AppConstants
��R ^
.
��^ _
DeleteSuccess
��_ l
)
��l m
;
��m n
else
�� 
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
null
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N

BadRequest
��N X
,
��X Y
AppConstants
��Z f
.
��f g
NoRecordFound
��g t
)
��t u
;
��u v
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
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
Convert
��` g
.
��g h
ToString
��h p
(
��p q
ex
��q s
.
��s t

StackTrace
��t ~
)
��~ 
)�� �
;��� �
}
�� 
}
�� 	
}
�� 
}�� �d
UD:\EltizamLive\Eltizam.WebApi\src\API\Controllers\MasterValuationFeeTypeController.cs
	namespace 	
Eltizam
 
. 
WebApi 
. 
Controllers $
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
Route 

(
 
$str 3
)3 4
]4 5
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class ,
 MasterValuationFeeTypeController 1
:2 3
ControllerBase4 B
{ 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
private 
readonly 
IResponseHandler )
<) *
dynamic* 1
>1 2
_ObjectResponse3 B
;B C
private 
	Microsoft 
. 

Extensions $
.$ %
Hosting% ,
., -
IHostingEnvironment- @
_envA E
;E F
private 
readonly 
IExceptionService *
_ExceptionService+ <
;< =
private 
readonly *
IMasterValuationFeeTypeService 7$
_ValuationFeeTypeService8 P
;P Q
public   ,
 MasterValuationFeeTypeController   /
(  / 0
IConfiguration  0 >
configuration  ? L
,  L M
IResponseHandler  N ^
<  ^ _
dynamic  _ f
>  f g
ObjectResponse  h v
,  v w
IExceptionService	  x �
exceptionService
  � �
,
  � �,
IMasterValuationFeeTypeService
  � �%
ValuationFeeTypeService
  � �
)
  � �
{!! 	
_configuration"" 
="" 
configuration"" *
;""* +
_ObjectResponse## 
=## 
ObjectResponse## ,
;##, -
_ExceptionService%% 
=%% 
exceptionService%%  0
;%%0 1$
_ValuationFeeTypeService&& $
=&&% &#
ValuationFeeTypeService&&' >
;&&> ?
}'' 	
[;; 	
HttpPost;;	 
,;; 
Route;; 
(;; 
$str;; !
);;! "
];;" #
public<< 
async<< 
Task<< 
<<< 
IActionResult<< '
><<' (
GetAll<<) /
(<</ 0
[<<0 1
FromForm<<1 9
]<<9 :"
DataTableAjaxPostModel<<; Q
model<<R W
)<<W X
{== 	
try>> 
{?? 
return@@ 
_ObjectResponse@@ &
.@@& '

CreateData@@' 1
(@@1 2
await@@2 7$
_ValuationFeeTypeService@@8 P
.@@P Q
GetAll@@Q W
(@@W X
model@@X ]
)@@] ^
,@@^ _
(@@` a
Int32@@a f
)@@f g
HttpStatusCode@@g u
.@@u v
OK@@v x
)@@x y
;@@y z
}AA 
catchBB 
(BB 
	ExceptionBB 
exBB 
)BB  
{CC 
returnDD 
_ObjectResponseDD &
.DD& '
CreateDD' -
(DD- .
falseDD. 3
,DD3 4
(DD5 6
Int32DD6 ;
)DD; <
HttpStatusCodeDD< J
.DDJ K
InternalServerErrorDDK ^
,DD^ _
ConvertDD` g
.DDg h
ToStringDDh p
(DDp q
exDDq s
.DDs t

StackTraceDDt ~
)DD~ 
)	DD �
;
DD� �
}EE 
}FF 	
[HH 	
HttpGetHH	 
,HH 
RouteHH 
(HH 
$strHH 0
)HH0 1
]HH1 2
publicII 
asyncII 
TaskII 
<II 
IActionResultII '
>II' ("
GetAllValuationFeeTypeII) ?
(II? @
)II@ A
{JJ 	
tryKK 
{LL 
varMM 
	oRoleListMM 
=MM 
awaitMM  %$
_ValuationFeeTypeServiceMM& >
.MM> ?"
GetAllValuationFeeTypeMM? U
(MMU V
)MMV W
;MMW X
ifNN 
(NN 
	oRoleListNN 
!=NN  
nullNN! %
)NN% &
returnOO 
_ObjectResponseOO *
.OO* +

CreateDataOO+ 5
(OO5 6
	oRoleListOO6 ?
,OO? @
(OOA B
Int32OOB G
)OOG H
HttpStatusCodeOOH V
.OOV W
OKOOW Y
)OOY Z
;OOZ [
elsePP 
returnQQ 
_ObjectResponseQQ *
.QQ* +
CreateQQ+ 1
(QQ1 2
nullQQ2 6
,QQ6 7
(QQ8 9
Int32QQ9 >
)QQ> ?
HttpStatusCodeQQ? M
.QQM N

BadRequestQQN X
,QQX Y
AppConstantsQQZ f
.QQf g
NoRecordFoundQQg t
)QQt u
;QQu v
}RR 
catchSS 
(SS 
	ExceptionSS 
exSS 
)SS  
{TT 
returnUU 
_ObjectResponseUU &
.UU& '
CreateUU' -
(UU- .
falseUU. 3
,UU3 4
(UU5 6
Int32UU6 ;
)UU; <
HttpStatusCodeUU< J
.UUJ K
InternalServerErrorUUK ^
,UU^ _
ConvertUU` g
.UUg h
ToStringUUh p
(UUp q
exUUq s
.UUs t

StackTraceUUt ~
)UU~ 
)	UU �
;
UU� �
}VV 
}WW 	
[ZZ 	
HttpGetZZ	 
,ZZ 
RouteZZ 
(ZZ 
$strZZ &
)ZZ& '
]ZZ' (
public[[ 
async[[ 
Task[[ 
<[[ 
IActionResult[[ '
>[[' (
GetById[[) 0
([[0 1
[[[1 2
	FromRoute[[2 ;
][[; <
int[[= @
id[[A C
)[[C D
{\\ 	
try]] 
{^^ 
var__ #
oValuationFeeTypeEntity__ +
=__, -
await__. 3$
_ValuationFeeTypeService__4 L
.__L M
GetById__M T
(__T U
id__U W
)__W X
;__X Y
if`` 
(`` #
oValuationFeeTypeEntity`` +
!=``, .
null``/ 3
&&``4 6#
oValuationFeeTypeEntity``7 N
.``N O
Id``O Q
>``R S
$num``T U
)``U V
returnaa 
_ObjectResponseaa *
.aa* +
Createaa+ 1
(aa1 2#
oValuationFeeTypeEntityaa2 I
,aaI J
(aaK L
Int32aaL Q
)aaQ R
HttpStatusCodeaaR `
.aa` a
OKaaa c
)aac d
;aad e
elsebb 
returncc 
_ObjectResponsecc *
.cc* +
Createcc+ 1
(cc1 2
nullcc2 6
,cc6 7
(cc8 9
Int32cc9 >
)cc> ?
HttpStatusCodecc? M
.ccM N

BadRequestccN X
,ccX Y
AppConstantsccZ f
.ccf g
NoRecordFoundccg t
)cct u
;ccu v
}dd 
catchee 
(ee 
	Exceptionee 
exee 
)ee  
{ff 
returngg 
_ObjectResponsegg &
.gg& '
Creategg' -
(gg- .
falsegg. 3
,gg3 4
(gg5 6
Int32gg6 ;
)gg; <
HttpStatusCodegg< J
.ggJ K
InternalServerErrorggK ^
,gg^ _
Convertgg` g
.ggg h
ToStringggh p
(ggp q
exggq s
.ggs t

StackTraceggt ~
)gg~ 
)	gg �
;
gg� �
}hh 
}ii 	
[ll 	
HttpPostll	 
]ll 
[mm 	
Routemm	 
(mm 
$strmm 
)mm 
]mm 
publicnn 
asyncnn 
Tasknn 
<nn 
IActionResultnn '
>nn' (
Upsertnn) /
(nn/ 0'
MasterValuationFeeTypeModelnn0 K
oValuationFeeTypennL ]
)nn] ^
{oo 	
trypp 
{qq 
DBOperationrr 
	oResponserr %
=rr& '
awaitrr( -$
_ValuationFeeTypeServicerr. F
.rrF G
UpsertrrG M
(rrM N
oValuationFeeTyperrN _
)rr_ `
;rr` a
ifss 
(ss 
	oResponsess 
==ss  
DBOperationss! ,
.ss, -
Successss- 4
)ss4 5
{tt 
returnuu 
_ObjectResponseuu *
.uu* +
Createuu+ 1
(uu1 2
trueuu2 6
,uu6 7
(uu8 9
Int32uu9 >
)uu> ?
HttpStatusCodeuu? M
.uuM N
OKuuN P
,uuP Q
(uuR S
oValuationFeeTypeuuS d
.uud e
Iduue g
>uuh i
$numuuj k
?uul m
AppConstantsuun z
.uuz {
UpdateSuccess	uu{ �
:
uu� �
AppConstants
uu� �
.
uu� �
InsertSuccess
uu� �
)
uu� �
)
uu� �
;
uu� �
}vv 
elseww 
returnxx 
_ObjectResponsexx *
.xx* +
Createxx+ 1
(xx1 2
falsexx2 7
,xx7 8
(xx9 :
Int32xx: ?
)xx? @
HttpStatusCodexx@ N
.xxN O

BadRequestxxO Y
,xxY Z
(xx[ \
	oResponsexx\ e
==xxf h
DBOperationxxi t
.xxt u
NotFoundxxu }
?xx~ 
AppConstants
xx� �
.
xx� �
NoRecordFound
xx� �
:
xx� �
AppConstants
xx� �
.
xx� �

BadRequest
xx� �
)
xx� �
)
xx� �
;
xx� �
}yy 
catchzz 
(zz 
	Exceptionzz 
exzz 
)zz  
{{{ 
return|| 
_ObjectResponse|| &
.||& '
Create||' -
(||- .
false||. 3
,||3 4
(||5 6
Int32||6 ;
)||; <
HttpStatusCode||< J
.||J K
InternalServerError||K ^
,||^ _
Convert||` g
.||g h
ToString||h p
(||p q
ex||q s
.||s t

StackTrace||t ~
)||~ 
)	|| �
;
||� �
}}} 
}~~ 	
[
�� 	

HttpDelete
��	 
(
�� 
$str
�� !
)
��! "
]
��" #
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
Delete
��) /
(
��/ 0
[
��0 1
	FromRoute
��1 :
]
��: ;
int
��< ?
id
��@ B
)
��B C
{
�� 	
try
�� 
{
�� 
DBOperation
�� 
	oResponse
�� %
=
��& '
await
��( -&
_ValuationFeeTypeService
��. F
.
��F G
Delete
��G M
(
��M N
id
��N P
)
��P Q
;
��Q R
if
�� 
(
�� 
	oResponse
�� 
==
��  
DBOperation
��! ,
.
��, -
Success
��- 4
)
��4 5
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
true
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N
OK
��N P
,
��P Q
AppConstants
��R ^
.
��^ _
DeleteSuccess
��_ l
)
��l m
;
��m n
else
�� 
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
null
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N

BadRequest
��N X
,
��X Y
AppConstants
��Z f
.
��f g
NoRecordFound
��g t
)
��t u
;
��u v
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
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
Convert
��` g
.
��g h
ToString
��h p
(
��p q
ex
��q s
.
��s t

StackTrace
��t ~
)
��~ 
)�� �
;��� �
}
�� 
}
�� 	
}
�� 
}�� �P
KD:\EltizamLive\Eltizam.WebApi\src\API\Controllers\MasterVendorController.cs
	namespace

 	
Eltizam


 
.

 
WebApi

 
.

 
Controllers

 $
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
Route 

(
 
$str 3
)3 4
]4 5
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class "
MasterVendorController '
:( )
ControllerBase* 8
{ 
private 
readonly  
IMasterVendorService -
_vendorServices. =
;= >
private 
readonly 
IResponseHandler )
<) *
dynamic* 1
>1 2
_ObjectResponse3 B
;B C
private 
readonly 
IExceptionService *
_ExceptionService+ <
;< =
IExceptionService 
exceptionService *
;* +
public "
MasterVendorController %
(% & 
IMasterVendorService& :
vendorServices; I
,I J
IResponseHandlerK [
<[ \
dynamic\ c
>c d
ObjectResponsee s
)s t
{ 	
_vendorServices 
= 
vendorServices ,
;, -
_ObjectResponse 
= 
ObjectResponse ,
;, -
_ExceptionService 
= 
exceptionService  0
;0 1
} 	
[## 	
HttpPost##	 
]## 
[$$ 	
Route$$	 
($$ 
$str$$ 
)$$ 
]$$ 
public%% 
async%% 
Task%% 
<%% 
IActionResult%% '
>%%' (
Upsert%%) /
(%%/ 0
MasterVendorModel%%0 A
vendor%%B H
)%%H I
{&& 	
try'' 
{(( 
DBOperation)) 
	oResponse)) %
=))& '
await))( -
_vendorServices)). =
.))= >!
AddUpdateMasterVendor))> S
())S T
vendor))T Z
)))Z [
;))[ \
if** 
(** 
	oResponse** 
==**  
DBOperation**! ,
.**, -
Success**- 4
)**4 5
{++ 
return,, 
_ObjectResponse,, *
.,,* +
Create,,+ 1
(,,1 2
true,,2 6
,,,6 7
(,,8 9
Int32,,9 >
),,> ?
HttpStatusCode,,? M
.,,M N
OK,,N P
,,,P Q
(,,R S
vendor,,S Y
.,,Y Z
Id,,Z \
>,,] ^
$num,,_ `
?,,a b
AppConstants,,c o
.,,o p
UpdateSuccess,,p }
:,,~ 
AppConstants
,,� �
.
,,� �
InsertSuccess
,,� �
)
,,� �
)
,,� �
;
,,� �
}-- 
else.. 
return// 
_ObjectResponse// *
.//* +
Create//+ 1
(//1 2
false//2 7
,//7 8
(//9 :
Int32//: ?
)//? @
HttpStatusCode//@ N
.//N O

BadRequest//O Y
,//Y Z
(//[ \
	oResponse//\ e
==//f h
DBOperation//i t
.//t u
NotFound//u }
?//~ 
AppConstants
//� �
.
//� �
NoRecordFound
//� �
:
//� �
AppConstants
//� �
.
//� �

BadRequest
//� �
)
//� �
)
//� �
;
//� �
}00 
catch11 
(11 
	Exception11 
ex11 
)11  
{22 
return33 
_ObjectResponse33 &
.33& '
Create33' -
(33- .
false33. 3
,333 4
(335 6
Int32336 ;
)33; <
HttpStatusCode33< J
.33J K
InternalServerError33K ^
,33^ _
Convert33` g
.33g h
ToString33h p
(33p q
ex33q s
.33s t

StackTrace33t ~
)33~ 
)	33 �
;
33� �
}44 
}55 	
[77 	
HttpGet77	 
]77 
[88 	
Route88	 
(88 
$str88 
)88 
]88 
public99 
async99 
Task99 
<99 
IActionResult99 '
>99' (
GetMasterVendorById99) <
(99< =
[99= >
	FromRoute99> G
]99G H
int99I L
id99M O
)99O P
{:: 	
try;; 
{<< 
var== 
masterVendor==  
===! "
await==# (
_vendorServices==) 8
.==8 9$
GetMasterVendorByIdAsync==9 Q
(==Q R
id==R T
)==T U
;==U V
if?? 
(?? 
masterVendor??  
!=??! #
null??$ (
&&??) +
masterVendor??, 8
.??8 9
Id??9 ;
>??< =
$num??> ?
)??? @
{@@ 
returnBB 
_ObjectResponseBB *
.BB* +
CreateBB+ 1
(BB1 2
masterVendorBB2 >
,BB> ?
(BB@ A
intBBA D
)BBD E
HttpStatusCodeBBE S
.BBS T
OKBBT V
)BBV W
;BBW X
}CC 
elseDD 
{EE 
returnFF 
_ObjectResponseFF *
.FF* +
CreateFF+ 1
(FF1 2
nullFF2 6
,FF6 7
(FF8 9
intFF9 <
)FF< =
HttpStatusCodeFF= K
.FFK L

BadRequestFFL V
,FFV W
AppConstantsFFX d
.FFd e
NoRecordFoundFFe r
)FFr s
;FFs t
}GG 
}HH 
catchII 
(II 
	ExceptionII 
exII 
)II  
{JJ 
returnKK 
_ObjectResponseKK &
.KK& '
CreateKK' -
(KK- .
nullKK. 2
,KK2 3
(KK4 5
intKK5 8
)KK8 9
HttpStatusCodeKK9 G
.KKG H
InternalServerErrorKKH [
,KK[ \
ConvertKK] d
.KKd e
ToStringKKe m
(KKm n
exKKn p
.KKp q

StackTraceKKq {
)KK{ |
)KK| }
;KK} ~
}LL 
}MM 	
[PP 	
HttpPostPP	 
,PP 
RoutePP 
(PP 
$strPP !
)PP! "
]PP" #
publicQQ 
asyncQQ 
TaskQQ 
<QQ 
IActionResultQQ '
>QQ' (
GetAllQQ) /
(QQ/ 0
[QQ0 1
FromFormQQ1 9
]QQ9 :"
DataTableAjaxPostModelQQ; Q
modelQQR W
)QQW X
{RR 	
trySS 
{TT 
returnUU 
_ObjectResponseUU &
.UU& '

CreateDataUU' 1
(UU1 2
awaitUU2 7
_vendorServicesUU8 G
.UUG H
GetAllUUH N
(UUN O
modelUUO T
)UUT U
,UUU V
(UUW X
Int32UUX ]
)UU] ^
HttpStatusCodeUU^ l
.UUl m
OKUUm o
)UUo p
;UUp q
}VV 
catchWW 
(WW 
	ExceptionWW 
exWW 
)WW  
{XX 
returnYY 
_ObjectResponseYY &
.YY& '
CreateYY' -
(YY- .
falseYY. 3
,YY3 4
(YY5 6
Int32YY6 ;
)YY; <
HttpStatusCodeYY< J
.YYJ K
InternalServerErrorYYK ^
,YY^ _
ConvertYY` g
.YYg h
ToStringYYh p
(YYp q
exYYq s
.YYs t

StackTraceYYt ~
)YY~ 
)	YY �
;
YY� �
}ZZ 
}[[ 	
[]] 	
HttpPost]]	 
(]] 
$str]] 
)]]  
]]]  !
public^^ 
async^^ 
Task^^ 
<^^ 
IActionResult^^ '
>^^' (
Delete^^) /
(^^/ 0
[^^0 1
	FromRoute^^1 :
]^^: ;
int^^< ?
id^^@ B
,^^B C
int^^C F
?^^F G
by^^H J
)^^J K
{__ 	
try`` 
{aa 
DBOperationbb 
	oResponsebb %
=bb& '
awaitbb( -
_vendorServicesbb. =
.bb= >
DeleteVendorbb> J
(bbJ K
idbbK M
,bbM N
bybbN P
)bbP Q
;bbQ R
ifcc 
(cc 
	oResponsecc 
==cc  
DBOperationcc! ,
.cc, -
Successcc- 4
)cc4 5
returndd 
_ObjectResponsedd *
.dd* +
Createdd+ 1
(dd1 2
truedd2 6
,dd6 7
(dd8 9
Int32dd9 >
)dd> ?
HttpStatusCodedd? M
.ddM N
OKddN P
,ddP Q
AppConstantsddR ^
.dd^ _
DeleteSuccessdd_ l
)ddl m
;ddm n
elseee 
returnff 
_ObjectResponseff *
.ff* +
Createff+ 1
(ff1 2
nullff2 6
,ff6 7
(ff8 9
Int32ff9 >
)ff> ?
HttpStatusCodeff? M
.ffM N

BadRequestffN X
,ffX Y
AppConstantsffZ f
.fff g
NoRecordFoundffg t
)fft u
;ffu v
}gg 
catchhh 
(hh 
	Exceptionhh 
exhh 
)hh  
{ii 
awaitjj 
_ExceptionServicejj '
.jj' (
LogExceptionjj( 4
(jj4 5
exjj5 7
)jj7 8
;jj8 9
returnkk 
_ObjectResponsekk &
.kk& '
Createkk' -
(kk- .
falsekk. 3
,kk3 4
(kk5 6
Int32kk6 ;
)kk; <
HttpStatusCodekk< J
.kkJ K
InternalServerErrorkkK ^
,kk^ _
Convertkk` g
.kkg h
ToStringkkh p
(kkp q
exkkq s
.kks t

StackTracekkt ~
)kk~ 
)	kk �
;
kk� �
}ll 
}mm 	
}oo 
}pp �U
KD:\EltizamLive\Eltizam.WebApi\src\API\Controllers\NotificationController.cs
	namespace

 	
EltizamValuation


 
.

 
WebApi

 !
.

! "
Controllers

" -
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
Route 

(
 
$str 3
)3 4
]4 5
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class "
NotificationController '
:( )
ControllerBase* 8
{ 
private 
readonly 
IResponseHandler )
<) *
dynamic* 1
>1 2
_ObjectResponse3 B
;B C
private 
readonly 
IExceptionService *
_ExceptionService+ <
;< =
private 
readonly &
IMasterNotificationService 3 
_notificationService4 H
;H I
public "
NotificationController %
(% &
IResponseHandler& 6
<6 7
dynamic7 >
>> ?
ObjectResponse@ N
,N O
IExceptionServiceP a
exceptionServiceb r
,r s'
IMasterNotificationService	t �!
notificationService
� �
)
� �
{ 	
_ObjectResponse 
= 
ObjectResponse ,
;, -
_ExceptionService 
= 
exceptionService  0
;0 1 
_notificationService  
=! "
notificationService# 6
;6 7
} 	
[ 	
HttpPost	 
( 
$str (
)( )
]) *
public 
async 
Task 
< 
IActionResult '
>' ( 
SendNotificationMail) =
(= >!
SendNotificationModel> S
requestT [
,[ \
int\ _
valuationrequestId` r
,r s
ints v
?v w
statusId	x �
)
� �
{   	
try!! 
{"" 
request## 
.## 
ValId## 
=## 
valuationrequestId##  2
;##2 3
request##4 ;
.##; <
StatusId##< D
=##E F
statusId##G O
;##O P
DBOperation%% 
	oResponse%% %
=%%& '
await%%( - 
_notificationService%%. B
.%%B C
	SendEmail%%C L
(%%L M
request%%M T
)%%T U
;%%U V
if'' 
('' 
	oResponse'' 
==''  
DBOperation''! ,
.'', -
Success''- 4
)''4 5
{(( 
return)) 
_ObjectResponse)) *
.))* +
Create))+ 1
())1 2
true))2 6
,))6 7
())8 9
Int32))9 >
)))> ?
HttpStatusCode))? M
.))M N
OK))N P
,))P Q
())R S
AppConstants))S _
.))_ `
InsertSuccess))` m
)))m n
)))n o
;))o p
}** 
else++ 
return,, 
_ObjectResponse,, *
.,,* +
Create,,+ 1
(,,1 2
false,,2 7
,,,7 8
(,,9 :
Int32,,: ?
),,? @
HttpStatusCode,,@ N
.,,N O

BadRequest,,O Y
,,,Y Z
(,,[ \
	oResponse,,\ e
==,,f h
DBOperation,,i t
.,,t u
NotFound,,u }
?,,~ 
$str
,,� �
:
,,� �
AppConstants
,,� �
.
,,� �

BadRequest
,,� �
)
,,� �
)
,,� �
;
,,� �
}-- 
catch.. 
(.. 
ArgumentException.. $
ex..% '
)..' (
{// 
return00 

BadRequest00 !
(00! "
ex00" $
.00$ %
Message00% ,
)00, -
;00- .
}11 
catch22 
(22 
	Exception22 
ex22 
)22  
{33 
await44 
_ExceptionService44 '
.44' (
LogException44( 4
(444 5
ex445 7
)447 8
;448 9
return55 
_ObjectResponse55 &
.55& '
Create55' -
(55- .
false55. 3
,553 4
(555 6
Int32556 ;
)55; <
HttpStatusCode55< J
.55J K
InternalServerError55K ^
,55^ _
Convert55` g
.55g h
ToString55h p
(55p q
ex55q s
.55s t

StackTrace55t ~
)55~ 
)	55 �
;
55� �
}66 
}77 	
[99 	
HttpGet99	 
,99 
Route99 
(99 
$str99 -
)99- .
]99. /
public:: 
async:: 
Task:: 
<:: 
IActionResult:: '
>::' (
GetNotificationList::) <
(::< =
int::= @
userId::A G
,::G H
int::I L
?::L M
valId::N S
,::S T
int::U X
?::X Y
pagenum::Z a
)::a b
{;; 	
try<< 
{== 
return>> 
_ObjectResponse>> &
.>>& '

CreateData>>' 1
(>>1 2 
_notificationService>>2 F
.>>F G
GetAll>>G M
(>>M N
userId>>N T
,>>T U
valId>>V [
,>>[ \
pagenum>>] d
)>>d e
,>>e f
(>>g h
Int32>>h m
)>>m n
HttpStatusCode>>n |
.>>| }
OK>>} 
)	>> �
;
>>� �
}?? 
catch@@ 
(@@ 
	Exception@@ 
ex@@ 
)@@  
{AA 
returnBB 
_ObjectResponseBB &
.BB& '
CreateBB' -
(BB- .
falseBB. 3
,BB3 4
(BB5 6
Int32BB6 ;
)BB; <
HttpStatusCodeBB< J
.BBJ K
InternalServerErrorBBK ^
,BB^ _
ConvertBB` g
.BBg h
ToStringBBh p
(BBp q
exBBq s
.BBs t

StackTraceBBt ~
)BB~ 
)	BB �
;
BB� �
}CC 
}DD 	
[EE 	
HttpGetEE	 
,EE 
RouteEE 
(EE 
$strEE .
)EE. /
]EE/ 0
publicFF 
asyncFF 
TaskFF 
<FF 
IActionResultFF '
>FF' ( 
GetNotificationCountFF) =
(FF= >
intFF> A
userIdFFB H
,FFH I
intFFJ M
?FFM N
valIdFFO T
)FFT U
{GG 	
tryHH 
{II 
returnJJ 
_ObjectResponseJJ &
.JJ& '

CreateDataJJ' 1
(JJ1 2 
_notificationServiceJJ2 F
.JJF G
GetAllCountJJG R
(JJR S
userIdJJS Y
,JJY Z
valIdJJ[ `
)JJ` a
,JJa b
(JJc d
Int32JJd i
)JJi j
HttpStatusCodeJJj x
.JJx y
OKJJy {
)JJ{ |
;JJ| }
}KK 
catchLL 
(LL 
	ExceptionLL 
exLL 
)LL  
{MM 
returnNN 
_ObjectResponseNN &
.NN& '
CreateNN' -
(NN- .
falseNN. 3
,NN3 4
(NN5 6
Int32NN6 ;
)NN; <
HttpStatusCodeNN< J
.NNJ K
InternalServerErrorNNK ^
,NN^ _
ConvertNN` g
.NNg h
ToStringNNh p
(NNp q
exNNq s
.NNs t

StackTraceNNt ~
)NN~ 
)	NN �
;
NN� �
}OO 
}PP 	
[RR 	
HttpPostRR	 
(RR 
$strRR ,
)RR, -
]RR- .
publicTT 
asyncTT 
TaskTT 
<TT 
IActionResultTT '
>TT' ($
UpdateNotificationReadByTT) A
(TTA B
[TTB C
	FromQueryTTC L
]TTL M
intTTN Q
notificationidTTR `
,TT` a
[TTb c
	FromQueryTTc l
]TTl m
intTTn q
ReadByTTr x
)TTx y
{UU 	
tryVV 
{WW 
DBOperationXX 
	oResponseXX %
=XX& '
awaitXX( - 
_notificationServiceXX. B
.XXB C
UpdateNotificationXXC U
(XXU V
notificationidXXV d
,XXd e
ReadByXXf l
)XXl m
;XXm n
ifYY 
(YY 
	oResponseYY 
==YY  
DBOperationYY! ,
.YY, -
SuccessYY- 4
)YY4 5
{ZZ 
return[[ 
_ObjectResponse[[ *
.[[* +
Create[[+ 1
([[1 2
true[[2 6
,[[6 7
([[8 9
Int32[[9 >
)[[> ?
HttpStatusCode[[? M
.[[M N
OK[[N P
,[[P Q
([[R S
AppConstants[[S _
.[[_ `
InsertSuccess[[` m
)[[m n
)[[n o
;[[o p
}\\ 
else]] 
return^^ 
_ObjectResponse^^ *
.^^* +
Create^^+ 1
(^^1 2
false^^2 7
,^^7 8
(^^9 :
Int32^^: ?
)^^? @
HttpStatusCode^^@ N
.^^N O

BadRequest^^O Y
,^^Y Z
(^^[ \
	oResponse^^\ e
==^^f h
DBOperation^^i t
.^^t u
NotFound^^u }
?^^~ 
$str
^^� �
:
^^� �
AppConstants
^^� �
.
^^� �

BadRequest
^^� �
)
^^� �
)
^^� �
;
^^� �
}__ 
catch`` 
(`` 
ArgumentException`` $
ex``% '
)``' (
{aa 
returnbb 

BadRequestbb !
(bb! "
exbb" $
.bb$ %
Messagebb% ,
)bb, -
;bb- .
}cc 
catchdd 
(dd 
	Exceptiondd 
exdd 
)dd  
{ee 
awaitff 
_ExceptionServiceff '
.ff' (
LogExceptionff( 4
(ff4 5
exff5 7
)ff7 8
;ff8 9
returngg 
_ObjectResponsegg &
.gg& '
Creategg' -
(gg- .
falsegg. 3
,gg3 4
(gg5 6
Int32gg6 ;
)gg; <
HttpStatusCodegg< J
.ggJ K
InternalServerErrorggK ^
,gg^ _
Convertgg` g
.ggg h
ToStringggh p
(ggp q
exggq s
.ggs t

StackTraceggt ~
)gg~ 
)	gg �
;
gg� �
}hh 
}ii 	
}jj 
}kk �W
QD:\EltizamLive\Eltizam.WebApi\src\API\Controllers\TestMasterLocationController.cs
	namespace 	
Eltizam
 
. 
WebApi 
. 
Controllers $
{ 
[ 
Route 
( 
$str 
) 
] 
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
Route 
( 
$str 0
)0 1
]1 2
public 
class (
TestMasterLocationController *
:+ ,
ControllerBase- ;
{ 
private 	
readonly
 
IConfiguration !
_configuration" 0
;0 1
private 	
readonly
 
IResponseHandler #
<# $
dynamic$ +
>+ ,
_ObjectResponse- <
;< =
private 	
readonly
 
IStringLocalizer #
<# $
Errors$ *
>* +!
_stringLocalizerError, A
;A B
private 	
readonly
 
IExceptionService $
_ExceptionService% 6
;6 7
private 	
readonly
 "
IMasterLocationService )
_LocationService* :
;: ;
public!! (
TestMasterLocationController!!	 %
(!!% &
IConfiguration!!& 4
configuration!!5 B
,!!B C
IResponseHandler!!D T
<!!T U
dynamic!!U \
>!!\ ]
ObjectResponse!!^ l
,!!l m
IStringLocalizer!!n ~
<!!~ 
Errors	!! �
>
!!� �"
stringLocalizerError
!!� �
,
!!� �
IExceptionService
!!� �
exceptionService
!!� �
,
!!� �$
IMasterLocationService
!!� �
LocationService
!!� �
)
!!� �
{"" 
_configuration## 
=## 
configuration## !
;##! "
_ObjectResponse$$ 
=$$ 
ObjectResponse$$ #
;$$# $!
_stringLocalizerError%% 
=%%  
stringLocalizerError%% /
;%%/ 0
_ExceptionService&& 
=&& 
exceptionService&& '
;&&' (
_LocationService'' 
='' 
LocationService'' %
;''% &
}(( 
[== 
HttpPost== 
,== 
Route== 
(== 
$str== 
)== 
]== 
public>> 
async>>	 
Task>> 
<>> 
IActionResult>> !
>>>! "
GetAll>># )
(>>) *
[>>* +
FromForm>>+ 3
]>>3 4"
DataTableAjaxPostModel>>5 K
?>>K L
model>>M R
)>>R S
{?? 
try@@ 
{AA 
returnBB 

_ObjectResponseBB 
.BB 

CreateDataBB %
(BB% &
awaitBB& +
_LocationServiceBB, <
.BB< =
GetAllBB= C
(BBC D
modelBBD I
)BBI J
,BBJ K
(BBL M
Int32BBM R
)BBR S
HttpStatusCodeBBS a
.BBa b
OKBBb d
)BBd e
;BBe f
}CC 
catchDD 
(DD	 

	ExceptionDD
 
exDD 
)DD 
{EE 
returnFF 

_ObjectResponseFF 
.FF 
CreateFF !
(FF! "
falseFF" '
,FF' (
(FF) *
Int32FF* /
)FF/ 0
HttpStatusCodeFF0 >
.FF> ?
InternalServerErrorFF? R
,FFR S
ConvertFFT [
.FF[ \
ToStringFF\ d
(FFd e
exFFe g
.FFg h

StackTraceFFh r
)FFr s
)FFs t
;FFt u
}GG 
}HH 
[\\ 
HttpGet\\ 

,\\
 
Route\\ 
(\\ 
$str\\  
)\\  !
]\\! "
public]] 
async]]	 
Task]] 
<]] 
IActionResult]] !
>]]! "
GetById]]# *
(]]* +
[]]+ ,
	FromRoute]], 5
]]]5 6
int]]7 :
id]]; =
)]]= >
{^^ 
try__ 
{`` 
varaa 
oLocationEntityaa 
=aa 
awaitaa 
_LocationServiceaa  0
.aa0 1
GetByIdaa1 8
(aa8 9
idaa9 ;
)aa; <
;aa< =
ifbb 
(bb 
oLocationEntitybb 
!=bb 
nullbb 
&&bb  "
oLocationEntitybb# 2
.bb2 3
Idbb3 5
>bb6 7
$numbb8 9
)bb9 :
returncc 
_ObjectResponsecc 
.cc 
Createcc "
(cc" #
oLocationEntitycc# 2
,cc2 3
(cc4 5
Int32cc5 :
)cc: ;
HttpStatusCodecc; I
.ccI J
OKccJ L
)ccL M
;ccM N
elsedd 
returnee 
_ObjectResponseee 
.ee 
Createee "
(ee" #
nullee# '
,ee' (
(ee) *
Int32ee* /
)ee/ 0
HttpStatusCodeee0 >
.ee> ?

BadRequestee? I
,eeI J
AppConstantseeK W
.eeW X
NoRecordFoundeeX e
)eee f
;eef g
}ff 
catchgg 
(gg	 

	Exceptiongg
 
exgg 
)gg 
{hh 
returnii 

_ObjectResponseii 
.ii 
Createii !
(ii! "
falseii" '
,ii' (
(ii) *
Int32ii* /
)ii/ 0
HttpStatusCodeii0 >
.ii> ?
InternalServerErrorii? R
,iiR S
ConvertiiT [
.ii[ \
ToStringii\ d
(iid e
exiie g
.iig h

StackTraceiih r
)iir s
)iis t
;iit u
}jj 
}kk 
[nn 
HttpPostnn 
]nn 
[oo 
Routeoo 
(oo 	
$stroo	 
)oo 
]oo 
publicpp 
asyncpp	 
Taskpp 
<pp 
IActionResultpp !
>pp! "
Upsertpp# )
(pp) * 
MasterLocationEntitypp* >
	oLocationpp? H
)ppH I
{qq 
tryrr 
{ss 
DBOperationtt 
	oResponsett 
=tt 
awaittt !
_LocationServicett" 2
.tt2 3#
AddUpdateLocationClienttt3 J
(ttJ K
	oLocationttK T
)ttT U
;ttU V
ifuu 
(uu 
	oResponseuu 
==uu 
DBOperationuu  
.uu  !
Successuu! (
)uu( )
{vv 
returnww 
_ObjectResponseww 
.ww 
Createww "
(ww" #
trueww# '
,ww' (
(ww) *
Int32ww* /
)ww/ 0
HttpStatusCodeww0 >
.ww> ?
OKww? A
,wwA B
(wwC D
	oLocationwwD M
.wwM N
IdwwN P
>wwQ R
$numwwS T
?wwU V
AppConstantswwW c
.wwc d
UpdateSuccesswwd q
:wwr s
AppConstants	wwt �
.
ww� �
InsertSuccess
ww� �
)
ww� �
)
ww� �
;
ww� �
}xx 
elseyy 
returnzz 
_ObjectResponsezz 
.zz 
Createzz "
(zz" #
falsezz# (
,zz( )
(zz* +
Int32zz+ 0
)zz0 1
HttpStatusCodezz1 ?
.zz? @

BadRequestzz@ J
,zzJ K
(zzL M
	oResponsezzM V
==zzW Y
DBOperationzzZ e
.zze f
NotFoundzzf n
?zzo p
AppConstantszzq }
.zz} ~
NoRecordFound	zz~ �
:
zz� �
AppConstants
zz� �
.
zz� �

BadRequest
zz� �
)
zz� �
)
zz� �
;
zz� �
}{{ 
catch|| 
(||	 

	Exception||
 
ex|| 
)|| 
{}} 
return~~ 

_ObjectResponse~~ 
.~~ 
Create~~ !
(~~! "
false~~" '
,~~' (
(~~) *
Int32~~* /
)~~/ 0
HttpStatusCode~~0 >
.~~> ?
InternalServerError~~? R
,~~R S
Convert~~T [
.~~[ \
ToString~~\ d
(~~d e
ex~~e g
.~~g h

StackTrace~~h r
)~~r s
)~~s t
;~~t u
} 
}
�� 
[
�� 
HttpPost
�� 
(
�� 
$str
�� 
)
�� 
]
�� 
public
�� 
async
��	 
Task
�� 
<
�� 
IActionResult
�� !
>
��! "
Delete
��# )
(
��) *
[
��* +
	FromRoute
��+ 4
]
��4 5
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
�� 
try
�� 
{
�� 
DBOperation
�� 
	oResponse
�� 
=
�� 
await
�� !
_LocationService
��" 2
.
��2 3
Delete
��3 9
(
��9 :
id
��: <
,
��< =
by
��= ?
)
��? @
;
��@ A
if
�� 
(
�� 
	oResponse
�� 
==
�� 
DBOperation
��  
.
��  !
Success
��! (
)
��( )
return
�� 
_ObjectResponse
�� 
.
�� 
Create
�� "
(
��" #
true
��# '
,
��' (
(
��) *
Int32
��* /
)
��/ 0
HttpStatusCode
��0 >
.
��> ?
OK
��? A
,
��A B
AppConstants
��C O
.
��O P
DeleteSuccess
��P ]
)
��] ^
;
��^ _
else
�� 
return
�� 
_ObjectResponse
�� 
.
�� 
Create
�� "
(
��" #
null
��# '
,
��' (
(
��) *
Int32
��* /
)
��/ 0
HttpStatusCode
��0 >
.
��> ?

BadRequest
��? I
,
��I J
AppConstants
��K W
.
��W X
NoRecordFound
��X e
)
��e f
;
��f g
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
�� 
return
�� 

_ObjectResponse
�� 
.
�� 
Create
�� !
(
��! "
false
��" '
,
��' (
(
��) *
Int32
��* /
)
��/ 0
HttpStatusCode
��0 >
.
��> ?!
InternalServerError
��? R
,
��R S
Convert
��T [
.
��[ \
ToString
��\ d
(
��d e
ex
��e g
.
��g h

StackTrace
��h r
)
��r s
)
��s t
;
��t u
}
�� 
}
�� 
}
�� 
}�� �D
RD:\EltizamLive\Eltizam.WebApi\src\API\Controllers\ValuationAssessmentController.cs
	namespace 	
Eltizam
 
. 
WebApi 
. 
Controllers $
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
Route 

(
 
$str 3
)3 4
]4 5
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class )
ValuationAssessmentController .
:/ 0
ControllerBase1 ?
{ 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
private 
readonly 
IResponseHandler )
<) *
dynamic* 1
>1 2
_ObjectResponse3 B
;B C
private 
	Microsoft 
. 

Extensions $
.$ %
Hosting% ,
., -
IHostingEnvironment- @
_envA E
;E F
private 
readonly 
IExceptionService *
_ExceptionService+ <
;< =
private 
readonly '
IValuationAssessmentService 4'
_ValuationAssessmentService5 P
;P Q
public"" )
ValuationAssessmentController"" ,
("", -
IConfiguration""- ;
configuration""< I
,""I J'
IValuationAssessmentService""K f'
ValuationAssessmentService	""g �
,
""� �
IResponseHandler
""� �
<
""� �
dynamic
""� �
>
""� �
ObjectResponse
""� �
,
""� �
IExceptionService
""� �
exceptionService
""� �
)
""� �
{## 	
_configuration$$ 
=$$ 
configuration$$ *
;$$* +'
_ValuationAssessmentService%% '
=%%( )&
ValuationAssessmentService%%* D
;%%D E
_ObjectResponse&& 
=&& 
ObjectResponse&& ,
;&&, -
_ExceptionService(( 
=(( 
exceptionService((  0
;((0 1
})) 	
[-- 	
HttpPost--	 
]-- 
[.. 	
Route..	 
(.. 
$str.. )
)..) *
]..* +
public// 
async// 
Task// 
<// 
IActionResult// '
>//' ($
ValuationAssesmentUpsert//) A
(//A B)
ValuationAssesmentActionModel//B _
model//` e
)//e f
{00 	
try11 
{22 
DBOperation33 
	oResponse33 %
=33& '
await33( -'
_ValuationAssessmentService33. I
.33I J$
ValuationAssesmentUpsert33J b
(33b c
model33c h
)33h i
;33i j
if44 
(44 
	oResponse44 
==44  
DBOperation44! ,
.44, -
Success44- 4
)444 5
{55 
return66 
_ObjectResponse66 *
.66* +
Create66+ 1
(661 2
true662 6
,666 7
(668 9
Int32669 >
)66> ?
HttpStatusCode66? M
.66M N
OK66N P
,66P Q
(66R S
model66S X
.66X Y
SiteDescription66Y h
.66h i
Id66i k
>66l m
$num66n o
?66p q
AppConstants66r ~
.66~ 
UpdateSuccess	66 �
:
66� �
AppConstants
66� �
.
66� �
InsertSuccess
66� �
)
66� �
)
66� �
;
66� �
}77 
else88 
return99 
_ObjectResponse99 *
.99* +
Create99+ 1
(991 2
false992 7
,997 8
(999 :
Int3299: ?
)99? @
HttpStatusCode99@ N
.99N O

BadRequest99O Y
,99Y Z
(99[ \
	oResponse99\ e
==99f h
DBOperation99i t
.99t u
NotFound99u }
?99~ 
AppConstants
99� �
.
99� �
NoRecordFound
99� �
:
99� �
AppConstants
99� �
.
99� �

BadRequest
99� �
)
99� �
)
99� �
;
99� �
}:: 
catch;; 
(;; 
	Exception;; 
ex;; 
);;  
{<< 
await== 
_ExceptionService== '
.==' (
LogException==( 4
(==4 5
ex==5 7
)==7 8
;==8 9
return>> 
_ObjectResponse>> &
.>>& '
Create>>' -
(>>- .
false>>. 3
,>>3 4
(>>5 6
Int32>>6 ;
)>>; <
HttpStatusCode>>< J
.>>J K
InternalServerError>>K ^
,>>^ _
Convert>>` g
.>>g h
ToString>>h p
(>>p q
ex>>q s
.>>s t

StackTrace>>t ~
)>>~ 
)	>> �
;
>>� �
}?? 
}@@ 	
[BB 	
HttpGetBB	 
,BB 
RouteBB 
(BB 
$strBB 0
)BB0 1
]BB1 2
publicCC 
asyncCC 
TaskCC 
<CC 
IActionResultCC '
>CC' ("
GetSiteDescriptionListCC) ?
(CC? @
intCC@ C
	RequestIdCCD M
)CCM N
{DD 	
tryEE 
{FF 
returnGG 
_ObjectResponseGG &
.GG& '

CreateDataGG' 1
(GG1 2
awaitGG2 7'
_ValuationAssessmentServiceGG8 S
.GGS T"
GetSiteDescriptionListGGT j
(GGj k
	RequestIdGGk t
)GGt u
,GGu v
(GGw x
Int32GGx }
)GG} ~
HttpStatusCode	GG~ �
.
GG� �
OK
GG� �
)
GG� �
;
GG� �
}HH 
catchII 
(II 
	ExceptionII 
exII 
)II  
{JJ 
returnKK 
_ObjectResponseKK &
.KK& '
CreateKK' -
(KK- .
falseKK. 3
,KK3 4
(KK5 6
Int32KK6 ;
)KK; <
HttpStatusCodeKK< J
.KKJ K
InternalServerErrorKKK ^
,KK^ _
ConvertKK` g
.KKg h
ToStringKKh p
(KKp q
exKKq s
.KKs t

StackTraceKKt ~
)KK~ 
)	KK �
;
KK� �
}LL 
}MM 	
[OO 	

HttpDeleteOO	 
(OO 
$strOO )
)OO) *
]OO* +
publicPP 
asyncPP 
TaskPP 
<PP 
IActionResultPP '
>PP' (
DeleteDocumentPP) 7
(PP7 8
[PP8 9
	FromRoutePP9 B
]PPB C
intPPD G
idPPH J
,PPJ K
intPPK N
?PPN O
byPPP R
)PPR S
{QQ 	
tryRR 
{SS 
DBOperationTT 
	oResponseTT %
=TT& '
awaitTT( -'
_ValuationAssessmentServiceTT. I
.TTI J
DeleteDocumentTTJ X
(TTX Y
idTTY [
,TT[ \
byTT\ ^
)TT^ _
;TT_ `
ifUU 
(UU 
	oResponseUU 
==UU  
DBOperationUU! ,
.UU, -
SuccessUU- 4
)UU4 5
returnVV 
_ObjectResponseVV *
.VV* +
CreateVV+ 1
(VV1 2
trueVV2 6
,VV6 7
(VV8 9
Int32VV9 >
)VV> ?
HttpStatusCodeVV? M
.VVM N
OKVVN P
,VVP Q
AppConstantsVVR ^
.VV^ _
DeleteSuccessVV_ l
)VVl m
;VVm n
elseWW 
returnXX 
_ObjectResponseXX *
.XX* +
CreateXX+ 1
(XX1 2
nullXX2 6
,XX6 7
(XX8 9
Int32XX9 >
)XX> ?
HttpStatusCodeXX? M
.XXM N

BadRequestXXN X
,XXX Y
AppConstantsXXZ f
.XXf g
NoRecordFoundXXg t
)XXt u
;XXu v
}YY 
catchZZ 
(ZZ 
	ExceptionZZ 
exZZ 
)ZZ  
{[[ 
return\\ 
_ObjectResponse\\ &
.\\& '
Create\\' -
(\\- .
false\\. 3
,\\3 4
(\\5 6
Int32\\6 ;
)\\; <
HttpStatusCode\\< J
.\\J K
InternalServerError\\K ^
,\\^ _
Convert\\` g
.\\g h
ToString\\h p
(\\p q
ex\\q s
.\\s t

StackTrace\\t ~
)\\~ 
)	\\ �
;
\\� �
}]] 
}^^ 	
}
�� 
}�� ʯ
OD:\EltizamLive\Eltizam.WebApi\src\API\Controllers\ValuationInvoiceController.cs
	namespace		 	
Eltizam		
 
.		 
WebApi		 
.		 
Controllers		 $
{

 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
Route 

(
 
$str 3
)3 4
]4 5
[ 
ApiController 
] 
public 

class &
ValuationInvoiceController +
:, -
ControllerBase. <
{ 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
private 
readonly 
IResponseHandler )
<) *
dynamic* 1
>1 2
_ObjectResponse3 B
;B C
private 
readonly 
IExceptionService *
_ExceptionService+ <
;< =
private 
readonly $
IValuationInvoiceService 1$
_ValuationInvoiceService2 J
;J K
public &
ValuationInvoiceController )
() *
IConfiguration* 8
configuration9 F
,F G
IResponseHandlerH X
<X Y
dynamicY `
>` a
ObjectResponseb p
,p q
IExceptionService	s �
exceptionService
� �
,
� �&
IValuationInvoiceService
� �%
ValuationInvoiceService
� �
)
� �
{ 	
_configuration 
= 
configuration *
;* +
_ObjectResponse 
= 
ObjectResponse ,
;, -
_ExceptionService 
=  
exceptionService! 1
;1 2$
_ValuationInvoiceService   $
=  % &#
ValuationInvoiceService  ' >
;  > ?
}!! 	
[++ 	
HttpGet++	 
,++ 
Route++ 
(++ 
$str++ (
)++( )
]++) *
public,, 
async,, 
Task,, 
<,, 
IActionResult,, '
>,,' (
GetInvoiceList,,) 7
(,,7 8
int,,8 ;
	RequestId,,< E
),,E F
{-- 	
try.. 
{// 
return00 
_ObjectResponse00 &
.00& '

CreateData00' 1
(001 2
await002 7$
_ValuationInvoiceService008 P
.00P Q
GetInvoiceList00Q _
(00_ `
	RequestId00` i
)00i j
,00j k
(00l m
Int3200m r
)00r s
HttpStatusCode	00s �
.
00� �
OK
00� �
)
00� �
;
00� �
}11 
catch22 
(22 
	Exception22 
ex22 
)22  
{33 
return44 
_ObjectResponse44 &
.44& '
Create44' -
(44- .
false44. 3
,443 4
(445 6
Int32446 ;
)44; <
HttpStatusCode44< J
.44J K
InternalServerError44K ^
,44^ _
Convert44` g
.44g h
ToString44h p
(44p q
ex44q s
.44s t

StackTrace44t ~
)44~ 
)	44 �
;
44� �
}55 
}66 	
[88 	
HttpPost88	 
]88 
[99 	
Route99	 
(99 
$str99 
)99 
]99 
public:: 
async:: 
Task:: 
<:: 
IActionResult:: '
>::' (
Upsert::) /
(::/ 0%
ValuationInvoiceListModel::0 I
model::J O
)::O P
{;; 	
try<< 
{== 
DBOperation>> 
	oResponse>> %
=>>& '
await>>( -$
_ValuationInvoiceService>>. F
.>>F G
Upsert>>G M
(>>M N
model>>N S
)>>S T
;>>T U
if?? 
(?? 
	oResponse?? 
==??  
DBOperation??! ,
.??, -
Success??- 4
)??4 5
{@@ 
returnAA 
_ObjectResponseAA *
.AA* +
CreateAA+ 1
(AA1 2
trueAA2 6
,AA6 7
(AA8 9
Int32AA9 >
)AA> ?
HttpStatusCodeAA? M
.AAM N
OKAAN P
,AAP Q
(AAR S
modelAAS X
.AAX Y
IdAAY [
>AA\ ]
$numAA^ _
?AA` a
AppConstantsAAb n
.AAn o
UpdateSuccessAAo |
:AA} ~
AppConstants	AA �
.
AA� �
InsertSuccess
AA� �
)
AA� �
)
AA� �
;
AA� �
}BB 
elseCC 
returnDD 
_ObjectResponseDD *
.DD* +
CreateDD+ 1
(DD1 2
falseDD2 7
,DD7 8
(DD9 :
Int32DD: ?
)DD? @
HttpStatusCodeDD@ N
.DDN O

BadRequestDDO Y
,DDY Z
(DD[ \
	oResponseDD\ e
==DDf h
DBOperationDDi t
.DDt u
NotFoundDDu }
?DD~ 
AppConstants
DD� �
.
DD� �
NoRecordFound
DD� �
:
DD� �
AppConstants
DD� �
.
DD� �

BadRequest
DD� �
)
DD� �
)
DD� �
;
DD� �
}EE 
catchFF 
(FF 
	ExceptionFF 
exFF 
)FF  
{GG 
returnHH 
_ObjectResponseHH &
.HH& '
CreateHH' -
(HH- .
falseHH. 3
,HH3 4
(HH5 6
Int32HH6 ;
)HH; <
HttpStatusCodeHH< J
.HHJ K
InternalServerErrorHHK ^
,HH^ _
ConvertHH` g
.HHg h
ToStringHHh p
(HHp q
exHHq s
.HHs t

StackTraceHHt ~
)HH~ 
)	HH �
;
HH� �
}II 
}JJ 	
[KK 	
HttpGetKK	 
,KK 
RouteKK 
(KK 
$strKK -
)KK- .
]KK. /
publicLL 
asyncLL 
TaskLL 
<LL 
IActionResultLL '
>LL' (
GetInvoiceByIdLL) 7
(LL7 8
[LL8 9
	FromRouteLL9 B
]LLB C
intLLD G
idLLH J
)LLJ K
{MM 	
tryNN 
{OO 
varPP 
quatationEntityPP #
=PP$ %
awaitPP& +$
_ValuationInvoiceServicePP, D
.PPD E
GetInvoiceByIdPPE S
(PPS T
idPPT V
)PPV W
;PPW X
ifQQ 
(QQ 
quatationEntityQQ #
!=QQ$ &
nullQQ' +
&&QQ, .
quatationEntityQQ/ >
.QQ> ?
IdQQ? A
>QQB C
$numQQD E
)QQE F
returnRR 
_ObjectResponseRR *
.RR* +
CreateRR+ 1
(RR1 2
quatationEntityRR2 A
,RRA B
(RRC D
Int32RRD I
)RRI J
HttpStatusCodeRRJ X
.RRX Y
OKRRY [
)RR[ \
;RR\ ]
elseSS 
returnTT 
_ObjectResponseTT *
.TT* +
CreateTT+ 1
(TT1 2
nullTT2 6
,TT6 7
(TT8 9
Int32TT9 >
)TT> ?
HttpStatusCodeTT? M
.TTM N

BadRequestTTN X
,TTX Y
AppConstantsTTZ f
.TTf g
NoRecordFoundTTg t
)TTt u
;TTu v
}UU 
catchVV 
(VV 
	ExceptionVV 
exVV 
)VV  
{WW 
awaitXX 
_ExceptionServiceXX '
.XX' (
LogExceptionXX( 4
(XX4 5
exXX5 7
)XX7 8
;XX8 9
returnYY 
_ObjectResponseYY &
.YY& '
CreateYY' -
(YY- .
falseYY. 3
,YY3 4
(YY5 6
Int32YY6 ;
)YY; <
HttpStatusCodeYY< J
.YYJ K
InternalServerErrorYYK ^
,YY^ _
ConvertYY` g
.YYg h
ToStringYYh p
(YYp q
exYYq s
.YYs t

StackTraceYYt ~
)YY~ 
)	YY �
;
YY� �
}ZZ 
}[[ 	
[]] 	
HttpPost]]	 
(]] 
$str]] 
)]]  
]]]  !
public^^ 
async^^ 
Task^^ 
<^^ 
IActionResult^^ '
>^^' (
Delete^^) /
(^^/ 0
[^^0 1
	FromRoute^^1 :
]^^: ;
int^^< ?
id^^@ B
,^^B C
int^^D G
?^^G H
by^^I K
)^^K L
{__ 	
try`` 
{aa 
DBOperationbb 
	oResponsebb %
=bb& '
awaitbb( -$
_ValuationInvoiceServicebb. F
.bbF G
InvoiceDeletebbG T
(bbT U
idbbU W
,bbW X
bybbX Z
)bbZ [
;bb[ \
ifcc 
(cc 
	oResponsecc 
==cc  
DBOperationcc! ,
.cc, -
Successcc- 4
)cc4 5
returndd 
_ObjectResponsedd *
.dd* +
Createdd+ 1
(dd1 2
truedd2 6
,dd6 7
(dd8 9
Int32dd9 >
)dd> ?
HttpStatusCodedd? M
.ddM N
OKddN P
,ddP Q
AppConstantsddR ^
.dd^ _
DeleteSuccessdd_ l
)ddl m
;ddm n
elseee 
returnff 
_ObjectResponseff *
.ff* +
Createff+ 1
(ff1 2
nullff2 6
,ff6 7
(ff8 9
Int32ff9 >
)ff> ?
HttpStatusCodeff? M
.ffM N

BadRequestffN X
,ffX Y
AppConstantsffZ f
.fff g
NoRecordFoundffg t
)fft u
;ffu v
}gg 
catchhh 
(hh 
	Exceptionhh 
exhh 
)hh  
{ii 
returnjj 
_ObjectResponsejj &
.jj& '
Createjj' -
(jj- .
falsejj. 3
,jj3 4
(jj5 6
Int32jj6 ;
)jj; <
HttpStatusCodejj< J
.jjJ K
InternalServerErrorjjK ^
,jj^ _
Convertjj` g
.jjg h
ToStringjjh p
(jjp q
exjjq s
.jjs t

StackTracejjt ~
)jj~ 
)	jj �
;
jj� �
}kk 
}ll 	
[nn 	

HttpDeletenn	 
(nn 
$strnn )
)nn) *
]nn* +
publicoo 
asyncoo 
Taskoo 
<oo 
IActionResultoo '
>oo' (
DeleteDocumentoo) 7
(oo7 8
[oo8 9
	FromRouteoo9 B
]ooB C
intooD G
idooH J
,ooJ K
intooL O
?ooO P
byooQ S
)ooS T
{pp 	
tryqq 
{rr 
DBOperationss 
	oResponsess %
=ss& '
awaitss( -$
_ValuationInvoiceServicess. F
.ssF G
DeleteDocumentssG U
(ssU V
idssV X
,ssX Y
byssZ \
)ss\ ]
;ss] ^
iftt 
(tt 
	oResponsett 
==tt  
DBOperationtt! ,
.tt, -
Successtt- 4
)tt4 5
returnuu 
_ObjectResponseuu *
.uu* +
Createuu+ 1
(uu1 2
trueuu2 6
,uu6 7
(uu8 9
Int32uu9 >
)uu> ?
HttpStatusCodeuu? M
.uuM N
OKuuN P
,uuP Q
AppConstantsuuR ^
.uu^ _
DeleteSuccessuu_ l
)uul m
;uum n
elsevv 
returnww 
_ObjectResponseww *
.ww* +
Createww+ 1
(ww1 2
nullww2 6
,ww6 7
(ww8 9
Int32ww9 >
)ww> ?
HttpStatusCodeww? M
.wwM N

BadRequestwwN X
,wwX Y
AppConstantswwZ f
.wwf g
NoRecordFoundwwg t
)wwt u
;wwu v
}xx 
catchyy 
(yy 
	Exceptionyy 
exyy 
)yy  
{zz 
return{{ 
_ObjectResponse{{ &
.{{& '
Create{{' -
({{- .
false{{. 3
,{{3 4
({{5 6
Int32{{6 ;
){{; <
HttpStatusCode{{< J
.{{J K
InternalServerError{{K ^
,{{^ _
Convert{{` g
.{{g h
ToString{{h p
({{p q
ex{{q s
.{{s t

StackTrace{{t ~
){{~ 
)	{{ �
;
{{� �
}|| 
}}} 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	
Route
��	 
(
�� 
$str
�� 
)
�� 
]
��  
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
UpsertInvoice
��) 6
(
��6 7*
ValuationInvoicePaymentModel
��7 S
model
��T Y
)
��Y Z
{
�� 	
try
�� 
{
�� 
DBOperation
�� 
	oResponse
�� %
=
��& '
await
��( -&
_ValuationInvoiceService
��. F
.
��F G
UpsertInvoice
��G T
(
��T U
model
��U Z
)
��Z [
;
��[ \
if
�� 
(
�� 
	oResponse
�� 
==
��  
DBOperation
��! ,
.
��, -
Success
��- 4
)
��4 5
{
�� 
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
true
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N
OK
��N P
,
��P Q
(
��R S
model
��S X
.
��X Y
Id
��Y [
>
��\ ]
$num
��^ _
?
��` a
AppConstants
��b n
.
��n o
UpdateSuccess
��o |
:
��} ~
AppConstants�� �
.��� �
InsertSuccess��� �
)��� �
)��� �
;��� �
}
�� 
else
�� 
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
false
��2 7
,
��7 8
(
��9 :
Int32
��: ?
)
��? @
HttpStatusCode
��@ N
.
��N O

BadRequest
��O Y
,
��Y Z
(
��[ \
	oResponse
��\ e
==
��f h
DBOperation
��i t
.
��t u
NotFound
��u }
?
��~ 
AppConstants��� �
.��� �
NoRecordFound��� �
:��� �
AppConstants��� �
.��� �

BadRequest��� �
)��� �
)��� �
;��� �
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
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
Convert
��` g
.
��g h
ToString
��h p
(
��p q
ex
��q s
.
��s t

StackTrace
��t ~
)
��~ 
)�� �
;��� �
}
�� 
}
�� 	
[
�� 	
HttpGet
��	 
,
�� 
Route
�� 
(
�� 
$str
�� /
)
��/ 0
]
��0 1
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (#
GetPaymentInvoiceById
��) >
(
��> ?
int
��? B
	requestId
��C L
)
��L M
{
�� 	
try
�� 
{
�� 
var
�� 
oinvoiceEntity
�� "
=
��# $
await
��% *&
_ValuationInvoiceService
��+ C
.
��C D#
GetPaymentInvoiceById
��D Y
(
��Y Z
	requestId
��Z c
)
��c d
;
��d e
if
�� 
(
�� 
oinvoiceEntity
�� "
!=
��# %
null
��& *
)
��* +
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
oinvoiceEntity
��2 @
,
��@ A
(
��B C
Int32
��C H
)
��H I
HttpStatusCode
��I W
.
��W X
OK
��X Z
)
��Z [
;
��[ \
else
�� 
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
null
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N

BadRequest
��N X
,
��X Y
AppConstants
��Z f
.
��f g
NoRecordFound
��g t
)
��t u
;
��u v
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
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
Convert
��` g
.
��g h
ToString
��h p
(
��p q
ex
��q s
.
��s t

StackTrace
��t ~
)
��~ 
)�� �
;��� �
}
�� 
}
�� 	
[
�� 	
HttpGet
��	 
,
�� 
Route
�� 
(
�� 
$str
�� 1
)
��1 2
]
��2 3
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' ( 
PaymentInvoiceById
��) ;
(
��; <
int
��< ?
id
��@ B
)
��B C
{
�� 	
try
�� 
{
�� 
var
�� 
oinvoiceEntity
�� "
=
��# $
await
��% *&
_ValuationInvoiceService
��+ C
.
��C D 
PaymentInvoiceById
��D V
(
��V W
id
��W Y
)
��Y Z
;
��Z [
if
�� 
(
�� 
oinvoiceEntity
�� "
!=
��# %
null
��& *
)
��* +
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
oinvoiceEntity
��2 @
,
��@ A
(
��B C
Int32
��C H
)
��H I
HttpStatusCode
��I W
.
��W X
OK
��X Z
)
��Z [
;
��[ \
else
�� 
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
null
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N

BadRequest
��N X
,
��X Y
AppConstants
��Z f
.
��f g
NoRecordFound
��g t
)
��t u
;
��u v
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
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
Convert
��` g
.
��g h
ToString
��h p
(
��p q
ex
��q s
.
��s t

StackTrace
��t ~
)
��~ 
)�� �
;��� �
}
�� 
}
�� 	
[
�� 	

HttpDelete
��	 
(
�� 
$str
�� /
)
��/ 0
]
��0 1
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' ("
DeletePyamentInvoice
��) =
(
��= >
[
��> ?
	FromRoute
��? H
]
��H I
int
��J M
id
��N P
,
��P Q
int
��R U
?
��U V
by
��W Y
)
��Y Z
{
�� 	
try
�� 
{
�� 
DBOperation
�� 
	oResponse
�� %
=
��& '
await
��( -&
_ValuationInvoiceService
��. F
.
��F G"
DeletePyamentInvoice
��G [
(
��[ \
id
��\ ^
,
��^ _
by
��` b
)
��b c
;
��c d
if
�� 
(
�� 
	oResponse
�� 
==
��  
DBOperation
��! ,
.
��, -
Success
��- 4
)
��4 5
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
true
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N
OK
��N P
,
��P Q
AppConstants
��R ^
.
��^ _
DeleteSuccess
��_ l
)
��l m
;
��m n
else
�� 
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
null
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N

BadRequest
��N X
,
��X Y
AppConstants
��Z f
.
��f g
NoRecordFound
��g t
)
��t u
;
��u v
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
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
Convert
��` g
.
��g h
ToString
��h p
(
��p q
ex
��q s
.
��s t

StackTrace
��t ~
)
��~ 
)�� �
;��� �
}
�� 
}
�� 	
}
�� 
}�� �k
QD:\EltizamLive\Eltizam.WebApi\src\API\Controllers\ValuationQuatationController.cs
	namespace 	
Eltizam
 
. 
WebApi 
. 
Controllers $
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
Route 

(
 
$str 3
)3 4
]4 5
[ 
ApiController 
] 
public 

class (
ValuationQuatationController -
:. /
ControllerBase0 >
{ 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
private 
readonly 
IResponseHandler )
<) *
dynamic* 1
>1 2
_ObjectResponse3 B
;B C
private 
	Microsoft 
. 

Extensions $
.$ %
Hosting% ,
., -
IHostingEnvironment- @
_envA E
;E F
private 
readonly 
IExceptionService *
_ExceptionService+ <
;< =
private 
readonly &
IValuationQuatationService 3'
_ValuationQuatatiionService4 O
;O P
public (
ValuationQuatationController +
(+ ,
IConfiguration, :
configuration; H
,H I
IResponseHandlerJ Z
<Z [
dynamic[ b
>b c
ObjectResponsed r
,r s
IExceptionService	t �
exceptionService
� �
,
� �(
IValuationQuatationService
� �(
ValuationQuatatiionService
� �
)
� �
{ 	
_configuration 
= 
configuration *
;* +
_ObjectResponse   
=   
ObjectResponse   ,
;  , -
_ExceptionService!! 
=!! 
exceptionService!!  0
;!!0 1'
_ValuationQuatatiionService"" '
=""( )&
ValuationQuatatiionService""* D
;""D E
}## 	
[-- 	
HttpGet--	 
,-- 
Route-- 
(-- 
$str-- 2
)--2 3
]--3 4
public.. 
async.. 
Task.. 
<.. 
IActionResult.. '
>..' (
GetValuationPDFData..) <
(..< =
[..= >
	FromRoute..> G
]..G H
int..I L
id..M O
)..O P
{// 	
try00 
{11 
return22 
_ObjectResponse22 &
.22& '

CreateData22' 1
(221 2
await222 7'
_ValuationQuatatiionService228 S
.22S T
GetValuationPDFData22T g
(22g h
id22h j
)22j k
,22k l
(22m n
Int3222n s
)22s t
HttpStatusCode	22t �
.
22� �
OK
22� �
)
22� �
;
22� �
}33 
catch44 
(44 
	Exception44 
ex44 
)44  
{55 
return66 
_ObjectResponse66 &
.66& '
Create66' -
(66- .
false66. 3
,663 4
(665 6
Int32666 ;
)66; <
HttpStatusCode66< J
.66J K
InternalServerError66K ^
,66^ _
Convert66` g
.66g h
ToString66h p
(66p q
ex66q s
.66s t

StackTrace66t ~
)66~ 
)	66 �
;
66� �
}77 
}88 	
[:: 	
HttpGet::	 
,:: 
Route:: 
(:: 
$str:: *
)::* +
]::+ ,
public;; 
async;; 
Task;; 
<;; 
IActionResult;; '
>;;' (
GetQuatationList;;) 9
(;;9 :
int;;: =
	RequestId;;> G
);;G H
{<< 	
try== 
{>> 
return?? 
_ObjectResponse?? &
.??& '

CreateData??' 1
(??1 2
await??2 7'
_ValuationQuatatiionService??8 S
.??S T
GetQuatationList??T d
(??d e
	RequestId??e n
)??n o
,??o p
(??q r
Int32??r w
)??w x
HttpStatusCode	??x �
.
??� �
OK
??� �
)
??� �
;
??� �
}@@ 
catchAA 
(AA 
	ExceptionAA 
exAA 
)AA  
{BB 
returnCC 
_ObjectResponseCC &
.CC& '
CreateCC' -
(CC- .
falseCC. 3
,CC3 4
(CC5 6
Int32CC6 ;
)CC; <
HttpStatusCodeCC< J
.CCJ K
InternalServerErrorCCK ^
,CC^ _
ConvertCC` g
.CCg h
ToStringCCh p
(CCp q
exCCq s
.CCs t

StackTraceCCt ~
)CC~ 
)	CC �
;
CC� �
}DD 
}EE 	
[GG 	
HttpPostGG	 
]GG 
[HH 	
RouteHH	 
(HH 
$strHH 
)HH 
]HH 
publicII 
asyncII 
TaskII 
<II 
IActionResultII '
>II' (
UpsertII) /
(II/ 0'
ValuationQuatationListModelII0 K
modelIIL Q
)IIQ R
{JJ 	
tryKK 
{LL 
DBOperationMM 
	oResponseMM %
=MM& '
awaitMM( -'
_ValuationQuatatiionServiceMM. I
.MMI J
UpsertMMJ P
(MMP Q
modelMMQ V
)MMV W
;MMW X
ifNN 
(NN 
	oResponseNN 
==NN  
DBOperationNN! ,
.NN, -
SuccessNN- 4
)NN4 5
{OO 
returnPP 
_ObjectResponsePP *
.PP* +
CreatePP+ 1
(PP1 2
truePP2 6
,PP6 7
(PP8 9
Int32PP9 >
)PP> ?
HttpStatusCodePP? M
.PPM N
OKPPN P
,PPP Q
(PPR S
modelPPS X
.PPX Y
IdPPY [
>PP\ ]
$numPP^ _
?PP` a
AppConstantsPPb n
.PPn o
UpdateSuccessPPo |
:PP} ~
AppConstants	PP �
.
PP� �
InsertSuccess
PP� �
)
PP� �
)
PP� �
;
PP� �
}QQ 
elseRR 
returnSS 
_ObjectResponseSS *
.SS* +
CreateSS+ 1
(SS1 2
falseSS2 7
,SS7 8
(SS9 :
Int32SS: ?
)SS? @
HttpStatusCodeSS@ N
.SSN O

BadRequestSSO Y
,SSY Z
(SS[ \
	oResponseSS\ e
==SSf h
DBOperationSSi t
.SSt u
NotFoundSSu }
?SS~ 
AppConstants
SS� �
.
SS� �
NoRecordFound
SS� �
:
SS� �
AppConstants
SS� �
.
SS� �

BadRequest
SS� �
)
SS� �
)
SS� �
;
SS� �
}TT 
catchUU 
(UU 
	ExceptionUU 
exUU 
)UU  
{VV 
returnWW 
_ObjectResponseWW &
.WW& '
CreateWW' -
(WW- .
falseWW. 3
,WW3 4
(WW5 6
Int32WW6 ;
)WW; <
HttpStatusCodeWW< J
.WWJ K
InternalServerErrorWWK ^
,WW^ _
ConvertWW` g
.WWg h
ToStringWWh p
(WWp q
exWWq s
.WWs t

StackTraceWWt ~
)WW~ 
)	WW �
;
WW� �
}XX 
}YY 	
[ZZ 	
HttpGetZZ	 
,ZZ 
RouteZZ 
(ZZ 
$strZZ /
)ZZ/ 0
]ZZ0 1
public[[ 
async[[ 
Task[[ 
<[[ 
IActionResult[[ '
>[[' (
GetQuatationById[[) 9
([[9 :
[[[: ;
	FromRoute[[; D
][[D E
int[[F I
id[[J L
)[[L M
{\\ 	
try]] 
{^^ 
var__ 
quatationEntity__ #
=__$ %
await__& +'
_ValuationQuatatiionService__, G
.__G H
GetQuatationById__H X
(__X Y
id__Y [
)__[ \
;__\ ]
if`` 
(`` 
quatationEntity`` #
!=``$ &
null``' +
&&``, .
quatationEntity``/ >
.``> ?
Id``? A
>``B C
$num``D E
)``E F
returnaa 
_ObjectResponseaa *
.aa* +
Createaa+ 1
(aa1 2
quatationEntityaa2 A
,aaA B
(aaC D
Int32aaD I
)aaI J
HttpStatusCodeaaJ X
.aaX Y
OKaaY [
)aa[ \
;aa\ ]
elsebb 
returncc 
_ObjectResponsecc *
.cc* +
Createcc+ 1
(cc1 2
nullcc2 6
,cc6 7
(cc8 9
Int32cc9 >
)cc> ?
HttpStatusCodecc? M
.ccM N

BadRequestccN X
,ccX Y
AppConstantsccZ f
.ccf g
NoRecordFoundccg t
)cct u
;ccu v
}dd 
catchee 
(ee 
	Exceptionee 
exee 
)ee  
{ff 
awaitgg 
_ExceptionServicegg '
.gg' (
LogExceptiongg( 4
(gg4 5
exgg5 7
)gg7 8
;gg8 9
returnhh 
_ObjectResponsehh &
.hh& '
Createhh' -
(hh- .
falsehh. 3
,hh3 4
(hh5 6
Int32hh6 ;
)hh; <
HttpStatusCodehh< J
.hhJ K
InternalServerErrorhhK ^
,hh^ _
Converthh` g
.hhg h
ToStringhhh p
(hhp q
exhhq s
.hhs t

StackTracehht ~
)hh~ 
)	hh �
;
hh� �
}ii 
}jj 	
[ll 	
HttpPostll	 
(ll 
$strll 
)ll  
]ll  !
publicmm 
asyncmm 
Taskmm 
<mm 
IActionResultmm '
>mm' (
Deletemm) /
(mm/ 0
[mm0 1
	FromRoutemm1 :
]mm: ;
intmm< ?
idmm@ B
,mmB C
intmmD G
?mmG H
bymmI K
)mmK L
{nn 	
tryoo 
{pp 
DBOperationqq 
	oResponseqq %
=qq& '
awaitqq( -'
_ValuationQuatatiionServiceqq. I
.qqI J
QuatationDeleteqqJ Y
(qqY Z
idqqZ \
,qq\ ]
byqq] _
)qq_ `
;qq` a
ifrr 
(rr 
	oResponserr 
==rr  
DBOperationrr! ,
.rr, -
Successrr- 4
)rr4 5
returnss 
_ObjectResponsess *
.ss* +
Createss+ 1
(ss1 2
truess2 6
,ss6 7
(ss8 9
Int32ss9 >
)ss> ?
HttpStatusCodess? M
.ssM N
OKssN P
,ssP Q
AppConstantsssR ^
.ss^ _
DeleteSuccessss_ l
)ssl m
;ssm n
elsett 
returnuu 
_ObjectResponseuu *
.uu* +
Createuu+ 1
(uu1 2
nulluu2 6
,uu6 7
(uu8 9
Int32uu9 >
)uu> ?
HttpStatusCodeuu? M
.uuM N

BadRequestuuN X
,uuX Y
AppConstantsuuZ f
.uuf g
NoRecordFounduug t
)uut u
;uuu v
}vv 
catchww 
(ww 
	Exceptionww 
exww 
)ww  
{xx 
returnyy 
_ObjectResponseyy &
.yy& '
Createyy' -
(yy- .
falseyy. 3
,yy3 4
(yy5 6
Int32yy6 ;
)yy; <
HttpStatusCodeyy< J
.yyJ K
InternalServerErroryyK ^
,yy^ _
Convertyy` g
.yyg h
ToStringyyh p
(yyp q
exyyq s
.yys t

StackTraceyyt ~
)yy~ 
)	yy �
;
yy� �
}zz 
}{{ 	
[}} 	
HttpGet}}	 
(}} 
$str}} #
)}}# $
]}}$ %
public~~ 
async~~ 
Task~~ 
<~~ 
IActionResult~~ '
>~~' (
GetApproverLevel~~) 9
(~~9 :
decimal~~: A
Amount~~B H
,~~H I
int~~J M
ValReqId~~N V
)~~V W
{ 	
try
�� 
{
�� 
return
�� 
_ObjectResponse
�� &
.
��& '

CreateData
��' 1
(
��1 2
await
��2 7)
_ValuationQuatatiionService
��8 S
.
��S T
GetApproverLevel
��T d
(
��d e
Amount
��e k
,
��k l
ValReqId
��m u
)
��u v
,
��v w
(
��x y
Int32
��y ~
)
��~ 
HttpStatusCode�� �
.��� �
OK��� �
)��� �
;��� �
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
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
Convert
��` g
.
��g h
ToString
��h p
(
��p q
ex
��q s
.
��s t

StackTrace
��t ~
)
��~ 
)�� �
;��� �
}
�� 
}
�� 	
}
�� 
}�� ��
OD:\EltizamLive\Eltizam.WebApi\src\API\Controllers\ValuationRequestController.cs
	namespace

 	
Eltizam


 
.

 
WebApi

 
.

 
Controllers

 $
{ 
[ 

ApiVersion 
( 
$str 
) 
] 
[ 
Route 

(
 
$str 3
)3 4
]4 5
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class &
ValuationRequestController +
:, -
ControllerBase. <
{ 
private 
readonly $
IValuationRequestService 1
_valuationServices2 D
;D E
private 
readonly 
IResponseHandler )
<) *
dynamic* 1
>1 2
_ObjectResponse3 B
;B C
public &
ValuationRequestController )
() *$
IValuationRequestService* B
valutionServicesC S
,S T
IResponseHandlerU e
<e f
dynamicf m
>m n
ObjectResponseo }
)} ~
{ 	
_valuationServices 
=  
valutionServices! 1
;1 2
_ObjectResponse 
= 
ObjectResponse ,
;, -
} 	
[!! 	
HttpPost!!	 
,!! 
Route!! 
(!! 
$str!! 1
)!!1 2
]!!2 3
public"" 
async"" 
Task"" 
<"" 
IActionResult"" '
>""' ("
GetAllValuationRequest"") ?
(""? @
[""@ A
FromForm""A I
]""I J"
DataTableAjaxPostModel""K a
model""b g
,""g h
string""i o
?""o p
userName""q y
,""y z
string	""{ �
?
""� �

clientName
""� �
,
""� �
string
""� �
?
""� �
propertyName
""� �
,
""� �
int
""� �
requestStatusId
""� �
,
""� �
int
""� �

resourceId
""� �
,
""� �
int
""� �
propertyTypeId
""� �
,
""� �
int
""� �
	countryId
""� �
,
""� �
int
""� �
stateId
""� �
,
""� �
int
""� �
cityId
""� �
,
""� �
string
""� �
?
""� �
fromDate
""� �
,
""� �
string
""� �
?
""� �
toDate
""� �
,
""� �
string
""� �
?
""� �
valRef
""� �
,
""� �
int
""� �
?
""� �
logInUserId
""� �
)
""� �
{## 	
try$$ 
{%% 
var&& 
filters&& 
=&& 
new&& !#
ValuationRequestFilters&&" 9
(&&9 :
)&&: ;
{'' 
userName(( 
=(( 
userName(( '
,((' (

clientName)) 
=))  

clientName))! +
,))+ ,
propertyName**  
=**! "
propertyName**# /
,**/ 0
requestStatusId++ #
=++$ %
requestStatusId++& 5
,++5 6

resourceId,, 
=,,  

resourceId,,! +
,,,+ ,
propertyTypeId-- "
=--# $
propertyTypeId--% 3
,--3 4
	countryId.. 
=.. 
	countryId..  )
,..) *
stateId// 
=// 
stateId// %
,//% &
cityId00 
=00 
cityId00 #
,00# $
fromDate11 
=11 
fromDate11 '
,11' (
toDate22 
=22 
toDate22 #
,22# $
valRef33 
=33 
valRef33 #
,33# $
logInUserId44 
=44  !
logInUserId44" -
}55 
;55 
return77 
_ObjectResponse77 &
.77& '

CreateData77' 1
(771 2
await772 7
_valuationServices778 J
.77J K
GetAll77K Q
(77Q R
model77R W
,77W X
filters77Y `
)77` a
,77a b
(77c d
Int3277d i
)77i j
HttpStatusCode77j x
.77x y
OK77y {
)77{ |
;77| }
}88 
catch99 
(99 
	Exception99 
ex99 
)99  
{:: 
return;; 
_ObjectResponse;; &
.;;& '
Create;;' -
(;;- .
false;;. 3
,;;3 4
(;;5 6
Int32;;6 ;
);;; <
HttpStatusCode;;< J
.;;J K
InternalServerError;;K ^
,;;^ _
Convert;;` g
.;;g h
ToString;;h p
(;;p q
ex;;q s
.;;s t

StackTrace;;t ~
);;~ 
)	;; �
;
;;� �
}<< 
}== 	
[?? 	
HttpPost??	 
,?? 
Route?? 
(?? 
$str?? )
)??) *
]??* +
public@@ 
async@@ 
Task@@ 
<@@ 
IActionResult@@ '
>@@' (
AssignApprover@@) 7
(@@7 8
[@@8 9
FromBody@@9 A
]@@A B&
AssignApprovorRequestModel@@C ]
model@@^ c
)@@c d
{AA 	
DBOperationBB 
	oResponseBB !
=BB" #
awaitBB$ )
_valuationServicesBB* <
.BB< =
AssignApproverBB= K
(BBK L
modelBBL Q
)BBQ R
;BBR S
ifCC 
(CC 
	oResponseCC 
==CC 
DBOperationCC (
.CC( )
SuccessCC) 0
)CC0 1
{DD 
returnEE 
_ObjectResponseEE &
.EE& '
CreateEE' -
(EE- .
trueEE. 2
,EE2 3
(EE4 5
Int32EE5 :
)EE: ;
HttpStatusCodeEE; I
.EEI J
OKEEJ L
,EEL M
(EEN O
AppConstantsEEO [
.EE[ \
InsertSuccessEE\ i
)EEi j
)EEj k
;EEk l
}FF 
elseGG 
returnHH 
_ObjectResponseHH &
.HH& '
CreateHH' -
(HH- .
falseHH. 3
,HH3 4
(HH5 6
Int32HH6 ;
)HH; <
HttpStatusCodeHH< J
.HHJ K

BadRequestHHK U
,HHU V
(HHW X
	oResponseHHX a
==HHb d
DBOperationHHe p
.HHp q
NotFoundHHq y
?HHz {
AppConstants	HH| �
.
HH� �
NoRecordFound
HH� �
:
HH� �
AppConstants
HH� �
.
HH� �

BadRequest
HH� �
)
HH� �
)
HH� �
;
HH� �
}II 	
[KK 	
HttpPostKK	 
,KK 
RouteKK 
(KK 
$strKK /
)KK/ 0
]KK0 1
publicLL 
asyncLL 
TaskLL 
<LL 
IActionResultLL '
>LL' ( 
AssignApproverStatusLL) =
(LL= >
[LL> ?
FromBodyLL? G
]LLG H&
ApprovorStatusRequestModelLLI c
modelLLd i
)LLi j
{MM 	
DBOperationNN 
	oResponseNN !
=NN" #
awaitNN$ )
_valuationServicesNN* <
.NN< = 
AssignApproverStatusNN= Q
(NNQ R
modelNNR W
)NNW X
;NNX Y
ifOO 
(OO 
	oResponseOO 
==OO 
DBOperationOO (
.OO( )
SuccessOO) 0
)OO0 1
{PP 
returnQQ 
_ObjectResponseQQ &
.QQ& '
CreateQQ' -
(QQ- .
trueQQ. 2
,QQ2 3
(QQ4 5
Int32QQ5 :
)QQ: ;
HttpStatusCodeQQ; I
.QQI J
OKQQJ L
,QQL M
(QQN O
AppConstantsQQO [
.QQ[ \
InsertSuccessQQ\ i
)QQi j
)QQj k
;QQk l
}RR 
elseSS 
returnTT 
_ObjectResponseTT &
.TT& '
CreateTT' -
(TT- .
falseTT. 3
,TT3 4
(TT5 6
Int32TT6 ;
)TT; <
HttpStatusCodeTT< J
.TTJ K

BadRequestTTK U
,TTU V
(TTW X
	oResponseTTX a
==TTb d
DBOperationTTe p
.TTp q
NotFoundTTq y
?TTz {
AppConstants	TT| �
.
TT� �
NoRecordFound
TT� �
:
TT� �
AppConstants
TT� �
.
TT� �

BadRequest
TT� �
)
TT� �
)
TT� �
;
TT� �
}UU 	
[XX 	
HttpGetXX	 
(XX 
$strXX (
)XX( )
]XX) *
publicYY 
asyncYY 
TaskYY 
<YY 
IActionResultYY '
>YY' (!
GetAllValuationMethodYY) >
(YY> ?
)YY? @
{ZZ 	
try[[ 
{\\ 
return]] 
_ObjectResponse]] &
.]]& '

CreateData]]' 1
(]]1 2
await]]2 7
_valuationServices]]8 J
.]]J K!
GetAllValuationMethod]]K `
(]]` a
)]]a b
,]]b c
(]]d e
Int32]]e j
)]]j k
HttpStatusCode]]k y
.]]y z
OK]]z |
)]]| }
;]]} ~
}^^ 
catch__ 
(__ 
	Exception__ 
ex__ 
)__  
{`` 
returnaa 
_ObjectResponseaa &
.aa& '
Createaa' -
(aa- .
falseaa. 3
,aa3 4
(aa5 6
Int32aa6 ;
)aa; <
HttpStatusCodeaa< J
.aaJ K
InternalServerErroraaK ^
,aa^ _
Convertaa` g
.aag h
ToStringaah p
(aap q
exaaq s
.aas t

StackTraceaat ~
)aa~ 
)	aa �
;
aa� �
}bb 
}cc 	
[ee 	
HttpPostee	 
]ee 
[ff 	
Routeff	 
(ff 
$strff 
)ff 
]ff 
publicgg 
asyncgg 
Taskgg 
<gg 
IActionResultgg '
>gg' (
Upsertgg) /
(gg/ 0
[gg0 1
FromBodygg1 9
]gg9 :!
ValuationRequestModelgg; P

oValuationggQ [
)gg[ \
{hh 	
tryii 
{jj 
DBOperationkk 
	oResponsekk %
=kk& '
awaitkk( -
_valuationServiceskk. @
.kk@ A
UpsertkkA G
(kkG H

oValuationkkH R
)kkR S
;kkS T
ifll 
(ll 
	oResponsell 
==ll  
DBOperationll! ,
.ll, -
Successll- 4
)ll4 5
{mm 
returnnn 
_ObjectResponsenn *
.nn* +
Createnn+ 1
(nn1 2
truenn2 6
,nn6 7
(nn8 9
Int32nn9 >
)nn> ?
HttpStatusCodenn? M
.nnM N
OKnnN P
,nnP Q
(nnR S

oValuationnnS ]
.nn] ^
Idnn^ `
>nna b
$numnnc d
?nne f
AppConstantsnng s
.nns t
UpdateSuccess	nnt �
:
nn� �
AppConstants
nn� �
.
nn� �
InsertSuccess
nn� �
)
nn� �
)
nn� �
;
nn� �
}oo 
elsepp 
returnqq 
_ObjectResponseqq *
.qq* +
Createqq+ 1
(qq1 2
falseqq2 7
,qq7 8
(qq9 :
Int32qq: ?
)qq? @
HttpStatusCodeqq@ N
.qqN O

BadRequestqqO Y
,qqY Z
(qq[ \
	oResponseqq\ e
==qqf h
DBOperationqqi t
.qqt u
NotFoundqqu }
?qq~ 
AppConstants
qq� �
.
qq� �
NoRecordFound
qq� �
:
qq� �
AppConstants
qq� �
.
qq� �

BadRequest
qq� �
)
qq� �
)
qq� �
;
qq� �
}rr 
catchss 
(ss 
	Exceptionss 
exss 
)ss  
{tt 
returnuu 
_ObjectResponseuu &
.uu& '
Createuu' -
(uu- .
falseuu. 3
,uu3 4
(uu5 6
Int32uu6 ;
)uu; <
HttpStatusCodeuu< J
.uuJ K
InternalServerErroruuK ^
,uu^ _
Convertuu` g
.uug h
ToStringuuh p
(uup q
exuuq s
.uus t

StackTraceuut ~
)uu~ 
)	uu �
;
uu� �
}vv 
}ww 	
[yy 	
HttpGetyy	 
,yy 
Routeyy 
(yy 
$stryy &
)yy& '
]yy' (
publiczz 
asynczz 
Taskzz 
<zz 
IActionResultzz '
>zz' (
GetByIdzz) 0
(zz0 1
[zz1 2
	FromRoutezz2 ;
]zz; <
intzz= @
idzzA C
)zzC D
{{{ 	
try|| 
{}} 
var~~ 
oValuationEntity~~ $
=~~% &
await~~' ,
_valuationServices~~- ?
.~~? @
GetById~~@ G
(~~G H
id~~H J
)~~J K
;~~K L
if 
( 
oValuationEntity $
!=% '
null( ,
&&- /
oValuationEntity0 @
.@ A
IdA C
>D E
$numF G
)G H
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
oValuationEntity
��2 B
,
��B C
(
��D E
Int32
��E J
)
��J K
HttpStatusCode
��K Y
.
��Y Z
OK
��Z \
)
��\ ]
;
��] ^
else
�� 
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
null
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N

BadRequest
��N X
,
��X Y
AppConstants
��Z f
.
��f g
NoRecordFound
��g t
)
��t u
;
��u v
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
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
Convert
��` g
.
��g h
ToString
��h p
(
��p q
ex
��q s
.
��s t

StackTrace
��t ~
)
��~ 
)�� �
;��� �
}
�� 
}
�� 	
[
�� 	
HttpGet
��	 
,
�� 
Route
�� 
(
�� 
$str
�� 0
)
��0 1
]
��1 2
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
GetHeaderInfoById
��) :
(
��: ;
[
��; <
	FromRoute
��< E
]
��E F
int
��G J
id
��K M
)
��M N
{
�� 	
try
�� 
{
�� 
var
�� 
oValuationEntity
�� $
=
��% &
await
��' , 
_valuationServices
��- ?
.
��? @%
GetValuationRequestInfo
��@ W
(
��W X
id
��X Z
)
��Z [
;
��[ \
if
�� 
(
�� 
oValuationEntity
�� $
!=
��% '
null
��( ,
&&
��- /
oValuationEntity
��0 @
.
��@ A
Id
��A C
>
��D E
$num
��F G
)
��G H
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
oValuationEntity
��2 B
,
��B C
(
��D E
Int32
��E J
)
��J K
HttpStatusCode
��K Y
.
��Y Z
OK
��Z \
)
��\ ]
;
��] ^
else
�� 
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
null
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N

BadRequest
��N X
,
��X Y
AppConstants
��Z f
.
��f g
NoRecordFound
��g t
)
��t u
;
��u v
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
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
Convert
��` g
.
��g h
ToString
��h p
(
��p q
ex
��q s
.
��s t

StackTrace
��t ~
)
��~ 
)�� �
;��� �
}
�� 
}
�� 	
[
�� 	

HttpDelete
��	 
(
�� 
$str
�� !
)
��! "
]
��" #
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (
Delete
��) /
(
��/ 0
[
��0 1
	FromRoute
��1 :
]
��: ;
int
��< ?
id
��@ B
)
��B C
{
�� 	
try
�� 
{
�� 
DBOperation
�� 
	oResponse
�� %
=
��& '
await
��( - 
_valuationServices
��. @
.
��@ A
Delete
��A G
(
��G H
id
��H J
)
��J K
;
��K L
if
�� 
(
�� 
	oResponse
�� 
==
��  
DBOperation
��! ,
.
��, -
Success
��- 4
)
��4 5
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
true
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N
OK
��N P
,
��P Q
AppConstants
��R ^
.
��^ _
DeleteSuccess
��_ l
)
��l m
;
��m n
else
�� 
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
null
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N

BadRequest
��N X
,
��X Y
AppConstants
��Z f
.
��f g
NoRecordFound
��g t
)
��t u
;
��u v
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
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
Convert
��` g
.
��g h
ToString
��h p
(
��p q
ex
��q s
.
��s t

StackTrace
��t ~
)
��~ 
)�� �
;��� �
}
�� 
}
�� 	
[
�� 	
HttpPost
��	 
,
�� 
Route
�� 
(
�� 
$str
�� .
)
��. /
]
��/ 0
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (!
UpdateRequestStatus
��) <
(
��< =
[
��= >
FromBody
��> F
]
��F G.
 ValutionRequestStatusChangeModel
��H h
model
��i n
)
��n o
{
�� 	
try
�� 
{
�� 
DBOperation
�� 
	oResponse
�� %
=
��& '
await
��( - 
_valuationServices
��. @
.
��@ A!
UpdateRequestStatus
��A T
(
��T U
model
��U Z
)
��Z [
;
��[ \
if
�� 
(
�� 
	oResponse
�� 
==
��  
DBOperation
��! ,
.
��, -
Success
��- 4
)
��4 5
{
�� 
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
true
��2 6
,
��6 7
(
��8 9
Int32
��9 >
)
��> ?
HttpStatusCode
��? M
.
��M N
OK
��N P
,
��P Q
(
��R S
AppConstants
��S _
.
��_ `
InsertSuccess
��` m
)
��m n
)
��n o
;
��o p
}
�� 
else
�� 
return
�� 
_ObjectResponse
�� *
.
��* +
Create
��+ 1
(
��1 2
false
��2 7
,
��7 8
(
��9 :
Int32
��: ?
)
��? @
HttpStatusCode
��@ N
.
��N O

BadRequest
��O Y
,
��Y Z
(
��[ \
	oResponse
��\ e
==
��f h
DBOperation
��i t
.
��t u
NotFound
��u }
?
��~ 
AppConstants��� �
.��� �
NoRecordFound��� �
:��� �
AppConstants��� �
.��� �

BadRequest��� �
)��� �
)��� �
;��� �
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
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K!
InternalServerError
��K ^
,
��^ _
Convert
��` g
.
��g h
ToString
��h p
(
��p q
ex
��q s
.
��s t

StackTrace
��t ~
)
��~ 
)�� �
;��� �
}
�� 
}
�� 	
[
�� 	
HttpPost
��	 
,
�� 
Route
�� 
(
�� 
$str
�� /
)
��/ 0
]
��0 1
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' ("
UpsertApproverLevels
��) =
(
��= >
int
��> A
ValReqId
��B J
,
��J K
int
��L O
	CreatedBy
��P Y
,
��Y Z
int
��[ ^
	ValQuotId
��_ h
,
��h i
string
��j p
RequestData
��q |
)
��| }
{
�� 	
DBOperation
�� 
	oResponse
�� !
=
��" #
await
��$ ) 
_valuationServices
��* <
.
��< ="
UpsertApproverLevels
��= Q
(
��Q R
ValReqId
��R Z
,
��Z [
RequestData
��\ g
,
��g h
	CreatedBy
��i r
,
��r s
	ValQuotId
��t }
)
��} ~
;
��~ 
if
�� 
(
�� 
	oResponse
�� 
==
�� 
DBOperation
�� (
.
��( )
Success
��) 0
)
��0 1
{
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
true
��. 2
,
��2 3
(
��4 5
Int32
��5 :
)
��: ;
HttpStatusCode
��; I
.
��I J
OK
��J L
,
��L M
(
��N O
AppConstants
��O [
.
��[ \
InsertSuccess
��\ i
)
��i j
)
��j k
;
��k l
}
�� 
else
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K

BadRequest
��K U
,
��U V
(
��W X
	oResponse
��X a
==
��b d
DBOperation
��e p
.
��p q
NotFound
��q y
?
��z {
AppConstants��| �
.��� �
NoRecordFound��� �
:��� �
AppConstants��� �
.��� �

BadRequest��� �
)��� �
)��� �
;��� �
}
�� 	
[
�� 	
HttpPost
��	 
,
�� 
Route
�� 
(
�� 
$str
�� 0
)
��0 1
]
��1 2
public
�� 
async
�� 
Task
�� 
<
�� 
IActionResult
�� '
>
��' (#
ApproverActionComment
��) >
(
��> ?
[
��? @
FromBody
��@ H
]
��H I(
ApproverActionCommentModel
��J d
model
��e j
)
��j k
{
�� 	
DBOperation
�� 
	oResponse
�� !
=
��" #
await
��$ ) 
_valuationServices
��* <
.
��< =#
ApproverActionComment
��= R
(
��R S
model
��S X
)
��X Y
;
��Y Z
if
�� 
(
�� 
	oResponse
�� 
==
�� 
DBOperation
�� (
.
��( )
Success
��) 0
)
��0 1
{
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
true
��. 2
,
��2 3
(
��4 5
Int32
��5 :
)
��: ;
HttpStatusCode
��; I
.
��I J
OK
��J L
,
��L M
(
��N O
AppConstants
��O [
.
��[ \
InsertSuccess
��\ i
)
��i j
)
��j k
;
��k l
}
�� 
else
�� 
return
�� 
_ObjectResponse
�� &
.
��& '
Create
��' -
(
��- .
false
��. 3
,
��3 4
(
��5 6
Int32
��6 ;
)
��; <
HttpStatusCode
��< J
.
��J K

BadRequest
��K U
,
��U V
(
��W X
	oResponse
��X a
==
��b d
DBOperation
��e p
.
��p q
NotFound
��q y
?
��z {
AppConstants��| �
.��� �
NoRecordFound��� �
:��� �
AppConstants��� �
.��� �

BadRequest��� �
)��� �
)��� �
;��� �
}
�� 	
}
�� 
}�� �=
UD:\EltizamLive\Eltizam.WebApi\src\API\Controllers\ValuationRequestStatusController.cs
	namespace 	
Eltizam
 
. 
WebApi 
. 
Controllers $
{		 
[

 

ApiVersion

 
(

 
$str

 
)

 
]

 
[ 
Route 

(
 
$str 3
)3 4
]4 5
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class ,
 ValuationRequestStatusController 1
:2 3
ControllerBase4 B
{ 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
private 
readonly 
IResponseHandler )
<) *
dynamic* 1
>1 2
_ObjectResponse3 B
;B C
private 
	Microsoft 
. 

Extensions $
.$ %
Hosting% ,
., -
IHostingEnvironment- @
_envA E
;E F
private 
readonly 
IExceptionService *
_ExceptionService+ <
;< =
private 
readonly *
IValuationRequestStatusService 7!
_RequestStatusService8 M
;M N
public ,
 ValuationRequestStatusController /
(/ 0
IConfiguration0 >
configuration? L
,L M
IResponseHandlerN ^
<^ _
dynamic_ f
>f g
ObjectResponseh v
,v w
IExceptionService	x �
exceptionService
� �
,
� �,
IValuationRequestStatusService
� �"
RequestStatusService
� �
)
� �
{ 	
_configuration 
= 
configuration *
;* +
_ObjectResponse 
= 
ObjectResponse ,
;, -
_ExceptionService   
=   
exceptionService    0
;  0 1!
_RequestStatusService!! !
=!!" # 
RequestStatusService!!$ 8
;!!8 9
}"" 	
['' 	
HttpGet''	 
('' 
$str'' "
)''" #
]''# $
public(( 
async(( 
Task(( 
<(( 
IActionResult(( '
>((' (
GetAll(() /
(((/ 0
int((0 3
roleId((4 :
,((: ;
string((; A
action((B H
,((H I
int((J M
ValReqId((N V
)((V W
{)) 	
try** 
{++ 
return,, 
_ObjectResponse,, &
.,,& '

CreateData,,' 1
(,,1 2
await,,2 7!
_RequestStatusService,,8 M
.,,M N
GetAll,,N T
(,,T U
roleId,,U [
,,,[ \
action,,] c
,,,c d
ValReqId,,e m
),,m n
,,,n o
(,,p q
Int32,,q v
),,v w
HttpStatusCode	,,w �
.
,,� �
OK
,,� �
)
,,� �
;
,,� �
}-- 
catch.. 
(.. 
	Exception.. 
ex.. 
)..  
{// 
return00 
_ObjectResponse00 &
.00& '
Create00' -
(00- .
false00. 3
,003 4
(005 6
Int32006 ;
)00; <
HttpStatusCode00< J
.00J K
InternalServerError00K ^
,00^ _
Convert00` g
.00g h
ToString00h p
(00p q
ex00q s
.00s t

StackTrace00t ~
)00~ 
)	00 �
;
00� �
}11 
}22 	
[44 	
HttpGet44	 
(44 
$str44 
)44  
]44  !
public55 
async55 
Task55 
<55 
IActionResult55 '
>55' (
GetAllStatus55) 5
(555 6
)556 7
{66 	
try77 
{88 
return99 
_ObjectResponse99 &
.99& '

CreateData99' 1
(991 2
await992 7!
_RequestStatusService998 M
.99M N
GetAllStatus99N Z
(99Z [
)99[ \
,99\ ]
(99^ _
Int3299_ d
)99d e
HttpStatusCode99e s
.99s t
OK99t v
)99v w
;99w x
}:: 
catch;; 
(;; 
	Exception;; 
ex;; 
);;  
{<< 
return== 
_ObjectResponse== &
.==& '
Create==' -
(==- .
false==. 3
,==3 4
(==5 6
Int32==6 ;
)==; <
HttpStatusCode==< J
.==J K
InternalServerError==K ^
,==^ _
Convert==` g
.==g h
ToString==h p
(==p q
ex==q s
.==s t

StackTrace==t ~
)==~ 
)	== �
;
==� �
}>> 
}?? 	
[@@ 	
HttpGet@@	 
(@@ 
$str@@ 5
)@@5 6
]@@6 7
publicAA 
asyncAA 
TaskAA 
<AA 
IActionResultAA '
>AA' ('
GetInvoiceTransactionStatusAA) D
(AAD E
intAAE H
typeAAI M
)AAM N
{BB 	
tryCC 
{DD 
returnEE 
_ObjectResponseEE &
.EE& '

CreateDataEE' 1
(EE1 2
awaitEE2 7!
_RequestStatusServiceEE8 M
.EEM N'
GetInvoiceTransactionStatusEEN i
(EEi j
typeEEj n
)EEn o
,EEo p
(EEq r
Int32EEr w
)EEw x
HttpStatusCode	EEx �
.
EE� �
OK
EE� �
)
EE� �
;
EE� �
}FF 
catchGG 
(GG 
	ExceptionGG 
exGG 
)GG  
{HH 
returnII 
_ObjectResponseII &
.II& '
CreateII' -
(II- .
falseII. 3
,II3 4
(II5 6
Int32II6 ;
)II; <
HttpStatusCodeII< J
.IIJ K
InternalServerErrorIIK ^
,II^ _
ConvertII` g
.IIg h
ToStringIIh p
(IIp q
exIIq s
.IIs t

StackTraceIIt ~
)II~ 
)	II �
;
II� �
}JJ 
}KK 	
[MM 	
HttpGetMM	 
(MM 
$strMM 1
)MM1 2
]MM2 3
publicNN 
asyncNN 
TaskNN 
<NN 
IActionResultNN '
>NN' (
GetAllStatusHistoryNN) <
(NN< =
intNN= @
ValReqIdNNA I
)NNI J
{OO 	
tryPP 
{QQ 
returnRR 
_ObjectResponseRR &
.RR& '

CreateDataRR' 1
(RR1 2
awaitRR2 7!
_RequestStatusServiceRR8 M
.RRM N
GetAllStatusHistoryRRN a
(RRa b
ValReqIdRRb j
)RRj k
,RRk l
(RRm n
Int32RRn s
)RRs t
HttpStatusCode	RRt �
.
RR� �
OK
RR� �
)
RR� �
;
RR� �
}SS 
catchTT 
(TT 
	ExceptionTT 
exTT 
)TT  
{UU 
returnVV 
_ObjectResponseVV &
.VV& '
CreateVV' -
(VV- .
falseVV. 3
,VV3 4
(VV5 6
Int32VV6 ;
)VV; <
HttpStatusCodeVV< J
.VVJ K
InternalServerErrorVVK ^
,VV^ _
ConvertVV` g
.VVg h
ToStringVVh p
(VVp q
exVVq s
.VVs t

StackTraceVVt ~
)VV~ 
)	VV �
;
VV� �
}WW 
}XX 	
}ZZ 
}[[ �
ND:\EltizamLive\Eltizam.WebApi\src\API\Controllers\WeatherForecastController.cs
	namespace 	
Eltizam
 
. 
WebApi 
. 
Controllers $
{ 
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
[ 

ApiVersion 
( 
$str 
) 
] 
[		 
Route		 

(		
 
$str		 3
)		3 4
]		4 5
public

 

class

 %
WeatherForecastController

 *
:

+ ,
ControllerBase

- ;
{ 
private 
static 
readonly 
string  &
[& '
]' (
	Summaries) 2
=3 4
new5 8
[8 9
]9 :
{ 	
$str 
, 
$str !
,! "
$str# +
,+ ,
$str- 3
,3 4
$str5 ;
,; <
$str= C
,C D
$strE L
,L M
$strN S
,S T
$strU a
,a b
$strc n
} 	
;	 

private 
readonly 
ILogger  
<  !%
WeatherForecastController! :
>: ;
_logger< C
;C D
public %
WeatherForecastController (
(( )
ILogger) 0
<0 1%
WeatherForecastController1 J
>J K
loggerL R
)R S
{   	
_logger!! 
=!! 
logger!! 
;!! 
}## 	
[&& 	
HttpGet&&	 
,&& 
Route&& 
(&& 
$str&& %
)&&% &
]&&& '
public'' 
DateTime'' 
GetDateTime'' #
(''# $
)''$ %
{(( 	
return)) 
DateTime)) 
.)) 
Now)) 
;))  
}** 	
[,, 	
HttpGet,,	 
,,, 
Route,, 
(,, 
$str,, ,
),,, -
],,- .
public-- 
IEnumerable-- 
<-- 
WeatherForecast-- *
>--* +
Get--, /
(--/ 0
)--0 1
{.. 	
return// 

Enumerable// 
.// 
Range// #
(//# $
$num//$ %
,//% &
$num//' (
)//( )
.//) *
Select//* 0
(//0 1
index//1 6
=>//7 9
new//: =
WeatherForecast//> M
{00 
Date11 
=11 
DateTime11 
.11  
Now11  #
.11# $
AddDays11$ +
(11+ ,
index11, 1
)111 2
,112 3
TemperatureC22 
=22 
Random22 %
.22% &
Shared22& ,
.22, -
Next22- 1
(221 2
-222 3
$num223 5
,225 6
$num227 9
)229 :
,22: ;
Summary33 
=33 
	Summaries33 #
[33# $
Random33$ *
.33* +
Shared33+ 1
.331 2
Next332 6
(336 7
	Summaries337 @
.33@ A
Length33A G
)33G H
]33H I
}44 
)44 
.55 
ToArray55 
(55 
)55 
;55 
}66 	
}77 
}88 �
AD:\EltizamLive\Eltizam.WebApi\src\API\Extensions\AppExtensions.cs
	namespace 	
ValuationWeb
 
. 
Api 
. 

Extensions %
{		 
public 

static 
class 
AppExtensions %
{ 
public 
static 
void 
UseSwaggerExtension .
(. /
this/ 3
IApplicationBuilder4 G
appH K
)K L
{ 	
app 
. 

UseSwagger 
( 
) 
; 
app 
. 
UseSwaggerUI 
( 
c 
=> !
{ 
c 
. 
SwaggerEndpoint !
(! "
$str" <
,< =
$str> N
)N O
;O P
} 
) 
; 
} 	
} 
} �	
HD:\EltizamLive\Eltizam.WebApi\src\API\Extensions\HealthcheckExtension.cs
	namespace 	
GloboTicket
 
. 
TicketManagement &
.& '
Api' *
.* +

Extensions+ 5
{ 
[ #
ExcludeFromCodeCoverage 
] 
public		 

static		 
class		 ,
 HealthcheckExtensionRegistration		 8
{

 
public 
static 
IServiceCollection (*
AddHealthcheckExtensionService) G
(G H
thisH L
IServiceCollectionM _
services` h
,h i
IConfigurationj x
configuration	y �
)
� �
{ 	
var 

dbProvider 
= 
configuration *
.* +
GetValue+ 3
<3 4
string4 :
>: ;
(; <
$str< H
)H I
;I J
switch 
( 

dbProvider 
) 
{ 
default[[ 
:[[ 
break\\ 
;\\ 
}]] 
return__ 
services__ 
;__ 
}`` 	
}aa 
}bb �
ED:\EltizamLive\Eltizam.WebApi\src\API\Extensions\ServiceExtensions.cs
	namespace 	
ValuationWeb
 
. 
Api 
. 

Extensions %
{ 
[

 #
ExcludeFromCodeCoverage

 
]

 
public 

static 
class 
ServiceExtensions )
{ 
public 
static 
void 
AddSwaggerExtension .
(. /
this/ 3
IServiceCollection4 F
servicesG O
)O P
{ 	
services 
. 
AddSwaggerGen "
(" #
c# $
=>% '
{ 
c 
. !
AddSecurityDefinition '
(' (
$str( 0
,0 1
new2 5!
OpenApiSecurityScheme6 K
{ 
Description 
=  !
$str" <
,< =
Name 
= 
$str *
,* +
In 
= 
ParameterLocation *
.* +
Header+ 1
,1 2
Type 
= 
SecuritySchemeType -
.- .
ApiKey. 4
,4 5
Scheme 
= 
$str %
} 
) 
; 
c 
. "
AddSecurityRequirement (
(( )
new) ,&
OpenApiSecurityRequirement- G
(G H
)H I
{ 
{ 
new !
OpenApiSecurityScheme /
{   
	Reference!! !
=!!" #
new!!$ '
OpenApiReference!!( 8
{"" 
Type##  
=##! "
ReferenceType### 0
.##0 1
SecurityScheme##1 ?
,##? @
Id$$ 
=$$  
$str$$! )
}%% 
,%% 
Scheme&&  
=&&! "
$str&&# +
,&&+ ,
Name'' 
=''  
$str''! )
,'') *
In(( 
=(( 
ParameterLocation(( 0
.((0 1
Header((1 7
,((7 8
}** 
,** 
new++ 
List++  
<++  !
string++! '
>++' (
(++( )
)++) *
},, 
}-- 
)-- 
;-- 
c00 
.00 
OperationFilter00 !
<00! "0
$FileResultContentTypeOperationFilter00" F
>00F G
(00G H
)00H I
;00I J
}11 
)11 
;11 
}22 	
public33 
static33 
void33 *
AddSwaggerVersionedApiExplorer33 9
(339 :
this33: >
IServiceCollection33? Q
services33R Z
)33Z [
{44 	
services55 
.55 
AddApiVersioning55 %
(55% &
options55& -
=>55. 0
{66 
options77 
.77 
DefaultApiVersion77 )
=77* +
new77, /

ApiVersion770 :
(77: ;
$num77; <
,77< =
$num77> ?
)77? @
;77@ A
options88 
.88 /
#AssumeDefaultVersionWhenUnspecified88 ;
=88< =
true88> B
;88B C
options99 
.99 
ReportApiVersions99 )
=99* +
true99, 0
;990 1
}:: 
):: 
;:: 
services<< 
.<< #
AddVersionedApiExplorer<< ,
(<<, -
options<<- 4
=><<5 7
{== 
options@@ 
.@@ 
GroupNameFormat@@ '
=@@( )
$str@@* 2
;@@2 3
optionsDD 
.DD %
SubstituteApiVersionInUrlDD 1
=DD2 3
trueDD4 8
;DD8 9
}EE 
)EE 
;EE 
}GG 	
}HH 
}II �
CD:\EltizamLive\Eltizam.WebApi\src\API\Filters\AuthorizeAttribute.cs
	namespace 	
Eltizam
 
. 
WebApi 
. 
Filters  
{ 
[ 
AttributeUsage 
( 
AttributeTargets $
.$ %
Class% *
|+ ,
AttributeTargets- =
.= >
Method> D
)D E
]E F
public 

class 
AuthorizeAttribute #
:$ %
	Attribute& /
,/ 0 
IAuthorizationFilter1 E
{		 
public

 
void

 
OnAuthorization

 #
(

# $&
AuthorizationFilterContext

$ >
context

? F
)

F G
{ 	
var 
user 
= 
( 
UserSessionEntity )
)) *
context* 1
.1 2
HttpContext2 =
.= >
Items> C
[C D
$strD J
]J K
;K L
} 	
} 
} �C
@D:\EltizamLive\Eltizam.WebApi\src\API\Filters\ExceptionFilter.cs
	namespace 	
Eltizam
 
. 
WebApi 
. 
Filter 
{ 
public 

class 
ExceptionFilter  
:! "
IExceptionFilter# 3
{ 
private 
readonly 
ILogger  
<  !
ExceptionFilter! 0
>0 1
logger2 8
;8 9
private 
readonly 
IExceptionService *
_ExceptionService+ <
;< =
public 
ExceptionFilter 
( 
ILogger &
<& '
ExceptionFilter' 6
>6 7
logger8 >
,> ?
IExceptionService@ Q
exceptionServiceR b
)b c
{ 	
this 
. 
logger 
= 
logger  
;  !
_ExceptionService 
= 
exceptionService  0
;0 1
} 	
public 
void 
OnException 
(  
ExceptionContext  0
context1 8
)8 9
{ 	
HttpStatusCode 

statusCode %
=& '
(( )
context) 0
.0 1
	Exception1 :
as; =
WebException> J
!=K M
nullN R
&&S U
( 
( 
HttpWebResponse (
)( )
() *
context* 1
.1 2
	Exception2 ;
as< >
WebException? K
)K L
.L M
ResponseM U
)U V
!=W Y
nullZ ^
)^ _
?` a
( 
( 
HttpWebResponse )
)) *
(* +
context+ 2
.2 3
	Exception3 <
as= ?
WebException@ L
)L M
.M N
ResponseN V
)V W
.W X

StatusCodeX b
: 
getErrorCode &
(& '
context' .
.. /
	Exception/ 8
.8 9
GetType9 @
(@ A
)A B
)B C
;C D
HttpResponse 
response !
=" #
context$ +
.+ ,
HttpContext, 7
.7 8
Response8 @
;@ A
response   
.   

StatusCode   
=    !
(  " #
int  # &
)  & '

statusCode  ' 1
;  1 2
response!! 
.!! 
ContentType!!  
=!!! "
$str!!# 5
;!!5 6
var## 
responseModel## 
=## 
new##  #
APIResponseEntity##$ 5
<##5 6
string##6 <
>##< =
(##= >
)##> ?
{##@ A
_errorMessages##B P
=##Q R
new##S V
List##W [
<##[ \
string##\ b
>##b c
{##d e
context##f m
.##m n
	Exception##n w
.##w x
Message##x 
}
##� �
,
##� �
_Success
##� �
=
##� �
false
##� �
}
##� �
;
##� �
var%% 
result%% 
=%% 
JsonConvert%% $
.%%$ %
SerializeObject%%% 4
(%%4 5
responseModel%%5 B
)%%B C
;%%C D
logger'' 
.'' 
LogCritical'' 
('' 
context'' &
.''& '
	Exception''' 0
,''0 1
context''2 9
.''9 :
	Exception'': C
.''C D
Message''D K
)''K L
;''L M
_ExceptionService(( 
.(( 
LogException(( *
(((* +
context((+ 2
.((2 3
	Exception((3 <
)((< =
;((= >
response)) 
.)) 
ContentLength)) "
=))# $
result))% +
.))+ ,
Length)), 2
;))2 3
response** 
.** 

WriteAsync** 
(**  
result**  &
)**& '
;**' (
}++ 	
private-- 
HttpStatusCode-- 
getErrorCode-- +
(--+ ,
Type--, 0
exceptionType--1 >
)--> ?
{.. 	

Exceptions// 
tryParseResult// %
;//% &
if00 
(00 
Enum00 
.00 
TryParse00 
<00 

Exceptions00 (
>00( )
(00) *
exceptionType00* 7
.007 8
Name008 <
,00< =
out00> A
tryParseResult00B P
)00P Q
)00Q R
{11 
switch22 
(22 
tryParseResult22 &
)22& '
{33 
case44 

Exceptions44 #
.44# $"
NullReferenceException44$ :
:44: ;
return55 
HttpStatusCode55 -
.55- .
LengthRequired55. <
;55< =
case77 

Exceptions77 #
.77# $!
FileNotFoundException77$ 9
:779 :
return88 
HttpStatusCode88 -
.88- .
NotFound88. 6
;886 7
case:: 

Exceptions:: #
.::# $
OverflowException::$ 5
:::5 6
return;; 
HttpStatusCode;; -
.;;- .(
RequestedRangeNotSatisfiable;;. J
;;;J K
case== 

Exceptions== #
.==# $ 
OutOfMemoryException==$ 8
:==8 9
return>> 
HttpStatusCode>> -
.>>- .
ExpectationFailed>>. ?
;>>? @
case@@ 

Exceptions@@ #
.@@# $ 
InvalidCastException@@$ 8
:@@8 9
returnAA 
HttpStatusCodeAA -
.AA- .
PreconditionFailedAA. @
;AA@ A
caseCC 

ExceptionsCC #
.CC# $#
ObjectDisposedExceptionCC$ ;
:CC; <
returnDD 
HttpStatusCodeDD -
.DD- .
GoneDD. 2
;DD2 3
caseFF 

ExceptionsFF #
.FF# $'
UnauthorizedAccessExceptionFF$ ?
:FF? @
returnGG 
HttpStatusCodeGG -
.GG- .
UnauthorizedGG. :
;GG: ;
caseII 

ExceptionsII #
.II# $#
NotImplementedExceptionII$ ;
:II; <
returnJJ 
HttpStatusCodeJJ -
.JJ- .
NotImplementedJJ. <
;JJ< =
caseLL 

ExceptionsLL #
.LL# $!
NotSupportedExceptionLL$ 9
:LL9 :
returnMM 
HttpStatusCodeMM -
.MM- .
NotAcceptableMM. ;
;MM; <
caseOO 

ExceptionsOO #
.OO# $%
InvalidOperationExceptionOO$ =
:OO= >
returnPP 
HttpStatusCodePP -
.PP- .
MethodNotAllowedPP. >
;PP> ?
caseRR 

ExceptionsRR #
.RR# $
TimeoutExceptionRR$ 4
:RR4 5
returnSS 
HttpStatusCodeSS -
.SS- .
RequestTimeoutSS. <
;SS< =
caseUU 

ExceptionsUU #
.UU# $
ArgumentExceptionUU$ 5
:UU5 6
returnVV 
HttpStatusCodeVV -
.VV- .

BadRequestVV. 8
;VV8 9
caseXX 

ExceptionsXX #
.XX# $"
StackOverflowExceptionXX$ :
:XX: ;
returnYY 
HttpStatusCodeYY -
.YY- .(
RequestedRangeNotSatisfiableYY. J
;YYJ K
case[[ 

Exceptions[[ #
.[[# $
FormatException[[$ 3
:[[3 4
return\\ 
HttpStatusCode\\ -
.\\- . 
UnsupportedMediaType\\. B
;\\B C
case^^ 

Exceptions^^ #
.^^# $
IOException^^$ /
:^^/ 0
return__ 
HttpStatusCode__ -
.__- .
NotFound__. 6
;__6 7
caseaa 

Exceptionsaa #
.aa# $$
IndexOutOfRangeExceptionaa$ <
:aa< =
returnbb 
HttpStatusCodebb -
.bb- .
ExpectationFailedbb. ?
;bb? @
defaultdd 
:dd 
returnee 
HttpStatusCodeee -
.ee- .
InternalServerErroree. A
;eeA B
}ff 
}gg 
elsehh 
{ii 
returnjj 
HttpStatusCodejj %
.jj% &
InternalServerErrorjj& 9
;jj9 :
}kk 
}ll 	
}mm 
}nn �
JD:\EltizamLive\Eltizam.WebApi\src\API\Helpers\Response\IResponseHandler.cs
	namespace 	
Eltizam
 
. 
WebApi 
. 
Helpers  
.  !
Response! )
{ 
public 

	interface 
IResponseHandler %
<% &
T& '
>' (
where) .
T/ 0
:1 2
class3 8
{ 
IActionResult 
Create 
( 
T 
? 
Data  $
,$ %
int& )
?) *

StatusCode+ 5
,5 6
string7 =
?= >
Message? F
=G H
nullI M
,M N
stringO U
?U V
ReturnToUrlW b
=c d
nulle i
,i j
Listk o
<o p
stringp v
>v w
errorMessages	x �
=
� �
null
� �
)
� �
;
� �
IActionResult		 
CreateError		 !
(		! "
T		" #
Data		$ (
,		( )
int		* -
?		- .

StatusCode		/ 9
,		9 :
	Exception		; D
?		D E
errorMessages		F S
=		T U
null		V Z
,		Z [
string		\ b
?		b c
Message		d k
=		l m
null		n r
,		r s
string		t z
?		z {
ReturnToUrl			| �
=
		� �
null
		� �
)
		� �
;
		� �
IActionResult 

CreateData  
(  !
T! "
?" #
Data$ (
,( )
int* -
?- .

StatusCode/ 9
)9 :
;: ;
} 
} �)
ID:\EltizamLive\Eltizam.WebApi\src\API\Helpers\Response\ResponseHandler.cs
	namespace 	
Eltizam
 
. 
WebApi 
. 
Helpers  
.  !
Response! )
{ 
public 

class 
ResponseHandler  
<  !
T! "
>" #
:$ %
IResponseHandler& 6
<6 7
T7 8
>8 9
where: ?
T@ A
:B C
classD I
{ 
public 
IActionResult 
Create #
(# $
T$ %
Data& *
,* +
int, /
?/ 0

StatusCode1 ;
,; <
string= C
MessageD K
=L M
nullN R
,R S
stringT Z
ReturnToUrl[ f
=g h
nulli m
,m n
Listo s
<s t
stringt z
>z {
errorMessages	| �
=
� �
null
� �
)
� �
{		 	
APIResponseEntity

 
<

 
T

 
>

  
	retResult

! *
=

+ ,
new

- 0
APIResponseEntity

1 B
<

B C
T

C D
>

D E
(

E F
)

F G
;

G H
	retResult 
. 
_object 
= 
Data  $
;$ %
	retResult 
. 
_Message 
=  
Message! (
;( )
	retResult 
. 
_ReturnToUrl "
=# $
ReturnToUrl% 0
;0 1
	retResult 
. 
_errorMessages $
=% &
errorMessages' 4
;4 5
if 
( 

StatusCode 
== 
$num !
)! "
	retResult 
. 
_Success "
=# $
true% )
;) *
else 
	retResult 
. 
_Success "
=# $
false% *
;* +
return 
new 
ObjectResult #
(# $
	retResult$ -
)- .
{/ 0

StatusCode1 ;
=< =

StatusCode> H
}I J
;J K
} 	
public 
IActionResult 
CreateError (
(( )
T) *
Data+ /
,/ 0
int1 4
?4 5

StatusCode6 @
,@ A
	ExceptionB K
exL N
=O P
nullQ U
,U V
stringW ]
Message^ e
=f g
nullh l
,l m
stringn t
ReturnToUrl	u �
=
� �
null
� �
)
� �
{ 	
var 
err 
= 
new 
List 
< 
string %
>% &
(& '
)' (
;( )
if 
( 
ex 
!= 
null 
) 
{ 
err 
. 
Add 
( 
ex 
. 
Message "
)" #
;# $
err 
. 
Add 
( 
ex 
. 
InnerException )
?) *
.* +
Message+ 2
)2 3
;3 4
} 
APIResponseEntity!! 
<!! 
T!! 
>!!  
	retResult!!! *
=!!+ ,
new!!- 0
APIResponseEntity!!1 B
<!!B C
T!!C D
>!!D E
(!!E F
)!!F G
;!!G H
	retResult"" 
."" 
_object"" 
="" 
Data""  $
;""$ %
	retResult## 
.## 
_Message## 
=##  
Message##! (
;##( )
	retResult$$ 
.$$ 
_ReturnToUrl$$ "
=$$# $
ReturnToUrl$$% 0
;$$0 1
	retResult%% 
.%% 
_errorMessages%% $
=%%% &
err%%' *
;%%* +
if'' 
('' 

StatusCode'' 
=='' 
$num'' !
)''! "
	retResult(( 
.(( 
_Success(( "
=((# $
true((% )
;(() *
else)) 
	retResult** 
.** 
_Success** "
=**# $
false**% *
;*** +
return,, 
new,, 
ObjectResult,, #
(,,# $
	retResult,,$ -
),,- .
{,,/ 0

StatusCode,,1 ;
=,,< =

StatusCode,,> H
},,I J
;,,J K
}-- 	
public// 
IActionResult// 

CreateData// '
(//' (
T//( )
Data//* .
,//. /
int//0 3
?//3 4

StatusCode//5 ?
)//? @
{00 	
return11 
new11 
ObjectResult11 #
(11# $
Data11$ (
)11( )
{11* +

StatusCode11, 6
=117 8

StatusCode119 C
}11D E
;11E F
}22 	
}33 
}44 �:
SD:\EltizamLive\Eltizam.WebApi\src\API\Middlewares\JwtAuthenticationServiceConfig.cs
	namespace		 	
Eltizam		
 
.		 
WebApi		 
.		 
Middlewares		 $
{

 
public 

static 
class *
JwtAuthenticationServiceConfig 6
{ 
public 
static 
void (
AddJwtAuthenticationServices 7
(7 8
this8 <
IServiceCollection= O
servicesP X
,X Y
IConfigurationZ h
configurationi v
)v w
{ 	
var 
authSettings 
= 
configuration ,
., -

GetSection- 7
(7 8
$str8 =
)= >
;> ?
services 
. 
	Configure 
< 

JwtOptions )
>) *
(* +
authSettings+ 7
)7 8
;8 9
var 
appSettings 
= 
authSettings *
.* +
Get+ .
<. /

JwtOptions/ 9
>9 :
(: ;
); <
;< =
var 
key 
= 
Encoding 
. 
ASCII $
.$ %
GetBytes% -
(- .
appSettings. 9
.9 :
	secretKey: C
)C D
;D E
var 

signingKey 
= 
new   
SymmetricSecurityKey! 5
(5 6
key6 9
)9 :
;: ;
var !
tokenValidationParams %
=& '
new( +%
TokenValidationParameters, E
(E F
)F G
{ $
ValidateIssuerSigningKey (
=) *
true+ /
,/ 0
ValidIssuer 
= 
configuration +
[+ ,
$str, 8
]8 9
.9 :
ToString: B
(B C
)C D
,D E
ValidateIssuer 
=  
false! &
,& '
ValidateLifetime  
=! "
true# '
,' (
ValidAudience   
=   
configuration    -
[  - .
$str  . <
]  < =
.  = >
ToString  > F
(  F G
)  G H
,  H I
ValidateAudience!!  
=!!! "
false!!# (
,!!( )
RequireSignedTokens"" #
=""$ %
true""& *
,""* +
IssuerSigningKey##  
=##! "

signingKey### -
}$$ 
;$$ 
}11 	
public33 
static33 
UserSessionEntity33 '
ValidateToken33( 5
(335 6
UserSessionEntity336 G

userEntity33H R
,33R S
string44 
audienceUri44 !
,44! "
string55 
	issuerUri55 
,55  
Guid66 
applicationId66 !
,66! "
DateTime77 
expires77 
,77  
string88 
	secretKey88 
=88  !
null88" &
,88& '
bool99 
isReAuthToken99 !
=99" #
false99$ )
)99) *
{:: 	
var;; 
tokenHandler;; 
=;; 
new;; "#
JwtSecurityTokenHandler;;# :
(;;: ;
);;; <
;;;< =
var<< 
key<< 
=<< 
Encoding<< 
.<< 
ASCII<< $
.<<$ %
GetBytes<<% -
(<<- .
	secretKey<<. 7
)<<7 8
;<<8 9
var>> 
claims>> 
=>> 
new>> 
List>> !
<>>! "
Claim>>" '
>>>' (
(>>( )
)>>) *
;>>* +
claims@@ 
.@@ 
Add@@ 
(@@ 
new@@ 
Claim@@  
(@@  !
$str@@! (
,@@( )

userEntity@@* 4
.@@4 5
Email@@5 :
)@@: ;
)@@; <
;@@< =
claimsAA 
.AA 
AddAA 
(AA 
newAA 
ClaimAA  
(AA  !
$strAA! +
,AA+ ,

userEntityAA- 7
.AA7 8
UserNameAA8 @
)AA@ A
)AAA B
;AAB C
claimsBB 
.BB 
AddBB 
(BB 
newBB 
ClaimBB  
(BB  !
$strBB! )
,BB) *

userEntityBB+ 5
.BB5 6
UserIdBB6 <
.BB< =
ToStringBB= E
(BBE F
)BBF G
)BBG H
)BBH I
;BBI J
claimsCC 
.CC 
AddCC 
(CC 
newCC 
ClaimCC  
(CC  !
$strCC! )
,CC) *
(CC+ ,

userEntityCC, 6
.CC6 7
RoleIdCC7 =
==CC> @
nullCCA E
||CCF H

userEntityCCI S
.CCS T
RoleIdCCT Z
<=CC[ ]
$numCC^ _
?CC` a
StringCCb h
.CCh i
EmptyCCi n
:CCo p

userEntityCCq {
.CC{ |
RoleId	CC| �
.
CC� �
ToString
CC� �
(
CC� �
)
CC� �
)
CC� �
)
CC� �
)
CC� �
;
CC� �
varGG 
tokenDescriptorGG 
=GG  !
newGG" %#
SecurityTokenDescriptorGG& =
{HH 
SubjectII 
=II 
newII 
ClaimsIdentityII ,
(II, -
claimsII- 3
)II3 4
,II4 5
ExpiresJJ 
=JJ 
AppConstantsJJ &
.JJ& '
DateTimeJJ' /
.JJ/ 0

AddMinutesJJ0 :
(JJ: ;
$numJJ; >
)JJ> ?
,JJ? @
SigningCredentialsKK "
=KK# $
newKK% (
SigningCredentialsKK) ;
(KK; <
newKK< ? 
SymmetricSecurityKeyKK@ T
(KKT U
keyKKU X
)KKX Y
,KKY Z
SecurityAlgorithmsKK[ m
.KKm n 
HmacSha256Signature	KKn �
)
KK� �
}LL 
;LL 
varNN 
tokenNN 
=NN 
tokenHandlerNN $
.NN$ %
CreateTokenNN% 0
(NN0 1
tokenDescriptorNN1 @
)NN@ A
;NNA B

userEntityPP 
.PP 
	UserTokenPP  
=PP! "
tokenHandlerPP# /
.PP/ 0

WriteTokenPP0 :
(PP: ;
tokenPP; @
)PP@ A
;PPA B

userEntityQQ 
.QQ 
VallidToQQ 
=QQ  !
ConvertQQ" )
.QQ) *

ToDateTimeQQ* 4
(QQ4 5
tokenDescriptorQQ5 D
.QQD E
ExpiresQQE L
)QQL M
;QQM N
returnRR 

userEntityRR 
;RR 
}SS 	
}TT 
publicVV 

classVV 

JwtOptionsVV 
{WW 
publicXX 
stringXX 
	secretKeyXX 
{XX  !
getXX" %
;XX% &
setXX' *
;XX* +
}XX, -
publicYY 
stringYY 
issuerYY 
{YY 
getYY "
;YY" #
setYY$ '
;YY' (
}YY) *
publicZZ 
boolZZ 
validateLifetimeZZ $
{ZZ% &
getZZ' *
;ZZ* +
setZZ, /
;ZZ/ 0
}ZZ1 2
}[[ 
}\\ �!
BD:\EltizamLive\Eltizam.WebApi\src\API\Middlewares\JwtMiddleware.cs
	namespace 	
Eltizam
 
. 
WebApi 
. 
Middlewares $
{		 
public

 

class

 
JwtMiddleware

 
{ 
private 
readonly 
RequestDelegate (
_next) .
;. /
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
public 
JwtMiddleware 
( 
RequestDelegate ,
next- 1
,1 2
IConfiguration3 A
ConfigurationB O
)O P
{ 	
_next 
= 
next 
; 
_configuration 
= 
Configuration *
;* +
} 	
public 
async 
Task 
Invoke  
(  !
HttpContext! ,
context- 4
,4 5
IMasterUserService6 H
userServiceI T
,T U
IConfigurationV d
Configuratione r
)r s
{ 	
var 
token 
= 
context 
.  
Request  '
.' (
Headers( /
[/ 0
$str0 ?
]? @
.@ A
FirstOrDefaultA O
(O P
)P Q
?Q R
.R S
SplitS X
(X Y
$strY \
)\ ]
.] ^
Last^ b
(b c
)c d
;d e
if 
( 
token 
!= 
null 
) 
attachUserToContext #
(# $
context$ +
,+ ,
userService- 8
,8 9
token: ?
)? @
;@ A
await 
_next 
( 
context 
)  
;  !
} 	
private 
void 
attachUserToContext (
(( )
HttpContext) 4
context5 <
,< =
IMasterUserService> P
userServiceQ \
,\ ]
string^ d
tokene j
)j k
{   	
try!! 
{"" 
var## 
tokenHandler##  
=##! "
new### &#
JwtSecurityTokenHandler##' >
(##> ?
)##? @
;##@ A
var$$ 
key$$ 
=$$ 
Encoding$$ "
.$$" #
ASCII$$# (
.$$( )
GetBytes$$) 1
($$1 2
_configuration$$2 @
[$$@ A
$str$$A P
]$$P Q
)$$Q R
;$$R S
tokenHandler%% 
.%% 
ValidateToken%% *
(%%* +
token%%+ 0
,%%0 1
new%%2 5%
TokenValidationParameters%%6 O
{&& $
ValidateIssuerSigningKey'' ,
=''- .
true''/ 3
,''3 4
IssuerSigningKey(( $
=((% &
new((' * 
SymmetricSecurityKey((+ ?
(((? @
key((@ C
)((C D
,((D E
ValidateIssuer)) "
=))# $
false))% *
,))* +
ValidateAudience** $
=**% &
false**' ,
,**, -
	ClockSkew,, 
=,, 
TimeSpan,,  (
.,,( )
Zero,,) -
}-- 
,-- 
out-- 
SecurityToken-- $
validatedToken--% 3
)--3 4
;--4 5
var// 
jwtToken// 
=// 
(//  
JwtSecurityToken//  0
)//0 1
validatedToken//1 ?
;//? @
UserSessionEntity11 !
oUserLoggedInModel11" 4
=115 6
UtilityHelper117 D
.11D E
GetUserFromClaims11E V
(11V W
jwtToken11W _
.11_ `
Claims11` f
)11f g
;11g h
context44 
.44 
Items44 
[44 
$str44 $
]44$ %
=44& '
oUserLoggedInModel44( :
;44: ;
}55 
catch66 
(66 
	Exception66 
ex66 
)66  
{77 
}:: 
};; 	
}<< 
}== �;
ID:\EltizamLive\Eltizam.WebApi\src\API\Middlewares\MiddlewareExtensions.cs
	namespace 	
Eltizam
 
. 
WebApi 
. 
Middlewares $
{ 
public		 

static		 
class		  
MiddlewareExtensions		 ,
{

 
public 
static 
IApplicationBuilder )%
UseCustomExceptionHandler* C
(C D
thisD H
IApplicationBuilderI \
builder] d
)d e
{ 	
return 
builder 
. 
UseMiddleware (
<( )&
ExceptionHandlerMiddleware) C
>C D
(D E
)E F
;F G
} 	
} 
public 

class &
ExceptionHandlerMiddleware +
{ 
private 
readonly 
RequestDelegate (
_next) .
;. /
private 
readonly 
ILogger  
_logger! (
;( )
public &
ExceptionHandlerMiddleware )
() *
RequestDelegate* 9
next: >
,> ?
ILogger@ G
<G H&
ExceptionHandlerMiddlewareH b
>b c
loggerd j
)j k
{ 	
_next 
= 
next 
; 
_logger !
=" #
logger$ *
;* +
} 	
public 
async 
Task 
Invoke  
(  !
HttpContext! ,
context- 4
)4 5
{ 	
try 
{ 
await 
_next 
( 
context #
)# $
;$ %
}   
catch!! 
(!! 
	Exception!! 
ex!! 
)!!  
{"" 
_logger## 
.## 
LogError##  
(##  !
ex##! #
,### $
$str##% '
,##' (
null##) -
)##- .
;##. /
await$$ 
ConvertException$$ &
($$& '
context$$' .
,$$. /
ex$$0 2
)$$2 3
;$$3 4
}%% 
}&& 	
private(( 
Task(( 
ConvertException(( %
(((% &
HttpContext((& 1
context((2 9
,((9 :
	Exception((; D
	exception((E N
)((N O
{)) 	
HttpStatusCode** 
httpStatusCode** )
=*** +
HttpStatusCode**, :
.**: ;
InternalServerError**; N
;**N O
context,, 
.,, 
Response,, 
.,, 
ContentType,, (
=,,) *
$str,,+ =
;,,= >
var.. 
result.. 
=.. 
string.. 
...  
Empty..  %
;..% &
switch00 
(00 
	exception00 
)00 
{11 
case22 
ValidationException22 (
validationException22) <
:22< =
httpStatusCode33 "
=33# $
HttpStatusCode33% 3
.333 4

BadRequest334 >
;33> ?
result44 
=44 
GetErrorMessages44 -
(44- .
validationException44. A
.44A B
ValdationErrors44B Q
)44Q R
;44R S
break55 
;55 
case66 
BadRequestException66 (
badRequestException66) <
:66< =
httpStatusCode77 "
=77# $
HttpStatusCode77% 3
.773 4

BadRequest774 >
;77> ?
result88 
=88 
GetErrorMessage88 ,
(88, -
badRequestException88- @
.88@ A
Message88A H
)88H I
;88I J
break99 
;99 
case:: 
NotFoundException:: &
notFoundException::' 8
:::8 9
httpStatusCode;; "
=;;# $
HttpStatusCode;;% 3
.;;3 4
NotFound;;4 <
;;;< =
result<< 
=<< 
GetErrorMessage<< ,
(<<, -
notFoundException<<- >
.<<> ?
Message<<? F
)<<F G
;<<G H
break== 
;== 
case>>  
ApplicationException>> )
appexception>>* 6
:>>6 7
httpStatusCode?? "
=??# $
HttpStatusCode??% 3
.??3 4

BadRequest??4 >
;??> ?
result@@ 
=@@ 
GetErrorMessage@@ ,
(@@, -
appexception@@- 9
.@@9 :
Message@@: A
)@@A B
;@@B C
breakAA 
;AA 
caseBB 
	ExceptionBB 
exBB !
:BB! "
httpStatusCodeCC "
=CC# $
HttpStatusCodeCC% 3
.CC3 4

BadRequestCC4 >
;CC> ?
resultDD 
=DD 
GetErrorMessageDD ,
(DD, -
$strDD- j
+DDk l
exDDm o
.DDo p
MessageDDp w
)DDw x
;DDx y
breakEE 
;EE 
}FF 
contextHH 
.HH 
ResponseHH 
.HH 

StatusCodeHH '
=HH( )
(HH* +
intHH+ .
)HH. /
httpStatusCodeHH/ =
;HH= >
returnJJ 
contextJJ 
.JJ 
ResponseJJ #
.JJ# $

WriteAsyncJJ$ .
(JJ. /
resultJJ/ 5
)JJ5 6
;JJ6 7
}KK 	
privateMM 
stringMM 
GetErrorMessageMM &
(MM& '
stringMM' -
messageMM. 5
)MM5 6
{NN 	
varOO 
responseOO 
=OO 
newOO 
ResponseOO '
<OO' (
stringOO( .
>OO. /
(OO/ 0
)OO0 1
;OO1 2
responsePP 
.PP 
	SucceededPP 
=PP  
falsePP! &
;PP& '
responseQQ 
.QQ 
ErrorsQQ 
=QQ 
newQQ !
ListQQ" &
<QQ& '
stringQQ' -
>QQ- .
(QQ. /
)QQ/ 0
;QQ0 1
responseRR 
.RR 
ErrorsRR 
.RR 
AddRR 
(RR  
messageRR  '
)RR' (
;RR( )
returnSS 
JsonConvertSS 
.SS 
SerializeObjectSS .
(SS. /
responseSS/ 7
)SS7 8
;SS8 9
}UU 	
privateWW 
stringWW 
GetErrorMessagesWW '
(WW' (
ListWW( ,
<WW, -
stringWW- 3
>WW3 4
messagesWW5 =
)WW= >
{XX 	
varYY 
responseYY 
=YY 
newYY 
ResponseYY '
<YY' (
stringYY( .
>YY. /
(YY/ 0
)YY0 1
;YY1 2
responseZZ 
.ZZ 
	SucceededZZ 
=ZZ  
falseZZ! &
;ZZ& '
response[[ 
.[[ 
Errors[[ 
=[[ 
new[[ !
List[[" &
<[[& '
string[[' -
>[[- .
([[. /
)[[/ 0
;[[0 1
response\\ 
.\\ 
Errors\\ 
=\\ 
messages\\ &
;\\& '
return]] 
JsonConvert]] 
.]] 
SerializeObject]] .
(]]. /
response]]/ 7
)]]7 8
;]]8 9
}__ 	
}`` 
}aa �_
0D:\EltizamLive\Eltizam.WebApi\src\API\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
IConfiguration  
configurationBuilder #
=$ %
new& ) 
ConfigurationBuilder* >
(> ?
)? @
. 
AddJsonFile 
( 
$str #
,# $
optional% -
:- .
false/ 4
,4 5
reloadOnChange6 D
:D E
trueF J
)J K
. 
AddJsonFile 
( 
$" 

$str
 
{ 
Environment "
." #"
GetEnvironmentVariable# 9
(9 :
$str: R
)R S
}S T
$strT Y
"Y Z
,Z [
optional   
:   
true   
)   
.!! 
Build!! 

(!!
 
)!! 
;!! 
Log## 
.## 
Logger## 

=## 
new## 
LoggerConfiguration## $
(##$ %
)##% &
.$$ 
ReadFrom$$ 
.$$ 
Configuration$$ 
($$  
configurationBuilder$$ 0
)$$0 1
.%% !
CreateBootstrapLogger%% 
(%% 
)%% 
.%% 
Freeze%% #
(%%# $
)%%$ %
;%%% &
new'' 
LoggerConfiguration'' 
('' 
)'' 
.(( 
ReadFrom(( 
.(( 
Configuration(( 
(((  
configurationBuilder(( 0
)((0 1
.)) 
CreateLogger)) 
()) 
))) 
;)) 
builder++ 
.++ 
Host++ 
.++ 

UseSerilog++ 
(++ 
(++ 
ctx++ 
,++ 
lc++  
)++  !
=>++" $
lc++% '
.,, 	
WriteTo,,	 
.,, 
Console,, 
(,, 
),, 
.-- 	
ReadFrom--	 
.-- 
Configuration-- 
(--  
ctx--  #
.--# $
Configuration--$ 1
)--1 2
)--2 3
;--3 4
IConfiguration00 
Configuration00 
=00 
builder00 &
.00& '
Configuration00' 4
;004 5
string11 "
MyAllowSpecificOrigins11 
=11 
$str11  9
;119 :
var33 
services33 
=33 
builder33 
.33 
Services33 
;33  
string55 
Urls55 
=55 
Configuration55 
.55 

GetSection55 &
(55& '
$str55' 9
)559 :
.55: ;

GetSection55; E
(55E F
$str55F L
)55L M
.55M N
Value55N S
;55S T
services66 
.66 	
AddCors66	 
(66 
options66 
=>66 
{77 
options99 
.99 
	AddPolicy99 
(99 
name99 
:99 "
MyAllowSpecificOrigins99 2
,992 3
builder:: 
=>:: 
{;; 	
builder<< 
.== 
AllowAnyOrigin== 
(== 
)== 
.>> 
AllowAnyHeader>> 
(>> 
)>> 
.?? 
AllowAnyMethod?? 
(?? 
)?? 
;?? 
}@@ 	
)@@	 

;@@
 
}AA 
)AA 
;AA 
servicesCC 
.CC 	"
AddApplicationServicesCC	 
(CC  
)CC  !
;CC! "
servicesEE 
.EE 	
AddSingletonEE	 
<EE  
IHttpContextAccessorEE *
,EE* +
HttpContextAccessorEE, ?
>EE? @
(EE@ A
)EEA B
;EEB C
servicesHH 
.HH 	
	AddScopedHH	 
(HH 
typeofHH 
(HH 
IResponseHandlerHH *
<HH* +
>HH+ ,
)HH, -
,HH- .
typeofHH/ 5
(HH5 6
ResponseHandlerHH6 E
<HHE F
>HHF G
)HHG H
)HHH I
;HHI J
servicesKK 
.KK 	"
AddPersistenceServicesKK	 
(KK  
ConfigurationKK  -
)KK- .
;KK. /
servicesMM 
.MM 	
AddSwaggerExtensionMM	 
(MM 
)MM 
;MM 
servicesNN 
.NN 	*
AddSwaggerVersionedApiExplorerNN	 '
(NN' (
)NN( )
;NN) *
servicesOO 
.OO 	
AddTransientOO	 
<OO 
IConfigureOptionsOO '
<OO' (
SwaggerGenOptionsOO( 9
>OO9 :
,OO: ;#
ConfigureSwaggerOptionsOO< S
>OOS T
(OOT U
)OOU V
;OOV W
servicesPP 
.PP 	
AddSwaggerGenPP	 
(PP 
optionsPP 
=>PP !
optionsPP" )
.PP) *
OperationFilterPP* 9
<PP9 : 
SwaggerDefaultValuesPP: N
>PPN O
(PPO P
)PPP Q
)PPQ R
;PPR S
servicesQQ 
.QQ 	
AddControllersQQ	 
(QQ 
)QQ 
;QQ 
servicesRR 
.RR 	
AddControllersRR	 
(RR 
)RR 
.RR 
AddNewtonsoftJsonRR +
(RR+ ,
)RR, -
;RR- .
servicesSS 
.SS 	
AddDataProtectionSS	 
(SS 
)SS 
.TT #
PersistKeysToFileSystemTT 
(TT 
newTT  
DirectoryInfoTT! .
(TT. /
$strTT/ I
)TTI J
)TTJ K
;TTK L
builder[[ 
.[[ 
Services[[ 
.[[ 
AddSwaggerGen[[ 
([[ 
)[[  
;[[  !
builder\\ 
.\\ 
Services\\ 
.\\ 
AddControllers\\ 
(\\  
)\\  !
;\\! "
builderaa 
.aa 
Servicesaa 
.aa #
AddEndpointsApiExploreraa (
(aa( )
)aa) *
;aa* +
varcc 
connectionStringcc 
=cc 
buildercc 
.cc 
Configurationcc ,
.cc, -
GetConnectionStringcc- @
(cc@ A
$strccA P
)ccP Q
;ccQ R
builderdd 
.dd 
Servicesdd 
.dd 
AddDbContextdd 
<dd 
EltizamDBContextdd .
>dd. /
(dd/ 0
xdd0 1
=>dd2 4
xdd5 6
.dd6 7
UseSqlServerdd7 C
(ddC D
connectionStringddD T
)ddT U
)ddU V
;ddV W
DatabaseConnectionee 
.ee 

ConnStringee 
=ee 
connectionStringee  0
;ee0 1
builderhh 
.hh 
Serviceshh 
.hh 
	AddScopedhh 
<hh 
IUnitOfWorkhh &
,hh& '

UnitOfWorkhh( 2
>hh2 3
(hh3 4
)hh4 5
;hh5 6
builderii 
.ii 
Servicesii 
.ii 
	AddScopedii 
<ii 
IMapperFactoryii )
,ii) *
MapperFactoryii+ 8
>ii8 9
(ii9 :
)ii: ;
;ii; <
builderjj 
.jj 
Servicesjj 
.jj 
	AddScopedjj 
<jj 
IMapperjj "
,jj" #
Mapperjj$ *
>jj* +
(jj+ ,
)jj, -
;jj- .
builderkk 
.kk 
Serviceskk 
.kk 
	AddScopedkk 
<kk 
IHelperkk "
,kk" #
Helperkk$ *
>kk* +
(kk+ ,
)kk, -
;kk- .
builderll 
.ll 
Servicesll 
.ll 
	AddScopedll 
<ll 
IExceptionServicell ,
,ll, -
ExceptionServicell. >
>ll> ?
(ll? @
)ll@ A
;llA B
buildermm 
.mm 
Servicesmm 
.mm 
	AddScopedmm 
<mm 
IAuditLogServicemm +
,mm+ ,
AuditLogServicemm- <
>mm< =
(mm= >
)mm> ?
;mm? @
varxx 
appxx 
=xx 	
builderxx
 
.xx 
Buildxx 
(xx 
)xx 
;xx 
usingzz 
(zz 
varzz 

scopezz 
=zz 
appzz 
.zz 
Serviceszz 
.zz  
CreateScopezz  +
(zz+ ,
)zz, -
)zz- .
{{{ 
try|| 
{}} 
Log~~ 
.~~ 
Information~~ 
(~~ 
$str~~ .
)~~. /
;~~/ 0
var 
userManager 
= 
scope 
.  
ServiceProvider  /
./ 0

GetService0 :
<: ;
UserManager; F
<F G
ApplicationUserG V
>V W
>W X
(X Y
)Y Z
;Z [
}
�� 
catch
�� 	
(
��
 
	Exception
�� 
ex
�� 
)
�� 
{
�� 
Log
�� 
.
�� 
Warning
�� 
(
�� 
ex
�� 
,
�� 
$str
�� I
)
��I J
;
��J K
}
�� 
}�� 
app�� 
.
�� !
UseHttpsRedirection
�� 
(
�� 
)
�� 
;
�� 
app�� 
.
�� 
UseAuthentication
�� 
(
�� 
)
�� 
;
�� 
app�� 
.
�� 

UseSwagger
�� 
(
�� 
)
�� 
;
�� *
IApiVersionDescriptionProvider�� 
provider
�� '
=
��( )
app
��* -
.
��- .
Services
��. 6
.
��6 7 
GetRequiredService
��7 I
<
��I J,
IApiVersionDescriptionProvider
��J h
>
��h i
(
��i j
)
��j k
;
��k l
app�� 
.
�� 
UseSwaggerUI
�� 
(
�� 
options�� 
=>
�� 

{�� 
foreach
�� 
(
�� 
var
�� 
description
�� 
in
�� 
provider
��  (
.
��( )$
ApiVersionDescriptions
��) ?
)
��? @
{
�� 
options
�� 
.
�� 
SwaggerEndpoint
�� 
(
��  
$"
��  "
$str
��" +
{
��+ ,
description
��, 7
.
��7 8
	GroupName
��8 A
}
��A B
$str
��B O
"
��O P
,
��P Q
description
��R ]
.
��] ^
	GroupName
��^ g
.
��g h
ToUpperInvariant
��h x
(
��x y
)
��y z
)
��z {
;
��{ |
}
�� 
}�� 
)
�� 
;
�� 
app�� 
.
�� '
UseCustomExceptionHandler
�� 
(
�� 
)
�� 
;
��  
app�� 
.
�� 
UseCors
�� 
(
�� 
x
�� 
=>
�� 
x
�� 
.
�� 
AllowAnyOrigin
�� !
(
��! "
)
��" #
.
�� 
AllowAnyMethod
�� 
(
��  
)
��  !
.
�� 
AllowAnyHeader
�� 
(
��  
)
��  !
)
��! "
;
��" #
app�� 
.
�� 
UseAuthorization
�� 
(
�� 
)
�� 
;
�� 
app�� 
.
�� 
MapControllers
�� 
(
�� 
)
�� 
;
�� 
app�� 
.
�� 
Run
�� 
(
�� 
)
�� 	
;
��	 

public�� 
partial
�� 
class
�� 
Program
�� 
{
�� 
}
��  �
0D:\EltizamLive\Eltizam.WebApi\src\API\Startup.cs
	namespace 	
Eltizam
 
. 
WebApi 
{ 
public 

class 
Startup 
{		 
public

 
Startup

 
(

 
IConfiguration

 %
configuration

& 3
)

3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{ 	
DatabaseConnection 
. 

ConnString )
=* +
Configuration, 9
.9 :

GetSection: D
(D E
$strE f
)f g
.g h
Valueh m
;m n
services 
. 
	AddScoped 
< 
IMasterUserService 1
,1 2
MasterUserService3 D
>D E
(E F
)F G
;G H
services 
. 
AddControllers #
(# $
options$ +
=>, .
{ 
options 
. 
Filters 
.  
Add  #
(# $
typeof$ *
(* +
ExceptionFilter+ :
): ;
); <
;< =
} 
) 
. 
AddJsonOptions 
( 
options %
=>& (
{ 
options 
. !
JsonSerializerOptions -
.- .
WriteIndented. ;
=< =
true> B
;B C
} 
) 
. 
AddNewtonsoftJson  
(  !
)! "
;" #
}   	
}!! 
}"" �
ND:\EltizamLive\Eltizam.WebApi\src\API\swaggerhelper\ConfigureSwaggerOptions.cs
	namespace 	
Eltizam
 
. 
WebApi 
. 
SwaggerHelper &
{ 
[ #
ExcludeFromCodeCoverage 
] 
public 
class #
ConfigureSwaggerOptions %
:& '
IConfigureOptions( 9
<9 :
SwaggerGenOptions: K
>K L
{ 
private 	
readonly
 *
IApiVersionDescriptionProvider 1
	_provider2 ;
;; <
public #
ConfigureSwaggerOptions	  
(  !*
IApiVersionDescriptionProvider! ?
provider@ H
)H I
=>J L
	_providerM V
=W X
providerY a
;a b
public 
void	 
	Configure 
( 
SwaggerGenOptions )
options* 1
)1 2
{ 
foreach 

( 
var 
description 
in 
	_provider (
.( )"
ApiVersionDescriptions) ?
)? @
{ 
options 
. 

SwaggerDoc 
( 
description "
." #
	GroupName# ,
,, -#
CreateInfoForApiVersion. E
(E F
descriptionF Q
)Q R
)R S
;S T
} 
} 
private   	
static  
 
OpenApiInfo   #
CreateInfoForApiVersion   4
(  4 5!
ApiVersionDescription  5 J
description  K V
)  V W
{!! 
var"" 
environment"" 
="" 
Environment""  
.""  !"
GetEnvironmentVariable""! 7
(""7 8
$str""8 P
)""P Q
;""Q R
var## 
info## 
=## 
new## 
OpenApiInfo## 
(## 
)## 
{$$ 
Title%% 	
=%%
 
$str%% "
+%%" #
environment%%$ /
+%%0 1
$str%%1 4
+%%4 5
$str%%6 ?
,%%? @
Version&& 
=&& 
description&& 
.&& 

ApiVersion&& $
.&&$ %
ToString&&% -
(&&- .
)&&. /
,&&/ 0
}'' 
;'' 
if)) 
()) 
description)) 
.)) 
IsDeprecated)) 
)))  
{** 
info++ 
.++ 	
Description++	 
+=++ 
$str++ @
;++@ A
},, 
return.. 	
info..
 
;.. 
}// 
}00 
}11 �
KD:\EltizamLive\Eltizam.WebApi\src\API\swaggerhelper\SwaggerDefaultValues.cs
	namespace 	
Eltizam
 
. 
WebApi 
. 
SwaggerHelper &
{ 
[ #
ExcludeFromCodeCoverage 
] 
public 
class  
SwaggerDefaultValues "
:# $
IOperationFilter% 5
{ 
public 
void	 
Apply 
( 
OpenApiOperation $
	operation% .
,. /"
OperationFilterContext0 F
contextG N
)N O
{ 
var 
apiDescription 
= 
context 
.  
ApiDescription  .
;. /
	operation 
. 

Deprecated 
|= 
apiDescription )
.) *
IsDeprecated* 6
(6 7
)7 8
;8 9
if 
( 
	operation 
. 

Parameters 
== 
null #
)# $
return 

;
 
foreach 

( 
var 
	parameter 
in 
	operation &
.& '

Parameters' 1
)1 2
{ 
var 
description 
= 
apiDescription $
.$ %!
ParameterDescriptions% :
.: ;
First; @
(@ A
pA B
=>C E
pF G
.G H
NameH L
==M O
	parameterP Y
.Y Z
NameZ ^
)^ _
;_ `
if 
( 
	parameter 
. 
Description 
==  
null! %
)% &
{ 
	parameter 
. 
Description 
= 
description (
.( )
ModelMetadata) 6
?6 7
.7 8
Description8 C
;C D
} 
if!! 
(!! 
	parameter!! 
.!! 
Schema!! 
.!! 
Default!!  
==!!! #
null!!$ (
&&!!) +
description!!, 7
.!!7 8
DefaultValue!!8 D
!=!!E G
null!!H L
)!!L M
{"" 
	parameter## 
.## 
Schema## 
.## 
Default## 
=## 
new##  #
OpenApiString##$ 1
(##1 2
description##2 =
.##= >
DefaultValue##> J
.##J K
ToString##K S
(##S T
)##T U
)##U V
;##V W
}$$ 
	parameter&& 
.&& 
Required&& 
|=&& 
description&& %
.&&% &

IsRequired&&& 0
;&&0 1
}'' 
}(( 
})) 
}** �
OD:\EltizamLive\Eltizam.WebApi\src\API\Utility\FileResultContentTypeAttribute.cs
	namespace 	
Eltizam
 
. 
WebApi 
. 
Utility  
{ 
[ 
AttributeUsage 
( 
AttributeTargets $
.$ %
Method% +
)+ ,
], -
public 

class *
FileResultContentTypeAttribute /
:0 1
	Attribute2 ;
{ 
public *
FileResultContentTypeAttribute -
(- .
string. 4
contentType5 @
)@ A
{ 	
ContentType		 
=		 
contentType		 %
;		% &
}

 	
public 
string 
ContentType !
{" #
get$ '
;' (
}) *
} 
} �
UD:\EltizamLive\Eltizam.WebApi\src\API\Utility\FileResultContentTypeOperationFilter.cs
	namespace 	
Eltizam
 
. 
WebApi 
. 
Utility  
{ 
public 

class 0
$FileResultContentTypeOperationFilter 5
:6 7
IOperationFilter8 H
{ 
public 
void 
Apply 
( 
OpenApiOperation *
	operation+ 4
,4 5"
OperationFilterContext6 L
contextM T
)T U
{		 	
var

 
requestAttribute

  
=

! "
context

# *
.

* +

MethodInfo

+ 5
.

5 6
GetCustomAttributes

6 I
(

I J
typeof

J P
(

P Q*
FileResultContentTypeAttribute

Q o
)

o p
,

p q
false

r w
)

w x
. 
Cast 
< *
FileResultContentTypeAttribute 4
>4 5
(5 6
)6 7
. 
FirstOrDefault 
(  
)  !
;! "
if 
( 
requestAttribute  
==! #
null$ (
)( )
return* 0
;0 1
	operation 
. 
	Responses 
.  
Clear  %
(% &
)& '
;' (
	operation 
. 
	Responses 
.  
Add  #
(# $
$str$ )
,) *
new+ .
OpenApiResponse/ >
{ 
Content 
= 
new 

Dictionary (
<( )
string) /
,/ 0
OpenApiMediaType1 A
>A B
{ 
{ 
requestAttribute $
.$ %
ContentType% 0
,0 1
new2 5
OpenApiMediaType6 F
{ 
Schema 
=  
new! $
OpenApiSchema% 2
{ 
Type  
=! "
$str# +
,+ ,
Format "
=# $
$str% -
} 
} 
} 
} 
}   
)   
;   
}!! 	
}"" 
}## �
8D:\EltizamLive\Eltizam.WebApi\src\API\WeatherForecast.cs
	namespace 	
Eltizam
 
. 
WebApi 
{ 
public 

class 
WeatherForecast  
{ 
public 
DateTime 
Date 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
TemperatureC 
{  !
get" %
;% &
set' *
;* +
}, -
public		 
int		 
TemperatureF		 
=>		  "
$num		# %
+		& '
(		( )
int		) ,
)		, -
(		- .
TemperatureC		. :
/		; <
$num		= C
)		C D
;		D E
public 
string 
? 
Summary 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} 