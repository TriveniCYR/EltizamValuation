£
aD:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\ApplicationServiceRegistration.cs
	namespace 	
ValuationWeb
 
. 
Application "
{ 
public 

static 
class *
ApplicationServiceRegistration 6
{		 
public

 
static

 
IServiceCollection

 ("
AddApplicationServices

) ?
(

? @
this

@ D
IServiceCollection

E W
services

X `
)

` a
{ 	
services 
. 
AddAutoMapper "
(" #
Assembly# +
.+ , 
GetExecutingAssembly, @
(@ A
)A B
)B C
;C D
services 
. 

AddMediatR 
(  
Assembly  (
.( ) 
GetExecutingAssembly) =
(= >
)> ?
)? @
;@ A
return 
services 
; 
} 	
} 
} ì
lD:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Contracts\Identity\IAuthenticationService.cs
	namespace 	
ValuationWeb
 
. 
Application "
." #
	Contracts# ,
., -
Identity- 5
{ 
public 

	interface "
IAuthenticationService +
{ 
Task 
< "
AuthenticationResponse #
># $
AuthenticateAsync% 6
(6 7!
AuthenticationRequest7 L
requestM T
)T U
;U V
Task		 
<		  
RegistrationResponse		 !
>		! "
RegisterAsync		# 0
(		0 1
RegistrationRequest		1 D
request		E L
)		L M
;		M N
Task

 
<

  
RefreshTokenResponse

 !
>

! "
RefreshTokenAsync

# 4
(

4 5
RefreshTokenRequest

5 H
request

I P
)

P Q
;

Q R
} 
} œ
iD:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Contracts\Infrastructure\ICacheService.cs
	namespace 	
ValuationWeb
 
. 
Application "
." #
	Contracts# ,
., -
Infrastructure- ;
{ 
public 

	interface 
ICacheService "
{ 
bool 
TryGet 
< 
T 
> 
( 
string 
cacheKey &
,& '
out( +
T, -
value. 3
)3 4
;4 5
T 	
Set
 
< 
T 
> 
( 
string 
cacheKey  
,  !
T" #
value$ )
)) *
;* +
void 
Remove 
( 
string 
cacheKey #
)# $
;$ %
} 
}		 Ω
iD:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Contracts\Infrastructure\IEmailService.cs
	namespace 	
ValuationWeb
 
. 
Application "
." #
	Contracts# ,
., -
Infrastructure- ;
{ 
public 

	interface 
IEmailService "
{ 
Task 
< 
bool 
> 
	SendEmail 
( 
Email "
email# (
)( )
;) *
}		 
}

 Õ
iD:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Contracts\Persistence\IAsyncRepository.cs
	namespace 	
ValuationWeb
 
. 
Application "
." #
	Contracts# ,
., -
Persistence- 8
{ 
public 

	interface 
IAsyncRepository %
<% &
T& '
>' (
where) .
T/ 0
:1 2
class3 8
{ 
Task		 
<		 
T		 
>		 
GetByIdAsync		 
(		 
Guid		 !
id		" $
)		$ %
;		% &
Task

 
<

 
IReadOnlyList

 
<

 
T

 
>

 
>

 
ListAllAsync

 +
(

+ ,
)

, -
;

- .
Task 
< 
T 
> 
AddAsync 
( 
T 
entity !
)! "
;" #
Task 
UpdateAsync 
( 
T 
entity !
)! "
;" #
Task 
DeleteAsync 
( 
T 
entity !
)! "
;" #
Task 
< 
IReadOnlyList 
< 
T 
> 
>  
GetPagedReponseAsync 3
(3 4
int4 7
page8 <
,< =
int> A
sizeB F
)F G
;G H
Task 
< 
T 
> 
GetByIdAsync 
( 
int  
id! #
)# $
;$ %
string 
GenerateAccountId  
(  !
string! '
	tableName( 1
,1 2
int3 6
tableKey7 ?
,? @
intA D
?D E
branchIdF N
)N O
;O P
} 
} ﬂ

jD:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Contracts\Persistence\IBranchRepository.cs
	namespace		 	
ValuationWeb		
 
.		 
Application		 "
.		" #
	Contracts		# ,
.		, -
Persistence		- 8
{

 
public 

	interface 
IBranchRepository &
:' (
IAsyncRepository) 9
<9 :
Branch: @
>@ A
{ 
Task 
< 
List 
< 
Branch 
> 
> !
GetBranchesWithEvents 0
(0 1
bool1 5
includePassedEvents6 I
)I J
;J K
Task 
< 
GlobalSeachResponse  
>  !-
!GetBranchListWithPaginationGlobal" C
(C D
BranchSearchFiltersD W
searchBranchX d
)d e
;e f
Task 
< !
BranchDetailViewModel "
>" #
GetBranchDetails$ 4
(4 5 
GetBranchDetailQuery5 I
branchDetailJ V
)V W
;W X
Task 
< 
Branch 
> 
GetBranchByName $
($ %
string% +
name, 0
)0 1
;1 2
} 
} µ
nD:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Contracts\Persistence\IMasterCityRepositoty.cs
	namespace 	
ValuationWeb
 
. 
Application "
." #
	Contracts# ,
., -
Persistence- 8
{ 
public 

	interface !
IMasterCityRepository *
:+ ,
IAsyncRepository- =
<= >

MasterCity> H
>H I
{ 
Task		 
<		 
DBOperation		 
>		 
Upsert		  
(		  !
MasterCityEntity		! 1

entityUser		2 <
)		< =
;		= >
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
)' (
;( )
} 
} ¨
kD:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Contracts\Persistence\IMessageRepository.cs
	namespace 	
ValuationWeb
 
. 
Application "
." #
	Contracts# ,
., -
Persistence- 8
{ 
}

 ∆
pD:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Contracts\Persistence\IRefreshTokenRepository.cs
	namespace 	
ValuationWeb
 
. 
Application "
." #
	Contracts# ,
., -
Persistence- 8
{		 
public

 

	interface

 #
IRefreshTokenRepository

 ,
:

, -
IAsyncRepository

. >
<

> ?
RefreshToken

? K
>

K L
{ 
Task 
< 
RefreshToken 
> "
GetRefreshTokenByToken 1
(1 2
string2 8
token9 >
)> ?
;? @
} 
} Ó
hD:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Contracts\Persistence\IUserRepository.cs
	namespace 	
ValuationWeb
 
. 
Application "
." #
	Contracts# ,
., -
Persistence- 8
{ 
public 

	interface 
IUserRepository $
:% &
IAsyncRepository' 7
<7 8
User8 <
>< =
{ 
Task		 
<		 
User		 
>		 "
GetUserByEmailPassword		 )
(		) *
string		* 0
email		1 6
,		6 7
string		8 >
password		? G
)		G H
;		H I
Task

 
<

 
User

 
>

 
GetUserByEmail

 !
(

! "
string

" (
email

) .
)

. /
;

/ 0
Task 
< 
int 
> 
UpdateUserPassword $
($ %
int% (
id) +
,+ ,
string- 3
password4 <
)< =
;= >
Task 
< 
string 
> 
GetEncryptPassword '
(' (
string( .

inputValue/ 9
)9 :
;: ;
Task 
< 
string 
> (
GetDecryptedTextFromPassword 1
(1 2
string2 8
decryptValue9 E
)E F
;F G
Task 
< 
UserDetailViewModel  
>  !
GetUserDetailsById" 4
(4 5
int5 8
Id9 ;
); <
;< =
Task 
< 
int 
> 
SetForgotPassword #
(# $
int$ '
id( *
,* +
string, 2
ForgotPasswordToken3 F
)F G
;G H
Task 
< 
string 
> $
UpsertUserAccountDetails -
(- .
User. 2
request3 :
): ;
;; <
} 
} î
aD:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Exceptions\BadRequestException.cs
	namespace 	
ValuationWeb
 
. 
Application "
." #

Exceptions# -
{ 
[ 
Serializable 
] 
public 

class 
BadRequestException $
:$ % 
ApplicationException& :
{ 
public		 
BadRequestException		 "
(		" #
string		# )
message		* 1
)		1 2
:		2 3
base		4 8
(		8 9
message		9 @
)		@ A
{

 	
} 	
	protected 
BadRequestException %
(% &
SerializationInfo& 7
info8 <
,< =
StreamingContext> N
contextO V
)V W
: 
base 
( 
info 
, 
context  
)  !
{ 	
} 	
} 
}  	
_D:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Exceptions\NotFoundException.cs
	namespace 	
ValuationWeb
 
. 
Application "
." #

Exceptions# -
{ 
[ 
Serializable 
] 
public 

class 
NotFoundException "
:# $ 
ApplicationException% 9
{ 
public		 
NotFoundException		  
(		  !
string		! '
name		( ,
,		, -
object		. 4
key		5 8
)		8 9
:

 
base

 
(

 
$"

 
{

 
name

 
}

 
$str

 
{

 
key

 !
}

! "
$str

" 0
"

0 1
)

1 2
{ 	
} 	
	protected 
NotFoundException #
(# $
SerializationInfo$ 5
info6 :
,: ;
StreamingContext< L
contextM T
)T U
: 
base 
( 
info 
, 
context  
)  !
{ 	
} 	
} 
} ‘
aD:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Exceptions\ValidationException.cs
	namespace 	
ValuationWeb
 
. 
Application "
." #

Exceptions# -
{ 
[ 
Serializable 
] 
public		 

class		 
ValidationException		 $
:		% & 
ApplicationException		' ;
{

 
public 
List 
< 
string 
> 
ValdationErrors +
{, -
get. 1
;1 2
set3 6
;6 7
}8 9
public 
ValidationException "
(" #
ValidationResult# 3
validationResult4 D
)D E
{ 	
ValdationErrors 
= 
new !
List" &
<& '
string' -
>- .
(. /
)/ 0
;0 1
foreach 
( 
var 
validationError (
in) +
validationResult, <
.< =
Errors= C
)C D
{ 
ValdationErrors 
.  
Add  #
(# $
validationError$ 3
.3 4
ErrorMessage4 @
)@ A
;A B
} 
} 	
	protected 
ValidationException %
(% &
SerializationInfo& 7
info8 <
,< =
StreamingContext> N
contextO V
)V W
: 
base 
( 
info 
, 
context  
)  !
{ 	
} 	
} 
} Û#
}D:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Features\Branchs\Commands\CreateBranch\CreateBranchCommand.cs
	namespace 	
ValuationWeb
 
. 
Application "
." #
Features# +
.+ ,
Branchs, 3
.3 4
Commands4 <
.< =
CreateBranch= I
{ 
public 

class 
CreateBranchCommand $
:% &
IRequest' /
</ 0
Response0 8
<8 9!
BranchDetailViewModel9 N
>N O
>O P
{		 
public

 
int

 
Id

 
{

 
get

 
;

 
set

  
;

  !
}

" #
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
=) *
null+ /
!/ 0
;0 1
public 
string 
JurName 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
null. 2
!2 3
;3 4
public 
string 
BankCode 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
null/ 3
!3 4
;4 5
public 
string 
ManagerPost !
{" #
get$ '
;' (
set) ,
;, -
}. /
=0 1
null2 6
!6 7
;7 8
public 
string 
Manager 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
null. 2
!2 3
;3 4
public 
string 
AccountantPost $
{% &
get' *
;* +
set, /
;/ 0
}1 2
=3 4
null5 9
!9 :
;: ;
public 
string 

Accountant  
{! "
get# &
;& '
set( +
;+ ,
}- .
=/ 0
null1 5
!5 6
;6 7
public 
string 
? 
Address 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
? 
Phone 
{ 
get "
;" #
set$ '
;' (
}) *
public 
DateTime 
? 
OpenDate !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DateTime 
? 
	CloseDate "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
int 
? 
DefaultCountryId $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
int 
? 
DefaultRegionId #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
int 
? 
DefaultAreaId !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
User 
{ 
get  
;  !
set" %
;% &
}' (
=) *
null+ /
!/ 0
;0 1
public 
DateTime 
Modified  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
? 
Warrant 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
? 
License 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
? 
	NameShort  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
bool 
? 
IsActive 
{ 
get  #
;# $
set% (
;( )
}* +
}   
}!! Ù'
ÑD:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Features\Branchs\Commands\CreateBranch\CreateBranchCommandHandler.cs
	namespace 	
ValuationWeb
 
. 
Application "
." #
Features# +
.+ ,
Branchs, 3
.3 4
Commands4 <
.< =
CreateBranch= I
{ 
public 

class &
CreateBranchCommandHandler +
:, -
IRequestHandler. =
<= >
CreateBranchCommand> Q
,Q R
ResponseS [
<[ \!
BranchDetailViewModel\ q
>q r
>r s
{ 
private 
readonly 
IBranchRepository *
_branchRepository+ <
;< =
private 
readonly 
IMapper  
_mapper! (
;( )
public &
CreateBranchCommandHandler )
() *
IMapper* 1
mapper2 8
,8 9
IBranchRepository: K
branchRepositoryL \
)\ ]
{ 	
_mapper 
= 
mapper 
; 
_branchRepository 
= 
branchRepository  0
;0 1
} 	
public 
async 
Task 
< 
Response "
<" #!
BranchDetailViewModel# 8
>8 9
>9 :
Handle; A
(A B
CreateBranchCommandB U
requestV ]
,] ^
CancellationToken_ p
cancellationToken	q Ç
)
Ç É
{ 	
var #
createBranchCmdResponse '
=( )
new* -
Response. 6
<6 7!
BranchDetailViewModel7 L
>L M
(M N
)N O
;O P
var 
existBranch 
= 
await #
_branchRepository$ 5
.5 6
GetBranchByName6 E
(E F
requestF M
.M N
NameN R
)R S
!=T V
nullW [
;[ \
var!! 
	validator!! 
=!! 
new!! (
CreateBranchCommandValidator!!  <
(!!< =
)!!= >
;!!> ?
var"" 
validationResult""  
=""! "
await""# (
	validator"") 2
.""2 3
ValidateAsync""3 @
(""@ A
request""A H
)""H I
;""I J
if$$ 
($$ 
validationResult$$  
.$$  !
Errors$$! '
.$$' (
Count$$( -
>$$. /
$num$$0 1
||$$2 4
existBranch$$5 @
)$$@ A
{%% #
createBranchCmdResponse&& '
.&&' (
	Succeeded&&( 1
=&&2 3
false&&4 9
;&&9 :#
createBranchCmdResponse'' '
.''' (
Errors''( .
=''/ 0
new''1 4
List''5 9
<''9 :
string'': @
>''@ A
(''A B
)''B C
;''C D
foreach(( 
((( 
var(( 
error(( "
in((# %
validationResult((& 6
.((6 7
Errors((7 =
)((= >
{)) #
createBranchCmdResponse** +
.**+ ,
Errors**, 2
.**2 3
Add**3 6
(**6 7
error**7 <
.**< =
ErrorMessage**= I
)**I J
;**J K
}++ 
if.. 
(.. 
existBranch.. 
)..  
{// #
createBranchCmdResponse00 +
.00+ ,
Errors00, 2
.002 3
Add003 6
(006 7
$str007 m
)00m n
;00n o
}11 
}22 
else33 
{44 
var55 
branch55 
=55 
_mapper55 $
.55$ %
Map55% (
<55( )
Branch55) /
>55/ 0
(550 1
request551 8
)558 9
;559 :
await77 
_branchRepository77 '
.77' (
AddAsync77( 0
(770 1
branch771 7
)777 8
;778 9
var:: 
branchs:: 
=:: 
await:: #
_branchRepository::$ 5
.::5 6
GetByIdAsync::6 B
(::B C
branch::C I
.::I J
Id::J L
)::L M
;::M N#
createBranchCmdResponse<< '
.<<' (
Data<<( ,
=<<- .
_mapper<</ 6
.<<6 7
Map<<7 :
<<<: ;!
BranchDetailViewModel<<; P
><<P Q
(<<Q R
branchs<<R Y
)<<Y Z
;<<Z [#
createBranchCmdResponse== '
.==' (
	Succeeded==( 1
===2 3
true==4 8
;==8 9#
createBranchCmdResponse>> '
.>>' (
Message>>( /
=>>0 1
$str>>2 ;
;>>; <
}?? 
returnAA #
createBranchCmdResponseAA *
;AA* +
}BB 	
}CC 
}DD á

ÜD:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Features\Branchs\Commands\CreateBranch\CreateBranchCommandValidator.cs
	namespace 	
ValuationWeb
 
. 
Application "
." #
Features# +
.+ ,
Branchs, 3
.3 4
Commands4 <
.< =
CreateBranch= I
{ 
public 

class (
CreateBranchCommandValidator -
:. /
AbstractValidator1 B
<B C
CreateBranchCommandC V
>V W
{ 
public (
CreateBranchCommandValidator +
(+ ,
), -
{ 	
RuleFor		 
(		 
p		 
=>		 
p		 
.		 
Name		 
)		  
.

 
NotEmpty

 
(

 
)

 
.

 
WithMessage

 '
(

' (
$str

( E
)

E F
. 
NotNull 
( 
) 
. 
MaximumLength 
( 
$num !
)! "
." #
WithMessage# .
(. /
$str/ ^
)^ _
;_ `
} 	
} 
} Ú#
ÖD:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Features\Branchs\Commands\DeleteBranchById\DeleteBranchByIdCommand.cs
	namespace 	
ValuationWeb
 
. 
Application "
." #
Features# +
.+ ,
Branchs, 3
.3 4
Commands4 <
.< =
DeleteBranchById= M
{ 
public 

class #
DeleteBranchByIdCommand (
:( )
IRequest* 2
<2 3
Response3 ;
<; <
int< ?
>? @
>@ A
{ 
public		 
int		 
Id		 
{		 
get		 
;		 
set		  
;		  !
}		" #
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
=

) *
null

+ /
!

/ 0
;

0 1
public 
string 
JurName 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
null. 2
!2 3
;3 4
public 
string 
BankCode 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
null/ 3
!3 4
;4 5
public 
string 
ManagerPost !
{" #
get$ '
;' (
set) ,
;, -
}. /
=0 1
null2 6
!6 7
;7 8
public 
string 
Manager 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
null. 2
!2 3
;3 4
public 
string 
AccountantPost $
{% &
get' *
;* +
set, /
;/ 0
}1 2
=3 4
null5 9
!9 :
;: ;
public 
string 

Accountant  
{! "
get# &
;& '
set( +
;+ ,
}- .
=/ 0
null1 5
!5 6
;6 7
public 
string 
? 
Address 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
? 
Phone 
{ 
get "
;" #
set$ '
;' (
}) *
public 
DateTime 
? 
OpenDate !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DateTime 
? 
	CloseDate "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
int 
? 
DefaultCountryId $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
int 
? 
DefaultRegionId #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
int 
? 
DefaultAreaId !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
User 
{ 
get  
;  !
set" %
;% &
}' (
=) *
null+ /
!/ 0
;0 1
public 
DateTime 
Modified  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
? 
Warrant 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
? 
License 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
? 
	NameShort  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
bool 
? 
IsActive 
{ 
get  #
;# $
set% (
;( )
}* +
} 
}   Ï
åD:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Features\Branchs\Commands\DeleteBranchById\DeleteBranchByIdCommandHandler.cs
	namespace		 	
ValuationWeb		
 
.		 
Application		 "
.		" #
Features		# +
.		+ ,
Branchs		, 3
.		3 4
Commands		4 <
.		< =
DeleteBranchById		= M
{

 
public 

class *
DeleteBranchByIdCommandHandler /
:0 1
IRequestHandler2 A
<A B#
DeleteBranchByIdCommandB Y
,Y Z
Response[ c
<c d
intd g
>g h
>h i
{ 
private 
readonly 
IBranchRepository *
_branchRepository+ <
;< =
private 
readonly 
IMapper  
_mapper! (
;( )
public *
DeleteBranchByIdCommandHandler -
(- .
IMapper. 5
mapper6 <
,< =
IBranchRepository> O
branchRepositoryP `
)` a
{ 	
_mapper 
= 
mapper 
; 
_branchRepository 
= 
branchRepository  0
;0 1
} 	
public 
async 
Task 
< 
Response "
<" #
int# &
>& '
>' (
Handle) /
(/ 0#
DeleteBranchByIdCommand0 G
requestH O
,O P
CancellationTokenQ b
cancellationTokenc t
)t u
{ 	
var 
BranchsToDelete 
=  !
await" '
_branchRepository( 9
.9 :
GetByIdAsync: F
(F G
requestG N
.N O
IdO Q
)Q R
;R S
if 
( 
BranchsToDelete 
==  "
null# '
)' (
{ 
var 

resposeObj 
=  
new! $
Response% -
<- .
int. 1
>1 2
(2 3
request3 :
.: ;
Id; =
+> ?
$str@ S
)S T
;T U
return   

resposeObj   !
;  ! "
}!! 
var## 
reqInput## 
=## 
_mapper## "
.##" #
Map### &
<##& '
Branch##' -
>##- .
(##. /
BranchsToDelete##/ >
)##> ?
;##? @
reqInput$$ 
.$$ 
IsActive$$ 
=$$ 
false$$  %
;$$% &
reqInput%% 
.%% 
	CloseDate%% 
=%%  
DateTime%%! )
.%%) *
Now%%* -
;%%- .
await&& 
_branchRepository&& #
.&&# $
UpdateAsync&&$ /
(&&/ 0
reqInput&&0 8
)&&8 9
;&&9 :
return(( 
new(( 
Response(( 
<((  
int((  #
>((# $
((($ %
request((% ,
.((, -
Id((- /
,((/ 0
$str((1 K
)((K L
;((L M
})) 	
}** 
}++ Û#
}D:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Features\Branchs\Commands\UpdateBranch\UpdateBranchCommand.cs
	namespace 	
ValuationWeb
 
. 
Application "
." #
Features# +
.+ ,
Branchs, 3
.3 4
Commands4 <
.< =
UpdateBranch= I
{ 
public 

class 
UpdateBranchCommand $
:% &
IRequest' /
</ 0
Response0 8
<8 9!
BranchDetailViewModel9 N
>N O
>O P
{		 
public

 
int

 
Id

 
{

 
get

 
;

 
set

  
;

  !
}

" #
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
=) *
null+ /
!/ 0
;0 1
public 
string 
JurName 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
null. 2
!2 3
;3 4
public 
string 
BankCode 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
null/ 3
!3 4
;4 5
public 
string 
ManagerPost !
{" #
get$ '
;' (
set) ,
;, -
}. /
=0 1
null2 6
!6 7
;7 8
public 
string 
Manager 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
null. 2
!2 3
;3 4
public 
string 
AccountantPost $
{% &
get' *
;* +
set, /
;/ 0
}1 2
=3 4
null5 9
!9 :
;: ;
public 
string 

Accountant  
{! "
get# &
;& '
set( +
;+ ,
}- .
=/ 0
null1 5
!5 6
;6 7
public 
string 
? 
Address 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
? 
Phone 
{ 
get "
;" #
set$ '
;' (
}) *
public 
DateTime 
? 
OpenDate !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
DateTime 
? 
	CloseDate "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
int 
? 
DefaultCountryId $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
int 
? 
DefaultRegionId #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
int 
? 
DefaultAreaId !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
User 
{ 
get  
;  !
set" %
;% &
}' (
=) *
null+ /
!/ 0
;0 1
public 
DateTime 
Modified  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
? 
Warrant 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
? 
License 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
? 
	NameShort  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
bool 
? 
IsActive 
{ 
get  #
;# $
set% (
;( )
}* +
}   
}!! Í%
ÑD:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Features\Branchs\Commands\UpdateBranch\UpdateBranchCommandHandler.cs
	namespace 	
ValuationWeb
 
. 
Application "
." #
Features# +
.+ ,
Branchs, 3
.3 4
Commands4 <
.< =
UpdateBranch= I
{		 
public 

class &
UpdateBranchCommandHandler +
:, -
IRequestHandler. =
<= >
UpdateBranchCommand> Q
,Q R
ResponseS [
<[ \!
BranchDetailViewModel\ q
>q r
>r s
{ 
private 
readonly 
IBranchRepository *
_branchRepository+ <
;< =
private 
readonly 
IMapper  
_mapper! (
;( )
public &
UpdateBranchCommandHandler )
() *
IMapper* 1
mapper2 8
,8 9
IBranchRepository: K
branchRepositoryL \
)\ ]
{ 	
_mapper 
= 
mapper 
; 
_branchRepository 
= 
branchRepository  0
;0 1
} 	
public 
async 
Task 
< 
Response "
<" #!
BranchDetailViewModel# 8
>8 9
>9 :
Handle; A
(A B
UpdateBranchCommandB U
requestV ]
,] ^
CancellationToken_ p
cancellationToken	q Ç
)
Ç É
{ 	
var 
	updateCmd 
= 
new 
Response  (
<( )!
BranchDetailViewModel) >
>> ?
(? @
)@ A
;A B
var 
existBranch 
= 
await #
_branchRepository$ 5
.5 6
GetBranchByName6 E
(E F
requestF M
.M N
NameN R
)R S
;S T
var 
BranchsToUpdate 
=  !
await" '
_branchRepository( 9
.9 :
GetByIdAsync: F
(F G
requestG N
.N O
IdO Q
)Q R
;R S
if 
( 
BranchsToUpdate 
==  "
null# '
)' (
{   
	updateCmd!! 
.!! 
	Succeeded!! #
=!!$ %
false!!& +
;!!+ ,
	updateCmd"" 
."" 
Message"" !
=""" #
request""$ +
.""+ ,
Id"", .
+""/ 0
$str""1 D
;""D E
}## 
if%% 
(%% 
existBranch%% 
!=%% 
null%% #
&&%%$ &
existBranch%%' 2
.%%2 3
Id%%3 5
!=%%6 8
request%%9 @
.%%@ A
Id%%A C
)%%C D
{&& 
	updateCmd'' 
.'' 
	Succeeded'' #
=''$ %
false''& +
;''+ ,
	updateCmd(( 
.(( 
Errors((  
=((! "
new((# &
List((' +
<((+ ,
string((, 2
>((2 3
(((3 4
)((4 5
;((5 6
	updateCmd)) 
.)) 
Errors))  
.))  !
Add))! $
())$ %
$str))% b
)))b c
;))c d
}** 
else++ 
{,, 
var-- 
reqInput-- 
=-- 
_mapper-- &
.--& '
Map--' *
<--* +
Branch--+ 1
>--1 2
(--2 3
request--3 :
)--: ;
;--; <
await00 
_branchRepository00 '
.00' (
UpdateAsync00( 3
(003 4
reqInput004 <
)00< =
;00= >
reqInput22 
=22 
await22  
_branchRepository22! 2
.222 3
GetByIdAsync223 ?
(22? @
reqInput22@ H
.22H I
Id22I K
)22K L
;22L M
	updateCmd44 
.44 
Data44 
=44  
_mapper44! (
.44( )
Map44) ,
<44, -!
BranchDetailViewModel44- B
>44B C
(44C D
reqInput44D L
)44L M
;44M N
	updateCmd55 
.55 
	Succeeded55 #
=55$ %
true55& *
;55* +
	updateCmd66 
.66 
Message66 !
=66" #
$str66$ J
+66J K
request66L S
.66S T
Id66T V
;66W X
}77 
return88 
	updateCmd88 
;88 
}99 	
}:: 
};; ˛
ÄD:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Features\Branchs\Queries\GetBranchDetail\GetBranchDetailQuery.cs
	namespace 	
ValuationWeb
 
. 
Application "
." #
Features# +
.+ ,
Branchs, 3
.3 4
Queries4 ;
.; <
GetBranchDetail< K
{ 
public 

class  
GetBranchDetailQuery %
:& '
IRequest( 0
<0 1
Response1 9
<9 :!
BranchDetailViewModel: O
>O P
>P Q
{ 
public 
int 
? 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
bool 
? 
status 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
? 
Name 
{ 
get !
;! "
set# &
;& '
}( )
} 
} Ÿ
áD:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Features\Branchs\Queries\GetBranchDetail\GetBranchDetailQueryHandler.cs
	namespace		 	
ValuationWeb		
 
.		 
Application		 "
.		" #
Features		# +
.		+ ,
Branchs		, 3
.		3 4
Queries		4 ;
.		; <
GetBranchDetail		< K
{

 
public 

class '
GetBranchDetailQueryHandler ,
:- .
IRequestHandler/ >
<> ? 
GetBranchDetailQuery? S
,S T
ResponseU ]
<] ^!
BranchDetailViewModel^ s
>s t
>t u
{ 
private 
readonly 
IBranchRepository *
_branchRepository+ <
;< =
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly 
ILogger  
_logger! (
;( )
public '
GetBranchDetailQueryHandler *
(* +
IMapper+ 2
mapper3 9
,9 :
IBranchRepository; L
branchRepositoryM ]
,] ^
ILogger_ f
<f g(
GetBranchDetailQueryHandler	g Ç
>
Ç É
logger
Ñ ä
)
ä ã
{ 	
_mapper 
= 
mapper 
; 
_branchRepository 
= 
branchRepository  0
;0 1
_logger 
= 
logger 
; 
} 	
public 
async 
Task 
< 
Response "
<" #!
BranchDetailViewModel# 8
>8 9
>9 :
Handle; A
(A B 
GetBranchDetailQueryB V
requestW ^
,^ _
CancellationToken` q
cancellationToken	r É
)
É Ñ
{ 	
var 

allBranchs 
= 
await "
_branchRepository# 4
.4 5
GetBranchDetails5 E
(E F
requestF M
)M N
;N O
var 
branch 
= 
_mapper  
.  !
Map! $
<$ %!
BranchDetailViewModel% :
>: ;
(; <

allBranchs< F
)F G
;G H
if 
( 
branch 
== 
null 
) 
{   
return!! 
new!! 
Response!! #
<!!# $!
BranchDetailViewModel!!$ 9
>!!9 :
(!!: ;
$str!!; M
)!!M N
;!!N O
}"" 
return## 
new## 
Response## 
<##  !
BranchDetailViewModel##  5
>##5 6
(##6 7
branch##7 =
,##= >
$str##? H
)##H I
;##I J
}$$ 	
}%% 
}&& ƒ	
ãD:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Features\Branchs\Queries\GetBranchListWithPagination\BranchSearchFilters.cs
	namespace 	
ValuationWeb
 
. 
Application "
." #
Features# +
.+ ,
Branchs, 3
.3 4
Queries4 ;
.; <'
GetBranchListWithPagination< W
{ 
public 

class 
BranchSearchFilters $
:% &
GlobalSeachFilter' 8
,8 9
IRequest: B
<B C
ResponseC K
<K L
GlobalSeachResponseL _
>_ `
>` a
{		 
public

 
bool

 
?

 
IsActive

 
{

 
get

  #
;

# $
set

% (
;

( )
}

* +
public 
string 
? 
Letter 
{ 
get  #
;# $
set% (
;( )
}* +
public 
int 
? 
Id 
{ 
get 
; 
set !
;! "
}# $
} 
} ›
íD:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Features\Branchs\Queries\GetBranchListWithPagination\BranchSearchFiltersHandler.cs
	namespace		 	
ValuationWeb		
 
.		 
Application		 "
.		" #
Features		# +
.		+ ,
Branchs		, 3
.		3 4
Queries		4 ;
.		; <'
GetBranchListWithPagination		< W
{

 
public 

class &
BranchSearchFiltersHandler +
:, -
IRequestHandler. =
<= >
BranchSearchFilters> Q
,Q R
ResponseS [
<[ \
GlobalSeachResponse\ o
>o p
>p q
{ 
private 
readonly 
IBranchRepository *
_branchRepository+ <
;< =
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly 
ILogger  
_logger! (
;( )
public &
BranchSearchFiltersHandler )
() *
IMapper* 1
mapper2 8
,8 9
IBranchRepository: K
branchRepositoryL \
,\ ]
ILogger^ e
<e f'
BranchSearchFiltersHandler	f Ä
>
Ä Å
logger
Ç à
)
à â
{ 	
_mapper 
= 
mapper 
; 
_branchRepository 
= 
branchRepository  0
;0 1
_logger 
= 
logger 
; 
} 	
public 
async 
Task 
< 
Response "
<" #
GlobalSeachResponse# 6
>6 7
>7 8
Handle9 ?
(? @
BranchSearchFilters@ S
requestT [
,[ \
CancellationToken] n
cancellationToken	o Ä
)
Ä Å
{ 	
var 

allBranchs 
= 
await "
_branchRepository# 4
.4 5-
!GetBranchListWithPaginationGlobal5 V
(V W
requestW ^
)^ _
;_ `
return 
new 
Response 
<  
GlobalSeachResponse  3
>3 4
(4 5

allBranchs5 ?
,? @
$strA J
)J K
;K L
;M N
} 	
}   
}!! ú
kD:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Features\GloblaFilters\GlobalSeachFilter.cs
	namespace 	
ValuationWeb
 
. 
Application "
." #
Features# +
.+ ,
GloblaFilters, 9
{ 
public 

class 
GlobalSeachFilter "
{ 
public 
int 
? 

PageNumber 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int 
? 
PageSize 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
? 
OrderClause "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
int 
? 
ReverseSort 
{  !
get" %
;% &
set' *
;* +
}, -
} 
public 

class 
GlobalSeachResponse $
:% &
GlobalSeachFilter' 8
{ 
public 
int 
? 
TotalRecords  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
dynamic 
dataresults "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} ñ
hD:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Features\MasterCity\MasterCityCommand.cs
	namespace 	
ValuationWeb
 
. 
Application "
." #
Features# +
{ 
public 

class 
MasterCityCommand "
{ 
}

 
public 

class #
MasterCityGetAllCommand (
:) *
IRequest+ 3
<3 4"
DataTableResponseModel4 J
>J K
{ 
public 
int 
draw 
{ 
get 
; 
set "
;" #
}$ %
public 
int 
length 
{ 
get 
;  
set! $
;$ %
}& '
public 
int 
start 
{ 
get 
; 
set  #
;# $
}% &
public 
string 

searchText  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
public 

class $
MasterCityGetByIdCommand )
:* +
IRequest, 4
<4 5
MasterCityEntity5 E
>E F
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
} 
public 

class #
MasterCityDeleteCommand (
:) *
IRequest+ 3
<3 4
bool4 8
>8 9
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
} 
public"" 

class"" #
MasterCityUpsertCommand"" (
:"") *
IRequest""+ 3
<""3 4
DBOperation""4 ?
>""? @
{## 
public$$ 
int$$ 
Id$$ 
{$$ 
get$$ 
;$$ 
set$$  
;$$  !
}$$" #
public%% 
string%% 
CityName%% 
{%%  
get%%! $
;%%$ %
set%%& )
;%%) *
}%%+ ,
public&& 
int&& 
	CountryId&& 
{&& 
get&& "
;&&" #
set&&$ '
;&&' (
}&&) *
public'' 
string'' 
CountryName'' !
{''" #
get''$ '
;''' (
set'') ,
;'', -
}''. /
public(( 
int(( 
StateId(( 
{(( 
get((  
;((  !
set((" %
;((% &
}((' (
public)) 
string)) 
	StateName)) 
{))  !
get))" %
;))% &
set))' *
;))* +
})), -
public** 
string** 
STDCode** 
{** 
get**  #
;**# $
set**% (
;**( )
}*** +
public++ 
int++ 
IsActive++ 
{++ 
get++ !
;++! "
set++# &
;++& '
}++( )
public,, 
DateTime,, 
	CreatedOn,, !
{,," #
get,,$ '
;,,' (
set,,) ,
;,,, -
},,. /
public-- 
int-- 
	CreatedBy-- 
{-- 
get-- "
;--" #
set--$ '
;--' (
}--) *
}.. 
}// â^
oD:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Features\MasterCity\MasterCityCommandHandler.cs
	namespace 	
ValuationWeb
 
. 
Application "
." #
Features# +
{ 
public 

class *
MasterCityGetAllCommandHandler /
:0 1
IRequestHandler2 A
<A B#
MasterCityGetAllCommandB Y
,Y Z"
DataTableResponseModel[ q
>q r
{ 
private 
readonly !
IMasterCityRepository .
_cityRepository/ >
;> ?
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly 
ILogger  
_logger! (
;( )
public *
MasterCityGetAllCommandHandler -
(- .
IMapper. 5
mapper6 <
,< =!
IMasterCityRepository> S
cityRepositoryT b
,b c
ILoggerd k
<k l+
MasterCityGetAllCommandHandler	l ä
>
ä ã
logger
å í
)
í ì
{ 	
_cityRepository 
= 
cityRepository ,
;, -
} 	
public 
async 
Task 
< "
DataTableResponseModel 0
>0 1
Handle2 8
(8 9#
MasterCityGetAllCommand9 P
requestQ X
,X Y
CancellationTokenZ k
cancellationTokenl }
)} ~
{ 	
var 
dd 
= 
new "
DataTableAjaxPostModel /
(/ 0
)0 1
{ 
draw 
= 
$num 
, 
length 
= 
$num 
}   
;   
var"" 
alldata"" 
="" 
await"" 
_cityRepository""  /
.""/ 0
GetAll""0 6
(""6 7
dd""7 9
)""9 :
;"": ;
return## 
alldata## 
;## 
}$$ 	
}%% 
public'' 

class'' +
MasterCityGetByIdCommandHandler'' 0
:''1 2
IRequestHandler''3 B
<''B C$
MasterCityGetByIdCommand''C [
,''[ \
MasterCityEntity''] m
>''m n
{(( 
private)) 
readonly)) !
IMasterCityRepository)) .
_cityRepository))/ >
;))> ?
private** 
readonly** 
IMapper**  
_mapper**! (
;**( )
private++ 
readonly++ 
ILogger++  
_logger++! (
;++( )
public,, +
MasterCityGetByIdCommandHandler,, .
(,,. /
IMapper,,/ 6
mapper,,7 =
,,,= >!
IMasterCityRepository,,? T
cityRepository,,U c
,,,c d
ILogger,,e l
<,,l m,
MasterCityGetByIdCommandHandler	,,m å
>
,,å ç
logger
,,é î
)
,,î ï
{-- 	
_cityRepository.. 
=.. 
cityRepository.. ,
;.., -
_mapper// 
=// 
mapper// 
;// 
}00 	
public22 
async22 
Task22 
<22 
MasterCityEntity22 *
>22* +
Handle22, 2
(222 3$
MasterCityGetByIdCommand223 K
request22L S
,22S T
CancellationToken22U f
cancellationToken22g x
)22x y
{33 	
var44 
ddd44 
=44 
await44 
_cityRepository44 +
.44+ ,
GetByIdAsync44, 8
(448 9
request449 @
.44@ A
Id44A C
)44C D
;44D E
var55 
d55 
=55 
_mapper55 
.55 
Map55 
<55  
MasterCityEntity55  0
>550 1
(551 2
ddd552 5
)555 6
;556 7
return77 
d77 
;77 
}88 	
}99 
public;; 

class;; *
MasterCityDeleteCommandHandler;; /
:;;0 1
IRequestHandler;;2 A
<;;A B#
MasterCityDeleteCommand;;B Y
,;;Y Z
bool;;[ _
>;;_ `
{<< 
private== 
readonly== !
IMasterCityRepository== .
_cityRepository==/ >
;==> ?
private>> 
readonly>> 
IMapper>>  
_mapper>>! (
;>>( )
private?? 
readonly?? 
ILogger??  
_logger??! (
;??( )
public@@ *
MasterCityDeleteCommandHandler@@ -
(@@- .
IMapper@@. 5
mapper@@6 <
,@@< =!
IMasterCityRepository@@> S
cityRepository@@T b
,@@b c
ILogger@@d k
<@@k l+
MasterCityDeleteCommandHandler	@@l ä
>
@@ä ã
logger
@@å í
)
@@í ì
{AA 	
_cityRepositoryBB 
=BB 
cityRepositoryBB ,
;BB, -
}CC 	
publicEE 
asyncEE 
TaskEE 
<EE 
boolEE 
>EE 
HandleEE  &
(EE& '#
MasterCityDeleteCommandEE' >
requestEE? F
,EEF G
CancellationTokenEEH Y
cancellationTokenEEZ k
)EEk l
{FF 	
varGG 
cityGG 
=GG 
awaitGG 
_cityRepositoryGG ,
.GG, -
GetByIdAsyncGG- 9
(GG9 :
requestGG: A
.GGA B
IdGGB D
)GGD E
;GGE F
awaitII 
_cityRepositoryII !
.II! "
DeleteAsyncII" -
(II- .
cityII. 2
)II2 3
;II3 4
returnJJ 
trueJJ 
;JJ 
}KK 	
}LL 
publicSS 

classSS *
MasterCityUpsertCommandHandlerSS /
:SS0 1
IRequestHandlerSS2 A
<SSA B#
MasterCityUpsertCommandSSB Y
,SSY Z
DBOperationSS[ f
>SSf g
{TT 
privateUU 
readonlyUU !
IMasterCityRepositoryUU .
_cityRepositoryUU/ >
;UU> ?
privateVV 
readonlyVV 
IMapperVV  
_mapperVV! (
;VV( )
privateWW 
readonlyWW 
ILoggerWW  
_loggerWW! (
;WW( )
publicYY *
MasterCityUpsertCommandHandlerYY -
(YY- .
IMapperYY. 5
mapperYY6 <
,YY< =!
IMasterCityRepositoryYY> S
cityRepositoryYYT b
,YYb c
ILoggerYYd k
<YYk l+
MasterCityUpsertCommandHandler	YYl ä
>
YYä ã
logger
YYå í
)
YYí ì
{ZZ 	
_mapper[[ 
=[[ 
mapper[[ 
;[[ 
_cityRepository\\ 
=\\ 
cityRepository\\ ,
;\\, -
}]] 	
public__ 
async__ 
Task__ 
<__ 
DBOperation__ %
>__% &
Handle__' -
(__- .#
MasterCityUpsertCommand__. E
request__F M
,__M N
CancellationToken__O `
cancellationToken__a r
)__r s
{`` 	
varaa 
	existUseraa 
=aa 
awaitaa !
_cityRepositoryaa" 1
.aa1 2
GetByIdAsyncaa2 >
(aa> ?
requestaa? F
.aaF G
IdaaG I
)aaI J
;aaJ K
{cc 

MasterCitydd 
objCitydd "
=dd# $
awaitdd% *
_cityRepositorydd+ :
.dd: ;
GetByIdAsyncdd; G
(ddG H
requestddH O
.ddO P
IdddP R
)ddR S
;ddS T

MasterCityee 

OldObjCityee %
=ee& '
nullee( ,
;ee, -

OldObjCityff 
=ff 
awaitff "
_cityRepositoryff# 2
.ff2 3
GetByIdAsyncff3 ?
(ff? @
requestff@ G
.ffG H
IdffH J
)ffJ K
;ffK L
ifhh 
(hh 
objCityhh 
!=hh 
nullhh #
)hh# $
{ii 
ifjj 
(jj 
objCityjj 
!=jj  "
nulljj# '
)jj' (
{kk 
objCityll 
.ll  
CityNamell  (
=ll) *
requestll+ 2
.ll2 3
CityNamell3 ;
;ll; <
objCitymm 
.mm  
	CountryIdmm  )
=mm* +
requestmm, 3
.mm3 4
	CountryIdmm4 =
;mm= >
objCitynn 
.nn  
StateIdnn  '
=nn( )
requestnn* 1
.nn1 2
StateIdnn2 9
;nn9 :
objCityoo 
.oo  
Stdcodeoo  '
=oo( )
requestoo* 1
.oo1 2
STDCodeoo2 9
;oo9 :
objCitypp 
.pp  
IsActivepp  (
=pp) *
requestpp+ 2
.pp2 3
IsActivepp3 ;
;pp; <
objCityqq 
.qq  
ModifiedDateqq  ,
=qq- .
AppConstantsqq/ ;
.qq; <
DateTimeqq< D
;qqD E
objCityrr 
.rr  

ModifiedByrr  *
=rr+ ,
requestrr- 4
.rr4 5
	CreatedByrr5 >
;rr> ?
awaittt 
_cityRepositorytt -
.tt- .
UpdateAsynctt. 9
(tt9 :
objCitytt: A
)ttA B
;ttB C
}uu 
elsevv 
{ww 
returnxx 
DBOperationxx *
.xx* +
NotFoundxx+ 3
;xx3 4
}yy 
}zz 
else{{ 
{|| 
objCity}} 
=}} 
new}} !

MasterCity}}" ,
(}}, -
)}}- .
;}}. /
objCity 
. 
CityName $
=% &
request' .
.. /
CityName/ 7
;7 8
objCity
ÄÄ 
.
ÄÄ 
	CountryId
ÄÄ %
=
ÄÄ& '
request
ÄÄ( /
.
ÄÄ/ 0
	CountryId
ÄÄ0 9
;
ÄÄ9 :
objCity
ÅÅ 
.
ÅÅ 
StateId
ÅÅ #
=
ÅÅ$ %
request
ÅÅ& -
.
ÅÅ- .
StateId
ÅÅ. 5
;
ÅÅ5 6
objCity
ÇÇ 
.
ÇÇ 
Stdcode
ÇÇ #
=
ÇÇ$ %
request
ÇÇ& -
.
ÇÇ- .
STDCode
ÇÇ. 5
;
ÇÇ5 6
objCity
ÉÉ 
.
ÉÉ 
IsActive
ÉÉ $
=
ÉÉ% &
request
ÉÉ' .
.
ÉÉ. /
IsActive
ÉÉ/ 7
;
ÉÉ7 8
objCity
ÑÑ 
.
ÑÑ 
CreatedDate
ÑÑ '
=
ÑÑ( )
AppConstants
ÑÑ* 6
.
ÑÑ6 7
DateTime
ÑÑ7 ?
;
ÑÑ? @
objCity
ÖÖ 
.
ÖÖ 
	CreatedBy
ÖÖ %
=
ÖÖ& '
request
ÖÖ( /
.
ÖÖ/ 0
	CreatedBy
ÖÖ0 9
;
ÖÖ9 :
objCity
ÜÜ 
.
ÜÜ 
ModifiedDate
ÜÜ (
=
ÜÜ) *
AppConstants
ÜÜ+ 7
.
ÜÜ7 8
DateTime
ÜÜ8 @
;
ÜÜ@ A
objCity
áá 
.
áá 

ModifiedBy
áá &
=
áá' (
request
áá) 0
.
áá0 1
	CreatedBy
áá1 :
;
áá: ;
await
ââ 
_cityRepository
ââ )
.
ââ) *
AddAsync
ââ* 2
(
ââ2 3
objCity
ââ3 :
)
ââ: ;
;
ââ; <
}
ää 
if
çç 
(
çç 
objCity
çç 
.
çç 
Id
çç 
==
çç !
$num
çç" #
)
çç# $
return
éé 
DBOperation
éé &
.
éé& '
Error
éé' ,
;
éé, -
return
êê 
DBOperation
êê "
.
êê" #
Success
êê# *
;
êê* +
}
ëë 
}
íí 	
}
ìì 
}îî Ã
nD:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Models\Authentication\AuthenticationRequest.cs
	namespace 	
ValuationWeb
 
. 
Application "
." #
Models# )
.) *
Authentication* 8
{ 
public 

class !
AuthenticationRequest &
{ 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} ‘
oD:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Models\Authentication\AuthenticationResponse.cs
	namespace 	
ValuationWeb
 
. 
Application "
." #
Models# )
.) *
Authentication* 8
{ 
public 

class "
AuthenticationResponse '
{ 
public 
string 
Message 
{ 
get  #
;# $
set% (
;( )
}* +
public 
bool 
IsAuthenticated #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public		 
string		 
Id		 
{		 
get		 
;		 
set		  #
;		# $
}		% &
public

 
string

 
UserId

 
{

 
get

 "
;

" #
set

$ '
;

' (
}

) *
public 
int 
? 
RoleId 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
UserName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Token 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
RefreshToken "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
DateTime 
? "
RefreshTokenExpiration /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
} 
} ı
dD:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Models\Authentication\JwtSettings.cs
	namespace 	
ValuationWeb
 
. 
Application "
." #
Models# )
.) *
Authentication* 8
{ 
public 

class 
JwtSettings 
{ 
public 
string 
Key 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
Issuer 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Audience 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
double 
DurationInMinutes '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
}		 
}

 ¨
lD:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Models\Authentication\RefreshTokenRequest.cs
	namespace 	
ValuationWeb
 
. 
Application "
." #
Models# )
.) *
Authentication* 8
{ 
public 

class 
RefreshTokenRequest $
{ 
public 
string 
Token 
{ 
get !
;! "
set# &
;& '
}( )
} 
} ê
mD:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Models\Authentication\RefreshTokenResponse.cs
	namespace 	
ValuationWeb
 
. 
Application "
." #
Models# )
.) *
Authentication* 8
{ 
public 

class  
RefreshTokenResponse %
{ 
public 
string 
Message 
{ 
get  #
;# $
set% (
;( )
}* +
public 
bool 
IsAuthenticated #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public		 
string		 
Id		 
{		 
get		 
;		 
set		  #
;		# $
}		% &
public

 
string

 
UserName

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Token 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
RefreshToken "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
DateTime 
? "
RefreshTokenExpiration /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
} 
} £
lD:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Models\Authentication\RegistrationRequest.cs
	namespace 	
ValuationWeb
 
. 
Application "
." #
Models# )
.) *
Authentication* 8
{ 
public 

class 
RegistrationRequest $
{ 
[ 	
Required	 
] 
public 
string 
	FirstName 
{  !
get" %
;% &
set' *
;* +
}, -
[

 	
Required

	 
]

 
public 
string 
LastName 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Required	 
] 
[ 	
EmailAddress	 
] 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
[ 	
Required	 
] 
[ 	
	MinLength	 
( 
$num 
) 
] 
public 
string 
UserName 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Required	 
] 
[ 	
	MinLength	 
( 
$num 
) 
] 
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} Ø
mD:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Models\Authentication\RegistrationResponse.cs
	namespace 	
ValuationWeb
 
. 
Application "
." #
Models# )
.) *
Authentication* 8
{ 
public 

class  
RegistrationResponse %
{ 
public 
string 
UserId 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} ™
kD:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Models\Authentication\RevokeTokenRequest.cs
	namespace 	
ValuationWeb
 
. 
Application "
." #
Models# )
.) *
Authentication* 8
{ 
public 

class 
RevokeTokenRequest #
{ 
public 
string 
Token 
{ 
get !
;! "
set# &
;& '
}( )
} 
} …
lD:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Models\Authentication\RevokeTokenResponse.cs
	namespace 	
ValuationWeb
 
. 
Application "
." #
Models# )
.) *
Authentication* 8
{ 
public 

class 
RevokeTokenResponse $
{ 
public 
bool 
	IsRevoked 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Message 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} ¨
TD:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Models\Mail\Email.cs
	namespace 	
ValuationWeb
 
. 
Application "
." #
Models# )
.) *
Mail* .
{ 
public 

class 
Email 
{ 
public 
string 
To 
{ 
get 
; 
set  #
;# $
}% &
public 
string 
Subject 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Body 
{ 
get  
;  !
set" %
;% &
}' (
} 
}		  
\D:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Models\Mail\EmailSettings.cs
	namespace 	
ValuationWeb
 
. 
Application "
." #
Models# )
.) *
Mail* .
{ 
public 

class 
EmailSettings 
{ 
public 
string 
ApiKey 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
FromAddress !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
FromName 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
public

 

class

 
AppSettings

 
{ 
public 
string 
ConnectionString &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
} 
} ∑
ZD:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Profiles\MappingProfile.cs
	namespace 	
ValuationWeb
 
. 
Application "
." #
Profiles# +
{ 
public 

class 
MappingProfile 
:  
Profile! (
{ 
public 
MappingProfile 
( 
) 
{ 	
	CreateMap 
< 
User 
, 
UserDetailViewModel /
>/ 0
(0 1
)1 2
;2 3
	CreateMap 
< 
User 
, 
UserViewModel )
>) *
(* +
)+ ,
;, -
	CreateMap 
< "
AuthenticationResponse ,
,, -$
AuthenticateUserResponse. F
>F G
(G H
)H I
;I J
	CreateMap 
< 
UserDetailViewModel )
,) *$
AuthenticateUserResponse+ C
>C D
(D E
)E F
;F G
	CreateMap 
< 
Branch 
, !
BranchDetailViewModel 3
>3 4
(4 5
)5 6
;6 7
	CreateMap 
< 
Branch 
, 
BranchViewModel -
>- .
(. /
)/ 0
;0 1
	CreateMap   
<   
Branch   
,   
CreateBranchCommand   1
>  1 2
(  2 3
)  3 4
;  4 5
	CreateMap!! 
<!! 
CreateBranchCommand!! )
,!!) *
Branch!!+ 1
>!!1 2
(!!2 3
)!!3 4
;!!4 5
	CreateMap"" 
<"" 
Branch"" 
,"" 
UpdateBranchCommand"" 1
>""1 2
(""2 3
)""3 4
;""4 5
	CreateMap## 
<## 
UpdateBranchCommand## )
,##) *
Branch##+ 1
>##1 2
(##2 3
)##3 4
;##4 5
	CreateMap$$ 
<$$ 
Branch$$ 
,$$ #
DeleteBranchByIdCommand$$ 5
>$$5 6
($$6 7
)$$7 8
;$$8 9
	CreateMap'' 
<'' 

MasterCity''  
,''  !
MasterCityEntity''" 2
>''2 3
(''3 4
)''4 5
;''5 6
	CreateMap(( 
<(( 

MasterCity((  
,((  !
MasterCityEntity((" 2
>((2 3
(((3 4
)((4 5
.((5 6

ReverseMap((6 @
(((@ A
)((A B
;((B C
})) 	
}** 
}++ ¿
YD:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Responses\BaseResponse.cs
	namespace 	
ValuationWeb
 
. 
Application "
." #
	Responses# ,
{ 
public 

class 
Response 
< 
T 
> 
{ 
public 
Response 
( 
) 
{ 	
}		 	
public

 
Response

 
(

 
T

 
data

 
,

 
string

  &
message

' .
=

/ 0
null

1 5
)

5 6
{ 	
	Succeeded 
= 
true 
; 
Message 
= 
message 
; 
Data 
= 
data 
; 
} 	
public 
Response 
( 
string 
message &
)& '
{ 	
	Succeeded 
= 
false 
; 
Message 
= 
message 
; 
} 	
public 
bool 
	Succeeded 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Message 
{ 
get  #
;# $
set% (
;( )
}* +
public 
List 
< 
string 
> 
Errors "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
T 
Data 
{ 
get 
; 
set  
;  !
}" #
} 
public 

class 
PagedResponse 
< 
T  
>  !
:" #
Response$ ,
<, -
T- .
>. /
{ 
public 
int 

TotalCount 
{ 
get  #
;# $
set% (
;( )
}* +
public 
int 
PageSize 
{ 
get !
;! "
set# &
;& '
}( )
public   
PagedResponse   
(   
T   
data   #
,  # $
int  % (

totalCount  ) 3
,  3 4
int  5 8
pageSize  9 A
)  A B
{!! 	
this"" 
."" 

TotalCount"" 
="" 

totalCount"" (
;""( )
this## 
.## 
PageSize## 
=## 
pageSize## $
;##$ %
this$$ 
.$$ 
Data$$ 
=$$ 
data$$ 
;$$ 
this%% 
.%% 
Message%% 
=%% 
null%% 
;%%  
this&& 
.&& 
	Succeeded&& 
=&& 
true&& !
;&&! "
this'' 
.'' 
Errors'' 
='' 
null'' 
;'' 
}(( 	
})) 
}** Î	
hD:\EltizamLive\Eltizam.WebApi\src\Core\ValuationWeb.Application\Models\Login\AuthenticateUserResponse.cs
	namespace 	
ValuationWeb
 
. 
Application "
." #
Models# )
.) *
Login* /
{		 
public

 

class

 $
AuthenticateUserResponse

 )
:

* +
UserDetailViewModel

, ?
{ 
public 
string 
Message 
{ 
get  #
;# $
set% (
;( )
}* +
public 
bool 
IsAuthenticated #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
string 
Token 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
RefreshToken "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
DateTime 
? "
RefreshTokenExpiration /
{0 1
get2 5
;5 6
set7 :
;: ;
}< =
} 
} 