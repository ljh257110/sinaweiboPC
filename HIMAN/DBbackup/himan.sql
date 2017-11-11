/*
SQLyog Ultimate - MySQL GUI v8.2 
MySQL - 5.5.27 : Database - himan
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`himan` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `himan`;

/*Table structure for table `collect` */

DROP TABLE IF EXISTS `collect`;

CREATE TABLE `collect` (
  `collectId` varchar(30) NOT NULL,
  `collectDate` date DEFAULT NULL,
  `collectRemark` varchar(100) DEFAULT NULL,
  `messageId` varchar(200) DEFAULT NULL,
  `userId` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`collectId`),
  KEY `FK62kdy57a0kxnp148yr5s8955j` (`messageId`),
  KEY `FKlvd0ds4htq0kr6sg80n1q4l5v` (`userId`),
  CONSTRAINT `FKlvd0ds4htq0kr6sg80n1q4l5v` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`),
  CONSTRAINT `FK62kdy57a0kxnp148yr5s8955j` FOREIGN KEY (`messageId`) REFERENCES `message` (`messageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `collect` */

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `commentId` varchar(30) NOT NULL,
  `commentContent` varchar(300) DEFAULT NULL,
  `commentDate` date DEFAULT NULL,
  `messageId` varchar(200) DEFAULT NULL,
  `commentedUserId` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`commentId`),
  KEY `FKcmpm0c1ogsswyyaknjwesr8dp` (`messageId`),
  KEY `FKedlwsdy7p6f6580bu33hse1n5` (`commentedUserId`),
  CONSTRAINT `FKedlwsdy7p6f6580bu33hse1n5` FOREIGN KEY (`commentedUserId`) REFERENCES `user` (`userId`),
  CONSTRAINT `FKcmpm0c1ogsswyyaknjwesr8dp` FOREIGN KEY (`messageId`) REFERENCES `message` (`messageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

/*Table structure for table `m_image` */

DROP TABLE IF EXISTS `m_image`;

CREATE TABLE `m_image` (
  `mImageId` varchar(200) NOT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`mImageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_image` */

insert  into `m_image`(`mImageId`,`url`) values ('0.010432679043919979','upload/3.png'),('0.019036419748279187','upload/示例图片_03.jpg'),('0.03230181271079702','upload/1.png'),('0.09278150597554591','upload/1.png'),('0.12681452960775785','upload/02.jpg'),('0.1698238091687303','upload/01.jpg'),('0.2068057913596395','upload/3.png'),('0.22547379466297268','upload/1.png'),('0.2394888492742533','upload/03.jpg'),('0.25853090317089567','upload/1.png'),('0.2638530826958928','upload/03.jpg'),('0.30012450281844005','upload/3.png'),('0.44044280251355516','upload/示例图片_02.jpg'),('0.47536924465446884','upload/1.png'),('0.53360526419022','upload/示例图片_03.jpg'),('0.5336168398519364','upload/01.jpg'),('0.6257594693165023','upload/1.png'),('0.6322361238857814','upload/1.png'),('0.6659654122961857','upload/1.png'),('0.68719866965384','upload/3.png'),('0.7122202439240257','upload/01.jpg'),('0.7505566025135518','upload/示例图片_02.jpg'),('0.7756881383382251','upload/3.png'),('0.8186401613963917','upload/1.png'),('0.8375545767195709','upload/1.png'),('0.9049976197549531','upload/03.jpg'),('0.9631412573321858','upload/02.jpg'),('0.9868493529210058','upload/1.png'),('01','upload/01.jpg'),('02','upload/02.jpg'),('03','upload/03.jpg'),('04','upload/04.jpg'),('05','upload/05.jpg'),('06','upload/06.jpg'),('07','upload/07.jpg'),('08','upload/08.jpg'),('09','upload/09.jpg'),('10','upload/10.jpg'),('11','upload/11.jpg'),('12','upload/12.jpg'),('13','upload/13.jpg'),('14','upload/14.jpg'),('15','upload/15.jpg'),('16','upload/16.jpg'),('17','upload/17.jpg'),('18','upload/18.jpg'),('19','upload/19.jpg'),('20','upload/20.jpg'),('21','upload/21.jpg'),('22','upload/22.jpg'),('23','upload/23.jpg'),('24','upload/24.jpg'),('25','upload/25.jpg'),('26','upload/26.jpg'),('27','upload/27.jpg'),('28','upload/28.jpg'),('29','upload/29.jpg'),('30','upload/30.jpg'),('31','upload/31.jpg'),('32','upload/32.jpg'),('33','upload/33.jpg'),('34','upload/34.jpg'),('35','upload/35.jpg'),('36','upload/36.jpg'),('37','upload/37.jpg'),('38','upload/38.jpg'),('39','upload/39.jpg'),('40','upload/40.jpg'),('41','upload/41.jpg'),('42','upload/42.jpg'),('43','upload/43.jpg'),('44','upload/44.jpg'),('45','upload/45.jpg'),('46','upload/46.jpg'),('47','upload/47.jpg'),('48','upload/48.jpg'),('49','upload/49.jpg'),('51',NULL),('52',NULL),('53',NULL),('54',NULL),('55',NULL),('56',NULL),('57',NULL),('58',NULL);

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `messageId` varchar(200) NOT NULL,
  `messageCollect` varchar(255) DEFAULT NULL,
  `messageContent` varchar(300) DEFAULT NULL,
  `messageDate` date DEFAULT NULL,
  `messageForward` int(11) DEFAULT NULL,
  `messageForwardId` varchar(30) DEFAULT NULL,
  `messageIsCollect` varchar(50) DEFAULT NULL,
  `messageIsForward` varchar(50) DEFAULT NULL,
  `messageIsPraise` varchar(10) DEFAULT NULL,
  `messageLink` varchar(100) DEFAULT NULL,
  `messagePraise` int(11) DEFAULT NULL,
  `messageRemark` varchar(100) DEFAULT NULL,
  `messageReview` int(11) DEFAULT NULL,
  `messageTile` varchar(100) DEFAULT NULL,
  `messageType` varchar(50) DEFAULT NULL,
  `userId` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`messageId`),
  KEY `FKmv088mdste5ik1pv4x7iuewyl` (`userId`),
  CONSTRAINT `FKmv088mdste5ik1pv4x7iuewyl` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `message` */

insert  into `message`(`messageId`,`messageCollect`,`messageContent`,`messageDate`,`messageForward`,`messageForwardId`,`messageIsCollect`,`messageIsForward`,`messageIsPraise`,`messageLink`,`messagePraise`,`messageRemark`,`messageReview`,`messageTile`,`messageType`,`userId`) values ('0.003603191266563277',NULL,'说大话三公分','2017-10-28',0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL),('0.04114549653102373',NULL,'哈Oh奥','2017-10-28',0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL),('0.04947273263926988',NULL,'说大话三公分','2017-10-28',0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL),('0.07777394654221481',NULL,'fgdgfd','2017-10-28',0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL),('0.2021853840879152',NULL,'中国','2017-10-28',0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,'4','0f174812-7e63-4466-bb53-8760c2'),('0.6830347557646933',NULL,'fdsfsd','2017-10-28',0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,'4','0f174812-7e63-4466-bb53-8760c2'),('0.7045239799302669',NULL,'hahhahahaha华东哈卡斯','2017-10-28',0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,NULL,NULL),('0.726261600364549',NULL,'好好学习','2017-10-28',0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,'4','0f174812-7e63-4466-bb53-8760c2'),('01','1111','我庄严宣誓：','2017-10-01',169,'','',NULL,NULL,NULL,1080,NULL,530,NULL,'4','1'),('02','44551','在今天小牛VS勇士的比赛之前，库里在球员通道遇到了小牛球员德文-哈里斯的侄子，然后对他进行了一段安慰，这个孩子的父亲上周在一次车祸中去世','2017-10-01',57,NULL,NULL,NULL,NULL,NULL,1181,NULL,93,NULL,'4','1'),('03','11124','【中国最好的一批本科生：清华姚班和100个“张小龙”】在人工智能的人才大潮中，这个班被寄予厚望。某种程度上，“姚班”学生都是优中选优，每届只招收三十余人，其中不乏各省高考理科状元和各门学科奥赛金牌得主。这些学生非常聪明，敢于挑战权威，随时随地都能冒出创造性想法。','2017-10-10',2927,NULL,NULL,NULL,NULL,NULL,13830,NULL,3216,NULL,'2','1'),('04','54564','晚上跟同事出去吃宵夜，我买的单，真的，没骗你们！晚安！ ​​​​','2017-10-12',398,NULL,NULL,NULL,NULL,NULL,11232,NULL,2715,NULL,'2','1'),('05','2453254','相爱相杀，郑恺袁姗姗欢喜冤家竟七日闪婚！','2017-10-12',10,NULL,NULL,NULL,NULL,NULL,39,NULL,11,NULL,'1','61a1ad4b-2c05-4003-bee9-337f6a'),('10','424','某宝虚拟男友交易过程，看完这个，你就知道尼玛现在钱有多难赚','2017-10-12',918,NULL,NULL,NULL,NULL,NULL,1297,NULL,74,NULL,'1','61a1ad4b-2c05-4003-bee9-337f6a'),('11','45354','我知道把自己的快乐建立在别人的痛苦之上是不对的，但我还是忍不住哈哈哈哈哈哈嗝！','2017-10-12',2810,NULL,NULL,NULL,NULL,NULL,1269,NULL,30765,NULL,'1','61a1ad4b-2c05-4003-bee9-337f6a'),('12','43543','孤寡老人深夜摆烧烤摊维持生计，背后真相让人大跌眼镜!','2017-10-12',2,NULL,NULL,NULL,NULL,NULL,47,NULL,1,NULL,'1','6cb8dd1a-9217-46be-bf13-d05b5b'),('13','543245','何炅谢娜合影，太棒了！','2017-10-12',4249,'8',NULL,'1',NULL,NULL,18271,NULL,690,NULL,'1','6cb8dd1a-9217-46be-bf13-d05b5b'),('14','456345','我行我素点满霸气个性的动物们~看完感觉自己活的还不如猫猫狗狗鸟鸟鸭鸭来得个性','2017-10-12',678,NULL,NULL,NULL,NULL,NULL,1056,NULL,30,NULL,'1','6cb8dd1a-9217-46be-bf13-d05b5b'),('15','543254','某档节目现场采访台下观众，结果因为观众的笑声太魔性，节目差点没能继续，这位选手你可快点坐下吧','2017-10-12',5488,NULL,NULL,NULL,NULL,NULL,3730,NULL,2524,NULL,'1','6cb8dd1a-9217-46be-bf13-d05b5b'),('16','453245','一人饮酒醉，醉把驾照成破碎！#全国搞笑排行# L六点半变变的秒拍视频 ​​​​','2017-10-12',4,NULL,NULL,NULL,NULL,NULL,49,NULL,7,NULL,'1','84823c82-ab42-4147-a3d7-87521b'),('17','45354','宜家的这个广告真是无力吐槽。女儿跟爸妈在家吃饭，女儿喊了一声妈。妈妈直接摔筷子：再不带男朋友回来，就别叫我妈！后来男朋友从天而降，父母态度来了一百八十度大转弯。还嫌大部分中国家长不够烦人吗，这么起哄架秧子的？有没有对象都是自己的事，不需要别人甚至广告来干涉。','2017-10-12',3897,NULL,NULL,NULL,NULL,NULL,6511,NULL,2037,NULL,'1','84823c82-ab42-4147-a3d7-87521b'),('18','453245','论有个会撩妹的爸爸是什么体验，简直萌翻惹啊，又想骗我生孩子','2017-10-12',4434,NULL,NULL,NULL,NULL,NULL,1324,NULL,2794,NULL,'1','84823c82-ab42-4147-a3d7-87521b'),('19','54345','电视屎上最爆笑的出糗片段，值得你当作传家宝世世代代传下去','2017-10-12',1191,NULL,NULL,NULL,NULL,NULL,20832,NULL,530,NULL,'1','84823c82-ab42-4147-a3d7-87521b'),('20','54345','#非帅勿扰# 单身帅哥请注意，这一次，你比多金男更有竞争力。美女集体上街求娶，走过路过，老婆不能错过！不过，为什么女生都喜欢长得帅的？带话题说出你的看法，并 @和畅叼嘴巴 与身边一位单身帅哥，就有机会帮他赢取脱单大奖！ L印花小榭的秒拍视频 ​​​​','2017-10-12',626,NULL,NULL,NULL,NULL,NULL,343,NULL,263,NULL,'1','b3b56b93-cde0-4616-b29e-351167'),('21','345325','恋学堂情感教育解决你的情感难题！男人看了会撩妹，女人看了防渣男！','2017-10-12',128,NULL,NULL,NULL,NULL,NULL,15,NULL,3,'女人在这3个时期最好色，你肯定遇到过，超准的','2','b3b56b93-cde0-4616-b29e-351167'),('22','453254','​​生命，每个人只有一次，或长或短，生活，每个人都在继续，或悲或欢。怕念头起，只怕觉照迟。岁月在考验着一切，岁月在淡化着一切。','2017-10-12',10,NULL,NULL,NULL,NULL,NULL,19,NULL,6,'守好心，走好路，活的像自己','2','b3b56b93-cde0-4616-b29e-351167'),('23','34532','人憔悴了，红包瘦了。朋友圈里被刷屏的关晓彤和鹿晗会结婚吗？','2017-10-12',2,NULL,NULL,NULL,NULL,NULL,3,NULL,0,'一到长假！为啥整个朋友圈都在结婚？','2','b3b56b93-cde0-4616-b29e-351167'),('24','453245','爱情它说来就来，真的没办法预测。','2017-10-12',32,NULL,NULL,NULL,NULL,NULL,75,NULL,9,'如果最后是你，晚一点遇见也没关系','2','b4a15bea-1a22-4bae-831d-b83660'),('25','543','有人说爱情是对方丑得跟猴一样，也随时担心被别人抢走。维系两个人之间的感情本来就很不容易，更何况这世上还有妖艳贱货，随时对自己心爱的东西虎视眈眈。','2017-10-12',70,NULL,NULL,NULL,NULL,NULL,9,NULL,11,'不怕你太受欢迎 就怕你来者不拒','2','b4a15bea-1a22-4bae-831d-b83660'),('26','54345','​​“面包会有的，牛奶也会有的，在遇到那个对的人之前，首先要做的就是经营好你自己。”','2017-10-12',0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,'幸福人生的关键在于对面包和爱情的抉择','2','b4a15bea-1a22-4bae-831d-b83660'),('27','354345','没关系啦','2017-10-12',15,NULL,NULL,NULL,NULL,NULL,34,NULL,43,'程序员，你工作是为了什么？','2','b4a15bea-1a22-4bae-831d-b83660'),('28','3543','不相信因果的人，就会怨天尤人，明白了因果道理，就会知道各有因缘莫羡人。每个人都有每个人的因缘，不必去羡慕他人。命运可以由自己来改造，因为人生是无常的。我们要记住：今天的皇帝，也可能是明天的囚犯；今天的富翁，明天可能成为乞丐。而世间的许多荣耀，都是昙花一现，过眼云烟。','2017-10-12',12,NULL,NULL,NULL,NULL,NULL,24,NULL,39,'我们都是来去匆匆的过客， 只不过是到世间走一遭','2','ca40baaa-f174-45d6-8123-07322a'),('29','54354','很常听见一般人在讨论感情这件事的时候，由于清官难断家务事，所以探讨到最后都会以「爱情没有对错」当做结论，然后原地各自鸟兽散。然而这六个字看在眼里我却颇不以为然，在这世界上，党派有分蓝绿、硬币有分正反，电影里有分好人坏人，那爱情就一定有对错，只是谁错的多谁错的少，或谁有理谁理亏而已。在爱情里，人人都会犯错，不会有性别之分，也许对方总是先道歉的那一个，也不一定表示我们就该理直气壮，来看看以下我认为的对错报导。','2017-10-12',0,NULL,NULL,NULL,NULL,NULL,0,NULL,1,'爱情里的五大错误，你中了几样？','2','ca40baaa-f174-45d6-8123-07322a'),('30','45345','要知道别人光鲜的背后有着太多不为人知的痛苦，自己不喜欢的人，报之以微笑，默默为他祝福;对喜欢的人，真情流露、真诚相待就好。人在做天在看，冥冥中自有因果在安排，永远怀着一颗善良的心，持续做对的事。时刻提醒自己，改变自己，低调做人，高调做事。','2017-10-12',0,NULL,NULL,NULL,NULL,NULL,1,NULL,0,'要知道别人光鲜的背后有着太多不为人知的痛苦','2','e7d50665-9aaa-4a88-9e14-f5a71d'),('31','54324','最大的遗憾不是错过最好的人，而是当你遇见最好的人时候，已经把最好的自己用完了。人生就像一场舞会，教会你最初舞步的人未必能陪你走到散场。人之所以活的累，是因为放不下架子，撕不开面子，解不开情结。','2017-10-12',3,NULL,NULL,NULL,NULL,NULL,1,NULL,2,'最大的遗憾不是错过最好的人','2','ca40baaa-f174-45d6-8123-07322a'),('32','343','你越是对他好，他越能理所当然的伤害你。遇见一个渣男，错把青春交付，有些人的出现，也许就是为了开眼界的。','2017-10-12',41,NULL,NULL,NULL,NULL,NULL,11,NULL,21,'越渣的男生，这4种行为越明显','2','e7d50665-9aaa-4a88-9e14-f5a71d'),('33','543254','男女之间最容易引起争议的话题，就是“你为什么不在朋友圈发我照片？”','2017-10-12',361,NULL,NULL,NULL,NULL,NULL,127,NULL,60,'鹿晗公开恋情了，男朋友却还是不肯发你的照片','2','e7d50665-9aaa-4a88-9e14-f5a71d'),('34','532423','听过一句特别有意思的话，大意是这样：','2017-10-12',12,NULL,NULL,NULL,NULL,NULL,4,NULL,21,'我就爱装作不在乎你的样子','2','e7d50665-9aaa-4a88-9e14-f5a71d'),('35','453245','​​​走过山重水复的流年，终于明白，真正的成熟，不是看破，而是看淡。人生这趟旅程，一路走下来，青云飘过头顶，微风拂过眉梢，有过花开的惊艳，有过花谢的落寞，最终，见得繁花不惊，修得心淡如水。','2017-10-12',16,NULL,NULL,NULL,NULL,NULL,2,NULL,2,'人生若只如初见','2','e7d50665-9aaa-4a88-9e14-f5a71d'),('36','45354','我们有多渴望成功，就有多害怕失败。与人聊天的时候，我最怕聊到最后，对方忽然问一句，我是不是很失败？我总是不知道怎么回答。','2017-10-12',191,NULL,NULL,NULL,NULL,NULL,200,NULL,100,'静夜思 | 世界上只有一种失败，就是总想成为别人','2','f034011e-bd3d-4207-a7c3-bd02a2'),('37','4524','生命，每个人只有一次，或长或短，生活，每个人都在继续，或悲或欢。怕念头起，只怕觉照迟。岁月在考验着一切，岁月在淡化着一切。','2017-10-12',10,NULL,NULL,NULL,NULL,NULL,6,NULL,19,'守好心，走好路，活的像自己','2','f034011e-bd3d-4207-a7c3-bd02a2'),('38','54345','想要走得快，就独自上路；想要走得远，就结伴同行。快与远，都是我们的追求。追求快中的独立，追求快中的坚强，给自己留一片属于自己的天空。追求远中的欢声笑语，追求远中的结伴同行，便不会有孤单。即便是失败了，那也无所谓，失败了，总是搏了一回，不后悔。','2017-10-12',11,NULL,NULL,NULL,NULL,NULL,11,NULL,16,'人，最不能忘记的，是在你困难时拉你一把的人','2','f034011e-bd3d-4207-a7c3-bd02a2'),('39','3542','不管命运给予什么，真正懂得生活的人，从来不会抱怨自己的境遇，而是依着命运的安排努力创造属于自己的人生。','2017-10-12',7,NULL,NULL,NULL,NULL,NULL,6,NULL,7,'悟透是岁月，走过才是人生','2','f034011e-bd3d-4207-a7c3-bd02a2'),('40','54354','歪 ​别的小朋友都回家了…你什么时候来接我啊…','2017-10-12',713,NULL,NULL,NULL,NULL,NULL,133,NULL,335,'我不想再做披荆斩棘的女英雄了 我只想做一个被你疼爱的小朋友','2','f034011e-bd3d-4207-a7c3-bd02a2'),('41','34532','#十九大•理论新视野#【小Q看十九大之党章】10月24日，党的十九大胜利闭幕啦！习近平同志在大会上发表讲话，号召全体党员拿出勇气干劲，创造无愧时代的业绩。新思想新时代新目标新征程，小Q也听得热血澎湃意气浓。那么，今天的十九大播报，就跟小Q一起来听听#党章的故事#，让我们不忘初心，牢记使命！ ','2017-10-12',5,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,'4','0f174812-7e63-4466-bb53-8760c2'),('42','45345','#领航中国##十九大时间#【十九大相册：代表通道上走来的青春气息】中国共产党第十九次全国代表大会上，70后、80后、90后代表走上代表通道，青春气息扑面而来。 ​​​​','2017-10-12',97,NULL,NULL,NULL,NULL,NULL,71,NULL,218,NULL,'4','0f174812-7e63-4466-bb53-8760c2'),('43','54345','#十九大进行时#【为新时代打CALL：这可能是最有科技感的一段freestyle[doge]】世界第一颗空间量子科学实验卫星“墨子号”，具有完全自主知识产权的高速列车“复兴号”，三次荣登全球超级计算机榜首的“神威·太湖之光”超级计算机……[憧憬]一批批令人惊叹的新技术、新成果都讲述着中国在砥砺奋进的五年间发生的翻天覆地的变化，取得的举世瞩目的伟大成就。什么？你说你还没get到？那我们就唠点接地气的给你听[来]↓戳视频，为新时代打CALL吧！','2017-10-12',5597,NULL,NULL,NULL,NULL,NULL,375,NULL,40552,NULL,'4','0f174812-7e63-4466-bb53-8760c2'),('44','543','#东评晚读# 当日本决定建设铁路的时候，不少人就表达了反对的态度。他们说，日文中“铁道”的“铁”，是一个金字旁加上一个失去的失；换句话说，铁道不过是让国家失去金钱的一条道路，纯属浪费而已。','2017-10-12',744,NULL,NULL,NULL,NULL,NULL,343,NULL,125,NULL,'4','0f174812-7e63-4466-bb53-8760c2'),('45','35445','【五旬大妈大明湖栏杆上“练功”】在济南大明湖北岸的健身广场上，每天都有很多人在这里锻炼。锻炼的人群中，有一位五十多岁的大妈，不仅在单杠、双杠、天梯、肋木上做出很多高难度动作，还站在湖边栏杆的柱子上“练功”，引得路人连连叫好。山东商报记者郑芷南','2017-10-12',14,NULL,NULL,NULL,NULL,NULL,13,NULL,150,NULL,'4','0f174812-7e63-4466-bb53-8760c2'),('46','54345','【暖心！轿车被撞车主放弃索赔 六旬老人硬塞烤红薯致歉[心]】近日，在安徽宣城市区，六旬老人黄桂英骑车卖烤红薯烤玉米时不慎划伤路边轿车。得知修理费超千元后，老人流下泪水。女车主得知老人刚车祸丧子、丈夫患重病后主动放弃索赔。黄桂英拿出两个烤红薯和烤玉米，硬塞给车主诚恳致歉。','2017-10-12',21,NULL,NULL,NULL,NULL,NULL,93,NULL,441,NULL,'4','0f174812-7e63-4466-bb53-8760c2'),('47','45345','【研究生1年拿9项发明专利：随身带本子记录灵感】可以升降的高跟鞋、带座位的行李箱、防堵塞蹲式马桶…湖北大学的研究生廖可富，1年申请16项发明专利，目前已拿到9项专利证书，他随身携带一个本子，只要遇到生活中的灵感，就马上记下来，一有空闲，就琢磨创新发明。（武汉晚报）','2017-10-12',226,NULL,NULL,NULL,NULL,NULL,143,NULL,1730,NULL,'4','6cb8dd1a-9217-46be-bf13-d05b5b'),('48','453254','#重庆城事#【长江索道今天30岁了！[鼓掌]你坐过吗？】1987年10月24日，重庆长江索道正式投入运营。索道全长1166米，最大载客量80人，单程运行5分钟，被誉为万里长江第一条“空中走廊。”长江索道建成运营后，大大缩短了市民往返两岸的距离和时间，成为市民出行的重要方式之一。而今，它已成为重庆的标志性地标之一。','2017-10-12',306,NULL,NULL,NULL,NULL,NULL,0,NULL,833,NULL,'4','6cb8dd1a-9217-46be-bf13-d05b5b'),('49','453254','#医学编辑熊小知#【吃饭咬舌头是想吃肉？不，也可能是中风】如果你以为吃饭、说话时咬舌头是因为“馋肉”，那就错了。在医生看来， 咬舌头这一现象，如果发生在三高患者身上，很可能是中风的前兆。今天，熊小知为你指出中风前身体会发出的种种信号。 ','2017-10-12',291,NULL,NULL,NULL,NULL,NULL,295,NULL,502,NULL,'4','6cb8dd1a-9217-46be-bf13-d05b5b'),('50','45245','【女子结婚十年分得房产份额后立即闹离婚，丈夫扒出女儿并非亲生要收回房产，她竟死不承认并改口想要共同生活！】据公号上海圈爆料，近日，嘉定区人民法院审理了一起奇葩的赠与合同纠纷案。','2017-10-12',151,NULL,NULL,NULL,NULL,NULL,1,NULL,149,NULL,'4','6cb8dd1a-9217-46be-bf13-d05b5b'),('51','45345','【#十九大#通过党章修正案 历届党代会党章这样修改】24日，党的十九大闭幕会通过了关于《中国共产党章程（修正案）》的决议，习近平新时代中国特色社会主义思想写入党章。中国共产党自1921年诞生至今，已先后制定、修正过多次党章，历届党代会的党章都如何修改？戳图了解↓↓转发，收藏！ ​​​​','2017-10-12',49,NULL,NULL,NULL,NULL,NULL,0,NULL,26,NULL,'4','6cb8dd1a-9217-46be-bf13-d05b5b'),('52','453245','【被旁边旅客拉杆箱带倒，妈妈为护怀中孩子摔骨折，事后主动自省不要赔偿】据@南京零距离 16日在南京地铁一站厅里，抱着孩子的何女士被一个拉杆箱绊倒了，何女士想着不能让孩子受伤，放弃了用手撑地，自己直挺挺地倒下去，导致骨折。事后，何女士主动自省，她觉得是自己没看清前方才发生的，愿意自行承担责任，不需要赔偿。但推拉杆箱的男子也坚持认为自己有不当之处，请民警转交给了何女士600元的医药费。警方提醒，乘客携带拉杆箱要注意保持距离。',NULL,48,NULL,NULL,NULL,NULL,NULL,1,NULL,451,NULL,'4',NULL),('53','45354','#石家庄身边事#【石家庄，新娘不要一分钱彩礼 新郎回她一场“海陆空”婚礼】骑白马、坐游艇、乘热气球……10月22日，河北石家庄，新娘乘坐热气球“从天而降”，新郎单膝跪地等待。原来，新娘不要男方一分彩礼，新郎和朋友从年初开始策划，为新娘准备了这样一个盛大浪漫的仪式。（人民网）',NULL,22,NULL,NULL,NULL,NULL,NULL,52,NULL,151,NULL,'4',NULL),('54','54354','#今日微信热点# 【神了！打开手机这个隐藏功能，你的微信、支付宝再也不会被盗刷】如今，虽然我们的支付方式多样化了，但可能也会有被盗刷的风险。怎么才能让我们的钱包更安全？今天，给大家支两招☞',NULL,75,NULL,NULL,NULL,NULL,NULL,83,NULL,0,NULL,'4',NULL),('55',NULL,'【美国第一大悬案最终档案将公开 全程视频回顾肯尼迪遇刺案】肯尼迪遇刺案全部档案计划于2017年10月26日公开，美国总统川普表示“除非得到其它信息，将允许档案公开”。3分钟回顾肯尼迪遇刺案发全过程。@梨视频',NULL,34,NULL,NULL,NULL,NULL,NULL,14,NULL,11,NULL,'4',NULL),('56',NULL,'【4岁萌娃走丢数落爸爸“每天都把我弄丢”[笑cry]】近日，湖北宜昌一4岁女孩街头走丢，被市民送到派出所。民警询问情况时，小家伙金句频出，数落爸爸每天都把她弄丢，还自称星星姐姐。民警准备带她找家时，家人找了过来。原来爸爸本让女儿在门口等他，结果小家伙自己跑了。（看看新闻Knews）  ',NULL,39,NULL,NULL,NULL,NULL,NULL,0,NULL,250,NULL,'4',NULL),('57',NULL,'【“这主持人长得特像我二姨” | 陈晓楠和陌生人说话】此前13年，陈晓楠的名字总是和凤凰卫视访谈节目《冷暖人生》联系在一起。但这都是过去式了。今年3月，这名自1995年就从事新闻的老兵最终选择拥抱互联网、加盟腾讯，成为这家互联网公司史上第一位“首席主持人”，并推出了新访谈节目《和陌生人说话》。《和陌生人说话》仍旧带着清晰的“陈晓楠式风格”，《毒sir电影》在介绍节目时，直接叫它“简约版《冷暖人生》”。节目到现在播出了8期，近1.4亿的播放量。陈晓楠觉得很满足，至少这已经可以说明“生老病死，喜怒哀乐”这些来自陌生人的、最朴实的情感依然受到人们关注。 ',NULL,43,NULL,NULL,NULL,NULL,NULL,36,NULL,94,NULL,'4',NULL),('58',NULL,'【15年匿名捐款30万！“兰小草”昨日离世】在温州，他是家喻户晓的人物，却又没人知道他是谁。人们知道的只有一个捐款代号：兰小草。15年来他每年匿名捐款2万，承诺要坚持33年。21日，“兰小草”因病去世其身份才被揭开。他是普通村医王珏。弥留之际，他仍嘱妻儿“要多做公益”。',NULL,45,NULL,NULL,NULL,NULL,NULL,18,NULL,131,NULL,'4',NULL),('59',NULL,'#锦州新闻# 【秋菜上市期间锦州市区主要街路临时取消农用车禁行】从10月24日起至11月20日止，对除中央大街等四条主要道路外的市区大部分道路，临时取消农用车禁行交通管理措施。农用车禁行路段通告如下：1、中央大街及中央南街（延安路至科技路段）；2、云飞街及云飞南街（延安路至科技路段）；3、解放路（士英街至广州街段）；4、市府路（凌西大街至云飞南街段）。上述路段禁止农用三轮车、低速载货汽车通行，其他路段贩卖秋菜的农用车可以通行。',NULL,9,NULL,NULL,NULL,NULL,NULL,1,NULL,2,NULL,'4',NULL),('6',NULL,'如果我们的日常用品是它们的便便。。。这脑洞有点大啊！',NULL,12449,NULL,NULL,NULL,NULL,NULL,23294,NULL,9934,NULL,'1',NULL),('60',NULL,'',NULL,40,NULL,NULL,NULL,NULL,NULL,13,NULL,101,NULL,'4',NULL),('7',NULL,'「有哪些让你“醍醐灌顶”的顶级毒鸡汤？」一起干了吧朋友_(´ཀ`」 ∠)_ ',NULL,8045,NULL,NULL,NULL,NULL,NULL,6823,NULL,1285,NULL,'1',NULL),('8',NULL,'何炅，马丽早期的小品《超幸福鞋垫》，全程太搞笑了，每当不开心的时候，就拿出看一遍！！！',NULL,1141,NULL,NULL,NULL,NULL,NULL,775,NULL,94,NULL,'1',NULL),('9',NULL,'狗狗：前面的兄弟能停一下么，我要尿尿。',NULL,21,NULL,NULL,NULL,NULL,NULL,48,NULL,22,NULL,'1',NULL);

/*Table structure for table `message_mimage` */

DROP TABLE IF EXISTS `message_mimage`;

CREATE TABLE `message_mimage` (
  `messageId` varchar(200) NOT NULL,
  `mImageId` varchar(200) NOT NULL,
  KEY `FKegu7qntje29q2g001nek4i2o0` (`mImageId`),
  KEY `FKj0bb81xpy1eq3m45j2vmw4ca6` (`messageId`),
  CONSTRAINT `FKj0bb81xpy1eq3m45j2vmw4ca6` FOREIGN KEY (`messageId`) REFERENCES `message` (`messageId`),
  CONSTRAINT `FKegu7qntje29q2g001nek4i2o0` FOREIGN KEY (`mImageId`) REFERENCES `m_image` (`mImageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `message_mimage` */

insert  into `message_mimage`(`messageId`,`mImageId`) values ('01','01'),('01','02'),('01','03'),('01','04'),('01','05'),('01','06'),('01','07'),('01','08'),('01','09'),('02','10'),('02','13'),('02','13'),('02','12'),('02','14'),('02','15'),('02','16'),('02','17'),('02','18'),('03','19'),('03','20'),('03','21'),('03','22'),('03','23'),('03','24'),('03','25'),('03','26'),('03','27'),('04','30'),('04','30'),('04','29'),('04','31'),('04','32'),('04','33'),('04','34'),('04','35'),('04','36'),('05','37'),('05','38'),('05','39'),('05','40'),('05','41'),('05','42'),('05','43'),('05','44'),('05','45'),('10','46'),('10','47'),('10','48'),('10','49'),('10','01'),('0.07777394654221481','0.6659654122961857'),('0.07777394654221481','0.9631412573321858'),('0.07777394654221481','0.2638530826958928'),('0.04114549653102373','0.09278150597554591'),('0.04114549653102373','0.12681452960775785'),('0.04114549653102373','0.9049976197549531'),('0.7045239799302669','0.2394888492742533'),('0.7045239799302669','0.7122202439240257'),('0.003603191266563277','0.6257594693165023'),('0.003603191266563277','0.30012450281844005'),('0.04947273263926988','0.8186401613963917'),('0.04947273263926988','0.68719866965384');

/*Table structure for table `praise` */

DROP TABLE IF EXISTS `praise`;

CREATE TABLE `praise` (
  `praiseId` varchar(30) NOT NULL,
  `praiseDate` date DEFAULT NULL,
  `praiseRemark` varchar(100) DEFAULT NULL,
  `messageId` varchar(200) DEFAULT NULL,
  `userId` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`praiseId`),
  KEY `FK3w4jeet32ohb0c2n971syacwy` (`messageId`),
  KEY `FK3nysxyxg8wlllsyf62nem1abr` (`userId`),
  CONSTRAINT `FK3nysxyxg8wlllsyf62nem1abr` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`),
  CONSTRAINT `FK3w4jeet32ohb0c2n971syacwy` FOREIGN KEY (`messageId`) REFERENCES `message` (`messageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `praise` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userId` varchar(30) NOT NULL,
  `UserName` varchar(20) DEFAULT NULL,
  `userAccount` varchar(50) DEFAULT NULL,
  `userBackground` varchar(100) DEFAULT NULL,
  `userBirthday` varchar(20) DEFAULT NULL,
  `userBlogAddress` varchar(100) DEFAULT NULL,
  `userCity` varchar(20) DEFAULT NULL,
  `userCompany` varchar(50) DEFAULT NULL,
  `userEmail` varchar(20) DEFAULT NULL,
  `userHead` varchar(100) DEFAULT NULL,
  `userIntroduce` varchar(100) DEFAULT NULL,
  `userPhone` varchar(40) DEFAULT NULL,
  `userProvince` varchar(20) DEFAULT NULL,
  `userPwd` varchar(20) DEFAULT NULL,
  `userRegisterDate` varchar(20) DEFAULT NULL,
  `userSchool` varchar(50) DEFAULT NULL,
  `userSex` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `UK_gjmplbgfrochntrrkgk1y4a3t` (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`userId`,`UserName`,`userAccount`,`userBackground`,`userBirthday`,`userBlogAddress`,`userCity`,`userCompany`,`userEmail`,`userHead`,`userIntroduce`,`userPhone`,`userProvince`,`userPwd`,`userRegisterDate`,`userSchool`,`userSex`) values ('0f174812-7e63-4466-bb53-8760c2','石窕',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'678910',NULL,'678910',NULL,NULL,NULL),('1','萱萱',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('61a1ad4b-2c05-4003-bee9-337f6a','呵呵',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'123456',NULL,'123456',NULL,NULL,NULL),('6cb8dd1a-9217-46be-bf13-d05b5b','哈哈',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'15269523213',NULL,'111111',NULL,NULL,NULL),('84823c82-ab42-4147-a3d7-87521b','张三',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'111111',NULL,'111111',NULL,NULL,NULL),('b3b56b93-cde0-4616-b29e-351167','王禾',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3782173823',NULL,'389372',NULL,NULL,NULL),('b4a15bea-1a22-4bae-831d-b83660','琉璃',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'666666',NULL,'666666',NULL,NULL,NULL),('ca40baaa-f174-45d6-8123-07322a','nf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'666666666',NULL,'666666666',NULL,NULL,NULL),('e7d50665-9aaa-4a88-9e14-f5a71d','su',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'15764219379',NULL,'123456',NULL,NULL,NULL),('f034011e-bd3d-4207-a7c3-bd02a2','ig',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'432432423432',NULL,'1232323',NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
