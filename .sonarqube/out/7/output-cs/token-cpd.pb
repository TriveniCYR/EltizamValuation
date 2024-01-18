ƒl
;D:\EltizamLive\Eltizam.Api\Controllers\AccountController.cs
	namespace 	
Eltizam
 
. 
Api 
. 
Controllers !
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
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
private 	
readonly
 
IStringLocalizer #
<# $
Errors$ *
>* +!
_stringLocalizerError, A
;A B
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
MasterUserService	  | ç
,
  ç é
IStringLocalizer
  è ü
<
  ü †
Errors
  † ¶
>
  ¶ ß"
stringLocalizerError
  ® º
,
  º Ω
IExceptionService
  æ œ
exceptionService
  – ‡
,
  ‡ ·
IHelper
  ‚ È
helper
  Í 
)
   Ò
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
;$$) *!
_stringLocalizerError%% 
=%%  
stringLocalizerError%% /
;%%/ 0
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
$str	HH| ã
]
HHã å
)
HHå ç
;
HHç é
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
,MMS T!
_stringLocalizerErrorMMU j
[MMj k
$strMMk w
]MMw x
)MMx y
;MMy z
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
)	ii Ä
;
iiÄ Å
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
ÄÄ 
_ObjectResponse
ÄÄ &
.
ÄÄ& '
Create
ÄÄ' -
(
ÄÄ- .
false
ÄÄ. 3
,
ÄÄ3 4
(
ÄÄ5 6
Int32
ÄÄ6 ;
)
ÄÄ; <
HttpStatusCode
ÄÄ< J
.
ÄÄJ K!
InternalServerError
ÄÄK ^
,
ÄÄ^ _
Convert
ÄÄ` g
.
ÄÄg h
ToString
ÄÄh p
(
ÄÄp q
ex
ÄÄq s
.
ÄÄs t

StackTrace
ÄÄt ~
)
ÄÄ~ 
)ÄÄ Ä
;ÄÄÄ Å
}
ÅÅ 
}
ÇÇ 	
[
ÑÑ 	
AllowAnonymous
ÑÑ	 
]
ÑÑ 
[
ÖÖ 	
HttpGet
ÖÖ	 
,
ÖÖ 
Route
ÖÖ 
(
ÖÖ 
$str
ÖÖ @
)
ÖÖ@ A
]
ÖÖA B
public
ÜÜ 
async
ÜÜ 
Task
ÜÜ 
<
ÜÜ 
bool
ÜÜ 
>
ÜÜ %
CheckEmailAddressExists
ÜÜ  7
(
ÜÜ7 8
[
ÜÜ8 9
	FromRoute
ÜÜ9 B
]
ÜÜB C
string
ÜÜD J
emailAddress
ÜÜK W
)
ÜÜW X
{
áá 	
try
àà 
{
ââ 
return
ää 
await
ää  
_MasterUserService
ää /
.
ää/ 0%
CheckEmailAddressExists
ää0 G
(
ääG H
emailAddress
ääH T
)
ääT U
;
ääU V
}
ãã 
catch
åå 
(
åå 
	Exception
åå 
ex
åå 
)
åå  
{
çç 
await
éé 
_ExceptionService
éé '
.
éé' (
LogException
éé( 4
(
éé4 5
ex
éé5 7
)
éé7 8
;
éé8 9
return
èè 
false
èè 
;
èè 
}
êê 
}
ëë 	
[
ìì 	
AllowAnonymous
ìì	 
]
ìì 
[
îî 	
HttpGet
îî	 
,
îî 
Route
îî 
(
îî 
$str
îî .
)
îî. /
]
îî/ 0
public
ïï 
async
ïï 
Task
ïï 
<
ïï 
bool
ïï 
>
ïï 
IsTokenValid
ïï  ,
(
ïï, -
[
ïï- .
	FromRoute
ïï. 7
]
ïï7 8
string
ïï9 ?
token
ïï@ E
)
ïïE F
{
ññ 	
try
óó 
{
òò 
return
ôô 
await
ôô  
_MasterUserService
ôô /
.
ôô/ 0
IsTokenValid
ôô0 <
(
ôô< =
token
ôô= B
)
ôôB C
;
ôôC D
}
öö 
catch
õõ 
(
õõ 
	Exception
õõ 
ex
õõ 
)
õõ  
{
úú 
await
ùù 
_ExceptionService
ùù '
.
ùù' (
LogException
ùù( 4
(
ùù4 5
ex
ùù5 7
)
ùù7 8
;
ùù8 9
return
ûû 
false
ûû 
;
ûû 
}
üü 
}
†† 	
}
·· 
}‚‚ ›=
<D:\EltizamLive\Eltizam.Api\Controllers\AuditLogController.cs
	namespace		 	
EltizamValuation		
 
.		 
Api		 
.		 
Controllers		 *
{

 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class 
AuditLogController #
:$ %
ControllerBase& 4
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
private 
readonly 
IExceptionService *
_ExceptionService+ <
;< =
private 
readonly 
IAuditLogService )
_auditLogService* :
;: ;
public 
AuditLogController !
(! "
IConfiguration" 0
configuration1 >
,> ?
IResponseHandler@ P
<P Q
dynamicQ X
>X Y
ObjectResponseZ h
,h i
IExceptionServicej {
exceptionService	| å
,
å ç
IAuditLogService
é û
auditLog
ü ß
)
ß ®
{ 	
_configuration 
= 
configuration *
;* +
_ObjectResponse 
= 
ObjectResponse ,
;, -
_ExceptionService 
= 
exceptionService  0
;0 1
_auditLogService 
= 
auditLog '
;' (
}   	
['' 	
HttpPost''	 
,'' 
Route'' 
('' 
$str'' !
)''! "
]''" #
public(( 
async(( 
Task(( 
<(( 
IActionResult(( '
>((' (
GetAll(() /
(((/ 0
[((0 1
FromForm((1 9
]((9 :"
DataTableAjaxPostModel((; Q
model((R W
,((W X
int((Y \
?((\ ]
UserName((^ f
,((f g
string((h n
?((n o
	TableName((p y
=((z {
null	((| Ä
,
((Ä Å
DateTime
((É ã
?
((ã å
DateFrom
((ç ï
=
((ñ ó
null
((ò ú
,
((ú ù
DateTime
((û ¶
?
((¶ ß
DateTo
((® Æ
=
((Ø ∞
null
((± µ
)
((µ ∂
{)) 	
try** 
{++ 
return22 
_ObjectResponse22 &
.22& '

CreateData22' 1
(221 2
await222 7
_auditLogService228 H
.22H I
GetAll22I O
(22O P
model22P U
,22U V
UserName22W _
,22_ `
	TableName22a j
,22j k
DateFrom22l t
,22t u
DateTo22v |
)22| }
,22} ~
(	22 Ä
Int32
22Ä Ö
)
22Ö Ü
HttpStatusCode
22Ü î
.
22î ï
OK
22ï ó
)
22ó ò
;
22ò ô
}33 
catch44 
(44 
	Exception44 
ex44 
)44  
{55 
await66 
_ExceptionService66 '
.66' (
LogException66( 4
(664 5
ex665 7
)667 8
;668 9
return77 
_ObjectResponse77 &
.77& '
Create77' -
(77- .
false77. 3
,773 4
(775 6
Int32776 ;
)77; <
HttpStatusCode77< J
.77J K
InternalServerError77K ^
,77^ _
Convert77` g
.77g h
ToString77h p
(77p q
ex77q s
.77s t

StackTrace77t ~
)77~ 
)	77 Ä
;
77Ä Å
}88 
}99 	
[<< 	
HttpGet<<	 
,<< 
Route<< 
(<< 
$str<< '
)<<' (
]<<( )
public== 
async== 
Task== 
<== 
IActionResult== '
>==' (
GetLogDetails==) 6
(==6 7
string==7 =
?=== >
	TableName==? H
,==H I
int==J M
?==M N
Id==O Q
,==Q R
int==S V
?==V W
TableKey==X `
,==` a
DateTime==b j
?==j k
DateFrom==l t
,==t u
DateTime==v ~
?==~ 
DateTo
==Ä Ü
)
==Ü á
{>> 	
try?? 
{@@ 
varAA 
listAA 
=AA 
awaitAA  
_auditLogServiceAA! 1
.AA1 2"
GetLogDetailsByFiltersAA2 H
(AAH I
	TableNameAAI R
,AAR S
IdAAT V
,AAV W
TableKeyAAX `
,AA` a
DateFromAAb j
,AAj k
DateToAAl r
)AAr s
;AAs t
ifCC 
(CC 
listCC 
!=CC 
nullCC  
)CC  !
returnDD 
_ObjectResponseDD *
.DD* +
CreateDD+ 1
(DD1 2
listDD2 6
,DD6 7
(DD8 9
Int32DD9 >
)DD> ?
HttpStatusCodeDD? M
.DDM N
OKDDN P
)DDP Q
;DDQ R
elseEE 
returnFF 
_ObjectResponseFF *
.FF* +
CreateFF+ 1
(FF1 2
nullFF2 6
,FF6 7
(FF8 9
Int32FF9 >
)FF> ?
HttpStatusCodeFF? M
.FFM N

BadRequestFFN X
,FFX Y
AppConstantsFFZ f
.FFf g
NoRecordFoundFFg t
)FFt u
;FFu v
}GG 
catchHH 
(HH 
	ExceptionHH 
exHH 
)HH  
{II 
awaitJJ 
_ExceptionServiceJJ '
.JJ' (
LogExceptionJJ( 4
(JJ4 5
exJJ5 7
)JJ7 8
;JJ8 9
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
)	KK Ä
;
KKÄ Å
}LL 
}MM 	
[OO 	
HttpGetOO	 
(OO 
$strOO *
)OO* +
]OO+ ,
publicPP 
asyncPP 
TaskPP 
<PP 
IActionResultPP '
>PP' (#
GetAllAuditLogTableNamePP) @
(PP@ A
)PPA B
{QQ 	
tryRR 
{SS 
returnTT 
_ObjectResponseTT &
.TT& '

CreateDataTT' 1
(TT1 2
awaitTT2 7
_auditLogServiceTT8 H
.TTH I#
GetAllAuditLogTableNameTTI `
(TT` a
)TTa b
,TTb c
(TTd e
Int32TTe j
)TTj k
HttpStatusCodeTTk y
.TTy z
OKTTz |
)TT| }
;TT} ~
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
)	XX Ä
;
XXÄ Å
}YY 
}ZZ 	
}\\ 
}]] €:
?D:\EltizamLive\Eltizam.Api\Controllers\FileUploadController .cs
	namespace		 	
Eltizam		
 
.		 
Api		 
.		 
Controllers		 !
{

 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class  
FileUploadController %
:& '
ControllerBase( 6
{ 
private 	
readonly
 
IUploadService !
_UploadService" 0
;0 1
private 	
readonly
 
IResponseHandler #
<# $
dynamic$ +
>+ ,
_ObjectResponse- <
;< =
private 	
readonly
 
IExceptionService $
_ExceptionService% 6
;6 7
public  
FileUploadController	 
( 
IUploadService ,
UploadService- :
,: ;
IResponseHandler< L
<L M
dynamicM T
>T U
ObjectResponseV d
,d e
IExceptionServicef w
exceptionService	x à
)
à â
{ 
_UploadService 
= 
UploadService !
;! "
_ObjectResponse 
= 
ObjectResponse #
;# $
_ExceptionService 
= 
exceptionService '
;' (
} 
[// 
HttpPost// 
(// 
$str// 
)// 
]// 
public00 
async00	 
Task00 
<00 
IActionResult00 !
>00! "
Upload00# )
(00) *
List00* .
<00. /
	IFormFile00/ 8
>008 9
files00: ?
)00? @
{11 
try22 
{33 
DBOperation44 
	oResponse44 
=44 
await44 !
_UploadService44" 0
.440 1
SaveFilesAsync441 ?
(44? @
files44@ E
)44E F
;44F G
if55 
(55 
	oResponse55 
==55 
DBOperation55  
.55  !
Success55! (
)55( )
{66 
return77 
_ObjectResponse77 
.77 
Create77 "
(77" #
true77# '
,77' (
(77) *
Int3277* /
)77/ 0
HttpStatusCode770 >
.77> ?
OK77? A
,77A B
(77C D
AppConstants77D P
.77P Q
InsertSuccess77Q ^
)77^ _
)77_ `
;77` a
}88 
else99 
return:: 
_ObjectResponse:: 
.:: 
Create:: "
(::" #
false::# (
,::( )
(::* +
Int32::+ 0
)::0 1
HttpStatusCode::1 ?
.::? @

BadRequest::@ J
,::J K
(::L M
	oResponse::M V
==::W Y
DBOperation::Z e
.::e f
NotFound::f n
?::o p
$str	::q É
:
::Ñ Ö
AppConstants
::Ü í
.
::í ì

BadRequest
::ì ù
)
::ù û
)
::û ü
;
::ü †
};; 
catch<< 
(<<	 

ArgumentException<<
 
ex<< 
)<< 
{== 
return>> 


BadRequest>> 
(>> 
ex>> 
.>> 
Message>>  
)>>  !
;>>! "
}?? 
catch@@ 
(@@	 

	Exception@@
 
ex@@ 
)@@ 
{AA 
awaitBB 	
_ExceptionServiceBB
 
.BB 
LogExceptionBB (
(BB( )
exBB) +
)BB+ ,
;BB, -
returnCC 

_ObjectResponseCC 
.CC 
CreateCC !
(CC! "
falseCC" '
,CC' (
(CC) *
Int32CC* /
)CC/ 0
HttpStatusCodeCC0 >
.CC> ?
InternalServerErrorCC? R
,CCR S
ConvertCCT [
.CC[ \
ToStringCC\ d
(CCd e
exCCe g
.CCg h

StackTraceCCh r
)CCr s
)CCs t
;CCt u
}DD 
}EE 
[GG 
HttpGetGG 

(GG
 
$strGG 
)GG 
]GG 
publicHH 
asyncHH	 
TaskHH 
<HH 
IActionResultHH !
>HH! "
GetAllFilesHH# .
(HH. /
)HH/ 0
{II 
tryJJ 
{KK 
varMM 
uploadsMM 
=MM 
awaitMM 
_UploadServiceMM &
.MM& '
GetAllUploadsAsyncMM' 9
(MM9 :
)MM: ;
;MM; <
returnNN 

OkNN 
(NN 
uploadsNN 
)NN 
;NN 
}OO 
catchPP 
(PP	 

	ExceptionPP
 
exPP 
)PP 
{QQ 
returnTT 


StatusCodeTT 
(TT 
$numTT 
,TT 
$"TT 
$strTT 4
{TT4 5
exTT5 7
.TT7 8
MessageTT8 ?
}TT? @
"TT@ A
)TTA B
;TTB C
}UU 
}VV 
[XX 
HttpGetXX 

(XX
 
$strXX 
)XX 
]XX 
publicYY 
asyncYY	 
TaskYY 
<YY 
IActionResultYY !
>YY! "
GetFileByIdYY# .
(YY. /
intYY/ 2
idYY3 5
)YY5 6
{ZZ 
try[[ 
{\\ 
DBOperation^^ 
	oResponse^^ 
=^^ 
await^^ !
_UploadService^^" 0
.^^0 1
GetUploadByIdAsync^^1 C
(^^C D
id^^D F
)^^F G
;^^G H
if__ 
(__ 
	oResponse__ 
==__ 
DBOperation__  
.__  !
Success__! (
)__( )
return`` 
_ObjectResponse`` 
.`` 
Create`` "
(``" #
true``# '
,``' (
(``) *
Int32``* /
)``/ 0
HttpStatusCode``0 >
.``> ?
OK``? A
,``A B
$str``C U
)``U V
;``V W
elseaa 
returnbb 
_ObjectResponsebb 
.bb 
Createbb "
(bb" #
nullbb# '
,bb' (
(bb) *
Int32bb* /
)bb/ 0
HttpStatusCodebb0 >
.bb> ?

BadRequestbb? I
,bbI J
AppConstantsbbK W
.bbW X
NoRecordFoundbbX e
)bbe f
;bbf g
}cc 
catchdd 
(dd	 

	Exceptiondd
 
exdd 
)dd 
{ee 
awaithh 	
_ExceptionServicehh
 
.hh 
LogExceptionhh (
(hh( )
exhh) +
)hh+ ,
;hh, -
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
}kk 
}ll 
}pp 
}qq ˘j
>D:\EltizamLive\Eltizam.Api\Controllers\MasterCityController.cs
	namespace 	
EltizamValuation
 
. 
Api 
. 
Controllers *
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class  
MasterCityController %
:& '
ControllerBase( 6
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
private 
readonly 
IStringLocalizer )
<) *
Errors* 0
>0 1!
_stringLocalizerError2 G
;G H
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
IStringLocalizerl |
<| }
Errors	} É
>
É Ñ"
stringLocalizerError
Ö ô
,
ô ö
IExceptionService
õ ¨
exceptionService
≠ Ω
,
Ω æ 
IMasterCityService
ø —
CityService
“ ›
)
› ﬁ
{   	
_configuration!! 
=!! 
configuration!! *
;!!* +
_ObjectResponse"" 
="" 
ObjectResponse"" ,
;"", -!
_stringLocalizerError## !
=##" # 
stringLocalizerError##$ 8
;##8 9
_ExceptionService$$ 
=$$ 
exceptionService$$  0
;$$0 1
_CityService%% 
=%% 
CityService%% &
;%%& '
}&& 	
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
await??2 7
_CityService??8 D
.??D E
GetAll??E K
(??K L
model??L Q
)??Q R
,??R S
(??T U
Int32??U Z
)??Z [
HttpStatusCode??[ i
.??i j
OK??j l
)??l m
;??m n
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
)	CC Ä
;
CCÄ Å
}DD 
}EE 	
[HH 	
HttpGetHH	 
,HH 
RouteHH 
(HH 
$strHH &
)HH& '
]HH' (
publicII 
asyncII 
TaskII 
<II 
IActionResultII '
>II' (
GetByIdII) 0
(II0 1
[II1 2
	FromRouteII2 ;
]II; <
intII= @
idIIA C
)IIC D
{JJ 	
tryKK 
{LL 
varMM 
oCityEntityMM 
=MM  !
awaitMM" '
_CityServiceMM( 4
.MM4 5
GetByIdMM5 <
(MM< =
idMM= ?
)MM? @
;MM@ A
ifNN 
(NN 
oCityEntityNN 
!=NN  "
nullNN# '
&&NN( *
oCityEntityNN+ 6
.NN6 7
IdNN7 9
>NN: ;
$numNN< =
)NN= >
returnOO 
_ObjectResponseOO *
.OO* +
CreateOO+ 1
(OO1 2
oCityEntityOO2 =
,OO= >
(OO? @
Int32OO@ E
)OOE F
HttpStatusCodeOOF T
.OOT U
OKOOU W
)OOW X
;OOX Y
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
)	UU Ä
;
UUÄ Å
}VV 
}WW 	
[ZZ 	
HttpPostZZ	 
]ZZ 
[[[ 	
Route[[	 
([[ 
$str[[ 
)[[ 
][[ 
public\\ 
async\\ 
Task\\ 
<\\ 
IActionResult\\ '
>\\' (
Upsert\\) /
(\\/ 0
MasterCityEntity\\0 @
oCity\\A F
)\\F G
{]] 	
try^^ 
{__ 
DBOperation`` 
	oResponse`` %
=``& '
await``( -
_CityService``. :
.``: ;
Upsert``; A
(``A B
oCity``B G
)``G H
;``H I
ifaa 
(aa 
	oResponseaa 
==aa  
DBOperationaa! ,
.aa, -
Successaa- 4
)aa4 5
{bb 
returncc 
_ObjectResponsecc *
.cc* +
Createcc+ 1
(cc1 2
truecc2 6
,cc6 7
(cc8 9
Int32cc9 >
)cc> ?
HttpStatusCodecc? M
.ccM N
OKccN P
,ccP Q
(ccR S
oCityccS X
.ccX Y
IdccY [
>cc\ ]
$numcc^ _
?cc` a
AppConstantsccb n
.ccn o
UpdateSuccesscco |
:cc} ~
AppConstants	cc ã
.
ccã å
InsertSuccess
ccå ô
)
ccô ö
)
ccö õ
;
ccõ ú
}dd 
elseee 
returnff 
_ObjectResponseff *
.ff* +
Createff+ 1
(ff1 2
falseff2 7
,ff7 8
(ff9 :
Int32ff: ?
)ff? @
HttpStatusCodeff@ N
.ffN O

BadRequestffO Y
,ffY Z
(ff[ \
	oResponseff\ e
==fff h
DBOperationffi t
.fft u
NotFoundffu }
?ff~ 
AppConstants
ffÄ å
.
ffå ç
NoRecordFound
ffç ö
:
ffõ ú
AppConstants
ffù ©
.
ff© ™

BadRequest
ff™ ¥
)
ff¥ µ
)
ffµ ∂
;
ff∂ ∑
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
)	jj Ä
;
jjÄ Å
}kk 
}ll 	
[oo 	

HttpDeleteoo	 
(oo 
$stroo !
)oo! "
]oo" #
publicpp 
asyncpp 
Taskpp 
<pp 
IActionResultpp '
>pp' (
Deletepp) /
(pp/ 0
[pp0 1
	FromRoutepp1 :
]pp: ;
intpp< ?
idpp@ B
)ppB C
{qq 	
tryrr 
{ss 
DBOperationtt 
	oResponsett %
=tt& '
awaittt( -
_CityServicett. :
.tt: ;
Deletett; A
(ttA B
idttB D
)ttD E
;ttE F
ifuu 
(uu 
	oResponseuu 
==uu  
DBOperationuu! ,
.uu, -
Successuu- 4
)uu4 5
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
,vvP Q
AppConstantsvvR ^
.vv^ _
DeleteSuccessvv_ l
)vvl m
;vvm n
elseww 
returnxx 
_ObjectResponsexx *
.xx* +
Createxx+ 1
(xx1 2
nullxx2 6
,xx6 7
(xx8 9
Int32xx9 >
)xx> ?
HttpStatusCodexx? M
.xxM N

BadRequestxxN X
,xxX Y
AppConstantsxxZ f
.xxf g
NoRecordFoundxxg t
)xxt u
;xxu v
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
)	|| Ä
;
||Ä Å
}}} 
}~~ 	
[
ÄÄ 	
HttpGet
ÄÄ	 
(
ÄÄ 
$str
ÄÄ 
)
ÄÄ 
]
ÄÄ  
public
ÅÅ 
async
ÅÅ 
Task
ÅÅ 
<
ÅÅ 
IActionResult
ÅÅ '
>
ÅÅ' (
GetCityList
ÅÅ) 4
(
ÅÅ4 5
)
ÅÅ5 6
{
ÇÇ 	
try
ÉÉ 
{
ÑÑ 
return
ÖÖ 
_ObjectResponse
ÖÖ &
.
ÖÖ& '

CreateData
ÖÖ' 1
(
ÖÖ1 2
await
ÖÖ2 7
_CityService
ÖÖ8 D
.
ÖÖD E
GetCityList
ÖÖE P
(
ÖÖP Q
)
ÖÖQ R
,
ÖÖR S
(
ÖÖT U
Int32
ÖÖU Z
)
ÖÖZ [
HttpStatusCode
ÖÖ[ i
.
ÖÖi j
OK
ÖÖj l
)
ÖÖl m
;
ÖÖm n
}
ÜÜ 
catch
áá 
(
áá 
	Exception
áá 
ex
áá 
)
áá  
{
àà 
return
ââ 
_ObjectResponse
ââ &
.
ââ& '
Create
ââ' -
(
ââ- .
false
ââ. 3
,
ââ3 4
(
ââ5 6
Int32
ââ6 ;
)
ââ; <
HttpStatusCode
ââ< J
.
ââJ K!
InternalServerError
ââK ^
,
ââ^ _
Convert
ââ` g
.
ââg h
ToString
ââh p
(
ââp q
ex
ââq s
.
ââs t

StackTrace
âât ~
)
ââ~ 
)ââ Ä
;ââÄ Å
}
ää 
}
ãã 	
[
çç 	
HttpGet
çç	 
(
çç 
$str
çç 1
)
çç1 2
]
çç2 3
public
éé 
async
éé 
Task
éé 
<
éé 
IActionResult
éé '
>
éé' ("
GetCityListByStateId
éé) =
(
éé= >
[
éé> ?
	FromRoute
éé? H
]
ééH I
int
ééJ M
stateId
ééN U
)
ééU V
{
èè 	
try
êê 
{
ëë 
return
íí 
_ObjectResponse
íí &
.
íí& '

CreateData
íí' 1
(
íí1 2
await
íí2 7
_CityService
íí8 D
.
ííD E"
GetCityListByStateId
ííE Y
(
ííY Z
stateId
ííZ a
)
íía b
,
ííb c
(
ííd e
Int32
ííe j
)
ííj k
HttpStatusCode
íík y
.
ííy z
OK
ííz |
)
íí| }
;
íí} ~
}
ìì 
catch
îî 
(
îî 
	Exception
îî 
ex
îî 
)
îî  
{
ïï 
return
ññ 
_ObjectResponse
ññ &
.
ññ& '
Create
ññ' -
(
ññ- .
false
ññ. 3
,
ññ3 4
(
ññ5 6
Int32
ññ6 ;
)
ññ; <
HttpStatusCode
ññ< J
.
ññJ K!
InternalServerError
ññK ^
,
ññ^ _
Convert
ññ` g
.
ññg h
ToString
ññh p
(
ññp q
ex
ññq s
.
ññs t

StackTrace
ññt ~
)
ññ~ 
)ññ Ä
;ññÄ Å
}
óó 
}
òò 	
}
úú 
}ùù é`
@D:\EltizamLive\Eltizam.Api\Controllers\MasterClientController.cs
	namespace

 	
EltizamValuation


 
.

 
Api

 
.

 
Controllers

 *
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class "
MasterClientController '
:( )
ControllerBase* 8
{ 
private 
readonly  
IMasterClientService -
_clientServices. =
;= >
private 
readonly 
IResponseHandler )
<) *
dynamic* 1
>1 2
_ObjectResponse3 B
;B C
private 
readonly 
IExceptionService *
_ExceptionService+ <
;< =
IExceptionService 
exceptionService *
;* +
public "
MasterClientController %
(% & 
IMasterClientService& :
clientServices; I
,I J
IResponseHandlerK [
<[ \
dynamic\ c
>c d
ObjectResponsee s
)s t
{ 	
_clientServices 
= 
clientServices ,
;, -
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
MasterClientModel$$0 A
client$$B H
)$$H I
{%% 	
try&& 
{'' 
DBOperation(( 
	oResponse(( %
=((& '
await((( -
_clientServices((. =
.((= >!
AddUpdateMasterClient((> S
(((S T
client((T Z
)((Z [
;(([ \
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
(++R S
client++S Y
.++Y Z
Id++Z \
>++] ^
$num++_ `
?++a b
AppConstants++c o
.++o p
UpdateSuccess++p }
:++~ 
AppConstants
++Ä å
.
++å ç
InsertSuccess
++ç ö
)
++ö õ
)
++õ ú
;
++ú ù
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
..Ä å
.
..å ç
NoRecordFound
..ç ö
:
..õ ú
AppConstants
..ù ©
.
..© ™

BadRequest
..™ ¥
)
..¥ µ
)
..µ ∂
;
..∂ ∑
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
)	22 Ä
;
22Ä Å
}33 
}44 	
[66 	
HttpGet66	 
]66 
[77 	
Route77	 
(77 
$str77 
)77 
]77 
public88 
async88 
Task88 
<88 
IActionResult88 '
>88' (!
GetMasterPropertyById88) >
(88> ?
[88? @
	FromRoute88@ I
]88I J
int88K N
id88O Q
)88Q R
{99 	
try:: 
{;; 
var<< 
clientClient<<  
=<<! "
await<<# (
_clientServices<<) 8
.<<8 9$
GetMasterClientByIdAsync<<9 Q
(<<Q R
id<<R T
)<<T U
;<<U V
if>> 
(>> 
clientClient>>  
!=>>! #
null>>$ (
&&>>) +
clientClient>>, 8
.>>8 9
Id>>9 ;
>>>< =
$num>>> ?
)>>? @
{?? 
returnAA 
_ObjectResponseAA *
.AA* +
CreateAA+ 1
(AA1 2
clientClientAA2 >
,AA> ?
(AA@ A
intAAA D
)AAD E
HttpStatusCodeAAE S
.AAS T
OKAAT V
)AAV W
;AAW X
}BB 
elseCC 
{DD 
returnEE 
_ObjectResponseEE *
.EE* +
CreateEE+ 1
(EE1 2
nullEE2 6
,EE6 7
(EE8 9
intEE9 <
)EE< =
HttpStatusCodeEE= K
.EEK L

BadRequestEEL V
,EEV W
AppConstantsEEX d
.EEd e
NoRecordFoundEEe r
)EEr s
;EEs t
}FF 
}GG 
catchHH 
(HH 
	ExceptionHH 
exHH 
)HH  
{II 
returnJJ 
_ObjectResponseJJ &
.JJ& '
CreateJJ' -
(JJ- .
nullJJ. 2
,JJ2 3
(JJ4 5
intJJ5 8
)JJ8 9
HttpStatusCodeJJ9 G
.JJG H
InternalServerErrorJJH [
,JJ[ \
ConvertJJ] d
.JJd e
ToStringJJe m
(JJm n
exJJn p
.JJp q

StackTraceJJq {
)JJ{ |
)JJ| }
;JJ} ~
}KK 
}LL 	
[OO 	
HttpPostOO	 
,OO 
RouteOO 
(OO 
$strOO '
)OO' (
]OO( )
publicPP 
asyncPP 
TaskPP 
<PP 
IActionResultPP '
>PP' (
GetAllClientPP) 5
(PP5 6
[PP6 7
FromFormPP7 ?
]PP? @"
DataTableAjaxPostModelPPA W
modelPPX ]
)PP] ^
{QQ 	
tryRR 
{SS 
returnTT 
_ObjectResponseTT &
.TT& '

CreateDataTT' 1
(TT1 2
awaitTT2 7
_clientServicesTT8 G
.TTG H
GetAllTTH N
(TTN O
modelTTO T
)TTT U
,TTU V
(TTW X
Int32TTX ]
)TT] ^
HttpStatusCodeTT^ l
.TTl m
OKTTm o
)TTo p
;TTp q
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
)	XX Ä
;
XXÄ Å
}YY 
}ZZ 	
[\\ 	
HttpPost\\	 
(\\ 
$str\\ %
)\\% &
]\\& '
public]] 
async]] 
Task]] 
<]] 
IActionResult]] '
>]]' (
Deletey]]) 0
(]]0 1
[]]1 2
	FromRoute]]2 ;
]]]; <
int]]= @
id]]A C
,]]C D
int]]D G
?]]G H
by]]I K
)]]K L
{^^ 	
try__ 
{`` 
DBOperationaa 
	oResponseaa %
=aa& '
awaitaa( -
_clientServicesaa. =
.aa= >
DeleteClientaa> J
(aaJ K
idaaK M
,aaM N
byaaN P
)aaP Q
;aaQ R
ifbb 
(bb 
	oResponsebb 
==bb  
DBOperationbb! ,
.bb, -
Successbb- 4
)bb4 5
returncc 
_ObjectResponsecc *
.cc* +
Createcc+ 1
(cc1 2
truecc2 6
,cc6 7
(cc8 9
Int32cc9 >
)cc> ?
HttpStatusCodecc? M
.ccM N
OKccN P
,ccP Q
AppConstantsccR ^
.cc^ _
DeleteSuccesscc_ l
)ccl m
;ccm n
elsedd 
returnee 
_ObjectResponseee *
.ee* +
Createee+ 1
(ee1 2
nullee2 6
,ee6 7
(ee8 9
Int32ee9 >
)ee> ?
HttpStatusCodeee? M
.eeM N

BadRequesteeN X
,eeX Y
AppConstantseeZ f
.eef g
NoRecordFoundeeg t
)eet u
;eeu v
}ff 
catchgg 
(gg 
	Exceptiongg 
exgg 
)gg  
{hh 
awaitii 
_ExceptionServiceii '
.ii' (
LogExceptionii( 4
(ii4 5
exii5 7
)ii7 8
;ii8 9
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
)	jj Ä
;
jjÄ Å
}kk 
}ll 	
[nn 	
HttpGetnn	 
]nn 
[oo 	
Routeoo	 
(oo 
$stroo '
)oo' (
]oo( )
publicpp 
asyncpp 
Taskpp 
<pp 
IActionResultpp '
>pp' ()
GetMasterClientByClientTypeIdpp) F
(ppF G
[ppG H
	FromRouteppH Q
]ppQ R
intppS V
idppW Y
)ppY Z
{qq 	
tryrr 
{ss 
vartt 
oPrpoertyTypeEntitytt '
=tt( )
awaittt* /
_clientServicestt0 ?
.tt? @.
"GetMasterClientByClientTypeIdAsynctt@ b
(ttb c
idttc e
)tte f
;ttf g
ifuu 
(uu 
oPrpoertyTypeEntityuu '
!=uu( *
nulluu+ /
)uu/ 0
returnvv 
_ObjectResponsevv *
.vv* +

CreateDatavv+ 5
(vv5 6
oPrpoertyTypeEntityvv6 I
,vvI J
(vvK L
Int32vvL Q
)vvQ R
HttpStatusCodevvR `
.vv` a
OKvva c
)vvc d
;vvd e
elseww 
returnxx 
_ObjectResponsexx *
.xx* +
Createxx+ 1
(xx1 2
nullxx2 6
,xx6 7
(xx8 9
Int32xx9 >
)xx> ?
HttpStatusCodexx? M
.xxM N

BadRequestxxN X
,xxX Y
AppConstantsxxZ f
.xxf g
NoRecordFoundxxg t
)xxt u
;xxu v
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
)	|| Ä
;
||Ä Å
}}} 
}~~ 	
}
ÄÄ 
}ÅÅ ÷]
DD:\EltizamLive\Eltizam.Api\Controllers\MasterClientTypeController.cs
	namespace

 	
EltizamValuation


 
.

 
Api

 
.

 
Controllers

 *
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class &
MasterClientTypeController +
:, -
ControllerBase. <
{ 
private 
readonly $
IMasterClientTypeService 1
_clienttypeServices2 E
;E F
private 
readonly 
IResponseHandler )
<) *
dynamic* 1
>1 2
_ObjectResponse3 B
;B C
private 
readonly 
IExceptionService *
_ExceptionService+ <
;< =
IExceptionService 
exceptionService *
;* +
public &
MasterClientTypeController )
() *$
IMasterClientTypeService* B
clienttypeServicesC U
,U V
IResponseHandlerW g
<g h
dynamich o
>o p
ObjectResponseq 
)	 Ä
{ 	
_clienttypeServices 
=  !
clienttypeServices" 4
;4 5
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
($$/ 0"
Master_ClientTypeModel$$0 F

clientType$$G Q
)$$Q R
{%% 	
try&& 
{'' 
DBOperation(( 
	oResponse(( %
=((& '
await((( -
_clienttypeServices((. A
.((A B%
AddUpdateMasterClientType((B [
((([ \

clientType((\ f
)((f g
;((g h
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
(++R S

clientType++S ]
.++] ^
Id++^ `
>++a b
$num++c d
?++e f
AppConstants++g s
.++s t
UpdateSuccess	++t Å
:
++Ç É
AppConstants
++Ñ ê
.
++ê ë
InsertSuccess
++ë û
)
++û ü
)
++ü †
;
++† °
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
..Ä å
.
..å ç
NoRecordFound
..ç ö
:
..õ ú
AppConstants
..ù ©
.
..© ™

BadRequest
..™ ¥
)
..¥ µ
)
..µ ∂
;
..∂ ∑
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
)	33 Ä
;
33Ä Å
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
>99' (#
GetMasterClientTypeById99) @
(99@ A
[99A B
	FromRoute99B K
]99K L
int99M P
id99Q S
)99S T
{:: 	
try;; 
{<< 
var== 
oClientTypeEntity== %
===& '
await==( -
_clienttypeServices==. A
.==A B(
GetMasterClientTypeByIdAsync==B ^
(==^ _
id==_ a
)==a b
;==b c
if>> 
(>> 
oClientTypeEntity>> %
!=>>& (
null>>) -
&&>>. 0
oClientTypeEntity>>1 B
.>>B C
Id>>C E
>>>F G
$num>>H I
)>>I J
return?? 
_ObjectResponse?? *
.??* +
Create??+ 1
(??1 2
oClientTypeEntity??2 C
,??C D
(??E F
Int32??F K
)??K L
HttpStatusCode??L Z
.??Z [
OK??[ ]
)??] ^
;??^ _
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
)	EE Ä
;
EEÄ Å
}FF 
}GG 	
[II 	
HttpGetII	 
,II 
RouteII 
(II 
$strII *
)II* +
]II+ ,
publicJJ 
asyncJJ 
TaskJJ 
<JJ 
IActionResultJJ '
>JJ' (
GetAllClientTypeJJ) 9
(JJ9 :
)JJ: ;
{KK 	
tryLL 
{MM 
varNN 
	oRoleListNN 
=NN 
awaitNN  %
_clienttypeServicesNN& 9
.NN9 :
GetAllNN: @
(NN@ A
)NNA B
;NNB C
ifOO 
(OO 
	oRoleListOO 
!=OO  
nullOO! %
)OO% &
returnPP 
_ObjectResponsePP *
.PP* +

CreateDataPP+ 5
(PP5 6
	oRoleListPP6 ?
,PP? @
(PPA B
Int32PPB G
)PPG H
HttpStatusCodePPH V
.PPV W
OKPPW Y
)PPY Z
;PPZ [
elseQQ 
returnRR 
_ObjectResponseRR *
.RR* +
CreateRR+ 1
(RR1 2
nullRR2 6
,RR6 7
(RR8 9
Int32RR9 >
)RR> ?
HttpStatusCodeRR? M
.RRM N

BadRequestRRN X
,RRX Y
AppConstantsRRZ f
.RRf g
NoRecordFoundRRg t
)RRt u
;RRu v
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
)	VV Ä
;
VVÄ Å
}WW 
}XX 	
[ZZ 	
HttpPostZZ	 
(ZZ 
$strZZ )
)ZZ) *
]ZZ* +
public[[ 
async[[ 
Task[[ 
<[[ 
IActionResult[[ '
>[[' (
DeleteClientType[[) 9
([[9 :
[[[: ;
	FromRoute[[; D
][[D E
int[[F I
id[[J L
)[[L M
{\\ 	
try]] 
{^^ 
DBOperation__ 
	oResponse__ %
=__& '
await__( -
_clienttypeServices__. A
.__A B
DeleteClientType__B R
(__R S
id__S U
)__U V
;__V W
if`` 
(`` 
	oResponse`` 
==``  
DBOperation``! ,
.``, -
Success``- 4
)``4 5
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
,aaP Q
AppConstantsaaR ^
.aa^ _
DeleteSuccessaa_ l
)aal m
;aam n
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
)	hh Ä
;
hhÄ Å
}ii 
}jj 	
[ll 	
HttpGetll	 
]ll 
[mm 	
Routemm	 
(mm 
$strmm "
)mm" #
]mm# $
publicnn 
asyncnn 
Tasknn 
<nn 
IActionResultnn '
>nn' (
GetClientTypeListnn) :
(nn: ;
)nn; <
{oo 	
trypp 
{qq 
returnrr 
_ObjectResponserr &
.rr& '

CreateDatarr' 1
(rr1 2
awaitrr2 7
_clienttypeServicesrr8 K
.rrK L
GetClientTypeListrrL ]
(rr] ^
)rr^ _
,rr_ `
(rra b
Int32rrb g
)rrg h
HttpStatusCoderrh v
.rrv w
OKrrw y
)rry z
;rrz {
}ss 
catchtt 
(tt 
	Exceptiontt 
extt 
)tt  
{uu 
returnvv 
_ObjectResponsevv &
.vv& '
Createvv' -
(vv- .
falsevv. 3
,vv3 4
(vv5 6
Int32vv6 ;
)vv; <
HttpStatusCodevv< J
.vvJ K
InternalServerErrorvvK ^
,vv^ _
Convertvv` g
.vvg h
ToStringvvh p
(vvp q
exvvq s
.vvs t

StackTracevvt ~
)vv~ 
)	vv Ä
;
vvÄ Å
}ww 
}xx 	
}zz 
}{{ ¶_
AD:\EltizamLive\Eltizam.Api\Controllers\MasterCountryController.cs
	namespace 	
EltizamValuation
 
. 
Api 
. 
Controllers *
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class #
MasterCountryController (
:) *
ControllerBase+ 9
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
private 
readonly 
IStringLocalizer )
<) *
Errors* 0
>0 1!
_stringLocalizerError2 G
;G H
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
readonly !
IMasterCountryService .
_CountryService/ >
;> ?
public   #
MasterCountryController   &
(  & '
IConfiguration  ' 5
configuration  6 C
,  C D
IResponseHandler  E U
<  U V
dynamic  V ]
>  ] ^
ObjectResponse  _ m
,  m n
IStringLocalizer  o 
<	   Ä
Errors
  Ä Ü
>
  Ü á"
stringLocalizerError
  à ú
,
  ú ù
IExceptionService
  û Ø
exceptionService
  ∞ ¿
,
  ¿ ¡#
IMasterCountryService
  ¬ ◊
CountryService
  ÿ Ê
)
  Ê Á
{!! 	
_configuration"" 
="" 
configuration"" *
;""* +
_ObjectResponse## 
=## 
ObjectResponse## ,
;##, -!
_stringLocalizerError$$ !
=$$" # 
stringLocalizerError$$$ 8
;$$8 9
_ExceptionService%% 
=%% 
exceptionService%%  0
;%%0 1
_CountryService&& 
=&& 
CountryService&& ,
;&&, -
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
await@@2 7
_CountryService@@8 G
.@@G H
GetAll@@H N
(@@N O
model@@O T
)@@T U
,@@U V
(@@W X
Int32@@X ]
)@@] ^
HttpStatusCode@@^ l
.@@l m
OK@@m o
)@@o p
;@@p q
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
)	DD Ä
;
DDÄ Å
}EE 
}FF 	
[II 	
HttpGetII	 
,II 
RouteII 
(II 
$strII &
)II& '
]II' (
publicJJ 
asyncJJ 
TaskJJ 
<JJ 
IActionResultJJ '
>JJ' (
GetByIdJJ) 0
(JJ0 1
[JJ1 2
	FromRouteJJ2 ;
]JJ; <
intJJ= @
idJJA C
)JJC D
{KK 	
tryLL 
{MM 
varNN 
oCountryEntityNN "
=NN# $
awaitNN% *
_CountryServiceNN+ :
.NN: ;
GetByIdNN; B
(NNB C
idNNC E
)NNE F
;NNF G
ifOO 
(OO 
oCountryEntityOO "
!=OO# %
nullOO& *
&&OO+ -
oCountryEntityOO. <
.OO< =
IdOO= ?
>OO@ A
$numOOB C
)OOC D
returnPP 
_ObjectResponsePP *
.PP* +
CreatePP+ 1
(PP1 2
oCountryEntityPP2 @
,PP@ A
(PPB C
Int32PPC H
)PPH I
HttpStatusCodePPI W
.PPW X
OKPPX Z
)PPZ [
;PP[ \
elseQQ 
returnRR 
_ObjectResponseRR *
.RR* +
CreateRR+ 1
(RR1 2
nullRR2 6
,RR6 7
(RR8 9
Int32RR9 >
)RR> ?
HttpStatusCodeRR? M
.RRM N

BadRequestRRN X
,RRX Y
AppConstantsRRZ f
.RRf g
NoRecordFoundRRg t
)RRt u
;RRu v
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
)	VV Ä
;
VVÄ Å
}WW 
}XX 	
[[[ 	
HttpPost[[	 
][[ 
[\\ 	
Route\\	 
(\\ 
$str\\ 
)\\ 
]\\ 
public]] 
async]] 
Task]] 
<]] 
IActionResult]] '
>]]' (
Upsert]]) /
(]]/ 0
MasterCountryModel]]0 B
oCountry]]C K
)]]K L
{^^ 	
try__ 
{`` 
DBOperationaa 
	oResponseaa %
=aa& '
awaitaa( -
_CountryServiceaa. =
.aa= >
Upsertaa> D
(aaD E
oCountryaaE M
)aaM N
;aaN O
ifbb 
(bb 
	oResponsebb 
==bb  
DBOperationbb! ,
.bb, -
Successbb- 4
)bb4 5
{cc 
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
,ddP Q
(ddR S
oCountryddS [
.dd[ \
Iddd\ ^
>dd_ `
$numdda b
?ddc d
AppConstantsdde q
.ddq r
UpdateSuccessddr 
:
ddÄ Å
AppConstants
ddÇ é
.
ddé è
InsertSuccess
ddè ú
)
ddú ù
)
ddù û
;
ddû ü
}ee 
elseff 
returngg 
_ObjectResponsegg *
.gg* +
Creategg+ 1
(gg1 2
falsegg2 7
,gg7 8
(gg9 :
Int32gg: ?
)gg? @
HttpStatusCodegg@ N
.ggN O

BadRequestggO Y
,ggY Z
(gg[ \
	oResponsegg\ e
==ggf h
DBOperationggi t
.ggt u
NotFoundggu }
?gg~ 
AppConstants
ggÄ å
.
ggå ç
NoRecordFound
ggç ö
:
ggõ ú
AppConstants
ggù ©
.
gg© ™

BadRequest
gg™ ¥
)
gg¥ µ
)
ggµ ∂
;
gg∂ ∑
}hh 
catchii 
(ii 
	Exceptionii 
exii 
)ii  
{jj 
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
)	kk Ä
;
kkÄ Å
}ll 
}mm 	
[pp 	

HttpDeletepp	 
(pp 
$strpp !
)pp! "
]pp" #
publicqq 
asyncqq 
Taskqq 
<qq 
IActionResultqq '
>qq' (
Deleteqq) /
(qq/ 0
[qq0 1
	FromRouteqq1 :
]qq: ;
intqq< ?
idqq@ B
)qqB C
{rr 	
tryss 
{tt 
DBOperationuu 
	oResponseuu %
=uu& '
awaituu( -
_CountryServiceuu. =
.uu= >
Deleteuu> D
(uuD E
iduuE G
)uuG H
;uuH I
ifvv 
(vv 
	oResponsevv 
==vv  
DBOperationvv! ,
.vv, -
Successvv- 4
)vv4 5
returnww 
_ObjectResponseww *
.ww* +
Createww+ 1
(ww1 2
trueww2 6
,ww6 7
(ww8 9
Int32ww9 >
)ww> ?
HttpStatusCodeww? M
.wwM N
OKwwN P
,wwP Q
AppConstantswwR ^
.ww^ _
DeleteSuccessww_ l
)wwl m
;wwm n
elsexx 
returnyy 
_ObjectResponseyy *
.yy* +
Createyy+ 1
(yy1 2
nullyy2 6
,yy6 7
(yy8 9
Int32yy9 >
)yy> ?
HttpStatusCodeyy? M
.yyM N

BadRequestyyN X
,yyX Y
AppConstantsyyZ f
.yyf g
NoRecordFoundyyg t
)yyt u
;yyu v
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
)	}} Ä
;
}}Ä Å
}~~ 
} 	
[
ÅÅ 	
HttpGet
ÅÅ	 
(
ÅÅ 
$str
ÅÅ !
)
ÅÅ! "
]
ÅÅ" #
public
ÇÇ 
async
ÇÇ 
Task
ÇÇ 
<
ÇÇ 
IActionResult
ÇÇ '
>
ÇÇ' (
GetCountryList
ÇÇ) 7
(
ÇÇ7 8
)
ÇÇ8 9
{
ÉÉ 	
try
ÑÑ 
{
ÖÖ 
return
ÜÜ 
_ObjectResponse
ÜÜ &
.
ÜÜ& '

CreateData
ÜÜ' 1
(
ÜÜ1 2
await
ÜÜ2 7
_CountryService
ÜÜ8 G
.
ÜÜG H
GetCountryList
ÜÜH V
(
ÜÜV W
)
ÜÜW X
,
ÜÜX Y
(
ÜÜZ [
Int32
ÜÜ[ `
)
ÜÜ` a
HttpStatusCode
ÜÜa o
.
ÜÜo p
OK
ÜÜp r
)
ÜÜr s
;
ÜÜs t
}
áá 
catch
àà 
(
àà 
	Exception
àà 
ex
àà 
)
àà  
{
ââ 
return
ää 
_ObjectResponse
ää &
.
ää& '
Create
ää' -
(
ää- .
false
ää. 3
,
ää3 4
(
ää5 6
Int32
ää6 ;
)
ää; <
HttpStatusCode
ää< J
.
ääJ K!
InternalServerError
ääK ^
,
ää^ _
Convert
ää` g
.
ääg h
ToString
ääh p
(
ääp q
ex
ääq s
.
ääs t

StackTrace
äät ~
)
ää~ 
)ää Ä
;ääÄ Å
}
ãã 
}
åå 	
}
èè 
}êê ®f
DD:\EltizamLive\Eltizam.Api\Controllers\MasterDepartmentController.cs
	namespace 	
EltizamValuation
 
. 
Api 
. 
Controllers *
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class &
MasterDepartmentController +
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
private 
readonly 
IStringLocalizer )
<) *
Errors* 0
>0 1!
_stringLocalizerError2 G
;G H
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
IStringLocalizer	r Ç
<
Ç É
Errors
É â
>
â ä"
stringLocalizerError
ã ü
,
ü †
IExceptionService
° ≤
exceptionService
≥ √
,
√ ƒ&
IMasterDepartmentService
≈ ›
DepartmentService
ﬁ Ô
)
Ô 
{   	
_configuration!! 
=!! 
configuration!! *
;!!* +
_ObjectResponse"" 
="" 
ObjectResponse"" ,
;"", -!
_stringLocalizerError## !
=##" # 
stringLocalizerError##$ 8
;##8 9
_ExceptionService$$ 
=$$ 
exceptionService$$  0
;$$0 1
_DepartmentService%% 
=%%  
DepartmentService%%! 2
;%%2 3
}&& 	
[GG 	
HttpGetGG	 
,GG 
RouteGG 
(GG 
$strGG  
)GG  !
]GG! "
publicHH 
asyncHH 
TaskHH 
<HH 
IActionResultHH '
>HH' (
GetAllHH) /
(HH/ 0
)HH0 1
{II 	
tryJJ 
{KK 
varLL 
	oRoleListLL 
=LL 
awaitLL  %
_DepartmentServiceLL& 8
.LL8 9
GetAllLL9 ?
(LL? @
)LL@ A
;LLA B
ifMM 
(MM 
	oRoleListMM 
!=MM  
nullMM! %
)MM% &
returnNN 
_ObjectResponseNN *
.NN* +
CreateNN+ 1
(NN1 2
	oRoleListNN2 ;
,NN; <
(NN= >
Int32NN> C
)NNC D
HttpStatusCodeNND R
.NNR S
OKNNS U
)NNU V
;NNV W
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
{SS 
awaitTT 
_ExceptionServiceTT '
.TT' (
LogExceptionTT( 4
(TT4 5
exTT5 7
)TT7 8
;TT8 9
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
)	UU Ä
;
UUÄ Å
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
var__ 
oDepartmentEntity__ %
=__& '
await__( -
_DepartmentService__. @
.__@ A
GetById__A H
(__H I
id__I K
)__K L
;__L M
if`` 
(`` 
oDepartmentEntity`` %
!=``& (
null``) -
&&``. 0
oDepartmentEntity``1 B
.``B C
Id``C E
>``F G
$num``H I
)``I J
returnaa 
_ObjectResponseaa *
.aa* +
Createaa+ 1
(aa1 2
oDepartmentEntityaa2 C
,aaC D
(aaE F
Int32aaF K
)aaK L
HttpStatusCodeaaL Z
.aaZ [
OKaa[ ]
)aa] ^
;aa^ _
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
)	gg Ä
;
ggÄ Å
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
(nn/ 0"
MasterDepartmentEntitynn0 F
oDepartmentnnG R
)nnR S
{oo 	
trypp 
{qq 
DBOperationrr 
	oResponserr %
=rr& '
awaitrr( -
_DepartmentServicerr. @
.rr@ A
UpsertrrA G
(rrG H
oDepartmentrrH S
)rrS T
;rrT U
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
(uuR S
oDepartmentuuS ^
.uu^ _
Iduu_ a
>uub c
$numuud e
?uuf g
AppConstantsuuh t
.uut u
UpdateSuccess	uuu Ç
:
uuÉ Ñ
AppConstants
uuÖ ë
.
uuë í
InsertSuccess
uuí ü
)
uuü †
)
uu† °
;
uu° ¢
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
xxÄ å
.
xxå ç
NoRecordFound
xxç ö
:
xxõ ú
AppConstants
xxù ©
.
xx© ™

BadRequest
xx™ ¥
)
xx¥ µ
)
xxµ ∂
;
xx∂ ∑
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
)	|| Ä
;
||Ä Å
}}} 
}~~ 	
[
ÅÅ 	
HttpPost
ÅÅ	 
(
ÅÅ 
$str
ÅÅ 
)
ÅÅ  
]
ÅÅ  !
public
ÇÇ 
async
ÇÇ 
Task
ÇÇ 
<
ÇÇ 
IActionResult
ÇÇ '
>
ÇÇ' (
Delete
ÇÇ) /
(
ÇÇ/ 0
[
ÇÇ0 1
	FromRoute
ÇÇ1 :
]
ÇÇ: ;
int
ÇÇ< ?
id
ÇÇ@ B
)
ÇÇB C
{
ÉÉ 	
try
ÑÑ 
{
ÖÖ 
DBOperation
ÜÜ 
	oResponse
ÜÜ %
=
ÜÜ& '
await
ÜÜ( - 
_DepartmentService
ÜÜ. @
.
ÜÜ@ A
Delete
ÜÜA G
(
ÜÜG H
id
ÜÜH J
)
ÜÜJ K
;
ÜÜK L
if
áá 
(
áá 
	oResponse
áá 
==
áá  
DBOperation
áá! ,
.
áá, -
Success
áá- 4
)
áá4 5
return
àà 
_ObjectResponse
àà *
.
àà* +
Create
àà+ 1
(
àà1 2
true
àà2 6
,
àà6 7
(
àà8 9
Int32
àà9 >
)
àà> ?
HttpStatusCode
àà? M
.
ààM N
OK
ààN P
,
ààP Q
AppConstants
ààR ^
.
àà^ _
DeleteSuccess
àà_ l
)
ààl m
;
ààm n
else
ââ 
return
ää 
_ObjectResponse
ää *
.
ää* +
Create
ää+ 1
(
ää1 2
null
ää2 6
,
ää6 7
(
ää8 9
Int32
ää9 >
)
ää> ?
HttpStatusCode
ää? M
.
ääM N

BadRequest
ääN X
,
ääX Y
AppConstants
ääZ f
.
ääf g
NoRecordFound
ääg t
)
äät u
;
ääu v
}
ãã 
catch
åå 
(
åå 
	Exception
åå 
ex
åå 
)
åå  
{
çç 
return
éé 
_ObjectResponse
éé &
.
éé& '
Create
éé' -
(
éé- .
false
éé. 3
,
éé3 4
(
éé5 6
Int32
éé6 ;
)
éé; <
HttpStatusCode
éé< J
.
ééJ K!
InternalServerError
ééK ^
,
éé^ _
Convert
éé` g
.
éég h
ToString
ééh p
(
éép q
ex
ééq s
.
éés t

StackTrace
éét ~
)
éé~ 
)éé Ä
;ééÄ Å
}
èè 
}
êê 	
[
íí 	
HttpGet
íí	 
(
íí 
$str
íí $
)
íí$ %
]
íí% &
public
ìì 
async
ìì 
Task
ìì 
<
ìì 
IActionResult
ìì '
>
ìì' (
GetDepartmentList
ìì) :
(
ìì: ;
)
ìì; <
{
îî 	
try
ïï 
{
ññ 
return
óó 
_ObjectResponse
óó &
.
óó& '

CreateData
óó' 1
(
óó1 2
await
óó2 7 
_DepartmentService
óó8 J
.
óóJ K
GetDepartmentList
óóK \
(
óó\ ]
)
óó] ^
,
óó^ _
(
óó` a
Int32
óóa f
)
óóf g
HttpStatusCode
óóg u
.
óóu v
OK
óóv x
)
óóx y
;
óóy z
}
òò 
catch
ôô 
(
ôô 
	Exception
ôô 
ex
ôô 
)
ôô  
{
öö 
return
õõ 
_ObjectResponse
õõ &
.
õõ& '
Create
õõ' -
(
õõ- .
false
õõ. 3
,
õõ3 4
(
õõ5 6
Int32
õõ6 ;
)
õõ; <
HttpStatusCode
õõ< J
.
õõJ K!
InternalServerError
õõK ^
,
õõ^ _
Convert
õõ` g
.
õõg h
ToString
õõh p
(
õõp q
ex
õõq s
.
õõs t

StackTrace
õõt ~
)
õõ~ 
)õõ Ä
;õõÄ Å
}
úú 
}
ùù 	
}
†† 
}°° Ωf
ED:\EltizamLive\Eltizam.Api\Controllers\MasterDesignationController.cs
	namespace 	
EltizamValuation
 
. 
Api 
. 
Controllers *
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class '
MasterDesignationController ,
:- .
ControllerBase/ =
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
private 
readonly 
IStringLocalizer )
<) *
Errors* 0
>0 1!
_stringLocalizerError2 G
;G H
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
IStringLocalizer	s É
<
É Ñ
Errors
Ñ ä
>
ä ã"
stringLocalizerError
å †
,
† °
IExceptionService
¢ ≥
exceptionService
¥ ƒ
,
ƒ ≈'
IMasterDesignationService
∆ ﬂ 
DesignationService
‡ Ú
)
Ú Û
{   	
_configuration!! 
=!! 
configuration!! *
;!!* +
_ObjectResponse"" 
="" 
ObjectResponse"" ,
;"", -!
_stringLocalizerError## !
=##" # 
stringLocalizerError##$ 8
;##8 9
_ExceptionService$$ 
=$$ 
exceptionService$$  0
;$$0 1
_DesignationService%% 
=%%  !
DesignationService%%" 4
;%%4 5
}&& 	
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
_DesignationServiceKK& 9
.KK9 :
GetAllKK: @
(KK@ A
)KKA B
;KKB C
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
)	TT Ä
;
TTÄ Å
}UU 
}VV 	
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
var__ 
oDesignationEntity__ &
=__' (
await__) .
_DesignationService__/ B
.__B C
GetById__C J
(__J K
id__K M
)__M N
;__N O
if`` 
(`` 
oDesignationEntity`` &
!=``' )
null``* .
&&``/ 1
oDesignationEntity``2 D
.``D E
Id``E G
>``H I
$num``J K
)``K L
returnaa 
_ObjectResponseaa *
.aa* +
Createaa+ 1
(aa1 2
oDesignationEntityaa2 D
,aaD E
(aaF G
Int32aaG L
)aaL M
HttpStatusCodeaaM [
.aa[ \
OKaa\ ^
)aa^ _
;aa_ `
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
)	gg Ä
;
ggÄ Å
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
(nn/ 0#
MasterDesignationEntitynn0 G
oDepartmentnnH S
)nnS T
{oo 	
trypp 
{qq 
DBOperationrr 
	oResponserr %
=rr& '
awaitrr( -
_DesignationServicerr. A
.rrA B
UpsertrrB H
(rrH I
oDepartmentrrI T
)rrT U
;rrU V
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
(uuR S
oDepartmentuuS ^
.uu^ _
Iduu_ a
>uub c
$numuud e
?uuf g
AppConstantsuuh t
.uut u
UpdateSuccess	uuu Ç
:
uuÉ Ñ
AppConstants
uuÖ ë
.
uuë í
InsertSuccess
uuí ü
)
uuü †
)
uu† °
;
uu° ¢
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
xxÄ å
.
xxå ç
NoRecordFound
xxç ö
:
xxõ ú
AppConstants
xxù ©
.
xx© ™

BadRequest
xx™ ¥
)
xx¥ µ
)
xxµ ∂
;
xx∂ ∑
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
)	|| Ä
;
||Ä Å
}}} 
}~~ 	
[
ÇÇ 	
HttpPost
ÇÇ	 
(
ÇÇ 
$str
ÇÇ 
)
ÇÇ  
]
ÇÇ  !
public
ÉÉ 
async
ÉÉ 
Task
ÉÉ 
<
ÉÉ 
IActionResult
ÉÉ '
>
ÉÉ' (
Delete
ÉÉ) /
(
ÉÉ/ 0
[
ÉÉ0 1
	FromRoute
ÉÉ1 :
]
ÉÉ: ;
int
ÉÉ< ?
id
ÉÉ@ B
)
ÉÉB C
{
ÑÑ 	
try
ÖÖ 
{
ÜÜ 
DBOperation
áá 
	oResponse
áá %
=
áá& '
await
áá( -!
_DesignationService
áá. A
.
ááA B
Delete
ááB H
(
ááH I
id
ááI K
)
ááK L
;
ááL M
if
àà 
(
àà 
	oResponse
àà 
==
àà  
DBOperation
àà! ,
.
àà, -
Success
àà- 4
)
àà4 5
return
ââ 
_ObjectResponse
ââ *
.
ââ* +
Create
ââ+ 1
(
ââ1 2
true
ââ2 6
,
ââ6 7
(
ââ8 9
Int32
ââ9 >
)
ââ> ?
HttpStatusCode
ââ? M
.
ââM N
OK
ââN P
,
ââP Q
AppConstants
ââR ^
.
ââ^ _
DeleteSuccess
ââ_ l
)
ââl m
;
ââm n
else
ää 
return
ãã 
_ObjectResponse
ãã *
.
ãã* +
Create
ãã+ 1
(
ãã1 2
null
ãã2 6
,
ãã6 7
(
ãã8 9
Int32
ãã9 >
)
ãã> ?
HttpStatusCode
ãã? M
.
ããM N

BadRequest
ããN X
,
ããX Y
AppConstants
ããZ f
.
ããf g
NoRecordFound
ããg t
)
ããt u
;
ããu v
}
åå 
catch
çç 
(
çç 
	Exception
çç 
ex
çç 
)
çç  
{
éé 
return
èè 
_ObjectResponse
èè &
.
èè& '
Create
èè' -
(
èè- .
false
èè. 3
,
èè3 4
(
èè5 6
Int32
èè6 ;
)
èè; <
HttpStatusCode
èè< J
.
èèJ K!
InternalServerError
èèK ^
,
èè^ _
Convert
èè` g
.
èèg h
ToString
èèh p
(
èèp q
ex
èèq s
.
èès t

StackTrace
èèt ~
)
èè~ 
)èè Ä
;èèÄ Å
}
êê 
}
ëë 	
[
îî 	
HttpGet
îî	 
(
îî 
$str
îî %
)
îî% &
]
îî& '
public
ïï 
async
ïï 
Task
ïï 
<
ïï 
IActionResult
ïï '
>
ïï' ( 
GetDesignationList
ïï) ;
(
ïï; <
)
ïï< =
{
ññ 	
try
óó 
{
òò 
return
ôô 
_ObjectResponse
ôô &
.
ôô& '

CreateData
ôô' 1
(
ôô1 2
await
ôô2 7!
_DesignationService
ôô8 K
.
ôôK L 
GetDesignationList
ôôL ^
(
ôô^ _
)
ôô_ `
,
ôô` a
(
ôôb c
Int32
ôôc h
)
ôôh i
HttpStatusCode
ôôi w
.
ôôw x
OK
ôôx z
)
ôôz {
;
ôô{ |
}
öö 
catch
õõ 
(
õõ 
	Exception
õõ 
ex
õõ 
)
õõ  
{
úú 
return
ùù 
_ObjectResponse
ùù &
.
ùù& '
Create
ùù' -
(
ùù- .
false
ùù. 3
,
ùù3 4
(
ùù5 6
Int32
ùù6 ;
)
ùù; <
HttpStatusCode
ùù< J
.
ùùJ K!
InternalServerError
ùùK ^
,
ùù^ _
Convert
ùù` g
.
ùùg h
ToString
ùùh p
(
ùùp q
ex
ùùq s
.
ùùs t

StackTrace
ùùt ~
)
ùù~ 
)ùù Ä
;ùùÄ Å
}
ûû 
}
üü 	
}
¢¢ 
}££ ∞º
DD:\EltizamLive\Eltizam.Api\Controllers\MasterDictionaryController.cs
	namespace 	
EltizamValuation
 
. 
Api 
. 
Controllers *
{ 
[ 
Route 

(
 
$str 
) 
] 
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
private 
readonly 
IStringLocalizer )
<) *
Errors* 0
>0 1!
_stringLocalizerError2 G
;G H
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
IMasterDictionaryService 1
_DictionaryService2 D
;D E
public &
MasterDictionaryController )
() *
IConfiguration* 8
configuration9 F
,F G
IResponseHandlerH X
<X Y
dynamicY `
>` a
ObjectResponseb p
,p q
IStringLocalizer	r Ç
<
Ç É
Errors
É â
>
â ä"
stringLocalizerError
ã ü
,
ü †
IExceptionService
° ≤
exceptionService
≥ √
,
√ ƒ&
IMasterDictionaryService
≈ ›
DictionaryService
ﬁ Ô
)
Ô 
{ 	
_configuration   
=   
configuration   *
;  * +
_ObjectResponse!! 
=!! 
ObjectResponse!! ,
;!!, -!
_stringLocalizerError"" !
=""" # 
stringLocalizerError""$ 8
;""8 9
_ExceptionService## 
=## 
exceptionService##  0
;##0 1
_DictionaryService$$ 
=$$  
DictionaryService$$! 2
;$$2 3
}%% 	
[++ 	
HttpPost++	 
,++ 
Route++ 
(++ 
$str++ !
)++! "
]++" #
public,, 
async,, 
Task,, 
<,, 
IActionResult,, '
>,,' (
GetAll,,) /
(,,/ 0
[,,0 1
FromForm,,1 9
],,9 :"
DataTableAjaxPostModel,,; Q
?,,Q R
model,,S X
),,X Y
{-- 	
try.. 
{// 
return00 
_ObjectResponse00 &
.00& '

CreateData00' 1
(001 2
await002 7
_DictionaryService008 J
.00J K
GetAll00K Q
(00Q R
model00R W
)00W X
,00X Y
(00Z [
Int3200[ `
)00` a
HttpStatusCode00a o
.00o p
OK00p r
)00r s
;00s t
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
)	44 Ä
;
44Ä Å
}55 
}66 	
[88 	
HttpGet88	 
]88 
[99 	
Route99	 
(99 
$str99 +
)99+ ,
]99, -
public:: 
async:: 
Task:: 
<:: 
IActionResult:: '
>::' (
GetById::) 0
(::0 1
int::1 4
id::5 7
,::7 8
string::9 ?
?::? @
description::A L
)::L M
{;; 	
try<< 
{== 
var?? 
masterDictionary?? $
=??% &
await??' ,
_DictionaryService??- ?
.??? @)
GetDictionaryDetailsByIdAsync??@ ]
(??] ^
id??^ `
,??` a
description??b m
)??m n
;??n o
ifAA 
(AA 
masterDictionaryAA $
!=AA% '
nullAA( ,
)AA, -
{BB 
returnDD 
_ObjectResponseDD *
.DD* +

CreateDataDD+ 5
(DD5 6
masterDictionaryDD6 F
,DDF G
(DDH I
intDDI L
)DDL M
HttpStatusCodeDDM [
.DD[ \
OKDD\ ^
)DD^ _
;DD_ `
}EE 
elseFF 
{GG 
returnHH 
_ObjectResponseHH *
.HH* +
CreateHH+ 1
(HH1 2
nullHH2 6
,HH6 7
(HH8 9
intHH9 <
)HH< =
HttpStatusCodeHH= K
.HHK L

BadRequestHHL V
,HHV W
AppConstantsHHX d
.HHd e
NoRecordFoundHHe r
)HHr s
;HHs t
}II 
}JJ 
catchKK 
(KK 
	ExceptionKK 
exKK 
)KK  
{LL 
returnMM 
_ObjectResponseMM &
.MM& '
CreateMM' -
(MM- .
nullMM. 2
,MM2 3
(MM4 5
intMM5 8
)MM8 9
HttpStatusCodeMM9 G
.MMG H
InternalServerErrorMMH [
,MM[ \
ConvertMM] d
.MMd e
ToStringMMe m
(MMm n
exMMn p
.MMp q

StackTraceMMq {
)MM{ |
)MM| }
;MM} ~
}NN 
}OO 	
[QQ 	
HttpGetQQ	 
]QQ 
[RR 	
RouteRR	 
(RR 
$strRR ,
)RR, -
]RR- .
publicSS 
asyncSS 
TaskSS 
<SS 
IActionResultSS '
>SS' ('
GetDictionaryWithSubDetailsSS) D
(SSD E
intSSE H
?SSH I
idSSJ L
=SSM N
nullSSO S
,SSS T
stringSSU [
?SS[ \
descriptionSS] h
=SSi j
nullSSk o
,SSo p
stringSSq w
?SSw x
codeSSy }
=SS~ 
null
SSÄ Ñ
)
SSÑ Ö
{TT 	
tryUU 
{VV 
varWW 
masterDictionaryWW $
=WW% &
awaitWW' ,
_DictionaryServiceWW- ?
.WW? @,
 GetDictionaryWithSubDetailsAsyncWW@ `
(WW` a
idWWa c
,WWc d
descriptionWWe p
,WWp q
codeWWr v
)WWv w
;WWw x
ifYY 
(YY 
masterDictionaryYY $
!=YY% '
nullYY( ,
)YY, -
{ZZ 
return\\ 
_ObjectResponse\\ *
.\\* +

CreateData\\+ 5
(\\5 6
masterDictionary\\6 F
,\\F G
(\\H I
int\\I L
)\\L M
HttpStatusCode\\M [
.\\[ \
OK\\\ ^
)\\^ _
;\\_ `
}]] 
else^^ 
{__ 
return`` 
_ObjectResponse`` *
.``* +
Create``+ 1
(``1 2
null``2 6
,``6 7
(``8 9
int``9 <
)``< =
HttpStatusCode``= K
.``K L

BadRequest``L V
,``V W
AppConstants``X d
.``d e
NoRecordFound``e r
)``r s
;``s t
}aa 
}bb 
catchcc 
(cc 
	Exceptioncc 
excc 
)cc  
{dd 
returnee 
_ObjectResponseee &
.ee& '
Createee' -
(ee- .
nullee. 2
,ee2 3
(ee4 5
intee5 8
)ee8 9
HttpStatusCodeee9 G
.eeG H
InternalServerErroreeH [
,ee[ \
Convertee] d
.eed e
ToStringeee m
(eem n
exeen p
.eep q

StackTraceeeq {
)ee{ |
)ee| }
;ee} ~
}ff 
}gg 	
[ii 	
HttpGetii	 
]ii 
[jj 	
Routejj	 
(jj 
$strjj 
)jj 
]jj 
publickk 
asynckk 
Taskkk 
<kk 
IActionResultkk '
>kk' (
GetByIdkk) 0
(kk0 1
intkk1 4
idkk5 7
)kk7 8
{ll 	
trymm 
{nn 
varpp 
masterDictionarypp $
=pp% &
awaitpp' ,
_DictionaryServicepp- ?
.pp? @)
GetDictionaryDetailsByIdAsyncpp@ ]
(pp] ^
idpp^ `
)pp` a
;ppa b
ifrr 
(rr 
masterDictionaryrr $
!=rr% '
nullrr( ,
)rr, -
{ss 
returnuu 
_ObjectResponseuu *
.uu* +

CreateDatauu+ 5
(uu5 6
masterDictionaryuu6 F
,uuF G
(uuH I
intuuI L
)uuL M
HttpStatusCodeuuM [
.uu[ \
OKuu\ ^
)uu^ _
;uu_ `
}vv 
elseww 
{xx 
returnyy 
_ObjectResponseyy *
.yy* +
Createyy+ 1
(yy1 2
nullyy2 6
,yy6 7
(yy8 9
intyy9 <
)yy< =
HttpStatusCodeyy= K
.yyK L

BadRequestyyL V
,yyV W
AppConstantsyyX d
.yyd e
NoRecordFoundyye r
)yyr s
;yys t
}zz 
}{{ 
catch|| 
(|| 
	Exception|| 
ex|| 
)||  
{}} 
return~~ 
_ObjectResponse~~ &
.~~& '
Create~~' -
(~~- .
null~~. 2
,~~2 3
(~~4 5
int~~5 8
)~~8 9
HttpStatusCode~~9 G
.~~G H
InternalServerError~~H [
,~~[ \
Convert~~] d
.~~d e
ToString~~e m
(~~m n
ex~~n p
.~~p q

StackTrace~~q {
)~~{ |
)~~| }
;~~} ~
} 
}
ÄÄ 	
[
ÉÉ 	
HttpPost
ÉÉ	 
]
ÉÉ 
[
ÑÑ 	
Route
ÑÑ	 
(
ÑÑ 
$str
ÑÑ 
)
ÑÑ 
]
ÑÑ 
public
ÖÖ 
async
ÖÖ 
Task
ÖÖ 
<
ÖÖ 
IActionResult
ÖÖ '
>
ÖÖ' (
Upsert
ÖÖ) /
(
ÖÖ/ 0(
MasterDictionaryDetailById
ÖÖ0 J
dictionarydetail
ÖÖK [
)
ÖÖ[ \
{
ÜÜ 	
try
áá 
{
àà 
DBOperation
ââ 
	oResponse
ââ %
=
ââ& '
await
ââ( - 
_DictionaryService
ââ. @
.
ââ@ A'
AddUpdateMasterDictionary
ââA Z
(
ââZ [
dictionarydetail
ââ[ k
)
ââk l
;
ââl m
if
ää 
(
ää 
	oResponse
ää 
==
ää  
DBOperation
ää! ,
.
ää, -
Success
ää- 4
)
ää4 5
{
ãã 
return
åå 
_ObjectResponse
åå *
.
åå* +
Create
åå+ 1
(
åå1 2
true
åå2 6
,
åå6 7
(
åå8 9
Int32
åå9 >
)
åå> ?
HttpStatusCode
åå? M
.
ååM N
OK
ååN P
,
ååP Q
(
ååR S
dictionarydetail
ååS c
.
ååc d
Id
ååd f
>
ååg h
$num
ååi j
?
ååk l
AppConstants
ååm y
.
ååy z
UpdateSuccessååz á
:ååà â
AppConstantsååä ñ
.ååñ ó
InsertSuccessååó §
)åå§ •
)åå• ¶
;åå¶ ß
}
çç 
else
éé 
return
èè 
_ObjectResponse
èè *
.
èè* +
Create
èè+ 1
(
èè1 2
false
èè2 7
,
èè7 8
(
èè9 :
Int32
èè: ?
)
èè? @
HttpStatusCode
èè@ N
.
èèN O

BadRequest
èèO Y
,
èèY Z
(
èè[ \
	oResponse
èè\ e
==
èèf h
DBOperation
èèi t
.
èèt u
NotFound
èèu }
?
èè~ 
AppConstantsèèÄ å
.èèå ç
NoRecordFoundèèç ö
:èèõ ú
AppConstantsèèù ©
.èè© ™

BadRequestèè™ ¥
)èè¥ µ
)èèµ ∂
;èè∂ ∑
}
êê 
catch
ëë 
(
ëë 
	Exception
ëë 
ex
ëë 
)
ëë  
{
íí 
return
ìì 
_ObjectResponse
ìì &
.
ìì& '
Create
ìì' -
(
ìì- .
false
ìì. 3
,
ìì3 4
(
ìì5 6
Int32
ìì6 ;
)
ìì; <
HttpStatusCode
ìì< J
.
ììJ K!
InternalServerError
ììK ^
,
ìì^ _
Convert
ìì` g
.
ììg h
ToString
ììh p
(
ììp q
ex
ììq s
.
ììs t

StackTrace
ììt ~
)
ìì~ 
)ìì Ä
;ììÄ Å
}
îî 
}
ïï 	
[
óó 	
HttpPost
óó	 
(
óó 
$str
óó 
)
óó  
]
óó  !
public
òò 
async
òò 
Task
òò 
<
òò 
IActionResult
òò '
>
òò' (
Delete
òò) /
(
òò/ 0
[
òò0 1
	FromRoute
òò1 :
]
òò: ;
int
òò< ?
id
òò@ B
)
òòB C
{
ôô 	
try
öö 
{
õõ 
DBOperation
úú 
	oResponse
úú %
=
úú& '
await
úú( - 
_DictionaryService
úú. @
.
úú@ A
Delete
úúA G
(
úúG H
id
úúH J
)
úúJ K
;
úúK L
if
ùù 
(
ùù 
	oResponse
ùù 
==
ùù  
DBOperation
ùù! ,
.
ùù, -
Success
ùù- 4
)
ùù4 5
return
ûû 
_ObjectResponse
ûû *
.
ûû* +
Create
ûû+ 1
(
ûû1 2
true
ûû2 6
,
ûû6 7
(
ûû8 9
Int32
ûû9 >
)
ûû> ?
HttpStatusCode
ûû? M
.
ûûM N
OK
ûûN P
,
ûûP Q
$str
ûûR h
)
ûûh i
;
ûûi j
else
üü 
return
†† 
_ObjectResponse
†† *
.
††* +
Create
††+ 1
(
††1 2
null
††2 6
,
††6 7
(
††8 9
Int32
††9 >
)
††> ?
HttpStatusCode
††? M
.
††M N

BadRequest
††N X
,
††X Y
AppConstants
††Z f
.
††f g
NoRecordFound
††g t
)
††t u
;
††u v
}
°° 
catch
¢¢ 
(
¢¢ 
	Exception
¢¢ 
ex
¢¢ 
)
¢¢  
{
££ 
return
§§ 
_ObjectResponse
§§ &
.
§§& '
Create
§§' -
(
§§- .
false
§§. 3
,
§§3 4
(
§§5 6
Int32
§§6 ;
)
§§; <
HttpStatusCode
§§< J
.
§§J K!
InternalServerError
§§K ^
,
§§^ _
Convert
§§` g
.
§§g h
ToString
§§h p
(
§§p q
ex
§§q s
.
§§s t

StackTrace
§§t ~
)
§§~ 
)§§ Ä
;§§Ä Å
}
•• 
}
¶¶ 	
[
®® 	
HttpPost
®®	 
]
®® 
[
©© 	
Route
©©	 
(
©© 
$str
©© '
)
©©' (
]
©©( )
public
™™ 
async
™™ 
Task
™™ 
<
™™ 
IActionResult
™™ '
>
™™' ($
UpsertMasterDictionary
™™) ?
(
™™? @$
MasterDictionaryEntity
™™@ V
oPrpoertyType
™™W d
)
™™d e
{
´´ 	
try
¨¨ 
{
≠≠ 
DBOperation
ÆÆ 
	oResponse
ÆÆ %
=
ÆÆ& '
await
ÆÆ( - 
_DictionaryService
ÆÆ. @
.
ÆÆ@ A'
MasterDictionaryAddUpdate
ÆÆA Z
(
ÆÆZ [
oPrpoertyType
ÆÆ[ h
)
ÆÆh i
;
ÆÆi j
if
ØØ 
(
ØØ 
	oResponse
ØØ 
==
ØØ  
DBOperation
ØØ! ,
.
ØØ, -
Success
ØØ- 4
)
ØØ4 5
{
∞∞ 
return
±± 
_ObjectResponse
±± *
.
±±* +
Create
±±+ 1
(
±±1 2
true
±±2 6
,
±±6 7
(
±±8 9
Int32
±±9 >
)
±±> ?
HttpStatusCode
±±? M
.
±±M N
OK
±±N P
,
±±P Q
(
±±R S
oPrpoertyType
±±S `
.
±±` a
Id
±±a c
>
±±d e
$num
±±f g
?
±±h i
AppConstants
±±j v
.
±±v w
UpdateSuccess±±w Ñ
:±±Ö Ü
AppConstants±±á ì
.±±ì î
InsertSuccess±±î °
)±±° ¢
)±±¢ £
;±±£ §
}
≤≤ 
else
≥≥ 
return
¥¥ 
_ObjectResponse
¥¥ *
.
¥¥* +
Create
¥¥+ 1
(
¥¥1 2
false
¥¥2 7
,
¥¥7 8
(
¥¥9 :
Int32
¥¥: ?
)
¥¥? @
HttpStatusCode
¥¥@ N
.
¥¥N O

BadRequest
¥¥O Y
,
¥¥Y Z
(
¥¥[ \
	oResponse
¥¥\ e
==
¥¥f h
DBOperation
¥¥i t
.
¥¥t u
NotFound
¥¥u }
?
¥¥~ 
AppConstants¥¥Ä å
.¥¥å ç
NoRecordFound¥¥ç ö
:¥¥õ ú
AppConstants¥¥ù ©
.¥¥© ™

BadRequest¥¥™ ¥
)¥¥¥ µ
)¥¥µ ∂
;¥¥∂ ∑
}
µµ 
catch
∂∂ 
(
∂∂ 
	Exception
∂∂ 
ex
∂∂ 
)
∂∂  
{
∑∑ 
return
ππ 
_ObjectResponse
ππ &
.
ππ& '
Create
ππ' -
(
ππ- .
false
ππ. 3
,
ππ3 4
(
ππ5 6
Int32
ππ6 ;
)
ππ; <
HttpStatusCode
ππ< J
.
ππJ K!
InternalServerError
ππK ^
,
ππ^ _
Convert
ππ` g
.
ππg h
ToString
ππh p
(
ππp q
ex
ππq s
.
ππs t

StackTrace
ππt ~
)
ππ~ 
)ππ Ä
;ππÄ Å
}
∫∫ 
}
ªª 	
[
ææ 	
HttpGet
ææ	 
]
ææ 
[
øø 	
Route
øø	 
(
øø 
$str
øø .
)
øø. /
]
øø/ 0
public
¿¿ 
async
¿¿ 
Task
¿¿ 
<
¿¿ 
IActionResult
¿¿ '
>
¿¿' (&
GetDictionaryDetailsById
¿¿) A
(
¿¿A B
[
¿¿B C
	FromRoute
¿¿C L
]
¿¿L M
int
¿¿N Q
id
¿¿R T
)
¿¿T U
{
¡¡ 	
try
¬¬ 
{
√√ 
var
ƒƒ 
MasterDictEntity
ƒƒ $
=
ƒƒ% &
await
ƒƒ' , 
_DictionaryService
ƒƒ- ?
.
ƒƒ? @0
"GetMasterDictionaryDetailByIdAsync
ƒƒ@ b
(
ƒƒb c
id
ƒƒc e
)
ƒƒe f
;
ƒƒf g
if
∆∆ 
(
∆∆ 
MasterDictEntity
∆∆ $
!=
∆∆% '
null
∆∆( ,
&&
∆∆- /
MasterDictEntity
∆∆0 @
.
∆∆@ A
Id
∆∆A C
>
∆∆D E
$num
∆∆F G
)
∆∆G H
{
«« 
var
»» 
subtypes
»»  
=
»»! "
await
»»# ( 
_DictionaryService
»») ;
.
»»; <3
%GetMasterDictionaryDetailSubByIdAsync
»»< a
(
»»a b
MasterDictEntity
»»b r
.
»»r s
Id
»»s u
)
»»u v
;
»»v w
MasterDictEntity
…… $
.
……$ %%
MasterDicitonaryDetails
……% <
=
……= >
subtypes
……? G
;
……G H
return
ÀÀ 
_ObjectResponse
ÀÀ *
.
ÀÀ* +
Create
ÀÀ+ 1
(
ÀÀ1 2
MasterDictEntity
ÀÀ2 B
,
ÀÀB C
(
ÀÀD E
Int32
ÀÀE J
)
ÀÀJ K
HttpStatusCode
ÀÀK Y
.
ÀÀY Z
OK
ÀÀZ \
)
ÀÀ\ ]
;
ÀÀ] ^
}
ÃÃ 
else
ÕÕ 
return
ŒŒ 
_ObjectResponse
ŒŒ *
.
ŒŒ* +
Create
ŒŒ+ 1
(
ŒŒ1 2
null
ŒŒ2 6
,
ŒŒ6 7
(
ŒŒ8 9
Int32
ŒŒ9 >
)
ŒŒ> ?
HttpStatusCode
ŒŒ? M
.
ŒŒM N

BadRequest
ŒŒN X
,
ŒŒX Y
AppConstants
ŒŒZ f
.
ŒŒf g
NoRecordFound
ŒŒg t
)
ŒŒt u
;
ŒŒu v
}
œœ 
catch
–– 
(
–– 
	Exception
–– 
ex
–– 
)
––  
{
—— 
return
““ 
_ObjectResponse
““ &
.
““& '
Create
““' -
(
““- .
false
““. 3
,
““3 4
(
““5 6
Int32
““6 ;
)
““; <
HttpStatusCode
““< J
.
““J K!
InternalServerError
““K ^
,
““^ _
Convert
““` g
.
““g h
ToString
““h p
(
““p q
ex
““q s
.
““s t

StackTrace
““t ~
)
““~ 
)““ Ä
;““Ä Å
}
”” 
}
‘‘ 	
[
’’ 	
HttpGet
’’	 
]
’’ 
[
÷÷ 	
Route
÷÷	 
(
÷÷ 
$str
÷÷ 2
)
÷÷2 3
]
÷÷3 4
public
◊◊ 
async
◊◊ 
Task
◊◊ 
<
◊◊ 
IActionResult
◊◊ '
>
◊◊' (*
GetDictionaryDescriptionById
◊◊) E
(
◊◊E F
[
◊◊F G
	FromRoute
◊◊G P
]
◊◊P Q
int
◊◊R U
id
◊◊V X
)
◊◊X Y
{
ÿÿ 	
try
ŸŸ 
{
⁄⁄ 
var
‹‹ 
subtypes
‹‹ 
=
‹‹  
_DictionaryService
‹‹ 1
.
‹‹1 23
%GetMasterDictionaryDetailSubByIdAsync
‹‹2 W
(
‹‹W X
id
‹‹X Z
)
‹‹Z [
;
‹‹[ \
var
›› 
res
›› 
=
›› 
subtypes
›› "
.
››" #
Result
››# )
;
››) *
if
ﬁﬁ 
(
ﬁﬁ 
subtypes
ﬁﬁ 
!=
ﬁﬁ 
null
ﬁﬁ  $
)
ﬁﬁ$ %
{
ﬂﬂ 
return
·· 
_ObjectResponse
·· *
.
··* +

CreateData
··+ 5
(
··5 6
res
··6 9
,
··9 :
(
··; <
int
··< ?
)
··? @
HttpStatusCode
··@ N
.
··N O
OK
··O Q
)
··Q R
;
··R S
}
‚‚ 
else
„„ 
{
‰‰ 
return
ÂÂ 
_ObjectResponse
ÂÂ *
.
ÂÂ* +
Create
ÂÂ+ 1
(
ÂÂ1 2
null
ÂÂ2 6
,
ÂÂ6 7
(
ÂÂ8 9
int
ÂÂ9 <
)
ÂÂ< =
HttpStatusCode
ÂÂ= K
.
ÂÂK L

BadRequest
ÂÂL V
,
ÂÂV W
AppConstants
ÂÂX d
.
ÂÂd e
NoRecordFound
ÂÂe r
)
ÂÂr s
;
ÂÂs t
}
ÊÊ 
}
ÁÁ 
catch
ËË 
(
ËË 
	Exception
ËË 
ex
ËË 
)
ËË  
{
ÈÈ 
return
ÍÍ 
_ObjectResponse
ÍÍ &
.
ÍÍ& '
Create
ÍÍ' -
(
ÍÍ- .
null
ÍÍ. 2
,
ÍÍ2 3
(
ÍÍ4 5
int
ÍÍ5 8
)
ÍÍ8 9
HttpStatusCode
ÍÍ9 G
.
ÍÍG H!
InternalServerError
ÍÍH [
,
ÍÍ[ \
Convert
ÍÍ] d
.
ÍÍd e
ToString
ÍÍe m
(
ÍÍm n
ex
ÍÍn p
.
ÍÍp q

StackTrace
ÍÍq {
)
ÍÍ{ |
)
ÍÍ| }
;
ÍÍ} ~
}
ÎÎ 
}
ÏÏ 	
}
ÔÔ 
}ÒÒ £D
BD:\EltizamLive\Eltizam.Api\Controllers\MasterLocationController.cs
	namespace 	
EltizamValuation
 
. 
Api 
. 
Controllers *
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class $
MasterLocationController )
:* +
ControllerBase, :
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
private 
readonly 
IStringLocalizer )
<) *
Errors* 0
>0 1!
_stringLocalizerError2 G
;G H
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
readonly "
IMasterLocationService /
_LocationService0 @
;@ A
public $
MasterLocationController '
(' (
IConfiguration( 6
configuration7 D
,D E
IResponseHandlerF V
<V W
dynamicW ^
>^ _
ObjectResponse` n
,n o
IStringLocalizer	p Ä
<
Ä Å
Errors
Å á
>
á à"
stringLocalizerError
â ù
,
ù û
IExceptionService
ü ∞
exceptionService
± ¡
,
¡ ¬$
IMasterLocationService
√ Ÿ
LocationService
⁄ È
)
È Í
{   	
_configuration!! 
=!! 
configuration!! *
;!!* +
_ObjectResponse"" 
="" 
ObjectResponse"" ,
;"", -!
_stringLocalizerError## !
=##" # 
stringLocalizerError##$ 8
;##8 9
_ExceptionService$$ 
=$$ 
exceptionService$$  0
;$$0 1
_LocationService%% 
=%% 
LocationService%% .
;%%. /
}&& 	
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
DataTableAjaxPostModel<<; Q
?<<Q R
model<<S X
)<<X Y
{== 	
try>> 
{?? 
return@@ 
_ObjectResponse@@ &
.@@& '

CreateData@@' 1
(@@1 2
await@@2 7
_LocationService@@8 H
.@@H I
GetAll@@I O
(@@O P
model@@P U
)@@U V
,@@V W
(@@X Y
Int32@@Y ^
)@@^ _
HttpStatusCode@@_ m
.@@m n
OK@@n p
)@@p q
;@@q r
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
)	DD Ä
;
DDÄ Å
}EE 
}FF 	
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
var__ 
oLocationEntity__ #
=__$ %
await__& +
_LocationService__, <
.__< =
GetById__= D
(__D E
id__E G
)__G H
;__H I
if`` 
(`` 
oLocationEntity`` #
!=``$ &
null``' +
&&``, .
oLocationEntity``/ >
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
oLocationEntityaa2 A
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
)	gg Ä
;
ggÄ Å
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
(nn/ 0 
MasterLocationEntitynn0 D
	oLocationnnE N
)nnN O
{oo 	
trypp 
{qq 
DBOperationrr 
	oResponserr %
=rr& '
awaitrr( -
_LocationServicerr. >
.rr> ?#
AddUpdateLocationClientrr? V
(rrV W
	oLocationrrW `
)rr` a
;rra b
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
(uuR S
	oLocationuuS \
.uu\ ]
Iduu] _
>uu` a
$numuub c
?uud e
AppConstantsuuf r
.uur s
UpdateSuccess	uus Ä
:
uuÅ Ç
AppConstants
uuÉ è
.
uuè ê
InsertSuccess
uuê ù
)
uuù û
)
uuû ü
;
uuü †
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
xxÄ å
.
xxå ç
NoRecordFound
xxç ö
:
xxõ ú
AppConstants
xxù ©
.
xx© ™

BadRequest
xx™ ¥
)
xx¥ µ
)
xxµ ∂
;
xx∂ ∑
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
)	|| Ä
;
||Ä Å
}}} 
}~~ 	
}
ìì 
}îî Ÿ
@D:\EltizamLive\Eltizam.Api\Controllers\MasterModuleController.cs
	namespace 	
Eltizam
 
. 
API 
. 
Controllers !
.! "
Masters" )
{		 
[

 
Route

 

(


 
$str

 
)

 
]

 
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class "
MasterModuleController '
:( )
ControllerBase* 8
{ 
private 
readonly  
IMasterModuleService - 
_MasterModuleService. B
;B C
private 
readonly 
IResponseHandler )
<) *
dynamic* 1
>1 2
_ObjectResponse3 B
;B C
public "
MasterModuleController %
(% & 
IMasterModuleService& :
MasterModuleService; N
,N O
IResponseHandlerP `
<` a
dynamica h
>h i
ObjectResponsej x
)x y
{ 	 
_MasterModuleService  
=! "
MasterModuleService# 6
;6 7
_ObjectResponse 
= 
ObjectResponse ,
;, -
} 	
[** 	
HttpGet**	 
,** 
Route** 
(** 
$str** &
)**& '
]**' (
public++ 
async++ 
Task++ 
<++ 
IActionResult++ '
>++' (
GetAllModule++) 5
(++5 6
)++6 7
{,, 	
try-- 
{.. 
var// 
oModuleList// 
=//  !
await//" ' 
_MasterModuleService//( <
.//< =
GetAll//= C
(//C D
)//D E
;//E F
if00 
(00 
oModuleList00 
!=00  "
null00# '
)00' (
return11 
_ObjectResponse11 *
.11* +
Create11+ 1
(111 2
oModuleList112 =
,11= >
(11? @
Int3211@ E
)11E F
HttpStatusCode11F T
.11T U
OK11U W
)11W X
;11X Y
else22 
return33 
_ObjectResponse33 *
.33* +
Create33+ 1
(331 2
null332 6
,336 7
(338 9
Int32339 >
)33> ?
HttpStatusCode33? M
.33M N

BadRequest33N X
,33X Y
AppConstants33Z f
.33f g
NoRecordFound33g t
)33t u
;33u v
}44 
catch55 
(55 
	Exception55 
ex55 
)55  
{66 
return77 
_ObjectResponse77 &
.77& '
Create77' -
(77- .
false77. 3
,773 4
(775 6
Int32776 ;
)77; <
HttpStatusCode77< J
.77J K
InternalServerError77K ^
,77^ _
Convert77` g
.77g h
ToString77h p
(77p q
ex77q s
.77s t

StackTrace77t ~
)77~ 
)	77 Ä
;
77Ä Å
}88 
}99 	
}:: 
};; e
GD:\EltizamLive\Eltizam.Api\Controllers\MasterOwnershipTypeController.cs
	namespace 	
EltizamValuation
 
. 
Api 
. 
Controllers *
{ 
[ 
Route 

(
 
$str 
) 
] 
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
private 
readonly 
IStringLocalizer )
<) *
Errors* 0
>0 1!
_stringLocalizerError2 G
;G H
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
IMasterOwnershipTypeService 4!
_OwnershipTypeService5 J
;J K
public   )
MasterOwnershipTypeController   ,
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
IStringLocalizer	  u Ö
<
  Ö Ü
Errors
  Ü å
>
  å ç"
stringLocalizerError
  é ¢
,
  ¢ £
IExceptionService
  § µ
exceptionService
  ∂ ∆
,
  ∆ «)
IMasterOwnershipTypeService
  » „"
OwnershipTypeService
  ‰ ¯
)
  ¯ ˘
{!! 	
_configuration"" 
="" 
configuration"" *
;""* +
_ObjectResponse## 
=## 
ObjectResponse## ,
;##, -!
_stringLocalizerError$$ !
=$$" # 
stringLocalizerError$$$ 8
;$$8 9
_ExceptionService%% 
=%% 
exceptionService%%  0
;%%0 1!
_OwnershipTypeService&& !
=&&" # 
OwnershipTypeService&&$ 8
;&&8 9
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
DataTableAjaxPostModel==; Q
model==R W
)==W X
{>> 	
try?? 
{@@ 
returnAA 
_ObjectResponseAA &
.AA& '

CreateDataAA' 1
(AA1 2
awaitAA2 7!
_OwnershipTypeServiceAA8 M
.AAM N
GetAllAAN T
(AAT U
modelAAU Z
)AAZ [
,AA[ \
(AA] ^
Int32AA^ c
)AAc d
HttpStatusCodeAAd r
.AAr s
OKAAs u
)AAu v
;AAv w
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
)	EE Ä
;
EEÄ Å
}FF 
}GG 	
[II 	
HttpGetII	 
,II 
RouteII 
(II 
$strII -
)II- .
]II. /
publicJJ 
asyncJJ 
TaskJJ 
<JJ 
IActionResultJJ '
>JJ' (
GetAllOwnershipTypeJJ) <
(JJ< =
)JJ= >
{KK 	
tryLL 
{MM 
varNN 
	oRoleListNN 
=NN 
awaitNN  %!
_OwnershipTypeServiceNN& ;
.NN; < 
GetOwnershipTypeListNN< P
(NNP Q
)NNQ R
;NNR S
ifOO 
(OO 
	oRoleListOO 
!=OO  
nullOO! %
)OO% &
returnPP 
_ObjectResponsePP *
.PP* +

CreateDataPP+ 5
(PP5 6
	oRoleListPP6 ?
,PP? @
(PPA B
Int32PPB G
)PPG H
HttpStatusCodePPH V
.PPV W
OKPPW Y
)PPY Z
;PPZ [
elseQQ 
returnRR 
_ObjectResponseRR *
.RR* +
CreateRR+ 1
(RR1 2
nullRR2 6
,RR6 7
(RR8 9
Int32RR9 >
)RR> ?
HttpStatusCodeRR? M
.RRM N

BadRequestRRN X
,RRX Y
AppConstantsRRZ f
.RRf g
NoRecordFoundRRg t
)RRt u
;RRu v
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
)	VV Ä
;
VVÄ Å
}WW 
}XX 	
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
oOwnershipTypeEntity`` (
=``) *
await``+ 0!
_OwnershipTypeService``1 F
.``F G
GetById``G N
(``N O
id``O Q
)``Q R
;``R S
ifaa 
(aa  
oOwnershipTypeEntityaa (
!=aa) +
nullaa, 0
&&aa1 3 
oOwnershipTypeEntityaa4 H
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
oOwnershipTypeEntitybb2 F
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
)	hh Ä
;
hhÄ Å
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
(oo/ 0%
MasterOwnershipTypeEntityoo0 I
oOwnershipTypeooJ X
)ooX Y
{pp 	
tryqq 
{rr 
DBOperationss 
	oResponsess %
=ss& '
awaitss( -!
_OwnershipTypeServicess. C
.ssC D
UpsertssD J
(ssJ K
oOwnershipTypessK Y
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
oOwnershipTypevvS a
.vva b
Idvvb d
>vve f
$numvvg h
?vvi j
AppConstantsvvk w
.vvw x
UpdateSuccess	vvx Ö
:
vvÜ á
AppConstants
vvà î
.
vvî ï
InsertSuccess
vvï ¢
)
vv¢ £
)
vv£ §
;
vv§ •
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
yyÄ å
.
yyå ç
NoRecordFound
yyç ö
:
yyõ ú
AppConstants
yyù ©
.
yy© ™

BadRequest
yy™ ¥
)
yy¥ µ
)
yyµ ∂
;
yy∂ ∑
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
)	}} Ä
;
}}Ä Å
}~~ 
} 	
[
ÇÇ 	

HttpDelete
ÇÇ	 
(
ÇÇ 
$str
ÇÇ !
)
ÇÇ! "
]
ÇÇ" #
public
ÉÉ 
async
ÉÉ 
Task
ÉÉ 
<
ÉÉ 
IActionResult
ÉÉ '
>
ÉÉ' (
Delete
ÉÉ) /
(
ÉÉ/ 0
[
ÉÉ0 1
	FromRoute
ÉÉ1 :
]
ÉÉ: ;
int
ÉÉ< ?
id
ÉÉ@ B
)
ÉÉB C
{
ÑÑ 	
try
ÖÖ 
{
ÜÜ 
DBOperation
áá 
	oResponse
áá %
=
áá& '
await
áá( -#
_OwnershipTypeService
áá. C
.
ááC D
Delete
ááD J
(
ááJ K
id
ááK M
)
ááM N
;
ááN O
if
àà 
(
àà 
	oResponse
àà 
==
àà  
DBOperation
àà! ,
.
àà, -
Success
àà- 4
)
àà4 5
return
ââ 
_ObjectResponse
ââ *
.
ââ* +
Create
ââ+ 1
(
ââ1 2
true
ââ2 6
,
ââ6 7
(
ââ8 9
Int32
ââ9 >
)
ââ> ?
HttpStatusCode
ââ? M
.
ââM N
OK
ââN P
,
ââP Q
AppConstants
ââR ^
.
ââ^ _
DeleteSuccess
ââ_ l
)
ââl m
;
ââm n
else
ää 
return
ãã 
_ObjectResponse
ãã *
.
ãã* +
Create
ãã+ 1
(
ãã1 2
null
ãã2 6
,
ãã6 7
(
ãã8 9
Int32
ãã9 >
)
ãã> ?
HttpStatusCode
ãã? M
.
ããM N

BadRequest
ããN X
,
ããX Y
AppConstants
ããZ f
.
ããf g
NoRecordFound
ããg t
)
ããt u
;
ããu v
}
åå 
catch
çç 
(
çç 
	Exception
çç 
ex
çç 
)
çç  
{
éé 
return
èè 
_ObjectResponse
èè &
.
èè& '
Create
èè' -
(
èè- .
false
èè. 3
,
èè3 4
(
èè5 6
Int32
èè6 ;
)
èè; <
HttpStatusCode
èè< J
.
èèJ K!
InternalServerError
èèK ^
,
èè^ _
Convert
èè` g
.
èèg h
ToString
èèh p
(
èèp q
ex
èèq s
.
èès t

StackTrace
èèt ~
)
èè~ 
)èè Ä
;èèÄ Å
}
êê 
}
ëë 	
}
îî 
}ïï ¥[
BD:\EltizamLive\Eltizam.Api\Controllers\MasterPropertyController.cs
	namespace

 	
EltizamValuation


 
.

 
Api

 
.

 
Controllers

 *
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class $
MasterPropertyController )
:* +
ControllerBase, :
{ 
private 
readonly "
IMasterPropertyService /
_propertyServices0 A
;A B
private 
readonly 
IResponseHandler )
<) *
dynamic* 1
>1 2
_ObjectResponse3 B
;B C
private 
readonly 
IExceptionService *
_ExceptionService+ <
;< =
IExceptionService 
exceptionService *
;* +
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
)y z
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
UpdateSuccess	++w Ñ
:
++Ö Ü
AppConstants
++á ì
.
++ì î
InsertSuccess
++î °
)
++° ¢
)
++¢ £
;
++£ §
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
..Ä å
.
..å ç
NoRecordFound
..ç ö
:
..õ ú
AppConstants
..ù ©
.
..© ™

BadRequest
..™ ¥
)
..¥ µ
)
..µ ∂
;
..∂ ∑
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
)	33 Ä
;
33Ä Å
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
)	EE Ä
;
EEÄ Å
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
)	RR Ä
;
RRÄ Å
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
)	`` Ä
;
``Ä Å
}aa 
}bb 	
[ww 	
HttpGetww	 
]ww 
[xx 	
Routexx	 
(xx 
$strxx \
)xx\ ]
]xx] ^
publicyy 
asyncyy 
Taskyy 
<yy 
IActionResultyy '
>yy' (&
GetMasterPropertyByFiltersyy) C
(yyC D
[yyD E
	FromRouteyyE N
]yyN O
intyyP S
propertyTypeIdyyT b
,yyb c
intyyd g
subPropertyTypeIdyyh y
,yyy z
intyy{ ~
ownershipTypeId	yy é
)
yyé è
{zz 	
try{{ 
{|| 
var}} 
oPrpoertyTypeEntity}} '
=}}( )
await}}* /
_propertyServices}}0 A
.}}A B+
GetMasterPropertyByFiltersAsync}}B a
(}}a b
propertyTypeId}}b p
,}}p q
subPropertyTypeId	}}q Ç
,
}}Ç É
ownershipTypeId
}}É í
)
}}í ì
;
}}ì î
if~~ 
(~~ 
oPrpoertyTypeEntity~~ '
!=~~( *
null~~+ /
)~~/ 0
return 
_ObjectResponse *
.* +

CreateData+ 5
(5 6
oPrpoertyTypeEntity6 I
,I J
(K L
Int32L Q
)Q R
HttpStatusCodeR `
.` a
OKa c
)c d
;d e
else
ÄÄ 
return
ÅÅ 
_ObjectResponse
ÅÅ *
.
ÅÅ* +
Create
ÅÅ+ 1
(
ÅÅ1 2
null
ÅÅ2 6
,
ÅÅ6 7
(
ÅÅ8 9
Int32
ÅÅ9 >
)
ÅÅ> ?
HttpStatusCode
ÅÅ? M
.
ÅÅM N

BadRequest
ÅÅN X
,
ÅÅX Y
AppConstants
ÅÅZ f
.
ÅÅf g
NoRecordFound
ÅÅg t
)
ÅÅt u
;
ÅÅu v
}
ÇÇ 
catch
ÉÉ 
(
ÉÉ 
	Exception
ÉÉ 
ex
ÉÉ 
)
ÉÉ  
{
ÑÑ 
return
ÖÖ 
_ObjectResponse
ÖÖ &
.
ÖÖ& '
Create
ÖÖ' -
(
ÖÖ- .
false
ÖÖ. 3
,
ÖÖ3 4
(
ÖÖ5 6
Int32
ÖÖ6 ;
)
ÖÖ; <
HttpStatusCode
ÖÖ< J
.
ÖÖJ K!
InternalServerError
ÖÖK ^
,
ÖÖ^ _
Convert
ÖÖ` g
.
ÖÖg h
ToString
ÖÖh p
(
ÖÖp q
ex
ÖÖq s
.
ÖÖs t

StackTrace
ÖÖt ~
)
ÖÖ~ 
)ÖÖ Ä
;ÖÖÄ Å
}
ÜÜ 
}
áá 	
}
ââ 
}ää …C
ID:\EltizamLive\Eltizam.Api\Controllers\MasterPropertySubTypeController.cs
	namespace

 	
EltizamValuation


 
.

 
Api

 
.

 
Controllers

 *
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class +
MasterPropertySubTypeController 0
:1 2
ControllerBase3 A
{ 
private 
readonly )
IMasterPropertySubTypeService 6 
_subpropertyServices7 K
;K L
private 
readonly 
IResponseHandler )
<) *
dynamic* 1
>1 2
_ObjectResponse3 B
;B C
private 
readonly 
IExceptionService *
_ExceptionService+ <
;< =
IExceptionService 
exceptionService *
;* +
public +
MasterPropertySubTypeController .
(. /)
IMasterPropertySubTypeService/ L
subpropertyServicesM `
,` a
IResponseHandlerb r
<r s
dynamics z
>z {
ObjectResponse	| ä
)
ä ã
{ 	 
_subpropertyServices  
=! "
subpropertyServices# 6
;6 7
_ObjectResponse 
= 
ObjectResponse ,
;, -
_ExceptionService 
= 
exceptionService  0
;0 1
} 	
[!! 	
HttpPost!!	 
]!! 
["" 	
Route""	 
("" 
$str"" 
)"" 
]"" 
public## 
async## 
Task## 
<## 
IActionResult## '
>##' (
Upsert##) /
(##/ 0'
Master_PropertySubTypeModel##0 K
oPrpoertyType##L Y
)##Y Z
{$$ 	
try%% 
{&& 
DBOperation'' 
	oResponse'' %
=''& '
await''( - 
_subpropertyServices''. B
.''B C&
AddUpdateMasterSubProperty''C ]
(''] ^
oPrpoertyType''^ k
)''k l
;''l m
if(( 
((( 
	oResponse(( 
==((  
DBOperation((! ,
.((, -
Success((- 4
)((4 5
{)) 
return** 
_ObjectResponse** *
.*** +
Create**+ 1
(**1 2
true**2 6
,**6 7
(**8 9
Int32**9 >
)**> ?
HttpStatusCode**? M
.**M N
OK**N P
,**P Q
(**R S
oPrpoertyType**S `
.**` a
Id**a c
>**d e
$num**f g
?**h i
AppConstants**j v
.**v w
UpdateSuccess	**w Ñ
:
**Ö Ü
AppConstants
**á ì
.
**ì î
InsertSuccess
**î °
)
**° ¢
)
**¢ £
;
**£ §
}++ 
else,, 
return-- 
_ObjectResponse-- *
.--* +
Create--+ 1
(--1 2
false--2 7
,--7 8
(--9 :
Int32--: ?
)--? @
HttpStatusCode--@ N
.--N O

BadRequest--O Y
,--Y Z
(--[ \
	oResponse--\ e
==--f h
DBOperation--i t
.--t u
NotFound--u }
?--~ 
AppConstants
--Ä å
.
--å ç
NoRecordFound
--ç ö
:
--õ ú
AppConstants
--ù ©
.
--© ™

BadRequest
--™ ¥
)
--¥ µ
)
--µ ∂
;
--∂ ∑
}.. 
catch// 
(// 
	Exception// 
ex// 
)//  
{00 
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
)	22 Ä
;
22Ä Å
}33 
}44 	
[66 	
HttpGet66	 
]66 
[77 	
Route77	 
(77 
$str77 
)77 
]77 
public88 
async88 
Task88 
<88 
IActionResult88 '
>88' ($
GetMasterSubPropertyById88) A
(88A B
[88B C
	FromRoute88C L
]88L M
int88N Q
id88R T
)88T U
{99 	
try:: 
{;; 
var<< 
oPrpoertyTypeEntity<< '
=<<( )
await<<* / 
_subpropertyServices<<0 D
.<<D E)
GetMasterSubPropertyByIdAsync<<E b
(<<b c
id<<c e
)<<e f
;<<f g
if== 
(== 
oPrpoertyTypeEntity== '
!===( *
null==+ /
&&==0 2
oPrpoertyTypeEntity==3 F
.==F G
Id==G I
>==J K
$num==L M
)==M N
return>> 
_ObjectResponse>> *
.>>* +
Create>>+ 1
(>>1 2
oPrpoertyTypeEntity>>2 E
,>>E F
(>>G H
Int32>>H M
)>>M N
HttpStatusCode>>N \
.>>\ ]
OK>>] _
)>>_ `
;>>` a
else?? 
return@@ 
_ObjectResponse@@ *
.@@* +
Create@@+ 1
(@@1 2
null@@2 6
,@@6 7
(@@8 9
Int32@@9 >
)@@> ?
HttpStatusCode@@? M
.@@M N

BadRequest@@N X
,@@X Y
AppConstants@@Z f
.@@f g
NoRecordFound@@g t
)@@t u
;@@u v
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
)	DD Ä
;
DDÄ Å
}EE 
}FF 	
[HH 	
HttpGetHH	 
]HH 
[II 	
RouteII	 
(II 
$strII )
)II) *
]II* +
publicJJ 
asyncJJ 
TaskJJ 
<JJ 
IActionResultJJ '
>JJ' (0
$GetMasterSubPropertyByPropertyTypeIdJJ) M
(JJM N
[JJN O
	FromRouteJJO X
]JJX Y
intJJZ ]
idJJ^ `
)JJ` a
{KK 	
tryLL 
{MM 
varNN 
oPrpoertyTypeEntityNN '
=NN( )
awaitNN* / 
_subpropertyServicesNN0 D
.NND E5
)GetMasterSubPropertyByPropertyTypeIdAsyncNNE n
(NNn o
idNNo q
)NNq r
;NNr s
ifOO 
(OO 
oPrpoertyTypeEntityOO '
!=OO( *
nullOO+ /
)OO/ 0
returnPP 
_ObjectResponsePP *
.PP* +

CreateDataPP+ 5
(PP5 6
oPrpoertyTypeEntityPP6 I
,PPI J
(PPK L
Int32PPL Q
)PPQ R
HttpStatusCodePPR `
.PP` a
OKPPa c
)PPc d
;PPd e
elseQQ 
returnRR 
_ObjectResponseRR *
.RR* +
CreateRR+ 1
(RR1 2
nullRR2 6
,RR6 7
(RR8 9
Int32RR9 >
)RR> ?
HttpStatusCodeRR? M
.RRM N

BadRequestRRN X
,RRX Y
AppConstantsRRZ f
.RRf g
NoRecordFoundRRg t
)RRt u
;RRu v
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
)	VV Ä
;
VVÄ Å
}WW 
}XX 	
}
ää 
}ãã Á]
FD:\EltizamLive\Eltizam.Api\Controllers\MasterPropertyTypeController.cs
	namespace 	
EltizamValuation
 
. 
Api 
. 
Controllers *
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class (
MasterPropertyTypeController -
:. /
ControllerBase0 >
{ 
private 
readonly &
IMasterPropertyTypeService 3!
_propertyTypeServices4 I
;I J
private 
readonly )
IMasterPropertySubTypeService 6$
_propertySubTypeServices7 O
;O P
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
;< =
IExceptionService 
exceptionService *
;* +
public (
MasterPropertyTypeController +
(+ ,&
IMasterPropertyTypeService, F 
propertyTypeServicesG [
,[ \)
IMasterPropertySubTypeService] z$
propertySubTypeServices	{ í
,
í ì
IResponseHandler
î §
<
§ •
dynamic
• ¨
>
¨ ≠
ObjectResponse
Æ º
)
º Ω
{ 	!
_propertyTypeServices !
=" # 
propertyTypeServices$ 8
;8 9
_ObjectResponse 
= 
ObjectResponse ,
;, -$
_propertySubTypeServices   $
=  % &#
propertySubTypeServices  ' >
;  > ?
}!! 	
[%% 	
HttpPost%%	 
]%% 
[&& 	
Route&&	 
(&& 
$str&& 
)&& 
]&& 
public'' 
async'' 
Task'' 
<'' 
IActionResult'' '
>''' (
Upsert'') /
(''/ 0$
Master_PropertyTypeModel''0 H
oPrpoertyType''I V
)''V W
{(( 	
try)) 
{** 
DBOperation++ 
	oResponse++ %
=++& '
await++( -!
_propertyTypeServices++. C
.++C D'
AddUpdateMasterPropertyType++D _
(++_ `
oPrpoertyType++` m
)++m n
;++n o
if,, 
(,, 
	oResponse,, 
==,,  
DBOperation,,! ,
.,,, -
Success,,- 4
),,4 5
{-- 
return.. 
_ObjectResponse.. *
...* +
Create..+ 1
(..1 2
true..2 6
,..6 7
(..8 9
Int32..9 >
)..> ?
HttpStatusCode..? M
...M N
OK..N P
,..P Q
(..R S
oPrpoertyType..S `
...` a
Id..a c
>..d e
$num..f g
?..h i
AppConstants..j v
...v w
UpdateSuccess	..w Ñ
:
..Ö Ü
AppConstants
..á ì
.
..ì î
InsertSuccess
..î °
)
..° ¢
)
..¢ £
;
..£ §
}// 
else00 
return11 
_ObjectResponse11 *
.11* +
Create11+ 1
(111 2
false112 7
,117 8
(119 :
Int3211: ?
)11? @
HttpStatusCode11@ N
.11N O

BadRequest11O Y
,11Y Z
(11[ \
	oResponse11\ e
==11f h
DBOperation11i t
.11t u
NotFound11u }
?11~ 
AppConstants
11Ä å
.
11å ç
NoRecordFound
11ç ö
:
11õ ú
AppConstants
11ù ©
.
11© ™

BadRequest
11™ ¥
)
11¥ µ
)
11µ ∂
;
11∂ ∑
}22 
catch33 
(33 
	Exception33 
ex33 
)33  
{44 
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
)	66 Ä
;
66Ä Å
}77 
}88 	
[:: 	
HttpGet::	 
]:: 
[;; 	
Route;;	 
(;; 
$str;; 
);; 
];; 
public<< 
async<< 
Task<< 
<<< 
IActionResult<< '
><<' (!
GetMasterPropertyById<<) >
(<<> ?
[<<? @
	FromRoute<<@ I
]<<I J
int<<K N
id<<O Q
)<<Q R
{== 	
try>> 
{?? 
var@@ 
oPrpoertyTypeEntity@@ '
=@@( )
await@@* /!
_propertyTypeServices@@0 E
.@@E F*
GetMasterPropertyTypeByIdAsync@@F d
(@@d e
id@@e g
)@@g h
;@@h i
ifBB 
(BB 
oPrpoertyTypeEntityBB '
!=BB( *
nullBB+ /
&&BB0 2
oPrpoertyTypeEntityBB3 F
.BBF G
IdBBG I
>BBJ K
$numBBL M
)BBM N
{CC 
varDD 
subtypesDD  
=DD! "
awaitDD# ($
_propertySubTypeServicesDD) A
.DDA B5
)GetMasterSubPropertyByPropertyTypeIdAsyncDDB k
(DDk l
oPrpoertyTypeEntityDDl 
.	DD Ä
Id
DDÄ Ç
)
DDÇ É
;
DDÉ Ñ
oPrpoertyTypeEntityEE '
.EE' ("
MasterPropertySubTypesEE( >
=EE? @
subtypesEEA I
;EEI J
returnGG 
_ObjectResponseGG *
.GG* +
CreateGG+ 1
(GG1 2
oPrpoertyTypeEntityGG2 E
,GGE F
(GGG H
Int32GGH M
)GGM N
HttpStatusCodeGGN \
.GG\ ]
OKGG] _
)GG_ `
;GG` a
}HH 
elseII 
returnJJ 
_ObjectResponseJJ *
.JJ* +
CreateJJ+ 1
(JJ1 2
nullJJ2 6
,JJ6 7
(JJ8 9
Int32JJ9 >
)JJ> ?
HttpStatusCodeJJ? M
.JJM N

BadRequestJJN X
,JJX Y
AppConstantsJJZ f
.JJf g
NoRecordFoundJJg t
)JJt u
;JJu v
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
)	NN Ä
;
NNÄ Å
}OO 
}PP 	
[RR 	
HttpPostRR	 
,RR 
RouteRR 
(RR 
$strRR !
)RR! "
]RR" #
publicSS 
asyncSS 
TaskSS 
<SS 
IActionResultSS '
>SS' (
GetAllPropertySS) 7
(SS7 8
[SS8 9
FromFormSS9 A
]SSA B"
DataTableAjaxPostModelSSC Y
modelSSZ _
)SS_ `
{TT 	
tryUU 
{VV 
returnWW 
_ObjectResponseWW &
.WW& '

CreateDataWW' 1
(WW1 2
awaitWW2 7!
_propertyTypeServicesWW8 M
.WWM N
GetAllWWN T
(WWT U
modelWWU Z
)WWZ [
,WW[ \
(WW] ^
Int32WW^ c
)WWc d
HttpStatusCodeWWd r
.WWr s
OKWWs u
)WWu v
;WWv w
}XX 
catchYY 
(YY 
	ExceptionYY 
exYY 
)YY  
{ZZ 
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
)	[[ Ä
;
[[Ä Å
}\\ 
}]] 	
[`` 	
HttpGet``	 
,`` 
Route`` 
(`` 
$str`` $
)``$ %
]``% &
publicaa 
asyncaa 
Taskaa 
<aa 
IActionResultaa '
>aa' (

GetAllListaa) 3
(aa3 4
)aa4 5
{bb 	
trycc 
{dd 
returnee 
_ObjectResponseee &
.ee& '

CreateDataee' 1
(ee1 2
awaitee2 7!
_propertyTypeServicesee8 M
.eeM N

GetAllListeeN X
(eeX Y
)eeY Z
,eeZ [
(ee\ ]
Int32ee] b
)eeb c
HttpStatusCodeeec q
.eeq r
OKeer t
)eet u
;eeu v
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
)	ii Ä
;
iiÄ Å
}jj 
}kk 	
[ 	
HttpGet	 
( 
$str )
)) *
]* +
public
ÄÄ 
async
ÄÄ 
Task
ÄÄ 
<
ÄÄ 
IActionResult
ÄÄ '
>
ÄÄ' ($
CheckPropertTypeExists
ÄÄ) ?
(
ÄÄ? @
string
ÄÄ@ F
PropertyType
ÄÄG S
)
ÄÄS T
{
ÅÅ 	
try
ÇÇ 
{
ÉÉ 
int
ÑÑ 
id
ÑÑ 
=
ÑÑ 
$num
ÑÑ 
;
ÑÑ 
var
ÜÜ 
	oResponse
ÜÜ 
=
ÜÜ 
await
ÜÜ  %#
_propertyTypeServices
ÜÜ& ;
.
ÜÜ; <(
CheckDuplicatePropertyType
ÜÜ< V
(
ÜÜV W
PropertyType
ÜÜW c
)
ÜÜc d
;
ÜÜd e
return
áá 
_ObjectResponse
áá &
.
áá& '
Create
áá' -
(
áá- .
	oResponse
áá. 7
,
áá7 8
(
áá9 :
Int32
áá: ?
)
áá? @
HttpStatusCode
áá@ N
.
ááN O
OK
ááO Q
,
ááQ R
AppConstants
ááS _
.
áá_ `
DeleteSuccess
áá` m
)
áám n
;
áán o
}
àà 
catch
ââ 
(
ââ 
	Exception
ââ 
ex
ââ 
)
ââ  
{
ää 
await
ãã 
_ExceptionService
ãã '
.
ãã' (
LogException
ãã( 4
(
ãã4 5
ex
ãã5 7
)
ãã7 8
;
ãã8 9
return
åå 
_ObjectResponse
åå &
.
åå& '
Create
åå' -
(
åå- .
false
åå. 3
,
åå3 4
(
åå5 6
Int32
åå6 ;
)
åå; <
HttpStatusCode
åå< J
.
ååJ K!
InternalServerError
ååK ^
,
åå^ _
Convert
åå` g
.
ååg h
ToString
ååh p
(
ååp q
ex
ååq s
.
åås t

StackTrace
ååt ~
)
åå~ 
)åå Ä
;ååÄ Å
}
çç 
}
éé 	
}
ëë 
}íí µQ
GD:\EltizamLive\Eltizam.Api\Controllers\MasterQualificationController.cs
	namespace

 	
EltizamValuation


 
.

 
Api

 
.

 
Controllers

 *
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class )
MasterQualificationController .
:/ 0
ControllerBase1 ?
{ 
private 
readonly (
IMasterQualificationServices 5"
_qualificationServices6 L
;L M
private 
readonly 
IResponseHandler )
<) *
dynamic* 1
>1 2
_ObjectResponse3 B
;B C
private 
readonly 
IExceptionService *
_ExceptionService+ <
;< =
IExceptionService 
exceptionService *
;* +
public )
MasterQualificationController ,
(, -(
IMasterQualificationServices- I!
qualificationServicesJ _
,_ `
IResponseHandlera q
<q r
dynamicr y
>y z
ObjectResponse	{ â
)
â ä
{ 	"
_qualificationServices "
=# $!
qualificationServices% :
;: ;
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
($$/ 0%
Master_QualificationModel$$0 I
oQualification$$J X
)$$X Y
{%% 	
try&& 
{'' 
DBOperation(( 
	oResponse(( %
=((& '
await((( -"
_qualificationServices((. D
.((D E"
AddUpdateQualification((E [
((([ \
oQualification((\ j
)((j k
;((k l
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
(++R S
oQualification++S a
.++a b
Id++b d
>++e f
$num++g h
?++i j
AppConstants++k w
.++w x
UpdateSuccess	++x Ö
:
++Ü á
AppConstants
++à î
.
++î ï
InsertSuccess
++ï ¢
)
++¢ £
)
++£ §
;
++§ •
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
..Ä å
.
..å ç
NoRecordFound
..ç ö
:
..õ ú
AppConstants
..ù ©
.
..© ™

BadRequest
..™ ¥
)
..¥ µ
)
..µ ∂
;
..∂ ∑
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
)	22 Ä
;
22Ä Å
}33 
}44 	
[66 	
HttpGet66	 
]66 
[77 	
Route77	 
(77 
$str77 
)77 
]77 
public88 
async88 
Task88 
<88 
IActionResult88 '
>88' ( 
GetQualificationById88) =
(88= >
[88> ?
	FromRoute88? H
]88H I
int88J M
id88N P
)88P Q
{99 	
try:: 
{;; 
var<<  
oQualificationEntity<< (
=<<) *
await<<+ 0"
_qualificationServices<<1 G
.<<G H+
GetMasterQualificationByIdAsync<<H g
(<<g h
id<<h j
)<<j k
;<<k l
if== 
(==  
oQualificationEntity== (
!===) +
null==, 0
&&==1 3 
oQualificationEntity==4 H
.==H I
Id==I K
>==L M
$num==N O
)==O P
return>> 
_ObjectResponse>> *
.>>* +
Create>>+ 1
(>>1 2 
oQualificationEntity>>2 F
,>>F G
(>>H I
Int32>>I N
)>>N O
HttpStatusCode>>O ]
.>>] ^
OK>>^ `
)>>` a
;>>a b
else?? 
return@@ 
_ObjectResponse@@ *
.@@* +
Create@@+ 1
(@@1 2
null@@2 6
,@@6 7
(@@8 9
Int32@@9 >
)@@> ?
HttpStatusCode@@? M
.@@M N

BadRequest@@N X
,@@X Y
AppConstants@@Z f
.@@f g
NoRecordFound@@g t
)@@t u
;@@u v
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
)	DD Ä
;
DDÄ Å
}EE 
}FF 	
[HH 	
HttpPostHH	 
,HH 
RouteHH 
(HH 
$strHH .
)HH. /
]HH/ 0
publicII 
asyncII 
TaskII 
<II 
IActionResultII '
>II' (
GetAllQualificationII) <
(II< =
[II= >
FromFormII> F
]IIF G"
DataTableAjaxPostModelIIH ^
modelII_ d
)IId e
{JJ 	
tryKK 
{LL 
returnMM 
_ObjectResponseMM &
.MM& '

CreateDataMM' 1
(MM1 2
awaitMM2 7"
_qualificationServicesMM8 N
.MMN O
GetAllMMO U
(MMU V
modelMMV [
)MM[ \
,MM\ ]
(MM^ _
Int32MM_ d
)MMd e
HttpStatusCodeMMe s
.MMs t
OKMMt v
)MMv w
;MMw x
}NN 
catchOO 
(OO 
	ExceptionOO 
exOO 
)OO  
{PP 
awaitQQ 
_ExceptionServiceQQ '
.QQ' (
LogExceptionQQ( 4
(QQ4 5
exQQ5 7
)QQ7 8
;QQ8 9
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
)	RR Ä
;
RRÄ Å
}SS 
}TT 	
[VV 	

HttpDeleteVV	 
(VV 
$strVV .
)VV. /
]VV/ 0
publicWW 
asyncWW 
TaskWW 
<WW 
IActionResultWW '
>WW' (
DeleteQualificationWW) <
(WW< =
[WW= >
	FromRouteWW> G
]WWG H
intWWI L
idWWM O
)WWO P
{XX 	
tryYY 
{ZZ 
DBOperation[[ 
	oResponse[[ %
=[[& '
await[[( -"
_qualificationServices[[. D
.[[D E
DeleteQualification[[E X
([[X Y
id[[Y [
)[[[ \
;[[\ ]
if\\ 
(\\ 
	oResponse\\ 
==\\  
DBOperation\\! ,
.\\, -
Success\\- 4
)\\4 5
return]] 
_ObjectResponse]] *
.]]* +
Create]]+ 1
(]]1 2
true]]2 6
,]]6 7
(]]8 9
Int32]]9 >
)]]> ?
HttpStatusCode]]? M
.]]M N
OK]]N P
,]]P Q
AppConstants]]R ^
.]]^ _
DeleteSuccess]]_ l
)]]l m
;]]m n
else^^ 
return__ 
_ObjectResponse__ *
.__* +
Create__+ 1
(__1 2
null__2 6
,__6 7
(__8 9
Int32__9 >
)__> ?
HttpStatusCode__? M
.__M N

BadRequest__N X
,__X Y
AppConstants__Z f
.__f g
NoRecordFound__g t
)__t u
;__u v
}`` 
catchaa 
(aa 
	Exceptionaa 
exaa 
)aa  
{bb 
awaitcc 
_ExceptionServicecc '
.cc' (
LogExceptioncc( 4
(cc4 5
excc5 7
)cc7 8
;cc8 9
returndd 
_ObjectResponsedd &
.dd& '
Createdd' -
(dd- .
falsedd. 3
,dd3 4
(dd5 6
Int32dd6 ;
)dd; <
HttpStatusCodedd< J
.ddJ K
InternalServerErrorddK ^
,dd^ _
Convertdd` g
.ddg h
ToStringddh p
(ddp q
exddq s
.dds t

StackTraceddt ~
)dd~ 
)	dd Ä
;
ddÄ Å
}ee 
}ff 	
}jj 
}kk ˚î
>D:\EltizamLive\Eltizam.Api\Controllers\MasterRoleController.cs
	namespace 	
Eltizam
 
. 
API 
. 
Controllers !
.! "
Masters" )
{ 
[ 
Route 

(
 
$str 
) 
] 
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
IMasterModuleService	t à!
MasterModuleService
â ú
,
ú ù
IExceptionService
û Ø
exceptionService
∞ ¿
)
¿ ¡
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
AppConstants	<< ã
.
<<ã å
InsertSuccess
<<å ô
)
<<ô ö
)
<<ö õ
;
<<õ ú
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
>>Ä å
.
>>å ç
NoRecordFound
>>ç ö
:
>>õ ú
AppConstants
>>ù ©
.
>>© ™

BadRequest
>>™ ¥
)
>>¥ µ
)
>>µ ∂
;
>>∂ ∑
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
)	CC Ä
;
CCÄ Å
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
)	cc Ä
;
ccÄ Å
}dd 
}ee 	
[
ÜÜ 	
HttpPost
ÜÜ	 
,
ÜÜ 
Route
ÜÜ 
(
ÜÜ 
$str
ÜÜ !
)
ÜÜ! "
]
ÜÜ" #
public
áá 
async
áá 
Task
áá 
<
áá 
IActionResult
áá '
>
áá' (
GetAll
áá) /
(
áá/ 0
[
áá0 1
FromForm
áá1 9
]
áá9 :$
DataTableAjaxPostModel
áá; Q
model
ááR W
)
ááW X
{
àà 	
try
ââ 
{
ää 
return
ãã 
_ObjectResponse
ãã &
.
ãã& '

CreateData
ãã' 1
(
ãã1 2
await
ãã2 7 
_MasterRoleService
ãã8 J
.
ããJ K
GetAll
ããK Q
(
ããQ R
model
ããR W
)
ããW X
,
ããX Y
(
ããZ [
Int32
ãã[ `
)
ãã` a
HttpStatusCode
ããa o
.
ãão p
OK
ããp r
)
ããr s
;
ããs t
}
åå 
catch
çç 
(
çç 
	Exception
çç 
ex
çç 
)
çç  
{
éé 
await
èè 
_ExceptionService
èè '
.
èè' (
LogException
èè( 4
(
èè4 5
ex
èè5 7
)
èè7 8
;
èè8 9
return
êê 
_ObjectResponse
êê &
.
êê& '
Create
êê' -
(
êê- .
false
êê. 3
,
êê3 4
(
êê5 6
Int32
êê6 ;
)
êê; <
HttpStatusCode
êê< J
.
êêJ K!
InternalServerError
êêK ^
,
êê^ _
Convert
êê` g
.
êêg h
ToString
êêh p
(
êêp q
ex
êêq s
.
êês t

StackTrace
êêt ~
)
êê~ 
)êê Ä
;êêÄ Å
}
ëë 
}
íí 	
[
îî 	
HttpGet
îî	 
,
îî 
Route
îî 
(
îî 
$str
îî $
)
îî$ %
]
îî% &
public
ïï 
async
ïï 
Task
ïï 
<
ïï 
IActionResult
ïï '
>
ïï' (

RoleSearch
ïï) 3
(
ïï3 4
string
ïï4 :
searchQuery
ïï; F
)
ïïF G
{
ññ 	
try
óó 
{
òò 
var
ôô 
	oRoleList
ôô 
=
ôô 
await
ôô  % 
_MasterRoleService
ôô& 8
.
ôô8 9

RoleSearch
ôô9 C
(
ôôC D
searchQuery
ôôD O
)
ôôO P
;
ôôP Q
if
öö 
(
öö 
	oRoleList
öö 
!=
öö  
null
öö! %
)
öö% &
return
õõ 
_ObjectResponse
õõ *
.
õõ* +
Create
õõ+ 1
(
õõ1 2
	oRoleList
õõ2 ;
,
õõ; <
(
õõ= >
Int32
õõ> C
)
õõC D
HttpStatusCode
õõD R
.
õõR S
OK
õõS U
)
õõU V
;
õõV W
else
úú 
return
ùù 
_ObjectResponse
ùù *
.
ùù* +
Create
ùù+ 1
(
ùù1 2
null
ùù2 6
,
ùù6 7
(
ùù8 9
Int32
ùù9 >
)
ùù> ?
HttpStatusCode
ùù? M
.
ùùM N

BadRequest
ùùN X
,
ùùX Y
AppConstants
ùùZ f
.
ùùf g
NoRecordFound
ùùg t
)
ùùt u
;
ùùu v
}
ûû 
catch
üü 
(
üü 
	Exception
üü 
ex
üü 
)
üü  
{
†† 
await
°° 
_ExceptionService
°° '
.
°°' (
LogException
°°( 4
(
°°4 5
ex
°°5 7
)
°°7 8
;
°°8 9
return
¢¢ 
_ObjectResponse
¢¢ &
.
¢¢& '
Create
¢¢' -
(
¢¢- .
false
¢¢. 3
,
¢¢3 4
(
¢¢5 6
Int32
¢¢6 ;
)
¢¢; <
HttpStatusCode
¢¢< J
.
¢¢J K!
InternalServerError
¢¢K ^
,
¢¢^ _
Convert
¢¢` g
.
¢¢g h
ToString
¢¢h p
(
¢¢p q
ex
¢¢q s
.
¢¢s t

StackTrace
¢¢t ~
)
¢¢~ 
)¢¢ Ä
;¢¢Ä Å
}
££ 
}
§§ 	
[
¶¶ 	
HttpGet
¶¶	 
,
¶¶ 
Route
¶¶ 
(
¶¶ 
$str
¶¶ *
)
¶¶* +
]
¶¶+ ,
public
ßß 
async
ßß 
Task
ßß 
<
ßß 
IActionResult
ßß '
>
ßß' (
GetAllActiveRole
ßß) 9
(
ßß9 :
)
ßß: ;
{
®® 	
try
©© 
{
™™ 
var
´´ 
	oRoleList
´´ 
=
´´ 
await
´´  % 
_MasterRoleService
´´& 8
.
´´8 9
GetActiveRole
´´9 F
(
´´F G
)
´´G H
;
´´H I
if
¨¨ 
(
¨¨ 
	oRoleList
¨¨ 
!=
¨¨  
null
¨¨! %
)
¨¨% &
return
≠≠ 
_ObjectResponse
≠≠ *
.
≠≠* +
Create
≠≠+ 1
(
≠≠1 2
	oRoleList
≠≠2 ;
,
≠≠; <
(
≠≠= >
Int32
≠≠> C
)
≠≠C D
HttpStatusCode
≠≠D R
.
≠≠R S
OK
≠≠S U
)
≠≠U V
;
≠≠V W
else
ÆÆ 
return
ØØ 
_ObjectResponse
ØØ *
.
ØØ* +
Create
ØØ+ 1
(
ØØ1 2
null
ØØ2 6
,
ØØ6 7
(
ØØ8 9
Int32
ØØ9 >
)
ØØ> ?
HttpStatusCode
ØØ? M
.
ØØM N

BadRequest
ØØN X
,
ØØX Y
AppConstants
ØØZ f
.
ØØf g
NoRecordFound
ØØg t
)
ØØt u
;
ØØu v
}
∞∞ 
catch
±± 
(
±± 
	Exception
±± 
ex
±± 
)
±±  
{
≤≤ 
await
≥≥ 
_ExceptionService
≥≥ '
.
≥≥' (
LogException
≥≥( 4
(
≥≥4 5
ex
≥≥5 7
)
≥≥7 8
;
≥≥8 9
return
¥¥ 
_ObjectResponse
¥¥ &
.
¥¥& '
Create
¥¥' -
(
¥¥- .
false
¥¥. 3
,
¥¥3 4
(
¥¥5 6
Int32
¥¥6 ;
)
¥¥; <
HttpStatusCode
¥¥< J
.
¥¥J K!
InternalServerError
¥¥K ^
,
¥¥^ _
Convert
¥¥` g
.
¥¥g h
ToString
¥¥h p
(
¥¥p q
ex
¥¥q s
.
¥¥s t

StackTrace
¥¥t ~
)
¥¥~ 
)¥¥ Ä
;¥¥Ä Å
}
µµ 
}
∂∂ 	
[
ƒƒ 	
HttpPost
ƒƒ	 
(
ƒƒ 
$str
ƒƒ #
)
ƒƒ# $
]
ƒƒ$ %
public
≈≈ 
async
≈≈ 
Task
≈≈ 
<
≈≈ 
IActionResult
≈≈ '
>
≈≈' (

DeleteRole
≈≈) 3
(
≈≈3 4
[
≈≈4 5
	FromRoute
≈≈5 >
]
≈≈> ?
int
≈≈@ C
id
≈≈D F
)
≈≈F G
{
∆∆ 	
try
«« 
{
»» 
DBOperation
…… 
	oResponse
…… %
=
……& '
await
……( - 
_MasterRoleService
……. @
.
……@ A

DeleteRole
……A K
(
……K L
id
……L N
)
……N O
;
……O P
if
   
(
   
	oResponse
   
==
    
DBOperation
  ! ,
.
  , -
Success
  - 4
)
  4 5
return
ÀÀ 
_ObjectResponse
ÀÀ *
.
ÀÀ* +
Create
ÀÀ+ 1
(
ÀÀ1 2
true
ÀÀ2 6
,
ÀÀ6 7
(
ÀÀ8 9
Int32
ÀÀ9 >
)
ÀÀ> ?
HttpStatusCode
ÀÀ? M
.
ÀÀM N
OK
ÀÀN P
,
ÀÀP Q
AppConstants
ÀÀR ^
.
ÀÀ^ _
DeleteSuccess
ÀÀ_ l
)
ÀÀl m
;
ÀÀm n
else
ÃÃ 
if
ÃÃ 
(
ÃÃ 
	oResponse
ÃÃ "
==
ÃÃ# %
DBOperation
ÃÃ& 1
.
ÃÃ1 2
NotFound
ÃÃ2 :
)
ÃÃ: ;
return
ÕÕ 
_ObjectResponse
ÕÕ *
.
ÕÕ* +
Create
ÕÕ+ 1
(
ÕÕ1 2
null
ÕÕ2 6
,
ÕÕ6 7
(
ÕÕ8 9
Int32
ÕÕ9 >
)
ÕÕ> ?
HttpStatusCode
ÕÕ? M
.
ÕÕM N
OK
ÕÕN P
,
ÕÕP Q
$str
ÕÕR `
)
ÕÕ` a
;
ÕÕa b
else
ŒŒ 
return
œœ 
_ObjectResponse
œœ *
.
œœ* +
Create
œœ+ 1
(
œœ1 2
null
œœ2 6
,
œœ6 7
(
œœ8 9
Int32
œœ9 >
)
œœ> ?
HttpStatusCode
œœ? M
.
œœM N

BadRequest
œœN X
,
œœX Y
AppConstants
œœZ f
.
œœf g
NoRecordFound
œœg t
)
œœt u
;
œœu v
}
–– 
catch
—— 
(
—— 
	Exception
—— 
ex
—— 
)
——  
{
““ 
await
”” 
_ExceptionService
”” '
.
””' (
LogException
””( 4
(
””4 5
ex
””5 7
)
””7 8
;
””8 9
return
‘‘ 
_ObjectResponse
‘‘ &
.
‘‘& '
Create
‘‘' -
(
‘‘- .
false
‘‘. 3
,
‘‘3 4
(
‘‘5 6
Int32
‘‘6 ;
)
‘‘; <
HttpStatusCode
‘‘< J
.
‘‘J K!
InternalServerError
‘‘K ^
,
‘‘^ _
Convert
‘‘` g
.
‘‘g h
ToString
‘‘h p
(
‘‘p q
ex
‘‘q s
.
‘‘s t

StackTrace
‘‘t ~
)
‘‘~ 
)‘‘ Ä
;‘‘Ä Å
}
’’ 
}
÷÷ 	
[
‰‰ 	
HttpGet
‰‰	 
,
‰‰ 
Route
‰‰ 
(
‰‰ 
$str
‰‰ <
)
‰‰< =
]
‰‰= >
public
ÂÂ 
async
ÂÂ 
Task
ÂÂ 
<
ÂÂ 
IActionResult
ÂÂ '
>
ÂÂ' (+
GetByPermisionRoleUsingRoleId
ÂÂ) F
(
ÂÂF G
[
ÂÂG H
	FromRoute
ÂÂH Q
]
ÂÂQ R
int
ÂÂS V
id
ÂÂW Y
)
ÂÂY Z
{
ÊÊ 	
try
ÁÁ 
{
ËË 
dynamic
ÈÈ 
oRoleEntity
ÈÈ #
=
ÈÈ$ %
await
ÈÈ& +"
_MasterModuleService
ÈÈ, @
.
ÈÈ@ A+
GetByPermisionRoleUsingRoleId
ÈÈA ^
(
ÈÈ^ _
id
ÈÈ_ a
)
ÈÈa b
;
ÈÈb c
if
ÎÎ 
(
ÎÎ 
oRoleEntity
ÎÎ 
is
ÎÎ  "
not
ÎÎ# &
null
ÎÎ' +
)
ÎÎ+ ,
return
ÏÏ 
_ObjectResponse
ÏÏ *
.
ÏÏ* +
Create
ÏÏ+ 1
(
ÏÏ1 2
oRoleEntity
ÏÏ2 =
,
ÏÏ= >
(
ÏÏ? @
Int32
ÏÏ@ E
)
ÏÏE F
HttpStatusCode
ÏÏF T
.
ÏÏT U
OK
ÏÏU W
)
ÏÏW X
;
ÏÏX Y
else
ÌÌ 
return
ÓÓ 
_ObjectResponse
ÓÓ *
.
ÓÓ* +
Create
ÓÓ+ 1
(
ÓÓ1 2
null
ÓÓ2 6
,
ÓÓ6 7
(
ÓÓ8 9
Int32
ÓÓ9 >
)
ÓÓ> ?
HttpStatusCode
ÓÓ? M
.
ÓÓM N

BadRequest
ÓÓN X
,
ÓÓX Y
AppConstants
ÓÓZ f
.
ÓÓf g
NoRecordFound
ÓÓg t
)
ÓÓt u
;
ÓÓu v
}
ÔÔ 
catch
 
(
 
	Exception
 
ex
 
)
  
{
ÒÒ 
await
ÚÚ 
_ExceptionService
ÚÚ '
.
ÚÚ' (
LogException
ÚÚ( 4
(
ÚÚ4 5
ex
ÚÚ5 7
)
ÚÚ7 8
;
ÚÚ8 9
return
ÛÛ 
_ObjectResponse
ÛÛ &
.
ÛÛ& '
Create
ÛÛ' -
(
ÛÛ- .
false
ÛÛ. 3
,
ÛÛ3 4
(
ÛÛ5 6
Int32
ÛÛ6 ;
)
ÛÛ; <
HttpStatusCode
ÛÛ< J
.
ÛÛJ K!
InternalServerError
ÛÛK ^
,
ÛÛ^ _
Convert
ÛÛ` g
.
ÛÛg h
ToString
ÛÛh p
(
ÛÛp q
ex
ÛÛq s
.
ÛÛs t

StackTrace
ÛÛt ~
)
ÛÛ~ 
)ÛÛ Ä
;ÛÛÄ Å
}
ÙÙ 
}
ıı 	
}
¯¯ 
}˘˘ §k
?D:\EltizamLive\Eltizam.Api\Controllers\MasterStateController.cs
	namespace 	
EltizamValuation
 
. 
Api 
. 
Controllers *
{ 
[ 
Route 

(
 
$str 
) 
] 
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
private 
readonly 
IStringLocalizer )
<) *
Errors* 0
>0 1!
_stringLocalizerError2 G
;G H
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
IMasterStateService ,
_StateService- :
;: ;
public !
MasterStateController $
($ %
IConfiguration% 3
configuration4 A
,A B
IResponseHandlerC S
<S T
dynamicT [
>[ \
ObjectResponse] k
,k l
IStringLocalizerm }
<} ~
Errors	~ Ñ
>
Ñ Ö"
stringLocalizerError
Ü ö
,
ö õ
IExceptionService
ú ≠
exceptionService
Æ æ
,
æ ø!
IMasterStateService
¿ ”
StateService
‘ ‡
)
‡ ·
{   	
_configuration!! 
=!! 
configuration!! *
;!!* +
_ObjectResponse"" 
="" 
ObjectResponse"" ,
;"", -!
_stringLocalizerError## !
=##" # 
stringLocalizerError##$ 8
;##8 9
_ExceptionService$$ 
=$$ 
exceptionService$$  0
;$$0 1
_StateService%% 
=%% 
StateService%% (
;%%( )
}&& 	
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
await@@2 7
_StateService@@8 E
.@@E F
GetAll@@F L
(@@L M
model@@M R
)@@R S
,@@S T
(@@U V
Int32@@V [
)@@[ \
HttpStatusCode@@\ j
.@@j k
OK@@k m
)@@m n
;@@n o
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
)	DD Ä
;
DDÄ Å
}EE 
}FF 	
[II 	
HttpGetII	 
,II 
RouteII 
(II 
$strII &
)II& '
]II' (
publicJJ 
asyncJJ 
TaskJJ 
<JJ 
IActionResultJJ '
>JJ' (
GetByIdJJ) 0
(JJ0 1
[JJ1 2
	FromRouteJJ2 ;
]JJ; <
intJJ= @
idJJA C
)JJC D
{KK 	
tryLL 
{MM 
varNN 
oStateEntityNN  
=NN! "
awaitNN# (
_StateServiceNN) 6
.NN6 7
GetByIdNN7 >
(NN> ?
idNN? A
)NNA B
;NNB C
ifOO 
(OO 
oStateEntityOO  
!=OO! #
nullOO$ (
&&OO) +
oStateEntityOO, 8
.OO8 9
IdOO9 ;
>OO< =
$numOO> ?
)OO? @
returnPP 
_ObjectResponsePP *
.PP* +
CreatePP+ 1
(PP1 2
oStateEntityPP2 >
,PP> ?
(PP@ A
Int32PPA F
)PPF G
HttpStatusCodePPG U
.PPU V
OKPPV X
)PPX Y
;PPY Z
elseQQ 
returnRR 
_ObjectResponseRR *
.RR* +
CreateRR+ 1
(RR1 2
nullRR2 6
,RR6 7
(RR8 9
Int32RR9 >
)RR> ?
HttpStatusCodeRR? M
.RRM N

BadRequestRRN X
,RRX Y
AppConstantsRRZ f
.RRf g
NoRecordFoundRRg t
)RRt u
;RRu v
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
)	VV Ä
;
VVÄ Å
}WW 
}XX 	
[[[ 	
HttpPost[[	 
][[ 
[\\ 	
Route\\	 
(\\ 
$str\\ 
)\\ 
]\\ 
public]] 
async]] 
Task]] 
<]] 
IActionResult]] '
>]]' (
Upsert]]) /
(]]/ 0
MasterStateEntity]]0 A
oState]]B H
)]]H I
{^^ 	
try__ 
{`` 
DBOperationaa 
	oResponseaa %
=aa& '
awaitaa( -
_StateServiceaa. ;
.aa; <
Upsertaa< B
(aaB C
oStateaaC I
)aaI J
;aaJ K
ifbb 
(bb 
	oResponsebb 
==bb  
DBOperationbb! ,
.bb, -
Successbb- 4
)bb4 5
{cc 
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
,ddP Q
(ddR S
oStateddS Y
.ddY Z
IdddZ \
>dd] ^
$numdd_ `
?dda b
AppConstantsddc o
.ddo p
UpdateSuccessddp }
:dd~ 
AppConstants
ddÄ å
.
ddå ç
InsertSuccess
ddç ö
)
ddö õ
)
ddõ ú
;
ddú ù
}ee 
elseff 
returngg 
_ObjectResponsegg *
.gg* +
Creategg+ 1
(gg1 2
falsegg2 7
,gg7 8
(gg9 :
Int32gg: ?
)gg? @
HttpStatusCodegg@ N
.ggN O

BadRequestggO Y
,ggY Z
(gg[ \
	oResponsegg\ e
==ggf h
DBOperationggi t
.ggt u
NotFoundggu }
?gg~ 
AppConstants
ggÄ å
.
ggå ç
NoRecordFound
ggç ö
:
ggõ ú
AppConstants
ggù ©
.
gg© ™

BadRequest
gg™ ¥
)
gg¥ µ
)
ggµ ∂
;
gg∂ ∑
}hh 
catchii 
(ii 
	Exceptionii 
exii 
)ii  
{jj 
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
)	kk Ä
;
kkÄ Å
}ll 
}mm 	
[pp 	

HttpDeletepp	 
(pp 
$strpp !
)pp! "
]pp" #
publicqq 
asyncqq 
Taskqq 
<qq 
IActionResultqq '
>qq' (
Deleteqq) /
(qq/ 0
[qq0 1
	FromRouteqq1 :
]qq: ;
intqq< ?
idqq@ B
)qqB C
{rr 	
tryss 
{tt 
DBOperationuu 
	oResponseuu %
=uu& '
awaituu( -
_StateServiceuu. ;
.uu; <
Deleteuu< B
(uuB C
iduuC E
)uuE F
;uuF G
ifvv 
(vv 
	oResponsevv 
==vv  
DBOperationvv! ,
.vv, -
Successvv- 4
)vv4 5
returnww 
_ObjectResponseww *
.ww* +
Createww+ 1
(ww1 2
trueww2 6
,ww6 7
(ww8 9
Int32ww9 >
)ww> ?
HttpStatusCodeww? M
.wwM N
OKwwN P
,wwP Q
AppConstantswwR ^
.ww^ _
DeleteSuccessww_ l
)wwl m
;wwm n
elsexx 
returnyy 
_ObjectResponseyy *
.yy* +
Createyy+ 1
(yy1 2
nullyy2 6
,yy6 7
(yy8 9
Int32yy9 >
)yy> ?
HttpStatusCodeyy? M
.yyM N

BadRequestyyN X
,yyX Y
AppConstantsyyZ f
.yyf g
NoRecordFoundyyg t
)yyt u
;yyu v
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
)	}} Ä
;
}}Ä Å
}~~ 
} 	
[
ÅÅ 	
HttpGet
ÅÅ	 
(
ÅÅ 
$str
ÅÅ 
)
ÅÅ  
]
ÅÅ  !
public
ÇÇ 
async
ÇÇ 
Task
ÇÇ 
<
ÇÇ 
IActionResult
ÇÇ '
>
ÇÇ' (
GetStateList
ÇÇ) 5
(
ÇÇ5 6
)
ÇÇ6 7
{
ÉÉ 	
try
ÑÑ 
{
ÖÖ 
return
ÜÜ 
_ObjectResponse
ÜÜ &
.
ÜÜ& '

CreateData
ÜÜ' 1
(
ÜÜ1 2
await
ÜÜ2 7
_StateService
ÜÜ8 E
.
ÜÜE F
GetStateList
ÜÜF R
(
ÜÜR S
)
ÜÜS T
,
ÜÜT U
(
ÜÜV W
Int32
ÜÜW \
)
ÜÜ\ ]
HttpStatusCode
ÜÜ] k
.
ÜÜk l
OK
ÜÜl n
)
ÜÜn o
;
ÜÜo p
}
áá 
catch
àà 
(
àà 
	Exception
àà 
ex
àà 
)
àà  
{
ââ 
return
ää 
_ObjectResponse
ää &
.
ää& '
Create
ää' -
(
ää- .
false
ää. 3
,
ää3 4
(
ää5 6
Int32
ää6 ;
)
ää; <
HttpStatusCode
ää< J
.
ääJ K!
InternalServerError
ääK ^
,
ää^ _
Convert
ää` g
.
ääg h
ToString
ääh p
(
ääp q
ex
ääq s
.
ääs t

StackTrace
äät ~
)
ää~ 
)ää Ä
;ääÄ Å
}
ãã 
}
åå 	
[
éé 	
HttpGet
éé	 
(
éé 
$str
éé 6
)
éé6 7
]
éé7 8
public
èè 
async
èè 
Task
èè 
<
èè 
IActionResult
èè '
>
èè' (%
GetStateListByCountryId
èè) @
(
èè@ A
[
èèA B
	FromRoute
èèB K
]
èèK L
int
èèM P
	countryId
èèQ Z
)
èèZ [
{
êê 	
try
ëë 
{
íí 
return
ìì 
_ObjectResponse
ìì &
.
ìì& '

CreateData
ìì' 1
(
ìì1 2
await
ìì2 7
_StateService
ìì8 E
.
ììE F%
GetStateListByCountryId
ììF ]
(
ìì] ^
	countryId
ìì^ g
)
ììg h
,
ììh i
(
ììj k
Int32
ììk p
)
ììp q
HttpStatusCode
ììq 
.ìì Ä
OKììÄ Ç
)ììÇ É
;ììÉ Ñ
}
îî 
catch
ïï 
(
ïï 
	Exception
ïï 
ex
ïï 
)
ïï  
{
ññ 
return
óó 
_ObjectResponse
óó &
.
óó& '
Create
óó' -
(
óó- .
false
óó. 3
,
óó3 4
(
óó5 6
Int32
óó6 ;
)
óó; <
HttpStatusCode
óó< J
.
óóJ K!
InternalServerError
óóK ^
,
óó^ _
Convert
óó` g
.
óóg h
ToString
óóh p
(
óóp q
ex
óóq s
.
óós t

StackTrace
óót ~
)
óó~ 
)óó Ä
;óóÄ Å
}
òò 
}
ôô 	
}
úú 
}ùù ¸û
>D:\EltizamLive\Eltizam.Api\Controllers\MasterUserController.cs
	namespace 	
Eltizam
 
. 
API 
. 
Controllers !
.! "
Masters" )
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class  
MasterUserController %
:& '
ControllerBase( 6
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
private 
readonly 
IStringLocalizer )
<) *
Errors* 0
>0 1!
_stringLocalizerError2 G
;G H
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
dynamic	""y Ä
>
""Ä Å
ObjectResponse
""Ç ê
,
""ê ë
IStringLocalizer
""í ¢
<
""¢ £
Errors
""£ ©
>
""© ™"
stringLocalizerError
""´ ø
,
""ø ¿
IExceptionService
""¡ “
exceptionService
""” „
)
""„ ‰
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
;&&, -!
_stringLocalizerError'' !
=''" # 
stringLocalizerError''$ 8
;''8 9
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
,EE^ _
ConvertEE` g
.EEg h
ToStringEEh p
(EEp q
exEEq s
.EEs t

StackTraceEEt ~
)EE~ 
)	EE Ä
;
EEÄ Å
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
,XX^ _
ConvertXX` g
.XXg h
ToStringXXh p
(XXp q
exXXq s
.XXs t

StackTraceXXt ~
)XX~ 
)	XX Ä
;
XXÄ Å
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
AppConstants	ee ã
.
eeã å
InsertSuccess
eeå ô
)
eeô ö
)
eeö õ
;
eeõ ú
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
hhÄ å
.
hhå ç
NoRecordFound
hhç ö
:
hhõ ú
AppConstants
hhù ©
.
hh© ™

BadRequest
hh™ ¥
)
hh¥ µ
)
hhµ ∂
;
hh∂ ∑
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
,mm^ _
Convertmm` g
.mmg h
ToStringmmh p
(mmp q
exmmq s
.mms t

StackTracemmt ~
)mm~ 
)	mm Ä
;
mmÄ Å
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
,{{^ _
Convert{{` g
.{{g h
ToString{{h p
({{p q
ex{{q s
.{{s t

StackTrace{{t ~
){{~ 
)	{{ Ä
;
{{Ä Å
}|| 
}}} 	
[~~ 	
HttpGet~~	 
(~~ 
$str~~ '
)~~' (
]~~( )
public 
async 
Task 
< 
IActionResult '
>' ( 
GetApproverLevelList) =
(= >
)> ?
{
ÄÄ 	
try
ÅÅ 
{
ÇÇ 
return
ÉÉ 
_ObjectResponse
ÉÉ &
.
ÉÉ& '

CreateData
ÉÉ' 1
(
ÉÉ1 2
await
ÉÉ2 7 
_MasterUserService
ÉÉ8 J
.
ÉÉJ K"
GetApproverLevelList
ÉÉK _
(
ÉÉ_ `
)
ÉÉ` a
,
ÉÉa b
(
ÉÉc d
Int32
ÉÉd i
)
ÉÉi j
HttpStatusCode
ÉÉj x
.
ÉÉx y
OK
ÉÉy {
)
ÉÉ{ |
;
ÉÉ| }
}
ÑÑ 
catch
ÖÖ 
(
ÖÖ 
	Exception
ÖÖ 
ex
ÖÖ 
)
ÖÖ  
{
ÜÜ 
return
áá 
_ObjectResponse
áá &
.
áá& '
Create
áá' -
(
áá- .
false
áá. 3
,
áá3 4
(
áá5 6
Int32
áá6 ;
)
áá; <
HttpStatusCode
áá< J
.
ááJ K!
InternalServerError
ááK ^
,
áá^ _
Convert
áá` g
.
áág h
ToString
ááh p
(
ááp q
ex
ááq s
.
áás t

StackTrace
áát ~
)
áá~ 
)áá Ä
;ááÄ Å
}
àà 
}
ââ 	
[
ää 	
HttpGet
ää	 
(
ää 
$str
ää 
)
ää 
]
ää  
public
ãã 
async
ãã 
Task
ãã 
<
ãã 
IActionResult
ãã '
>
ãã' (
GetRoleList
ãã) 4
(
ãã4 5
)
ãã5 6
{
åå 	
try
çç 
{
éé 
return
èè 
_ObjectResponse
èè &
.
èè& '

CreateData
èè' 1
(
èè1 2
await
èè2 7 
_MasterUserService
èè8 J
.
èèJ K
GetRoleList
èèK V
(
èèV W
)
èèW X
,
èèX Y
(
èèZ [
Int32
èè[ `
)
èè` a
HttpStatusCode
èèa o
.
èèo p
OK
èèp r
)
èèr s
;
èès t
}
êê 
catch
ëë 
(
ëë 
	Exception
ëë 
ex
ëë 
)
ëë  
{
íí 
return
ìì 
_ObjectResponse
ìì &
.
ìì& '
Create
ìì' -
(
ìì- .
false
ìì. 3
,
ìì3 4
(
ìì5 6
Int32
ìì6 ;
)
ìì; <
HttpStatusCode
ìì< J
.
ììJ K!
InternalServerError
ììK ^
,
ìì^ _
Convert
ìì` g
.
ììg h
ToString
ììh p
(
ììp q
ex
ììq s
.
ììs t

StackTrace
ììt ~
)
ìì~ 
)ìì Ä
;ììÄ Å
}
îî 
}
ïï 	
[
òò 	

HttpDelete
òò	 
(
òò 
$str
òò !
)
òò! "
]
òò" #
public
ôô 
async
ôô 
Task
ôô 
<
ôô 
IActionResult
ôô '
>
ôô' (
Delete
ôô) /
(
ôô/ 0
[
ôô0 1
	FromRoute
ôô1 :
]
ôô: ;
int
ôô< ?
id
ôô@ B
)
ôôB C
{
öö 	
try
õõ 
{
úú 
DBOperation
ùù 
	oResponse
ùù %
=
ùù& '
await
ùù( - 
_MasterUserService
ùù. @
.
ùù@ A
Delete
ùùA G
(
ùùG H
id
ùùH J
)
ùùJ K
;
ùùK L
if
ûû 
(
ûû 
	oResponse
ûû 
==
ûû  
DBOperation
ûû! ,
.
ûû, -
Success
ûû- 4
)
ûû4 5
return
üü 
_ObjectResponse
üü *
.
üü* +
Create
üü+ 1
(
üü1 2
true
üü2 6
,
üü6 7
(
üü8 9
Int32
üü9 >
)
üü> ?
HttpStatusCode
üü? M
.
üüM N
OK
üüN P
,
üüP Q
AppConstants
üüR ^
.
üü^ _
DeleteSuccess
üü_ l
)
üül m
;
üüm n
else
†† 
return
°° 
_ObjectResponse
°° *
.
°°* +
Create
°°+ 1
(
°°1 2
null
°°2 6
,
°°6 7
(
°°8 9
Int32
°°9 >
)
°°> ?
HttpStatusCode
°°? M
.
°°M N

BadRequest
°°N X
,
°°X Y
AppConstants
°°Z f
.
°°f g
NoRecordFound
°°g t
)
°°t u
;
°°u v
}
¢¢ 
catch
££ 
(
££ 
	Exception
££ 
ex
££ 
)
££  
{
§§ 
return
•• 
_ObjectResponse
•• &
.
••& '
Create
••' -
(
••- .
false
••. 3
,
••3 4
(
••5 6
Int32
••6 ;
)
••; <
HttpStatusCode
••< J
.
••J K!
InternalServerError
••K ^
,
••^ _
Convert
••` g
.
••g h
ToString
••h p
(
••p q
ex
••q s
.
••s t

StackTrace
••t ~
)
••~ 
)•• Ä
;••Ä Å
}
¶¶ 
}
ßß 	
[
™™ 	
HttpGet
™™	 
(
™™ 
$str
™™ '
)
™™' (
]
™™( )
public
´´ 
async
´´ 
Task
´´ 
<
´´ 
IActionResult
´´ '
>
´´' (
GetApproverList
´´) 8
(
´´8 9
[
´´9 :
	FromQuery
´´: C
]
´´C D
int
´´E H
id
´´I K
)
´´K L
{
¨¨ 	
try
≠≠ 
{
ÆÆ 
return
ØØ 
_ObjectResponse
ØØ &
.
ØØ& '

CreateData
ØØ' 1
(
ØØ1 2
await
ØØ2 7 
_MasterUserService
ØØ8 J
.
ØØJ K
GetApproverList
ØØK Z
(
ØØZ [
id
ØØ[ ]
,
ØØ] ^
$str
ØØ_ a
)
ØØa b
,
ØØb c
(
ØØd e
Int32
ØØe j
)
ØØj k
HttpStatusCode
ØØk y
.
ØØy z
OK
ØØz |
)
ØØ| }
;
ØØ} ~
}
∞∞ 
catch
±± 
(
±± 
	Exception
±± 
ex
±± 
)
±±  
{
≤≤ 
return
≥≥ 
_ObjectResponse
≥≥ &
.
≥≥& '
Create
≥≥' -
(
≥≥- .
false
≥≥. 3
,
≥≥3 4
(
≥≥5 6
Int32
≥≥6 ;
)
≥≥; <
HttpStatusCode
≥≥< J
.
≥≥J K!
InternalServerError
≥≥K ^
,
≥≥^ _
Convert
≥≥` g
.
≥≥g h
ToString
≥≥h p
(
≥≥p q
ex
≥≥q s
.
≥≥s t

StackTrace
≥≥t ~
)
≥≥~ 
)≥≥ Ä
;≥≥Ä Å
}
¥¥ 
}
µµ 	
[
∑∑ 	
HttpGet
∑∑	 
(
∑∑ 
$str
∑∑ 8
)
∑∑8 9
]
∑∑9 :
public
∏∏ 
async
∏∏ 
Task
∏∏ 
<
∏∏ 
IActionResult
∏∏ '
>
∏∏' ("
GetGlobalAuditFields
∏∏) =
(
∏∏= >
int
∏∏> A
id
∏∏B D
,
∏∏D E
string
∏∏F L
	tablename
∏∏M V
)
∏∏V W
{
ππ 	
try
∫∫ 
{
ªª 
var
ºº 
_user
ºº 
=
ºº 
await
ºº ! 
_MasterUserService
ºº" 4
.
ºº4 5"
GetGlobalAuditFields
ºº5 I
(
ººI J
id
ººJ L
,
ººL M
	tablename
ººN W
)
ººW X
;
ººX Y
return
ΩΩ 
_ObjectResponse
ΩΩ &
.
ΩΩ& '

CreateData
ΩΩ' 1
(
ΩΩ1 2
_user
ΩΩ2 7
,
ΩΩ7 8
(
ΩΩ9 :
Int32
ΩΩ: ?
)
ΩΩ? @
HttpStatusCode
ΩΩ@ N
.
ΩΩN O
OK
ΩΩO Q
)
ΩΩQ R
;
ΩΩR S
}
ææ 
catch
øø 
(
øø 
	Exception
øø 
ex
øø 
)
øø  
{
¿¿ 
return
¡¡ 
_ObjectResponse
¡¡ &
.
¡¡& '
Create
¡¡' -
(
¡¡- .
false
¡¡. 3
,
¡¡3 4
(
¡¡5 6
Int32
¡¡6 ;
)
¡¡; <
HttpStatusCode
¡¡< J
.
¡¡J K!
InternalServerError
¡¡K ^
,
¡¡^ _
Convert
¡¡` g
.
¡¡g h
ToString
¡¡h p
(
¡¡p q
ex
¡¡q s
.
¡¡s t

StackTrace
¡¡t ~
)
¡¡~ 
)¡¡ Ä
;¡¡Ä Å
}
¬¬ 
}
√√ 	
[
«« 	
HttpGet
««	 
(
«« 
$str
«« !
)
««! "
]
««" #
public
»» 
async
»» 
Task
»» 
<
»» 
IActionResult
»» '
>
»»' (
GetAllUserList
»») 7
(
»»7 8
)
»»8 9
{
…… 	
try
   
{
ÀÀ 
return
ÃÃ 
_ObjectResponse
ÃÃ &
.
ÃÃ& '

CreateData
ÃÃ' 1
(
ÃÃ1 2
await
ÃÃ2 7 
_MasterUserService
ÃÃ8 J
.
ÃÃJ K
GetAllUserList
ÃÃK Y
(
ÃÃY Z
)
ÃÃZ [
,
ÃÃ[ \
(
ÃÃ] ^
Int32
ÃÃ^ c
)
ÃÃc d
HttpStatusCode
ÃÃd r
.
ÃÃr s
OK
ÃÃs u
)
ÃÃu v
;
ÃÃv w
}
ÕÕ 
catch
ŒŒ 
(
ŒŒ 
	Exception
ŒŒ 
ex
ŒŒ 
)
ŒŒ  
{
œœ 
return
–– 
_ObjectResponse
–– &
.
––& '
Create
––' -
(
––- .
false
––. 3
,
––3 4
(
––5 6
Int32
––6 ;
)
––; <
HttpStatusCode
––< J
.
––J K!
InternalServerError
––K ^
,
––^ _
Convert
––` g
.
––g h
ToString
––h p
(
––p q
ex
––q s
.
––s t

StackTrace
––t ~
)
––~ 
)–– Ä
;––Ä Å
}
—— 
}
““ 	
}
’’ 
}÷÷ ÊD
GD:\EltizamLive\Eltizam.Api\Controllers\MasterValuationFeesController.cs
	namespace 	
EltizamValuation
 
. 
Api 
. 
Controllers *
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class )
MasterValuationFeesController .
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
private 
readonly 
IStringLocalizer )
<) *
Errors* 0
>0 1!
_stringLocalizerError2 G
;G H
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
IMasterValuationFeesService 4!
_ValuationFeesService5 J
;J K
public )
MasterValuationFeesController ,
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
IStringLocalizer	u Ö
<
Ö Ü
Errors
Ü å
>
å ç"
stringLocalizerError
é ¢
,
¢ £
IExceptionService
§ µ
exceptionService
∂ ∆
,
∆ «)
IMasterValuationFeesService
» „"
ValuationFeesService
‰ ¯
)
¯ ˘
{   	
_configuration!! 
=!! 
configuration!! *
;!!* +
_ObjectResponse"" 
="" 
ObjectResponse"" ,
;"", -!
_stringLocalizerError## !
=##" # 
stringLocalizerError##$ 8
;##8 9
_ExceptionService$$ 
=$$ 
exceptionService$$  0
;$$0 1!
_ValuationFeesService%% !
=%%" # 
ValuationFeesService%%$ 8
;%%8 9
}&& 	
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
_ValuationFeesService??8 M
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
)	CC Ä
;
CCÄ Å
}DD 
}EE 	
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
var__  
oValuationFeesEntity__ (
=__) *
await__+ 0!
_ValuationFeesService__1 F
.__F G
GetById__G N
(__N O
id__O Q
)__Q R
;__R S
if`` 
(``  
oValuationFeesEntity`` (
!=``) +
null``, 0
&&``1 3 
oValuationFeesEntity``4 H
.``H I
Id``I K
>``L M
$num``N O
)``O P
returnaa 
_ObjectResponseaa *
.aa* +
Createaa+ 1
(aa1 2 
oValuationFeesEntityaa2 F
,aaF G
(aaH I
Int32aaI N
)aaN O
HttpStatusCodeaaO ]
.aa] ^
OKaa^ `
)aa` a
;aaa b
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
)	gg Ä
;
ggÄ Å
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
(nn/ 0$
MasterValuationFeesModelnn0 H
oValuationFeesnnI W
)nnW X
{oo 	
trypp 
{qq 
DBOperationrr 
	oResponserr %
=rr& '
awaitrr( -!
_ValuationFeesServicerr. C
.rrC D
UpsertrrD J
(rrJ K
oValuationFeesrrK Y
)rrY Z
;rrZ [
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
(uuR S
oValuationFeesuuS a
.uua b
Iduub d
>uue f
$numuug h
?uui j
AppConstantsuuk w
.uuw x
UpdateSuccess	uux Ö
:
uuÜ á
AppConstants
uuà î
.
uuî ï
InsertSuccess
uuï ¢
)
uu¢ £
)
uu£ §
;
uu§ •
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
xxÄ å
.
xxå ç
NoRecordFound
xxç ö
:
xxõ ú
AppConstants
xxù ©
.
xx© ™

BadRequest
xx™ ¥
)
xx¥ µ
)
xxµ ∂
;
xx∂ ∑
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
)	|| Ä
;
||Ä Å
}}} 
}~~ 	
}
ìì 
}îî ∂f
JD:\EltizamLive\Eltizam.Api\Controllers\MasterValuationFeeTypeController.cs
	namespace 	
EltizamValuation
 
. 
Api 
. 
Controllers *
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class ,
 MasterValuationFeeTypeController 1
:2 3
ControllerBase4 B
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
private 
readonly 
IStringLocalizer )
<) *
Errors* 0
>0 1!
_stringLocalizerError2 G
;G H
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
readonly *
IMasterValuationFeeTypeService 7$
_ValuationFeeTypeService8 P
;P Q
public ,
 MasterValuationFeeTypeController /
(/ 0
IConfiguration0 >
configuration? L
,L M
IResponseHandlerN ^
<^ _
dynamic_ f
>f g
ObjectResponseh v
,v w
IStringLocalizer	x à
<
à â
Errors
â è
>
è ê"
stringLocalizerError
ë •
,
• ¶
IExceptionService
ß ∏
exceptionService
π …
,
…  ,
IMasterValuationFeeTypeService
À È%
ValuationFeeTypeService
Í Å
)
Å Ç
{   	
_configuration!! 
=!! 
configuration!! *
;!!* +
_ObjectResponse"" 
="" 
ObjectResponse"" ,
;"", -!
_stringLocalizerError## !
=##" # 
stringLocalizerError##$ 8
;##8 9
_ExceptionService$$ 
=$$ 
exceptionService$$  0
;$$0 1$
_ValuationFeeTypeService%% $
=%%% &#
ValuationFeeTypeService%%' >
;%%> ?
}&& 	
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
await??2 7$
_ValuationFeeTypeService??8 P
.??P Q
GetAll??Q W
(??W X
model??X ]
)??] ^
,??^ _
(??` a
Int32??a f
)??f g
HttpStatusCode??g u
.??u v
OK??v x
)??x y
;??y z
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
)	CC Ä
;
CCÄ Å
}DD 
}EE 	
[GG 	
HttpGetGG	 
,GG 
RouteGG 
(GG 
$strGG 0
)GG0 1
]GG1 2
publicHH 
asyncHH 
TaskHH 
<HH 
IActionResultHH '
>HH' ("
GetAllValuationFeeTypeHH) ?
(HH? @
)HH@ A
{II 	
tryJJ 
{KK 
varLL 
	oRoleListLL 
=LL 
awaitLL  %$
_ValuationFeeTypeServiceLL& >
.LL> ?"
GetAllValuationFeeTypeLL? U
(LLU V
)LLV W
;LLW X
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
)	TT Ä
;
TTÄ Å
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
var^^ #
oValuationFeeTypeEntity^^ +
=^^, -
await^^. 3$
_ValuationFeeTypeService^^4 L
.^^L M
GetById^^M T
(^^T U
id^^U W
)^^W X
;^^X Y
if__ 
(__ #
oValuationFeeTypeEntity__ +
!=__, .
null__/ 3
&&__4 6#
oValuationFeeTypeEntity__7 N
.__N O
Id__O Q
>__R S
$num__T U
)__U V
return`` 
_ObjectResponse`` *
.``* +
Create``+ 1
(``1 2#
oValuationFeeTypeEntity``2 I
,``I J
(``K L
Int32``L Q
)``Q R
HttpStatusCode``R `
.``` a
OK``a c
)``c d
;``d e
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
)	ff Ä
;
ffÄ Å
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
(mm/ 0'
MasterValuationFeeTypeModelmm0 K
oValuationFeeTypemmL ]
)mm] ^
{nn 	
tryoo 
{pp 
DBOperationqq 
	oResponseqq %
=qq& '
awaitqq( -$
_ValuationFeeTypeServiceqq. F
.qqF G
UpsertqqG M
(qqM N
oValuationFeeTypeqqN _
)qq_ `
;qq` a
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
(ttR S
oValuationFeeTypettS d
.ttd e
Idtte g
>tth i
$numttj k
?ttl m
AppConstantsttn z
.ttz {
UpdateSuccess	tt{ à
:
ttâ ä
AppConstants
ttã ó
.
ttó ò
InsertSuccess
ttò •
)
tt• ¶
)
tt¶ ß
;
ttß ®
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
wwÄ å
.
wwå ç
NoRecordFound
wwç ö
:
wwõ ú
AppConstants
wwù ©
.
ww© ™

BadRequest
ww™ ¥
)
ww¥ µ
)
wwµ ∂
;
ww∂ ∑
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
)	{{ Ä
;
{{Ä Å
}|| 
}}} 	
[
ÄÄ 	

HttpDelete
ÄÄ	 
(
ÄÄ 
$str
ÄÄ !
)
ÄÄ! "
]
ÄÄ" #
public
ÅÅ 
async
ÅÅ 
Task
ÅÅ 
<
ÅÅ 
IActionResult
ÅÅ '
>
ÅÅ' (
Delete
ÅÅ) /
(
ÅÅ/ 0
[
ÅÅ0 1
	FromRoute
ÅÅ1 :
]
ÅÅ: ;
int
ÅÅ< ?
id
ÅÅ@ B
)
ÅÅB C
{
ÇÇ 	
try
ÉÉ 
{
ÑÑ 
DBOperation
ÖÖ 
	oResponse
ÖÖ %
=
ÖÖ& '
await
ÖÖ( -&
_ValuationFeeTypeService
ÖÖ. F
.
ÖÖF G
Delete
ÖÖG M
(
ÖÖM N
id
ÖÖN P
)
ÖÖP Q
;
ÖÖQ R
if
ÜÜ 
(
ÜÜ 
	oResponse
ÜÜ 
==
ÜÜ  
DBOperation
ÜÜ! ,
.
ÜÜ, -
Success
ÜÜ- 4
)
ÜÜ4 5
return
áá 
_ObjectResponse
áá *
.
áá* +
Create
áá+ 1
(
áá1 2
true
áá2 6
,
áá6 7
(
áá8 9
Int32
áá9 >
)
áá> ?
HttpStatusCode
áá? M
.
ááM N
OK
ááN P
,
ááP Q
AppConstants
ááR ^
.
áá^ _
DeleteSuccess
áá_ l
)
áál m
;
áám n
else
àà 
return
ââ 
_ObjectResponse
ââ *
.
ââ* +
Create
ââ+ 1
(
ââ1 2
null
ââ2 6
,
ââ6 7
(
ââ8 9
Int32
ââ9 >
)
ââ> ?
HttpStatusCode
ââ? M
.
ââM N

BadRequest
ââN X
,
ââX Y
AppConstants
ââZ f
.
ââf g
NoRecordFound
ââg t
)
âât u
;
ââu v
}
ää 
catch
ãã 
(
ãã 
	Exception
ãã 
ex
ãã 
)
ãã  
{
åå 
return
çç 
_ObjectResponse
çç &
.
çç& '
Create
çç' -
(
çç- .
false
çç. 3
,
çç3 4
(
çç5 6
Int32
çç6 ;
)
çç; <
HttpStatusCode
çç< J
.
ççJ K!
InternalServerError
ççK ^
,
çç^ _
Convert
çç` g
.
ççg h
ToString
ççh p
(
ççp q
ex
ççq s
.
ççs t

StackTrace
ççt ~
)
çç~ 
)çç Ä
;ççÄ Å
}
éé 
}
èè 	
}
íí 
}ìì ﬁO
@D:\EltizamLive\Eltizam.Api\Controllers\MasterVendorController.cs
	namespace

 	
EltizamValuation


 
.

 
Api

 
.

 
Controllers

 *
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class "
MasterVendorController '
:( )
ControllerBase* 8
{ 
private 
readonly  
IMasterVendorService -
_vendorServices. =
;= >
private 
readonly 
IResponseHandler )
<) *
dynamic* 1
>1 2
_ObjectResponse3 B
;B C
private 
readonly 
IExceptionService *
_ExceptionService+ <
;< =
IExceptionService 
exceptionService *
;* +
public "
MasterVendorController %
(% & 
IMasterVendorService& :
vendorServices; I
,I J
IResponseHandlerK [
<[ \
dynamic\ c
>c d
ObjectResponsee s
)s t
{ 	
_vendorServices 
= 
vendorServices ,
;, -
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
MasterVendorModel$$0 A
vendor$$B H
)$$H I
{%% 	
try&& 
{'' 
DBOperation(( 
	oResponse(( %
=((& '
await((( -
_vendorServices((. =
.((= >!
AddUpdateMasterVendor((> S
(((S T
vendor((T Z
)((Z [
;(([ \
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
(++R S
vendor++S Y
.++Y Z
Id++Z \
>++] ^
$num++_ `
?++a b
AppConstants++c o
.++o p
UpdateSuccess++p }
:++~ 
AppConstants
++Ä å
.
++å ç
InsertSuccess
++ç ö
)
++ö õ
)
++õ ú
;
++ú ù
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
..Ä å
.
..å ç
NoRecordFound
..ç ö
:
..õ ú
AppConstants
..ù ©
.
..© ™

BadRequest
..™ ¥
)
..¥ µ
)
..µ ∂
;
..∂ ∑
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
)	22 Ä
;
22Ä Å
}33 
}44 	
[66 	
HttpGet66	 
]66 
[77 	
Route77	 
(77 
$str77 
)77 
]77 
public88 
async88 
Task88 
<88 
IActionResult88 '
>88' (
GetMasterVendorById88) <
(88< =
[88= >
	FromRoute88> G
]88G H
int88I L
id88M O
)88O P
{99 	
try:: 
{;; 
var<< 
masterVendor<<  
=<<! "
await<<# (
_vendorServices<<) 8
.<<8 9$
GetMasterVendorByIdAsync<<9 Q
(<<Q R
id<<R T
)<<T U
;<<U V
if>> 
(>> 
masterVendor>>  
!=>>! #
null>>$ (
&&>>) +
masterVendor>>, 8
.>>8 9
Id>>9 ;
>>>< =
$num>>> ?
)>>? @
{?? 
returnAA 
_ObjectResponseAA *
.AA* +
CreateAA+ 1
(AA1 2
masterVendorAA2 >
,AA> ?
(AA@ A
intAAA D
)AAD E
HttpStatusCodeAAE S
.AAS T
OKAAT V
)AAV W
;AAW X
}BB 
elseCC 
{DD 
returnEE 
_ObjectResponseEE *
.EE* +
CreateEE+ 1
(EE1 2
nullEE2 6
,EE6 7
(EE8 9
intEE9 <
)EE< =
HttpStatusCodeEE= K
.EEK L

BadRequestEEL V
,EEV W
AppConstantsEEX d
.EEd e
NoRecordFoundEEe r
)EEr s
;EEs t
}FF 
}GG 
catchHH 
(HH 
	ExceptionHH 
exHH 
)HH  
{II 
returnJJ 
_ObjectResponseJJ &
.JJ& '
CreateJJ' -
(JJ- .
nullJJ. 2
,JJ2 3
(JJ4 5
intJJ5 8
)JJ8 9
HttpStatusCodeJJ9 G
.JJG H
InternalServerErrorJJH [
,JJ[ \
ConvertJJ] d
.JJd e
ToStringJJe m
(JJm n
exJJn p
.JJp q

StackTraceJJq {
)JJ{ |
)JJ| }
;JJ} ~
}KK 
}LL 	
[OO 	
HttpPostOO	 
,OO 
RouteOO 
(OO 
$strOO !
)OO! "
]OO" #
publicPP 
asyncPP 
TaskPP 
<PP 
IActionResultPP '
>PP' (
GetAllPP) /
(PP/ 0
[PP0 1
FromFormPP1 9
]PP9 :"
DataTableAjaxPostModelPP; Q
modelPPR W
)PPW X
{QQ 	
tryRR 
{SS 
returnTT 
_ObjectResponseTT &
.TT& '

CreateDataTT' 1
(TT1 2
awaitTT2 7
_vendorServicesTT8 G
.TTG H
GetAllTTH N
(TTN O
modelTTO T
)TTT U
,TTU V
(TTW X
Int32TTX ]
)TT] ^
HttpStatusCodeTT^ l
.TTl m
OKTTm o
)TTo p
;TTp q
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
)	XX Ä
;
XXÄ Å
}YY 
}ZZ 	
[\\ 	
HttpPost\\	 
(\\ 
$str\\ 
)\\  
]\\  !
public]] 
async]] 
Task]] 
<]] 
IActionResult]] '
>]]' (
Delete]]) /
(]]/ 0
[]]0 1
	FromRoute]]1 :
]]]: ;
int]]< ?
id]]@ B
,]]B C
int]]D G
?]]G H
by]]I K
)]]K L
{^^ 	
try__ 
{`` 
DBOperationaa 
	oResponseaa %
=aa& '
awaitaa( -
_vendorServicesaa. =
.aa= >
DeleteVendoraa> J
(aaJ K
idaaK M
,aaM N
byaaN P
)aaP Q
;aaQ R
ifbb 
(bb 
	oResponsebb 
==bb  
DBOperationbb! ,
.bb, -
Successbb- 4
)bb4 5
returncc 
_ObjectResponsecc *
.cc* +
Createcc+ 1
(cc1 2
truecc2 6
,cc6 7
(cc8 9
Int32cc9 >
)cc> ?
HttpStatusCodecc? M
.ccM N
OKccN P
,ccP Q
AppConstantsccR ^
.cc^ _
DeleteSuccesscc_ l
)ccl m
;ccm n
elsedd 
returnee 
_ObjectResponseee *
.ee* +
Createee+ 1
(ee1 2
nullee2 6
,ee6 7
(ee8 9
Int32ee9 >
)ee> ?
HttpStatusCodeee? M
.eeM N

BadRequesteeN X
,eeX Y
AppConstantseeZ f
.eef g
NoRecordFoundeeg t
)eet u
;eeu v
}ff 
catchgg 
(gg 
	Exceptiongg 
exgg 
)gg  
{hh 
awaitii 
_ExceptionServiceii '
.ii' (
LogExceptionii( 4
(ii4 5
exii5 7
)ii7 8
;ii8 9
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
)	jj Ä
;
jjÄ Å
}kk 
}ll 	
}nn 
}oo ˜D
DD:\EltizamLive\Eltizam.Api\Controllers\ValuationInvoiceController.cs
	namespace 	
EltizamValuation
 
. 
Api 
. 
Controllers *
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class &
ValuationInvoiceController +
:, -
ControllerBase. <
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
IStringLocalizer )
<) *
Errors* 0
>0 1!
_stringLocalizerError2 G
;G H
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
IValuationInvoiceService 1$
_ValuationInvoiceService2 J
;J K
public &
ValuationInvoiceController )
() *
IConfiguration* 8
configuration9 F
,F G
IResponseHandlerH X
<X Y
dynamicY `
>` a
ObjectResponseb p
,p q
IStringLocalizer	r Ç
<
Ç É
Errors
É â
>
â ä"
stringLocalizerError
ã ü
,
ü †
IExceptionService
° ≤
exceptionService
≥ √
,
√ ƒ&
IValuationInvoiceService
≈ ›%
ValuationInvoiceService
ﬁ ı
)
ı ˆ
{ 	
_configuration   
=   
configuration   *
;  * +
_ObjectResponse!! 
=!! 
ObjectResponse!! ,
;!!, -!
_stringLocalizerError"" !
=""" # 
stringLocalizerError""$ 8
;""8 9
_ExceptionService## 
=## 
exceptionService##  0
;##0 1$
_ValuationInvoiceService$$ $
=$$% &#
ValuationInvoiceService$$' >
;$$> ?
}%% 	
[// 	
HttpGet//	 
,// 
Route// 
(// 
$str// (
)//( )
]//) *
public00 
async00 
Task00 
<00 
IActionResult00 '
>00' (
GetInvoiceList00) 7
(007 8
int008 ;
	RequestId00< E
)00E F
{11 	
try22 
{33 
return44 
_ObjectResponse44 &
.44& '

CreateData44' 1
(441 2
await442 7$
_ValuationInvoiceService448 P
.44P Q
GetInvoiceList44Q _
(44_ `
	RequestId44` i
)44i j
,44j k
(44l m
Int3244m r
)44r s
HttpStatusCode	44s Å
.
44Å Ç
OK
44Ç Ñ
)
44Ñ Ö
;
44Ö Ü
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
)	88 Ä
;
88Ä Å
}99 
}:: 	
[<< 	
HttpPost<<	 
]<< 
[== 	
Route==	 
(== 
$str== 
)== 
]== 
public>> 
async>> 
Task>> 
<>> 
IActionResult>> '
>>>' (
Upsert>>) /
(>>/ 0%
ValuationInvoiceListModel>>0 I
model>>J O
)>>O P
{?? 	
try@@ 
{AA 
DBOperationBB 
	oResponseBB %
=BB& '
awaitBB( -$
_ValuationInvoiceServiceBB. F
.BBF G
UpsertBBG M
(BBM N
modelBBN S
)BBS T
;BBT U
ifCC 
(CC 
	oResponseCC 
==CC  
DBOperationCC! ,
.CC, -
SuccessCC- 4
)CC4 5
{DD 
returnEE 
_ObjectResponseEE *
.EE* +
CreateEE+ 1
(EE1 2
trueEE2 6
,EE6 7
(EE8 9
Int32EE9 >
)EE> ?
HttpStatusCodeEE? M
.EEM N
OKEEN P
,EEP Q
(EER S
modelEES X
.EEX Y
IdEEY [
>EE\ ]
$numEE^ _
?EE` a
AppConstantsEEb n
.EEn o
UpdateSuccessEEo |
:EE} ~
AppConstants	EE ã
.
EEã å
InsertSuccess
EEå ô
)
EEô ö
)
EEö õ
;
EEõ ú
}FF 
elseGG 
returnHH 
_ObjectResponseHH *
.HH* +
CreateHH+ 1
(HH1 2
falseHH2 7
,HH7 8
(HH9 :
Int32HH: ?
)HH? @
HttpStatusCodeHH@ N
.HHN O

BadRequestHHO Y
,HHY Z
(HH[ \
	oResponseHH\ e
==HHf h
DBOperationHHi t
.HHt u
NotFoundHHu }
?HH~ 
AppConstants
HHÄ å
.
HHå ç
NoRecordFound
HHç ö
:
HHõ ú
AppConstants
HHù ©
.
HH© ™

BadRequest
HH™ ¥
)
HH¥ µ
)
HHµ ∂
;
HH∂ ∑
}II 
catchJJ 
(JJ 
	ExceptionJJ 
exJJ 
)JJ  
{KK 
returnLL 
_ObjectResponseLL &
.LL& '
CreateLL' -
(LL- .
falseLL. 3
,LL3 4
(LL5 6
Int32LL6 ;
)LL; <
HttpStatusCodeLL< J
.LLJ K
InternalServerErrorLLK ^
,LL^ _
ConvertLL` g
.LLg h
ToStringLLh p
(LLp q
exLLq s
.LLs t

StackTraceLLt ~
)LL~ 
)	LL Ä
;
LLÄ Å
}MM 
}NN 	
[OO 	
HttpGetOO	 
,OO 
RouteOO 
(OO 
$strOO -
)OO- .
]OO. /
publicPP 
asyncPP 
TaskPP 
<PP 
IActionResultPP '
>PP' (
GetInvoiceByIdPP) 7
(PP7 8
[PP8 9
	FromRoutePP9 B
]PPB C
intPPD G
idPPH J
)PPJ K
{QQ 	
tryRR 
{SS 
varTT 
quatationEntityTT #
=TT$ %
awaitTT& +$
_ValuationInvoiceServiceTT, D
.TTD E
GetInvoiceByIdTTE S
(TTS T
idTTT V
)TTV W
;TTW X
ifUU 
(UU 
quatationEntityUU #
!=UU$ &
nullUU' +
&&UU, .
quatationEntityUU/ >
.UU> ?
IdUU? A
>UUB C
$numUUD E
)UUE F
returnVV 
_ObjectResponseVV *
.VV* +
CreateVV+ 1
(VV1 2
quatationEntityVV2 A
,VVA B
(VVC D
Int32VVD I
)VVI J
HttpStatusCodeVVJ X
.VVX Y
OKVVY [
)VV[ \
;VV\ ]
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
{[[ 
await\\ 
_ExceptionService\\ '
.\\' (
LogException\\( 4
(\\4 5
ex\\5 7
)\\7 8
;\\8 9
return]] 
_ObjectResponse]] &
.]]& '
Create]]' -
(]]- .
false]]. 3
,]]3 4
(]]5 6
Int32]]6 ;
)]]; <
HttpStatusCode]]< J
.]]J K
InternalServerError]]K ^
,]]^ _
Convert]]` g
.]]g h
ToString]]h p
(]]p q
ex]]q s
.]]s t

StackTrace]]t ~
)]]~ 
)	]] Ä
;
]]Ä Å
}^^ 
}__ 	
}ss 
}tt †E
FD:\EltizamLive\Eltizam.Api\Controllers\ValuationQuatationController.cs
	namespace 	
EltizamValuation
 
. 
Api 
. 
Controllers *
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class (
ValuationQuatationController -
:. /
ControllerBase0 >
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
private 
readonly 
IStringLocalizer )
<) *
Errors* 0
>0 1!
_stringLocalizerError2 G
;G H
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
readonly &
IValuationQuatationService 3'
_ValuationQuatatiionService4 O
;O P
public   (
ValuationQuatationController   +
(  + ,
IConfiguration  , :
configuration  ; H
,  H I
IResponseHandler  J Z
<  Z [
dynamic  [ b
>  b c
ObjectResponse  d r
,  r s
IStringLocalizer	  t Ñ
<
  Ñ Ö
Errors
  Ö ã
>
  ã å"
stringLocalizerError
  ç °
,
  ° ¢
IExceptionService
  £ ¥
exceptionService
  µ ≈
,
  ≈ ∆(
IValuationQuatationService
  « ·(
ValuationQuatatiionService
  ‚ ¸
)
  ¸ ˝
{!! 	
_configuration"" 
="" 
configuration"" *
;""* +
_ObjectResponse## 
=## 
ObjectResponse## ,
;##, -!
_stringLocalizerError$$ !
=$$" # 
stringLocalizerError$$$ 8
;$$8 9
_ExceptionService%% 
=%% 
exceptionService%%  0
;%%0 1'
_ValuationQuatatiionService&& '
=&&( )&
ValuationQuatatiionService&&* D
;&&D E
}'' 	
[00 	
HttpGet00	 
,00 
Route00 
(00 
$str00 *
)00* +
]00+ ,
public11 
async11 
Task11 
<11 
IActionResult11 '
>11' (
GetQuatationList11) 9
(119 :
int11: =
	RequestId11> G
)11G H
{22 	
try33 
{44 
return55 
_ObjectResponse55 &
.55& '

CreateData55' 1
(551 2
await552 7'
_ValuationQuatatiionService558 S
.55S T
GetQuatationList55T d
(55d e
	RequestId55e n
)55n o
,55o p
(55q r
Int3255r w
)55w x
HttpStatusCode	55x Ü
.
55Ü á
OK
55á â
)
55â ä
;
55ä ã
}66 
catch77 
(77 
	Exception77 
ex77 
)77  
{88 
return99 
_ObjectResponse99 &
.99& '
Create99' -
(99- .
false99. 3
,993 4
(995 6
Int32996 ;
)99; <
HttpStatusCode99< J
.99J K
InternalServerError99K ^
,99^ _
Convert99` g
.99g h
ToString99h p
(99p q
ex99q s
.99s t

StackTrace99t ~
)99~ 
)	99 Ä
;
99Ä Å
}:: 
};; 	
[<< 	
HttpPost<<	 
]<< 
[== 	
Route==	 
(== 
$str== 
)== 
]== 
public>> 
async>> 
Task>> 
<>> 
IActionResult>> '
>>>' (
Upsert>>) /
(>>/ 0'
ValuationQuatationListModel>>0 K
model>>L Q
)>>Q R
{?? 	
try@@ 
{AA 
DBOperationBB 
	oResponseBB %
=BB& '
awaitBB( -'
_ValuationQuatatiionServiceBB. I
.BBI J
UpsertBBJ P
(BBP Q
modelBBQ V
)BBV W
;BBW X
ifCC 
(CC 
	oResponseCC 
==CC  
DBOperationCC! ,
.CC, -
SuccessCC- 4
)CC4 5
{DD 
returnEE 
_ObjectResponseEE *
.EE* +
CreateEE+ 1
(EE1 2
trueEE2 6
,EE6 7
(EE8 9
Int32EE9 >
)EE> ?
HttpStatusCodeEE? M
.EEM N
OKEEN P
,EEP Q
(EER S
modelEES X
.EEX Y
IdEEY [
>EE\ ]
$numEE^ _
?EE` a
AppConstantsEEb n
.EEn o
UpdateSuccessEEo |
:EE} ~
AppConstants	EE ã
.
EEã å
InsertSuccess
EEå ô
)
EEô ö
)
EEö õ
;
EEõ ú
}FF 
elseGG 
returnHH 
_ObjectResponseHH *
.HH* +
CreateHH+ 1
(HH1 2
falseHH2 7
,HH7 8
(HH9 :
Int32HH: ?
)HH? @
HttpStatusCodeHH@ N
.HHN O

BadRequestHHO Y
,HHY Z
(HH[ \
	oResponseHH\ e
==HHf h
DBOperationHHi t
.HHt u
NotFoundHHu }
?HH~ 
AppConstants
HHÄ å
.
HHå ç
NoRecordFound
HHç ö
:
HHõ ú
AppConstants
HHù ©
.
HH© ™

BadRequest
HH™ ¥
)
HH¥ µ
)
HHµ ∂
;
HH∂ ∑
}II 
catchJJ 
(JJ 
	ExceptionJJ 
exJJ 
)JJ  
{KK 
returnLL 
_ObjectResponseLL &
.LL& '
CreateLL' -
(LL- .
falseLL. 3
,LL3 4
(LL5 6
Int32LL6 ;
)LL; <
HttpStatusCodeLL< J
.LLJ K
InternalServerErrorLLK ^
,LL^ _
ConvertLL` g
.LLg h
ToStringLLh p
(LLp q
exLLq s
.LLs t

StackTraceLLt ~
)LL~ 
)	LL Ä
;
LLÄ Å
}MM 
}NN 	
[OO 	
HttpGetOO	 
,OO 
RouteOO 
(OO 
$strOO /
)OO/ 0
]OO0 1
publicPP 
asyncPP 
TaskPP 
<PP 
IActionResultPP '
>PP' (
GetQuatationByIdPP) 9
(PP9 :
[PP: ;
	FromRoutePP; D
]PPD E
intPPF I
idPPJ L
)PPL M
{QQ 	
tryRR 
{SS 
varTT 
quatationEntityTT #
=TT$ %
awaitTT& +'
_ValuationQuatatiionServiceTT, G
.TTG H
GetQuatationByIdTTH X
(TTX Y
idTTY [
)TT[ \
;TT\ ]
ifUU 
(UU 
quatationEntityUU #
!=UU$ &
nullUU' +
&&UU, .
quatationEntityUU/ >
.UU> ?
IdUU? A
>UUB C
$numUUD E
)UUE F
returnVV 
_ObjectResponseVV *
.VV* +
CreateVV+ 1
(VV1 2
quatationEntityVV2 A
,VVA B
(VVC D
Int32VVD I
)VVI J
HttpStatusCodeVVJ X
.VVX Y
OKVVY [
)VV[ \
;VV\ ]
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
{[[ 
await\\ 
_ExceptionService\\ '
.\\' (
LogException\\( 4
(\\4 5
ex\\5 7
)\\7 8
;\\8 9
return]] 
_ObjectResponse]] &
.]]& '
Create]]' -
(]]- .
false]]. 3
,]]3 4
(]]5 6
Int32]]6 ;
)]]; <
HttpStatusCode]]< J
.]]J K
InternalServerError]]K ^
,]]^ _
Convert]]` g
.]]g h
ToString]]h p
(]]p q
ex]]q s
.]]s t

StackTrace]]t ~
)]]~ 
)	]] Ä
;
]]Ä Å
}^^ 
}__ 	
}ss 
}tt ıñ
DD:\EltizamLive\Eltizam.Api\Controllers\ValuationRequestController.cs
	namespace

 	
EltizamValuation


 
.

 
Api

 
.

 
Controllers

 *
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class &
ValuationRequestController +
:, -
ControllerBase. <
{ 
private 
readonly $
IValuationRequestService 1
_valutionServices2 C
;C D
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
ValuationRequestController )
() *$
IValuationRequestService* B
valutionServicesC S
,S T
IResponseHandlerU e
<e f
dynamicf m
>m n
ObjectResponseo }
)} ~
{ 	
_valutionServices 
= 
valutionServices  0
;0 1
_ObjectResponse 
= 
ObjectResponse ,
;, -
} 	
["" 	
HttpPost""	 
,"" 
Route"" 
("" 
$str"" 1
)""1 2
]""2 3
public## 
async## 
Task## 
<## 
IActionResult## '
>##' ("
GetAllValuationRequest##) ?
(##? @
[##@ A
FromForm##A I
]##I J"
DataTableAjaxPostModel##K a
model##b g
,##g h
string##i o
?##o p
userName##q y
,##y z
string	##{ Å
?
##Å Ç

clientName
##É ç
,
##ç é
string
##è ï
?
##ï ñ
propertyName
##ó £
,
##£ §
int
##• ®
requestStatusId
##© ∏
,
##∏ π
int
##π º

resourceId
##Ω «
,
##« »
int
##» À
propertyTypeId
##Ã ⁄
,
##⁄ €
int
##‹ ﬂ
	countryId
##‡ È
,
##È Í
int
##Í Ì
stateId
##Ó ı
,
##ı ˆ
int
##ˆ ˘
cityId
##˙ Ä
,
##Ä Å
string
##Å á
?
##á à
fromDate
##â ë
,
##ë í
string
##ì ô
?
##ô ö
toDate
##õ °
,
##° ¢
string
##£ ©
?
##© ™
valRef
##´ ±
)
##± ≤
{$$ 	
try%% 
{&& 
var'' 
filters'' 
='' 
new'' !#
ValuationRequestFilters''" 9
(''9 :
)'': ;
{(( 
userName)) 
=)) 
userName)) '
,))' (

clientName** 
=**  

clientName**! +
,**+ ,
propertyName++  
=++! "
propertyName++# /
,++/ 0
requestStatusId,, #
=,,$ %
requestStatusId,,& 5
,,,5 6

resourceId-- 
=--  

resourceId--! +
,--+ ,
propertyTypeId.. "
=..# $
propertyTypeId..% 3
,..3 4
	countryId// 
=// 
	countryId//  )
,//) *
stateId00 
=00 
stateId00 %
,00% &
cityId11 
=11 
cityId11 #
,11# $
fromDate22 
=22 
fromDate22 '
,22' (
toDate33 
=33 
toDate33 #
,33# $
valRef44 
=44 
valRef44 #
}55 
;55 
return77 
_ObjectResponse77 &
.77& '

CreateData77' 1
(771 2
await772 7
_valutionServices778 I
.77I J
GetAll77J P
(77P Q
model77Q V
,77V W
filters77X _
)77_ `
,77` a
(77b c
Int3277c h
)77h i
HttpStatusCode77i w
.77w x
OK77x z
)77z {
;77{ |
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
)	;; Ä
;
;;Ä Å
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
_valutionServicesBB* ;
.BB; <
AssignApproverBB< J
(BBJ K
modelBBK P
)BBP Q
;BBQ R
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
AppConstants	HH| à
.
HHà â
NoRecordFound
HHâ ñ
:
HHó ò
AppConstants
HHô •
.
HH• ¶

BadRequest
HH¶ ∞
)
HH∞ ±
)
HH± ≤
;
HH≤ ≥
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
_valutionServicesNN* ;
.NN; < 
AssignApproverStatusNN< P
(NNP Q
modelNNQ V
)NNV W
;NNW X
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
AppConstants	TT| à
.
TTà â
NoRecordFound
TTâ ñ
:
TTó ò
AppConstants
TTô •
.
TT• ¶

BadRequest
TT¶ ∞
)
TT∞ ±
)
TT± ≤
;
TT≤ ≥
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
_valutionServices]]8 I
.]]I J!
GetAllValuationMethod]]J _
(]]_ `
)]]` a
,]]a b
(]]c d
Int32]]d i
)]]i j
HttpStatusCode]]j x
.]]x y
OK]]y {
)]]{ |
;]]| }
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
)	aa Ä
;
aaÄ Å
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
_valutionServiceskk. ?
.kk? @
Upsertkk@ F
(kkF G

oValuationkkG Q
)kkQ R
;kkR S
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
UpdateSuccess	nnt Å
:
nnÇ É
AppConstants
nnÑ ê
.
nnê ë
InsertSuccess
nnë û
)
nnû ü
)
nnü †
;
nn† °
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
qqÄ å
.
qqå ç
NoRecordFound
qqç ö
:
qqõ ú
AppConstants
qqù ©
.
qq© ™

BadRequest
qq™ ¥
)
qq¥ µ
)
qqµ ∂
;
qq∂ ∑
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
)	uu Ä
;
uuÄ Å
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
_valutionServices~~- >
.~~> ?
GetById~~? F
(~~F G
id~~G I
)~~I J
;~~J K
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
ÄÄ 
_ObjectResponse
ÄÄ *
.
ÄÄ* +
Create
ÄÄ+ 1
(
ÄÄ1 2
oValuationEntity
ÄÄ2 B
,
ÄÄB C
(
ÄÄD E
Int32
ÄÄE J
)
ÄÄJ K
HttpStatusCode
ÄÄK Y
.
ÄÄY Z
OK
ÄÄZ \
)
ÄÄ\ ]
;
ÄÄ] ^
else
ÅÅ 
return
ÇÇ 
_ObjectResponse
ÇÇ *
.
ÇÇ* +
Create
ÇÇ+ 1
(
ÇÇ1 2
null
ÇÇ2 6
,
ÇÇ6 7
(
ÇÇ8 9
Int32
ÇÇ9 >
)
ÇÇ> ?
HttpStatusCode
ÇÇ? M
.
ÇÇM N

BadRequest
ÇÇN X
,
ÇÇX Y
AppConstants
ÇÇZ f
.
ÇÇf g
NoRecordFound
ÇÇg t
)
ÇÇt u
;
ÇÇu v
}
ÉÉ 
catch
ÑÑ 
(
ÑÑ 
	Exception
ÑÑ 
ex
ÑÑ 
)
ÑÑ  
{
ÖÖ 
return
ÜÜ 
_ObjectResponse
ÜÜ &
.
ÜÜ& '
Create
ÜÜ' -
(
ÜÜ- .
false
ÜÜ. 3
,
ÜÜ3 4
(
ÜÜ5 6
Int32
ÜÜ6 ;
)
ÜÜ; <
HttpStatusCode
ÜÜ< J
.
ÜÜJ K!
InternalServerError
ÜÜK ^
,
ÜÜ^ _
Convert
ÜÜ` g
.
ÜÜg h
ToString
ÜÜh p
(
ÜÜp q
ex
ÜÜq s
.
ÜÜs t

StackTrace
ÜÜt ~
)
ÜÜ~ 
)ÜÜ Ä
;ÜÜÄ Å
}
áá 
}
àà 	
[
ää 	

HttpDelete
ää	 
(
ää 
$str
ää !
)
ää! "
]
ää" #
public
ãã 
async
ãã 
Task
ãã 
<
ãã 
IActionResult
ãã '
>
ãã' (
Delete
ãã) /
(
ãã/ 0
[
ãã0 1
	FromRoute
ãã1 :
]
ãã: ;
int
ãã< ?
id
ãã@ B
)
ããB C
{
åå 	
try
çç 
{
éé 
DBOperation
èè 
	oResponse
èè %
=
èè& '
await
èè( -
_valutionServices
èè. ?
.
èè? @
Delete
èè@ F
(
èèF G
id
èèG I
)
èèI J
;
èèJ K
if
êê 
(
êê 
	oResponse
êê 
==
êê  
DBOperation
êê! ,
.
êê, -
Success
êê- 4
)
êê4 5
return
ëë 
_ObjectResponse
ëë *
.
ëë* +
Create
ëë+ 1
(
ëë1 2
true
ëë2 6
,
ëë6 7
(
ëë8 9
Int32
ëë9 >
)
ëë> ?
HttpStatusCode
ëë? M
.
ëëM N
OK
ëëN P
,
ëëP Q
AppConstants
ëëR ^
.
ëë^ _
DeleteSuccess
ëë_ l
)
ëël m
;
ëëm n
else
íí 
return
ìì 
_ObjectResponse
ìì *
.
ìì* +
Create
ìì+ 1
(
ìì1 2
null
ìì2 6
,
ìì6 7
(
ìì8 9
Int32
ìì9 >
)
ìì> ?
HttpStatusCode
ìì? M
.
ììM N

BadRequest
ììN X
,
ììX Y
AppConstants
ììZ f
.
ììf g
NoRecordFound
ììg t
)
ììt u
;
ììu v
}
îî 
catch
ïï 
(
ïï 
	Exception
ïï 
ex
ïï 
)
ïï  
{
ññ 
return
óó 
_ObjectResponse
óó &
.
óó& '
Create
óó' -
(
óó- .
false
óó. 3
,
óó3 4
(
óó5 6
Int32
óó6 ;
)
óó; <
HttpStatusCode
óó< J
.
óóJ K!
InternalServerError
óóK ^
,
óó^ _
Convert
óó` g
.
óóg h
ToString
óóh p
(
óóp q
ex
óóq s
.
óós t

StackTrace
óót ~
)
óó~ 
)óó Ä
;óóÄ Å
}
òò 
}
ôô 	
[
õõ 	
HttpPost
õõ	 
,
õõ 
Route
õõ 
(
õõ 
$str
õõ 0
)
õõ0 1
]
õõ1 2
public
úú 
async
úú 
Task
úú 
<
úú 
IActionResult
úú '
>
úú' (#
ReviewerRequestStatus
úú) >
(
úú> ?
[
úú? @
FromBody
úú@ H
]
úúH I.
 ValutionRequestStatusChangeModel
úúJ j
model
úúk p
)
úúp q
{
ùù 	
DBOperation
ûû 
	oResponse
ûû !
=
ûû" #
await
ûû$ )
_valutionServices
ûû* ;
.
ûû; <!
UpdateRequestStatus
ûû< O
(
ûûO P
model
ûûP U
)
ûûU V
;
ûûV W
if
üü 
(
üü 
	oResponse
üü 
==
üü 
DBOperation
üü (
.
üü( )
Success
üü) 0
)
üü0 1
{
†† 
return
°° 
_ObjectResponse
°° &
.
°°& '
Create
°°' -
(
°°- .
true
°°. 2
,
°°2 3
(
°°4 5
Int32
°°5 :
)
°°: ;
HttpStatusCode
°°; I
.
°°I J
OK
°°J L
,
°°L M
(
°°N O
AppConstants
°°O [
.
°°[ \
InsertSuccess
°°\ i
)
°°i j
)
°°j k
;
°°k l
}
¢¢ 
else
££ 
return
§§ 
_ObjectResponse
§§ &
.
§§& '
Create
§§' -
(
§§- .
false
§§. 3
,
§§3 4
(
§§5 6
Int32
§§6 ;
)
§§; <
HttpStatusCode
§§< J
.
§§J K

BadRequest
§§K U
,
§§U V
(
§§W X
	oResponse
§§X a
==
§§b d
DBOperation
§§e p
.
§§p q
NotFound
§§q y
?
§§z {
AppConstants§§| à
.§§à â
NoRecordFound§§â ñ
:§§ó ò
AppConstants§§ô •
.§§• ¶

BadRequest§§¶ ∞
)§§∞ ±
)§§± ≤
;§§≤ ≥
}
•• 	
}
ßß 
}®® ê'
JD:\EltizamLive\Eltizam.Api\Controllers\ValuationRequestStatusController.cs
	namespace 	
EltizamValuation
 
. 
Api 
. 
Controllers *
{		 
[

 
Route

 

(


 
$str

 
)

 
]

 
[ 
ApiController 
] 
[ 
AuthorizeAttribute 
] 
public 

class ,
 ValuationRequestStatusController 1
:2 3
ControllerBase4 B
{ 
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
private 
	Microsoft 
. 

Extensions $
.$ %
Hosting% ,
., -
IHostingEnvironment- @
_envA E
;E F
private 
readonly 
IExceptionService *
_ExceptionService+ <
;< =
private 
readonly *
IValuationRequestStatusService 7!
_RequestStatusService8 M
;M N
public ,
 ValuationRequestStatusController /
(/ 0
IConfiguration0 >
configuration? L
,L M
IResponseHandlerN ^
<^ _
dynamic_ f
>f g
ObjectResponseh v
,v w
IExceptionService	x â
exceptionService
ä ö
,
ö õ,
IValuationRequestStatusService
ú ∫"
RequestStatusService
ª œ
)
œ –
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
;0 1!
_RequestStatusService   !
=  " # 
RequestStatusService  $ 8
;  8 9
}!! 	
[&& 	
HttpGet&&	 
(&& 
$str&& "
)&&" #
]&&# $
public'' 
async'' 
Task'' 
<'' 
IActionResult'' '
>''' (
GetAll'') /
(''/ 0
int''0 3
roleId''4 :
,'': ;
string''< B
action''C I
,''I J
int''K N
ValReqId''O W
)''W X
{(( 	
try)) 
{** 
return++ 
_ObjectResponse++ &
.++& '

CreateData++' 1
(++1 2
await++2 7!
_RequestStatusService++8 M
.++M N
GetAll++N T
(++T U
roleId++U [
,++[ \
action++] c
,++c d
ValReqId++e m
)++m n
,++n o
(++p q
Int32++q v
)++v w
HttpStatusCode	++w Ö
.
++Ö Ü
OK
++Ü à
)
++à â
;
++â ä
},, 
catch-- 
(-- 
	Exception-- 
ex-- 
)--  
{.. 
return// 
_ObjectResponse// &
.//& '
Create//' -
(//- .
false//. 3
,//3 4
(//5 6
Int32//6 ;
)//; <
HttpStatusCode//< J
.//J K
InternalServerError//K ^
,//^ _
Convert//` g
.//g h
ToString//h p
(//p q
ex//q s
.//s t

StackTrace//t ~
)//~ 
)	// Ä
;
//Ä Å
}00 
}11 	
[33 	
HttpGet33	 
(33 
$str33 
)33  
]33  !
public44 
async44 
Task44 
<44 
IActionResult44 '
>44' (
GetAllStatus44) 5
(445 6
)446 7
{55 	
try66 
{77 
return88 
_ObjectResponse88 &
.88& '

CreateData88' 1
(881 2
await882 7!
_RequestStatusService888 M
.88M N
GetAllStatus88N Z
(88Z [
)88[ \
,88\ ]
(88^ _
Int3288_ d
)88d e
HttpStatusCode88e s
.88s t
OK88t v
)88v w
;88w x
}99 
catch:: 
(:: 
	Exception:: 
ex:: 
)::  
{;; 
return<< 
_ObjectResponse<< &
.<<& '
Create<<' -
(<<- .
false<<. 3
,<<3 4
(<<5 6
Int32<<6 ;
)<<; <
HttpStatusCode<<< J
.<<J K
InternalServerError<<K ^
,<<^ _
Convert<<` g
.<<g h
ToString<<h p
(<<p q
ex<<q s
.<<s t

StackTrace<<t ~
)<<~ 
)	<< Ä
;
<<Ä Å
}== 
}>> 	
}@@ 
}AA Ø
8D:\EltizamLive\Eltizam.Api\Filters\AuthorizeAttribute.cs
	namespace 	
Eltizam
 
. 
Api 
. 
Filters 
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
} ﬁC
5D:\EltizamLive\Eltizam.Api\Filters\ExceptionFilter.cs
	namespace 	
Eltizam
 
. 
API 
. 
Filter 
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
##Ä Å
,
##Å Ç
_Success
##É ã
=
##å ç
false
##é ì
}
##î ï
;
##ï ñ
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
}nn †	
?D:\EltizamLive\Eltizam.Api\Helpers\Response\IResponseHandler.cs
	namespace 	
Eltizam
 
. 
Api 
. 
Helpers 
. 
Response &
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
T 
Data #
,# $
int% (
?( )

StatusCode* 4
,4 5
string6 <
Message= D
=E F
nullG K
,K L
stringM S
ReturnToUrlT _
=` a
nullb f
,f g
Listh l
<l m
stringm s
>s t
errorMessages	u Ç
=
É Ñ
null
Ö â
)
â ä
;
ä ã
IActionResult		 

CreateData		  
(		  !
T		! "
Data		# '
,		' (
int		) ,
?		, -

StatusCode		. 8
)		8 9
;		9 :
}

 
} é
>D:\EltizamLive\Eltizam.Api\Helpers\Response\ResponseHandler.cs
	namespace 	
Eltizam
 
. 
Api 
. 
Helpers 
. 
Response &
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
errorMessages	| â
=
ä ã
null
å ê
)
ê ë
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
IActionResult 

CreateData '
(' (
T( )
Data* .
,. /
int0 3
?3 4

StatusCode5 ?
)? @
{ 	
return 
new 
ObjectResult #
(# $
Data$ (
)( )
{* +

StatusCode, 6
=7 8

StatusCode9 C
}D E
;E F
} 	
} 
} ¸B
HD:\EltizamLive\Eltizam.Api\Middlewares\JwtAuthenticationServiceConfig.cs
	namespace		 	
Eltizam		
 
.		 
Api		 
.		 
Middlewares		 !
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
;$$ 
services&& 
.&& 
AddAuthentication&& &
(&&& '
options&&' .
=>&&/ 1
{'' 
options(( 
.(( %
DefaultAuthenticateScheme(( 1
=((2 3
JwtBearerDefaults((4 E
.((E F 
AuthenticationScheme((F Z
;((Z [
options)) 
.)) "
DefaultChallengeScheme)) .
=))/ 0
JwtBearerDefaults))1 B
.))B C 
AuthenticationScheme))C W
;))W X
}** 
)** 
.** 
AddJwtBearer** 
(** 
configureOptions** ,
=>**- /
{++ 
configureOptions,,  
.,,  ! 
RequireHttpsMetadata,,! 5
=,,6 7
false,,8 =
;,,= >
configureOptions--  
.--  !
	SaveToken--! *
=--+ ,
true--- 1
;--1 2
configureOptions//  
.//  !%
TokenValidationParameters//! :
=//; <!
tokenValidationParams//= R
;//R S
}00 
)00 
;00 
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
RoleId	CC| Ç
.
CCÇ É
ToString
CCÉ ã
(
CCã å
)
CCå ç
)
CCç é
)
CCé è
)
CCè ê
;
CCê ë
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
HmacSha256Signature	KKn Å
)
KKÅ Ç
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
}\\ ”!
7D:\EltizamLive\Eltizam.Api\Middlewares\JwtMiddleware.cs
	namespace 	
Eltizam
 
. 
Api 
. 
Middlewares !
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
}== 
%D:\EltizamLive\Eltizam.Api\Program.cs
	namespace 	
Eltizam
 
. 
API 
{ 
public		 

class		 
Program		 
{

 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
var 
config 
= 
new  
ConfigurationBuilder 1
(1 2
)2 3
. 
AddJsonFile 
( 
$str .
). /
. 
Build 
( 
) 
; 
try 
{ 
Log 
. 
Logger 
= 
new  
LoggerConfiguration! 4
(4 5
)5 6
. 
ReadFrom 
. 
Configuration +
(+ ,
config, 2
)2 3
. 
CreateLogger !
(! "
)" #
;# $
CreateHostBuilder !
(! "
args" &
)& '
.' (
Build( -
(- .
). /
./ 0
Run0 3
(3 4
)4 5
;5 6
} 
catch 
( 
	Exception 
ex 
) 
{ 
Console 
. 
	WriteLine !
(! "
ex" $
.$ %
ToString% -
(- .
). /
)/ 0
;0 1
} 
finally 
{ 
Log 
. 
CloseAndFlush !
(! "
)" #
;# $
} 
}   	
public"" 
static"" 
IHostBuilder"" "
CreateHostBuilder""# 4
(""4 5
string""5 ;
[""; <
]""< =
args""> B
)""B C
=>""D F
Host## 
.##  
CreateDefaultBuilder## %
(##% &
args##& *
)##* +
.$$ 

UseSerilog$$ 
($$ 
)$$ 
.%% $
ConfigureWebHostDefaults%% )
(%%) *

webBuilder%%* 4
=>%%5 7
{&& 

webBuilder'' 
.'' 

UseStartup'' )
<'') *
Startup''* 1
>''1 2
(''2 3
)''3 4
;''4 5
}(( 
)(( 
;(( 
})) 
}** áU
%D:\EltizamLive\Eltizam.Api\Startup.cs
	namespace 	
Eltizam
 
. 
API 
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
)A B
{ 	
DatabaseConnection 
. 

ConnString )
=* +
Configuration, 9
.9 :

GetSection: D
(D E
$strE j
)j k
.k l
Valuel q
;q r
services 
. 
AddControllers #
(# $
options$ +
=>, .
{ 
options 
. 
Filters 
.  
Add  #
(# $
typeof$ *
(* +
ExceptionFilter+ :
): ;
); <
;< =
} 
) 
. 
AddJsonOptions 
( 
options %
=>& (
{ 
options   
.   !
JsonSerializerOptions   -
.  - .
WriteIndented  . ;
=  < =
true  > B
;  B C
}!! 
)!! 
.!! 
AddNewtonsoftJson!!  
(!!  !
)!!! "
;!!" #
services## 
.## 
AddResource##  
(##  !
)##! "
;##" #
services$$ 
.$$ 
AddSwaggerGen$$ "
($$" #
c$$# $
=>$$% '
{%% 
c&& 
.&& 

SwaggerDoc&& 
(&& 
$str&& !
,&&! "
new&&# &
OpenApiInfo&&' 2
{&&3 4
Title&&5 :
=&&; <
Configuration&&= J
[&&J K
$str&&K Z
]&&Z [
,&&[ \
Version&&] d
=&&e f
Configuration&&g t
[&&t u
$str	&&u Ü
]
&&Ü á
}
&&à â
)
&&â ä
;
&&ä ã
c'' 
.'' !
AddSecurityDefinition'' '
(''' (
Configuration''( 5
[''5 6
$str''6 F
]''F G
,''G H
new''I L!
OpenApiSecurityScheme''M b
(''b c
)''c d
{(( 
Description)) 
=))  !
Configuration))" /
[))/ 0
$str))0 E
]))E F
,))F G
Name** 
=** 
Configuration** (
[**( )
$str**) 7
]**7 8
,**8 9
In++ 
=++ 
	Microsoft++ "
.++" #
OpenApi++# *
.++* +
Models+++ 1
.++1 2
ParameterLocation++2 C
.++C D
Header++D J
,++J K
Type,, 
=,, 
	Microsoft,, $
.,,$ %
OpenApi,,% ,
.,,, -
Models,,- 3
.,,3 4
SecuritySchemeType,,4 F
.,,F G
ApiKey,,G M
}-- 
)-- 
;-- 
c.. 
... "
AddSecurityRequirement.. (
(..( )
new..) ,&
OpenApiSecurityRequirement..- G
{..H I
{// 
new00 !
OpenApiSecurityScheme00 .
{11 
	Reference22  
=22! "
new22# &
OpenApiReference22' 7
{33 
Type44 
=44 
ReferenceType44  -
.44- .
SecurityScheme44. <
,44< =
Id55 
=55 
$str55 &
}66 
}77 
,77 
new88 
string88  
[88  !
]88! "
{88# $
}88% &
}99 
}:: 
):: 
;:: 
};; 
);; 
;;; 
services<< 
.<< 
AddOutputCaching<< %
(<<% &
)<<& '
;<<' (
services== 
.== 
AddMvc== 
(== 
)== 
;== 
servicesGG 
.GG 
AddSingletonGG !
<GG! " 
IHttpContextAccessorGG" 6
,GG6 7
HttpContextAccessorGG8 K
>GGK L
(GGL M
)GGM N
;GGN O
servicesHH 
.HH 
	AddScopedHH 
(HH 
typeofHH %
(HH% &
IResponseHandlerHH& 6
<HH6 7
>HH7 8
)HH8 9
,HH9 :
typeofHH; A
(HHA B
ResponseHandlerHHB Q
<HHQ R
>HHR S
)HHS T
)HHT U
;HHU V
servicesJJ 
.JJ 
	ConfigureJJ 
<JJ 
CookiePolicyOptionsJJ 2
>JJ2 3
(JJ3 4
optionsJJ4 ;
=>JJ< >
{KK 
optionsMM 
.MM 
CheckConsentNeededMM *
=MM+ ,
contextMM- 4
=>MM5 7
trueMM8 <
;MM< =
optionsNN 
.NN !
MinimumSameSitePolicyNN -
=NN. /
SameSiteModeNN0 <
.NN< =
NoneNN= A
;NNA B
}OO 
)OO 
;OO 
servicesRR 
.RR 
	ConfigureRR 
<RR 
FormOptionsRR *
>RR* +
(RR+ ,
optionsRR, 3
=>RR4 6
{SS 
optionsTT 
.TT 
ValueLengthLimitTT (
=TT) *
intTT+ .
.TT. /
MaxValueTT/ 7
;TT7 8
optionsUU 
.UU $
MultipartBodyLengthLimitUU 0
=UU1 2
intUU3 6
.UU6 7
MaxValueUU7 ?
;UU? @
optionsVV 
.VV '
MultipartHeadersLengthLimitVV 3
=VV4 5
intVV6 9
.VV9 :
MaxValueVV: B
;VVB C
}WW 
)WW 
;WW 
services__ 
.__ 
ContainerResolver__ &
(__& '
)__' (
;__( )
servicesaa 
.aa 
AddCorsaa 
(aa 
)aa 
;aa 
servicesbb 
.bb %
AddDistributedMemoryCachebb .
(bb. /
)bb/ 0
;bb0 1
servicesdd 
.dd "
AddHttpContextAccessordd +
(dd+ ,
)dd, -
;dd- .
servicesff 
.ff 

AddSignalRff 
(ff  
)ff  !
;ff! "
servicesgg 
.gg 
AddCorsgg 
(gg 
optionsgg $
=>gg% '
{hh 
optionsii 
.ii 
	AddPolicyii !
(ii! "
$strii" 3
,ii3 4
builderjj 
=>jj 
builderjj &
.jj& '
AllowAnyOriginjj' 5
(jj5 6
)jj6 7
)jj7 8
;jj8 9
}kk 
)kk 
;kk 
}ll 	
publicoo 
voidoo 
	Configureoo 
(oo 
IApplicationBuilderoo 1
appoo2 5
,oo5 6
IWebHostEnvironmentoo7 J
envooK N
)ooN O
{pp 	
ifqq 
(qq 
envqq 
.qq 
IsDevelopmentqq !
(qq! "
)qq" #
)qq# $
{rr 
appss 
.ss %
UseDeveloperExceptionPagess -
(ss- .
)ss. /
;ss/ 0
apptt 
.tt 

UseSwaggertt 
(tt 
)tt  
;tt  !
appuu 
.uu 
UseSwaggerUIuu  
(uu  !
cuu! "
=>uu# %
{vv 
cww 
.ww 
SwaggerEndpointww %
(ww% &
Configurationww& 3
[ww3 4
$strww4 H
]wwH I
,wwI J
ConfigurationwwK X
[wwX Y
$strwwY o
]wwo p
)wwp q
;wwq r
}xx 
)xx 
;xx 
}zz 
else{{ 
{|| 
app}} 
.}} 
UseExceptionHandler}} '
(}}' (
$str}}( 5
)}}5 6
;}}6 7
app~~ 
.~~ 
UseHsts~~ 
(~~ 
)~~ 
;~~ 
} 
app
ÅÅ 
.
ÅÅ 
UseStaticFiles
ÅÅ 
(
ÅÅ 
)
ÅÅ  
;
ÅÅ  !
var
ÉÉ 
allowedOrigins
ÉÉ 
=
ÉÉ  
Configuration
ÉÉ! .
.
ÉÉ. /

GetSection
ÉÉ/ 9
(
ÉÉ9 :
$str
ÉÉ: J
)
ÉÉJ K
.
ÉÉK L
Value
ÉÉL Q
.
ÉÉQ R
Split
ÉÉR W
(
ÉÉW X
$str
ÉÉX [
)
ÉÉ[ \
;
ÉÉ\ ]
app
ÖÖ 
.
ÖÖ 
UseCors
ÖÖ 
(
ÖÖ 
builder
ÖÖ 
=>
ÖÖ  "
builder
ÖÖ# *
.
ÜÜ$ %
WithOrigins
ÜÜ% 0
(
ÜÜ0 1
allowedOrigins
ÜÜ1 ?
)
ÜÜ? @
.
áá$ %
AllowAnyMethod
áá% 3
(
áá3 4
)
áá4 5
.
àà$ %
AllowAnyHeader
àà% 3
(
àà3 4
)
àà4 5
.
ââ$ %
AllowCredentials
ââ% 5
(
ââ5 6
)
ââ6 7
)
ää 
;
ää 
app
ãã 
.
ãã 
UseOutputCaching
ãã  
(
ãã  !
)
ãã! "
;
ãã" #
app
çç 
.
çç !
UseHttpsRedirection
çç #
(
çç# $
)
çç$ %
;
çç% &
app
èè 
.
èè $
UseRequestLocalization
èè &
(
èè& '
)
èè' (
;
èè( )
app
ëë 
.
ëë 

UseRouting
ëë 
(
ëë 
)
ëë 
;
ëë 
app
ìì 
.
ìì 
UseAuthentication
ìì !
(
ìì! "
)
ìì" #
;
ìì# $
app
îî 
.
îî 
UseAuthorization
îî  
(
îî  !
)
îî! "
;
îî" #
app
ïï 
.
ïï 
UseFileServer
ïï 
(
ïï 
)
ïï 
;
ïï  
app
óó 
.
óó 
UseMiddleware
óó 
<
óó 
JwtMiddleware
óó +
>
óó+ ,
(
óó, -
)
óó- .
;
óó. /
app
öö 
.
öö 
UseEndpoints
öö 
(
öö 
	endpoints
öö &
=>
öö' )
{
õõ 
	endpoints
úú 
.
úú 
MapControllers
úú (
(
úú( )
)
úú) *
;
úú* +
}
ûû 
)
ûû 
;
ûû 
}
™™ 	
}
´´ 
}¨¨ 