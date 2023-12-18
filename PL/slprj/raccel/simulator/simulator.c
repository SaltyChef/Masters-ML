#include "simulator.h"
#include "rtwtypes.h"
#include "mwmathutil.h"
#include "simulator_private.h"
#include "rt_logging_mmi.h"
#include "simulator_capi.h"
#include "simulator_dt.h"
extern void * CreateDiagnosticAsVoidPtr_wrapper ( const char * id , int nargs
, ... ) ; extern ssExecutionInfo gblExecutionInfo ; RTWExtModeInfo *
gblRTWExtModeInfo = NULL ; void raccelForceExtModeShutdown ( boolean_T
extModeStartPktReceived ) { if ( ! extModeStartPktReceived ) { boolean_T
stopRequested = false ; rtExtModeWaitForStartPkt ( gblRTWExtModeInfo , 2 , &
stopRequested ) ; } rtExtModeShutdown ( 2 ) ; }
#include "slsv_diagnostic_codegen_c_api.h"
#include "slsa_sim_engine.h"
#ifdef RSIM_WITH_SOLVER_MULTITASKING
boolean_T gbl_raccel_isMultitasking = 1 ;
#else
boolean_T gbl_raccel_isMultitasking = 0 ;
#endif
boolean_T gbl_raccel_tid01eq = 0 ; int_T gbl_raccel_NumST = 3 ; const char_T
* gbl_raccel_Version = "23.2 (R2023b) 01-Aug-2023" ; void
raccel_setup_MMIStateLog ( SimStruct * S ) {
#ifdef UseMMIDataLogging
rt_FillStateSigInfoFromMMI ( ssGetRTWLogInfo ( S ) , & ssGetErrorStatus ( S )
) ;
#else
UNUSED_PARAMETER ( S ) ;
#endif
} static DataMapInfo rt_dataMapInfo ; DataMapInfo * rt_dataMapInfoPtr = &
rt_dataMapInfo ; rtwCAPI_ModelMappingInfo * rt_modelMapInfoPtr = & (
rt_dataMapInfo . mmi ) ; int_T enableFcnCallFlag [ ] = { 1 , 1 , 1 } ; const
char * raccelLoadInputsAndAperiodicHitTimes ( SimStruct * S , const char *
inportFileName , int * matFileFormat ) { return rt_RAccelReadInportsMatFile (
S , inportFileName , matFileFormat ) ; }
#include "simstruc.h"
#include "fixedpoint.h"
#include "slsa_sim_engine.h"
#include "simtarget/slSimTgtSLExecSimBridge.h"
#define ofsv0lacdj (-1)
B rtB ; X rtX ; DW rtDW ; static SimStruct model_S ; SimStruct * const rtS =
& model_S ; static real_T huhmbwikwv ( real_T x , const real_T params [ 3 ] )
; static real_T fn1o51s4zw ( const real_T x [ 6 ] , const real_T params [ 7 ]
) ; static real_T huhmbwikwv ( real_T x , const real_T params [ 3 ] ) {
real_T tmp ; tmp = ( x - params [ 2 ] ) * ( 1.0 / params [ 0 ] ) ; tmp *= tmp
; return 1.0 / ( muDoubleScalarPower ( tmp , params [ 1 ] ) + 1.0 ) ; }
static real_T fn1o51s4zw ( const real_T x [ 6 ] , const real_T params [ 7 ] )
{ real_T y ; int32_T i ; y = 0.0 ; for ( i = 0 ; i < 6 ; i ++ ) { y += x [ i
] * params [ i ] ; } y += params [ 6 ] ; return y ; } void MdlInitialize (
void ) { rtX . e1f0twl5yp [ 0 ] = 0.0 ; rtX . e1f0twl5yp [ 1 ] = 0.0 ; rtX .
e1f0twl5yp [ 2 ] = 0.0 ; rtDW . fd5il4ocnr = rtP . UD5_InitialCondition ;
rtDW . pap12ufrht = rtP . UD4_InitialCondition ; rtDW . kb02n0c24y = rtP .
UD3_InitialCondition ; rtDW . jolk2wnpoh = rtP . UD_InitialCondition ; rtDW .
hlmipjdt25 = rtP . UD1_InitialCondition ; rtDW . hixtpg0x1t = rtP .
UD2_InitialCondition ; rtDW . o2lwgb0ugo = false ; rtDW . gxcvgcvdkv =
ofsv0lacdj ; rtDW . offng0d0eq = false ; rtDW . ppa3fjzq12 = ofsv0lacdj ;
rtDW . i55sx5pxox = false ; rtDW . nvuhhb0bcg = ofsv0lacdj ; } void MdlStart
( void ) { { bool externalInputIsInDatasetFormat = false ; void *
pISigstreamManager = rt_GetISigstreamManager ( rtS ) ;
rtwISigstreamManagerGetInputIsInDatasetFormat ( pISigstreamManager , &
externalInputIsInDatasetFormat ) ; if ( externalInputIsInDatasetFormat ) { }
} MdlInitialize ( ) ; } void MdlOutputs ( int_T tid ) { real_T outputMFCache
[ 64 ] ; real_T inputMFCache [ 12 ] ; real_T nppcapwedf [ 6 ] ; real_T
aggregatedOutputs ; real_T c3i051hkt3 ; real_T cq2l5r2qyj ; real_T kxdxervtf3
; real_T sumAntecedentOutputs ; int32_T i ; int32_T inputID ; static const
real_T b [ 3 ] = { 0.182661002696714 , 2.00031789958369 , - 0.185846559425395
} ; static const real_T c [ 3 ] = { 0.189211052131408 , 2.00014292092145 ,
0.19978684569947 } ; static const real_T d [ 3 ] = { 0.182716438671149 ,
2.00031422235049 , - 0.185823846359663 } ; static const real_T e [ 3 ] = {
0.189285143403096 , 2.00013966625402 , 0.199742673476696 } ; static const
real_T f [ 3 ] = { 0.182785649479925 , 2.00030872235596 , - 0.185802400875349
} ; static const real_T g [ 3 ] = { 0.189394310937641 , 2.00013559480246 ,
0.199670720800988 } ; static const real_T h [ 3 ] = { 3.03975660961268 ,
2.00008394121824 , - 2.87277165414729 } ; static const real_T i_p [ 3 ] = {
3.03963645722653 , 2.00011612594769 , 3.20703266103171 } ; static const
real_T j [ 3 ] = { 3.039741159549 , 2.00008839878487 , - 2.87278465463458 } ;
static const real_T k [ 3 ] = { 3.03964476317295 , 2.00011715165359 ,
3.20702353989556 } ; static const real_T l [ 3 ] = { 3.03973415288724 ,
2.00008658534197 , - 2.87279299215609 } ; static const real_T m [ 3 ] = {
3.03966025605463 , 2.00011259974423 , 3.20701065539739 } ; static const
real_T b_p [ 7 ] = { 0.0013857006094256 , 0.0013698728957447 ,
0.00135213398351374 , 0.00443612936998997 , 0.00368072458706319 ,
0.00524579435526134 , - 0.0133091675300182 } ; static const real_T c_p [ 7 ]
= { 0.00134578321592124 , 0.00134240102486779 , 0.00132193978366963 ,
0.00269857316997917 , 0.00393459655562778 , - 0.00694680489161746 , -
0.0120968794614604 } ; static const real_T d_p [ 7 ] = { 0.0014897659748513 ,
0.00147084057620158 , 0.00144604381191302 , 0.00559640379459652 , -
0.00925456948979286 , 0.00552685031718629 , - 0.0136595485939949 } ; static
const real_T e_p [ 7 ] = { 0.00134329441815182 , 0.00133303783510309 ,
0.00130370706248179 , 0.00344241023863018 , - 0.00691364907563152 , -
0.00566466962284825 , - 0.0115528138092412 } ; static const real_T f_p [ 7 ]
= { 0.0013879581695894 , 0.00136372188874502 , 0.00133558275200461 , -
0.00740463904094339 , 0.00397916290214741 , 0.00358260184070561 , -
0.0126992103877124 } ; static const real_T g_p [ 7 ] = { 0.00141415779297772
, 0.00140050647369263 , 0.0013692446912861 , - 0.00871855035998461 ,
0.00461839362473843 , - 0.00745453905600888 , - 0.0125007819653051 } ; static
const real_T h_p [ 7 ] = { 0.0013560743664617 , 0.00132805526415729 ,
0.00129249236537577 , - 0.00646171516124123 , - 0.00681334973639314 ,
0.00364312005769261 , - 0.0118808462403762 } ; static const real_T i_e [ 7 ]
= { 0.00126484858002707 , 0.00124590912206172 , 0.00120910852056221 , -
0.00608801914301924 , - 0.00547933750437964 , - 0.0056745131002187 , -
0.0108698714786708 } ; static const real_T j_p [ 7 ] = { 0.000298657052941066
, 0.000288555999710997 , 0.000278074724897947 , 0.000469207553950972 ,
0.000544064104646801 , 0.000826716112524477 , - 0.00127300027604262 } ;
static const real_T k_p [ 7 ] = { 0.000270290845562469 , 0.00026325131089988
, 0.000254327073796118 , 9.26555958323138E-5 , 0.000311960367201459 , -
0.000290047920599231 , - 0.000861136177077923 } ; static const real_T l_p [ 7
] = { 0.000296680541014022 , 0.000287428711120918 , 0.000277067264261264 ,
0.000473038476400918 , - 0.000816845194413986 , 0.000581119225139274 , -
0.00120930861715269 } ; static const real_T m_p [ 7 ] = {
0.000248567067929345 , 0.000241328797270508 , 0.000231992673588171 ,
0.000120342007170398 , - 0.000532443787196008 , - 0.000238477312752615 , -
0.000845228999470859 } ; static const real_T n [ 7 ] = { 0.000279071760433951
, 0.000268918201970318 , 0.000258236969650908 , - 0.000610664005312222 ,
0.000346798382045791 , 0.000534045162931002 , - 0.00116531062479535 } ;
static const real_T o [ 7 ] = { 0.000265040370297238 , 0.00025730972238658 ,
0.000247471755757879 , - 0.00092034120046548 , 0.000298255064560286 , -
0.000592684723548757 , - 0.00104824576172381 } ; static const real_T p [ 7 ]
= { 0.000253154799623207 , 0.000243754009808869 , 0.000233222800378719 , -
0.000593438477831534 , - 0.000563049718381018 , 0.000345208957990717 , -
0.00106762747974476 } ; static const real_T q [ 7 ] = { 0.000222960344605064
, 0.000215771018676151 , 0.000206533812286093 , - 0.000661554752248447 , -
0.000498111969043642 , - 0.000449829596431057 , - 0.00095273584983164 } ;
static const real_T r [ 7 ] = { 0.000294254482166848 , 0.000285773789543469 ,
0.000276876438721358 , 0.000409953710262691 , 0.000455056594413484 ,
0.000718286890671365 , - 0.00108828762060227 } ; static const real_T s [ 7 ]
= { 0.000265412646722569 , 0.000259524730651637 , 0.000251990132965135 ,
2.78463869442647E-5 , 0.000243344943963283 , - 0.000203694660678399 , -
0.000706482042267178 } ; static const real_T t [ 7 ] = { 0.000290093955925944
, 0.000282431760221556 , 0.00027370440106705 , 0.000417155837476861 , -
0.000705552503336142 , 0.000518034661957643 , - 0.00103257320259014 } ;
static const real_T u [ 7 ] = { 0.000241785572108594 , 0.000235759297471806 ,
0.000227849999795192 , 4.488157109967E-5 , - 0.000420406013861819 , -
0.000159607432349313 , - 0.000688404189793811 } ; static const real_T v [ 7 ]
= { 0.000272601220563411 , 0.000264038205629375 , 0.000254900627510391 , -
0.000504697883118073 , 0.000291757226296777 , 0.000440896231032689 , -
0.000982278257212132 } ; static const real_T w [ 7 ] = { 0.000257688264737661
, 0.00025115824579324 , 0.000242697418276225 , - 0.000799498650075629 ,
0.00024236977696606 , - 0.00049859386676528 , - 0.000884587400452889 } ;
static const real_T x [ 7 ] = { 0.000245152587401191 , 0.000237251940148716 ,
0.000228214188239102 , - 0.000478765192533041 , - 0.000470246805129663 ,
0.000279725892658191 , - 0.000892007079816152 } ; static const real_T y [ 7 ]
= { 0.000214775914329189 , 0.000208817745835645 , 0.000200951369928962 , -
0.00056464534421748 , - 0.000416872110480821 , - 0.000390588607482687 , -
0.000803745597143838 } ; static const real_T ab [ 7 ] = { 0.00049350202577652
, 0.000486985463986802 , 0.000476484796106103 , - 0.00162740317647338 , -
0.00133808285246923 , - 0.00149117812095748 , 0.00422666747825149 } ; static
const real_T bb [ 7 ] = { 0.000446027175417867 , 0.000438745720623647 ,
0.000432008568356847 , - 0.00174277093516286 , - 0.00175660056286191 ,
0.00245497720328205 , 0.00404649799356966 } ; static const real_T cb [ 7 ] =
{ 0.000478834600582387 , 0.000474576170560666 , 0.00046665652272238 , -
0.00190108963093712 , 0.00238350111920042 , - 0.00197077674014894 ,
0.00408474257511991 } ; static const real_T db [ 7 ] = { 0.000376916933861302
, 0.00037141827965585 , 0.000366645217151618 , - 0.00186504457020284 ,
0.00169912791168429 , 0.00174953906527928 , 0.00341470298743562 } ; static
const real_T eb [ 7 ] = { 0.00044136671918368 , 0.000437077436865432 ,
0.000429489107842686 , 0.00201506467685284 , - 0.00173106529519662 , -
0.00122348904956515 , 0.0037911611075627 } ; static const real_T fb [ 7 ] = {
0.000411609274016587 , 0.000406000393717135 , 0.000400406365034845 ,
0.00185626870371986 , - 0.00191238489947734 , 0.00190752109421215 ,
0.00352146026048563 } ; static const real_T gb [ 7 ] = { 0.00037198373330919
, 0.000369466928037182 , 0.00036432301225652 , 0.00133073231942223 ,
0.00165086672505471 , - 0.00141421874659885 , 0.00320828675314516 } ; static
const real_T hb [ 7 ] = { 0.000298632135050829 , 0.00029501441215436 ,
0.000291670568083778 , 0.0010802743659404 , 0.000973601678445199 ,
0.00114777427117415 , 0.00259397930725792 } ; static const real_T ib [ 7 ] =
{ 0.000292430228872677 , 0.000285293918166361 , 0.000277652549334377 ,
0.000358698062876818 , 0.000369306422802703 , 0.000613172816011859 , -
0.000943923378387533 } ; static const real_T jb [ 7 ] = {
0.000267711724495161 , 0.000262540768396589 , 0.00025584237962952 , -
2.25021123594285E-5 , 0.000185470068926504 , - 0.000146572340873551 , -
0.000598246528545591 } ; static const real_T kb [ 7 ] = {
0.000287001889091128 , 0.000280519107223269 , 0.000272969361527238 ,
0.000373688274883345 , - 0.000630727485239742 , 0.000465559194591938 , -
0.000904928194260008 } ; static const real_T lb [ 7 ] = { 0.00024228500591535
, 0.000237001409164229 , 0.000229929372468344 , - 1.08915570866986E-5 , -
0.000339604791585016 , - 0.000110350585431575 , - 0.000581409528021244 } ;
static const real_T mb [ 7 ] = { 0.000268949210720602 , 0.000261669956490648
, 0.000253718654257685 , - 0.000424572917703875 , 0.000242635378465553 ,
0.000345576615834478 , - 0.000840510900168605 } ; static const real_T nb [ 7
] = { 0.000256952075250909 , 0.000251179335226569 , 0.000243560593161529 , -
0.000718517934243511 , 0.000198636171993142 , - 0.000439003017271296 , -
0.000771440840887894 } ; static const real_T ob [ 7 ] = {
0.000240713882929028 , 0.000233927510501773 , 0.000225950607071524 , -
0.000390966431367927 , - 0.000410343579578406 , 0.000219083652609665 , -
0.000763567652848681 } ; static const real_T pb [ 7 ] = {
0.000212947551482861 , 0.000207781290625466 , 0.00020075982138278 , -
0.000498244675753196 , - 0.000364066157164988 , - 0.000357136541997158 , -
0.000704163088298178 } ; static const real_T qb [ 7 ] = {
0.000497064327979892 , 0.000489033146151848 , 0.000477026515702921 , -
0.00170695603668114 , - 0.00144747513709029 , - 0.00154262086983146 ,
0.0043600832178001 } ; static const real_T rb [ 7 ] = { 0.000453354087755372
, 0.000444063451335949 , 0.000435535678012048 , - 0.00183949344662289 , -
0.00185587905412362 , 0.00258771293943854 , 0.00419547799708178 } ; static
const real_T sb [ 7 ] = { 0.00048020117749748 , 0.000474395457333959 ,
0.000464988447541128 , - 0.00196246617384447 , 0.00242846818660664 , -
0.00196745141255816 , 0.00417549285908884 } ; static const real_T tb [ 7 ] =
{ 0.000380891013950738 , 0.000373780316493862 , 0.000367550895343885 , -
0.00195764550683707 , 0.00177646121600498 , 0.00184481694556008 ,
0.00353462156153192 } ; static const real_T ub [ 7 ] = { 0.000441361322605696
, 0.000435713234201926 , 0.000426748284512466 , 0.00204614685640686 , -
0.00178273541432691 , - 0.00127808206243256 , 0.00388962564391784 } ; static
const real_T vb [ 7 ] = { 0.000415927132933538 , 0.000408701049150857 ,
0.000401628511422546 , 0.00191442927112357 , - 0.00198614517132718 ,
0.00201804700020862 , 0.00363522784725832 } ; static const real_T wb [ 7 ] =
{ 0.000369722914379625 , 0.000366032652922022 , 0.000359728811588433 ,
0.00137009070005702 , 0.00166439270863769 , - 0.00143113305321614 ,
0.00327790295699318 } ; static const real_T xb [ 7 ] = { 0.000299558913376695
, 0.000294833096182833 , 0.000290467512202571 , 0.00112448182605221 ,
0.00101084644082799 , 0.00121337479921791 , 0.0026761645614041 } ; static
const real_T yb [ 7 ] = { 0.000511674909195938 , 0.000501715835387557 ,
0.000487531157312215 , - 0.00183239670914495 , - 0.00159615831130041 , -
0.00169323145796107 , 0.00459633924800477 } ; static const real_T ac [ 7 ] =
{ 0.000463814105503443 , 0.000452329430608357 , 0.000441689273510888 , -
0.00194589883712632 , - 0.00197470977197888 , 0.00268575276374236 ,
0.00437582900317126 } ; static const real_T bc [ 7 ] = { 0.000491526387077992
, 0.000483868532902243 , 0.000472432607661294 , - 0.00207084379823666 ,
0.00252318671160435 , - 0.00206658967167244 , 0.00436000679707036 } ; static
const real_T cc [ 7 ] = { 0.000387035153517873 , 0.000378121822924451 ,
0.000370132732731924 , - 0.00205676114081589 , 0.00186268322561024 ,
0.00190532667185354 , 0.00367622117789102 } ; static const real_T dc [ 7 ] =
{ 0.000451015445620031 , 0.000443588934842303 , 0.000432636558881204 ,
0.00212738444950902 , - 0.0018843672359867 , - 0.0014044655987688 ,
0.00407743178407617 } ; static const real_T ec [ 7 ] = { 0.000423670070510786
, 0.000414597377538912 , 0.00040568626021649 , 0.00199638114287707 , -
0.00208503636168966 , 0.00210520605431892 , 0.00378277008723912 } ; static
const real_T fc [ 7 ] = { 0.000374921100915688 , 0.000369750758025807 ,
0.000361824823300206 , 0.00144259095478662 , 0.00171665080492991 , -
0.00151971118761048 , 0.00341996312951963 } ; static const real_T gc [ 7 ] =
{ 0.000302572260470113 , 0.000296549849950943 , 0.000290885471708665 ,
0.00118027434200678 , 0.00105377521699843 , 0.00125639087562154 ,
0.00277819834954628 } ; static const real_T hc [ 7 ] = { 0.00364243638246048
, 0.0036230621143909 , 0.00357438525638375 , - 0.0104547083739949 , -
0.0088747862218422 , - 0.0113684962247692 , 0.0284732069788116 } ; static
const real_T ic [ 7 ] = { 0.00329764718324689 , 0.00326817338256288 ,
0.00323960998979228 , - 0.010443712293496 , - 0.0113749694217697 ,
0.0154012069257646 , 0.0259963671687729 } ; static const real_T jc [ 7 ] = {
0.00364444855432452 , 0.00363048403288762 , 0.00359002944230349 , -
0.0131947001524943 , 0.0174555035907142 , - 0.0148195798462887 ,
0.028066295738394 } ; static const real_T kc [ 7 ] = { 0.00273022485226578 ,
0.00271761815112244 , 0.00270792890253404 , - 0.0114194562596776 ,
0.0107088587102387 , 0.00977611571879997 , 0.021772570636162 } ; static const
real_T lc [ 7 ] = { 0.00326552949901051 , 0.00326317806207463 ,
0.00323621750232836 , 0.0128592190507518 , - 0.011775659747109 , -
0.00822535059892339 , 0.0255012728975704 } ; static const real_T mc [ 7 ] = {
0.00313618399047884 , 0.00311454184405581 , 0.00309221799832992 ,
0.0153373317718257 , - 0.0134680994830603 , 0.013864443384121 ,
0.0241871681044717 } ; static const real_T nc [ 7 ] = { 0.00271914201976052 ,
0.00272970047574305 , 0.00272156719154644 , 0.00778132563761822 ,
0.0109322627865463 , - 0.00964483141851713 , 0.0213852608510301 } ; static
const real_T oc [ 7 ] = { 0.00218081718685506 , 0.00217874416705047 ,
0.00217772825626774 , 0.00812776489182582 , 0.00564705558350609 ,
0.00742175335021969 , 0.0171421084175142 } ; static const int8_T n_p [ 384 ]
= { 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1
, 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 2 , 2 , 2 , 2 , 2 , 2 ,
2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2
, 2 , 2 , 2 , 2 , 2 , 2 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 ,
1 , 1 , 1 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 1
, 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 2 , 2 , 2 , 2 ,
2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1
, 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 2 , 2 , 2 ,
2 , 2 , 2 , 2 , 2 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 2 , 2 , 2 , 2 , 2 , 2 , 2
, 2 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 1 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 2 , 1 , 1 ,
1 , 1 , 2 , 2 , 2 , 2 , 1 , 1 , 1 , 1 , 2 , 2 , 2 , 2 , 1 , 1 , 1 , 1 , 2 , 2
, 2 , 2 , 1 , 1 , 1 , 1 , 2 , 2 , 2 , 2 , 1 , 1 , 1 , 1 , 2 , 2 , 2 , 2 , 1 ,
1 , 1 , 1 , 2 , 2 , 2 , 2 , 1 , 1 , 1 , 1 , 2 , 2 , 2 , 2 , 1 , 1 , 1 , 1 , 2
, 2 , 2 , 2 , 1 , 1 , 2 , 2 , 1 , 1 , 2 , 2 , 1 , 1 , 2 , 2 , 1 , 1 , 2 , 2 ,
1 , 1 , 2 , 2 , 1 , 1 , 2 , 2 , 1 , 1 , 2 , 2 , 1 , 1 , 2 , 2 , 1 , 1 , 2 , 2
, 1 , 1 , 2 , 2 , 1 , 1 , 2 , 2 , 1 , 1 , 2 , 2 , 1 , 1 , 2 , 2 , 1 , 1 , 2 ,
2 , 1 , 1 , 2 , 2 , 1 , 1 , 2 , 2 , 1 , 2 , 1 , 2 , 1 , 2 , 1 , 2 , 1 , 2 , 1
, 2 , 1 , 2 , 1 , 2 , 1 , 2 , 1 , 2 , 1 , 2 , 1 , 2 , 1 , 2 , 1 , 2 , 1 , 2 ,
1 , 2 , 1 , 2 , 1 , 2 , 1 , 2 , 1 , 2 , 1 , 2 , 1 , 2 , 1 , 2 , 1 , 2 , 1 , 2
, 1 , 2 , 1 , 2 , 1 , 2 , 1 , 2 , 1 , 2 , 1 , 2 , 1 , 2 } ; rtB . ddhjp3t0im
= 0.0 ; rtB . ddhjp3t0im += rtP . TransferFcn_C [ 0 ] * rtX . e1f0twl5yp [ 0
] ; rtB . ddhjp3t0im += rtP . TransferFcn_C [ 1 ] * rtX . e1f0twl5yp [ 1 ] ;
rtB . ddhjp3t0im += rtP . TransferFcn_C [ 2 ] * rtX . e1f0twl5yp [ 2 ] ; if (
ssIsSampleHit ( rtS , 1 , 0 ) ) { rtB . j4zjfbfn2z = rtDW . fd5il4ocnr ; rtB
. hpplgmotgp = rtDW . pap12ufrht ; kxdxervtf3 = rtDW . kb02n0c24y ; rtB .
eo1wc0eucv = rtDW . jolk2wnpoh ; rtB . et4nlekrg5 = rtDW . hlmipjdt25 ;
c3i051hkt3 = rtDW . hixtpg0x1t ; if ( ssIsSampleHit ( rtS , 1 , 0 ) ) { rtDW
. gxcvgcvdkv = ofsv0lacdj ; sumAntecedentOutputs = 0.0 ; inputMFCache [ 0 ] =
huhmbwikwv ( rtB . j4zjfbfn2z , b ) ; inputMFCache [ 1 ] = huhmbwikwv ( rtB .
j4zjfbfn2z , c ) ; inputMFCache [ 2 ] = huhmbwikwv ( rtB . hpplgmotgp , d ) ;
inputMFCache [ 3 ] = huhmbwikwv ( rtB . hpplgmotgp , e ) ; inputMFCache [ 4 ]
= huhmbwikwv ( rtDW . kb02n0c24y , f ) ; inputMFCache [ 5 ] = huhmbwikwv (
rtDW . kb02n0c24y , g ) ; inputMFCache [ 6 ] = huhmbwikwv ( rtB . eo1wc0eucv
, h ) ; inputMFCache [ 7 ] = huhmbwikwv ( rtB . eo1wc0eucv , i_p ) ;
inputMFCache [ 8 ] = huhmbwikwv ( rtB . et4nlekrg5 , j ) ; inputMFCache [ 9 ]
= huhmbwikwv ( rtB . et4nlekrg5 , k ) ; inputMFCache [ 10 ] = huhmbwikwv (
rtDW . hixtpg0x1t , l ) ; inputMFCache [ 11 ] = huhmbwikwv ( rtDW .
hixtpg0x1t , m ) ; nppcapwedf [ 0 ] = rtB . j4zjfbfn2z ; nppcapwedf [ 1 ] =
rtB . hpplgmotgp ; nppcapwedf [ 2 ] = rtDW . kb02n0c24y ; nppcapwedf [ 3 ] =
rtB . eo1wc0eucv ; nppcapwedf [ 4 ] = rtB . et4nlekrg5 ; nppcapwedf [ 5 ] =
rtDW . hixtpg0x1t ; rtDW . ppa3fjzq12 = ofsv0lacdj ; aggregatedOutputs = 0.0
; outputMFCache [ 0 ] = fn1o51s4zw ( nppcapwedf , b_p ) ; outputMFCache [ 1 ]
= fn1o51s4zw ( nppcapwedf , c_p ) ; outputMFCache [ 2 ] = fn1o51s4zw (
nppcapwedf , d_p ) ; outputMFCache [ 3 ] = fn1o51s4zw ( nppcapwedf , e_p ) ;
outputMFCache [ 4 ] = fn1o51s4zw ( nppcapwedf , f_p ) ; outputMFCache [ 5 ] =
fn1o51s4zw ( nppcapwedf , g_p ) ; outputMFCache [ 6 ] = fn1o51s4zw (
nppcapwedf , h_p ) ; outputMFCache [ 7 ] = fn1o51s4zw ( nppcapwedf , i_e ) ;
outputMFCache [ 8 ] = fn1o51s4zw ( nppcapwedf , j_p ) ; outputMFCache [ 9 ] =
fn1o51s4zw ( nppcapwedf , k_p ) ; outputMFCache [ 10 ] = fn1o51s4zw (
nppcapwedf , l_p ) ; outputMFCache [ 11 ] = fn1o51s4zw ( nppcapwedf , m_p ) ;
outputMFCache [ 12 ] = fn1o51s4zw ( nppcapwedf , n ) ; outputMFCache [ 13 ] =
fn1o51s4zw ( nppcapwedf , o ) ; outputMFCache [ 14 ] = fn1o51s4zw (
nppcapwedf , p ) ; outputMFCache [ 15 ] = fn1o51s4zw ( nppcapwedf , q ) ;
outputMFCache [ 16 ] = fn1o51s4zw ( nppcapwedf , r ) ; outputMFCache [ 17 ] =
fn1o51s4zw ( nppcapwedf , s ) ; outputMFCache [ 18 ] = fn1o51s4zw (
nppcapwedf , t ) ; outputMFCache [ 19 ] = fn1o51s4zw ( nppcapwedf , u ) ;
outputMFCache [ 20 ] = fn1o51s4zw ( nppcapwedf , v ) ; outputMFCache [ 21 ] =
fn1o51s4zw ( nppcapwedf , w ) ; outputMFCache [ 22 ] = fn1o51s4zw (
nppcapwedf , x ) ; outputMFCache [ 23 ] = fn1o51s4zw ( nppcapwedf , y ) ;
outputMFCache [ 24 ] = fn1o51s4zw ( nppcapwedf , ab ) ; outputMFCache [ 25 ]
= fn1o51s4zw ( nppcapwedf , bb ) ; outputMFCache [ 26 ] = fn1o51s4zw (
nppcapwedf , cb ) ; outputMFCache [ 27 ] = fn1o51s4zw ( nppcapwedf , db ) ;
outputMFCache [ 28 ] = fn1o51s4zw ( nppcapwedf , eb ) ; outputMFCache [ 29 ]
= fn1o51s4zw ( nppcapwedf , fb ) ; outputMFCache [ 30 ] = fn1o51s4zw (
nppcapwedf , gb ) ; outputMFCache [ 31 ] = fn1o51s4zw ( nppcapwedf , hb ) ;
outputMFCache [ 32 ] = fn1o51s4zw ( nppcapwedf , ib ) ; outputMFCache [ 33 ]
= fn1o51s4zw ( nppcapwedf , jb ) ; outputMFCache [ 34 ] = fn1o51s4zw (
nppcapwedf , kb ) ; outputMFCache [ 35 ] = fn1o51s4zw ( nppcapwedf , lb ) ;
outputMFCache [ 36 ] = fn1o51s4zw ( nppcapwedf , mb ) ; outputMFCache [ 37 ]
= fn1o51s4zw ( nppcapwedf , nb ) ; outputMFCache [ 38 ] = fn1o51s4zw (
nppcapwedf , ob ) ; outputMFCache [ 39 ] = fn1o51s4zw ( nppcapwedf , pb ) ;
outputMFCache [ 40 ] = fn1o51s4zw ( nppcapwedf , qb ) ; outputMFCache [ 41 ]
= fn1o51s4zw ( nppcapwedf , rb ) ; outputMFCache [ 42 ] = fn1o51s4zw (
nppcapwedf , sb ) ; outputMFCache [ 43 ] = fn1o51s4zw ( nppcapwedf , tb ) ;
outputMFCache [ 44 ] = fn1o51s4zw ( nppcapwedf , ub ) ; outputMFCache [ 45 ]
= fn1o51s4zw ( nppcapwedf , vb ) ; outputMFCache [ 46 ] = fn1o51s4zw (
nppcapwedf , wb ) ; outputMFCache [ 47 ] = fn1o51s4zw ( nppcapwedf , xb ) ;
outputMFCache [ 48 ] = fn1o51s4zw ( nppcapwedf , yb ) ; outputMFCache [ 49 ]
= fn1o51s4zw ( nppcapwedf , ac ) ; outputMFCache [ 50 ] = fn1o51s4zw (
nppcapwedf , bc ) ; outputMFCache [ 51 ] = fn1o51s4zw ( nppcapwedf , cc ) ;
outputMFCache [ 52 ] = fn1o51s4zw ( nppcapwedf , dc ) ; outputMFCache [ 53 ]
= fn1o51s4zw ( nppcapwedf , ec ) ; outputMFCache [ 54 ] = fn1o51s4zw (
nppcapwedf , fc ) ; outputMFCache [ 55 ] = fn1o51s4zw ( nppcapwedf , gc ) ;
outputMFCache [ 56 ] = fn1o51s4zw ( nppcapwedf , hc ) ; outputMFCache [ 57 ]
= fn1o51s4zw ( nppcapwedf , ic ) ; outputMFCache [ 58 ] = fn1o51s4zw (
nppcapwedf , jc ) ; outputMFCache [ 59 ] = fn1o51s4zw ( nppcapwedf , kc ) ;
outputMFCache [ 60 ] = fn1o51s4zw ( nppcapwedf , lc ) ; outputMFCache [ 61 ]
= fn1o51s4zw ( nppcapwedf , mc ) ; outputMFCache [ 62 ] = fn1o51s4zw (
nppcapwedf , nc ) ; outputMFCache [ 63 ] = fn1o51s4zw ( nppcapwedf , oc ) ;
for ( i = 0 ; i < 64 ; i ++ ) { cq2l5r2qyj = 1.0 ; for ( inputID = 0 ;
inputID < 6 ; inputID ++ ) { cq2l5r2qyj *= inputMFCache [ ( n_p [ ( inputID
<< 6 ) + i ] + ( inputID << 1 ) ) - 1 ] ; } sumAntecedentOutputs +=
cq2l5r2qyj ; aggregatedOutputs += outputMFCache [ i ] * cq2l5r2qyj ; } rtDW .
nvuhhb0bcg = ofsv0lacdj ; if ( sumAntecedentOutputs == 0.0 ) { rtB .
i2t5cdxhvy = 0.0095487851206515068 ; } else { rtB . i2t5cdxhvy = 1.0 /
sumAntecedentOutputs * aggregatedOutputs ; } } } if ( ssIsSampleHit ( rtS , 1
, 0 ) ) { rtB . fzo5smtw1d [ 0 ] = rtB . j4zjfbfn2z ; rtB . fzo5smtw1d [ 1 ]
= rtB . hpplgmotgp ; rtB . fzo5smtw1d [ 2 ] = kxdxervtf3 ; rtB . fzo5smtw1d [
3 ] = rtB . eo1wc0eucv ; rtB . fzo5smtw1d [ 4 ] = rtB . et4nlekrg5 ; rtB .
fzo5smtw1d [ 5 ] = c3i051hkt3 ; } rtB . fjizvwmtmp = muDoubleScalarSin ( rtP
. SignalGenerator_Frequency * ssGetT ( rtS ) ) * rtP .
SignalGenerator_Amplitude ; UNUSED_PARAMETER ( tid ) ; } void MdlOutputsTID2
( int_T tid ) { UNUSED_PARAMETER ( tid ) ; } void MdlUpdate ( int_T tid ) {
if ( ssIsSampleHit ( rtS , 1 , 0 ) ) { rtDW . fd5il4ocnr = rtB . ddhjp3t0im ;
rtDW . pap12ufrht = rtB . j4zjfbfn2z ; rtDW . kb02n0c24y = rtB . hpplgmotgp ;
rtDW . jolk2wnpoh = rtB . fjizvwmtmp ; rtDW . hlmipjdt25 = rtB . eo1wc0eucv ;
rtDW . hixtpg0x1t = rtB . et4nlekrg5 ; } UNUSED_PARAMETER ( tid ) ; } void
MdlUpdateTID2 ( int_T tid ) { UNUSED_PARAMETER ( tid ) ; } void
MdlDerivatives ( void ) { XDot * _rtXdot ; _rtXdot = ( ( XDot * ) ssGetdX (
rtS ) ) ; _rtXdot -> e1f0twl5yp [ 0 ] = rtP . TransferFcn_A [ 0 ] * rtX .
e1f0twl5yp [ 0 ] ; _rtXdot -> e1f0twl5yp [ 0 ] += rtP . TransferFcn_A [ 1 ] *
rtX . e1f0twl5yp [ 1 ] ; _rtXdot -> e1f0twl5yp [ 0 ] += rtP . TransferFcn_A [
2 ] * rtX . e1f0twl5yp [ 2 ] ; _rtXdot -> e1f0twl5yp [ 1 ] = rtX . e1f0twl5yp
[ 0 ] ; _rtXdot -> e1f0twl5yp [ 2 ] = rtX . e1f0twl5yp [ 1 ] ; _rtXdot ->
e1f0twl5yp [ 0 ] += rtB . fjizvwmtmp ; } void MdlProjection ( void ) { } void
MdlTerminate ( void ) { } static void mr_simulator_cacheDataAsMxArray (
mxArray * destArray , mwIndex i , int j , const void * srcData , size_t
numBytes ) ; static void mr_simulator_cacheDataAsMxArray ( mxArray *
destArray , mwIndex i , int j , const void * srcData , size_t numBytes ) {
mxArray * newArray = mxCreateUninitNumericMatrix ( ( size_t ) 1 , numBytes ,
mxUINT8_CLASS , mxREAL ) ; memcpy ( ( uint8_T * ) mxGetData ( newArray ) , (
const uint8_T * ) srcData , numBytes ) ; mxSetFieldByNumber ( destArray , i ,
j , newArray ) ; } static void mr_simulator_restoreDataFromMxArray ( void *
destData , const mxArray * srcArray , mwIndex i , int j , size_t numBytes ) ;
static void mr_simulator_restoreDataFromMxArray ( void * destData , const
mxArray * srcArray , mwIndex i , int j , size_t numBytes ) { memcpy ( (
uint8_T * ) destData , ( const uint8_T * ) mxGetData ( mxGetFieldByNumber (
srcArray , i , j ) ) , numBytes ) ; } static void
mr_simulator_cacheBitFieldToMxArray ( mxArray * destArray , mwIndex i , int j
, uint_T bitVal ) ; static void mr_simulator_cacheBitFieldToMxArray ( mxArray
* destArray , mwIndex i , int j , uint_T bitVal ) { mxSetFieldByNumber (
destArray , i , j , mxCreateDoubleScalar ( ( real_T ) bitVal ) ) ; } static
uint_T mr_simulator_extractBitFieldFromMxArray ( const mxArray * srcArray ,
mwIndex i , int j , uint_T numBits ) ; static uint_T
mr_simulator_extractBitFieldFromMxArray ( const mxArray * srcArray , mwIndex
i , int j , uint_T numBits ) { const uint_T varVal = ( uint_T ) mxGetScalar (
mxGetFieldByNumber ( srcArray , i , j ) ) ; return varVal & ( ( 1u << numBits
) - 1u ) ; } static void mr_simulator_cacheDataToMxArrayWithOffset ( mxArray
* destArray , mwIndex i , int j , mwIndex offset , const void * srcData ,
size_t numBytes ) ; static void mr_simulator_cacheDataToMxArrayWithOffset (
mxArray * destArray , mwIndex i , int j , mwIndex offset , const void *
srcData , size_t numBytes ) { uint8_T * varData = ( uint8_T * ) mxGetData (
mxGetFieldByNumber ( destArray , i , j ) ) ; memcpy ( ( uint8_T * ) & varData
[ offset * numBytes ] , ( const uint8_T * ) srcData , numBytes ) ; } static
void mr_simulator_restoreDataFromMxArrayWithOffset ( void * destData , const
mxArray * srcArray , mwIndex i , int j , mwIndex offset , size_t numBytes ) ;
static void mr_simulator_restoreDataFromMxArrayWithOffset ( void * destData ,
const mxArray * srcArray , mwIndex i , int j , mwIndex offset , size_t
numBytes ) { const uint8_T * varData = ( const uint8_T * ) mxGetData (
mxGetFieldByNumber ( srcArray , i , j ) ) ; memcpy ( ( uint8_T * ) destData ,
( const uint8_T * ) & varData [ offset * numBytes ] , numBytes ) ; } static
void mr_simulator_cacheBitFieldToCellArrayWithOffset ( mxArray * destArray ,
mwIndex i , int j , mwIndex offset , uint_T fieldVal ) ; static void
mr_simulator_cacheBitFieldToCellArrayWithOffset ( mxArray * destArray ,
mwIndex i , int j , mwIndex offset , uint_T fieldVal ) { mxSetCell (
mxGetFieldByNumber ( destArray , i , j ) , offset , mxCreateDoubleScalar ( (
real_T ) fieldVal ) ) ; } static uint_T
mr_simulator_extractBitFieldFromCellArrayWithOffset ( const mxArray *
srcArray , mwIndex i , int j , mwIndex offset , uint_T numBits ) ; static
uint_T mr_simulator_extractBitFieldFromCellArrayWithOffset ( const mxArray *
srcArray , mwIndex i , int j , mwIndex offset , uint_T numBits ) { const
uint_T fieldVal = ( uint_T ) mxGetScalar ( mxGetCell ( mxGetFieldByNumber (
srcArray , i , j ) , offset ) ) ; return fieldVal & ( ( 1u << numBits ) - 1u
) ; } mxArray * mr_simulator_GetDWork ( ) { static const char_T *
ssDWFieldNames [ 3 ] = { "rtB" , "rtDW" , "NULL_PrevZCX" , } ; mxArray * ssDW
= mxCreateStructMatrix ( 1 , 1 , 3 , ssDWFieldNames ) ;
mr_simulator_cacheDataAsMxArray ( ssDW , 0 , 0 , ( const void * ) & ( rtB ) ,
sizeof ( rtB ) ) ; { static const char_T * rtdwDataFieldNames [ 15 ] = {
"rtDW.fd5il4ocnr" , "rtDW.pap12ufrht" , "rtDW.kb02n0c24y" , "rtDW.jolk2wnpoh"
, "rtDW.hlmipjdt25" , "rtDW.hixtpg0x1t" , "rtDW.ppa3fjzq12" ,
"rtDW.gxcvgcvdkv" , "rtDW.nvuhhb0bcg" , "rtDW.lsnb104v2a" , "rtDW.itgoqa5rps"
, "rtDW.aaykuljpmu" , "rtDW.offng0d0eq" , "rtDW.o2lwgb0ugo" ,
"rtDW.i55sx5pxox" , } ; mxArray * rtdwData = mxCreateStructMatrix ( 1 , 1 ,
15 , rtdwDataFieldNames ) ; mr_simulator_cacheDataAsMxArray ( rtdwData , 0 ,
0 , ( const void * ) & ( rtDW . fd5il4ocnr ) , sizeof ( rtDW . fd5il4ocnr ) )
; mr_simulator_cacheDataAsMxArray ( rtdwData , 0 , 1 , ( const void * ) & (
rtDW . pap12ufrht ) , sizeof ( rtDW . pap12ufrht ) ) ;
mr_simulator_cacheDataAsMxArray ( rtdwData , 0 , 2 , ( const void * ) & (
rtDW . kb02n0c24y ) , sizeof ( rtDW . kb02n0c24y ) ) ;
mr_simulator_cacheDataAsMxArray ( rtdwData , 0 , 3 , ( const void * ) & (
rtDW . jolk2wnpoh ) , sizeof ( rtDW . jolk2wnpoh ) ) ;
mr_simulator_cacheDataAsMxArray ( rtdwData , 0 , 4 , ( const void * ) & (
rtDW . hlmipjdt25 ) , sizeof ( rtDW . hlmipjdt25 ) ) ;
mr_simulator_cacheDataAsMxArray ( rtdwData , 0 , 5 , ( const void * ) & (
rtDW . hixtpg0x1t ) , sizeof ( rtDW . hixtpg0x1t ) ) ;
mr_simulator_cacheDataAsMxArray ( rtdwData , 0 , 6 , ( const void * ) & (
rtDW . ppa3fjzq12 ) , sizeof ( rtDW . ppa3fjzq12 ) ) ;
mr_simulator_cacheDataAsMxArray ( rtdwData , 0 , 7 , ( const void * ) & (
rtDW . gxcvgcvdkv ) , sizeof ( rtDW . gxcvgcvdkv ) ) ;
mr_simulator_cacheDataAsMxArray ( rtdwData , 0 , 8 , ( const void * ) & (
rtDW . nvuhhb0bcg ) , sizeof ( rtDW . nvuhhb0bcg ) ) ;
mr_simulator_cacheDataAsMxArray ( rtdwData , 0 , 9 , ( const void * ) & (
rtDW . lsnb104v2a ) , sizeof ( rtDW . lsnb104v2a ) ) ;
mr_simulator_cacheDataAsMxArray ( rtdwData , 0 , 10 , ( const void * ) & (
rtDW . itgoqa5rps ) , sizeof ( rtDW . itgoqa5rps ) ) ;
mr_simulator_cacheDataAsMxArray ( rtdwData , 0 , 11 , ( const void * ) & (
rtDW . aaykuljpmu ) , sizeof ( rtDW . aaykuljpmu ) ) ;
mr_simulator_cacheDataAsMxArray ( rtdwData , 0 , 12 , ( const void * ) & (
rtDW . offng0d0eq ) , sizeof ( rtDW . offng0d0eq ) ) ;
mr_simulator_cacheDataAsMxArray ( rtdwData , 0 , 13 , ( const void * ) & (
rtDW . o2lwgb0ugo ) , sizeof ( rtDW . o2lwgb0ugo ) ) ;
mr_simulator_cacheDataAsMxArray ( rtdwData , 0 , 14 , ( const void * ) & (
rtDW . i55sx5pxox ) , sizeof ( rtDW . i55sx5pxox ) ) ; mxSetFieldByNumber (
ssDW , 0 , 1 , rtdwData ) ; } return ssDW ; } void mr_simulator_SetDWork (
const mxArray * ssDW ) { ( void ) ssDW ; mr_simulator_restoreDataFromMxArray
( ( void * ) & ( rtB ) , ssDW , 0 , 0 , sizeof ( rtB ) ) ; { const mxArray *
rtdwData = mxGetFieldByNumber ( ssDW , 0 , 1 ) ;
mr_simulator_restoreDataFromMxArray ( ( void * ) & ( rtDW . fd5il4ocnr ) ,
rtdwData , 0 , 0 , sizeof ( rtDW . fd5il4ocnr ) ) ;
mr_simulator_restoreDataFromMxArray ( ( void * ) & ( rtDW . pap12ufrht ) ,
rtdwData , 0 , 1 , sizeof ( rtDW . pap12ufrht ) ) ;
mr_simulator_restoreDataFromMxArray ( ( void * ) & ( rtDW . kb02n0c24y ) ,
rtdwData , 0 , 2 , sizeof ( rtDW . kb02n0c24y ) ) ;
mr_simulator_restoreDataFromMxArray ( ( void * ) & ( rtDW . jolk2wnpoh ) ,
rtdwData , 0 , 3 , sizeof ( rtDW . jolk2wnpoh ) ) ;
mr_simulator_restoreDataFromMxArray ( ( void * ) & ( rtDW . hlmipjdt25 ) ,
rtdwData , 0 , 4 , sizeof ( rtDW . hlmipjdt25 ) ) ;
mr_simulator_restoreDataFromMxArray ( ( void * ) & ( rtDW . hixtpg0x1t ) ,
rtdwData , 0 , 5 , sizeof ( rtDW . hixtpg0x1t ) ) ;
mr_simulator_restoreDataFromMxArray ( ( void * ) & ( rtDW . ppa3fjzq12 ) ,
rtdwData , 0 , 6 , sizeof ( rtDW . ppa3fjzq12 ) ) ;
mr_simulator_restoreDataFromMxArray ( ( void * ) & ( rtDW . gxcvgcvdkv ) ,
rtdwData , 0 , 7 , sizeof ( rtDW . gxcvgcvdkv ) ) ;
mr_simulator_restoreDataFromMxArray ( ( void * ) & ( rtDW . nvuhhb0bcg ) ,
rtdwData , 0 , 8 , sizeof ( rtDW . nvuhhb0bcg ) ) ;
mr_simulator_restoreDataFromMxArray ( ( void * ) & ( rtDW . lsnb104v2a ) ,
rtdwData , 0 , 9 , sizeof ( rtDW . lsnb104v2a ) ) ;
mr_simulator_restoreDataFromMxArray ( ( void * ) & ( rtDW . itgoqa5rps ) ,
rtdwData , 0 , 10 , sizeof ( rtDW . itgoqa5rps ) ) ;
mr_simulator_restoreDataFromMxArray ( ( void * ) & ( rtDW . aaykuljpmu ) ,
rtdwData , 0 , 11 , sizeof ( rtDW . aaykuljpmu ) ) ;
mr_simulator_restoreDataFromMxArray ( ( void * ) & ( rtDW . offng0d0eq ) ,
rtdwData , 0 , 12 , sizeof ( rtDW . offng0d0eq ) ) ;
mr_simulator_restoreDataFromMxArray ( ( void * ) & ( rtDW . o2lwgb0ugo ) ,
rtdwData , 0 , 13 , sizeof ( rtDW . o2lwgb0ugo ) ) ;
mr_simulator_restoreDataFromMxArray ( ( void * ) & ( rtDW . i55sx5pxox ) ,
rtdwData , 0 , 14 , sizeof ( rtDW . i55sx5pxox ) ) ; } } mxArray *
mr_simulator_GetSimStateDisallowedBlocks ( ) { mxArray * data =
mxCreateCellMatrix ( 1 , 3 ) ; mwIndex subs [ 2 ] , offset ; { static const
char_T * blockType [ 1 ] = { "Scope" , } ; static const char_T * blockPath [
1 ] = { "simulator/Scope" , } ; static const int reason [ 1 ] = { 0 , } ; for
( subs [ 0 ] = 0 ; subs [ 0 ] < 1 ; ++ ( subs [ 0 ] ) ) { subs [ 1 ] = 0 ;
offset = mxCalcSingleSubscript ( data , 2 , subs ) ; mxSetCell ( data ,
offset , mxCreateString ( blockType [ subs [ 0 ] ] ) ) ; subs [ 1 ] = 1 ;
offset = mxCalcSingleSubscript ( data , 2 , subs ) ; mxSetCell ( data ,
offset , mxCreateString ( blockPath [ subs [ 0 ] ] ) ) ; subs [ 1 ] = 2 ;
offset = mxCalcSingleSubscript ( data , 2 , subs ) ; mxSetCell ( data ,
offset , mxCreateDoubleScalar ( ( real_T ) reason [ subs [ 0 ] ] ) ) ; } }
return data ; } void MdlInitializeSizes ( void ) { ssSetNumContStates ( rtS ,
3 ) ; ssSetNumPeriodicContStates ( rtS , 0 ) ; ssSetNumY ( rtS , 0 ) ;
ssSetNumU ( rtS , 0 ) ; ssSetDirectFeedThrough ( rtS , 0 ) ;
ssSetNumSampleTimes ( rtS , 2 ) ; ssSetNumBlocks ( rtS , 21 ) ;
ssSetNumBlockIO ( rtS , 11 ) ; ssSetNumBlockParams ( rtS , 15 ) ; } void
MdlInitializeSampleTimes ( void ) { ssSetSampleTime ( rtS , 0 , 0.0 ) ;
ssSetSampleTime ( rtS , 1 , 0.1 ) ; ssSetOffsetTime ( rtS , 0 , 0.0 ) ;
ssSetOffsetTime ( rtS , 1 , 0.0 ) ; } void raccel_set_checksum ( ) {
ssSetChecksumVal ( rtS , 0 , 2617410447U ) ; ssSetChecksumVal ( rtS , 1 ,
2570670894U ) ; ssSetChecksumVal ( rtS , 2 , 2266917683U ) ; ssSetChecksumVal
( rtS , 3 , 2230738507U ) ; }
#if defined(_MSC_VER)
#pragma optimize( "", off )
#endif
SimStruct * raccel_register_model ( ssExecutionInfo * executionInfo ) {
static struct _ssMdlInfo mdlInfo ; static struct _ssBlkInfo2 blkInfo2 ;
static struct _ssBlkInfoSLSize blkInfoSLSize ; rt_modelMapInfoPtr = & (
rt_dataMapInfo . mmi ) ; executionInfo -> gblObjects_ . numToFiles = 0 ;
executionInfo -> gblObjects_ . numFrFiles = 0 ; executionInfo -> gblObjects_
. numFrWksBlocks = 0 ; executionInfo -> gblObjects_ . numModelInputs = 0 ;
executionInfo -> gblObjects_ . numRootInportBlks = 0 ; executionInfo ->
gblObjects_ . inportDataTypeIdx = NULL ; executionInfo -> gblObjects_ .
inportDims = NULL ; executionInfo -> gblObjects_ . inportComplex = NULL ;
executionInfo -> gblObjects_ . inportInterpoFlag = NULL ; executionInfo ->
gblObjects_ . inportContinuous = NULL ; ( void ) memset ( ( char_T * ) rtS ,
0 , sizeof ( SimStruct ) ) ; ( void ) memset ( ( char_T * ) & mdlInfo , 0 ,
sizeof ( struct _ssMdlInfo ) ) ; ( void ) memset ( ( char_T * ) & blkInfo2 ,
0 , sizeof ( struct _ssBlkInfo2 ) ) ; ( void ) memset ( ( char_T * ) &
blkInfoSLSize , 0 , sizeof ( struct _ssBlkInfoSLSize ) ) ; ssSetBlkInfo2Ptr (
rtS , & blkInfo2 ) ; ssSetBlkInfoSLSizePtr ( rtS , & blkInfoSLSize ) ;
ssSetMdlInfoPtr ( rtS , & mdlInfo ) ; ssSetExecutionInfo ( rtS ,
executionInfo ) ; slsaAllocOPModelData ( rtS ) ; { static time_T mdlPeriod [
NSAMPLE_TIMES ] ; static time_T mdlOffset [ NSAMPLE_TIMES ] ; static time_T
mdlTaskTimes [ NSAMPLE_TIMES ] ; static int_T mdlTsMap [ NSAMPLE_TIMES ] ;
static int_T mdlSampleHits [ NSAMPLE_TIMES ] ; static boolean_T
mdlTNextWasAdjustedPtr [ NSAMPLE_TIMES ] ; static int_T mdlPerTaskSampleHits
[ NSAMPLE_TIMES * NSAMPLE_TIMES ] ; static time_T mdlTimeOfNextSampleHit [
NSAMPLE_TIMES ] ; { int_T i ; for ( i = 0 ; i < NSAMPLE_TIMES ; i ++ ) {
mdlPeriod [ i ] = 0.0 ; mdlOffset [ i ] = 0.0 ; mdlTaskTimes [ i ] = 0.0 ;
mdlTsMap [ i ] = i ; mdlSampleHits [ i ] = 1 ; } } ssSetSampleTimePtr ( rtS ,
& mdlPeriod [ 0 ] ) ; ssSetOffsetTimePtr ( rtS , & mdlOffset [ 0 ] ) ;
ssSetSampleTimeTaskIDPtr ( rtS , & mdlTsMap [ 0 ] ) ; ssSetTPtr ( rtS , &
mdlTaskTimes [ 0 ] ) ; ssSetSampleHitPtr ( rtS , & mdlSampleHits [ 0 ] ) ;
ssSetTNextWasAdjustedPtr ( rtS , & mdlTNextWasAdjustedPtr [ 0 ] ) ;
ssSetPerTaskSampleHitsPtr ( rtS , & mdlPerTaskSampleHits [ 0 ] ) ;
ssSetTimeOfNextSampleHitPtr ( rtS , & mdlTimeOfNextSampleHit [ 0 ] ) ; }
ssSetSolverMode ( rtS , SOLVER_MODE_SINGLETASKING ) ; { ssSetBlockIO ( rtS ,
( ( void * ) & rtB ) ) ; ( void ) memset ( ( ( void * ) & rtB ) , 0 , sizeof
( B ) ) ; } { real_T * x = ( real_T * ) & rtX ; ssSetContStates ( rtS , x ) ;
( void ) memset ( ( void * ) x , 0 , sizeof ( X ) ) ; } { void * dwork = (
void * ) & rtDW ; ssSetRootDWork ( rtS , dwork ) ; ( void ) memset ( dwork ,
0 , sizeof ( DW ) ) ; } { static DataTypeTransInfo dtInfo ; ( void ) memset (
( char_T * ) & dtInfo , 0 , sizeof ( dtInfo ) ) ; ssSetModelMappingInfo ( rtS
, & dtInfo ) ; dtInfo . numDataTypes = 29 ; dtInfo . dataTypeSizes = &
rtDataTypeSizes [ 0 ] ; dtInfo . dataTypeNames = & rtDataTypeNames [ 0 ] ;
dtInfo . BTransTable = & rtBTransTable ; dtInfo . PTransTable = &
rtPTransTable ; dtInfo . dataTypeInfoTable = rtDataTypeInfoTable ; }
simulator_InitializeDataMapInfo ( ) ; ssSetIsRapidAcceleratorActive ( rtS ,
true ) ; ssSetRootSS ( rtS , rtS ) ; ssSetVersion ( rtS ,
SIMSTRUCT_VERSION_LEVEL2 ) ; ssSetModelName ( rtS , "simulator" ) ; ssSetPath
( rtS , "simulator" ) ; ssSetTStart ( rtS , 0.0 ) ; ssSetTFinal ( rtS , 20.0
) ; { static RTWLogInfo rt_DataLoggingInfo ; rt_DataLoggingInfo .
loggingInterval = ( NULL ) ; ssSetRTWLogInfo ( rtS , & rt_DataLoggingInfo ) ;
} { { static int_T rt_LoggedStateWidths [ ] = { 3 , 1 , 1 , 1 , 1 , 1 , 1 } ;
static int_T rt_LoggedStateNumDimensions [ ] = { 1 , 1 , 1 , 1 , 1 , 1 , 1 }
; static int_T rt_LoggedStateDimensions [ ] = { 3 , 1 , 1 , 1 , 1 , 1 , 1 } ;
static boolean_T rt_LoggedStateIsVarDims [ ] = { 0 , 0 , 0 , 0 , 0 , 0 , 0 }
; static BuiltInDTypeId rt_LoggedStateDataTypeIds [ ] = { SS_DOUBLE ,
SS_DOUBLE , SS_DOUBLE , SS_DOUBLE , SS_DOUBLE , SS_DOUBLE , SS_DOUBLE } ;
static int_T rt_LoggedStateComplexSignals [ ] = { 0 , 0 , 0 , 0 , 0 , 0 , 0 }
; static RTWPreprocessingFcnPtr rt_LoggingStatePreprocessingFcnPtrs [ ] = { (
NULL ) , ( NULL ) , ( NULL ) , ( NULL ) , ( NULL ) , ( NULL ) , ( NULL ) } ;
static const char_T * rt_LoggedStateLabels [ ] = { "CSTATE" , "DSTATE" ,
"DSTATE" , "DSTATE" , "DSTATE" , "DSTATE" , "DSTATE" } ; static const char_T
* rt_LoggedStateBlockNames [ ] = { "simulator/Transfer Fcn" ,
"simulator/UD 5" , "simulator/UD 4" , "simulator/UD 3" , "simulator/UD " ,
"simulator/UD1" , "simulator/UD 2" } ; static const char_T *
rt_LoggedStateNames [ ] = { "" , "DSTATE" , "DSTATE" , "DSTATE" , "DSTATE" ,
"DSTATE" , "DSTATE" } ; static boolean_T rt_LoggedStateCrossMdlRef [ ] = { 0
, 0 , 0 , 0 , 0 , 0 , 0 } ; static RTWLogDataTypeConvert
rt_RTWLogDataTypeConvert [ ] = { { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 ,
1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } ,
{ 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE ,
SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0
, 0 , 1.0 , 0 , 0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 ,
0.0 } , { 0 , SS_DOUBLE , SS_DOUBLE , 0 , 0 , 0 , 1.0 , 0 , 0.0 } } ; static
int_T rt_LoggedStateIdxList [ ] = { 0 , 0 , 1 , 2 , 3 , 4 , 5 } ; static
RTWLogSignalInfo rt_LoggedStateSignalInfo = { 7 , rt_LoggedStateWidths ,
rt_LoggedStateNumDimensions , rt_LoggedStateDimensions ,
rt_LoggedStateIsVarDims , ( NULL ) , ( NULL ) , rt_LoggedStateDataTypeIds ,
rt_LoggedStateComplexSignals , ( NULL ) , rt_LoggingStatePreprocessingFcnPtrs
, { rt_LoggedStateLabels } , ( NULL ) , ( NULL ) , ( NULL ) , {
rt_LoggedStateBlockNames } , { rt_LoggedStateNames } ,
rt_LoggedStateCrossMdlRef , rt_RTWLogDataTypeConvert , rt_LoggedStateIdxList
} ; static void * rt_LoggedStateSignalPtrs [ 7 ] ; rtliSetLogXSignalPtrs (
ssGetRTWLogInfo ( rtS ) , ( LogSignalPtrsType ) rt_LoggedStateSignalPtrs ) ;
rtliSetLogXSignalInfo ( ssGetRTWLogInfo ( rtS ) , & rt_LoggedStateSignalInfo
) ; rt_LoggedStateSignalPtrs [ 0 ] = ( void * ) & rtX . e1f0twl5yp [ 0 ] ;
rt_LoggedStateSignalPtrs [ 1 ] = ( void * ) & rtDW . fd5il4ocnr ;
rt_LoggedStateSignalPtrs [ 2 ] = ( void * ) & rtDW . pap12ufrht ;
rt_LoggedStateSignalPtrs [ 3 ] = ( void * ) & rtDW . kb02n0c24y ;
rt_LoggedStateSignalPtrs [ 4 ] = ( void * ) & rtDW . jolk2wnpoh ;
rt_LoggedStateSignalPtrs [ 5 ] = ( void * ) & rtDW . hlmipjdt25 ;
rt_LoggedStateSignalPtrs [ 6 ] = ( void * ) & rtDW . hixtpg0x1t ; }
rtliSetLogT ( ssGetRTWLogInfo ( rtS ) , "tout" ) ; rtliSetLogX (
ssGetRTWLogInfo ( rtS ) , "" ) ; rtliSetLogXFinal ( ssGetRTWLogInfo ( rtS ) ,
"xFinal" ) ; rtliSetLogVarNameModifier ( ssGetRTWLogInfo ( rtS ) , "none" ) ;
rtliSetLogFormat ( ssGetRTWLogInfo ( rtS ) , 4 ) ; rtliSetLogMaxRows (
ssGetRTWLogInfo ( rtS ) , 0 ) ; rtliSetLogDecimation ( ssGetRTWLogInfo ( rtS
) , 1 ) ; rtliSetLogY ( ssGetRTWLogInfo ( rtS ) , "" ) ;
rtliSetLogYSignalInfo ( ssGetRTWLogInfo ( rtS ) , ( NULL ) ) ;
rtliSetLogYSignalPtrs ( ssGetRTWLogInfo ( rtS ) , ( NULL ) ) ; } { static
struct _ssStatesInfo2 statesInfo2 ; ssSetStatesInfo2 ( rtS , & statesInfo2 )
; } { static ssPeriodicStatesInfo periodicStatesInfo ;
ssSetPeriodicStatesInfo ( rtS , & periodicStatesInfo ) ; } { static
ssJacobianPerturbationBounds jacobianPerturbationBounds ;
ssSetJacobianPerturbationBounds ( rtS , & jacobianPerturbationBounds ) ; } {
static ssSolverInfo slvrInfo ; static boolean_T contStatesDisabled [ 3 ] ;
static real_T absTol [ 3 ] = { 1.0E-6 , 1.0E-6 , 1.0E-6 } ; static uint8_T
absTolControl [ 3 ] = { 0U , 0U , 0U } ; static real_T
contStateJacPerturbBoundMinVec [ 3 ] ; static real_T
contStateJacPerturbBoundMaxVec [ 3 ] ; { int i ; for ( i = 0 ; i < 3 ; ++ i )
{ contStateJacPerturbBoundMinVec [ i ] = 0 ; contStateJacPerturbBoundMaxVec [
i ] = rtGetInf ( ) ; } } ssSetSolverRelTol ( rtS , 0.001 ) ; ssSetStepSize (
rtS , 0.0 ) ; ssSetMinStepSize ( rtS , 0.0 ) ; ssSetMaxNumMinSteps ( rtS , -
1 ) ; ssSetMinStepViolatedError ( rtS , 0 ) ; ssSetMaxStepSize ( rtS , 0.1 )
; ssSetSolverMaxOrder ( rtS , - 1 ) ; ssSetSolverRefineFactor ( rtS , 1 ) ;
ssSetOutputTimes ( rtS , ( NULL ) ) ; ssSetNumOutputTimes ( rtS , 0 ) ;
ssSetOutputTimesOnly ( rtS , 0 ) ; ssSetOutputTimesIndex ( rtS , 0 ) ;
ssSetZCCacheNeedsReset ( rtS , 0 ) ; ssSetDerivCacheNeedsReset ( rtS , 0 ) ;
ssSetNumNonContDerivSigInfos ( rtS , 0 ) ; ssSetNonContDerivSigInfos ( rtS ,
( NULL ) ) ; ssSetSolverInfo ( rtS , & slvrInfo ) ; ssSetSolverName ( rtS ,
"VariableStepAuto" ) ; ssSetVariableStepSolver ( rtS , 1 ) ;
ssSetSolverConsistencyChecking ( rtS , 0 ) ; ssSetSolverAdaptiveZcDetection (
rtS , 0 ) ; ssSetSolverRobustResetMethod ( rtS , 0 ) ; ssSetAbsTolVector (
rtS , absTol ) ; ssSetAbsTolControlVector ( rtS , absTolControl ) ;
ssSetSolverAbsTol_Obsolete ( rtS , absTol ) ;
ssSetSolverAbsTolControl_Obsolete ( rtS , absTolControl ) ;
ssSetJacobianPerturbationBoundsMinVec ( rtS , contStateJacPerturbBoundMinVec
) ; ssSetJacobianPerturbationBoundsMaxVec ( rtS ,
contStateJacPerturbBoundMaxVec ) ; ssSetSolverStateProjection ( rtS , 0 ) ;
ssSetSolverMassMatrixType ( rtS , ( ssMatrixType ) 0 ) ;
ssSetSolverMassMatrixNzMax ( rtS , 0 ) ; ssSetModelOutputs ( rtS , MdlOutputs
) ; ssSetModelUpdate ( rtS , MdlUpdate ) ; ssSetModelDerivatives ( rtS ,
MdlDerivatives ) ; ssSetSolverMaxConsecutiveMinStep ( rtS , 1 ) ;
ssSetSolverShapePreserveControl ( rtS , 2 ) ; ssSetTNextTid ( rtS , INT_MIN )
; ssSetTNext ( rtS , rtMinusInf ) ; ssSetSolverNeedsReset ( rtS ) ;
ssSetNumNonsampledZCs ( rtS , 0 ) ; ssSetContStateDisabled ( rtS ,
contStatesDisabled ) ; ssSetSolverMaxConsecutiveMinStep ( rtS , 1 ) ; }
ssSetChecksumVal ( rtS , 0 , 2617410447U ) ; ssSetChecksumVal ( rtS , 1 ,
2570670894U ) ; ssSetChecksumVal ( rtS , 2 , 2266917683U ) ; ssSetChecksumVal
( rtS , 3 , 2230738507U ) ; { static const sysRanDType rtAlwaysEnabled =
SUBSYS_RAN_BC_ENABLE ; static RTWExtModeInfo rt_ExtModeInfo ; static const
sysRanDType * systemRan [ 5 ] ; gblRTWExtModeInfo = & rt_ExtModeInfo ;
ssSetRTWExtModeInfo ( rtS , & rt_ExtModeInfo ) ;
rteiSetSubSystemActiveVectorAddresses ( & rt_ExtModeInfo , systemRan ) ;
systemRan [ 0 ] = & rtAlwaysEnabled ; systemRan [ 1 ] = & rtAlwaysEnabled ;
systemRan [ 2 ] = & rtAlwaysEnabled ; systemRan [ 3 ] = & rtAlwaysEnabled ;
systemRan [ 4 ] = & rtAlwaysEnabled ; rteiSetModelMappingInfoPtr (
ssGetRTWExtModeInfo ( rtS ) , & ssGetModelMappingInfo ( rtS ) ) ;
rteiSetChecksumsPtr ( ssGetRTWExtModeInfo ( rtS ) , ssGetChecksums ( rtS ) )
; rteiSetTPtr ( ssGetRTWExtModeInfo ( rtS ) , ssGetTPtr ( rtS ) ) ; }
slsaDisallowedBlocksForSimTargetOP ( rtS ,
mr_simulator_GetSimStateDisallowedBlocks ) ; slsaGetWorkFcnForSimTargetOP (
rtS , mr_simulator_GetDWork ) ; slsaSetWorkFcnForSimTargetOP ( rtS ,
mr_simulator_SetDWork ) ; rt_RapidReadMatFileAndUpdateParams ( rtS ) ; if (
ssGetErrorStatus ( rtS ) ) { return rtS ; } return rtS ; }
#if defined(_MSC_VER)
#pragma optimize( "", on )
#endif
void MdlOutputsParameterSampleTime ( int_T tid ) { MdlOutputsTID2 ( tid ) ; }
