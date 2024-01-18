˙å
;D:\EltizamLive\Eltizam.Web\Controllers\AccountController.cs
	namespace 	
Eltizam
 
. 
Web 
. 
Controllers !
{ 
public 

class 
AccountController "
:# $

Controller% /
{ 
private 
readonly 
IDistributedCache *
_cache+ 1
;1 2
private 
readonly 
IConfiguration '
_cofiguration( 5
;5 6
private 
readonly 
IStringLocalizer )
<) *
Account* 1
>1 2
_stringLocalizer3 C
;C D
private 
readonly 
IHelper  
_helper! (
;( )
public 
AccountController  
(  !
IDistributedCache! 2
cache3 8
,8 9
IConfiguration: H
configurationI V
,V W
IStringLocalizerX h
<h i
Accounti p
>p q
stringLocalizer	r Å
,
Å Ç
IHelper
É ä
helper
ã ë
)
ë í
{ 	
_cache 
= 
cache 
; 
_cofiguration   
=   
configuration   )
;  ) *
_stringLocalizer!! 
=!! 
stringLocalizer!! .
;!!. /
_helper"" 
="" 
helper"" 
;"" 
}## 	
public$$ 
IActionResult$$ 
Login$$ "
($$" #
)$$# $
{%% 	
APIRepository&& 
objapi&&  
=&&! "
new&&# &
APIRepository&&' 4
(&&4 5
_cofiguration&&5 B
)&&B C
;&&C D
var'' 
dd'' 
='' 
new'' 
LoginViewModel'' '
(''' (
)''( )
;'') *
LoginViewModel<< 
loginViewModel<< )
=<<* +
new<<, /
LoginViewModel<<0 >
(<<> ?
)<<? @
;<<@ A
return>> 
View>> 
(>> 
loginViewModel>> &
)>>& '
;>>' (
}?? 	
[AA 	
HttpPostAA	 
]AA 
publicBB 
IActionResultBB 
LoginBB "
(BB" #
LoginViewModelBB# 1
loginViewModelBB2 @
)BB@ A
{CC 	
tryDD 
{EE 
APIRepositoryFF 
objapiFF $
=FF% &
newFF' *
APIRepositoryFF+ 8
(FF8 9
_cofigurationFF9 F
)FFF G
;FFG H
ifHH 
(HH 
!HH 
(HH 
stringHH 
.HH 
IsNullOrEmptyHH *
(HH* +
loginViewModelHH+ 9
.HH9 :
EmailHH: ?
)HH? @
&&HHA C
stringHHD J
.HHJ K
IsNullOrEmptyHHK X
(HHX Y
loginViewModelHHY g
.HHg h
PasswordHHh p
)HHp q
)HHq r
)HHr s
{II 
HttpResponseMessageJJ '
responseMessageJJ( 7
=JJ8 9
objapiJJ: @
.JJ@ A
APICommunicationJJA Q
(JJQ R
APIURLHelperJJR ^
.JJ^ _
LoginURLJJ_ g
,JJg h

HttpMethodJJi s
.JJs t
PostJJt x
,JJx y
string	JJz Ä
.
JJÄ Å
Empty
JJÅ Ü
,
JJÜ á
new
JJà ã
StringContent
JJå ô
(
JJô ö
JsonConvert
JJö •
.
JJ• ¶
SerializeObject
JJ¶ µ
(
JJµ ∂
loginViewModel
JJ∂ ƒ
)
JJƒ ≈
)
JJ≈ ∆
)
JJ∆ «
.
JJ« »
Result
JJ» Œ
;
JJŒ œ
ifLL 
(LL 
responseMessageLL '
.LL' (
IsSuccessStatusCodeLL( ;
)LL; <
{MM 
stringNN 
jsonResponseNN +
=NN, -
responseMessageNN. =
.NN= >
ContentNN> E
.NNE F
ReadAsStringAsyncNNF W
(NNW X
)NNX Y
.NNY Z
ResultNNZ `
;NN` a
varOO 
oUserDetailOO '
=OO( )
JsonConvertOO* 5
.OO5 6
DeserializeObjectOO6 G
<OOG H
APIResponseEntityOOH Y
<OOY Z
UserSessionEntityOOZ k
>OOk l
>OOl m
(OOm n
jsonResponseOOn z
)OOz {
;OO{ |
SetUserClaimPP $
(PP$ %
oUserDetailPP% 0
.PP0 1
_objectPP1 8
)PP8 9
;PP9 :
varRR 
roleIdRR "
=RR# $
oUserDetailRR% 0
.RR0 1
_objectRR1 8
.RR8 9
RoleIdRR9 ?
;RR? @
varSS 
rolesSS !
=SS" #
UtilityHelperSS$ 1
.SS1 2
GetModuleRoleSS2 ?
<SS? @
dynamicSS@ G
>SSG H
(SSH I
roleIdSSI O
)SSO P
;SSP Q
ifUU 
(UU 
rolesUU !
==UU" $
nullUU% )
)UU) *
{VV 
HttpContextWW '
.WW' (
RequestWW( /
.WW/ 0
CookiesWW0 7
.WW7 8
TryGetValueWW8 C
(WWC D

UserHelperWWD N
.WWN O
EltizamTokenWWO [
,WW[ \
outWW] `
stringWWa g
tokenWWh m
)WWm n
;WWn o
HttpResponseMessageXX /
resRolesXX0 8
=XX9 :
objapiXX; A
.XXA B
APICommunicationXXB R
(XXR S
APIURLHelperXXS _
.XX_ `)
GetByPermisionRoleUsingRoleIdXX` }
+XX~ 
$str
XXÄ É
+
XXÑ Ö
roleId
XXÜ å
,
XXå ç

HttpMethod
XXé ò
.
XXò ô
Get
XXô ú
,
XXú ù
oUserDetail
XXû ©
.
XX© ™
_object
XX™ ±
.
XX± ≤
	UserToken
XX≤ ª
)
XXª º
.
XXº Ω
Result
XXΩ √
;
XX√ ƒ
ifYY 
(YY  
resRolesYY  (
.YY( )
IsSuccessStatusCodeYY) <
)YY< =
{ZZ 
string[[  &
rolJson[[' .
=[[/ 0
resRoles[[1 9
.[[9 :
Content[[: A
.[[A B
ReadAsStringAsync[[B S
([[S T
)[[T U
.[[U V
Result[[V \
;[[\ ]
var\\  #
data\\$ (
=\\) *
JsonConvert\\+ 6
.\\6 7
DeserializeObject\\7 H
<\\H I
APIResponseEntity\\I Z
<\\Z [
IEnumerable\\[ f
<\\f g
RolePermissionModel\\g z
>\\z {
>\\{ |
>\\| }
(\\} ~
rolJson	\\~ Ö
)
\\Ö Ü
;
\\Ü á
UtilityHelper^^  -
.^^- .
RemoveModuleRole^^. >
(^^> ?
roleId^^? E
)^^E F
;^^F G
UtilityHelper__  -
.__- .
AddModuleRole__. ;
(__; <
roleId__< B
,__B C
data__D H
.__H I
_object__I P
)__P Q
;__Q R
rolesaa  %
=aa& '
dataaa( ,
.aa, -
_objectaa- 4
;aa4 5
}bb 
}cc 
returnee 
RedirectToActionee /
(ee/ 0
$stree0 ;
,ee; <
$stree= H
)eeH I
;eeI J
}ff 
elsegg 
{hh 
TempDataii  
[ii  !

UserHelperii! +
.ii+ ,
ErrorMessageii, 8
]ii8 9
=ii: ;
responseMessageii< K
.iiK L
ReasonPhraseiiL X
;iiX Y
returnjj 
Viewjj #
(jj# $
loginViewModeljj$ 2
)jj2 3
;jj3 4
}kk 
}ll 
elsemm 
{nn 
TempDataoo 
[oo 

UserHelperoo '
.oo' (
ErrorMessageoo( 4
]oo4 5
=oo6 7
_stringLocalizeroo8 H
[ooH I
$strooI V
]ooV W
.ooW X
ValueooX ]
;oo] ^
returnpp 
Viewpp 
(pp  
loginViewModelpp  .
)pp. /
;pp/ 0
}qq 
}rr 
catchss 
(ss 
	Exceptionss 
ess 
)ss 
{tt 
_helperuu 
.uu 
LogExceptionsuu %
(uu% &
euu& '
)uu' (
;uu( )
TempDatavv 
[vv 

UserHelpervv #
.vv# $
ErrorMessagevv$ 0
]vv0 1
=vv2 3
Convertvv4 ;
.vv; <
ToStringvv< D
(vvD E
evvE F
.vvF G

StackTracevvG Q
)vvQ R
;vvR S
returnxx 
Viewxx 
(xx 
loginViewModelxx *
)xx* +
;xx+ ,
}yy 
}zz 	
private|| 
void|| 
SetUserClaim|| !
(||! "
UserSessionEntity||" 3
oUserDetail||4 ?
)||? @
{}} 	
HttpContext~~ 
.~~ 
Response~~  
.~~  !
Cookies~~! (
.~~( )
Append~~) /
(~~/ 0

UserHelper~~0 :
.~~: ;
EltizamToken~~; G
,~~G H
oUserDetail~~I T
.~~T U
	UserToken~~U ^
,~~^ _
new~~` c
CookieOptions~~d q
{~~r s
Expires~~t {
=~~| }
oUserDetail	~~~ â
.
~~â ä
VallidTo
~~ä í
}
~~ì î
)
~~î ï
;
~~ï ñ
var
ÄÄ 
claims
ÄÄ 
=
ÄÄ 
new
ÄÄ 
List
ÄÄ !
<
ÄÄ! "
Claim
ÄÄ" '
>
ÄÄ' (
{
ÅÅ 
new
ÇÇ 
Claim
ÇÇ 
(
ÇÇ 
$str
ÇÇ $
,
ÇÇ$ %
oUserDetail
ÇÇ& 1
.
ÇÇ1 2
UserName
ÇÇ2 :
)
ÇÇ: ;
,
ÇÇ; <
new
ÉÉ 
Claim
ÉÉ 
(
ÉÉ 
$str
ÉÉ $
,
ÉÉ$ %
oUserDetail
ÉÉ& 1
.
ÉÉ1 2
UserName
ÉÉ2 :
)
ÉÉ: ;
,
ÉÉ; <
new
ÑÑ 
Claim
ÑÑ 
(
ÑÑ 
$str
ÑÑ !
,
ÑÑ! "
oUserDetail
ÑÑ& 1
.
ÑÑ1 2
Email
ÑÑ2 7
)
ÑÑ7 8
,
ÑÑ8 9
new
ÖÖ 
Claim
ÖÖ 
(
ÖÖ 
$str
ÖÖ "
,
ÖÖ" #
oUserDetail
ÖÖ& 1
.
ÖÖ1 2
RoleId
ÖÖ2 8
.
ÖÖ8 9
ToString
ÖÖ9 A
(
ÖÖA B
)
ÖÖB C
)
ÖÖC D
,
ÖÖD E
new
ÜÜ 
Claim
ÜÜ 
(
ÜÜ 
$str
ÜÜ "
,
ÜÜ" #
oUserDetail
ÜÜ& 1
.
ÜÜ1 2
UserId
ÜÜ2 8
.
ÜÜ8 9
ToString
ÜÜ9 A
(
ÜÜA B
)
ÜÜB C
)
ÜÜC D
,
ÜÜD E
}
áá 
;
áá 
var
ää 
identity
ää 
=
ää 
new
ää 
ClaimsIdentity
ää -
(
ää- .
claims
ää. 4
,
ää4 5*
CookieAuthenticationDefaults
ää6 R
.
ääR S"
AuthenticationScheme
ääS g
)
ääg h
;
ääh i
var
åå 
	principal
åå 
=
åå 
new
åå 
ClaimsPrincipal
åå  /
(
åå/ 0
identity
åå0 8
)
åå8 9
;
åå9 :
var
éé 
props
éé 
=
éé 
new
éé &
AuthenticationProperties
éé 4
(
éé4 5
)
éé5 6
;
éé6 7
props
èè 
.
èè 
IsPersistent
èè 
=
èè  
true
èè! %
;
èè% &
props
êê 
.
êê 

ExpiresUtc
êê 
=
êê 
oUserDetail
êê *
.
êê* +
VallidTo
êê+ 3
;
êê3 4
HttpContext
íí 
.
íí 
SignInAsync
íí #
(
íí# $*
CookieAuthenticationDefaults
íí$ @
.
íí@ A"
AuthenticationScheme
ííA U
,
ííU V
	principal
ííW `
,
íí` a
props
ííb g
)
ííg h
;
ííh i
HttpContext
ïï 
.
ïï 
Session
ïï 
.
ïï  
	SetString
ïï  )
(
ïï) *

UserHelper
ïï* 4
.
ïï4 5
LogInUserId
ïï5 @
,
ïï@ A
Convert
ïïB I
.
ïïI J
ToString
ïïJ R
(
ïïR S
oUserDetail
ïïS ^
.
ïï^ _
UserId
ïï_ e
)
ïïe f
)
ïïf g
;
ïïg h
HttpContext
ññ 
.
ññ 
Session
ññ 
.
ññ  
	SetString
ññ  )
(
ññ) *

UserHelper
ññ* 4
.
ññ4 5
LogInRoleId
ññ5 @
,
ññ@ A
Convert
ññB I
.
ññI J
ToString
ññJ R
(
ññR S
oUserDetail
ññS ^
.
ññ^ _
RoleId
ññ_ e
)
ññe f
)
ññf g
;
ññg h
HttpContext
óó 
.
óó 
Session
óó 
.
óó  
	SetString
óó  )
(
óó) *

UserHelper
óó* 4
.
óó4 5
LogInUserName
óó5 B
,
óóB C
oUserDetail
óóD O
.
óóO P
UserName
óóP X
)
óóX Y
;
óóY Z
HttpContext
òò 
.
òò 
Session
òò 
.
òò  
	SetString
òò  )
(
òò) *

UserHelper
òò* 4
.
òò4 5
LogInRoleName
òò5 B
,
òòB C
oUserDetail
òòD O
.
òòO P
RoleName
òòP X
)
òòX Y
;
òòY Z
}
ôô 	
public
úú 
IActionResult
úú 
ForGetPassword
úú +
(
úú+ ,
)
úú, -
{
ùù 	
return
ûû 
View
ûû 
(
ûû 
)
ûû 
;
ûû 
}
üü 	
[
°° 	
HttpPost
°°	 
]
°° 
public
¢¢ 
async
¢¢ 
Task
¢¢ 
<
¢¢ 
IActionResult
¢¢ '
>
¢¢' (
Logout
¢¢) /
(
¢¢/ 0
)
¢¢0 1
{
££ 	
var
§§ 
roleId
§§ 
=
§§ 
_helper
§§  
.
§§  !
GetLoggedInRoleId
§§! 2
(
§§2 3
)
§§3 4
;
§§4 5
await
•• 
HttpContext
•• 
.
•• 
SignOutAsync
•• *
(
••* +*
CookieAuthenticationDefaults
••+ G
.
••G H"
AuthenticationScheme
••H \
)
••\ ]
;
••] ^
HttpContext
¶¶ 
.
¶¶ 
Session
¶¶ 
.
¶¶  
Clear
¶¶  %
(
¶¶% &
)
¶¶& '
;
¶¶' (
UtilityHelper
®® 
.
®® 
RemoveModuleRole
®® *
(
®®* +
roleId
®®+ 1
)
®®1 2
;
®®2 3
HttpContext
™™ 
.
™™ 
Response
™™  
.
™™  !
Cookies
™™! (
.
™™( )
Delete
™™) /
(
™™/ 0

UserHelper
™™0 :
.
™™: ;
EltizamToken
™™; G
)
™™G H
;
™™H I
return
´´ 
RedirectToAction
´´ #
(
´´# $
$str
´´$ +
,
´´+ ,
$str
´´- 6
)
´´6 7
;
´´7 8
}
¨¨ 	
[
ÆÆ 	
HttpPost
ÆÆ	 
]
ÆÆ 
public
ØØ 
IActionResult
ØØ 
ForgotPassword
ØØ +
(
ØØ+ ,%
ForgotPasswordViewModel
ØØ, C%
forgotPasswordViewModel
ØØD [
)
ØØ[ \
{
∞∞ 	
if
±± 
(
±± %
CheckEmailAddressExists
±± '
(
±±' (%
forgotPasswordViewModel
±±( ?
.
±±? @
Email
±±@ E
)
±±E F
)
±±F G
{
≤≤ %
forgotPasswordViewModel
≥≥ '
.
≥≥' (
WebApplicationUrl
≥≥( 9
=
≥≥: ;
HttpContext
≥≥< G
.
≥≥G H
Request
≥≥H O
.
≥≥O P
Scheme
≥≥P V
+
≥≥W X
$str
≥≥Y ^
+
≥≥_ `
HttpContext
≥≥a l
.
≥≥l m
Request
≥≥m t
.
≥≥t u
Host
≥≥u y
.
≥≥y z
Value
≥≥z 
;≥≥ Ä
APIRepository
¥¥ 
objapi
¥¥ $
=
¥¥% &
new
¥¥' *
APIRepository
¥¥+ 8
(
¥¥8 9
_cofiguration
¥¥9 F
)
¥¥F G
;
¥¥G H!
HttpResponseMessage
µµ #
responseMessage
µµ$ 3
=
µµ4 5
objapi
µµ6 <
.
µµ< =
APICommunication
µµ= M
(
µµM N
APIURLHelper
µµN Z
.
µµZ [
ForgotPassword
µµ[ i
,
µµi j

HttpMethod
µµk u
.
µµu v
Post
µµv z
,
µµz {
stringµµ| Ç
.µµÇ É
EmptyµµÉ à
,µµà â
newµµä ç
StringContentµµé õ
(µµõ ú
JsonConvertµµú ß
.µµß ®
SerializeObjectµµ® ∑
(µµ∑ ∏'
forgotPasswordViewModelµµ∏ œ
)µµœ –
)µµ– —
)µµ— “
.µµ“ ”
Resultµµ” Ÿ
;µµŸ ⁄
if
∂∂ 
(
∂∂ 
responseMessage
∂∂ #
.
∂∂# $!
IsSuccessStatusCode
∂∂$ 7
)
∂∂7 8
{
∑∑ 
TempData
∏∏ 
[
∏∏ 

UserHelper
∏∏ '
.
∏∏' (
SuccessMessage
∏∏( 6
]
∏∏6 7
=
∏∏8 9
AppConstants
∏∏: F
.
∏∏F G/
!msgLinkToResetpasswordSentOnEmail
∏∏G h
;
∏∏h i
return
ππ 
View
ππ 
(
ππ  
$str
ππ  0
)
ππ0 1
;
ππ1 2
}
∫∫ 
else
ªª 
{
ºº 
TempData
ΩΩ 
[
ΩΩ 

UserHelper
ΩΩ '
.
ΩΩ' (
ErrorMessage
ΩΩ( 4
]
ΩΩ4 5
=
ΩΩ6 7
AppConstants
ΩΩ8 D
.
ΩΩD E
SomeErrorOccurred
ΩΩE V
;
ΩΩV W
}
ææ 
}
øø 
else
¿¿ 
{
¡¡ 
TempData
¬¬ 
[
¬¬ 

UserHelper
¬¬ #
.
¬¬# $
ErrorMessage
¬¬$ 0
]
¬¬0 1
=
¬¬2 3
AppConstants
¬¬4 @
.
¬¬@ A/
!msgEmailAddressNotExistIndatabase
¬¬A b
;
¬¬b c
return
√√ 
View
√√ 
(
√√ 
$str
√√ ,
)
√√, -
;
√√- .
}
ƒƒ 
return
≈≈ 
View
≈≈ 
(
≈≈ 
$str
≈≈ (
)
≈≈( )
;
≈≈) *
}
∆∆ 	
[
…… 	
	NonAction
……	 
]
…… 
public
   
bool
   %
CheckEmailAddressExists
   +
(
  + ,
string
  , 2
EmailAddress
  3 ?
)
  ? @
{
ÀÀ 	
bool
ÃÃ 

EmailExist
ÃÃ 
=
ÃÃ 
true
ÃÃ "
;
ÃÃ" #
try
ÕÕ 
{
ŒŒ 
APIRepository
œœ 
objapi
œœ $
=
œœ% &
new
œœ' *
(
œœ* +
_cofiguration
œœ+ 8
)
œœ8 9
;
œœ9 :!
HttpResponseMessage
–– #
responseMessage
––$ 3
=
––4 5
objapi
––6 <
.
––< =
APICommunication
––= M
(
––M N
APIURLHelper
––N Z
.
––Z [/
!Anonymous_CheckEmailAddressExists
––[ |
+
––} ~
$str–– Ç
+––É Ñ
EmailAddress––Ö ë
,––ë í

HttpMethod––ì ù
.––ù û
Get––û °
,––° ¢
string––£ ©
.––© ™
Empty––™ Ø
)––Ø ∞
.––∞ ±
Result––± ∑
;––∑ ∏
if
—— 
(
—— 
responseMessage
—— #
.
——# $!
IsSuccessStatusCode
——$ 7
)
——7 8
{
““ 
string
”” 
jsonResponse
”” '
=
””( )
responseMessage
””* 9
.
””9 :
Content
””: A
.
””A B
ReadAsStringAsync
””B S
(
””S T
)
””T U
.
””U V
Result
””V \
;
””\ ]

EmailExist
‘‘ 
=
‘‘  
JsonConvert
‘‘! ,
.
‘‘, -
DeserializeObject
‘‘- >
<
‘‘> ?
bool
‘‘? C
>
‘‘C D
(
‘‘D E
jsonResponse
‘‘E Q
)
‘‘Q R
;
‘‘R S
return
÷÷ 

EmailExist
÷÷ %
;
÷÷% &
}
◊◊ 
return
ÿÿ 

EmailExist
ÿÿ !
;
ÿÿ! "
}
ŸŸ 
catch
⁄⁄ 
(
⁄⁄ 
	Exception
⁄⁄ 
e
⁄⁄ 
)
⁄⁄ 
{
€€ 
_helper
‹‹ 
.
‹‹ 
LogExceptions
‹‹ %
(
‹‹% &
e
‹‹& '
)
‹‹' (
;
‹‹( )
throw
›› 
e
›› 
;
›› 
}
ﬁﬁ 
}
ﬂﬂ 	
public
·· 
IActionResult
·· 
ResetPassword
·· *
(
··* +
)
··+ ,
{
‚‚ 	
return
„„ 
View
„„ 
(
„„ 
)
„„ 
;
„„ 
}
‰‰ 	
[
ÁÁ 	
	NonAction
ÁÁ	 
]
ÁÁ 
public
ËË 
bool
ËË +
CheckResetPasswordTokenExists
ËË 1
(
ËË1 2
string
ËË2 8
token
ËË9 >
)
ËË> ?
{
ÈÈ 	
bool
ÍÍ 

TokenExist
ÍÍ 
=
ÍÍ 
false
ÍÍ #
;
ÍÍ# $
try
ÎÎ 
{
ÏÏ 
APIRepository
ÌÌ 
objapi
ÌÌ $
=
ÌÌ% &
new
ÌÌ' *
(
ÌÌ* +
_cofiguration
ÌÌ+ 8
)
ÌÌ8 9
;
ÌÌ9 :!
HttpResponseMessage
ÓÓ #
responseMessage
ÓÓ$ 3
=
ÓÓ4 5
objapi
ÓÓ6 <
.
ÓÓ< =
APICommunication
ÓÓ= M
(
ÓÓM N
APIURLHelper
ÓÓN Z
.
ÓÓZ [$
Anonymous_IsTokenValid
ÓÓ[ q
+
ÓÓr s
$str
ÓÓt w
+
ÓÓx y
token
ÓÓz 
,ÓÓ Ä

HttpMethodÓÓÅ ã
.ÓÓã å
GetÓÓå è
,ÓÓè ê
stringÓÓë ó
.ÓÓó ò
EmptyÓÓò ù
)ÓÓù û
.ÓÓû ü
ResultÓÓü •
;ÓÓ• ¶
if
ÔÔ 
(
ÔÔ 
responseMessage
ÔÔ #
.
ÔÔ# $!
IsSuccessStatusCode
ÔÔ$ 7
)
ÔÔ7 8
{
 
string
ÒÒ 
jsonResponse
ÒÒ '
=
ÒÒ( )
responseMessage
ÒÒ* 9
.
ÒÒ9 :
Content
ÒÒ: A
.
ÒÒA B
ReadAsStringAsync
ÒÒB S
(
ÒÒS T
)
ÒÒT U
.
ÒÒU V
Result
ÒÒV \
;
ÒÒ\ ]

TokenExist
ÚÚ 
=
ÚÚ  
JsonConvert
ÚÚ! ,
.
ÚÚ, -
DeserializeObject
ÚÚ- >
<
ÚÚ> ?
bool
ÚÚ? C
>
ÚÚC D
(
ÚÚD E
jsonResponse
ÚÚE Q
)
ÚÚQ R
;
ÚÚR S
return
ÙÙ 

TokenExist
ÙÙ %
;
ÙÙ% &
}
ıı 
return
ˆˆ 

TokenExist
ˆˆ !
;
ˆˆ! "
}
˜˜ 
catch
¯¯ 
(
¯¯ 
	Exception
¯¯ 
e
¯¯ 
)
¯¯ 
{
˘˘ 
_helper
˙˙ 
.
˙˙ 
LogExceptions
˙˙ %
(
˙˙% &
e
˙˙& '
)
˙˙' (
;
˙˙( )
throw
˚˚ 
e
˚˚ 
;
˚˚ 
}
¸¸ 
}
˝˝ 	
[
ˇˇ 	
HttpGet
ˇˇ	 
]
ˇˇ 
public
ÄÄ 
IActionResult
ÄÄ 
ResetPassword
ÄÄ *
(
ÄÄ* +
[
ÄÄ+ ,
	FromQuery
ÄÄ, 5
]
ÄÄ5 6
string
ÄÄ7 =
	userToken
ÄÄ> G
)
ÄÄG H
{
ÅÅ 	+
MasterUserResetPasswordEntity
ÇÇ )!
resetPasswordEntity
ÇÇ* =
=
ÇÇ> ?
new
ÇÇ@ C+
MasterUserResetPasswordEntity
ÇÇD a
(
ÇÇa b
)
ÇÇb c
;
ÇÇc d
try
ÉÉ 
{
ÑÑ 
if
ÖÖ 
(
ÖÖ +
CheckResetPasswordTokenExists
ÖÖ 1
(
ÖÖ1 2
	userToken
ÖÖ2 ;
)
ÖÖ; <
)
ÖÖ< =
{
ÜÜ 
string
áá 
strValue
áá #
=
áá$ %
HttpContext
áá& 1
.
áá1 2
Request
áá2 9
.
áá9 :
Query
áá: ?
[
áá? @
$str
áá@ K
]
ááK L
.
ááL M
ToString
ááM U
(
ááU V
)
ááV W
;
ááW X!
resetPasswordEntity
àà '
.
àà' (!
ForgotPasswordToken
àà( ;
=
àà< =
strValue
àà> F
;
ààF G
return
ää 
View
ää 
(
ää  
$str
ää  /
,
ää/ 0!
resetPasswordEntity
ää1 D
)
ääD E
;
ääE F
}
ãã 
else
åå 
{
çç 
return
éé 
RedirectToAction
éé +
(
éé+ ,
$str
éé, 3
)
éé3 4
;
éé4 5
}
èè 
}
êê 
catch
ëë 
(
ëë 
	Exception
ëë 
e
ëë 
)
ëë 
{
íí 
_helper
ìì 
.
ìì 
LogExceptions
ìì %
(
ìì% &
e
ìì& '
)
ìì' (
;
ìì( )
ViewBag
îî 
.
îî 
Message
îî 
=
îî  !
Convert
îî" )
.
îî) *
ToString
îî* 2
(
îî2 3
e
îî3 4
.
îî4 5

StackTrace
îî5 ?
)
îî? @
;
îî@ A
return
ïï 
View
ïï 
(
ïï 
)
ïï 
;
ïï 
}
ññ 
}
óó 	
[
ôô 	
HttpPost
ôô	 
]
ôô 
public
öö 
IActionResult
öö 
ResetPassword
öö *
(
öö* ++
MasterUserResetPasswordEntity
öö+ H%
masterUserresetpassword
ööI `
)
öö` a
{
õõ 	
try
úú 
{
ùù 
APIRepository
ûû 
objapi
ûû $
=
ûû% &
new
ûû' *
APIRepository
ûû+ 8
(
ûû8 9
_cofiguration
ûû9 F
)
ûûF G
;
ûûG H!
HttpResponseMessage
üü #
responseMessage
üü$ 3
=
üü4 5
objapi
üü6 <
.
üü< =
APICommunication
üü= M
(
üüM N
APIURLHelper
üüN Z
.
üüZ [
ResetPassword
üü[ h
,
üüh i

HttpMethod
üüj t
.
üüt u
Post
üüu y
,
üüy z
stringüü{ Å
.üüÅ Ç
EmptyüüÇ á
,üüá à
newüüâ å
StringContentüüç ö
(üüö õ
JsonConvertüüõ ¶
.üü¶ ß
SerializeObjectüüß ∂
(üü∂ ∑'
masterUserresetpasswordüü∑ Œ
)üüŒ œ
)üüœ –
)üü– —
.üü— “
Resultüü“ ÿ
;üüÿ Ÿ
string
†† 
jsonResponse
†† #
=
††$ %
responseMessage
††& 5
.
††5 6
Content
††6 =
.
††= >
ReadAsStringAsync
††> O
(
††O P
)
††P Q
.
††Q R
Result
††R X
;
††X Y
var
°° 
data
°° 
=
°° 
JsonConvert
°° &
.
°°& '
DeserializeObject
°°' 8
<
°°8 9
APIResponseEntity
°°9 J
<
°°J K
string
°°K Q
>
°°Q R
>
°°R S
(
°°S T
jsonResponse
°°T `
)
°°` a
;
°°a b
if
¢¢ 
(
¢¢ 
data
¢¢ 
.
¢¢ 
_object
¢¢  
==
¢¢! #
$str
¢¢$ 7
)
¢¢7 8
{
££ 
TempData
§§ 
[
§§ 

UserHelper
§§ '
.
§§' (
SuccessMessage
§§( 6
]
§§6 7
=
§§8 9
AppConstants
§§: F
.
§§F G*
msgPasswordResetSuccessfully
§§G c
;
§§c d
return
•• 
View
•• 
(
••  
$str
••  /
,
••/ 0%
masterUserresetpassword
••1 H
)
••H I
;
••I J
}
¶¶ 
else
ßß 
if
ßß 
(
ßß 
data
ßß 
.
ßß 
_object
ßß %
==
ßß& (
$str
ßß) 7
)
ßß7 8
{
®® 
TempData
©© 
[
©© 

UserHelper
©© '
.
©©' (
ErrorMessage
©©( 4
]
©©4 5
=
©©6 7
AppConstants
©©8 D
.
©©D E*
msgResetPasswordTokenExpired
©©E a
;
©©a b
return
™™ 
View
™™ 
(
™™  
$str
™™  /
,
™™/ 0%
masterUserresetpassword
™™1 H
)
™™H I
;
™™I J
}
´´ 
else
¨¨ 
{
≠≠ 
TempData
ÆÆ 
[
ÆÆ 

UserHelper
ÆÆ '
.
ÆÆ' (
ErrorMessage
ÆÆ( 4
]
ÆÆ4 5
=
ÆÆ6 7
AppConstants
ÆÆ8 D
.
ÆÆD E
msgInvalidLink
ÆÆE S
;
ÆÆS T
}
∞∞ 
return
±± 
View
±± 
(
±± 
$str
±± +
,
±±+ ,%
masterUserresetpassword
±±- D
)
±±D E
;
±±E F
}
≤≤ 
catch
≥≥ 
(
≥≥ 
	Exception
≥≥ 
e
≥≥ 
)
≥≥ 
{
¥¥ 
_helper
µµ 
.
µµ 
LogExceptions
µµ %
(
µµ% &
e
µµ& '
)
µµ' (
;
µµ( )
ViewBag
∂∂ 
.
∂∂ 
Message
∂∂ 
=
∂∂  !
Convert
∂∂" )
.
∂∂) *
ToString
∂∂* 2
(
∂∂2 3
e
∂∂3 4
.
∂∂4 5

StackTrace
∂∂5 ?
)
∂∂? @
;
∂∂@ A
return
∑∑ 
View
∑∑ 
(
∑∑ 
$str
∑∑ +
,
∑∑+ ,%
masterUserresetpassword
∑∑- D
)
∑∑D E
;
∑∑E F
}
∏∏ 
}
ππ 	
public
ªª 
IActionResult
ªª 
ProfileDetails
ªª +
(
ªª+ ,
)
ªª, -
{
ºº 	
return
ΩΩ 
View
ΩΩ 
(
ΩΩ 
)
ΩΩ 
;
ΩΩ 
}
ææ 	
[
øø 	
HttpGet
øø	 
]
øø 
public
¿¿ 
IActionResult
¿¿ 
ChangePassword
¿¿ +
(
¿¿+ ,
)
¿¿, -
{
¡¡ 	
return
√√ 
View
√√ 
(
√√ 
)
√√ 
;
√√ 
}
ƒƒ 	
[
«« 	
HttpPost
««	 
]
«« 
public
»» 
IActionResult
»» 
ChangePassword
»» +
(
»»+ ,!
ChangePasswordModel
»», ?
passwordModel
»»@ M
)
»»M N
{
…… 	
int
   
rolId
   
=
   
_helper
   
.
    
GetLoggedInRoleId
    1
(
  1 2
)
  2 3
;
  3 4
passwordModel
ÀÀ 
.
ÀÀ 
UserId
ÀÀ  
=
ÀÀ! "
rolId
ÀÀ# (
;
ÀÀ( )
try
ÕÕ 
{
ŒŒ 
HttpContext
œœ 
.
œœ 
Request
œœ #
.
œœ# $
Cookies
œœ$ +
.
œœ+ ,
TryGetValue
œœ, 7
(
œœ7 8

UserHelper
œœ8 B
.
œœB C
EltizamToken
œœC O
,
œœO P
out
œœQ T
string
œœU [
token
œœ\ a
)
œœa b
;
œœb c
APIRepository
–– 
objapi
–– $
=
––% &
new
––' *
(
––* +
_cofiguration
––+ 8
)
––8 9
;
––9 :!
HttpResponseMessage
““ #
responseMessage
““$ 3
=
““4 5
objapi
““6 <
.
““< =
APICommunication
““= M
(
““M N
APIURLHelper
““N Z
.
““Z [
ChangePassword
““[ i
,
““i j

HttpMethod
““k u
.
““u v
Post
““v z
,
““z {
token““| Å
,““Å Ç
new““É Ü
StringContent““á î
(““î ï
JsonConvert““ï †
.““† °
SerializeObject““° ∞
(““∞ ±
passwordModel““± æ
)““æ ø
)““ø ¿
)““¿ ¡
.““¡ ¬
Result““¬ »
;““» …
if
‘‘ 
(
‘‘ 
responseMessage
‘‘ #
.
‘‘# $!
IsSuccessStatusCode
‘‘$ 7
)
‘‘7 8
{
’’ 
string
÷÷ 
jsonResponse
÷÷ '
=
÷÷( )
responseMessage
÷÷* 9
.
÷÷9 :
Content
÷÷: A
.
÷÷A B
ReadAsStringAsync
÷÷B S
(
÷÷S T
)
÷÷T U
.
÷÷U V
Result
÷÷V \
;
÷÷\ ]
TempData
◊◊ 
[
◊◊ 

UserHelper
◊◊ '
.
◊◊' (
SuccessMessage
◊◊( 6
]
◊◊6 7
=
◊◊8 9
AppConstants
◊◊: F
.
◊◊F G
ActionSuccess
◊◊G T
;
◊◊T U
return
ÿÿ 
RedirectToAction
ÿÿ +
(
ÿÿ+ ,
nameof
ÿÿ, 2
(
ÿÿ2 3
Login
ÿÿ3 8
)
ÿÿ8 9
)
ÿÿ9 :
;
ÿÿ: ;
}
ŸŸ 
else
⁄⁄ 
{
€€ 
TempData
‹‹ 
[
‹‹ 

UserHelper
‹‹ '
.
‹‹' (
ErrorMessage
‹‹( 4
]
‹‹4 5
=
‹‹6 7
Convert
‹‹8 ?
.
‹‹? @
ToString
‹‹@ H
(
‹‹H I
responseMessage
‹‹I X
.
‹‹X Y
Content
‹‹Y `
.
‹‹` a
ReadAsStringAsync
‹‹a r
(
‹‹r s
)
‹‹s t
.
‹‹t u
Result
‹‹u {
)
‹‹{ |
;
‹‹| }
}
›› 
}
ﬁﬁ 
catch
ﬂﬂ 
(
ﬂﬂ 
	Exception
ﬂﬂ 
e
ﬂﬂ 
)
ﬂﬂ 
{
‡‡ 
_helper
·· 
.
·· 
LogExceptions
·· %
(
··% &
e
··& '
)
··' (
;
··( )
TempData
‚‚ 
[
‚‚ 

UserHelper
‚‚ #
.
‚‚# $
ErrorMessage
‚‚$ 0
]
‚‚0 1
=
‚‚2 3
Convert
‚‚4 ;
.
‚‚; <
ToString
‚‚< D
(
‚‚D E
e
‚‚E F
.
‚‚F G

StackTrace
‚‚G Q
)
‚‚Q R
;
‚‚R S
}
„„ 
return
‰‰ 
View
‰‰ 
(
‰‰ 
)
‰‰ 
;
‰‰ 
}
ÂÂ 	
}
ÊÊ 
}ÁÁ ¿O
<D:\EltizamLive\Eltizam.Web\Controllers\AuditLogController.cs
	namespace 	
EltizamValuation
 
. 
Web 
. 
Controllers *
{ 
public 

class 
AuditLogController #
:$ %
BaseController& 4
{ 
private 
readonly 
IConfiguration '
_cofiguration( 5
;5 6
private 
readonly 
IStringLocalizer )
<) *
Shared* 0
>0 1"
_stringLocalizerShared2 H
;H I
private 
readonly 
IHelper  
_helper! (
;( )
public 
AuditLogController !
(! "
IConfiguration" 0
configuration1 >
,> ?
IStringLocalizer@ P
<P Q
SharedQ W
>W X!
stringLocalizerSharedY n
,n o
IHelperp w
helperx ~
)~ 
{ 	
_cofiguration 
= 
configuration )
;) *"
_stringLocalizerShared "
=# $!
stringLocalizerShared% :
;: ;
_helper 
= 
helper 
; 
} 	
public   
IActionResult   
Logs   !
(  ! "
)  " #
{!! 	

ModelState"" 
."" 
Clear"" 
("" 
)"" 
;"" 
try## 
{$$ 
int&& 
roleId&& 
=&& 
_helper&& $
.&&$ %
GetLoggedInRoleId&&% 6
(&&6 7
)&&7 8
;&&8 9
if'' 
('' 
!'' 
CheckRoleAccess'' $
(''$ % 
ModulePermissionEnum''% 9
.''9 :
AuditLog'': B
,''B C
PermissionEnum''D R
.''R S
View''S W
,''W X
roleId''Y _
)''_ `
)''` a
return(( 
RedirectToAction(( +
(((+ ,
AppConstants((, 8
.((8 9
AccessRestriction((9 J
,((J K
AppConstants((L X
.((X Y
Home((Y ]
)((] ^
;((^ _
return** 
View** 
(** 
)** 
;** 
},, 
catch-- 
(-- 
	Exception-- 
e-- 
)-- 
{.. 
_helper// 
.// 
LogExceptions// %
(//% &
e//& '
)//' (
;//( )
TempData00 
[00 

UserHelper00 #
.00# $
ErrorMessage00$ 0
]000 1
=002 3
Convert004 ;
.00; <
ToString00< D
(00D E
e00E F
.00F G

StackTrace00G Q
)00Q R
;00R S
return22 
View22 
(22 
$str22 #
)22# $
;22$ %
}33 
}44 	
[66 	
HttpGet66	 
]66 
public77 
IActionResult77 
AuditLogDetails77 ,
(77, -
string77- 3
	TableName774 =
,77= >
int77? B
?77B C
Id77D F
=77G H
null77I M
,77M N
int77O R
?77R S
TableKey77T \
=77] ^
null77_ c
,77c d
DateTime77e m
?77m n
DateFrom77o w
=77x y
null77z ~
,77~ 
DateTime
77Ä à
?
77à â
DateTo
77ä ê
=
77ë í
null
77ì ó
)
77ó ò
{88 	
try99 
{:: 
int<< 
roleId<< 
=<< 
_helper<< $
.<<$ %
GetLoggedInRoleId<<% 6
(<<6 7
)<<7 8
;<<8 9
if== 
(== 
!== 
CheckRoleAccess== $
(==$ % 
ModulePermissionEnum==% 9
.==9 :
AuditLog==: B
,==B C
PermissionEnum==D R
.==R S
View==S W
,==W X
roleId==Y _
)==_ `
)==` a
return>> 
RedirectToAction>> +
(>>+ ,
AppConstants>>, 8
.>>8 9
AccessRestriction>>9 J
,>>J K
AppConstants>>L X
.>>X Y
Home>>Y ]
)>>] ^
;>>^ _
HttpContextAA 
.AA 
RequestAA #
.AA# $
CookiesAA$ +
.AA+ ,
TryGetValueAA, 7
(AA7 8

UserHelperAA8 B
.AAB C
EltizamTokenAAC O
,AAO P
outAAQ T
stringAAU [
tokenAA\ a
)AAa b
;AAb c
varCC 
urlCC 
=CC 
stringCC  
.CC  !
FormatCC! '
(CC' (
$strCC( h
,CCh i
APIURLHelperDD( 4
.DD4 5
GetDetailsAuditDD5 D
,DDD E
	TableNameDDF O
,DDO P
IdDDQ S
,DDS T
TableKeyDDU ]
,DD] ^
DateFromDD_ g
,DDg h
DateToDDi o
)DDo p
;DDp q
APIRepositoryFF 
objapiFF $
=FF% &
newFF' *
(FF* +
_cofigurationFF+ 8
)FF8 9
;FF9 :
HttpResponseMessageGG #
responseMessageGG$ 3
=GG4 5
objapiGG6 <
.GG< =
APICommunicationGG= M
(GGM N
urlGGN Q
,GGQ R

HttpMethodGGS ]
.GG] ^
GetGG^ a
,GGa b
tokenGGc h
)GGh i
.GGi j
ResultGGj p
;GGp q
ifHH 
(HH 
responseMessageHH #
.HH# $
IsSuccessStatusCodeHH$ 7
)HH7 8
{II 
stringJJ 
jsonResponseJJ '
=JJ( )
responseMessageJJ* 9
.JJ9 :
ContentJJ: A
.JJA B
ReadAsStringAsyncJJB S
(JJS T
)JJT U
.JJU V
ResultJJV \
;JJ\ ]
	AuditDataKK 

rootObjectKK (
=KK) *
JsonConvertKK+ 6
.KK6 7
DeserializeObjectKK7 H
<KKH I
	AuditDataKKI R
>KKR S
(KKS T
jsonResponseKKT `
)KK` a
;KKa b
returnNN 
ViewNN 
(NN  

rootObjectNN  *
)NN* +
;NN+ ,
}OO 
returnPP 
ViewPP 
(PP 
)PP 
;PP 
}QQ 
catchRR 
(RR 
	ExceptionRR 
eRR 
)RR 
{SS 
_helperTT 
.TT 
LogExceptionsTT %
(TT% &
eTT& '
)TT' (
;TT( )
TempDataUU 
[UU 

UserHelperUU #
.UU# $
ErrorMessageUU$ 0
]UU0 1
=UU2 3
ConvertUU4 ;
.UU; <
ToStringUU< D
(UUD E
eUUE F
.UUF G

StackTraceUUG Q
)UUQ R
;UUR S
returnWW 
ViewWW 
(WW 
$strWW #
)WW# $
;WW$ %
}XX 
}YY 	
public[[ 
IActionResult[[ 
AuditLogDetailList[[ /
([[/ 0
string[[0 6
	TableName[[7 @
,[[@ A
int[[B E
?[[E F
Id[[G I
=[[J K
null[[L P
,[[P Q
int[[R U
?[[U V
TableKey[[W _
=[[` a
null[[b f
,[[f g
DateTime[[h p
?[[p q
DateFrom[[r z
=[[{ |
null	[[} Å
,
[[Å Ç
DateTime
[[É ã
?
[[ã å
DateTo
[[ç ì
=
[[î ï
null
[[ñ ö
)
[[ö õ
{\\ 	

ModelState]] 
.]] 
Clear]] 
(]] 
)]] 
;]] 
try^^ 
{__ 
intaa 
roleIdaa 
=aa 
_helperaa $
.aa$ %
GetLoggedInRoleIdaa% 6
(aa6 7
)aa7 8
;aa8 9
ifbb 
(bb 
!bb 
CheckRoleAccessbb $
(bb$ % 
ModulePermissionEnumbb% 9
.bb9 :
AuditLogbb: B
,bbB C
PermissionEnumbbD R
.bbR S
ViewbbS W
,bbW X
roleIdbbY _
)bb_ `
)bb` a
returncc 
RedirectToActioncc +
(cc+ ,
AppConstantscc, 8
.cc8 9
AccessRestrictioncc9 J
,ccJ K
AppConstantsccL X
.ccX Y
HomeccY ]
)cc] ^
;cc^ _!
AuditLogDetailsFilterff %
filterff& ,
=ff- .
newff/ 2!
AuditLogDetailsFilterff3 H
(ffH I
)ffI J
;ffJ K
filtergg 
.gg 
	TableNamegg  
=gg! "
	TableNamegg# ,
;gg, -
filterhh 
.hh 
Idhh 
=hh 
Idhh 
;hh 
filterii 
.ii 
TableKeyii 
=ii  !
TableKeyii" *
;ii* +
filterjj 
.jj 
DateFromjj 
=jj  !
DateFromjj" *
;jj* +
filterkk 
.kk 
DateTokk 
=kk 
DateTokk  &
;kk& '
ViewBagll 
.ll 
Filterll 
=ll  
filterll! '
;ll' (
returnmm 
Viewmm 
(mm 
$strmm -
)mm- .
;mm. /
}nn 
catchoo 
(oo 
	Exceptionoo 
eoo 
)oo 
{pp 
_helperqq 
.qq 
LogExceptionsqq %
(qq% &
eqq& '
)qq' (
;qq( )
TempDatarr 
[rr 

UserHelperrr #
.rr# $
ErrorMessagerr$ 0
]rr0 1
=rr2 3
Convertrr4 ;
.rr; <
ToStringrr< D
(rrD E
errE F
.rrF G

StackTracerrG Q
)rrQ R
;rrR S
returntt 
Viewtt 
(tt 
$strtt #
)tt# $
;tt$ %
}uu 
}vv 	
}ww 
}xx ®8
8D:\EltizamLive\Eltizam.Web\Controllers\BaseController.cs
	namespace 	
Eltizam
 
. 
Web 
. 
Controllers !
{ 
[ $
CustomAuthorizeAttribute 
] 
public 

class 
BaseController 
:  !

Controller" ,
{ 
public 
void 

FooterInfo 
( 
TableNameEnum ,
enumT- 2
,2 3
IConfiguration4 B
_cofigurationC P
,P Q
intR U
?U V
idW Y
,Y Z
bool[ _
?_ `
isViewa g
=h i
falsej o
)o p
{ 	
ViewBag 
. 
PageViewMode  
=! "
isView# )
==* ,
true- 1
?2 3
$num4 5
:6 7
$num8 9
;9 :
if 
( 
id 
== 
null 
|| 
id  
==! #
$num$ %
)% &
return 
; 
HttpContext 
. 
Request 
.  
Cookies  '
.' (
TryGetValue( 3
(3 4

UserHelper4 >
.> ?
EltizamToken? K
,K L
outM P
stringQ W
tokenX ]
)] ^
;^ _
APIRepository 
objapi  
=! "
new# &
(& '
_cofiguration' 4
)4 5
;5 6
var"" 
url"" 
="" 
string"" 
."" 
Format"" #
(""# $
$str""$ 1
,""1 2
APIURLHelper""3 ?
.""? @ 
GetGlobalAuditFields""@ T
,""T U
id""V X
,""X Y
Enum""Z ^
.""^ _
GetName""_ f
(""f g
enumT""g l
)""l m
)""m n
;""n o
var## 
	footerRes## 
=## 
objapi## "
.##" #
APICommunication### 3
(##3 4
url##4 7
,##7 8

HttpMethod##9 C
.##C D
Get##D G
,##G H
token##I N
)##N O
.##O P
Result##P V
;##V W
if$$ 
($$ 
	footerRes$$ 
.$$ 
IsSuccessStatusCode$$ -
)$$- .
{%% 
string&& 
json&& 
=&& 
	footerRes&& '
.&&' (
Content&&( /
.&&/ 0
ReadAsStringAsync&&0 A
(&&A B
)&&B C
.&&C D
Result&&D J
;&&J K
ViewBag'' 
.'' 

FooterInfo'' "
=''# $
JsonConvert''% 0
.''0 1
DeserializeObject''1 B
<''B C
GlobalAuditFields''C T
>''T U
(''U V
json''V Z
)''Z [
;''[ \
}(( 
})) 	
public22 
bool22 
CheckRoleAccess22 #
(22# $ 
ModulePermissionEnum22$ 8
enumP229 >
,22> ?
PermissionEnum22@ N
perEnum22O V
,22V W
int22X [
roleId22\ b
,22b c
SubModuleEnum22d q
enumSM22r x
=22y z
$num22{ |
)22| }
{33 	
var44 
	hasAccess44 
=44 
false44 !
;44! "
bool55 
view55 
=55 
perEnum55 
==55  "
PermissionEnum55# 1
.551 2
View552 6
;556 7
bool66 
add66 
=66 
perEnum66 
==66 !
PermissionEnum66" 0
.660 1
Add661 4
;664 5
bool77 
edit77 
=77 
perEnum77 
==77  "
PermissionEnum77# 1
.771 2
Edit772 6
;776 7
bool88 
assign88 
=88 
perEnum88 !
==88" $
PermissionEnum88% 3
.883 4
Approve884 ;
;88; <
RolePermissionModel:: 
?::  
objPermssion::! -
=::. /
UtilityHelper::0 =
.::= >
GetCntrActionAccess::> Q
(::Q R
(::R S
int::S V
)::V W
enumP::W \
,::\ ]
roleId::^ d
,::d e
(::f g
int::g j
)::j k
enumSM::k q
)::q r
;::r s
if<< 
(<< 
objPermssion<< 
!=<< 
null<<  $
)<<$ %
{== 
if>> 
(>> 
objPermssion>>  
.>>  !
View>>! %
&&>>& (
view>>) -
)>>- .
{?? 
	hasAccess@@ 
=@@ 
true@@  $
;@@$ %
}AA 
elseBB 
ifBB 
(BB 
objPermssionBB %
.BB% &
AddBB& )
&&BB* ,
addBB- 0
)BB0 1
{CC 
	hasAccessDD 
=DD 
trueDD  $
;DD$ %
}EE 
elseFF 
ifFF 
(FF 
objPermssionFF %
.FF% &
EditFF& *
&&FF+ -
editFF. 2
)FF2 3
{GG 
	hasAccessHH 
=HH 
trueHH  $
;HH$ %
}II 
elseJJ 
ifJJ 
(JJ 
objPermssionJJ %
.JJ% &
ApproveJJ& -
&&JJ. 0
assignJJ1 7
)JJ7 8
{KK 
	hasAccessLL 
=LL 
trueLL  $
;LL$ %
}MM 
elseNN 
{OO 
	hasAccessPP 
=PP 
falsePP  %
;PP% &
}QQ 
}RR 
ViewBagTT 
.TT 
AccessTT 
=TT 
objPermssionTT )
;TT) *
returnUU 
	hasAccessUU 
;UU 
}VV 	
public__ 
RolePermissionModel__ "#
GetRoleAccessValuations__# :
(__: ; 
ModulePermissionEnum__; O
enumP__P U
,__U V
int__W Z
roleId__[ a
,__a b
SubModuleEnum__c p
enumSM__q w
=__x y
$num__z {
)__{ |
{`` 	
varaa 
objPermssionaa 
=aa 
UtilityHelperaa ,
.aa, -
GetCntrActionAccessaa- @
(aa@ A
(aaA B
intaaB E
)aaE F
enumPaaF K
,aaK L
roleIdaaM S
,aaS T
(aaU V
intaaV Y
)aaY Z
enumSMaaZ `
)aa` a
;aaa b
returnbb 
objPermssionbb 
;bb  
}cc 	
publicll 
boolll +
CheckRoleValuationRequestAccessll 3
(ll3 4
intll4 7
roleIdll8 >
,ll> ?
intll@ C
?llC D
valrefIdllE M
)llM N
{mm 	
varnn 
	hasAccessnn 
=nn 
falsenn !
;nn! "
returnoo 
	hasAccessoo 
;oo 
}pp 	
}qq 
}rr „
=D:\EltizamLive\Eltizam.Web\Controllers\DashboardController.cs
	namespace 	
EltizamValuation
 
. 
Web 
. 
Controllers *
{ 
public 

class 
DashboardController $
:% &
BaseController' 5
{		 
private

 
readonly

 
IHelper

  
_helper

! (
;

( )
public 
DashboardController "
(" #
IHelper# *
helper+ 1
)1 2
{ 	
_helper 
= 
helper 
; 
} 	
public 
IActionResult 
	Dashboard &
(& '
)' (
{ 	
return 
View 
( 
) 
; 
} 	
[ 	
HttpGet	 
] 
public 
IActionResult 
DashboardExt )
() *
[* +
	FromQuery+ 4
]4 5
string6 <
Module= C
)C D
{ 	
int 
roleId 
= 
_helper  
.  !
GetLoggedInRoleId! 2
(2 3
)3 4
;4 5
ViewBag 
. 

ModuleName 
=  
Module! '
;' (
ViewBag 
. 
RoleId 
= 
roleId #
;# $
return 
View 
( 
) 
; 
} 	
} 
} •
8D:\EltizamLive\Eltizam.Web\Controllers\HomeController.cs
	namespace 	
Eltizam
 
. 
Web 
. 
Controllers !
{ 
public 

class 
HomeController 
:  !

Controller" ,
{ 
public		 
IActionResult		 
Index		 "
(		" #
)		# $
{

 	
return 
View 
( 
) 
; 
} 	
[ 	
ResponseCache	 
( 
Duration 
=  !
$num" #
,# $
Location% -
=. /!
ResponseCacheLocation0 E
.E F
NoneF J
,J K
NoStoreL S
=T U
trueV Z
)Z [
][ \
public 
IActionResult 
Error "
(" #
)# $
{ 	
return 
View 
( 
new 
ErrorViewModel *
{+ ,
	RequestId- 6
=7 8
Activity9 A
.A B
CurrentB I
?I J
.J K
IdK M
??N P
HttpContextQ \
.\ ]
TraceIdentifier] l
}m n
)n o
;o p
} 	
public 
IActionResult 
AccessRestriction .
(. /
)/ 0
{ 	
return 
View 
( 
) 
; 
} 	
public 
IActionResult 
InternalServerError 0
(0 1
)1 2
{ 	
return 
View 
( 
) 
; 
} 	
} 
} Óã
GD:\EltizamLive\Eltizam.Web\Controllers\MasterApproverLevelController.cs
	namespace 	
EltizamValuation
 
. 
Web 
. 
Controllers *
{ 
public 

class )
MasterApproverLevelController .
:/ 0
BaseController1 ?
{ 
private 
readonly 
IConfiguration '
_cofiguration( 5
;5 6
private 
readonly 
IStringLocalizer )
<) *
Shared* 0
>0 1"
_stringLocalizerShared2 H
;H I
private 
readonly 
IHelper  
_helper! (
;( )
public )
MasterApproverLevelController ,
(, -
IConfiguration- ;
configuration< I
,I J
IStringLocalizerK [
<[ \
Shared\ b
>b c!
stringLocalizerSharedd y
,y z
IHelper	{ Ç
helper
É â
)
â ä
{ 	
_cofiguration 
= 
configuration )
;) *"
_stringLocalizerShared "
=# $!
stringLocalizerShared% :
;: ;
_helper 
= 
helper 
; 
} 	
[ 	
HttpGet	 
] 
[   	
Route  	 
(   
$str   3
)  3 4
]  4 5
public!! 
IActionResult!! 
ApproverLevels!! +
(!!+ ,
)!!, -
{"" 	
int%% 
roleId%% 
=%% 
_helper%%  
.%%  !
GetLoggedInRoleId%%! 2
(%%2 3
)%%3 4
;%%4 5
if&& 
(&& 
!&& 
CheckRoleAccess&&  
(&&  ! 
ModulePermissionEnum&&! 5
.&&5 6
ApproverMaster&&6 D
,&&D E
PermissionEnum&&F T
.&&T U
View&&U Y
,&&Y Z
roleId&&[ a
)&&a b
)&&b c
return'' 
RedirectToAction'' '
(''' (
AppConstants''( 4
.''4 5
AccessRestriction''5 F
,''F G
AppConstants''H T
.''T U
Home''U Y
)''Y Z
;''Z [
return(( 
View(( 
((( 
)(( 
;(( 
})) 	
[++ 	
HttpPost++	 
]++ 
[,, 	
Route,,	 
(,, 
$str,, >
),,> ?
],,? @
public-- 
IActionResult-- %
MasterApproverLevelManage-- 6
(--6 7
int--7 :
id--; =
,--= >$
MasterApproverLevelModel--? W
masterapproverlevel--X k
)--k l
{.. 	
try// 
{00 
var22 
action22 
=22 
masterapproverlevel22 0
.220 1
Id221 3
==224 6
$num227 8
?229 :
PermissionEnum22; I
.22I J
Add22J M
:22N O
PermissionEnum22P ^
.22^ _
Edit22_ c
;22c d
int44 
roleId44 
=44 
_helper44 $
.44$ %
GetLoggedInRoleId44% 6
(446 7
)447 8
;448 9
if55 
(55 
!55 
CheckRoleAccess55 $
(55$ % 
ModulePermissionEnum55% 9
.559 :
ApproverMaster55: H
,55H I
action55J P
,55P Q
roleId55R X
)55X Y
)55Y Z
return66 
RedirectToAction66 +
(66+ ,
AppConstants66, 8
.668 9
AccessRestriction669 J
,66J K
AppConstants66L X
.66X Y
Home66Y ]
)66] ^
;66^ _
if99 
(99 
masterapproverlevel99 '
.99' (
Id99( *
==99+ -
$num99. /
)99/ 0
masterapproverlevel:: '
.::' (
	CreatedBy::( 1
=::2 3
_helper::4 ;
.::; <
GetLoggedInUserId::< M
(::M N
)::N O
;::O P
masterapproverlevel;; #
.;;# $

ModifiedBy;;$ .
=;;/ 0
_helper;;1 8
.;;8 9
GetLoggedInUserId;;9 J
(;;J K
);;K L
;;;L M
HttpContext== 
.== 
Request== #
.==# $
Cookies==$ +
.==+ ,
TryGetValue==, 7
(==7 8

UserHelper==8 B
.==B C
EltizamToken==C O
,==O P
out==Q T
string==U [
token==\ a
)==a b
;==b c
APIRepository>> 
objapi>> $
=>>% &
new>>' *
(>>* +
_cofiguration>>+ 8
)>>8 9
;>>9 :
HttpResponseMessage@@ #
responseMessage@@$ 3
=@@4 5
objapi@@6 <
.@@< =
APICommunication@@= M
(@@M N
APIURLHelper@@N Z
.@@Z [%
UpsertMasterApproverLevel@@[ t
,@@t u

HttpMethod	@@v Ä
.
@@Ä Å
Post
@@Å Ö
,
@@Ö Ü
token
@@á å
,
@@å ç
new
@@é ë
StringContent
@@í ü
(
@@ü †
JsonConvert
@@† ´
.
@@´ ¨
SerializeObject
@@¨ ª
(
@@ª º!
masterapproverlevel
@@º œ
)
@@œ –
)
@@– —
)
@@— “
.
@@“ ”
Result
@@” Ÿ
;
@@Ÿ ⁄
ifBB 
(BB 
responseMessageBB #
.BB# $
IsSuccessStatusCodeBB$ 7
)BB7 8
{CC 
ifDD 
(DD 
responseMessageDD '
.DD' (
IsSuccessStatusCodeDD( ;
&&DD< >
masterapproverlevelDD? R
.DDR S
IdDDS U
==DDV X
$numDDY Z
)DDZ [
{EE 
stringFF 
jsonResponseFF +
=FF, -
responseMessageFF. =
.FF= >
ContentFF> E
.FFE F
ReadAsStringAsyncFFF W
(FFW X
)FFX Y
.FFY Z
ResultFFZ `
;FF` a
TempDataGG  
[GG  !

UserHelperGG! +
.GG+ ,
SuccessMessageGG, :
]GG: ;
=GG< =
ConvertGG> E
.GGE F
ToStringGGF N
(GGN O"
_stringLocalizerSharedGGO e
[GGe f
$strGGf z
]GGz {
)GG{ |
;GG| }
returnHH 
RedirectToActionHH /
(HH/ 0
$strHH0 @
)HH@ A
;HHA B
}JJ 
ifKK 
(KK 
responseMessageKK '
.KK' (
IsSuccessStatusCodeKK( ;
)KK; <
{LL 
stringMM 
jsonResponseMM +
=MM, -
responseMessageMM. =
.MM= >
ContentMM> E
.MME F
ReadAsStringAsyncMMF W
(MMW X
)MMX Y
.MMY Z
ResultMMZ `
;MM` a
TempDataNN  
[NN  !

UserHelperNN! +
.NN+ ,
SuccessMessageNN, :
]NN: ;
=NN< =
ConvertNN> E
.NNE F
ToStringNNF N
(NNN O"
_stringLocalizerSharedNNO e
[NNe f
$strNNf z
]NNz {
)NN{ |
;NN| }
returnOO 
RedirectOO '
(OO' (
$"OO( *
$strOO* Q
{OOQ R
masterapproverlevelOOR e
.OOe f
IdOOf h
}OOh i
"OOi j
)OOj k
;OOk l
}QQ 
elseRR 
{SS 
TempDataTT  
[TT  !

UserHelperTT! +
.TT+ ,
ErrorMessageTT, 8
]TT8 9
=TT: ;
ConvertTT< C
.TTC D
ToStringTTD L
(TTL M
responseMessageTTM \
.TT\ ]
ContentTT] d
.TTd e
ReadAsStringAsyncTTe v
(TTv w
)TTw x
.TTx y
ResultTTy 
)	TT Ä
;
TTÄ Å
returnUU 
RedirectToActionUU /
(UU/ 0
$strUU0 @
)UU@ A
;UUA B
}VV 
}WW 
returnXX 
RedirectToActionXX '
(XX' (
$strXX( 8
)XX8 9
;XX9 :
}YY 
catch[[ 
([[ 
	Exception[[ 
e[[ 
)[[ 
{\\ 
_helper]] 
.]] 
LogExceptions]] %
(]]% &
e]]& '
)]]' (
;]]( )
TempData^^ 
[^^ 

UserHelper^^ #
.^^# $
SuccessMessage^^$ 2
]^^2 3
=^^4 5
Convert^^6 =
.^^= >
ToString^^> F
(^^F G"
_stringLocalizerShared^^G ]
[^^] ^
$str^^^ r
]^^r s
)^^s t
;^^t u

ModelState__ 
.__ 
Clear__  
(__  !
)__! "
;__" #
return`` 
RedirectToAction`` '
(``' (
$str``( 8
)``8 9
;``9 :
}aa 
}bb 	
[dd 	
HttpGetdd	 
]dd 
publicee 
IActionResultee %
MasterApproverLevelManageee 6
(ee6 7
intee7 :
?ee: ;
idee< >
)ee> ?
{ff 	
varhh 
actionhh 
=hh 
idhh 
==hh 
nullhh #
?hh$ %
PermissionEnumhh& 4
.hh4 5
Addhh5 8
:hh9 :
PermissionEnumhh; I
.hhI J
EdithhJ N
;hhN O
intii 
roleIdii 
=ii 
_helperii  
.ii  !
GetLoggedInRoleIdii! 2
(ii2 3
)ii3 4
;ii4 5
ifkk 
(kk 
!kk 
CheckRoleAccesskk  
(kk  ! 
ModulePermissionEnumkk! 5
.kk5 6
ApproverMasterkk6 D
,kkD E
actionkkF L
,kkL M
roleIdkkN T
)kkT U
)kkU V
returnll 
RedirectToActionll '
(ll' (
AppConstantsll( 4
.ll4 5
AccessRestrictionll5 F
,llF G
AppConstantsllH T
.llT U
HomellU Y
)llY Z
;llZ [
ifmm 
(mm 
idmm 
!=mm 
nullmm 
)mm 
{nn 
ViewDataoo 
[oo 
$stroo !
]oo! "
=oo# $
trueoo% )
;oo) *
}pp $
MasterApproverLevelModelrr $
masterapproverlevelrr% 8
;rr8 9
ifss 
(ss 
idss 
==ss 
nullss 
||ss 
idss  
<=ss! #
$numss$ %
)ss% &
{tt 
masterapproverleveluu #
=uu$ %
newuu& )$
MasterApproverLevelModeluu* B
(uuB C
)uuC D
;uuD E
returnvv 
Viewvv 
(vv 
masterapproverlevelvv /
)vv/ 0
;vv0 1
}ww 
elsexx 
{yy 
HttpContextzz 
.zz 
Requestzz #
.zz# $
Cookieszz$ +
.zz+ ,
TryGetValuezz, 7
(zz7 8

UserHelperzz8 B
.zzB C
EltizamTokenzzC O
,zzO P
outzzQ T
stringzzU [
tokenzz\ a
)zza b
;zzb c
APIRepository{{ 
objapi{{ $
={{% &
new{{' *
({{* +
_cofiguration{{+ 8
){{8 9
;{{9 :
HttpResponseMessage}} #
responseMessage}}$ 3
=}}4 5
objapi}}6 <
.}}< =
APICommunication}}= M
(}}M N
APIURLHelper}}N Z
.}}Z [&
GetMasterApproverLevelById}}[ u
+}}v w
$str}}x {
+}}| }
id	}}~ Ä
,
}}Ä Å

HttpMethod
}}Ç å
.
}}å ç
Get
}}ç ê
,
}}ê ë
token
}}í ó
)
}}ó ò
.
}}ò ô
Result
}}ô ü
;
}}ü †
if 
( 
responseMessage #
.# $
IsSuccessStatusCode$ 7
)7 8
{
ÄÄ 
string
ÅÅ 
jsonResponse
ÅÅ '
=
ÅÅ( )
responseMessage
ÅÅ* 9
.
ÅÅ9 :
Content
ÅÅ: A
.
ÅÅA B
ReadAsStringAsync
ÅÅB S
(
ÅÅS T
)
ÅÅT U
.
ÅÅU V
Result
ÅÅV \
;
ÅÅ\ ]
var
ÇÇ 
data
ÇÇ 
=
ÇÇ 
JsonConvert
ÇÇ *
.
ÇÇ* +
DeserializeObject
ÇÇ+ <
<
ÇÇ< =
APIResponseEntity
ÇÇ= N
<
ÇÇN O&
MasterApproverLevelModel
ÇÇO g
>
ÇÇg h
>
ÇÇh i
(
ÇÇi j
jsonResponse
ÇÇj v
)
ÇÇv w
;
ÇÇw x

FooterInfo
ÖÖ 
(
ÖÖ 
TableNameEnum
ÖÖ ,
.
ÖÖ, -!
Master_PropertyType
ÖÖ- @
,
ÖÖ@ A
_cofiguration
ÖÖB O
,
ÖÖO P
id
ÖÖQ S
)
ÖÖS T
;
ÖÖT U
if
áá 
(
áá 
data
áá 
.
áá 
_object
áá $
is
áá% '
null
áá( ,
)
áá, -
return
àà 
NotFound
àà '
(
àà' (
)
àà( )
;
àà) *
return
ää 
View
ää 
(
ää  
$str
ää  ;
,
ää; <
data
ää= A
.
ääA B
_object
ääB I
)
ääI J
;
ääJ K
}
ãã 
return
åå 
NotFound
åå 
(
åå  
)
åå  !
;
åå! "
}
çç 
}
éé 	
[
èè 	
HttpGet
èè	 
]
èè 
public
êê 
IActionResult
êê '
MasterApproverLevelDetail
êê 6
(
êê6 7
int
êê7 :
?
êê: ;
id
êê< >
)
êê> ?
{
ëë 	
var
îî 
action
îî 
=
îî 
PermissionEnum
îî '
.
îî' (
View
îî( ,
;
îî, -
int
ññ 
roleId
ññ 
=
ññ 
_helper
ññ  
.
ññ  !
GetLoggedInRoleId
ññ! 2
(
ññ2 3
)
ññ3 4
;
ññ4 5
if
óó 
(
óó 
!
óó 
CheckRoleAccess
óó  
(
óó  !"
ModulePermissionEnum
óó! 5
.
óó5 6
ApproverMaster
óó6 D
,
óóD E
action
óóF L
,
óóL M
roleId
óóN T
)
óóT U
)
óóU V
return
òò 
RedirectToAction
òò '
(
òò' (
AppConstants
òò( 4
.
òò4 5
AccessRestriction
òò5 F
,
òòF G
AppConstants
òòH T
.
òòT U
Home
òòU Y
)
òòY Z
;
òòZ [&
MasterApproverLevelModel
öö $!
masterapproverlevel
öö% 8
;
öö8 9
if
õõ 
(
õõ 
id
õõ 
==
õõ 
null
õõ 
||
õõ 
id
õõ  
<=
õõ! #
$num
õõ$ %
)
õõ% &
{
úú !
masterapproverlevel
ùù #
=
ùù$ %
new
ùù& )&
MasterApproverLevelModel
ùù* B
(
ùùB C
)
ùùC D
;
ùùD E
return
ûû 
View
ûû 
(
ûû !
masterapproverlevel
ûû /
)
ûû/ 0
;
ûû0 1
}
üü 
else
†† 
{
°° 
HttpContext
¢¢ 
.
¢¢ 
Request
¢¢ #
.
¢¢# $
Cookies
¢¢$ +
.
¢¢+ ,
TryGetValue
¢¢, 7
(
¢¢7 8

UserHelper
¢¢8 B
.
¢¢B C
EltizamToken
¢¢C O
,
¢¢O P
out
¢¢Q T
string
¢¢U [
token
¢¢\ a
)
¢¢a b
;
¢¢b c
APIRepository
££ 
objapi
££ $
=
££% &
new
££' *
(
££* +
_cofiguration
££+ 8
)
££8 9
;
££9 :!
HttpResponseMessage
•• #
responseMessage
••$ 3
=
••4 5
objapi
••6 <
.
••< =
APICommunication
••= M
(
••M N
APIURLHelper
••N Z
.
••Z [(
GetMasterApproverLevelById
••[ u
+
••v w
$str
••x {
+
••| }
id••~ Ä
,••Ä Å

HttpMethod••Ç å
.••å ç
Get••ç ê
,••ê ë
token••í ó
)••ó ò
.••ò ô
Result••ô ü
;••ü †
if
ßß 
(
ßß 
responseMessage
ßß #
.
ßß# $!
IsSuccessStatusCode
ßß$ 7
)
ßß7 8
{
®® 
string
©© 
jsonResponse
©© '
=
©©( )
responseMessage
©©* 9
.
©©9 :
Content
©©: A
.
©©A B
ReadAsStringAsync
©©B S
(
©©S T
)
©©T U
.
©©U V
Result
©©V \
;
©©\ ]
var
™™ 
data
™™ 
=
™™ 
JsonConvert
™™ *
.
™™* +
DeserializeObject
™™+ <
<
™™< =
APIResponseEntity
™™= N
<
™™N O&
MasterApproverLevelModel
™™O g
>
™™g h
>
™™h i
(
™™i j
jsonResponse
™™j v
)
™™v w
;
™™w x

FooterInfo
¨¨ 
(
¨¨ 
TableNameEnum
¨¨ ,
.
¨¨, -!
MasterApproverLevel
¨¨- @
,
¨¨@ A
_cofiguration
¨¨B O
,
¨¨O P
id
¨¨Q S
,
¨¨S T
true
¨¨U Y
)
¨¨Y Z
;
¨¨Z [
return
ÆÆ 
View
ÆÆ 
(
ÆÆ  
$str
ÆÆ  ;
,
ÆÆ; <
data
ÆÆ= A
.
ÆÆA B
_object
ÆÆB I
)
ÆÆI J
;
ÆÆJ K
}
ØØ 
return
∞∞ 
NotFound
∞∞ 
(
∞∞  
)
∞∞  !
;
∞∞! "
}
±± 
}
≤≤ 	
}
≥≥ 
}µµ åŒ
@D:\EltizamLive\Eltizam.Web\Controllers\MasterClientController.cs
	namespace 	
EltizamValuation
 
. 
Web 
. 
Controllers *
{ 
public 

class "
MasterClientController '
:( )
BaseController* 8
{ 
private 
readonly 
IConfiguration '
_cofiguration( 5
;5 6
private 
readonly 
IStringLocalizer )
<) *
Shared* 0
>0 1"
_stringLocalizerShared2 H
;H I
private 
readonly 
IHelper  
_helper! (
;( )
public "
MasterClientController %
(% &
IConfiguration& 4
configuration5 B
,B C
IStringLocalizerD T
<T U
SharedU [
>[ \!
stringLocalizerShared] r
,r s
IHelpert {
helper	| Ç
)
Ç É
{ 	
_cofiguration 
= 
configuration )
;) *"
_stringLocalizerShared "
=# $!
stringLocalizerShared% :
;: ;
_helper 
= 
helper 
; 
}   	
["" 	
HttpGet""	 
]"" 
[## 	
Route##	 
(## 
$str## %
)##% &
]##& '
public$$ 
IActionResult$$ 
Clients$$ $
($$$ %
)$$% &
{%% 	
try&& 
{'' 
int** 
roleId** 
=** 
_helper** $
.**$ %
GetLoggedInRoleId**% 6
(**6 7
)**7 8
;**8 9
if++ 
(++ 
!++ 
CheckRoleAccess++ $
(++$ % 
ModulePermissionEnum++% 9
.++9 :
ClientMaster++: F
,++F G
PermissionEnum++H V
.++V W
View++W [
,++[ \
roleId++] c
)++c d
)++d e
return,, 
RedirectToAction,, +
(,,+ ,
AppConstants,,, 8
.,,8 9
AccessRestriction,,9 J
,,,J K
AppConstants,,L X
.,,X Y
Home,,Y ]
),,] ^
;,,^ _
return-- 
View-- 
(-- 
)-- 
;-- 
}.. 
catch// 
(// 
	Exception// 
e// 
)// 
{00 
_helper22 
.22 
LogExceptions22 %
(22% &
e22& '
)22' (
;22( )
ViewBag33 
.33 
errormessage33 $
=33% &
Convert33' .
.33. /
ToString33/ 7
(337 8
e338 9
.339 :

StackTrace33: D
)33D E
;33E F
return44 
View44 
(44 
$str44 #
)44# $
;44$ %
}55 
}66 	
public88 
IActionResult88 
ClientManage88 )
(88) *
int88* -
?88- .
id88/ 1
)881 2
{99 	
MasterClientModel:: 

masterUser:: (
;::( )
var<< 
action<< 
=<< 
id<< 
==<< 
null<< #
?<<$ %
PermissionEnum<<& 4
.<<4 5
Add<<5 8
:<<9 :
PermissionEnum<<; I
.<<I J
Edit<<J N
;<<N O
int== 
roleId== 
=== 
_helper==  
.==  !
GetLoggedInRoleId==! 2
(==2 3
)==3 4
;==4 5
if?? 
(?? 
!?? 
CheckRoleAccess??  
(??  ! 
ModulePermissionEnum??! 5
.??5 6
ClientMaster??6 B
,??B C
action??D J
,??J K
roleId??L R
)??R S
)??S T
return@@ 
RedirectToAction@@ '
(@@' (
AppConstants@@( 4
.@@4 5
AccessRestriction@@5 F
,@@F G
AppConstants@@H T
.@@T U
Home@@U Y
)@@Y Z
;@@Z [
ifAA 
(AA 
idAA 
==AA 
nullAA 
||AA 
idAA  
<=AA! #
$numAA$ %
)AA% &
{BB 
varCC 
	viewModelCC 
=CC 
newCC  #
MasterClientModelCC$ 5
{DD 
	AddressesEE 
=EE 
newEE  #
ListEE$ (
<EE( )
MasterAddressEntityEE) <
>EE< =
(EE= >
)EE> ?
,EE? @
ContactsFF 
=FF 
newFF "
ListFF# '
<FF' (
MasterContactModelFF( :
>FF: ;
(FF; <
)FF< =
}GG 
;GG 
	viewModelHH 
.HH 
IsActiveHH "
=HH# $
trueHH% )
;HH) *
MasterAddressEntityII #
addessII$ *
=II+ ,
newII- 0
MasterAddressEntityII1 D
(IID E
)IIE F
;IIF G
MasterContactModelJJ "
contactJJ# *
=JJ+ ,
newJJ- 0
MasterContactModelJJ1 C
(JJC D
)JJD E
;JJE F
	viewModelKK 
.KK 
	AddressesKK #
.KK# $
AddKK$ '
(KK' (
addessKK( .
)KK. /
;KK/ 0
	viewModelLL 
.LL 
ContactsLL "
.LL" #
AddLL# &
(LL& '
contactLL' .
)LL. /
;LL/ 0
returnMM 
ViewMM 
(MM 
	viewModelMM %
)MM% &
;MM& '
}NN 
elseOO 
{PP 
HttpContextQQ 
.QQ 
RequestQQ #
.QQ# $
CookiesQQ$ +
.QQ+ ,
TryGetValueQQ, 7
(QQ7 8

UserHelperQQ8 B
.QQB C
EltizamTokenQQC O
,QQO P
outQQQ T
stringQQU [
tokenQQ\ a
)QQa b
;QQb c
APIRepositoryRR 
objapiRR $
=RR% &
newRR' *
(RR* +
_cofigurationRR+ 8
)RR8 9
;RR9 :
HttpResponseMessageSS #
responseMessageSS$ 3
=SS4 5
objapiSS6 <
.SS< =
APICommunicationSS= M
(SSM N
APIURLHelperSSN Z
.SSZ [
GetClientByIdSS[ h
+SSi j
$strSSk n
+SSo p
idSSq s
,SSs t

HttpMethodSSu 
.	SS Ä
Get
SSÄ É
,
SSÉ Ñ
token
SSÖ ä
)
SSä ã
.
SSã å
Result
SSå í
;
SSí ì
ifUU 
(UU 
responseMessageUU #
.UU# $
IsSuccessStatusCodeUU$ 7
)UU7 8
{VV 
stringWW 
jsonResponseWW '
=WW( )
responseMessageWW* 9
.WW9 :
ContentWW: A
.WWA B
ReadAsStringAsyncWWB S
(WWS T
)WWT U
.WWU V
ResultWWV \
;WW\ ]
varXX 
dataXX 
=XX 
JsonConvertXX *
.XX* +
DeserializeObjectXX+ <
<XX< =
APIResponseEntityXX= N
<XXN O
MasterClientModelXXO `
>XX` a
>XXa b
(XXb c
jsonResponseXXc o
)XXo p
;XXp q

FooterInfo[[ 
([[ 
TableNameEnum[[ ,
.[[, -
Master_Client[[- :
,[[: ;
_cofiguration[[< I
,[[I J
id[[K M
)[[M N
;[[N O
if^^ 
(^^ 
data^^ 
.^^ 
_object^^ $
.^^$ %
	Addresses^^% .
.^^. /
Count^^/ 4
==^^5 7
$num^^8 9
)^^9 :
{__ 
MasterAddressEntity`` +
addess``, 2
=``3 4
new``5 8
MasterAddressEntity``9 L
(``L M
)``M N
;``N O
dataaa 
.aa 
_objectaa $
.aa$ %
	Addressesaa% .
.aa. /
Addaa/ 2
(aa2 3
addessaa3 9
)aa9 :
;aa: ;
}bb 
ifcc 
(cc 
datacc 
.cc 
_objectcc $
.cc$ %
Contactscc% -
.cc- .
Countcc. 3
==cc4 6
$numcc7 8
)cc8 9
{dd 
MasterContactModelee *
contactee+ 2
=ee3 4
newee5 8
MasterContactModelee9 K
(eeK L
)eeL M
;eeM N
dataff 
.ff 
_objectff $
.ff$ %
Contactsff% -
.ff- .
Addff. 1
(ff1 2
contactff2 9
)ff9 :
;ff: ;
}gg 
returnii 
Viewii 
(ii  
dataii  $
.ii$ %
_objectii% ,
)ii, -
;ii- .
}jj 
returnkk 
NotFoundkk 
(kk  
)kk  !
;kk! "
}ll 
}mm 	
[pp 	
HttpPostpp	 
]pp 
publicqq 
IActionResultqq 
ClientManageqq )
(qq) *
intqq* -
idqq. 0
,qq0 1
MasterClientModelqq2 C

masterUserqqD N
)qqN O
{rr 	
tryss 
{tt 
varvv 
actionvv 
=vv 

masterUservv '
.vv' (
Idvv( *
==vv+ -
$numvv. /
?vv0 1
PermissionEnumvv2 @
.vv@ A
AddvvA D
:vvE F
PermissionEnumvvG U
.vvU V
EditvvV Z
;vvZ [
intxx 
roleIdxx 
=xx 
_helperxx $
.xx$ %
GetLoggedInRoleIdxx% 6
(xx6 7
)xx7 8
;xx8 9
ifyy 
(yy 
!yy 
CheckRoleAccessyy $
(yy$ % 
ModulePermissionEnumyy% 9
.yy9 :
ClientMasteryy: F
,yyF G
actionyyH N
,yyN O
roleIdyyP V
)yyV W
)yyW X
returnzz 
RedirectToActionzz +
(zz+ ,
AppConstantszz, 8
.zz8 9
AccessRestrictionzz9 J
,zzJ K
AppConstantszzL X
.zzX Y
HomezzY ]
)zz] ^
;zz^ _
if|| 
(|| 

masterUser|| 
.|| 
Document|| '
!=||( *
null||+ /
&&||0 2

masterUser||3 =
.||= >
Document||> F
.||F G
Files||G L
!=||M O
null||P T
)||T U
{}} 
List~~ 
<~~ 
MasterDocumentModel~~ ,
>~~, -
docs~~. 2
=~~3 4
_helper~~5 <
.~~< =

FileUpload~~> H
(~~H I

masterUser~~I S
.~~S T
Document~~T \
)~~\ ]
;~~] ^

masterUser 
. 
uploadDocument -
=. /
docs0 4
;4 5

masterUser
ÄÄ 
.
ÄÄ 
Document
ÄÄ '
=
ÄÄ( )
null
ÄÄ* .
;
ÄÄ. /
}
ÅÅ 
if
ÉÉ 
(
ÉÉ 

masterUser
ÉÉ 
.
ÉÉ 
File
ÉÉ #
!=
ÉÉ$ &
null
ÉÉ' +
)
ÉÉ+ ,
{
ÑÑ !
MasterDocumentModel
ÖÖ '
docs
ÖÖ( ,
=
ÖÖ- .
ProfileUpload
ÖÖ/ <
(
ÖÖ< =

masterUser
ÖÖ= G
.
ÖÖG H
File
ÖÖH L
)
ÖÖL M
;
ÖÖM N

masterUser
ÜÜ 
.
ÜÜ 
uploadProfile
ÜÜ ,
=
ÜÜ- .
docs
ÜÜ/ 3
;
ÜÜ3 4

masterUser
áá 
.
áá 
File
áá #
=
áá$ %
null
áá& *
;
áá* +
}
àà 
if
êê 
(
êê 

masterUser
êê 
.
êê 
Id
êê !
==
êê" $
$num
êê% &
)
êê& '

masterUser
ëë 
.
ëë 
	CreatedBy
ëë (
=
ëë) *
_helper
ëë+ 2
.
ëë2 3
GetLoggedInUserId
ëë3 D
(
ëëD E
)
ëëE F
;
ëëF G

masterUser
íí 
.
íí 

ModifiedBy
íí %
=
íí& '
_helper
íí( /
.
íí/ 0
GetLoggedInUserId
íí0 A
(
ííA B
)
ííB C
;
ííC D
HttpContext
îî 
.
îî 
Request
îî #
.
îî# $
Cookies
îî$ +
.
îî+ ,
TryGetValue
îî, 7
(
îî7 8

UserHelper
îî8 B
.
îîB C
EltizamToken
îîC O
,
îîO P
out
îîQ T
string
îîU [
token
îî\ a
)
îîa b
;
îîb c
APIRepository
ïï 
objapi
ïï $
=
ïï% &
new
ïï' *
(
ïï* +
_cofiguration
ïï+ 8
)
ïï8 9
;
ïï9 :!
HttpResponseMessage
óó #
responseMessage
óó$ 3
=
óó4 5
objapi
óó6 <
.
óó< =
APICommunication
óó= M
(
óóM N
APIURLHelper
óóN Z
.
óóZ [
UpsertClient
óó[ g
,
óóg h

HttpMethod
óói s
.
óós t
Post
óót x
,
óóx y
token
óóz 
,óó Ä
newóóÅ Ñ
StringContentóóÖ í
(óóí ì
JsonConvertóóì û
.óóû ü
SerializeObjectóóü Æ
(óóÆ Ø

masterUseróóØ π
)óóπ ∫
)óó∫ ª
)óóª º
.óóº Ω
ResultóóΩ √
;óó√ ƒ
if
ôô 
(
ôô 
responseMessage
ôô #
.
ôô# $!
IsSuccessStatusCode
ôô$ 7
&&
ôô8 :

masterUser
ôô; E
.
ôôE F
Id
ôôF H
==
ôôH J
$num
ôôJ K
)
ôôK L
{
öö 
string
õõ 
jsonResponse
õõ '
=
õõ( )
responseMessage
õõ* 9
.
õõ9 :
Content
õõ: A
.
õõA B
ReadAsStringAsync
õõB S
(
õõS T
)
õõT U
.
õõU V
Result
õõV \
;
õõ\ ]
TempData
úú 
[
úú 

UserHelper
úú '
.
úú' (
SuccessMessage
úú( 6
]
úú6 7
=
úú8 9
Convert
úú: A
.
úúA B
ToString
úúB J
(
úúJ K$
_stringLocalizerShared
úúK a
[
úúa b
$str
úúb v
]
úúv w
)
úúw x
;
úúx y
return
ûû 
RedirectToAction
ûû +
(
ûû+ ,
$str
ûû, 5
)
ûû5 6
;
ûû6 7
}
üü 
if
†† 
(
†† 
responseMessage
†† #
.
††# $!
IsSuccessStatusCode
††$ 7
)
††7 8
{
°° 
string
¢¢ 
jsonResponse
¢¢ '
=
¢¢( )
responseMessage
¢¢* 9
.
¢¢9 :
Content
¢¢: A
.
¢¢A B
ReadAsStringAsync
¢¢B S
(
¢¢S T
)
¢¢T U
.
¢¢U V
Result
¢¢V \
;
¢¢\ ]
TempData
££ 
[
££ 

UserHelper
££ '
.
££' (
SuccessMessage
££( 6
]
££6 7
=
££8 9
Convert
££: A
.
££A B
ToString
££B J
(
££J K$
_stringLocalizerShared
££K a
[
££a b
$str
££b v
]
££v w
)
££w x
;
££x y
return
•• 
Redirect
•• #
(
••# $
$"
••$ &
$str
••& D
{
••D E

masterUser
••E O
.
••O P
Id
••P R
}
••R S
"
••S T
)
••T U
;
••U V
}
¶¶ 
else
ßß 
{
®® 
TempData
©© 
[
©© 

UserHelper
©© '
.
©©' (
ErrorMessage
©©( 4
]
©©4 5
=
©©6 7
Convert
©©8 ?
.
©©? @
ToString
©©@ H
(
©©H I
responseMessage
©©I X
.
©©X Y
Content
©©Y `
.
©©` a
ReadAsStringAsync
©©a r
(
©©r s
)
©©s t
.
©©t u
Result
©©u {
)
©©{ |
;
©©| }
return
™™ 
RedirectToAction
™™ +
(
™™+ ,
$str
™™, :
,
™™: ;
new
™™< ?
{
™™@ A
id
™™B D
=
™™E F

masterUser
™™G Q
.
™™Q R
Id
™™R T
}
™™U V
)
™™V W
;
™™W X
}
´´ 
}
¨¨ 
catch
≠≠ 
(
≠≠ 
	Exception
≠≠ 
e
≠≠ 
)
≠≠ 
{
ÆÆ 
_helper
ØØ 
.
ØØ 
LogExceptions
ØØ %
(
ØØ% &
e
ØØ& '
)
ØØ' (
;
ØØ( )
TempData
∞∞ 
[
∞∞ 

UserHelper
∞∞ #
.
∞∞# $
ErrorMessage
∞∞$ 0
]
∞∞0 1
=
∞∞2 3
Convert
∞∞4 ;
.
∞∞; <
ToString
∞∞< D
(
∞∞D E
e
∞∞E F
.
∞∞F G

StackTrace
∞∞G Q
)
∞∞Q R
;
∞∞R S
return
±± 
RedirectToAction
±± '
(
±±' (
$str
±±( 6
,
±±6 7
new
±±8 ;
{
±±< =
Id
±±> @
=
±±A B

masterUser
±±C M
.
±±M N
Id
±±N P
}
±±Q R
)
±±R S
;
±±S T
}
≤≤ 
}
≥≥ 	
[
µµ 	
HttpGet
µµ	 
]
µµ 
[
∂∂ 	
Route
∂∂	 
(
∂∂ 
$str
∂∂ *
)
∂∂* +
]
∂∂+ ,
public
∑∑ 
IActionResult
∑∑ 
ClientDetail
∑∑ )
(
∑∑) *
int
∑∑* -
?
∑∑- .
id
∑∑/ 1
)
∑∑1 2
{
∏∏ 	
var
∫∫ 
action
∫∫ 
=
∫∫ 
PermissionEnum
∫∫ '
.
∫∫' (
View
∫∫( ,
;
∫∫, -
int
ºº 
roleId
ºº 
=
ºº 
_helper
ºº  
.
ºº  !
GetLoggedInRoleId
ºº! 2
(
ºº2 3
)
ºº3 4
;
ºº4 5
if
ΩΩ 
(
ΩΩ 
!
ΩΩ 
CheckRoleAccess
ΩΩ  
(
ΩΩ  !"
ModulePermissionEnum
ΩΩ! 5
.
ΩΩ5 6
ClientMaster
ΩΩ6 B
,
ΩΩB C
action
ΩΩD J
,
ΩΩJ K
roleId
ΩΩL R
)
ΩΩR S
)
ΩΩS T
return
ææ 
RedirectToAction
ææ '
(
ææ' (
AppConstants
ææ( 4
.
ææ4 5
AccessRestriction
ææ5 F
,
ææF G
AppConstants
ææH T
.
ææT U
Home
ææU Y
)
ææY Z
;
ææZ [
MasterClientModel
¿¿ 

masterUser
¿¿ (
;
¿¿( )
if
¬¬ 
(
¬¬ 
id
¬¬ 
==
¬¬ 
null
¬¬ 
||
¬¬ 
id
¬¬  
<=
¬¬! #
$num
¬¬$ %
)
¬¬% &
{
√√ 

masterUser
ƒƒ 
=
ƒƒ 
new
ƒƒ  
MasterClientModel
ƒƒ! 2
(
ƒƒ2 3
)
ƒƒ3 4
;
ƒƒ4 5
return
≈≈ 
RedirectToAction
≈≈ '
(
≈≈' (
$str
≈≈( 0
)
≈≈0 1
;
≈≈1 2
}
∆∆ 
else
«« 
{
»» 
HttpContext
…… 
.
…… 
Request
…… #
.
……# $
Cookies
……$ +
.
……+ ,
TryGetValue
……, 7
(
……7 8

UserHelper
……8 B
.
……B C
EltizamToken
……C O
,
……O P
out
……Q T
string
……U [
token
……\ a
)
……a b
;
……b c
APIRepository
   
objapi
   $
=
  % &
new
  ' *
(
  * +
_cofiguration
  + 8
)
  8 9
;
  9 :!
HttpResponseMessage
ÀÀ #
responseMessage
ÀÀ$ 3
=
ÀÀ4 5
objapi
ÀÀ6 <
.
ÀÀ< =
APICommunication
ÀÀ= M
(
ÀÀM N
APIURLHelper
ÀÀN Z
.
ÀÀZ [
GetClientById
ÀÀ[ h
+
ÀÀi j
$str
ÀÀk n
+
ÀÀo p
id
ÀÀq s
,
ÀÀs t

HttpMethod
ÀÀu 
.ÀÀ Ä
GetÀÀÄ É
,ÀÀÉ Ñ
tokenÀÀÖ ä
)ÀÀä ã
.ÀÀã å
ResultÀÀå í
;ÀÀí ì
if
ÕÕ 
(
ÕÕ 
responseMessage
ÕÕ #
.
ÕÕ# $!
IsSuccessStatusCode
ÕÕ$ 7
)
ÕÕ7 8
{
ŒŒ 
string
œœ 
jsonResponse
œœ '
=
œœ( )
responseMessage
œœ* 9
.
œœ9 :
Content
œœ: A
.
œœA B
ReadAsStringAsync
œœB S
(
œœS T
)
œœT U
.
œœU V
Result
œœV \
;
œœ\ ]
var
–– 
data
–– 
=
–– 
JsonConvert
–– *
.
––* +
DeserializeObject
––+ <
<
––< =
APIResponseEntity
––= N
<
––N O
MasterClientModel
––O `
>
––` a
>
––a b
(
––b c
jsonResponse
––c o
)
––o p
;
––p q

FooterInfo
”” 
(
”” 
TableNameEnum
”” ,
.
””, -
Master_Client
””- :
,
””: ;
_cofiguration
””< I
,
””I J
id
””K M
,
””M N
true
””O S
)
””S T
;
””T U
if
’’ 
(
’’ 
data
’’ 
.
’’ 
_object
’’ $
is
’’% '
null
’’( ,
)
’’, -
return
÷÷ 
NotFound
÷÷ '
(
÷÷' (
)
÷÷( )
;
÷÷) *
return
ÿÿ 
View
ÿÿ 
(
ÿÿ  
data
ÿÿ  $
.
ÿÿ$ %
_object
ÿÿ% ,
)
ÿÿ, -
;
ÿÿ- .
}
ŸŸ 
return
⁄⁄ 
NotFound
⁄⁄ 
(
⁄⁄  
)
⁄⁄  !
;
⁄⁄! "
}
€€ 
}
‹‹ 	
private
‡‡ !
MasterDocumentModel
‡‡ #
ProfileUpload
‡‡$ 1
(
‡‡1 2
	IFormFile
‡‡2 ;
pic
‡‡< ?
)
‡‡? @
{
·· 	!
MasterDocumentModel
‚‚ 

uploadFils
‚‚  *
=
‚‚+ ,
new
‚‚- 0!
MasterDocumentModel
‚‚1 D
(
‚‚D E
)
‚‚E F
;
‚‚F G
if
„„ 
(
„„ 
pic
„„ 
==
„„ 
null
„„ 
)
„„ 
{
‰‰ 
throw
ÂÂ 
new
ÂÂ 
ArgumentException
ÂÂ +
(
ÂÂ+ ,
$str
ÂÂ, E
)
ÂÂE F
;
ÂÂF G
}
ÊÊ 
var
ÁÁ 
currentUser
ÁÁ 
=
ÁÁ 
_helper
ÁÁ %
.
ÁÁ% &
GetLoggedInUserId
ÁÁ& 7
(
ÁÁ7 8
)
ÁÁ8 9
;
ÁÁ9 :
var
ËË 
savedFileNames
ËË 
=
ËË  
new
ËË! $
List
ËË% )
<
ËË) *
string
ËË* 0
>
ËË0 1
(
ËË1 2
)
ËË2 3
;
ËË3 4
var
ÎÎ 
allowedFileTypes
ÎÎ  
=
ÎÎ! "
new
ÎÎ# &
List
ÎÎ' +
<
ÎÎ+ ,
string
ÎÎ, 2
>
ÎÎ2 3
{
ÎÎ4 5
$str
ÎÎ6 B
,
ÎÎB C
$str
ÎÎD O
,
ÎÎO P
$str
ÎÎQ \
}
ÎÎ] ^
;
ÎÎ^ _
if
ÏÏ 
(
ÏÏ 
!
ÏÏ 
allowedFileTypes
ÏÏ !
.
ÏÏ! "
Contains
ÏÏ" *
(
ÏÏ* +
pic
ÏÏ+ .
.
ÏÏ. /
ContentType
ÏÏ/ :
)
ÏÏ: ;
)
ÏÏ; <
{
ÌÌ 
throw
ÓÓ 
new
ÓÓ 
ArgumentException
ÓÓ +
(
ÓÓ+ ,
$"
ÓÓ, .
$str
ÓÓ. 9
{
ÓÓ9 :
pic
ÓÓ: =
.
ÓÓ= >
ContentType
ÓÓ> I
}
ÓÓI J
$str
ÓÓJ [
"
ÓÓ[ \
)
ÓÓ\ ]
;
ÓÓ] ^
}
ÔÔ 
var
ÒÒ 
fileName
ÒÒ 
=
ÒÒ 
Guid
ÒÒ 
.
ÒÒ  
NewGuid
ÒÒ  '
(
ÒÒ' (
)
ÒÒ( )
.
ÒÒ) *
ToString
ÒÒ* 2
(
ÒÒ2 3
)
ÒÒ3 4
+
ÒÒ5 6
Path
ÒÒ7 ;
.
ÒÒ; <
GetExtension
ÒÒ< H
(
ÒÒH I
pic
ÒÒI L
.
ÒÒL M
FileName
ÒÒM U
)
ÒÒU V
;
ÒÒV W
var
ÛÛ 
docName
ÛÛ 
=
ÛÛ 
pic
ÛÛ 
.
ÛÛ 
FileName
ÛÛ &
;
ÛÛ& '
var
ÙÙ 
filePath
ÙÙ 
=
ÙÙ 
Path
ÙÙ 
.
ÙÙ  
Combine
ÙÙ  '
(
ÙÙ' (
$str
ÙÙ( 9
,
ÙÙ9 :
fileName
ÙÙ; C
)
ÙÙC D
;
ÙÙD E
filePath
ıı 
=
ıı 
filePath
ıı 
.
ıı  
Replace
ıı  '
(
ıı' (
$str
ıı( ,
,
ıı, -
$str
ıı. 1
)
ıı1 2
;
ıı2 3
using
ˆˆ 
(
ˆˆ 
var
ˆˆ 
stream
ˆˆ 
=
ˆˆ 
new
ˆˆ  #

FileStream
ˆˆ$ .
(
ˆˆ. /
filePath
ˆˆ/ 7
,
ˆˆ7 8
FileMode
ˆˆ9 A
.
ˆˆA B
Create
ˆˆB H
)
ˆˆH I
)
ˆˆI J
{
˜˜ 
pic
¯¯ 
.
¯¯ 
CopyToAsync
¯¯ 
(
¯¯  
stream
¯¯  &
)
¯¯& '
;
¯¯' (
}
˘˘ 
var
¸¸ 
upload
¸¸ 
=
¸¸ 
new
¸¸ !
MasterDocumentModel
¸¸ 0
{
˝˝ 
FileName
˛˛ 
=
˛˛ 
fileName
˛˛ #
,
˛˛# $
FilePath
ˇˇ 
=
ˇˇ 
filePath
ˇˇ #
.
ˇˇ# $
Replace
ˇˇ$ +
(
ˇˇ+ ,
$str
ˇˇ, 5
,
ˇˇ5 6
$str
ˇˇ7 ;
)
ˇˇ; <
,
ˇˇ< =
DocumentName
ÄÄ 
=
ÄÄ 
docName
ÄÄ &
,
ÄÄ& '
IsActive
ÅÅ 
=
ÅÅ 
true
ÅÅ 
,
ÅÅ  
	CreatedBy
ÇÇ 
=
ÇÇ 
currentUser
ÇÇ '
,
ÇÇ' (
FileType
ÉÉ 
=
ÉÉ 
pic
ÉÉ 
.
ÉÉ 
ContentType
ÉÉ *
,
ÉÉ* +
CreatedDate
ÑÑ 
=
ÑÑ 
null
ÑÑ "
,
ÑÑ" #
CreatedName
ÖÖ 
=
ÖÖ 
$str
ÖÖ  
}
ÜÜ 
;
ÜÜ 
return
àà 
upload
àà 
;
àà 
}
ââ 	
}
åå 
}çç áf
DD:\EltizamLive\Eltizam.Web\Controllers\MasterClientTypeController.cs
	namespace 	
EltizamValuation
 
. 
Web 
. 
Controllers *
{ 
public 

class &
MasterClientTypeController +
:, -
BaseController. <
{ 
private 
readonly 
IConfiguration '
_cofiguration( 5
;5 6
private 
readonly 
IStringLocalizer )
<) *
Shared* 0
>0 1"
_stringLocalizerShared2 H
;H I
private 
readonly 
IHelper  
_helper! (
;( )
public &
MasterClientTypeController )
() *
IConfiguration* 8
configuration9 F
,F G
IStringLocalizerH X
<X Y
SharedY _
>_ `!
stringLocalizerShareda v
,v w
IHelperx 
helper
Ä Ü
)
Ü á
{ 	
_cofiguration 
= 
configuration )
;) *"
_stringLocalizerShared "
=# $!
stringLocalizerShared% :
;: ;
_helper 
= 
helper 
; 
} 	
public   
IActionResult   

ClientType   '
(  ' (
)  ( )
{!! 	
try"" 
{## 
HttpContext$$ 
.$$ 
Request$$ #
.$$# $
Cookies$$$ +
.$$+ ,
TryGetValue$$, 7
($$7 8

UserHelper$$8 B
.$$B C
EltizamToken$$C O
,$$O P
out$$Q T
string$$U [
token$$\ a
)$$a b
;$$b c
APIRepository%% 
objapi%% $
=%%% &
new%%' *
APIRepository%%+ 8
(%%8 9
_cofiguration%%9 F
)%%F G
;%%G H"
Master_ClientTypeModel&& &
	oUserList&&' 0
=&&1 2
new&&3 6"
Master_ClientTypeModel&&7 M
(&&M N
)&&N O
;&&O P
return'' 
View'' 
('' 
)'' 
;'' 
}(( 
catch)) 
()) 
	Exception)) 
e)) 
))) 
{** 
_helper++ 
.++ 
LogExceptions++ %
(++% &
e++& '
)++' (
;++( )
ViewBag,, 
.,, 
errormessage,, $
=,,% &
Convert,,' .
.,,. /
ToString,,/ 7
(,,7 8
e,,8 9
.,,9 :

StackTrace,,: D
),,D E
;,,E F
return-- 
View-- 
(-- 
$str-- #
)--# $
;--$ %
}.. 
}// 	
public11 
IActionResult11 
ClientTypeManage11 -
(11- .
int11. 1
?111 2
id113 5
)115 6
{22 	
int44 
roleId44 
=44 
_helper44  
.44  !
GetLoggedInRoleId44! 2
(442 3
)443 4
;444 5
if55 
(55 
!55 
CheckRoleAccess55  
(55  ! 
ModulePermissionEnum55! 5
.555 6
ClientMaster556 B
,55B C
PermissionEnum55D R
.55R S
View55S W
,55W X
roleId55Y _
)55_ `
)55` a
return66 
RedirectToAction66 '
(66' (
AppConstants66( 4
.664 5
AccessRestriction665 F
,66F G
AppConstants66H T
.66T U
Home66U Y
)66Y Z
;66Z ["
Master_ClientTypeModel99 "

masterUser99# -
;99- .
if:: 
(:: 
id:: 
==:: 
null:: 
||:: 
id::  
<=::! #
$num::$ %
)::% &
{;; 

masterUser<< 
=<< 
new<<  "
Master_ClientTypeModel<<! 7
(<<7 8
)<<8 9
;<<9 :

masterUser== 
.== 
IsActive== #
===$ %
true==& *
;==* +
return>> 
View>> 
(>> 

masterUser>> &
)>>& '
;>>' (
}?? 
else@@ 
{AA 
HttpContextBB 
.BB 
RequestBB #
.BB# $
CookiesBB$ +
.BB+ ,
TryGetValueBB, 7
(BB7 8

UserHelperBB8 B
.BBB C
EltizamTokenBBC O
,BBO P
outBBQ T
stringBBU [
tokenBB\ a
)BBa b
;BBb c
APIRepositoryCC 
objapiCC $
=CC% &
newCC' *
(CC* +
_cofigurationCC+ 8
)CC8 9
;CC9 :
HttpResponseMessageDD #
responseMessageDD$ 3
=DD4 5
objapiDD6 <
.DD< =
APICommunicationDD= M
(DDM N
APIURLHelperDDN Z
.DDZ [
GetClientTypeByIdDD[ l
+DDm n
$strDDo r
+DDs t
idDDu w
,DDw x

HttpMethod	DDy É
.
DDÉ Ñ
Get
DDÑ á
,
DDá à
token
DDâ é
)
DDé è
.
DDè ê
Result
DDê ñ
;
DDñ ó
ifFF 
(FF 
responseMessageFF #
.FF# $
IsSuccessStatusCodeFF$ 7
)FF7 8
{GG 
stringHH 
jsonResponseHH '
=HH( )
responseMessageHH* 9
.HH9 :
ContentHH: A
.HHA B
ReadAsStringAsyncHHB S
(HHS T
)HHT U
.HHU V
ResultHHV \
;HH\ ]
varII 
dataII 
=II 
JsonConvertII *
.II* +
DeserializeObjectII+ <
<II< =
APIResponseEntityII= N
<IIN O"
Master_ClientTypeModelIIO e
>IIe f
>IIf g
(IIg h
jsonResponseIIh t
)IIt u
;IIu v

FooterInfoLL 
(LL 
TableNameEnumLL ,
.LL, -
Master_ClientTypeLL- >
,LL> ?
_cofigurationLL@ M
,LLM N
idLLO Q
)LLQ R
;LLR S
ifNN 
(NN 
dataNN 
.NN 
_objectNN $
isNN% '
nullNN( ,
)NN, -
returnOO 
NotFoundOO '
(OO' (
)OO( )
;OO) *
returnQQ 
ViewQQ 
(QQ  
dataQQ  $
.QQ$ %
_objectQQ% ,
)QQ, -
;QQ- .
}RR 
returnSS 
NotFoundSS 
(SS  
)SS  !
;SS! "
}TT 
}UU 	
[XX 	
HttpPostXX	 
,XX 
RouteXX 
(XX 
$strXX *
)XX* +
]XX+ ,
publicYY 
IActionResultYY 
ClientTypeManageYY -
(YY- .
intYY. 1
idYY2 4
,YY4 5"
Master_ClientTypeModelYY6 L

masterUserYYM W
)YYW X
{ZZ 	
try[[ 
{\\ 
var^^ 
action^^ 
=^^ 

masterUser^^ '
.^^' (
Id^^( *
==^^+ -
$num^^. /
?^^0 1
PermissionEnum^^2 @
.^^@ A
Add^^A D
:^^E F
PermissionEnum^^G U
.^^U V
Edit^^V Z
;^^Z [
int`` 
roleId`` 
=`` 
_helper`` $
.``$ %
GetLoggedInRoleId``% 6
(``6 7
)``7 8
;``8 9
ifaa 
(aa 
!aa 
CheckRoleAccessaa $
(aa$ % 
ModulePermissionEnumaa% 9
.aa9 :
ClientMasteraa: F
,aaF G
actionaaH N
,aaN O
roleIdaaP V
)aaV W
)aaW X
returnbb 
RedirectToActionbb +
(bb+ ,
AppConstantsbb, 8
.bb8 9
AccessRestrictionbb9 J
,bbJ K
AppConstantsbbL X
.bbX Y
HomebbY ]
)bb] ^
;bb^ _
ifff 
(ff 

masterUserff 
.ff 
Idff !
==ff" $
$numff% &
)ff& '

masterUsergg 
.gg 
	CreatedBygg (
=gg) *
_helpergg+ 2
.gg2 3
GetLoggedInUserIdgg3 D
(ggD E
)ggE F
;ggF G

masterUserhh 
.hh 

ModifiedByhh %
=hh& '
_helperhh( /
.hh/ 0
GetLoggedInUserIdhh0 A
(hhA B
)hhB C
;hhC D
HttpContextjj 
.jj 
Requestjj #
.jj# $
Cookiesjj$ +
.jj+ ,
TryGetValuejj, 7
(jj7 8

UserHelperjj8 B
.jjB C
EltizamTokenjjC O
,jjO P
outjjQ T
stringjjU [
tokenjj\ a
)jja b
;jjb c
APIRepositorykk 
objapikk $
=kk% &
newkk' *
(kk* +
_cofigurationkk+ 8
)kk8 9
;kk9 :
HttpResponseMessagemm #
responseMessagemm$ 3
=mm4 5
objapimm6 <
.mm< =
APICommunicationmm= M
(mmM N
APIURLHelpermmN Z
.mmZ [
UpsertClientTypemm[ k
,mmk l

HttpMethodmmm w
.mmw x
Postmmx |
,mm| }
token	mm~ É
,
mmÉ Ñ
new
mmÖ à
StringContent
mmâ ñ
(
mmñ ó
JsonConvert
mmó ¢
.
mm¢ £
SerializeObject
mm£ ≤
(
mm≤ ≥

masterUser
mm≥ Ω
)
mmΩ æ
)
mmæ ø
)
mmø ¿
.
mm¿ ¡
Result
mm¡ «
;
mm« »
ifoo 
(oo 
responseMessageoo #
.oo# $
IsSuccessStatusCodeoo$ 7
&&oo8 :

masterUseroo; E
.ooE F
IdooF H
==ooH J
$numooJ K
)ooK L
{pp 
stringqq 
jsonResponseqq '
=qq( )
responseMessageqq* 9
.qq9 :
Contentqq: A
.qqA B
ReadAsStringAsyncqqB S
(qqS T
)qqT U
.qqU V
ResultqqV \
;qq\ ]
TempDatarr 
[rr 

UserHelperrr '
.rr' (
SuccessMessagerr( 6
]rr6 7
=rr8 9
Convertrr: A
.rrA B
ToStringrrB J
(rrJ K"
_stringLocalizerSharedrrK a
[rra b
$strrrb v
]rrv w
)rrw x
;rrx y
returntt 
RedirectToActiontt +
(tt+ ,
nameoftt, 2
(tt2 3

ClientTypett3 =
)tt= >
)tt> ?
;tt? @
}uu 
ifvv 
(vv 
responseMessagevv #
.vv# $
IsSuccessStatusCodevv$ 7
)vv7 8
{ww 
stringxx 
jsonResponsexx '
=xx( )
responseMessagexx* 9
.xx9 :
Contentxx: A
.xxA B
ReadAsStringAsyncxxB S
(xxS T
)xxT U
.xxU V
ResultxxV \
;xx\ ]
TempDatayy 
[yy 

UserHelperyy '
.yy' (
SuccessMessageyy( 6
]yy6 7
=yy8 9
Convertyy: A
.yyA B
ToStringyyB J
(yyJ K"
_stringLocalizerSharedyyK a
[yya b
$stryyb v
]yyv w
)yyw x
;yyx y
return{{ 
Redirect{{ #
({{# $
$"{{$ &
$str{{& L
{{{L M

masterUser{{M W
.{{W X
Id{{X Z
}{{Z [
"{{[ \
){{\ ]
;{{] ^
}|| 
else}} 
{~~ 
TempData 
[ 

UserHelper '
.' (
ErrorMessage( 4
]4 5
=6 7
Convert8 ?
.? @
ToString@ H
(H I
responseMessageI X
.X Y
ContentY `
.` a
ReadAsStringAsynca r
(r s
)s t
.t u
Resultu {
){ |
;| }
return
ÄÄ 
RedirectToAction
ÄÄ +
(
ÄÄ+ ,
$str
ÄÄ, 8
)
ÄÄ8 9
;
ÄÄ9 :
}
ÅÅ 
}
ÇÇ 
catch
ÉÉ 
(
ÉÉ 
	Exception
ÉÉ 
e
ÉÉ 
)
ÉÉ 
{
ÑÑ 
_helper
ÖÖ 
.
ÖÖ 
LogExceptions
ÖÖ %
(
ÖÖ% &
e
ÖÖ& '
)
ÖÖ' (
;
ÖÖ( )
TempData
ÜÜ 
[
ÜÜ 

UserHelper
ÜÜ #
.
ÜÜ# $
ErrorMessage
ÜÜ$ 0
]
ÜÜ0 1
=
ÜÜ2 3
Convert
ÜÜ4 ;
.
ÜÜ; <
ToString
ÜÜ< D
(
ÜÜD E
e
ÜÜE F
.
ÜÜF G

StackTrace
ÜÜG Q
)
ÜÜQ R
;
ÜÜR S
return
áá 
RedirectToAction
áá '
(
áá' (
$str
áá( 4
)
áá4 5
;
áá5 6
}
àà 
}
ââ 	
}
ää 
}ãã Åò
DD:\EltizamLive\Eltizam.Web\Controllers\MasterDepartmentController.cs
	namespace 	
EltizamValuation
 
. 
Web 
. 
Controllers *
{ 
public 

class &
MasterDepartmentController +
:, -
BaseController. <
{ 
private 
readonly 
IConfiguration '
_cofiguration( 5
;5 6
private 
readonly 
IStringLocalizer )
<) *
Shared* 0
>0 1"
_stringLocalizerShared2 H
;H I
private 
readonly 
IHelper  
_helper! (
;( )
public &
MasterDepartmentController )
() *
IConfiguration* 8
configuration9 F
,F G
IStringLocalizerH X
<X Y
SharedY _
>_ `!
stringLocalizerShareda v
,v w
IHelperx 
helper
Ä Ü
)
Ü á
{ 	
_cofiguration 
= 
configuration )
;) *"
_stringLocalizerShared   "
=  # $!
stringLocalizerShared  % :
;  : ;
_helper!! 
=!! 
helper!! 
;!! 
}"" 	
public$$ 
IActionResult$$ 
Departments$$ (
($$( )
)$$) *
{%% 	

ModelState&& 
.&& 
Clear&& 
(&& 
)&& 
;&& 
try'' 
{(( 
int** 
roleId** 
=** 
_helper** $
.**$ %
GetLoggedInRoleId**% 6
(**6 7
)**7 8
;**8 9
if++ 
(++ 
!++ 
CheckRoleAccess++ $
(++$ % 
ModulePermissionEnum++% 9
.++9 :
DepartmentMaster++: J
,++J K
PermissionEnum++L Z
.++Z [
View++[ _
,++_ `
roleId++a g
)++g h
)++h i
return,, 
RedirectToAction,, +
(,,+ ,
AppConstants,,, 8
.,,8 9
AccessRestriction,,9 J
,,,J K
AppConstants,,L X
.,,X Y
Home,,Y ]
),,] ^
;,,^ _
HttpContext-- 
.-- 
Request-- #
.--# $
Cookies--$ +
.--+ ,
TryGetValue--, 7
(--7 8

UserHelper--8 B
.--B C
EltizamToken--C O
,--O P
out--Q T
string--U [
token--\ a
)--a b
;--b c
APIRepository.. 
objapi.. $
=..% &
new..' *
APIRepository..+ 8
(..8 9
_cofiguration..9 F
)..F G
;..G H
List// 
<// "
MasterDepartmentEntity// +
>//+ ,
	oRoleList//- 6
=//7 8
new//9 <
List//= A
<//A B"
MasterDepartmentEntity//B X
>//X Y
(//Y Z
)//Z [
;//[ \
HttpResponseMessage00 #
responseMessage00$ 3
=004 5
objapi006 <
.00< =
APICommunication00= M
(00M N
APIURLHelper00N Z
.00Z [
GetAllDepartment00[ k
,00k l

HttpMethod00m w
.00w x
Get00x {
,00{ |
token	00} Ç
)
00Ç É
.
00É Ñ
Result
00Ñ ä
;
00ä ã
if11 
(11 
responseMessage11 #
.11# $
IsSuccessStatusCode11$ 7
)117 8
{22 
string33 
jsonResponse33 '
=33( )
responseMessage33* 9
.339 :
Content33: A
.33A B
ReadAsStringAsync33B S
(33S T
)33T U
.33U V
Result33V \
;33\ ]
var44 
data44 
=44 
JsonConvert44 *
.44* +
DeserializeObject44+ <
<44< =
APIResponseEntity44= N
<44N O
List44O S
<44S T"
MasterDepartmentEntity44T j
>44j k
>44k l
>44l m
(44m n
jsonResponse44n z
)44z {
;44{ |
	oRoleList55 
=55 
data55  $
.55$ %
_object55% ,
;55, -
return77 
View77 
(77  
	oRoleList77  )
)77) *
;77* +
}88 
}99 
catch:: 
(:: 
	Exception:: 
e:: 
):: 
{;; 
_helper<< 
.<< 
LogExceptions<< %
(<<% &
e<<& '
)<<' (
;<<( )
ViewBag== 
.== 
errormessage== $
===% &
Convert==' .
.==. /
ToString==/ 7
(==7 8
e==8 9
.==9 :

StackTrace==: D
)==D E
;==E F
return>> 
View>> 
(>> 
$str>> #
)>># $
;>>$ %
}?? 
return@@ 
View@@ 
(@@ 
)@@ 
;@@ 
}AA 	
[EE 	
HttpPostEE	 
]EE 
[FF 	
RouteFF	 
(FF 
$strFF 2
)FF2 3
]FF3 4
publicGG 
IActionResultGG 
DepartmentManageGG -
(GG- .
intGG. 1
idGG2 4
,GG4 5"
MasterDepartmentEntityGG6 L
masterDepartmentGGM ]
)GG] ^
{HH 	
tryII 
{JJ 
varLL 
actionLL 
=LL 
masterDepartmentLL -
.LL- .
IdLL. 0
==LL1 3
$numLL4 5
?LL6 7
PermissionEnumLL8 F
.LLF G
AddLLG J
:LLK L
PermissionEnumLLM [
.LL[ \
EditLL\ `
;LL` a
intNN 
roleIdNN 
=NN 
_helperNN $
.NN$ %
GetLoggedInRoleIdNN% 6
(NN6 7
)NN7 8
;NN8 9
ifOO 
(OO 
!OO 
CheckRoleAccessOO $
(OO$ % 
ModulePermissionEnumOO% 9
.OO9 :
DepartmentMasterOO: J
,OOJ K
actionOOL R
,OOR S
roleIdOOT Z
)OOZ [
)OO[ \
returnPP 
RedirectToActionPP +
(PP+ ,
AppConstantsPP, 8
.PP8 9
AccessRestrictionPP9 J
,PPJ K
AppConstantsPPL X
.PPX Y
HomePPY ]
)PP] ^
;PP^ _
ifSS 
(SS 
masterDepartmentSS $
.SS$ %
IdSS% '
==SS( *
$numSS+ ,
)SS, -
masterDepartmentTT $
.TT$ %
	CreatedByTT% .
=TT/ 0
_helperTT1 8
.TT8 9
GetLoggedInUserIdTT9 J
(TTJ K
)TTK L
;TTL M
masterDepartmentUU  
.UU  !

ModifiedByUU! +
=UU, -
_helperUU. 5
.UU5 6
GetLoggedInUserIdUU6 G
(UUG H
)UUH I
;UUI J
HttpContextYY 
.YY 
RequestYY #
.YY# $
CookiesYY$ +
.YY+ ,
TryGetValueYY, 7
(YY7 8

UserHelperYY8 B
.YYB C
EltizamTokenYYC O
,YYO P
outYYQ T
stringYYU [
tokenYY\ a
)YYa b
;YYb c
APIRepositoryZZ 
objapiZZ $
=ZZ% &
newZZ' *
(ZZ* +
_cofigurationZZ+ 8
)ZZ8 9
;ZZ9 :
HttpResponseMessage\\ #
responseMessage\\$ 3
=\\4 5
objapi\\6 <
.\\< =
APICommunication\\= M
(\\M N
APIURLHelper\\N Z
.\\Z [
UpsertDepartment\\[ k
,\\k l

HttpMethod\\m w
.\\w x
Post\\x |
,\\| }
token	\\~ É
,
\\É Ñ
new
\\Ö à
StringContent
\\â ñ
(
\\ñ ó
JsonConvert
\\ó ¢
.
\\¢ £
SerializeObject
\\£ ≤
(
\\≤ ≥
masterDepartment
\\≥ √
)
\\√ ƒ
)
\\ƒ ≈
)
\\≈ ∆
.
\\∆ «
Result
\\« Õ
;
\\Õ Œ
if^^ 
(^^ 
responseMessage^^ #
.^^# $
IsSuccessStatusCode^^$ 7
&&^^8 :
masterDepartment^^; K
.^^K L
Id^^L N
==^^N P
$num^^P Q
)^^Q R
{__ 
TempData`` 
[`` 
$str`` ,
]``, -
=``. /
$str``0 D
;``D E
stringaa 
jsonResponseaa '
=aa( )
responseMessageaa* 9
.aa9 :
Contentaa: A
.aaA B
ReadAsStringAsyncaaB S
(aaS T
)aaT U
.aaU V
ResultaaV \
;aa\ ]

ModelStatebb 
.bb 
Clearbb $
(bb$ %
)bb% &
;bb& '
returncc 
RedirectToActioncc +
(cc+ ,
nameofcc, 2
(cc2 3
Departmentscc3 >
)cc> ?
)cc? @
;cc@ A
}ee 
ifff 
(ff 
responseMessageff #
.ff# $
IsSuccessStatusCodeff$ 7
)ff7 8
{gg 
TempDatahh 
[hh 
$strhh ,
]hh, -
=hh. /
$strhh0 D
;hhD E
stringii 
jsonResponseii '
=ii( )
responseMessageii* 9
.ii9 :
Contentii: A
.iiA B
ReadAsStringAsynciiB S
(iiS T
)iiT U
.iiU V
ResultiiV \
;ii\ ]

ModelStatejj 
.jj 
Clearjj $
(jj$ %
)jj% &
;jj& '
returnkk 
Redirectkk #
(kk# $
$"kk$ &
$strkk& L
{kkL M
masterDepartmentkkM ]
.kk] ^
Idkk^ `
}kk` a
"kka b
)kkb c
;kkc d
}ll 
elsemm 
TempDatann 
[nn 
$strnn ,
]nn, -
=nn. /
$strnn0 C
;nnC D
}oo 
catchpp 
(pp 
	Exceptionpp 
epp 
)pp 
{qq 
_helperrr 
.rr 
LogExceptionsrr %
(rr% &
err& '
)rr' (
;rr( )
ViewBagss 
.ss 
errormessagess $
=ss% &
Convertss' .
.ss. /
ToStringss/ 7
(ss7 8
ess8 9
.ss9 :

StackTracess: D
)ssD E
;ssE F

ModelStatett 
.tt 
Cleartt  
(tt  !
)tt! "
;tt" #
returnuu 
Viewuu 
(uu 
nameofuu "
(uu" #
Departmentsuu# .
)uu. /
)uu/ 0
;uu0 1
}vv 

ModelStateww 
.ww 
Clearww 
(ww 
)ww 
;ww 
returnxx 
RedirectToActionxx #
(xx# $
nameofxx$ *
(xx* +
Departmentsxx+ 6
)xx6 7
)xx7 8
;xx8 9
}yy 	
public|| 
IActionResult|| 
DepartmentManage|| -
(||- .
int||. 1
?||1 2
id||3 5
,||6 7
string||7 =
view||> B
)||B C
{}} 	
if~~ 
(~~ 
id~~ 
!=~~ 
null~~ 
)~~ 
{ 
ViewData
ÄÄ 
[
ÄÄ 
$str
ÄÄ !
]
ÄÄ! "
=
ÄÄ# $
true
ÄÄ% )
;
ÄÄ) *
}
ÅÅ 
if
ÉÉ 
(
ÉÉ 
view
ÉÉ 
!=
ÉÉ 
null
ÉÉ 
)
ÉÉ 
{
ÑÑ 
ViewData
ÖÖ 
[
ÖÖ 
$str
ÖÖ !
]
ÖÖ! "
=
ÖÖ# $
true
ÖÖ% )
;
ÖÖ) *
}
ÜÜ $
MasterDepartmentEntity
áá "
masterDepartment
áá# 3
;
áá3 4
var
ââ 
action
ââ 
=
ââ 
id
ââ 
==
ââ 
null
ââ #
?
ââ$ %
PermissionEnum
ââ& 4
.
ââ4 5
Add
ââ5 8
:
ââ9 :
PermissionEnum
ââ; I
.
ââI J
Edit
ââJ N
;
ââN O
int
ää 
roleId
ää 
=
ää 
_helper
ää  
.
ää  !
GetLoggedInRoleId
ää! 2
(
ää2 3
)
ää3 4
;
ää4 5
if
åå 
(
åå 
!
åå 
CheckRoleAccess
åå  
(
åå  !"
ModulePermissionEnum
åå! 5
.
åå5 6
DepartmentMaster
åå6 F
,
ååF G
action
ååH N
,
ååN O
roleId
ååP V
)
ååV W
)
ååW X
return
çç 
RedirectToAction
çç '
(
çç' (
AppConstants
çç( 4
.
çç4 5
AccessRestriction
çç5 F
,
ççF G
AppConstants
ççH T
.
ççT U
Home
ççU Y
)
ççY Z
;
ççZ [
if
éé 
(
éé 
id
éé 
==
éé 
null
éé 
||
éé 
id
éé  
<=
éé! #
$num
éé$ %
)
éé% &
{
èè 
masterDepartment
êê  
=
êê! "
new
êê# &$
MasterDepartmentEntity
êê' =
(
êê= >
)
êê> ?
;
êê? @
masterDepartment
ëë  
.
ëë  !
IsActive
ëë! )
=
ëë* +
$num
ëë, -
;
ëë- .
return
íí 
View
íí 
(
íí 
masterDepartment
íí ,
)
íí, -
;
íí- .
}
ìì 
else
îî 
{
ïï 
HttpContext
ññ 
.
ññ 
Request
ññ #
.
ññ# $
Cookies
ññ$ +
.
ññ+ ,
TryGetValue
ññ, 7
(
ññ7 8

UserHelper
ññ8 B
.
ññB C
EltizamToken
ññC O
,
ññO P
out
ññQ T
string
ññU [
token
ññ\ a
)
ñña b
;
ññb c
APIRepository
óó 
objapi
óó $
=
óó% &
new
óó' *
(
óó* +
_cofiguration
óó+ 8
)
óó8 9
;
óó9 :!
HttpResponseMessage
òò #
responseMessage
òò$ 3
=
òò4 5
objapi
òò6 <
.
òò< =
APICommunication
òò= M
(
òòM N
APIURLHelper
òòN Z
.
òòZ [
GetDepartmentById
òò[ l
+
òòm n
$str
òòo r
+
òòs t
id
òòu w
,
òòw x

HttpMethodòòy É
.òòÉ Ñ
GetòòÑ á
,òòá à
tokenòòâ é
)òòé è
.òòè ê
Resultòòê ñ
;òòñ ó
if
öö 
(
öö 
responseMessage
öö #
.
öö# $!
IsSuccessStatusCode
öö$ 7
)
öö7 8
{
õõ 
string
úú 
jsonResponse
úú '
=
úú( )
responseMessage
úú* 9
.
úú9 :
Content
úú: A
.
úúA B
ReadAsStringAsync
úúB S
(
úúS T
)
úúT U
.
úúU V
Result
úúV \
;
úú\ ]
var
ùù 
data
ùù 
=
ùù 
JsonConvert
ùù *
.
ùù* +
DeserializeObject
ùù+ <
<
ùù< =
APIResponseEntity
ùù= N
<
ùùN O$
MasterDepartmentEntity
ùùO e
>
ùùe f
>
ùùf g
(
ùùg h
jsonResponse
ùùh t
)
ùùt u
;
ùùu v
if
ûû 
(
ûû 
data
ûû 
.
ûû 
_object
ûû $
is
ûû% '
null
ûû( ,
)
ûû, -
return
üü 
NotFound
üü '
(
üü' (
)
üü( )
;
üü) *
return
°° 
View
°° 
(
°°  
data
°°  $
.
°°$ %
_object
°°% ,
)
°°, -
;
°°- .
}
¢¢ 
return
££ 
NotFound
££ 
(
££  
)
££  !
;
££! "
}
§§ 
}
•• 	
[
ßß 	
HttpGet
ßß	 
]
ßß 
[
®® 	
Route
®®	 
(
®® 
$str
®® *
)
®®* +
]
®®+ ,
public
©© 
IActionResult
©© 
DepartmentView
©© +
(
©©+ ,
int
©©, /
?
©©/ 0
id
©©1 3
)
©©3 4
{
™™ 	$
MasterDepartmentEntity
¨¨ "
masterDepartment
¨¨# 3
;
¨¨3 4
if
≠≠ 
(
≠≠ 
id
≠≠ 
==
≠≠ 
null
≠≠ 
||
≠≠ 
id
≠≠  
<=
≠≠! #
$num
≠≠$ %
)
≠≠% &
{
ÆÆ 
masterDepartment
ØØ  
=
ØØ! "
new
ØØ# &$
MasterDepartmentEntity
ØØ' =
(
ØØ= >
)
ØØ> ?
;
ØØ? @
return
∞∞ 
View
∞∞ 
(
∞∞ 
masterDepartment
∞∞ ,
)
∞∞, -
;
∞∞- .
}
±± 
else
≤≤ 
{
≥≥ 
HttpContext
¥¥ 
.
¥¥ 
Request
¥¥ #
.
¥¥# $
Cookies
¥¥$ +
.
¥¥+ ,
TryGetValue
¥¥, 7
(
¥¥7 8

UserHelper
¥¥8 B
.
¥¥B C
EltizamToken
¥¥C O
,
¥¥O P
out
¥¥Q T
string
¥¥U [
token
¥¥\ a
)
¥¥a b
;
¥¥b c
APIRepository
µµ 
objapi
µµ $
=
µµ% &
new
µµ' *
(
µµ* +
_cofiguration
µµ+ 8
)
µµ8 9
;
µµ9 :!
HttpResponseMessage
∂∂ #
responseMessage
∂∂$ 3
=
∂∂4 5
objapi
∂∂6 <
.
∂∂< =
APICommunication
∂∂= M
(
∂∂M N
APIURLHelper
∂∂N Z
.
∂∂Z [
GetDepartmentById
∂∂[ l
+
∂∂m n
$str
∂∂o r
+
∂∂s t
id
∂∂u w
,
∂∂w x

HttpMethod∂∂y É
.∂∂É Ñ
Get∂∂Ñ á
,∂∂á à
token∂∂â é
)∂∂é è
.∂∂è ê
Result∂∂ê ñ
;∂∂ñ ó
if
∏∏ 
(
∏∏ 
responseMessage
∏∏ #
.
∏∏# $!
IsSuccessStatusCode
∏∏$ 7
)
∏∏7 8
{
ππ 
string
∫∫ 
jsonResponse
∫∫ '
=
∫∫( )
responseMessage
∫∫* 9
.
∫∫9 :
Content
∫∫: A
.
∫∫A B
ReadAsStringAsync
∫∫B S
(
∫∫S T
)
∫∫T U
.
∫∫U V
Result
∫∫V \
;
∫∫\ ]
var
ªª 
data
ªª 
=
ªª 
JsonConvert
ªª *
.
ªª* +
DeserializeObject
ªª+ <
<
ªª< =
APIResponseEntity
ªª= N
<
ªªN O$
MasterDepartmentEntity
ªªO e
>
ªªe f
>
ªªf g
(
ªªg h
jsonResponse
ªªh t
)
ªªt u
;
ªªu v
if
ºº 
(
ºº 
data
ºº 
.
ºº 
_object
ºº $
is
ºº% '
null
ºº( ,
)
ºº, -
return
ΩΩ 
NotFound
ΩΩ '
(
ΩΩ' (
)
ΩΩ( )
;
ΩΩ) *
return
øø 
View
øø 
(
øø  
data
øø  $
.
øø$ %
_object
øø% ,
)
øø, -
;
øø- .
}
¿¿ 
return
¡¡ 
NotFound
¡¡ 
(
¡¡  
)
¡¡  !
;
¡¡! "
}
¬¬ 
}
√√ 	
}
ƒƒ 
}≈≈ ö£
ED:\EltizamLive\Eltizam.Web\Controllers\MasterDesignationController.cs
	namespace 	
EltizamValuation
 
. 
Web 
. 
Controllers *
{ 
public 

class '
MasterDesignationController ,
:- .
BaseController/ =
{ 
private 
readonly 
IConfiguration '
_cofiguration( 5
;5 6
private 
readonly 
IStringLocalizer )
<) *
Shared* 0
>0 1"
_stringLocalizerShared2 H
;H I
private 
readonly 
IHelper  
_helper! (
;( )
public '
MasterDesignationController *
(* +
IConfiguration+ 9
configuration: G
,G H
IStringLocalizerI Y
<Y Z
SharedZ `
>` a!
stringLocalizerSharedb w
,w x
IHelper	y Ä
helper
Å á
)
á à
{ 	
_cofiguration 
= 
configuration )
;) *"
_stringLocalizerShared "
=# $!
stringLocalizerShared% :
;: ;
_helper 
= 
helper 
; 
}   	
public"" 
IActionResult"" 
Designations"" )
("") *
)""* +
{## 	

ModelState$$ 
.$$ 
Clear$$ 
($$ 
)$$ 
;$$ 
try%% 
{&& 
int'' 
roleId'' 
='' 
_helper'' $
.''$ %
GetLoggedInRoleId''% 6
(''6 7
)''7 8
;''8 9
if(( 
((( 
!(( 
CheckRoleAccess(( $
((($ % 
ModulePermissionEnum((% 9
.((9 :
DesignationMaster((: K
,((K L
PermissionEnum((M [
.(([ \
View((\ `
,((` a
roleId((b h
)((h i
)((i j
return)) 
RedirectToAction)) +
())+ ,
AppConstants)), 8
.))8 9
AccessRestriction))9 J
,))J K
AppConstants))L X
.))X Y
Home))Y ]
)))] ^
;))^ _
RolePermissionModel** #
objPermssion**$ 0
=**1 2
UtilityHelper**3 @
.**@ A
GetCntrActionAccess**A T
(**T U
(**U V
int**V Y
)**Y Z 
ModulePermissionEnum**Z n
.**n o

RoleMaster**o y
,**y z
roleId	**{ Å
)
**Å Ç
;
**Ç É
ViewBag++ 
.++ 
_objPermission++ &
=++' (
objPermssion++) 5
;++5 6
HttpContext,, 
.,, 
Request,, #
.,,# $
Cookies,,$ +
.,,+ ,
TryGetValue,,, 7
(,,7 8

UserHelper,,8 B
.,,B C
EltizamToken,,C O
,,,O P
out,,Q T
string,,U [
token,,\ a
),,a b
;,,b c
APIRepository-- 
objapi-- $
=--% &
new--' *
APIRepository--+ 8
(--8 9
_cofiguration--9 F
)--F G
;--G H
List.. 
<.. #
MasterDesignationEntity.. ,
>.., -
	oRoleList... 7
=..8 9
new..: =
List..> B
<..B C#
MasterDesignationEntity..C Z
>..Z [
(..[ \
)..\ ]
;..] ^
HttpResponseMessage// #
responseMessage//$ 3
=//4 5
objapi//6 <
.//< =
APICommunication//= M
(//M N
APIURLHelper//N Z
.//Z [
GetAllDesignation//[ l
,//l m

HttpMethod//n x
.//x y
Get//y |
,//| }
token	//~ É
)
//É Ñ
.
//Ñ Ö
Result
//Ö ã
;
//ã å
if00 
(00 
responseMessage00 #
.00# $
IsSuccessStatusCode00$ 7
)007 8
{11 
string22 
jsonResponse22 '
=22( )
responseMessage22* 9
.229 :
Content22: A
.22A B
ReadAsStringAsync22B S
(22S T
)22T U
.22U V
Result22V \
;22\ ]
var33 
data33 
=33 
JsonConvert33 *
.33* +
DeserializeObject33+ <
<33< =
APIResponseEntity33= N
<33N O
List33O S
<33S T#
MasterDesignationEntity33T k
>33k l
>33l m
>33m n
(33n o
jsonResponse33o {
)33{ |
;33| }
	oRoleList44 
=44 
data44  $
.44$ %
_object44% ,
;44, -
return66 
View66 
(66  
	oRoleList66  )
)66) *
;66* +
}77 
}88 
catch99 
(99 
	Exception99 
e99 
)99 
{:: 
_helper;; 
.;; 
LogExceptions;; %
(;;% &
e;;& '
);;' (
;;;( )
ViewBag<< 
.<< 
errormessage<< $
=<<% &
Convert<<' .
.<<. /
ToString<</ 7
(<<7 8
e<<8 9
.<<9 :

StackTrace<<: D
)<<D E
;<<E F
return== 
View== 
(== 
$str== #
)==# $
;==$ %
}>> 
return?? 
View?? 
(?? 
)?? 
;?? 
}@@ 	
[BB 	
HttpPostBB	 
]BB 
[CC 	
RouteCC	 
(CC 
$strCC 4
)CC4 5
]CC5 6
publicDD 
IActionResultDD 
DesignationManageDD .
(DD. /
intDD/ 2
idDD3 5
,DD5 6#
MasterDesignationEntityDD7 N
masterDesignationDDO `
)DD` a
{EE 	
tryFF 
{GG 
varII 
actionII 
=II 
masterDesignationII .
.II. /
IdII/ 1
==II2 4
$numII5 6
?II7 8
PermissionEnumII9 G
.IIG H
AddIIH K
:IIL M
PermissionEnumIIN \
.II\ ]
EditII] a
;IIa b
intKK 
roleIdKK 
=KK 
_helperKK $
.KK$ %
GetLoggedInRoleIdKK% 6
(KK6 7
)KK7 8
;KK8 9
ifLL 
(LL 
!LL 
CheckRoleAccessLL $
(LL$ % 
ModulePermissionEnumLL% 9
.LL9 :
DesignationMasterLL: K
,LLK L
actionLLM S
,LLS T
roleIdLLU [
)LL[ \
)LL\ ]
returnMM 
RedirectToActionMM +
(MM+ ,
AppConstantsMM, 8
.MM8 9
AccessRestrictionMM9 J
,MMJ K
AppConstantsMML X
.MMX Y
HomeMMY ]
)MM] ^
;MM^ _
ifPP 
(PP 
masterDesignationPP %
.PP% &
IdPP& (
==PP) +
$numPP, -
)PP- .
masterDesignationQQ %
.QQ% &
	CreatedByQQ& /
=QQ0 1
_helperQQ2 9
.QQ9 :
GetLoggedInUserIdQQ: K
(QQK L
)QQL M
;QQM N
masterDesignationRR !
.RR! "

ModifiedByRR" ,
=RR- .
_helperRR/ 6
.RR6 7
GetLoggedInUserIdRR7 H
(RRH I
)RRI J
;RRJ K
HttpContextTT 
.TT 
RequestTT #
.TT# $
CookiesTT$ +
.TT+ ,
TryGetValueTT, 7
(TT7 8

UserHelperTT8 B
.TTB C
EltizamTokenTTC O
,TTO P
outTTQ T
stringTTU [
tokenTT\ a
)TTa b
;TTb c
APIRepositoryUU 
objapiUU $
=UU% &
newUU' *
(UU* +
_cofigurationUU+ 8
)UU8 9
;UU9 :
HttpResponseMessageWW #
responseMessageWW$ 3
=WW4 5
objapiWW6 <
.WW< =
APICommunicationWW= M
(WWM N
APIURLHelperWWN Z
.WWZ [
UpsertDesignationWW[ l
,WWl m

HttpMethodWWn x
.WWx y
PostWWy }
,WW} ~
token	WW Ñ
,
WWÑ Ö
new
WWÜ â
StringContent
WWä ó
(
WWó ò
JsonConvert
WWò £
.
WW£ §
SerializeObject
WW§ ≥
(
WW≥ ¥
masterDesignation
WW¥ ≈
)
WW≈ ∆
)
WW∆ «
)
WW« »
.
WW» …
Result
WW… œ
;
WWœ –
ifYY 
(YY 
responseMessageYY #
.YY# $
IsSuccessStatusCodeYY$ 7
&&YY8 :
masterDesignationYY; L
.YYL M
IdYYM O
==YYO Q
$numYYQ R
)YYR S
{ZZ 
TempData[[ 
[[[ 
$str[[ ,
][[, -
=[[. /
$str[[0 D
;[[D E
string\\ 
jsonResponse\\ '
=\\( )
responseMessage\\* 9
.\\9 :
Content\\: A
.\\A B
ReadAsStringAsync\\B S
(\\S T
)\\T U
.\\U V
Result\\V \
;\\\ ]

ModelState]] 
.]] 
Clear]] $
(]]$ %
)]]% &
;]]& '
return^^ 
Redirect^^ #
(^^# $
$"^^$ &
$str^^& N
{^^N O
masterDesignation^^O `
.^^` a
Id^^a c
}^^c d
"^^d e
)^^e f
;^^f g
}__ 
if`` 
(`` 
responseMessage`` #
.``# $
IsSuccessStatusCode``$ 7
)``7 8
{aa 
TempDatabb 
[bb 
$strbb ,
]bb, -
=bb. /
$strbb0 D
;bbD E
stringcc 
jsonResponsecc '
=cc( )
responseMessagecc* 9
.cc9 :
Contentcc: A
.ccA B
ReadAsStringAsyncccB S
(ccS T
)ccT U
.ccU V
ResultccV \
;cc\ ]

ModelStatedd 
.dd 
Cleardd $
(dd$ %
)dd% &
;dd& '
returnee 
RedirectToActionee +
(ee+ ,
nameofee, 2
(ee2 3
Designationsee3 ?
)ee? @
)ee@ A
;eeA B
}ff 
elsegg 
TempDatahh 
[hh 
$strhh ,
]hh, -
=hh. /
$strhh0 C
;hhC D
}ii 
catchjj 
(jj 
	Exceptionjj 
ejj 
)jj 
{kk 
_helperll 
.ll 
LogExceptionsll %
(ll% &
ell& '
)ll' (
;ll( )
ViewBagmm 
.mm 
errormessagemm $
=mm% &
Convertmm' .
.mm. /
ToStringmm/ 7
(mm7 8
emm8 9
.mm9 :

StackTracemm: D
)mmD E
;mmE F

ModelStatenn 
.nn 
Clearnn  
(nn  !
)nn! "
;nn" #
returnoo 
Viewoo 
(oo 
nameofoo "
(oo" #
Designationsoo# /
)oo/ 0
)oo0 1
;oo1 2
}pp 

ModelStateqq 
.qq 
Clearqq 
(qq 
)qq 
;qq 
returnrr 
RedirectToActionrr #
(rr# $
nameofrr$ *
(rr* +
Designationsrr+ 7
)rr7 8
)rr8 9
;rr9 :
}ss 	
publicuu 
IActionResultuu 
DesignationManageuu .
(uu. /
intuu/ 2
?uu2 3
iduu4 6
)uu6 7
{vv 	
ifww 
(ww 
idww 
!=ww 
nullww 
)ww 
{xx 
ViewDatayy 
[yy 
$stryy !
]yy! "
=yy# $
trueyy% )
;yy) *
}zz #
MasterDesignationEntity{{ #
masterDesignation{{$ 5
;{{5 6
var}} 
action}} 
=}} 
id}} 
==}} 
null}} #
?}}$ %
PermissionEnum}}& 4
.}}4 5
Add}}5 8
:}}9 :
PermissionEnum}}; I
.}}I J
Edit}}J N
;}}N O
int~~ 
roleId~~ 
=~~ 
_helper~~  
.~~  !
GetLoggedInRoleId~~! 2
(~~2 3
)~~3 4
;~~4 5
if
ÄÄ 
(
ÄÄ 
!
ÄÄ 
CheckRoleAccess
ÄÄ  
(
ÄÄ  !"
ModulePermissionEnum
ÄÄ! 5
.
ÄÄ5 6
DesignationMaster
ÄÄ6 G
,
ÄÄG H
action
ÄÄI O
,
ÄÄO P
roleId
ÄÄQ W
)
ÄÄW X
)
ÄÄX Y
return
ÅÅ 
RedirectToAction
ÅÅ '
(
ÅÅ' (
AppConstants
ÅÅ( 4
.
ÅÅ4 5
AccessRestriction
ÅÅ5 F
,
ÅÅF G
AppConstants
ÅÅH T
.
ÅÅT U
Home
ÅÅU Y
)
ÅÅY Z
;
ÅÅZ [
if
ÑÑ 
(
ÑÑ 
id
ÑÑ 
==
ÑÑ 
null
ÑÑ 
||
ÑÑ 
id
ÑÑ  
<=
ÑÑ! #
$num
ÑÑ$ %
)
ÑÑ% &
{
ÖÖ 
masterDesignation
ÜÜ !
=
ÜÜ" #
new
ÜÜ$ '%
MasterDesignationEntity
ÜÜ( ?
(
ÜÜ? @
)
ÜÜ@ A
;
ÜÜA B
masterDesignation
áá !
.
áá! "
IsActive
áá" *
=
áá+ ,
$num
áá- .
;
áá. /
return
àà 
View
àà 
(
àà 
masterDesignation
àà -
)
àà- .
;
àà. /
}
ââ 
else
ää 
{
ãã 
HttpContext
åå 
.
åå 
Request
åå #
.
åå# $
Cookies
åå$ +
.
åå+ ,
TryGetValue
åå, 7
(
åå7 8

UserHelper
åå8 B
.
ååB C
EltizamToken
ååC O
,
ååO P
out
ååQ T
string
ååU [
token
åå\ a
)
ååa b
;
ååb c
APIRepository
çç 
objapi
çç $
=
çç% &
new
çç' *
(
çç* +
_cofiguration
çç+ 8
)
çç8 9
;
çç9 :!
HttpResponseMessage
éé #
responseMessage
éé$ 3
=
éé4 5
objapi
éé6 <
.
éé< =
APICommunication
éé= M
(
ééM N
APIURLHelper
ééN Z
.
ééZ [
GetesignationById
éé[ l
+
éém n
$str
ééo r
+
éés t
id
ééu w
,
ééw x

HttpMethodééy É
.ééÉ Ñ
GetééÑ á
,ééá à
tokenééâ é
)ééé è
.ééè ê
Resultééê ñ
;ééñ ó
if
êê 
(
êê 
responseMessage
êê #
.
êê# $!
IsSuccessStatusCode
êê$ 7
)
êê7 8
{
ëë 
string
íí 
jsonResponse
íí '
=
íí( )
responseMessage
íí* 9
.
íí9 :
Content
íí: A
.
ííA B
ReadAsStringAsync
ííB S
(
ííS T
)
ííT U
.
ííU V
Result
ííV \
;
íí\ ]
var
ìì 
data
ìì 
=
ìì 
JsonConvert
ìì *
.
ìì* +
DeserializeObject
ìì+ <
<
ìì< =
APIResponseEntity
ìì= N
<
ììN O%
MasterDesignationEntity
ììO f
>
ììf g
>
ììg h
(
ììh i
jsonResponse
ììi u
)
ììu v
;
ììv w
if
îî 
(
îî 
data
îî 
.
îî 
_object
îî $
is
îî% '
null
îî( ,
)
îî, -
return
ïï 
NotFound
ïï '
(
ïï' (
)
ïï( )
;
ïï) *
return
óó 
View
óó 
(
óó  
data
óó  $
.
óó$ %
_object
óó% ,
)
óó, -
;
óó- .
}
òò 
return
ôô 
NotFound
ôô 
(
ôô  
)
ôô  !
;
ôô! "
}
öö 
}
õõ 	
[
ùù 	
HttpGet
ùù	 
]
ùù 
[
ûû 	
Route
ûû	 
(
ûû 
$str
ûû 2
)
ûû2 3
]
ûû3 4
public
üü 
IActionResult
üü 
DesignationView
üü ,
(
üü, -
int
üü- 0
?
üü0 1
id
üü2 4
)
üü4 5
{
†† 	
if
°° 
(
°° 
id
°° 
!=
°° 
null
°° 
)
°° 
{
¢¢ 
ViewData
££ 
[
££ 
$str
££ !
]
££! "
=
££# $
true
££% )
;
££) *
}
§§ 
var
¶¶ 
action
¶¶ 
=
¶¶ 
id
¶¶ 
==
¶¶ 
null
¶¶ #
?
¶¶$ %
PermissionEnum
¶¶& 4
.
¶¶4 5
Add
¶¶5 8
:
¶¶9 :
PermissionEnum
¶¶; I
.
¶¶I J
Edit
¶¶J N
;
¶¶N O
int
®® 
roleId
®® 
=
®® 
_helper
®®  
.
®®  !
GetLoggedInRoleId
®®! 2
(
®®2 3
)
®®3 4
;
®®4 5
if
©© 
(
©© 
!
©© 
CheckRoleAccess
©©  
(
©©  !"
ModulePermissionEnum
©©! 5
.
©©5 6
DesignationMaster
©©6 G
,
©©G H
action
©©I O
,
©©O P
roleId
©©Q W
)
©©W X
)
©©X Y
return
™™ 
RedirectToAction
™™ '
(
™™' (
AppConstants
™™( 4
.
™™4 5
AccessRestriction
™™5 F
,
™™F G
AppConstants
™™H T
.
™™T U
Home
™™U Y
)
™™Y Z
;
™™Z [%
MasterDesignationEntity
´´ #
masterDesignation
´´$ 5
;
´´5 6
if
¨¨ 
(
¨¨ 
id
¨¨ 
==
¨¨ 
null
¨¨ 
||
¨¨ 
id
¨¨  
<=
¨¨! #
$num
¨¨$ %
)
¨¨% &
{
≠≠ 
masterDesignation
ÆÆ !
=
ÆÆ" #
new
ÆÆ$ '%
MasterDesignationEntity
ÆÆ( ?
(
ÆÆ? @
)
ÆÆ@ A
;
ÆÆA B
return
ØØ 
View
ØØ 
(
ØØ 
masterDesignation
ØØ -
)
ØØ- .
;
ØØ. /
}
∞∞ 
else
±± 
{
≤≤ 
HttpContext
≥≥ 
.
≥≥ 
Request
≥≥ #
.
≥≥# $
Cookies
≥≥$ +
.
≥≥+ ,
TryGetValue
≥≥, 7
(
≥≥7 8

UserHelper
≥≥8 B
.
≥≥B C
EltizamToken
≥≥C O
,
≥≥O P
out
≥≥Q T
string
≥≥U [
token
≥≥\ a
)
≥≥a b
;
≥≥b c
APIRepository
¥¥ 
objapi
¥¥ $
=
¥¥% &
new
¥¥' *
(
¥¥* +
_cofiguration
¥¥+ 8
)
¥¥8 9
;
¥¥9 :!
HttpResponseMessage
µµ #
responseMessage
µµ$ 3
=
µµ4 5
objapi
µµ6 <
.
µµ< =
APICommunication
µµ= M
(
µµM N
APIURLHelper
µµN Z
.
µµZ [
GetesignationById
µµ[ l
+
µµm n
$str
µµo r
+
µµs t
id
µµu w
,
µµw x

HttpMethodµµy É
.µµÉ Ñ
GetµµÑ á
,µµá à
tokenµµâ é
)µµé è
.µµè ê
Resultµµê ñ
;µµñ ó
if
∑∑ 
(
∑∑ 
responseMessage
∑∑ #
.
∑∑# $!
IsSuccessStatusCode
∑∑$ 7
)
∑∑7 8
{
∏∏ 
string
ππ 
jsonResponse
ππ '
=
ππ( )
responseMessage
ππ* 9
.
ππ9 :
Content
ππ: A
.
ππA B
ReadAsStringAsync
ππB S
(
ππS T
)
ππT U
.
ππU V
Result
ππV \
;
ππ\ ]
var
∫∫ 
data
∫∫ 
=
∫∫ 
JsonConvert
∫∫ *
.
∫∫* +
DeserializeObject
∫∫+ <
<
∫∫< =
APIResponseEntity
∫∫= N
<
∫∫N O%
MasterDesignationEntity
∫∫O f
>
∫∫f g
>
∫∫g h
(
∫∫h i
jsonResponse
∫∫i u
)
∫∫u v
;
∫∫v w
if
ªª 
(
ªª 
data
ªª 
.
ªª 
_object
ªª $
is
ªª% '
null
ªª( ,
)
ªª, -
return
ºº 
NotFound
ºº '
(
ºº' (
)
ºº( )
;
ºº) *
return
ææ 
View
ææ 
(
ææ  
data
ææ  $
.
ææ$ %
_object
ææ% ,
)
ææ, -
;
ææ- .
}
øø 
return
¿¿ 
NotFound
¿¿ 
(
¿¿  
)
¿¿  !
;
¿¿! "
}
¡¡ 
}
¬¬ 	
}
√√ 
}ƒƒ ƒ 
DD:\EltizamLive\Eltizam.Web\Controllers\MasterDictionaryController.cs
	namespace 	
EltizamValuation
 
. 
Web 
. 
Controllers *
{ 
public 

class &
MasterDictionaryController +
:, -
BaseController. <
{ 
private 
readonly 
IConfiguration '
_cofiguration( 5
;5 6
private 
readonly 
IStringLocalizer )
<) *
Shared* 0
>0 1"
_stringLocalizerShared2 H
;H I
private 
readonly 
IHelper  
_helper! (
;( )
public &
MasterDictionaryController )
() *
IConfiguration* 8
configuration9 F
,F G
IStringLocalizerH X
<X Y
SharedY _
>_ `!
stringLocalizerShareda v
,v w
IHelperx 
helper
Ä Ü
)
Ü á
{ 	
_cofiguration 
= 
configuration )
;) *"
_stringLocalizerShared "
=# $!
stringLocalizerShared% :
;: ;
_helper 
= 
helper 
; 
} 	
public   
IActionResult   

Dictionary   '
(  ' (
)  ( )
{!! 	

ModelState"" 
."" 
Clear"" 
("" 
)"" 
;"" 
try## 
{$$ 
int&& 
roleId&& 
=&& 
_helper&& $
.&&$ %
GetLoggedInRoleId&&% 6
(&&6 7
)&&7 8
;&&8 9
if'' 
('' 
!'' 
CheckRoleAccess'' $
(''$ % 
ModulePermissionEnum''% 9
.''9 :
DictionaryMaster'': J
,''J K
PermissionEnum''L Z
.''Z [
View''[ _
,''_ `
roleId''a g
)''g h
)''h i
return(( 
RedirectToAction(( +
(((+ ,
AppConstants((, 8
.((8 9
AccessRestriction((9 J
,((J K
AppConstants((L X
.((X Y
Home((Y ]
)((] ^
;((^ _
HttpContext** 
.** 
Request** #
.**# $
Cookies**$ +
.**+ ,
TryGetValue**, 7
(**7 8

UserHelper**8 B
.**B C
EltizamToken**C O
,**O P
out**Q T
string**U [
token**\ a
)**a b
;**b c
APIRepository++ 
objapi++ $
=++% &
new++' *
APIRepository+++ 8
(++8 9
_cofiguration++9 F
)++F G
;++G H
return,, 
View,, 
(,, 
),, 
;,, 
}-- 
catch.. 
(.. 
	Exception.. 
e.. 
).. 
{// 
_helper00 
.00 
LogExceptions00 %
(00% &
e00& '
)00' (
;00( )
ViewBag11 
.11 
errormessage11 $
=11% &
Convert11' .
.11. /
ToString11/ 7
(117 8
e118 9
.119 :

StackTrace11: D
)11D E
;11E F
return22 
View22 
(22 
$str22 #
)22# $
;22$ %
}33 
}44 	
[77 	
HttpGet77	 
]77 
public88 
IActionResult88 "
MasterDictionaryManage88 3
(883 4
int884 7
?887 8
id889 ;
,88; <
int88= @
?88@ A
IsView88B H
)88H I
{99 	"
MasterDictionaryEntity:: ""
masterDictionaryEntity::# 9
;::9 :
var<< 
action<< 
=<< 
IsView<< 
==<<  "
$num<<# $
?<<% &
PermissionEnum<<' 5
.<<5 6
View<<6 :
:<<; <
(<<= >
id<<> @
==<<A C
null<<D H
?<<I J
PermissionEnum<<K Y
.<<Y Z
Add<<Z ]
:<<^ _
PermissionEnum<<` n
.<<n o
Edit<<o s
)<<s t
;<<t u
int>> 
roleId>> 
=>> 
_helper>>  
.>>  !
GetLoggedInRoleId>>! 2
(>>2 3
)>>3 4
;>>4 5
if@@ 
(@@ 
!@@ 
CheckRoleAccess@@  
(@@  ! 
ModulePermissionEnum@@! 5
.@@5 6
DictionaryMaster@@6 F
,@@F G
action@@H N
,@@N O
roleId@@P V
)@@V W
)@@W X
returnAA 
RedirectToActionAA '
(AA' (
AppConstantsAA( 4
.AA4 5
AccessRestrictionAA5 F
,AAF G
AppConstantsAAH T
.AAT U
HomeAAU Y
)AAY Z
;AAZ [
varDD 
vwDD 
=DD 
IsViewDD 
==DD 
$numDD  
;DD  !

FooterInfoEE 
(EE 
TableNameEnumEE $
.EE$ %
Master_DictionaryEE% 6
,EE6 7
_cofigurationEE8 E
,EEE F
idEEG I
,EEI J
vwEEK M
)EEM N
;EEN O
ifGG 
(GG 
idGG 
==GG 
nullGG 
||GG 
idGG  
<=GG! #
$numGG$ %
)GG% &
{HH "
masterDictionaryEntityII &
=II' (
newII) ,"
MasterDictionaryEntityII- C
(IIC D
)IID E
;IIE F"
masterDictionaryEntityJJ &
.JJ& '
IsActiveJJ' /
=JJ0 1
trueJJ2 6
;JJ6 7
returnKK 
ViewKK 
(KK "
masterDictionaryEntityKK 2
)KK2 3
;KK3 4
}LL 
elseMM 
{NN 
HttpContextOO 
.OO 
RequestOO #
.OO# $
CookiesOO$ +
.OO+ ,
TryGetValueOO, 7
(OO7 8

UserHelperOO8 B
.OOB C
EltizamTokenOOC O
,OOO P
outOOQ T
stringOOU [
tokenOO\ a
)OOa b
;OOb c
APIRepositoryPP 
objapiPP $
=PP% &
newPP' *
(PP* +
_cofigurationPP+ 8
)PP8 9
;PP9 :
HttpResponseMessageQQ #
responseMessageQQ$ 3
=QQ4 5
objapiQQ6 <
.QQ< =
APICommunicationQQ= M
(QQM N
APIURLHelperQQN Z
.QQZ [$
GetDictionaryDetailsByIdQQ[ s
+QQt u
$strQQv y
+QQz {
idQQ| ~
,QQ~ 

HttpMethod
QQÄ ä
.
QQä ã
Get
QQã é
,
QQé è
token
QQê ï
)
QQï ñ
.
QQñ ó
Result
QQó ù
;
QQù û
ifSS 
(SS 
responseMessageSS #
.SS# $
IsSuccessStatusCodeSS$ 7
)SS7 8
{TT 
stringUU 
jsonResponseUU '
=UU( )
responseMessageUU* 9
.UU9 :
ContentUU: A
.UUA B
ReadAsStringAsyncUUB S
(UUS T
)UUT U
.UUU V
ResultUUV \
;UU\ ]
varVV 
dataVV 
=VV 
JsonConvertVV *
.VV* +
DeserializeObjectVV+ <
<VV< =
APIResponseEntityVV= N
<VVN O"
MasterDictionaryEntityVVO e
>VVe f
>VVf g
(VVg h
jsonResponseVVh t
)VVt u
;VVu v
ifXX 
(XX 
dataXX 
.XX 
_objectXX $
isXX% '
nullXX( ,
)XX, -
returnYY 
NotFoundYY '
(YY' (
)YY( )
;YY) *
return[[ 
View[[ 
([[  
$str[[  8
,[[8 9
data[[: >
.[[> ?
_object[[? F
)[[F G
;[[G H
}\\ 
return]] 
NotFound]] 
(]]  
)]]  !
;]]! "
}^^ 
}__ 	
publicbb 
IActionResultbb 
DictionaryAllManagebb 0
(bb0 1
intbb1 4
idbb5 7
,bb7 8
stringbb9 ?
?bb? @
descriptionbbA L
)bbL M
{cc 	

ModelStatedd 
.dd 
Cleardd 
(dd 
)dd 
;dd &
MasterDictionaryDetailByIdgg &
masterdictionarygg' 7
;gg7 8
ifhh 
(hh 
idhh 
==hh 
nullhh 
||hh 
idhh  
<=hh! #
$numhh$ %
)hh% &
{ii 
masterdictionaryjj  
=jj! "
newjj# &&
MasterDictionaryDetailByIdjj' A
(jjA B
)jjB C
;jjC D
returnkk 
Viewkk 
(kk 
masterdictionarykk ,
)kk, -
;kk- .
}ll 
elsemm 
{nn 
HttpContextoo 
.oo 
Requestoo #
.oo# $
Cookiesoo$ +
.oo+ ,
TryGetValueoo, 7
(oo7 8

UserHelperoo8 B
.ooB C
EltizamTokenooC O
,ooO P
outooQ T
stringooU [
tokenoo\ a
)ooa b
;oob c
APIRepositorypp 
objapipp $
=pp% &
newpp' *
(pp* +
_cofigurationpp+ 8
)pp8 9
;pp9 :
stringrr 
	urlHelperrr  
=rr! "
APIURLHelperrr# /
.rr/ 0
GetDictionaryByIdrr0 A
+rrB C
$strrrD G
+rrH I
idrrJ L
+rrM N
$strrrO R
+rrS T
descriptionrrU `
;rr` a
HttpResponseMessagess #
responseMessagess$ 3
=ss4 5
objapiss6 <
.ss< =
APICommunicationss= M
(ssM N
	urlHelperssN W
,ssW X

HttpMethodssY c
.ssc d
Getssd g
,ssg h
tokenssi n
)ssn o
.sso p
Resultssp v
;ssv w
ifuu 
(uu 
responseMessageuu #
.uu# $
IsSuccessStatusCodeuu$ 7
)uu7 8
{vv 
stringww 
jsonResponseww '
=ww( )
responseMessageww* 9
.ww9 :
Contentww: A
.wwA B
ReadAsStringAsyncwwB S
(wwS T
)wwT U
.wwU V
ResultwwV \
;ww\ ]
varxx 
dataxx 
=xx 
JsonConvertxx *
.xx* +
DeserializeObjectxx+ <
<xx< =
Listxx= A
<xxA B&
MasterDictionaryDetailByIdxxB \
>xx\ ]
>xx] ^
(xx^ _
jsonResponsexx_ k
)xxk l
;xxl m

FooterInfo{{ 
({{ 
TableNameEnum{{ ,
.{{, -
Master_Dictionary{{- >
,{{> ?
_cofiguration{{@ M
,{{M N
id{{O Q
){{Q R
;{{R S
if}} 
(}} 
data}} 
is}} 
null}}  $
)}}$ %
return~~ 
NotFound~~ '
(~~' (
)~~( )
;~~) *
ViewData
ÄÄ 
[
ÄÄ 
$str
ÄÄ ,
]
ÄÄ, -
=
ÄÄ. /
data
ÄÄ0 4
;
ÄÄ4 5
return
ÇÇ 
View
ÇÇ 
(
ÇÇ  
)
ÇÇ  !
;
ÇÇ! "
}
ÉÉ 
return
ÑÑ 
NotFound
ÑÑ 
(
ÑÑ  
)
ÑÑ  !
;
ÑÑ! "
}
ÖÖ 
}
áá 	
public
ââ 
IActionResult
ââ %
DictionaryDetailsManage
ââ 4
(
ââ4 5
int
ââ5 8
id
ââ9 ;
,
ââ; <
int
ââ= @
?
ââ@ A
status
ââB H
,
ââH I
string
ââJ P
?
ââP Q
pdesc
ââR W
)
ââW X
{
ää 	

ModelState
ãã 
.
ãã 
Clear
ãã 
(
ãã 
)
ãã 
;
ãã (
MasterDictionaryDetailById
çç &
masterdictionary
çç' 7
;
çç7 8
if
éé 
(
éé 
id
éé 
>
éé 
$num
éé 
&&
éé 
status
éé  
==
éé! #
$num
éé$ %
)
éé% &
{
èè 
masterdictionary
êê  
=
êê! "
new
êê# &(
MasterDictionaryDetailById
êê' A
(
êêA B
)
êêB C
;
êêC D
masterdictionary
ëë  
.
ëë  !
DictionaryId
ëë! -
=
ëë. /
id
ëë0 2
;
ëë2 3
masterdictionary
íí  
.
íí  !
ParentDescription
íí! 2
=
íí3 4
pdesc
íí5 :
;
íí: ;
return
ìì 
View
ìì 
(
ìì 
masterdictionary
ìì ,
)
ìì, -
;
ìì- .
}
îî 
else
ïï 
{
ññ 
HttpContext
óó 
.
óó 
Request
óó #
.
óó# $
Cookies
óó$ +
.
óó+ ,
TryGetValue
óó, 7
(
óó7 8

UserHelper
óó8 B
.
óóB C
EltizamToken
óóC O
,
óóO P
out
óóQ T
string
óóU [
token
óó\ a
)
óóa b
;
óób c
APIRepository
ôô 
objapi
ôô $
=
ôô% &
new
ôô' *
(
ôô* +
_cofiguration
ôô+ 8
)
ôô8 9
;
ôô9 :
var
õõ 
	urlHelper
õõ 
=
õõ 
APIURLHelper
õõ  ,
.
õõ, -
GetDictionaryById
õõ- >
+
õõ? @
$str
õõA D
+
õõE F
id
õõG I
;
õõI J!
HttpResponseMessage
úú #
responseMessage
úú$ 3
=
úú4 5
objapi
úú6 <
.
úú< =
APICommunication
úú= M
(
úúM N
	urlHelper
úúN W
,
úúW X

HttpMethod
úúY c
.
úúc d
Get
úúd g
,
úúg h
token
úúi n
)
úún o
.
úúo p
Result
úúp v
;
úúv w
if
ûû 
(
ûû 
responseMessage
ûû #
.
ûû# $!
IsSuccessStatusCode
ûû$ 7
)
ûû7 8
{
üü 
string
†† 
jsonResponse
†† '
=
††( )
responseMessage
††* 9
.
††9 :
Content
††: A
.
††A B
ReadAsStringAsync
††B S
(
††S T
)
††T U
.
††U V
Result
††V \
;
††\ ]
var
°° 
data
°° 
=
°° 
JsonConvert
°° *
.
°°* +
DeserializeObject
°°+ <
<
°°< =(
MasterDictionaryDetailById
°°= W
>
°°W X
(
°°X Y
jsonResponse
°°Y e
)
°°e f
;
°°f g

FooterInfo
§§ 
(
§§ 
TableNameEnum
§§ ,
.
§§, -
Master_Dictionary
§§- >
,
§§> ?
_cofiguration
§§@ M
,
§§M N
id
§§O Q
)
§§Q R
;
§§R S
if
¶¶ 
(
¶¶ 
data
¶¶ 
is
¶¶ 
null
¶¶  $
)
¶¶$ %
return
ßß 
NotFound
ßß '
(
ßß' (
)
ßß( )
;
ßß) *
data
™™ 
.
™™ 
ParentDescription
™™ *
=
™™+ ,
pdesc
™™- 2
;
™™2 3
return
´´ 
View
´´ 
(
´´  
data
´´  $
)
´´$ %
;
´´% &
}
≠≠ 
return
ØØ 
View
ØØ 
(
ØØ 
)
ØØ 
;
ØØ 
}
∞∞ 
}
≤≤ 	
public
¥¥ 
IActionResult
¥¥ #
DictionaryDetailsView
¥¥ 2
(
¥¥2 3
int
¥¥3 6
id
¥¥7 9
)
¥¥9 :
{
µµ 	
var
∑∑ 
action
∑∑ 
=
∑∑ 
PermissionEnum
∑∑ '
.
∑∑' (
View
∑∑( ,
;
∑∑, -
int
ππ 
roleId
ππ 
=
ππ 
_helper
ππ  
.
ππ  !
GetLoggedInRoleId
ππ! 2
(
ππ2 3
)
ππ3 4
;
ππ4 5
if
∫∫ 
(
∫∫ 
!
∫∫ 
CheckRoleAccess
∫∫  
(
∫∫  !"
ModulePermissionEnum
∫∫! 5
.
∫∫5 6
DictionaryMaster
∫∫6 F
,
∫∫F G
action
∫∫H N
,
∫∫N O
roleId
∫∫P V
)
∫∫V W
)
∫∫W X
return
ªª 
RedirectToAction
ªª '
(
ªª' (
AppConstants
ªª( 4
.
ªª4 5
AccessRestriction
ªª5 F
,
ªªF G
AppConstants
ªªH T
.
ªªT U
Home
ªªU Y
)
ªªY Z
;
ªªZ [(
MasterDictionaryDetailById
ΩΩ &
model
ΩΩ' ,
=
ΩΩ- .
new
ΩΩ/ 2(
MasterDictionaryDetailById
ΩΩ3 M
(
ΩΩM N
)
ΩΩN O
;
ΩΩO P
HttpContext
øø 
.
øø 
Request
øø 
.
øø  
Cookies
øø  '
.
øø' (
TryGetValue
øø( 3
(
øø3 4

UserHelper
øø4 >
.
øø> ?
EltizamToken
øø? K
,
øøK L
out
øøM P
string
øøQ W
token
øøX ]
)
øø] ^
;
øø^ _
ViewData
¿¿ 
[
¿¿ 
$str
¿¿ 
]
¿¿  
=
¿¿! "
id
¿¿# %
;
¿¿% &
APIRepository
¡¡ 
objapi
¡¡  
=
¡¡! "
new
¡¡# &
(
¡¡& '
_cofiguration
¡¡' 4
)
¡¡4 5
;
¡¡5 6
var
ƒƒ 
	urlHelper
ƒƒ 
=
ƒƒ 
APIURLHelper
ƒƒ (
.
ƒƒ( )
GetDictionaryById
ƒƒ) :
+
ƒƒ; <
$str
ƒƒ= @
+
ƒƒA B
id
ƒƒC E
;
ƒƒE F!
HttpResponseMessage
≈≈ 
responseMessage
≈≈  /
=
≈≈0 1
objapi
≈≈2 8
.
≈≈8 9
APICommunication
≈≈9 I
(
≈≈I J
	urlHelper
≈≈J S
,
≈≈S T

HttpMethod
≈≈U _
.
≈≈_ `
Get
≈≈` c
,
≈≈c d
token
≈≈e j
)
≈≈j k
.
≈≈k l
Result
≈≈l r
;
≈≈r s
if
«« 
(
«« 
responseMessage
«« 
.
««  !
IsSuccessStatusCode
««  3
)
««3 4
{
»» 
string
…… 
jsonResponse
…… #
=
……$ %
responseMessage
……& 5
.
……5 6
Content
……6 =
.
……= >
ReadAsStringAsync
……> O
(
……O P
)
……P Q
.
……Q R
Result
……R X
;
……X Y
var
   
data
   
=
   
JsonConvert
   &
.
  & '
DeserializeObject
  ' 8
<
  8 9(
MasterDictionaryDetailById
  9 S
>
  S T
(
  T U
jsonResponse
  U a
)
  a b
;
  b c

FooterInfo
ÕÕ 
(
ÕÕ 
TableNameEnum
ÕÕ (
.
ÕÕ( )
Master_Dictionary
ÕÕ) :
,
ÕÕ: ;
_cofiguration
ÕÕ< I
,
ÕÕI J
id
ÕÕK M
,
ÕÕM N
true
ÕÕO S
)
ÕÕS T
;
ÕÕT U
if
œœ 
(
œœ 
data
œœ 
is
œœ 
null
œœ  
)
œœ  !
return
–– 
NotFound
–– #
(
––# $
)
––$ %
;
––% &
return
”” 
View
”” 
(
”” 
data
””  
)
””  !
;
””! "
}
’’ 
return
◊◊ 
View
◊◊ 
(
◊◊ 
model
◊◊ 
)
◊◊ 
;
◊◊ 
}
ÿÿ 	
[
€€ 	
HttpPost
€€	 
]
€€ 
public
‹‹ 
IActionResult
‹‹ %
DictionaryDetailsManage
‹‹ 4
(
‹‹4 5
int
‹‹5 8
?
‹‹8 9
Id
‹‹: <
,
‹‹< =(
MasterDictionaryDetailById
‹‹> X
masterdictionary
‹‹Y i
)
‹‹i j
{
›› 	
try
ﬁﬁ 
{
ﬂﬂ 
var
·· 
action
·· 
=
·· 
Id
·· 
==
··  "
null
··# '
?
··( )
PermissionEnum
··* 8
.
··8 9
Edit
··9 =
:
··> ?
PermissionEnum
··@ N
.
··N O
View
··O S
;
··S T
int
„„ 
roleId
„„ 
=
„„ 
_helper
„„ $
.
„„$ %
GetLoggedInRoleId
„„% 6
(
„„6 7
)
„„7 8
;
„„8 9
if
‰‰ 
(
‰‰ 
!
‰‰ 
CheckRoleAccess
‰‰ $
(
‰‰$ %"
ModulePermissionEnum
‰‰% 9
.
‰‰9 :
DictionaryMaster
‰‰: J
,
‰‰J K
action
‰‰L R
,
‰‰R S
roleId
‰‰T Z
)
‰‰Z [
)
‰‰[ \
return
ÂÂ 
RedirectToAction
ÂÂ +
(
ÂÂ+ ,
AppConstants
ÂÂ, 8
.
ÂÂ8 9
AccessRestriction
ÂÂ9 J
,
ÂÂJ K
AppConstants
ÂÂL X
.
ÂÂX Y
Home
ÂÂY ]
)
ÂÂ] ^
;
ÂÂ^ _
if
ËË 
(
ËË 
masterdictionary
ËË $
.
ËË$ %
Id
ËË% '
==
ËË( *
$num
ËË+ ,
)
ËË, -
masterdictionary
ÈÈ $
.
ÈÈ$ %
	CreatedBy
ÈÈ% .
=
ÈÈ/ 0
_helper
ÈÈ1 8
.
ÈÈ8 9
GetLoggedInUserId
ÈÈ9 J
(
ÈÈJ K
)
ÈÈK L
;
ÈÈL M
masterdictionary
ÍÍ  
.
ÍÍ  !

ModifiedBy
ÍÍ! +
=
ÍÍ, -
_helper
ÍÍ. 5
.
ÍÍ5 6
GetLoggedInUserId
ÍÍ6 G
(
ÍÍG H
)
ÍÍH I
;
ÍÍI J
HttpContext
ÏÏ 
.
ÏÏ 
Request
ÏÏ #
.
ÏÏ# $
Cookies
ÏÏ$ +
.
ÏÏ+ ,
TryGetValue
ÏÏ, 7
(
ÏÏ7 8

UserHelper
ÏÏ8 B
.
ÏÏB C
EltizamToken
ÏÏC O
,
ÏÏO P
out
ÏÏQ T
string
ÏÏU [
token
ÏÏ\ a
)
ÏÏa b
;
ÏÏb c
APIRepository
ÌÌ 
objapi
ÌÌ $
=
ÌÌ% &
new
ÌÌ' *
(
ÌÌ* +
_cofiguration
ÌÌ+ 8
)
ÌÌ8 9
;
ÌÌ9 :!
HttpResponseMessage
ÔÔ #
responseMessage
ÔÔ$ 3
=
ÔÔ4 5
objapi
ÔÔ6 <
.
ÔÔ< =
APICommunication
ÔÔ= M
(
ÔÔM N
APIURLHelper
ÔÔN Z
.
ÔÔZ [
UpsertDictionary
ÔÔ[ k
,
ÔÔk l

HttpMethod
ÔÔm w
.
ÔÔw x
Post
ÔÔx |
,
ÔÔ| }
tokenÔÔ~ É
,ÔÔÉ Ñ
newÔÔÖ à
StringContentÔÔâ ñ
(ÔÔñ ó
JsonConvertÔÔó ¢
.ÔÔ¢ £
SerializeObjectÔÔ£ ≤
(ÔÔ≤ ≥ 
masterdictionaryÔÔ≥ √
)ÔÔ√ ƒ
)ÔÔƒ ≈
)ÔÔ≈ ∆
.ÔÔ∆ «
ResultÔÔ« Õ
;ÔÔÕ Œ
if
ÒÒ 
(
ÒÒ 
responseMessage
ÒÒ #
.
ÒÒ# $!
IsSuccessStatusCode
ÒÒ$ 7
)
ÒÒ7 8
{
ÚÚ 
string
ÛÛ 
jsonResponse
ÛÛ '
=
ÛÛ( )
responseMessage
ÛÛ* 9
.
ÛÛ9 :
Content
ÛÛ: A
.
ÛÛA B
ReadAsStringAsync
ÛÛB S
(
ÛÛS T
)
ÛÛT U
.
ÛÛU V
Result
ÛÛV \
;
ÛÛ\ ]
TempData
ÙÙ 
[
ÙÙ 

UserHelper
ÙÙ '
.
ÙÙ' (
SuccessMessage
ÙÙ( 6
]
ÙÙ6 7
=
ÙÙ8 9
Convert
ÙÙ: A
.
ÙÙA B
ToString
ÙÙB J
(
ÙÙJ K$
_stringLocalizerShared
ÙÙK a
[
ÙÙa b
$str
ÙÙb v
]
ÙÙv w
)
ÙÙw x
;
ÙÙx y
return
˜˜ 
RedirectToAction
˜˜ +
(
˜˜+ ,
$str
˜˜, A
,
˜˜A B
new
˜˜C F
{
˜˜G H
id
˜˜I K
=
˜˜L M
masterdictionary
˜˜N ^
.
˜˜^ _
DictionaryId
˜˜_ k
,
˜˜k l
description
˜˜m x
=
˜˜y z
masterdictionary˜˜{ ã
.˜˜ã å!
ParentDescription˜˜å ù
}˜˜û ü
)˜˜ü †
;˜˜† °
}
¯¯ 
else
˘˘ 
{
˙˙ 
TempData
˚˚ 
[
˚˚ 

UserHelper
˚˚ '
.
˚˚' (
ErrorMessage
˚˚( 4
]
˚˚4 5
=
˚˚6 7
Convert
˚˚8 ?
.
˚˚? @
ToString
˚˚@ H
(
˚˚H I
responseMessage
˚˚I X
.
˚˚X Y
Content
˚˚Y `
.
˚˚` a
ReadAsStringAsync
˚˚a r
(
˚˚r s
)
˚˚s t
.
˚˚t u
Result
˚˚u {
)
˚˚{ |
;
˚˚| }
return
¸¸ 
RedirectToAction
¸¸ +
(
¸¸+ ,
$str
¸¸, A
,
¸¸A B
new
¸¸C F
{
¸¸G H
id
¸¸I K
=
¸¸L M
masterdictionary
¸¸N ^
.
¸¸^ _
DictionaryId
¸¸_ k
}
¸¸l m
)
¸¸m n
;
¸¸n o
}
˝˝ 
}
˛˛ 
catch
ˇˇ 
(
ˇˇ 
	Exception
ˇˇ 
e
ˇˇ 
)
ˇˇ 
{
ÄÄ 
_helper
ÅÅ 
.
ÅÅ 
LogExceptions
ÅÅ %
(
ÅÅ% &
e
ÅÅ& '
)
ÅÅ' (
;
ÅÅ( )
TempData
ÇÇ 
[
ÇÇ 

UserHelper
ÇÇ #
.
ÇÇ# $
ErrorMessage
ÇÇ$ 0
]
ÇÇ0 1
=
ÇÇ2 3
Convert
ÇÇ4 ;
.
ÇÇ; <
ToString
ÇÇ< D
(
ÇÇD E
e
ÇÇE F
.
ÇÇF G

StackTrace
ÇÇG Q
)
ÇÇQ R
;
ÇÇR S
return
ÉÉ 
RedirectToAction
ÉÉ '
(
ÉÉ' (
$str
ÉÉ( =
,
ÉÉ= >
new
ÉÉ? B
{
ÉÉC D
Id
ÉÉE G
=
ÉÉH I
masterdictionary
ÉÉJ Z
.
ÉÉZ [
DictionaryId
ÉÉ[ g
}
ÉÉh i
)
ÉÉi j
;
ÉÉj k
}
ÑÑ 
}
ÖÖ 	
}
ÜÜ 
}áá œê
BD:\EltizamLive\Eltizam.Web\Controllers\MasterLocationController.cs
	namespace 	
EltizamValuation
 
. 
Web 
. 
Controllers *
{ 
public 

class $
MasterLocationController )
:* +
BaseController, :
{ 
private 
readonly 
IConfiguration '
_cofiguration( 5
;5 6
private 
readonly 
IStringLocalizer )
<) *
Shared* 0
>0 1"
_stringLocalizerShared2 H
;H I
private 
readonly 
IHelper  
_helper! (
;( )
public $
MasterLocationController '
(' (
IConfiguration( 6
configuration7 D
,D E
IStringLocalizerF V
<V W
SharedW ]
>] ^!
stringLocalizerShared_ t
,t u
IHelperv }
helper	~ Ñ
)
Ñ Ö
{ 	
_cofiguration 
= 
configuration )
;) *"
_stringLocalizerShared "
=# $!
stringLocalizerShared% :
;: ;
_helper 
= 
helper 
; 
} 	
public 
IActionResult 
	Locations &
(& '
)' (
{ 	

ModelState   
.   
Clear   
(   
)   
;   
try!! 
{"" 
int$$ 
roleId$$ 
=$$ 
_helper$$ $
.$$$ %
GetLoggedInRoleId$$% 6
($$6 7
)$$7 8
;$$8 9
if%% 
(%% 
!%% 
CheckRoleAccess%% $
(%%$ % 
ModulePermissionEnum%%% 9
.%%9 :
LocationMaster%%: H
,%%H I
PermissionEnum%%J X
.%%X Y
View%%Y ]
,%%] ^
roleId%%_ e
)%%e f
)%%f g
return&& 
RedirectToAction&& +
(&&+ ,
AppConstants&&, 8
.&&8 9
AccessRestriction&&9 J
,&&J K
AppConstants&&L X
.&&X Y
Home&&Y ]
)&&] ^
;&&^ _
return'' 
View'' 
('' 
)'' 
;'' 
}(( 
catch)) 
()) 
	Exception)) 
e)) 
))) 
{** 
_helper++ 
.++ 
LogExceptions++ %
(++% &
e++& '
)++' (
;++( )
ViewBag,, 
.,, 
errormessage,, $
=,,% &
Convert,,' .
.,,. /
ToString,,/ 7
(,,7 8
e,,8 9
.,,9 :

StackTrace,,: D
),,D E
;,,E F
return.. 
View.. 
(.. 
$str.. #
)..# $
;..$ %
}// 
}00 	
public22 
IActionResult22 
LocationById22 )
(22) *
int22* -
id22. 0
)220 1
{33 	 
MasterLocationEntity44  
masterlocation44! /
;44/ 0
var77 
action77 
=77 
id77 
==77 
null77 #
?77$ %
PermissionEnum77& 4
.774 5
Add775 8
:779 :
PermissionEnum77; I
.77I J
Edit77J N
;77N O
int88 
roleId88 
=88 
_helper88  
.88  !
GetLoggedInRoleId88! 2
(882 3
)883 4
;884 5
if:: 
(:: 
!:: 
CheckRoleAccess::  
(::  ! 
ModulePermissionEnum::! 5
.::5 6
LocationMaster::6 D
,::D E
action::F L
,::L M
roleId::N T
)::T U
)::U V
return;; 
RedirectToAction;; '
(;;' (
AppConstants;;( 4
.;;4 5
AccessRestriction;;5 F
,;;F G
AppConstants;;H T
.;;T U
Home;;U Y
);;Y Z
;;;Z [
if>> 
(>> 
id>> 
==>> 
null>> 
||>> 
id>>  
<=>>! #
$num>>$ %
)>>% &
{?? 
masterlocation@@ 
=@@  
new@@! $ 
MasterLocationEntity@@% 9
(@@9 :
)@@: ;
;@@; <
returnAA 
ViewAA 
(AA 
masterlocationAA *
)AA* +
;AA+ ,
}BB 
elseCC 
{DD 
HttpContextEE 
.EE 
RequestEE #
.EE# $
CookiesEE$ +
.EE+ ,
TryGetValueEE, 7
(EE7 8

UserHelperEE8 B
.EEB C
EltizamTokenEEC O
,EEO P
outEEQ T
stringEEU [
tokenEE\ a
)EEa b
;EEb c
APIRepositoryFF 
objapiFF $
=FF% &
newFF' *
(FF* +
_cofigurationFF+ 8
)FF8 9
;FF9 :
HttpResponseMessageGG #
responseMessageGG$ 3
=GG4 5
objapiGG6 <
.GG< =
APICommunicationGG= M
(GGM N
APIURLHelperGGN Z
.GGZ [
GetLocationByIdGG[ j
+GGk l
$strGGm p
+GGq r
idGGs u
,GGu v

HttpMethod	GGw Å
.
GGÅ Ç
Get
GGÇ Ö
,
GGÖ Ü
token
GGá å
)
GGå ç
.
GGç é
Result
GGé î
;
GGî ï
ifII 
(II 
responseMessageII #
.II# $
IsSuccessStatusCodeII$ 7
)II7 8
{JJ 
stringKK 
jsonResponseKK '
=KK( )
responseMessageKK* 9
.KK9 :
ContentKK: A
.KKA B
ReadAsStringAsyncKKB S
(KKS T
)KKT U
.KKU V
ResultKKV \
;KK\ ]
varLL 
dataLL 
=LL 
JsonConvertLL *
.LL* +
DeserializeObjectLL+ <
<LL< =
APIResponseEntityLL= N
<LLN O 
MasterLocationEntityLLO c
>LLc d
>LLd e
(LLe f
jsonResponseLLf r
)LLr s
;LLs t

FooterInfoOO 
(OO 
TableNameEnumOO ,
.OO, -
Master_LocationOO- <
,OO< =
_cofigurationOO> K
,OOK L
idOOM O
)OOO P
;OOP Q
ifRR 
(RR 
dataRR 
.RR 
_objectRR $
isRR% '
nullRR( ,
)RR, -
returnSS 
NotFoundSS '
(SS' (
)SS( )
;SS) *
returnUU 
ViewUU 
(UU  
dataUU  $
.UU$ %
_objectUU% ,
)UU, -
;UU- .
}VV 
returnWW 
NotFoundWW 
(WW  
)WW  !
;WW! "
}XX 
}YY 	
public[[ 
IActionResult[[ 
LocationManage[[ +
([[+ ,
int[[, /
?[[/ 0
id[[1 3
,[[3 4
int[[5 8
?[[8 9
IsView[[: @
)[[@ A
{\\ 	 
MasterLocationEntity]]  
masterlocation]]! /
;]]/ 0
var__ 
action__ 
=__ 
IsView__ 
==__  "
$num__# $
?__% &
PermissionEnum__' 5
.__5 6
View__6 :
:__; <
(__= >
id__> @
==__A C
null__D H
?__I J
PermissionEnum__K Y
.__Y Z
Add__Z ]
:__^ _
PermissionEnum__` n
.__n o
Edit__o s
)__s t
;__t u
intaa 
roleIdaa 
=aa 
_helperaa  
.aa  !
GetLoggedInRoleIdaa! 2
(aa2 3
)aa3 4
;aa4 5
ifbb 
(bb 
!bb 
CheckRoleAccessbb  
(bb  ! 
ModulePermissionEnumbb! 5
.bb5 6
LocationMasterbb6 D
,bbD E
actionbbF L
,bbL M
roleIdbbN T
)bbT U
)bbU V
returncc 
RedirectToActioncc '
(cc' (
AppConstantscc( 4
.cc4 5
AccessRestrictioncc5 F
,ccF G
AppConstantsccH T
.ccT U
HomeccU Y
)ccY Z
;ccZ [
vargg 
vwgg 
=gg 
IsViewgg 
==gg 
$numgg  
;gg  !
ViewBaghh 
.hh 
IsViewhh 
=hh 
IsViewhh #
;hh# $

FooterInfoii 
(ii 
TableNameEnumii $
.ii$ %
Master_Locationii% 4
,ii4 5
_cofigurationii6 C
,iiC D
idiiE G
,iiG H
vwiiI K
)iiK L
;iiL M
ifkk 
(kk 
idkk 
==kk 
nullkk 
||kk 
idkk  
<=kk! #
$numkk$ %
)kk% &
{ll 
masterlocationmm 
=mm  
newmm! $ 
MasterLocationEntitymm% 9
(mm9 :
)mm: ;
;mm; <
masterlocationnn 
.nn 
IsActivenn '
=nn( )
truenn* .
;nn. /
returnoo 
Viewoo 
(oo 
masterlocationoo *
)oo* +
;oo+ ,
}pp 
elseqq 
{rr 
HttpContextss 
.ss 
Requestss #
.ss# $
Cookiesss$ +
.ss+ ,
TryGetValuess, 7
(ss7 8

UserHelperss8 B
.ssB C
EltizamTokenssC O
,ssO P
outssQ T
stringssU [
tokenss\ a
)ssa b
;ssb c
APIRepositorytt 
objapitt $
=tt% &
newtt' *
(tt* +
_cofigurationtt+ 8
)tt8 9
;tt9 :
HttpResponseMessageuu #
responseMessageuu$ 3
=uu4 5
objapiuu6 <
.uu< =
APICommunicationuu= M
(uuM N
APIURLHelperuuN Z
.uuZ [
GetLocationByIduu[ j
+uuk l
$struum p
+uuq r
iduus u
,uuu v

HttpMethod	uuw Å
.
uuÅ Ç
Get
uuÇ Ö
,
uuÖ Ü
token
uuá å
)
uuå ç
.
uuç é
Result
uué î
;
uuî ï
ifww 
(ww 
responseMessageww #
.ww# $
IsSuccessStatusCodeww$ 7
)ww7 8
{xx 
stringyy 
jsonResponseyy '
=yy( )
responseMessageyy* 9
.yy9 :
Contentyy: A
.yyA B
ReadAsStringAsyncyyB S
(yyS T
)yyT U
.yyU V
ResultyyV \
;yy\ ]
varzz 
datazz 
=zz 
JsonConvertzz *
.zz* +
DeserializeObjectzz+ <
<zz< =
APIResponseEntityzz= N
<zzN O 
MasterLocationEntityzzO c
>zzc d
>zzd e
(zze f
jsonResponsezzf r
)zzr s
;zzs t
return|| 
View|| 
(||  
data||  $
.||$ %
_object||% ,
)||, -
;||- .
}}} 
return~~ 
NotFound~~ 
(~~  
)~~  !
;~~! "
} 
}
ÄÄ 	
[
ÇÇ 	
HttpPost
ÇÇ	 
]
ÇÇ 
public
ÉÉ 
IActionResult
ÉÉ 
LocationManage
ÉÉ +
(
ÉÉ+ ,
int
ÉÉ, /
id
ÉÉ0 2
,
ÉÉ2 3"
MasterLocationEntity
ÉÉ4 H
masterlocation
ÉÉI W
)
ÉÉW X
{
ÑÑ 	
try
ÖÖ 
{
ÜÜ 
var
àà 
action
àà 
=
àà 
id
àà 
==
àà  "
null
àà# '
?
àà( )
PermissionEnum
àà* 8
.
àà8 9
Edit
àà9 =
:
àà> ?
PermissionEnum
àà@ N
.
ààN O
Add
ààO R
;
ààR S
int
ää 
roleId
ää 
=
ää 
_helper
ää $
.
ää$ %
GetLoggedInRoleId
ää% 6
(
ää6 7
)
ää7 8
;
ää8 9
if
ãã 
(
ãã 
!
ãã 
CheckRoleAccess
ãã $
(
ãã$ %"
ModulePermissionEnum
ãã% 9
.
ãã9 :
LocationMaster
ãã: H
,
ããH I
action
ããJ P
,
ããP Q
roleId
ããR X
)
ããX Y
)
ããY Z
return
åå 
RedirectToAction
åå +
(
åå+ ,
AppConstants
åå, 8
.
åå8 9
AccessRestriction
åå9 J
,
ååJ K
AppConstants
ååL X
.
ååX Y
Home
ååY ]
)
åå] ^
;
åå^ _
if
èè 
(
èè 
masterlocation
èè "
.
èè" #
Id
èè# %
==
èè& (
$num
èè) *
)
èè* +
masterlocation
êê "
.
êê" #
	CreatedBy
êê# ,
=
êê- .
_helper
êê/ 6
.
êê6 7
GetLoggedInUserId
êê7 H
(
êêH I
)
êêI J
;
êêJ K
masterlocation
ëë 
.
ëë 

ModifiedBy
ëë )
=
ëë* +
_helper
ëë, 3
.
ëë3 4
GetLoggedInUserId
ëë4 E
(
ëëE F
)
ëëF G
;
ëëG H
HttpContext
ìì 
.
ìì 
Request
ìì #
.
ìì# $
Cookies
ìì$ +
.
ìì+ ,
TryGetValue
ìì, 7
(
ìì7 8

UserHelper
ìì8 B
.
ììB C
EltizamToken
ììC O
,
ììO P
out
ììQ T
string
ììU [
token
ìì\ a
)
ììa b
;
ììb c
APIRepository
îî 
objapi
îî $
=
îî% &
new
îî' *
(
îî* +
_cofiguration
îî+ 8
)
îî8 9
;
îî9 :!
HttpResponseMessage
ññ #
responseMessage
ññ$ 3
=
ññ4 5
objapi
ññ6 <
.
ññ< =
APICommunication
ññ= M
(
ññM N
APIURLHelper
ññN Z
.
ññZ [
UpsertLocation
ññ[ i
,
ññi j

HttpMethod
ññk u
.
ññu v
Post
ññv z
,
ññz {
tokenññ| Å
,ññÅ Ç
newññÉ Ü
StringContentññá î
(ññî ï
JsonConvertññï †
.ññ† °
SerializeObjectññ° ∞
(ññ∞ ±
masterlocationññ± ø
)ññø ¿
)ññ¿ ¡
)ññ¡ ¬
.ññ¬ √
Resultññ√ …
;ññ…  
if
òò 
(
òò 
responseMessage
òò #
.
òò# $!
IsSuccessStatusCode
òò$ 7
&&
òò8 :
masterlocation
òò; I
.
òòI J
Id
òòJ L
==
òòL N
$num
òòN O
)
òòO P
{
ôô 
string
öö 
jsonResponse
öö '
=
öö( )
responseMessage
öö* 9
.
öö9 :
Content
öö: A
.
ööA B
ReadAsStringAsync
ööB S
(
ööS T
)
ööT U
.
ööU V
Result
ööV \
;
öö\ ]
TempData
õõ 
[
õõ 

UserHelper
õõ '
.
õõ' (
SuccessMessage
õõ( 6
]
õõ6 7
=
õõ8 9
Convert
õõ: A
.
õõA B
ToString
õõB J
(
õõJ K$
_stringLocalizerShared
õõK a
[
õõa b
$str
õõb v
]
õõv w
)
õõw x
;
õõx y
return
ùù 
RedirectToAction
ùù +
(
ùù+ ,
nameof
ùù, 2
(
ùù2 3
	Locations
ùù3 <
)
ùù< =
)
ùù= >
;
ùù> ?
}
ûû 
if
üü 
(
üü 
responseMessage
üü #
.
üü# $!
IsSuccessStatusCode
üü$ 7
)
üü7 8
{
†† 
string
°° 
jsonResponse
°° '
=
°°( )
responseMessage
°°* 9
.
°°9 :
Content
°°: A
.
°°A B
ReadAsStringAsync
°°B S
(
°°S T
)
°°T U
.
°°U V
Result
°°V \
;
°°\ ]
TempData
¢¢ 
[
¢¢ 

UserHelper
¢¢ '
.
¢¢' (
SuccessMessage
¢¢( 6
]
¢¢6 7
=
¢¢8 9
Convert
¢¢: A
.
¢¢A B
ToString
¢¢B J
(
¢¢J K$
_stringLocalizerShared
¢¢K a
[
¢¢a b
$str
¢¢b v
]
¢¢v w
)
¢¢w x
;
¢¢x y
return
§§ 
Redirect
§§ #
(
§§# $
$"
§§$ &
$str
§§& H
{
§§H I
masterlocation
§§I W
.
§§W X
Id
§§X Z
}
§§Z [
"
§§[ \
)
§§\ ]
;
§§] ^
}
•• 
else
¶¶ 
{
ßß 
TempData
®® 
[
®® 

UserHelper
®® '
.
®®' (
ErrorMessage
®®( 4
]
®®4 5
=
®®6 7
Convert
®®8 ?
.
®®? @
ToString
®®@ H
(
®®H I
responseMessage
®®I X
.
®®X Y
Content
®®Y `
.
®®` a
ReadAsStringAsync
®®a r
(
®®r s
)
®®s t
.
®®t u
Result
®®u {
)
®®{ |
;
®®| }
return
©© 
RedirectToAction
©© +
(
©©+ ,
$str
©©, <
,
©©< =
new
©©> A
{
©©B C
id
©©D F
=
©©G H
masterlocation
©©I W
.
©©W X
Id
©©X Z
}
©©[ \
)
©©\ ]
;
©©] ^
}
™™ 
}
´´ 
catch
¨¨ 
(
¨¨ 
	Exception
¨¨ 
e
¨¨ 
)
¨¨ 
{
≠≠ 
_helper
ÆÆ 
.
ÆÆ 
LogExceptions
ÆÆ %
(
ÆÆ% &
e
ÆÆ& '
)
ÆÆ' (
;
ÆÆ( )
TempData
ØØ 
[
ØØ 

UserHelper
ØØ #
.
ØØ# $
ErrorMessage
ØØ$ 0
]
ØØ0 1
=
ØØ2 3
Convert
ØØ4 ;
.
ØØ; <
ToString
ØØ< D
(
ØØD E
e
ØØE F
.
ØØF G

StackTrace
ØØG Q
)
ØØQ R
;
ØØR S
return
∞∞ 
RedirectToAction
∞∞ '
(
∞∞' (
$str
∞∞( 8
,
∞∞8 9
new
∞∞: =
{
∞∞> ?
Id
∞∞@ B
=
∞∞C D
masterlocation
∞∞E S
.
∞∞S T
Id
∞∞T V
}
∞∞W X
)
∞∞X Y
;
∞∞Y Z
}
±± 
}
≤≤ 	
}
≥≥ 
}¥¥ —•
BD:\EltizamLive\Eltizam.Web\Controllers\MasterPropertyController.cs
	namespace 	
EltizamValuation
 
. 
Web 
. 
Controllers *
{ 
public 

class $
MasterPropertyController )
:* +
BaseController, :
{ 
private 
readonly 
IConfiguration '
_cofiguration( 5
;5 6
private 
readonly 
IStringLocalizer )
<) *
Shared* 0
>0 1"
_stringLocalizerShared2 H
;H I
private 
readonly 
IHelper  
_helper! (
;( )
public $
MasterPropertyController '
(' (
IConfiguration( 6
configuration7 D
,D E
IStringLocalizerF V
<V W
SharedW ]
>] ^!
stringLocalizerShared_ t
,t u
IHelperv }
helper	~ Ñ
)
Ñ Ö
{ 	
_cofiguration 
= 
configuration )
;) *"
_stringLocalizerShared "
=# $!
stringLocalizerShared% :
;: ;
_helper 
= 
helper 
; 
}   	
public!! 
IActionResult!! 

Properties!! '
(!!' (
)!!( )
{"" 	
try## 
{$$ 
int&& 
roleId&& 
=&& 
_helper&& $
.&&$ %
GetLoggedInRoleId&&% 6
(&&6 7
)&&7 8
;&&8 9
if'' 
('' 
!'' 
CheckRoleAccess'' $
(''$ % 
ModulePermissionEnum''% 9
.''9 :
PropertyMaster'': H
,''H I
PermissionEnum''J X
.''X Y
View''Y ]
,''] ^
roleId''_ e
)''e f
)''f g
return(( 
RedirectToAction(( +
(((+ ,
AppConstants((, 8
.((8 9
AccessRestriction((9 J
,((J K
AppConstants((L X
.((X Y
Home((Y ]
)((] ^
;((^ _
return)) 
View)) 
()) 
))) 
;)) 
}** 
catch++ 
(++ 
	Exception++ 
e++ 
)++ 
{,, 
_helper-- 
.-- 
LogExceptions-- %
(--% &
e--& '
)--' (
;--( )
ViewBag.. 
... 
errormessage.. $
=..% &
Convert..' .
.... /
ToString../ 7
(..7 8
e..8 9
...9 :

StackTrace..: D
)..D E
;..E F
return// 
View// 
(// 
$str// #
)//# $
;//$ %
}00 
}11 	
[33 	
HttpGet33	 
]33 
public44 
IActionResult44 
PropertyManage44 +
(44+ ,
int44, /
?44/ 0
id441 3
)443 4
{55 	
var77 
action77 
=77 
id77 
==77 
null77 #
?77$ %
PermissionEnum77& 4
.774 5
Add775 8
:779 :
PermissionEnum77; I
.77I J
Edit77J N
;77N O
int88 
roleId88 
=88 
_helper88  
.88  !
GetLoggedInRoleId88! 2
(882 3
)883 4
;884 5
if:: 
(:: 
!:: 
CheckRoleAccess::  
(::  ! 
ModulePermissionEnum::! 5
.::5 6
PropertyMaster::6 D
,::D E
action::F L
,::L M
roleId::N T
)::T U
)::U V
return;; 
RedirectToAction;; '
(;;' (
AppConstants;;( 4
.;;4 5
AccessRestriction;;5 F
,;;F G
AppConstants;;H T
.;;T U
Home;;U Y
);;Y Z
;;;Z [
MasterPropertyModel<< 
masterProperty<<  .
;<<. /
if== 
(== 
id== 
==== 
null== 
||== 
id==  
<===! #
$num==$ %
)==% &
{>> 
masterProperty?? 
=??  
new??! $
MasterPropertyModel??% 8
(??8 9
)??9 :
;??: ;
masterProperty@@ 
.@@ 
IsActive@@ '
=@@( )
true@@* .
;@@. /
HttpContextBB 
.BB 
RequestBB #
.BB# $
CookiesBB$ +
.BB+ ,
TryGetValueBB, 7
(BB7 8

UserHelperBB8 B
.BBB C
EltizamTokenBBC O
,BBO P
outBBQ T
stringBBU [
tokenBB\ a
)BBa b
;BBb c
APIRepositoryCC 
objapiCC $
=CC% &
newCC' *
(CC* +
_cofigurationCC+ 8
)CC8 9
;CC9 :
HttpResponseMessageDD #
responseMessageDD$ 3
=DD4 5
objapiDD6 <
.DD< =
APICommunicationDD= M
(DDM N
APIURLHelperDDN Z
.DDZ ["
GetPropertyAmenityListDD[ q
,DDq r

HttpMethodDDs }
.DD} ~
Get	DD~ Å
,
DDÅ Ç
token
DDÉ à
)
DDà â
.
DDâ ä
Result
DDä ê
;
DDê ë
ifEE 
(EE 
responseMessageEE #
.EE# $
IsSuccessStatusCodeEE$ 7
)EE7 8
{FF 
stringGG 
jsonResponseGG '
=GG( )
responseMessageGG* 9
.GG9 :
ContentGG: A
.GGA B
ReadAsStringAsyncGGB S
(GGS T
)GGT U
.GGU V
ResultGGV \
;GG\ ]
varHH 
dataHH 
=HH 
JsonConvertHH *
.HH* +
DeserializeObjectHH+ <
<HH< =
ListHH= A
<HHA B"
MasterAmenityListModelHHB X
>HHX Y
>HHY Z
(HHZ [
jsonResponseHH[ g
)HHg h
;HHh i

FooterInfoKK 
(KK 
TableNameEnumKK ,
.KK, -
Master_PropertyKK- <
,KK< =
_cofigurationKK> K
,KKK L
idKKM O
)KKO P
;KKP Q
ifMM 
(MM 
dataMM 
isMM 
nullMM  $
)MM$ %
returnNN 
NotFoundNN '
(NN' (
)NN( )
;NN) *
masterPropertyPP "
.PP" #
AmenityListPP# .
=PP/ 0
dataPP1 5
;PP5 6
masterPropertyQQ "
.QQ" #
IsActiveQQ# +
=QQ, -
trueQQ. 2
;QQ2 3
}RR 
returnSS 
ViewSS 
(SS 
masterPropertySS *
)SS* +
;SS+ ,
}TT 
elseUU 
{VV 
HttpContextWW 
.WW 
RequestWW #
.WW# $
CookiesWW$ +
.WW+ ,
TryGetValueWW, 7
(WW7 8

UserHelperWW8 B
.WWB C
EltizamTokenWWC O
,WWO P
outWWQ T
stringWWU [
tokenWW\ a
)WWa b
;WWb c
APIRepositoryXX 
objapiXX $
=XX% &
newXX' *
(XX* +
_cofigurationXX+ 8
)XX8 9
;XX9 :
HttpResponseMessageYY #
responseMessageYY$ 3
=YY4 5
objapiYY6 <
.YY< =
APICommunicationYY= M
(YYM N
APIURLHelperYYN Z
.YYZ [
GetPropertyByIdYY[ j
+YYk l
$strYYm p
+YYq r
idYYs u
,YYu v

HttpMethod	YYw Å
.
YYÅ Ç
Get
YYÇ Ö
,
YYÖ Ü
token
YYá å
)
YYå ç
.
YYç é
Result
YYé î
;
YYî ï
if[[ 
([[ 
responseMessage[[ #
.[[# $
IsSuccessStatusCode[[$ 7
)[[7 8
{\\ 
string]] 
jsonResponse]] '
=]]( )
responseMessage]]* 9
.]]9 :
Content]]: A
.]]A B
ReadAsStringAsync]]B S
(]]S T
)]]T U
.]]U V
Result]]V \
;]]\ ]
var^^ 
data^^ 
=^^ 
JsonConvert^^ *
.^^* +
DeserializeObject^^+ <
<^^< =
APIResponseEntity^^= N
<^^N O
MasterPropertyModel^^O b
>^^b c
>^^c d
(^^d e
jsonResponse^^e q
)^^q r
;^^r s

FooterInfo`` 
(`` 
TableNameEnum`` ,
.``, -
Master_Property``- <
,``< =
_cofiguration``> K
,``K L
id``M O
)``O P
;``P Q
ifbb 
(bb 
databb 
.bb 
_objectbb $
isbb% '
nullbb( ,
)bb, -
returncc 
NotFoundcc '
(cc' (
)cc( )
;cc) *
returndd 
Viewdd 
(dd  
datadd  $
.dd$ %
_objectdd% ,
)dd, -
;dd- .
}ee 
returnff 
NotFoundff 
(ff  
)ff  !
;ff! "
}gg 
}hh 	
[jj 	
HttpPostjj	 
]jj 
publickk 
IActionResultkk 
PropertyManagekk +
(kk+ ,
intkk, /
idkk0 2
,kk2 3
MasterPropertyModelkk4 G
masterPropertykkH V
)kkV W
{ll 	
trymm 
{nn 
varpp 
actionpp 
=pp 
masterPropertypp +
.pp+ ,
Idpp, .
==pp/ 1
$numpp2 3
?pp4 5
PermissionEnumpp6 D
.ppD E
AddppE H
:ppI J
PermissionEnumppK Y
.ppY Z
EditppZ ^
;pp^ _
intrr 
roleIdrr 
=rr 
_helperrr $
.rr$ %
GetLoggedInRoleIdrr% 6
(rr6 7
)rr7 8
;rr8 9
ifss 
(ss 
!ss 
CheckRoleAccessss $
(ss$ % 
ModulePermissionEnumss% 9
.ss9 :
PropertyMasterss: H
,ssH I
actionssJ P
,ssP Q
roleIdssR X
)ssX Y
)ssY Z
returntt 
RedirectToActiontt +
(tt+ ,
AppConstantstt, 8
.tt8 9
AccessRestrictiontt9 J
,ttJ K
AppConstantsttL X
.ttX Y
HomettY ]
)tt] ^
;tt^ _
ifww 
(ww 
masterPropertyww "
.ww" #
Idww# %
==ww& (
$numww) *
)ww* +
masterPropertyxx "
.xx" #
	CreatedByxx# ,
=xx- .
_helperxx/ 6
.xx6 7
GetLoggedInUserIdxx7 H
(xxH I
)xxI J
;xxJ K
masterPropertyyy 
.yy 

ModifiedByyy )
=yy* +
_helperyy, 3
.yy3 4
GetLoggedInUserIdyy4 E
(yyE F
)yyF G
;yyG H
masterProperty{{ 
.{{ 
PropertySubTypeId{{ 0
={{1 2
masterProperty{{3 A
.{{A B
PropertySubTypeId{{B S
=={{T V
$num{{W X
?{{Y Z
null{{[ _
:{{` a
masterProperty{{b p
.{{p q
PropertySubTypeId	{{q Ç
;
{{Ç É
masterProperty|| 
.|| 
FurnishedId|| *
=||- .
masterProperty||/ =
.||= >
FurnishedId||> I
==||J L
$num||M N
?||O P
null||Q U
:||V W
masterProperty||X f
.||f g
FurnishedId||g r
;||r s
HttpContext~~ 
.~~ 
Request~~ #
.~~# $
Cookies~~$ +
.~~+ ,
TryGetValue~~, 7
(~~7 8

UserHelper~~8 B
.~~B C
EltizamToken~~C O
,~~O P
out~~Q T
string~~U [
token~~\ a
)~~a b
;~~b c
APIRepository 
objapi $
=% &
new' *
(* +
_cofiguration+ 8
)8 9
;9 :!
HttpResponseMessage
ÅÅ #
responseMessage
ÅÅ$ 3
=
ÅÅ4 5
objapi
ÅÅ6 <
.
ÅÅ< =
APICommunication
ÅÅ= M
(
ÅÅM N
APIURLHelper
ÅÅN Z
.
ÅÅZ [
UpsertProperty
ÅÅ[ i
,
ÅÅi j

HttpMethod
ÅÅk u
.
ÅÅu v
Post
ÅÅv z
,
ÅÅz {
tokenÅÅ| Å
,ÅÅÅ Ç
newÅÅÉ Ü
StringContentÅÅá î
(ÅÅî ï
JsonConvertÅÅï †
.ÅÅ† °
SerializeObjectÅÅ° ∞
(ÅÅ∞ ±
masterPropertyÅÅ± ø
)ÅÅø ¿
)ÅÅ¿ ¡
)ÅÅ¡ ¬
.ÅÅ¬ √
ResultÅÅ√ …
;ÅÅ…  
if
ÉÉ 
(
ÉÉ 
responseMessage
ÉÉ #
.
ÉÉ# $!
IsSuccessStatusCode
ÉÉ$ 7
&&
ÉÉ8 :
masterProperty
ÉÉ; I
.
ÉÉI J
Id
ÉÉJ L
==
ÉÉL N
$num
ÉÉN O
)
ÉÉO P
{
ÑÑ 
string
ÖÖ 
jsonResponse
ÖÖ '
=
ÖÖ( )
responseMessage
ÖÖ* 9
.
ÖÖ9 :
Content
ÖÖ: A
.
ÖÖA B
ReadAsStringAsync
ÖÖB S
(
ÖÖS T
)
ÖÖT U
.
ÖÖU V
Result
ÖÖV \
;
ÖÖ\ ]
TempData
ÜÜ 
[
ÜÜ 

UserHelper
ÜÜ '
.
ÜÜ' (
SuccessMessage
ÜÜ( 6
]
ÜÜ6 7
=
ÜÜ8 9
Convert
ÜÜ: A
.
ÜÜA B
ToString
ÜÜB J
(
ÜÜJ K$
_stringLocalizerShared
ÜÜK a
[
ÜÜa b
$str
ÜÜb v
]
ÜÜv w
)
ÜÜw x
;
ÜÜx y
return
àà 
RedirectToAction
àà +
(
àà+ ,
$str
àà, 8
)
àà8 9
;
àà9 :
}
ââ 
if
ää 
(
ää 
responseMessage
ää #
.
ää# $!
IsSuccessStatusCode
ää$ 7
)
ää7 8
{
ãã 
string
åå 
jsonResponse
åå '
=
åå( )
responseMessage
åå* 9
.
åå9 :
Content
åå: A
.
ååA B
ReadAsStringAsync
ååB S
(
ååS T
)
ååT U
.
ååU V
Result
ååV \
;
åå\ ]
TempData
çç 
[
çç 

UserHelper
çç '
.
çç' (
SuccessMessage
çç( 6
]
çç6 7
=
çç8 9
Convert
çç: A
.
ççA B
ToString
ççB J
(
ççJ K$
_stringLocalizerShared
ççK a
[
çça b
$str
ççb v
]
ççv w
)
ççw x
;
ççx y
return
èè 
Redirect
èè #
(
èè# $
$"
èè$ &
$str
èè& H
{
èèH I
masterProperty
èèI W
.
èèW X
Id
èèX Z
}
èèZ [
"
èè[ \
)
èè\ ]
;
èè] ^
}
êê 
else
ëë 
{
íí 
TempData
ìì 
[
ìì 

UserHelper
ìì '
.
ìì' (
ErrorMessage
ìì( 4
]
ìì4 5
=
ìì6 7
Convert
ìì8 ?
.
ìì? @
ToString
ìì@ H
(
ììH I
responseMessage
ììI X
.
ììX Y
Content
ììY `
.
ìì` a
ReadAsStringAsync
ììa r
(
ììr s
)
ììs t
.
ììt u
Result
ììu {
)
ìì{ |
;
ìì| }
return
îî 
RedirectToAction
îî +
(
îî+ ,
$str
îî, <
,
îî< =
new
îî> A
{
îîB C
id
îîD F
=
îîG H
masterProperty
îîI W
.
îîW X
Id
îîX Z
}
îî[ \
)
îî\ ]
;
îî] ^
}
ïï 
}
ññ 
catch
óó 
(
óó 
	Exception
óó 
e
óó 
)
óó 
{
òò 
_helper
ôô 
.
ôô 
LogExceptions
ôô %
(
ôô% &
e
ôô& '
)
ôô' (
;
ôô( )
TempData
öö 
[
öö 

UserHelper
öö #
.
öö# $
ErrorMessage
öö$ 0
]
öö0 1
=
öö2 3
Convert
öö4 ;
.
öö; <
ToString
öö< D
(
ööD E
e
ööE F
.
ööF G

StackTrace
ööG Q
)
ööQ R
;
ööR S
return
õõ 
RedirectToAction
õõ '
(
õõ' (
$str
õõ( 8
,
õõ8 9
new
õõ: =
{
õõ> ?
Id
õõ@ B
=
õõC D
masterProperty
õõE S
.
õõS T
Id
õõT V
}
õõW X
)
õõX Y
;
õõY Z
}
úú 
}
ùù 	
[
üü 	
HttpGet
üü	 
]
üü 
[
†† 	
Route
††	 
(
†† 
$str
†† .
)
††. /
]
††/ 0
public
°° 
IActionResult
°° 
PropertyDetail
°° +
(
°°+ ,
int
°°, /
?
°°/ 0
id
°°1 3
)
°°3 4
{
¢¢ 	
var
•• 
action
•• 
=
•• 
id
•• 
==
•• 
null
•• #
?
••$ %
PermissionEnum
••& 4
.
••4 5
Edit
••5 9
:
••: ;
PermissionEnum
••< J
.
••J K
View
••K O
;
••O P
int
ßß 
roleId
ßß 
=
ßß 
_helper
ßß  
.
ßß  !
GetLoggedInRoleId
ßß! 2
(
ßß2 3
)
ßß3 4
;
ßß4 5
if
®® 
(
®® 
!
®® 
CheckRoleAccess
®®  
(
®®  !"
ModulePermissionEnum
®®! 5
.
®®5 6
PropertyMaster
®®6 D
,
®®D E
action
®®F L
,
®®L M
roleId
®®N T
)
®®T U
)
®®U V
return
©© 
RedirectToAction
©© '
(
©©' (
AppConstants
©©( 4
.
©©4 5
AccessRestriction
©©5 F
,
©©F G
AppConstants
©©H T
.
©©T U
Home
©©U Y
)
©©Y Z
;
©©Z [!
MasterPropertyModel
´´ 
masterProperty
´´  .
;
´´. /
if
¨¨ 
(
¨¨ 
id
¨¨ 
==
¨¨ 
null
¨¨ 
||
¨¨ 
id
¨¨  
<=
¨¨! #
$num
¨¨$ %
)
¨¨% &
{
≠≠ 
masterProperty
ÆÆ 
=
ÆÆ  
new
ÆÆ! $!
MasterPropertyModel
ÆÆ% 8
(
ÆÆ8 9
)
ÆÆ9 :
;
ÆÆ: ;
return
ØØ 
RedirectToAction
ØØ '
(
ØØ' (
$str
ØØ( 4
)
ØØ4 5
;
ØØ5 6
}
∞∞ 
else
±± 
{
≤≤ 
HttpContext
≥≥ 
.
≥≥ 
Request
≥≥ #
.
≥≥# $
Cookies
≥≥$ +
.
≥≥+ ,
TryGetValue
≥≥, 7
(
≥≥7 8

UserHelper
≥≥8 B
.
≥≥B C
EltizamToken
≥≥C O
,
≥≥O P
out
≥≥Q T
string
≥≥U [
token
≥≥\ a
)
≥≥a b
;
≥≥b c
APIRepository
¥¥ 
objapi
¥¥ $
=
¥¥% &
new
¥¥' *
(
¥¥* +
_cofiguration
¥¥+ 8
)
¥¥8 9
;
¥¥9 :!
HttpResponseMessage
µµ #
responseMessage
µµ$ 3
=
µµ4 5
objapi
µµ6 <
.
µµ< =
APICommunication
µµ= M
(
µµM N
APIURLHelper
µµN Z
.
µµZ [
GetPropertyById
µµ[ j
+
µµk l
$str
µµm p
+
µµq r
id
µµs u
,
µµu v

HttpMethodµµw Å
.µµÅ Ç
GetµµÇ Ö
,µµÖ Ü
tokenµµá å
)µµå ç
.µµç é
Resultµµé î
;µµî ï
if
∑∑ 
(
∑∑ 
responseMessage
∑∑ #
.
∑∑# $!
IsSuccessStatusCode
∑∑$ 7
)
∑∑7 8
{
∏∏ 
string
ππ 
jsonResponse
ππ '
=
ππ( )
responseMessage
ππ* 9
.
ππ9 :
Content
ππ: A
.
ππA B
ReadAsStringAsync
ππB S
(
ππS T
)
ππT U
.
ππU V
Result
ππV \
;
ππ\ ]
var
∫∫ 
data
∫∫ 
=
∫∫ 
JsonConvert
∫∫ *
.
∫∫* +
DeserializeObject
∫∫+ <
<
∫∫< =
APIResponseEntity
∫∫= N
<
∫∫N O!
MasterPropertyModel
∫∫O b
>
∫∫b c
>
∫∫c d
(
∫∫d e
jsonResponse
∫∫e q
)
∫∫q r
;
∫∫r s

FooterInfo
ΩΩ 
(
ΩΩ 
TableNameEnum
ΩΩ ,
.
ΩΩ, -
Master_Property
ΩΩ- <
,
ΩΩ< =
_cofiguration
ΩΩ> K
,
ΩΩK L
id
ΩΩM O
,
ΩΩO P
true
ΩΩQ U
)
ΩΩU V
;
ΩΩV W
return
¿¿ 
View
¿¿ 
(
¿¿  
data
¿¿  $
.
¿¿$ %
_object
¿¿% ,
)
¿¿, -
;
¿¿- .
}
¡¡ 
return
¬¬ 
NotFound
¬¬ 
(
¬¬  
)
¬¬  !
;
¬¬! "
}
√√ 
}
ƒƒ 	
}
∆∆ 
}«« Å¶
FD:\EltizamLive\Eltizam.Web\Controllers\MasterPropertyTypeController.cs
	namespace 	
EltizamValuation
 
. 
Web 
. 
Controllers *
{ 
public 

class (
MasterPropertyTypeController -
:. /
BaseController0 >
{ 
private 
readonly 
IConfiguration '
_cofiguration( 5
;5 6
private 
readonly 
IStringLocalizer )
<) *
Shared* 0
>0 1"
_stringLocalizerShared2 H
;H I
private 
readonly 
IHelper  
_helper! (
;( )
public (
MasterPropertyTypeController +
(+ ,
IConfiguration, :
configuration; H
,H I
IStringLocalizerJ Z
<Z [
Shared[ a
>a b!
stringLocalizerSharedc x
,x y
IHelper	z Å
helper
Ç à
)
à â
{ 	
_cofiguration 
= 
configuration )
;) *"
_stringLocalizerShared "
=# $!
stringLocalizerShared% :
;: ;
_helper 
= 
helper 
; 
} 	
[!! 	
HttpGet!!	 
]!! 
["" 	
Route""	 
("" 
$str"" 1
)""1 2
]""2 3
public## 
IActionResult## 
PropertyTypes## *
(##* +
)##+ ,
{$$ 	
int'' 
roleId'' 
='' 
_helper''  
.''  !
GetLoggedInRoleId''! 2
(''2 3
)''3 4
;''4 5
if(( 
((( 
!(( 
CheckRoleAccess((  
(((  ! 
ModulePermissionEnum((! 5
.((5 6
PropertyTypeMaster((6 H
,((H I
PermissionEnum((J X
.((X Y
View((Y ]
,((] ^
roleId((_ e
)((e f
)((f g
return)) 
RedirectToAction)) '
())' (
AppConstants))( 4
.))4 5
AccessRestriction))5 F
,))F G
AppConstants))H T
.))T U
Home))U Y
)))Y Z
;))Z [
return** 
View** 
(** 
)** 
;** 
}++ 	
[-- 	
HttpPost--	 
]-- 
[.. 	
Route..	 
(.. 
$str.. 6
)..6 7
]..7 8
public// 
IActionResult// 
PropertyTypeManage// /
(/// 0
int//0 3
id//4 6
,//6 7$
Master_PropertyTypeModel//8 P
masterPropertyType//Q c
)//c d
{00 	
try11 
{22 
var44 
action44 
=44 
masterPropertyType44 /
.44/ 0
Id440 2
==443 5
$num446 7
?448 9
PermissionEnum44: H
.44H I
Add44I L
:44M N
PermissionEnum44O ]
.44] ^
Edit44^ b
;44b c
int66 
roleId66 
=66 
_helper66 $
.66$ %
GetLoggedInRoleId66% 6
(666 7
)667 8
;668 9
if77 
(77 
!77 
CheckRoleAccess77 $
(77$ % 
ModulePermissionEnum77% 9
.779 :
PropertyTypeMaster77: L
,77L M
action77N T
,77T U
roleId77V \
)77\ ]
)77] ^
return88 
RedirectToAction88 +
(88+ ,
AppConstants88, 8
.888 9
AccessRestriction889 J
,88J K
AppConstants88L X
.88X Y
Home88Y ]
)88] ^
;88^ _
if;; 
(;; 
masterPropertyType;; &
.;;& '
Id;;' )
==;;* ,
$num;;- .
);;. /
masterPropertyType<< &
.<<& '
	CreatedBy<<' 0
=<<1 2
_helper<<3 :
.<<: ;
GetLoggedInUserId<<; L
(<<L M
)<<M N
;<<N O
masterPropertyType== "
.==" #

ModifiedBy==# -
===. /
_helper==0 7
.==7 8
GetLoggedInUserId==8 I
(==I J
)==J K
;==K L
HttpContext?? 
.?? 
Request?? #
.??# $
Cookies??$ +
.??+ ,
TryGetValue??, 7
(??7 8

UserHelper??8 B
.??B C
EltizamToken??C O
,??O P
out??Q T
string??U [
token??\ a
)??a b
;??b c
APIRepository@@ 
objapi@@ $
=@@% &
new@@' *
(@@* +
_cofiguration@@+ 8
)@@8 9
;@@9 :
HttpResponseMessageBB #
responseMessageBB$ 3
=BB4 5
objapiBB6 <
.BB< =
APICommunicationBB= M
(BBM N
APIURLHelperBBN Z
.BBZ [
UpsertPropertyTypeBB[ m
,BBm n

HttpMethodBBo y
.BBy z
PostBBz ~
,BB~ 
token
BBÄ Ö
,
BBÖ Ü
new
BBá ä
StringContent
BBã ò
(
BBò ô
JsonConvert
BBô §
.
BB§ •
SerializeObject
BB• ¥
(
BB¥ µ 
masterPropertyType
BBµ «
)
BB« »
)
BB» …
)
BB…  
.
BB  À
Result
BBÀ —
;
BB— “
ifDD 
(DD 
responseMessageDD #
.DD# $
IsSuccessStatusCodeDD$ 7
)DD7 8
{EE 
ifFF 
(FF 
responseMessageFF '
.FF' (
IsSuccessStatusCodeFF( ;
&&FF< >
masterPropertyTypeFF? Q
.FFQ R
IdFFR T
==FFT V
$numFFV W
)FFW X
{GG 
stringHH 
jsonResponseHH +
=HH, -
responseMessageHH. =
.HH= >
ContentHH> E
.HHE F
ReadAsStringAsyncHHF W
(HHW X
)HHX Y
.HHY Z
ResultHHZ `
;HH` a
TempDataII  
[II  !

UserHelperII! +
.II+ ,
SuccessMessageII, :
]II: ;
=II< =
ConvertII> E
.IIE F
ToStringIIF N
(IIN O"
_stringLocalizerSharedIIO e
[IIe f
$strIIf z
]IIz {
)II{ |
;II| }
returnJJ 
RedirectToActionJJ /
(JJ/ 0
$strJJ0 @
)JJ@ A
;JJA B
}LL 
ifMM 
(MM 
responseMessageMM '
.MM' (
IsSuccessStatusCodeMM( ;
)MM; <
{NN 
stringOO 
jsonResponseOO +
=OO, -
responseMessageOO. =
.OO= >
ContentOO> E
.OOE F
ReadAsStringAsyncOOF W
(OOW X
)OOX Y
.OOY Z
ResultOOZ `
;OO` a
TempDataPP  
[PP  !

UserHelperPP! +
.PP+ ,
SuccessMessagePP, :
]PP: ;
=PP< =
ConvertPP> E
.PPE F
ToStringPPF N
(PPN O"
_stringLocalizerSharedPPO e
[PPe f
$strPPf z
]PPz {
)PP{ |
;PP| }
returnQQ 
RedirectQQ '
(QQ' (
$"QQ( *
$strQQ* O
{QQO P
masterPropertyTypeQQP b
.QQb c
IdQQc e
}QQe f
"QQf g
)QQg h
;QQh i
}SS 
elseTT 
{UU 
TempDataVV  
[VV  !

UserHelperVV! +
.VV+ ,
ErrorMessageVV, 8
]VV8 9
=VV: ;
ConvertVV< C
.VVC D
ToStringVVD L
(VVL M
responseMessageVVM \
.VV\ ]
ContentVV] d
.VVd e
ReadAsStringAsyncVVe v
(VVv w
)VVw x
.VVx y
ResultVVy 
)	VV Ä
;
VVÄ Å
returnWW 
RedirectToActionWW /
(WW/ 0
$strWW0 @
)WW@ A
;WWA B
}XX 
}YY 
returnZZ 
RedirectToActionZZ '
(ZZ' (
$strZZ( 8
)ZZ8 9
;ZZ9 :
}[[ 
catch]] 
(]] 
	Exception]] 
e]] 
)]] 
{^^ 
_helper__ 
.__ 
LogExceptions__ %
(__% &
e__& '
)__' (
;__( )
TempData`` 
[`` 

UserHelper`` #
.``# $
SuccessMessage``$ 2
]``2 3
=``4 5
Convert``6 =
.``= >
ToString``> F
(``F G"
_stringLocalizerShared``G ]
[``] ^
$str``^ r
]``r s
)``s t
;``t u

ModelStateaa 
.aa 
Clearaa  
(aa  !
)aa! "
;aa" #
returnbb 
RedirectToActionbb '
(bb' (
$strbb( 8
)bb8 9
;bb9 :
}cc 
}dd 	
[ff 	
HttpGetff	 
]ff 
publicgg 
IActionResultgg 
PropertyTypeManagegg /
(gg/ 0
intgg0 3
?gg3 4
idgg5 7
)gg7 8
{hh 	
varjj 
actionjj 
=jj 
idjj 
==jj 
nulljj #
?jj$ %
PermissionEnumjj& 4
.jj4 5
Addjj5 8
:jj9 :
PermissionEnumjj; I
.jjI J
EditjjJ N
;jjN O
intkk 
roleIdkk 
=kk 
_helperkk  
.kk  !
GetLoggedInRoleIdkk! 2
(kk2 3
)kk3 4
;kk4 5
ifmm 
(mm 
!mm 
CheckRoleAccessmm  
(mm  ! 
ModulePermissionEnummm! 5
.mm5 6
PropertyTypeMastermm6 H
,mmH I
actionmmJ P
,mmP Q
roleIdmmR X
)mmX Y
)mmY Z
returnnn 
RedirectToActionnn '
(nn' (
AppConstantsnn( 4
.nn4 5
AccessRestrictionnn5 F
,nnF G
AppConstantsnnH T
.nnT U
HomennU Y
)nnY Z
;nnZ [
ifoo 
(oo 
idoo 
!=oo 
nulloo 
)oo 
{pp 
ViewDataqq 
[qq 
$strqq !
]qq! "
=qq# $
trueqq% )
;qq) *
}rr $
Master_PropertyTypeModeltt $
masterPropertyTypett% 7
;tt7 8
ifuu 
(uu 
iduu 
==uu 
nulluu 
||uu 
iduu  
<=uu! #
$numuu$ %
)uu% &
{vv 
masterPropertyTypeww "
=ww# $
newww% ($
Master_PropertyTypeModelww) A
(wwA B
)wwB C
;wwC D
masterPropertyTypexx "
.xx" #
IsActivexx# +
=xx, -
truexx. 2
;xx2 3
returnyy 
Viewyy 
(yy 
masterPropertyTypeyy .
)yy. /
;yy/ 0
}zz 
else{{ 
{|| 
HttpContext}} 
.}} 
Request}} #
.}}# $
Cookies}}$ +
.}}+ ,
TryGetValue}}, 7
(}}7 8

UserHelper}}8 B
.}}B C
EltizamToken}}C O
,}}O P
out}}Q T
string}}U [
token}}\ a
)}}a b
;}}b c
APIRepository~~ 
objapi~~ $
=~~% &
new~~' *
(~~* +
_cofiguration~~+ 8
)~~8 9
;~~9 :!
HttpResponseMessage
ÄÄ #
responseMessage
ÄÄ$ 3
=
ÄÄ4 5
objapi
ÄÄ6 <
.
ÄÄ< =
APICommunication
ÄÄ= M
(
ÄÄM N
APIURLHelper
ÄÄN Z
.
ÄÄZ [!
GetPropertyTypeById
ÄÄ[ n
+
ÄÄo p
$str
ÄÄq t
+
ÄÄu v
id
ÄÄw y
,
ÄÄy z

HttpMethodÄÄ{ Ö
.ÄÄÖ Ü
GetÄÄÜ â
,ÄÄâ ä
tokenÄÄã ê
)ÄÄê ë
.ÄÄë í
ResultÄÄí ò
;ÄÄò ô
if
ÇÇ 
(
ÇÇ 
responseMessage
ÇÇ #
.
ÇÇ# $!
IsSuccessStatusCode
ÇÇ$ 7
)
ÇÇ7 8
{
ÉÉ 
string
ÑÑ 
jsonResponse
ÑÑ '
=
ÑÑ( )
responseMessage
ÑÑ* 9
.
ÑÑ9 :
Content
ÑÑ: A
.
ÑÑA B
ReadAsStringAsync
ÑÑB S
(
ÑÑS T
)
ÑÑT U
.
ÑÑU V
Result
ÑÑV \
;
ÑÑ\ ]
var
ÖÖ 
data
ÖÖ 
=
ÖÖ 
JsonConvert
ÖÖ *
.
ÖÖ* +
DeserializeObject
ÖÖ+ <
<
ÖÖ< =
APIResponseEntity
ÖÖ= N
<
ÖÖN O&
Master_PropertyTypeModel
ÖÖO g
>
ÖÖg h
>
ÖÖh i
(
ÖÖi j
jsonResponse
ÖÖj v
)
ÖÖv w
;
ÖÖw x

FooterInfo
àà 
(
àà 
TableNameEnum
àà ,
.
àà, -!
Master_PropertyType
àà- @
,
àà@ A
_cofiguration
ààB O
,
ààO P
id
ààQ S
)
ààS T
;
ààT U
if
íí 
(
íí 
data
íí 
.
íí 
_object
íí $
is
íí% '
null
íí( ,
)
íí, -
return
ìì 
NotFound
ìì '
(
ìì' (
)
ìì( )
;
ìì) *
return
ïï 
View
ïï 
(
ïï  
$str
ïï  4
,
ïï4 5
data
ïï6 :
.
ïï: ;
_object
ïï; B
)
ïïB C
;
ïïC D
}
ññ 
return
óó 
NotFound
óó 
(
óó  
)
óó  !
;
óó! "
}
òò 
}
ôô 	
[
õõ 	
HttpGet
õõ	 
]
õõ 
public
úú 
IActionResult
úú  
PropertyTypeDetail
úú /
(
úú/ 0
int
úú0 3
?
úú3 4
id
úú5 7
)
úú7 8
{
ùù 	
var
†† 
action
†† 
=
†† 
PermissionEnum
†† '
.
††' (
View
††( ,
;
††, -
int
¢¢ 
roleId
¢¢ 
=
¢¢ 
_helper
¢¢  
.
¢¢  !
GetLoggedInRoleId
¢¢! 2
(
¢¢2 3
)
¢¢3 4
;
¢¢4 5
if
££ 
(
££ 
!
££ 
CheckRoleAccess
££  
(
££  !"
ModulePermissionEnum
££! 5
.
££5 6 
PropertyTypeMaster
££6 H
,
££H I
action
££J P
,
££P Q
roleId
££R X
)
££X Y
)
££Y Z
return
§§ 
RedirectToAction
§§ '
(
§§' (
AppConstants
§§( 4
.
§§4 5
AccessRestriction
§§5 F
,
§§F G
AppConstants
§§H T
.
§§T U
Home
§§U Y
)
§§Y Z
;
§§Z [&
Master_PropertyTypeModel
¶¶ $ 
masterPropertyType
¶¶% 7
;
¶¶7 8
if
ßß 
(
ßß 
id
ßß 
==
ßß 
null
ßß 
||
ßß 
id
ßß  
<=
ßß! #
$num
ßß$ %
)
ßß% &
{
®®  
masterPropertyType
©© "
=
©©# $
new
©©% (&
Master_PropertyTypeModel
©©) A
(
©©A B
)
©©B C
;
©©C D
return
™™ 
View
™™ 
(
™™  
masterPropertyType
™™ .
)
™™. /
;
™™/ 0
}
´´ 
else
¨¨ 
{
≠≠ 
HttpContext
ÆÆ 
.
ÆÆ 
Request
ÆÆ #
.
ÆÆ# $
Cookies
ÆÆ$ +
.
ÆÆ+ ,
TryGetValue
ÆÆ, 7
(
ÆÆ7 8

UserHelper
ÆÆ8 B
.
ÆÆB C
EltizamToken
ÆÆC O
,
ÆÆO P
out
ÆÆQ T
string
ÆÆU [
token
ÆÆ\ a
)
ÆÆa b
;
ÆÆb c
APIRepository
ØØ 
objapi
ØØ $
=
ØØ% &
new
ØØ' *
(
ØØ* +
_cofiguration
ØØ+ 8
)
ØØ8 9
;
ØØ9 :!
HttpResponseMessage
±± #
responseMessage
±±$ 3
=
±±4 5
objapi
±±6 <
.
±±< =
APICommunication
±±= M
(
±±M N
APIURLHelper
±±N Z
.
±±Z [!
GetPropertyTypeById
±±[ n
+
±±o p
$str
±±q t
+
±±u v
id
±±w y
,
±±y z

HttpMethod±±{ Ö
.±±Ö Ü
Get±±Ü â
,±±â ä
token±±ã ê
)±±ê ë
.±±ë í
Result±±í ò
;±±ò ô
if
≥≥ 
(
≥≥ 
responseMessage
≥≥ #
.
≥≥# $!
IsSuccessStatusCode
≥≥$ 7
)
≥≥7 8
{
¥¥ 
string
µµ 
jsonResponse
µµ '
=
µµ( )
responseMessage
µµ* 9
.
µµ9 :
Content
µµ: A
.
µµA B
ReadAsStringAsync
µµB S
(
µµS T
)
µµT U
.
µµU V
Result
µµV \
;
µµ\ ]
var
∂∂ 
data
∂∂ 
=
∂∂ 
JsonConvert
∂∂ *
.
∂∂* +
DeserializeObject
∂∂+ <
<
∂∂< =
APIResponseEntity
∂∂= N
<
∂∂N O&
Master_PropertyTypeModel
∂∂O g
>
∂∂g h
>
∂∂h i
(
∂∂i j
jsonResponse
∂∂j v
)
∂∂v w
;
∂∂w x

FooterInfo
∏∏ 
(
∏∏ 
TableNameEnum
∏∏ ,
.
∏∏, -!
Master_PropertyType
∏∏- @
,
∏∏@ A
_cofiguration
∏∏B O
,
∏∏O P
id
∏∏Q S
,
∏∏S T
true
∏∏U Y
)
∏∏Y Z
;
∏∏Z [
return
∫∫ 
View
∫∫ 
(
∫∫  
$str
∫∫  4
,
∫∫4 5
data
∫∫6 :
.
∫∫: ;
_object
∫∫; B
)
∫∫B C
;
∫∫C D
}
ªª 
return
ºº 
NotFound
ºº 
(
ºº  
)
ºº  !
;
ºº! "
}
ΩΩ 
}
ææ 	
[
¿¿ 	
HttpGet
¿¿	 
]
¿¿ 
[
¡¡ 	
Route
¡¡	 
(
¡¡ 
$str
¡¡ '
)
¡¡' (
]
¡¡( )
public
¬¬ 
IActionResult
¬¬ $
CheckPropertTypeExists
¬¬ 3
(
¬¬3 4
string
¬¬4 :
PropertyType
¬¬; G
)
¬¬G H
{
√√ 	
try
ƒƒ 
{
≈≈ 
HttpContext
∆∆ 
.
∆∆ 
Request
∆∆ #
.
∆∆# $
Cookies
∆∆$ +
.
∆∆+ ,
TryGetValue
∆∆, 7
(
∆∆7 8

UserHelper
∆∆8 B
.
∆∆B C
EltizamToken
∆∆C O
,
∆∆O P
out
∆∆Q T
string
∆∆U [
token
∆∆\ a
)
∆∆a b
;
∆∆b c
APIRepository
«« 
objapi
«« $
=
««% &
new
««' *
(
««* +
_cofiguration
««+ 8
)
««8 9
;
««9 :!
HttpResponseMessage
…… #
responseMessage
……$ 3
=
……4 5
objapi
……6 <
.
……< =
APICommunication
……= M
(
……M N
APIURLHelper
……N Z
.
……Z [%
CheckPropertyTypeExists
……[ r
+
……s t
$str……u Ö
+……Ü á
PropertyType……à î
,……î ï

HttpMethod……ñ †
.……† °
Get……° §
,……§ •
token……¶ ´
)……´ ¨
.……¨ ≠
Result……≠ ≥
;……≥ ¥
if
ÀÀ 
(
ÀÀ 
responseMessage
ÀÀ #
.
ÀÀ# $!
IsSuccessStatusCode
ÀÀ$ 7
)
ÀÀ7 8
{
ÃÃ 
if
ÕÕ 
(
ÕÕ 
responseMessage
ÕÕ '
.
ÕÕ' (!
IsSuccessStatusCode
ÕÕ( ;
)
ÕÕ; <
{
ŒŒ 
string
œœ 
jsonResponse
œœ +
=
œœ, -
responseMessage
œœ. =
.
œœ= >
Content
œœ> E
.
œœE F
ReadAsStringAsync
œœF W
(
œœW X
)
œœX Y
.
œœY Z
Result
œœZ `
;
œœ` a
TempData
––  
[
––  !

UserHelper
––! +
.
––+ ,
SuccessMessage
––, :
]
––: ;
=
––< =
Convert
––> E
.
––E F
ToString
––F N
(
––N O$
_stringLocalizerShared
––O e
[
––e f
$str
––f z
]
––z {
)
––{ |
;
––| }
}
—— 
else
““ 
{
”” 
TempData
‘‘  
[
‘‘  !

UserHelper
‘‘! +
.
‘‘+ ,
ErrorMessage
‘‘, 8
]
‘‘8 9
=
‘‘: ;
Convert
‘‘< C
.
‘‘C D
ToString
‘‘D L
(
‘‘L M
responseMessage
‘‘M \
.
‘‘\ ]
Content
‘‘] d
.
‘‘d e
ReadAsStringAsync
‘‘e v
(
‘‘v w
)
‘‘w x
.
‘‘x y
Result
‘‘y 
)‘‘ Ä
;‘‘Ä Å
}
’’ 
}
÷÷ 
return
ÿÿ 
null
ÿÿ 
;
ÿÿ 
}
ŸŸ 
catch
⁄⁄ 
(
⁄⁄ 
	Exception
⁄⁄ 
e
⁄⁄ 
)
⁄⁄ 
{
€€ 
return
‹‹ 
null
‹‹ 
;
‹‹ 
}
›› 
}
ﬁﬁ 	
}
‡‡ 
}·· «∂
>D:\EltizamLive\Eltizam.Web\Controllers\MasterRoleController.cs
	namespace 	
Eltizam
 
. 
Web 
. 
Controllers !
{ 
public 

class  
MasterRoleController %
:& '
BaseController( 6
{ 
private 
readonly 
IConfiguration '
_cofiguration( 5
;5 6
private 
readonly 
IStringLocalizer )
<) *
Shared* 0
>0 1"
_stringLocalizerShared2 H
;H I
private 
readonly 
IHelper  
_helper! (
;( )
public  
MasterRoleController #
(# $
IConfiguration$ 2
configuration3 @
,@ A
IStringLocalizerB R
<R S
SharedS Y
>Y Z!
stringLocalizerShared[ p
,p q
IHelperr y
helper	z Ä
)
Ä Å
{ 	
_cofiguration 
= 
configuration )
;) *"
_stringLocalizerShared "
=# $!
stringLocalizerShared% :
;: ;
_helper 
= 
helper 
; 
}   	
public"" 
IActionResult"" 
Roles"" "
(""" #
)""# $
{## 	

ModelState$$ 
.$$ 
Clear$$ 
($$ 
)$$ 
;$$ 
try%% 
{&& 
int(( 
roleId(( 
=(( 
_helper(( $
.(($ %
GetLoggedInRoleId((% 6
(((6 7
)((7 8
;((8 9
if)) 
()) 
!)) 
CheckRoleAccess)) $
())$ % 
ModulePermissionEnum))% 9
.))9 :

RoleMaster)): D
,))D E
PermissionEnum))F T
.))T U
View))U Y
,))Y Z
roleId))[ a
)))a b
)))b c
return** 
RedirectToAction** +
(**+ ,
AppConstants**, 8
.**8 9
AccessRestriction**9 J
,**J K
AppConstants**L X
.**X Y
Home**Y ]
)**] ^
;**^ _
return++ 
View++ 
(++ 
)++ 
;++ 
},, 
catch-- 
(-- 
	Exception-- 
e-- 
)-- 
{.. 
_helper// 
.// 
LogExceptions// %
(//% &
e//& '
)//' (
;//( )
ViewBag00 
.00 
errormessage00 $
=00% &
Convert00' .
.00. /
ToString00/ 7
(007 8
e008 9
.009 :

StackTrace00: D
)00D E
;00E F
return11 
View11 
(11 
$str11 #
)11# $
;11$ %
}22 
}33 	
public55 
IActionResult55 

RoleManage55 '
(55' (
int55( +
?55+ ,
id55- /
)55/ 0
{66 	
MasterRoleEntity77 

MasterRole77 '
=77( )
new77* -
MasterRoleEntity77. >
(77> ?
)77? @
;77@ A
var99 
action99 
=99 
PermissionEnum99 '
.99' (
Edit99( ,
;99, -
int;; 
roleId;; 
=;; 
_helper;;  
.;;  !
GetLoggedInRoleId;;! 2
(;;2 3
);;3 4
;;;4 5
if== 
(== 
!== 
CheckRoleAccess==  
(==  ! 
ModulePermissionEnum==! 5
.==5 6

RoleMaster==6 @
,==@ A
action==B H
,==H I
roleId==J P
)==P Q
)==Q R
return>> 
RedirectToAction>> '
(>>' (
AppConstants>>( 4
.>>4 5
AccessRestriction>>5 F
,>>F G
AppConstants>>H T
.>>T U
Home>>U Y
)>>Y Z
;>>Z [
if@@ 
(@@ 
id@@ 
==@@ 
null@@ 
)@@ 
{AA 
HttpContextBB 
.BB 
RequestBB #
.BB# $
CookiesBB$ +
.BB+ ,
TryGetValueBB, 7
(BB7 8

UserHelperBB8 B
.BBB C
EltizamTokenBBC O
,BBO P
outBBQ T
stringBBU [
tokenBB\ a
)BBa b
;BBb c
APIRepositoryCC 
objapiCC $
=CC% &
newCC' *
(CC* +
_cofigurationCC+ 8
)CC8 9
;CC9 :
HttpResponseMessageDD #
responseMessageDD$ 3
=DD4 5
objapiDD6 <
.DD< =
APICommunicationDD= M
(DDM N
APIURLHelperDDN Z
.DDZ [
GetAllModuleDD[ g
+DDh i
$strDDj m
+DDn o
idDDp r
,DDr s

HttpMethodDDt ~
.DD~ 
Get	DD Ç
,
DDÇ É
token
DDÑ â
)
DDâ ä
.
DDä ã
Result
DDã ë
;
DDë í
ifFF 
(FF 
responseMessageFF #
.FF# $
IsSuccessStatusCodeFF$ 7
)FF7 8
{GG 
stringHH 
jsonResponseHH '
=HH( )
responseMessageHH* 9
.HH9 :
ContentHH: A
.HHA B
ReadAsStringAsyncHHB S
(HHS T
)HHT U
.HHU V
ResultHHV \
;HH\ ]
varJJ 
dataJJ 
=JJ 
JsonConvertJJ *
.JJ* +
DeserializeObjectJJ+ <
<JJ< =
APIResponseEntityJJ= N
<JJN O
ListJJO S
<JJS T
MasterModuleEntityJJT f
>JJf g
>JJg h
>JJh i
(JJi j
jsonResponseJJj v
)JJv w
;JJw x

MasterRoleKK 
.KK 
IsActiveKK '
=KK( )
trueKK* .
;KK. /

MasterRoleLL 
.LL 
MasterModulesLL ,
=LL- .
dataLL/ 3
.LL3 4
_objectLL4 ;
.LL; <
OrderByLL< C
(LLC D
xLLD E
=>LLF H
xLLI J
.LLJ K
	SortOrderLLK T
)LLT U
.LLU V
ToListLLV \
(LL\ ]
)LL] ^
;LL^ _
returnMM 
ViewMM 
(MM  

MasterRoleMM  *
)MM* +
;MM+ ,
}NN 
}OO 
elsePP 
{QQ 
HttpContextRR 
.RR 
RequestRR #
.RR# $
CookiesRR$ +
.RR+ ,
TryGetValueRR, 7
(RR7 8

UserHelperRR8 B
.RRB C
EltizamTokenRRC O
,RRO P
outRRQ T
stringRRU [
tokenRR\ a
)RRa b
;RRb c
APIRepositorySS 
objapiSS $
=SS% &
newSS' *
(SS* +
_cofigurationSS+ 8
)SS8 9
;SS9 :
HttpResponseMessageTT #
responseMessageTT$ 3
=TT4 5
objapiTT6 <
.TT< =
APICommunicationTT= M
(TTM N
APIURLHelperTTN Z
.TTZ [
GetRoleByIdTT[ f
+TTg h
$strTTi l
+TTm n
idTTo q
,TTq r

HttpMethodTTs }
.TT} ~
Get	TT~ Å
,
TTÅ Ç
token
TTÉ à
)
TTà â
.
TTâ ä
Result
TTä ê
;
TTê ë
ifVV 
(VV 
responseMessageVV #
.VV# $
IsSuccessStatusCodeVV$ 7
)VV7 8
{WW 
stringXX 
jsonResponseXX '
=XX( )
responseMessageXX* 9
.XX9 :
ContentXX: A
.XXA B
ReadAsStringAsyncXXB S
(XXS T
)XXT U
.XXU V
ResultXXV \
;XX\ ]
varZZ 
dataZZ 
=ZZ 
JsonConvertZZ *
.ZZ* +
DeserializeObjectZZ+ <
<ZZ< =
APIResponseEntityZZ= N
<ZZN O
MasterRoleEntityZZO _
>ZZ_ `
>ZZ` a
(ZZa b
jsonResponseZZb n
)ZZn o
;ZZo p

FooterInfo]] 
(]] 
TableNameEnum]] ,
.]], -
Master_Role]]- 8
,]]8 9
_cofiguration]]: G
,]]G H
id]]I K
)]]K L
;]]L M
ifgg 
(gg 
datagg 
.gg 
_objectgg $
isgg% '
nullgg( ,
)gg, -
returnhh 
NotFoundhh '
(hh' (
)hh( )
;hh) *
Listjj 
<jj 
MasterModuleEntityjj +
>jj+ ,
_oListMasterModulesjj- @
=jjA B
datajjC G
.jjG H
_objectjjH O
.jjO P
MasterModulesjjP ]
.jj] ^
OrderByjj^ e
(jje f
xjjf g
=>jjh j
xjjk l
.jjl m
	SortOrderjjm v
)jjv w
.jjw x
ToListjjx ~
(jj~ 
)	jj Ä
;
jjÄ Å
datakk 
.kk 
_objectkk  
.kk  !
MasterModuleskk! .
=kk/ 0
_oListMasterModuleskk1 D
;kkD E
returnll 
Viewll 
(ll  
datall  $
.ll$ %
_objectll% ,
)ll, -
;ll- .
}mm 
}nn 
returnpp 
Viewpp 
(pp 
)pp 
;pp 
}qq 	
publicss 
IActionResultss 
RoleViewss %
(ss% &
intss& )
idss* ,
)ss, -
{tt 	
varuu 
IsViewuu 
=uu 
$numuu 
;uu 
MasterRoleEntityvv 

MasterRolevv '
=vv( )
newvv* -
MasterRoleEntityvv. >
(vv> ?
)vv? @
;vv@ A
varxx 
actionxx 
=xx 
PermissionEnumxx '
.xx' (
Viewxx( ,
;xx, -
intzz 
roleIdzz 
=zz 
_helperzz  
.zz  !
GetLoggedInRoleIdzz! 2
(zz2 3
)zz3 4
;zz4 5
if|| 
(|| 
!|| 
CheckRoleAccess||  
(||  ! 
ModulePermissionEnum||! 5
.||5 6

RoleMaster||6 @
,||@ A
action||B H
,||H I
roleId||J P
)||P Q
)||Q R
return}} 
RedirectToAction}} '
(}}' (
AppConstants}}( 4
.}}4 5
AccessRestriction}}5 F
,}}F G
AppConstants}}H T
.}}T U
Home}}U Y
)}}Y Z
;}}Z [
HttpContext 
. 
Request 
.  
Cookies  '
.' (
TryGetValue( 3
(3 4

UserHelper4 >
.> ?
EltizamToken? K
,K L
outM P
stringQ W
tokenX ]
)] ^
;^ _
APIRepository
ÄÄ 
objapi
ÄÄ  
=
ÄÄ! "
new
ÄÄ# &
(
ÄÄ& '
_cofiguration
ÄÄ' 4
)
ÄÄ4 5
;
ÄÄ5 6!
HttpResponseMessage
ÅÅ 
responseMessage
ÅÅ  /
=
ÅÅ0 1
objapi
ÅÅ2 8
.
ÅÅ8 9
APICommunication
ÅÅ9 I
(
ÅÅI J
APIURLHelper
ÅÅJ V
.
ÅÅV W
GetRoleById
ÅÅW b
+
ÅÅc d
$str
ÅÅe h
+
ÅÅi j
id
ÅÅk m
,
ÅÅm n

HttpMethod
ÅÅo y
.
ÅÅy z
Get
ÅÅz }
,
ÅÅ} ~
tokenÅÅ Ñ
)ÅÅÑ Ö
.ÅÅÖ Ü
ResultÅÅÜ å
;ÅÅå ç
if
ÉÉ 
(
ÉÉ 
responseMessage
ÉÉ 
.
ÉÉ  !
IsSuccessStatusCode
ÉÉ  3
)
ÉÉ3 4
{
ÑÑ 
string
ÖÖ 
jsonResponse
ÖÖ #
=
ÖÖ$ %
responseMessage
ÖÖ& 5
.
ÖÖ5 6
Content
ÖÖ6 =
.
ÖÖ= >
ReadAsStringAsync
ÖÖ> O
(
ÖÖO P
)
ÖÖP Q
.
ÖÖQ R
Result
ÖÖR X
;
ÖÖX Y
var
ÜÜ 
data
ÜÜ 
=
ÜÜ 
JsonConvert
ÜÜ &
.
ÜÜ& '
DeserializeObject
ÜÜ' 8
<
ÜÜ8 9
APIResponseEntity
ÜÜ9 J
<
ÜÜJ K
MasterRoleEntity
ÜÜK [
>
ÜÜ[ \
>
ÜÜ\ ]
(
ÜÜ] ^
jsonResponse
ÜÜ^ j
)
ÜÜj k
;
ÜÜk l
var
àà 
vw
àà 
=
àà 
IsView
àà 
==
àà  "
$num
àà# $
;
àà$ %
ViewBag
ââ 
.
ââ 
IsView
ââ 
=
ââ  
IsView
ââ! '
;
ââ' (

FooterInfo
ãã 
(
ãã 
TableNameEnum
ãã (
.
ãã( )
Master_Role
ãã) 4
,
ãã4 5
_cofiguration
ãã6 C
,
ããC D
id
ããE G
,
ããG H
true
ããI M
)
ããM N
;
ããN O
List
çç 
<
çç  
MasterModuleEntity
çç '
>
çç' (!
_oListMasterModules
çç) <
=
çç= >
data
çç? C
.
ççC D
_object
ççD K
.
ççK L
MasterModules
ççL Y
.
ççY Z
OrderBy
ççZ a
(
çça b
x
ççb c
=>
ççd f
x
ççg h
.
ççh i
	SortOrder
ççi r
)
ççr s
.
ççs t
ToList
ççt z
(
ççz {
)
çç{ |
;
çç| }
data
éé 
.
éé 
_object
éé 
.
éé 
MasterModules
éé *
=
éé+ ,!
_oListMasterModules
éé- @
;
éé@ A
return
êê 
View
êê 
(
êê 
$str
êê (
,
êê( )
data
êê* .
.
êê. /
_object
êê/ 6
)
êê6 7
;
êê7 8
}
ëë 
return
ìì 
View
ìì 
(
ìì 
)
ìì 
;
ìì 
}
îî 	
[
ññ 	
HttpPost
ññ	 
]
ññ 
[
óó 	&
ValidateAntiForgeryToken
óó	 !
]
óó! "
public
òò 
IActionResult
òò 

RoleManage
òò '
(
òò' (
int
òò( +
id
òò, .
,
òò. /
MasterRoleEntity
òò0 @

masterRole
òòA K
)
òòK L
{
ôô 	
try
öö 
{
õõ 
var
ùù 
action
ùù 
=
ùù 

masterRole
ùù '
.
ùù' (
Id
ùù( *
==
ùù+ -
$num
ùù. /
?
ùù0 1
PermissionEnum
ùù2 @
.
ùù@ A
Add
ùùA D
:
ùùE F
PermissionEnum
ùùG U
.
ùùU V
Edit
ùùV Z
;
ùùZ [
int
üü 
roleId
üü 
=
üü 
_helper
üü $
.
üü$ %
GetLoggedInRoleId
üü% 6
(
üü6 7
)
üü7 8
;
üü8 9
if
†† 
(
†† 
!
†† 
CheckRoleAccess
†† $
(
††$ %"
ModulePermissionEnum
††% 9
.
††9 :

RoleMaster
††: D
,
††D E
action
††F L
,
††L M
roleId
††N T
)
††T U
)
††U V
return
°° 
RedirectToAction
°° +
(
°°+ ,
AppConstants
°°, 8
.
°°8 9
AccessRestriction
°°9 J
,
°°J K
AppConstants
°°L X
.
°°X Y
Home
°°Y ]
)
°°] ^
;
°°^ _
if
§§ 
(
§§ 

masterRole
§§ 
.
§§ 
Id
§§ !
==
§§" $
$num
§§% &
)
§§& '

masterRole
•• 
.
•• 
	CreatedBy
•• (
=
••) *
_helper
••+ 2
.
••2 3
GetLoggedInUserId
••3 D
(
••D E
)
••E F
;
••F G

masterRole
¶¶ 
.
¶¶ 

ModifiedBy
¶¶ %
=
¶¶& '
_helper
¶¶( /
.
¶¶/ 0
GetLoggedInUserId
¶¶0 A
(
¶¶A B
)
¶¶B C
;
¶¶C D

masterRole
®® 
.
®® 
LoggedUserId
®® '
=
®®( )
_helper
®®* 1
.
®®1 2
GetLoggedInUserId
®®2 C
(
®®C D
)
®®D E
;
®®E F
HttpContext
©© 
.
©© 
Request
©© #
.
©©# $
Cookies
©©$ +
.
©©+ ,
TryGetValue
©©, 7
(
©©7 8

UserHelper
©©8 B
.
©©B C
EltizamToken
©©C O
,
©©O P
out
©©Q T
string
©©U [
token
©©\ a
)
©©a b
;
©©b c
APIRepository
™™ 
objapi
™™ $
=
™™% &
new
™™' *
(
™™* +
_cofiguration
™™+ 8
)
™™8 9
;
™™9 :!
HttpResponseMessage
¨¨ #
responseMessage
¨¨$ 3
=
¨¨4 5
objapi
¨¨6 <
.
¨¨< =
APICommunication
¨¨= M
(
¨¨M N
APIURLHelper
¨¨N Z
.
¨¨Z [
SaveRole
¨¨[ c
,
¨¨c d

HttpMethod
¨¨e o
.
¨¨o p
Post
¨¨p t
,
¨¨t u
token
¨¨v {
,
¨¨{ |
new¨¨} Ä
StringContent¨¨Å é
(¨¨é è
JsonConvert¨¨è ö
.¨¨ö õ
SerializeObject¨¨õ ™
(¨¨™ ´

masterRole¨¨´ µ
)¨¨µ ∂
)¨¨∂ ∑
)¨¨∑ ∏
.¨¨∏ π
Result¨¨π ø
;¨¨ø ¿
if
ÆÆ 
(
ÆÆ 
responseMessage
ÆÆ #
.
ÆÆ# $!
IsSuccessStatusCode
ÆÆ$ 7
)
ÆÆ7 8
{
ØØ 
if
∞∞ 
(
∞∞ 

masterRole
∞∞ "
.
∞∞" #
Id
∞∞# %
>
∞∞& '
$num
∞∞( )
)
∞∞) *
{
±± 
UtilityHelper
≤≤ %
.
≤≤% &
RemoveModuleRole
≤≤& 6
(
≤≤6 7

masterRole
≤≤7 A
.
≤≤A B
Id
≤≤B D
)
≤≤D E
;
≤≤E F!
HttpResponseMessage
¥¥ +
resRoles
¥¥, 4
=
¥¥5 6
objapi
¥¥7 =
.
¥¥= >
APICommunication
¥¥> N
(
¥¥N O
APIURLHelper
¥¥O [
.
¥¥[ \+
GetByPermisionRoleUsingRoleId
¥¥\ y
+
¥¥z {
$str
¥¥| 
+¥¥Ä Å

masterRole¥¥Ç å
.¥¥å ç
Id¥¥ç è
,¥¥è ê

HttpMethod¥¥ë õ
.¥¥õ ú
Get¥¥ú ü
,¥¥ü †
token¥¥° ¶
)¥¥¶ ß
.¥¥ß ®
Result¥¥® Æ
;¥¥Æ Ø
if
µµ 
(
µµ 
resRoles
µµ $
.
µµ$ %!
IsSuccessStatusCode
µµ% 8
)
µµ8 9
{
∂∂ 
string
∑∑ "
rolJson
∑∑# *
=
∑∑+ ,
resRoles
∑∑- 5
.
∑∑5 6
Content
∑∑6 =
.
∑∑= >
ReadAsStringAsync
∑∑> O
(
∑∑O P
)
∑∑P Q
.
∑∑Q R
Result
∑∑R X
;
∑∑X Y
var
∏∏ 
data
∏∏  $
=
∏∏% &
JsonConvert
∏∏' 2
.
∏∏2 3
DeserializeObject
∏∏3 D
<
∏∏D E
APIResponseEntity
∏∏E V
<
∏∏V W
IEnumerable
∏∏W b
<
∏∏b c!
RolePermissionModel
∏∏c v
>
∏∏v w
>
∏∏w x
>
∏∏x y
(
∏∏y z
rolJson∏∏z Å
)∏∏Å Ç
;∏∏Ç É
UtilityHelper
ππ )
.
ππ) *
AddModuleRole
ππ* 7
(
ππ7 8

masterRole
ππ8 B
.
ππB C
Id
ππC E
,
ππE F
data
ππG K
.
ππK L
_object
ππL S
)
ππS T
;
ππT U
}
∫∫ 
}
ªª 
if
ºº 
(
ºº 
responseMessage
ºº '
.
ºº' (!
IsSuccessStatusCode
ºº( ;
&&
ºº< >

masterRole
ºº? I
.
ººI J
Id
ººJ L
==
ººM O
$num
ººP Q
)
ººQ R
{
ΩΩ 
string
ææ 
jsonResponse
ææ +
=
ææ, -
responseMessage
ææ. =
.
ææ= >
Content
ææ> E
.
ææE F
ReadAsStringAsync
ææF W
(
ææW X
)
ææX Y
.
ææY Z
Result
ææZ `
;
ææ` a
TempData
øø  
[
øø  !

UserHelper
øø! +
.
øø+ ,
SuccessMessage
øø, :
]
øø: ;
=
øø< =
Convert
øø> E
.
øøE F
ToString
øøF N
(
øøN O$
_stringLocalizerShared
øøO e
[
øøe f
$str
øøf z
]
øøz {
)
øø{ |
;
øø| }
return
¡¡ 
RedirectToAction
¡¡ /
(
¡¡/ 0
nameof
¡¡0 6
(
¡¡6 7
Roles
¡¡7 <
)
¡¡< =
)
¡¡= >
;
¡¡> ?
}
¬¬ 
if
√√ 
(
√√ 
responseMessage
√√ '
.
√√' (!
IsSuccessStatusCode
√√( ;
)
√√; <
{
ƒƒ 
string
≈≈ 
jsonResponse
≈≈ +
=
≈≈, -
responseMessage
≈≈. =
.
≈≈= >
Content
≈≈> E
.
≈≈E F
ReadAsStringAsync
≈≈F W
(
≈≈W X
)
≈≈X Y
.
≈≈Y Z
Result
≈≈Z `
;
≈≈` a
TempData
∆∆  
[
∆∆  !

UserHelper
∆∆! +
.
∆∆+ ,
SuccessMessage
∆∆, :
]
∆∆: ;
=
∆∆< =
Convert
∆∆> E
.
∆∆E F
ToString
∆∆F N
(
∆∆N O$
_stringLocalizerShared
∆∆O e
[
∆∆e f
$str
∆∆f z
]
∆∆z {
)
∆∆{ |
;
∆∆| }
return
»» 
Redirect
»» '
(
»»' (
$"
»»( *
$str
»»* D
{
»»D E

masterRole
»»E O
.
»»O P
Id
»»P R
}
»»R S
"
»»S T
)
»»T U
;
»»U V
}
…… 
else
   
{
ÀÀ 
TempData
ÃÃ  
[
ÃÃ  !

UserHelper
ÃÃ! +
.
ÃÃ+ ,
ErrorMessage
ÃÃ, 8
]
ÃÃ8 9
=
ÃÃ: ;
Convert
ÃÃ< C
.
ÃÃC D
ToString
ÃÃD L
(
ÃÃL M
responseMessage
ÃÃM \
.
ÃÃ\ ]
Content
ÃÃ] d
.
ÃÃd e
ReadAsStringAsync
ÃÃe v
(
ÃÃv w
)
ÃÃw x
.
ÃÃx y
Result
ÃÃy 
)ÃÃ Ä
;ÃÃÄ Å
return
ŒŒ 
RedirectToAction
ŒŒ /
(
ŒŒ/ 0
$str
ŒŒ0 7
)
ŒŒ7 8
;
ŒŒ8 9
}
œœ 
}
–– 
return
—— 
RedirectToAction
—— '
(
——' (
$str
——( /
)
——/ 0
;
——0 1
}
““ 
catch
”” 
(
”” 
	Exception
”” 
e
”” 
)
”” 
{
‘‘ 
_helper
’’ 
.
’’ 
LogExceptions
’’ %
(
’’% &
e
’’& '
)
’’' (
;
’’( )
TempData
÷÷ 
[
÷÷ 

UserHelper
÷÷ #
.
÷÷# $
ErrorMessage
÷÷$ 0
]
÷÷0 1
=
÷÷2 3
Convert
÷÷4 ;
.
÷÷; <
ToString
÷÷< D
(
÷÷D E
e
÷÷E F
.
÷÷F G

StackTrace
÷÷G Q
)
÷÷Q R
;
÷÷R S
return
◊◊ 
RedirectToAction
◊◊ '
(
◊◊' (
$str
◊◊( /
)
◊◊/ 0
;
◊◊0 1
}
ÿÿ 
}
ŸŸ 	
}
⁄⁄ 
}€€ ıã
>D:\EltizamLive\Eltizam.Web\Controllers\MasterUserController.cs
	namespace 	
EltizamValuation
 
. 
Web 
. 
Controllers *
{ 
public 

class  
MasterUserController %
:& '
BaseController( 6
{ 
private 
readonly 
IConfiguration '
_cofiguration( 5
;5 6
private 
readonly 
IStringLocalizer )
<) *
Shared* 0
>0 1"
_stringLocalizerShared2 H
;H I
private 
readonly 
IHelper  
_helper! (
;( )
public  
MasterUserController #
(# $
IConfiguration$ 2
configuration3 @
,@ A
IStringLocalizerB R
<R S
SharedS Y
>Y Z!
stringLocalizerShared[ p
,p q
IHelperr y
helper	z Ä
)
Ä Å
{ 	
_cofiguration 
= 
configuration )
;) *"
_stringLocalizerShared "
=# $!
stringLocalizerShared% :
;: ;
_helper 
= 
helper 
; 
} 	
public   
IActionResult   
Users   "
(  " #
)  # $
{!! 	
try"" 
{## 
int%% 
roleId%% 
=%% 
_helper%% $
.%%$ %
GetLoggedInRoleId%%% 6
(%%6 7
)%%7 8
;%%8 9
if&& 
(&& 
!&& 
CheckRoleAccess&& $
(&&$ % 
ModulePermissionEnum&&% 9
.&&9 :
ResourceMaster&&: H
,&&H I
PermissionEnum&&J X
.&&X Y
View&&Y ]
,&&] ^
roleId&&_ e
)&&e f
)&&f g
return'' 
RedirectToAction'' +
(''+ ,
AppConstants'', 8
.''8 9
AccessRestriction''9 J
,''J K
AppConstants''L X
.''X Y
Home''Y ]
)''] ^
;''^ _
return)) 
View)) 
()) 
))) 
;)) 
}** 
catch++ 
(++ 
	Exception++ 
e++ 
)++ 
{,, 
_helper-- 
.-- 
LogExceptions-- %
(--% &
e--& '
)--' (
;--( )
ViewBag.. 
... 
errormessage.. $
=..% &
Convert..' .
.... /
ToString../ 7
(..7 8
e..8 9
...9 :

StackTrace..: D
)..D E
;..E F
return// 
View// 
(// 
$str// #
)//# $
;//$ %
}00 
}11 	
[44 	
HttpGet44	 
]44 
public55 
IActionResult55 

UserManage55 '
(55' (
int55( +
?55+ ,
id55- /
)55/ 0
{66 	
MasterUserModel77 

masterUser77 &
;77& '
var99 
action99 
=99 
id99 
==99 
null99 #
?99$ %
PermissionEnum99& 4
.994 5
Add995 8
:999 :
PermissionEnum99; I
.99I J
Edit99J N
;99N O
int:: 
roleId:: 
=:: 
_helper::  
.::  !
GetLoggedInRoleId::! 2
(::2 3
)::3 4
;::4 5
if<< 
(<< 
!<< 
CheckRoleAccess<<  
(<<  ! 
ModulePermissionEnum<<! 5
.<<5 6
ResourceMaster<<6 D
,<<D E
action<<F L
,<<L M
roleId<<N T
)<<T U
)<<U V
return== 
RedirectToAction== '
(==' (
AppConstants==( 4
.==4 5
AccessRestriction==5 F
,==F G
AppConstants==H T
.==T U
Home==U Y
)==Y Z
;==Z [
if@@ 
(@@ 
id@@ 
==@@ 
null@@ 
||@@ 
id@@  
<=@@! #
$num@@$ %
)@@% &
{AA 
varBB 
	viewModelBB 
=BB 
newBB  #
MasterUserModelBB$ 3
{CC 
	AddressesDD 
=DD 
newDD  #
ListDD$ (
<DD( )"
MasterUserAddressModelDD) ?
>DD? @
(DD@ A
)DDA B
,DDB C
QualificationsEE "
=EE# $
newEE% (
ListEE) -
<EE- .%
Master_QualificationModelEE. G
>EEG H
(EEH I
)EEI J
}FF 
;FF "
MasterUserAddressModelGG &
addessGG' -
=GG. /
newGG0 3"
MasterUserAddressModelGG4 J
(GGJ K
)GGK L
;GGL M%
Master_QualificationModelHH )
qualificationHH* 7
=HH8 9
newHH: =%
Master_QualificationModelHH> W
(HHW X
)HHX Y
;HHY Z
	viewModelJJ 
.JJ 
IsActiveJJ "
=JJ# $
trueJJ% )
;JJ) *
	viewModelKK 
.KK 
	AddressesKK #
.KK# $
AddKK$ '
(KK' (
addessKK( .
)KK. /
;KK/ 0
	viewModelLL 
.LL 
QualificationsLL (
.LL( )
AddLL) ,
(LL, -
qualificationLL- :
)LL: ;
;LL; <
returnMM 
ViewMM 
(MM 
	viewModelMM %
)MM% &
;MM& '
}NN 
elseOO 
{PP 
HttpContextQQ 
.QQ 
RequestQQ #
.QQ# $
CookiesQQ$ +
.QQ+ ,
TryGetValueQQ, 7
(QQ7 8

UserHelperQQ8 B
.QQB C
EltizamTokenQQC O
,QQO P
outQQQ T
stringQQU [
tokenQQ\ a
)QQa b
;QQb c
APIRepositoryRR 
objapiRR $
=RR% &
newRR' *
(RR* +
_cofigurationRR+ 8
)RR8 9
;RR9 :
HttpResponseMessageSS #
responseMessageSS$ 3
=SS4 5
objapiSS6 <
.SS< =
APICommunicationSS= M
(SSM N
APIURLHelperSSN Z
.SSZ [
GetUserByIdSS[ f
+SSg h
$strSSi l
+SSm n
idSSo q
,SSq r

HttpMethodSSs }
.SS} ~
Get	SS~ Å
,
SSÅ Ç
token
SSÉ à
)
SSà â
.
SSâ ä
Result
SSä ê
;
SSê ë
ifUU 
(UU 
responseMessageUU #
.UU# $
IsSuccessStatusCodeUU$ 7
)UU7 8
{VV 
stringWW 
jsonResponseWW '
=WW( )
responseMessageWW* 9
.WW9 :
ContentWW: A
.WWA B
ReadAsStringAsyncWWB S
(WWS T
)WWT U
.WWU V
ResultWWV \
;WW\ ]
varXX 
dataXX 
=XX 
JsonConvertXX *
.XX* +
DeserializeObjectXX+ <
<XX< =
APIResponseEntityXX= N
<XXN O
MasterUserModelXXO ^
>XX^ _
>XX_ `
(XX` a
jsonResponseXXa m
)XXm n
;XXn o
ifZZ 
(ZZ 
dataZZ 
.ZZ 
_objectZZ $
isZZ% '
nullZZ( ,
)ZZ, -
return[[ 
NotFound[[ '
([[' (
)[[( )
;[[) *
if]] 
(]] 
data]] 
.]] 
_object]] $
.]]$ %
	Addresses]]% .
.]]. /
Count]]/ 4
==]]5 7
$num]]8 9
)]]9 :
{^^ "
MasterUserAddressModel__ .
addess__/ 5
=__6 7
new__8 ;"
MasterUserAddressModel__< R
(__R S
)__S T
;__T U
data`` 
.`` 
_object`` $
.``$ %
	Addresses``% .
.``. /
Add``/ 2
(``2 3
addess``3 9
)``9 :
;``: ;
}aa 
ifbb 
(bb 
databb 
.bb 
_objectbb $
.bb$ %
Qualificationsbb% 3
.bb3 4
Countbb4 9
==bb: <
$numbb= >
)bb> ?
{cc %
Master_QualificationModeldd 1
qualificationdd2 ?
=dd@ A
newddB E%
Master_QualificationModelddF _
(dd_ `
)dd` a
;dda b
dataee 
.ee 
_objectee $
.ee$ %
Qualificationsee% 3
.ee3 4
Addee4 7
(ee7 8
qualificationee8 E
)eeE F
;eeF G
}ff 

FooterInfohh 
(hh 
TableNameEnumhh ,
.hh, -
Master_Userhh- 8
,hh8 9
_cofigurationhh: G
,hhG H
idhhI K
)hhK L
;hhL M
returntt 
Viewtt 
(tt  
datatt  $
.tt$ %
_objecttt% ,
)tt, -
;tt- .
}uu 
returnvv 
NotFoundvv 
(vv  
)vv  !
;vv! "
}ww 
}xx 	
[zz 	
HttpPostzz	 
]zz 
public{{ 
IActionResult{{ 

UserManage{{ '
({{' (
int{{( +
id{{, .
,{{. /
MasterUserModel{{0 ?

masterUser{{@ J
){{J K
{|| 	
try}} 
{~~ 
if 
( 

masterUser 
. 
DateOfBirth *
>+ ,
DateTime- 5
.5 6
Now6 9
)9 :
{
ÄÄ 
TempData
ÅÅ 
[
ÅÅ 

UserHelper
ÅÅ '
.
ÅÅ' (
ErrorMessage
ÅÅ( 4
]
ÅÅ4 5
=
ÅÅ6 7
$str
ÅÅ8 _
;
ÅÅ_ `
return
ÇÇ 
Redirect
ÇÇ #
(
ÇÇ# $
$"
ÇÇ$ &
$str
ÇÇ& @
{
ÇÇ@ A

masterUser
ÇÇA K
.
ÇÇK L
Id
ÇÇL N
}
ÇÇN O
"
ÇÇO P
)
ÇÇP Q
;
ÇÇQ R
}
ÉÉ 
var
ÖÖ 
action
ÖÖ 
=
ÖÖ 

masterUser
ÖÖ '
.
ÖÖ' (
Id
ÖÖ( *
==
ÖÖ+ -
$num
ÖÖ. /
?
ÖÖ0 1
PermissionEnum
ÖÖ2 @
.
ÖÖ@ A
Add
ÖÖA D
:
ÖÖE F
PermissionEnum
ÖÖG U
.
ÖÖU V
Edit
ÖÖV Z
;
ÖÖZ [
int
áá 
roleId
áá 
=
áá 
_helper
áá $
.
áá$ %
GetLoggedInRoleId
áá% 6
(
áá6 7
)
áá7 8
;
áá8 9
if
àà 
(
àà 
!
àà 
CheckRoleAccess
àà $
(
àà$ %"
ModulePermissionEnum
àà% 9
.
àà9 :
ResourceMaster
àà: H
,
ààH I
action
ààJ P
,
ààP Q
roleId
ààR X
)
ààX Y
)
ààY Z
return
ââ 
RedirectToAction
ââ +
(
ââ+ ,
AppConstants
ââ, 8
.
ââ8 9
AccessRestriction
ââ9 J
,
ââJ K
AppConstants
ââL X
.
ââX Y
Home
ââY ]
)
ââ] ^
;
ââ^ _

masterUser
èè 
.
èè 
Email
èè  
??=
èè! $

masterUser
èè% /
.
èè/ 0
Address
èè0 7
?
èè7 8
.
èè8 9
Email
èè9 >
;
èè> ?
if
êê 
(
êê 

masterUser
êê 
.
êê 
Document
êê '
!=
êê( *
null
êê+ /
&&
êê0 2

masterUser
êê3 =
.
êê= >
Document
êê> F
.
êêF G
Files
êêG L
!=
êêM O
null
êêP T
)
êêT U
{
ëë 
List
íí 
<
íí !
MasterDocumentModel
íí ,
>
íí, -
docs
íí. 2
=
íí3 4
_helper
íí5 <
.
íí< =

FileUpload
íí= G
(
ííG H

masterUser
ííH R
.
ííR S
Document
ííS [
)
íí[ \
;
íí\ ]

masterUser
ìì 
.
ìì 
uploadDocument
ìì -
=
ìì. /
docs
ìì0 4
;
ìì4 5

masterUser
îî 
.
îî 
Document
îî '
=
îî( )
null
îî* .
;
îî. /
}
ïï 
if
ññ 
(
ññ 

masterUser
ññ 
.
ññ 
File
ññ #
!=
ññ$ &
null
ññ' +
)
ññ+ ,
{
óó !
MasterDocumentModel
òò '
docs
òò( ,
=
òò- .
ProfileUpload
òò/ <
(
òò< =

masterUser
òò= G
.
òòG H
File
òòH L
)
òòL M
;
òòM N

masterUser
ôô 
.
ôô 
uploadProfile
ôô ,
=
ôô- .
docs
ôô/ 3
;
ôô3 4

masterUser
öö 
.
öö 
File
öö #
=
öö$ %
null
öö& *
;
öö* +
}
õõ 

masterUser
úú 
.
úú 
DepartmentId
úú '
=
úú( )

masterUser
úú* 4
.
úú4 5
DepartmentId
úú5 A
==
úúB D
$num
úúE F
?
úúG H
null
úúI M
:
úúN O

masterUser
úúP Z
.
úúZ [
DepartmentId
úú[ g
;
úúg h

masterUser
ùù 
.
ùù 
DesignationId
ùù (
=
ùù) *

masterUser
ùù+ 5
.
ùù5 6
DesignationId
ùù6 C
==
ùùD F
$num
ùùG H
?
ùùI J
null
ùùK O
:
ùùP Q

masterUser
ùùR \
.
ùù\ ]
DesignationId
ùù] j
;
ùùj k

masterUser
ûû 
.
ûû 
Address
ûû "
=
ûû# $
null
ûû% )
;
ûû) *

masterUser
üü 
.
üü 
Qualification
üü (
=
üü) *
null
üü+ /
;
üü/ 0
if
¢¢ 
(
¢¢ 

masterUser
¢¢ 
.
¢¢ 
Id
¢¢ !
==
¢¢" $
$num
¢¢% &
)
¢¢& '

masterUser
££ 
.
££ 
	CreatedBy
££ (
=
££) *
_helper
££+ 2
.
££2 3
GetLoggedInUserId
££3 D
(
££D E
)
££E F
;
££F G

masterUser
§§ 
.
§§ 

ModifiedBy
§§ %
=
§§& '
_helper
§§( /
.
§§/ 0
GetLoggedInUserId
§§0 A
(
§§A B
)
§§B C
;
§§C D
HttpContext
¶¶ 
.
¶¶ 
Request
¶¶ #
.
¶¶# $
Cookies
¶¶$ +
.
¶¶+ ,
TryGetValue
¶¶, 7
(
¶¶7 8

UserHelper
¶¶8 B
.
¶¶B C
EltizamToken
¶¶C O
,
¶¶O P
out
¶¶Q T
string
¶¶U [
token
¶¶\ a
)
¶¶a b
;
¶¶b c
APIRepository
ßß 
objapi
ßß $
=
ßß% &
new
ßß' *
(
ßß* +
_cofiguration
ßß+ 8
)
ßß8 9
;
ßß9 :!
HttpResponseMessage
©© #
responseMessage
©©$ 3
=
©©4 5
objapi
©©6 <
.
©©< =
APICommunication
©©= M
(
©©M N
APIURLHelper
©©N Z
.
©©Z [

UpsertUser
©©[ e
,
©©e f

HttpMethod
©©g q
.
©©q r
Post
©©r v
,
©©v w
token
©©x }
,
©©} ~
new©© Ç
StringContent©©É ê
(©©ê ë
JsonConvert©©ë ú
.©©ú ù
SerializeObject©©ù ¨
(©©¨ ≠

masterUser©©≠ ∑
)©©∑ ∏
)©©∏ π
)©©π ∫
.©©∫ ª
Result©©ª ¡
;©©¡ ¬
if
´´ 
(
´´ 
responseMessage
´´ #
.
´´# $!
IsSuccessStatusCode
´´$ 7
&&
´´8 :

masterUser
´´; E
.
´´E F
Id
´´F H
==
´´I K
$num
´´L M
)
´´M N
{
¨¨ 
string
≠≠ 
jsonResponse
≠≠ '
=
≠≠( )
responseMessage
≠≠* 9
.
≠≠9 :
Content
≠≠: A
.
≠≠A B
ReadAsStringAsync
≠≠B S
(
≠≠S T
)
≠≠T U
.
≠≠U V
Result
≠≠V \
;
≠≠\ ]
TempData
ÆÆ 
[
ÆÆ 

UserHelper
ÆÆ '
.
ÆÆ' (
SuccessMessage
ÆÆ( 6
]
ÆÆ6 7
=
ÆÆ8 9
Convert
ÆÆ: A
.
ÆÆA B
ToString
ÆÆB J
(
ÆÆJ K$
_stringLocalizerShared
ÆÆK a
[
ÆÆa b
$str
ÆÆb v
]
ÆÆv w
)
ÆÆw x
;
ÆÆx y
return
ØØ 
RedirectToAction
ØØ +
(
ØØ+ ,
$str
ØØ, 3
)
ØØ3 4
;
ØØ4 5
}
∞∞ 
if
±± 
(
±± 
responseMessage
±± #
.
±±# $!
IsSuccessStatusCode
±±$ 7
)
±±7 8
{
≤≤ 
string
≥≥ 
jsonResponse
≥≥ '
=
≥≥( )
responseMessage
≥≥* 9
.
≥≥9 :
Content
≥≥: A
.
≥≥A B
ReadAsStringAsync
≥≥B S
(
≥≥S T
)
≥≥T U
.
≥≥U V
Result
≥≥V \
;
≥≥\ ]
TempData
¥¥ 
[
¥¥ 

UserHelper
¥¥ '
.
¥¥' (
SuccessMessage
¥¥( 6
]
¥¥6 7
=
¥¥8 9
Convert
¥¥: A
.
¥¥A B
ToString
¥¥B J
(
¥¥J K$
_stringLocalizerShared
¥¥K a
[
¥¥a b
$str
¥¥b v
]
¥¥v w
)
¥¥w x
;
¥¥x y
return
∂∂ 
Redirect
∂∂ #
(
∂∂# $
$"
∂∂$ &
$str
∂∂& @
{
∂∂@ A

masterUser
∂∂A K
.
∂∂K L
Id
∂∂L N
}
∂∂N O
"
∂∂O P
)
∂∂P Q
;
∂∂Q R
}
∑∑ 
else
∏∏ 
{
ππ 
TempData
∫∫ 
[
∫∫ 

UserHelper
∫∫ '
.
∫∫' (
ErrorMessage
∫∫( 4
]
∫∫4 5
=
∫∫6 7
Convert
∫∫8 ?
.
∫∫? @
ToString
∫∫@ H
(
∫∫H I
responseMessage
∫∫I X
.
∫∫X Y
Content
∫∫Y `
.
∫∫` a
ReadAsStringAsync
∫∫a r
(
∫∫r s
)
∫∫s t
.
∫∫t u
Result
∫∫u {
)
∫∫{ |
;
∫∫| }
return
ªª 
RedirectToAction
ªª +
(
ªª+ ,
$str
ªª, 8
,
ªª8 9
new
ªª: =
{
ªª> ?
id
ªª@ B
=
ªªC D

masterUser
ªªE O
.
ªªO P
Id
ªªP R
}
ªªS T
)
ªªT U
;
ªªU V
}
ºº 
}
ΩΩ 
catch
ææ 
(
ææ 
	Exception
ææ 
e
ææ 
)
ææ 
{
øø 
_helper
¿¿ 
.
¿¿ 
LogExceptions
¿¿ %
(
¿¿% &
e
¿¿& '
)
¿¿' (
;
¿¿( )
TempData
¡¡ 
[
¡¡ 

UserHelper
¡¡ #
.
¡¡# $
ErrorMessage
¡¡$ 0
]
¡¡0 1
=
¡¡2 3
Convert
¡¡4 ;
.
¡¡; <
ToString
¡¡< D
(
¡¡D E
e
¡¡E F
.
¡¡F G

StackTrace
¡¡G Q
)
¡¡Q R
;
¡¡R S
return
¬¬ 
Redirect
¬¬ 
(
¬¬  
$"
¬¬  "
$str
¬¬" <
{
¬¬< =

masterUser
¬¬= G
.
¬¬G H
Id
¬¬H J
}
¬¬J K
"
¬¬K L
)
¬¬L M
;
¬¬M N
}
ƒƒ 
}
∆∆ 	
[
»» 	
HttpGet
»»	 
]
»» 
[
…… 	
Route
……	 
(
…… 
$str
…… &
)
……& '
]
……' (
public
   
IActionResult
   

UserDetail
   '
(
  ' (
int
  ( +
?
  + ,
id
  - /
)
  / 0
{
ÀÀ 	
var
ÕÕ 
action
ÕÕ 
=
ÕÕ 
id
ÕÕ 
==
ÕÕ 
null
ÕÕ #
?
ÕÕ$ %
PermissionEnum
ÕÕ& 4
.
ÕÕ4 5
Edit
ÕÕ5 9
:
ÕÕ: ;
PermissionEnum
ÕÕ< J
.
ÕÕJ K
View
ÕÕK O
;
ÕÕO P
int
œœ 
roleId
œœ 
=
œœ 
_helper
œœ  
.
œœ  !
GetLoggedInRoleId
œœ! 2
(
œœ2 3
)
œœ3 4
;
œœ4 5
int
–– 
loginId
–– 
=
–– 
_helper
–– !
.
––! "
GetLoggedInUserId
––" 3
(
––3 4
)
––4 5
;
––5 6
if
—— 
(
—— 
!
—— 
CheckRoleAccess
——  
(
——  !"
ModulePermissionEnum
——! 5
.
——5 6
ResourceMaster
——6 D
,
——D E
action
——F L
,
——L M
roleId
——N T
)
——T U
)
——U V
{
““ 
if
”” 
(
”” 
id
”” 
!=
”” 
loginId
”” !
)
””! "
return
‘‘ 
RedirectToAction
‘‘ +
(
‘‘+ ,
AppConstants
‘‘, 8
.
‘‘8 9
AccessRestriction
‘‘9 J
,
‘‘J K
AppConstants
‘‘L X
.
‘‘X Y
Home
‘‘Y ]
)
‘‘] ^
;
‘‘^ _
}
’’ 
MasterUserModel
◊◊ 

masterUser
◊◊ &
;
◊◊& '
if
ÿÿ 
(
ÿÿ 
id
ÿÿ 
==
ÿÿ 
null
ÿÿ 
||
ÿÿ 
id
ÿÿ  
<=
ÿÿ! #
$num
ÿÿ$ %
)
ÿÿ% &
{
ŸŸ 

masterUser
⁄⁄ 
=
⁄⁄ 
new
⁄⁄  
MasterUserModel
⁄⁄! 0
(
⁄⁄0 1
)
⁄⁄1 2
;
⁄⁄2 3
return
€€ 
RedirectToAction
€€ '
(
€€' (
$str
€€( 4
)
€€4 5
;
€€5 6
}
‹‹ 
else
›› 
{
ﬁﬁ 
HttpContext
ﬂﬂ 
.
ﬂﬂ 
Request
ﬂﬂ #
.
ﬂﬂ# $
Cookies
ﬂﬂ$ +
.
ﬂﬂ+ ,
TryGetValue
ﬂﬂ, 7
(
ﬂﬂ7 8

UserHelper
ﬂﬂ8 B
.
ﬂﬂB C
EltizamToken
ﬂﬂC O
,
ﬂﬂO P
out
ﬂﬂQ T
string
ﬂﬂU [
token
ﬂﬂ\ a
)
ﬂﬂa b
;
ﬂﬂb c
APIRepository
‡‡ 
objapi
‡‡ $
=
‡‡% &
new
‡‡' *
(
‡‡* +
_cofiguration
‡‡+ 8
)
‡‡8 9
;
‡‡9 :!
HttpResponseMessage
·· #
responseMessage
··$ 3
=
··4 5
objapi
··6 <
.
··< =
APICommunication
··= M
(
··M N
APIURLHelper
··N Z
.
··Z [
GetUserById
··[ f
+
··g h
$str
··i l
+
··m n
id
··o q
,
··q r

HttpMethod
··s }
.
··} ~
Get··~ Å
,··Å Ç
token··É à
)··à â
.··â ä
Result··ä ê
;··ê ë
if
„„ 
(
„„ 
responseMessage
„„ #
.
„„# $!
IsSuccessStatusCode
„„$ 7
)
„„7 8
{
‰‰ 
string
ÂÂ 
jsonResponse
ÂÂ '
=
ÂÂ( )
responseMessage
ÂÂ* 9
.
ÂÂ9 :
Content
ÂÂ: A
.
ÂÂA B
ReadAsStringAsync
ÂÂB S
(
ÂÂS T
)
ÂÂT U
.
ÂÂU V
Result
ÂÂV \
;
ÂÂ\ ]
var
ÊÊ 
data
ÊÊ 
=
ÊÊ 
JsonConvert
ÊÊ *
.
ÊÊ* +
DeserializeObject
ÊÊ+ <
<
ÊÊ< =
APIResponseEntity
ÊÊ= N
<
ÊÊN O
MasterUserModel
ÊÊO ^
>
ÊÊ^ _
>
ÊÊ_ `
(
ÊÊ` a
jsonResponse
ÊÊa m
)
ÊÊm n
;
ÊÊn o

FooterInfo
ÁÁ 
(
ÁÁ 
TableNameEnum
ÁÁ ,
.
ÁÁ, -
Master_User
ÁÁ- 8
,
ÁÁ8 9
_cofiguration
ÁÁ: G
,
ÁÁG H
id
ÁÁI K
,
ÁÁK L
true
ÁÁM Q
)
ÁÁQ R
;
ÁÁR S
if
ÈÈ 
(
ÈÈ 
data
ÈÈ 
.
ÈÈ 
_object
ÈÈ $
is
ÈÈ% '
null
ÈÈ( ,
)
ÈÈ, -
return
ÍÍ 
NotFound
ÍÍ '
(
ÍÍ' (
)
ÍÍ( )
;
ÍÍ) *
return
ÏÏ 
View
ÏÏ 
(
ÏÏ  
data
ÏÏ  $
.
ÏÏ$ %
_object
ÏÏ% ,
)
ÏÏ, -
;
ÏÏ- .
}
ÌÌ 
return
ÓÓ 
NotFound
ÓÓ 
(
ÓÓ  
)
ÓÓ  !
;
ÓÓ! "
}
ÔÔ 
}
 	
[
ÚÚ 	
HttpGet
ÚÚ	 
]
ÚÚ 
public
ÛÛ 
IActionResult
ÛÛ  
DeleteUserDocument
ÛÛ /
(
ÛÛ/ 0
int
ÛÛ0 3
id
ÛÛ4 6
,
ÛÛ6 7
string
ÛÛ8 >
?
ÛÛ> ?
fileName
ÛÛ@ H
)
ÛÛH I
{
ÙÙ 	
try
ıı 
{
ˆˆ 
int
¯¯ 
isFileDelete
¯¯  
=
¯¯! "

DeleteFile
¯¯# -
(
¯¯- .
id
¯¯. 0
,
¯¯0 1
fileName
¯¯2 :
)
¯¯: ;
;
¯¯; <
HttpContext
˘˘ 
.
˘˘ 
Request
˘˘ #
.
˘˘# $
Cookies
˘˘$ +
.
˘˘+ ,
TryGetValue
˘˘, 7
(
˘˘7 8

UserHelper
˘˘8 B
.
˘˘B C
EltizamToken
˘˘C O
,
˘˘O P
out
˘˘Q T
string
˘˘U [
token
˘˘\ a
)
˘˘a b
;
˘˘b c
APIRepository
˙˙ 
objapi
˙˙ $
=
˙˙% &
new
˙˙' *
(
˙˙* +
_cofiguration
˙˙+ 8
)
˙˙8 9
;
˙˙9 :!
HttpResponseMessage
˚˚ #
responseMessage
˚˚$ 3
=
˚˚4 5
objapi
˚˚6 <
.
˚˚< =
APICommunication
˚˚= M
(
˚˚M N
APIURLHelper
˚˚N Z
.
˚˚Z [$
DeleteUserDocumentById
˚˚[ q
+
˚˚r s
$str
˚˚t w
+
˚˚x y
id
˚˚z |
,
˚˚| }

HttpMethod˚˚~ à
.˚˚à â
Delete˚˚â è
,˚˚è ê
token˚˚ë ñ
)˚˚ñ ó
.˚˚ó ò
Result˚˚ò û
;˚˚û ü
if
˝˝ 
(
˝˝ 
responseMessage
˝˝ #
.
˝˝# $!
IsSuccessStatusCode
˝˝$ 7
)
˝˝7 8
{
˛˛ 
string
ˇˇ 
jsonResponse
ˇˇ '
=
ˇˇ( )
responseMessage
ˇˇ* 9
.
ˇˇ9 :
Content
ˇˇ: A
.
ˇˇA B
ReadAsStringAsync
ˇˇB S
(
ˇˇS T
)
ˇˇT U
.
ˇˇU V
Result
ˇˇV \
;
ˇˇ\ ]
TempData
ÄÄ 
[
ÄÄ 

UserHelper
ÄÄ '
.
ÄÄ' (
SuccessMessage
ÄÄ( 6
]
ÄÄ6 7
=
ÄÄ8 9
Convert
ÄÄ: A
.
ÄÄA B
ToString
ÄÄB J
(
ÄÄJ K$
_stringLocalizerShared
ÄÄK a
[
ÄÄa b
$str
ÄÄb v
]
ÄÄv w
)
ÄÄw x
;
ÄÄx y
}
ÅÅ 
else
ÇÇ 
TempData
ÉÉ 
[
ÉÉ 

UserHelper
ÉÉ '
.
ÉÉ' (
ErrorMessage
ÉÉ( 4
]
ÉÉ4 5
=
ÉÉ6 7
Convert
ÉÉ8 ?
.
ÉÉ? @
ToString
ÉÉ@ H
(
ÉÉH I
responseMessage
ÉÉI X
.
ÉÉX Y
Content
ÉÉY `
.
ÉÉ` a
ReadAsStringAsync
ÉÉa r
(
ÉÉr s
)
ÉÉs t
.
ÉÉt u
Result
ÉÉu {
)
ÉÉ{ |
;
ÉÉ| }
}
ÖÖ 
catch
ÜÜ 
(
ÜÜ 
	Exception
ÜÜ 
e
ÜÜ 
)
ÜÜ 
{
áá 
_helper
àà 
.
àà 
LogExceptions
àà %
(
àà% &
e
àà& '
)
àà' (
;
àà( )
TempData
ââ 
[
ââ 

UserHelper
ââ #
.
ââ# $
ErrorMessage
ââ$ 0
]
ââ0 1
=
ââ2 3
Convert
ââ4 ;
.
ââ; <
ToString
ââ< D
(
ââD E
e
ââE F
.
ââF G

StackTrace
ââG Q
)
ââQ R
;
ââR S
}
ää 
return
åå 
RedirectToAction
åå #
(
åå# $
$str
åå$ +
)
åå+ ,
;
åå, -
}
çç 	
public
èè 
async
èè 
Task
èè 
<
èè 
BlobResponse
èè &
>
èè& '
UploadToBlob
èè( 4
(
èè4 5
	IFormFile
èè5 >
file
èè? C
)
èèC D
{
êê 	
BlobHandler
ëë 
blob
ëë 
=
ëë 
new
ëë "
BlobHandler
ëë# .
(
ëë. /
)
ëë/ 0
;
ëë0 1
return
íí 
await
íí 
blob
íí 
.
íí 
SingleFileUpload
íí .
(
íí. /
file
íí/ 3
.
íí3 4
OpenReadStream
íí4 B
(
ííB C
)
ííC D
,
ííD E
$num
ííF I
,
ííI J
file
ííK O
.
ííO P
FileName
ííP X
,
ííX Y
$str
ííZ e
,
ííe f
$num
ííg j
,
ííj k
$num
ííl m
)
íím n
;
íín o
}
ìì 	
private
îî !
MasterDocumentModel
îî #
ProfileUpload
îî$ 1
(
îî1 2
	IFormFile
îî2 ;
pic
îî< ?
)
îî? @
{
ïï 	!
MasterDocumentModel
ññ 

uploadFils
ññ  *
=
ññ+ ,
new
ññ- 0!
MasterDocumentModel
ññ1 D
(
ññD E
)
ññE F
;
ññF G
if
óó 
(
óó 
pic
óó 
==
óó 
null
óó 
)
óó 
{
òò 
throw
ôô 
new
ôô 
ArgumentException
ôô +
(
ôô+ ,
$str
ôô, E
)
ôôE F
;
ôôF G
}
öö 
var
õõ 
currentUser
õõ 
=
õõ 
_helper
õõ %
.
õõ% &
GetLoggedInUserId
õõ& 7
(
õõ7 8
)
õõ8 9
;
õõ9 :
var
úú 
savedFileNames
úú 
=
úú  
new
úú! $
List
úú% )
<
úú) *
string
úú* 0
>
úú0 1
(
úú1 2
)
úú2 3
;
úú3 4
var
•• 
fileName
•• 
=
•• 
Guid
•• 
.
••  
NewGuid
••  '
(
••' (
)
••( )
.
••) *
ToString
••* 2
(
••2 3
)
••3 4
+
••5 6
Path
••7 ;
.
••; <
GetExtension
••< H
(
••H I
pic
••I L
.
••L M
FileName
••M U
)
••U V
;
••V W
var
ßß 
docName
ßß 
=
ßß 
pic
ßß 
.
ßß 
FileName
ßß &
;
ßß& '
var
®® 
filePath
®® 
=
®® 
Path
®® 
.
®®  
Combine
®®  '
(
®®' (
$str
®®( 9
,
®®9 :
fileName
®®; C
)
®®C D
;
®®D E
filePath
©© 
=
©© 
filePath
©© 
.
©©  
Replace
©©  '
(
©©' (
$str
©©( ,
,
©©, -
$str
©©. 1
)
©©1 2
;
©©2 3
using
™™ 
(
™™ 
var
™™ 
stream
™™ 
=
™™ 
new
™™  #

FileStream
™™$ .
(
™™. /
filePath
™™/ 7
,
™™7 8
FileMode
™™9 A
.
™™A B
Create
™™B H
)
™™H I
)
™™I J
{
´´ 
pic
¨¨ 
.
¨¨ 
CopyToAsync
¨¨ 
(
¨¨  
stream
¨¨  &
)
¨¨& '
;
¨¨' (
}
≠≠ 
var
∞∞ 
upload
∞∞ 
=
∞∞ 
new
∞∞ !
MasterDocumentModel
∞∞ 0
{
±± 
FileName
≤≤ 
=
≤≤ 
fileName
≤≤ #
,
≤≤# $
FilePath
≥≥ 
=
≥≥ 
filePath
≥≥ #
.
≥≥# $
Replace
≥≥$ +
(
≥≥+ ,
$str
≥≥, 5
,
≥≥5 6
$str
≥≥7 ;
)
≥≥; <
,
≥≥< =
DocumentName
¥¥ 
=
¥¥ 
docName
¥¥ &
,
¥¥& '
IsActive
µµ 
=
µµ 
true
µµ 
,
µµ  
	CreatedBy
∂∂ 
=
∂∂ 
currentUser
∂∂ '
,
∂∂' (
FileType
∑∑ 
=
∑∑ 
pic
∑∑ 
.
∑∑ 
ContentType
∑∑ *
,
∑∑* +
CreatedDate
∏∏ 
=
∏∏ 
null
∏∏ "
,
∏∏" #
CreatedName
ππ 
=
ππ 
$str
ππ  
}
∫∫ 
;
∫∫ 
return
ºº 
upload
ºº 
;
ºº 
}
ΩΩ 	
private
ææ 
int
ææ 

DeleteFile
ææ 
(
ææ 
int
ææ "
id
ææ# %
,
ææ% &
string
ææ' -
?
ææ- .
fileName
ææ/ 7
)
ææ7 8
{
øø 	
int
¿¿ 
isDelete
¿¿ 
=
¿¿ 
$num
¿¿ 
;
¿¿ 
if
¡¡ 
(
¡¡ 
fileName
¡¡ 
!=
¡¡ 
null
¡¡  
||
¡¡! #
fileName
¡¡$ ,
!=
¡¡- /
$str
¡¡0 2
)
¡¡2 3
{
¬¬ 
var
√√ 
filePath
√√ 
=
√√ 
Path
√√ #
.
√√# $
Combine
√√$ +
(
√√+ ,
$str
√√, =
,
√√= >
fileName
√√? G
)
√√G H
;
√√H I
filePath
ƒƒ 
=
ƒƒ 
filePath
ƒƒ #
.
ƒƒ# $
Replace
ƒƒ$ +
(
ƒƒ+ ,
$str
ƒƒ, 0
,
ƒƒ0 1
$str
ƒƒ2 5
)
ƒƒ5 6
;
ƒƒ6 7
if
∆∆ 
(
∆∆ 
System
∆∆ 
.
∆∆ 
IO
∆∆ 
.
∆∆ 
File
∆∆ "
.
∆∆" #
Exists
∆∆# )
(
∆∆) *
filePath
∆∆* 2
)
∆∆2 3
)
∆∆3 4
{
«« 
System
…… 
.
…… 
IO
…… 
.
…… 
File
…… "
.
……" #
Delete
……# )
(
……) *
filePath
……* 2
)
……2 3
;
……3 4
isDelete
   
=
   
$num
    
;
    !
}
ÀÀ 
}
ÕÕ 
return
ŒŒ 
isDelete
ŒŒ 
;
ŒŒ 
}
œœ 	
}
““ 
}”” õè
FD:\EltizamLive\Eltizam.Web\Controllers\MasterValuationFeeController.cs
	namespace 	
EltizamValuation
 
. 
Web 
. 
Controllers *
{ 
public 

class (
MasterValuationFeeController -
:. /
BaseController0 >
{ 
private 
readonly 
IConfiguration '
_cofiguration( 5
;5 6
private 
readonly 
IStringLocalizer )
<) *
Shared* 0
>0 1"
_stringLocalizerShared2 H
;H I
private 
readonly 
IHelper  
_helper! (
;( )
public (
MasterValuationFeeController +
(+ ,
IConfiguration, :
configuration; H
,H I
IStringLocalizerJ Z
<Z [
Shared[ a
>a b!
stringLocalizerSharedc x
,x y
IHelper	z Å
helper
Ç à
)
à â
{ 	
_cofiguration 
= 
configuration )
;) *"
_stringLocalizerShared "
=# $!
stringLocalizerShared% :
;: ;
_helper 
= 
helper 
; 
} 	
public   
IActionResult   
ValuationFees   *
(  * +
)  + ,
{!! 	

ModelState"" 
."" 
Clear"" 
("" 
)"" 
;"" 
try## 
{$$ 
int&& 
roleId&& 
=&& 
_helper&& $
.&&$ %
GetLoggedInRoleId&&% 6
(&&6 7
)&&7 8
;&&8 9
if'' 
('' 
!'' 
CheckRoleAccess'' $
(''$ % 
ModulePermissionEnum''% 9
.''9 :
ValuationFeeMaster'': L
,''L M
PermissionEnum''N \
.''\ ]
View''] a
,''a b
roleId''c i
)''i j
)''j k
return(( 
RedirectToAction(( +
(((+ ,
AppConstants((, 8
.((8 9
AccessRestriction((9 J
,((J K
AppConstants((L X
.((X Y
Home((Y ]
)((] ^
;((^ _
return)) 
View)) 
()) 
))) 
;)) 
}** 
catch++ 
(++ 
	Exception++ 
e++ 
)++ 
{,, 
_helper-- 
.-- 
LogExceptions-- %
(--% &
e--& '
)--' (
;--( )
ViewBag.. 
... 
errormessage.. $
=..% &
Convert..' .
.... /
ToString../ 7
(..7 8
e..8 9
...9 :

StackTrace..: D
)..D E
;..E F
return// 
View// 
(// 
$str// #
)//# $
;//$ %
}00 
}11 	
[44 	
HttpPost44	 
]44 
[55 	
Route55	 
(55 
$str55 6
)556 7
]557 8
public66 
IActionResult66 
MasterValuationFee66 /
(66/ 0
int660 3
id664 6
,666 7$
MasterValuationFeesModel668 P$
masterValuationFeesModel66Q i
)66i j
{77 	
try88 
{99 
var;; 
action;; 
=;; $
masterValuationFeesModel;; 5
.;;5 6
Id;;6 8
==;;9 ;
$num;;< =
?;;> ?
PermissionEnum;;@ N
.;;N O
Add;;O R
:;;S T
PermissionEnum;;U c
.;;c d
Edit;;d h
;;;h i
int== 
roleId== 
=== 
_helper== $
.==$ %
GetLoggedInRoleId==% 6
(==6 7
)==7 8
;==8 9
if>> 
(>> 
!>> 
CheckRoleAccess>> $
(>>$ % 
ModulePermissionEnum>>% 9
.>>9 :
ValuationFeeMaster>>: L
,>>L M
action>>N T
,>>T U
roleId>>V \
)>>\ ]
)>>] ^
return?? 
RedirectToAction?? +
(??+ ,
AppConstants??, 8
.??8 9
AccessRestriction??9 J
,??J K
AppConstants??L X
.??X Y
Home??Y ]
)??] ^
;??^ _
ifBB 
(BB $
masterValuationFeesModelBB ,
.BB, -
IdBB- /
==BB0 2
$numBB3 4
)BB4 5$
masterValuationFeesModelCC ,
.CC, -
	CreatedByCC- 6
=CC7 8
_helperCC9 @
.CC@ A
GetLoggedInUserIdCCA R
(CCR S
)CCS T
;CCT U$
masterValuationFeesModelDD (
.DD( )

ModifiedByDD) 3
=DD4 5
_helperDD6 =
.DD= >
GetLoggedInUserIdDD> O
(DDO P
)DDP Q
;DDQ R
HttpContextFF 
.FF 
RequestFF #
.FF# $
CookiesFF$ +
.FF+ ,
TryGetValueFF, 7
(FF7 8

UserHelperFF8 B
.FFB C
EltizamTokenFFC O
,FFO P
outFFQ T
stringFFU [
tokenFF\ a
)FFa b
;FFb c
APIRepositoryGG 
objapiGG $
=GG% &
newGG' *
(GG* +
_cofigurationGG+ 8
)GG8 9
;GG9 :
HttpResponseMessageHH #
responseMessageHH$ 3
=HH4 5
objapiHH6 <
.HH< =
APICommunicationHH= M
(HHM N
APIURLHelperHHN Z
.HHZ [
UpsertValuationHH[ j
,HHj k

HttpMethodHHl v
.HHv w
PostHHw {
,HH{ |
token	HH} Ç
,
HHÇ É
new
HHÑ á
StringContent
HHà ï
(
HHï ñ
JsonConvert
HHñ °
.
HH° ¢
SerializeObject
HH¢ ±
(
HH± ≤&
masterValuationFeesModel
HH≤  
)
HH  À
)
HHÀ Ã
)
HHÃ Õ
.
HHÕ Œ
Result
HHŒ ‘
;
HH‘ ’
ifII 
(II 
responseMessageII #
.II# $
IsSuccessStatusCodeII$ 7
&&II8 :$
masterValuationFeesModelII; S
.IIS T
IdIIT V
==IIV X
$numIIX Y
)IIY Z
{JJ 
TempDataKK 
[KK 

UserHelperKK '
.KK' (
SuccessMessageKK( 6
]KK6 7
=KK8 9
ConvertKK: A
.KKA B
ToStringKKB J
(KKJ K"
_stringLocalizerSharedKKK a
[KKa b
$strKKb v
]KKv w
)KKw x
;KKx y
stringLL 
jsonResponseLL '
=LL( )
responseMessageLL* 9
.LL9 :
ContentLL: A
.LLA B
ReadAsStringAsyncLLB S
(LLS T
)LLT U
.LLU V
ResultLLV \
;LL\ ]

ModelStateMM 
.MM 
ClearMM $
(MM$ %
)MM% &
;MM& '
returnNN 
RedirectToActionNN +
(NN+ ,
nameofNN, 2
(NN2 3
ValuationFeesNN3 @
)NN@ A
)NNA B
;NNB C
}OO 
ifPP 
(PP 
responseMessagePP #
.PP# $
IsSuccessStatusCodePP$ 7
)PP7 8
{QQ 
TempDataSS 
[SS 

UserHelperSS '
.SS' (
SuccessMessageSS( 6
]SS6 7
=SS8 9
ConvertSS: A
.SSA B
ToStringSSB J
(SSJ K"
_stringLocalizerSharedSSK a
[SSa b
$strSSb v
]SSv w
)SSw x
;SSx y
stringTT 
jsonResponseTT '
=TT( )
responseMessageTT* 9
.TT9 :
ContentTT: A
.TTA B
ReadAsStringAsyncTTB S
(TTS T
)TTT U
.TTU V
ResultTTV \
;TT\ ]

ModelStateUU 
.UU 
ClearUU $
(UU$ %
)UU% &
;UU& '
returnVV 
RedirectVV #
(VV# $
$"VV$ &
$strVV& P
{VVP Q$
masterValuationFeesModelVVQ i
.VVi j
IdVVj l
}VVl m
"VVm n
)VVn o
;VVo p
}WW 
elseXX 
TempDataYY 
[YY 

UserHelperYY '
.YY' (
ErrorMessageYY( 4
]YY4 5
=YY6 7
$strYY8 K
;YYK L
}ZZ 
catch[[ 
([[ 
	Exception[[ 
e[[ 
)[[ 
{\\ 
_helper]] 
.]] 
LogExceptions]] %
(]]% &
e]]& '
)]]' (
;]]( )

ModelState^^ 
.^^ 
Clear^^  
(^^  !
)^^! "
;^^" #
return__ 
View__ 
(__ 
nameof__ "
(__" #
ValuationFees__# 0
)__0 1
)__1 2
;__2 3
}`` 

ModelStateaa 
.aa 
Clearaa 
(aa 
)aa 
;aa 
returnbb 
RedirectToActionbb #
(bb# $
nameofbb$ *
(bb* +
ValuationFeesbb+ 8
)bb8 9
)bb9 :
;bb: ;
}cc 	
publicff 
IActionResultff 
ValuationFeeManageff /
(ff/ 0
intff0 3
?ff3 4
idff5 7
)ff7 8
{gg 	$
MasterValuationFeesModelhh $$
masterValuationFeesModelhh% =
;hh= >
varkk 
actionkk 
=kk 
idkk 
==kk 
nullkk #
?kk$ %
PermissionEnumkk& 4
.kk4 5
Addkk5 8
:kk9 :
PermissionEnumkk; I
.kkI J
EditkkJ N
;kkN O
intll 
roleIdll 
=ll 
_helperll  
.ll  !
GetLoggedInRoleIdll! 2
(ll2 3
)ll3 4
;ll4 5
ifnn 
(nn 
!nn 
CheckRoleAccessnn  
(nn  ! 
ModulePermissionEnumnn! 5
.nn5 6
ValuationFeeMasternn6 H
,nnH I
actionnnJ P
,nnP Q
roleIdnnR X
)nnX Y
)nnY Z
returnoo 
RedirectToActionoo '
(oo' (
AppConstantsoo( 4
.oo4 5
AccessRestrictionoo5 F
,ooF G
AppConstantsooH T
.ooT U
HomeooU Y
)ooY Z
;ooZ [
ifpp 
(pp 
idpp 
==pp 
nullpp 
||pp 
idpp  
<=pp! #
$numpp$ %
)pp% &
{qq $
masterValuationFeesModelrr 
=rr 
newrr "$
MasterValuationFeesModelrr# ;
(rr; <
)rr< =
;rr= >$
masterValuationFeesModelss (
.ss( )
IsActivess) 1
=ss2 3
truess4 8
;ss8 9
returntt 
Viewtt 
(tt $
masterValuationFeesModeltt 4
)tt4 5
;tt5 6
}uu 
elsevv 
{ww 
HttpContextxx 
.xx 
Requestxx #
.xx# $
Cookiesxx$ +
.xx+ ,
TryGetValuexx, 7
(xx7 8

UserHelperxx8 B
.xxB C
EltizamTokenxxC O
,xxO P
outxxQ T
stringxxU [
tokenxx\ a
)xxa b
;xxb c
APIRepositoryyy 
objapiyy $
=yy% &
newyy' *
(yy* +
_cofigurationyy+ 8
)yy8 9
;yy9 :
HttpResponseMessagezz #
responseMessagezz$ 3
=zz4 5
objapizz6 <
.zz< =
APICommunicationzz= M
(zzM N
APIURLHelperzzN Z
.zzZ [
GetValuationByIdzz[ k
+zzl m
$strzzn q
+zzr s
idzzt v
,zzv w

HttpMethod	zzx Ç
.
zzÇ É
Get
zzÉ Ü
,
zzÜ á
token
zzà ç
)
zzç é
.
zzé è
Result
zzè ï
;
zzï ñ
if|| 
(|| 
responseMessage|| #
.||# $
IsSuccessStatusCode||$ 7
)||7 8
{}} 
string~~ 
jsonResponse~~ '
=~~( )
responseMessage~~* 9
.~~9 :
Content~~: A
.~~A B
ReadAsStringAsync~~B S
(~~S T
)~~T U
.~~U V
Result~~V \
;~~\ ]
var 
data 
= 
JsonConvert *
.* +
DeserializeObject+ <
<< =
APIResponseEntity= N
<N O$
MasterValuationFeesModelO g
>g h
>h i
(i j
jsonResponsej v
)v w
;w x

FooterInfo
ÇÇ 
(
ÇÇ 
TableNameEnum
ÇÇ ,
.
ÇÇ, -!
Master_ValuationFee
ÇÇ- @
,
ÇÇ@ A
_cofiguration
ÇÇB O
,
ÇÇO P
id
ÇÇQ S
)
ÇÇS T
;
ÇÇT U
if
ÑÑ 
(
ÑÑ 
data
ÑÑ 
.
ÑÑ 
_object
ÑÑ $
is
ÑÑ% '
null
ÑÑ( ,
)
ÑÑ, -
return
ÖÖ 
NotFound
ÖÖ '
(
ÖÖ' (
)
ÖÖ( )
;
ÖÖ) *
return
áá 
View
áá 
(
áá  
data
áá  $
.
áá$ %
_object
áá% ,
)
áá, -
;
áá- .
}
àà 
return
ââ 
NotFound
ââ 
(
ââ  
)
ââ  !
;
ââ! "
}
ää 
}
ãã 	
[
çç 
HttpGet
çç 

]
çç
 
[
éé 
Route
éé 
(
éé 	
$str
éé	 0
)
éé0 1
]
éé1 2
public
èè 
IActionResult
èè	 !
ValuationFeesDetail
èè *
(
èè* +
int
èè+ .
?
èè. /
id
èè0 2
)
èè2 3
{
êê &
MasterValuationFeesModel
ëë &
masterValuationFeesModel
ëë 4
;
ëë4 5
var
íí 
action
íí 
=
íí 
id
íí 
==
íí 
null
íí #
?
íí$ %
PermissionEnum
íí& 4
.
íí4 5
Edit
íí5 9
:
íí: ;
PermissionEnum
íí< J
.
ííJ K
View
ííK O
;
ííO P
int
ìì 
roleId
ìì 
=
ìì 
_helper
ìì  
.
ìì  !
GetLoggedInRoleId
ìì! 2
(
ìì2 3
)
ìì3 4
;
ìì4 5
if
ïï 
(
ïï 
!
ïï 
CheckRoleAccess
ïï  
(
ïï  !"
ModulePermissionEnum
ïï! 5
.
ïï5 6 
ValuationFeeMaster
ïï6 H
,
ïïH I
action
ïïJ P
,
ïïP Q
roleId
ïïR X
)
ïïX Y
)
ïïY Z
return
ññ 
RedirectToAction
ññ '
(
ññ' (
AppConstants
ññ( 4
.
ññ4 5
AccessRestriction
ññ5 F
,
ññF G
AppConstants
ññH T
.
ññT U
Home
ññU Y
)
ññY Z
;
ññZ [
if
òò 
(
òò 
id
òò 
==
òò 
null
òò 
||
òò 
id
òò  
<=
òò! #
$num
òò$ %
)
òò% &
{
ôô &
masterValuationFeesModel
öö 
=
öö 
new
öö "&
MasterValuationFeesModel
öö# ;
(
öö; <
)
öö< =
;
öö= >
return
õõ 

RedirectToAction
õõ 
(
õõ 
$str
õõ 0
)
õõ0 1
;
õõ1 2
}
úú 
else
ùù 
{
ûû 
HttpContext
üü 
.
üü 
Request
üü 
.
üü 
Cookies
üü 
.
üü  
TryGetValue
üü  +
(
üü+ ,

UserHelper
üü, 6
.
üü6 7
EltizamToken
üü7 C
,
üüC D
out
üüE H
string
üüI O
token
üüP U
)
üüU V
;
üüV W
APIRepository
†† 
objapi
†† 
=
†† 
new
†† 
(
†† 
_cofiguration
†† ,
)
††, -
;
††- .!
HttpResponseMessage
°° 
responseMessage
°° '
=
°°( )
objapi
°°* 0
.
°°0 1
APICommunication
°°1 A
(
°°A B
APIURLHelper
°°B N
.
°°N O
GetValuationById
°°O _
+
°°` a
$str
°°b e
+
°°f g
id
°°h j
,
°°j k

HttpMethod
°°l v
.
°°v w
Get
°°w z
,
°°z {
token°°| Å
)°°Å Ç
.°°Ç É
Result°°É â
;°°â ä
if
££ 
(
££ 
responseMessage
££ 
.
££ !
IsSuccessStatusCode
££ +
)
££+ ,
{
§§ 
string
•• 
jsonResponse
•• 
=
•• 
responseMessage
•• *
.
••* +
Content
••+ 2
.
••2 3
ReadAsStringAsync
••3 D
(
••D E
)
••E F
.
••F G
Result
••G M
;
••M N
var
¶¶ 
data
¶¶	 
=
¶¶ 
JsonConvert
¶¶ 
.
¶¶ 
DeserializeObject
¶¶ -
<
¶¶- .
APIResponseEntity
¶¶. ?
<
¶¶? @&
MasterValuationFeesModel
¶¶@ X
>
¶¶X Y
>
¶¶Y Z
(
¶¶Z [
jsonResponse
¶¶[ g
)
¶¶g h
;
¶¶h i

FooterInfo
©© 
(
©© 
TableNameEnum
©© ,
.
©©, -!
Master_ValuationFee
©©- @
,
©©@ A
_cofiguration
©©B O
,
©©O P
id
©©Q S
,
©©S T
true
©©U Y
)
©©Y Z
;
©©Z [
if
´´ 
(
´´ 
data
´´ 
.
´´ 
_object
´´ $
is
´´% '
null
´´( ,
)
´´, -
return
¨¨ 
NotFound
¨¨ 
(
¨¨ 
)
¨¨ 
;
¨¨ 
return
ÆÆ 
View
ÆÆ 
(
ÆÆ 
$str
ÆÆ %
,
ÆÆ% &
data
ÆÆ& *
.
ÆÆ* +
_object
ÆÆ+ 2
)
ÆÆ2 3
;
ÆÆ3 4
}
ØØ 
return
∞∞ 

NotFound
∞∞ 
(
∞∞ 
)
∞∞ 
;
∞∞ 
}
±± 
}
≤≤ 
}
≥≥ 
}¥¥ ƒ 
@D:\EltizamLive\Eltizam.Web\Controllers\MasterVendorController.cs
	namespace 	
EltizamValuation
 
. 
Web 
. 
Controllers *
{ 
public 

class "
MasterVendorController '
:( )
BaseController* 8
{ 
private 
readonly 
IConfiguration '
_cofiguration( 5
;5 6
private 
readonly 
IStringLocalizer )
<) *
Shared* 0
>0 1"
_stringLocalizerShared2 H
;H I
private 
readonly 
IHelper  
_helper! (
;( )
public "
MasterVendorController %
(% &
IConfiguration& 4
configuration5 B
,B C
IStringLocalizerD T
<T U
SharedU [
>[ \!
stringLocalizerShared] r
,r s
IHelpert {
helper	| Ç
)
Ç É
{ 	
_cofiguration 
= 
configuration )
;) *"
_stringLocalizerShared "
=# $!
stringLocalizerShared% :
;: ;
_helper 
= 
helper 
; 
} 	
public 
IActionResult 
Vendors $
($ %
)% &
{   	
try!! 
{"" 
int$$ 
roleId$$ 
=$$ 
_helper$$ $
.$$$ %
GetLoggedInRoleId$$% 6
($$6 7
)$$7 8
;$$8 9
if%% 
(%% 
!%% 
CheckRoleAccess%% $
(%%$ % 
ModulePermissionEnum%%% 9
.%%9 :
VendorMaster%%: F
,%%F G
PermissionEnum%%H V
.%%V W
View%%W [
,%%[ \
roleId%%] c
)%%c d
)%%d e
return&& 
RedirectToAction&& +
(&&+ ,
AppConstants&&, 8
.&&8 9
AccessRestriction&&9 J
,&&J K
AppConstants&&L X
.&&X Y
Home&&Y ]
)&&] ^
;&&^ _
return'' 
View'' 
('' 
)'' 
;'' 
}(( 
catch)) 
()) 
	Exception)) 
e)) 
))) 
{** 
_helper++ 
.++ 
LogExceptions++ %
(++% &
e++& '
)++' (
;++( )
return,, 
View,, 
(,, 
$str,, #
),,# $
;,,$ %
}-- 
}.. 	
public00 
IActionResult00 
VendorManage00 )
(00) *
int00* -
?00- .
id00/ 1
)001 2
{11 	
MasterVendorModel22 

masterUser22 (
;22( )
var44 
action44 
=44 
id44 
==44 
null44 #
?44$ %
PermissionEnum44& 4
.444 5
Add445 8
:449 :
PermissionEnum44; I
.44I J
Edit44J N
;44N O
int55 
roleId55 
=55 
_helper55  
.55  !
GetLoggedInRoleId55! 2
(552 3
)553 4
;554 5
if77 
(77 
!77 
CheckRoleAccess77  
(77  ! 
ModulePermissionEnum77! 5
.775 6
VendorMaster776 B
,77B C
action77D J
,77J K
roleId77L R
)77R S
)77S T
return88 
RedirectToAction88 '
(88' (
AppConstants88( 4
.884 5
AccessRestriction885 F
,88F G
AppConstants88H T
.88T U
Home88U Y
)88Y Z
;88Z [
if:: 
(:: 
id:: 
==:: 
null:: 
||:: 
id::  
<=::! #
$num::$ %
)::% &
{;; 
var<< 
	viewModel<< 
=<< 
new<<  #
MasterVendorModel<<$ 5
{== 
	Addresses>> 
=>> 
new>>  #
List>>$ (
<>>( )
MasterAddressEntity>>) <
>>>< =
(>>= >
)>>> ?
,>>? @
Contacts?? 
=?? 
new?? "
List??# '
<??' (
MasterContactModel??( :
>??: ;
(??; <
)??< =
}@@ 
;@@ 
MasterAddressEntityAA #
addessAA$ *
=AA+ ,
newAA- 0
MasterAddressEntityAA1 D
(AAD E
)AAE F
;AAF G
MasterContactModelBB "
contactBB# *
=BB+ ,
newBB- 0
MasterContactModelBB1 C
(BBC D
)BBD E
;BBE F
	viewModelCC 
.CC 
StatusCC  
=CC! "
trueCC# '
;CC' (
	viewModelDD 
.DD 
	AddressesDD #
.DD# $
AddDD$ '
(DD' (
addessDD( .
)DD. /
;DD/ 0
	viewModelEE 
.EE 
ContactsEE "
.EE" #
AddEE# &
(EE& '
contactEE' .
)EE. /
;EE/ 0
returnFF 
ViewFF 
(FF 
	viewModelFF %
)FF% &
;FF& '
}GG 
elseHH 
{II 
HttpContextJJ 
.JJ 
RequestJJ #
.JJ# $
CookiesJJ$ +
.JJ+ ,
TryGetValueJJ, 7
(JJ7 8

UserHelperJJ8 B
.JJB C
EltizamTokenJJC O
,JJO P
outJJQ T
stringJJU [
tokenJJ\ a
)JJa b
;JJb c
APIRepositoryKK 
objapiKK $
=KK% &
newKK' *
(KK* +
_cofigurationKK+ 8
)KK8 9
;KK9 :
HttpResponseMessageLL #
responseMessageLL$ 3
=LL4 5
objapiLL6 <
.LL< =
APICommunicationLL= M
(LLM N
APIURLHelperLLN Z
.LLZ [
GetVendorByIdLL[ h
+LLi j
$strLLk n
+LLo p
idLLq s
,LLs t

HttpMethodLLu 
.	LL Ä
Get
LLÄ É
,
LLÉ Ñ
token
LLÖ ä
)
LLä ã
.
LLã å
Result
LLå í
;
LLí ì
ifNN 
(NN 
responseMessageNN #
.NN# $
IsSuccessStatusCodeNN$ 7
)NN7 8
{OO 
stringPP 
jsonResponsePP '
=PP( )
responseMessagePP* 9
.PP9 :
ContentPP: A
.PPA B
ReadAsStringAsyncPPB S
(PPS T
)PPT U
.PPU V
ResultPPV \
;PP\ ]
varQQ 
dataQQ 
=QQ 
JsonConvertQQ *
.QQ* +
DeserializeObjectQQ+ <
<QQ< =
APIResponseEntityQQ= N
<QQN O
MasterVendorModelQQO `
>QQ` a
>QQa b
(QQb c
jsonResponseQQc o
)QQo p
;QQp q

FooterInfoTT 
(TT 
TableNameEnumTT ,
.TT, -
Master_VendorTT- :
,TT: ;
_cofigurationTT< I
,TTI J
idTTK M
)TTM N
;TTN O
if__ 
(__ 
data__ 
.__ 
_object__ $
is__% '
null__( ,
)__, -
return`` 
NotFound`` '
(``' (
)``( )
;``) *
ifbb 
(bb 
databb 
.bb 
_objectbb $
.bb$ %
	Addressesbb% .
.bb. /
Countbb/ 4
==bb5 7
$numbb8 9
)bb9 :
{cc 
MasterAddressEntitydd +
addessdd, 2
=dd3 4
newdd5 8
MasterAddressEntitydd9 L
(ddL M
)ddM N
;ddN O
dataee 
.ee 
_objectee $
.ee$ %
	Addressesee% .
.ee. /
Addee/ 2
(ee2 3
addessee3 9
)ee9 :
;ee: ;
}ff 
ifgg 
(gg 
datagg 
.gg 
_objectgg $
.gg$ %
Contactsgg% -
.gg- .
Countgg. 3
==gg4 6
$numgg7 8
)gg8 9
{hh 
MasterContactModelii *
contactii+ 2
=ii3 4
newii5 8
MasterContactModelii9 K
(iiK L
)iiL M
;iiM N
datajj 
.jj 
_objectjj $
.jj$ %
Contactsjj% -
.jj- .
Addjj. 1
(jj1 2
contactjj2 9
)jj9 :
;jj: ;
}kk 
returnmm 
Viewmm 
(mm  
datamm  $
.mm$ %
_objectmm% ,
)mm, -
;mm- .
}nn 
returnoo 
NotFoundoo 
(oo  
)oo  !
;oo! "
}pp 
}qq 	
[tt 	
HttpPosttt	 
]tt 
publicuu 
IActionResultuu 
VendorManageuu )
(uu) *
intuu* -
iduu. 0
,uu0 1
MasterVendorModeluu2 C

masterUseruuD N
)uuN O
{vv 	
tryww 
{xx 
varzz 
actionzz 
=zz 

masterUserzz '
.zz' (
Idzz( *
==zz+ -
$numzz. /
?zz0 1
PermissionEnumzz2 @
.zz@ A
AddzzA D
:zzE F
PermissionEnumzzG U
.zzU V
EditzzV Z
;zzZ [
int|| 
roleId|| 
=|| 
_helper|| $
.||$ %
GetLoggedInRoleId||% 6
(||6 7
)||7 8
;||8 9
if}} 
(}} 
!}} 
CheckRoleAccess}} $
(}}$ % 
ModulePermissionEnum}}% 9
.}}9 :
VendorMaster}}: F
,}}F G
action}}H N
,}}N O
roleId}}P V
)}}V W
)}}W X
return~~ 
RedirectToAction~~ +
(~~+ ,
AppConstants~~, 8
.~~8 9
AccessRestriction~~9 J
,~~J K
AppConstants~~L X
.~~X Y
Home~~Y ]
)~~] ^
;~~^ _
if
ÄÄ 
(
ÄÄ 

masterUser
ÄÄ 
!=
ÄÄ !
null
ÄÄ" &
)
ÄÄ& '
{
ÅÅ 

masterUser
ÇÇ 
.
ÇÇ 
Address
ÇÇ &
=
ÇÇ' (
null
ÇÇ) -
;
ÇÇ- .

masterUser
ÉÉ 
.
ÉÉ 
Contact
ÉÉ &
=
ÉÉ' (
null
ÉÉ) -
;
ÉÉ- .
}
ÑÑ 
if
ÜÜ 
(
ÜÜ 

masterUser
ÜÜ 
.
ÜÜ 
File
ÜÜ #
!=
ÜÜ$ &
null
ÜÜ' +
)
ÜÜ+ ,
{
áá !
MasterDocumentModel
àà '
docs
àà( ,
=
àà- .
ProfileUpload
àà/ <
(
àà< =

masterUser
àà= G
.
ààG H
File
ààH L
)
ààL M
;
ààM N

masterUser
ââ 
.
ââ 
uploadProfile
ââ ,
=
ââ- .
docs
ââ/ 3
;
ââ3 4

masterUser
ää 
.
ää 
File
ää #
=
ää$ %
null
ää& *
;
ää* +
}
ãã 
if
éé 
(
éé 

masterUser
éé 
.
éé 
Id
éé !
==
éé" $
$num
éé% &
)
éé& '

masterUser
èè 
.
èè 
	CreatedBy
èè (
=
èè) *
_helper
èè+ 2
.
èè2 3
GetLoggedInUserId
èè3 D
(
èèD E
)
èèE F
;
èèF G

masterUser
êê 
.
êê 

ModifiedBy
êê %
=
êê& '
_helper
êê( /
.
êê/ 0
GetLoggedInUserId
êê0 A
(
êêA B
)
êêB C
;
êêC D
HttpContext
íí 
.
íí 
Request
íí #
.
íí# $
Cookies
íí$ +
.
íí+ ,
TryGetValue
íí, 7
(
íí7 8

UserHelper
íí8 B
.
ííB C
EltizamToken
ííC O
,
ííO P
out
ííQ T
string
ííU [
token
íí\ a
)
íía b
;
ííb c
APIRepository
ìì 
objapi
ìì $
=
ìì% &
new
ìì' *
(
ìì* +
_cofiguration
ìì+ 8
)
ìì8 9
;
ìì9 :!
HttpResponseMessage
ïï #
responseMessage
ïï$ 3
=
ïï4 5
objapi
ïï6 <
.
ïï< =
APICommunication
ïï= M
(
ïïM N
APIURLHelper
ïïN Z
.
ïïZ [
UpsertVendor
ïï[ g
,
ïïg h

HttpMethod
ïïi s
.
ïïs t
Post
ïït x
,
ïïx y
token
ïïz 
,ïï Ä
newïïÅ Ñ
StringContentïïÖ í
(ïïí ì
JsonConvertïïì û
.ïïû ü
SerializeObjectïïü Æ
(ïïÆ Ø

masterUserïïØ π
)ïïπ ∫
)ïï∫ ª
)ïïª º
.ïïº Ω
ResultïïΩ √
;ïï√ ƒ
if
ññ 
(
ññ 
responseMessage
ññ #
.
ññ# $!
IsSuccessStatusCode
ññ$ 7
&&
ññ8 :

masterUser
ññ; E
.
ññE F
Id
ññF H
==
ññH J
$num
ññJ K
)
ññK L
{
óó 
string
òò 
jsonResponse
òò '
=
òò( )
responseMessage
òò* 9
.
òò9 :
Content
òò: A
.
òòA B
ReadAsStringAsync
òòB S
(
òòS T
)
òòT U
.
òòU V
Result
òòV \
;
òò\ ]
TempData
ôô 
[
ôô 

UserHelper
ôô '
.
ôô' (
SuccessMessage
ôô( 6
]
ôô6 7
=
ôô8 9
Convert
ôô: A
.
ôôA B
ToString
ôôB J
(
ôôJ K$
_stringLocalizerShared
ôôK a
[
ôôa b
$str
ôôb v
]
ôôv w
)
ôôw x
;
ôôx y
return
õõ 
RedirectToAction
õõ +
(
õõ+ ,
$str
õõ, 5
)
õõ5 6
;
õõ6 7
}
úú 
if
ùù 
(
ùù 
responseMessage
ùù #
.
ùù# $!
IsSuccessStatusCode
ùù$ 7
)
ùù7 8
{
ûû 
string
üü 
jsonResponse
üü '
=
üü( )
responseMessage
üü* 9
.
üü9 :
Content
üü: A
.
üüA B
ReadAsStringAsync
üüB S
(
üüS T
)
üüT U
.
üüU V
Result
üüV \
;
üü\ ]
TempData
†† 
[
†† 

UserHelper
†† '
.
††' (
SuccessMessage
††( 6
]
††6 7
=
††8 9
Convert
††: A
.
††A B
ToString
††B J
(
††J K$
_stringLocalizerShared
††K a
[
††a b
$str
††b v
]
††v w
)
††w x
;
††x y
return
¢¢ 
Redirect
¢¢ #
(
¢¢# $
$"
¢¢$ &
$str
¢¢& D
{
¢¢D E

masterUser
¢¢E O
.
¢¢O P
Id
¢¢P R
}
¢¢R S
"
¢¢S T
)
¢¢T U
;
¢¢U V
}
££ 
else
§§ 
{
•• 
TempData
¶¶ 
[
¶¶ 

UserHelper
¶¶ '
.
¶¶' (
ErrorMessage
¶¶( 4
]
¶¶4 5
=
¶¶6 7
Convert
¶¶8 ?
.
¶¶? @
ToString
¶¶@ H
(
¶¶H I
responseMessage
¶¶I X
.
¶¶X Y
Content
¶¶Y `
.
¶¶` a
ReadAsStringAsync
¶¶a r
(
¶¶r s
)
¶¶s t
.
¶¶t u
Result
¶¶u {
)
¶¶{ |
;
¶¶| }
return
ßß 
RedirectToAction
ßß +
(
ßß+ ,
$str
ßß, :
,
ßß: ;
new
ßß< ?
{
ßß@ A
id
ßßB D
=
ßßE F

masterUser
ßßG Q
.
ßßQ R
Id
ßßR T
}
ßßU V
)
ßßV W
;
ßßW X
}
®® 
}
©© 
catch
™™ 
(
™™ 
	Exception
™™ 
e
™™ 
)
™™ 
{
´´ 
_helper
¨¨ 
.
¨¨ 
LogExceptions
¨¨ %
(
¨¨% &
e
¨¨& '
)
¨¨' (
;
¨¨( )
TempData
≠≠ 
[
≠≠ 

UserHelper
≠≠ #
.
≠≠# $
ErrorMessage
≠≠$ 0
]
≠≠0 1
=
≠≠2 3
Convert
≠≠4 ;
.
≠≠; <
ToString
≠≠< D
(
≠≠D E
e
≠≠E F
.
≠≠F G

StackTrace
≠≠G Q
)
≠≠Q R
;
≠≠R S
return
ÆÆ 
RedirectToAction
ÆÆ '
(
ÆÆ' (
$str
ÆÆ( 6
,
ÆÆ6 7
new
ÆÆ8 ;
{
ÆÆ< =
Id
ÆÆ> @
=
ÆÆA B

masterUser
ÆÆC M
.
ÆÆM N
Id
ÆÆN P
}
ÆÆQ R
)
ÆÆR S
;
ÆÆS T
}
ØØ 
}
∞∞ 	
[
≤≤ 	
HttpGet
≤≤	 
]
≤≤ 
[
≥≥ 	
Route
≥≥	 
(
≥≥ 
$str
≥≥ *
)
≥≥* +
]
≥≥+ ,
public
¥¥ 
IActionResult
¥¥ 
VendorDetail
¥¥ )
(
¥¥) *
int
¥¥* -
?
¥¥- .
id
¥¥/ 1
)
¥¥1 2
{
µµ 	
MasterVendorModel
∂∂ 

masterUser
∂∂ (
;
∂∂( )
var
∏∏ 
action
∏∏ 
=
∏∏ 
id
∏∏ 
==
∏∏ 
null
∏∏ #
?
∏∏$ %
PermissionEnum
∏∏& 4
.
∏∏4 5
Edit
∏∏5 9
:
∏∏: ;
PermissionEnum
∏∏< J
.
∏∏J K
View
∏∏K O
;
∏∏O P
int
∫∫ 
roleId
∫∫ 
=
∫∫ 
_helper
∫∫  
.
∫∫  !
GetLoggedInRoleId
∫∫! 2
(
∫∫2 3
)
∫∫3 4
;
∫∫4 5
if
ªª 
(
ªª 
!
ªª 
CheckRoleAccess
ªª  
(
ªª  !"
ModulePermissionEnum
ªª! 5
.
ªª5 6
VendorMaster
ªª6 B
,
ªªB C
action
ªªD J
,
ªªJ K
roleId
ªªL R
)
ªªR S
)
ªªS T
return
ºº 
RedirectToAction
ºº '
(
ºº' (
AppConstants
ºº( 4
.
ºº4 5
AccessRestriction
ºº5 F
,
ººF G
AppConstants
ººH T
.
ººT U
Home
ººU Y
)
ººY Z
;
ººZ [
if
ΩΩ 
(
ΩΩ 
id
ΩΩ 
==
ΩΩ 
null
ΩΩ 
||
ΩΩ 
id
ΩΩ  
<=
ΩΩ! #
$num
ΩΩ$ %
)
ΩΩ% &
{
ææ 

masterUser
øø 
=
øø 
new
øø  
MasterVendorModel
øø! 2
(
øø2 3
)
øø3 4
;
øø4 5
return
¿¿ 
View
¿¿ 
(
¿¿ 

masterUser
¿¿ &
)
¿¿& '
;
¿¿' (
}
¡¡ 
else
¬¬ 
{
√√ 
HttpContext
ƒƒ 
.
ƒƒ 
Request
ƒƒ #
.
ƒƒ# $
Cookies
ƒƒ$ +
.
ƒƒ+ ,
TryGetValue
ƒƒ, 7
(
ƒƒ7 8

UserHelper
ƒƒ8 B
.
ƒƒB C
EltizamToken
ƒƒC O
,
ƒƒO P
out
ƒƒQ T
string
ƒƒU [
token
ƒƒ\ a
)
ƒƒa b
;
ƒƒb c
APIRepository
≈≈ 
objapi
≈≈ $
=
≈≈% &
new
≈≈' *
(
≈≈* +
_cofiguration
≈≈+ 8
)
≈≈8 9
;
≈≈9 :!
HttpResponseMessage
∆∆ #
responseMessage
∆∆$ 3
=
∆∆4 5
objapi
∆∆6 <
.
∆∆< =
APICommunication
∆∆= M
(
∆∆M N
APIURLHelper
∆∆N Z
.
∆∆Z [
GetVendorById
∆∆[ h
+
∆∆i j
$str
∆∆k n
+
∆∆o p
id
∆∆q s
,
∆∆s t

HttpMethod
∆∆u 
.∆∆ Ä
Get∆∆Ä É
,∆∆É Ñ
token∆∆Ö ä
)∆∆ä ã
.∆∆ã å
Result∆∆å í
;∆∆í ì
if
»» 
(
»» 
responseMessage
»» #
.
»»# $!
IsSuccessStatusCode
»»$ 7
)
»»7 8
{
…… 
string
   
jsonResponse
   '
=
  ( )
responseMessage
  * 9
.
  9 :
Content
  : A
.
  A B
ReadAsStringAsync
  B S
(
  S T
)
  T U
.
  U V
Result
  V \
;
  \ ]
var
ÀÀ 
data
ÀÀ 
=
ÀÀ 
JsonConvert
ÀÀ *
.
ÀÀ* +
DeserializeObject
ÀÀ+ <
<
ÀÀ< =
APIResponseEntity
ÀÀ= N
<
ÀÀN O
MasterVendorModel
ÀÀO `
>
ÀÀ` a
>
ÀÀa b
(
ÀÀb c
jsonResponse
ÀÀc o
)
ÀÀo p
;
ÀÀp q

FooterInfo
ÕÕ 
(
ÕÕ 
TableNameEnum
ÕÕ ,
.
ÕÕ, -
Master_Vendor
ÕÕ- :
,
ÕÕ: ;
_cofiguration
ÕÕ< I
,
ÕÕI J
id
ÕÕK M
,
ÕÕM N
true
ÕÕO S
)
ÕÕS T
;
ÕÕT U
if
ŒŒ 
(
ŒŒ 
data
ŒŒ 
.
ŒŒ 
_object
ŒŒ $
is
ŒŒ% '
null
ŒŒ( ,
)
ŒŒ, -
return
œœ 
NotFound
œœ '
(
œœ' (
)
œœ( )
;
œœ) *
return
—— 
View
—— 
(
——  
data
——  $
.
——$ %
_object
——% ,
)
——, -
;
——- .
}
““ 
return
”” 
NotFound
”” 
(
””  
)
””  !
;
””! "
}
‘‘ 
}
’’ 	
private
◊◊ !
MasterDocumentModel
◊◊ #
ProfileUpload
◊◊$ 1
(
◊◊1 2
	IFormFile
◊◊2 ;
pic
◊◊< ?
)
◊◊? @
{
ÿÿ 	!
MasterDocumentModel
ŸŸ 

uploadFils
ŸŸ  *
=
ŸŸ+ ,
new
ŸŸ- 0!
MasterDocumentModel
ŸŸ1 D
(
ŸŸD E
)
ŸŸE F
;
ŸŸF G
if
⁄⁄ 
(
⁄⁄ 
pic
⁄⁄ 
==
⁄⁄ 
null
⁄⁄ 
)
⁄⁄ 
{
€€ 
throw
‹‹ 
new
‹‹ 
ArgumentException
‹‹ +
(
‹‹+ ,
$str
‹‹, E
)
‹‹E F
;
‹‹F G
}
›› 
var
ﬁﬁ 
currentUser
ﬁﬁ 
=
ﬁﬁ 
_helper
ﬁﬁ %
.
ﬁﬁ% &
GetLoggedInUserId
ﬁﬁ& 7
(
ﬁﬁ7 8
)
ﬁﬁ8 9
;
ﬁﬁ9 :
var
ﬂﬂ 
savedFileNames
ﬂﬂ 
=
ﬂﬂ  
new
ﬂﬂ! $
List
ﬂﬂ% )
<
ﬂﬂ) *
string
ﬂﬂ* 0
>
ﬂﬂ0 1
(
ﬂﬂ1 2
)
ﬂﬂ2 3
;
ﬂﬂ3 4
var
‚‚ 
allowedFileTypes
‚‚ 
=
‚‚  !
new
‚‚" %
List
‚‚& *
<
‚‚* +
string
‚‚+ 1
>
‚‚1 2
{
‚‚3 4
$str
‚‚5 A
,
‚‚A B
$str
‚‚C N
,
‚‚N O
$str
‚‚P [
}
‚‚\ ]
;
‚‚] ^
if
„„ 
(
„„ 
!
„„ 
allowedFileTypes
„„ !
.
„„! "
Contains
„„" *
(
„„* +
pic
„„+ .
.
„„. /
ContentType
„„/ :
)
„„: ;
)
„„; <
{
‰‰ 
throw
ÂÂ 
new
ÂÂ 
ArgumentException
ÂÂ +
(
ÂÂ+ ,
$"
ÂÂ, .
$str
ÂÂ. 9
{
ÂÂ9 :
pic
ÂÂ: =
.
ÂÂ= >
ContentType
ÂÂ> I
}
ÂÂI J
$str
ÂÂJ [
"
ÂÂ[ \
)
ÂÂ\ ]
;
ÂÂ] ^
}
ÊÊ 
var
ËË 
fileName
ËË 
=
ËË 
Guid
ËË 
.
ËË  
NewGuid
ËË  '
(
ËË' (
)
ËË( )
.
ËË) *
ToString
ËË* 2
(
ËË2 3
)
ËË3 4
+
ËË5 6
Path
ËË7 ;
.
ËË; <
GetExtension
ËË< H
(
ËËH I
pic
ËËI L
.
ËËL M
FileName
ËËM U
)
ËËU V
;
ËËV W
var
ÍÍ 
docName
ÍÍ 
=
ÍÍ 
pic
ÍÍ 
.
ÍÍ 
FileName
ÍÍ &
;
ÍÍ& '
var
ÎÎ 
filePath
ÎÎ 
=
ÎÎ 
Path
ÎÎ 
.
ÎÎ  
Combine
ÎÎ  '
(
ÎÎ' (
$str
ÎÎ( 9
,
ÎÎ9 :
fileName
ÎÎ; C
)
ÎÎC D
;
ÎÎD E
filePath
ÏÏ 
=
ÏÏ 
filePath
ÏÏ 
.
ÏÏ  
Replace
ÏÏ  '
(
ÏÏ' (
$str
ÏÏ( ,
,
ÏÏ, -
$str
ÏÏ. 1
)
ÏÏ1 2
;
ÏÏ2 3
using
ÌÌ 
(
ÌÌ 
var
ÌÌ 
stream
ÌÌ 
=
ÌÌ 
new
ÌÌ  #

FileStream
ÌÌ$ .
(
ÌÌ. /
filePath
ÌÌ/ 7
,
ÌÌ7 8
FileMode
ÌÌ9 A
.
ÌÌA B
Create
ÌÌB H
)
ÌÌH I
)
ÌÌI J
{
ÓÓ 
pic
ÔÔ 
.
ÔÔ 
CopyToAsync
ÔÔ 
(
ÔÔ  
stream
ÔÔ  &
)
ÔÔ& '
;
ÔÔ' (
}
 
var
ÛÛ 
upload
ÛÛ 
=
ÛÛ 
new
ÛÛ !
MasterDocumentModel
ÛÛ 0
{
ÙÙ 
FileName
ıı 
=
ıı 
fileName
ıı #
,
ıı# $
FilePath
ˆˆ 
=
ˆˆ 
filePath
ˆˆ #
.
ˆˆ# $
Replace
ˆˆ$ +
(
ˆˆ+ ,
$str
ˆˆ, 5
,
ˆˆ5 6
$str
ˆˆ7 ;
)
ˆˆ; <
,
ˆˆ< =
DocumentName
˜˜ 
=
˜˜ 
docName
˜˜ &
,
˜˜& '
IsActive
¯¯ 
=
¯¯ 
true
¯¯ 
,
¯¯  
	CreatedBy
˘˘ 
=
˘˘ 
currentUser
˘˘ '
,
˘˘' (
FileType
˙˙ 
=
˙˙ 
pic
˙˙ 
.
˙˙ 
ContentType
˙˙ *
,
˙˙* +
CreatedDate
˚˚ 
=
˚˚ 
null
˚˚ "
,
˚˚" #
CreatedName
¸¸ 
=
¸¸ 
$str
¸¸  
}
˝˝ 
;
˝˝ 
return
ˇˇ 
upload
ˇˇ 
;
ˇˇ 
}
ÄÄ 	
}
ÇÇ 
}ÉÉ ∑
@D:\EltizamLive\Eltizam.Web\Controllers\NotificationController.cs
	namespace		 	
EltizamValuation		
 
.		 
Web		 
.		 
Controllers		 *
{

 
public 

class "
NotificationController '
:( )

Controller* 4
{ 
private 
readonly 
IConfiguration '
_cofiguration( 5
;5 6
private 
readonly 
IStringLocalizer )
<) *
Shared* 0
>0 1"
_stringLocalizerShared2 H
;H I
private 
readonly 
IHelper  
_helper! (
;( )
public "
NotificationController %
(% &
IConfiguration& 4
configuration5 B
,B C
IStringLocalizerD T
<T U
SharedU [
>[ \!
stringLocalizerShared] r
,r s
IHelpert {
helper	| Ç
)
Ç É
{ 	
_cofiguration 
= 
configuration )
;) *"
_stringLocalizerShared "
=# $!
stringLocalizerShared% :
;: ;
_helper 
= 
helper 
; 
} 	
public 
IActionResult 
Notifications *
(* +
)+ ,
{ 	

ModelState   
.   
Clear   
(   
)   
;   
try!! 
{"" 
return## 
View## 
(## 
)## 
;## 
}$$ 
catch%% 
(%% 
	Exception%% 
e%% 
)%% 
{&& 
_helper'' 
.'' 
LogExceptions'' %
(''% &
e''& '
)''' (
;''( )
TempData(( 
[(( 

UserHelper(( #
.((# $
ErrorMessage(($ 0
]((0 1
=((2 3
Convert((4 ;
.((; <
ToString((< D
(((D E
e((E F
.((F G

StackTrace((G Q
)((Q R
;((R S
return** 
View** 
(** 
$str** #
)**# $
;**$ %
}++ 
},, 	
}-- 
}.. „´
DD:\EltizamLive\Eltizam.Web\Controllers\ValuationRequestController.cs
	namespace 	
EltizamValuation
 
. 
Web 
. 
Controllers *
{ 
public 

class &
ValuationRequestController +
:, -
BaseController. <
{ 
private 
readonly 
IConfiguration '
_cofiguration( 5
;5 6
private 
readonly 
IStringLocalizer )
<) *
Shared* 0
>0 1"
_stringLocalizerShared2 H
;H I
private 
readonly 
IHelper  
_helper! (
;( )
public &
ValuationRequestController )
() *
IConfiguration* 8
configuration9 F
,F G
IStringLocalizerH X
<X Y
SharedY _
>_ `!
stringLocalizerShareda v
,v w
IHelperx 
helper
Ä Ü
)
Ü á
{ 	
_cofiguration 
= 
configuration )
;) *"
_stringLocalizerShared "
=# $!
stringLocalizerShared% :
;: ;
_helper 
= 
helper 
; 
} 	
[   	
HttpGet  	 
]   
public!! 
IActionResult!! 
ValuationRequests!! .
(!!. /
)!!/ 0
{"" 	
int$$ 
roleId$$ 
=$$ 
_helper$$  
.$$  !
GetLoggedInRoleId$$! 2
($$2 3
)$$3 4
;$$4 5
if%% 
(%% 
!%% 
CheckRoleAccess%%  
(%%  ! 
ModulePermissionEnum%%! 5
.%%5 6
ValuationRequest%%6 F
,%%F G
PermissionEnum%%H V
.%%V W
View%%W [
,%%[ \
roleId%%] c
,%%c d
SubModuleEnum%%e r
.%%r s
ValuationRequest	%%s É
)
%%É Ñ
)
%%Ñ Ö
return&& 
RedirectToAction&& '
(&&' (
AppConstants&&( 4
.&&4 5
AccessRestriction&&5 F
,&&F G
AppConstants&&H T
.&&T U
Home&&U Y
)&&Y Z
;&&Z [
ViewBag)) 
.)) 
Access)) 
=)) #
GetRoleAccessValuations)) 4
())4 5 
ModulePermissionEnum))5 I
.))I J
ValuationRequest))J Z
,))Z [
roleId))\ b
,))b c
SubModuleEnum))d q
.))q r
ValuationRequest	))r Ç
)
))Ç É
;
))É Ñ
ViewBag** 
.** 
QuotationAccess** #
=**$ %#
GetRoleAccessValuations**& =
(**= > 
ModulePermissionEnum**> R
.**R S
ValuationRequest**S c
,**c d
roleId**e k
,**k l
SubModuleEnum**m z
.**z {
ValuationQuotation	**{ ç
)
**ç é
;
**é è
ViewBag++ 
.++ 
InvoiceAccess++ !
=++" ##
GetRoleAccessValuations++$ ;
(++; < 
ModulePermissionEnum++< P
.++P Q
ValuationRequest++Q a
,++a b
roleId++c i
,++i j
SubModuleEnum++k x
.++x y
ValuationInvoice	++y â
)
++â ä
;
++ä ã
ViewBag-- 
.-- 
CurrentUserId-- !
=--" #
_helper--$ +
.--+ ,
GetLoggedInUserId--, =
(--= >
)--> ?
;--? @
return.. 
View.. 
(.. 
).. 
;.. 
}// 	
[22 	
HttpGet22	 
]22 
public33 
IActionResult33 )
ValuationPaymentInvoiceManage33 :
(33: ;
int33; >
?33> ?
id33@ B
,33B C
int33D G
vId33H K
)33K L
{44 	(
ValuationInvoicePaymentModel55 (
invoice55) 0
;550 1
var88 
action88 
=88 
id88 
==88 
null88 #
?88$ %
PermissionEnum88& 4
.884 5
Add885 8
:889 :
PermissionEnum88; I
.88I J
View88J N
;88N O
int:: 
roleId:: 
=:: 
_helper::  
.::  !
GetLoggedInRoleId::! 2
(::2 3
)::3 4
;::4 5
if<< 
(<< 
!<< 
CheckRoleAccess<<  
(<<  ! 
ModulePermissionEnum<<! 5
.<<5 6
ValuationRequest<<6 F
,<<F G
action<<H N
,<<N O
roleId<<P V
)<<V W
)<<W X
return== 
RedirectToAction== '
(==' (
AppConstants==( 4
.==4 5
AccessRestriction==5 F
,==F G
AppConstants==H T
.==T U
Home==U Y
)==Y Z
;==Z [
ViewBag@@ 
.@@ 
Access@@ 
=@@ #
GetRoleAccessValuations@@ 4
(@@4 5 
ModulePermissionEnum@@5 I
.@@I J
ValuationRequest@@J Z
,@@Z [
roleId@@\ b
,@@b c
SubModuleEnum@@d q
.@@q r
ValuationRequest	@@r Ç
)
@@Ç É
;
@@É Ñ
ViewBagAA 
.AA 
QuotationAccessAA #
=AA$ %#
GetRoleAccessValuationsAA& =
(AA= > 
ModulePermissionEnumAA> R
.AAR S
ValuationRequestAAS c
,AAc d
roleIdAAe k
,AAk l
SubModuleEnumAAm z
.AAz {
ValuationQuotation	AA{ ç
)
AAç é
;
AAé è
ViewBagBB 
.BB 
InvoiceAccessBB !
=BB" ##
GetRoleAccessValuationsBB$ ;
(BB; < 
ModulePermissionEnumBB< P
.BBP Q
ValuationRequestBBQ a
,BBa b
roleIdBBc i
,BBi j
SubModuleEnumBBk x
.BBx y
ValuationInvoice	BBy â
)
BBâ ä
;
BBä ã
boolDD  
hasInvoiceViewAccessDD %
=DD& '
ViewBagDD( /
.DD/ 0
QuotationAccessDD0 ?
?DD? @
.DD@ A
ViewDDA E
??DDF H
falseDDI N
;DDN O
boolEE  
hasInvoiceEditAccessEE %
=EE& '
ViewBagEE( /
.EE/ 0
QuotationAccessEE0 ?
?EE? @
.EE@ A
EditEEA E
??EEF H
falseEEI N
;EEN O
boolFF 
hasInvoiceAddAccessFF $
=FF% &
ViewBagFF' .
.FF. /
QuotationAccessFF/ >
?FF> ?
.FF? @
AddFF@ C
??FFD F
falseFFG L
;FFL M
ifHH 
(HH 
actionHH 
==HH 
PermissionEnumHH (
.HH( )
ViewHH) -
&&HH. 0
!HH1 2 
hasInvoiceViewAccessHH2 F
)HHF G
{II 
returnJJ 
RedirectToActionJJ '
(JJ' (
AppConstantsJJ( 4
.JJ4 5
AccessRestrictionJJ5 F
,JJF G
AppConstantsJJH T
.JJT U
HomeJJU Y
)JJY Z
;JJZ [
}KK 
elseLL 
ifLL 
(LL 
actionLL 
==LL 
PermissionEnumLL -
.LL- .
EditLL. 2
&&LL3 5
!LL6 7 
hasInvoiceEditAccessLL7 K
)LLK L
{MM 
returnNN 
RedirectToActionNN '
(NN' (
AppConstantsNN( 4
.NN4 5
AccessRestrictionNN5 F
,NNF G
AppConstantsNNH T
.NNT U
HomeNNU Y
)NNY Z
;NNZ [
}OO 
elsePP 
ifPP 
(PP 
actionPP 
==PP 
PermissionEnumPP -
.PP- .
AddPP. 1
&&PP2 4
!PP5 6
hasInvoiceAddAccessPP6 I
)PPI J
{QQ 
returnRR 
RedirectToActionRR '
(RR' (
AppConstantsRR( 4
.RR4 5
AccessRestrictionRR5 F
,RRF G
AppConstantsRRH T
.RRT U
HomeRRU Y
)RRY Z
;RRZ [
}SS 
invoiceUU 
=UU 
newUU (
ValuationInvoicePaymentModelUU 6
(UU6 7
)UU7 8
;UU8 9
ValReqHeaderInfoXX 
(XX 
vIdXX  
)XX  !
;XX! "
invoiceYY 
.YY 
ValuationRequestIdYY &
=YY' (
vIdYY) ,
;YY, -
HttpContext\\ 
.\\ 
Request\\ 
.\\  
Cookies\\  '
.\\' (
TryGetValue\\( 3
(\\3 4

UserHelper\\4 >
.\\> ?
EltizamToken\\? K
,\\K L
out\\M P
string\\Q W
token\\X ]
)\\] ^
;\\^ _
APIRepository]] 
objapi]]  
=]]! "
new]]# &
(]]& '
_cofiguration]]' 4
)]]4 5
;]]5 6
if__ 
(__ 
id__ 
==__ 
null__ 
||__ 
id__  
<=__! #
$num__$ %
)__% &
{`` 

FooterInfobb 
(bb 
TableNameEnumbb (
.bb( )
ValuationInvoicebb) 9
,bb9 :
_cofigurationbb; H
,bbH I
idbbJ L
)bbL M
;bbM N
returncc 
Viewcc 
(cc 
invoicecc #
)cc# $
;cc$ %
}dd 
elseee 
{ff 
HttpContextgg 
.gg 
Requestgg #
.gg# $
Cookiesgg$ +
.gg+ ,
TryGetValuegg, 7
(gg7 8

UserHelpergg8 B
.ggB C
EltizamTokenggC O
,ggO P
outggQ T
stringggU [
_tokengg\ b
)ggb c
;ggc d
APIRepositoryhh 
_objapihh %
=hh& '
newhh( +
(hh+ ,
_cofigurationhh, 9
)hh9 :
;hh: ;
HttpResponseMessageii #
_responseMessageii$ 4
=ii5 6
_objapiii7 >
.ii> ?
APICommunicationii? O
(iiO P
APIURLHelperiiP \
.ii\ ]
PaymentInvoiceByIdii] o
+iip q
$striir u
+iiv w
idiix z
,iiz {

HttpMethod	ii| Ü
.
iiÜ á
Get
iiá ä
,
iiä ã
_token
iiå í
)
iií ì
.
iiì î
Result
iiî ö
;
iiö õ
ifkk 
(kk 
_responseMessagekk $
.kk$ %
IsSuccessStatusCodekk% 8
)kk8 9
{ll 
stringmm 
jsonResponsemm '
=mm( )
_responseMessagemm* :
.mm: ;
Contentmm; B
.mmB C
ReadAsStringAsyncmmC T
(mmT U
)mmU V
.mmV W
ResultmmW ]
;mm] ^
varnn 
datann 
=nn 
JsonConvertnn *
.nn* +
DeserializeObjectnn+ <
<nn< =
APIResponseEntitynn= N
<nnN O(
ValuationInvoicePaymentModelnnO k
>nnk l
>nnl m
(nnm n
jsonResponsennn z
)nnz {
;nn{ |

FooterInfoqq 
(qq 
TableNameEnumqq ,
.qq, -
ValuationInvoiceqq- =
,qq= >
_cofigurationqq? L
,qqL M
idqqN P
,qqP Q
trueqqR V
)qqV W
;qqW X
returnss 
Viewss 
(ss  
$strss  ?
,ss? @
datassA E
.ssE F
_objectssF M
)ssM N
;ssN O
}tt 
returnuu 
NotFounduu 
(uu  
)uu  !
;uu! "
}vv 
}ww 	
[zz 	
HttpPostzz	 
]zz 
public{{ 
IActionResult{{ )
ValuationPaymentInvoiceManage{{ :
({{: ;
int{{; >
id{{? A
,{{A B(
ValuationInvoicePaymentModel{{C _
invoice{{` g
){{g h
{|| 	
try}} 
{~~ 
var
ÄÄ 
action
ÄÄ 
=
ÄÄ 
id
ÄÄ 
==
ÄÄ  "
null
ÄÄ# '
?
ÄÄ( )
PermissionEnum
ÄÄ* 8
.
ÄÄ8 9
Edit
ÄÄ9 =
:
ÄÄ> ?
PermissionEnum
ÄÄ@ N
.
ÄÄN O
Add
ÄÄO R
;
ÄÄR S
if
ÇÇ 
(
ÇÇ 
invoice
ÇÇ 
.
ÇÇ 
Id
ÇÇ 
==
ÇÇ !
$num
ÇÇ" #
)
ÇÇ# $
invoice
ÉÉ 
.
ÉÉ 
	CreatedBy
ÉÉ %
=
ÉÉ& '
_helper
ÉÉ( /
.
ÉÉ/ 0
GetLoggedInUserId
ÉÉ0 A
(
ÉÉA B
)
ÉÉB C
;
ÉÉC D
invoice
ÑÑ 
.
ÑÑ 

ModifiedBy
ÑÑ "
=
ÑÑ# $
_helper
ÑÑ% ,
.
ÑÑ, -
GetLoggedInUserId
ÑÑ- >
(
ÑÑ> ?
)
ÑÑ? @
;
ÑÑ@ A
HttpContext
ÜÜ 
.
ÜÜ 
Request
ÜÜ #
.
ÜÜ# $
Cookies
ÜÜ$ +
.
ÜÜ+ ,
TryGetValue
ÜÜ, 7
(
ÜÜ7 8

UserHelper
ÜÜ8 B
.
ÜÜB C
EltizamToken
ÜÜC O
,
ÜÜO P
out
ÜÜQ T
string
ÜÜU [
token
ÜÜ\ a
)
ÜÜa b
;
ÜÜb c
APIRepository
áá 
objapi
áá $
=
áá% &
new
áá' *
(
áá* +
_cofiguration
áá+ 8
)
áá8 9
;
áá9 :!
HttpResponseMessage
ââ #
responseMessage
ââ$ 3
=
ââ4 5
objapi
ââ6 <
.
ââ< =
APICommunication
ââ= M
(
ââM N
APIURLHelper
ââN Z
.
ââZ [
UpsertInvoice
ââ[ h
,
ââh i

HttpMethod
ââj t
.
âât u
Post
ââu y
,
âây z
tokenââ{ Ä
,ââÄ Å
newââÇ Ö
StringContentââÜ ì
(ââì î
JsonConvertââî ü
.ââü †
SerializeObjectââ† Ø
(ââØ ∞
invoiceââ∞ ∑
)ââ∑ ∏
)ââ∏ π
)ââπ ∫
.ââ∫ ª
Resultââª ¡
;ââ¡ ¬
if
ãã 
(
ãã 
responseMessage
ãã #
.
ãã# $!
IsSuccessStatusCode
ãã$ 7
)
ãã7 8
{
åå 
string
çç 
jsonResponse
çç '
=
çç( )
responseMessage
çç* 9
.
çç9 :
Content
çç: A
.
ççA B
ReadAsStringAsync
ççB S
(
ççS T
)
ççT U
.
ççU V
Result
ççV \
;
çç\ ]
TempData
éé 
[
éé 

UserHelper
éé '
.
éé' (
SuccessMessage
éé( 6
]
éé6 7
=
éé8 9
Convert
éé: A
.
ééA B
ToString
ééB J
(
ééJ K$
_stringLocalizerShared
ééK a
[
ééa b
$str
ééb v
]
éév w
)
ééw x
;
ééx y
}
èè 
else
êê 
TempData
ëë 
[
ëë 

UserHelper
ëë '
.
ëë' (
ErrorMessage
ëë( 4
]
ëë4 5
=
ëë6 7
Convert
ëë8 ?
.
ëë? @
ToString
ëë@ H
(
ëëH I
responseMessage
ëëI X
.
ëëX Y
Content
ëëY `
.
ëë` a
ReadAsStringAsync
ëëa r
(
ëër s
)
ëës t
.
ëët u
Result
ëëu {
)
ëë{ |
;
ëë| }
}
ìì 
catch
îî 
(
îî 
	Exception
îî 
e
îî 
)
îî 
{
ïï 
_helper
ññ 
.
ññ 
LogExceptions
ññ %
(
ññ% &
e
ññ& '
)
ññ' (
;
ññ( )
TempData
óó 
[
óó 

UserHelper
óó #
.
óó# $
ErrorMessage
óó$ 0
]
óó0 1
=
óó2 3
Convert
óó4 ;
.
óó; <
ToString
óó< D
(
óóD E
e
óóE F
.
óóF G

StackTrace
óóG Q
)
óóQ R
;
óóR S
}
òò 
return
öö 
Redirect
öö 
(
öö 
$"
öö 
$str
öö J
{
ööJ K
invoice
ööK R
.
ööR S 
ValuationRequestId
ööS e
}
ööe f
"
ööf g
)
öög h
;
ööh i
}
õõ 	
[
üü 	
HttpGet
üü	 
]
üü 
public
†† 
IActionResult
†† 
ValuationData
†† *
(
††* +
int
††+ .
id
††/ 1
)
††1 2
{
°° 	
DataSet
¢¢ 
ds
¢¢ 
=
¢¢ 
new
¢¢ 
DataSet
¢¢ $
(
¢¢$ %
)
¢¢% &
;
¢¢& '#
ValuationRequestModel
££ !
model
££" '
=
££( )
new
££* -#
ValuationRequestModel
££. C
(
££C D
)
££D E
;
££E F
HttpContext
§§ 
.
§§ 
Request
§§ 
.
§§  
Cookies
§§  '
.
§§' (
TryGetValue
§§( 3
(
§§3 4

UserHelper
§§4 >
.
§§> ?
EltizamToken
§§? K
,
§§K L
out
§§M P
string
§§Q W
token
§§X ]
)
§§] ^
;
§§^ _
APIRepository
•• 
objapi
••  
=
••! "
new
••# &
(
••& '
_cofiguration
••' 4
)
••4 5
;
••5 6!
HttpResponseMessage
¶¶ 
responseMessage
¶¶  /
=
¶¶0 1
objapi
¶¶2 8
.
¶¶8 9
APICommunication
¶¶9 I
(
¶¶I J
APIURLHelper
¶¶J V
.
¶¶V W!
GetValuationPDFData
¶¶W j
+
¶¶k l
$str
¶¶m p
+
¶¶q r
id
¶¶s u
,
¶¶u v

HttpMethod¶¶w Å
.¶¶Å Ç
Get¶¶Ç Ö
,¶¶Ö Ü
token¶¶á å
)¶¶å ç
.¶¶ç é
Result¶¶é î
;¶¶î ï
if
®® 
(
®® 
responseMessage
®® 
.
®®  !
IsSuccessStatusCode
®®  3
)
®®3 4
{
©© 
string
™™ 
jsonResponse
™™ #
=
™™$ %
responseMessage
™™& 5
.
™™5 6
Content
™™6 =
.
™™= >
ReadAsStringAsync
™™> O
(
™™O P
)
™™P Q
.
™™Q R
Result
™™R X
;
™™X Y
ds
´´ 
=
´´ 
JsonConvert
´´  
.
´´  !
DeserializeObject
´´! 2
<
´´2 3
DataSet
´´3 :
>
´´: ;
(
´´; <
jsonResponse
´´< H
)
´´H I
;
´´I J
var
≠≠ 
	listmodel
≠≠ 
=
≠≠ 
ds
≠≠  "
.
≠≠" #
Tables
≠≠# )
[
≠≠) *
$num
≠≠* +
]
≠≠+ ,
.
≠≠, -
DataTableToList
≠≠- <
<
≠≠< =#
ValuationRequestModel
≠≠= R
>
≠≠R S
(
≠≠S T
)
≠≠T U
;
≠≠U V
model
ÆÆ 
=
ÆÆ 
	listmodel
ÆÆ !
[
ÆÆ! "
$num
ÆÆ" #
]
ÆÆ# $
;
ÆÆ$ %
}
±± 
ViewBag
≤≤ 
.
≤≤ 
pdfdata
≤≤ 
=
≤≤ 
ds
≤≤  
;
≤≤  !
return
≥≥ 
View
≥≥ 
(
≥≥ 
$str
≥≥ '
,
≥≥' (
model
≥≥) .
)
≥≥. /
;
≥≥/ 0
}
¥¥ 	
[
∂∂ 	
HttpGet
∂∂	 
]
∂∂ 
public
∑∑ 
IActionResult
∑∑ $
ValuationRequestManage
∑∑ 3
(
∑∑3 4
int
∑∑4 7
?
∑∑7 8
id
∑∑9 ;
,
∑∑; <
int
∑∑= @
?
∑∑@ A
IsView
∑∑B H
)
∑∑H I
{
∏∏ 	
var
ππ 
_ValuationEntity
ππ  
=
ππ! "
new
ππ# &#
ValuationRequestModel
ππ' <
(
ππ< =
)
ππ= >
;
ππ> ?
_ValuationEntity
ªª 
.
ªª  
ValuationAssesment
ªª /
=
ªª0 1
new
ªª2 5+
ValuationAssesmentActionModel
ªª6 S
(
ªªS T
)
ªªT U
;
ªªU V
_ValuationEntity
ºº 
.
ºº  
ValuationAssesment
ºº /
.
ºº/ 0
SiteDescription
ºº0 ?
=
ºº@ A
new
ººB E"
SiteDescriptionModel
ººF Z
(
ººZ [
)
ºº[ \
;
ºº\ ]
_ValuationEntity
ΩΩ 
.
ΩΩ  
ValuationAssesment
ΩΩ /
.
ΩΩ/ 0%
comparableEvidenceModel
ΩΩ0 G
=
ΩΩH I
new
ΩΩJ M%
ComparableEvidenceModel
ΩΩN e
(
ΩΩe f
)
ΩΩf g
;
ΩΩg h
_ValuationEntity
ææ 
.
ææ  
ValuationAssesment
ææ /
.
ææ/ 0'
valuationAssessementModel
ææ0 I
=
ææJ K
new
ææL O'
ValuationAssessementModel
ææP i
(
ææi j
)
ææj k
;
ææk l
var
¡¡ 
action
¡¡ 
=
¡¡ 
IsView
¡¡ 
==
¡¡  "
$num
¡¡# $
?
¡¡% &
PermissionEnum
¡¡' 5
.
¡¡5 6
View
¡¡6 :
:
¡¡; <
(
¡¡= >
id
¡¡> @
==
¡¡A C
null
¡¡D H
?
¡¡I J
PermissionEnum
¡¡K Y
.
¡¡Y Z
Add
¡¡Z ]
:
¡¡^ _
PermissionEnum
¡¡` n
.
¡¡n o
Edit
¡¡o s
)
¡¡s t
;
¡¡t u
int
ƒƒ 
roleId
ƒƒ 
=
ƒƒ 
_helper
ƒƒ  
.
ƒƒ  !
GetLoggedInRoleId
ƒƒ! 2
(
ƒƒ2 3
)
ƒƒ3 4
;
ƒƒ4 5
int
≈≈ 
userId
≈≈ 
=
≈≈ 
_helper
≈≈  
.
≈≈  !
GetLoggedInUserId
≈≈! 2
(
≈≈2 3
)
≈≈3 4
;
≈≈4 5
if
«« 
(
«« 
!
«« 
CheckRoleAccess
««  
(
««  !"
ModulePermissionEnum
««! 5
.
««5 6
ValuationRequest
««6 F
,
««F G
action
««H N
,
««N O
roleId
««P V
)
««V W
)
««W X
return
»» 
RedirectToAction
»» '
(
»»' (
AppConstants
»»( 4
.
»»4 5
AccessRestriction
»»5 F
,
»»F G
AppConstants
»»H T
.
»»T U
Home
»»U Y
)
»»Y Z
;
»»Z [
var
ÀÀ 
vw
ÀÀ 
=
ÀÀ 
IsView
ÀÀ 
==
ÀÀ 
$num
ÀÀ  
;
ÀÀ  !
ViewBag
ÃÃ 
.
ÃÃ 
IsView
ÃÃ 
=
ÃÃ 
IsView
ÃÃ #
;
ÃÃ# $

FooterInfo
ÕÕ 
(
ÕÕ 
TableNameEnum
ÕÕ $
.
ÕÕ$ %
ValuationRequest
ÕÕ% 5
,
ÕÕ5 6
_cofiguration
ÕÕ7 D
,
ÕÕD E
id
ÕÕF H
,
ÕÕH I
vw
ÕÕJ L
)
ÕÕL M
;
ÕÕM N
ViewBag
–– 
.
–– 
Access
–– 
=
–– %
GetRoleAccessValuations
–– 4
(
––4 5"
ModulePermissionEnum
––5 I
.
––I J
ValuationRequest
––J Z
,
––Z [
roleId
––\ b
,
––b c
SubModuleEnum
––d q
.
––q r
ValuationRequest––r Ç
)––Ç É
;––É Ñ
ViewBag
—— 
.
—— 
QuotationAccess
—— #
=
——$ %%
GetRoleAccessValuations
——& =
(
——= >"
ModulePermissionEnum
——> R
.
——R S
ValuationRequest
——S c
,
——c d
roleId
——e k
,
——k l
SubModuleEnum
——m z
.
——z {!
ValuationQuotation——{ ç
)——ç é
;——é è
ViewBag
““ 
.
““ 
InvoiceAccess
““ !
=
““" #%
GetRoleAccessValuations
““$ ;
(
““; <"
ModulePermissionEnum
““< P
.
““P Q
ValuationRequest
““Q a
,
““a b
roleId
““c i
,
““i j
SubModuleEnum
““k x
.
““x y
ValuationInvoice““y â
)““â ä
;““ä ã
ViewBag
”” 
.
”” 
SiteDescription
”” #
=
””$ %%
GetRoleAccessValuations
””& =
(
””= >"
ModulePermissionEnum
””> R
.
””R S
ValuationRequest
””S c
,
””c d
roleId
””e k
,
””k l
SubModuleEnum
””m z
.
””z {
SiteDescription””{ ä
)””ä ã
;””ã å
ViewBag
‘‘ 
.
‘‘ !
ComparableEvidences
‘‘ '
=
‘‘( )%
GetRoleAccessValuations
‘‘* A
(
‘‘A B"
ModulePermissionEnum
‘‘B V
.
‘‘V W
ValuationRequest
‘‘W g
,
‘‘g h
roleId
‘‘i o
,
‘‘o p
SubModuleEnum
‘‘q ~
.
‘‘~ "
ComparableEvidences‘‘ í
)‘‘í ì
;‘‘ì î
ViewBag
’’ 
.
’’ "
ValuationAssessement
’’ (
=
’’) *%
GetRoleAccessValuations
’’+ B
(
’’B C"
ModulePermissionEnum
’’C W
.
’’W X
ValuationRequest
’’X h
,
’’h i
roleId
’’j p
,
’’p q
SubModuleEnum
’’r 
.’’ Ä$
ValuationAssessement’’Ä î
)’’î ï
;’’ï ñ
if
◊◊ 
(
◊◊ 
id
◊◊ 
==
◊◊ 
null
◊◊ 
||
◊◊ 
id
◊◊  
<=
◊◊! #
$num
◊◊$ %
)
◊◊% &
{
ÿÿ 
ViewBag
ŸŸ 
.
ŸŸ 
CurrentUserId
ŸŸ %
=
ŸŸ& '
userId
ŸŸ( .
;
ŸŸ. /
return
‹‹ 
View
‹‹ 
(
‹‹ 
$str
‹‹ 4
,
‹‹4 5
_ValuationEntity
‹‹6 F
)
‹‹F G
;
‹‹G H
}
›› 
else
ﬁﬁ 
{
ﬂﬂ 
ViewBag
‡‡ 
.
‡‡ 
CurrentUserId
‡‡ %
=
‡‡& '
userId
‡‡( .
;
‡‡. /
HttpContext
·· 
.
·· 
Request
·· #
.
··# $
Cookies
··$ +
.
··+ ,
TryGetValue
··, 7
(
··7 8

UserHelper
··8 B
.
··B C
EltizamToken
··C O
,
··O P
out
··Q T
string
··U [
token
··\ a
)
··a b
;
··b c
APIRepository
‚‚ 
objapi
‚‚ $
=
‚‚% &
new
‚‚' *
(
‚‚* +
_cofiguration
‚‚+ 8
)
‚‚8 9
;
‚‚9 :!
HttpResponseMessage
„„ #
responseMessage
„„$ 3
=
„„4 5
objapi
„„6 <
.
„„< =
APICommunication
„„= M
(
„„M N
APIURLHelper
„„N Z
.
„„Z [%
ValuationRequestGetById
„„[ r
+
„„s t
$str
„„u x
+
„„y z
id
„„{ }
,
„„} ~

HttpMethod„„ â
.„„â ä
Get„„ä ç
,„„ç é
token„„è î
)„„î ï
.„„ï ñ
Result„„ñ ú
;„„ú ù
if
ÂÂ 
(
ÂÂ 
responseMessage
ÂÂ #
.
ÂÂ# $!
IsSuccessStatusCode
ÂÂ$ 7
)
ÂÂ7 8
{
ÊÊ 
string
ÁÁ 
jsonResponse
ÁÁ '
=
ÁÁ( )
responseMessage
ÁÁ* 9
.
ÁÁ9 :
Content
ÁÁ: A
.
ÁÁA B
ReadAsStringAsync
ÁÁB S
(
ÁÁS T
)
ÁÁT U
.
ÁÁU V
Result
ÁÁV \
;
ÁÁ\ ]
var
ËË 
data
ËË 
=
ËË 
JsonConvert
ËË *
.
ËË* +
DeserializeObject
ËË+ <
<
ËË< =
APIResponseEntity
ËË= N
<
ËËN O#
ValuationRequestModel
ËËO d
>
ËËd e
>
ËËe f
(
ËËf g
jsonResponse
ËËg s
)
ËËs t
;
ËËt u
if
ÎÎ 
(
ÎÎ 
(
ÎÎ 
roleId
ÎÎ 
==
ÎÎ  "
(
ÎÎ# $
int
ÎÎ$ '
)
ÎÎ' (
RoleEnum
ÎÎ( 0
.
ÎÎ0 1
Valuer
ÎÎ1 7
&&
ÎÎ8 :
data
ÎÎ; ?
.
ÎÎ? @
_object
ÎÎ@ G
.
ÎÎG H
ValuerId
ÎÎH P
!=
ÎÎQ S
userId
ÎÎT Z
)
ÎÎZ [
||
ÎÎ\ ^
(
ÏÏ 
roleId
ÏÏ 
==
ÏÏ  "
(
ÏÏ# $
int
ÏÏ$ '
)
ÏÏ' (
RoleEnum
ÏÏ( 0
.
ÏÏ0 1
Approver
ÏÏ1 9
&&
ÏÏ: <
data
ÏÏ= A
.
ÏÏA B
_object
ÏÏB I
.
ÏÏI J

ApproverId
ÏÏJ T
!=
ÏÏU W
userId
ÏÏX ^
)
ÏÏ^ _
)
ÏÏ_ `
{
ÌÌ 
if
ÓÓ 
(
ÓÓ 
data
ÓÓ 
.
ÓÓ  
_object
ÓÓ  '
.
ÓÓ' (

ApproverId
ÓÓ( 2
!=
ÓÓ3 5
userId
ÓÓ6 <
)
ÓÓ< =
{
ÔÔ 
return
 "
RedirectToAction
# 3
(
3 4
nameof
4 :
(
: ;
ValuationRequests
; L
)
L M
)
M N
;
N O
}
ÒÒ 
else
ÚÚ 
{
ÛÛ 
return
ÙÙ "
RedirectToAction
ÙÙ# 3
(
ÙÙ3 4
AppConstants
ÙÙ4 @
.
ÙÙ@ A
AccessRestriction
ÙÙA R
,
ÙÙR S
AppConstants
ÙÙT `
.
ÙÙ` a
Home
ÙÙa e
)
ÙÙe f
;
ÙÙf g
}
ıı 
}
ˆˆ 
ValReqHeaderInfo
˘˘ $
(
˘˘$ %
id
˘˘% '
.
˘˘' (
Value
˘˘( -
)
˘˘- .
;
˘˘. /
return
˚˚ 
View
˚˚ 
(
˚˚  
data
˚˚  $
.
˚˚$ %
_object
˚˚% ,
)
˚˚, -
;
˚˚- .
}
¸¸ 
return
˝˝ 
NotFound
˝˝ 
(
˝˝  
)
˝˝  !
;
˝˝! "
}
˛˛ 
}
ˇˇ 	
[
ÅÅ 	
HttpPost
ÅÅ	 
]
ÅÅ 
[
ÇÇ 	
Route
ÇÇ	 
(
ÇÇ 
$str
ÇÇ 8
)
ÇÇ8 9
]
ÇÇ9 :
public
ÉÉ 
IActionResult
ÉÉ 
ValuationRequest
ÉÉ -
(
ÉÉ- .
int
ÉÉ. 1
id
ÉÉ2 4
,
ÉÉ4 5#
ValuationRequestModel
ÉÉ6 K
request
ÉÉL S
)
ÉÉS T
{
ÑÑ 	
try
ÖÖ 
{
ÜÜ 
request
áá 
.
áá 
Id
áá 
=
áá 
id
áá 
;
áá  
if
àà 
(
àà 
request
àà 
.
àà 
Id
àà 
==
àà !
$num
àà" #
)
àà# $
request
ââ 
.
ââ 
	CreatedBy
ââ %
=
ââ& '
_helper
ââ( /
.
ââ/ 0
GetLoggedInUserId
ââ0 A
(
ââA B
)
ââB C
;
ââC D
request
ää 
.
ää 

ModifiedBy
ää "
=
ää# $
_helper
ää% ,
.
ää, -
GetLoggedInUserId
ää- >
(
ää> ?
)
ää? @
;
ää@ A
HttpContext
çç 
.
çç 
Request
çç #
.
çç# $
Cookies
çç$ +
.
çç+ ,
TryGetValue
çç, 7
(
çç7 8

UserHelper
çç8 B
.
ççB C
EltizamToken
ççC O
,
ççO P
out
ççQ T
string
ççU [
token
çç\ a
)
çça b
;
ççb c
APIRepository
éé 
objapi
éé $
=
éé% &
new
éé' *
(
éé* +
_cofiguration
éé+ 8
)
éé8 9
;
éé9 :!
HttpResponseMessage
èè #
responseMessage
èè$ 3
=
èè4 5
objapi
èè6 <
.
èè< =
APICommunication
èè= M
(
èèM N
APIURLHelper
èèN Z
.
èèZ [$
UpsertValuationRequest
èè[ q
,
èèq r

HttpMethod
èès }
.
èè} ~
Postèè~ Ç
,èèÇ É
tokenèèÑ â
,èèâ ä
newèèã é
StringContentèèè ú
(èèú ù
JsonConvertèèù ®
.èè® ©
SerializeObjectèè© ∏
(èè∏ π
requestèèπ ¿
)èè¿ ¡
)èè¡ ¬
)èè¬ √
.èè√ ƒ
Resultèèƒ  
;èè  À
if
íí 
(
íí 
responseMessage
íí #
.
íí# $!
IsSuccessStatusCode
íí$ 7
)
íí7 8
{
ìì 
TempData
îî 
[
îî 

UserHelper
îî '
.
îî' (
SuccessMessage
îî( 6
]
îî6 7
=
îî8 9
AppConstants
îî: F
.
îîF G
ActionSuccess
îîG T
;
îîT U
string
ïï 
jsonResponse
ïï '
=
ïï( )
responseMessage
ïï* 9
.
ïï9 :
Content
ïï: A
.
ïïA B
ReadAsStringAsync
ïïB S
(
ïïS T
)
ïïT U
.
ïïU V
Result
ïïV \
;
ïï\ ]
if
óó 
(
óó 
request
óó 
.
óó  
Id
óó  "
==
óó# %
$num
óó& '
)
óó' (
return
òò 
RedirectToAction
òò /
(
òò/ 0
nameof
òò0 6
(
òò6 7
ValuationRequests
òò7 H
)
òòH I
)
òòI J
;
òòJ K
else
ôô 
return
öö 
Redirect
öö '
(
öö' (
$"
öö( *
$str
öö* V
{
ööV W
request
ööW ^
.
öö^ _
Id
öö_ a
}
ööa b
"
ööb c
)
ööc d
;
ööd e
}
õõ 
else
úú 
TempData
ùù 
[
ùù 

UserHelper
ùù '
.
ùù' (
ErrorMessage
ùù( 4
]
ùù4 5
=
ùù6 7
AppConstants
ùù8 D
.
ùùD E
ActionFailed
ùùE Q
;
ùùQ R
}
ûû 
catch
üü 
(
üü 
	Exception
üü 
e
üü 
)
üü 
{
†† 
_helper
°° 
.
°° 
LogExceptions
°° %
(
°°% &
e
°°& '
)
°°' (
;
°°( )
TempData
¢¢ 
[
¢¢ 

UserHelper
¢¢ #
.
¢¢# $
ErrorMessage
¢¢$ 0
]
¢¢0 1
=
¢¢2 3
Convert
¢¢4 ;
.
¢¢; <
ToString
¢¢< D
(
¢¢D E
e
¢¢E F
.
¢¢F G

StackTrace
¢¢G Q
)
¢¢Q R
;
¢¢R S
}
££ 

ModelState
•• 
.
•• 
Clear
•• 
(
•• 
)
•• 
;
•• 
return
¶¶ 
RedirectToAction
¶¶ #
(
¶¶# $
nameof
¶¶$ *
(
¶¶* +
ValuationRequests
¶¶+ <
)
¶¶< =
)
¶¶= >
;
¶¶> ?
}
ßß 	
[
©© 	
HttpGet
©©	 
]
©© 
public
™™ 
IActionResult
™™ &
ValuationQuotationManage
™™ 5
(
™™5 6
int
™™6 9
?
™™9 :
id
™™; =
,
™™= >
int
™™? B
vId
™™C F
)
™™F G
{
´´ 	)
ValuationQuatationListModel
¨¨ '
	quotation
¨¨( 1
;
¨¨1 2
var
ÆÆ 
action
ÆÆ 
=
ÆÆ 
id
ÆÆ 
==
ÆÆ 
null
ÆÆ #
?
ÆÆ$ %
PermissionEnum
ÆÆ& 4
.
ÆÆ4 5
Add
ÆÆ5 8
:
ÆÆ9 :
PermissionEnum
ÆÆ; I
.
ÆÆI J
View
ÆÆJ N
;
ÆÆN O
int
±± 
roleId
±± 
=
±± 
_helper
±±  
.
±±  !
GetLoggedInRoleId
±±! 2
(
±±2 3
)
±±3 4
;
±±4 5
if
≥≥ 
(
≥≥ 
!
≥≥ 
CheckRoleAccess
≥≥  
(
≥≥  !"
ModulePermissionEnum
≥≥! 5
.
≥≥5 6
ValuationRequest
≥≥6 F
,
≥≥F G
action
≥≥H N
,
≥≥N O
roleId
≥≥P V
)
≥≥V W
)
≥≥W X
return
¥¥ 
RedirectToAction
¥¥ '
(
¥¥' (
AppConstants
¥¥( 4
.
¥¥4 5
AccessRestriction
¥¥5 F
,
¥¥F G
AppConstants
¥¥H T
.
¥¥T U
Home
¥¥U Y
)
¥¥Y Z
;
¥¥Z [
ViewBag
∑∑ 
.
∑∑ 
Access
∑∑ 
=
∑∑ %
GetRoleAccessValuations
∑∑ 4
(
∑∑4 5"
ModulePermissionEnum
∑∑5 I
.
∑∑I J
ValuationRequest
∑∑J Z
,
∑∑Z [
roleId
∑∑\ b
,
∑∑b c
SubModuleEnum
∑∑d q
.
∑∑q r
ValuationRequest∑∑r Ç
)∑∑Ç É
;∑∑É Ñ
ViewBag
∏∏ 
.
∏∏ 
QuotationAccess
∏∏ #
=
∏∏$ %%
GetRoleAccessValuations
∏∏& =
(
∏∏= >"
ModulePermissionEnum
∏∏> R
.
∏∏R S
ValuationRequest
∏∏S c
,
∏∏c d
roleId
∏∏e k
,
∏∏k l
SubModuleEnum
∏∏m z
.
∏∏z {!
ValuationQuotation∏∏{ ç
)∏∏ç é
;∏∏é è
ViewBag
ππ 
.
ππ 
InvoiceAccess
ππ !
=
ππ" #%
GetRoleAccessValuations
ππ$ ;
(
ππ; <"
ModulePermissionEnum
ππ< P
.
ππP Q
ValuationRequest
ππQ a
,
ππa b
roleId
ππc i
,
ππi j
SubModuleEnum
ππk x
.
ππx y
ValuationInvoiceππy â
)ππâ ä
;ππä ã
bool
ΩΩ $
hasQuatationViewAccess
ΩΩ '
=
ΩΩ( )
ViewBag
ΩΩ* 1
.
ΩΩ1 2
QuotationAccess
ΩΩ2 A
?
ΩΩA B
.
ΩΩB C
View
ΩΩC G
??
ΩΩH J
false
ΩΩK P
;
ΩΩP Q
bool
ææ $
hasQuatationEditAccess
ææ '
=
ææ( )
ViewBag
ææ* 1
.
ææ1 2
QuotationAccess
ææ2 A
?
ææA B
.
ææB C
Edit
ææC G
??
ææH J
false
ææK P
;
ææP Q
bool
øø #
hasQuatationAddAccess
øø &
=
øø' (
ViewBag
øø) 0
.
øø0 1
QuotationAccess
øø1 @
?
øø@ A
.
øøA B
Add
øøB E
??
øøF H
false
øøI N
;
øøN O
if
¡¡ 
(
¡¡ 
action
¡¡ 
==
¡¡ 
PermissionEnum
¡¡ (
.
¡¡( )
View
¡¡) -
&&
¡¡. 0
!
¡¡1 2$
hasQuatationViewAccess
¡¡2 H
)
¡¡H I
{
¬¬ 
return
√√ 
RedirectToAction
√√ '
(
√√' (
AppConstants
√√( 4
.
√√4 5
AccessRestriction
√√5 F
,
√√F G
AppConstants
√√H T
.
√√T U
Home
√√U Y
)
√√Y Z
;
√√Z [
}
ƒƒ 
else
≈≈ 
if
≈≈ 
(
≈≈ 
action
≈≈ 
==
≈≈ 
PermissionEnum
≈≈ -
.
≈≈- .
Edit
≈≈. 2
&&
≈≈3 5
!
≈≈6 7$
hasQuatationEditAccess
≈≈7 M
)
≈≈M N
{
∆∆ 
return
«« 
RedirectToAction
«« '
(
««' (
AppConstants
««( 4
.
««4 5
AccessRestriction
««5 F
,
««F G
AppConstants
««H T
.
««T U
Home
««U Y
)
««Y Z
;
««Z [
}
»» 
else
…… 
if
…… 
(
…… 
action
…… 
==
…… 
PermissionEnum
…… -
.
……- .
Add
……. 1
&&
……2 4
!
……5 6#
hasQuatationAddAccess
……6 K
)
……K L
{
   
return
ÀÀ 
RedirectToAction
ÀÀ '
(
ÀÀ' (
AppConstants
ÀÀ( 4
.
ÀÀ4 5
AccessRestriction
ÀÀ5 F
,
ÀÀF G
AppConstants
ÀÀH T
.
ÀÀT U
Home
ÀÀU Y
)
ÀÀY Z
;
ÀÀZ [
}
ÃÃ 
	quotation
ŒŒ 
=
ŒŒ 
new
ŒŒ )
ValuationQuatationListModel
ŒŒ 7
(
ŒŒ7 8
)
ŒŒ8 9
;
ŒŒ9 :
ValReqHeaderInfo
—— 
(
—— 
vId
——  
)
——  !
;
——! "
	quotation
““ 
.
““  
ValuationRequestId
““ (
=
““) *
vId
““+ .
;
““. /
if
‘‘ 
(
‘‘ 
id
‘‘ 
==
‘‘ 
null
‘‘ 
||
‘‘ 
id
‘‘  
<=
‘‘! #
$num
‘‘$ %
)
‘‘% &
{
’’ 
	quotation
÷÷ 
.
÷÷ 
StatusId
÷÷ "
=
÷÷# $
$num
÷÷% '
;
÷÷' (

FooterInfo
◊◊ 
(
◊◊ 
TableNameEnum
◊◊ (
.
◊◊( ) 
ValuationQuotation
◊◊) ;
,
◊◊; <
_cofiguration
◊◊= J
,
◊◊J K
id
◊◊L N
)
◊◊N O
;
◊◊O P
return
ÿÿ 
View
ÿÿ 
(
ÿÿ 
	quotation
ÿÿ %
)
ÿÿ% &
;
ÿÿ& '
}
ŸŸ 
else
⁄⁄ 
{
€€ 
HttpContext
‹‹ 
.
‹‹ 
Request
‹‹ #
.
‹‹# $
Cookies
‹‹$ +
.
‹‹+ ,
TryGetValue
‹‹, 7
(
‹‹7 8

UserHelper
‹‹8 B
.
‹‹B C
EltizamToken
‹‹C O
,
‹‹O P
out
‹‹Q T
string
‹‹U [
_token
‹‹\ b
)
‹‹b c
;
‹‹c d
APIRepository
›› 
_objapi
›› %
=
››& '
new
››( +
(
››+ ,
_cofiguration
››, 9
)
››9 :
;
››: ;!
HttpResponseMessage
ﬁﬁ #
_responseMessage
ﬁﬁ$ 4
=
ﬁﬁ5 6
_objapi
ﬁﬁ7 >
.
ﬁﬁ> ?
APICommunication
ﬁﬁ? O
(
ﬁﬁO P
APIURLHelper
ﬁﬁP \
.
ﬁﬁ\ ]$
ValuationQuatationById
ﬁﬁ] s
+
ﬁﬁt u
$str
ﬁﬁv y
+
ﬁﬁz {
id
ﬁﬁ| ~
,
ﬁﬁ~ 

HttpMethodﬁﬁÄ ä
.ﬁﬁä ã
Getﬁﬁã é
,ﬁﬁé è
_tokenﬁﬁê ñ
)ﬁﬁñ ó
.ﬁﬁó ò
Resultﬁﬁò û
;ﬁﬁû ü
if
‡‡ 
(
‡‡ 
_responseMessage
‡‡ $
.
‡‡$ %!
IsSuccessStatusCode
‡‡% 8
)
‡‡8 9
{
·· 
string
‚‚ 
jsonResponse
‚‚ '
=
‚‚( )
_responseMessage
‚‚* :
.
‚‚: ;
Content
‚‚; B
.
‚‚B C
ReadAsStringAsync
‚‚C T
(
‚‚T U
)
‚‚U V
.
‚‚V W
Result
‚‚W ]
;
‚‚] ^
var
„„ 
data
„„ 
=
„„ 
JsonConvert
„„ *
.
„„* +
DeserializeObject
„„+ <
<
„„< =
APIResponseEntity
„„= N
<
„„N O)
ValuationQuatationListModel
„„O j
>
„„j k
>
„„k l
(
„„l m
jsonResponse
„„m y
)
„„y z
;
„„z {

FooterInfo
ÊÊ 
(
ÊÊ 
TableNameEnum
ÊÊ ,
.
ÊÊ, - 
ValuationQuotation
ÊÊ- ?
,
ÊÊ? @
_cofiguration
ÊÊA N
,
ÊÊN O
id
ÊÊP R
,
ÊÊR S
true
ÊÊT X
)
ÊÊX Y
;
ÊÊY Z
return
ËË 
View
ËË 
(
ËË  
data
ËË  $
.
ËË$ %
_object
ËË% ,
)
ËË, -
;
ËË- .
}
ÈÈ 
return
ÍÍ 
NotFound
ÍÍ 
(
ÍÍ  
)
ÍÍ  !
;
ÍÍ! "
}
ÎÎ 
}
ÏÏ 	
private
ÌÌ 
void
ÌÌ 
ValReqHeaderInfo
ÌÌ %
(
ÌÌ% &
int
ÌÌ& )
vId
ÌÌ* -
)
ÌÌ- .
{
ÓÓ 	
HttpContext
ÔÔ 
.
ÔÔ 
Request
ÔÔ 
.
ÔÔ  
Cookies
ÔÔ  '
.
ÔÔ' (
TryGetValue
ÔÔ( 3
(
ÔÔ3 4

UserHelper
ÔÔ4 >
.
ÔÔ> ?
EltizamToken
ÔÔ? K
,
ÔÔK L
out
ÔÔM P
string
ÔÔQ W
token
ÔÔX ]
)
ÔÔ] ^
;
ÔÔ^ _
APIRepository
 
objapi
  
=
! "
new
# &
(
& '
_cofiguration
' 4
)
4 5
;
5 6!
HttpResponseMessage
ÒÒ 
responseMessage
ÒÒ  /
=
ÒÒ0 1
objapi
ÒÒ2 8
.
ÒÒ8 9
APICommunication
ÒÒ9 I
(
ÒÒI J
APIURLHelper
ÒÒJ V
.
ÒÒV W/
!ValuationRequestGetHeaderInfoById
ÒÒW x
+
ÒÒy z
$str
ÒÒ{ ~
+ÒÒ Ä
vIdÒÒÅ Ñ
,ÒÒÑ Ö

HttpMethodÒÒÜ ê
.ÒÒê ë
GetÒÒë î
,ÒÒî ï
tokenÒÒñ õ
)ÒÒõ ú
.ÒÒú ù
ResultÒÒù £
;ÒÒ£ §
if
ÛÛ 
(
ÛÛ 
responseMessage
ÛÛ 
.
ÛÛ  !
IsSuccessStatusCode
ÛÛ  3
)
ÛÛ3 4
{
ÙÙ 
string
ıı 
jsonResponse
ıı #
=
ıı$ %
responseMessage
ıı& 5
.
ıı5 6
Content
ıı6 =
.
ıı= >
ReadAsStringAsync
ıı> O
(
ııO P
)
ııP Q
.
ııQ R
Result
ııR X
;
ııX Y
var
ˆˆ 
data
ˆˆ 
=
ˆˆ 
JsonConvert
ˆˆ &
.
ˆˆ& '
DeserializeObject
ˆˆ' 8
<
ˆˆ8 9
APIResponseEntity
ˆˆ9 J
<
ˆˆJ K*
ValuationRequestDependencies
ˆˆK g
>
ˆˆg h
>
ˆˆh i
(
ˆˆi j
jsonResponse
ˆˆj v
)
ˆˆv w
;
ˆˆw x
if
¯¯ 
(
¯¯ 
data
¯¯ 
!=
¯¯ 
null
¯¯  
&&
¯¯! #
data
¯¯$ (
.
¯¯( )
_object
¯¯) 0
!=
¯¯1 3
null
¯¯4 8
)
¯¯8 9
{
˘˘ 
TempData
ÇÇ 
[
ÇÇ 

UserHelper
ÇÇ '
.
ÇÇ' (
ValReqHeader
ÇÇ( 4
]
ÇÇ4 5
=
ÇÇ6 7
data
ÇÇ8 <
.
ÇÇ< =
_object
ÇÇ= D
;
ÇÇD E
}
ÉÉ 
}
ÑÑ 
}
ÖÖ 	
[
áá 	
HttpPost
áá	 
]
áá 
public
àà 
IActionResult
àà &
ValuationQuotationManage
àà 5
(
àà5 6
int
àà6 9
id
àà: <
,
àà< =)
ValuationQuatationListModel
àà> Y
masterQuotation
ààZ i
)
àài j
{
ââ 	
try
ää 
{
ãã 
var
çç 
action
çç 
=
çç 
id
çç 
==
çç  "
null
çç# '
?
çç( )
PermissionEnum
çç* 8
.
çç8 9
Add
çç9 <
:
çç= >
PermissionEnum
çç? M
.
ççM N
View
ççN R
;
ççR S
int
èè 
roleId
èè 
=
èè 
_helper
èè $
.
èè$ %
GetLoggedInRoleId
èè% 6
(
èè6 7
)
èè7 8
;
èè8 9
if
ëë 
(
ëë 
!
ëë 
CheckRoleAccess
ëë $
(
ëë$ %"
ModulePermissionEnum
ëë% 9
.
ëë9 :
ValuationRequest
ëë: J
,
ëëJ K
action
ëëL R
,
ëëR S
roleId
ëëT Z
)
ëëZ [
)
ëë[ \
return
íí 
RedirectToAction
íí +
(
íí+ ,
AppConstants
íí, 8
.
íí8 9
AccessRestriction
íí9 J
,
ííJ K
AppConstants
ííL X
.
ííX Y
Home
ííY ]
)
íí] ^
;
íí^ _
ViewBag
ïï 
.
ïï 
Access
ïï 
=
ïï  %
GetRoleAccessValuations
ïï! 8
(
ïï8 9"
ModulePermissionEnum
ïï9 M
.
ïïM N
ValuationRequest
ïïN ^
,
ïï^ _
roleId
ïï` f
,
ïïf g
SubModuleEnum
ïïh u
.
ïïu v
ValuationRequestïïv Ü
)ïïÜ á
;ïïá à
ViewBag
ññ 
.
ññ 
QuotationAccess
ññ '
=
ññ( )%
GetRoleAccessValuations
ññ* A
(
ññA B"
ModulePermissionEnum
ññB V
.
ññV W
ValuationRequest
ññW g
,
ññg h
roleId
ññi o
,
ñño p
SubModuleEnum
ññq ~
.
ññ~ !
ValuationQuotationññ ë
)ññë í
;ññí ì
ViewBag
óó 
.
óó 
InvoiceAccess
óó %
=
óó& '%
GetRoleAccessValuations
óó( ?
(
óó? @"
ModulePermissionEnum
óó@ T
.
óóT U
ValuationRequest
óóU e
,
óóe f
roleId
óóg m
,
óóm n
SubModuleEnum
óóo |
.
óó| }
ValuationInvoiceóó} ç
)óóç é
;óóé è
bool
õõ $
hasQuatationViewAccess
õõ +
=
õõ, -
ViewBag
õõ. 5
.
õõ5 6
QuotationAccess
õõ6 E
?
õõE F
.
õõF G
View
õõG K
??
õõL N
false
õõO T
;
õõT U
bool
úú $
hasQuatationEditAccess
úú +
=
úú, -
ViewBag
úú. 5
.
úú5 6
QuotationAccess
úú6 E
?
úúE F
.
úúF G
Edit
úúG K
??
úúL N
false
úúO T
;
úúT U
bool
ùù #
hasQuatationAddAccess
ùù *
=
ùù+ ,
ViewBag
ùù- 4
.
ùù4 5
QuotationAccess
ùù5 D
?
ùùD E
.
ùùE F
Add
ùùF I
??
ùùJ L
false
ùùM R
;
ùùR S
if
üü 
(
üü 
action
üü 
==
üü 
PermissionEnum
üü ,
.
üü, -
View
üü- 1
&&
üü2 4
!
üü5 6$
hasQuatationViewAccess
üü6 L
)
üüL M
{
†† 
return
°° 
RedirectToAction
°° +
(
°°+ ,
AppConstants
°°, 8
.
°°8 9
AccessRestriction
°°9 J
,
°°J K
AppConstants
°°L X
.
°°X Y
Home
°°Y ]
)
°°] ^
;
°°^ _
}
¢¢ 
else
££ 
if
££ 
(
££ 
action
££ 
==
££  "
PermissionEnum
££# 1
.
££1 2
Edit
££2 6
&&
££7 9
!
££: ;$
hasQuatationEditAccess
££; Q
)
££Q R
{
§§ 
return
•• 
RedirectToAction
•• +
(
••+ ,
AppConstants
••, 8
.
••8 9
AccessRestriction
••9 J
,
••J K
AppConstants
••L X
.
••X Y
Home
••Y ]
)
••] ^
;
••^ _
}
¶¶ 
else
ßß 
if
ßß 
(
ßß 
action
ßß 
==
ßß  "
PermissionEnum
ßß# 1
.
ßß1 2
Add
ßß2 5
&&
ßß6 8
!
ßß9 :#
hasQuatationAddAccess
ßß: O
)
ßßO P
{
®® 
return
©© 
RedirectToAction
©© +
(
©©+ ,
AppConstants
©©, 8
.
©©8 9
AccessRestriction
©©9 J
,
©©J K
AppConstants
©©L X
.
©©X Y
Home
©©Y ]
)
©©] ^
;
©©^ _
}
™™ 
if
≠≠ 
(
≠≠ 
masterQuotation
≠≠ #
.
≠≠# $
Id
≠≠$ &
==
≠≠' )
$num
≠≠* +
)
≠≠+ ,
masterQuotation
ÆÆ #
.
ÆÆ# $
	CreatedBy
ÆÆ$ -
=
ÆÆ. /
_helper
ÆÆ0 7
.
ÆÆ7 8
GetLoggedInUserId
ÆÆ8 I
(
ÆÆI J
)
ÆÆJ K
;
ÆÆK L
masterQuotation
ØØ 
.
ØØ  

ModifiedBy
ØØ  *
=
ØØ+ ,
_helper
ØØ- 4
.
ØØ4 5
GetLoggedInUserId
ØØ5 F
(
ØØF G
)
ØØG H
;
ØØH I
if
±± 
(
±± 
masterQuotation
±± #
.
±±# $
Document
±±$ ,
!=
±±- /
null
±±0 4
&&
±±5 7
masterQuotation
±±8 G
.
±±G H
Document
±±H P
.
±±P Q
Files
±±Q V
!=
±±W Y
null
±±Z ^
)
±±^ _
{
≤≤ 
List
≥≥ 
<
≥≥ !
MasterDocumentModel
≥≥ ,
>
≥≥, -
docs
≥≥. 2
=
≥≥3 4
_helper
≥≥5 <
.
≥≥< =

FileUpload
≥≥= G
(
≥≥G H
masterQuotation
≥≥H W
.
≥≥W X
Document
≥≥X `
)
≥≥` a
;
≥≥a b
masterQuotation
¥¥ #
.
¥¥# $
uploadDocument
¥¥$ 2
=
¥¥3 4
docs
¥¥5 9
;
¥¥9 :
masterQuotation
µµ #
.
µµ# $
Document
µµ$ ,
=
µµ- .
null
µµ/ 3
;
µµ3 4
}
∂∂ 
HttpContext
∏∏ 
.
∏∏ 
Request
∏∏ #
.
∏∏# $
Cookies
∏∏$ +
.
∏∏+ ,
TryGetValue
∏∏, 7
(
∏∏7 8

UserHelper
∏∏8 B
.
∏∏B C
EltizamToken
∏∏C O
,
∏∏O P
out
∏∏Q T
string
∏∏U [
token
∏∏\ a
)
∏∏a b
;
∏∏b c
APIRepository
ππ 
objapi
ππ $
=
ππ% &
new
ππ' *
(
ππ* +
_cofiguration
ππ+ 8
)
ππ8 9
;
ππ9 :!
HttpResponseMessage
ªª #
responseMessage
ªª$ 3
=
ªª4 5
objapi
ªª6 <
.
ªª< =
APICommunication
ªª= M
(
ªªM N
APIURLHelper
ªªN Z
.
ªªZ [&
UpsertValuationQuatation
ªª[ s
,
ªªs t

HttpMethod
ªªu 
.ªª Ä
PostªªÄ Ñ
,ªªÑ Ö
tokenªªÜ ã
,ªªã å
newªªç ê
StringContentªªë û
(ªªû ü
JsonConvertªªü ™
.ªª™ ´
SerializeObjectªª´ ∫
(ªª∫ ª
masterQuotationªªª  
)ªª  À
)ªªÀ Ã
)ªªÃ Õ
.ªªÕ Œ
ResultªªŒ ‘
;ªª‘ ’
if
ΩΩ 
(
ΩΩ 
responseMessage
ΩΩ #
.
ΩΩ# $!
IsSuccessStatusCode
ΩΩ$ 7
)
ΩΩ7 8
{
ææ 
string
øø 
jsonResponse
øø '
=
øø( )
responseMessage
øø* 9
.
øø9 :
Content
øø: A
.
øøA B
ReadAsStringAsync
øøB S
(
øøS T
)
øøT U
.
øøU V
Result
øøV \
;
øø\ ]
TempData
¿¿ 
[
¿¿ 

UserHelper
¿¿ '
.
¿¿' (
SuccessMessage
¿¿( 6
]
¿¿6 7
=
¿¿8 9
Convert
¿¿: A
.
¿¿A B
ToString
¿¿B J
(
¿¿J K$
_stringLocalizerShared
¿¿K a
[
¿¿a b
$str
¿¿b v
]
¿¿v w
)
¿¿w x
;
¿¿x y
}
¡¡ 
else
¬¬ 
TempData
√√ 
[
√√ 

UserHelper
√√ '
.
√√' (
ErrorMessage
√√( 4
]
√√4 5
=
√√6 7
Convert
√√8 ?
.
√√? @
ToString
√√@ H
(
√√H I
responseMessage
√√I X
.
√√X Y
Content
√√Y `
.
√√` a
ReadAsStringAsync
√√a r
(
√√r s
)
√√s t
.
√√t u
Result
√√u {
)
√√{ |
;
√√| }
}
≈≈ 
catch
∆∆ 
(
∆∆ 
	Exception
∆∆ 
e
∆∆ 
)
∆∆ 
{
«« 
_helper
»» 
.
»» 
LogExceptions
»» %
(
»»% &
e
»»& '
)
»»' (
;
»»( )
TempData
…… 
[
…… 

UserHelper
…… #
.
……# $
ErrorMessage
……$ 0
]
……0 1
=
……2 3
Convert
……4 ;
.
……; <
ToString
……< D
(
……D E
e
……E F
.
……F G

StackTrace
……G Q
)
……Q R
;
……R S
}
   
return
ÃÃ 
Redirect
ÃÃ 
(
ÃÃ 
$"
ÃÃ 
$str
ÃÃ J
{
ÃÃJ K
masterQuotation
ÃÃK Z
.
ÃÃZ [ 
ValuationRequestId
ÃÃ[ m
}
ÃÃm n
"
ÃÃn o
)
ÃÃo p
;
ÃÃp q
}
ÕÕ 	
[
œœ 	
HttpGet
œœ	 
]
œœ 
public
–– 
IActionResult
–– $
ValuationInvoiceManage
–– 3
(
––3 4
int
––4 7
?
––7 8
id
––9 ;
,
––; <
int
––= @
vId
––A D
)
––D E
{
—— 	'
ValuationInvoiceListModel
““ %
invoice
““& -
;
““- .
var
’’ 
action
’’ 
=
’’ 
id
’’ 
==
’’ 
null
’’ #
?
’’$ %
PermissionEnum
’’& 4
.
’’4 5
Add
’’5 8
:
’’9 :
PermissionEnum
’’; I
.
’’I J
View
’’J N
;
’’N O
int
◊◊ 
roleId
◊◊ 
=
◊◊ 
_helper
◊◊  
.
◊◊  !
GetLoggedInRoleId
◊◊! 2
(
◊◊2 3
)
◊◊3 4
;
◊◊4 5
if
ŸŸ 
(
ŸŸ 
!
ŸŸ 
CheckRoleAccess
ŸŸ  
(
ŸŸ  !"
ModulePermissionEnum
ŸŸ! 5
.
ŸŸ5 6
ValuationRequest
ŸŸ6 F
,
ŸŸF G
action
ŸŸH N
,
ŸŸN O
roleId
ŸŸP V
)
ŸŸV W
)
ŸŸW X
return
⁄⁄ 
RedirectToAction
⁄⁄ '
(
⁄⁄' (
AppConstants
⁄⁄( 4
.
⁄⁄4 5
AccessRestriction
⁄⁄5 F
,
⁄⁄F G
AppConstants
⁄⁄H T
.
⁄⁄T U
Home
⁄⁄U Y
)
⁄⁄Y Z
;
⁄⁄Z [
ViewBag
›› 
.
›› 
Access
›› 
=
›› %
GetRoleAccessValuations
›› 4
(
››4 5"
ModulePermissionEnum
››5 I
.
››I J
ValuationRequest
››J Z
,
››Z [
roleId
››\ b
,
››b c
SubModuleEnum
››d q
.
››q r
ValuationRequest››r Ç
)››Ç É
;››É Ñ
ViewBag
ﬁﬁ 
.
ﬁﬁ 
QuotationAccess
ﬁﬁ #
=
ﬁﬁ$ %%
GetRoleAccessValuations
ﬁﬁ& =
(
ﬁﬁ= >"
ModulePermissionEnum
ﬁﬁ> R
.
ﬁﬁR S
ValuationRequest
ﬁﬁS c
,
ﬁﬁc d
roleId
ﬁﬁe k
,
ﬁﬁk l
SubModuleEnum
ﬁﬁm z
.
ﬁﬁz {!
ValuationQuotationﬁﬁ{ ç
)ﬁﬁç é
;ﬁﬁé è
ViewBag
ﬂﬂ 
.
ﬂﬂ 
InvoiceAccess
ﬂﬂ !
=
ﬂﬂ" #%
GetRoleAccessValuations
ﬂﬂ$ ;
(
ﬂﬂ; <"
ModulePermissionEnum
ﬂﬂ< P
.
ﬂﬂP Q
ValuationRequest
ﬂﬂQ a
,
ﬂﬂa b
roleId
ﬂﬂc i
,
ﬂﬂi j
SubModuleEnum
ﬂﬂk x
.
ﬂﬂx y
ValuationInvoiceﬂﬂy â
)ﬂﬂâ ä
;ﬂﬂä ã
bool
·· "
hasInvoiceViewAccess
·· %
=
··& '
ViewBag
··( /
.
··/ 0
QuotationAccess
··0 ?
?
··? @
.
··@ A
View
··A E
??
··F H
false
··I N
;
··N O
bool
‚‚ "
hasInvoiceEditAccess
‚‚ %
=
‚‚& '
ViewBag
‚‚( /
.
‚‚/ 0
QuotationAccess
‚‚0 ?
?
‚‚? @
.
‚‚@ A
Edit
‚‚A E
??
‚‚F H
false
‚‚I N
;
‚‚N O
bool
„„ !
hasInvoiceAddAccess
„„ $
=
„„% &
ViewBag
„„' .
.
„„. /
QuotationAccess
„„/ >
?
„„> ?
.
„„? @
Add
„„@ C
??
„„D F
false
„„G L
;
„„L M
if
ÂÂ 
(
ÂÂ 
action
ÂÂ 
==
ÂÂ 
PermissionEnum
ÂÂ (
.
ÂÂ( )
View
ÂÂ) -
&&
ÂÂ. 0
!
ÂÂ1 2"
hasInvoiceViewAccess
ÂÂ2 F
)
ÂÂF G
{
ÊÊ 
return
ÁÁ 
RedirectToAction
ÁÁ '
(
ÁÁ' (
AppConstants
ÁÁ( 4
.
ÁÁ4 5
AccessRestriction
ÁÁ5 F
,
ÁÁF G
AppConstants
ÁÁH T
.
ÁÁT U
Home
ÁÁU Y
)
ÁÁY Z
;
ÁÁZ [
}
ËË 
else
ÈÈ 
if
ÈÈ 
(
ÈÈ 
action
ÈÈ 
==
ÈÈ 
PermissionEnum
ÈÈ -
.
ÈÈ- .
Edit
ÈÈ. 2
&&
ÈÈ3 5
!
ÈÈ6 7"
hasInvoiceEditAccess
ÈÈ7 K
)
ÈÈK L
{
ÍÍ 
return
ÎÎ 
RedirectToAction
ÎÎ '
(
ÎÎ' (
AppConstants
ÎÎ( 4
.
ÎÎ4 5
AccessRestriction
ÎÎ5 F
,
ÎÎF G
AppConstants
ÎÎH T
.
ÎÎT U
Home
ÎÎU Y
)
ÎÎY Z
;
ÎÎZ [
}
ÏÏ 
else
ÌÌ 
if
ÌÌ 
(
ÌÌ 
action
ÌÌ 
==
ÌÌ 
PermissionEnum
ÌÌ -
.
ÌÌ- .
Add
ÌÌ. 1
&&
ÌÌ2 4
!
ÌÌ5 6!
hasInvoiceAddAccess
ÌÌ6 I
)
ÌÌI J
{
ÓÓ 
return
ÔÔ 
RedirectToAction
ÔÔ '
(
ÔÔ' (
AppConstants
ÔÔ( 4
.
ÔÔ4 5
AccessRestriction
ÔÔ5 F
,
ÔÔF G
AppConstants
ÔÔH T
.
ÔÔT U
Home
ÔÔU Y
)
ÔÔY Z
;
ÔÔZ [
}
 
invoice
ÚÚ 
=
ÚÚ 
new
ÚÚ '
ValuationInvoiceListModel
ÚÚ 3
(
ÚÚ3 4
)
ÚÚ4 5
;
ÚÚ5 6
ValReqHeaderInfo
ıı 
(
ıı 
vId
ıı  
)
ıı  !
;
ıı! "
invoice
ˆˆ 
.
ˆˆ  
ValuationRequestId
ˆˆ &
=
ˆˆ' (
vId
ˆˆ) ,
;
ˆˆ, -
if
¯¯ 
(
¯¯ 
id
¯¯ 
==
¯¯ 
null
¯¯ 
||
¯¯ 
id
¯¯  
<=
¯¯! #
$num
¯¯$ %
)
¯¯% &
{
˘˘ 

FooterInfo
˚˚ 
(
˚˚ 
TableNameEnum
˚˚ (
.
˚˚( )
ValuationInvoice
˚˚) 9
,
˚˚9 :
_cofiguration
˚˚; H
,
˚˚H I
id
˚˚J L
)
˚˚L M
;
˚˚M N
return
¸¸ 
View
¸¸ 
(
¸¸ 
invoice
¸¸ #
)
¸¸# $
;
¸¸$ %
}
˝˝ 
else
˛˛ 
{
ˇˇ 
HttpContext
ÄÄ 
.
ÄÄ 
Request
ÄÄ #
.
ÄÄ# $
Cookies
ÄÄ$ +
.
ÄÄ+ ,
TryGetValue
ÄÄ, 7
(
ÄÄ7 8

UserHelper
ÄÄ8 B
.
ÄÄB C
EltizamToken
ÄÄC O
,
ÄÄO P
out
ÄÄQ T
string
ÄÄU [
_token
ÄÄ\ b
)
ÄÄb c
;
ÄÄc d
APIRepository
ÅÅ 
_objapi
ÅÅ %
=
ÅÅ& '
new
ÅÅ( +
(
ÅÅ+ ,
_cofiguration
ÅÅ, 9
)
ÅÅ9 :
;
ÅÅ: ;!
HttpResponseMessage
ÇÇ #
_responseMessage
ÇÇ$ 4
=
ÇÇ5 6
_objapi
ÇÇ7 >
.
ÇÇ> ?
APICommunication
ÇÇ? O
(
ÇÇO P
APIURLHelper
ÇÇP \
.
ÇÇ\ ]"
ValuationInvoiceById
ÇÇ] q
+
ÇÇr s
$str
ÇÇt w
+
ÇÇx y
id
ÇÇz |
,
ÇÇ| }

HttpMethodÇÇ~ à
.ÇÇà â
GetÇÇâ å
,ÇÇå ç
_tokenÇÇé î
)ÇÇî ï
.ÇÇï ñ
ResultÇÇñ ú
;ÇÇú ù
if
ÑÑ 
(
ÑÑ 
_responseMessage
ÑÑ $
.
ÑÑ$ %!
IsSuccessStatusCode
ÑÑ% 8
)
ÑÑ8 9
{
ÖÖ 
string
ÜÜ 
jsonResponse
ÜÜ '
=
ÜÜ( )
_responseMessage
ÜÜ* :
.
ÜÜ: ;
Content
ÜÜ; B
.
ÜÜB C
ReadAsStringAsync
ÜÜC T
(
ÜÜT U
)
ÜÜU V
.
ÜÜV W
Result
ÜÜW ]
;
ÜÜ] ^
var
áá 
data
áá 
=
áá 
JsonConvert
áá *
.
áá* +
DeserializeObject
áá+ <
<
áá< =
APIResponseEntity
áá= N
<
ááN O'
ValuationInvoiceListModel
ááO h
>
ááh i
>
áái j
(
ááj k
jsonResponse
áák w
)
ááw x
;
ááx y

FooterInfo
ää 
(
ää 
TableNameEnum
ää ,
.
ää, -
ValuationInvoice
ää- =
,
ää= >
_cofiguration
ää? L
,
ääL M
id
ääN P
,
ääP Q
true
ääR V
)
ääV W
;
ääW X
return
åå 
View
åå 
(
åå  
data
åå  $
.
åå$ %
_object
åå% ,
)
åå, -
;
åå- .
}
çç 
return
éé 
NotFound
éé 
(
éé  
)
éé  !
;
éé! "
}
èè 
}
êê 	
[
ìì 	
HttpPost
ìì	 
]
ìì 
public
îî 
IActionResult
îî $
ValuationInvoiceManage
îî 3
(
îî3 4
int
îî4 7
id
îî8 :
,
îî: ;'
ValuationInvoiceListModel
îî< U
masterInvoice
îîV c
)
îîc d
{
ïï 	
try
ññ 
{
óó 
var
ôô 
action
ôô 
=
ôô 
id
ôô 
==
ôô  "
null
ôô# '
?
ôô( )
PermissionEnum
ôô* 8
.
ôô8 9
Add
ôô9 <
:
ôô= >
PermissionEnum
ôô? M
.
ôôM N
View
ôôN R
;
ôôR S
int
öö 
roleId
öö 
=
öö 
_helper
öö $
.
öö$ %
GetLoggedInRoleId
öö% 6
(
öö6 7
)
öö7 8
;
öö8 9
if
úú 
(
úú 
!
úú 
CheckRoleAccess
úú $
(
úú$ %"
ModulePermissionEnum
úú% 9
.
úú9 :
ValuationRequest
úú: J
,
úúJ K
action
úúL R
,
úúR S
roleId
úúT Z
)
úúZ [
)
úú[ \
return
ùù 
RedirectToAction
ùù +
(
ùù+ ,
AppConstants
ùù, 8
.
ùù8 9
AccessRestriction
ùù9 J
,
ùùJ K
AppConstants
ùùL X
.
ùùX Y
Home
ùùY ]
)
ùù] ^
;
ùù^ _
ViewBag
†† 
.
†† 
Access
†† 
=
††  %
GetRoleAccessValuations
††! 8
(
††8 9"
ModulePermissionEnum
††9 M
.
††M N
ValuationRequest
††N ^
,
††^ _
roleId
††` f
,
††f g
SubModuleEnum
††h u
.
††u v
ValuationRequest††v Ü
)††Ü á
;††á à
ViewBag
°° 
.
°° 
QuotationAccess
°° '
=
°°( )%
GetRoleAccessValuations
°°* A
(
°°A B"
ModulePermissionEnum
°°B V
.
°°V W
ValuationRequest
°°W g
,
°°g h
roleId
°°i o
,
°°o p
SubModuleEnum
°°q ~
.
°°~ !
ValuationQuotation°° ë
)°°ë í
;°°í ì
ViewBag
¢¢ 
.
¢¢ 
InvoiceAccess
¢¢ %
=
¢¢& '%
GetRoleAccessValuations
¢¢( ?
(
¢¢? @"
ModulePermissionEnum
¢¢@ T
.
¢¢T U
ValuationRequest
¢¢U e
,
¢¢e f
roleId
¢¢g m
,
¢¢m n
SubModuleEnum
¢¢o |
.
¢¢| }
ValuationInvoice¢¢} ç
)¢¢ç é
;¢¢é è
bool
¶¶ "
hasInvoiceViewAccess
¶¶ )
=
¶¶* +
ViewBag
¶¶, 3
.
¶¶3 4
QuotationAccess
¶¶4 C
?
¶¶C D
.
¶¶D E
View
¶¶E I
??
¶¶J L
false
¶¶M R
;
¶¶R S
bool
ßß "
hasInvoiceEditAccess
ßß )
=
ßß* +
ViewBag
ßß, 3
.
ßß3 4
QuotationAccess
ßß4 C
?
ßßC D
.
ßßD E
Edit
ßßE I
??
ßßJ L
false
ßßM R
;
ßßR S
bool
®® !
hasInvoiceAddAccess
®® (
=
®®) *
ViewBag
®®+ 2
.
®®2 3
QuotationAccess
®®3 B
?
®®B C
.
®®C D
Add
®®D G
??
®®H J
false
®®K P
;
®®P Q
if
™™ 
(
™™ 
action
™™ 
==
™™ 
PermissionEnum
™™ ,
.
™™, -
View
™™- 1
&&
™™2 4
!
™™5 6"
hasInvoiceViewAccess
™™6 J
)
™™J K
{
´´ 
return
¨¨ 
RedirectToAction
¨¨ +
(
¨¨+ ,
AppConstants
¨¨, 8
.
¨¨8 9
AccessRestriction
¨¨9 J
,
¨¨J K
AppConstants
¨¨L X
.
¨¨X Y
Home
¨¨Y ]
)
¨¨] ^
;
¨¨^ _
}
≠≠ 
else
ÆÆ 
if
ÆÆ 
(
ÆÆ 
action
ÆÆ 
==
ÆÆ  "
PermissionEnum
ÆÆ# 1
.
ÆÆ1 2
Edit
ÆÆ2 6
&&
ÆÆ7 9
!
ÆÆ: ;"
hasInvoiceEditAccess
ÆÆ; O
)
ÆÆO P
{
ØØ 
return
∞∞ 
RedirectToAction
∞∞ +
(
∞∞+ ,
AppConstants
∞∞, 8
.
∞∞8 9
AccessRestriction
∞∞9 J
,
∞∞J K
AppConstants
∞∞L X
.
∞∞X Y
Home
∞∞Y ]
)
∞∞] ^
;
∞∞^ _
}
±± 
else
≤≤ 
if
≤≤ 
(
≤≤ 
action
≤≤ 
==
≤≤  "
PermissionEnum
≤≤# 1
.
≤≤1 2
Add
≤≤2 5
&&
≤≤6 8
!
≤≤9 :!
hasInvoiceAddAccess
≤≤: M
)
≤≤M N
{
≥≥ 
return
¥¥ 
RedirectToAction
¥¥ +
(
¥¥+ ,
AppConstants
¥¥, 8
.
¥¥8 9
AccessRestriction
¥¥9 J
,
¥¥J K
AppConstants
¥¥L X
.
¥¥X Y
Home
¥¥Y ]
)
¥¥] ^
;
¥¥^ _
}
µµ 
if
∂∂ 
(
∂∂ 
masterInvoice
∂∂ !
.
∂∂! "
TransactionModeId
∂∂" 3
==
∂∂4 6
$num
∂∂7 8
)
∂∂8 9
{
∑∑ 
masterInvoice
∏∏ !
.
∏∏! "!
TransactionStatusId
∏∏" 5
=
∏∏6 7
masterInvoice
∏∏8 E
.
∏∏E F%
CashTransactionStatusId
∏∏F ]
??
∏∏^ `
$num
∏∏a b
;
∏∏b c
masterInvoice
ππ !
.
ππ! "
TransactionDate
ππ" 1
=
ππ2 3
masterInvoice
ππ4 A
.
ππA B!
CashTransactionDate
ππB U
;
ππU V
masterInvoice
∫∫ !
.
∫∫! "
Amount
∫∫" (
=
∫∫) *
masterInvoice
∫∫+ 8
.
∫∫8 9

CashAmount
∫∫9 C
??
∫∫D F
$num
∫∫G H
;
∫∫H I
}
ªª 
else
ºº 
if
ºº 
(
ºº 
masterInvoice
ºº &
.
ºº& '
TransactionModeId
ºº' 8
==
ºº9 ;
$num
ºº< =
)
ºº= >
{
ΩΩ 
masterInvoice
ææ !
.
ææ! "!
TransactionStatusId
ææ" 5
=
ææ6 7
masterInvoice
ææ8 E
.
ææE F'
ChequeTransactionStatusId
ææF _
??
ææ` b
$num
ææc d
;
ææd e
masterInvoice
øø !
.
øø! "
TransactionDate
øø" 1
=
øø2 3
masterInvoice
øø4 A
.
øøA B#
ChequeTransactionDate
øøB W
;
øøW X
masterInvoice
¿¿ !
.
¿¿! "
Amount
¿¿" (
=
¿¿) *
masterInvoice
¿¿+ 8
.
¿¿8 9
ChequeAmount
¿¿9 E
??
¿¿F H
$num
¿¿I J
;
¿¿J K
}
¡¡ 
else
¬¬ 
if
¬¬ 
(
¬¬ 
masterInvoice
¬¬ &
.
¬¬& '
TransactionModeId
¬¬' 8
==
¬¬9 ;
$num
¬¬< =
)
¬¬= >
{
√√ 
masterInvoice
ƒƒ !
.
ƒƒ! "!
TransactionStatusId
ƒƒ" 5
=
ƒƒ6 7
masterInvoice
ƒƒ8 E
.
ƒƒE F%
CardTransactionStatusId
ƒƒF ]
??
ƒƒ^ `
$num
ƒƒa b
;
ƒƒb c
masterInvoice
≈≈ !
.
≈≈! "
TransactionDate
≈≈" 1
=
≈≈2 3
masterInvoice
≈≈4 A
.
≈≈A B!
CardTransactionDate
≈≈B U
;
≈≈U V
masterInvoice
∆∆ !
.
∆∆! "
Amount
∆∆" (
=
∆∆) *
masterInvoice
∆∆+ 8
.
∆∆8 9

CardAmount
∆∆9 C
??
∆∆D F
$num
∆∆G H
;
∆∆H I
masterInvoice
«« !
.
««! "
TransactionId
««" /
=
««0 1
masterInvoice
««2 ?
.
««? @
CardTransactionId
««@ Q
;
««Q R
}
»» 
else
…… 
if
…… 
(
…… 
masterInvoice
…… &
.
……& '
TransactionModeId
……' 8
==
……9 ;
$num
……< =
)
……= >
{
   
masterInvoice
ÀÀ !
.
ÀÀ! "!
TransactionStatusId
ÀÀ" 5
=
ÀÀ6 7
masterInvoice
ÀÀ8 E
.
ÀÀE F%
BankTransactionStatusId
ÀÀF ]
??
ÀÀ^ `
$num
ÀÀa b
;
ÀÀb c
masterInvoice
ÃÃ !
.
ÃÃ! "
TransactionDate
ÃÃ" 1
=
ÃÃ2 3
masterInvoice
ÃÃ4 A
.
ÃÃA B!
BankTransactionDate
ÃÃB U
;
ÃÃU V
masterInvoice
ÕÕ !
.
ÕÕ! "
Amount
ÕÕ" (
=
ÕÕ) *
masterInvoice
ÕÕ+ 8
.
ÕÕ8 9

BankAmount
ÕÕ9 C
??
ÕÕD F
$num
ÕÕG H
;
ÕÕH I
masterInvoice
ŒŒ !
.
ŒŒ! "
TransactionId
ŒŒ" /
=
ŒŒ0 1
masterInvoice
ŒŒ2 ?
.
ŒŒ? @
BankTransactionId
ŒŒ@ Q
;
ŒŒQ R
}
œœ 
if
““ 
(
““ 
masterInvoice
““ !
.
““! "
Id
““" $
==
““% '
$num
““( )
)
““) *
masterInvoice
”” !
.
””! "
	CreatedBy
””" +
=
””, -
_helper
””. 5
.
””5 6
GetLoggedInUserId
””6 G
(
””G H
)
””H I
;
””I J
masterInvoice
‘‘ 
.
‘‘ 

ModifiedBy
‘‘ (
=
‘‘) *
_helper
‘‘+ 2
.
‘‘2 3
GetLoggedInUserId
‘‘3 D
(
‘‘D E
)
‘‘E F
;
‘‘F G
if
÷÷ 
(
÷÷ 
masterInvoice
÷÷ !
.
÷÷! "
Document
÷÷" *
!=
÷÷+ -
null
÷÷. 2
&&
÷÷3 5
masterInvoice
÷÷6 C
.
÷÷C D
Document
÷÷D L
.
÷÷L M
Files
÷÷M R
!=
÷÷S U
null
÷÷V Z
)
÷÷Z [
{
◊◊ 
List
ÿÿ 
<
ÿÿ !
MasterDocumentModel
ÿÿ ,
>
ÿÿ, -
docs
ÿÿ. 2
=
ÿÿ3 4
_helper
ÿÿ5 <
.
ÿÿ< =

FileUpload
ÿÿ= G
(
ÿÿG H
masterInvoice
ÿÿH U
.
ÿÿU V
Document
ÿÿV ^
)
ÿÿ^ _
;
ÿÿ_ `
masterInvoice
ŸŸ !
.
ŸŸ! "
uploadDocument
ŸŸ" 0
=
ŸŸ1 2
docs
ŸŸ3 7
;
ŸŸ7 8
masterInvoice
⁄⁄ !
.
⁄⁄! "
Document
⁄⁄" *
=
⁄⁄+ ,
null
⁄⁄- 1
;
⁄⁄1 2
}
€€ 
HttpContext
ﬁﬁ 
.
ﬁﬁ 
Request
ﬁﬁ #
.
ﬁﬁ# $
Cookies
ﬁﬁ$ +
.
ﬁﬁ+ ,
TryGetValue
ﬁﬁ, 7
(
ﬁﬁ7 8

UserHelper
ﬁﬁ8 B
.
ﬁﬁB C
EltizamToken
ﬁﬁC O
,
ﬁﬁO P
out
ﬁﬁQ T
string
ﬁﬁU [
token
ﬁﬁ\ a
)
ﬁﬁa b
;
ﬁﬁb c
APIRepository
ﬂﬂ 
objapi
ﬂﬂ $
=
ﬂﬂ% &
new
ﬂﬂ' *
(
ﬂﬂ* +
_cofiguration
ﬂﬂ+ 8
)
ﬂﬂ8 9
;
ﬂﬂ9 :!
HttpResponseMessage
·· #
responseMessage
··$ 3
=
··4 5
objapi
··6 <
.
··< =
APICommunication
··= M
(
··M N
APIURLHelper
··N Z
.
··Z [$
UpsertValuationInvoice
··[ q
,
··q r

HttpMethod
··s }
.
··} ~
Post··~ Ç
,··Ç É
token··Ñ â
,··â ä
new··ã é
StringContent··è ú
(··ú ù
JsonConvert··ù ®
.··® ©
SerializeObject··© ∏
(··∏ π
masterInvoice··π ∆
)··∆ «
)··« »
)··» …
.··…  
Result··  –
;··– —
if
„„ 
(
„„ 
responseMessage
„„ #
.
„„# $!
IsSuccessStatusCode
„„$ 7
)
„„7 8
{
‰‰ 
string
ÂÂ 
jsonResponse
ÂÂ '
=
ÂÂ( )
responseMessage
ÂÂ* 9
.
ÂÂ9 :
Content
ÂÂ: A
.
ÂÂA B
ReadAsStringAsync
ÂÂB S
(
ÂÂS T
)
ÂÂT U
.
ÂÂU V
Result
ÂÂV \
;
ÂÂ\ ]
TempData
ÊÊ 
[
ÊÊ 

UserHelper
ÊÊ '
.
ÊÊ' (
SuccessMessage
ÊÊ( 6
]
ÊÊ6 7
=
ÊÊ8 9
Convert
ÊÊ: A
.
ÊÊA B
ToString
ÊÊB J
(
ÊÊJ K$
_stringLocalizerShared
ÊÊK a
[
ÊÊa b
$str
ÊÊb v
]
ÊÊv w
)
ÊÊw x
;
ÊÊx y
}
ÁÁ 
else
ËË 
TempData
ÈÈ 
[
ÈÈ 

UserHelper
ÈÈ '
.
ÈÈ' (
ErrorMessage
ÈÈ( 4
]
ÈÈ4 5
=
ÈÈ6 7
Convert
ÈÈ8 ?
.
ÈÈ? @
ToString
ÈÈ@ H
(
ÈÈH I
responseMessage
ÈÈI X
.
ÈÈX Y
Content
ÈÈY `
.
ÈÈ` a
ReadAsStringAsync
ÈÈa r
(
ÈÈr s
)
ÈÈs t
.
ÈÈt u
Result
ÈÈu {
)
ÈÈ{ |
;
ÈÈ| }
}
ÎÎ 
catch
ÏÏ 
(
ÏÏ 
	Exception
ÏÏ 
e
ÏÏ 
)
ÏÏ 
{
ÌÌ 
_helper
ÓÓ 
.
ÓÓ 
LogExceptions
ÓÓ %
(
ÓÓ% &
e
ÓÓ& '
)
ÓÓ' (
;
ÓÓ( )
TempData
ÔÔ 
[
ÔÔ 

UserHelper
ÔÔ #
.
ÔÔ# $
ErrorMessage
ÔÔ$ 0
]
ÔÔ0 1
=
ÔÔ2 3
Convert
ÔÔ4 ;
.
ÔÔ; <
ToString
ÔÔ< D
(
ÔÔD E
e
ÔÔE F
.
ÔÔF G

StackTrace
ÔÔG Q
)
ÔÔQ R
;
ÔÔR S
}
 
return
ÒÒ 
Redirect
ÒÒ 
(
ÒÒ 
$"
ÒÒ 
$str
ÒÒ J
{
ÒÒJ K
masterInvoice
ÒÒK X
.
ÒÒX Y 
ValuationRequestId
ÒÒY k
}
ÒÒk l
"
ÒÒl m
)
ÒÒm n
;
ÒÒn o
}
ÛÛ 	
[
ˆˆ 	
HttpPost
ˆˆ	 
]
ˆˆ 
[
˜˜ 	
Route
˜˜	 
(
˜˜ 
$str
˜˜ 5
)
˜˜5 6
]
˜˜6 7
public
¯¯ 
IActionResult
¯¯ !
UpdateRequestStatus
¯¯ 0
(
¯¯0 1
int
¯¯1 4
id
¯¯5 7
,
¯¯7 8.
 ValutionRequestStatusChangeModel
¯¯9 Y 
appoveRequestModel
¯¯Z l
)
¯¯l m
{
˘˘ 	
try
˙˙ 
{
˚˚ 
HttpContext
¸¸ 
.
¸¸ 
Request
¸¸ #
.
¸¸# $
Cookies
¸¸$ +
.
¸¸+ ,
TryGetValue
¸¸, 7
(
¸¸7 8

UserHelper
¸¸8 B
.
¸¸B C
EltizamToken
¸¸C O
,
¸¸O P
out
¸¸Q T
string
¸¸U [
token
¸¸\ a
)
¸¸a b
;
¸¸b c
APIRepository
˝˝ 
objapi
˝˝ $
=
˝˝% &
new
˝˝' *
(
˝˝* +
_cofiguration
˝˝+ 8
)
˝˝8 9
;
˝˝9 :.
 ValutionRequestStatusChangeModel
ˇˇ 0&
valuationRequestModelNew
ˇˇ1 I
=
ˇˇJ K
new
ˇˇL O.
 ValutionRequestStatusChangeModel
ˇˇP p
(
ˇˇp q
)
ˇˇq r
;
ˇˇr s&
valuationRequestModelNew
ÄÄ (
.
ÄÄ( )
Id
ÄÄ) +
=
ÄÄ, -
id
ÄÄ. 0
;
ÄÄ0 1&
valuationRequestModelNew
ÅÅ (
.
ÅÅ( )
StatusId
ÅÅ) 1
=
ÅÅ2 3 
appoveRequestModel
ÅÅ4 F
.
ÅÅF G
StatusId
ÅÅG O
;
ÅÅO P&
valuationRequestModelNew
ÇÇ (
.
ÇÇ( )
ApproverComment
ÇÇ) 8
=
ÇÇ9 : 
appoveRequestModel
ÇÇ; M
.
ÇÇM N
ApproverComment
ÇÇN ]
;
ÇÇ] ^!
HttpResponseMessage
ÑÑ #
responseMessage
ÑÑ$ 3
=
ÑÑ4 5
objapi
ÑÑ6 <
.
ÑÑ< =
APICommunication
ÑÑ= M
(
ÑÑM N
APIURLHelper
ÑÑN Z
.
ÑÑZ [!
UpdateRequestStatus
ÑÑ[ n
,
ÑÑn o

HttpMethod
ÑÑp z
.
ÑÑz {
Post
ÑÑ{ 
,ÑÑ Ä
tokenÑÑÅ Ü
,ÑÑÜ á
newÑÑà ã
StringContentÑÑå ô
(ÑÑô ö
JsonConvertÑÑö •
.ÑÑ• ¶
SerializeObjectÑÑ¶ µ
(ÑÑµ ∂(
valuationRequestModelNewÑÑ∂ Œ
)ÑÑŒ œ
)ÑÑœ –
)ÑÑ– —
.ÑÑ— “
ResultÑÑ“ ÿ
;ÑÑÿ Ÿ
if
ÜÜ 
(
ÜÜ 
responseMessage
ÜÜ #
.
ÜÜ# $!
IsSuccessStatusCode
ÜÜ$ 7
)
ÜÜ7 8
{
áá 
TempData
àà 
[
àà 

UserHelper
àà '
.
àà' (
SuccessMessage
àà( 6
]
àà6 7
=
àà8 9
Convert
àà: A
.
ààA B
ToString
ààB J
(
ààJ K$
_stringLocalizerShared
ààK a
[
ààa b
$str
ààb v
]
ààv w
)
ààw x
;
ààx y
string
ââ 
jsonResponse
ââ '
=
ââ( )
responseMessage
ââ* 9
.
ââ9 :
Content
ââ: A
.
ââA B
ReadAsStringAsync
ââB S
(
ââS T
)
ââT U
.
ââU V
Result
ââV \
;
ââ\ ]

ModelState
ää 
.
ää 
Clear
ää $
(
ää$ %
)
ää% &
;
ää& '
return
ãã 
RedirectToAction
ãã +
(
ãã+ ,
nameof
ãã, 2
(
ãã2 3
ValuationRequests
ãã3 D
)
ããD E
)
ããE F
;
ããF G
}
åå 
else
çç 
TempData
éé 
[
éé 

UserHelper
éé '
.
éé' (
ErrorMessage
éé( 4
]
éé4 5
=
éé6 7
Convert
éé8 ?
.
éé? @
ToString
éé@ H
(
ééH I$
_stringLocalizerShared
ééI _
[
éé_ `
$str
éé` g
]
éég h
)
ééh i
;
ééi j
}
èè 
catch
êê 
(
êê 
	Exception
êê 
e
êê 
)
êê 
{
ëë 
_helper
íí 
.
íí 
LogExceptions
íí %
(
íí% &
e
íí& '
)
íí' (
;
íí( )
ViewBag
ìì 
.
ìì 
errormessage
ìì $
=
ìì% &
Convert
ìì' .
.
ìì. /
ToString
ìì/ 7
(
ìì7 8
e
ìì8 9
.
ìì9 :

StackTrace
ìì: D
)
ììD E
;
ììE F

ModelState
îî 
.
îî 
Clear
îî  
(
îî  !
)
îî! "
;
îî" #
return
ïï 
View
ïï 
(
ïï 
nameof
ïï "
(
ïï" #
ValuationRequests
ïï# 4
)
ïï4 5
)
ïï5 6
;
ïï6 7
}
ññ 

ModelState
óó 
.
óó 
Clear
óó 
(
óó 
)
óó 
;
óó 
return
òò 
RedirectToAction
òò #
(
òò# $
nameof
òò$ *
(
òò* +
ValuationRequests
òò+ <
)
òò< =
)
òò= >
;
òò> ?
}
ôô 	
[
úú 	
HttpPost
úú	 
]
úú 
[
ùù 	
Route
ùù	 
(
ùù 
$str
ùù :
)
ùù: ;
]
ùù; <
public
ûû 
IActionResult
ûû &
ValuationAssesmentManage
ûû 5
(
ûû5 6
int
ûû6 9
id
ûû: <
,
ûû< =+
ValuationAssesmentActionModel
ûû> [ 
valuationAssesment
ûû\ n
)
ûûn o
{
üü 	
try
†† 
{
°° 
var
££ 
action
££ 
=
££ 
id
££ 
==
££  "
null
££# '
?
££( )
PermissionEnum
££* 8
.
££8 9
Add
££9 <
:
££= >
PermissionEnum
££? M
.
££M N
Edit
££N R
;
££R S
var
§§ 
	requestId
§§ 
=
§§ 
id
§§  "
;
§§" # 
valuationAssesment
•• "
.
••" #
SiteDescription
••# 2
.
••2 3 
ValuationRequestId
••3 E
=
••F G
	requestId
••H Q
;
••Q R 
valuationAssesment
¶¶ "
.
¶¶" #%
comparableEvidenceModel
¶¶# :
.
¶¶: ;
	RequestId
¶¶; D
=
¶¶E F
	requestId
¶¶G P
;
¶¶P Q 
valuationAssesment
ßß "
.
ßß" #'
valuationAssessementModel
ßß# <
.
ßß< =
	RequestId
ßß= F
=
ßßG H
	requestId
ßßI R
;
ßßR S
if
©© 
(
©©  
valuationAssesment
©© &
.
©©& '
SiteDescription
©©' 6
.
©©6 7
Document
©©7 ?
!=
©©@ B
null
©©C G
&&
©©H J 
valuationAssesment
©©K ]
.
©©] ^
SiteDescription
©©^ m
.
©©m n
Document
©©n v
.
©©v w
Files
©©w |
!=
©©} 
null©©Ä Ñ
)©©Ñ Ö
{
™™ 
List
´´ 
<
´´ !
MasterDocumentModel
´´ ,
>
´´, -
docs
´´. 2
=
´´3 4
_helper
´´5 <
.
´´< =

FileUpload
´´= G
(
´´G H 
valuationAssesment
´´H Z
.
´´Z [
SiteDescription
´´[ j
.
´´j k
Document
´´k s
)
´´s t
;
´´t u 
valuationAssesment
¨¨ &
.
¨¨& '
SiteDescription
¨¨' 6
.
¨¨6 7
uploadDocument
¨¨7 E
=
¨¨F G
docs
¨¨H L
;
¨¨L M 
valuationAssesment
≠≠ &
.
≠≠& '
SiteDescription
≠≠' 6
.
≠≠6 7
Document
≠≠7 ?
=
≠≠@ A
null
≠≠B F
;
≠≠F G
}
ÆÆ 
if
ØØ 
(
ØØ  
valuationAssesment
ØØ &
.
ØØ& '%
comparableEvidenceModel
ØØ' >
.
ØØ> ?
Document
ØØ? G
!=
ØØH J
null
ØØK O
&&
ØØP R 
valuationAssesment
ØØS e
.
ØØe f%
comparableEvidenceModel
ØØf }
.
ØØ} ~
DocumentØØ~ Ü
.ØØÜ á
FilesØØá å
!=ØØç è
nullØØê î
)ØØî ï
{
∞∞ 
List
±± 
<
±± !
MasterDocumentModel
±± ,
>
±±, -
docs
±±. 2
=
±±3 4
_helper
±±5 <
.
±±< =

FileUpload
±±= G
(
±±G H 
valuationAssesment
±±H Z
.
±±Z [%
comparableEvidenceModel
±±[ r
.
±±r s
Document
±±s {
)
±±{ |
;
±±| } 
valuationAssesment
≤≤ &
.
≤≤& '%
comparableEvidenceModel
≤≤' >
.
≤≤> ?
uploadDocument
≤≤? M
=
≤≤N O
docs
≤≤P T
;
≤≤T U 
valuationAssesment
≥≥ &
.
≥≥& '%
comparableEvidenceModel
≥≥' >
.
≥≥> ?
Document
≥≥? G
=
≥≥H I
null
≥≥J N
;
≥≥N O
}
¥¥ 
if
µµ 
(
µµ  
valuationAssesment
µµ &
.
µµ& ''
valuationAssessementModel
µµ' @
.
µµ@ A
Document
µµA I
!=
µµJ L
null
µµM Q
&&
µµR T 
valuationAssesment
µµU g
.
µµg h(
valuationAssessementModelµµh Å
.µµÅ Ç
DocumentµµÇ ä
.µµä ã
Filesµµã ê
!=µµë ì
nullµµî ò
)µµò ô
{
∂∂ 
List
∑∑ 
<
∑∑ !
MasterDocumentModel
∑∑ ,
>
∑∑, -
docs
∑∑. 2
=
∑∑3 4
_helper
∑∑5 <
.
∑∑< =

FileUpload
∑∑= G
(
∑∑G H 
valuationAssesment
∑∑H Z
.
∑∑Z ['
valuationAssessementModel
∑∑[ t
.
∑∑t u
Document
∑∑u }
)
∑∑} ~
;
∑∑~  
valuationAssesment
∏∏ &
.
∏∏& ''
valuationAssessementModel
∏∏' @
.
∏∏@ A
uploadDocument
∏∏A O
=
∏∏P Q
docs
∏∏R V
;
∏∏V W 
valuationAssesment
ππ &
.
ππ& ''
valuationAssessementModel
ππ' @
.
ππ@ A
Document
ππA I
=
ππJ K
null
ππL P
;
ππP Q
}
∫∫ 
int
ªª 
roleId
ªª 
=
ªª 
_helper
ªª $
.
ªª$ %
GetLoggedInRoleId
ªª% 6
(
ªª6 7
)
ªª7 8
;
ªª8 9
if
ΩΩ 
(
ΩΩ 
!
ΩΩ 
CheckRoleAccess
ΩΩ $
(
ΩΩ$ %"
ModulePermissionEnum
ΩΩ% 9
.
ΩΩ9 :
ValuationRequest
ΩΩ: J
,
ΩΩJ K
action
ΩΩL R
,
ΩΩR S
roleId
ΩΩT Z
)
ΩΩZ [
)
ΩΩ[ \
return
ææ 
RedirectToAction
ææ +
(
ææ+ ,
AppConstants
ææ, 8
.
ææ8 9
AccessRestriction
ææ9 J
,
ææJ K
AppConstants
ææL X
.
ææX Y
Home
ææY ]
)
ææ] ^
;
ææ^ _
ViewBag
¡¡ 
.
¡¡ 
Access
¡¡ 
=
¡¡  %
GetRoleAccessValuations
¡¡! 8
(
¡¡8 9"
ModulePermissionEnum
¡¡9 M
.
¡¡M N
ValuationRequest
¡¡N ^
,
¡¡^ _
roleId
¡¡` f
,
¡¡f g
SubModuleEnum
¡¡h u
.
¡¡u v
ValuationRequest¡¡v Ü
)¡¡Ü á
;¡¡á à
ViewBag
¬¬ 
.
¬¬ 
SiteDescription
¬¬ '
=
¬¬( )%
GetRoleAccessValuations
¬¬* A
(
¬¬A B"
ModulePermissionEnum
¬¬B V
.
¬¬V W
ValuationRequest
¬¬W g
,
¬¬g h
roleId
¬¬i o
,
¬¬o p
SubModuleEnum
¬¬q ~
.
¬¬~ 
SiteDescription¬¬ é
)¬¬é è
;¬¬è ê
ViewBag
√√ 
.
√√ !
ComparableEvidences
√√ +
=
√√, -%
GetRoleAccessValuations
√√. E
(
√√E F"
ModulePermissionEnum
√√F Z
.
√√Z [
ValuationRequest
√√[ k
,
√√k l
roleId
√√m s
,
√√s t
SubModuleEnum√√u Ç
.√√Ç É#
ComparableEvidences√√É ñ
)√√ñ ó
;√√ó ò
ViewBag
ƒƒ 
.
ƒƒ "
ValuationAssessement
ƒƒ ,
=
ƒƒ- .%
GetRoleAccessValuations
ƒƒ/ F
(
ƒƒF G"
ModulePermissionEnum
ƒƒG [
.
ƒƒ[ \
ValuationRequest
ƒƒ\ l
,
ƒƒl m
roleId
ƒƒn t
,
ƒƒt u
SubModuleEnumƒƒv É
.ƒƒÉ Ñ$
ValuationAssessementƒƒÑ ò
)ƒƒò ô
;ƒƒô ö
bool
»» *
hasSiteDescriptionViewAccess
»» 1
=
»»2 3
ViewBag
»»4 ;
.
»»; <
SiteDescription
»»< K
?
»»K L
.
»»L M
View
»»M Q
??
»»R T
false
»»U Z
;
»»Z [
bool
…… *
hasSiteDescriptionEditAccess
…… 1
=
……2 3
ViewBag
……4 ;
.
……; <
SiteDescription
……< K
?
……K L
.
……L M
Edit
……M Q
??
……R T
false
……U Z
;
……Z [
bool
   )
hasSiteDescriptionAddAccess
   0
=
  1 2
ViewBag
  3 :
.
  : ;
SiteDescription
  ; J
?
  J K
.
  K L
Add
  L O
??
  P R
false
  S X
;
  X Y
if
ÃÃ 
(
ÃÃ 
action
ÃÃ 
==
ÃÃ 
PermissionEnum
ÃÃ ,
.
ÃÃ, -
View
ÃÃ- 1
&&
ÃÃ2 4
!
ÃÃ5 6*
hasSiteDescriptionViewAccess
ÃÃ6 R
)
ÃÃR S
{
ÕÕ 
return
ŒŒ 
RedirectToAction
ŒŒ +
(
ŒŒ+ ,
AppConstants
ŒŒ, 8
.
ŒŒ8 9
AccessRestriction
ŒŒ9 J
,
ŒŒJ K
AppConstants
ŒŒL X
.
ŒŒX Y
Home
ŒŒY ]
)
ŒŒ] ^
;
ŒŒ^ _
}
œœ 
else
–– 
if
–– 
(
–– 
action
–– 
==
––  "
PermissionEnum
––# 1
.
––1 2
Edit
––2 6
&&
––7 9
!
––: ;*
hasSiteDescriptionViewAccess
––; W
)
––W X
{
—— 
return
““ 
RedirectToAction
““ +
(
““+ ,
AppConstants
““, 8
.
““8 9
AccessRestriction
““9 J
,
““J K
AppConstants
““L X
.
““X Y
Home
““Y ]
)
““] ^
;
““^ _
}
”” 
else
‘‘ 
if
‘‘ 
(
‘‘ 
action
‘‘ 
==
‘‘  "
PermissionEnum
‘‘# 1
.
‘‘1 2
Add
‘‘2 5
&&
‘‘6 8
!
‘‘9 :*
hasSiteDescriptionViewAccess
‘‘: V
)
‘‘V W
{
’’ 
return
÷÷ 
RedirectToAction
÷÷ +
(
÷÷+ ,
AppConstants
÷÷, 8
.
÷÷8 9
AccessRestriction
÷÷9 J
,
÷÷J K
AppConstants
÷÷L X
.
÷÷X Y
Home
÷÷Y ]
)
÷÷] ^
;
÷÷^ _
}
◊◊ 
if
⁄⁄ 
(
⁄⁄  
valuationAssesment
⁄⁄ &
.
⁄⁄& '
SiteDescription
⁄⁄' 6
.
⁄⁄6 7
Id
⁄⁄7 9
==
⁄⁄: <
$num
⁄⁄= >
)
⁄⁄> ? 
valuationAssesment
€€ &
.
€€& '
SiteDescription
€€' 6
.
€€6 7
	CreatedBy
€€7 @
=
€€A B
_helper
€€C J
.
€€J K
GetLoggedInUserId
€€K \
(
€€\ ]
)
€€] ^
;
€€^ _ 
valuationAssesment
‹‹ "
.
‹‹" #
SiteDescription
‹‹# 2
.
‹‹2 3

ModifiedBy
‹‹3 =
=
‹‹> ?
_helper
‹‹@ G
.
‹‹G H
GetLoggedInUserId
‹‹H Y
(
‹‹Y Z
)
‹‹Z [
;
‹‹[ \
if
›› 
(
››  
valuationAssesment
›› &
.
››& '%
comparableEvidenceModel
››' >
.
››> ?
Id
››? A
==
››B D
$num
››E F
)
››F G 
valuationAssesment
ﬁﬁ &
.
ﬁﬁ& '%
comparableEvidenceModel
ﬁﬁ' >
.
ﬁﬁ> ?
	CreatedBy
ﬁﬁ? H
=
ﬁﬁI J
_helper
ﬁﬁK R
.
ﬁﬁR S
GetLoggedInUserId
ﬁﬁS d
(
ﬁﬁd e
)
ﬁﬁe f
;
ﬁﬁf g 
valuationAssesment
ﬂﬂ "
.
ﬂﬂ" #%
comparableEvidenceModel
ﬂﬂ# :
.
ﬂﬂ: ;

ModifiedBy
ﬂﬂ; E
=
ﬂﬂF G
_helper
ﬂﬂH O
.
ﬂﬂO P
GetLoggedInUserId
ﬂﬂP a
(
ﬂﬂa b
)
ﬂﬂb c
;
ﬂﬂc d
if
‡‡ 
(
‡‡  
valuationAssesment
‡‡ &
.
‡‡& ''
valuationAssessementModel
‡‡' @
.
‡‡@ A
Id
‡‡A C
==
‡‡D F
$num
‡‡G H
)
‡‡H I 
valuationAssesment
·· &
.
··& ''
valuationAssessementModel
··' @
.
··@ A
	CreatedBy
··A J
=
··K L
_helper
··M T
.
··T U
GetLoggedInUserId
··U f
(
··f g
)
··g h
;
··h i 
valuationAssesment
‚‚ "
.
‚‚" #'
valuationAssessementModel
‚‚# <
.
‚‚< =

ModifiedBy
‚‚= G
=
‚‚H I
_helper
‚‚J Q
.
‚‚Q R
GetLoggedInUserId
‚‚R c
(
‚‚c d
)
‚‚d e
;
‚‚e f
HttpContext
‰‰ 
.
‰‰ 
Request
‰‰ #
.
‰‰# $
Cookies
‰‰$ +
.
‰‰+ ,
TryGetValue
‰‰, 7
(
‰‰7 8

UserHelper
‰‰8 B
.
‰‰B C
EltizamToken
‰‰C O
,
‰‰O P
out
‰‰Q T
string
‰‰U [
token
‰‰\ a
)
‰‰a b
;
‰‰b c
APIRepository
ÂÂ 
objapi
ÂÂ $
=
ÂÂ% &
new
ÂÂ' *
(
ÂÂ* +
_cofiguration
ÂÂ+ 8
)
ÂÂ8 9
;
ÂÂ9 :!
HttpResponseMessage
ÁÁ #
responseMessage
ÁÁ$ 3
=
ÁÁ4 5
objapi
ÁÁ6 <
.
ÁÁ< =
APICommunication
ÁÁ= M
(
ÁÁM N
APIURLHelper
ÁÁN Z
.
ÁÁZ [ 
ValuationAssesment
ÁÁ[ m
,
ÁÁm n

HttpMethod
ÁÁo y
.
ÁÁy z
Post
ÁÁz ~
,
ÁÁ~ 
tokenÁÁÄ Ö
,ÁÁÖ Ü
newÁÁá ä
StringContentÁÁã ò
(ÁÁò ô
JsonConvertÁÁô §
.ÁÁ§ •
SerializeObjectÁÁ• ¥
(ÁÁ¥ µ"
valuationAssesmentÁÁµ «
)ÁÁ« »
)ÁÁ» …
)ÁÁ…  
.ÁÁ  À
ResultÁÁÀ —
;ÁÁ— “
if
ÈÈ 
(
ÈÈ 
responseMessage
ÈÈ #
.
ÈÈ# $!
IsSuccessStatusCode
ÈÈ$ 7
)
ÈÈ7 8
{
ÍÍ 
string
ÎÎ 
jsonResponse
ÎÎ '
=
ÎÎ( )
responseMessage
ÎÎ* 9
.
ÎÎ9 :
Content
ÎÎ: A
.
ÎÎA B
ReadAsStringAsync
ÎÎB S
(
ÎÎS T
)
ÎÎT U
.
ÎÎU V
Result
ÎÎV \
;
ÎÎ\ ]
TempData
ÏÏ 
[
ÏÏ 

UserHelper
ÏÏ '
.
ÏÏ' (
SuccessMessage
ÏÏ( 6
]
ÏÏ6 7
=
ÏÏ8 9
Convert
ÏÏ: A
.
ÏÏA B
ToString
ÏÏB J
(
ÏÏJ K$
_stringLocalizerShared
ÏÏK a
[
ÏÏa b
$str
ÏÏb v
]
ÏÏv w
)
ÏÏw x
;
ÏÏx y
}
ÌÌ 
else
ÓÓ 
TempData
ÔÔ 
[
ÔÔ 

UserHelper
ÔÔ '
.
ÔÔ' (
ErrorMessage
ÔÔ( 4
]
ÔÔ4 5
=
ÔÔ6 7
Convert
ÔÔ8 ?
.
ÔÔ? @
ToString
ÔÔ@ H
(
ÔÔH I
responseMessage
ÔÔI X
.
ÔÔX Y
Content
ÔÔY `
.
ÔÔ` a
ReadAsStringAsync
ÔÔa r
(
ÔÔr s
)
ÔÔs t
.
ÔÔt u
Result
ÔÔu {
)
ÔÔ{ |
;
ÔÔ| }
}
ÒÒ 
catch
ÚÚ 
(
ÚÚ 
	Exception
ÚÚ 
e
ÚÚ 
)
ÚÚ 
{
ÛÛ 
_helper
ÙÙ 
.
ÙÙ 
LogExceptions
ÙÙ %
(
ÙÙ% &
e
ÙÙ& '
)
ÙÙ' (
;
ÙÙ( )
TempData
ıı 
[
ıı 

UserHelper
ıı #
.
ıı# $
ErrorMessage
ıı$ 0
]
ıı0 1
=
ıı2 3
Convert
ıı4 ;
.
ıı; <
ToString
ıı< D
(
ııD E
e
ııE F
.
ııF G

StackTrace
ııG Q
)
ııQ R
;
ııR S
}
ˆˆ 
return
¯¯ 
Redirect
¯¯ 
(
¯¯ 
$"
¯¯ 
$str
¯¯ J
{
¯¯J K 
valuationAssesment
¯¯K ]
.
¯¯] ^
SiteDescription
¯¯^ m
.
¯¯m n!
ValuationRequestId¯¯n Ä
}¯¯Ä Å
"¯¯Å Ç
)¯¯Ç É
;¯¯É Ñ
}
˘˘ 	
[
˚˚ 	
HttpGet
˚˚	 
]
˚˚ 
public
¸¸ 
IActionResult
¸¸ +
DeleteSiteDescriptionDocument
¸¸ :
(
¸¸: ;
int
¸¸; >
id
¸¸? A
,
¸¸A B
string
¸¸C I
?
¸¸I J
fileName
¸¸K S
)
¸¸S T
{
˝˝ 	
try
˛˛ 
{
ˇˇ 
int
ÅÅ 
isFileDelete
ÅÅ  
=
ÅÅ! "

DeleteFile
ÅÅ# -
(
ÅÅ- .
id
ÅÅ. 0
,
ÅÅ0 1
fileName
ÅÅ2 :
)
ÅÅ: ;
;
ÅÅ; <
HttpContext
ÇÇ 
.
ÇÇ 
Request
ÇÇ #
.
ÇÇ# $
Cookies
ÇÇ$ +
.
ÇÇ+ ,
TryGetValue
ÇÇ, 7
(
ÇÇ7 8

UserHelper
ÇÇ8 B
.
ÇÇB C
EltizamToken
ÇÇC O
,
ÇÇO P
out
ÇÇQ T
string
ÇÇU [
token
ÇÇ\ a
)
ÇÇa b
;
ÇÇb c
APIRepository
ÉÉ 
objapi
ÉÉ $
=
ÉÉ% &
new
ÉÉ' *
(
ÉÉ* +
_cofiguration
ÉÉ+ 8
)
ÉÉ8 9
;
ÉÉ9 :!
HttpResponseMessage
ÑÑ #
responseMessage
ÑÑ$ 3
=
ÑÑ4 5
objapi
ÑÑ6 <
.
ÑÑ< =
APICommunication
ÑÑ= M
(
ÑÑM N
APIURLHelper
ÑÑN Z
.
ÑÑZ [
DeleteDocument
ÑÑ[ i
+
ÑÑj k
$str
ÑÑl o
+
ÑÑp q
id
ÑÑr t
,
ÑÑt u

HttpMethodÑÑv Ä
.ÑÑÄ Å
DeleteÑÑÅ á
,ÑÑá à
tokenÑÑâ é
)ÑÑé è
.ÑÑè ê
ResultÑÑê ñ
;ÑÑñ ó
if
ÜÜ 
(
ÜÜ 
responseMessage
ÜÜ #
.
ÜÜ# $!
IsSuccessStatusCode
ÜÜ$ 7
)
ÜÜ7 8
{
áá 
string
àà 
jsonResponse
àà '
=
àà( )
responseMessage
àà* 9
.
àà9 :
Content
àà: A
.
ààA B
ReadAsStringAsync
ààB S
(
ààS T
)
ààT U
.
ààU V
Result
ààV \
;
àà\ ]
TempData
ââ 
[
ââ 

UserHelper
ââ '
.
ââ' (
SuccessMessage
ââ( 6
]
ââ6 7
=
ââ8 9
Convert
ââ: A
.
ââA B
ToString
ââB J
(
ââJ K$
_stringLocalizerShared
ââK a
[
ââa b
$str
ââb v
]
ââv w
)
ââw x
;
ââx y
}
ää 
else
ãã 
TempData
åå 
[
åå 

UserHelper
åå '
.
åå' (
ErrorMessage
åå( 4
]
åå4 5
=
åå6 7
Convert
åå8 ?
.
åå? @
ToString
åå@ H
(
ååH I
responseMessage
ååI X
.
ååX Y
Content
ååY `
.
åå` a
ReadAsStringAsync
ååa r
(
åår s
)
åås t
.
ååt u
Result
ååu {
)
åå{ |
;
åå| }
}
éé 
catch
èè 
(
èè 
	Exception
èè 
e
èè 
)
èè 
{
êê 
_helper
ëë 
.
ëë 
LogExceptions
ëë %
(
ëë% &
e
ëë& '
)
ëë' (
;
ëë( )
TempData
íí 
[
íí 

UserHelper
íí #
.
íí# $
ErrorMessage
íí$ 0
]
íí0 1
=
íí2 3
Convert
íí4 ;
.
íí; <
ToString
íí< D
(
ííD E
e
ííE F
.
ííF G

StackTrace
ííG Q
)
ííQ R
;
ííR S
}
ìì 
return
ïï 
RedirectToAction
ïï #
(
ïï# $
$str
ïï$ +
)
ïï+ ,
;
ïï, -
}
ññ 	
private
≈≈ 
int
≈≈ 

DeleteFile
≈≈ 
(
≈≈ 
int
≈≈ "
id
≈≈# %
,
≈≈% &
string
≈≈' -
?
≈≈- .
fileName
≈≈/ 7
)
≈≈7 8
{
∆∆ 	
int
«« 
isDelete
«« 
=
«« 
$num
«« 
;
«« 
if
»» 
(
»» 
fileName
»» 
!=
»» 
null
»»  
||
»»! #
fileName
»»$ ,
!=
»»- /
$str
»»0 2
)
»»2 3
{
…… 
var
   
filePath
   
=
   
Path
   #
.
  # $
Combine
  $ +
(
  + ,
$str
  , =
,
  = >
fileName
  ? G
)
  G H
;
  H I
filePath
ÀÀ 
=
ÀÀ 
filePath
ÀÀ #
.
ÀÀ# $
Replace
ÀÀ$ +
(
ÀÀ+ ,
$str
ÀÀ, 0
,
ÀÀ0 1
$str
ÀÀ2 5
)
ÀÀ5 6
;
ÀÀ6 7
if
ÕÕ 
(
ÕÕ 
System
ÕÕ 
.
ÕÕ 
IO
ÕÕ 
.
ÕÕ 
File
ÕÕ "
.
ÕÕ" #
Exists
ÕÕ# )
(
ÕÕ) *
filePath
ÕÕ* 2
)
ÕÕ2 3
)
ÕÕ3 4
{
ŒŒ 
System
–– 
.
–– 
IO
–– 
.
–– 
File
–– "
.
––" #
Delete
––# )
(
––) *
filePath
––* 2
)
––2 3
;
––3 4
isDelete
—— 
=
—— 
$num
——  
;
——  !
}
““ 
}
‘‘ 
return
’’ 
isDelete
’’ 
;
’’ 
}
÷÷ 	
}
ÁÁ 
}ËË ◊P
>D:\EltizamLive\Eltizam.Web\Filters\CustomAuthorizeAttribute.cs
	namespace

 	
Eltizam


 
.

 
Web

 
.

 
Filters

 
{ 
[ 
AttributeUsage 
( 
AttributeTargets $
.$ %
Class% *
|+ ,
AttributeTargets- =
.= >
Method> D
,D E
AllowMultipleF S
=T U
trueV Z
,Z [
	Inherited\ e
=f g
trueh l
)l m
]m n
public 
class $
CustomAuthorizeAttribute &
:' (
AuthorizeAttribute) ;
,; <%
IAsyncAuthorizationFilter= V
{ 
public 
async	 
Task  
OnAuthorizationAsync (
(( )&
AuthorizationFilterContext) C
contextD K
)K L
{ 
try 
{ 
var 
user 
= 
context 
. 
HttpContext "
." #
User# '
;' (
if 
( 
! 	
user	 
. 
Identity 
. 
IsAuthenticated &
)& '
context 
. 
Result 
= 
new 
RedirectResult (
(( )
$str) :
): ;
;; <
else 
{ 
UserSessionEntity 
oUserLoggedInModel )
=* +
UtilityHelper, 9
.9 :
GetUserFromClaims: K
(K L
userL P
.P Q
ClaimsQ W
)W X
;X Y
context 
. 
HttpContext 
. 
Session  
.  !
	SetString! *
(* +

UserHelper+ 5
.5 6!
LogInUserEmailAddress6 K
,K L
oUserLoggedInModelM _
._ `
Email` e
)e f
;f g
context 
. 
HttpContext '
.' (
Session( /
./ 0
SetInt320 8
(8 9

UserHelper9 C
.C D
LogInRoleIdD O
,O P
oUserLoggedInModelQ c
.c d
RoleIdd j
)j k
;k l
if 
( 
String 
. 
IsNullOrEmpty ,
(, -
context- 4
.4 5
HttpContext5 @
.@ A
SessionA H
.H I
	GetStringI R
(R S

UserHelperS ]
.] ^
LogInUserName^ k
)k l
)l m
)m n
{ 
context   
.   
HttpContext   
.   
Session   !
.  ! "
	SetString  " +
(  + ,

UserHelper  , 6
.  6 7
LogInUserName  7 D
,  D E
oUserLoggedInModel  F X
.  X Y
UserName  Y a
)  a b
;  b c
}!! 
if## 
(## 	
oUserLoggedInModel##	 
.## 
UserId## "
>### $
$num##% &
)##& '
{$$ 
context%% 
.%% 
HttpContext%% 
.%% 
Session%% !
.%%! "
	SetString%%" +
(%%+ ,

UserHelper%%, 6
.%%6 7
LogInUserId%%7 B
,%%B C
oUserLoggedInModel%%D V
.%%V W
UserId%%W ]
.%%] ^
ToString%%^ f
(%%f g
)%%g h
)%%h i
;%%i j
}&& 
var(( 
roles((	 
=(( 
UtilityHelper(( 
.(( 
GetModuleRole(( ,
<((, -
dynamic((- 4
>((4 5
(((5 6
oUserLoggedInModel((6 H
.((H I
RoleId((I O
)((O P
;((P Q
if)) 
()) 	
roles))	 
==)) 
null)) 
))) 
{** 
APIRepository++ 
objapi++ 
=++ 
new++  
APIRepository++! .
(++. /
APIURLHelper++/ ;
.++; <
Configuration++< I
)++I J
;++J K
context-- 
.-- 
HttpContext-- 
.-- 
Request-- !
.--! "
Cookies--" )
.--) *
TryGetValue--* 5
(--5 6

UserHelper--6 @
.--@ A
EltizamToken--A M
,--M N
out--O R
string--S Y
token--Z _
)--_ `
;--` a
HttpResponseMessage// 
resRoles// "
=//# $
objapi//% +
.//+ ,
APICommunication//, <
(//< =
APIURLHelper//= I
.//I J)
GetByPermisionRoleUsingRoleId//J g
+//h i
$str//j m
+//n o
oUserLoggedInModel	//p Ç
.
//Ç É
RoleId
//É â
,
//â ä

HttpMethod
//ã ï
.
//ï ñ
Get
//ñ ô
,
//ô ö
token
//õ †
)
//† °
.
//° ¢
Result
//¢ ®
;
//® ©
if11 
(11	 

resRoles11
 
.11 
IsSuccessStatusCode11 &
)11& '
{22 
string33 
rolJson33 
=33 
resRoles33  
.33  !
Content33! (
.33( )
ReadAsStringAsync33) :
(33: ;
)33; <
.33< =
Result33= C
;33C D
var44 

data44 
=44 
JsonConvert44 
.44 
DeserializeObject44 /
<44/ 0
APIResponseEntity440 A
<44A B
IEnumerable44B M
<44M N
RolePermissionModel44N a
>44a b
>44b c
>44c d
(44d e
rolJson44e l
)44l m
;44m n
UtilityHelper55 
.55 
AddModuleRole55 "
(55" #
oUserLoggedInModel55# 5
.555 6
RoleId556 <
,55< =
data55> B
.55B C
_object55C J
)55J K
;55K L
roles66 
=66 
data66 
.66 
_object66 
;66 
}77 
}88 
oUserLoggedInModel:: 
.:: 
	UserToken:: !
=::" #
string::$ *
.::* +
Empty::+ 0
;::0 1
IsUserAuthorized<< 
(<< 
context<< 
)<< 
;<< 
}== 
}>> 
catch?? 
(??	 

	Exception??
 
)?? 
{@@ 
throwAA 	
;AA	 

}BB 
}CC 
privateEE 	
voidEE
 
IsUserAuthorizedEE 
(EE  &
AuthorizationFilterContextEE  :
contextEE; B
)EEB C
{FF 
tryGG 
{HH 
ifII 
(II 
contextII 
.II 
HttpContextII 
.II 
SessionII #
.II# $
GetInt32II$ ,
(II, -

UserHelperII- 7
.II7 8
LogInRoleIdII8 C
)IIC D
!=IIE G
nullIIH L
)IIL M
{JJ 
intKK 
rolIdKK	 
=KK 
(KK 
intKK 
)KK 
contextKK 
.KK 
HttpContextKK )
.KK) *
SessionKK* 1
.KK1 2
GetInt32KK2 :
(KK: ;

UserHelperKK; E
.KKE F
LogInRoleIdKKF Q
)KKQ R
;KKR S
ifMM 
(MM 	
rolIdMM	 
>MM 
$numMM 
)MM 
{NN 
IEnumerableOO 
<OO 
RolePermissionModelOO %
>OO% &
objOO' *
=OO+ ,
UtilityHelperOO- :
.OO: ;
GetModuleRoleOO; H
<OOH I
dynamicOOI P
>OOP Q
(OOQ R
(OOR S
ConvertOOS Z
.OOZ [
ToInt32OO[ b
(OOb c
rolIdOOc h
)OOh i
)OOi j
)OOj k
;OOk l
varQQ 	
controllerNameQQ
 
=QQ 
contextQQ "
.QQ" #
	RouteDataQQ# ,
.QQ, -
ValuesQQ- 3
[QQ3 4
$strQQ4 @
]QQ@ A
;QQA B
varRR 	
actionRR
 
=RR 
contextRR 
.RR 
	RouteDataRR $
.RR$ %
ValuesRR% +
[RR+ ,
$strRR, 4
]RR4 5
;RR5 6
ifSS 
(SS	 

objSS
 
!=SS 
nullSS 
)SS 
{TT 
RolePermissionModelUU 
objListUU "
=UU# $
objUU% (
.UU( )
WhereUU) .
(UU. /
oUU/ 0
=>UU1 3
oUU4 5
.UU5 6
ControlNameUU6 A
!=UUB D
nullUUE I
&&UUJ L
oUUM N
.UUN O
ControlNameUUO Z
.UUZ [
TrimUU[ _
(UU_ `
)UU` a
==UUb d
ConvertUUe l
.UUl m
ToStringUUm u
(UUu v
controllerName	UUv Ñ
)
UUÑ Ö
.
UUÖ Ü
Trim
UUÜ ä
(
UUä ã
)
UUã å
)
UUå ç
.
UUç é
FirstOrDefault
UUé ú
(
UUú ù
)
UUù û
;
UUû ü
ifXX 	
(XX
 
(XX 
objListXX 
==XX 
nullXX 
)XX 
&&XX 
ConvertXX  '
.XX' (
ToStringXX( 0
(XX0 1
controllerNameXX1 ?
)XX? @
!=XXA C
$strXXD J
&&XXK M
ConvertXXN U
.XXU V
ToStringXXV ^
(XX^ _
controllerNameXX_ m
)XXm n
!=XXo q
$str	XXr Å
)
XXÅ Ç
contextYY 
.YY 
ResultYY 
=YY 
newYY 
RedirectResultYY +
(YY+ ,
$strYY, F
)YYF G
;YYG H
}ZZ 
}[[ 
}\\ 
}]] 
catch^^ 
(^^	 

	Exception^^
 
)^^ 
{__ 
throw`` 	
;``	 

}aa 
}bb 
}cc 
}dd œ
5D:\EltizamLive\Eltizam.Web\Filters\CustomException.cs
	namespace 	
Eltizam
 
. 
Web 
. 
Filters 
{ 
public 

class 
CustomException  
:! "
	Exception# ,
{ 
	protected 
CustomException !
(! "
SerializationInfo" 3
info4 8
,8 9
StreamingContext		 
context		 
)		 
:		  !
base		" &
(		& '
info		' +
,		+ ,
context		- 4
)		4 5
{

 	
} 	
public 
CustomException 
( 
)  
:! "
base# '
(' (
)( )
{ 	
} 	
public 
CustomException 
( 
string %
message& -
)- .
:/ 0
base1 5
(5 6
message6 =
)= >
{ 	
} 	
public 
CustomException 
( 
string %
message& -
,- .
params/ 5
object6 <
[< =
]= >
args? C
)C D
: 
base 
( 
String 
. 
Format  
(  !
CultureInfo! ,
., -
CurrentCulture- ;
,; <
message= D
,D E
argsF J
)J K
)K L
{ 	
} 	
} 
} £M
6D:\EltizamLive\Eltizam.Web\Filters\ExceptionsFilter.cs
	namespace		 	
Eltizam		
 
.		 
Web		 
.		 
Filters		 
{

 
[ 
AttributeUsage 
( 
AttributeTargets $
.$ %
Class% *
|+ ,
AttributeTargets- =
.= >
Method> D
,D E
AllowMultipleF S
=T U
trueV Z
,Z [
	Inherited\ e
=f g
trueh l
)l m
]m n
public 

class 
ExceptionsFilter !
:" #$
ExceptionFilterAttribute$ <
,< =
IExceptionFilter> N
,N O!
IAsyncExceptionFilterP e
{ 
public 
ExceptionsFilter 
(  
)  !
{ 	
} 	
public 
override 
void 
OnException (
(( )
ExceptionContext) 9
context: A
)A B
{ 	
var 
	routeData 
= 
new  
RouteValueDictionary  4
(4 5
)5 6
;6 7
HttpStatusCode 

statusCode %
=& '
(( )
context) 0
.0 1
	Exception1 :
as; =
WebException> J
!=K M
nullN R
&&S U
( 
( 
HttpWebResponse (
)( )
() *
context* 1
.1 2
	Exception2 ;
as< >
WebException? K
)K L
.L M
ResponseM U
)U V
!=W Y
nullZ ^
)^ _
?` a
( 
( 
HttpWebResponse )
)) *
(* +
context+ 2
.2 3
	Exception3 <
as= ?
WebException@ L
)L M
.M N
ResponseN V
)V W
.W X

StatusCodeX b
: 
getErrorCode &
(& '
context' .
.. /
	Exception/ 8
.8 9
GetType9 @
(@ A
)A B
)B C
;C D
var 
responseModel 
= 
new  #
APIResponseEntity$ 5
<5 6
string6 <
>< =
(= >
)> ?
{@ A
_errorMessagesB P
=Q R
newS V
ListW [
<[ \
string\ b
>b c
{d e
contextf m
.m n
	Exceptionn w
.w x
Messagex 
}
Ä Å
,
Å Ç
_Success
É ã
=
å ç
false
é ì
}
î ï
;
ï ñ
var 
result 
= 
JsonConvert $
.$ %
SerializeObject% 4
(4 5
responseModel5 B
)B C
;C D
try 
{ 
APIRepository   
objapi   $
=  % &
new  ' *
APIRepository  + 8
(  8 9
APIURLHelper  9 E
.  E F
Configuration  F S
)  S T
;  T U
context!! 
.!! 
HttpContext!! #
.!!# $
Request!!$ +
.!!+ ,
Cookies!!, 3
.!!3 4
TryGetValue!!4 ?
(!!? @

UserHelper!!@ J
.!!J K
EltizamToken!!K W
,!!W X
out!!Y \
string!!] c
token!!d i
)!!i j
;!!j k
HttpResponseMessage"" #
responseMessage""$ 3
=""4 5
objapi""6 <
.""< =
APICommunication""= M
(""M N
APIURLHelper""N Z
.""Z [
LogException""[ g
,""g h

HttpMethod""i s
.""s t
Post""t x
,""x y
token""z 
,	"" Ä
new
""Å Ñ
StringContent
""Ö í
(
""í ì
JsonConvert
""ì û
.
""û ü
SerializeObject
""ü Æ
(
""Æ Ø
context
""Ø ∂
.
""∂ ∑
	Exception
""∑ ¿
)
""¿ ¡
)
""¡ ¬
)
""¬ √
.
""√ ƒ
Result
""ƒ  
;
""  À
}## 
catch$$ 
($$ 
	Exception$$ 
e$$ 
)$$ 
{%% 
}'' 
if)) 
()) 

statusCode)) 
==)) 
HttpStatusCode)) ,
.)), -
InternalServerError))- @
)))@ A
{** 
	routeData++ 
=++ 
new++  
RouteValueDictionary++  4
(++4 5
new++5 8
{,, 

controller-- 
=--  
$str--! '
,--' (
action.. 
=.. 
$str.. 2
}// 
)// 
;// 
}00 
context11 
.11 
ExceptionHandled11 $
=11% &
true11' +
;11+ ,
context22 
.22 
Result22 
=22 
new22  !
RedirectToRouteResult22! 6
(226 7
	routeData227 @
)22@ A
;22A B
context33 
.33 
Result33 
.33 
ExecuteResultAsync33 -
(33- .
context33. 5
)335 6
;336 7
}44 	
private66 
HttpStatusCode66 
getErrorCode66 +
(66+ ,
Type66, 0
exceptionType661 >
)66> ?
{77 	

Exceptions88 
tryParseResult88 %
;88% &
if99 
(99 
Enum99 
.99 
TryParse99 
<99 

Exceptions99 (
>99( )
(99) *
exceptionType99* 7
.997 8
Name998 <
,99< =
out99> A
tryParseResult99B P
)99P Q
)99Q R
{:: 
switch;; 
(;; 
tryParseResult;; &
);;& '
{<< 
case== 

Exceptions== #
.==# $"
NullReferenceException==$ :
:==: ;
return>> 
HttpStatusCode>> -
.>>- .
LengthRequired>>. <
;>>< =
case@@ 

Exceptions@@ #
.@@# $!
FileNotFoundException@@$ 9
:@@9 :
returnAA 
HttpStatusCodeAA -
.AA- .
NotFoundAA. 6
;AA6 7
caseCC 

ExceptionsCC #
.CC# $
OverflowExceptionCC$ 5
:CC5 6
returnDD 
HttpStatusCodeDD -
.DD- .(
RequestedRangeNotSatisfiableDD. J
;DDJ K
caseFF 

ExceptionsFF #
.FF# $ 
OutOfMemoryExceptionFF$ 8
:FF8 9
returnGG 
HttpStatusCodeGG -
.GG- .
ExpectationFailedGG. ?
;GG? @
caseII 

ExceptionsII #
.II# $ 
InvalidCastExceptionII$ 8
:II8 9
returnJJ 
HttpStatusCodeJJ -
.JJ- .
PreconditionFailedJJ. @
;JJ@ A
caseLL 

ExceptionsLL #
.LL# $#
ObjectDisposedExceptionLL$ ;
:LL; <
returnMM 
HttpStatusCodeMM -
.MM- .
GoneMM. 2
;MM2 3
caseOO 

ExceptionsOO #
.OO# $'
UnauthorizedAccessExceptionOO$ ?
:OO? @
returnPP 
HttpStatusCodePP -
.PP- .
UnauthorizedPP. :
;PP: ;
caseRR 

ExceptionsRR #
.RR# $#
NotImplementedExceptionRR$ ;
:RR; <
returnSS 
HttpStatusCodeSS -
.SS- .
NotImplementedSS. <
;SS< =
caseUU 

ExceptionsUU #
.UU# $!
NotSupportedExceptionUU$ 9
:UU9 :
returnVV 
HttpStatusCodeVV -
.VV- .
NotAcceptableVV. ;
;VV; <
caseXX 

ExceptionsXX #
.XX# $%
InvalidOperationExceptionXX$ =
:XX= >
returnYY 
HttpStatusCodeYY -
.YY- .
MethodNotAllowedYY. >
;YY> ?
case[[ 

Exceptions[[ #
.[[# $
TimeoutException[[$ 4
:[[4 5
return\\ 
HttpStatusCode\\ -
.\\- .
RequestTimeout\\. <
;\\< =
case^^ 

Exceptions^^ #
.^^# $
ArgumentException^^$ 5
:^^5 6
return__ 
HttpStatusCode__ -
.__- .

BadRequest__. 8
;__8 9
caseaa 

Exceptionsaa #
.aa# $"
StackOverflowExceptionaa$ :
:aa: ;
returnbb 
HttpStatusCodebb -
.bb- .(
RequestedRangeNotSatisfiablebb. J
;bbJ K
casedd 

Exceptionsdd #
.dd# $
FormatExceptiondd$ 3
:dd3 4
returnee 
HttpStatusCodeee -
.ee- . 
UnsupportedMediaTypeee. B
;eeB C
casegg 

Exceptionsgg #
.gg# $
IOExceptiongg$ /
:gg/ 0
returnhh 
HttpStatusCodehh -
.hh- .
NotFoundhh. 6
;hh6 7
casejj 

Exceptionsjj #
.jj# $$
IndexOutOfRangeExceptionjj$ <
:jj< =
returnkk 
HttpStatusCodekk -
.kk- .
ExpectationFailedkk. ?
;kk? @
defaultmm 
:mm 
returnnn 
HttpStatusCodenn -
.nn- .
InternalServerErrornn. A
;nnA B
}oo 
}pp 
elseqq 
{rr 
returnss 
HttpStatusCodess %
.ss% &
InternalServerErrorss& 9
;ss9 :
}tt 
}uu 	
}vv 
}ww ãk
3D:\EltizamLive\Eltizam.Web\Helpers\APIRepository.cs
	namespace 	
Eltizam
 
. 
Web 
. 
Helpers 
{ 
public 

class 
APIRepository 
{ 
public 
static 
string 
baseURL $
;$ %
public		 
static		 
string		 
version		 $
;		$ %
private

 
IConfiguration

 
Configuration

 ,
;

, -
public 
APIRepository 
( 
IConfiguration +
configuration, 9
)9 :
{ 	
Configuration 
= 
configuration )
;) *
baseURL 
= 
Configuration #
.# $

GetSection$ .
(. /
$str/ :
): ;
.; <

GetSection< F
(F G
$strG P
)P Q
.Q R
ValueR W
;W X
version 
= 
Configuration #
.# $

GetSection$ .
(. /
$str/ :
): ;
.; <

GetSection< F
(F G
$strG P
)P Q
.Q R
ValueR W
;W X
} 	
public 
async 
Task 
< 
HttpResponseMessage -
>- .
APICommunication/ ?
(? @
string@ F
URLG J
,J K

HttpMethodL V

invokeTypeW a
,a b
stringc i
tokenj o
,o p
HttpContentq |
body	} Å
=
Ç É
null
Ñ à
,
à â
string
ä ê
ContentType
ë ú
=
ù û
$str
ü ±
,
± ≤
List
≥ ∑
<
∑ ∏
	IFormFile
∏ ¡
>
¡ ¬
formFile
√ À
=
Ã Õ
null
Œ “
,
“ ”
string
‘ ⁄
bodyKey
€ ‚
=
„ ‰
null
Â È
)
È Í
{ 	
HttpResponseMessage  
oHttpResponseMessage  4
=5 6
new7 :
HttpResponseMessage; N
(N O
)O P
;P Q
try 
{ 
HttpClientHandler !
clientHandler" /
=0 1
new2 5
HttpClientHandler6 G
(G H
)H I
;I J
clientHandler 
. 5
)ServerCertificateCustomValidationCallback G
=H I
(J K
senderK Q
,Q R
certS W
,W X
chainY ^
,^ _
sslPolicyErrors` o
)o p
=>q s
{t u
returnv |
true	} Å
;
Å Ç
}
É Ñ
;
Ñ Ö
using 
( 
var 
client !
=" #
new$ '

HttpClient( 2
(2 3
clientHandler3 @
)@ A
)A B
{ 
URL   
=   
string    
.    !
Format  ! '
(  ' (
$str  ( 6
,  6 7
version  8 ?
,  ? @
URL  A D
)  D E
;  E F
client"" 
."" 
BaseAddress"" &
=""' (
new"") ,
Uri""- 0
(""0 1
baseURL""1 8
)""8 9
;""9 :
if%% 
(%% 
!%% 
string%% 
.%%  
IsNullOrEmpty%%  -
(%%- .
token%%. 3
)%%3 4
)%%4 5
client&& 
.&& !
DefaultRequestHeaders&& 4
.&&4 5
Add&&5 8
(&&8 9
$str&&9 H
,&&H I
$str&&J S
+&&T U
token&&V [
)&&[ \
;&&\ ]
if(( 
((( 

invokeType(( "
.((" #
Method((# )
==((* ,

HttpMethod((- 7
.((7 8
Get((8 ;
.((; <
ToString((< D
(((D E
)((E F
)((F G
{)) 
return** 
await** $
client**% +
.**+ ,
GetAsync**, 4
(**4 5
URL**5 8
)**8 9
;**9 :
}++ 
else,, 
if,, 
(,, 

invokeType,, '
.,,' (
Method,,( .
==,,/ 1

HttpMethod,,2 <
.,,< =
Post,,= A
.,,A B
ToString,,B J
(,,J K
),,K L
),,L M
{-- 
if.. 
(.. 
formFile.. $
!=..% '
null..( ,
).., -
{// 
}11 
try22 
{33 
if44 
(44  
body44  $
!=44% '
null44( ,
)44, -
body55  $
.55$ %
Headers55% ,
.55, -
ContentType55- 8
=559 :
new55; > 
MediaTypeHeaderValue55? S
(55S T
$str55T f
)55f g
;55g h
return77 "
await77# (
client77) /
.77/ 0
	PostAsync770 9
(779 :
URL77: =
,77= >
body77? C
)77C D
;77D E
}88 
catch99 
(99 
	Exception99 (
ex99) +
)99+ ,
{:: 
throw<< !
ex<<" $
;<<$ %
}== 
}@@ 
elseAA 
ifAA 
(AA 

invokeTypeAA '
.AA' (
MethodAA( .
==AA/ 1

HttpMethodAA2 <
.AA< =
PutAA= @
.AA@ A
ToStringAAA I
(AAI J
)AAJ K
)AAK L
{BB 
ifDD 
(DD 
bodyDD  
!=DD! #
nullDD$ (
)DD( )
bodyEE  
.EE  !
HeadersEE! (
.EE( )
ContentTypeEE) 4
=EE5 6
newEE7 : 
MediaTypeHeaderValueEE; O
(EEO P
$strEEP b
)EEb c
;EEc d
returnGG 
awaitGG $
clientGG% +
.GG+ ,
	PostAsyncGG, 5
(GG5 6
URLGG6 9
,GG9 :
bodyGG; ?
)GG? @
;GG@ A
}HH 
elseII 
ifII 
(II 

invokeTypeII '
.II' (
MethodII( .
==II/ 1

HttpMethodII2 <
.II< =
DeleteII= C
.IIC D
ToStringIID L
(IIL M
)IIM N
)IIN O
{JJ 
returnKK 
awaitKK $
clientKK% +
.KK+ ,
DeleteAsyncKK, 7
(KK7 8
URLKK8 ;
)KK; <
;KK< =
}LL 
}MM 
}NN 
catchOO 
(OO 
	ExceptionOO 
exOO 
)OO  
{PP  
oHttpResponseMessageQQ $
.QQ$ %

StatusCodeQQ% /
=QQ0 1
HttpStatusCodeQQ2 @
.QQ@ A
InternalServerErrorQQA T
;QQT U
}RR 
ifSS 
(SS  
oHttpResponseMessageSS $
.SS$ %

StatusCodeSS% /
==SS0 2
HttpStatusCodeSS3 A
.SSA B
UnauthorizedSSB N
)SSN O
{TT 
}VV 
returnWW  
oHttpResponseMessageWW '
;WW' (
}XX 	
public\\ 
async\\ 
Task\\ 
<\\ 
HttpResponseMessage\\ -
>\\- .
APIComm\\/ 6
(\\6 7
string\\7 =
URL\\> A
,\\A B

HttpMethod\\C M

invokeType\\N X
,\\X Y
string\\Z `
token\\a f
,\\f g
HttpContent\\h s
body\\t x
=\\y z
null\\{ 
)	\\ Ä
{]] 	
HttpContextAccessor^^ 
httpContextAccessor^^  3
=^^4 5
new^^6 9
HttpContextAccessor^^: M
(^^M N
)^^N O
;^^O P
HttpResponseMessage__  
oHttpResponseMessage__  4
=__5 6
new__7 :
HttpResponseMessage__; N
(__N O
)__O P
;__P Q
try`` 
{aa 
HttpClientHandlerbb !
clientHandlerbb" /
=bb0 1
newbb2 5
HttpClientHandlerbb6 G
(bbG H
)bbH I
;bbI J
clientHandlercc 
.cc 5
)ServerCertificateCustomValidationCallbackcc G
=ccH I
(ccJ K
senderccK Q
,ccQ R
certccS W
,ccW X
chainccY ^
,cc^ _
sslPolicyErrorscc` o
)cco p
=>ccq s
{cct u
returnccv |
true	cc} Å
;
ccÅ Ç
}
ccÉ Ñ
;
ccÑ Ö
usingdd 
(dd 
vardd 
clientdd !
=dd" #
newdd$ '

HttpClientdd( 2
(dd2 3
clientHandlerdd3 @
)dd@ A
)ddA B
{ee 
clientff 
.ff 
BaseAddressff &
=ff' (
newff) ,
Uriff- 0
(ff0 1
baseURLff1 8
)ff8 9
;ff9 :
ifgg 
(gg 
!gg 
stringgg 
.gg  
IsNullOrEmptygg  -
(gg- .
tokengg. 3
)gg3 4
)gg4 5
clienthh 
.hh !
DefaultRequestHeadershh 4
.hh4 5
Addhh5 8
(hh8 9
$strhh9 H
,hhH I
$strhhJ S
+hhT U
tokenhhV [
)hh[ \
;hh\ ]
ifjj 
(jj 

invokeTypejj "
.jj" #
Methodjj# )
==jj* ,

HttpMethodjj- 7
.jj7 8
Getjj8 ;
.jj; <
ToStringjj< D
(jjD E
)jjE F
)jjF G
{kk  
oHttpResponseMessagell ,
=ll- .
awaitll/ 4
clientll5 ;
.ll; <
GetAsyncll< D
(llD E
URLllE H
)llH I
;llI J
}mm 
elsenn 
ifnn 
(nn 

invokeTypenn '
.nn' (
Methodnn( .
==nn/ 1

HttpMethodnn2 <
.nn< =
Postnn= A
.nnA B
ToStringnnB J
(nnJ K
)nnK L
)nnL M
{oo 
ifpp 
(pp 
bodypp  
!=pp! #
nullpp$ (
)pp( ) 
oHttpResponseMessageqq 0
=qq1 2
awaitqq3 8
clientqq9 ?
.qq? @
	PostAsyncqq@ I
(qqI J
URLqqJ M
,qqM N
bodyqqO S
)qqS T
;qqT U
}rr 
elsess 
ifss 
(ss 

invokeTypess '
.ss' (
Methodss( .
==ss/ 1

HttpMethodss2 <
.ss< =
Putss= @
.ss@ A
ToStringssA I
(ssI J
)ssJ K
)ssK L
{tt 
ifuu 
(uu 
bodyuu  
!=uu! #
nulluu$ (
)uu( ) 
oHttpResponseMessagevv 0
=vv1 2
awaitvv3 8
clientvv9 ?
.vv? @
	PostAsyncvv@ I
(vvI J
URLvvJ M
,vvM N
bodyvvO S
)vvS T
;vvT U
}ww 
elsexx 
ifxx 
(xx 

invokeTypexx '
.xx' (
Methodxx( .
==xx/ 1

HttpMethodxx2 <
.xx< =
Deletexx= C
.xxC D
ToStringxxD L
(xxL M
)xxM N
)xxN O
{yy  
oHttpResponseMessagezz ,
=zz- .
awaitzz/ 4
clientzz5 ;
.zz; <
DeleteAsynczz< G
(zzG H
URLzzH K
)zzK L
;zzL M
}{{ 
}|| 
}}} 
catch~~ 
(~~ 
	Exception~~ 
ex~~ 
)~~  
{ "
oHttpResponseMessage
ÄÄ $
.
ÄÄ$ %

StatusCode
ÄÄ% /
=
ÄÄ0 1
HttpStatusCode
ÄÄ2 @
.
ÄÄ@ A!
InternalServerError
ÄÄA T
;
ÄÄT U
}
ÅÅ 
if
ÇÇ 
(
ÇÇ "
oHttpResponseMessage
ÇÇ $
.
ÇÇ$ %

StatusCode
ÇÇ% /
==
ÇÇ0 2
HttpStatusCode
ÇÇ3 A
.
ÇÇA B
Unauthorized
ÇÇB N
)
ÇÇN O
{
ÉÉ 
string
ÑÑ 
redirecturl
ÑÑ "
=
ÑÑ# $
$str
ÑÑ% >
;
ÑÑ> ?
string
ÖÖ 
scheme
ÖÖ 
=
ÖÖ !
httpContextAccessor
ÖÖ  3
.
ÖÖ3 4
HttpContext
ÖÖ4 ?
.
ÖÖ? @
Request
ÖÖ@ G
.
ÖÖG H
Scheme
ÖÖH N
;
ÖÖN O
string
ÜÜ 
Host
ÜÜ 
=
ÜÜ !
httpContextAccessor
ÜÜ 1
.
ÜÜ1 2
HttpContext
ÜÜ2 =
.
ÜÜ= >
Request
ÜÜ> E
.
ÜÜE F
Host
ÜÜF J
.
ÜÜJ K
ToUriComponent
ÜÜK Y
(
ÜÜY Z
)
ÜÜZ [
;
ÜÜ[ \
var
áá 
absoluteUri
áá 
=
áá  !
string
áá" (
.
áá( )
Concat
áá) /
(
áá/ 0
scheme
áá0 6
,
áá6 7
$str
áá8 =
,
áá= >
Host
áá? C
,
ááC D
redirecturl
ááE P
)
ááP Q
;
ááQ R!
httpContextAccessor
àà #
.
àà# $
HttpContext
àà$ /
.
àà/ 0
Response
àà0 8
.
àà8 9
Redirect
àà9 A
(
ààA B
absoluteUri
ààB M
)
ààM N
;
ààN O
}
ââ 
return
ää "
oHttpResponseMessage
ää '
;
ää' (
}
ãã 	
}
åå 
}çç Â≥
2D:\EltizamLive\Eltizam.Web\Helpers\APIURLHelper.cs
	namespace 	
Eltizam
 
. 
Web 
. 
Helpers 
{ 
public 

static 
class 
APIURLHelper $
{ 
public 
static 
IConfiguration $
Configuration% 2
;2 3
public 
static 
string 
LoginURL %
=& '
$str( 7
;7 8
public 
static 
string 
ValidateToken *
=+ ,
$str- D
;D E
public 
static 
string 
GetBusinessUnit ,
=- .
$str/ K
;K L
public 
static 
string 
	GetRegion &
=' (
$str) ?
;? @
public 
static 
string 
GetCurrency (
=) *
$str+ C
;C D
public 
static 
string 
ForgotPassword +
=, -
$str. F
;F G
public 
static 
string 
ResetPassword *
=+ ,
$str- D
;D E
public 
static 
string -
!Anonymous_CheckEmailAddressExists >
=? @
$strA b
;b c
public 
static 
string "
Anonymous_IsTokenValid 3
=4 5
$str6 L
;L M
public 
static 
string 
ChangePassword +
=, -
$str. F
;F G
public 
static 
string 
GetDepartmentList .
=/ 0
$str1 U
;U V
public 
static 
string 
GetRoleList (
=) *
$str+ C
;C D
public 
static 
string 
GetApproverList ,
=- .
$str/ K
;K L
public 
static 
string 
GetDesignationList /
=0 1
$str2 X
;X Y
public 
static 
string 
GetResourceTypeList 0
=1 2
$str3 S
;S T
public 
static 
string  
GetApproverLevelList 1
=2 3
$str4 U
;U V
public   
static   
string   
GetCountryList   +
=  , -
$str  . L
;  L M
public!! 
static!! 
string!! 
GetStateList!! )
=!!* +
$str!!, F
;!!F G
public"" 
static"" 
string"" #
GetStateListByCountryId"" 4
=""5 6
$str""7 \
;""\ ]
public## 
static## 
string## 
GetCityList## (
=##) *
$str##+ C
;##C D
public$$ 
static$$ 
string$$ 
GeCityListByStateId$$ 0
=$$1 2
$str$$3 T
;$$T U
public%% 
static%% 
string%% 
GetClientTypeList%% .
=%%/ 0
$str%%1 U
;%%U V
public&& 
static&& 
string&& )
GetByPermisionRoleUsingRoleId&& :
=&&; <
$str&&= g
;&&g h
public,, 
static,, 
string,, 
GetAll,, #
=,,$ %
$str,,& 9
;,,9 :
public-- 
static-- 
string-- 

UpsertUser-- '
=--( )
$str--* =
;--= >
public.. 
static.. 
string.. 
GetUserById.. (
=..) *
$str..+ ?
;..? @
public// 
static// 
string// 
DeleteUserById// +
=//, -
$str//. A
;//A B
public00 
static00 
string00 "
DeleteUserDocumentById00 3
=004 5
$str006 Q
;00Q R
public11 
static11 
string11  
GetGlobalAuditFields11 1
=112 3
$str114 U
;11U V
public22 
static22 
string22 
GetUserNameList22 ,
=22- .
$str22/ J
;22J K
public33 
static33 
string33 
CheckEmailExist33 ,
=33- .
$str33/ K
;33K L
public77 
static77 
string77 
UpsertDesignation77 .
=77/ 0
$str771 K
;77K L
public88 
static88 
string88 
GetAllDesignation88 .
=88/ 0
$str881 K
;88K L
public99 
static99 
string99 
GetesignationById99 .
=99/ 0
$str991 L
;99L M
public:: 
static:: 
string:: !
DeleteDesignationById:: 2
=::3 4
$str::5 O
;::O P
public>> 
static>> 
string>> 
UpsertDepartment>> -
=>>. /
$str>>0 I
;>>I J
public?? 
static?? 
string?? 
GetAllDepartment?? -
=??. /
$str??0 I
;??I J
public@@ 
static@@ 
string@@ 
GetDepartmentById@@ .
=@@/ 0
$str@@1 K
;@@K L
publicAA 
staticAA 
stringAA  
DeleteDepartmentByIdAA 1
=AA2 3
$strAA4 M
;AAM N
publicGG 
staticGG 
stringGG 
DashboardDetailsGG -
=GG. /
$strGG0 I
;GGI J
publicHH 
staticHH 
stringHH 
ClientPieChartURLHH .
=HH/ 0
$strHH1 N
;HHN O
publicMM 
staticMM 
stringMM 
UpsertPropertyMM +
=MM, -
$strMM. E
;MME F
publicNN 
staticNN 
stringNN 
GetAllPropertyNN +
=NN, -
$strNN. E
;NNE F
publicOO 
staticOO 
stringOO 
GetPropertyByIdOO ,
=OO- .
$strOO/ G
;OOG H
publicPP 
staticPP 
stringPP 
DeletePropertyByIdPP /
=PP0 1
$strPP2 I
;PPI J
publicQQ 
staticQQ 
stringQQ  
GetPropertyByFiltersQQ 1
=QQ2 3
$strQQ4 Y
;QQY Z
publicRR 
staticRR 
stringRR "
GetPropertyAmenityListRR 3
=RR4 5
$strRR6 ]
;RR] ^
publicWW 
staticWW 
stringWW 
UpsertPropertyTypeWW /
=WW0 1
$strWW2 M
;WWM N
publicXX 
staticXX 
stringXX 
GetAllPropertyTypeXX /
=XX0 1
$strXX2 M
;XXM N
publicYY 
staticYY 
stringYY 
GetPropertyTypeByIdYY 0
=YY1 2
$strYY3 O
;YYO P
publicZZ 
staticZZ 
stringZZ "
DeletePropertyTypeByIdZZ 3
=ZZ4 5
$strZZ6 Q
;ZZQ R
public[[ 
static[[ 
string[[ 
GetPropertyTypeList[[ 0
=[[1 2
$str[[3 R
;[[R S
public\\ 
static\\ 
string\\ #
CheckPropertyTypeExists\\ 4
=\\5 6
$str\\7 b
;\\b c
publicaa 
staticaa 
stringaa !
UpsertPropertySubTypeaa 2
=aa3 4
$straa5 S
;aaS T
publicbb 
staticbb 
stringbb !
GetAllPropertySubTypebb 2
=bb3 4
$strbb5 [
;bb[ \
publiccc 
staticcc 
stringcc "
GetPropertyByIdSubTypecc 3
=cc4 5
$strcc6 U
;ccU V
publicdd 
staticdd 
stringdd '
GetPropertyByPropertyTypeIddd 8
=dd9 :
$strdd; f
;ddf g
publicee 
staticee 
stringee &
DeletePropertytByIdSubTypeee 7
=ee8 9
$stree: X
;eeX Y
publicjj 
staticjj 
stringjj 
UpsertOwnershipTypejj 0
=jj1 2
$strjj3 O
;jjO P
publickk 
statickk 
stringkk 
GetAllOwnershipTypekk 0
=kk1 2
$strkk3 O
;kkO P
publicll 
staticll 
stringll 
GetOwnershipTypell -
=ll. /
$strll0 M
;llM N
publicmm 
staticmm 
stringmm 
DeleteOwnershipTypemm 0
=mm1 2
$strmm3 O
;mmO P
publicnn 
staticnn 
stringnn 
OwnershipTypeListnn .
=nn/ 0
$strnn1 Z
;nnZ [
publicss 
staticss 
stringss $
UpsertValuationQuatationss 5
=ss6 7
$strss8 S
;ssS T
publictt 
statictt 
stringtt "
ValuationQuatationByIdtt 3
=tt4 5
$strtt6 [
;tt[ \
publicuu 
staticuu 
stringuu 
DeleteQuotationByIduu 0
=uu1 2
$struu3 N
;uuN O
publicvv 
staticvv 
stringvv "
UpsertValuationInvoicevv 3
=vv4 5
$strvv6 O
;vvO P
publicww 
staticww 
stringww  
ValuationInvoiceByIdww 1
=ww2 3
$strww4 U
;wwU V
publicxx 
staticxx 
stringxx 
DeleteInvoiceByIdxx .
=xx/ 0
$strxx1 J
;xxJ K
publicyy 
staticyy 
stringyy !
DeleteInvoiceDocumentyy 2
=yy3 4
$stryy5 V
;yyV W
publiczz 
staticzz 
stringzz  
DeletePyamentInvoicezz 1
=zz2 3
$strzz4 [
;zz[ \
public
ÄÄ 
static
ÄÄ 
string
ÄÄ 
UpsertValuation
ÄÄ ,
=
ÄÄ- .
$str
ÄÄ/ K
;
ÄÄK L
public
ÅÅ 
static
ÅÅ 
string
ÅÅ 
GetAllValuation
ÅÅ ,
=
ÅÅ- .
$str
ÅÅ/ K
;
ÅÅK L
public
ÇÇ 
static
ÇÇ 
string
ÇÇ 
GetValuationById
ÇÇ -
=
ÇÇ. /
$str
ÇÇ0 M
;
ÇÇM N
public
ÉÉ 
static
ÉÉ 
string
ÉÉ !
DeleteValuationById
ÉÉ 0
=
ÉÉ1 2
$str
ÉÉ3 O
;
ÉÉO P
public
àà 
static
àà 
string
àà $
UpsertValuationFeeType
àà 3
=
àà4 5
$str
àà6 U
;
ààU V
public
ââ 
static
ââ 
string
ââ $
GetAllValuationFeeType
ââ 3
=
ââ4 5
$str
ââ6 U
;
ââU V
public
ää 
static
ää 
string
ää %
GetValuationFeeTypeById
ää 4
=
ää5 6
$str
ää7 W
;
ääW X
public
ãã 
static
ãã 
string
ãã (
DeleteValuationFeeTypeById
ãã 7
=
ãã8 9
$str
ãã: Y
;
ããY Z
public
åå 
static
åå 
string
åå "
ValuationFeeTypeList
åå 1
=
åå2 3
$str
åå4 c
;
ååc d
public
íí 
static
íí 
string
íí !
GetSearchClientType
íí 0
=
íí1 2
$str
íí3 V
;
ííV W
public
ìì 
static
ìì 
string
ìì 
GetClientTypeById
ìì .
=
ìì/ 0
$str
ìì1 K
;
ììK L
public
îî 
static
îî 
string
îî 
UpsertClientType
îî -
=
îî. /
$str
îî0 I
;
îîI J
public
ïï 
static
ïï 
string
ïï 
DeleteClientType
ïï -
=
ïï. /
$str
ïï0 S
;
ïïS T
public
õõ 
static
õõ 
string
õõ 
GetSearchClient
õõ ,
=
õõ- .
$str
õõ/ J
;
õõJ K
public
úú 
static
úú 
string
úú 
GetClientById
úú *
=
úú+ ,
$str
úú- C
;
úúC D
public
ùù 
static
ùù 
string
ùù 
UpsertClient
ùù )
=
ùù* +
$str
ùù, A
;
ùùA B
public
ûû 
static
ûû 
string
ûû 
DeleteClient
ûû )
=
ûû* +
$str
ûû, G
;
ûûG H
public
üü 
static
üü 
string
üü %
GetClientByClientTypeId
üü 4
=
üü5 6
$str
üü7 W
;
üüW X
public
†† 
static
†† 
string
†† &
DeleteClientDocumentById
†† 5
=
††6 7
$str
††8 U
;
††U V
public
•• 
static
•• 
string
•• 

GetAllRole
•• '
=
••( )
$str
••* =
;
••= >
public
¶¶ 
static
¶¶ 
string
¶¶ 
GetAllActiveRole
¶¶ -
=
¶¶. /
$str
¶¶0 M
;
¶¶M N
public
ßß 
static
ßß 
string
ßß 
GetRoleById
ßß (
=
ßß) *
$str
ßß+ C
;
ßßC D
public
®® 
static
®® 
string
®® 
SaveRole
®® %
=
®®& '
$str
®®( E
;
®®E F
public
©© 
static
©© 
string
©© 
DeleteRoleById
©© +
=
©©, -
$str
©©. E
;
©©E F
public
≠≠ 
static
≠≠ 
string
≠≠ 
GetAllLocations
≠≠ ,
=
≠≠- .
$str
≠≠/ F
;
≠≠F G
public
ÆÆ 
static
ÆÆ 
string
ÆÆ 
UpsertLocation
ÆÆ +
=
ÆÆ, -
$str
ÆÆ. E
;
ÆÆE F
public
ØØ 
static
ØØ 
string
ØØ 
GetLocationById
ØØ ,
=
ØØ- .
$str
ØØ/ G
;
ØØG H
public
∞∞ 
static
∞∞ 
string
∞∞  
DeleteLocationById
∞∞ /
=
∞∞0 1
$str
∞∞2 I
;
∞∞I J
public
∂∂ 
static
∂∂ 
string
∂∂ 
GetAllDashboard
∂∂ ,
=
∂∂- .
$str
∂∂/ G
;
∂∂G H
public
∑∑ 
static
∑∑ 
string
∑∑ "
GetPIDFDashBoardData
∑∑ 1
=
∑∑2 3
$str
∑∑4 \
;
∑∑\ ]
public
ΩΩ 
static
ΩΩ 
string
ΩΩ  
GetAllNotification
ΩΩ /
=
ΩΩ0 1
$str
ΩΩ2 S
;
ΩΩS T
public
ææ 
static
ææ 
string
ææ &
GetFilteredNotifications
ææ 5
=
ææ6 7
$str
ææ8 _
;
ææ_ `
public
øø 
static
øø 
string
øø )
GetWebFilteredNotifications
øø 8
=
øø9 :
$str
øø; c
;
øøc d
public
¿¿ 
static
¿¿ 
string
¿¿ (
NotificationsClickedByUser
¿¿ 7
=
¿¿8 9
$str
¿¿: c
;
¿¿c d
public
¡¡ 
static
¡¡ 
string
¡¡ $
NotificationsCountUser
¡¡ 3
=
¡¡4 5
$str
¡¡6 [
;
¡¡[ \
public
«« 
static
«« 
string
«« 
GetSearchVendor
«« ,
=
««- .
$str
««/ D
;
««D E
public
»» 
static
»» 
string
»» 
GetVendorById
»» *
=
»»+ ,
$str
»»- C
;
»»C D
public
…… 
static
…… 
string
…… 
UpsertVendor
…… )
=
……* +
$str
……, A
;
……A B
public
   
static
   
string
   
DeleteVendor
   )
=
  * +
$str
  , A
;
  A B
public
œœ 
static
œœ 
string
œœ 
LogException
œœ )
=
œœ* +
$str
œœ, G
;
œœG H
public
‘‘ 
static
‘‘ 
string
‘‘ 
GetAllModule
‘‘ )
=
‘‘* +
$str
‘‘, G
;
‘‘G H
public
ŸŸ 
static
ŸŸ 
string
ŸŸ 
GetAllDictionary
ŸŸ -
=
ŸŸ. /
$str
ŸŸ0 I
;
ŸŸI J
public
⁄⁄ 
static
⁄⁄ 
string
⁄⁄ 
UpsertDictionary
⁄⁄ -
=
⁄⁄. /
$str
⁄⁄0 I
;
⁄⁄I J
public
€€ 
static
€€ 
string
€€ 
GetDictionaryById
€€ .
=
€€/ 0
$str
€€1 K
;
€€K L
public
›› 
static
›› 
string
›› "
DeleteDictionaryById
›› 1
=
››2 3
$str
››4 M
;
››M N
public
ﬁﬁ 
static
ﬁﬁ 
string
ﬁﬁ $
UpsertMasterDictionary
ﬁﬁ 3
=
ﬁﬁ4 5
$str
ﬁﬁ6 _
;
ﬁﬁ_ `
public
ﬂﬂ 
static
ﬂﬂ 
string
ﬂﬂ &
GetDictionaryDetailsById
ﬂﬂ 5
=
ﬂﬂ6 7
$str
ﬂﬂ8 c
;
ﬂﬂc d
public
‡‡ 
static
‡‡ 
string
‡‡ *
GetDictionaryDescriptionById
‡‡ 9
=
‡‡: ;
$str
‡‡< k
;
‡‡k l
public
·· 
static
·· 
string
·· )
GetDictionaryWithSubDetails
·· 8
=
··9 :
$str
··; i
;
··i j
public
‚‚ 
static
‚‚ 
string
‚‚ )
GetInvoiceTransactionStatus
‚‚ 8
=
‚‚9 :
$str
‚‚; o
;
‚‚o p
public
ËË 
static
ËË 
string
ËË $
GetAllValuationRequest
ËË 3
=
ËË4 5
$str
ËË6 _
;
ËË_ `
public
ÈÈ 
static
ÈÈ 
string
ÈÈ *
GetAllValuationRequestStatus
ÈÈ 9
=
ÈÈ: ;
$str
ÈÈ< [
;
ÈÈ[ \
public
ÍÍ 
static
ÍÍ 
string
ÍÍ 
AssignApprover
ÍÍ +
=
ÍÍ, -
$str
ÍÍ. O
;
ÍÍO P
public
ÎÎ 
static
ÎÎ 
string
ÎÎ 
ValuationMethod
ÎÎ ,
=
ÎÎ- .
$str
ÎÎ/ W
;
ÎÎW X
public
ÏÏ 
static
ÏÏ 
string
ÏÏ $
ValuationQuatationList
ÏÏ 3
=
ÏÏ4 5
$str
ÏÏ6 [
;
ÏÏ[ \
public
ÌÌ 
static
ÌÌ 
string
ÌÌ "
ValuationInvoiceList
ÌÌ 1
=
ÌÌ2 3
$str
ÌÌ4 U
;
ÌÌU V
public
ÓÓ 
static
ÓÓ 
string
ÓÓ $
UpsertValuationRequest
ÓÓ 3
=
ÓÓ4 5
$str
ÓÓ6 O
;
ÓÓO P
public
ÔÔ 
static
ÔÔ 
string
ÔÔ %
ValuationRequestGetById
ÔÔ 4
=
ÔÔ5 6
$str
ÔÔ7 Q
;
ÔÔQ R
public
 
static
 
string
 /
!ValuationRequestGetHeaderInfoById
 >
=
? @
$str
A e
;
e f
public
ÒÒ 
static
ÒÒ 
string
ÒÒ (
ValuationRequestDeleteById
ÒÒ 7
=
ÒÒ8 9
$str
ÒÒ: S
;
ÒÒS T
public
ÚÚ 
static
ÚÚ 
string
ÚÚ !
UpdateRequestStatus
ÚÚ 0
=
ÚÚ1 2
$str
ÚÚ3 Y
;
ÚÚY Z
public
ÛÛ 
static
ÛÛ 
string
ÛÛ 
GetRequestStatus
ÛÛ -
=
ÛÛ. /
$str
ÛÛ0 U
;
ÛÛU V
public
ÙÙ 
static
ÙÙ 
string
ÙÙ  
ValuationAssesment
ÙÙ /
=
ÙÙ0 1
$str
ÙÙ2 `
;
ÙÙ` a
public
ıı 
static
ıı 
string
ıı $
GetSiteDescriptionList
ıı 3
=
ıı4 5
$str
ıı6 b
;
ııb c
public
ˆˆ 
static
ˆˆ 
string
ˆˆ !
GetValuationPDFData
ˆˆ 0
=
ˆˆ1 2
$str
ˆˆ3 [
;
ˆˆ[ \
public
˜˜ 
static
˜˜ 
string
˜˜ 
GetApproverLevel
˜˜ -
=
˜˜. /
$str
˜˜0 U
;
˜˜U V
public
¯¯ 
static
¯¯ 
string
¯¯ "
UpdateApproverAction
¯¯ 1
=
¯¯2 3
$str
¯¯4 \
;
¯¯\ ]
public
˙˙ 
static
˙˙ 
string
˙˙ 
DeleteDocument
˙˙ +
=
˙˙, -
$str
˙˙. R
;
˙˙R S
public
˚˚ 
static
˚˚ 
string
˚˚ !
GetNotificationList
˚˚ 0
=
˚˚1 2
$str
˚˚3 U
;
˚˚U V
public
¸¸ 
static
¸¸ 
string
¸¸ "
GetNotificationCount
¸¸ 1
=
¸¸2 3
$str
¸¸4 W
;
¸¸W X
public
˝˝ 
static
˝˝ 
string
˝˝  
UpdateNotification
˝˝ /
=
˝˝0 1
$str
˝˝2 Y
;
˝˝Y Z
public
˛˛ 
static
˛˛ 
string
˛˛ !
GetAllStatusHistory
˛˛ 0
=
˛˛1 2
$str
˛˛3 _
;
˛˛_ `
public
ˇˇ 
static
ˇˇ 
string
ˇˇ 
UpsertInvoice
ˇˇ *
=
ˇˇ+ ,
$str
ˇˇ- M
;
ˇˇM N
public
ÄÄ 
static
ÄÄ 
string
ÄÄ #
GetPaymentInvoiceById
ÄÄ 2
=
ÄÄ3 4
$str
ÄÄ5 ]
;
ÄÄ] ^
public
ÅÅ 
static
ÅÅ 
string
ÅÅ  
PaymentInvoiceById
ÅÅ /
=
ÅÅ0 1
$str
ÅÅ2 W
;
ÅÅW X
public
ÖÖ 
static
ÖÖ 
string
ÖÖ 
GetAllAudit
ÖÖ (
=
ÖÖ) *
$str
ÖÖ+ <
;
ÖÖ< =
public
ÜÜ 
static
ÜÜ 
string
ÜÜ 
GetAuditDetails
ÜÜ ,
=
ÜÜ- .
$str
ÜÜ/ J
;
ÜÜJ K
public
áá 
static
áá 
string
áá 
GetDetailsAudit
áá ,
=
áá- .
$str
áá/ P
;
ááP Q
public
àà 
static
àà 
string
àà 
GetAuditTableName
àà .
=
àà/ 0
$str
àà1 S
;
ààS T
public
çç 
static
çç 
string
çç '
UpsertMasterApproverLevel
çç 6
=
çç7 8
$str
çç9 U
;
ççU V
public
éé 
static
éé 
string
éé (
GetMasterApproverLevelById
éé 7
=
éé8 9
$str
éé: W
;
ééW X
public
èè 
static
èè 
string
èè )
GetMasterApproverLevelsList
èè 8
=
èè9 :
$str
èè; W
;
èèW X
}
ìì 
}îî Å
:D:\EltizamLive\Eltizam.Web\Helpers\DictionaryCodeHelper.cs
	namespace 	
Eltizam
 
. 
Web 
. 
Helpers 
{ 
public 

static 
class  
DictionaryCodeHelper ,
{ 
public 
static 
string 
Gender #
=$ %
$str& .
;. /
public 
static 
string 

Department '
=( )
$str* 6
;6 7
public 
static 
string 
Designation (
=) *
$str+ 8
;8 9
public 
static 
string 
ResourceType )
=* +
$str, ;
;; <
public		 
static		 
string		 
ValuationMethod		 ,
=		- .
$str		/ A
;		A B
public

 
static

 
string

 
UnitType

 %
=

& '
$str

( 3
;

3 4
public 
static 
string 
PropertyFurnished .
=/ 0
$str1 E
;E F
public 
static 
string 
OwnershipType *
=+ ,
$str- =
;= >
public 
static 
string 

ClientType '
=( )
$str* 7
;7 8
public 
static 
string 
TransactionMode ,
=- .
$str/ A
;A B
public 
static 
string 
ValuationType *
=+ ,
$str- =
;= >
public 
static 
string 
Currency %
=& '
$str( 2
;2 3
} 
} ˚[
,D:\EltizamLive\Eltizam.Web\Helpers\Helper.cs
	namespace 	
Eltizam
 
. 
Web 
. 
Helpers 
{ 
public 

class 
Helper 
: 
IHelper !
{		 
private

 
readonly

  
IHttpContextAccessor

 - 
_httpContextAccessor

. B
;

B C
private 
readonly 
	Microsoft "
." #

Extensions# -
.- .
Configuration. ;
.; <
IConfiguration< J
_cofigurationK X
;X Y
public 
Helper 
(  
IHttpContextAccessor *
httpContextAccessor+ >
,> ?
	Microsoft@ I
.I J

ExtensionsJ T
.T U
ConfigurationU b
.b c
IConfigurationc q
configurationr 
)	 Ä
{ 	 
_httpContextAccessor  
=! "
httpContextAccessor# 6
;6 7
_cofiguration 
= 
configuration )
;) *
} 	
public 
int 
GetLoggedInUserId $
($ %
)% &
{ 	
return 
Convert 
. 
ToInt32 "
(" # 
_httpContextAccessor# 7
.7 8
HttpContext8 C
.C D
SessionD K
.K L
	GetStringL U
(U V

UserHelperV `
.` a
LogInUserIda l
)l m
)m n
;n o
} 	
public 
int 
GetLoggedInRoleId $
($ %
)% &
{ 	
try 
{ 
return 
Convert 
. 
ToInt32 &
(& ' 
_httpContextAccessor' ;
.; <
HttpContext< G
.G H
SessionH O
.O P
GetInt32P X
(X Y

UserHelperY c
.c d
LogInRoleIdd o
)o p
)p q
;q r
} 
catch 
( 
	Exception 
ex 
)  
{   
return!! 
$num!! 
;!! 
}"" 
}## 	
public%% 
string%% 
IsManagementUser%% &
(%%& '
)%%' (
{&& 	
return''  
_httpContextAccessor'' '
.''' (
HttpContext''( 3
.''3 4
Session''4 ;
.''; <
	GetString''< E
(''E F

UserHelper''F P
.''P Q
IsManagement''Q ]
)''] ^
;''^ _
}(( 	
public** 
string** 
GetToken** 
(** 
)**  
{++ 	 
_httpContextAccessor,,  
.,,  !
HttpContext,,! ,
.,,, -
Request,,- 4
.,,4 5
Cookies,,5 <
.,,< =
TryGetValue,,= H
(,,H I

UserHelper,,I S
.,,S T
EltizamToken,,T `
,,,` a
out,,b e
string,,f l
token,,m r
),,r s
;,,s t
return-- 
token-- 
;-- 
}.. 	
public00 
void00 
LogExceptions00 !
(00! "
	Exception00" +
ex00, .
)00. /
{11 	
try22 
{33  
_httpContextAccessor44 $
.44$ %
HttpContext44% 0
.440 1
Request441 8
.448 9
Cookies449 @
.44@ A
TryGetValue44A L
(44L M

UserHelper44M W
.44W X
EltizamToken44X d
,44d e
out44f i
string44j p
token44q v
)44v w
;44w x
APIRepository55 
objapi55 $
=55% &
new55' *
(55* +
_cofiguration55+ 8
)558 9
;559 :
System66 
.66 
Net66 
.66 
Http66 
.66  
HttpResponseMessage66  3
responseMessage664 C
=66D E
objapi66F L
.66L M
APICommunication66M ]
(66] ^
APIURLHelper66^ j
.66j k
LogException66k w
,66w x

HttpMethod	66y É
.
66É Ñ
Post
66Ñ à
,
66à â
token
66ä è
,
66è ê
new
66ë î
StringContent
66ï ¢
(
66¢ £
JsonConvert
66£ Æ
.
66Æ Ø
SerializeObject
66Ø æ
(
66æ ø
ex
66ø ¡
)
66¡ ¬
)
66¬ √
)
66√ ƒ
.
66ƒ ≈
Result
66≈ À
;
66À Ã
}88 
catch99 
(99 
	Exception99 
e99 
)99 
{:: 
}<< 
}>> 	
public@@ 
class@@ '
RolePermissionModelComparer@@ 0
:@@1 2
IEqualityComparer@@3 D
<@@D E
RolePermissionModel@@E X
>@@X Y
{AA 	
publicBB 
boolBB 
EqualsBB 
(BB 
RolePermissionModelBB 2
xBB3 4
,BB4 5
RolePermissionModelBB6 I
yBBJ K
)BBK L
{CC 
returnFF 
xFF 
.FF 
ModuleIdFF !
==FF" $
yFF% &
.FF& '
ModuleIdFF' /
&&FF0 2
xFF3 4
.FF4 5

ModuleNameFF5 ?
==FF@ B
yFFC D
.FFD E

ModuleNameFFE O
;FFO P
}GG 
publicII 
intII 
GetHashCodeII "
(II" #
RolePermissionModelII# 6
objII7 :
)II: ;
{JJ 
returnMM 
objMM 
.MM 
ModuleIdMM #
.MM# $
GetHashCodeMM$ /
(MM/ 0
)MM0 1
^MM2 3
objMM4 7
.MM7 8

ModuleNameMM8 B
.MMB C
GetHashCodeMMC N
(MMN O
)MMO P
;MMP Q
}NN 
}OO 	
publicQQ 
ListQQ 
<QQ 
RolePermissionModelQQ '
>QQ' (
GetMenusByRoleQQ) 7
(QQ7 8
intQQ8 ;
loginRoleIdQQ< G
)QQG H
{RR 	
IEnumerableSS 
<SS 
RolePermissionModelSS +
>SS+ ,
objListSS- 4
=SS5 6
UtilityHelperSS7 D
.SSD E
GetModuleRoleSSE R
<SSR S
dynamicSSS Z
>SSZ [
(SS[ \
loginRoleIdSS\ g
)SSg h
;SSh i
returnUU 
objListUU 
.UU 
DistinctUU #
(UU# $
newUU$ ''
RolePermissionModelComparerUU( C
(UUC D
)UUD E
)UUE F
.UUF G
ToListUUG M
(UUM N
)UUN O
;UUO P
}VV 	
publicYY 
ListYY 
<YY 
MasterDocumentModelYY '
>YY' (

FileUploadYY) 3
(YY3 4
DocumentFilesModelYY4 F
documentYYG O
)YYO P
{ZZ 	
List[[ 
<[[ 
MasterDocumentModel[[ $
>[[$ %
uploadFiles[[& 1
=[[2 3
new[[4 7
List[[8 <
<[[< =
MasterDocumentModel[[= P
>[[P Q
([[Q R
)[[R S
;[[S T
if]] 
(]] 
document]] 
.]] 
Files]] 
==]] !
null]]" &
||]]' )
document]]* 2
.]]2 3
Files]]3 8
.]]8 9
Count]]9 >
==]]? A
$num]]B C
)]]C D
{^^ 
throw__ 
new__ 
ArgumentException__ +
(__+ ,
$str__, E
)__E F
;__F G
}`` 
intbb 
currentUserbb 
=bb 
GetLoggedInUserIdbb /
(bb/ 0
)bb0 1
;bb1 2
foreachcc 
(cc 
varcc 
filecc 
incc  
documentcc! )
.cc) *
Filescc* /
)cc/ 0
{dd 
ifee 
(ee 
fileee 
==ee 
nullee  
||ee! #
fileee$ (
.ee( )
Lengthee) /
==ee0 2
$numee3 4
)ee4 5
{ff 
continuegg 
;gg 
}hh 
varjj 
fileNamejj 
=jj 
Guidjj #
.jj# $
NewGuidjj$ +
(jj+ ,
)jj, -
.jj- .
ToStringjj. 6
(jj6 7
)jj7 8
+jj9 :
Pathjj; ?
.jj? @
GetExtensionjj@ L
(jjL M
filejjM Q
.jjQ R
FileNamejjR Z
)jjZ [
;jj[ \
varll 
docNamell 
=ll 
filell "
.ll" #
FileNamell# +
;ll+ ,
varmm 
filePathmm 
=mm 
Pathmm #
.mm# $
Combinemm$ +
(mm+ ,
$strmm, =
,mm= >
fileNamemm? G
)mmG H
;mmH I
filePathnn 
=nn 
filePathnn #
.nn# $
Replacenn$ +
(nn+ ,
$strnn, 0
,nn0 1
$strnn2 5
)nn5 6
;nn6 7
usingoo 
(oo 
varoo 
streamoo !
=oo" #
newoo$ '

FileStreamoo( 2
(oo2 3
filePathoo3 ;
,oo; <
FileModeoo= E
.ooE F
CreateooF L
)ooL M
)ooM N
{pp 
filerr 
.rr 
CopyTorr 
(rr  
streamrr  &
)rr& '
;rr' (
}ss 
varuu 
uploaduu 
=uu 
newuu  
MasterDocumentModeluu! 4
{vv 
FileNameww 
=ww 
fileNameww '
,ww' (
FilePathxx 
=xx 
filePathxx '
.xx' (
Replacexx( /
(xx/ 0
$strxx0 9
,xx9 :
$strxx; ?
)xx? @
,xx@ A
DocumentNameyy  
=yy! "
docNameyy# *
,yy* +
IsActivezz 
=zz 
truezz #
,zz# $
FileType{{ 
={{ 
GetFileType{{ *
({{* +
file{{+ /
.{{/ 0
ContentType{{0 ;
){{; <
,{{< =
CreatedDate|| 
=||  !
null||" &
,||& '
CreatedName}} 
=}}  !
$str}}" $
,}}$ %
	CreatedBy~~ 
=~~ 
currentUser~~  +
} 
; 
uploadFiles
ÅÅ 
.
ÅÅ 
Add
ÅÅ 
(
ÅÅ  
upload
ÅÅ  &
)
ÅÅ& '
;
ÅÅ' (
}
ÇÇ 
return
ÑÑ 
uploadFiles
ÑÑ 
;
ÑÑ 
}
ÖÖ 	
private
áá 
string
áá 
GetFileType
áá "
(
áá" #
string
áá# )
contentType
áá* 5
)
áá5 6
{
àà 	
switch
ââ 
(
ââ 
contentType
ââ 
)
ââ  
{
ää 
case
ãã 
$str
ãã !
:
ãã! "
case
åå 
$str
åå  
:
åå  !
return
çç 
$str
çç "
;
çç" #
case
éé 
$str
éé )
:
éé) *
return
èè 
$str
èè !
;
èè! "
case
êê 
$str
êê &
:
êê& '
return
ëë 
$str
ëë  
;
ëë  !
default
íí 
:
íí 
return
ìì 
$str
ìì $
;
ìì$ %
}
îî 
}
ïï 	
}
óó 
}òò °
0D:\EltizamLive\Eltizam.Web\Helpers\HTMLHelper.cs
	namespace 	
Eltizam
 
. 
Web 
. 
Helpers 
{ 
public 

static 
class  
HMTLHelperExtensions ,
{ 
public 
static 
string 

IsSelected '
(' (
this( ,

HtmlHelper- 7
html8 <
,< =
string> D

controllerE O
=P Q
nullR V
,V W
stringX ^
action_ e
=f g
nullh l
,l m
stringn t
cssClassu }
=~ 
null
Ä Ñ
)
Ñ Ö
{		 	
if

 
(

 
String

 
.

 
IsNullOrEmpty

 $
(

$ %
cssClass

% -
)

- .
)

. /
cssClass 
= 
$str #
;# $
string 
currentAction  
=! "
(# $
string$ *
)* +
html+ /
./ 0
ViewContext0 ;
.; <
	RouteData< E
.E F
ValuesF L
[L M
$strM U
]U V
;V W
string 
currentController $
=% &
(' (
string( .
). /
html/ 3
.3 4
ViewContext4 ?
.? @
	RouteData@ I
.I J
ValuesJ P
[P Q
$strQ ]
]] ^
;^ _
if 
( 
String 
. 
IsNullOrEmpty $
($ %

controller% /
)/ 0
)0 1

controller 
= 
currentController .
;. /
if 
( 
String 
. 
IsNullOrEmpty $
($ %
action% +
)+ ,
), -
action 
= 
currentAction &
;& '
return 

controller 
==  
currentController! 2
&&3 5
action6 <
=== ?
currentAction@ M
?N O
cssClass 
: 
String !
.! "
Empty" '
;' (
} 	
public 
static 
string 
	PageClass &
(& '
this' +

HtmlHelper, 6
html7 ;
); <
{ 	
string 
currentAction  
=! "
(# $
string$ *
)* +
html+ /
./ 0
ViewContext0 ;
.; <
	RouteData< E
.E F
ValuesF L
[L M
$strM U
]U V
;V W
return 
currentAction  
;  !
} 	
} 
}   ñ	
-D:\EltizamLive\Eltizam.Web\Helpers\IHelper.cs
	namespace 	
Eltizam
 
. 
Web 
. 
Helpers 
{ 
public 

	interface 
IHelper 
{ 
int 
GetLoggedInUserId 
( 
) 
;  
string

 
GetToken

 
(

 
)

 
;

 
string 
IsManagementUser 
(  
)  !
;! "
int 
GetLoggedInRoleId 
( 
) 
;  
void 
LogExceptions 
( 
	Exception $
ex% '
)' (
;( )
List 
< 
RolePermissionModel  
>  !
GetMenusByRole" 0
(0 1
int1 4
loginRoleId5 @
)@ A
;A B
List 
< 
MasterDocumentModel  
>  !

FileUpload" ,
(, -
DocumentFilesModel- ?
document@ H
)H I
;I J
} 
} ú
7D:\EltizamLive\Eltizam.Web\Helpers\SessionExtensions.cs
	namespace 	
Eltizam
 
. 
Web 
. 
Helpers 
{ 
public 

static 
class 
SessionExtensions )
{ 
public 
static 
void 
	SetObject $
($ %
this% )
ISession* 2
session3 :
,: ;
string< B
keyC F
,F G
objectH N
valueO T
)T U
{		 	
session

 
.

 
	SetString

 
(

 
key

 !
,

! "
JsonConvert

# .
.

. /
SerializeObject

/ >
(

> ?
value

? D
)

D E
)

E F
;

F G
} 	
public 
static 
T 
	GetObject !
<! "
T" #
># $
($ %
this% )
ISession* 2
session3 :
,: ;
string< B
keyC F
)F G
{ 	
var 
value 
= 
session 
.  
	GetString  )
() *
key* -
)- .
;. /
return 
value 
== 
null  
?! "
default# *
(* +
T+ ,
), -
:. /
JsonConvert0 ;
.; <
DeserializeObject< M
<M N
TN O
>O P
(P Q
valueQ V
)V W
;W X
} 	
} 
} ﬁ
0D:\EltizamLive\Eltizam.Web\Helpers\UserHelper.cs
	namespace 	
Eltizam
 
. 
Web 
. 
Helpers 
{ 
public 

class 

UserHelper 
{ 
public 
static 
string 
EltizamToken )
=* +
$str, :
;: ;
public 
static 
string !
LogInUserEmailAddress 2
=3 4
$str5 O
;O P
public 
static 
string 
LogInUserName *
=+ ,
$str- ?
;? @
public		 
static		 
string		 
LogInUserId		 (
=		) *
$str		+ ;
;		; <
public

 
static

 
string

 
LogInRoleId

 (
=

) *
$str

+ ;
;

; <
public 
static 
string 
LogInRoleName *
=+ ,
$str- <
;< =
public 
static 
string 
ErrorMessage )
=* +
$str, :
;: ;
public 
static 
string 
SuccessMessage +
=, -
$str. >
;> ?
public 
static 
string 
IsManagement )
=* +
$str, :
;: ;
public 
static 
string 
ValReqHeader )
=* +
$str, :
;: ;
} 
} ´
3D:\EltizamLive\Eltizam.Web\Models\ErrorViewModel.cs
	namespace 	
Eltizam
 
. 
Web 
. 
Models 
{ 
public 

class 
ErrorViewModel 
{ 
public 
string 
? 
	RequestId  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
bool 
ShowRequestId !
=>" $
!% &
string& ,
., -
IsNullOrEmpty- :
(: ;
	RequestId; D
)D E
;E F
} 
}		 ê
%D:\EltizamLive\Eltizam.Web\Program.cs
	namespace 	
Eltizam
 
. 
Web 
{ 
public 

class 
Program 
{ 
public		 
static		 
void		 
Main		 
(		  
string		  &
[		& '
]		' (
args		) -
)		- .
{

 	
var 
config 
= 
new  
ConfigurationBuilder 1
(1 2
)2 3
. 
AddJsonFile 
( 
$str 0
)0 1
. 
Build 
( 
) 
; 
try 
{ 
Log 
. 
Logger 
= 
new  
LoggerConfiguration! 4
(4 5
)5 6
. 
ReadFrom 
. 
Configuration +
(+ ,
config, 2
)2 3
. 
CreateLogger !
(! "
)" #
;# $
CreateHostBuilder !
(! "
args" &
)& '
.' (
Build( -
(- .
). /
./ 0
Run0 3
(3 4
)4 5
;5 6
} 
catch 
{ 
} 
finally 
{ 
Log 
. 
CloseAndFlush !
(! "
)" #
;# $
} 
var 
builder 
= 
WebApplication (
.( )
CreateBuilder) 6
(6 7
args7 ;
); <
;< =
builder!! 
.!! 
Services!! 
.!! 
AddRazorPages!! *
(!!* +
)!!+ ,
."" &
AddRazorRuntimeCompilation"" +
(""+ ,
)"", -
;""- .
}## 	
public%% 
static%% 
IHostBuilder%% "
CreateHostBuilder%%# 4
(%%4 5
string%%5 ;
[%%; <
]%%< =
args%%> B
)%%B C
=>%%D F
Host&& 
.&&  
CreateDefaultBuilder&& %
(&&% &
args&&& *
)&&* +
.'' 

UseSerilog'' 
('' 
)'' 
.(( $
ConfigureWebHostDefaults(( )
((() *

webBuilder((* 4
=>((5 7
{)) 

webBuilder** 
.** 

UseStartup** )
<**) *
Startup*** 1
>**1 2
(**2 3
)**3 4
;**4 5
}++ 
)++ 
;++ 
},, 
}-- ˘T
%D:\EltizamLive\Eltizam.Web\Startup.cs
	namespace

 	
Eltizam


 
.

 
Web

 
{ 
public 

class 
Startup 
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
APIURLHelper 
. 
Configuration &
=' (
configuration) 6
;6 7
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
{ 	
services 
. 
AddOutputCaching %
(% &
)& '
;' (
services 
. 
AddMvc 
( 
config "
=># %
{ 
config 
. 
Filters 
. 
Add "
(" #
typeof# )
() *
ExceptionsFilter* :
): ;
); <
;< =
} 
) 
; 
services 
. 

AddSession 
(  
options  '
=>( *
{   
options!! 
.!! 
IdleTimeout!! #
=!!$ %
TimeSpan!!& .
.!!. /
FromMinutes!!/ :
(!!: ;
$num!!; >
)!!> ?
;!!? @
}"" 
)"" 
;"" 
services## 
.## 
AddCors## 
(## 
)## 
;## 
services$$ 
.$$ %
AddDistributedMemoryCache$$ .
($$. /
)$$/ 0
;$$0 1
services%% 
.%% 
AddSingleton%% !
<%%! "
ITempDataProvider%%" 3
,%%3 4"
CookieTempDataProvider%%5 K
>%%K L
(%%L M
)%%M N
;%%N O
services&& 
.&& 

AddSignalR&& 
(&&  
)&&  !
;&&! "
services(( 
.(( 
AddCors(( 
((( 
options(( $
=>((% '
{)) 
options** 
.** 
	AddPolicy** !
(**! "
$str**" 3
,**3 4
builder++ 
=>++ 
builder++ &
.++& '
AllowAnyOrigin++' 5
(++5 6
)++6 7
)++7 8
;++8 9
},, 
),, 
;,, 
services.. 
... #
AddControllersWithViews.. ,
(.., -
)..- .
;... /
var00 

mvcBuilder00 
=00 
services00 %
.00% &#
AddControllersWithViews00& =
(00= >
)00> ?
;00? @
services22 
.22 "
AddHttpContextAccessor22 +
(22+ ,
)22, -
;22- .
services55 
.55 
AddSingleton55 !
<55! " 
IHttpContextAccessor55" 6
,556 7
HttpContextAccessor558 K
>55K L
(55L M
)55M N
;55N O
services66 
.66 
AddTransient66 !
<66! "
IHelper66" )
,66) *
Helper66+ 1
>661 2
(662 3
)663 4
;664 5
services88 
.88 
	Configure88 
<88 
CookiePolicyOptions88 2
>882 3
(883 4
options884 ;
=>88< >
{99 
options;; 
.;; 
CheckConsentNeeded;; *
=;;+ ,
context;;- 4
=>;;5 7
true;;8 <
;;;< =
options<< 
.<< !
MinimumSameSitePolicy<< -
=<<. /
SameSiteMode<<0 <
.<<< =
None<<= A
;<<A B
}== 
)== 
;== 
services@@ 
.@@ 
	Configure@@ 
<@@ 
FormOptions@@ *
>@@* +
(@@+ ,
options@@, 3
=>@@4 6
{AA 
optionsBB 
.BB 
ValueLengthLimitBB (
=BB) *
intBB+ .
.BB. /
MaxValueBB/ 7
;BB7 8
optionsCC 
.CC $
MultipartBodyLengthLimitCC 0
=CC1 2
intCC3 6
.CC6 7
MaxValueCC7 ?
;CC? @
optionsDD 
.DD '
MultipartHeadersLengthLimitDD 3
=DD4 5
intDD6 9
.DD9 :
MaxValueDD: B
;DDB C
}EE 
)EE 
;EE 
servicesHH 
.HH 
AddAuthenticationHH &
(HH& '(
CookieAuthenticationDefaultsHH' C
.HHC D 
AuthenticationSchemeHHD X
)HHX Y
.II 
	AddCookieII 
(II 
optionsII !
=>II" $
{JJ 
}KK 
)KK 
;KK 
servicesNN 
.NN &
ConfigureApplicationCookieNN /
(NN/ 0
optionsNN0 7
=>NN8 :
{OO 
optionsQQ 
.QQ 
CookieQQ 
.QQ 
HttpOnlyQQ '
=QQ( )
trueQQ* .
;QQ. /
optionsRR 
.RR 
ExpireTimeSpanRR &
=RR' (
TimeSpanRR) 1
.RR1 2
FromMinutesRR2 =
(RR= >
$numRR> A
)RRA B
;RRB C
optionsSS 
.SS 
	LoginPathSS !
=SS" #
$strSS$ 4
;SS4 5
optionsTT 
.TT 

LogoutPathTT "
=TT# $
$strTT% 6
;TT6 7
optionsUU 
.UU 
AccessDeniedPathUU (
=UU) *
$strUU+ B
;UUB C
optionsVV 
.VV 
SlidingExpirationVV )
=VV* +
trueVV, 0
;VV0 1
}WW 
)WW 
;WW 
servicesYY 
.YY 
AddResourceYY  
(YY  !
)YY! "
;YY" #
services[[ 
.[[ 
AddLocalization[[ $
([[$ %
o[[% &
=>[[' )
{[[* +
o[[, -
.[[- .
ResourcesPath[[. ;
=[[< =
$str[[> I
;[[I J
}[[K L
)[[L M
;[[M N
services]] 
.]] 
	Configure]] 
<]] &
RequestLocalizationOptions]] 9
>]]9 :
(]]: ;
options]]; B
=>]]C E
{^^ 
options__ 
.__ 
SetDefaultCulture__ )
(__) *
$str__* 1
)__1 2
;__2 3
options`` 
.`` "
AddSupportedUICultures`` .
(``. /
$str``/ 6
,``6 7
$str``8 ?
)``? @
;``@ A
optionsaa 
.aa  
AddSupportedCulturesaa ,
(aa, -
$straa- 4
,aa4 5
$straa6 =
)aa= >
;aa> ?
optionsbb 
.bb &
FallBackToParentUICulturesbb 2
=bb3 4
truebb5 9
;bb9 :
optionscc 
.cc #
RequestCultureProviderscc /
.cc/ 0
Clearcc0 5
(cc5 6
)cc6 7
;cc7 8
}dd 
)dd 
;dd 
servicesff 
.ff #
AddControllersWithViewsff ,
(ff, -
)ff- .
.gg 
AddViewLocalizationgg $
(gg$ %.
"LanguageViewLocationExpanderFormatgg% G
.ggG H
SuffixggH N
)ggN O
.hh *
AddDataAnnotationsLocalizationhh /
(hh/ 0
)hh0 1
;hh1 2
}ii 	
publicll 
voidll 
	Configurell 
(ll 
IApplicationBuilderll 1
appll2 5
,ll5 6
IWebHostEnvironmentll7 J
envllK N
)llN O
{mm 	
ifnn 
(nn 
envnn 
.nn 
IsDevelopmentnn !
(nn! "
)nn" #
)nn# $
{oo 
apppp 
.pp %
UseDeveloperExceptionPagepp -
(pp- .
)pp. /
;pp/ 0
}qq 
elserr 
{ss 
apptt 
.tt 
UseExceptionHandlertt '
(tt' (
$strtt( 5
)tt5 6
;tt6 7
appvv 
.vv 
UseHstsvv 
(vv 
)vv 
;vv 
}ww 
varyy 
allowedOriginsyy 
=yy  
Configurationyy! .
.yy. /

GetSectionyy/ 9
(yy9 :
$stryy: J
)yyJ K
.yyK L
ValueyyL Q
.yyQ R
SplityyR W
(yyW X
$stryyX [
)yy[ \
;yy\ ]
app{{ 
.{{ 
UseCors{{ 
({{ 
builder{{ 
=>{{  "
builder{{# *
.||$ %
WithOrigins||% 0
(||0 1
allowedOrigins||1 ?
)||? @
.}}$ %
AllowAnyMethod}}% 3
(}}3 4
)}}4 5
.~~$ %
AllowAnyHeader~~% 3
(~~3 4
)~~4 5
.$ %
AllowCredentials% 5
(5 6
)6 7
)
ÄÄ 
;
ÄÄ 
app
ÅÅ 
.
ÅÅ 

UseSession
ÅÅ 
(
ÅÅ 
)
ÅÅ 
;
ÅÅ 
app
ÇÇ 
.
ÇÇ 
UseOutputCaching
ÇÇ  
(
ÇÇ  !
)
ÇÇ! "
;
ÇÇ" #
app
ÉÉ 
.
ÉÉ !
UseHttpsRedirection
ÉÉ #
(
ÉÉ# $
)
ÉÉ$ %
;
ÉÉ% &
app
ÑÑ 
.
ÑÑ 
UseStaticFiles
ÑÑ 
(
ÑÑ 
)
ÑÑ  
;
ÑÑ  !
app
ÖÖ 
.
ÖÖ 

UseRouting
ÖÖ 
(
ÖÖ 
)
ÖÖ 
;
ÖÖ 
app
ÜÜ 
.
ÜÜ 
UseAuthentication
ÜÜ !
(
ÜÜ! "
)
ÜÜ" #
;
ÜÜ# $
app
áá 
.
áá 
UseAuthorization
áá  
(
áá  !
)
áá! "
;
áá" #
app
ââ 
.
ââ 
UseEndpoints
ââ 
(
ââ 
	endpoints
ââ &
=>
ââ' )
{
ää 
	endpoints
ãã 
.
ãã  
MapControllerRoute
ãã ,
(
ãã, -
name
åå 
:
åå 
$str
åå #
,
åå# $
pattern
éé 
:
éé 
$str
éé H
)
ééH I
;
ééI J
}
èè 	
)
èè	 

;
èè
 
app
òò 
.
òò $
UseRequestLocalization
òò &
(
òò& '
)
òò' (
;
òò( )
}
öö 	
}
õõ 
}úú ı
ED:\EltizamLive\Eltizam.Web\Views\Notification\Notifications.cshtml.cs
	namespace 	
EltizamValuation
 
. 
Web 
. 
Views $
.$ %
Notification% 1
{ 
public 

class 
AllModel 
: 
	PageModel %
{ 
public 
void 
OnGet 
( 
) 
{		 	
}

 	
} 
} 