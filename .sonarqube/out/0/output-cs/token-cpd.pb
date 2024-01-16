ï
*D:\EltizamLive\Eltizam.Resource\Account.cs
	namespace 	
Eltizam
 
. 
Resource 
{ 
public		 

class		 
Account		 
{

 
} 
} Å
:D:\EltizamLive\Eltizam.Resource\EltizamResourceRegister.cs
	namespace 	
Eltizam
 
. 
Resource 
{ 
public 

static 
class #
EltizamResourceRegister /
{ 
public 
static 
void 
AddResource &
(& '
this' +
IServiceCollection, >
services? G
)G H
{		 	
services

 
.

 
AddLocalization

 $
(

$ %
o

% &
=>

' )
{

* +
o

, -
.

- .
ResourcesPath

. ;
=

< =
$str

> I
;

I J
}

K L
)

L M
;

M N
services 
. 
	Configure 
< &
RequestLocalizationOptions 9
>9 :
(: ;
options; B
=>C E
{ 
options 
. 
SetDefaultCulture )
() *
$str* 1
)1 2
;2 3
options 
. "
AddSupportedUICultures .
(. /
$str/ 6
,6 7
$str8 ?
)? @
;@ A
options 
.  
AddSupportedCultures ,
(, -
$str- 4
,4 5
$str6 =
)= >
;> ?
options 
. &
FallBackToParentUICultures 2
=3 4
true5 9
;9 :
options 
. #
RequestCultureProviders /
./ 0
Clear0 5
(5 6
)6 7
;7 8
} 
) 
; 
services 
. 
AddMvc 
( 
) 
. 
AddViewLocalization $
($ %.
"LanguageViewLocationExpanderFormat% G
.G H
SuffixH N
)N O
. *
AddDataAnnotationsLocalization /
(/ 0
)0 1
;1 2
} 	
} 
} í
)D:\EltizamLive\Eltizam.Resource\Errors.cs
	namespace 	
Eltizam
 
. 
Resource 
{ 
public		 

class		 
Errors		 
{

 
} 
} í
)D:\EltizamLive\Eltizam.Resource\Master.cs
	namespace 	
Eltizam
 
. 
Resource 
{ 
public		 
class		 
Master		 
{

 
} 
} í
)D:\EltizamLive\Eltizam.Resource\Shared.cs
	namespace 	
Eltizam
 
. 
Resource 
{ 
public		 
class		 
Shared		 
{

 
} 
} 