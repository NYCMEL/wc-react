###HEADS###################################################################
#
#  Melify Internet Toolkit (MTK) - Copyright (C) 2015  Melify LLC.
#  
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see http://www.gnu.org/licenses.
#
###HEADE###################################################################

# put {
#     <style>
#     .blur {
# 	color: transparent;
# 	text-shadow: 0 0 5px rgba(0,0,0,0.4);
#     }
#     </style>
# }

m::proc -public lorem {
    {-blur            ""}
    {-language   "latin"}
    {-start           {}}
    {size             {}}
} {
    DOCUMENTATION GOES HERE...
} {
    Trace

    # FOR CALLS FROM URLS
    if {[info exist ::size]    == 1} {set size     $::size}
    if {[info exist ::languae] == 1} {set size $::language}

    array set str {
	"latin" {
	    Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr,  sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr,  sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.

	    Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.

	    Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.

	    Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.

	    Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis.

	    At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr,  sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr,  At accusam aliquyam diam diam dolore dolores duo eirmod eos erat, et nonumy sed tempor et et invidunt justo labore Stet clita ea et gubergren, kasd magna no rebum. sanctus sea sed takimata ut vero voluptua. est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr,  sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat. 

	    Consetetur sadipscing elitr,  sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr,  sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr,  sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
	}

	"english" {
	    But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system and expound the actual teachings of the great explorer of the truth the master-builder of human happiness No one rejects dislikes or avoids pleasure itself because it is pleasure but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful Nor again is there anyone who loves or pursues or desires to obtain pain of itself because it is pain but because occasionally circumstances occur in which toil and pain can procure him some great pleasure To take a trivial example which of us ever undertakes laborious physical exercise except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences or one who avoids a pain that produces no resultant pleasure
	}

	"chinese" {
	    但 我 必 须 向  解 释 这 一 切 如 何 误 区 谴 责 高 兴  并 赞 扬 疼 痛 出 生  我 会 给  一 个 完 整 的 系 统  并 阐 述 了 实 际 的 教 义 的 伟 大 探 险 家 的 真 相  船 长 建 设 者 人 类 幸 福 。 没 有 人 反 对  不 喜 欢  或 避 免 高 兴 本 身  因 为 它 是 高 兴  但 因 为 这 些 谁 不 知 道 如 何 合 理 地 追 求 高 兴 遇 到 的 后 果 是 极 其 痛 苦 的 。 再 有  也 不 是 任 何 人 或 谁 喜 欢 追 求 或 希 望 获 得 疼 痛 本 身  因 为 它 是 疼 痛  而 是 因 为 偶 尔 发 生 的 情 况  其 中 辛 劳 和 痛 苦 可 以 购 买 一 些 他 非 常 高 兴 。 采 取 琐 碎 例 如  我 们 都 进 行 艰 苦 的 体 育 锻 炼  除 了 获 得 一 些 优 势 呢 ？ 但 谁 也 无 权 指 责 谁 选 择 一 个 男 人 享 受 高 兴 没 有 恼 人 的 后 果  或 一 个 谁 避 免 了 疼 痛  生 产 没 有 造 成 高 兴 
	}
	
	"spanish" {
	    Embarcaronse por fin a 5 de Diciembre de 1745, y el lunes 6 a las diez horas de dia, habiendo disparado la pieza de leva, se hicieron a la vela en nombre de Dios, con viento fresco, y salieron a ponerse en franquia en el amarradero, que dista tres leguas de Buenos Aires.  
	    De alli salieron martes, a las nueve y media de la manana, y con distar Montevideo solas cincuenta leguas de Buenos Aires, no pudieron tomar su puerto hasta el lunes 13, que a las once y media del dia dieron fondo en medio de su ensenada. Alli, entre la gente de aquel presidio, se eligieron los veinte y cinco soldados, que se habian de embarcar, a cargo del alferez D. Salvador Martin de Olmo: porque, aunque deseaba el Senor Gobernador de Buenos Aires, que fuese mayor el numero de los soldados, y habia otros muchos que se ofrecian voluntariamente a esta expedicion, no fue posible aumentar el numero, por no permitirlo el buque del navichuelo.  
	    El comandante de Montevideo, D. Domingo Santos Uriarte, vizcaino, egecuto cuanto estuvo de su parte para el avio de la gente y de los misioneros, con la presteza posible. Con que el dia 16 de Diciembre estuvo el navio ya pronto a salir; pero por calmar el nord-nord-este, y soplar el sud-este, no se pudieron hacer a la vela hasta el viernes 17 a las cuatro y media de la manana, con nord-nord-este y norte.  
	    La niebla densa casi no les permitia descubrir la tierra, y no se adelgazo hasta las seis y media de la tarde, pasando sin ver la isla de Flores. Domingo 19 dieron fondo a vista de la isla de Lobos, que les quedo al nor-nord-este, a tres leguas de distancia.  
	}
	"german" {
	    Aber ich muss Ihnen erklären wie all diese irre Idee der Kündigung Freude loben und Schmerzen geboren wurde und ich werde Ihnen eine vollständige Rechnung des Systems und entfalten den tatsächlichen Lehren der großen Entdecker der Wahrheit der Baumeister der menschlichen Glück Niemand lehnt nicht mag oder vermeidet selbst Freude weil es Freude sondern weil diejenigen die nicht wissen wie man Freude verfolgen rational Begegnung Folgen die äußerst schmerzhaft sein Auch gibt es wieder wer liebt oder verfolgt oder Wünsche zu erhalten Schmerzen von sich selbst weil es Schmerzen sondern auch weil gelegentlich Umstände eintreten in dem Mühe und Schmerzen können beschaffen ihm einige große Freude Um ein triviales Beispiel das von uns immer verpflichtet mühsame körperliche Bewegung es sei denn um einige Vorteile von ihm? Aber wer hat das Recht Fehler zu finden mit einem Mann der wählt um eine Freude dass keine lästigen Folgen oder derjenige der verhindert dass ein Schmerz erzeugt daraus keine Freude
	}
	
	"french" {
	    Mais je dois vous expliquer comment toute cette idée erronée de dénoncer le plaisir et la douleur est née l'éloge et je vais vous donner un compte rendu complet du système et exposer les enseignements du grand explorateur de la vérité le maître-bâtisseur de l'homme bonheur Nul ne rejette n'aime pas ou évite le plaisir lui-même car il est le plaisir mais parce que ceux qui ne savent pas comment le plaisir de poursuivre rationnellement rencontre des conséquences qui sont extrêmement douloureux Nor encore bien il ya quelqu'un qui aime ou exerce ou souhaite obtenir de la douleur elle-même parce que c'est la douleur mais parce que parfois les circonstances se produisent dans de labeur et de douleur qui peut lui procurer une plus grand plaisir Pour prendre un exemple trivial qui d'entre nous s'engage jamais laborieux exercice physique sauf à obtenir un certain avantage de tout ça? Mais qui a le droit de trouver à redire à un homme qui choisit de profiter d'un plaisir qui n'a pas de conséquences gênantes ou celui qui évite une douleur qui en résulte ne produit pas de plaisir
	}

	"hebrew" {
	    הנאה ואת הלול הכאב נולד ואני אתן לך להשלים את החשבון של המערכת ואת לבאר בפועל של הגדול של חוקר את האמת את יחידת של האדם אושר. אף אחד לא דוחה הנאה או ימנע את עצמו כי זה תענוג אבל מכיוון שהם לא מי יודע איך להמשיך תענוג rationally המפגש כי התוצאות הן מאוד כואב. גם לא נמצא שם שוב מי אוהב או או לקבל כאב של עצמו כי זה כאב אבל בגלל הנסיבות לעתים להתרחש בו עצב וכאב יכול לרכוש לו קצת הנאה רבה. לקחת דוגמא זעיר אשר בנו של פעם מתחייב חרוץ פיזית לממש אלא כדי להשיג את היתרון ממנו קצת? אבל כל זכות שיש לו על מנת למצוא פגם עם אדם אשר בוחר ליהנות תענוג שיש לו השלכות לא מעצבן או מי ימנע כאב כי לא מייצרת כתוצאה תענוג
	}

	"arabic" {
ولكن لا بد لي من أن أشرح لك كيف ولدت كل هذه الفكرة الخاطئة من المتعة وشجب مشيدا الألم وأنا سوف أعطيك حساب كامل للنظام وشرح تعاليم الفعلي للمستكشف كبير من الحقيقة سيد باني السعادة الإنسان لا بينما لم يعجب احد يرفض أو يتجنب متعة في حد ذاته لأنه لمن دواعي لكن لأولئك الذين لا يعرفون كيفية متابعة متعة تواجه بعقلانية العواقب التي هي مؤلمة للغاية وليس هناك أي شخص الذي يحب أو يسعى أو يرغب في الحصول على آلام نفسه مرة أخرى لأنه هو الألم ولكن لأن الظروف في بعض الأحيان تحدث في الكد والألم الذي يمكن الحصول عليه بعض السرور لنأخذ مثالا تافها التي تتعهد منا من أي وقت مضى التمارين البدنية الشاقة باستثناء الحصول على بعض المزايا من ذلك؟ ولكن الذي لديه أي حق للعثور على خطأ مع الرجل الذي يختار التمتع المتعة التي لا يوجد لديه عواقب مزعجة أو الشخص الذي يتجنب الألم الذي لا ينتج متعة الناتجة
	}

	"persian" {
اما من باید به شما توضیح دهد که چگونه همه این ایده اشتباه از انتقاد از لذت و ستایش از درد متولد شده بود و من به شما یک حساب کامل سیستم را به تفصیل شرح دادن و آموزه های واقعی از کاشف بزرگ حقیقت استاد ساز خوشبختی انسان بدون یک دوست نداشتن رد و یا اجتناب لذت خود را به خاطر آن لذت است، اما به دلیل کسانی که نمی دانند که چگونه به دنبال لذت عقلانی که عواقب بسیار دردناک و نه دوباره هر کسی که دوست دارد یا دنبال کند و یا بخواهد برای به دست آوردن درد خود به خود وجود دارد روبرو می شوند به دلیل آن درد است اما زیرا گاهی اوقات شرایطی رخ می دهد که در آن رنج و درد می تواند او را به برخی از لذت بزرگ تهیه مثلا اگر بی اهمیت است که ما همیشه متعهد ورزش دشوار به جز به دست آوردن برخی از مزیت از آن؟ اما چه کسی حق برای پیدا کردن گسل با مردی که انتخاب برای لذت بردن از لذت است که هیچ عواقب آزار دهنده یا یکی که اجتناب درد که تولید ندارد لذت حاصل است
	}

	"russian" {
	    Но я должен объяснить вам, как все это ошибочная идея денонсирующем удовольствие и боль, восхваляющие родился, и я дам вам полный отчет о системе, а также изложить фактический учения великого исследователя от истины, мастер-строитель человека счастья. Никто не отвергает, не нравится, или избегает удовольствие себе, потому что это приятно, но и потому, что те, кто не знает, как приятно проводить рационально столкнуться последствий, которые являются чрезвычайно болезненным. Кроме снова есть тех, кто любит и преследует или желания получить боль сама по себе, потому что это боль, но и потому, что иногда возникают обстоятельства, в которых трудятся и боли могут приобретать ему огромное удовольствие. Чтобы воспользоваться тривиальным примером, который мы когда-либо обязуется кропотливая физические упражнения, за исключением того, получить некоторые преимущества из этого? Но кто имеет право, чтобы найти вина с человеком, который решит пользоваться приятно, что не раздражает последствия, или тот, кто избегает боли, которые не производит результате удовольствия
	}

	"italian" {
	    Uno dei fatti piu notevoli al principio del decimosesto secolo e senza dubbio l'apparire della cortigiana; figura degna di considerazione e di esame non ebbe pur anco uno storico che di lei si occupasse scrupolosamente e gelosamente, e, diseppellendo dalle biblioteche ed archivii i numerosi documenti che la riguardano, dasse compiuta questa pagina di storia che non e tra le ultime del nostro rinascimento.  
	    Il nome di cortigiana si collega certamente alla storia dell'umanesimo, ma quando, dove e come ebbe principio? Tale quesito non ha ancora risposta sicura. Arturo Graf, che si occupo ultimo della questione con quell'acume di critica ed abbondanza di erudizione ben note, esita a dare giudizio decisivo, attendendo pur lui che nuovi studi e documenti traccino via piu ampia e sicura per definire tale punto.  
	    Lo sviluppo della cortigiana prodotto dalla rivoluzione sociale che si svolgeva nel rinascimento, adattato al nuovo regime di vita che rese allora meno dure e servili le leggi sul costume, viene certamente a smentire l'asserzione che il cinquecento fosse l'eta piu feconda di turpi vizii, e l'amor patico, nato nelle epoche di maggior coltura e diffuso su larga scala nel medio evo, trova a combatterlo questo sviluppo della cortigianeria e le leggi civili di quasi tutti gli stati italiani, mentre dal pergamo tuona aspra e minacciosa la voce di S.Bernardino e del Savonarola; l'Ariosto stesso che non ne fu immune dichiara che nel 1518 il vizio si restringeva a pochi umanisti.  
	    Ed allora si disputa sulla teorica dell'amore che ha forti e strenui campioni; dell'amore libero tra liberi discorre Speron Speroni nel Dialogo d'amore ove introduce a parlare la Tullia d'Aragona e Bernardo Tasso, innamorati, e costretti a separarsi dovendo quest'ultimo andare a Salerno; dell'amor platonico, primi il Bembo e il Castiglione, il Piccolomini poi, che lo definisce
	}

	"korean" {
	    하지만 즐거움을 규탄과 고통을 찬양의 모든 착각 아이디어가 태어 났을 때 어떻게 설명해야하고 당신에게 진실의 위대한 탐험가의 실제 가르침을 시스템과 상세히 설명의 전체 계정을 제공합니다 인간의 행복의 마스터 빌더 없습니다 하나는 싫어요을 거부하거나 쾌락이기 때문에하지만, 쾌락을 추구하는 방법을 모르는 사람들이 이성적으로 사랑하거나 추구하거나 자체의 고통을 취득하고자하는 사람이 고통이 있기 때문에 매우 고통스러운 아르 또한 다시이 결과가 발생하지만, 때문에 쾌락 자체를 방지 때때로 상황이 발생하기 때문에하는 수고와 고통은 그것으로부터 어떤 혜택을 얻을 경우를 제외하고 어느 힘든 운동을지지 우리의 사소한 예를 이용하려면 그에게 큰 기쁨을 조달 할 수 있습니까? 그러나 결과 즐거움을 생산하지 통증을 방지 더 성가신 결과 또는이없는 즐거움을 즐길 수 선택 남자와 결함을 발견 할 권리가 누구가
	}
	"armenian" {
	    Բայց ես պետք է ձեզ բացատրել, թե ինչպես է այս ամենը ճիշտ գաղափարը չեղյալ պատիվ եւ գովաբանելով ցավը ծնվել եւ ես կտամ քեզ մի ամբողջական հաշվի համակարգի եւ մեկնաբանել փաստացի ուսմունքները մեծ Explorer ճշմարտության տերը - շինարար մարդկային երջանկության ոչ մեկ մերժում dislikes կամ խուսափում հաճույք իրեն, քանի որ դա հաճելի է, բայց քանի որ նրանք, ովքեր չգիտեն, թե ինչպես պետք է իրականացնել ռացիոնալ հաճույք բախվում հետեւանքները, որոնք չափազանց ցավոտ Նոր էլի կա մեկը, ով սիրում է, կամ հետապնդում է կամ ցանկանում է ձեռք բերել, քանի որ դա ցավ է, սակայն ցավը ինքնին քանի որ երբեմն հանգամանքներ են տեղի ունենում, որոնք աշխատել եւ ցավը կարող է ձեռք բերել նրան մեծ հաճույք տանել Trivial օրինակ, որը մեզ երբեւէ պարտավորվում աշխատատար ֆիզիկական վարժություն բացառությամբ ստանալ որոշակի առավելություն է այն. Բայց ով որեւէ իրավունք գտնել մեղքի հետ, մի մարդ, ով ընտրում է վայելել հաճելի է, որ չունի annoying հետեւանքների կամ ով խուսափում է ցավում է, որ արտադրում է ոչ միայն ծագող հաճույք
	}

	"hindi" {
	    लेकिन मैं यह सब कैसे खुशी की निंदा और दर्द की तारीफ कर के इस गलत विचार पैदा हुआ था आप को समझाना चाहिए और मैं तुम्हें प्रणाली का एक पूरा अकाउंट सत्य के महान अन्वेषक की वास्तविक शिक्षाओं मानव खुशी के मास्टर बिल्डर नहीं देने के लिए और व्याख्या होगा एक नापसंद को खारिज कर दिया या खुशी खुद को बचा जाता है क्योंकि यह खुशी की बात है, लेकिन उन लोगों की वजह से कैसे खुशी का पीछा करने के तर्क से परिणाम है कि बेहद दर्दनाक हैं मुठभेड़ में पता नहीं है, जो न फिर कोई है जो प्यार करता है या कर्मों या खुद के दर्द को प्राप्त करने के लिए है क्योंकि यह दर्द है इच्छाओं लेकिन है क्योंकि कभी कभी परिस्थितियों पाए जाते हैं जो परिश्रम और दर्द में उसे कुछ बहुत खुशी एक तुच्छ उदाहरण है जो हम में से कभी छोड़कर श्रमसाध्य शारीरिक व्यायाम चलाती है उस में से कुछ लाभ प्राप्त करने के लिए लेने के लिए खरीद कर सकते हैं? लेकिन जो एक आदमी है जो एक खुशी कोई परेशान परिणाम या एक है जो एक दर्द है कि कोई उसके एवज में खुशी का उत्पादन से बचा जाता है कि आनंद लेने के लिए चुनता है के साथ गलती खोजने के लिए किसी भी अधिकार है
	}

	"japanese" {
	    しかし、私は喜びを糾弾し、痛みを褒め称えるという誤った考え方がどれほど生まれたのか、あなたに説明しなければなりません。私はあなたにシステムの完全な説明を与え、真の偉大な探検家の実際の教えを人間の幸福のマスター 喜びではなく、喜びを追求する方法を知らない人たちが合理的に痛みを伴う結果に遭遇するため、嫌いを拒否したり、喜び自体を避けたりしません。苦痛であることを愛したり、追求したり、 時には労苦と痛みが彼に何か大きな喜びをもたらすことができる状況が起こることがあるからです。 しかし、迷惑な結果をもたらさない喜びを楽しむことを選択した人、または結果として喜びをもたらさない痛みを避ける人と、間違いを見つける権利は誰にありますか
	}
    }

    if {$start == ""} {
	set p [math::random [string length $str($language)]]
	set rval "[string range $str($language) $p end][string range $str($language) 0 $p]"
    } else {
	set rval "[string range $str($language) $start end]"
    }

    if {$size != {}} {
	set rval "[lrange $rval 0 [incr size -1]]"
    }

    if {[info exist ::size] == 1} {
	put $rval
    } else {
	return $rval
    }
}


