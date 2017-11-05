/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50719
Source Host           : localhost:3307
Source Database       : esdb

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-11-05 09:41:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `app_comment`
-- ----------------------------
DROP TABLE IF EXISTS `app_comment`;
CREATE TABLE `app_comment` (
  `commentId` varchar(50) NOT NULL COMMENT '主键字段',
  `topicId` varchar(50) NOT NULL COMMENT '主题ID',
  `topicTypeId` varchar(50) NOT NULL COMMENT '主题分类Id',
  `content` varchar(1000) NOT NULL COMMENT '评论内容',
  `fromUid` varchar(50) NOT NULL COMMENT '评论用户ID',
  `registerTime` varchar(50) NOT NULL COMMENT '用户填写评论时间',
  `delFlag` int(1) NOT NULL COMMENT '用于标识数据是否逻辑删除',
  PRIMARY KEY (`commentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `app_like`
-- ----------------------------
DROP TABLE IF EXISTS `app_like`;
CREATE TABLE `app_like` (
  `likeId` varchar(50) NOT NULL COMMENT '主键字段',
  `topicId` varchar(50) NOT NULL COMMENT '主题Id',
  `userId` varchar(50) NOT NULL COMMENT '用户Id',
  `likeTime` varchar(50) NOT NULL COMMENT '点赞时间',
  `status` int(1) NOT NULL COMMENT '状态 0-已取消赞 1-有效赞',
  `delFlag` int(1) NOT NULL COMMENT '用于标识数据是否逻辑删除',
  PRIMARY KEY (`likeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_like
-- ----------------------------

-- ----------------------------
-- Table structure for `app_user`
-- ----------------------------
DROP TABLE IF EXISTS `app_user`;
CREATE TABLE `app_user` (
  `userId` varchar(50) NOT NULL COMMENT '主键字段',
  `userName` varchar(20) NOT NULL COMMENT '用户名称',
  `phone` varchar(20) NOT NULL COMMENT '用户联系方式',
  `passWord` varchar(50) NOT NULL COMMENT '用户密码',
  `picture` varchar(150) DEFAULT NULL COMMENT '用户头像',
  `nickName` varchar(50) DEFAULT NULL COMMENT '用户真实姓名',
  `sex` int(1) DEFAULT NULL COMMENT '用户性别 0-女 1-男',
  `personSign` varchar(150) DEFAULT NULL COMMENT '用户签名',
  `registerTime` varchar(50) DEFAULT NULL COMMENT '用户注册时间',
  `updateTime` varchar(50) DEFAULT NULL COMMENT '用户更新信息时间',
  `delFlag` int(1) NOT NULL COMMENT '用于标识数据是否逻辑删除',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_user
-- ----------------------------

-- ----------------------------
-- Table structure for `emp`
-- ----------------------------
DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 NOT NULL,
  `salary` float NOT NULL,
  `designation` varchar(45) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of emp
-- ----------------------------
INSERT INTO `emp` VALUES ('1', '児童 1', '1', '3 - 1');
INSERT INTO `emp` VALUES ('2', '児童 2', '1', '3 - 1');
INSERT INTO `emp` VALUES ('3', '児童 3', '1', '3 - 1');
INSERT INTO `emp` VALUES ('4', '児童 4', '1', '3 - 1');
INSERT INTO `emp` VALUES ('5', '児童 5', '1', '3 - 1');
INSERT INTO `emp` VALUES ('6', '児童 6', '1', '3 - 1');
INSERT INTO `emp` VALUES ('7', '児童 7', '1', '3 - 1');
INSERT INTO `emp` VALUES ('8', '児童 8', '1', '3 - 1');
INSERT INTO `emp` VALUES ('9', '児童 9', '1', '3 - 1');
INSERT INTO `emp` VALUES ('10', '児童 10', '1', '3 - 1');

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `menuId` int(1) NOT NULL AUTO_INCREMENT COMMENT 'menu id',
  `menuName` varchar(20) DEFAULT NULL COMMENT 'This is display menu name in the screen',
  `siteUrl` varchar(100) DEFAULT NULL COMMENT 'has rule to access url',
  `delFlag` int(1) NOT NULL COMMENT '1:true  0:false',
  `parentId` int(1) DEFAULT NULL,
  `menuIcon` varchar(50) DEFAULT NULL COMMENT 'page show''s icon picture',
  PRIMARY KEY (`menuId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '新闻管理', null, '0', null, 'fa-odnoklassniki');
INSERT INTO `menu` VALUES ('2', '新闻信息', '/learner-springmvc-mybatis/newletter/init', '0', '1', 'fa-odnoklassniki');
INSERT INTO `menu` VALUES ('8', '菜单信息', '/learner-springmvc-mybatis/systemInfo/init', '0', '1', 'fa-meh-o');
INSERT INTO `menu` VALUES ('9', '系统配置', '', '0', null, 'fa-odnoklassniki');
INSERT INTO `menu` VALUES ('10', '配置分类', '/learner-springmvc-mybatis/type/init', '0', '9', 'fa-bars');

-- ----------------------------
-- Table structure for `new`
-- ----------------------------
DROP TABLE IF EXISTS `new`;
CREATE TABLE `new` (
  `newId` varchar(50) NOT NULL COMMENT '主键字段',
  `newTitle` varchar(200) NOT NULL COMMENT '新闻标题',
  `newDetails` longtext NOT NULL COMMENT '新闻详情',
  `pushTime` varchar(50) NOT NULL COMMENT '新闻发布时间',
  `pushPerson` varchar(20) NOT NULL COMMENT '新闻发布人',
  `delFlag` int(1) NOT NULL COMMENT '用于标识数据是否逻辑删除',
  `flowUpTop` int(1) NOT NULL COMMENT '新闻是否置顶',
  `thumbnails` varchar(200) DEFAULT NULL COMMENT '列表缩列图',
  `typeId` varchar(50) NOT NULL COMMENT '关联分类表ID',
  PRIMARY KEY (`newId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of new
-- ----------------------------
INSERT INTO `new` VALUES ('553e3129-a6a8-4e6c-a972-271d490058fa', '自动工具 之 ADT', '<h2>自动工具 之 ADT</h2>\r\n\r\n<p><em>2017-11-03</em>&nbsp;<em>穆建伟</em>&nbsp;<a href=\"https://mp.weixin.qq.com/s?__biz=MzI2MTkwMjc0OQ==&amp;mid=2247483681&amp;idx=1&amp;sn=ef8cffc7ff9f8092fe806a77fc5a7428&amp;chksm=ea5219d3dd2590c52da4be958b724860ed53998149d58047e5f96d2c14e3b338e81d91c777b3&amp;scene=0&amp;key=b5f02d82cd7f9fcf5917e42c9e234584ad6a9d6490708414ad6c6d51fbbedf827a427298463c0e0efb29618de87c60e4f9754a4387e40227301a4d4b32789d3dada87e588d7b0962eaaaa4a060af66c2&amp;ascene=1&amp;uin=NjA3MTE2NTM1&amp;devicetype=Windows+7&amp;version=6205051a&amp;pass_ticket=ZckzP9zQt8ZRhsn6Ok6ccEEZ5X%2Bcc3JBbSwxzZn5yWGhGJQmthB%2F%2BJSkbprAmVJu&amp;winzoom=1##\">Digital日本</a></p>\r\n\r\n<p><img src=\"https://mmbiz.qpic.cn/mmbiz_png/M1d2IECOEMrRTCYtgmWtnUwpHMZld81qhibqonWSaUiaqrxJeTNTuYaMqtcqETzIPVyjZG4xNzxxsX04DSjtGaGw/640?wx_fmt=png&amp;tp=webp&amp;wxfrom=5&amp;wx_lazy=1\" /></p>\r\n\r\n<p>今天给大家介绍下目前在日本ETL项目上普遍运用的一款自动化工具ADT。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>ADT全称Accenture Delivery Tool（还有其Web扩展版Themis）</p>\r\n\r\n<p>基于大规模批量自动化作业的理念，目标面向大规模的SI开发项目，设计开发了这款开发工具ADT。用.NET开发，DB采用了SqlServer。</p>\r\n\r\n<p><br />\r\n应用场景：</p>\r\n\r\n<p>目前主要应用于ETL相关的Data Migration/Intergration领域。尤其对于设计开发标准要求极为严格的日本项目。</p>\r\n\r\n<p>应用的DB和ETL工具不限，目前已经应用到SqlServer，TeraData，Redshift，文件的变换。ETL工具目前只应用了PowerCenter。当然对于扩展扩展也是比较容易的，只需修改接续命令和调用语句即可。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>机能介绍：</p>\r\n\r\n<p><img src=\"https://mmbiz.qpic.cn/mmbiz_png/M1d2IECOEMrRTCYtgmWtnUwpHMZld81qXBL10xgR8Dst4rj4osJuhFKjpoRfde4LGcLErOa0nNSpP06icPr5z0A/640?wx_fmt=png&amp;tp=webp&amp;wxfrom=5&amp;wx_lazy=1\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>设计管理&amp;影响分析&amp;设计整合：</strong></p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;通过ADT将设计全部上传到DB。通过其版本管理功能可跟踪设计的版本更新，一定程度上可起到版本管理控制的功能。我们有的项目完全不用SVN等版本管理工具，完全通过ADT来管理。</p>\r\n\r\n<p>&nbsp;&nbsp; 设计保存在DB的优点很多，例如发生障害时易于把控影响范围，通过SQL全量检查，全量修改，深度统计解析等。</p>\r\n\r\n<p><strong>自动生成代码&amp;自动生成测试脚本：</strong></p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp; 通过分析保存在DB中的设计资源，自动生成DDL，带有逻辑变化的SQL。自动生成测试脚本(Bat, Shell, SQL等）</p>\r\n\r\n<p><strong>自动化生成测试式样书&amp;测试数据：</strong></p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp; 通过分析逻辑变化式样书，网罗的条件分支，根据式样书模板，自动生成测试式样书，测试CAS，测试数据。</p>\r\n\r\n<p><strong>自动化执行：</strong></p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;自动执行测试脚本，自动调用程序，结果比对，最终收集测试结果，生成测试结果报告。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>目前已有多个项目应用了ADT，尤其是利用PowerCenter做ETL工具的项目，结合自动化生成WorkFlow XML的工具，可将难度不是很高的作业全部自动化执行。例如数据移行的ODS阶段，一般都会有几百，上千的WorkFlow需要做成。传统的手工作业不但耗费时间，也难以保证作业的质量。利用自动化工具之后，可在短时间内就完成几百本WorkFlow的开发和测试。不但提高了作业速度，作业质量也大幅提高。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>募集：</strong>ADT还有很多不完备的地方，目前正在有计划的对其升级和改造。并且任何项目投入和使用都需要定制和持续性的维护，所以<strong>非常欢迎有.NET开发经验或者对CODING有兴趣的伙伴的积极的参与进来</strong><strong>。届时会有我们ADT创造者之一的亦枫同学给你进行培训，带你飞。</strong></p>\r\n\r\n<p><strong>联系方式：greg.yifeng.chen@accenture.com</strong></p>\r\n\r\n<p>最后附上我们ADT创造者之一 亦枫　的风采~。</p>\r\n\r\n<p>传说有个腼腆的上海好男银~。。。</p>\r\n\r\n<p><img src=\"https://mmbiz.qpic.cn/mmbiz_png/M1d2IECOEMrRTCYtgmWtnUwpHMZld81qpeiaJHM32KiaO1RicBWib5ZNQaDicvExJA4LqH4wbd9CZCJ3lOkX8MGM6tA/640?wx_fmt=png&amp;tp=webp&amp;wxfrom=5&amp;wx_lazy=1\" style=\"height:302px; width:457px\" /></p>\r\n\r\n<p>IT从业了好多年~~~~</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>~~~~~~~~~~~</p>\r\n\r\n<p>~~~~~~~~~~~~~~~~~~~~~~</p>\r\n\r\n<p>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>\r\n\r\n<p>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>\r\n\r\n<p>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>\r\n\r\n<p>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>\r\n\r\n<p>就会把自己头发剃掉！！！</p>\r\n\r\n<p><img src=\"https://mmbiz.qpic.cn/mmbiz_png/M1d2IECOEMrRTCYtgmWtnUwpHMZld81qbfXzcjrvfhj6lCMOfqPLbTRsQ5YfUXQ3McZekBu5vibT8rjN3mQ35Ng/640?wx_fmt=png&amp;tp=webp&amp;wxfrom=5&amp;wx_lazy=1\" style=\"height:470px; width:375px\" /></p>\r\n', '2017-11-03 14:17:06', '1', '0', '1', '/upload/WeChat Image_20171103141430.jpg', '5595c2db-7cc8-42b8-8a54-3fe12399a53c');
INSERT INTO `new` VALUES ('9cfd9888-f7d7-4f5f-8a87-adf2ac412b26', '虚远大于实：不要把特斯拉市值超越通用汽车当回事儿', '<h1>虚远大于实：不要把特斯拉市值超越通用汽车当回事儿</h1>\r\n\r\n<p><a href=\"https://baijia.baidu.com/u?app_id=1536766396301809&amp;wfr=pc&amp;fr=new_dtl\" target=\"_blank\">孙永杰</a> 2017-04-06 08:00 阅读：7644</p>\r\n\r\n<p>摘要：日前，特斯拉突破300美元大关，让该公司总市值达到527亿美元，高于通用汽车496亿美元的市值，进而成为全美市值第一汽车制造商。</p>\r\n\r\n<p><img src=\"http://e.hiphotos.baidu.com/news/crop%3D19%2C0%2C556%2C334%3Bw%3D638/sign=1dc6554e6581800a7aaad34e8c040ad6/96dda144ad3459827e29495305f431adcaef8454.jpg\" /></p>\r\n\r\n<p>日前，特斯拉突破300美元大关，让该公司总市值达到527亿美元，高于通用汽车496亿美元的市值，进而成为全美市值第一汽车制造商。对此不仅业内欢欣鼓舞，认为以特斯拉为代表的新型科技企业已经战胜了老牌的传统汽车企业，就连特斯拉CEO伊隆&bull;马斯克（Elon Musk）也兴奋之余借此利用推文对之前做空特斯拉股票的投资人进行了一番嘲讽。但我们认为业内（包括马斯克本人）不应把这个市值太当回事儿。原因何在？</p>\r\n\r\n<p>其实业内知道，市值这个东西虽然有一定的参考性（其实充其量就是参考），但其瞬息万变的特性更多是资本市场的一种不确定性的反映，一个半月前，特斯拉发布2016年第四季度财报，在营收同比增长88%实际利好的情况下，特斯拉股价竟然大跌6个点，并导致作为特斯拉最大股东的马斯克本人的净值瞬间缩水5亿美元便是一个明证。而具体到此次特斯拉市值超越传统汽车厂商通用汽车，主要是受到特斯拉今年第一季度其交付新车数量创造了特斯拉新的季度销售纪录和中国互联网巨头腾讯控股出人意料地以18亿美元入股特斯拉，让饱受资金短缺困扰（也是最影响特斯拉股价）的特斯拉有了喘息之机，还有一个因素是跟特斯拉旗下航空航天公司SpaceX有关，最后就是马斯克承诺其包括Model3在内的汽车产量将在2018年底实现50万辆的目标。</p>\r\n\r\n<p>到这里，我们看到可以持续影响特斯拉股价的实的因素还是其销量、产量这些与特斯拉核心业务相关的指标。既然如此，我们应该将特斯拉与超越的通用和福特等所在汽车产业中予以对比和分析，方能看出此次特斯拉成全美汽车市值第一（先后超越福特和通用汽车）制造商背后的实与虚。</p>\r\n\r\n<p>据统计，2016年特斯拉全年营收70亿美元，销量76285辆（未能实现全年销售8～9万辆的既定目标）；福特营收为1518亿美元，销量665万辆；通用汽车营收1664亿美元，销量1000万辆，以此计算，特斯拉的销量仅是福特和通用的1/87和1/131；营收仅为福特和通用的1/21和1/23。若要从利润作比较，福特为46亿美元；通用汽车为94.3亿美元，而特斯拉仍处于&ldquo;烧钱&rdquo;阶段，2016年全年亏损6亿美元。</p>\r\n\r\n<p><img src=\"http://e.hiphotos.baidu.com/news/w%3D638/sign=75fe0efb394e251fe2f7e7fb9f84c9c2/d31b0ef41bd5ad6ee90ec82b88cb39dbb7fd3c7f.jpg\" /></p>\r\n\r\n<p>正是由于销量、营收和利润上天壤之别的差距，就出现了更奇葩的说法和比较。例如市场研究公司Navigant的高级研究分析师称：福特售出的每一辆汽车的利润都很可能高于特斯拉在整个2016年中所创造出的全部利润；巴克莱银行分析师则表示，如果拿市值除以销量，特斯拉每辆车净值可达60万美元，福特每辆车只值7000美元，而美国《华尔街日报》此前更是把汽车企业的销量和市值联系起来做了统计比较发现：特斯拉每卖出一辆车，转化成股价就是4.4美元，而福特和通用每卖出一辆车，对应的股价只有32美分和33美分。</p>\r\n\r\n<p><img src=\"http://d.hiphotos.baidu.com/news/w%3D638/sign=8501e27897510fb378197494e131c893/8b82b9014a90f603104130863012b31bb151ed7a.jpg\" /></p>\r\n\r\n<p>不知业内看了上述在务实的实际市场（销量、营收和利润）和务虚的资本市场（股价）的表现作何感想？我们的感觉是实得真实（通用和福特为代表的传统车企），虚得真虚（特斯拉）。</p>\r\n\r\n<p>当我们看完特斯拉与传统车企虚实之间的巨大差异之后，不妨看看特斯拉有别于传统车企的核心竞争力，即所谓的电动和自动（未来的无人）驾驶到底如何？</p>\r\n\r\n<p>众所周知，衡量电动汽车造价竞争力的惟一重要因素是电池的数量和使用成本。根据这些年来的研究，特斯拉是众多车厂中最重视其电池初始容量的一家，例如最近一份来自特斯拉的报告表明，特斯拉的电池可以做到 190美元/千瓦时的低价，但这与通用汽车Bolt所搭载的189美元/千瓦时电池组成本相比已经没有优势可言。</p>\r\n\r\n<p><img src=\"http://b.hiphotos.baidu.com/news/w%3D638/sign=e0f2bf6650ee3d6d22c684c87b146d41/6159252dd42a283485549aca52b5c9ea14cebf05.jpg\" /></p>\r\n\r\n<p>此外，衡量一个电池好坏的另一指标就是电池寿命。如果电池在完全的放电和充电重复10次之后，失去其20%的存储能力，就意味着输掉了与其他电池厂家在电池寿命上的竞争。特斯拉提供8年不限公里数的电池保修。但是这并不表示特斯拉采用了市面上最好的电动汽车电池。欧洲最大的电池生产商之一BMZ曾经表示，特斯拉车内使用的18650电池寿命并不是很长。相比之下，宝马i3的电池设计寿命是20年，且这种寿命会体现到每一个月。这意味着剔出用户使用车的年限（很难达到8年和20年），即便是在最初的使用阶段，传统汽车厂商的电池效率就已经高于特斯拉。</p>\r\n\r\n<p>至于自动驾驶，就在特斯拉市值超越通用汽车不久前，一份来自Navigant Research的自动驾驶研究报告为 18 汽车厂商、供应商和技术公司进行了一次综合排名。其中，传统汽车厂商取得了绝对领先的优势。其中福特和通用分别排在第一和第二，特斯拉甚至根本没有进入前10榜单中。而在由领导者（Leader）、竞争者（Contender）、挑战者（Challenger）和跟随者（Follower）构成的自动驾驶竞争格局象限中，也仅是挑战者的角色。对此，Navigant的分析认为，特斯拉之所以排名靠后，是因为其产品质量、营销策略、财务的稳定性方面仍有诸多不足，而且其自动驾驶技术水平也难以做到 Level 4 以上的水准。尽管业内对于此份报告颇有争议，但Navigant Research的理由并非全无根据，尤其是在自动驾驶驾驶技术本身上。</p>\r\n\r\n<p><img src=\"http://c.hiphotos.baidu.com/news/w%3D638/sign=ffbecfbf9b58d109c4e3aab1e95accd0/9e3df8dcd100baa1effbeb7a4e10b912c9fc2e1f.jpg\" /></p>\r\n\r\n<p>据加利福尼亚州车辆管理局提交的材料显示，2016年10、11月，特斯拉自动驾驶汽车在加利福尼亚州公路上行驶了550英里(885公里)，司机对汽车进行了182次控制，平均每英里为0.33次。相比之下，,Alphabet公司旗下无人驾驶公司Waymo的无人驾驶车辆其人工控制次数则从原来的每千英里平均0.8次下降到了0.2次，而且大多数路测是在&ldquo;复杂的城市和郊区街道&rdquo;上进行；宝马在其自动驾驶汽车638英里(1027公里)行程中，司机只对汽车进行了一次控制；梅赛德斯在673英里(1083公里)行程中，司机曾336次控制汽车，但其自动驾驶汽车只是在城市道路上行驶。从这些统计数据不难看出，在自动驾驶技术上，无论是和科技还是传统汽车企业，特斯拉也没有绝对领先的优势，甚至处在落后的状态。</p>\r\n\r\n<p>除了上述核心技术没有外界和特斯拉宣传和自认为的那般领先之外，在产能上，尽管马斯克重申特斯拉明年的汽车总产量能够达到50万辆，其中包括43万辆Model3。但是，特斯拉&ldquo;爽约&rdquo;早已不是什么新鲜事，先前的Model S和Model X就都推迟了交付时间。对此，摩根士丹利认为，特斯拉将不仅仅无法达成2017年的Model 3量产计划，而且最终的定价可能要高于3.5万美元，而在6万美元左右。与此同时，几乎所有华尔街分析师都同意此观点。即便是最看好特斯拉的分析师，也不认为特斯拉能够在明年销售50万辆电动汽车。看来在实的汽车的量产上，特斯拉也存在着极大的挑战和风险。</p>\r\n\r\n<p><img src=\"http://g.hiphotos.baidu.com/news/w%3D638/sign=57d332e99e2bd40742c7d0fe438b9e9c/b64543a98226cffc40e01373b0014a90f703ea2d.jpg\" /></p>\r\n\r\n<p>综上所述，我们认为，此次特斯拉超越福特和通用汽车成全美汽车市值第一汽车制造商的背后，其虚的成分要远远大于实的部分，加之股价的变化无常，并非代表特斯拉已经取代了传统车企在现在和未来汽车产业中的地位，更不能借此掩饰特斯拉当下和未来面临的挑战和困境。</p>\r\n', '2017-10-31 15:17:00', '1', '0', '0', '/upload/Tulips.jpg', '5595c2db-7cc8-42b8-8a54-3fe12399a53c');
INSERT INTO `new` VALUES ('f8c2e3f0-b22d-4cf5-8b1a-4f73d18d1d61', '月薪两万的人，如何拥有北京三套房？', '<h2>月薪两万的人，如何拥有北京三套房？</h2>\r\n\r\n<p>原创&nbsp;<em>2017-10-30</em>&nbsp;<em>张五毛</em>&nbsp;<a href=\"https://mp.weixin.qq.com/s?__biz=MzA3MjM3NTgwMg==&amp;mid=2648569883&amp;idx=1&amp;sn=0500acbf30f617bb3e0abb100c9d2b53&amp;chksm=8736148eb0419d98f29e2d284cb20f7f46fea8557b9d149fc40f185de040bc2011740055bf11&amp;scene=21&amp;key=aa4d734c2f5165c4fddfded0ca7c517ebc198271187b37834fad0c29369c38578f62f5ca1cc591ceaac90b94f0d7c82f643910e541d3f458e726bf435530ca90dc793a40ab2ebadbd6749d26af09e221&amp;ascene=7&amp;uin=NjA3MTE2NTM1&amp;devicetype=Windows+7&amp;version=6205051a&amp;pass_ticket=ZckzP9zQt8ZRhsn6Ok6ccEEZ5X%2Bcc3JBbSwxzZn5yWGhGJQmthB%2F%2BJSkbprAmVJu&amp;winzoom=1##\">张先生说</a></p>\r\n\r\n<p><img src=\"https://mmbiz.qpic.cn/mmbiz_jpg/0ibvEOxt0ln4tNjWRQricXAuKH3gZ4aksfbLsfTR5quPQdb51kpy1t2uUiapfnPdRydmgVCvvnLNurycOgbJsllbw/640?wx_fmt=jpeg&amp;tp=webp&amp;wxfrom=5&amp;wx_lazy=1\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>昨天去健身，教练说：现在健身房的生意越来越好，我却越来越闲。我一头雾水，按说健身房生意越好，健身教练应该越忙才对。</p>\r\n\r\n<p>教练说，学员办完卡，第一个月每周打卡，第二个月每月打卡，第三个月，就会来问我能不能退卡？</p>\r\n\r\n<p>教练的话让我想起大学同学郭大熊。上大学时，是篮球队队长，又高又帅，八块腹肌。全院女生都为他犯花痴，直接导致我们院很多女生到现在还是大龄剩女。毕业后，郭大熊进了国企，除了坐办公室，就是出入各种饭局。没几年，就从肌肉男变成了胖熊。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>毕业十周年时，那些曾经因为害羞，不敢接近郭大熊的已婚妇女，终于可以放开手脚了：纷纷上来摸郭大熊的大肚腩。同学们劝他赶快减肥，他满口答应。三个月后，成效显著，郭大熊体重稳定在了200斤。</p>\r\n\r\n<p>和郭大熊一样的人不在少数，毕业10年，大多数人的身材都已走形，原来是身高180，现在是体重180，原来性生活是20分，现在都变成了20秒。瑜伽垫都曾买过，最后变成了地毯；跑步机都有，最后变成了晾衣架。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>很多人开始减肥时，把微信头像换成：不减十斤不换头像。然后一语成谶，头像就真的再也没换过；还有人减肥前会发朋友圈：从今天开始，每天坚持跑5公里。遇到一个下雨天之后，就再也没有打过卡。</p>\r\n\r\n<p>有钱办卡的人越来越多，有毅力坚持健身的人却越来越少。说到底还是没有自律能力。经常看到嚷嚷着要减肥的女同事，吃得比谁都多。然后安慰自己：没事没事，米饭不发胖，水果不发胖，白肉不发胖，吃完这顿我就减肥！</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>体重都掌控不了，拿什么去掌控人生？类似&ldquo;吃完这顿就去减肥&rdquo;这样的话，在职场里也经常听到。</p>\r\n\r\n<p>&ldquo;我打完这局王者荣耀就去做PPT。&rdquo;</p>\r\n\r\n<p>&ldquo;我再看一集美剧就去画这张海报。&rdquo;</p>\r\n\r\n<p>&ldquo;先吃午饭，就开始写文案。&rdquo;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>曾经，我很讨厌职场上的各种规章制度。走上管理岗之后，我就开始破坏公司的各种制度。坚持无为而治，相信人性本善。我说，写方案人不用打卡，不用来公司上班，只要能按时交活就行。</p>\r\n\r\n<p>试行一月，结果是大家写ppt的水平都退步了。后来才了解到，他们都在家里打游戏，拖到快交活的时候，随便应付一下。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>很多职场拖延症患者的工作节奏是这样的： 9点到公司，先不紧不慢地吃个早餐，刷刷微博和朋友圈。直到刷不出来新内容，才新建一个word或PPT；建完之后，觉得工作时需要一点氛围，才能有灵感。就带上耳机，放首音乐；后来发现这首歌挺好听的，打开网页，了解一下这个歌手；了解完歌手就要去吃午饭了；吃完午饭觉得有点困，趴桌子上休息几分钟。醒来之后，需要再看看娱乐版新闻，聊聊微信。刷完之后，下班时间就快要到了，赶紧糊弄一下，应付领导。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>现在，我理解了为什么公司要有那么多规章制度，为什么要有KPI。因为依靠自觉没法完成任务，依靠自律没法建成一支队伍。</p>\r\n\r\n<p>人之初，性本懒。这些年的职场经验告诉我：相信人性，不如相信制度；相信制度，不如相信身材。我发现，那些能控制自己身材的员工，都不会太差。而那些不自律的人，最后都会陷入一张欲望丛生，杂乱无章的生活巨网，过上了平庸琐碎的人生。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>自律，说到底就是自我管理。我有位大学同学叫武哥。这哥们上大学时百米速度是11秒7。12年过去了，百米速度是11秒9。上大学时，经常在足球场上演帽子戏法；毕业十年聚会时，他在足球场上演了糖葫芦戏法&mdash;&mdash;45分钟一个人进了8个球。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img src=\"https://mmbiz.qpic.cn/mmbiz_jpg/0ibvEOxt0ln4tNjWRQricXAuKH3gZ4aksfmA3v9pZF3q4qQHtgwluakaCZ6BvlY3cEKpSIszKtEtiaCHJXGU0bJPg/640?wx_fmt=jpeg&amp;tp=webp&amp;wxfrom=5&amp;wx_lazy=1\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>毕业聚会上，武哥谦虚地说：&ldquo;我是个普通人，干不出啥惊天动地的事，守不住初心，只能守一下初身！这12年，我每天都跑一个五公里，每周都踢两场球。&rdquo;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>毕业十多年，发财的不少，当官的也不少，但能像武哥一样，守得住&ldquo;初身&rdquo;的只有他一人。每个人都明白自律的重要性，但怎样才能做到真正自律呢？我有点心得体会，和大家分享一下：</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>一、给自己营造一个自律的环境</strong></p>\r\n\r\n<p>一心只读圣贤书，两耳不闻窗外事。这种境界我们这些凡夫俗子很难做到。没有不闻窗外事的定力，就尽量远离窗外事。写《春困》时，我尝试过在办公室写，在家里写，在咖啡馆写，都失败了，效率极低！后来去烟台闭关，把自己关在一个空屋子里，两个月写了五六万字。</p>\r\n\r\n<p>如果自己控制不了自己，就让环境来帮你控制。减不了肥，先远离饭局；戒不了王者荣耀，先卸载游戏；工作效率低，先把手机放抽屉里。事实证明，一个良好的工作环境，可以屏蔽掉大部分干扰，极大地提高自制力和工作效率。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>二、以管理工作的方式管理生活</strong></p>\r\n\r\n<p>工作会有KPI，会有各种进度表，会有各种统计。这些表格是为了对工作进行有效管理。生活同样需要这样的管理。因为我们的时间、精力、情绪、资源都是有限的，进行管理有利于我们梳理出一个清晰的自己。</p>\r\n\r\n<p>苏格拉底说，未经省察的人生没有意义。在我看来，没有管理的人生也是一滩烂泥。每个人一天都是24小时，有人把时间规划的井井有条，高效产出；有的人却浑浑噩噩，一事无成。</p>\r\n\r\n<p>我有个女同事，学历不高，长相一般。不怎么会交际，也不是很钻营。在公司干了十多年，混了个行政主管，工资也才两万出头。就这么一个不起眼的人，却在北京拥有三套住房。</p>\r\n\r\n<p>我问她，哪来的那么多钱？</p>\r\n\r\n<p>她说：&ldquo;理财无外乎开源节流。我没什么开源能力，就只能在节流方面使劲努力。&rdquo;</p>\r\n\r\n<p>我说，赶紧跟我说说你是怎么节流的？</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>她说：&ldquo;我有两大理财法宝。一是我老公，他是个极简主义者，不喜欢家里放太多东西，我每次想往家里买东西，都得经过他同意；另一大法宝是一款APP,叫网易有钱，这个记账工具对我帮助特别大。能使我清晰了解自己的资产：进来多少，花了多少？哪些该花，哪些不该花。一目了然。很多人觉得资产管理是有钱人的事，但在我看来，财富是管理出来的，越穷的人，越应该记好账，理好财。&rdquo;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>在同事的建议下，我也下载了网易有钱，目前试用了一个月，说一下我的使用体验：</p>\r\n\r\n<p><strong>1.</strong>界面相当简单，基本上属于傻子都会用。只需要把资金账户同步到APP上，就能在几分钟之内理清一个月的账单。</p>\r\n\r\n<p><strong>2.</strong>每笔消费同步下来，可以自动归类到餐饮、购物等类目，形成反映真实消费情况的收支报表，可以看到自己的消费偏好，纠正过度消费。每次看到自己的就餐消费报表，我都想抽嘴！</p>\r\n\r\n<p><strong>3.</strong>我最喜欢的是&ldquo;我的投资&rdquo;功能。可以添加各种投资帐户。添加之后就能显示每支股票、基金的累计盈亏额、累计盈亏比例，根据盈亏数据，对自己的投资理财方向适时做优化调整。</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>每个平庸的人生背后，都有一颗放荡不羁的灵魂；每一个成功故事的核心，都是自觉，自控，自我激励。天赋，机遇这些不可控的东西可以让一个人跨越式发展；但高度自律却可以保证我们拥有一个高于平均线的人生。</p>\r\n', '2017-11-03 14:12:55', '1', '0', '1', '/upload/1509689519(1).jpg', '5595c2db-7cc8-42b8-8a54-3fe12399a53c');

-- ----------------------------
-- Table structure for `type`
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `typeId` varchar(50) NOT NULL COMMENT '主键字段',
  `typeName` varchar(20) NOT NULL COMMENT '分类名称',
  `delFlag` int(1) NOT NULL COMMENT '用于标识数据是否逻辑删除',
  PRIMARY KEY (`typeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('0497a509-ff62-4ef3-bcc3-f3200d054c37', '娱乐', '0');
INSERT INTO `type` VALUES ('24493a7f-95d7-4730-82ad-f8ca4f32446a', '互联网', '0');
INSERT INTO `type` VALUES ('3054aaaa-9d89-475e-9843-9fd6bca79785', '国际', '0');
INSERT INTO `type` VALUES ('3069203c-3f7d-4965-bef5-4517ca011189', '体育', '0');
INSERT INTO `type` VALUES ('3f9aa252-f66e-49ee-a06f-72cb64797ea3', '时尚', '0');
INSERT INTO `type` VALUES ('45dbbf5b-6094-4d99-9090-a2fa413610c5', '财经', '0');
INSERT INTO `type` VALUES ('5595c2db-7cc8-42b8-8a54-3fe12399a53c', '百家号', '0');
INSERT INTO `type` VALUES ('63dba4ba-3ea2-45d2-b2fc-baea157e65a2', '国内', '0');
INSERT INTO `type` VALUES ('964731b7-5c5d-425c-9896-c9240f6dd1d2', '游戏', '0');
INSERT INTO `type` VALUES ('9f81fe6b-bd6c-48d9-91a4-d44aa0c2a605', '时尚', '0');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) NOT NULL,
  `password` varchar(500) NOT NULL,
  `realName` varchar(50) DEFAULT NULL,
  `delFlag` int(1) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '$2a$10$rCutIB8gsFWayMS1h9bUxetu83VlwFFB8BpdBIIVm1kdY39xwFWOy', 'Victor.Xue', '0');
