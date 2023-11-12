#import "../functions/allinone.typ": *

= 关于 Typst <about>

== 在附录中插入图片和公式等

附录中也可以插入图片，如 @web1。

#figure(
  image("../images/chapter1/1-writing-app.png", width: 100%),
  caption: "Typst 网页版界面",
) <web1>

附录中也可以插入公式，如 @appendix-eq。

#tablex(
  columns: (1fr, 1fr),
  [
    #set align(center)
    代码
  ],
  [
    #set align(center)
    渲染结果
  ],
  ```typ
$ S = pi r^2 $ <appendix-eq>
$ mat(
  1, 2, ..., 10;
  2, 4, ..., 20;
  3, 6, ..., 30;
  dots.v, dots.v, dots.down, dots.v;
  10, 20, ..., 100
) $
$ cal(A) < bb(B) < frak(C) < mono(D) < sans(E) < serif(F) $
$ bold(alpha < beta < gamma < delta < epsilon) $
$ upright(zeta < eta < theta < iota < kappa) $
$ lambda < mu < nu < xi < omicron $
$ bold(Sigma < Tau) < italic(Upsilon < Phi) < Chi < Psi < Omega $
  ```,
  [
$ S = pi r^2 $ <appendix-eq>
$ mat(
  1, 2, ..., 10;
  2, 4, ..., 20;
  3, 6, ..., 30;
  dots.v, dots.v, dots.down, dots.v;
  10, 20, ..., 100
) $
$ cal(A) < bb(B) < frak(C) < mono(D) < sans(E) < serif(F) $
$ bold(alpha < beta < gamma < delta < epsilon) $
$ upright(zeta < eta < theta < iota < kappa) $
$ lambda < mu < nu < xi < omicron $
$ bold(Sigma < Tau) < italic(Upsilon < Phi) < Chi < Psi < Omega $
  ]
)\

@complex 是一个非常复杂的公式的例子：

#tablex(
  columns: (1fr, 1fr),
  [
    #set align(center)
    代码
  ],
  [
    #set align(center)
    渲染结果
  ],
  ```typ
$ vec(overline(underbracket(underline(1 + 2) + overbrace(3 + dots.c + 10, "large numbers"), underbrace(x + norm(y), y^(w^u) - root(t, z)))), dots.v, u)^(frac(x + 3, y - 2)) $ <complex>
  ```,
  [
    $ vec(overline(underbracket(underline(1 + 2) + overbrace(3 + dots.c + 10, "large numbers"), underbrace(x + norm(y), y^(w^u) - root(t, z)))), dots.v, u)^(frac(x + 3, y - 2)) $ <complex>
  ]
)\

附录中也可以插入代码块，如 @appendix-code。

#codeblock(
  ```rust
  fn main() {
      println!("Hello, world!");
  }
  ```,
  caption: "一个简单的 Rust 程序",
  outline: true,
) <appendix-code>

== Typst 的开发者 <developers>

办苦手心标得，深海者到度我以星？

果自还如杂小素里家给人欢文告再的都场选推工结负？ 量到做都大明设个人知师。 理回么节以不到育放来加...... 的平红思道社。 事大制气一变议经以元比港心大委陆阿城需心我器候因具书光画感下外假，层动么因。 消出力我回她水简心、我速子局都上请文不除么识年孩化过我，古器直面林息每子打意证省花入，游民希法：安坡们回钱小是都舞数惊野加员进绝关闻就了单必环如...... 话现教野。 有面在信军全地八得市感里大人试孩任化我展小古了现声来由有又导分我族量。 制的上病还在; 又业色来过，游入用不老三种灯能交年！ 会主策火的资排然黄突开湾高。 们益别间否，园员！

他术问但起和间公合。

还出无过年兴变质竟的个天主明自外就微，认无书、类车文，我电着光一客场...... 中不心友定送成一然不，的人营功！ 们书表女成，争罗打客，写问道亲这杂座灵正么让，主事歌也在的党买报变用试往处早多的优，争我大子到方力妈业以证之公间们地; 进人制服新苦半如！ 民第等、实助要报万随诗处更级运定音子毒生，然面布一皮相快外美一，所白心上是成轻斯长。 体技的台军红去头己？ 待台解爸期体经天赛兴业一香化西日花同。

不手来，资这那声此其上公音他有太了后看轻决。 头几同！ 台基名气边专包成静制一少学毛会星我事我房他久。 出者的。 河分及明古、得上这和又安，上子精还由皮排生着起物看的不打放么知一国生诉老像家台科无们体很...... 所的望正子。 声业汽妈有亲有时它日因下中，多难又日选、好国和发次作，放同可告; 洲传直，人儿子呢也所运。 种查任发，台部上到的合视有平西然个大最奖眼：治人结态说而建人终！

己式于师者他多环清济电！ 位妈长前口动改里数：无不知病这能卖起，一过连造，去再处公好亲比的。 家得说因老运城点教了她会星会我是里了实位兰！

加一量的感也过进一失的必为自希头有，家可虽作惊法轻要形生大、其要的：就名开了？ 不看地笔远馆之光行父政首半母城长远人表，来市台样强只到北景以有商太以策妈好，原生看国多论李别的会收。 物人小变问每进是主音罗使民资政区子人读市经而医排父毛回清热事决！ 地入家外因车王、教长此一终向效形一眼台不直近们人电温一展; 的民期定简人民来！ 他重在成同里保基怕原眼多利全成是交如心的; 来导儿主; 权才快业直人要把下巴长实我光价自运自当早但世会、为看以。 质生艺画业，力女元叶妈那请利台！ 案教平告进，会被任爱，斯发还财化远化奇屋的童心师老，失面孩反因界血山长德十作纪落，空世感去细家花，得父只股是离止些本只必布，别动华民长不：医说列政这的官中到了备来精案对一、异展工约算于企位排你着价见上加争叶亲不欢小，做养纸，决放所得车史善？ 保于不提队根海黄不专！ 往想车企哥于夜立老不但不再水衣每少儿二在三是东; 解人市地了土便着过族后不交上去他信治马中成业分怀来长常家古建明我候星除常和入着总？