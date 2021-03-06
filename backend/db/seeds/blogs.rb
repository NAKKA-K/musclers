user = User.first
last_user = User.last

blogs = [
  {
    thumbnail: 'https://cdn-ak.f.st-hatena.com/images/fotolife/t/takumasa39/20191126/20191126164819.png',
    user_id: user.id,
    title: '筋トレとジョギングをすると「筋トレの効果が減少する」',
    body: <<~EOS,
    「筋トレとジョギングをすると筋トレの効果が減ってしまうのは本当ですか？」

    　良く聞かれる質問ですが、現代のスポーツ科学はこう答えています。

    　「確かに筋トレとジョギングをすると筋トレの効果は減少する」

    　今回は、筋トレとジョギングをすると筋トレの効果が減少する科学的根拠（エビデンス）についてご紹介しましょう。トレーナーやスポーツ選手、ボディメイクで筋肉量を増やしながらダイエットしたい方は知っておくと良いと思います。


    ◆ 筋トレの効果を減少させる「干渉効果」とは？

        　ボディビルダーは重いバーベルを持ち上げられますが、フルマラソンは走れません。
        　マラソンランナーは重いバーベルを持ち上げられませんが、フルマラソンは走れます。

        　このように「筋力」と「持久力」というのは相反する運動能力であり、筋肉にはその運動に適応する「特異性」というものがあります。
        　ボディビルダーのように重いバーベルなどで高い収縮力を筋肉に与えると、それに適応するように筋力が増強され、筋肥大が生じます。
        　マラソンランナーのように長い距離を走ることは、低い収縮力で長く収縮できるように筋肉を適応させます。そのため、筋力増強や筋肥大はあまり生じません。
        　このように筋肉には与えられた運動条件に合わせて機能を適応させる特異的な性質があるのです。

        　しかし、いろいろな場面で筋力トレーニング（筋トレ）と持久力トレーニング（持久力トレ）の両方を取り入れることがあります。

        　例えば、ボディメイクのために筋肉量を増やしながら、ダイエットもしたいというときには、筋トレにジョギングやサイクリングなどの有酸素運動を追加して行うことがあります。

        　また、スポーツは筋力と持久力という相反する運動能力が必要になります。そのため、多くのスポーツのトレーニングでは筋トレと持久力トレを組み合わせたコンカレント・トレーニングが行われています。

        　しかし、ここに「落とし穴」があることをひとりの研究者が発見しました。

        　1980年、イリノイ大学のHickson博士は、20代の被験者を集めて、筋トレと持久力トレを組み合わせて行わせた結果、筋トレのみを行った場合よりも筋力増強、筋肥大の効果が低下することを世界ではじめて報告しました。
        　Hickson博士は、筋トレと持久力トレを組み合わせて行うと筋トレの効果が減少する（干渉が生じる）ことから、これを「干渉効果（interference effect）」と呼びました（Hickson RC, 1980）。

        　この報告をきっかけに「筋トレとジョギングを行うと筋トレの効果が減少する」ということが一般的にも言われるようになったのです。

    ◆ 干渉効果のメカニズムを知っておこう！

        　干渉効果のメカニズムは明らかになっていませんが、その要因として現時点では「残留疲労」と「AMPKの活性化」の2つが挙げられています。

        　ジョギングなどの持久力トレを行うとエネルギーのもととなる筋グリコーゲンが減少するとともに、微小な筋損傷が生じます。このような状態を「残留疲労」といいます。残留疲労が生じた状態で筋トレを行うと筋肉のタイプⅡ線維を多く動員することができなくなります。

        　筋力増強やパワーの増強は、高強度トレーニングや高速度トレーニングにより収縮力が強く、収縮速度の速いタイプⅡ線維を多く動員させることが有効になります。しかし、持久力トレによる残留疲労があるとトレーニングのパフォーマンスが低下して十分にタイプⅡ線維を動員できなくなります。これにより、筋力やパワーを増強させる効果が減少するとされています。

        　また、残留疲労はトレーニングの総負荷量も低下させます。

        　筋トレによる筋肥大の効果は、筋肉のもととなる筋タンパク質の合成作用が促進することによって生じます。この合成作用はトレーニングの総負荷量によって増大されます。総負荷量とはトレーニングの強度、回数、セット数を合わせた総量のことです。

        『筋トレによる筋肥大の効果は強度、回数、セット数を合わせた総負荷量によって決まる』

        　そのため、残留疲労により十分にトレーニングの総負荷量を得られないことは、筋タンパク質の合成作用を促進することができず、結果的に筋肥大の効果を減少させることにつながるのです。

        　また、分子生物学からも干渉効果のメカニズムがわかってきています。

        　筋タンパク質の合成を促進するスイッチになるのが「mTOR」という酵素です。筋トレをするとmTORが活性化することによって筋タンパク質の合成が高まります。

        　ジョギングを続けていくとだんだん息があがっていきますが、これはエネルギーであるATPを生み出すための酸素が少なくなっている状態（低酸素）を意味します。体内の酸素が少なくなるとAMPKという酵素が活性化します。AMPKはエネルギーを生み出すために糖の輸送や脂肪の酸化を促進します。しかし、それとともにAMPKはmTORの活性化を抑えてしまいます。

        　このAMPKによるmTORの抑制が筋タンパク質の合成を阻害し、筋肥大の効果を減少させることが示唆されているのです（Baar K, 2014）

        第１回はここまで、第２回までしばしお待ちを！

    EOS
  },

  {
    thumbnail: 'https://cdn-ak.f.st-hatena.com/images/fotolife/t/takumasa39/20191007/20191007115825.png',
    user_id: user.id,
    title: '太ると筋トレの効果が減ってしまう！？',
    body: <<~EOS,
    　筋トレでぽっちゃりしたお腹をムキムキのシックスパックにしたい！
    　たるんだお腹を見ながら、こう思って筋トレに励む方もいるでしょう。

      しかし、現実はそんなに甘くはありません。
      近年、太っている方には残念な研究結果がスポーツ科学のトピックスになっているのです。

    　「太っていると筋肉が増えにくく、筋トレしても効果が低くなる」

    　今回は、太ると筋トレの効果が減ってしまうという最新の研究報告をご紹介しましょう。

    ◆ 太ると筋タンパク質の合成反応が低下する

        　筋肉のもとである筋タンパク質はいつも合成と分解を繰り返しています。僕たちの筋肉量が維持されているのは筋タンパク質の合成される量と分解される量がつり合っているからです。

        　筋タンパク質の合成量は食事（タンパク質）を摂ると大きく増加します。その後、空腹になると分解量が増加します。この合成量と分解量が等しいことによって筋肉量が維持されているのです。

        　そのため、しっかりと朝食（タンパク質）を摂取して、1日の筋タンパク質の合成量と分解量を同等にすることが筋肉量を減少させないポイントになるのです。

        　しかし、太ると筋タンパク質の合成反応にある変化が生じてしまうことが報告されました。

        　「太ると筋タンパク質が合成されにくくなる」

        　2016年、イリノイ大学で行われた実験で、太り気味や肥満では、正常な体型に比べてタンパク質摂取による筋タンパク質の合成反応が低下し、合成量が少なくなることが示唆されました。

        　しかし、これに反対の研究結果も報告されています。

        　2019年、マーストリヒト大学病院で行われた実験では、太っても筋タンパク質の合成作用は変わらないことが示唆されたのです。

        　なぜ、このような異なる結果が生じたのでしょうか？

        　この問に対して、2019年に報告された肥満と筋タンパク質の合成反応についてまとめたレビューでは、「被験者の活動性」にその要因があると推察されています。

        　習慣的な運動は筋肉の合成反応を高めます。そのため、活動性が高い被験者を対象としたKouwらの報告では肥満であっても正常な体型と同じようにタンパク質摂取による筋タンパク質の合成率の増加が得られたと推察されています。

        　反対に、運動習慣のない活動性の低い場合、太ると筋タンパク質の合成反応が低下する可能性があるのです。

        　では、太ると筋トレしても筋タンパク質の合成反応は低くなるのでしょうか？

    ◆ 太ると筋トレによる筋タンパク質の合成反応も低下する

        　筋肉のもととなる筋タンパク質は、食事（タンパク質）を摂取すると合成量が増加し、空腹になると分解量が増加し、合成量と分解量がつり合っていることで筋肉量が維持されています。

        　では、筋肉量を増やしたいときはどうすれば良いのでしょうか？

        　もちろん、その答えは「筋トレとタンパク質の摂取」です。

        　筋トレを疲労困憊まですると、少なくとも24時間は筋タンパク質の合成感度が上昇します。その24時間で十分なタンパク質を摂取すると、筋タンパク質の合成量が大きく増加し、筋肥大が生じるのです。

        　これが、筋肉を増やしたいなら「筋トレしてタンパク質を摂取しよう」といわれる理由です。

        　しかしながら、太っていると筋トレ後のタンパク質の摂取による筋タンパク質の合成反応を低下させる可能性が報告されているのです。

        　これを報告したのもイリノイ大学です。

        　彼らの行った実験の結果から、肥満では筋トレ後のタンパク質摂取による筋タンパク質の合成反応が低下することが示唆されました。

        　いつもゴロゴロして活動性が低い肥満では、タンパク質を摂取しても筋タンパク質の合成反応が低下するだけでなく、一念発起して筋トレをしても筋肥大のための筋タンパク質の合成反応も低下することが示唆されているのです。

        　では、なぜ太ると筋タンパク質の合成反応が低下してしまうのでしょうか？

    ◆ 太ると筋タンパク質の合成反応が低下するメカニズム

        　2019年に肥満と筋タンパク質の合成反応についてまとめたレビューを報告したBealsらは、その要因として「インスリン抵抗性」と「慢性炎症」を挙げています。

        　僕たちが糖分の多い食品を食べても、膵臓から分泌されるインスリンというホルモンが血液中の糖（血糖）を細胞に取り込んでくれるため、血液中の糖の濃度（血糖値）は一定に保たれます。

        　しかし肥満になると糖の取り込みに関わるGLUT4の機能が低下し、インスリンによって糖を細胞内に取り込みにくくなってしまいます。これをインスリン抵抗性といいます。

        　インスリンは筋肉の毛細血管を広げる役割も担っています。筋トレ後にタンパク質を摂取し、消化されたアミノ酸を筋細胞に届けるためにはインスリンによる毛細血管の拡張が寄与します（Gavin TP, 2005）。しかしながらインスリン抵抗性が生じ、感受性が低下すると毛細血管が減少し、アミノ酸を筋細胞に届けづらくなることによって筋タンパク質の合成反応が低下するとBealsらは推察しています。

        　また、肥満になると内臓脂肪が増加し、抗炎症作用をもつマクロファージの活動性が低下することによって慢性的な炎症が生じます。慢性炎症は糖尿病や脂質異常症などの代謝異常の原因とされています。

        　慢性炎症は炎症性サイトカインを生成することによって、筋タンパク質の合成を促すタンパク質キナーゼ（mTOR）を抑制し、筋タンパク質の分解を促すユビキチン・プロテアソーム経路（UPP）を活性化させることが報告されています（Xia Z, 2017）。このような炎症性サイトカインの作用が筋タンパク質の合成反応の低下に寄与しているとBealsらは推察しています。

        　では、肥満であっても効果的に筋タンパク質の合成量を増加させるためにはどうしたらよいのでしょうか？

        　そこで推奨されているのが「コンカレント・トレーニング」です。

        　ジョギングなどの有酸素運動にはグリコーゲンの代謝を促進することによってインスリン抵抗性を改善させる効果が示唆されています。

　      　また有酸素運動は慢性炎症の原因である内臓脂肪の減少を促し、炎症性サイトカインの発生を防ぐことが示されています。さらに有酸素運動により炎症性サイトカインを抑制することで、筋タンパク質の分解に関与するUPPの活動を抑制することが明らかになっています。

        　『いつまでも若々しい筋肉を維持するためには筋トレだけじゃ不十分？』

        　このような効果をもつ有酸素運動と筋トレを一緒に行うコンカレント・トレーニングによって、インスリン抵抗性や慢性炎症を改善させながら、筋トレによる筋タンパク質の合成反応性を高められる可能性があるとBealsらは述べています。

        　このように近年の研究報告によって「太っていると筋肉が増えにくく、筋トレしても効果が低くなる」ことが示唆されているのです。

        　しかしながら、同じ研究グループからの報告が多いこと、縦断的な検証が行われていないこと、メカニズムの解明が不十分であること、エビデンスレベルの高いメタアナリシスなどが行われていないことから、今後のさらなる検証が必要です。現時点では、太ると筋トレの効果が減少する可能性があるという認識にとどめておくべきでしょう。

        　ただ、コンカレント・トレーニングはインスリン抵抗性や慢性炎症の改善だけでなく、体重の減量にも有効です。ぽっちゃりお腹が気になる方は、まずは有酸素運動と筋トレを合わせて行ってみるのも良いかもしれませんね。個人的には高強度インターバルトレーニング（HIIT）もオススメですが、その話は別の機会にしましょう。


    ◆ 参考文献
            Biolo G, et al. Increased rates of muscle protein turnover and amino acid transport after resistance exercise in humans. Am J Physiol. 1995 Mar;268(3 Pt 1):E514-20.

            Beals JW, et al.  Anabolic sensitivity of postprandial muscle protein synthesis to the ingestion of a protein-dense food is reduced in overweight and obese young adults. Am J Clin Nutr. 2016 Oct;104(4):1014-1022. Epub 2016 Sep 7.

            Kouw IWK, et al. Basal and Postprandial Myofibrillar Protein Synthesis Rates Do Not Differ between Lean and Obese Middle-Aged Men. J Nutr. 2019 Sep 1;149(9):1533-1542.

            Beals JW, et al. Altered anabolic signalling and reduced stimulation of myofibrillar protein synthesis after feeding and resistance exercise in people with obesity. J Physiol. 2018 Nov;596(21):5119-5133.

            Gavin TP, et al. Lower capillary density but no difference in VEGF expression in obese vs. lean young skeletal muscle in humans. J Appl Physiol (1985). 2005 Jan;98(1):315-21.

            Wåhlin-Larsson B, et al. Mechanistic Links Underlying the Impact of C-Reactive Protein on Muscle Mass in Elderly. Cell Physiol Biochem. 2017;44(1):267-278.

            Xia Z, et al. Targeting Inflammation and Downstream Protein Metabolism in Sarcopenia: A Brief Up-Dated Description of Concurrent Exercise and Leucine-Based Multimodal Intervention. Front Physiol. 2017 Jun 22;8:434.
    EOS
  },

  {
    thumbnail: 'https://cdn-ak.f.st-hatena.com/images/fotolife/t/takumasa39/20190930/20190930005528.png',
    user_id: user.id,
    title: '【牛乳vs牛肉　筋トレの効果を最大限にする食品について知っておこう！',
    body: <<~EOS,
    　筋トレのあとはプロテイン。

    　これをルーティンとしているトレーニーは多いと思います。
    　しかしながら、筋肉の成長は少なくとも筋トレ後24時間まで続くことが報告されており、プロテインだけではなく、朝、昼、晩の3食の食事からもタンパク質を摂取することが筋肥大の効果を最大化するポイントになります。

    『筋トレ後のタンパク質の摂取は「24時間」を意識するべき理由』
    『筋トレの効果を最大にするタンパク質の摂取パターンを知っておこう』

    　そのため、近年では食品の摂取による筋肥大への影響を調査した研究結果が報告されるようになり、スポーツ栄養学でも注目を集めています。
    　今回は、そのなかでも「牛乳 vs 牛肉」による筋肥大への効果についての研究報告をご紹介しましょう。
    　じつは、食品にはプロテインにはない他の栄養素による相乗効果が示唆されているのです。

    ◆ 注目されはじめた食品からのタンパク質摂取

        　筋肉のもととなる筋タンパク質は、いつも合成と分解を繰り返しています。僕たちの筋肉量が維持されているのは、筋タンパク質の合成される量と分解される量のバランスが釣り合っているからです。

        　しかし、家でゴロゴロしていたり、不摂生でタンパク質の摂取量が減ると、筋タンパク質の合成量が低下するため筋肉量がどんどん減ってしまいます。

        　逆に、筋トレをして、十分なタンパク質を摂取すると筋タンパク質の合成量が高まり筋肉量が増えます。

        　ここで大事なことは「筋トレだけでは筋タンパク質の合成量は増えない」ということです。筋トレをすると筋タンパク質の合成感度は上昇しますが、ここでタンパク質（アミノ酸）を摂取することによって、はじめて筋タンパク質の合成量が増加するのです。

        　そこで重要になるのが、筋タンパク質の合成量を最大化させるためには、どのようなタンパク質をどのくらいの量、頻度、タイミングで摂取すれば良いのか？ということです。

        　近年、注目されているのが牛乳や牛肉といった食品の摂取による筋タンパク質への合成効果なのです。

        　食品には食物相互作用があることにより、単離されたプロテインとは異なり、単純に含まれるタンパク質だけでは筋タンパク質の合成への効果を計ることはできないのです。

        　牛乳を摂取することによるインスリン反応、生理活性ペプチドおよびマイクロRNAの放出がタンパク質との相互作用を引き起こし、mTORを活性化することによって牛肉よりも早期に筋タンパク質の合成率を高めたと考察しています（Burd NA, 2015）。

        　トレーニング後の1〜2時間は筋タンパク質の合成感度がもっとも高いゴールデンタイムとされています。そのため、Burdらの結果をもとに考えると、トレーニング後1〜2時間でタンパク質を摂取するのであれば「牛肉よりも牛乳」ということになるでしょう。

        　今後、さらに筋タンパク質への食物相互作用の研究報告が積み重なることで、筋肥大の効果を最大化させる食品や調理方法などのレシピが作れるかもしれません。新たな研究報告に期待したいですね。


        ◆ 参考文献
            Burd NA, et al. Differences in postprandial protein handling after beef compared with milk ingestion during postexercise recovery: a randomized controlled trial. Am J Clin Nutr. 2015 Oct;102(4):828-36.

            Staples AW, et al. Carbohydrate does not augment exercise-induced protein accretion versus protein alone. Med Sci Sports Exerc. 2011 Jul;43(7):1154-61.

            van Vliet S, et al. Consumption of whole eggs promotes greater stimulation of postexercise muscle protein synthesis than consumption of isonitrogenous amounts of egg whites in young men. Am J Clin Nutr. 2017 Oct 4. pii: ajcn159855.

            Burd NA, et al. Food-First Approach to Enhance the Regulation of Post-exercise Skeletal Muscle Protein Synthesis and Remodeling. Sports Med. 2019 Feb;49(Suppl 1):59-68.

            Wilkinson SB, et al. Consumption of fluid skim milk promotes greater muscle protein accretion after resistance exercise than does consumption of an isonitrogenous and isoenergetic soy-protein beverage. Am J Clin Nutr. 2007 Apr;85(4):1031-40.

            Buffière C, et al. In the elderly, meat protein assimilation from rare meat is lower than that from meat that is well done. Am J Clin Nutr. 2017 Nov;106(5):1257-1266.
    EOS
  },

  {
    thumbnail: 'https://cdn-ak.f.st-hatena.com/images/fotolife/t/takumasa39/20190922/20190922145739.png',
    user_id: last_user.id,
    title: '筋トレ後の水風呂が禁肥大の効果を減少させる？',
    body: <<~EOS,
    　筋トレをしたあとの火照った体を水風呂で冷やすと気持ちいいですよね。
    　ところが、近年、筋トレ後の水風呂が筋肥大の効果を減少させることを示唆した研究結果が報告され、スポーツ科学界隈でトピックスになっているのです。

    　今回は、筋トレ後の水風呂が筋肥大の効果を減少させる研究報告とともに、そのメカニズムまで考察していきましょう。

    ◆ 確かに筋トレ後の冷水浴は効果的

        　筋トレのあとに誰もが経験するのが「筋肉痛」です。筋肉痛はトレーニング後に遅延して生じることから「遅発性筋肉痛（DOMS）」と言われています。実は、筋肉痛のメカニズムはまだ完全には明らかになっていないのですが、乳酸、筋痙攣（こわばり）、結合組織損傷、筋肉損傷、炎症といった5つの要因の関与が示唆されています（Cheung K, 2003）

        　冷水浴（20度以下の水風呂）の効果には、筋トレ後の筋肉の炎症や筋肉損傷を改善させ、筋肉痛を改善することによって、筋力の回復に寄与することが示唆されています（Versey NG, 2013）。

    ◆ 冷水浴は筋肥大の効果を減少させる

        　僕たちの筋肉量は、筋肉のもととなる筋タンパク質の合成される量と分解される量のバランスによって変化します。筋タンパク質の合成量が分解量と釣り合っていると筋肉量は維持されます。

        　では、筋肥大を生じさせるにはどうしたら良いのかというと、筋タンパク質の合成量を分解量よりも十分に大きくすれば良いということになります。

        　そこで重要になるのが「筋トレ」と「タンパク質の摂取」です。

        　筋トレによって筋タンパク質の合成感度が高まったところで、筋タンパク質の材料となるタンパク質（アミノ酸）を摂取するといっきに合成量が増大し、分解量を上回ることによって筋肥大が生じるのです。

        　これが筋肥大が生じるメカニズムです。

        　そして、筋トレ後の冷水浴は、「筋タンパク質の合成感度の上昇を抑える」ことが示唆されているのです。

        　筋トレ後の水風呂は短時間にとどめて、マッサージかフォームローラーを使用したアフターケアを行っても良いかもれませんね。
        　
    EOS
  },

  {
    thumbnail: 'https://cdn-ak.f.st-hatena.com/images/fotolife/t/takumasa39/20190912/20190912231111.png',
    user_id: last_user.id,
    title: 'スクワットで「膝を爪先より前より出し手はいけない」という間違え',
    body: <<~EOS,
    スクワットでは「膝をつま先より前に出さない」ということが現在でも常識とされています。

    しかし、その後の検証によってArielの研究は被験者が少なく（3名のデータ）、ストレスが生じる部位が明らかにされていないなど、いくつもの誤りとともに、再現性の乏しい結果であることが指摘されるようになりました（Hartmann H, 2013）。

    ### **「スクワットで膝をつま先よりも前に出しても膝関節へのストレスは少ない」**
　  ### **「逆に、膝を前に出さないことは腰を痛める要因になる」**

    現代のスポーツ科学では、スクワットのある条件下で膝をつま先よりも前に出さないようにすると、腰に大きな負担が生じることが示唆されているのです。


    ## ◆ 絶対に忘れてはいけないスクワットの原則
    スクワットには大事な原則があります。
    「足の真ん中（ミッドフット）の上にバーベルが位置し、ミッドフット上でバーベルを上下させること」

    ## ◆ 膝をつま先より前にだすと腰を痛める
    スクワットにより生じる力（トルク）を計測してみると、膝をつま先より前に出さないフォームでは、股関節の伸展トルクが増加し腰部への負担が高くなることが示唆されたのです（Fry AC, 2003）。
    また、チューリッヒ・バイオメカニズム研究所のListらは、同じようにハイバー・スクワットの際に膝をつま先より前に出さないフォームにおける胸腰椎への影響を調査しました。
    その結果、膝をつま先より前に出さないフォームでは、バーベルの重量が重いほど胸腰椎の前屈が大きくなり、腰椎の生理的な前弯が減少する（フラットになる）ことが示されたのです（List R, 2013）。
    このような腰椎の前弯の減少は、腰部の椎間板の大きな剪断力を生み、椎間靭帯の大きな張力を発生させることが報告されています（Potvin JR, 1991）。

    これらの結果から、ハイバー・スクワットで膝をつま先より前に出さないフォームは、腰部への過度な負荷を生じさせ、腰を痛める要因になることが示唆されているのです。
    これがハイバー・スクワットで膝がつま先より前にでないようにすると腰を痛めるメカニズムです。

    Listらは、トレーナーはこのような知見を知り、スクワットで「膝をつま先より前に出してはいけないと指導すべきでない」と警鐘を鳴らしています。

    ### **「ハイバー・スクワットで膝をつま先より前に出さないことは、腰を痛める要因になる」**

    現代のスポーツ科学では、このような知見が報告されており、まだ高いレベルのエビデンスはありませんが、生体力学の分析においても腰部に過度な負荷が生じることが示されています。

    ハイバー・スクワットで腰が痛くなる場合には、膝をつま先より前に出すフォームを意識すると良いかもしれません。
    また、腰に痛みがなくても、腰痛を予防するためにハイバー・スクワットでは「膝をつま先よりも前に出す」ように行うべきでしょう。
    ハイバー・スクワットで大殿筋への負荷を目的にして体幹を深く前傾させているのであれば、ローバー・スクワットで行ったほうが腰からバーベルまでの距離が短くなり、腰部への負担を減らして大殿筋への負荷を狙うことができます。
    スクワットで大事なことは、バーベルがミッドフット上にあるという原則です。この原則に従ってハイバーやローバーのスクワットを行うと、自然とそれぞれの最適なフォームになります。
    そこに**「膝をつま先より前に出してはいけない」**ということは関係ないのです。
    EOS
  },

  {
    thumbnail: 'https://cdn-ak.f.st-hatena.com/images/fotolife/t/takumasa39/20190801/20190801125359.png',
    user_id: last_user.id,
    title: 'コーヒーはダイエット効果がある？',
    body: <<~EOS,
 　   コーヒーは健康に良い飲みものなのでしょうか？

    　2017年になると、コーヒーは発がん性を高めるどころか、がんのリスクを減少させることが続けて報告されています（Poole R, 2017、Grosso G, 2017）。これらの報告をもとに、ハーバード公衆衛生大学院の見解においても、コーヒーの摂取は、がんのリスクを軽減させ、それだけでなく2型糖尿病や心臓病、うつ病などのリスクを減少させることが示唆されています。

    　そして2019年6月、世界で初めて「コーヒーによるダイエット効果」についてのメタアナリシスの結果が報告されました。

    　今回は、コーヒーによるダイエット効果の最新エビデンスを示す研究報告をご紹介しましょう。

    ◆ コーヒーによるダイエット効果の世界初のエビデンス

        　コーヒーにはダイエット効果があるのでしょうか？

        　この問いに答えるために、2000年以降からコーヒーによるダイエット効果についての検証が始まりました。

        　2019年6月、これまでに検証されたコーヒーとダイエット効果についての12の研究報告をもとにメタアナリシスが行われ、こう結論づけました。

        　「コーヒーにはダイエット効果があり、とくに男性に効果的である」

        　では、なぜコーヒーを飲むとダイエット効果があるのでしょうか？

        　コーヒーには、カフェイン以外に1000もの化合物を含まれており、健康に有益とされるポリフェノールやクロロゲン酸などが注目されています（Higdon JV, 2006）。

    ◆ コーヒーによるダイエット効果のメカニズム

        　研究者たちはコーヒーに含まれる「クロロゲン酸」がダイエット効果に寄与していると推察しています。

        　クロロゲン酸は、コーヒー豆に 5〜10%含まれており、その含有量はカフェイン（1〜2%） よりも多いとされています。コーヒーの抽出時間が長すぎたときに感じる雑味がクロロゲン酸によるものといわれています。

        　クロロゲン酸を用いた動物実験では、肥満のマウスに摂取させることによって、内臓脂肪量、脂肪組織のトリグリセリド含有量を減少が認められています（Cho AS, 2010）。また、グルコース（糖）の吸収能力を80%減少させることが示唆されています（Welsch CA, 1989）。

        　このような実験結果から、Leeらはクロロゲン酸のもつ抗肥満効果がコーヒー摂取によるダイエット効果に寄与していると推察しているのです。

        　しかしながら、Leeらのメタアナリシスでは、観察研究をもとにしていること、研究数が少なく、また研究間のデータのバラツキ（異質性）が大きいことなどから、今後、改めてメタアナリシスを実施することが必要になるでしょう。あくまでも現時点でのエビデンスとして、コーヒーの摂取はダイエット効果にプラスになると解釈しておくのが良いと思われます。

        　また、今回のメタアナリシスではコーヒーのダイエットに最適な摂取量は明らかになっていません。多くの研究がカップ3杯の摂取量で検証していますが、最大6杯の摂取量で検証したものまであります。そのため、現時点ではコーヒーの摂取量が多いほどダイエット効果があるということになりますが、最適な摂取量については今後の検証が待たれます。

        　注意点としては「妊娠中はカップ2杯程度にとどめる」ということです。妊娠中にコーヒーを大量に摂取すると、カフェインによる胎児の低出生体重に関与することが示唆されており（Grosso G, 2017）、妊娠中の大量摂取は控えるべきでしょう。

        　コーヒーには、がんや糖尿病、心臓病やうつ病などのリスクを減少させるエビデンスが報告されています。また、健康だけでなく、筋トレのパフォーマンスも高めることが示唆されています。

        　『コーヒーが筋トレのパフォーマンスを高める〜その科学的根拠を知っておこう』

        　そして今回、世界で初めてコーヒー摂取によるダイエット効果のエビデンスが報告されました。まだまだ知見が少なく、今後の再検証や最適な摂取量などの検証を見守っていく必要はありますが、コーヒー好きにとっては嬉しいニュースになりますね。

    EOS
  },

  {
    thumbnail: 'https://cdn-ak.f.st-hatena.com/images/fotolife/t/takumasa39/20190718/20190718132926.png',
    user_id: last_user.id,
    title: 'テレビをつけたままだと太る',
    body: <<~EOS,
    　「寝るときは部屋を暗くしていますか？」

    　彼女はこう答えます。

    　「よくテレビをつけたまま寝ています」

    　すると、Parkは頷きながら言いました。　

    　「あなたのダイエットが続かない理由がわかったかもしれません」

    　2019年6月、雑誌JAMA Internal Medicineに興味深い研究結果が報告されています。

    　「睡眠中の部屋の明かりと肥満のリスクには関連がある」

    　今回は、この最新の研究報告をご紹介しましょう。


    ◆ 明るい部屋で寝ると太る研究結果

        　アメリカ・国立衛生研究所のParkらは、睡眠中の部屋の明るさと肥満のリスクとの関係について検証するために、10年間にもおよぶ追跡調査を行いました。そして調査結果からこのように結論づけています。

        　「睡眠中の人工的な光の照射は、肥満のリスクを高める」

        　Parkらは35〜74歳までの女性43,722名を対象に、睡眠中の部屋の明るさを聴取し、明るさの程度にもとづいて4つのグループに分けました。

        　  ①部屋の明るさなし（真っ暗）
        　  ②部屋の小さな明るさあり（常夜灯）
        　  ③部屋に外光が入る（街路灯や車のライトなど）
        　  ④部屋が明るい（照明またはテレビがついている）

        　調査前に被験者の身長や体重、ウエストやヒップの周径を計測し、そこから肥満リスクの指標となる体格指数（BMI）、ウエスト周径、ウエストとヒップの比率、ウエストと身長の比率を設定しました。その後、10年間の追跡調査を行い、部屋の明るさと肥満のリスク指標の変化を検証しました。

        　その結果、部屋の明るさの程度と肥満のリスク指標の増加には正の関連が認められ、睡眠中の部屋が明るいほど、肥満のリスクが高くなることが示唆されました。

        　さらに、照明やテレビがついた明るい部屋の場合、5 kg以上の体重増加、10％以上のBMI上昇、肥満の発生との高い関連が認められました。

        　これらの結果から、睡眠中の部屋の明かりは肥満リスクの増加に関連していることが示され、とくに照明やテレビといった人工的な光が照射されていると肥満リスクがより高まることが示唆されたのです。

        　では、なぜ明るい部屋で寝ると太りやすくなるのでしょうか？

    ◆ 明るい部屋で寝ると太るメカニズム

        　それは「睡眠不足」と「サーカディアン・リズム（概日リズム）」です。

        　数百万年前の旧石器時代から、ヒトは太陽の光のもとで生活をしてきました。近代になると電球などの人工照明が発明され、夜間でも作業が行えるようになり、経済的な繁栄をもたらしました。しかし、人工照明は僕たちの覚醒時間を長くするとともに睡眠時間を減らします。その結果、現代の睡眠不足の問題が生じているのです（Lunn RM, 2017）。

        　そして、部屋を明るくしたまま眠ることは部分的な睡眠不足を生じさせます。

        　睡眠不足は「食欲を増進させる」ことが示唆されています。

        　睡眠不足になるとレプチンやグレリンといった食欲調整ホルモンのバランスが崩れるとともに、脳の報酬系を活性化することが報告されています。

        　「もっと食べたい」という欲求は、1日の摂取カロリーが増加させ太ることが示唆されています。

        　これが睡眠不足によって太るメカニズムであり、明るい部屋で寝ることにより睡眠不足となり、肥満のリスクを高めるメカニズムともされています。

        　また、明るい部屋で寝ることはサーカディアン・リズムにも影響を与えます。

        　夜になると眠りにつき、朝になると目覚めるように、地球上の多くの生物が24時間周期のリズムをもっています。こうしたリズムは「サーカディアン・リズム」と呼ばれ、一般的には「体内時計」と言われています。

        　サーカディアン・リズムの乱れは、レプチンやグレリンといった食欲調整ホルモンのバランスを崩します（Fonken LK, 2014）。これによって食欲が増進され、太りやすくなるのです。

        　人工照明による明るい部屋で寝ることは、メラトニンの分泌を抑え、サーカディアンリズムを乱し、食欲調整ホルモンのバランスが崩れることによって食欲が増進されるのです。

        　これが明る部屋で寝ると太るもうひとつのメカニズムです。

        　このようなメカニズムによって蛍光灯やテレビなどの人工照明による明るさが肥満のリスクを高めることに寄与していると推察し、肥満を予防するためには就寝時に照明やテレビを消して、部屋を暗くすることが重要であると述べています。

        　ダイエットの一般的な戦略には運動と食事があります。そして、そのベースとなるのが「睡眠」です。ダイエットが続かないときには、睡眠時間とともに「部屋の明るさ」という睡眠環境も一緒に見直してみると良いかもしれませんね。


    EOS
  },

  {
    thumbnail: 'https://cdn-ak.f.st-hatena.com/images/fotolife/t/takumasa39/20171116/20171116141802.png',
    user_id: last_user.id,
    title: '筋トレは病気による死亡率を減らしてくれる',
    body: <<~EOS,
    　効率的で効果的な健康法はありますか？

    　この問に現代のスポーツ医学はこう答えます。

    　「黙って筋トレをしなさい」

    ◆ 筋トレと病気による死亡率についての大規模調査の結果

        　2016年、ミシシッピ大学のDankelらは、筋トレが病気による死亡率を減少させることを報告しました。

        　20歳以上の男女8,772名を対象に、平均6.7年の追跡調査を行い、また、1週間のトレーニングの頻度による影響についても調査しました。

        　その結果、トレーニングを継続的に行っている場合、トレーニングをしていないものに比べて、「すべての病気の死亡率が23%減少する」ことが示されました。

        　また、この死亡率の減少は、1週間に2〜3回の頻度でトレーニングをしている場合に有効であり、それ以上（例えば週5回）の頻度では、死亡率の減少効果が低い（プラトーになる）ことが明らかになりました。

        　この結果から、筋トレは病気による死亡率を23%減らすとともに、週2〜3回のトレーニングがもっとも効果的であることが示唆されたのです（Dankel SJ, 2016）。

        　しかし、これらの報告は大規模な観察研究によるものであり、エビデンスレベルはそこまで高いものではありませんでした。

    ◆ 筋トレが病気による死亡率を減少させる最新エビデンス

        　ひとことでエビデンスといっても、研究手法によってそのレベルは異なります。エビデンスにはレベルの低いものもあれば、高いものもあるということです。その中で、もっとも高いレベルのエビデンスを示す研究手法が「メタアナリシス」です。

        　なぜ、メタアナリシスがもっともレベルが高いのかというと、メタアナリシスは、これまでに報告された一つ一つの研究結果をまとめて、全体としてどのような傾向があるかを統計的に解析するからです。

        　そして、2019年5月、筋トレが病気による死亡率に与える影響について解析した世界初のメタアナリシスが報告されたのです。

        　全米でもっとも優れた病院のひとつであるメイヨー・クリニックのSaeidifardらは、筋トレと病気による死亡率との関連を調査した11件の研究報告、約37万人を対象にメタアナリシスを行った結果をこう示しています。

        　「筋トレはすべての病気による死亡率を21%減少させる」

        　1週間に2回程度のトレーニングを行っている場合は、すべての病気による死亡率が21%減少し、より頻度の高い2〜5回のトレーニグでは14%減少し、5回以上では死亡率の減少は認められませんでした。

        　また、筋トレにより心臓病による死亡率を17%減少させることも示されています。

        　さらに、筋トレに有酸素運動を追加するとすべての病気による死亡率の減少は40%まで増加することがわかりました。

        　これらの結果から、37万人という大規模なメタアナリシスの結果においても、週に2回程度の筋トレはすべての病気による死亡率を2割減少させることが示されているのです。Saeidifardらは、筋トレが病気による死亡率を減少させる高いレベルのエビデンスが示されたと述べています。

        　では、どうして筋トレをすると、病気による死亡率を減少させることができるのでしょうか？

    ◆ 筋トレが病気による死亡率を減少させるメカニズム

        　脳卒中や心臓病など、多くの病気の発症リスクを高める要因に「糖尿病」と「慢性炎症」があります。スポーツ医学では、筋トレによって糖尿病や慢性炎症を改善する効果が示唆されています。

        　僕たちが糖分の多い食品を食べても、膵臓から分泌されるインスリンというホルモンが血液中の糖（血糖）を細胞に取り込んでくれるため、血液中の糖の濃度（血糖値）は一定に保たれます。

        　しかし、インスリンが十分に働かなくなると、細胞に糖を取り込むことができず、血糖値が増えてしまいます。このようにインスリンの働きが悪くなることを「インスリン抵抗性」といいます。インスリン抵抗性が高くなると、血糖の取り込みが不十分となり、血糖値が上昇して糖尿病になってしまいます。そして、このような状態が長期間つづくと、血管が傷つき、脳卒中や心臓病になるリスクが高くなるのです。

        　そして、筋トレはインスリン抵抗性を改善することによって、糖尿病（2型）の改善に寄与します。

        　筋トレをすると日常生活の活動量が増加し、消費エネルギー量が増えます。食事も高蛋白食を意識するようになり、摂取エネルギー量が減少します。これにより総エネルギーの収支がマイナスとなり、内臓脂肪や腹部の皮下脂肪の減少につながります。またトレーニングにより筋肉量が増加し、脂肪量の減少と合わせてインスリンの抵抗性を改善させます。これにより糖尿病が改善すると考えられています。

        　筋トレが病気による死亡率を減少させる要因として、筋トレによる糖尿病や慢性炎症の改善が寄与していると推察しています。

        　これまでも筋トレにはすべての病気による死亡率を減少させることが報告されてきました。そして、今回、Saeidifardらが行った世界初のメタアナリシスの結果においてもその効果が認められたのです。

        　効率的で効果的な健康法はありますか？

        　この問に現代のスポーツ医学はこう答えています。

        　「黙って筋トレをしなさい」

        　この答えは、筋トレが病気による死亡率を2割減らすという明確なエビデンスにもとづいているのです。

    EOS
  },

  {
    thumbnail: 'https://cdn-ak.f.st-hatena.com/images/fotolife/t/takumasa39/20190603/20190603114933.png',
    user_id: last_user.id,
    title: 'イケメン出ない僕たちが筋トレをすべき理由',
    body: <<~EOS,
    　なぜ、「筋トレをするとモテる」と言われるのでしょうか？
    　この問に、進化の過程からヒトの心のありかたを学問する進化心理学は、こう答えています。

    　「筋肉量の多い男性は、病気に強く、健康的だから」

    　女性が一生に産める子どもの数は限られます。そのため、女性は数少ない子どもに健康的な遺伝子を受け継がせ、子どもが成長するまで十分な経済的資源を与えたいと考えます。
    　
    　男性の身体の筋肉量が多いことは、健康的な遺伝子をもち、経済的資源を与えることができるシグナルを女性を無意識に感じ取り、「魅力的」と感じるのです。

    　これが筋トレをするとモテると言われる理由です。

    　このような科学的根拠を糧に、多くのトレーニーが日々の厳しいトレーニングに励んでいます。しかし、現実はそう甘くはありません。

    　「女性が男性を評価するのは身体ではなく「顔」である」

    　え・・・・！

    　今回は、筋トレをするとモテる、ということを身体の筋肉量ではなく、顔の側面から考察していきましょう。


    ◆ 女性の評価は「身体＜顔」である残酷な事実

        　女性が男性を魅力的に感じる身体的特徴は、身体の筋肉量だけではありません。顔も重要なシグナリングの部位になります。

        　魅力的な顔とは、左右の対称性、目や鼻などの位置や、肌の質感がポイントとされており、このような特徴から女性は男性の「健康度」を感じ取るとされています。

        　淡麗な顔で肌が綺麗なのは、健康的であることを示すシグナルになるのです。これが女性がイケメンを好きになる理由です。

        　では、女性は男性の顔と身体のどちらの身体的特徴を高く評価するのでしょうか？

        　アメリカ・テキサス大学オースティン校のJaimeらは、20歳前後の大学生の男女375名を集め、ある調査を行いました。

        　机の上には2枚の写真が置いてあります。1枚は男性で、もう1枚は女性の写真です。これらの写真は顔の部分と身体の部分を別々の紙で覆われています。

        　Jaimeらは、女性の被験者に対して、短期的に付き合う場合と、長期的に付き合う場合において、顔と身体のどちらを確認したいのかを問い、確認したい部位の紙を剥がすように指示しました。

        　その結果、短期的に付き合う場合は、女性の66%が顔を確認し、長期的に付き合う場合では、その割合は73%にまで上昇しました。

        　女性は、短期的にも長期的にも付き合う男性の評価は、身体よりも「顔」であることが示唆されたのです（Jaime C, 2010）。女性には、身体の筋肉量よりも「顔」が重要なシグナルになるのです。

        　この研究結果は、「筋トレしたら少しはモテるようになるかな」と下心をもっているトレーニーに残酷な事実を突きつけています。

        　しかし、まだ諦めてはいけません。

        　なぜなら、筋トレは身体だけでなく、「顔」も変えてくれる可能性があるのです。


    ◆ 筋トレをすると「男らしい顔」になる

        　SNSを見ていると、ときどき筋トレのビフォー・アフターの写真をのせている男性を目にします。このとき、ガリガリの身体から筋肉質に変わった身体だけでなく、なんとなく顔つきも男らしくなっているように思うことはありませんか？

        　女性が男性の顔を評価する特徴のひとつに、この「男らしさ」があります。

        　セント・アンドルーズ大学のLeiらは、身体の筋肉量の異なる男性50名の顔写真をもとにして、筋肉量のレベルに応じて合成された顔写真を二次元（2D）、3次元（3D）でそれぞれ5枚づつ作成しました。

        　これらの写真を被験者である20前後の女性に見せて、男らしさを7段階で判定させました。

       　 その結果、2Dでも3Dでも、身体の筋肉量が多いほど、男らしさが高まることが示されたのです。

        　この結果は、女性が男らしいと判断する顔は、身体の筋肉量を反映していることを示唆しています。活動的な男性ほど、身体だけでなく、顔の筋肉の量や分布が変化し、それを女性は「男らしい」と無意識に判断すると推察されています。つまり、筋トレは身体の筋肉量だけでなく、顔だちも「男らしい顔」に変える可能性があるのです。

        　では、女性は男らしい顔に魅力を感じるのでしょうか？

        　次にLeiらは、女性の被験者に、同じように筋肉量の異なる男性の顔の合成写真を見せ、短期的に付き合う場合と長期的に付き合う場合において、どの顔が良いかを選別させました。

    　　　その結果、短期的にも長期的にも、体格指数が高く、身体的な筋肉量の多い「男らしい顔」が選ばれました。しかし、長期的に付き合う場合ではその程度は減少を示しました。

    　　　この結果から、女性は男らしい顔を魅力的に感じることが示唆されました。男らしい顔は、身体的な筋肉量を反映しており、健康的を示すシグナルになるのです。しかし、その魅力の度合いは短期や長期といった付き合う期間の文脈によって異なることも示唆されました。

    　　　女性は短期的に付き合う場合は、男らしい顔をより高く評価する傾向にありますが、長期的に付き合う場合は、そこまで評価しない傾向があるのです。

    　　　この傾向の要因について、Leiらは「テストステロン」を挙げています。

    　　　高いテストステロン値は、男らしさを示します。しかし、テストステロン値の高い男性は結婚する可能性が低く、離婚する可能性が高いことが報告されています（Booth A, 2000）。女性は、これを無意識に感じ取り、テストステロン値の高い男らしい顔の男性を長期的なパートナーとしては不適切だと判断しているとLeiらは推察しています。

    　　　筋トレをして身体の筋肉量を増やし、男らしい顔になることは、女性との短期的な付き合いにおける魅力を高めてくれるかもしれません。しかしながら、男らしい顔であればあるほどモテるのかというと、話はそう簡単ではないのてす。


    ◆ 女性が評価する男らしい顔は二次関数にもとづく

        　イギリス・グラスゴー大学のIrisらは、男性の顔写真50枚と女性の顔写真68枚をもとに合成された同一の男性の顔写真28枚を作成しました。28枚の顔写真は「男らしい度合い」別に合成されており、男らしさ順に、女性らしい顔を-100%とし、男女平均的な顔を0%、もっとも男性らしい顔を+200%としてスケール化して並べられました。

        　そこで563名の女性を対象に、好みの顔写真を選ばせたところ、興味深い結果が得られたのです。

    　　　女性が評価する顔写真を集計してみると、もっとも女性らしい顔の評価は低く、男らしい顔になるほど評価は高くなりました。しかし、あるポイントを超えると、その評価は減少しました。

        　この結果から、女性の好む男らしい顔は「二次関数」にもとづくことが示唆されたのです。女性は、女性らしい顔や男らしすぎる顔を好まず、適度に男らしい顔を好む傾向があるのです。これは、男性の身体の筋肉量にも同じような傾向が認められています。　

        　UCLAの女性（平均19歳）を対象に、筋肉量が異なる男性の体格が描かれたシルエットを見せて魅力的な体格を選択させた結果、筋肉量の多い体格ほど魅力的に感じることが示されましたが、同時に筋肉量が多すぎると逆に魅力が減少してしまうことも示されました。

        　なぜ、男らしすぎる顔や、身体の筋肉量が多すぎると魅力が低下してしまうのかというと、その答えも「テストステロン」にあります。

        　テストステロンの増加は男らしさを高めますが、過度に増えすぎると失ってしまうものがあります。それが「免疫機能」です。

        　テストステロンの過剰な分泌は、免疫機能を低下させることが報告されています（Lassek WD, 2009）。男らしい顔や筋肉量の多い身体は、テストステロンが高く魅力的に映りますが、過度になると免疫機能の低下に伴う感染症のリスクが高まり、女性はこれを「健康的でない＝魅力的でない」と判断すると推察されています。

        　これが女性が好む男らしい顔や、身体の筋肉量が「二次関数」にもとづく理由です。女性には、ある程度の男らしい顔と、ある程度の筋肉質な身体がもっとも健康的であり、もっとも魅力的に映ることが示唆されているのです。

        　生後6ヶ月の女の子の赤ちゃんに淡麗な顔だちの男性の顔写真と、そうでない顔写真を見せると赤ちゃんは淡麗な顔立ちの顔写真を好みます（Rubenstein AJ, 1999）。このことから、女性の脳には生得的にイケメンを好むプログラムがインストールされていることが示唆されています。

        　では、イケメンでない僕たちはどうしたら良いのでしょうか？

        　女性の脳には男らしい顔にも反応するプログラムがインストールされている可能性があります。筋トレは僕たちをイケメンにはしてくれません。しかし、筋トレに励むことによって男らしい顔にはなれるのです。



    EOS
  },

  {
    thumbnail: 'https://cdn-ak.f.st-hatena.com/images/fotolife/t/takumasa39/20190328/20190328142531.png',
    user_id: user.id,
    title: '筋トレをすると「頭がよくなる」',
    body: <<~EOS,
    「なぜ、世界のエグゼクティブは仕事の前に筋トレをするのでしょうか？」

    「筋トレに仕事の効率を高めるような効果があるのでしょうか？」

    確かに、PayPalのCFOであるジョン・レイニーは、早朝のバーベルトレーニングがその日の仕事の効率を高めると言い、元イギリス首相のマーガレット・サッチャーや、ウォルトディズニーCEOのロバート・アイガーらも早朝のトレーニングが仕事へのエネルギーを高めてくれると述べています。
    しかしながら、このときは編集者さんの質問に答えるための科学的根拠（エビデンス）を示す知見を持ち合わせていませんでした。

    ところが、本を書き終えた3月、この質問のひとつの答えになるエビデンスが報告されたのです。

    ### **「筋トレをすると頭が良くなる（認知機能が高まる）」**

    今回は、筋トレをすると認知機能が高まるという最新の研究報告をご紹介しましょう。


    ## ◆ 継続的な筋トレが認知機能を高める
    仕事ができる人は、その仕事の目的を明確にして、達成するための計画を立て、修正しながらも効率的に行動することができます。このような能力を「遂行機能（あるいは実行機能）」と言います。

    また、会議では、多くの情報を得ながら、同時に処理をして仕事の方針を決定しなければなりません。このような情報の保持と処理を同時に行う能力を「ワーキングメモリ（作業記憶）」と言います。
    さらに、仕事では多くの困難に直面します。そのときには柔軟に代替案や解決案を提示しなければなりません。このような能力を「認知の柔軟性」と言います。

    難しい作業を効率的に行い、物事を適切に判断し、困難な場面で柔軟に対応するためには、遂行機能やワーキングメモリ、認知の柔軟性といった能力が必要であり、このような認知機能を高いレベルで発揮できる人が「仕事のできる人」なのです。

    そして、最新のスポーツ科学や脳科学は、筋トレがこのような認知機能に与える効果について、こう述べています。

    ### **「筋トレは、遂行機能やワーキングメモリ、認知の柔軟性などの認知機能を高める」**

    これまで、脳の認知機能の向上には、ジョギングなどの有酸素運動による効果が示されてきました。
    2010年、これまでに報告されたウォーキングやジョギングによる認知機能への影響を調査した29の研究報告をまとめて解析したメタアナリシスでは、1ヶ月以上の有酸素運動が遂行機能や情報処理の速度、記憶の向上に寄与することが示されています（Smith PJ, 2010）。

    また、有酸素運動による認知機能への即時的な効果を検証したメタアナリシスでは、1回の有酸素運動を行うことによって、即時的に遂行機能などの認知機能が高まることが示唆されています（Ludyga S, 2016）。
    このように、有酸素運動は長期的にも、即時的にも認知機能を高める効果が示唆されており、エビデンスが積み重ねられているのです。

    そして、近年では筋トレによる認知機能への効果のエビデンスも示され始めています。
    2018年、オーストラリア・キャンベラ大学のノーザイらは、50歳以上の被験者を対象に行われた継続的な有酸素運動や筋トレによる認知機能への影響を解析したメタアナリシスを報告しました。
    39の研究報告をまとめて解析した結果、筋トレは遂行機能（SMD：0.49）やワーキングメモリ（SMD：0.49）の認知機能の向上に寄与することが示され、有酸素運動だけでなく、筋トレを継続的に行うことによっても認知機能が高まることが示唆されました。

    しかしながらノーザイらの報告は、対象者の年齢が50歳以上に限定されていたため、若年者に一般化することはできません。そこで、幅広い年齢層を対象に、筋トレによる認知機能への効果を検証したのがドイツ・ゲーテ大学フランクフルトのウィルケらです。


    ## ◆ 筋トレは即時的にも認知機能を高める
    2019年、ウィルケらは、これまでに報告された筋トレによる即時的な認知機能への効果について解析した最新のメタアナリシスを報告しました。
    12の研究報告（20〜70歳代の447名）をもとに、筋トレによる即時的な認知機能への効果を解析した結果、筋トレを行ったグループは、行っていないグループよりも即時的に認知の柔軟性が向上し（SMD: 0.73, p=0.004）、ワーキングメモリが向上する傾向（SMD: 0.35, p=0.07）が認められました。

    この即時的な効果は、特に40歳以下の若年者で高く、またトレーニング経験が長く、低強度または高強度トレーニングを行ったときに効果が高いことが示されました。
    また、有酸素運動と筋トレを比較した結果では、双方ともに認知機能の向上が示されましたが、そこに有意な差は認められませんでした。
    これらの結果からウィルケらは、1回のトレーニングセッションは即時的に認知機能を向上させる中等度の効果があり、この効果に年齢は関係ないことを示唆しています。

    では、なぜ筋トレによって認知機能が高まるのでしょうか？

    ウィルケらはその因子として「脳の血流量、コルチゾール、BDNF」を挙げています。
    トレーニングを行うと、動脈血圧が増加します。通常、脳の血流量は一定に保たれるように制御されていますが、トレーニングによって一時的に脳の血流量が増加することが示唆されています（Ogoh S, 2009）。ウィルケらは、この一時的な脳の血流量の増加が、トレーニング後の即時的な認知機能の向上に寄与していると推察しています。

    筋トレのような高強度のトレーニングはストレス・ホルモンであるコルチゾールの放出を促進します。コルチゾールは、副腎皮質刺激ホルモン（ACTH）などの合成を制限し、覚醒を引き起こす作用があります。この覚醒作用が認知機能を向上させることが示唆されています（Tsai CL, 2014）。

    脳の血流量の増加、コルチゾールによる覚醒作用は、筋トレによる即時的な認知機能の増強因子になります。これに対して、筋トレによる長期的な認知機能の増強因子として注目されているのが「BDNF（脳由来神経栄養因子）」です。
    BDNFは、脳の神経細胞が成長し、シナプス結合によるネットワークを構築するためには欠かせない神経系のタンパク質です。5週間のトレーニングによる血液中のBDNF濃度の上昇が確認されており、継続的なトレーニングがBDNFの増加に寄与することが示唆されています（Yarrow JF, 2010）。
    ウィルケらは、筋トレによるこれらの因子の増加が即時的または長期的な認知機能の向上に寄与していると推察しています。
    ノーザイやウィルケらのメタアナリシスは、対象となる研究報告数が少ないですが、筋トレが即時的または長期的に脳の認知機能を高めることを示した現在のところのエビデンスになります。今後は、研究報告数が増えた段階で改めてメタアナリシスを行うとともに、認知機能の向上に最適なトレーニング強度や総負荷量などの検証が必要でしょう。また、メカニズムのさらなる解明が期待されます。

    「なぜ、世界のエグゼクティブは仕事の前に筋トレをするのでしょうか？」
    この質問に、現代のスポーツ科学はこう答えています。

    ### **「筋トレをすると頭が良くなる（認知機能が高まる）」**

    筋トレをしたあとに、頭がクリアになって、仕事や勉強がはかどる経験をしたことはありませんか？ウィルケらは、筋トレの即時的な認知機能の向上効果から、仕事の休み時間に筋トレを行うことも推奨しています。
    大事な仕事やプライベートの用事の前に、筋トレをして認知機能を高めておくのも良いかもしれません
    EOS
  },

]

blogs.each_with_index do |data, i|
  thumbnail = data[:thumbnail]
  data = data.except(:thumbnail)

  blog = Blog.create!(data)
  p "create blog user_id:#{data[:user_id]}"

  next if thumbnail.blank?
  open(thumbnail) do |file|
    p "fetching blog image data from #{thumbnail}"
    if file.content_type == "image/jpeg"
      blog.thumbnail.attach(io: file, filename: "blog_thumbnail_#{i}.jpg")
    else
      blog.thumbnail.attach(io: file, filename: "blog_thumbnail_#{i}.png")
    end
  end
end
