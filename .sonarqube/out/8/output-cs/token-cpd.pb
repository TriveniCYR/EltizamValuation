��
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
stringLocalizer	r �
,
� �
IHelper
� �
helper
� �
)
� �
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
string	JJz �
.
JJ� �
Empty
JJ� �
,
JJ� �
new
JJ� �
StringContent
JJ� �
(
JJ� �
JsonConvert
JJ� �
.
JJ� �
SerializeObject
JJ� �
(
JJ� �
loginViewModel
JJ� �
)
JJ� �
)
JJ� �
)
JJ� �
.
JJ� �
Result
JJ� �
;
JJ� �
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
XX� �
+
XX� �
roleId
XX� �
,
XX� �

HttpMethod
XX� �
.
XX� �
Get
XX� �
,
XX� �
oUserDetail
XX� �
.
XX� �
_object
XX� �
.
XX� �
	UserToken
XX� �
)
XX� �
.
XX� �
Result
XX� �
;
XX� �
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
rolJson	\\~ �
)
\\� �
;
\\� �
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
oUserDetail	~~~ �
.
~~� �
VallidTo
~~� �
}
~~� �
)
~~� �
;
~~� �
var
�� 
claims
�� 
=
�� 
new
�� 
List
�� !
<
��! "
Claim
��" '
>
��' (
{
�� 
new
�� 
Claim
�� 
(
�� 
$str
�� $
,
��$ %
oUserDetail
��& 1
.
��1 2
UserName
��2 :
)
��: ;
,
��; <
new
�� 
Claim
�� 
(
�� 
$str
�� $
,
��$ %
oUserDetail
��& 1
.
��1 2
UserName
��2 :
)
��: ;
,
��; <
new
�� 
Claim
�� 
(
�� 
$str
�� !
,
��! "
oUserDetail
��& 1
.
��1 2
Email
��2 7
)
��7 8
,
��8 9
new
�� 
Claim
�� 
(
�� 
$str
�� "
,
��" #
oUserDetail
��& 1
.
��1 2
RoleId
��2 8
.
��8 9
ToString
��9 A
(
��A B
)
��B C
)
��C D
,
��D E
new
�� 
Claim
�� 
(
�� 
$str
�� "
,
��" #
oUserDetail
��& 1
.
��1 2
UserId
��2 8
.
��8 9
ToString
��9 A
(
��A B
)
��B C
)
��C D
,
��D E
}
�� 
;
�� 
var
�� 
identity
�� 
=
�� 
new
�� 
ClaimsIdentity
�� -
(
��- .
claims
��. 4
,
��4 5*
CookieAuthenticationDefaults
��6 R
.
��R S"
AuthenticationScheme
��S g
)
��g h
;
��h i
var
�� 
	principal
�� 
=
�� 
new
�� 
ClaimsPrincipal
��  /
(
��/ 0
identity
��0 8
)
��8 9
;
��9 :
var
�� 
props
�� 
=
�� 
new
�� &
AuthenticationProperties
�� 4
(
��4 5
)
��5 6
;
��6 7
props
�� 
.
�� 
IsPersistent
�� 
=
��  
true
��! %
;
��% &
props
�� 
.
�� 

ExpiresUtc
�� 
=
�� 
oUserDetail
�� *
.
��* +
VallidTo
��+ 3
;
��3 4
HttpContext
�� 
.
�� 
SignInAsync
�� #
(
��# $*
CookieAuthenticationDefaults
��$ @
.
��@ A"
AuthenticationScheme
��A U
,
��U V
	principal
��W `
,
��` a
props
��b g
)
��g h
;
��h i
HttpContext
�� 
.
�� 
Session
�� 
.
��  
	SetString
��  )
(
��) *

UserHelper
��* 4
.
��4 5
LogInUserId
��5 @
,
��@ A
Convert
��B I
.
��I J
ToString
��J R
(
��R S
oUserDetail
��S ^
.
��^ _
UserId
��_ e
)
��e f
)
��f g
;
��g h
HttpContext
�� 
.
�� 
Session
�� 
.
��  
	SetString
��  )
(
��) *

UserHelper
��* 4
.
��4 5
LogInRoleId
��5 @
,
��@ A
Convert
��B I
.
��I J
ToString
��J R
(
��R S
oUserDetail
��S ^
.
��^ _
RoleId
��_ e
)
��e f
)
��f g
;
��g h
HttpContext
�� 
.
�� 
Session
�� 
.
��  
	SetString
��  )
(
��) *

UserHelper
��* 4
.
��4 5
LogInUserName
��5 B
,
��B C
oUserDetail
��D O
.
��O P
UserName
��P X
)
��X Y
;
��Y Z
HttpContext
�� 
.
�� 
Session
�� 
.
��  
	SetString
��  )
(
��) *

UserHelper
��* 4
.
��4 5
LogInRoleName
��5 B
,
��B C
oUserDetail
��D O
.
��O P
RoleName
��P X
)
��X Y
;
��Y Z
}
�� 	
public
�� 
IActionResult
�� 
ForGetPassword
�� +
(
��+ ,
)
��, -
{
�� 	
return
�� 
View
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
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
Logout
��) /
(
��/ 0
)
��0 1
{
�� 	
var
�� 
roleId
�� 
=
�� 
_helper
��  
.
��  !
GetLoggedInRoleId
��! 2
(
��2 3
)
��3 4
;
��4 5
await
�� 
HttpContext
�� 
.
�� 
SignOutAsync
�� *
(
��* +*
CookieAuthenticationDefaults
��+ G
.
��G H"
AuthenticationScheme
��H \
)
��\ ]
;
��] ^
HttpContext
�� 
.
�� 
Session
�� 
.
��  
Clear
��  %
(
��% &
)
��& '
;
��' (
UtilityHelper
�� 
.
�� 
RemoveModuleRole
�� *
(
��* +
roleId
��+ 1
)
��1 2
;
��2 3
HttpContext
�� 
.
�� 
Response
��  
.
��  !
Cookies
��! (
.
��( )
Delete
��) /
(
��/ 0

UserHelper
��0 :
.
��: ;
EltizamToken
��; G
)
��G H
;
��H I
return
�� 
RedirectToAction
�� #
(
��# $
$str
��$ +
,
��+ ,
$str
��- 6
)
��6 7
;
��7 8
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
IActionResult
�� 
ForgotPassword
�� +
(
��+ ,%
ForgotPasswordViewModel
��, C%
forgotPasswordViewModel
��D [
)
��[ \
{
�� 	
if
�� 
(
�� %
CheckEmailAddressExists
�� '
(
��' (%
forgotPasswordViewModel
��( ?
.
��? @
Email
��@ E
)
��E F
)
��F G
{
�� %
forgotPasswordViewModel
�� '
.
��' (
WebApplicationUrl
��( 9
=
��: ;
HttpContext
��< G
.
��G H
Request
��H O
.
��O P
Scheme
��P V
+
��W X
$str
��Y ^
+
��_ `
HttpContext
��a l
.
��l m
Request
��m t
.
��t u
Host
��u y
.
��y z
Value
��z 
;�� �
APIRepository
�� 
objapi
�� $
=
��% &
new
��' *
APIRepository
��+ 8
(
��8 9
_cofiguration
��9 F
)
��F G
;
��G H!
HttpResponseMessage
�� #
responseMessage
��$ 3
=
��4 5
objapi
��6 <
.
��< =
APICommunication
��= M
(
��M N
APIURLHelper
��N Z
.
��Z [
ForgotPassword
��[ i
,
��i j

HttpMethod
��k u
.
��u v
Post
��v z
,
��z {
string��| �
.��� �
Empty��� �
,��� �
new��� �
StringContent��� �
(��� �
JsonConvert��� �
.��� �
SerializeObject��� �
(��� �'
forgotPasswordViewModel��� �
)��� �
)��� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
)
��7 8
{
�� 
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
SuccessMessage
��( 6
]
��6 7
=
��8 9
AppConstants
��: F
.
��F G/
!msgLinkToResetpasswordSentOnEmail
��G h
;
��h i
return
�� 
View
�� 
(
��  
$str
��  0
)
��0 1
;
��1 2
}
�� 
else
�� 
{
�� 
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
ErrorMessage
��( 4
]
��4 5
=
��6 7
AppConstants
��8 D
.
��D E
SomeErrorOccurred
��E V
;
��V W
}
�� 
}
�� 
else
�� 
{
�� 
TempData
�� 
[
�� 

UserHelper
�� #
.
��# $
ErrorMessage
��$ 0
]
��0 1
=
��2 3
AppConstants
��4 @
.
��@ A/
!msgEmailAddressNotExistIndatabase
��A b
;
��b c
return
�� 
View
�� 
(
�� 
$str
�� ,
)
��, -
;
��- .
}
�� 
return
�� 
View
�� 
(
�� 
$str
�� (
)
��( )
;
��) *
}
�� 	
[
�� 	
	NonAction
��	 
]
�� 
public
�� 
bool
�� %
CheckEmailAddressExists
�� +
(
��+ ,
string
��, 2
EmailAddress
��3 ?
)
��? @
{
�� 	
bool
�� 

EmailExist
�� 
=
�� 
true
�� "
;
��" #
try
�� 
{
�� 
APIRepository
�� 
objapi
�� $
=
��% &
new
��' *
(
��* +
_cofiguration
��+ 8
)
��8 9
;
��9 :!
HttpResponseMessage
�� #
responseMessage
��$ 3
=
��4 5
objapi
��6 <
.
��< =
APICommunication
��= M
(
��M N
APIURLHelper
��N Z
.
��Z [/
!Anonymous_CheckEmailAddressExists
��[ |
+
��} ~
$str�� �
+��� �
EmailAddress��� �
,��� �

HttpMethod��� �
.��� �
Get��� �
,��� �
string��� �
.��� �
Empty��� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
)
��7 8
{
�� 
string
�� 
jsonResponse
�� '
=
��( )
responseMessage
��* 9
.
��9 :
Content
��: A
.
��A B
ReadAsStringAsync
��B S
(
��S T
)
��T U
.
��U V
Result
��V \
;
��\ ]

EmailExist
�� 
=
��  
JsonConvert
��! ,
.
��, -
DeserializeObject
��- >
<
��> ?
bool
��? C
>
��C D
(
��D E
jsonResponse
��E Q
)
��Q R
;
��R S
return
�� 

EmailExist
�� %
;
��% &
}
�� 
return
�� 

EmailExist
�� !
;
��! "
}
�� 
catch
�� 
(
�� 
	Exception
�� 
e
�� 
)
�� 
{
�� 
_helper
�� 
.
�� 
LogExceptions
�� %
(
��% &
e
��& '
)
��' (
;
��( )
throw
�� 
e
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
IActionResult
�� 
ResetPassword
�� *
(
��* +
)
��+ ,
{
�� 	
return
�� 
View
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
	NonAction
��	 
]
�� 
public
�� 
bool
�� +
CheckResetPasswordTokenExists
�� 1
(
��1 2
string
��2 8
token
��9 >
)
��> ?
{
�� 	
bool
�� 

TokenExist
�� 
=
�� 
false
�� #
;
��# $
try
�� 
{
�� 
APIRepository
�� 
objapi
�� $
=
��% &
new
��' *
(
��* +
_cofiguration
��+ 8
)
��8 9
;
��9 :!
HttpResponseMessage
�� #
responseMessage
��$ 3
=
��4 5
objapi
��6 <
.
��< =
APICommunication
��= M
(
��M N
APIURLHelper
��N Z
.
��Z [$
Anonymous_IsTokenValid
��[ q
+
��r s
$str
��t w
+
��x y
token
��z 
,�� �

HttpMethod��� �
.��� �
Get��� �
,��� �
string��� �
.��� �
Empty��� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
)
��7 8
{
�� 
string
�� 
jsonResponse
�� '
=
��( )
responseMessage
��* 9
.
��9 :
Content
��: A
.
��A B
ReadAsStringAsync
��B S
(
��S T
)
��T U
.
��U V
Result
��V \
;
��\ ]

TokenExist
�� 
=
��  
JsonConvert
��! ,
.
��, -
DeserializeObject
��- >
<
��> ?
bool
��? C
>
��C D
(
��D E
jsonResponse
��E Q
)
��Q R
;
��R S
return
�� 

TokenExist
�� %
;
��% &
}
�� 
return
�� 

TokenExist
�� !
;
��! "
}
�� 
catch
�� 
(
�� 
	Exception
�� 
e
�� 
)
�� 
{
�� 
_helper
�� 
.
�� 
LogExceptions
�� %
(
��% &
e
��& '
)
��' (
;
��( )
throw
�� 
e
�� 
;
�� 
}
�� 
}
�� 	
[
�� 	
HttpGet
��	 
]
�� 
public
�� 
IActionResult
�� 
ResetPassword
�� *
(
��* +
[
��+ ,
	FromQuery
��, 5
]
��5 6
string
��7 =
	userToken
��> G
)
��G H
{
�� 	+
MasterUserResetPasswordEntity
�� )!
resetPasswordEntity
��* =
=
��> ?
new
��@ C+
MasterUserResetPasswordEntity
��D a
(
��a b
)
��b c
;
��c d
try
�� 
{
�� 
if
�� 
(
�� +
CheckResetPasswordTokenExists
�� 1
(
��1 2
	userToken
��2 ;
)
��; <
)
��< =
{
�� 
string
�� 
strValue
�� #
=
��$ %
HttpContext
��& 1
.
��1 2
Request
��2 9
.
��9 :
Query
��: ?
[
��? @
$str
��@ K
]
��K L
.
��L M
ToString
��M U
(
��U V
)
��V W
;
��W X!
resetPasswordEntity
�� '
.
��' (!
ForgotPasswordToken
��( ;
=
��< =
strValue
��> F
;
��F G
return
�� 
View
�� 
(
��  
$str
��  /
,
��/ 0!
resetPasswordEntity
��1 D
)
��D E
;
��E F
}
�� 
else
�� 
{
�� 
return
�� 
RedirectToAction
�� +
(
��+ ,
$str
��, 3
)
��3 4
;
��4 5
}
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
e
�� 
)
�� 
{
�� 
_helper
�� 
.
�� 
LogExceptions
�� %
(
��% &
e
��& '
)
��' (
;
��( )
ViewBag
�� 
.
�� 
Message
�� 
=
��  !
Convert
��" )
.
��) *
ToString
��* 2
(
��2 3
e
��3 4
.
��4 5

StackTrace
��5 ?
)
��? @
;
��@ A
return
�� 
View
�� 
(
�� 
)
�� 
;
�� 
}
�� 
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
IActionResult
�� 
ResetPassword
�� *
(
��* ++
MasterUserResetPasswordEntity
��+ H%
masterUserresetpassword
��I `
)
��` a
{
�� 	
try
�� 
{
�� 
APIRepository
�� 
objapi
�� $
=
��% &
new
��' *
APIRepository
��+ 8
(
��8 9
_cofiguration
��9 F
)
��F G
;
��G H!
HttpResponseMessage
�� #
responseMessage
��$ 3
=
��4 5
objapi
��6 <
.
��< =
APICommunication
��= M
(
��M N
APIURLHelper
��N Z
.
��Z [
ResetPassword
��[ h
,
��h i

HttpMethod
��j t
.
��t u
Post
��u y
,
��y z
string��{ �
.��� �
Empty��� �
,��� �
new��� �
StringContent��� �
(��� �
JsonConvert��� �
.��� �
SerializeObject��� �
(��� �'
masterUserresetpassword��� �
)��� �
)��� �
)��� �
.��� �
Result��� �
;��� �
string
�� 
jsonResponse
�� #
=
��$ %
responseMessage
��& 5
.
��5 6
Content
��6 =
.
��= >
ReadAsStringAsync
��> O
(
��O P
)
��P Q
.
��Q R
Result
��R X
;
��X Y
var
�� 
data
�� 
=
�� 
JsonConvert
�� &
.
��& '
DeserializeObject
��' 8
<
��8 9
APIResponseEntity
��9 J
<
��J K
string
��K Q
>
��Q R
>
��R S
(
��S T
jsonResponse
��T `
)
��` a
;
��a b
if
�� 
(
�� 
data
�� 
.
�� 
_object
��  
==
��! #
$str
��$ 7
)
��7 8
{
�� 
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
SuccessMessage
��( 6
]
��6 7
=
��8 9
AppConstants
��: F
.
��F G*
msgPasswordResetSuccessfully
��G c
;
��c d
return
�� 
View
�� 
(
��  
$str
��  /
,
��/ 0%
masterUserresetpassword
��1 H
)
��H I
;
��I J
}
�� 
else
�� 
if
�� 
(
�� 
data
�� 
.
�� 
_object
�� %
==
��& (
$str
��) 7
)
��7 8
{
�� 
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
ErrorMessage
��( 4
]
��4 5
=
��6 7
AppConstants
��8 D
.
��D E*
msgResetPasswordTokenExpired
��E a
;
��a b
return
�� 
View
�� 
(
��  
$str
��  /
,
��/ 0%
masterUserresetpassword
��1 H
)
��H I
;
��I J
}
�� 
else
�� 
{
�� 
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
ErrorMessage
��( 4
]
��4 5
=
��6 7
AppConstants
��8 D
.
��D E
msgInvalidLink
��E S
;
��S T
}
�� 
return
�� 
View
�� 
(
�� 
$str
�� +
,
��+ ,%
masterUserresetpassword
��- D
)
��D E
;
��E F
}
�� 
catch
�� 
(
�� 
	Exception
�� 
e
�� 
)
�� 
{
�� 
_helper
�� 
.
�� 
LogExceptions
�� %
(
��% &
e
��& '
)
��' (
;
��( )
ViewBag
�� 
.
�� 
Message
�� 
=
��  !
Convert
��" )
.
��) *
ToString
��* 2
(
��2 3
e
��3 4
.
��4 5

StackTrace
��5 ?
)
��? @
;
��@ A
return
�� 
View
�� 
(
�� 
$str
�� +
,
��+ ,%
masterUserresetpassword
��- D
)
��D E
;
��E F
}
�� 
}
�� 	
public
�� 
IActionResult
�� 
ProfileDetails
�� +
(
��+ ,
)
��, -
{
�� 	
return
�� 
View
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpGet
��	 
]
�� 
public
�� 
IActionResult
�� 
ChangePassword
�� +
(
��+ ,
)
��, -
{
�� 	
return
�� 
View
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
IActionResult
�� 
ChangePassword
�� +
(
��+ ,!
ChangePasswordModel
��, ?
passwordModel
��@ M
)
��M N
{
�� 	
int
�� 
rolId
�� 
=
�� 
_helper
�� 
.
��  
GetLoggedInRoleId
��  1
(
��1 2
)
��2 3
;
��3 4
passwordModel
�� 
.
�� 
UserId
��  
=
��! "
rolId
��# (
;
��( )
try
�� 
{
�� 
HttpContext
�� 
.
�� 
Request
�� #
.
��# $
Cookies
��$ +
.
��+ ,
TryGetValue
��, 7
(
��7 8

UserHelper
��8 B
.
��B C
EltizamToken
��C O
,
��O P
out
��Q T
string
��U [
token
��\ a
)
��a b
;
��b c
APIRepository
�� 
objapi
�� $
=
��% &
new
��' *
(
��* +
_cofiguration
��+ 8
)
��8 9
;
��9 :!
HttpResponseMessage
�� #
responseMessage
��$ 3
=
��4 5
objapi
��6 <
.
��< =
APICommunication
��= M
(
��M N
APIURLHelper
��N Z
.
��Z [
ChangePassword
��[ i
,
��i j

HttpMethod
��k u
.
��u v
Post
��v z
,
��z {
token��| �
,��� �
new��� �
StringContent��� �
(��� �
JsonConvert��� �
.��� �
SerializeObject��� �
(��� �
passwordModel��� �
)��� �
)��� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
)
��7 8
{
�� 
string
�� 
jsonResponse
�� '
=
��( )
responseMessage
��* 9
.
��9 :
Content
��: A
.
��A B
ReadAsStringAsync
��B S
(
��S T
)
��T U
.
��U V
Result
��V \
;
��\ ]
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
SuccessMessage
��( 6
]
��6 7
=
��8 9
AppConstants
��: F
.
��F G
ActionSuccess
��G T
;
��T U
return
�� 
RedirectToAction
�� +
(
��+ ,
nameof
��, 2
(
��2 3
Login
��3 8
)
��8 9
)
��9 :
;
��: ;
}
�� 
else
�� 
{
�� 
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
ErrorMessage
��( 4
]
��4 5
=
��6 7
Convert
��8 ?
.
��? @
ToString
��@ H
(
��H I
responseMessage
��I X
.
��X Y
Content
��Y `
.
��` a
ReadAsStringAsync
��a r
(
��r s
)
��s t
.
��t u
Result
��u {
)
��{ |
;
��| }
}
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
e
�� 
)
�� 
{
�� 
_helper
�� 
.
�� 
LogExceptions
�� %
(
��% &
e
��& '
)
��' (
;
��( )
TempData
�� 
[
�� 

UserHelper
�� #
.
��# $
ErrorMessage
��$ 0
]
��0 1
=
��2 3
Convert
��4 ;
.
��; <
ToString
��< D
(
��D E
e
��E F
.
��F G

StackTrace
��G Q
)
��Q R
;
��R S
}
�� 
return
�� 
View
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
}
�� 
}�� �O
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
77� �
?
77� �
DateTo
77� �
=
77� �
null
77� �
)
77� �
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
null	[[} �
,
[[� �
DateTime
[[� �
?
[[� �
DateTo
[[� �
=
[[� �
null
[[� �
)
[[� �
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
}xx �8
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
}rr �
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
} �
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
} �
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
IHelper	{ �
helper
� �
)
� �
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

HttpMethod	@@v �
.
@@� �
Post
@@� �
,
@@� �
token
@@� �
,
@@� �
new
@@� �
StringContent
@@� �
(
@@� �
JsonConvert
@@� �
.
@@� �
SerializeObject
@@� �
(
@@� �!
masterapproverlevel
@@� �
)
@@� �
)
@@� �
)
@@� �
.
@@� �
Result
@@� �
;
@@� �
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
)	TT �
;
TT� �
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
id	}}~ �
,
}}� �

HttpMethod
}}� �
.
}}� �
Get
}}� �
,
}}� �
token
}}� �
)
}}� �
.
}}� �
Result
}}� �
;
}}� �
if 
( 
responseMessage #
.# $
IsSuccessStatusCode$ 7
)7 8
{
�� 
string
�� 
jsonResponse
�� '
=
��( )
responseMessage
��* 9
.
��9 :
Content
��: A
.
��A B
ReadAsStringAsync
��B S
(
��S T
)
��T U
.
��U V
Result
��V \
;
��\ ]
var
�� 
data
�� 
=
�� 
JsonConvert
�� *
.
��* +
DeserializeObject
��+ <
<
��< =
APIResponseEntity
��= N
<
��N O&
MasterApproverLevelModel
��O g
>
��g h
>
��h i
(
��i j
jsonResponse
��j v
)
��v w
;
��w x

FooterInfo
�� 
(
�� 
TableNameEnum
�� ,
.
��, -!
Master_PropertyType
��- @
,
��@ A
_cofiguration
��B O
,
��O P
id
��Q S
)
��S T
;
��T U
if
�� 
(
�� 
data
�� 
.
�� 
_object
�� $
is
��% '
null
��( ,
)
��, -
return
�� 
NotFound
�� '
(
��' (
)
��( )
;
��) *
return
�� 
View
�� 
(
��  
$str
��  ;
,
��; <
data
��= A
.
��A B
_object
��B I
)
��I J
;
��J K
}
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
}
�� 	
[
�� 	
HttpGet
��	 
]
�� 
public
�� 
IActionResult
�� '
MasterApproverLevelDetail
�� 6
(
��6 7
int
��7 :
?
��: ;
id
��< >
)
��> ?
{
�� 	
var
�� 
action
�� 
=
�� 
PermissionEnum
�� '
.
��' (
View
��( ,
;
��, -
int
�� 
roleId
�� 
=
�� 
_helper
��  
.
��  !
GetLoggedInRoleId
��! 2
(
��2 3
)
��3 4
;
��4 5
if
�� 
(
�� 
!
�� 
CheckRoleAccess
��  
(
��  !"
ModulePermissionEnum
��! 5
.
��5 6
ApproverMaster
��6 D
,
��D E
action
��F L
,
��L M
roleId
��N T
)
��T U
)
��U V
return
�� 
RedirectToAction
�� '
(
��' (
AppConstants
��( 4
.
��4 5
AccessRestriction
��5 F
,
��F G
AppConstants
��H T
.
��T U
Home
��U Y
)
��Y Z
;
��Z [&
MasterApproverLevelModel
�� $!
masterapproverlevel
��% 8
;
��8 9
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
||
�� 
id
��  
<=
��! #
$num
��$ %
)
��% &
{
�� !
masterapproverlevel
�� #
=
��$ %
new
��& )&
MasterApproverLevelModel
��* B
(
��B C
)
��C D
;
��D E
return
�� 
View
�� 
(
�� !
masterapproverlevel
�� /
)
��/ 0
;
��0 1
}
�� 
else
�� 
{
�� 
HttpContext
�� 
.
�� 
Request
�� #
.
��# $
Cookies
��$ +
.
��+ ,
TryGetValue
��, 7
(
��7 8

UserHelper
��8 B
.
��B C
EltizamToken
��C O
,
��O P
out
��Q T
string
��U [
token
��\ a
)
��a b
;
��b c
APIRepository
�� 
objapi
�� $
=
��% &
new
��' *
(
��* +
_cofiguration
��+ 8
)
��8 9
;
��9 :!
HttpResponseMessage
�� #
responseMessage
��$ 3
=
��4 5
objapi
��6 <
.
��< =
APICommunication
��= M
(
��M N
APIURLHelper
��N Z
.
��Z [(
GetMasterApproverLevelById
��[ u
+
��v w
$str
��x {
+
��| }
id��~ �
,��� �

HttpMethod��� �
.��� �
Get��� �
,��� �
token��� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
)
��7 8
{
�� 
string
�� 
jsonResponse
�� '
=
��( )
responseMessage
��* 9
.
��9 :
Content
��: A
.
��A B
ReadAsStringAsync
��B S
(
��S T
)
��T U
.
��U V
Result
��V \
;
��\ ]
var
�� 
data
�� 
=
�� 
JsonConvert
�� *
.
��* +
DeserializeObject
��+ <
<
��< =
APIResponseEntity
��= N
<
��N O&
MasterApproverLevelModel
��O g
>
��g h
>
��h i
(
��i j
jsonResponse
��j v
)
��v w
;
��w x

FooterInfo
�� 
(
�� 
TableNameEnum
�� ,
.
��, -!
MasterApproverLevel
��- @
,
��@ A
_cofiguration
��B O
,
��O P
id
��Q S
,
��S T
true
��U Y
)
��Y Z
;
��Z [
return
�� 
View
�� 
(
��  
$str
��  ;
,
��; <
data
��= A
.
��A B
_object
��B I
)
��I J
;
��J K
}
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
}
�� 	
}
�� 
}�� ��
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
helper	| �
)
� �
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
.	SS �
Get
SS� �
,
SS� �
token
SS� �
)
SS� �
.
SS� �
Result
SS� �
;
SS� �
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
�� 
.
�� 
Document
�� '
=
��( )
null
��* .
;
��. /
}
�� 
if
�� 
(
�� 

masterUser
�� 
.
�� 
File
�� #
!=
��$ &
null
��' +
)
��+ ,
{
�� !
MasterDocumentModel
�� '
docs
��( ,
=
��- .
ProfileUpload
��/ <
(
��< =

masterUser
��= G
.
��G H
File
��H L
)
��L M
;
��M N

masterUser
�� 
.
�� 
uploadProfile
�� ,
=
��- .
docs
��/ 3
;
��3 4

masterUser
�� 
.
�� 
File
�� #
=
��$ %
null
��& *
;
��* +
}
�� 
if
�� 
(
�� 

masterUser
�� 
.
�� 
Id
�� !
==
��" $
$num
��% &
)
��& '

masterUser
�� 
.
�� 
	CreatedBy
�� (
=
��) *
_helper
��+ 2
.
��2 3
GetLoggedInUserId
��3 D
(
��D E
)
��E F
;
��F G

masterUser
�� 
.
�� 

ModifiedBy
�� %
=
��& '
_helper
��( /
.
��/ 0
GetLoggedInUserId
��0 A
(
��A B
)
��B C
;
��C D
HttpContext
�� 
.
�� 
Request
�� #
.
��# $
Cookies
��$ +
.
��+ ,
TryGetValue
��, 7
(
��7 8

UserHelper
��8 B
.
��B C
EltizamToken
��C O
,
��O P
out
��Q T
string
��U [
token
��\ a
)
��a b
;
��b c
APIRepository
�� 
objapi
�� $
=
��% &
new
��' *
(
��* +
_cofiguration
��+ 8
)
��8 9
;
��9 :!
HttpResponseMessage
�� #
responseMessage
��$ 3
=
��4 5
objapi
��6 <
.
��< =
APICommunication
��= M
(
��M N
APIURLHelper
��N Z
.
��Z [
UpsertClient
��[ g
,
��g h

HttpMethod
��i s
.
��s t
Post
��t x
,
��x y
token
��z 
,�� �
new��� �
StringContent��� �
(��� �
JsonConvert��� �
.��� �
SerializeObject��� �
(��� �

masterUser��� �
)��� �
)��� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
&&
��8 :

masterUser
��; E
.
��E F
Id
��F H
==
��H J
$num
��J K
)
��K L
{
�� 
string
�� 
jsonResponse
�� '
=
��( )
responseMessage
��* 9
.
��9 :
Content
��: A
.
��A B
ReadAsStringAsync
��B S
(
��S T
)
��T U
.
��U V
Result
��V \
;
��\ ]
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
SuccessMessage
��( 6
]
��6 7
=
��8 9
Convert
��: A
.
��A B
ToString
��B J
(
��J K$
_stringLocalizerShared
��K a
[
��a b
$str
��b v
]
��v w
)
��w x
;
��x y
return
�� 
RedirectToAction
�� +
(
��+ ,
$str
��, 5
)
��5 6
;
��6 7
}
�� 
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
)
��7 8
{
�� 
string
�� 
jsonResponse
�� '
=
��( )
responseMessage
��* 9
.
��9 :
Content
��: A
.
��A B
ReadAsStringAsync
��B S
(
��S T
)
��T U
.
��U V
Result
��V \
;
��\ ]
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
SuccessMessage
��( 6
]
��6 7
=
��8 9
Convert
��: A
.
��A B
ToString
��B J
(
��J K$
_stringLocalizerShared
��K a
[
��a b
$str
��b v
]
��v w
)
��w x
;
��x y
return
�� 
Redirect
�� #
(
��# $
$"
��$ &
$str
��& D
{
��D E

masterUser
��E O
.
��O P
Id
��P R
}
��R S
"
��S T
)
��T U
;
��U V
}
�� 
else
�� 
{
�� 
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
ErrorMessage
��( 4
]
��4 5
=
��6 7
Convert
��8 ?
.
��? @
ToString
��@ H
(
��H I
responseMessage
��I X
.
��X Y
Content
��Y `
.
��` a
ReadAsStringAsync
��a r
(
��r s
)
��s t
.
��t u
Result
��u {
)
��{ |
;
��| }
return
�� 
RedirectToAction
�� +
(
��+ ,
$str
��, :
,
��: ;
new
��< ?
{
��@ A
id
��B D
=
��E F

masterUser
��G Q
.
��Q R
Id
��R T
}
��U V
)
��V W
;
��W X
}
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
e
�� 
)
�� 
{
�� 
_helper
�� 
.
�� 
LogExceptions
�� %
(
��% &
e
��& '
)
��' (
;
��( )
TempData
�� 
[
�� 

UserHelper
�� #
.
��# $
ErrorMessage
��$ 0
]
��0 1
=
��2 3
Convert
��4 ;
.
��; <
ToString
��< D
(
��D E
e
��E F
.
��F G

StackTrace
��G Q
)
��Q R
;
��R S
return
�� 
RedirectToAction
�� '
(
��' (
$str
��( 6
,
��6 7
new
��8 ;
{
��< =
Id
��> @
=
��A B

masterUser
��C M
.
��M N
Id
��N P
}
��Q R
)
��R S
;
��S T
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
�� *
)
��* +
]
��+ ,
public
�� 
IActionResult
�� 
ClientDetail
�� )
(
��) *
int
��* -
?
��- .
id
��/ 1
)
��1 2
{
�� 	
var
�� 
action
�� 
=
�� 
PermissionEnum
�� '
.
��' (
View
��( ,
;
��, -
int
�� 
roleId
�� 
=
�� 
_helper
��  
.
��  !
GetLoggedInRoleId
��! 2
(
��2 3
)
��3 4
;
��4 5
if
�� 
(
�� 
!
�� 
CheckRoleAccess
��  
(
��  !"
ModulePermissionEnum
��! 5
.
��5 6
ClientMaster
��6 B
,
��B C
action
��D J
,
��J K
roleId
��L R
)
��R S
)
��S T
return
�� 
RedirectToAction
�� '
(
��' (
AppConstants
��( 4
.
��4 5
AccessRestriction
��5 F
,
��F G
AppConstants
��H T
.
��T U
Home
��U Y
)
��Y Z
;
��Z [
MasterClientModel
�� 

masterUser
�� (
;
��( )
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
||
�� 
id
��  
<=
��! #
$num
��$ %
)
��% &
{
�� 

masterUser
�� 
=
�� 
new
��  
MasterClientModel
��! 2
(
��2 3
)
��3 4
;
��4 5
return
�� 
RedirectToAction
�� '
(
��' (
$str
��( 0
)
��0 1
;
��1 2
}
�� 
else
�� 
{
�� 
HttpContext
�� 
.
�� 
Request
�� #
.
��# $
Cookies
��$ +
.
��+ ,
TryGetValue
��, 7
(
��7 8

UserHelper
��8 B
.
��B C
EltizamToken
��C O
,
��O P
out
��Q T
string
��U [
token
��\ a
)
��a b
;
��b c
APIRepository
�� 
objapi
�� $
=
��% &
new
��' *
(
��* +
_cofiguration
��+ 8
)
��8 9
;
��9 :!
HttpResponseMessage
�� #
responseMessage
��$ 3
=
��4 5
objapi
��6 <
.
��< =
APICommunication
��= M
(
��M N
APIURLHelper
��N Z
.
��Z [
GetClientById
��[ h
+
��i j
$str
��k n
+
��o p
id
��q s
,
��s t

HttpMethod
��u 
.�� �
Get��� �
,��� �
token��� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
)
��7 8
{
�� 
string
�� 
jsonResponse
�� '
=
��( )
responseMessage
��* 9
.
��9 :
Content
��: A
.
��A B
ReadAsStringAsync
��B S
(
��S T
)
��T U
.
��U V
Result
��V \
;
��\ ]
var
�� 
data
�� 
=
�� 
JsonConvert
�� *
.
��* +
DeserializeObject
��+ <
<
��< =
APIResponseEntity
��= N
<
��N O
MasterClientModel
��O `
>
��` a
>
��a b
(
��b c
jsonResponse
��c o
)
��o p
;
��p q

FooterInfo
�� 
(
�� 
TableNameEnum
�� ,
.
��, -
Master_Client
��- :
,
��: ;
_cofiguration
��< I
,
��I J
id
��K M
,
��M N
true
��O S
)
��S T
;
��T U
if
�� 
(
�� 
data
�� 
.
�� 
_object
�� $
is
��% '
null
��( ,
)
��, -
return
�� 
NotFound
�� '
(
��' (
)
��( )
;
��) *
return
�� 
View
�� 
(
��  
data
��  $
.
��$ %
_object
��% ,
)
��, -
;
��- .
}
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
}
�� 	
private
�� !
MasterDocumentModel
�� #
ProfileUpload
��$ 1
(
��1 2
	IFormFile
��2 ;
pic
��< ?
)
��? @
{
�� 	!
MasterDocumentModel
�� 

uploadFils
��  *
=
��+ ,
new
��- 0!
MasterDocumentModel
��1 D
(
��D E
)
��E F
;
��F G
if
�� 
(
�� 
pic
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� 
ArgumentException
�� +
(
��+ ,
$str
��, E
)
��E F
;
��F G
}
�� 
var
�� 
currentUser
�� 
=
�� 
_helper
�� %
.
��% &
GetLoggedInUserId
��& 7
(
��7 8
)
��8 9
;
��9 :
var
�� 
savedFileNames
�� 
=
��  
new
��! $
List
��% )
<
��) *
string
��* 0
>
��0 1
(
��1 2
)
��2 3
;
��3 4
var
�� 
allowedFileTypes
��  
=
��! "
new
��# &
List
��' +
<
��+ ,
string
��, 2
>
��2 3
{
��4 5
$str
��6 B
,
��B C
$str
��D O
,
��O P
$str
��Q \
}
��] ^
;
��^ _
if
�� 
(
�� 
!
�� 
allowedFileTypes
�� !
.
��! "
Contains
��" *
(
��* +
pic
��+ .
.
��. /
ContentType
��/ :
)
��: ;
)
��; <
{
�� 
throw
�� 
new
�� 
ArgumentException
�� +
(
��+ ,
$"
��, .
$str
��. 9
{
��9 :
pic
��: =
.
��= >
ContentType
��> I
}
��I J
$str
��J [
"
��[ \
)
��\ ]
;
��] ^
}
�� 
var
�� 
fileName
�� 
=
�� 
Guid
�� 
.
��  
NewGuid
��  '
(
��' (
)
��( )
.
��) *
ToString
��* 2
(
��2 3
)
��3 4
+
��5 6
Path
��7 ;
.
��; <
GetExtension
��< H
(
��H I
pic
��I L
.
��L M
FileName
��M U
)
��U V
;
��V W
var
�� 
docName
�� 
=
�� 
pic
�� 
.
�� 
FileName
�� &
;
��& '
var
�� 
filePath
�� 
=
�� 
Path
�� 
.
��  
Combine
��  '
(
��' (
$str
��( 9
,
��9 :
fileName
��; C
)
��C D
;
��D E
filePath
�� 
=
�� 
filePath
�� 
.
��  
Replace
��  '
(
��' (
$str
��( ,
,
��, -
$str
��. 1
)
��1 2
;
��2 3
using
�� 
(
�� 
var
�� 
stream
�� 
=
�� 
new
��  #

FileStream
��$ .
(
��. /
filePath
��/ 7
,
��7 8
FileMode
��9 A
.
��A B
Create
��B H
)
��H I
)
��I J
{
�� 
pic
�� 
.
�� 
CopyToAsync
�� 
(
��  
stream
��  &
)
��& '
;
��' (
}
�� 
var
�� 
upload
�� 
=
�� 
new
�� !
MasterDocumentModel
�� 0
{
�� 
FileName
�� 
=
�� 
fileName
�� #
,
��# $
FilePath
�� 
=
�� 
filePath
�� #
.
��# $
Replace
��$ +
(
��+ ,
$str
��, 5
,
��5 6
$str
��7 ;
)
��; <
,
��< =
DocumentName
�� 
=
�� 
docName
�� &
,
��& '
IsActive
�� 
=
�� 
true
�� 
,
��  
	CreatedBy
�� 
=
�� 
currentUser
�� '
,
��' (
FileType
�� 
=
�� 
pic
�� 
.
�� 
ContentType
�� *
,
��* +
CreatedDate
�� 
=
�� 
null
�� "
,
��" #
CreatedName
�� 
=
�� 
$str
��  
}
�� 
;
�� 
return
�� 
upload
�� 
;
�� 
}
�� 	
}
�� 
}�� �f
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
� �
)
� �
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

HttpMethod	DDy �
.
DD� �
Get
DD� �
,
DD� �
token
DD� �
)
DD� �
.
DD� �
Result
DD� �
;
DD� �
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
token	mm~ �
,
mm� �
new
mm� �
StringContent
mm� �
(
mm� �
JsonConvert
mm� �
.
mm� �
SerializeObject
mm� �
(
mm� �

masterUser
mm� �
)
mm� �
)
mm� �
)
mm� �
.
mm� �
Result
mm� �
;
mm� �
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
�� 
RedirectToAction
�� +
(
��+ ,
$str
��, 8
)
��8 9
;
��9 :
}
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
e
�� 
)
�� 
{
�� 
_helper
�� 
.
�� 
LogExceptions
�� %
(
��% &
e
��& '
)
��' (
;
��( )
TempData
�� 
[
�� 

UserHelper
�� #
.
��# $
ErrorMessage
��$ 0
]
��0 1
=
��2 3
Convert
��4 ;
.
��; <
ToString
��< D
(
��D E
e
��E F
.
��F G

StackTrace
��G Q
)
��Q R
;
��R S
return
�� 
RedirectToAction
�� '
(
��' (
$str
��( 4
)
��4 5
;
��5 6
}
�� 
}
�� 	
}
�� 
}�� ��
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
� �
)
� �
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
token	00} �
)
00� �
.
00� �
Result
00� �
;
00� �
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
token	\\~ �
,
\\� �
new
\\� �
StringContent
\\� �
(
\\� �
JsonConvert
\\� �
.
\\� �
SerializeObject
\\� �
(
\\� �
masterDepartment
\\� �
)
\\� �
)
\\� �
)
\\� �
.
\\� �
Result
\\� �
;
\\� �
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
�� 
[
�� 
$str
�� !
]
��! "
=
��# $
true
��% )
;
��) *
}
�� 
if
�� 
(
�� 
view
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
ViewData
�� 
[
�� 
$str
�� !
]
��! "
=
��# $
true
��% )
;
��) *
}
�� $
MasterDepartmentEntity
�� "
masterDepartment
��# 3
;
��3 4
var
�� 
action
�� 
=
�� 
id
�� 
==
�� 
null
�� #
?
��$ %
PermissionEnum
��& 4
.
��4 5
Add
��5 8
:
��9 :
PermissionEnum
��; I
.
��I J
Edit
��J N
;
��N O
int
�� 
roleId
�� 
=
�� 
_helper
��  
.
��  !
GetLoggedInRoleId
��! 2
(
��2 3
)
��3 4
;
��4 5
if
�� 
(
�� 
!
�� 
CheckRoleAccess
��  
(
��  !"
ModulePermissionEnum
��! 5
.
��5 6
DepartmentMaster
��6 F
,
��F G
action
��H N
,
��N O
roleId
��P V
)
��V W
)
��W X
return
�� 
RedirectToAction
�� '
(
��' (
AppConstants
��( 4
.
��4 5
AccessRestriction
��5 F
,
��F G
AppConstants
��H T
.
��T U
Home
��U Y
)
��Y Z
;
��Z [
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
||
�� 
id
��  
<=
��! #
$num
��$ %
)
��% &
{
�� 
masterDepartment
��  
=
��! "
new
��# &$
MasterDepartmentEntity
��' =
(
��= >
)
��> ?
;
��? @
masterDepartment
��  
.
��  !
IsActive
��! )
=
��* +
$num
��, -
;
��- .
return
�� 
View
�� 
(
�� 
masterDepartment
�� ,
)
��, -
;
��- .
}
�� 
else
�� 
{
�� 
HttpContext
�� 
.
�� 
Request
�� #
.
��# $
Cookies
��$ +
.
��+ ,
TryGetValue
��, 7
(
��7 8

UserHelper
��8 B
.
��B C
EltizamToken
��C O
,
��O P
out
��Q T
string
��U [
token
��\ a
)
��a b
;
��b c
APIRepository
�� 
objapi
�� $
=
��% &
new
��' *
(
��* +
_cofiguration
��+ 8
)
��8 9
;
��9 :!
HttpResponseMessage
�� #
responseMessage
��$ 3
=
��4 5
objapi
��6 <
.
��< =
APICommunication
��= M
(
��M N
APIURLHelper
��N Z
.
��Z [
GetDepartmentById
��[ l
+
��m n
$str
��o r
+
��s t
id
��u w
,
��w x

HttpMethod��y �
.��� �
Get��� �
,��� �
token��� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
)
��7 8
{
�� 
string
�� 
jsonResponse
�� '
=
��( )
responseMessage
��* 9
.
��9 :
Content
��: A
.
��A B
ReadAsStringAsync
��B S
(
��S T
)
��T U
.
��U V
Result
��V \
;
��\ ]
var
�� 
data
�� 
=
�� 
JsonConvert
�� *
.
��* +
DeserializeObject
��+ <
<
��< =
APIResponseEntity
��= N
<
��N O$
MasterDepartmentEntity
��O e
>
��e f
>
��f g
(
��g h
jsonResponse
��h t
)
��t u
;
��u v
if
�� 
(
�� 
data
�� 
.
�� 
_object
�� $
is
��% '
null
��( ,
)
��, -
return
�� 
NotFound
�� '
(
��' (
)
��( )
;
��) *
return
�� 
View
�� 
(
��  
data
��  $
.
��$ %
_object
��% ,
)
��, -
;
��- .
}
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
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
�� *
)
��* +
]
��+ ,
public
�� 
IActionResult
�� 
DepartmentView
�� +
(
��+ ,
int
��, /
?
��/ 0
id
��1 3
)
��3 4
{
�� 	$
MasterDepartmentEntity
�� "
masterDepartment
��# 3
;
��3 4
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
||
�� 
id
��  
<=
��! #
$num
��$ %
)
��% &
{
�� 
masterDepartment
��  
=
��! "
new
��# &$
MasterDepartmentEntity
��' =
(
��= >
)
��> ?
;
��? @
return
�� 
View
�� 
(
�� 
masterDepartment
�� ,
)
��, -
;
��- .
}
�� 
else
�� 
{
�� 
HttpContext
�� 
.
�� 
Request
�� #
.
��# $
Cookies
��$ +
.
��+ ,
TryGetValue
��, 7
(
��7 8

UserHelper
��8 B
.
��B C
EltizamToken
��C O
,
��O P
out
��Q T
string
��U [
token
��\ a
)
��a b
;
��b c
APIRepository
�� 
objapi
�� $
=
��% &
new
��' *
(
��* +
_cofiguration
��+ 8
)
��8 9
;
��9 :!
HttpResponseMessage
�� #
responseMessage
��$ 3
=
��4 5
objapi
��6 <
.
��< =
APICommunication
��= M
(
��M N
APIURLHelper
��N Z
.
��Z [
GetDepartmentById
��[ l
+
��m n
$str
��o r
+
��s t
id
��u w
,
��w x

HttpMethod��y �
.��� �
Get��� �
,��� �
token��� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
)
��7 8
{
�� 
string
�� 
jsonResponse
�� '
=
��( )
responseMessage
��* 9
.
��9 :
Content
��: A
.
��A B
ReadAsStringAsync
��B S
(
��S T
)
��T U
.
��U V
Result
��V \
;
��\ ]
var
�� 
data
�� 
=
�� 
JsonConvert
�� *
.
��* +
DeserializeObject
��+ <
<
��< =
APIResponseEntity
��= N
<
��N O$
MasterDepartmentEntity
��O e
>
��e f
>
��f g
(
��g h
jsonResponse
��h t
)
��t u
;
��u v
if
�� 
(
�� 
data
�� 
.
�� 
_object
�� $
is
��% '
null
��( ,
)
��, -
return
�� 
NotFound
�� '
(
��' (
)
��( )
;
��) *
return
�� 
View
�� 
(
��  
data
��  $
.
��$ %
_object
��% ,
)
��, -
;
��- .
}
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
}
�� 	
}
�� 
}�� ��
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
IHelper	y �
helper
� �
)
� �
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
roleId	**{ �
)
**� �
;
**� �
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
token	//~ �
)
//� �
.
//� �
Result
//� �
;
//� �
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
token	WW �
,
WW� �
new
WW� �
StringContent
WW� �
(
WW� �
JsonConvert
WW� �
.
WW� �
SerializeObject
WW� �
(
WW� �
masterDesignation
WW� �
)
WW� �
)
WW� �
)
WW� �
.
WW� �
Result
WW� �
;
WW� �
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
�� 
(
�� 
!
�� 
CheckRoleAccess
��  
(
��  !"
ModulePermissionEnum
��! 5
.
��5 6
DesignationMaster
��6 G
,
��G H
action
��I O
,
��O P
roleId
��Q W
)
��W X
)
��X Y
return
�� 
RedirectToAction
�� '
(
��' (
AppConstants
��( 4
.
��4 5
AccessRestriction
��5 F
,
��F G
AppConstants
��H T
.
��T U
Home
��U Y
)
��Y Z
;
��Z [
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
||
�� 
id
��  
<=
��! #
$num
��$ %
)
��% &
{
�� 
masterDesignation
�� !
=
��" #
new
��$ '%
MasterDesignationEntity
��( ?
(
��? @
)
��@ A
;
��A B
masterDesignation
�� !
.
��! "
IsActive
��" *
=
��+ ,
$num
��- .
;
��. /
return
�� 
View
�� 
(
�� 
masterDesignation
�� -
)
��- .
;
��. /
}
�� 
else
�� 
{
�� 
HttpContext
�� 
.
�� 
Request
�� #
.
��# $
Cookies
��$ +
.
��+ ,
TryGetValue
��, 7
(
��7 8

UserHelper
��8 B
.
��B C
EltizamToken
��C O
,
��O P
out
��Q T
string
��U [
token
��\ a
)
��a b
;
��b c
APIRepository
�� 
objapi
�� $
=
��% &
new
��' *
(
��* +
_cofiguration
��+ 8
)
��8 9
;
��9 :!
HttpResponseMessage
�� #
responseMessage
��$ 3
=
��4 5
objapi
��6 <
.
��< =
APICommunication
��= M
(
��M N
APIURLHelper
��N Z
.
��Z [
GetesignationById
��[ l
+
��m n
$str
��o r
+
��s t
id
��u w
,
��w x

HttpMethod��y �
.��� �
Get��� �
,��� �
token��� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
)
��7 8
{
�� 
string
�� 
jsonResponse
�� '
=
��( )
responseMessage
��* 9
.
��9 :
Content
��: A
.
��A B
ReadAsStringAsync
��B S
(
��S T
)
��T U
.
��U V
Result
��V \
;
��\ ]
var
�� 
data
�� 
=
�� 
JsonConvert
�� *
.
��* +
DeserializeObject
��+ <
<
��< =
APIResponseEntity
��= N
<
��N O%
MasterDesignationEntity
��O f
>
��f g
>
��g h
(
��h i
jsonResponse
��i u
)
��u v
;
��v w
if
�� 
(
�� 
data
�� 
.
�� 
_object
�� $
is
��% '
null
��( ,
)
��, -
return
�� 
NotFound
�� '
(
��' (
)
��( )
;
��) *
return
�� 
View
�� 
(
��  
data
��  $
.
��$ %
_object
��% ,
)
��, -
;
��- .
}
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
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
�� 
IActionResult
�� 
DesignationView
�� ,
(
��, -
int
��- 0
?
��0 1
id
��2 4
)
��4 5
{
�� 	
if
�� 
(
�� 
id
�� 
!=
�� 
null
�� 
)
�� 
{
�� 
ViewData
�� 
[
�� 
$str
�� !
]
��! "
=
��# $
true
��% )
;
��) *
}
�� 
var
�� 
action
�� 
=
�� 
id
�� 
==
�� 
null
�� #
?
��$ %
PermissionEnum
��& 4
.
��4 5
Add
��5 8
:
��9 :
PermissionEnum
��; I
.
��I J
Edit
��J N
;
��N O
int
�� 
roleId
�� 
=
�� 
_helper
��  
.
��  !
GetLoggedInRoleId
��! 2
(
��2 3
)
��3 4
;
��4 5
if
�� 
(
�� 
!
�� 
CheckRoleAccess
��  
(
��  !"
ModulePermissionEnum
��! 5
.
��5 6
DesignationMaster
��6 G
,
��G H
action
��I O
,
��O P
roleId
��Q W
)
��W X
)
��X Y
return
�� 
RedirectToAction
�� '
(
��' (
AppConstants
��( 4
.
��4 5
AccessRestriction
��5 F
,
��F G
AppConstants
��H T
.
��T U
Home
��U Y
)
��Y Z
;
��Z [%
MasterDesignationEntity
�� #
masterDesignation
��$ 5
;
��5 6
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
||
�� 
id
��  
<=
��! #
$num
��$ %
)
��% &
{
�� 
masterDesignation
�� !
=
��" #
new
��$ '%
MasterDesignationEntity
��( ?
(
��? @
)
��@ A
;
��A B
return
�� 
View
�� 
(
�� 
masterDesignation
�� -
)
��- .
;
��. /
}
�� 
else
�� 
{
�� 
HttpContext
�� 
.
�� 
Request
�� #
.
��# $
Cookies
��$ +
.
��+ ,
TryGetValue
��, 7
(
��7 8

UserHelper
��8 B
.
��B C
EltizamToken
��C O
,
��O P
out
��Q T
string
��U [
token
��\ a
)
��a b
;
��b c
APIRepository
�� 
objapi
�� $
=
��% &
new
��' *
(
��* +
_cofiguration
��+ 8
)
��8 9
;
��9 :!
HttpResponseMessage
�� #
responseMessage
��$ 3
=
��4 5
objapi
��6 <
.
��< =
APICommunication
��= M
(
��M N
APIURLHelper
��N Z
.
��Z [
GetesignationById
��[ l
+
��m n
$str
��o r
+
��s t
id
��u w
,
��w x

HttpMethod��y �
.��� �
Get��� �
,��� �
token��� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
)
��7 8
{
�� 
string
�� 
jsonResponse
�� '
=
��( )
responseMessage
��* 9
.
��9 :
Content
��: A
.
��A B
ReadAsStringAsync
��B S
(
��S T
)
��T U
.
��U V
Result
��V \
;
��\ ]
var
�� 
data
�� 
=
�� 
JsonConvert
�� *
.
��* +
DeserializeObject
��+ <
<
��< =
APIResponseEntity
��= N
<
��N O%
MasterDesignationEntity
��O f
>
��f g
>
��g h
(
��h i
jsonResponse
��i u
)
��u v
;
��v w
if
�� 
(
�� 
data
�� 
.
�� 
_object
�� $
is
��% '
null
��( ,
)
��, -
return
�� 
NotFound
�� '
(
��' (
)
��( )
;
��) *
return
�� 
View
�� 
(
��  
data
��  $
.
��$ %
_object
��% ,
)
��, -
;
��- .
}
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
}
�� 	
}
�� 
}�� ��
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
� �
)
� �
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
QQ� �
.
QQ� �
Get
QQ� �
,
QQ� �
token
QQ� �
)
QQ� �
.
QQ� �
Result
QQ� �
;
QQ� �
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
�� 
[
�� 
$str
�� ,
]
��, -
=
��. /
data
��0 4
;
��4 5
return
�� 
View
�� 
(
��  
)
��  !
;
��! "
}
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
}
�� 	
public
�� 
IActionResult
�� %
DictionaryDetailsManage
�� 4
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
��@ A
status
��B H
,
��H I
string
��J P
?
��P Q
pdesc
��R W
)
��W X
{
�� 	

ModelState
�� 
.
�� 
Clear
�� 
(
�� 
)
�� 
;
�� (
MasterDictionaryDetailById
�� &
masterdictionary
��' 7
;
��7 8
if
�� 
(
�� 
id
�� 
>
�� 
$num
�� 
&&
�� 
status
��  
==
��! #
$num
��$ %
)
��% &
{
�� 
masterdictionary
��  
=
��! "
new
��# &(
MasterDictionaryDetailById
��' A
(
��A B
)
��B C
;
��C D
masterdictionary
��  
.
��  !
DictionaryId
��! -
=
��. /
id
��0 2
;
��2 3
masterdictionary
��  
.
��  !
ParentDescription
��! 2
=
��3 4
pdesc
��5 :
;
��: ;
return
�� 
View
�� 
(
�� 
masterdictionary
�� ,
)
��, -
;
��- .
}
�� 
else
�� 
{
�� 
HttpContext
�� 
.
�� 
Request
�� #
.
��# $
Cookies
��$ +
.
��+ ,
TryGetValue
��, 7
(
��7 8

UserHelper
��8 B
.
��B C
EltizamToken
��C O
,
��O P
out
��Q T
string
��U [
token
��\ a
)
��a b
;
��b c
APIRepository
�� 
objapi
�� $
=
��% &
new
��' *
(
��* +
_cofiguration
��+ 8
)
��8 9
;
��9 :
var
�� 
	urlHelper
�� 
=
�� 
APIURLHelper
��  ,
.
��, -
GetDictionaryById
��- >
+
��? @
$str
��A D
+
��E F
id
��G I
;
��I J!
HttpResponseMessage
�� #
responseMessage
��$ 3
=
��4 5
objapi
��6 <
.
��< =
APICommunication
��= M
(
��M N
	urlHelper
��N W
,
��W X

HttpMethod
��Y c
.
��c d
Get
��d g
,
��g h
token
��i n
)
��n o
.
��o p
Result
��p v
;
��v w
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
)
��7 8
{
�� 
string
�� 
jsonResponse
�� '
=
��( )
responseMessage
��* 9
.
��9 :
Content
��: A
.
��A B
ReadAsStringAsync
��B S
(
��S T
)
��T U
.
��U V
Result
��V \
;
��\ ]
var
�� 
data
�� 
=
�� 
JsonConvert
�� *
.
��* +
DeserializeObject
��+ <
<
��< =(
MasterDictionaryDetailById
��= W
>
��W X
(
��X Y
jsonResponse
��Y e
)
��e f
;
��f g

FooterInfo
�� 
(
�� 
TableNameEnum
�� ,
.
��, -
Master_Dictionary
��- >
,
��> ?
_cofiguration
��@ M
,
��M N
id
��O Q
)
��Q R
;
��R S
if
�� 
(
�� 
data
�� 
is
�� 
null
��  $
)
��$ %
return
�� 
NotFound
�� '
(
��' (
)
��( )
;
��) *
data
�� 
.
�� 
ParentDescription
�� *
=
��+ ,
pdesc
��- 2
;
��2 3
return
�� 
View
�� 
(
��  
data
��  $
)
��$ %
;
��% &
}
�� 
return
�� 
View
�� 
(
�� 
)
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
IActionResult
�� #
DictionaryDetailsView
�� 2
(
��2 3
int
��3 6
id
��7 9
)
��9 :
{
�� 	
var
�� 
action
�� 
=
�� 
PermissionEnum
�� '
.
��' (
View
��( ,
;
��, -
int
�� 
roleId
�� 
=
�� 
_helper
��  
.
��  !
GetLoggedInRoleId
��! 2
(
��2 3
)
��3 4
;
��4 5
if
�� 
(
�� 
!
�� 
CheckRoleAccess
��  
(
��  !"
ModulePermissionEnum
��! 5
.
��5 6
DictionaryMaster
��6 F
,
��F G
action
��H N
,
��N O
roleId
��P V
)
��V W
)
��W X
return
�� 
RedirectToAction
�� '
(
��' (
AppConstants
��( 4
.
��4 5
AccessRestriction
��5 F
,
��F G
AppConstants
��H T
.
��T U
Home
��U Y
)
��Y Z
;
��Z [(
MasterDictionaryDetailById
�� &
model
��' ,
=
��- .
new
��/ 2(
MasterDictionaryDetailById
��3 M
(
��M N
)
��N O
;
��O P
HttpContext
�� 
.
�� 
Request
�� 
.
��  
Cookies
��  '
.
��' (
TryGetValue
��( 3
(
��3 4

UserHelper
��4 >
.
��> ?
EltizamToken
��? K
,
��K L
out
��M P
string
��Q W
token
��X ]
)
��] ^
;
��^ _
ViewData
�� 
[
�� 
$str
�� 
]
��  
=
��! "
id
��# %
;
��% &
APIRepository
�� 
objapi
��  
=
��! "
new
��# &
(
��& '
_cofiguration
��' 4
)
��4 5
;
��5 6
var
�� 
	urlHelper
�� 
=
�� 
APIURLHelper
�� (
.
��( )
GetDictionaryById
��) :
+
��; <
$str
��= @
+
��A B
id
��C E
;
��E F!
HttpResponseMessage
�� 
responseMessage
��  /
=
��0 1
objapi
��2 8
.
��8 9
APICommunication
��9 I
(
��I J
	urlHelper
��J S
,
��S T

HttpMethod
��U _
.
��_ `
Get
��` c
,
��c d
token
��e j
)
��j k
.
��k l
Result
��l r
;
��r s
if
�� 
(
�� 
responseMessage
�� 
.
��  !
IsSuccessStatusCode
��  3
)
��3 4
{
�� 
string
�� 
jsonResponse
�� #
=
��$ %
responseMessage
��& 5
.
��5 6
Content
��6 =
.
��= >
ReadAsStringAsync
��> O
(
��O P
)
��P Q
.
��Q R
Result
��R X
;
��X Y
var
�� 
data
�� 
=
�� 
JsonConvert
�� &
.
��& '
DeserializeObject
��' 8
<
��8 9(
MasterDictionaryDetailById
��9 S
>
��S T
(
��T U
jsonResponse
��U a
)
��a b
;
��b c

FooterInfo
�� 
(
�� 
TableNameEnum
�� (
.
��( )
Master_Dictionary
��) :
,
��: ;
_cofiguration
��< I
,
��I J
id
��K M
,
��M N
true
��O S
)
��S T
;
��T U
if
�� 
(
�� 
data
�� 
is
�� 
null
��  
)
��  !
return
�� 
NotFound
�� #
(
��# $
)
��$ %
;
��% &
return
�� 
View
�� 
(
�� 
data
��  
)
��  !
;
��! "
}
�� 
return
�� 
View
�� 
(
�� 
model
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
IActionResult
�� %
DictionaryDetailsManage
�� 4
(
��4 5
int
��5 8
?
��8 9
Id
��: <
,
��< =(
MasterDictionaryDetailById
��> X
masterdictionary
��Y i
)
��i j
{
�� 	
try
�� 
{
�� 
var
�� 
action
�� 
=
�� 
Id
�� 
==
��  "
null
��# '
?
��( )
PermissionEnum
��* 8
.
��8 9
Edit
��9 =
:
��> ?
PermissionEnum
��@ N
.
��N O
View
��O S
;
��S T
int
�� 
roleId
�� 
=
�� 
_helper
�� $
.
��$ %
GetLoggedInRoleId
��% 6
(
��6 7
)
��7 8
;
��8 9
if
�� 
(
�� 
!
�� 
CheckRoleAccess
�� $
(
��$ %"
ModulePermissionEnum
��% 9
.
��9 :
DictionaryMaster
��: J
,
��J K
action
��L R
,
��R S
roleId
��T Z
)
��Z [
)
��[ \
return
�� 
RedirectToAction
�� +
(
��+ ,
AppConstants
��, 8
.
��8 9
AccessRestriction
��9 J
,
��J K
AppConstants
��L X
.
��X Y
Home
��Y ]
)
��] ^
;
��^ _
if
�� 
(
�� 
masterdictionary
�� $
.
��$ %
Id
��% '
==
��( *
$num
��+ ,
)
��, -
masterdictionary
�� $
.
��$ %
	CreatedBy
��% .
=
��/ 0
_helper
��1 8
.
��8 9
GetLoggedInUserId
��9 J
(
��J K
)
��K L
;
��L M
masterdictionary
��  
.
��  !

ModifiedBy
��! +
=
��, -
_helper
��. 5
.
��5 6
GetLoggedInUserId
��6 G
(
��G H
)
��H I
;
��I J
HttpContext
�� 
.
�� 
Request
�� #
.
��# $
Cookies
��$ +
.
��+ ,
TryGetValue
��, 7
(
��7 8

UserHelper
��8 B
.
��B C
EltizamToken
��C O
,
��O P
out
��Q T
string
��U [
token
��\ a
)
��a b
;
��b c
APIRepository
�� 
objapi
�� $
=
��% &
new
��' *
(
��* +
_cofiguration
��+ 8
)
��8 9
;
��9 :!
HttpResponseMessage
�� #
responseMessage
��$ 3
=
��4 5
objapi
��6 <
.
��< =
APICommunication
��= M
(
��M N
APIURLHelper
��N Z
.
��Z [
UpsertDictionary
��[ k
,
��k l

HttpMethod
��m w
.
��w x
Post
��x |
,
��| }
token��~ �
,��� �
new��� �
StringContent��� �
(��� �
JsonConvert��� �
.��� �
SerializeObject��� �
(��� � 
masterdictionary��� �
)��� �
)��� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
)
��7 8
{
�� 
string
�� 
jsonResponse
�� '
=
��( )
responseMessage
��* 9
.
��9 :
Content
��: A
.
��A B
ReadAsStringAsync
��B S
(
��S T
)
��T U
.
��U V
Result
��V \
;
��\ ]
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
SuccessMessage
��( 6
]
��6 7
=
��8 9
Convert
��: A
.
��A B
ToString
��B J
(
��J K$
_stringLocalizerShared
��K a
[
��a b
$str
��b v
]
��v w
)
��w x
;
��x y
return
�� 
RedirectToAction
�� +
(
��+ ,
$str
��, A
,
��A B
new
��C F
{
��G H
id
��I K
=
��L M
masterdictionary
��N ^
.
��^ _
DictionaryId
��_ k
,
��k l
description
��m x
=
��y z
masterdictionary��{ �
.��� �!
ParentDescription��� �
}��� �
)��� �
;��� �
}
�� 
else
�� 
{
�� 
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
ErrorMessage
��( 4
]
��4 5
=
��6 7
Convert
��8 ?
.
��? @
ToString
��@ H
(
��H I
responseMessage
��I X
.
��X Y
Content
��Y `
.
��` a
ReadAsStringAsync
��a r
(
��r s
)
��s t
.
��t u
Result
��u {
)
��{ |
;
��| }
return
�� 
RedirectToAction
�� +
(
��+ ,
$str
��, A
,
��A B
new
��C F
{
��G H
id
��I K
=
��L M
masterdictionary
��N ^
.
��^ _
DictionaryId
��_ k
}
��l m
)
��m n
;
��n o
}
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
e
�� 
)
�� 
{
�� 
_helper
�� 
.
�� 
LogExceptions
�� %
(
��% &
e
��& '
)
��' (
;
��( )
TempData
�� 
[
�� 

UserHelper
�� #
.
��# $
ErrorMessage
��$ 0
]
��0 1
=
��2 3
Convert
��4 ;
.
��; <
ToString
��< D
(
��D E
e
��E F
.
��F G

StackTrace
��G Q
)
��Q R
;
��R S
return
�� 
RedirectToAction
�� '
(
��' (
$str
��( =
,
��= >
new
��? B
{
��C D
Id
��E G
=
��H I
masterdictionary
��J Z
.
��Z [
DictionaryId
��[ g
}
��h i
)
��i j
;
��j k
}
�� 
}
�� 	
}
�� 
}�� ϐ
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
helper	~ �
)
� �
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

HttpMethod	GGw �
.
GG� �
Get
GG� �
,
GG� �
token
GG� �
)
GG� �
.
GG� �
Result
GG� �
;
GG� �
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

HttpMethod	uuw �
.
uu� �
Get
uu� �
,
uu� �
token
uu� �
)
uu� �
.
uu� �
Result
uu� �
;
uu� �
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
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
IActionResult
�� 
LocationManage
�� +
(
��+ ,
int
��, /
id
��0 2
,
��2 3"
MasterLocationEntity
��4 H
masterlocation
��I W
)
��W X
{
�� 	
try
�� 
{
�� 
var
�� 
action
�� 
=
�� 
id
�� 
==
��  "
null
��# '
?
��( )
PermissionEnum
��* 8
.
��8 9
Edit
��9 =
:
��> ?
PermissionEnum
��@ N
.
��N O
Add
��O R
;
��R S
int
�� 
roleId
�� 
=
�� 
_helper
�� $
.
��$ %
GetLoggedInRoleId
��% 6
(
��6 7
)
��7 8
;
��8 9
if
�� 
(
�� 
!
�� 
CheckRoleAccess
�� $
(
��$ %"
ModulePermissionEnum
��% 9
.
��9 :
LocationMaster
��: H
,
��H I
action
��J P
,
��P Q
roleId
��R X
)
��X Y
)
��Y Z
return
�� 
RedirectToAction
�� +
(
��+ ,
AppConstants
��, 8
.
��8 9
AccessRestriction
��9 J
,
��J K
AppConstants
��L X
.
��X Y
Home
��Y ]
)
��] ^
;
��^ _
if
�� 
(
�� 
masterlocation
�� "
.
��" #
Id
��# %
==
��& (
$num
��) *
)
��* +
masterlocation
�� "
.
��" #
	CreatedBy
��# ,
=
��- .
_helper
��/ 6
.
��6 7
GetLoggedInUserId
��7 H
(
��H I
)
��I J
;
��J K
masterlocation
�� 
.
�� 

ModifiedBy
�� )
=
��* +
_helper
��, 3
.
��3 4
GetLoggedInUserId
��4 E
(
��E F
)
��F G
;
��G H
HttpContext
�� 
.
�� 
Request
�� #
.
��# $
Cookies
��$ +
.
��+ ,
TryGetValue
��, 7
(
��7 8

UserHelper
��8 B
.
��B C
EltizamToken
��C O
,
��O P
out
��Q T
string
��U [
token
��\ a
)
��a b
;
��b c
APIRepository
�� 
objapi
�� $
=
��% &
new
��' *
(
��* +
_cofiguration
��+ 8
)
��8 9
;
��9 :!
HttpResponseMessage
�� #
responseMessage
��$ 3
=
��4 5
objapi
��6 <
.
��< =
APICommunication
��= M
(
��M N
APIURLHelper
��N Z
.
��Z [
UpsertLocation
��[ i
,
��i j

HttpMethod
��k u
.
��u v
Post
��v z
,
��z {
token��| �
,��� �
new��� �
StringContent��� �
(��� �
JsonConvert��� �
.��� �
SerializeObject��� �
(��� �
masterlocation��� �
)��� �
)��� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
&&
��8 :
masterlocation
��; I
.
��I J
Id
��J L
==
��L N
$num
��N O
)
��O P
{
�� 
string
�� 
jsonResponse
�� '
=
��( )
responseMessage
��* 9
.
��9 :
Content
��: A
.
��A B
ReadAsStringAsync
��B S
(
��S T
)
��T U
.
��U V
Result
��V \
;
��\ ]
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
SuccessMessage
��( 6
]
��6 7
=
��8 9
Convert
��: A
.
��A B
ToString
��B J
(
��J K$
_stringLocalizerShared
��K a
[
��a b
$str
��b v
]
��v w
)
��w x
;
��x y
return
�� 
RedirectToAction
�� +
(
��+ ,
nameof
��, 2
(
��2 3
	Locations
��3 <
)
��< =
)
��= >
;
��> ?
}
�� 
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
)
��7 8
{
�� 
string
�� 
jsonResponse
�� '
=
��( )
responseMessage
��* 9
.
��9 :
Content
��: A
.
��A B
ReadAsStringAsync
��B S
(
��S T
)
��T U
.
��U V
Result
��V \
;
��\ ]
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
SuccessMessage
��( 6
]
��6 7
=
��8 9
Convert
��: A
.
��A B
ToString
��B J
(
��J K$
_stringLocalizerShared
��K a
[
��a b
$str
��b v
]
��v w
)
��w x
;
��x y
return
�� 
Redirect
�� #
(
��# $
$"
��$ &
$str
��& H
{
��H I
masterlocation
��I W
.
��W X
Id
��X Z
}
��Z [
"
��[ \
)
��\ ]
;
��] ^
}
�� 
else
�� 
{
�� 
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
ErrorMessage
��( 4
]
��4 5
=
��6 7
Convert
��8 ?
.
��? @
ToString
��@ H
(
��H I
responseMessage
��I X
.
��X Y
Content
��Y `
.
��` a
ReadAsStringAsync
��a r
(
��r s
)
��s t
.
��t u
Result
��u {
)
��{ |
;
��| }
return
�� 
RedirectToAction
�� +
(
��+ ,
$str
��, <
,
��< =
new
��> A
{
��B C
id
��D F
=
��G H
masterlocation
��I W
.
��W X
Id
��X Z
}
��[ \
)
��\ ]
;
��] ^
}
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
e
�� 
)
�� 
{
�� 
_helper
�� 
.
�� 
LogExceptions
�� %
(
��% &
e
��& '
)
��' (
;
��( )
TempData
�� 
[
�� 

UserHelper
�� #
.
��# $
ErrorMessage
��$ 0
]
��0 1
=
��2 3
Convert
��4 ;
.
��; <
ToString
��< D
(
��D E
e
��E F
.
��F G

StackTrace
��G Q
)
��Q R
;
��R S
return
�� 
RedirectToAction
�� '
(
��' (
$str
��( 8
,
��8 9
new
��: =
{
��> ?
Id
��@ B
=
��C D
masterlocation
��E S
.
��S T
Id
��T V
}
��W X
)
��X Y
;
��Y Z
}
�� 
}
�� 	
}
�� 
}�� ѥ
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
helper	~ �
)
� �
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
Get	DD~ �
,
DD� �
token
DD� �
)
DD� �
.
DD� �
Result
DD� �
;
DD� �
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

HttpMethod	YYw �
.
YY� �
Get
YY� �
,
YY� �
token
YY� �
)
YY� �
.
YY� �
Result
YY� �
;
YY� �
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
PropertySubTypeId	{{q �
;
{{� �
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
�� #
responseMessage
��$ 3
=
��4 5
objapi
��6 <
.
��< =
APICommunication
��= M
(
��M N
APIURLHelper
��N Z
.
��Z [
UpsertProperty
��[ i
,
��i j

HttpMethod
��k u
.
��u v
Post
��v z
,
��z {
token��| �
,��� �
new��� �
StringContent��� �
(��� �
JsonConvert��� �
.��� �
SerializeObject��� �
(��� �
masterProperty��� �
)��� �
)��� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
&&
��8 :
masterProperty
��; I
.
��I J
Id
��J L
==
��L N
$num
��N O
)
��O P
{
�� 
string
�� 
jsonResponse
�� '
=
��( )
responseMessage
��* 9
.
��9 :
Content
��: A
.
��A B
ReadAsStringAsync
��B S
(
��S T
)
��T U
.
��U V
Result
��V \
;
��\ ]
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
SuccessMessage
��( 6
]
��6 7
=
��8 9
Convert
��: A
.
��A B
ToString
��B J
(
��J K$
_stringLocalizerShared
��K a
[
��a b
$str
��b v
]
��v w
)
��w x
;
��x y
return
�� 
RedirectToAction
�� +
(
��+ ,
$str
��, 8
)
��8 9
;
��9 :
}
�� 
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
)
��7 8
{
�� 
string
�� 
jsonResponse
�� '
=
��( )
responseMessage
��* 9
.
��9 :
Content
��: A
.
��A B
ReadAsStringAsync
��B S
(
��S T
)
��T U
.
��U V
Result
��V \
;
��\ ]
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
SuccessMessage
��( 6
]
��6 7
=
��8 9
Convert
��: A
.
��A B
ToString
��B J
(
��J K$
_stringLocalizerShared
��K a
[
��a b
$str
��b v
]
��v w
)
��w x
;
��x y
return
�� 
Redirect
�� #
(
��# $
$"
��$ &
$str
��& H
{
��H I
masterProperty
��I W
.
��W X
Id
��X Z
}
��Z [
"
��[ \
)
��\ ]
;
��] ^
}
�� 
else
�� 
{
�� 
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
ErrorMessage
��( 4
]
��4 5
=
��6 7
Convert
��8 ?
.
��? @
ToString
��@ H
(
��H I
responseMessage
��I X
.
��X Y
Content
��Y `
.
��` a
ReadAsStringAsync
��a r
(
��r s
)
��s t
.
��t u
Result
��u {
)
��{ |
;
��| }
return
�� 
RedirectToAction
�� +
(
��+ ,
$str
��, <
,
��< =
new
��> A
{
��B C
id
��D F
=
��G H
masterProperty
��I W
.
��W X
Id
��X Z
}
��[ \
)
��\ ]
;
��] ^
}
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
e
�� 
)
�� 
{
�� 
_helper
�� 
.
�� 
LogExceptions
�� %
(
��% &
e
��& '
)
��' (
;
��( )
TempData
�� 
[
�� 

UserHelper
�� #
.
��# $
ErrorMessage
��$ 0
]
��0 1
=
��2 3
Convert
��4 ;
.
��; <
ToString
��< D
(
��D E
e
��E F
.
��F G

StackTrace
��G Q
)
��Q R
;
��R S
return
�� 
RedirectToAction
�� '
(
��' (
$str
��( 8
,
��8 9
new
��: =
{
��> ?
Id
��@ B
=
��C D
masterProperty
��E S
.
��S T
Id
��T V
}
��W X
)
��X Y
;
��Y Z
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
�� 
IActionResult
�� 
PropertyDetail
�� +
(
��+ ,
int
��, /
?
��/ 0
id
��1 3
)
��3 4
{
�� 	
var
�� 
action
�� 
=
�� 
id
�� 
==
�� 
null
�� #
?
��$ %
PermissionEnum
��& 4
.
��4 5
Edit
��5 9
:
��: ;
PermissionEnum
��< J
.
��J K
View
��K O
;
��O P
int
�� 
roleId
�� 
=
�� 
_helper
��  
.
��  !
GetLoggedInRoleId
��! 2
(
��2 3
)
��3 4
;
��4 5
if
�� 
(
�� 
!
�� 
CheckRoleAccess
��  
(
��  !"
ModulePermissionEnum
��! 5
.
��5 6
PropertyMaster
��6 D
,
��D E
action
��F L
,
��L M
roleId
��N T
)
��T U
)
��U V
return
�� 
RedirectToAction
�� '
(
��' (
AppConstants
��( 4
.
��4 5
AccessRestriction
��5 F
,
��F G
AppConstants
��H T
.
��T U
Home
��U Y
)
��Y Z
;
��Z [!
MasterPropertyModel
�� 
masterProperty
��  .
;
��. /
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
||
�� 
id
��  
<=
��! #
$num
��$ %
)
��% &
{
�� 
masterProperty
�� 
=
��  
new
��! $!
MasterPropertyModel
��% 8
(
��8 9
)
��9 :
;
��: ;
return
�� 
RedirectToAction
�� '
(
��' (
$str
��( 4
)
��4 5
;
��5 6
}
�� 
else
�� 
{
�� 
HttpContext
�� 
.
�� 
Request
�� #
.
��# $
Cookies
��$ +
.
��+ ,
TryGetValue
��, 7
(
��7 8

UserHelper
��8 B
.
��B C
EltizamToken
��C O
,
��O P
out
��Q T
string
��U [
token
��\ a
)
��a b
;
��b c
APIRepository
�� 
objapi
�� $
=
��% &
new
��' *
(
��* +
_cofiguration
��+ 8
)
��8 9
;
��9 :!
HttpResponseMessage
�� #
responseMessage
��$ 3
=
��4 5
objapi
��6 <
.
��< =
APICommunication
��= M
(
��M N
APIURLHelper
��N Z
.
��Z [
GetPropertyById
��[ j
+
��k l
$str
��m p
+
��q r
id
��s u
,
��u v

HttpMethod��w �
.��� �
Get��� �
,��� �
token��� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
)
��7 8
{
�� 
string
�� 
jsonResponse
�� '
=
��( )
responseMessage
��* 9
.
��9 :
Content
��: A
.
��A B
ReadAsStringAsync
��B S
(
��S T
)
��T U
.
��U V
Result
��V \
;
��\ ]
var
�� 
data
�� 
=
�� 
JsonConvert
�� *
.
��* +
DeserializeObject
��+ <
<
��< =
APIResponseEntity
��= N
<
��N O!
MasterPropertyModel
��O b
>
��b c
>
��c d
(
��d e
jsonResponse
��e q
)
��q r
;
��r s

FooterInfo
�� 
(
�� 
TableNameEnum
�� ,
.
��, -
Master_Property
��- <
,
��< =
_cofiguration
��> K
,
��K L
id
��M O
,
��O P
true
��Q U
)
��U V
;
��V W
return
�� 
View
�� 
(
��  
data
��  $
.
��$ %
_object
��% ,
)
��, -
;
��- .
}
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
}
�� 	
}
�� 
}�� ��
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
IHelper	z �
helper
� �
)
� �
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
BB� �
,
BB� �
new
BB� �
StringContent
BB� �
(
BB� �
JsonConvert
BB� �
.
BB� �
SerializeObject
BB� �
(
BB� � 
masterPropertyType
BB� �
)
BB� �
)
BB� �
)
BB� �
.
BB� �
Result
BB� �
;
BB� �
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
)	VV �
;
VV� �
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
�� #
responseMessage
��$ 3
=
��4 5
objapi
��6 <
.
��< =
APICommunication
��= M
(
��M N
APIURLHelper
��N Z
.
��Z [!
GetPropertyTypeById
��[ n
+
��o p
$str
��q t
+
��u v
id
��w y
,
��y z

HttpMethod��{ �
.��� �
Get��� �
,��� �
token��� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
)
��7 8
{
�� 
string
�� 
jsonResponse
�� '
=
��( )
responseMessage
��* 9
.
��9 :
Content
��: A
.
��A B
ReadAsStringAsync
��B S
(
��S T
)
��T U
.
��U V
Result
��V \
;
��\ ]
var
�� 
data
�� 
=
�� 
JsonConvert
�� *
.
��* +
DeserializeObject
��+ <
<
��< =
APIResponseEntity
��= N
<
��N O&
Master_PropertyTypeModel
��O g
>
��g h
>
��h i
(
��i j
jsonResponse
��j v
)
��v w
;
��w x

FooterInfo
�� 
(
�� 
TableNameEnum
�� ,
.
��, -!
Master_PropertyType
��- @
,
��@ A
_cofiguration
��B O
,
��O P
id
��Q S
)
��S T
;
��T U
if
�� 
(
�� 
data
�� 
.
�� 
_object
�� $
is
��% '
null
��( ,
)
��, -
return
�� 
NotFound
�� '
(
��' (
)
��( )
;
��) *
return
�� 
View
�� 
(
��  
$str
��  4
,
��4 5
data
��6 :
.
��: ;
_object
��; B
)
��B C
;
��C D
}
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
}
�� 	
[
�� 	
HttpGet
��	 
]
�� 
public
�� 
IActionResult
��  
PropertyTypeDetail
�� /
(
��/ 0
int
��0 3
?
��3 4
id
��5 7
)
��7 8
{
�� 	
var
�� 
action
�� 
=
�� 
PermissionEnum
�� '
.
��' (
View
��( ,
;
��, -
int
�� 
roleId
�� 
=
�� 
_helper
��  
.
��  !
GetLoggedInRoleId
��! 2
(
��2 3
)
��3 4
;
��4 5
if
�� 
(
�� 
!
�� 
CheckRoleAccess
��  
(
��  !"
ModulePermissionEnum
��! 5
.
��5 6 
PropertyTypeMaster
��6 H
,
��H I
action
��J P
,
��P Q
roleId
��R X
)
��X Y
)
��Y Z
return
�� 
RedirectToAction
�� '
(
��' (
AppConstants
��( 4
.
��4 5
AccessRestriction
��5 F
,
��F G
AppConstants
��H T
.
��T U
Home
��U Y
)
��Y Z
;
��Z [&
Master_PropertyTypeModel
�� $ 
masterPropertyType
��% 7
;
��7 8
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
||
�� 
id
��  
<=
��! #
$num
��$ %
)
��% &
{
��  
masterPropertyType
�� "
=
��# $
new
��% (&
Master_PropertyTypeModel
��) A
(
��A B
)
��B C
;
��C D
return
�� 
View
�� 
(
��  
masterPropertyType
�� .
)
��. /
;
��/ 0
}
�� 
else
�� 
{
�� 
HttpContext
�� 
.
�� 
Request
�� #
.
��# $
Cookies
��$ +
.
��+ ,
TryGetValue
��, 7
(
��7 8

UserHelper
��8 B
.
��B C
EltizamToken
��C O
,
��O P
out
��Q T
string
��U [
token
��\ a
)
��a b
;
��b c
APIRepository
�� 
objapi
�� $
=
��% &
new
��' *
(
��* +
_cofiguration
��+ 8
)
��8 9
;
��9 :!
HttpResponseMessage
�� #
responseMessage
��$ 3
=
��4 5
objapi
��6 <
.
��< =
APICommunication
��= M
(
��M N
APIURLHelper
��N Z
.
��Z [!
GetPropertyTypeById
��[ n
+
��o p
$str
��q t
+
��u v
id
��w y
,
��y z

HttpMethod��{ �
.��� �
Get��� �
,��� �
token��� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
)
��7 8
{
�� 
string
�� 
jsonResponse
�� '
=
��( )
responseMessage
��* 9
.
��9 :
Content
��: A
.
��A B
ReadAsStringAsync
��B S
(
��S T
)
��T U
.
��U V
Result
��V \
;
��\ ]
var
�� 
data
�� 
=
�� 
JsonConvert
�� *
.
��* +
DeserializeObject
��+ <
<
��< =
APIResponseEntity
��= N
<
��N O&
Master_PropertyTypeModel
��O g
>
��g h
>
��h i
(
��i j
jsonResponse
��j v
)
��v w
;
��w x

FooterInfo
�� 
(
�� 
TableNameEnum
�� ,
.
��, -!
Master_PropertyType
��- @
,
��@ A
_cofiguration
��B O
,
��O P
id
��Q S
,
��S T
true
��U Y
)
��Y Z
;
��Z [
return
�� 
View
�� 
(
��  
$str
��  4
,
��4 5
data
��6 :
.
��: ;
_object
��; B
)
��B C
;
��C D
}
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
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
�� '
)
��' (
]
��( )
public
�� 
IActionResult
�� $
CheckPropertTypeExists
�� 3
(
��3 4
string
��4 :
PropertyType
��; G
)
��G H
{
�� 	
try
�� 
{
�� 
HttpContext
�� 
.
�� 
Request
�� #
.
��# $
Cookies
��$ +
.
��+ ,
TryGetValue
��, 7
(
��7 8

UserHelper
��8 B
.
��B C
EltizamToken
��C O
,
��O P
out
��Q T
string
��U [
token
��\ a
)
��a b
;
��b c
APIRepository
�� 
objapi
�� $
=
��% &
new
��' *
(
��* +
_cofiguration
��+ 8
)
��8 9
;
��9 :!
HttpResponseMessage
�� #
responseMessage
��$ 3
=
��4 5
objapi
��6 <
.
��< =
APICommunication
��= M
(
��M N
APIURLHelper
��N Z
.
��Z [%
CheckPropertyTypeExists
��[ r
+
��s t
$str��u �
+��� �
PropertyType��� �
,��� �

HttpMethod��� �
.��� �
Get��� �
,��� �
token��� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
)
��7 8
{
�� 
if
�� 
(
�� 
responseMessage
�� '
.
��' (!
IsSuccessStatusCode
��( ;
)
��; <
{
�� 
string
�� 
jsonResponse
�� +
=
��, -
responseMessage
��. =
.
��= >
Content
��> E
.
��E F
ReadAsStringAsync
��F W
(
��W X
)
��X Y
.
��Y Z
Result
��Z `
;
��` a
TempData
��  
[
��  !

UserHelper
��! +
.
��+ ,
SuccessMessage
��, :
]
��: ;
=
��< =
Convert
��> E
.
��E F
ToString
��F N
(
��N O$
_stringLocalizerShared
��O e
[
��e f
$str
��f z
]
��z {
)
��{ |
;
��| }
}
�� 
else
�� 
{
�� 
TempData
��  
[
��  !

UserHelper
��! +
.
��+ ,
ErrorMessage
��, 8
]
��8 9
=
��: ;
Convert
��< C
.
��C D
ToString
��D L
(
��L M
responseMessage
��M \
.
��\ ]
Content
��] d
.
��d e
ReadAsStringAsync
��e v
(
��v w
)
��w x
.
��x y
Result
��y 
)�� �
;��� �
}
�� 
}
�� 
return
�� 
null
�� 
;
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
e
�� 
)
�� 
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
}�� Ƕ
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
helper	z �
)
� �
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
Get	DD �
,
DD� �
token
DD� �
)
DD� �
.
DD� �
Result
DD� �
;
DD� �
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
Get	TT~ �
,
TT� �
token
TT� �
)
TT� �
.
TT� �
Result
TT� �
;
TT� �
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
)	jj �
;
jj� �
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
�� 
objapi
��  
=
��! "
new
��# &
(
��& '
_cofiguration
��' 4
)
��4 5
;
��5 6!
HttpResponseMessage
�� 
responseMessage
��  /
=
��0 1
objapi
��2 8
.
��8 9
APICommunication
��9 I
(
��I J
APIURLHelper
��J V
.
��V W
GetRoleById
��W b
+
��c d
$str
��e h
+
��i j
id
��k m
,
��m n

HttpMethod
��o y
.
��y z
Get
��z }
,
��} ~
token�� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
responseMessage
�� 
.
��  !
IsSuccessStatusCode
��  3
)
��3 4
{
�� 
string
�� 
jsonResponse
�� #
=
��$ %
responseMessage
��& 5
.
��5 6
Content
��6 =
.
��= >
ReadAsStringAsync
��> O
(
��O P
)
��P Q
.
��Q R
Result
��R X
;
��X Y
var
�� 
data
�� 
=
�� 
JsonConvert
�� &
.
��& '
DeserializeObject
��' 8
<
��8 9
APIResponseEntity
��9 J
<
��J K
MasterRoleEntity
��K [
>
��[ \
>
��\ ]
(
��] ^
jsonResponse
��^ j
)
��j k
;
��k l
var
�� 
vw
�� 
=
�� 
IsView
�� 
==
��  "
$num
��# $
;
��$ %
ViewBag
�� 
.
�� 
IsView
�� 
=
��  
IsView
��! '
;
��' (

FooterInfo
�� 
(
�� 
TableNameEnum
�� (
.
��( )
Master_Role
��) 4
,
��4 5
_cofiguration
��6 C
,
��C D
id
��E G
,
��G H
true
��I M
)
��M N
;
��N O
List
�� 
<
��  
MasterModuleEntity
�� '
>
��' (!
_oListMasterModules
��) <
=
��= >
data
��? C
.
��C D
_object
��D K
.
��K L
MasterModules
��L Y
.
��Y Z
OrderBy
��Z a
(
��a b
x
��b c
=>
��d f
x
��g h
.
��h i
	SortOrder
��i r
)
��r s
.
��s t
ToList
��t z
(
��z {
)
��{ |
;
��| }
data
�� 
.
�� 
_object
�� 
.
�� 
MasterModules
�� *
=
��+ ,!
_oListMasterModules
��- @
;
��@ A
return
�� 
View
�� 
(
�� 
$str
�� (
,
��( )
data
��* .
.
��. /
_object
��/ 6
)
��6 7
;
��7 8
}
�� 
return
�� 
View
�� 
(
�� 
)
�� 
;
�� 
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	&
ValidateAntiForgeryToken
��	 !
]
��! "
public
�� 
IActionResult
�� 

RoleManage
�� '
(
��' (
int
��( +
id
��, .
,
��. /
MasterRoleEntity
��0 @

masterRole
��A K
)
��K L
{
�� 	
try
�� 
{
�� 
var
�� 
action
�� 
=
�� 

masterRole
�� '
.
��' (
Id
��( *
==
��+ -
$num
��. /
?
��0 1
PermissionEnum
��2 @
.
��@ A
Add
��A D
:
��E F
PermissionEnum
��G U
.
��U V
Edit
��V Z
;
��Z [
int
�� 
roleId
�� 
=
�� 
_helper
�� $
.
��$ %
GetLoggedInRoleId
��% 6
(
��6 7
)
��7 8
;
��8 9
if
�� 
(
�� 
!
�� 
CheckRoleAccess
�� $
(
��$ %"
ModulePermissionEnum
��% 9
.
��9 :

RoleMaster
��: D
,
��D E
action
��F L
,
��L M
roleId
��N T
)
��T U
)
��U V
return
�� 
RedirectToAction
�� +
(
��+ ,
AppConstants
��, 8
.
��8 9
AccessRestriction
��9 J
,
��J K
AppConstants
��L X
.
��X Y
Home
��Y ]
)
��] ^
;
��^ _
if
�� 
(
�� 

masterRole
�� 
.
�� 
Id
�� !
==
��" $
$num
��% &
)
��& '

masterRole
�� 
.
�� 
	CreatedBy
�� (
=
��) *
_helper
��+ 2
.
��2 3
GetLoggedInUserId
��3 D
(
��D E
)
��E F
;
��F G

masterRole
�� 
.
�� 

ModifiedBy
�� %
=
��& '
_helper
��( /
.
��/ 0
GetLoggedInUserId
��0 A
(
��A B
)
��B C
;
��C D

masterRole
�� 
.
�� 
LoggedUserId
�� '
=
��( )
_helper
��* 1
.
��1 2
GetLoggedInUserId
��2 C
(
��C D
)
��D E
;
��E F
HttpContext
�� 
.
�� 
Request
�� #
.
��# $
Cookies
��$ +
.
��+ ,
TryGetValue
��, 7
(
��7 8

UserHelper
��8 B
.
��B C
EltizamToken
��C O
,
��O P
out
��Q T
string
��U [
token
��\ a
)
��a b
;
��b c
APIRepository
�� 
objapi
�� $
=
��% &
new
��' *
(
��* +
_cofiguration
��+ 8
)
��8 9
;
��9 :!
HttpResponseMessage
�� #
responseMessage
��$ 3
=
��4 5
objapi
��6 <
.
��< =
APICommunication
��= M
(
��M N
APIURLHelper
��N Z
.
��Z [
SaveRole
��[ c
,
��c d

HttpMethod
��e o
.
��o p
Post
��p t
,
��t u
token
��v {
,
��{ |
new��} �
StringContent��� �
(��� �
JsonConvert��� �
.��� �
SerializeObject��� �
(��� �

masterRole��� �
)��� �
)��� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
)
��7 8
{
�� 
if
�� 
(
�� 

masterRole
�� "
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
�� 
UtilityHelper
�� %
.
��% &
RemoveModuleRole
��& 6
(
��6 7

masterRole
��7 A
.
��A B
Id
��B D
)
��D E
;
��E F!
HttpResponseMessage
�� +
resRoles
��, 4
=
��5 6
objapi
��7 =
.
��= >
APICommunication
��> N
(
��N O
APIURLHelper
��O [
.
��[ \+
GetByPermisionRoleUsingRoleId
��\ y
+
��z {
$str
��| 
+��� �

masterRole��� �
.��� �
Id��� �
,��� �

HttpMethod��� �
.��� �
Get��� �
,��� �
token��� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
resRoles
�� $
.
��$ %!
IsSuccessStatusCode
��% 8
)
��8 9
{
�� 
string
�� "
rolJson
��# *
=
��+ ,
resRoles
��- 5
.
��5 6
Content
��6 =
.
��= >
ReadAsStringAsync
��> O
(
��O P
)
��P Q
.
��Q R
Result
��R X
;
��X Y
var
�� 
data
��  $
=
��% &
JsonConvert
��' 2
.
��2 3
DeserializeObject
��3 D
<
��D E
APIResponseEntity
��E V
<
��V W
IEnumerable
��W b
<
��b c!
RolePermissionModel
��c v
>
��v w
>
��w x
>
��x y
(
��y z
rolJson��z �
)��� �
;��� �
UtilityHelper
�� )
.
��) *
AddModuleRole
��* 7
(
��7 8

masterRole
��8 B
.
��B C
Id
��C E
,
��E F
data
��G K
.
��K L
_object
��L S
)
��S T
;
��T U
}
�� 
}
�� 
if
�� 
(
�� 
responseMessage
�� '
.
��' (!
IsSuccessStatusCode
��( ;
&&
��< >

masterRole
��? I
.
��I J
Id
��J L
==
��M O
$num
��P Q
)
��Q R
{
�� 
string
�� 
jsonResponse
�� +
=
��, -
responseMessage
��. =
.
��= >
Content
��> E
.
��E F
ReadAsStringAsync
��F W
(
��W X
)
��X Y
.
��Y Z
Result
��Z `
;
��` a
TempData
��  
[
��  !

UserHelper
��! +
.
��+ ,
SuccessMessage
��, :
]
��: ;
=
��< =
Convert
��> E
.
��E F
ToString
��F N
(
��N O$
_stringLocalizerShared
��O e
[
��e f
$str
��f z
]
��z {
)
��{ |
;
��| }
return
�� 
RedirectToAction
�� /
(
��/ 0
nameof
��0 6
(
��6 7
Roles
��7 <
)
��< =
)
��= >
;
��> ?
}
�� 
if
�� 
(
�� 
responseMessage
�� '
.
��' (!
IsSuccessStatusCode
��( ;
)
��; <
{
�� 
string
�� 
jsonResponse
�� +
=
��, -
responseMessage
��. =
.
��= >
Content
��> E
.
��E F
ReadAsStringAsync
��F W
(
��W X
)
��X Y
.
��Y Z
Result
��Z `
;
��` a
TempData
��  
[
��  !

UserHelper
��! +
.
��+ ,
SuccessMessage
��, :
]
��: ;
=
��< =
Convert
��> E
.
��E F
ToString
��F N
(
��N O$
_stringLocalizerShared
��O e
[
��e f
$str
��f z
]
��z {
)
��{ |
;
��| }
return
�� 
Redirect
�� '
(
��' (
$"
��( *
$str
��* D
{
��D E

masterRole
��E O
.
��O P
Id
��P R
}
��R S
"
��S T
)
��T U
;
��U V
}
�� 
else
�� 
{
�� 
TempData
��  
[
��  !

UserHelper
��! +
.
��+ ,
ErrorMessage
��, 8
]
��8 9
=
��: ;
Convert
��< C
.
��C D
ToString
��D L
(
��L M
responseMessage
��M \
.
��\ ]
Content
��] d
.
��d e
ReadAsStringAsync
��e v
(
��v w
)
��w x
.
��x y
Result
��y 
)�� �
;��� �
return
�� 
RedirectToAction
�� /
(
��/ 0
$str
��0 7
)
��7 8
;
��8 9
}
�� 
}
�� 
return
�� 
RedirectToAction
�� '
(
��' (
$str
��( /
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
�� 
e
�� 
)
�� 
{
�� 
_helper
�� 
.
�� 
LogExceptions
�� %
(
��% &
e
��& '
)
��' (
;
��( )
TempData
�� 
[
�� 

UserHelper
�� #
.
��# $
ErrorMessage
��$ 0
]
��0 1
=
��2 3
Convert
��4 ;
.
��; <
ToString
��< D
(
��D E
e
��E F
.
��F G

StackTrace
��G Q
)
��Q R
;
��R S
return
�� 
RedirectToAction
�� '
(
��' (
$str
��( /
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
}�� ��
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
helper	z �
)
� �
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
Get	SS~ �
,
SS� �
token
SS� �
)
SS� �
.
SS� �
Result
SS� �
;
SS� �
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
�� 
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
ErrorMessage
��( 4
]
��4 5
=
��6 7
$str
��8 _
;
��_ `
return
�� 
Redirect
�� #
(
��# $
$"
��$ &
$str
��& @
{
��@ A

masterUser
��A K
.
��K L
Id
��L N
}
��N O
"
��O P
)
��P Q
;
��Q R
}
�� 
var
�� 
action
�� 
=
�� 

masterUser
�� '
.
��' (
Id
��( *
==
��+ -
$num
��. /
?
��0 1
PermissionEnum
��2 @
.
��@ A
Add
��A D
:
��E F
PermissionEnum
��G U
.
��U V
Edit
��V Z
;
��Z [
int
�� 
roleId
�� 
=
�� 
_helper
�� $
.
��$ %
GetLoggedInRoleId
��% 6
(
��6 7
)
��7 8
;
��8 9
if
�� 
(
�� 
!
�� 
CheckRoleAccess
�� $
(
��$ %"
ModulePermissionEnum
��% 9
.
��9 :
ResourceMaster
��: H
,
��H I
action
��J P
,
��P Q
roleId
��R X
)
��X Y
)
��Y Z
return
�� 
RedirectToAction
�� +
(
��+ ,
AppConstants
��, 8
.
��8 9
AccessRestriction
��9 J
,
��J K
AppConstants
��L X
.
��X Y
Home
��Y ]
)
��] ^
;
��^ _

masterUser
�� 
.
�� 
Email
��  
??=
��! $

masterUser
��% /
.
��/ 0
Address
��0 7
?
��7 8
.
��8 9
Email
��9 >
;
��> ?
if
�� 
(
�� 

masterUser
�� 
.
�� 
Document
�� '
!=
��( *
null
��+ /
&&
��0 2

masterUser
��3 =
.
��= >
Document
��> F
.
��F G
Files
��G L
!=
��M O
null
��P T
)
��T U
{
�� 
List
�� 
<
�� !
MasterDocumentModel
�� ,
>
��, -
docs
��. 2
=
��3 4
_helper
��5 <
.
��< =

FileUpload
��= G
(
��G H

masterUser
��H R
.
��R S
Document
��S [
)
��[ \
;
��\ ]

masterUser
�� 
.
�� 
uploadDocument
�� -
=
��. /
docs
��0 4
;
��4 5

masterUser
�� 
.
�� 
Document
�� '
=
��( )
null
��* .
;
��. /
}
�� 
if
�� 
(
�� 

masterUser
�� 
.
�� 
File
�� #
!=
��$ &
null
��' +
)
��+ ,
{
�� !
MasterDocumentModel
�� '
docs
��( ,
=
��- .
ProfileUpload
��/ <
(
��< =

masterUser
��= G
.
��G H
File
��H L
)
��L M
;
��M N

masterUser
�� 
.
�� 
uploadProfile
�� ,
=
��- .
docs
��/ 3
;
��3 4

masterUser
�� 
.
�� 
File
�� #
=
��$ %
null
��& *
;
��* +
}
�� 

masterUser
�� 
.
�� 
DepartmentId
�� '
=
��( )

masterUser
��* 4
.
��4 5
DepartmentId
��5 A
==
��B D
$num
��E F
?
��G H
null
��I M
:
��N O

masterUser
��P Z
.
��Z [
DepartmentId
��[ g
;
��g h

masterUser
�� 
.
�� 
DesignationId
�� (
=
��) *

masterUser
��+ 5
.
��5 6
DesignationId
��6 C
==
��D F
$num
��G H
?
��I J
null
��K O
:
��P Q

masterUser
��R \
.
��\ ]
DesignationId
��] j
;
��j k

masterUser
�� 
.
�� 
Address
�� "
=
��# $
null
��% )
;
��) *

masterUser
�� 
.
�� 
Qualification
�� (
=
��) *
null
��+ /
;
��/ 0
if
�� 
(
�� 

masterUser
�� 
.
�� 
Id
�� !
==
��" $
$num
��% &
)
��& '

masterUser
�� 
.
�� 
	CreatedBy
�� (
=
��) *
_helper
��+ 2
.
��2 3
GetLoggedInUserId
��3 D
(
��D E
)
��E F
;
��F G

masterUser
�� 
.
�� 

ModifiedBy
�� %
=
��& '
_helper
��( /
.
��/ 0
GetLoggedInUserId
��0 A
(
��A B
)
��B C
;
��C D
HttpContext
�� 
.
�� 
Request
�� #
.
��# $
Cookies
��$ +
.
��+ ,
TryGetValue
��, 7
(
��7 8

UserHelper
��8 B
.
��B C
EltizamToken
��C O
,
��O P
out
��Q T
string
��U [
token
��\ a
)
��a b
;
��b c
APIRepository
�� 
objapi
�� $
=
��% &
new
��' *
(
��* +
_cofiguration
��+ 8
)
��8 9
;
��9 :!
HttpResponseMessage
�� #
responseMessage
��$ 3
=
��4 5
objapi
��6 <
.
��< =
APICommunication
��= M
(
��M N
APIURLHelper
��N Z
.
��Z [

UpsertUser
��[ e
,
��e f

HttpMethod
��g q
.
��q r
Post
��r v
,
��v w
token
��x }
,
��} ~
new�� �
StringContent��� �
(��� �
JsonConvert��� �
.��� �
SerializeObject��� �
(��� �

masterUser��� �
)��� �
)��� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
&&
��8 :

masterUser
��; E
.
��E F
Id
��F H
==
��I K
$num
��L M
)
��M N
{
�� 
string
�� 
jsonResponse
�� '
=
��( )
responseMessage
��* 9
.
��9 :
Content
��: A
.
��A B
ReadAsStringAsync
��B S
(
��S T
)
��T U
.
��U V
Result
��V \
;
��\ ]
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
SuccessMessage
��( 6
]
��6 7
=
��8 9
Convert
��: A
.
��A B
ToString
��B J
(
��J K$
_stringLocalizerShared
��K a
[
��a b
$str
��b v
]
��v w
)
��w x
;
��x y
return
�� 
RedirectToAction
�� +
(
��+ ,
$str
��, 3
)
��3 4
;
��4 5
}
�� 
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
)
��7 8
{
�� 
string
�� 
jsonResponse
�� '
=
��( )
responseMessage
��* 9
.
��9 :
Content
��: A
.
��A B
ReadAsStringAsync
��B S
(
��S T
)
��T U
.
��U V
Result
��V \
;
��\ ]
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
SuccessMessage
��( 6
]
��6 7
=
��8 9
Convert
��: A
.
��A B
ToString
��B J
(
��J K$
_stringLocalizerShared
��K a
[
��a b
$str
��b v
]
��v w
)
��w x
;
��x y
return
�� 
Redirect
�� #
(
��# $
$"
��$ &
$str
��& @
{
��@ A

masterUser
��A K
.
��K L
Id
��L N
}
��N O
"
��O P
)
��P Q
;
��Q R
}
�� 
else
�� 
{
�� 
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
ErrorMessage
��( 4
]
��4 5
=
��6 7
Convert
��8 ?
.
��? @
ToString
��@ H
(
��H I
responseMessage
��I X
.
��X Y
Content
��Y `
.
��` a
ReadAsStringAsync
��a r
(
��r s
)
��s t
.
��t u
Result
��u {
)
��{ |
;
��| }
return
�� 
RedirectToAction
�� +
(
��+ ,
$str
��, 8
,
��8 9
new
��: =
{
��> ?
id
��@ B
=
��C D

masterUser
��E O
.
��O P
Id
��P R
}
��S T
)
��T U
;
��U V
}
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
e
�� 
)
�� 
{
�� 
_helper
�� 
.
�� 
LogExceptions
�� %
(
��% &
e
��& '
)
��' (
;
��( )
TempData
�� 
[
�� 

UserHelper
�� #
.
��# $
ErrorMessage
��$ 0
]
��0 1
=
��2 3
Convert
��4 ;
.
��; <
ToString
��< D
(
��D E
e
��E F
.
��F G

StackTrace
��G Q
)
��Q R
;
��R S
return
�� 
Redirect
�� 
(
��  
$"
��  "
$str
��" <
{
��< =

masterUser
��= G
.
��G H
Id
��H J
}
��J K
"
��K L
)
��L M
;
��M N
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
�� &
)
��& '
]
��' (
public
�� 
IActionResult
�� 

UserDetail
�� '
(
��' (
int
��( +
?
��+ ,
id
��- /
)
��/ 0
{
�� 	
var
�� 
action
�� 
=
�� 
id
�� 
==
�� 
null
�� #
?
��$ %
PermissionEnum
��& 4
.
��4 5
Edit
��5 9
:
��: ;
PermissionEnum
��< J
.
��J K
View
��K O
;
��O P
int
�� 
roleId
�� 
=
�� 
_helper
��  
.
��  !
GetLoggedInRoleId
��! 2
(
��2 3
)
��3 4
;
��4 5
int
�� 
loginId
�� 
=
�� 
_helper
�� !
.
��! "
GetLoggedInUserId
��" 3
(
��3 4
)
��4 5
;
��5 6
if
�� 
(
�� 
!
�� 
CheckRoleAccess
��  
(
��  !"
ModulePermissionEnum
��! 5
.
��5 6
ResourceMaster
��6 D
,
��D E
action
��F L
,
��L M
roleId
��N T
)
��T U
)
��U V
{
�� 
if
�� 
(
�� 
id
�� 
!=
�� 
loginId
�� !
)
��! "
return
�� 
RedirectToAction
�� +
(
��+ ,
AppConstants
��, 8
.
��8 9
AccessRestriction
��9 J
,
��J K
AppConstants
��L X
.
��X Y
Home
��Y ]
)
��] ^
;
��^ _
}
�� 
MasterUserModel
�� 

masterUser
�� &
;
��& '
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
||
�� 
id
��  
<=
��! #
$num
��$ %
)
��% &
{
�� 

masterUser
�� 
=
�� 
new
��  
MasterUserModel
��! 0
(
��0 1
)
��1 2
;
��2 3
return
�� 
RedirectToAction
�� '
(
��' (
$str
��( 4
)
��4 5
;
��5 6
}
�� 
else
�� 
{
�� 
HttpContext
�� 
.
�� 
Request
�� #
.
��# $
Cookies
��$ +
.
��+ ,
TryGetValue
��, 7
(
��7 8

UserHelper
��8 B
.
��B C
EltizamToken
��C O
,
��O P
out
��Q T
string
��U [
token
��\ a
)
��a b
;
��b c
APIRepository
�� 
objapi
�� $
=
��% &
new
��' *
(
��* +
_cofiguration
��+ 8
)
��8 9
;
��9 :!
HttpResponseMessage
�� #
responseMessage
��$ 3
=
��4 5
objapi
��6 <
.
��< =
APICommunication
��= M
(
��M N
APIURLHelper
��N Z
.
��Z [
GetUserById
��[ f
+
��g h
$str
��i l
+
��m n
id
��o q
,
��q r

HttpMethod
��s }
.
��} ~
Get��~ �
,��� �
token��� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
)
��7 8
{
�� 
string
�� 
jsonResponse
�� '
=
��( )
responseMessage
��* 9
.
��9 :
Content
��: A
.
��A B
ReadAsStringAsync
��B S
(
��S T
)
��T U
.
��U V
Result
��V \
;
��\ ]
var
�� 
data
�� 
=
�� 
JsonConvert
�� *
.
��* +
DeserializeObject
��+ <
<
��< =
APIResponseEntity
��= N
<
��N O
MasterUserModel
��O ^
>
��^ _
>
��_ `
(
��` a
jsonResponse
��a m
)
��m n
;
��n o

FooterInfo
�� 
(
�� 
TableNameEnum
�� ,
.
��, -
Master_User
��- 8
,
��8 9
_cofiguration
��: G
,
��G H
id
��I K
,
��K L
true
��M Q
)
��Q R
;
��R S
if
�� 
(
�� 
data
�� 
.
�� 
_object
�� $
is
��% '
null
��( ,
)
��, -
return
�� 
NotFound
�� '
(
��' (
)
��( )
;
��) *
return
�� 
View
�� 
(
��  
data
��  $
.
��$ %
_object
��% ,
)
��, -
;
��- .
}
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
}
�� 	
[
�� 	
HttpGet
��	 
]
�� 
public
�� 
IActionResult
��  
DeleteUserDocument
�� /
(
��/ 0
int
��0 3
id
��4 6
,
��6 7
string
��8 >
?
��> ?
fileName
��@ H
)
��H I
{
�� 	
try
�� 
{
�� 
int
�� 
isFileDelete
��  
=
��! "

DeleteFile
��# -
(
��- .
id
��. 0
,
��0 1
fileName
��2 :
)
��: ;
;
��; <
HttpContext
�� 
.
�� 
Request
�� #
.
��# $
Cookies
��$ +
.
��+ ,
TryGetValue
��, 7
(
��7 8

UserHelper
��8 B
.
��B C
EltizamToken
��C O
,
��O P
out
��Q T
string
��U [
token
��\ a
)
��a b
;
��b c
APIRepository
�� 
objapi
�� $
=
��% &
new
��' *
(
��* +
_cofiguration
��+ 8
)
��8 9
;
��9 :!
HttpResponseMessage
�� #
responseMessage
��$ 3
=
��4 5
objapi
��6 <
.
��< =
APICommunication
��= M
(
��M N
APIURLHelper
��N Z
.
��Z [$
DeleteUserDocumentById
��[ q
+
��r s
$str
��t w
+
��x y
id
��z |
,
��| }

HttpMethod��~ �
.��� �
Delete��� �
,��� �
token��� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
)
��7 8
{
�� 
string
�� 
jsonResponse
�� '
=
��( )
responseMessage
��* 9
.
��9 :
Content
��: A
.
��A B
ReadAsStringAsync
��B S
(
��S T
)
��T U
.
��U V
Result
��V \
;
��\ ]
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
SuccessMessage
��( 6
]
��6 7
=
��8 9
Convert
��: A
.
��A B
ToString
��B J
(
��J K$
_stringLocalizerShared
��K a
[
��a b
$str
��b v
]
��v w
)
��w x
;
��x y
}
�� 
else
�� 
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
ErrorMessage
��( 4
]
��4 5
=
��6 7
Convert
��8 ?
.
��? @
ToString
��@ H
(
��H I
responseMessage
��I X
.
��X Y
Content
��Y `
.
��` a
ReadAsStringAsync
��a r
(
��r s
)
��s t
.
��t u
Result
��u {
)
��{ |
;
��| }
}
�� 
catch
�� 
(
�� 
	Exception
�� 
e
�� 
)
�� 
{
�� 
_helper
�� 
.
�� 
LogExceptions
�� %
(
��% &
e
��& '
)
��' (
;
��( )
TempData
�� 
[
�� 

UserHelper
�� #
.
��# $
ErrorMessage
��$ 0
]
��0 1
=
��2 3
Convert
��4 ;
.
��; <
ToString
��< D
(
��D E
e
��E F
.
��F G

StackTrace
��G Q
)
��Q R
;
��R S
}
�� 
return
�� 
RedirectToAction
�� #
(
��# $
$str
��$ +
)
��+ ,
;
��, -
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
BlobResponse
�� &
>
��& '
UploadToBlob
��( 4
(
��4 5
	IFormFile
��5 >
file
��? C
)
��C D
{
�� 	
BlobHandler
�� 
blob
�� 
=
�� 
new
�� "
BlobHandler
��# .
(
��. /
)
��/ 0
;
��0 1
return
�� 
await
�� 
blob
�� 
.
�� 
SingleFileUpload
�� .
(
��. /
file
��/ 3
.
��3 4
OpenReadStream
��4 B
(
��B C
)
��C D
,
��D E
$num
��F I
,
��I J
file
��K O
.
��O P
FileName
��P X
,
��X Y
$str
��Z e
,
��e f
$num
��g j
,
��j k
$num
��l m
)
��m n
;
��n o
}
�� 	
private
�� !
MasterDocumentModel
�� #
ProfileUpload
��$ 1
(
��1 2
	IFormFile
��2 ;
pic
��< ?
)
��? @
{
�� 	!
MasterDocumentModel
�� 

uploadFils
��  *
=
��+ ,
new
��- 0!
MasterDocumentModel
��1 D
(
��D E
)
��E F
;
��F G
if
�� 
(
�� 
pic
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� 
ArgumentException
�� +
(
��+ ,
$str
��, E
)
��E F
;
��F G
}
�� 
var
�� 
currentUser
�� 
=
�� 
_helper
�� %
.
��% &
GetLoggedInUserId
��& 7
(
��7 8
)
��8 9
;
��9 :
var
�� 
savedFileNames
�� 
=
��  
new
��! $
List
��% )
<
��) *
string
��* 0
>
��0 1
(
��1 2
)
��2 3
;
��3 4
var
�� 
fileName
�� 
=
�� 
Guid
�� 
.
��  
NewGuid
��  '
(
��' (
)
��( )
.
��) *
ToString
��* 2
(
��2 3
)
��3 4
+
��5 6
Path
��7 ;
.
��; <
GetExtension
��< H
(
��H I
pic
��I L
.
��L M
FileName
��M U
)
��U V
;
��V W
var
�� 
docName
�� 
=
�� 
pic
�� 
.
�� 
FileName
�� &
;
��& '
var
�� 
filePath
�� 
=
�� 
Path
�� 
.
��  
Combine
��  '
(
��' (
$str
��( 9
,
��9 :
fileName
��; C
)
��C D
;
��D E
filePath
�� 
=
�� 
filePath
�� 
.
��  
Replace
��  '
(
��' (
$str
��( ,
,
��, -
$str
��. 1
)
��1 2
;
��2 3
using
�� 
(
�� 
var
�� 
stream
�� 
=
�� 
new
��  #

FileStream
��$ .
(
��. /
filePath
��/ 7
,
��7 8
FileMode
��9 A
.
��A B
Create
��B H
)
��H I
)
��I J
{
�� 
pic
�� 
.
�� 
CopyToAsync
�� 
(
��  
stream
��  &
)
��& '
;
��' (
}
�� 
var
�� 
upload
�� 
=
�� 
new
�� !
MasterDocumentModel
�� 0
{
�� 
FileName
�� 
=
�� 
fileName
�� #
,
��# $
FilePath
�� 
=
�� 
filePath
�� #
.
��# $
Replace
��$ +
(
��+ ,
$str
��, 5
,
��5 6
$str
��7 ;
)
��; <
,
��< =
DocumentName
�� 
=
�� 
docName
�� &
,
��& '
IsActive
�� 
=
�� 
true
�� 
,
��  
	CreatedBy
�� 
=
�� 
currentUser
�� '
,
��' (
FileType
�� 
=
�� 
pic
�� 
.
�� 
ContentType
�� *
,
��* +
CreatedDate
�� 
=
�� 
null
�� "
,
��" #
CreatedName
�� 
=
�� 
$str
��  
}
�� 
;
�� 
return
�� 
upload
�� 
;
�� 
}
�� 	
private
�� 
int
�� 

DeleteFile
�� 
(
�� 
int
�� "
id
��# %
,
��% &
string
��' -
?
��- .
fileName
��/ 7
)
��7 8
{
�� 	
int
�� 
isDelete
�� 
=
�� 
$num
�� 
;
�� 
if
�� 
(
�� 
fileName
�� 
!=
�� 
null
��  
||
��! #
fileName
��$ ,
!=
��- /
$str
��0 2
)
��2 3
{
�� 
var
�� 
filePath
�� 
=
�� 
Path
�� #
.
��# $
Combine
��$ +
(
��+ ,
$str
��, =
,
��= >
fileName
��? G
)
��G H
;
��H I
filePath
�� 
=
�� 
filePath
�� #
.
��# $
Replace
��$ +
(
��+ ,
$str
��, 0
,
��0 1
$str
��2 5
)
��5 6
;
��6 7
if
�� 
(
�� 
System
�� 
.
�� 
IO
�� 
.
�� 
File
�� "
.
��" #
Exists
��# )
(
��) *
filePath
��* 2
)
��2 3
)
��3 4
{
�� 
System
�� 
.
�� 
IO
�� 
.
�� 
File
�� "
.
��" #
Delete
��# )
(
��) *
filePath
��* 2
)
��2 3
;
��3 4
isDelete
�� 
=
�� 
$num
��  
;
��  !
}
�� 
}
�� 
return
�� 
isDelete
�� 
;
�� 
}
�� 	
}
�� 
}�� ��
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
IHelper	z �
helper
� �
)
� �
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
token	HH} �
,
HH� �
new
HH� �
StringContent
HH� �
(
HH� �
JsonConvert
HH� �
.
HH� �
SerializeObject
HH� �
(
HH� �&
masterValuationFeesModel
HH� �
)
HH� �
)
HH� �
)
HH� �
.
HH� �
Result
HH� �
;
HH� �
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

HttpMethod	zzx �
.
zz� �
Get
zz� �
,
zz� �
token
zz� �
)
zz� �
.
zz� �
Result
zz� �
;
zz� �
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
�� 
(
�� 
TableNameEnum
�� ,
.
��, -!
Master_ValuationFee
��- @
,
��@ A
_cofiguration
��B O
,
��O P
id
��Q S
)
��S T
;
��T U
if
�� 
(
�� 
data
�� 
.
�� 
_object
�� $
is
��% '
null
��( ,
)
��, -
return
�� 
NotFound
�� '
(
��' (
)
��( )
;
��) *
return
�� 
View
�� 
(
��  
data
��  $
.
��$ %
_object
��% ,
)
��, -
;
��- .
}
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
}
�� 	
[
�� 
HttpGet
�� 

]
��
 
[
�� 
Route
�� 
(
�� 	
$str
��	 0
)
��0 1
]
��1 2
public
�� 
IActionResult
��	 !
ValuationFeesDetail
�� *
(
��* +
int
��+ .
?
��. /
id
��0 2
)
��2 3
{
�� &
MasterValuationFeesModel
�� &
masterValuationFeesModel
�� 4
;
��4 5
var
�� 
action
�� 
=
�� 
id
�� 
==
�� 
null
�� #
?
��$ %
PermissionEnum
��& 4
.
��4 5
Edit
��5 9
:
��: ;
PermissionEnum
��< J
.
��J K
View
��K O
;
��O P
int
�� 
roleId
�� 
=
�� 
_helper
��  
.
��  !
GetLoggedInRoleId
��! 2
(
��2 3
)
��3 4
;
��4 5
if
�� 
(
�� 
!
�� 
CheckRoleAccess
��  
(
��  !"
ModulePermissionEnum
��! 5
.
��5 6 
ValuationFeeMaster
��6 H
,
��H I
action
��J P
,
��P Q
roleId
��R X
)
��X Y
)
��Y Z
return
�� 
RedirectToAction
�� '
(
��' (
AppConstants
��( 4
.
��4 5
AccessRestriction
��5 F
,
��F G
AppConstants
��H T
.
��T U
Home
��U Y
)
��Y Z
;
��Z [
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
||
�� 
id
��  
<=
��! #
$num
��$ %
)
��% &
{
�� &
masterValuationFeesModel
�� 
=
�� 
new
�� "&
MasterValuationFeesModel
��# ;
(
��; <
)
��< =
;
��= >
return
�� 

RedirectToAction
�� 
(
�� 
$str
�� 0
)
��0 1
;
��1 2
}
�� 
else
�� 
{
�� 
HttpContext
�� 
.
�� 
Request
�� 
.
�� 
Cookies
�� 
.
��  
TryGetValue
��  +
(
��+ ,

UserHelper
��, 6
.
��6 7
EltizamToken
��7 C
,
��C D
out
��E H
string
��I O
token
��P U
)
��U V
;
��V W
APIRepository
�� 
objapi
�� 
=
�� 
new
�� 
(
�� 
_cofiguration
�� ,
)
��, -
;
��- .!
HttpResponseMessage
�� 
responseMessage
�� '
=
��( )
objapi
��* 0
.
��0 1
APICommunication
��1 A
(
��A B
APIURLHelper
��B N
.
��N O
GetValuationById
��O _
+
��` a
$str
��b e
+
��f g
id
��h j
,
��j k

HttpMethod
��l v
.
��v w
Get
��w z
,
��z {
token��| �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
responseMessage
�� 
.
�� !
IsSuccessStatusCode
�� +
)
��+ ,
{
�� 
string
�� 
jsonResponse
�� 
=
�� 
responseMessage
�� *
.
��* +
Content
��+ 2
.
��2 3
ReadAsStringAsync
��3 D
(
��D E
)
��E F
.
��F G
Result
��G M
;
��M N
var
�� 
data
��	 
=
�� 
JsonConvert
�� 
.
�� 
DeserializeObject
�� -
<
��- .
APIResponseEntity
��. ?
<
��? @&
MasterValuationFeesModel
��@ X
>
��X Y
>
��Y Z
(
��Z [
jsonResponse
��[ g
)
��g h
;
��h i

FooterInfo
�� 
(
�� 
TableNameEnum
�� ,
.
��, -!
Master_ValuationFee
��- @
,
��@ A
_cofiguration
��B O
,
��O P
id
��Q S
,
��S T
true
��U Y
)
��Y Z
;
��Z [
if
�� 
(
�� 
data
�� 
.
�� 
_object
�� $
is
��% '
null
��( ,
)
��, -
return
�� 
NotFound
�� 
(
�� 
)
�� 
;
�� 
return
�� 
View
�� 
(
�� 
$str
�� %
,
��% &
data
��& *
.
��* +
_object
��+ 2
)
��2 3
;
��3 4
}
�� 
return
�� 

NotFound
�� 
(
�� 
)
�� 
;
�� 
}
�� 
}
�� 
}
�� 
}�� ��
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
helper	| �
)
� �
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
.	LL �
Get
LL� �
,
LL� �
token
LL� �
)
LL� �
.
LL� �
Result
LL� �
;
LL� �
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
�� 
(
�� 

masterUser
�� 
!=
�� !
null
��" &
)
��& '
{
�� 

masterUser
�� 
.
�� 
Address
�� &
=
��' (
null
��) -
;
��- .

masterUser
�� 
.
�� 
Contact
�� &
=
��' (
null
��) -
;
��- .
}
�� 
if
�� 
(
�� 

masterUser
�� 
.
�� 
File
�� #
!=
��$ &
null
��' +
)
��+ ,
{
�� !
MasterDocumentModel
�� '
docs
��( ,
=
��- .
ProfileUpload
��/ <
(
��< =

masterUser
��= G
.
��G H
File
��H L
)
��L M
;
��M N

masterUser
�� 
.
�� 
uploadProfile
�� ,
=
��- .
docs
��/ 3
;
��3 4

masterUser
�� 
.
�� 
File
�� #
=
��$ %
null
��& *
;
��* +
}
�� 
if
�� 
(
�� 

masterUser
�� 
.
�� 
Id
�� !
==
��" $
$num
��% &
)
��& '

masterUser
�� 
.
�� 
	CreatedBy
�� (
=
��) *
_helper
��+ 2
.
��2 3
GetLoggedInUserId
��3 D
(
��D E
)
��E F
;
��F G

masterUser
�� 
.
�� 

ModifiedBy
�� %
=
��& '
_helper
��( /
.
��/ 0
GetLoggedInUserId
��0 A
(
��A B
)
��B C
;
��C D
HttpContext
�� 
.
�� 
Request
�� #
.
��# $
Cookies
��$ +
.
��+ ,
TryGetValue
��, 7
(
��7 8

UserHelper
��8 B
.
��B C
EltizamToken
��C O
,
��O P
out
��Q T
string
��U [
token
��\ a
)
��a b
;
��b c
APIRepository
�� 
objapi
�� $
=
��% &
new
��' *
(
��* +
_cofiguration
��+ 8
)
��8 9
;
��9 :!
HttpResponseMessage
�� #
responseMessage
��$ 3
=
��4 5
objapi
��6 <
.
��< =
APICommunication
��= M
(
��M N
APIURLHelper
��N Z
.
��Z [
UpsertVendor
��[ g
,
��g h

HttpMethod
��i s
.
��s t
Post
��t x
,
��x y
token
��z 
,�� �
new��� �
StringContent��� �
(��� �
JsonConvert��� �
.��� �
SerializeObject��� �
(��� �

masterUser��� �
)��� �
)��� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
&&
��8 :

masterUser
��; E
.
��E F
Id
��F H
==
��H J
$num
��J K
)
��K L
{
�� 
string
�� 
jsonResponse
�� '
=
��( )
responseMessage
��* 9
.
��9 :
Content
��: A
.
��A B
ReadAsStringAsync
��B S
(
��S T
)
��T U
.
��U V
Result
��V \
;
��\ ]
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
SuccessMessage
��( 6
]
��6 7
=
��8 9
Convert
��: A
.
��A B
ToString
��B J
(
��J K$
_stringLocalizerShared
��K a
[
��a b
$str
��b v
]
��v w
)
��w x
;
��x y
return
�� 
RedirectToAction
�� +
(
��+ ,
$str
��, 5
)
��5 6
;
��6 7
}
�� 
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
)
��7 8
{
�� 
string
�� 
jsonResponse
�� '
=
��( )
responseMessage
��* 9
.
��9 :
Content
��: A
.
��A B
ReadAsStringAsync
��B S
(
��S T
)
��T U
.
��U V
Result
��V \
;
��\ ]
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
SuccessMessage
��( 6
]
��6 7
=
��8 9
Convert
��: A
.
��A B
ToString
��B J
(
��J K$
_stringLocalizerShared
��K a
[
��a b
$str
��b v
]
��v w
)
��w x
;
��x y
return
�� 
Redirect
�� #
(
��# $
$"
��$ &
$str
��& D
{
��D E

masterUser
��E O
.
��O P
Id
��P R
}
��R S
"
��S T
)
��T U
;
��U V
}
�� 
else
�� 
{
�� 
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
ErrorMessage
��( 4
]
��4 5
=
��6 7
Convert
��8 ?
.
��? @
ToString
��@ H
(
��H I
responseMessage
��I X
.
��X Y
Content
��Y `
.
��` a
ReadAsStringAsync
��a r
(
��r s
)
��s t
.
��t u
Result
��u {
)
��{ |
;
��| }
return
�� 
RedirectToAction
�� +
(
��+ ,
$str
��, :
,
��: ;
new
��< ?
{
��@ A
id
��B D
=
��E F

masterUser
��G Q
.
��Q R
Id
��R T
}
��U V
)
��V W
;
��W X
}
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
e
�� 
)
�� 
{
�� 
_helper
�� 
.
�� 
LogExceptions
�� %
(
��% &
e
��& '
)
��' (
;
��( )
TempData
�� 
[
�� 

UserHelper
�� #
.
��# $
ErrorMessage
��$ 0
]
��0 1
=
��2 3
Convert
��4 ;
.
��; <
ToString
��< D
(
��D E
e
��E F
.
��F G

StackTrace
��G Q
)
��Q R
;
��R S
return
�� 
RedirectToAction
�� '
(
��' (
$str
��( 6
,
��6 7
new
��8 ;
{
��< =
Id
��> @
=
��A B

masterUser
��C M
.
��M N
Id
��N P
}
��Q R
)
��R S
;
��S T
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
�� *
)
��* +
]
��+ ,
public
�� 
IActionResult
�� 
VendorDetail
�� )
(
��) *
int
��* -
?
��- .
id
��/ 1
)
��1 2
{
�� 	
MasterVendorModel
�� 

masterUser
�� (
;
��( )
var
�� 
action
�� 
=
�� 
id
�� 
==
�� 
null
�� #
?
��$ %
PermissionEnum
��& 4
.
��4 5
Edit
��5 9
:
��: ;
PermissionEnum
��< J
.
��J K
View
��K O
;
��O P
int
�� 
roleId
�� 
=
�� 
_helper
��  
.
��  !
GetLoggedInRoleId
��! 2
(
��2 3
)
��3 4
;
��4 5
if
�� 
(
�� 
!
�� 
CheckRoleAccess
��  
(
��  !"
ModulePermissionEnum
��! 5
.
��5 6
VendorMaster
��6 B
,
��B C
action
��D J
,
��J K
roleId
��L R
)
��R S
)
��S T
return
�� 
RedirectToAction
�� '
(
��' (
AppConstants
��( 4
.
��4 5
AccessRestriction
��5 F
,
��F G
AppConstants
��H T
.
��T U
Home
��U Y
)
��Y Z
;
��Z [
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
||
�� 
id
��  
<=
��! #
$num
��$ %
)
��% &
{
�� 

masterUser
�� 
=
�� 
new
��  
MasterVendorModel
��! 2
(
��2 3
)
��3 4
;
��4 5
return
�� 
View
�� 
(
�� 

masterUser
�� &
)
��& '
;
��' (
}
�� 
else
�� 
{
�� 
HttpContext
�� 
.
�� 
Request
�� #
.
��# $
Cookies
��$ +
.
��+ ,
TryGetValue
��, 7
(
��7 8

UserHelper
��8 B
.
��B C
EltizamToken
��C O
,
��O P
out
��Q T
string
��U [
token
��\ a
)
��a b
;
��b c
APIRepository
�� 
objapi
�� $
=
��% &
new
��' *
(
��* +
_cofiguration
��+ 8
)
��8 9
;
��9 :!
HttpResponseMessage
�� #
responseMessage
��$ 3
=
��4 5
objapi
��6 <
.
��< =
APICommunication
��= M
(
��M N
APIURLHelper
��N Z
.
��Z [
GetVendorById
��[ h
+
��i j
$str
��k n
+
��o p
id
��q s
,
��s t

HttpMethod
��u 
.�� �
Get��� �
,��� �
token��� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
)
��7 8
{
�� 
string
�� 
jsonResponse
�� '
=
��( )
responseMessage
��* 9
.
��9 :
Content
��: A
.
��A B
ReadAsStringAsync
��B S
(
��S T
)
��T U
.
��U V
Result
��V \
;
��\ ]
var
�� 
data
�� 
=
�� 
JsonConvert
�� *
.
��* +
DeserializeObject
��+ <
<
��< =
APIResponseEntity
��= N
<
��N O
MasterVendorModel
��O `
>
��` a
>
��a b
(
��b c
jsonResponse
��c o
)
��o p
;
��p q

FooterInfo
�� 
(
�� 
TableNameEnum
�� ,
.
��, -
Master_Vendor
��- :
,
��: ;
_cofiguration
��< I
,
��I J
id
��K M
,
��M N
true
��O S
)
��S T
;
��T U
if
�� 
(
�� 
data
�� 
.
�� 
_object
�� $
is
��% '
null
��( ,
)
��, -
return
�� 
NotFound
�� '
(
��' (
)
��( )
;
��) *
return
�� 
View
�� 
(
��  
data
��  $
.
��$ %
_object
��% ,
)
��, -
;
��- .
}
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
}
�� 	
private
�� !
MasterDocumentModel
�� #
ProfileUpload
��$ 1
(
��1 2
	IFormFile
��2 ;
pic
��< ?
)
��? @
{
�� 	!
MasterDocumentModel
�� 

uploadFils
��  *
=
��+ ,
new
��- 0!
MasterDocumentModel
��1 D
(
��D E
)
��E F
;
��F G
if
�� 
(
�� 
pic
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� 
ArgumentException
�� +
(
��+ ,
$str
��, E
)
��E F
;
��F G
}
�� 
var
�� 
currentUser
�� 
=
�� 
_helper
�� %
.
��% &
GetLoggedInUserId
��& 7
(
��7 8
)
��8 9
;
��9 :
var
�� 
savedFileNames
�� 
=
��  
new
��! $
List
��% )
<
��) *
string
��* 0
>
��0 1
(
��1 2
)
��2 3
;
��3 4
var
�� 
allowedFileTypes
�� 
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
��5 A
,
��A B
$str
��C N
,
��N O
$str
��P [
}
��\ ]
;
��] ^
if
�� 
(
�� 
!
�� 
allowedFileTypes
�� !
.
��! "
Contains
��" *
(
��* +
pic
��+ .
.
��. /
ContentType
��/ :
)
��: ;
)
��; <
{
�� 
throw
�� 
new
�� 
ArgumentException
�� +
(
��+ ,
$"
��, .
$str
��. 9
{
��9 :
pic
��: =
.
��= >
ContentType
��> I
}
��I J
$str
��J [
"
��[ \
)
��\ ]
;
��] ^
}
�� 
var
�� 
fileName
�� 
=
�� 
Guid
�� 
.
��  
NewGuid
��  '
(
��' (
)
��( )
.
��) *
ToString
��* 2
(
��2 3
)
��3 4
+
��5 6
Path
��7 ;
.
��; <
GetExtension
��< H
(
��H I
pic
��I L
.
��L M
FileName
��M U
)
��U V
;
��V W
var
�� 
docName
�� 
=
�� 
pic
�� 
.
�� 
FileName
�� &
;
��& '
var
�� 
filePath
�� 
=
�� 
Path
�� 
.
��  
Combine
��  '
(
��' (
$str
��( 9
,
��9 :
fileName
��; C
)
��C D
;
��D E
filePath
�� 
=
�� 
filePath
�� 
.
��  
Replace
��  '
(
��' (
$str
��( ,
,
��, -
$str
��. 1
)
��1 2
;
��2 3
using
�� 
(
�� 
var
�� 
stream
�� 
=
�� 
new
��  #

FileStream
��$ .
(
��. /
filePath
��/ 7
,
��7 8
FileMode
��9 A
.
��A B
Create
��B H
)
��H I
)
��I J
{
�� 
pic
�� 
.
�� 
CopyToAsync
�� 
(
��  
stream
��  &
)
��& '
;
��' (
}
�� 
var
�� 
upload
�� 
=
�� 
new
�� !
MasterDocumentModel
�� 0
{
�� 
FileName
�� 
=
�� 
fileName
�� #
,
��# $
FilePath
�� 
=
�� 
filePath
�� #
.
��# $
Replace
��$ +
(
��+ ,
$str
��, 5
,
��5 6
$str
��7 ;
)
��; <
,
��< =
DocumentName
�� 
=
�� 
docName
�� &
,
��& '
IsActive
�� 
=
�� 
true
�� 
,
��  
	CreatedBy
�� 
=
�� 
currentUser
�� '
,
��' (
FileType
�� 
=
�� 
pic
�� 
.
�� 
ContentType
�� *
,
��* +
CreatedDate
�� 
=
�� 
null
�� "
,
��" #
CreatedName
�� 
=
�� 
$str
��  
}
�� 
;
�� 
return
�� 
upload
�� 
;
�� 
}
�� 	
}
�� 
}�� �
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
helper	| �
)
� �
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
}.. �
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
� �
)
� �
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
ValuationRequest	%%s �
)
%%� �
)
%%� �
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
ValuationRequest	))r �
)
))� �
;
))� �
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
ValuationQuotation	**{ �
)
**� �
;
**� �
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
ValuationInvoice	++y �
)
++� �
;
++� �
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
ValuationRequest	@@r �
)
@@� �
;
@@� �
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
ValuationQuotation	AA{ �
)
AA� �
;
AA� �
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
ValuationInvoice	BBy �
)
BB� �
;
BB� �
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

HttpMethod	ii| �
.
ii� �
Get
ii� �
,
ii� �
_token
ii� �
)
ii� �
.
ii� �
Result
ii� �
;
ii� �
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
�� 
action
�� 
=
�� 
id
�� 
==
��  "
null
��# '
?
��( )
PermissionEnum
��* 8
.
��8 9
Edit
��9 =
:
��> ?
PermissionEnum
��@ N
.
��N O
Add
��O R
;
��R S
if
�� 
(
�� 
invoice
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
��# $
invoice
�� 
.
�� 
	CreatedBy
�� %
=
��& '
_helper
��( /
.
��/ 0
GetLoggedInUserId
��0 A
(
��A B
)
��B C
;
��C D
invoice
�� 
.
�� 

ModifiedBy
�� "
=
��# $
_helper
��% ,
.
��, -
GetLoggedInUserId
��- >
(
��> ?
)
��? @
;
��@ A
HttpContext
�� 
.
�� 
Request
�� #
.
��# $
Cookies
��$ +
.
��+ ,
TryGetValue
��, 7
(
��7 8

UserHelper
��8 B
.
��B C
EltizamToken
��C O
,
��O P
out
��Q T
string
��U [
token
��\ a
)
��a b
;
��b c
APIRepository
�� 
objapi
�� $
=
��% &
new
��' *
(
��* +
_cofiguration
��+ 8
)
��8 9
;
��9 :!
HttpResponseMessage
�� #
responseMessage
��$ 3
=
��4 5
objapi
��6 <
.
��< =
APICommunication
��= M
(
��M N
APIURLHelper
��N Z
.
��Z [
UpsertInvoice
��[ h
,
��h i

HttpMethod
��j t
.
��t u
Post
��u y
,
��y z
token��{ �
,��� �
new��� �
StringContent��� �
(��� �
JsonConvert��� �
.��� �
SerializeObject��� �
(��� �
invoice��� �
)��� �
)��� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
)
��7 8
{
�� 
string
�� 
jsonResponse
�� '
=
��( )
responseMessage
��* 9
.
��9 :
Content
��: A
.
��A B
ReadAsStringAsync
��B S
(
��S T
)
��T U
.
��U V
Result
��V \
;
��\ ]
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
SuccessMessage
��( 6
]
��6 7
=
��8 9
Convert
��: A
.
��A B
ToString
��B J
(
��J K$
_stringLocalizerShared
��K a
[
��a b
$str
��b v
]
��v w
)
��w x
;
��x y
}
�� 
else
�� 
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
ErrorMessage
��( 4
]
��4 5
=
��6 7
Convert
��8 ?
.
��? @
ToString
��@ H
(
��H I
responseMessage
��I X
.
��X Y
Content
��Y `
.
��` a
ReadAsStringAsync
��a r
(
��r s
)
��s t
.
��t u
Result
��u {
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
�� 
e
�� 
)
�� 
{
�� 
_helper
�� 
.
�� 
LogExceptions
�� %
(
��% &
e
��& '
)
��' (
;
��( )
TempData
�� 
[
�� 

UserHelper
�� #
.
��# $
ErrorMessage
��$ 0
]
��0 1
=
��2 3
Convert
��4 ;
.
��; <
ToString
��< D
(
��D E
e
��E F
.
��F G

StackTrace
��G Q
)
��Q R
;
��R S
}
�� 
return
�� 
Redirect
�� 
(
�� 
$"
�� 
$str
�� J
{
��J K
invoice
��K R
.
��R S 
ValuationRequestId
��S e
}
��e f
"
��f g
)
��g h
;
��h i
}
�� 	
[
�� 	
HttpGet
��	 
]
�� 
public
�� 
IActionResult
�� 
ValuationData
�� *
(
��* +
int
��+ .
id
��/ 1
)
��1 2
{
�� 	
DataSet
�� 
ds
�� 
=
�� 
new
�� 
DataSet
�� $
(
��$ %
)
��% &
;
��& '#
ValuationRequestModel
�� !
model
��" '
=
��( )
new
��* -#
ValuationRequestModel
��. C
(
��C D
)
��D E
;
��E F
HttpContext
�� 
.
�� 
Request
�� 
.
��  
Cookies
��  '
.
��' (
TryGetValue
��( 3
(
��3 4

UserHelper
��4 >
.
��> ?
EltizamToken
��? K
,
��K L
out
��M P
string
��Q W
token
��X ]
)
��] ^
;
��^ _
APIRepository
�� 
objapi
��  
=
��! "
new
��# &
(
��& '
_cofiguration
��' 4
)
��4 5
;
��5 6!
HttpResponseMessage
�� 
responseMessage
��  /
=
��0 1
objapi
��2 8
.
��8 9
APICommunication
��9 I
(
��I J
APIURLHelper
��J V
.
��V W!
GetValuationPDFData
��W j
+
��k l
$str
��m p
+
��q r
id
��s u
,
��u v

HttpMethod��w �
.��� �
Get��� �
,��� �
token��� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
responseMessage
�� 
.
��  !
IsSuccessStatusCode
��  3
)
��3 4
{
�� 
string
�� 
jsonResponse
�� #
=
��$ %
responseMessage
��& 5
.
��5 6
Content
��6 =
.
��= >
ReadAsStringAsync
��> O
(
��O P
)
��P Q
.
��Q R
Result
��R X
;
��X Y
ds
�� 
=
�� 
JsonConvert
��  
.
��  !
DeserializeObject
��! 2
<
��2 3
DataSet
��3 :
>
��: ;
(
��; <
jsonResponse
��< H
)
��H I
;
��I J
var
�� 
	listmodel
�� 
=
�� 
ds
��  "
.
��" #
Tables
��# )
[
��) *
$num
��* +
]
��+ ,
.
��, -
DataTableToList
��- <
<
��< =#
ValuationRequestModel
��= R
>
��R S
(
��S T
)
��T U
;
��U V
model
�� 
=
�� 
	listmodel
�� !
[
��! "
$num
��" #
]
��# $
;
��$ %
}
�� 
ViewBag
�� 
.
�� 
pdfdata
�� 
=
�� 
ds
��  
;
��  !
return
�� 
View
�� 
(
�� 
$str
�� '
,
��' (
model
��) .
)
��. /
;
��/ 0
}
�� 	
[
�� 	
HttpGet
��	 
]
�� 
public
�� 
IActionResult
�� $
ValuationRequestManage
�� 3
(
��3 4
int
��4 7
?
��7 8
id
��9 ;
,
��; <
int
��= @
?
��@ A
IsView
��B H
)
��H I
{
�� 	
var
�� 
_ValuationEntity
��  
=
��! "
new
��# &#
ValuationRequestModel
��' <
(
��< =
)
��= >
;
��> ?
_ValuationEntity
�� 
.
��  
ValuationAssesment
�� /
=
��0 1
new
��2 5+
ValuationAssesmentActionModel
��6 S
(
��S T
)
��T U
;
��U V
_ValuationEntity
�� 
.
��  
ValuationAssesment
�� /
.
��/ 0
SiteDescription
��0 ?
=
��@ A
new
��B E"
SiteDescriptionModel
��F Z
(
��Z [
)
��[ \
;
��\ ]
_ValuationEntity
�� 
.
��  
ValuationAssesment
�� /
.
��/ 0%
comparableEvidenceModel
��0 G
=
��H I
new
��J M%
ComparableEvidenceModel
��N e
(
��e f
)
��f g
;
��g h
_ValuationEntity
�� 
.
��  
ValuationAssesment
�� /
.
��/ 0'
valuationAssessementModel
��0 I
=
��J K
new
��L O'
ValuationAssessementModel
��P i
(
��i j
)
��j k
;
��k l
var
�� 
action
�� 
=
�� 
IsView
�� 
==
��  "
$num
��# $
?
��% &
PermissionEnum
��' 5
.
��5 6
View
��6 :
:
��; <
(
��= >
id
��> @
==
��A C
null
��D H
?
��I J
PermissionEnum
��K Y
.
��Y Z
Add
��Z ]
:
��^ _
PermissionEnum
��` n
.
��n o
Edit
��o s
)
��s t
;
��t u
int
�� 
roleId
�� 
=
�� 
_helper
��  
.
��  !
GetLoggedInRoleId
��! 2
(
��2 3
)
��3 4
;
��4 5
int
�� 
userId
�� 
=
�� 
_helper
��  
.
��  !
GetLoggedInUserId
��! 2
(
��2 3
)
��3 4
;
��4 5
if
�� 
(
�� 
!
�� 
CheckRoleAccess
��  
(
��  !"
ModulePermissionEnum
��! 5
.
��5 6
ValuationRequest
��6 F
,
��F G
action
��H N
,
��N O
roleId
��P V
)
��V W
)
��W X
return
�� 
RedirectToAction
�� '
(
��' (
AppConstants
��( 4
.
��4 5
AccessRestriction
��5 F
,
��F G
AppConstants
��H T
.
��T U
Home
��U Y
)
��Y Z
;
��Z [
var
�� 
vw
�� 
=
�� 
IsView
�� 
==
�� 
$num
��  
;
��  !
ViewBag
�� 
.
�� 
IsView
�� 
=
�� 
IsView
�� #
;
��# $

FooterInfo
�� 
(
�� 
TableNameEnum
�� $
.
��$ %
ValuationRequest
��% 5
,
��5 6
_cofiguration
��7 D
,
��D E
id
��F H
,
��H I
vw
��J L
)
��L M
;
��M N
ViewBag
�� 
.
�� 
Access
�� 
=
�� %
GetRoleAccessValuations
�� 4
(
��4 5"
ModulePermissionEnum
��5 I
.
��I J
ValuationRequest
��J Z
,
��Z [
roleId
��\ b
,
��b c
SubModuleEnum
��d q
.
��q r
ValuationRequest��r �
)��� �
;��� �
ViewBag
�� 
.
�� 
QuotationAccess
�� #
=
��$ %%
GetRoleAccessValuations
��& =
(
��= >"
ModulePermissionEnum
��> R
.
��R S
ValuationRequest
��S c
,
��c d
roleId
��e k
,
��k l
SubModuleEnum
��m z
.
��z {!
ValuationQuotation��{ �
)��� �
;��� �
ViewBag
�� 
.
�� 
InvoiceAccess
�� !
=
��" #%
GetRoleAccessValuations
��$ ;
(
��; <"
ModulePermissionEnum
��< P
.
��P Q
ValuationRequest
��Q a
,
��a b
roleId
��c i
,
��i j
SubModuleEnum
��k x
.
��x y
ValuationInvoice��y �
)��� �
;��� �
ViewBag
�� 
.
�� 
SiteDescription
�� #
=
��$ %%
GetRoleAccessValuations
��& =
(
��= >"
ModulePermissionEnum
��> R
.
��R S
ValuationRequest
��S c
,
��c d
roleId
��e k
,
��k l
SubModuleEnum
��m z
.
��z {
SiteDescription��{ �
)��� �
;��� �
ViewBag
�� 
.
�� !
ComparableEvidences
�� '
=
��( )%
GetRoleAccessValuations
��* A
(
��A B"
ModulePermissionEnum
��B V
.
��V W
ValuationRequest
��W g
,
��g h
roleId
��i o
,
��o p
SubModuleEnum
��q ~
.
��~ "
ComparableEvidences�� �
)��� �
;��� �
ViewBag
�� 
.
�� "
ValuationAssessement
�� (
=
��) *%
GetRoleAccessValuations
��+ B
(
��B C"
ModulePermissionEnum
��C W
.
��W X
ValuationRequest
��X h
,
��h i
roleId
��j p
,
��p q
SubModuleEnum
��r 
.�� �$
ValuationAssessement��� �
)��� �
;��� �
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
||
�� 
id
��  
<=
��! #
$num
��$ %
)
��% &
{
�� 
ViewBag
�� 
.
�� 
CurrentUserId
�� %
=
��& '
userId
��( .
;
��. /
return
�� 
View
�� 
(
�� 
$str
�� 4
,
��4 5
_ValuationEntity
��6 F
)
��F G
;
��G H
}
�� 
else
�� 
{
�� 
ViewBag
�� 
.
�� 
CurrentUserId
�� %
=
��& '
userId
��( .
;
��. /
HttpContext
�� 
.
�� 
Request
�� #
.
��# $
Cookies
��$ +
.
��+ ,
TryGetValue
��, 7
(
��7 8

UserHelper
��8 B
.
��B C
EltizamToken
��C O
,
��O P
out
��Q T
string
��U [
token
��\ a
)
��a b
;
��b c
APIRepository
�� 
objapi
�� $
=
��% &
new
��' *
(
��* +
_cofiguration
��+ 8
)
��8 9
;
��9 :!
HttpResponseMessage
�� #
responseMessage
��$ 3
=
��4 5
objapi
��6 <
.
��< =
APICommunication
��= M
(
��M N
APIURLHelper
��N Z
.
��Z [%
ValuationRequestGetById
��[ r
+
��s t
$str
��u x
+
��y z
id
��{ }
,
��} ~

HttpMethod�� �
.��� �
Get��� �
,��� �
token��� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
)
��7 8
{
�� 
string
�� 
jsonResponse
�� '
=
��( )
responseMessage
��* 9
.
��9 :
Content
��: A
.
��A B
ReadAsStringAsync
��B S
(
��S T
)
��T U
.
��U V
Result
��V \
;
��\ ]
var
�� 
data
�� 
=
�� 
JsonConvert
�� *
.
��* +
DeserializeObject
��+ <
<
��< =
APIResponseEntity
��= N
<
��N O#
ValuationRequestModel
��O d
>
��d e
>
��e f
(
��f g
jsonResponse
��g s
)
��s t
;
��t u
if
�� 
(
�� 
(
�� 
roleId
�� 
==
��  "
(
��# $
int
��$ '
)
��' (
RoleEnum
��( 0
.
��0 1
Valuer
��1 7
&&
��8 :
data
��; ?
.
��? @
_object
��@ G
.
��G H
ValuerId
��H P
!=
��Q S
userId
��T Z
)
��Z [
||
��\ ^
(
�� 
roleId
�� 
==
��  "
(
��# $
int
��$ '
)
��' (
RoleEnum
��( 0
.
��0 1
Approver
��1 9
&&
��: <
data
��= A
.
��A B
_object
��B I
.
��I J

ApproverId
��J T
!=
��U W
userId
��X ^
)
��^ _
)
��_ `
{
�� 
if
�� 
(
�� 
data
�� 
.
��  
_object
��  '
.
��' (

ApproverId
��( 2
!=
��3 5
userId
��6 <
)
��< =
{
�� 
return
�� "
RedirectToAction
��# 3
(
��3 4
nameof
��4 :
(
��: ;
ValuationRequests
��; L
)
��L M
)
��M N
;
��N O
}
�� 
else
�� 
{
�� 
return
�� "
RedirectToAction
��# 3
(
��3 4
AppConstants
��4 @
.
��@ A
AccessRestriction
��A R
,
��R S
AppConstants
��T `
.
��` a
Home
��a e
)
��e f
;
��f g
}
�� 
}
�� 
ValReqHeaderInfo
�� $
(
��$ %
id
��% '
.
��' (
Value
��( -
)
��- .
;
��. /
return
�� 
View
�� 
(
��  
data
��  $
.
��$ %
_object
��% ,
)
��, -
;
��- .
}
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	
Route
��	 
(
�� 
$str
�� 8
)
��8 9
]
��9 :
public
�� 
IActionResult
�� 
ValuationRequest
�� -
(
��- .
int
��. 1
id
��2 4
,
��4 5#
ValuationRequestModel
��6 K
request
��L S
)
��S T
{
�� 	
try
�� 
{
�� 
request
�� 
.
�� 
Id
�� 
=
�� 
id
�� 
;
��  
if
�� 
(
�� 
request
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
��# $
request
�� 
.
�� 
	CreatedBy
�� %
=
��& '
_helper
��( /
.
��/ 0
GetLoggedInUserId
��0 A
(
��A B
)
��B C
;
��C D
request
�� 
.
�� 

ModifiedBy
�� "
=
��# $
_helper
��% ,
.
��, -
GetLoggedInUserId
��- >
(
��> ?
)
��? @
;
��@ A
HttpContext
�� 
.
�� 
Request
�� #
.
��# $
Cookies
��$ +
.
��+ ,
TryGetValue
��, 7
(
��7 8

UserHelper
��8 B
.
��B C
EltizamToken
��C O
,
��O P
out
��Q T
string
��U [
token
��\ a
)
��a b
;
��b c
APIRepository
�� 
objapi
�� $
=
��% &
new
��' *
(
��* +
_cofiguration
��+ 8
)
��8 9
;
��9 :!
HttpResponseMessage
�� #
responseMessage
��$ 3
=
��4 5
objapi
��6 <
.
��< =
APICommunication
��= M
(
��M N
APIURLHelper
��N Z
.
��Z [$
UpsertValuationRequest
��[ q
,
��q r

HttpMethod
��s }
.
��} ~
Post��~ �
,��� �
token��� �
,��� �
new��� �
StringContent��� �
(��� �
JsonConvert��� �
.��� �
SerializeObject��� �
(��� �
request��� �
)��� �
)��� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
)
��7 8
{
�� 
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
SuccessMessage
��( 6
]
��6 7
=
��8 9
AppConstants
��: F
.
��F G
ActionSuccess
��G T
;
��T U
string
�� 
jsonResponse
�� '
=
��( )
responseMessage
��* 9
.
��9 :
Content
��: A
.
��A B
ReadAsStringAsync
��B S
(
��S T
)
��T U
.
��U V
Result
��V \
;
��\ ]
if
�� 
(
�� 
request
�� 
.
��  
Id
��  "
==
��# %
$num
��& '
)
��' (
return
�� 
RedirectToAction
�� /
(
��/ 0
nameof
��0 6
(
��6 7
ValuationRequests
��7 H
)
��H I
)
��I J
;
��J K
else
�� 
return
�� 
Redirect
�� '
(
��' (
$"
��( *
$str
��* V
{
��V W
request
��W ^
.
��^ _
Id
��_ a
}
��a b
"
��b c
)
��c d
;
��d e
}
�� 
else
�� 
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
ErrorMessage
��( 4
]
��4 5
=
��6 7
AppConstants
��8 D
.
��D E
ActionFailed
��E Q
;
��Q R
}
�� 
catch
�� 
(
�� 
	Exception
�� 
e
�� 
)
�� 
{
�� 
_helper
�� 
.
�� 
LogExceptions
�� %
(
��% &
e
��& '
)
��' (
;
��( )
TempData
�� 
[
�� 

UserHelper
�� #
.
��# $
ErrorMessage
��$ 0
]
��0 1
=
��2 3
Convert
��4 ;
.
��; <
ToString
��< D
(
��D E
e
��E F
.
��F G

StackTrace
��G Q
)
��Q R
;
��R S
}
�� 

ModelState
�� 
.
�� 
Clear
�� 
(
�� 
)
�� 
;
�� 
return
�� 
RedirectToAction
�� #
(
��# $
nameof
��$ *
(
��* +
ValuationRequests
��+ <
)
��< =
)
��= >
;
��> ?
}
�� 	
[
�� 	
HttpGet
��	 
]
�� 
public
�� 
IActionResult
�� &
ValuationQuotationManage
�� 5
(
��5 6
int
��6 9
?
��9 :
id
��; =
,
��= >
int
��? B
vId
��C F
)
��F G
{
�� 	)
ValuationQuatationListModel
�� '
	quotation
��( 1
;
��1 2
var
�� 
action
�� 
=
�� 
id
�� 
==
�� 
null
�� #
?
��$ %
PermissionEnum
��& 4
.
��4 5
Add
��5 8
:
��9 :
PermissionEnum
��; I
.
��I J
View
��J N
;
��N O
int
�� 
roleId
�� 
=
�� 
_helper
��  
.
��  !
GetLoggedInRoleId
��! 2
(
��2 3
)
��3 4
;
��4 5
if
�� 
(
�� 
!
�� 
CheckRoleAccess
��  
(
��  !"
ModulePermissionEnum
��! 5
.
��5 6
ValuationRequest
��6 F
,
��F G
action
��H N
,
��N O
roleId
��P V
)
��V W
)
��W X
return
�� 
RedirectToAction
�� '
(
��' (
AppConstants
��( 4
.
��4 5
AccessRestriction
��5 F
,
��F G
AppConstants
��H T
.
��T U
Home
��U Y
)
��Y Z
;
��Z [
ViewBag
�� 
.
�� 
Access
�� 
=
�� %
GetRoleAccessValuations
�� 4
(
��4 5"
ModulePermissionEnum
��5 I
.
��I J
ValuationRequest
��J Z
,
��Z [
roleId
��\ b
,
��b c
SubModuleEnum
��d q
.
��q r
ValuationRequest��r �
)��� �
;��� �
ViewBag
�� 
.
�� 
QuotationAccess
�� #
=
��$ %%
GetRoleAccessValuations
��& =
(
��= >"
ModulePermissionEnum
��> R
.
��R S
ValuationRequest
��S c
,
��c d
roleId
��e k
,
��k l
SubModuleEnum
��m z
.
��z {!
ValuationQuotation��{ �
)��� �
;��� �
ViewBag
�� 
.
�� 
InvoiceAccess
�� !
=
��" #%
GetRoleAccessValuations
��$ ;
(
��; <"
ModulePermissionEnum
��< P
.
��P Q
ValuationRequest
��Q a
,
��a b
roleId
��c i
,
��i j
SubModuleEnum
��k x
.
��x y
ValuationInvoice��y �
)��� �
;��� �
bool
�� $
hasQuatationViewAccess
�� '
=
��( )
ViewBag
��* 1
.
��1 2
QuotationAccess
��2 A
?
��A B
.
��B C
View
��C G
??
��H J
false
��K P
;
��P Q
bool
�� $
hasQuatationEditAccess
�� '
=
��( )
ViewBag
��* 1
.
��1 2
QuotationAccess
��2 A
?
��A B
.
��B C
Edit
��C G
??
��H J
false
��K P
;
��P Q
bool
�� #
hasQuatationAddAccess
�� &
=
��' (
ViewBag
��) 0
.
��0 1
QuotationAccess
��1 @
?
��@ A
.
��A B
Add
��B E
??
��F H
false
��I N
;
��N O
if
�� 
(
�� 
action
�� 
==
�� 
PermissionEnum
�� (
.
��( )
View
��) -
&&
��. 0
!
��1 2$
hasQuatationViewAccess
��2 H
)
��H I
{
�� 
return
�� 
RedirectToAction
�� '
(
��' (
AppConstants
��( 4
.
��4 5
AccessRestriction
��5 F
,
��F G
AppConstants
��H T
.
��T U
Home
��U Y
)
��Y Z
;
��Z [
}
�� 
else
�� 
if
�� 
(
�� 
action
�� 
==
�� 
PermissionEnum
�� -
.
��- .
Edit
��. 2
&&
��3 5
!
��6 7$
hasQuatationEditAccess
��7 M
)
��M N
{
�� 
return
�� 
RedirectToAction
�� '
(
��' (
AppConstants
��( 4
.
��4 5
AccessRestriction
��5 F
,
��F G
AppConstants
��H T
.
��T U
Home
��U Y
)
��Y Z
;
��Z [
}
�� 
else
�� 
if
�� 
(
�� 
action
�� 
==
�� 
PermissionEnum
�� -
.
��- .
Add
��. 1
&&
��2 4
!
��5 6#
hasQuatationAddAccess
��6 K
)
��K L
{
�� 
return
�� 
RedirectToAction
�� '
(
��' (
AppConstants
��( 4
.
��4 5
AccessRestriction
��5 F
,
��F G
AppConstants
��H T
.
��T U
Home
��U Y
)
��Y Z
;
��Z [
}
�� 
	quotation
�� 
=
�� 
new
�� )
ValuationQuatationListModel
�� 7
(
��7 8
)
��8 9
;
��9 :
ValReqHeaderInfo
�� 
(
�� 
vId
��  
)
��  !
;
��! "
	quotation
�� 
.
��  
ValuationRequestId
�� (
=
��) *
vId
��+ .
;
��. /
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
||
�� 
id
��  
<=
��! #
$num
��$ %
)
��% &
{
�� 
	quotation
�� 
.
�� 
StatusId
�� "
=
��# $
$num
��% '
;
��' (

FooterInfo
�� 
(
�� 
TableNameEnum
�� (
.
��( ) 
ValuationQuotation
��) ;
,
��; <
_cofiguration
��= J
,
��J K
id
��L N
)
��N O
;
��O P
return
�� 
View
�� 
(
�� 
	quotation
�� %
)
��% &
;
��& '
}
�� 
else
�� 
{
�� 
HttpContext
�� 
.
�� 
Request
�� #
.
��# $
Cookies
��$ +
.
��+ ,
TryGetValue
��, 7
(
��7 8

UserHelper
��8 B
.
��B C
EltizamToken
��C O
,
��O P
out
��Q T
string
��U [
_token
��\ b
)
��b c
;
��c d
APIRepository
�� 
_objapi
�� %
=
��& '
new
��( +
(
��+ ,
_cofiguration
��, 9
)
��9 :
;
��: ;!
HttpResponseMessage
�� #
_responseMessage
��$ 4
=
��5 6
_objapi
��7 >
.
��> ?
APICommunication
��? O
(
��O P
APIURLHelper
��P \
.
��\ ]$
ValuationQuatationById
��] s
+
��t u
$str
��v y
+
��z {
id
��| ~
,
��~ 

HttpMethod��� �
.��� �
Get��� �
,��� �
_token��� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
_responseMessage
�� $
.
��$ %!
IsSuccessStatusCode
��% 8
)
��8 9
{
�� 
string
�� 
jsonResponse
�� '
=
��( )
_responseMessage
��* :
.
��: ;
Content
��; B
.
��B C
ReadAsStringAsync
��C T
(
��T U
)
��U V
.
��V W
Result
��W ]
;
��] ^
var
�� 
data
�� 
=
�� 
JsonConvert
�� *
.
��* +
DeserializeObject
��+ <
<
��< =
APIResponseEntity
��= N
<
��N O)
ValuationQuatationListModel
��O j
>
��j k
>
��k l
(
��l m
jsonResponse
��m y
)
��y z
;
��z {

FooterInfo
�� 
(
�� 
TableNameEnum
�� ,
.
��, - 
ValuationQuotation
��- ?
,
��? @
_cofiguration
��A N
,
��N O
id
��P R
,
��R S
true
��T X
)
��X Y
;
��Y Z
return
�� 
View
�� 
(
��  
data
��  $
.
��$ %
_object
��% ,
)
��, -
;
��- .
}
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
}
�� 	
private
�� 
void
�� 
ValReqHeaderInfo
�� %
(
��% &
int
��& )
vId
��* -
)
��- .
{
�� 	
HttpContext
�� 
.
�� 
Request
�� 
.
��  
Cookies
��  '
.
��' (
TryGetValue
��( 3
(
��3 4

UserHelper
��4 >
.
��> ?
EltizamToken
��? K
,
��K L
out
��M P
string
��Q W
token
��X ]
)
��] ^
;
��^ _
APIRepository
�� 
objapi
��  
=
��! "
new
��# &
(
��& '
_cofiguration
��' 4
)
��4 5
;
��5 6!
HttpResponseMessage
�� 
responseMessage
��  /
=
��0 1
objapi
��2 8
.
��8 9
APICommunication
��9 I
(
��I J
APIURLHelper
��J V
.
��V W/
!ValuationRequestGetHeaderInfoById
��W x
+
��y z
$str
��{ ~
+�� �
vId��� �
,��� �

HttpMethod��� �
.��� �
Get��� �
,��� �
token��� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
responseMessage
�� 
.
��  !
IsSuccessStatusCode
��  3
)
��3 4
{
�� 
string
�� 
jsonResponse
�� #
=
��$ %
responseMessage
��& 5
.
��5 6
Content
��6 =
.
��= >
ReadAsStringAsync
��> O
(
��O P
)
��P Q
.
��Q R
Result
��R X
;
��X Y
var
�� 
data
�� 
=
�� 
JsonConvert
�� &
.
��& '
DeserializeObject
��' 8
<
��8 9
APIResponseEntity
��9 J
<
��J K*
ValuationRequestDependencies
��K g
>
��g h
>
��h i
(
��i j
jsonResponse
��j v
)
��v w
;
��w x
if
�� 
(
�� 
data
�� 
!=
�� 
null
��  
&&
��! #
data
��$ (
.
��( )
_object
��) 0
!=
��1 3
null
��4 8
)
��8 9
{
�� 
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
ValReqHeader
��( 4
]
��4 5
=
��6 7
data
��8 <
.
��< =
_object
��= D
;
��D E
}
�� 
}
�� 
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
IActionResult
�� &
ValuationQuotationManage
�� 5
(
��5 6
int
��6 9
id
��: <
,
��< =)
ValuationQuatationListModel
��> Y
masterQuotation
��Z i
)
��i j
{
�� 	
try
�� 
{
�� 
var
�� 
action
�� 
=
�� 
id
�� 
==
��  "
null
��# '
?
��( )
PermissionEnum
��* 8
.
��8 9
Add
��9 <
:
��= >
PermissionEnum
��? M
.
��M N
View
��N R
;
��R S
int
�� 
roleId
�� 
=
�� 
_helper
�� $
.
��$ %
GetLoggedInRoleId
��% 6
(
��6 7
)
��7 8
;
��8 9
if
�� 
(
�� 
!
�� 
CheckRoleAccess
�� $
(
��$ %"
ModulePermissionEnum
��% 9
.
��9 :
ValuationRequest
��: J
,
��J K
action
��L R
,
��R S
roleId
��T Z
)
��Z [
)
��[ \
return
�� 
RedirectToAction
�� +
(
��+ ,
AppConstants
��, 8
.
��8 9
AccessRestriction
��9 J
,
��J K
AppConstants
��L X
.
��X Y
Home
��Y ]
)
��] ^
;
��^ _
ViewBag
�� 
.
�� 
Access
�� 
=
��  %
GetRoleAccessValuations
��! 8
(
��8 9"
ModulePermissionEnum
��9 M
.
��M N
ValuationRequest
��N ^
,
��^ _
roleId
��` f
,
��f g
SubModuleEnum
��h u
.
��u v
ValuationRequest��v �
)��� �
;��� �
ViewBag
�� 
.
�� 
QuotationAccess
�� '
=
��( )%
GetRoleAccessValuations
��* A
(
��A B"
ModulePermissionEnum
��B V
.
��V W
ValuationRequest
��W g
,
��g h
roleId
��i o
,
��o p
SubModuleEnum
��q ~
.
��~ !
ValuationQuotation�� �
)��� �
;��� �
ViewBag
�� 
.
�� 
InvoiceAccess
�� %
=
��& '%
GetRoleAccessValuations
��( ?
(
��? @"
ModulePermissionEnum
��@ T
.
��T U
ValuationRequest
��U e
,
��e f
roleId
��g m
,
��m n
SubModuleEnum
��o |
.
��| }
ValuationInvoice��} �
)��� �
;��� �
bool
�� $
hasQuatationViewAccess
�� +
=
��, -
ViewBag
��. 5
.
��5 6
QuotationAccess
��6 E
?
��E F
.
��F G
View
��G K
??
��L N
false
��O T
;
��T U
bool
�� $
hasQuatationEditAccess
�� +
=
��, -
ViewBag
��. 5
.
��5 6
QuotationAccess
��6 E
?
��E F
.
��F G
Edit
��G K
??
��L N
false
��O T
;
��T U
bool
�� #
hasQuatationAddAccess
�� *
=
��+ ,
ViewBag
��- 4
.
��4 5
QuotationAccess
��5 D
?
��D E
.
��E F
Add
��F I
??
��J L
false
��M R
;
��R S
if
�� 
(
�� 
action
�� 
==
�� 
PermissionEnum
�� ,
.
��, -
View
��- 1
&&
��2 4
!
��5 6$
hasQuatationViewAccess
��6 L
)
��L M
{
�� 
return
�� 
RedirectToAction
�� +
(
��+ ,
AppConstants
��, 8
.
��8 9
AccessRestriction
��9 J
,
��J K
AppConstants
��L X
.
��X Y
Home
��Y ]
)
��] ^
;
��^ _
}
�� 
else
�� 
if
�� 
(
�� 
action
�� 
==
��  "
PermissionEnum
��# 1
.
��1 2
Edit
��2 6
&&
��7 9
!
��: ;$
hasQuatationEditAccess
��; Q
)
��Q R
{
�� 
return
�� 
RedirectToAction
�� +
(
��+ ,
AppConstants
��, 8
.
��8 9
AccessRestriction
��9 J
,
��J K
AppConstants
��L X
.
��X Y
Home
��Y ]
)
��] ^
;
��^ _
}
�� 
else
�� 
if
�� 
(
�� 
action
�� 
==
��  "
PermissionEnum
��# 1
.
��1 2
Add
��2 5
&&
��6 8
!
��9 :#
hasQuatationAddAccess
��: O
)
��O P
{
�� 
return
�� 
RedirectToAction
�� +
(
��+ ,
AppConstants
��, 8
.
��8 9
AccessRestriction
��9 J
,
��J K
AppConstants
��L X
.
��X Y
Home
��Y ]
)
��] ^
;
��^ _
}
�� 
if
�� 
(
�� 
masterQuotation
�� #
.
��# $
Id
��$ &
==
��' )
$num
��* +
)
��+ ,
masterQuotation
�� #
.
��# $
	CreatedBy
��$ -
=
��. /
_helper
��0 7
.
��7 8
GetLoggedInUserId
��8 I
(
��I J
)
��J K
;
��K L
masterQuotation
�� 
.
��  

ModifiedBy
��  *
=
��+ ,
_helper
��- 4
.
��4 5
GetLoggedInUserId
��5 F
(
��F G
)
��G H
;
��H I
if
�� 
(
�� 
masterQuotation
�� #
.
��# $
Document
��$ ,
!=
��- /
null
��0 4
&&
��5 7
masterQuotation
��8 G
.
��G H
Document
��H P
.
��P Q
Files
��Q V
!=
��W Y
null
��Z ^
)
��^ _
{
�� 
List
�� 
<
�� !
MasterDocumentModel
�� ,
>
��, -
docs
��. 2
=
��3 4
_helper
��5 <
.
��< =

FileUpload
��= G
(
��G H
masterQuotation
��H W
.
��W X
Document
��X `
)
��` a
;
��a b
masterQuotation
�� #
.
��# $
uploadDocument
��$ 2
=
��3 4
docs
��5 9
;
��9 :
masterQuotation
�� #
.
��# $
Document
��$ ,
=
��- .
null
��/ 3
;
��3 4
}
�� 
HttpContext
�� 
.
�� 
Request
�� #
.
��# $
Cookies
��$ +
.
��+ ,
TryGetValue
��, 7
(
��7 8

UserHelper
��8 B
.
��B C
EltizamToken
��C O
,
��O P
out
��Q T
string
��U [
token
��\ a
)
��a b
;
��b c
APIRepository
�� 
objapi
�� $
=
��% &
new
��' *
(
��* +
_cofiguration
��+ 8
)
��8 9
;
��9 :!
HttpResponseMessage
�� #
responseMessage
��$ 3
=
��4 5
objapi
��6 <
.
��< =
APICommunication
��= M
(
��M N
APIURLHelper
��N Z
.
��Z [&
UpsertValuationQuatation
��[ s
,
��s t

HttpMethod
��u 
.�� �
Post��� �
,��� �
token��� �
,��� �
new��� �
StringContent��� �
(��� �
JsonConvert��� �
.��� �
SerializeObject��� �
(��� �
masterQuotation��� �
)��� �
)��� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
)
��7 8
{
�� 
string
�� 
jsonResponse
�� '
=
��( )
responseMessage
��* 9
.
��9 :
Content
��: A
.
��A B
ReadAsStringAsync
��B S
(
��S T
)
��T U
.
��U V
Result
��V \
;
��\ ]
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
SuccessMessage
��( 6
]
��6 7
=
��8 9
Convert
��: A
.
��A B
ToString
��B J
(
��J K$
_stringLocalizerShared
��K a
[
��a b
$str
��b v
]
��v w
)
��w x
;
��x y
}
�� 
else
�� 
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
ErrorMessage
��( 4
]
��4 5
=
��6 7
Convert
��8 ?
.
��? @
ToString
��@ H
(
��H I
responseMessage
��I X
.
��X Y
Content
��Y `
.
��` a
ReadAsStringAsync
��a r
(
��r s
)
��s t
.
��t u
Result
��u {
)
��{ |
;
��| }
}
�� 
catch
�� 
(
�� 
	Exception
�� 
e
�� 
)
�� 
{
�� 
_helper
�� 
.
�� 
LogExceptions
�� %
(
��% &
e
��& '
)
��' (
;
��( )
TempData
�� 
[
�� 

UserHelper
�� #
.
��# $
ErrorMessage
��$ 0
]
��0 1
=
��2 3
Convert
��4 ;
.
��; <
ToString
��< D
(
��D E
e
��E F
.
��F G

StackTrace
��G Q
)
��Q R
;
��R S
}
�� 
return
�� 
Redirect
�� 
(
�� 
$"
�� 
$str
�� J
{
��J K
masterQuotation
��K Z
.
��Z [ 
ValuationRequestId
��[ m
}
��m n
"
��n o
)
��o p
;
��p q
}
�� 	
[
�� 	
HttpGet
��	 
]
�� 
public
�� 
IActionResult
�� $
ValuationInvoiceManage
�� 3
(
��3 4
int
��4 7
?
��7 8
id
��9 ;
,
��; <
int
��= @
vId
��A D
)
��D E
{
�� 	'
ValuationInvoiceListModel
�� %
invoice
��& -
;
��- .
var
�� 
action
�� 
=
�� 
id
�� 
==
�� 
null
�� #
?
��$ %
PermissionEnum
��& 4
.
��4 5
Add
��5 8
:
��9 :
PermissionEnum
��; I
.
��I J
View
��J N
;
��N O
int
�� 
roleId
�� 
=
�� 
_helper
��  
.
��  !
GetLoggedInRoleId
��! 2
(
��2 3
)
��3 4
;
��4 5
if
�� 
(
�� 
!
�� 
CheckRoleAccess
��  
(
��  !"
ModulePermissionEnum
��! 5
.
��5 6
ValuationRequest
��6 F
,
��F G
action
��H N
,
��N O
roleId
��P V
)
��V W
)
��W X
return
�� 
RedirectToAction
�� '
(
��' (
AppConstants
��( 4
.
��4 5
AccessRestriction
��5 F
,
��F G
AppConstants
��H T
.
��T U
Home
��U Y
)
��Y Z
;
��Z [
ViewBag
�� 
.
�� 
Access
�� 
=
�� %
GetRoleAccessValuations
�� 4
(
��4 5"
ModulePermissionEnum
��5 I
.
��I J
ValuationRequest
��J Z
,
��Z [
roleId
��\ b
,
��b c
SubModuleEnum
��d q
.
��q r
ValuationRequest��r �
)��� �
;��� �
ViewBag
�� 
.
�� 
QuotationAccess
�� #
=
��$ %%
GetRoleAccessValuations
��& =
(
��= >"
ModulePermissionEnum
��> R
.
��R S
ValuationRequest
��S c
,
��c d
roleId
��e k
,
��k l
SubModuleEnum
��m z
.
��z {!
ValuationQuotation��{ �
)��� �
;��� �
ViewBag
�� 
.
�� 
InvoiceAccess
�� !
=
��" #%
GetRoleAccessValuations
��$ ;
(
��; <"
ModulePermissionEnum
��< P
.
��P Q
ValuationRequest
��Q a
,
��a b
roleId
��c i
,
��i j
SubModuleEnum
��k x
.
��x y
ValuationInvoice��y �
)��� �
;��� �
bool
�� "
hasInvoiceViewAccess
�� %
=
��& '
ViewBag
��( /
.
��/ 0
QuotationAccess
��0 ?
?
��? @
.
��@ A
View
��A E
??
��F H
false
��I N
;
��N O
bool
�� "
hasInvoiceEditAccess
�� %
=
��& '
ViewBag
��( /
.
��/ 0
QuotationAccess
��0 ?
?
��? @
.
��@ A
Edit
��A E
??
��F H
false
��I N
;
��N O
bool
�� !
hasInvoiceAddAccess
�� $
=
��% &
ViewBag
��' .
.
��. /
QuotationAccess
��/ >
?
��> ?
.
��? @
Add
��@ C
??
��D F
false
��G L
;
��L M
if
�� 
(
�� 
action
�� 
==
�� 
PermissionEnum
�� (
.
��( )
View
��) -
&&
��. 0
!
��1 2"
hasInvoiceViewAccess
��2 F
)
��F G
{
�� 
return
�� 
RedirectToAction
�� '
(
��' (
AppConstants
��( 4
.
��4 5
AccessRestriction
��5 F
,
��F G
AppConstants
��H T
.
��T U
Home
��U Y
)
��Y Z
;
��Z [
}
�� 
else
�� 
if
�� 
(
�� 
action
�� 
==
�� 
PermissionEnum
�� -
.
��- .
Edit
��. 2
&&
��3 5
!
��6 7"
hasInvoiceEditAccess
��7 K
)
��K L
{
�� 
return
�� 
RedirectToAction
�� '
(
��' (
AppConstants
��( 4
.
��4 5
AccessRestriction
��5 F
,
��F G
AppConstants
��H T
.
��T U
Home
��U Y
)
��Y Z
;
��Z [
}
�� 
else
�� 
if
�� 
(
�� 
action
�� 
==
�� 
PermissionEnum
�� -
.
��- .
Add
��. 1
&&
��2 4
!
��5 6!
hasInvoiceAddAccess
��6 I
)
��I J
{
�� 
return
�� 
RedirectToAction
�� '
(
��' (
AppConstants
��( 4
.
��4 5
AccessRestriction
��5 F
,
��F G
AppConstants
��H T
.
��T U
Home
��U Y
)
��Y Z
;
��Z [
}
�� 
invoice
�� 
=
�� 
new
�� '
ValuationInvoiceListModel
�� 3
(
��3 4
)
��4 5
;
��5 6
ValReqHeaderInfo
�� 
(
�� 
vId
��  
)
��  !
;
��! "
invoice
�� 
.
��  
ValuationRequestId
�� &
=
��' (
vId
��) ,
;
��, -
if
�� 
(
�� 
id
�� 
==
�� 
null
�� 
||
�� 
id
��  
<=
��! #
$num
��$ %
)
��% &
{
�� 

FooterInfo
�� 
(
�� 
TableNameEnum
�� (
.
��( )
ValuationInvoice
��) 9
,
��9 :
_cofiguration
��; H
,
��H I
id
��J L
)
��L M
;
��M N
return
�� 
View
�� 
(
�� 
invoice
�� #
)
��# $
;
��$ %
}
�� 
else
�� 
{
�� 
HttpContext
�� 
.
�� 
Request
�� #
.
��# $
Cookies
��$ +
.
��+ ,
TryGetValue
��, 7
(
��7 8

UserHelper
��8 B
.
��B C
EltizamToken
��C O
,
��O P
out
��Q T
string
��U [
_token
��\ b
)
��b c
;
��c d
APIRepository
�� 
_objapi
�� %
=
��& '
new
��( +
(
��+ ,
_cofiguration
��, 9
)
��9 :
;
��: ;!
HttpResponseMessage
�� #
_responseMessage
��$ 4
=
��5 6
_objapi
��7 >
.
��> ?
APICommunication
��? O
(
��O P
APIURLHelper
��P \
.
��\ ]"
ValuationInvoiceById
��] q
+
��r s
$str
��t w
+
��x y
id
��z |
,
��| }

HttpMethod��~ �
.��� �
Get��� �
,��� �
_token��� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
_responseMessage
�� $
.
��$ %!
IsSuccessStatusCode
��% 8
)
��8 9
{
�� 
string
�� 
jsonResponse
�� '
=
��( )
_responseMessage
��* :
.
��: ;
Content
��; B
.
��B C
ReadAsStringAsync
��C T
(
��T U
)
��U V
.
��V W
Result
��W ]
;
��] ^
var
�� 
data
�� 
=
�� 
JsonConvert
�� *
.
��* +
DeserializeObject
��+ <
<
��< =
APIResponseEntity
��= N
<
��N O'
ValuationInvoiceListModel
��O h
>
��h i
>
��i j
(
��j k
jsonResponse
��k w
)
��w x
;
��x y

FooterInfo
�� 
(
�� 
TableNameEnum
�� ,
.
��, -
ValuationInvoice
��- =
,
��= >
_cofiguration
��? L
,
��L M
id
��N P
,
��P Q
true
��R V
)
��V W
;
��W X
return
�� 
View
�� 
(
��  
data
��  $
.
��$ %
_object
��% ,
)
��, -
;
��- .
}
�� 
return
�� 
NotFound
�� 
(
��  
)
��  !
;
��! "
}
�� 
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
public
�� 
IActionResult
�� $
ValuationInvoiceManage
�� 3
(
��3 4
int
��4 7
id
��8 :
,
��: ;'
ValuationInvoiceListModel
��< U
masterInvoice
��V c
)
��c d
{
�� 	
try
�� 
{
�� 
var
�� 
action
�� 
=
�� 
id
�� 
==
��  "
null
��# '
?
��( )
PermissionEnum
��* 8
.
��8 9
Add
��9 <
:
��= >
PermissionEnum
��? M
.
��M N
View
��N R
;
��R S
int
�� 
roleId
�� 
=
�� 
_helper
�� $
.
��$ %
GetLoggedInRoleId
��% 6
(
��6 7
)
��7 8
;
��8 9
if
�� 
(
�� 
!
�� 
CheckRoleAccess
�� $
(
��$ %"
ModulePermissionEnum
��% 9
.
��9 :
ValuationRequest
��: J
,
��J K
action
��L R
,
��R S
roleId
��T Z
)
��Z [
)
��[ \
return
�� 
RedirectToAction
�� +
(
��+ ,
AppConstants
��, 8
.
��8 9
AccessRestriction
��9 J
,
��J K
AppConstants
��L X
.
��X Y
Home
��Y ]
)
��] ^
;
��^ _
ViewBag
�� 
.
�� 
Access
�� 
=
��  %
GetRoleAccessValuations
��! 8
(
��8 9"
ModulePermissionEnum
��9 M
.
��M N
ValuationRequest
��N ^
,
��^ _
roleId
��` f
,
��f g
SubModuleEnum
��h u
.
��u v
ValuationRequest��v �
)��� �
;��� �
ViewBag
�� 
.
�� 
QuotationAccess
�� '
=
��( )%
GetRoleAccessValuations
��* A
(
��A B"
ModulePermissionEnum
��B V
.
��V W
ValuationRequest
��W g
,
��g h
roleId
��i o
,
��o p
SubModuleEnum
��q ~
.
��~ !
ValuationQuotation�� �
)��� �
;��� �
ViewBag
�� 
.
�� 
InvoiceAccess
�� %
=
��& '%
GetRoleAccessValuations
��( ?
(
��? @"
ModulePermissionEnum
��@ T
.
��T U
ValuationRequest
��U e
,
��e f
roleId
��g m
,
��m n
SubModuleEnum
��o |
.
��| }
ValuationInvoice��} �
)��� �
;��� �
bool
�� "
hasInvoiceViewAccess
�� )
=
��* +
ViewBag
��, 3
.
��3 4
QuotationAccess
��4 C
?
��C D
.
��D E
View
��E I
??
��J L
false
��M R
;
��R S
bool
�� "
hasInvoiceEditAccess
�� )
=
��* +
ViewBag
��, 3
.
��3 4
QuotationAccess
��4 C
?
��C D
.
��D E
Edit
��E I
??
��J L
false
��M R
;
��R S
bool
�� !
hasInvoiceAddAccess
�� (
=
��) *
ViewBag
��+ 2
.
��2 3
QuotationAccess
��3 B
?
��B C
.
��C D
Add
��D G
??
��H J
false
��K P
;
��P Q
if
�� 
(
�� 
action
�� 
==
�� 
PermissionEnum
�� ,
.
��, -
View
��- 1
&&
��2 4
!
��5 6"
hasInvoiceViewAccess
��6 J
)
��J K
{
�� 
return
�� 
RedirectToAction
�� +
(
��+ ,
AppConstants
��, 8
.
��8 9
AccessRestriction
��9 J
,
��J K
AppConstants
��L X
.
��X Y
Home
��Y ]
)
��] ^
;
��^ _
}
�� 
else
�� 
if
�� 
(
�� 
action
�� 
==
��  "
PermissionEnum
��# 1
.
��1 2
Edit
��2 6
&&
��7 9
!
��: ;"
hasInvoiceEditAccess
��; O
)
��O P
{
�� 
return
�� 
RedirectToAction
�� +
(
��+ ,
AppConstants
��, 8
.
��8 9
AccessRestriction
��9 J
,
��J K
AppConstants
��L X
.
��X Y
Home
��Y ]
)
��] ^
;
��^ _
}
�� 
else
�� 
if
�� 
(
�� 
action
�� 
==
��  "
PermissionEnum
��# 1
.
��1 2
Add
��2 5
&&
��6 8
!
��9 :!
hasInvoiceAddAccess
��: M
)
��M N
{
�� 
return
�� 
RedirectToAction
�� +
(
��+ ,
AppConstants
��, 8
.
��8 9
AccessRestriction
��9 J
,
��J K
AppConstants
��L X
.
��X Y
Home
��Y ]
)
��] ^
;
��^ _
}
�� 
if
�� 
(
�� 
masterInvoice
�� !
.
��! "
TransactionModeId
��" 3
==
��4 6
$num
��7 8
)
��8 9
{
�� 
masterInvoice
�� !
.
��! "!
TransactionStatusId
��" 5
=
��6 7
masterInvoice
��8 E
.
��E F%
CashTransactionStatusId
��F ]
??
��^ `
$num
��a b
;
��b c
masterInvoice
�� !
.
��! "
TransactionDate
��" 1
=
��2 3
masterInvoice
��4 A
.
��A B!
CashTransactionDate
��B U
;
��U V
masterInvoice
�� !
.
��! "
Amount
��" (
=
��) *
masterInvoice
��+ 8
.
��8 9

CashAmount
��9 C
??
��D F
$num
��G H
;
��H I
}
�� 
else
�� 
if
�� 
(
�� 
masterInvoice
�� &
.
��& '
TransactionModeId
��' 8
==
��9 ;
$num
��< =
)
��= >
{
�� 
masterInvoice
�� !
.
��! "!
TransactionStatusId
��" 5
=
��6 7
masterInvoice
��8 E
.
��E F'
ChequeTransactionStatusId
��F _
??
��` b
$num
��c d
;
��d e
masterInvoice
�� !
.
��! "
TransactionDate
��" 1
=
��2 3
masterInvoice
��4 A
.
��A B#
ChequeTransactionDate
��B W
;
��W X
masterInvoice
�� !
.
��! "
Amount
��" (
=
��) *
masterInvoice
��+ 8
.
��8 9
ChequeAmount
��9 E
??
��F H
$num
��I J
;
��J K
}
�� 
else
�� 
if
�� 
(
�� 
masterInvoice
�� &
.
��& '
TransactionModeId
��' 8
==
��9 ;
$num
��< =
)
��= >
{
�� 
masterInvoice
�� !
.
��! "!
TransactionStatusId
��" 5
=
��6 7
masterInvoice
��8 E
.
��E F%
CardTransactionStatusId
��F ]
??
��^ `
$num
��a b
;
��b c
masterInvoice
�� !
.
��! "
TransactionDate
��" 1
=
��2 3
masterInvoice
��4 A
.
��A B!
CardTransactionDate
��B U
;
��U V
masterInvoice
�� !
.
��! "
Amount
��" (
=
��) *
masterInvoice
��+ 8
.
��8 9

CardAmount
��9 C
??
��D F
$num
��G H
;
��H I
masterInvoice
�� !
.
��! "
TransactionId
��" /
=
��0 1
masterInvoice
��2 ?
.
��? @
CardTransactionId
��@ Q
;
��Q R
}
�� 
else
�� 
if
�� 
(
�� 
masterInvoice
�� &
.
��& '
TransactionModeId
��' 8
==
��9 ;
$num
��< =
)
��= >
{
�� 
masterInvoice
�� !
.
��! "!
TransactionStatusId
��" 5
=
��6 7
masterInvoice
��8 E
.
��E F%
BankTransactionStatusId
��F ]
??
��^ `
$num
��a b
;
��b c
masterInvoice
�� !
.
��! "
TransactionDate
��" 1
=
��2 3
masterInvoice
��4 A
.
��A B!
BankTransactionDate
��B U
;
��U V
masterInvoice
�� !
.
��! "
Amount
��" (
=
��) *
masterInvoice
��+ 8
.
��8 9

BankAmount
��9 C
??
��D F
$num
��G H
;
��H I
masterInvoice
�� !
.
��! "
TransactionId
��" /
=
��0 1
masterInvoice
��2 ?
.
��? @
BankTransactionId
��@ Q
;
��Q R
}
�� 
if
�� 
(
�� 
masterInvoice
�� !
.
��! "
Id
��" $
==
��% '
$num
��( )
)
��) *
masterInvoice
�� !
.
��! "
	CreatedBy
��" +
=
��, -
_helper
��. 5
.
��5 6
GetLoggedInUserId
��6 G
(
��G H
)
��H I
;
��I J
masterInvoice
�� 
.
�� 

ModifiedBy
�� (
=
��) *
_helper
��+ 2
.
��2 3
GetLoggedInUserId
��3 D
(
��D E
)
��E F
;
��F G
if
�� 
(
�� 
masterInvoice
�� !
.
��! "
Document
��" *
!=
��+ -
null
��. 2
&&
��3 5
masterInvoice
��6 C
.
��C D
Document
��D L
.
��L M
Files
��M R
!=
��S U
null
��V Z
)
��Z [
{
�� 
List
�� 
<
�� !
MasterDocumentModel
�� ,
>
��, -
docs
��. 2
=
��3 4
_helper
��5 <
.
��< =

FileUpload
��= G
(
��G H
masterInvoice
��H U
.
��U V
Document
��V ^
)
��^ _
;
��_ `
masterInvoice
�� !
.
��! "
uploadDocument
��" 0
=
��1 2
docs
��3 7
;
��7 8
masterInvoice
�� !
.
��! "
Document
��" *
=
��+ ,
null
��- 1
;
��1 2
}
�� 
HttpContext
�� 
.
�� 
Request
�� #
.
��# $
Cookies
��$ +
.
��+ ,
TryGetValue
��, 7
(
��7 8

UserHelper
��8 B
.
��B C
EltizamToken
��C O
,
��O P
out
��Q T
string
��U [
token
��\ a
)
��a b
;
��b c
APIRepository
�� 
objapi
�� $
=
��% &
new
��' *
(
��* +
_cofiguration
��+ 8
)
��8 9
;
��9 :!
HttpResponseMessage
�� #
responseMessage
��$ 3
=
��4 5
objapi
��6 <
.
��< =
APICommunication
��= M
(
��M N
APIURLHelper
��N Z
.
��Z [$
UpsertValuationInvoice
��[ q
,
��q r

HttpMethod
��s }
.
��} ~
Post��~ �
,��� �
token��� �
,��� �
new��� �
StringContent��� �
(��� �
JsonConvert��� �
.��� �
SerializeObject��� �
(��� �
masterInvoice��� �
)��� �
)��� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
)
��7 8
{
�� 
string
�� 
jsonResponse
�� '
=
��( )
responseMessage
��* 9
.
��9 :
Content
��: A
.
��A B
ReadAsStringAsync
��B S
(
��S T
)
��T U
.
��U V
Result
��V \
;
��\ ]
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
SuccessMessage
��( 6
]
��6 7
=
��8 9
Convert
��: A
.
��A B
ToString
��B J
(
��J K$
_stringLocalizerShared
��K a
[
��a b
$str
��b v
]
��v w
)
��w x
;
��x y
}
�� 
else
�� 
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
ErrorMessage
��( 4
]
��4 5
=
��6 7
Convert
��8 ?
.
��? @
ToString
��@ H
(
��H I
responseMessage
��I X
.
��X Y
Content
��Y `
.
��` a
ReadAsStringAsync
��a r
(
��r s
)
��s t
.
��t u
Result
��u {
)
��{ |
;
��| }
}
�� 
catch
�� 
(
�� 
	Exception
�� 
e
�� 
)
�� 
{
�� 
_helper
�� 
.
�� 
LogExceptions
�� %
(
��% &
e
��& '
)
��' (
;
��( )
TempData
�� 
[
�� 

UserHelper
�� #
.
��# $
ErrorMessage
��$ 0
]
��0 1
=
��2 3
Convert
��4 ;
.
��; <
ToString
��< D
(
��D E
e
��E F
.
��F G

StackTrace
��G Q
)
��Q R
;
��R S
}
�� 
return
�� 
Redirect
�� 
(
�� 
$"
�� 
$str
�� J
{
��J K
masterInvoice
��K X
.
��X Y 
ValuationRequestId
��Y k
}
��k l
"
��l m
)
��m n
;
��n o
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	
Route
��	 
(
�� 
$str
�� 5
)
��5 6
]
��6 7
public
�� 
IActionResult
�� !
UpdateRequestStatus
�� 0
(
��0 1
int
��1 4
id
��5 7
,
��7 8.
 ValutionRequestStatusChangeModel
��9 Y 
appoveRequestModel
��Z l
)
��l m
{
�� 	
try
�� 
{
�� 
HttpContext
�� 
.
�� 
Request
�� #
.
��# $
Cookies
��$ +
.
��+ ,
TryGetValue
��, 7
(
��7 8

UserHelper
��8 B
.
��B C
EltizamToken
��C O
,
��O P
out
��Q T
string
��U [
token
��\ a
)
��a b
;
��b c
APIRepository
�� 
objapi
�� $
=
��% &
new
��' *
(
��* +
_cofiguration
��+ 8
)
��8 9
;
��9 :.
 ValutionRequestStatusChangeModel
�� 0&
valuationRequestModelNew
��1 I
=
��J K
new
��L O.
 ValutionRequestStatusChangeModel
��P p
(
��p q
)
��q r
;
��r s&
valuationRequestModelNew
�� (
.
��( )
Id
��) +
=
��, -
id
��. 0
;
��0 1&
valuationRequestModelNew
�� (
.
��( )
StatusId
��) 1
=
��2 3 
appoveRequestModel
��4 F
.
��F G
StatusId
��G O
;
��O P&
valuationRequestModelNew
�� (
.
��( )
ApproverComment
��) 8
=
��9 : 
appoveRequestModel
��; M
.
��M N
ApproverComment
��N ]
;
��] ^!
HttpResponseMessage
�� #
responseMessage
��$ 3
=
��4 5
objapi
��6 <
.
��< =
APICommunication
��= M
(
��M N
APIURLHelper
��N Z
.
��Z [!
UpdateRequestStatus
��[ n
,
��n o

HttpMethod
��p z
.
��z {
Post
��{ 
,�� �
token��� �
,��� �
new��� �
StringContent��� �
(��� �
JsonConvert��� �
.��� �
SerializeObject��� �
(��� �(
valuationRequestModelNew��� �
)��� �
)��� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
)
��7 8
{
�� 
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
SuccessMessage
��( 6
]
��6 7
=
��8 9
Convert
��: A
.
��A B
ToString
��B J
(
��J K$
_stringLocalizerShared
��K a
[
��a b
$str
��b v
]
��v w
)
��w x
;
��x y
string
�� 
jsonResponse
�� '
=
��( )
responseMessage
��* 9
.
��9 :
Content
��: A
.
��A B
ReadAsStringAsync
��B S
(
��S T
)
��T U
.
��U V
Result
��V \
;
��\ ]

ModelState
�� 
.
�� 
Clear
�� $
(
��$ %
)
��% &
;
��& '
return
�� 
RedirectToAction
�� +
(
��+ ,
nameof
��, 2
(
��2 3
ValuationRequests
��3 D
)
��D E
)
��E F
;
��F G
}
�� 
else
�� 
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
ErrorMessage
��( 4
]
��4 5
=
��6 7
Convert
��8 ?
.
��? @
ToString
��@ H
(
��H I$
_stringLocalizerShared
��I _
[
��_ `
$str
��` g
]
��g h
)
��h i
;
��i j
}
�� 
catch
�� 
(
�� 
	Exception
�� 
e
�� 
)
�� 
{
�� 
_helper
�� 
.
�� 
LogExceptions
�� %
(
��% &
e
��& '
)
��' (
;
��( )
ViewBag
�� 
.
�� 
errormessage
�� $
=
��% &
Convert
��' .
.
��. /
ToString
��/ 7
(
��7 8
e
��8 9
.
��9 :

StackTrace
��: D
)
��D E
;
��E F

ModelState
�� 
.
�� 
Clear
��  
(
��  !
)
��! "
;
��" #
return
�� 
View
�� 
(
�� 
nameof
�� "
(
��" #
ValuationRequests
��# 4
)
��4 5
)
��5 6
;
��6 7
}
�� 

ModelState
�� 
.
�� 
Clear
�� 
(
�� 
)
�� 
;
�� 
return
�� 
RedirectToAction
�� #
(
��# $
nameof
��$ *
(
��* +
ValuationRequests
��+ <
)
��< =
)
��= >
;
��> ?
}
�� 	
[
�� 	
HttpPost
��	 
]
�� 
[
�� 	
Route
��	 
(
�� 
$str
�� :
)
��: ;
]
��; <
public
�� 
IActionResult
�� &
ValuationAssesmentManage
�� 5
(
��5 6
int
��6 9
id
��: <
,
��< =+
ValuationAssesmentActionModel
��> [ 
valuationAssesment
��\ n
)
��n o
{
�� 	
try
�� 
{
�� 
var
�� 
action
�� 
=
�� 
id
�� 
==
��  "
null
��# '
?
��( )
PermissionEnum
��* 8
.
��8 9
Add
��9 <
:
��= >
PermissionEnum
��? M
.
��M N
Edit
��N R
;
��R S
var
�� 
	requestId
�� 
=
�� 
id
��  "
;
��" # 
valuationAssesment
�� "
.
��" #
SiteDescription
��# 2
.
��2 3 
ValuationRequestId
��3 E
=
��F G
	requestId
��H Q
;
��Q R 
valuationAssesment
�� "
.
��" #%
comparableEvidenceModel
��# :
.
��: ;
	RequestId
��; D
=
��E F
	requestId
��G P
;
��P Q 
valuationAssesment
�� "
.
��" #'
valuationAssessementModel
��# <
.
��< =
	RequestId
��= F
=
��G H
	requestId
��I R
;
��R S
if
�� 
(
��  
valuationAssesment
�� &
.
��& '
SiteDescription
��' 6
.
��6 7
Document
��7 ?
!=
��@ B
null
��C G
&&
��H J 
valuationAssesment
��K ]
.
��] ^
SiteDescription
��^ m
.
��m n
Document
��n v
.
��v w
Files
��w |
!=
��} 
null��� �
)��� �
{
�� 
List
�� 
<
�� !
MasterDocumentModel
�� ,
>
��, -
docs
��. 2
=
��3 4
_helper
��5 <
.
��< =

FileUpload
��= G
(
��G H 
valuationAssesment
��H Z
.
��Z [
SiteDescription
��[ j
.
��j k
Document
��k s
)
��s t
;
��t u 
valuationAssesment
�� &
.
��& '
SiteDescription
��' 6
.
��6 7
uploadDocument
��7 E
=
��F G
docs
��H L
;
��L M 
valuationAssesment
�� &
.
��& '
SiteDescription
��' 6
.
��6 7
Document
��7 ?
=
��@ A
null
��B F
;
��F G
}
�� 
if
�� 
(
��  
valuationAssesment
�� &
.
��& '%
comparableEvidenceModel
��' >
.
��> ?
Document
��? G
!=
��H J
null
��K O
&&
��P R 
valuationAssesment
��S e
.
��e f%
comparableEvidenceModel
��f }
.
��} ~
Document��~ �
.��� �
Files��� �
!=��� �
null��� �
)��� �
{
�� 
List
�� 
<
�� !
MasterDocumentModel
�� ,
>
��, -
docs
��. 2
=
��3 4
_helper
��5 <
.
��< =

FileUpload
��= G
(
��G H 
valuationAssesment
��H Z
.
��Z [%
comparableEvidenceModel
��[ r
.
��r s
Document
��s {
)
��{ |
;
��| } 
valuationAssesment
�� &
.
��& '%
comparableEvidenceModel
��' >
.
��> ?
uploadDocument
��? M
=
��N O
docs
��P T
;
��T U 
valuationAssesment
�� &
.
��& '%
comparableEvidenceModel
��' >
.
��> ?
Document
��? G
=
��H I
null
��J N
;
��N O
}
�� 
if
�� 
(
��  
valuationAssesment
�� &
.
��& ''
valuationAssessementModel
��' @
.
��@ A
Document
��A I
!=
��J L
null
��M Q
&&
��R T 
valuationAssesment
��U g
.
��g h(
valuationAssessementModel��h �
.��� �
Document��� �
.��� �
Files��� �
!=��� �
null��� �
)��� �
{
�� 
List
�� 
<
�� !
MasterDocumentModel
�� ,
>
��, -
docs
��. 2
=
��3 4
_helper
��5 <
.
��< =

FileUpload
��= G
(
��G H 
valuationAssesment
��H Z
.
��Z ['
valuationAssessementModel
��[ t
.
��t u
Document
��u }
)
��} ~
;
��~  
valuationAssesment
�� &
.
��& ''
valuationAssessementModel
��' @
.
��@ A
uploadDocument
��A O
=
��P Q
docs
��R V
;
��V W 
valuationAssesment
�� &
.
��& ''
valuationAssessementModel
��' @
.
��@ A
Document
��A I
=
��J K
null
��L P
;
��P Q
}
�� 
int
�� 
roleId
�� 
=
�� 
_helper
�� $
.
��$ %
GetLoggedInRoleId
��% 6
(
��6 7
)
��7 8
;
��8 9
if
�� 
(
�� 
!
�� 
CheckRoleAccess
�� $
(
��$ %"
ModulePermissionEnum
��% 9
.
��9 :
ValuationRequest
��: J
,
��J K
action
��L R
,
��R S
roleId
��T Z
)
��Z [
)
��[ \
return
�� 
RedirectToAction
�� +
(
��+ ,
AppConstants
��, 8
.
��8 9
AccessRestriction
��9 J
,
��J K
AppConstants
��L X
.
��X Y
Home
��Y ]
)
��] ^
;
��^ _
ViewBag
�� 
.
�� 
Access
�� 
=
��  %
GetRoleAccessValuations
��! 8
(
��8 9"
ModulePermissionEnum
��9 M
.
��M N
ValuationRequest
��N ^
,
��^ _
roleId
��` f
,
��f g
SubModuleEnum
��h u
.
��u v
ValuationRequest��v �
)��� �
;��� �
ViewBag
�� 
.
�� 
SiteDescription
�� '
=
��( )%
GetRoleAccessValuations
��* A
(
��A B"
ModulePermissionEnum
��B V
.
��V W
ValuationRequest
��W g
,
��g h
roleId
��i o
,
��o p
SubModuleEnum
��q ~
.
��~ 
SiteDescription�� �
)��� �
;��� �
ViewBag
�� 
.
�� !
ComparableEvidences
�� +
=
��, -%
GetRoleAccessValuations
��. E
(
��E F"
ModulePermissionEnum
��F Z
.
��Z [
ValuationRequest
��[ k
,
��k l
roleId
��m s
,
��s t
SubModuleEnum��u �
.��� �#
ComparableEvidences��� �
)��� �
;��� �
ViewBag
�� 
.
�� "
ValuationAssessement
�� ,
=
��- .%
GetRoleAccessValuations
��/ F
(
��F G"
ModulePermissionEnum
��G [
.
��[ \
ValuationRequest
��\ l
,
��l m
roleId
��n t
,
��t u
SubModuleEnum��v �
.��� �$
ValuationAssessement��� �
)��� �
;��� �
bool
�� *
hasSiteDescriptionViewAccess
�� 1
=
��2 3
ViewBag
��4 ;
.
��; <
SiteDescription
��< K
?
��K L
.
��L M
View
��M Q
??
��R T
false
��U Z
;
��Z [
bool
�� *
hasSiteDescriptionEditAccess
�� 1
=
��2 3
ViewBag
��4 ;
.
��; <
SiteDescription
��< K
?
��K L
.
��L M
Edit
��M Q
??
��R T
false
��U Z
;
��Z [
bool
�� )
hasSiteDescriptionAddAccess
�� 0
=
��1 2
ViewBag
��3 :
.
��: ;
SiteDescription
��; J
?
��J K
.
��K L
Add
��L O
??
��P R
false
��S X
;
��X Y
if
�� 
(
�� 
action
�� 
==
�� 
PermissionEnum
�� ,
.
��, -
View
��- 1
&&
��2 4
!
��5 6*
hasSiteDescriptionViewAccess
��6 R
)
��R S
{
�� 
return
�� 
RedirectToAction
�� +
(
��+ ,
AppConstants
��, 8
.
��8 9
AccessRestriction
��9 J
,
��J K
AppConstants
��L X
.
��X Y
Home
��Y ]
)
��] ^
;
��^ _
}
�� 
else
�� 
if
�� 
(
�� 
action
�� 
==
��  "
PermissionEnum
��# 1
.
��1 2
Edit
��2 6
&&
��7 9
!
��: ;*
hasSiteDescriptionViewAccess
��; W
)
��W X
{
�� 
return
�� 
RedirectToAction
�� +
(
��+ ,
AppConstants
��, 8
.
��8 9
AccessRestriction
��9 J
,
��J K
AppConstants
��L X
.
��X Y
Home
��Y ]
)
��] ^
;
��^ _
}
�� 
else
�� 
if
�� 
(
�� 
action
�� 
==
��  "
PermissionEnum
��# 1
.
��1 2
Add
��2 5
&&
��6 8
!
��9 :*
hasSiteDescriptionViewAccess
��: V
)
��V W
{
�� 
return
�� 
RedirectToAction
�� +
(
��+ ,
AppConstants
��, 8
.
��8 9
AccessRestriction
��9 J
,
��J K
AppConstants
��L X
.
��X Y
Home
��Y ]
)
��] ^
;
��^ _
}
�� 
if
�� 
(
��  
valuationAssesment
�� &
.
��& '
SiteDescription
��' 6
.
��6 7
Id
��7 9
==
��: <
$num
��= >
)
��> ? 
valuationAssesment
�� &
.
��& '
SiteDescription
��' 6
.
��6 7
	CreatedBy
��7 @
=
��A B
_helper
��C J
.
��J K
GetLoggedInUserId
��K \
(
��\ ]
)
��] ^
;
��^ _ 
valuationAssesment
�� "
.
��" #
SiteDescription
��# 2
.
��2 3

ModifiedBy
��3 =
=
��> ?
_helper
��@ G
.
��G H
GetLoggedInUserId
��H Y
(
��Y Z
)
��Z [
;
��[ \
if
�� 
(
��  
valuationAssesment
�� &
.
��& '%
comparableEvidenceModel
��' >
.
��> ?
Id
��? A
==
��B D
$num
��E F
)
��F G 
valuationAssesment
�� &
.
��& '%
comparableEvidenceModel
��' >
.
��> ?
	CreatedBy
��? H
=
��I J
_helper
��K R
.
��R S
GetLoggedInUserId
��S d
(
��d e
)
��e f
;
��f g 
valuationAssesment
�� "
.
��" #%
comparableEvidenceModel
��# :
.
��: ;

ModifiedBy
��; E
=
��F G
_helper
��H O
.
��O P
GetLoggedInUserId
��P a
(
��a b
)
��b c
;
��c d
if
�� 
(
��  
valuationAssesment
�� &
.
��& ''
valuationAssessementModel
��' @
.
��@ A
Id
��A C
==
��D F
$num
��G H
)
��H I 
valuationAssesment
�� &
.
��& ''
valuationAssessementModel
��' @
.
��@ A
	CreatedBy
��A J
=
��K L
_helper
��M T
.
��T U
GetLoggedInUserId
��U f
(
��f g
)
��g h
;
��h i 
valuationAssesment
�� "
.
��" #'
valuationAssessementModel
��# <
.
��< =

ModifiedBy
��= G
=
��H I
_helper
��J Q
.
��Q R
GetLoggedInUserId
��R c
(
��c d
)
��d e
;
��e f
HttpContext
�� 
.
�� 
Request
�� #
.
��# $
Cookies
��$ +
.
��+ ,
TryGetValue
��, 7
(
��7 8

UserHelper
��8 B
.
��B C
EltizamToken
��C O
,
��O P
out
��Q T
string
��U [
token
��\ a
)
��a b
;
��b c
APIRepository
�� 
objapi
�� $
=
��% &
new
��' *
(
��* +
_cofiguration
��+ 8
)
��8 9
;
��9 :!
HttpResponseMessage
�� #
responseMessage
��$ 3
=
��4 5
objapi
��6 <
.
��< =
APICommunication
��= M
(
��M N
APIURLHelper
��N Z
.
��Z [ 
ValuationAssesment
��[ m
,
��m n

HttpMethod
��o y
.
��y z
Post
��z ~
,
��~ 
token��� �
,��� �
new��� �
StringContent��� �
(��� �
JsonConvert��� �
.��� �
SerializeObject��� �
(��� �"
valuationAssesment��� �
)��� �
)��� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
)
��7 8
{
�� 
string
�� 
jsonResponse
�� '
=
��( )
responseMessage
��* 9
.
��9 :
Content
��: A
.
��A B
ReadAsStringAsync
��B S
(
��S T
)
��T U
.
��U V
Result
��V \
;
��\ ]
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
SuccessMessage
��( 6
]
��6 7
=
��8 9
Convert
��: A
.
��A B
ToString
��B J
(
��J K$
_stringLocalizerShared
��K a
[
��a b
$str
��b v
]
��v w
)
��w x
;
��x y
}
�� 
else
�� 
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
ErrorMessage
��( 4
]
��4 5
=
��6 7
Convert
��8 ?
.
��? @
ToString
��@ H
(
��H I
responseMessage
��I X
.
��X Y
Content
��Y `
.
��` a
ReadAsStringAsync
��a r
(
��r s
)
��s t
.
��t u
Result
��u {
)
��{ |
;
��| }
}
�� 
catch
�� 
(
�� 
	Exception
�� 
e
�� 
)
�� 
{
�� 
_helper
�� 
.
�� 
LogExceptions
�� %
(
��% &
e
��& '
)
��' (
;
��( )
TempData
�� 
[
�� 

UserHelper
�� #
.
��# $
ErrorMessage
��$ 0
]
��0 1
=
��2 3
Convert
��4 ;
.
��; <
ToString
��< D
(
��D E
e
��E F
.
��F G

StackTrace
��G Q
)
��Q R
;
��R S
}
�� 
return
�� 
Redirect
�� 
(
�� 
$"
�� 
$str
�� J
{
��J K 
valuationAssesment
��K ]
.
��] ^
SiteDescription
��^ m
.
��m n!
ValuationRequestId��n �
}��� �
"��� �
)��� �
;��� �
}
�� 	
[
�� 	
HttpGet
��	 
]
�� 
public
�� 
IActionResult
�� +
DeleteSiteDescriptionDocument
�� :
(
��: ;
int
��; >
id
��? A
,
��A B
string
��C I
?
��I J
fileName
��K S
)
��S T
{
�� 	
try
�� 
{
�� 
int
�� 
isFileDelete
��  
=
��! "

DeleteFile
��# -
(
��- .
id
��. 0
,
��0 1
fileName
��2 :
)
��: ;
;
��; <
HttpContext
�� 
.
�� 
Request
�� #
.
��# $
Cookies
��$ +
.
��+ ,
TryGetValue
��, 7
(
��7 8

UserHelper
��8 B
.
��B C
EltizamToken
��C O
,
��O P
out
��Q T
string
��U [
token
��\ a
)
��a b
;
��b c
APIRepository
�� 
objapi
�� $
=
��% &
new
��' *
(
��* +
_cofiguration
��+ 8
)
��8 9
;
��9 :!
HttpResponseMessage
�� #
responseMessage
��$ 3
=
��4 5
objapi
��6 <
.
��< =
APICommunication
��= M
(
��M N
APIURLHelper
��N Z
.
��Z [
DeleteDocument
��[ i
+
��j k
$str
��l o
+
��p q
id
��r t
,
��t u

HttpMethod��v �
.��� �
Delete��� �
,��� �
token��� �
)��� �
.��� �
Result��� �
;��� �
if
�� 
(
�� 
responseMessage
�� #
.
��# $!
IsSuccessStatusCode
��$ 7
)
��7 8
{
�� 
string
�� 
jsonResponse
�� '
=
��( )
responseMessage
��* 9
.
��9 :
Content
��: A
.
��A B
ReadAsStringAsync
��B S
(
��S T
)
��T U
.
��U V
Result
��V \
;
��\ ]
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
SuccessMessage
��( 6
]
��6 7
=
��8 9
Convert
��: A
.
��A B
ToString
��B J
(
��J K$
_stringLocalizerShared
��K a
[
��a b
$str
��b v
]
��v w
)
��w x
;
��x y
}
�� 
else
�� 
TempData
�� 
[
�� 

UserHelper
�� '
.
��' (
ErrorMessage
��( 4
]
��4 5
=
��6 7
Convert
��8 ?
.
��? @
ToString
��@ H
(
��H I
responseMessage
��I X
.
��X Y
Content
��Y `
.
��` a
ReadAsStringAsync
��a r
(
��r s
)
��s t
.
��t u
Result
��u {
)
��{ |
;
��| }
}
�� 
catch
�� 
(
�� 
	Exception
�� 
e
�� 
)
�� 
{
�� 
_helper
�� 
.
�� 
LogExceptions
�� %
(
��% &
e
��& '
)
��' (
;
��( )
TempData
�� 
[
�� 

UserHelper
�� #
.
��# $
ErrorMessage
��$ 0
]
��0 1
=
��2 3
Convert
��4 ;
.
��; <
ToString
��< D
(
��D E
e
��E F
.
��F G

StackTrace
��G Q
)
��Q R
;
��R S
}
�� 
return
�� 
RedirectToAction
�� #
(
��# $
$str
��$ +
)
��+ ,
;
��, -
}
�� 	
private
�� 
int
�� 

DeleteFile
�� 
(
�� 
int
�� "
id
��# %
,
��% &
string
��' -
?
��- .
fileName
��/ 7
)
��7 8
{
�� 	
int
�� 
isDelete
�� 
=
�� 
$num
�� 
;
�� 
if
�� 
(
�� 
fileName
�� 
!=
�� 
null
��  
||
��! #
fileName
��$ ,
!=
��- /
$str
��0 2
)
��2 3
{
�� 
var
�� 
filePath
�� 
=
�� 
Path
�� #
.
��# $
Combine
��$ +
(
��+ ,
$str
��, =
,
��= >
fileName
��? G
)
��G H
;
��H I
filePath
�� 
=
�� 
filePath
�� #
.
��# $
Replace
��$ +
(
��+ ,
$str
��, 0
,
��0 1
$str
��2 5
)
��5 6
;
��6 7
if
�� 
(
�� 
System
�� 
.
�� 
IO
�� 
.
�� 
File
�� "
.
��" #
Exists
��# )
(
��) *
filePath
��* 2
)
��2 3
)
��3 4
{
�� 
System
�� 
.
�� 
IO
�� 
.
�� 
File
�� "
.
��" #
Delete
��# )
(
��) *
filePath
��* 2
)
��2 3
;
��3 4
isDelete
�� 
=
�� 
$num
��  
;
��  !
}
�� 
}
�� 
return
�� 
isDelete
�� 
;
�� 
}
�� 	
}
�� 
}�� �P
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
oUserLoggedInModel	//p �
.
//� �
RoleId
//� �
,
//� �

HttpMethod
//� �
.
//� �
Get
//� �
,
//� �
token
//� �
)
//� �
.
//� �
Result
//� �
;
//� �
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
controllerName	UUv �
)
UU� �
.
UU� �
Trim
UU� �
(
UU� �
)
UU� �
)
UU� �
.
UU� �
FirstOrDefault
UU� �
(
UU� �
)
UU� �
;
UU� �
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
$str	XXr �
)
XX� �
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
}dd �
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
} �M
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
� �
,
� �
_Success
� �
=
� �
false
� �
}
� �
;
� �
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
,	"" �
new
""� �
StringContent
""� �
(
""� �
JsonConvert
""� �
.
""� �
SerializeObject
""� �
(
""� �
context
""� �
.
""� �
	Exception
""� �
)
""� �
)
""� �
)
""� �
.
""� �
Result
""� �
;
""� �
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
}ww �k
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
body	} �
=
� �
null
� �
,
� �
string
� �
ContentType
� �
=
� �
$str
� �
,
� �
List
� �
<
� �
	IFormFile
� �
>
� �
formFile
� �
=
� �
null
� �
,
� �
string
� �
bodyKey
� �
=
� �
null
� �
)
� �
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
true	} �
;
� �
}
� �
;
� �
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
)	\\ �
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
true	cc} �
;
cc� �
}
cc� �
;
cc� �
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
�� $
.
��$ %

StatusCode
��% /
=
��0 1
HttpStatusCode
��2 @
.
��@ A!
InternalServerError
��A T
;
��T U
}
�� 
if
�� 
(
�� "
oHttpResponseMessage
�� $
.
��$ %

StatusCode
��% /
==
��0 2
HttpStatusCode
��3 A
.
��A B
Unauthorized
��B N
)
��N O
{
�� 
string
�� 
redirecturl
�� "
=
��# $
$str
��% >
;
��> ?
string
�� 
scheme
�� 
=
�� !
httpContextAccessor
��  3
.
��3 4
HttpContext
��4 ?
.
��? @
Request
��@ G
.
��G H
Scheme
��H N
;
��N O
string
�� 
Host
�� 
=
�� !
httpContextAccessor
�� 1
.
��1 2
HttpContext
��2 =
.
��= >
Request
��> E
.
��E F
Host
��F J
.
��J K
ToUriComponent
��K Y
(
��Y Z
)
��Z [
;
��[ \
var
�� 
absoluteUri
�� 
=
��  !
string
��" (
.
��( )
Concat
��) /
(
��/ 0
scheme
��0 6
,
��6 7
$str
��8 =
,
��= >
Host
��? C
,
��C D
redirecturl
��E P
)
��P Q
;
��Q R!
httpContextAccessor
�� #
.
��# $
HttpContext
��$ /
.
��/ 0
Response
��0 8
.
��8 9
Redirect
��9 A
(
��A B
absoluteUri
��B M
)
��M N
;
��N O
}
�� 
return
�� "
oHttpResponseMessage
�� '
;
��' (
}
�� 	
}
�� 
}�� �
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
�� 
static
�� 
string
�� 
UpsertValuation
�� ,
=
��- .
$str
��/ K
;
��K L
public
�� 
static
�� 
string
�� 
GetAllValuation
�� ,
=
��- .
$str
��/ K
;
��K L
public
�� 
static
�� 
string
�� 
GetValuationById
�� -
=
��. /
$str
��0 M
;
��M N
public
�� 
static
�� 
string
�� !
DeleteValuationById
�� 0
=
��1 2
$str
��3 O
;
��O P
public
�� 
static
�� 
string
�� $
UpsertValuationFeeType
�� 3
=
��4 5
$str
��6 U
;
��U V
public
�� 
static
�� 
string
�� $
GetAllValuationFeeType
�� 3
=
��4 5
$str
��6 U
;
��U V
public
�� 
static
�� 
string
�� %
GetValuationFeeTypeById
�� 4
=
��5 6
$str
��7 W
;
��W X
public
�� 
static
�� 
string
�� (
DeleteValuationFeeTypeById
�� 7
=
��8 9
$str
��: Y
;
��Y Z
public
�� 
static
�� 
string
�� "
ValuationFeeTypeList
�� 1
=
��2 3
$str
��4 c
;
��c d
public
�� 
static
�� 
string
�� !
GetSearchClientType
�� 0
=
��1 2
$str
��3 V
;
��V W
public
�� 
static
�� 
string
�� 
GetClientTypeById
�� .
=
��/ 0
$str
��1 K
;
��K L
public
�� 
static
�� 
string
�� 
UpsertClientType
�� -
=
��. /
$str
��0 I
;
��I J
public
�� 
static
�� 
string
�� 
DeleteClientType
�� -
=
��. /
$str
��0 S
;
��S T
public
�� 
static
�� 
string
�� 
GetSearchClient
�� ,
=
��- .
$str
��/ J
;
��J K
public
�� 
static
�� 
string
�� 
GetClientById
�� *
=
��+ ,
$str
��- C
;
��C D
public
�� 
static
�� 
string
�� 
UpsertClient
�� )
=
��* +
$str
��, A
;
��A B
public
�� 
static
�� 
string
�� 
DeleteClient
�� )
=
��* +
$str
��, G
;
��G H
public
�� 
static
�� 
string
�� %
GetClientByClientTypeId
�� 4
=
��5 6
$str
��7 W
;
��W X
public
�� 
static
�� 
string
�� &
DeleteClientDocumentById
�� 5
=
��6 7
$str
��8 U
;
��U V
public
�� 
static
�� 
string
�� 

GetAllRole
�� '
=
��( )
$str
��* =
;
��= >
public
�� 
static
�� 
string
�� 
GetAllActiveRole
�� -
=
��. /
$str
��0 M
;
��M N
public
�� 
static
�� 
string
�� 
GetRoleById
�� (
=
��) *
$str
��+ C
;
��C D
public
�� 
static
�� 
string
�� 
SaveRole
�� %
=
��& '
$str
��( E
;
��E F
public
�� 
static
�� 
string
�� 
DeleteRoleById
�� +
=
��, -
$str
��. E
;
��E F
public
�� 
static
�� 
string
�� 
GetAllLocations
�� ,
=
��- .
$str
��/ F
;
��F G
public
�� 
static
�� 
string
�� 
UpsertLocation
�� +
=
��, -
$str
��. E
;
��E F
public
�� 
static
�� 
string
�� 
GetLocationById
�� ,
=
��- .
$str
��/ G
;
��G H
public
�� 
static
�� 
string
��  
DeleteLocationById
�� /
=
��0 1
$str
��2 I
;
��I J
public
�� 
static
�� 
string
�� 
GetAllDashboard
�� ,
=
��- .
$str
��/ G
;
��G H
public
�� 
static
�� 
string
�� "
GetPIDFDashBoardData
�� 1
=
��2 3
$str
��4 \
;
��\ ]
public
�� 
static
�� 
string
��  
GetAllNotification
�� /
=
��0 1
$str
��2 S
;
��S T
public
�� 
static
�� 
string
�� &
GetFilteredNotifications
�� 5
=
��6 7
$str
��8 _
;
��_ `
public
�� 
static
�� 
string
�� )
GetWebFilteredNotifications
�� 8
=
��9 :
$str
��; c
;
��c d
public
�� 
static
�� 
string
�� (
NotificationsClickedByUser
�� 7
=
��8 9
$str
��: c
;
��c d
public
�� 
static
�� 
string
�� $
NotificationsCountUser
�� 3
=
��4 5
$str
��6 [
;
��[ \
public
�� 
static
�� 
string
�� 
GetSearchVendor
�� ,
=
��- .
$str
��/ D
;
��D E
public
�� 
static
�� 
string
�� 
GetVendorById
�� *
=
��+ ,
$str
��- C
;
��C D
public
�� 
static
�� 
string
�� 
UpsertVendor
�� )
=
��* +
$str
��, A
;
��A B
public
�� 
static
�� 
string
�� 
DeleteVendor
�� )
=
��* +
$str
��, A
;
��A B
public
�� 
static
�� 
string
�� 
LogException
�� )
=
��* +
$str
��, G
;
��G H
public
�� 
static
�� 
string
�� 
GetAllModule
�� )
=
��* +
$str
��, G
;
��G H
public
�� 
static
�� 
string
�� 
GetAllDictionary
�� -
=
��. /
$str
��0 I
;
��I J
public
�� 
static
�� 
string
�� 
UpsertDictionary
�� -
=
��. /
$str
��0 I
;
��I J
public
�� 
static
�� 
string
�� 
GetDictionaryById
�� .
=
��/ 0
$str
��1 K
;
��K L
public
�� 
static
�� 
string
�� "
DeleteDictionaryById
�� 1
=
��2 3
$str
��4 M
;
��M N
public
�� 
static
�� 
string
�� $
UpsertMasterDictionary
�� 3
=
��4 5
$str
��6 _
;
��_ `
public
�� 
static
�� 
string
�� &
GetDictionaryDetailsById
�� 5
=
��6 7
$str
��8 c
;
��c d
public
�� 
static
�� 
string
�� *
GetDictionaryDescriptionById
�� 9
=
��: ;
$str
��< k
;
��k l
public
�� 
static
�� 
string
�� )
GetDictionaryWithSubDetails
�� 8
=
��9 :
$str
��; i
;
��i j
public
�� 
static
�� 
string
�� )
GetInvoiceTransactionStatus
�� 8
=
��9 :
$str
��; o
;
��o p
public
�� 
static
�� 
string
�� $
GetAllValuationRequest
�� 3
=
��4 5
$str
��6 _
;
��_ `
public
�� 
static
�� 
string
�� *
GetAllValuationRequestStatus
�� 9
=
��: ;
$str
��< [
;
��[ \
public
�� 
static
�� 
string
�� 
AssignApprover
�� +
=
��, -
$str
��. O
;
��O P
public
�� 
static
�� 
string
�� 
ValuationMethod
�� ,
=
��- .
$str
��/ W
;
��W X
public
�� 
static
�� 
string
�� $
ValuationQuatationList
�� 3
=
��4 5
$str
��6 [
;
��[ \
public
�� 
static
�� 
string
�� "
ValuationInvoiceList
�� 1
=
��2 3
$str
��4 U
;
��U V
public
�� 
static
�� 
string
�� $
UpsertValuationRequest
�� 3
=
��4 5
$str
��6 O
;
��O P
public
�� 
static
�� 
string
�� %
ValuationRequestGetById
�� 4
=
��5 6
$str
��7 Q
;
��Q R
public
�� 
static
�� 
string
�� /
!ValuationRequestGetHeaderInfoById
�� >
=
��? @
$str
��A e
;
��e f
public
�� 
static
�� 
string
�� (
ValuationRequestDeleteById
�� 7
=
��8 9
$str
��: S
;
��S T
public
�� 
static
�� 
string
�� !
UpdateRequestStatus
�� 0
=
��1 2
$str
��3 Y
;
��Y Z
public
�� 
static
�� 
string
�� 
GetRequestStatus
�� -
=
��. /
$str
��0 U
;
��U V
public
�� 
static
�� 
string
��  
ValuationAssesment
�� /
=
��0 1
$str
��2 `
;
��` a
public
�� 
static
�� 
string
�� $
GetSiteDescriptionList
�� 3
=
��4 5
$str
��6 b
;
��b c
public
�� 
static
�� 
string
�� !
GetValuationPDFData
�� 0
=
��1 2
$str
��3 [
;
��[ \
public
�� 
static
�� 
string
�� 
GetApproverLevel
�� -
=
��. /
$str
��0 U
;
��U V
public
�� 
static
�� 
string
�� "
UpdateApproverAction
�� 1
=
��2 3
$str
��4 \
;
��\ ]
public
�� 
static
�� 
string
�� 
DeleteDocument
�� +
=
��, -
$str
��. R
;
��R S
public
�� 
static
�� 
string
�� !
GetNotificationList
�� 0
=
��1 2
$str
��3 U
;
��U V
public
�� 
static
�� 
string
�� "
GetNotificationCount
�� 1
=
��2 3
$str
��4 W
;
��W X
public
�� 
static
�� 
string
��  
UpdateNotification
�� /
=
��0 1
$str
��2 Y
;
��Y Z
public
�� 
static
�� 
string
�� !
GetAllStatusHistory
�� 0
=
��1 2
$str
��3 _
;
��_ `
public
�� 
static
�� 
string
�� 
UpsertInvoice
�� *
=
��+ ,
$str
��- M
;
��M N
public
�� 
static
�� 
string
�� #
GetPaymentInvoiceById
�� 2
=
��3 4
$str
��5 ]
;
��] ^
public
�� 
static
�� 
string
��  
PaymentInvoiceById
�� /
=
��0 1
$str
��2 W
;
��W X
public
�� 
static
�� 
string
�� 
GetAllAudit
�� (
=
��) *
$str
��+ <
;
��< =
public
�� 
static
�� 
string
�� 
GetAuditDetails
�� ,
=
��- .
$str
��/ J
;
��J K
public
�� 
static
�� 
string
�� 
GetDetailsAudit
�� ,
=
��- .
$str
��/ P
;
��P Q
public
�� 
static
�� 
string
�� 
GetAuditTableName
�� .
=
��/ 0
$str
��1 S
;
��S T
public
�� 
static
�� 
string
�� '
UpsertMasterApproverLevel
�� 6
=
��7 8
$str
��9 U
;
��U V
public
�� 
static
�� 
string
�� (
GetMasterApproverLevelById
�� 7
=
��8 9
$str
��: W
;
��W X
public
�� 
static
�� 
string
�� )
GetMasterApproverLevelsList
�� 8
=
��9 :
$str
��; W
;
��W X
}
�� 
}�� �
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
} �[
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
)	 �
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

HttpMethod	66y �
.
66� �
Post
66� �
,
66� �
token
66� �
,
66� �
new
66� �
StringContent
66� �
(
66� �
JsonConvert
66� �
.
66� �
SerializeObject
66� �
(
66� �
ex
66� �
)
66� �
)
66� �
)
66� �
.
66� �
Result
66� �
;
66� �
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
�� 
.
�� 
Add
�� 
(
��  
upload
��  &
)
��& '
;
��' (
}
�� 
return
�� 
uploadFiles
�� 
;
�� 
}
�� 	
private
�� 
string
�� 
GetFileType
�� "
(
��" #
string
��# )
contentType
��* 5
)
��5 6
{
�� 	
switch
�� 
(
�� 
contentType
�� 
)
��  
{
�� 
case
�� 
$str
�� !
:
��! "
case
�� 
$str
��  
:
��  !
return
�� 
$str
�� "
;
��" #
case
�� 
$str
�� )
:
��) *
return
�� 
$str
�� !
;
��! "
case
�� 
$str
�� &
:
��& '
return
�� 
$str
��  
;
��  !
default
�� 
:
�� 
return
�� 
$str
�� $
;
��$ %
}
�� 
}
�� 	
}
�� 
}�� �
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
� �
)
� �
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
}   �	
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
} �
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
} �
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
} �
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
}		 �
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
}-- �T
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
�� 
;
�� 
app
�� 
.
�� 

UseSession
�� 
(
�� 
)
�� 
;
�� 
app
�� 
.
�� 
UseOutputCaching
��  
(
��  !
)
��! "
;
��" #
app
�� 
.
�� !
UseHttpsRedirection
�� #
(
��# $
)
��$ %
;
��% &
app
�� 
.
�� 
UseStaticFiles
�� 
(
�� 
)
��  
;
��  !
app
�� 
.
�� 

UseRouting
�� 
(
�� 
)
�� 
;
�� 
app
�� 
.
�� 
UseAuthentication
�� !
(
��! "
)
��" #
;
��# $
app
�� 
.
�� 
UseAuthorization
��  
(
��  !
)
��! "
;
��" #
app
�� 
.
�� 
UseEndpoints
�� 
(
�� 
	endpoints
�� &
=>
��' )
{
�� 
	endpoints
�� 
.
��  
MapControllerRoute
�� ,
(
��, -
name
�� 
:
�� 
$str
�� #
,
��# $
pattern
�� 
:
�� 
$str
�� H
)
��H I
;
��I J
}
�� 	
)
��	 

;
��
 
app
�� 
.
�� $
UseRequestLocalization
�� &
(
��& '
)
��' (
;
��( )
}
�� 	
}
�� 
}�� �
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