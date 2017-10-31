/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50719
Source Host           : localhost:3307
Source Database       : esdb

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-10-31 16:21:51
*/

SET FOREIGN_KEY_CHECKS=0;

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
INSERT INTO `new` VALUES ('36990ab1-7ec6-4f6a-8c77-dd727e49dd6e', '双11前阿里和京东在忙啥？一场没有硝烟的战争已打响  ', '<h1>双11前阿里和京东在忙啥？一场没有硝烟的战争已打响 <!--jrj_final_title_end--><!-- 标题end --></h1>\r\n\r\n<p><a href=\"http://biz.jrj.com.cn/2017/10/31133523312565.shtml#comment\" target=\"_self\"><em>0</em>评论</a> <!--jrj_final_date_start--> 2017-10-31 13:35:11<!--jrj_final_date_end--> 来源：<!--jrj_final_source_start-->每日经济新闻<!--jrj_final_source_end--> 作者：<!--jrj_final_author_start-->每经记者<!--jrj_final_author_end--> <a href=\"http://itougu.jrj.com.cn/act/billboard-activity?tgqdcode=KPVCJYZZ&amp;ylbcode=B85YL9Q5\">涨停板，就要这样抓 </a></p>\r\n\r\n<p><!--摘要 begin--><!-- 新闻摘要Start --><!-- 新闻摘要end --><!--摘要 end--><!--内容 begin--></p>\r\n\r\n<p>　　&ldquo;双11&rdquo;未到，战争却已打响，一边是时尚潮流品牌及明星大咖助阵，继续保持&ldquo;硅谷+好莱坞&rdquo;风格模式；一边是家电品牌大佬的集体会面，同时与腾讯等互联网企业结盟组团迎战。日前，随着<a href=\"http://usstock.jrj.com.cn/share/BABA/\">阿里</a>、京东两大<a href=\"http://stock.jrj.com.cn/concept/conceptdetail/conceptDetail_ds7.shtml\">电商</a>巨头秀各自&ldquo;朋友圈&rdquo;实力，围绕自身的优势与主场各有攻防的&ldquo;双11&rdquo;大战进入倒计时。</p>\r\n\r\n<p>　　而迎战&ldquo;双11&rdquo;不可回避的话题就是平台之争，值得注意的是，今年既是阿里<a href=\"http://stock.jrj.com.cn/concept/conceptdetail/conceptDetail_sybh.shtml\">新零售概念</a>提出满周年后的&ldquo;双11&rdquo;，也是京东为第四次零售革命铺路的首次&ldquo;双11&rdquo;。在此背景之下，从今年年初开始，京东、天猫的平台战争陡然升级，尤其体现在电商平台对品牌商资源的争夺上，并在今年6~8月已经呈现出白热化的趋势，&ldquo;二选一&rdquo;局面再现。</p>\r\n\r\n<p>　　对于这一现象，一名不愿透露姓名的电商行业分析人士在接受每日经济新闻（微信号：nbdnews）采访时认为，背后不排除平台要求商家&ldquo;站队&rdquo;的可能，但也可能是商家对渠道流量进行对比后，对渠道选择有所侧重的表现。&ldquo;对于电商平台上的商家来说，流量就是生命线，没有流量就没有生意。&rdquo;</p>\r\n\r\n<p>　　因此，对于阿里、京东来说，今年&ldquo;双11&rdquo;不仅是一场销量之争，更是一场通过立体化、多样化的营销手段，在平台资源、流量入口的大比拼。</p>\r\n\r\n<p>　　<strong>&ldquo;朋友圈&rdquo;伙伴齐参战</strong></p>\r\n\r\n<p>　　<a href=\"http://stock.jrj.com.cn/share,601377.shtml\">兴业证券</a>(行情7.83 -1.39%,<a href=\"http://stock.jrj.com.cn/share,601377,zhengu.shtml\">诊股</a>)分析预计，今年&ldquo;双11&rdquo;的销售额将突破2000亿元，但今年除了线上流量，线下作为突破口更成为兵家必争之地。</p>\r\n\r\n<p>　　阿里于日前在上海举办了天猫&ldquo;双11&rdquo;全球潮流盛典，邀请了包括LVMH集团、雅诗兰黛集团、维多利亚的秘密等在内的多个国际时尚集团和品牌。国产品牌方面也不乏<a href=\"http://stock.jrj.com.cn/share,600295.shtml\">鄂尔多斯</a>(行情13.44 +2.44%,<a href=\"http://stock.jrj.com.cn/share,600295,zhengu.shtml\">诊股</a>)、安踏、<a href=\"http://stock.jrj.com.cn/share,600398.shtml\">海澜之家</a>(行情9.73 -0.51%,<a href=\"http://stock.jrj.com.cn/share,600398,zhengu.shtml\">诊股</a>)等传统国货品牌参与。这其中大部分是时尚服饰类商品，因为时尚服饰一直被视为天猫的优势品类，更是淘宝和天猫的起家之本。</p>\r\n', '2017-10-31 16:06:05', '1', '0', '0', '/upload/Koala.jpg', '964731b7-5c5d-425c-9896-c9240f6dd1d2');
INSERT INTO `new` VALUES ('9cfd9888-f7d7-4f5f-8a87-adf2ac412b26', '虚远大于实：不要把特斯拉市值超越通用汽车当回事儿', '<h1>虚远大于实：不要把特斯拉市值超越通用汽车当回事儿</h1>\r\n\r\n<p><a href=\"https://baijia.baidu.com/u?app_id=1536766396301809&amp;wfr=pc&amp;fr=new_dtl\" target=\"_blank\">孙永杰</a> 2017-04-06 08:00 阅读：7644</p>\r\n\r\n<p>摘要：日前，特斯拉突破300美元大关，让该公司总市值达到527亿美元，高于通用汽车496亿美元的市值，进而成为全美市值第一汽车制造商。</p>\r\n\r\n<p><img src=\"http://e.hiphotos.baidu.com/news/crop%3D19%2C0%2C556%2C334%3Bw%3D638/sign=1dc6554e6581800a7aaad34e8c040ad6/96dda144ad3459827e29495305f431adcaef8454.jpg\" /></p>\r\n\r\n<p>日前，特斯拉突破300美元大关，让该公司总市值达到527亿美元，高于通用汽车496亿美元的市值，进而成为全美市值第一汽车制造商。对此不仅业内欢欣鼓舞，认为以特斯拉为代表的新型科技企业已经战胜了老牌的传统汽车企业，就连特斯拉CEO伊隆&bull;马斯克（Elon Musk）也兴奋之余借此利用推文对之前做空特斯拉股票的投资人进行了一番嘲讽。但我们认为业内（包括马斯克本人）不应把这个市值太当回事儿。原因何在？</p>\r\n\r\n<p>其实业内知道，市值这个东西虽然有一定的参考性（其实充其量就是参考），但其瞬息万变的特性更多是资本市场的一种不确定性的反映，一个半月前，特斯拉发布2016年第四季度财报，在营收同比增长88%实际利好的情况下，特斯拉股价竟然大跌6个点，并导致作为特斯拉最大股东的马斯克本人的净值瞬间缩水5亿美元便是一个明证。而具体到此次特斯拉市值超越传统汽车厂商通用汽车，主要是受到特斯拉今年第一季度其交付新车数量创造了特斯拉新的季度销售纪录和中国互联网巨头腾讯控股出人意料地以18亿美元入股特斯拉，让饱受资金短缺困扰（也是最影响特斯拉股价）的特斯拉有了喘息之机，还有一个因素是跟特斯拉旗下航空航天公司SpaceX有关，最后就是马斯克承诺其包括Model3在内的汽车产量将在2018年底实现50万辆的目标。</p>\r\n\r\n<p>到这里，我们看到可以持续影响特斯拉股价的实的因素还是其销量、产量这些与特斯拉核心业务相关的指标。既然如此，我们应该将特斯拉与超越的通用和福特等所在汽车产业中予以对比和分析，方能看出此次特斯拉成全美汽车市值第一（先后超越福特和通用汽车）制造商背后的实与虚。</p>\r\n\r\n<p>据统计，2016年特斯拉全年营收70亿美元，销量76285辆（未能实现全年销售8～9万辆的既定目标）；福特营收为1518亿美元，销量665万辆；通用汽车营收1664亿美元，销量1000万辆，以此计算，特斯拉的销量仅是福特和通用的1/87和1/131；营收仅为福特和通用的1/21和1/23。若要从利润作比较，福特为46亿美元；通用汽车为94.3亿美元，而特斯拉仍处于&ldquo;烧钱&rdquo;阶段，2016年全年亏损6亿美元。</p>\r\n\r\n<p><img src=\"http://e.hiphotos.baidu.com/news/w%3D638/sign=75fe0efb394e251fe2f7e7fb9f84c9c2/d31b0ef41bd5ad6ee90ec82b88cb39dbb7fd3c7f.jpg\" /></p>\r\n\r\n<p>正是由于销量、营收和利润上天壤之别的差距，就出现了更奇葩的说法和比较。例如市场研究公司Navigant的高级研究分析师称：福特售出的每一辆汽车的利润都很可能高于特斯拉在整个2016年中所创造出的全部利润；巴克莱银行分析师则表示，如果拿市值除以销量，特斯拉每辆车净值可达60万美元，福特每辆车只值7000美元，而美国《华尔街日报》此前更是把汽车企业的销量和市值联系起来做了统计比较发现：特斯拉每卖出一辆车，转化成股价就是4.4美元，而福特和通用每卖出一辆车，对应的股价只有32美分和33美分。</p>\r\n\r\n<p><img src=\"http://d.hiphotos.baidu.com/news/w%3D638/sign=8501e27897510fb378197494e131c893/8b82b9014a90f603104130863012b31bb151ed7a.jpg\" /></p>\r\n\r\n<p>不知业内看了上述在务实的实际市场（销量、营收和利润）和务虚的资本市场（股价）的表现作何感想？我们的感觉是实得真实（通用和福特为代表的传统车企），虚得真虚（特斯拉）。</p>\r\n\r\n<p>当我们看完特斯拉与传统车企虚实之间的巨大差异之后，不妨看看特斯拉有别于传统车企的核心竞争力，即所谓的电动和自动（未来的无人）驾驶到底如何？</p>\r\n\r\n<p>众所周知，衡量电动汽车造价竞争力的惟一重要因素是电池的数量和使用成本。根据这些年来的研究，特斯拉是众多车厂中最重视其电池初始容量的一家，例如最近一份来自特斯拉的报告表明，特斯拉的电池可以做到 190美元/千瓦时的低价，但这与通用汽车Bolt所搭载的189美元/千瓦时电池组成本相比已经没有优势可言。</p>\r\n\r\n<p><img src=\"http://b.hiphotos.baidu.com/news/w%3D638/sign=e0f2bf6650ee3d6d22c684c87b146d41/6159252dd42a283485549aca52b5c9ea14cebf05.jpg\" /></p>\r\n\r\n<p>此外，衡量一个电池好坏的另一指标就是电池寿命。如果电池在完全的放电和充电重复10次之后，失去其20%的存储能力，就意味着输掉了与其他电池厂家在电池寿命上的竞争。特斯拉提供8年不限公里数的电池保修。但是这并不表示特斯拉采用了市面上最好的电动汽车电池。欧洲最大的电池生产商之一BMZ曾经表示，特斯拉车内使用的18650电池寿命并不是很长。相比之下，宝马i3的电池设计寿命是20年，且这种寿命会体现到每一个月。这意味着剔出用户使用车的年限（很难达到8年和20年），即便是在最初的使用阶段，传统汽车厂商的电池效率就已经高于特斯拉。</p>\r\n\r\n<p>至于自动驾驶，就在特斯拉市值超越通用汽车不久前，一份来自Navigant Research的自动驾驶研究报告为 18 汽车厂商、供应商和技术公司进行了一次综合排名。其中，传统汽车厂商取得了绝对领先的优势。其中福特和通用分别排在第一和第二，特斯拉甚至根本没有进入前10榜单中。而在由领导者（Leader）、竞争者（Contender）、挑战者（Challenger）和跟随者（Follower）构成的自动驾驶竞争格局象限中，也仅是挑战者的角色。对此，Navigant的分析认为，特斯拉之所以排名靠后，是因为其产品质量、营销策略、财务的稳定性方面仍有诸多不足，而且其自动驾驶技术水平也难以做到 Level 4 以上的水准。尽管业内对于此份报告颇有争议，但Navigant Research的理由并非全无根据，尤其是在自动驾驶驾驶技术本身上。</p>\r\n\r\n<p><img src=\"http://c.hiphotos.baidu.com/news/w%3D638/sign=ffbecfbf9b58d109c4e3aab1e95accd0/9e3df8dcd100baa1effbeb7a4e10b912c9fc2e1f.jpg\" /></p>\r\n\r\n<p>据加利福尼亚州车辆管理局提交的材料显示，2016年10、11月，特斯拉自动驾驶汽车在加利福尼亚州公路上行驶了550英里(885公里)，司机对汽车进行了182次控制，平均每英里为0.33次。相比之下，,Alphabet公司旗下无人驾驶公司Waymo的无人驾驶车辆其人工控制次数则从原来的每千英里平均0.8次下降到了0.2次，而且大多数路测是在&ldquo;复杂的城市和郊区街道&rdquo;上进行；宝马在其自动驾驶汽车638英里(1027公里)行程中，司机只对汽车进行了一次控制；梅赛德斯在673英里(1083公里)行程中，司机曾336次控制汽车，但其自动驾驶汽车只是在城市道路上行驶。从这些统计数据不难看出，在自动驾驶技术上，无论是和科技还是传统汽车企业，特斯拉也没有绝对领先的优势，甚至处在落后的状态。</p>\r\n\r\n<p>除了上述核心技术没有外界和特斯拉宣传和自认为的那般领先之外，在产能上，尽管马斯克重申特斯拉明年的汽车总产量能够达到50万辆，其中包括43万辆Model3。但是，特斯拉&ldquo;爽约&rdquo;早已不是什么新鲜事，先前的Model S和Model X就都推迟了交付时间。对此，摩根士丹利认为，特斯拉将不仅仅无法达成2017年的Model 3量产计划，而且最终的定价可能要高于3.5万美元，而在6万美元左右。与此同时，几乎所有华尔街分析师都同意此观点。即便是最看好特斯拉的分析师，也不认为特斯拉能够在明年销售50万辆电动汽车。看来在实的汽车的量产上，特斯拉也存在着极大的挑战和风险。</p>\r\n\r\n<p><img src=\"http://g.hiphotos.baidu.com/news/w%3D638/sign=57d332e99e2bd40742c7d0fe438b9e9c/b64543a98226cffc40e01373b0014a90f703ea2d.jpg\" /></p>\r\n\r\n<p>综上所述，我们认为，此次特斯拉超越福特和通用汽车成全美汽车市值第一汽车制造商的背后，其虚的成分要远远大于实的部分，加之股价的变化无常，并非代表特斯拉已经取代了传统车企在现在和未来汽车产业中的地位，更不能借此掩饰特斯拉当下和未来面临的挑战和困境。</p>\r\n', '2017-10-31 15:17:00', '1', '0', '0', '/upload/Tulips.jpg', '5595c2db-7cc8-42b8-8a54-3fe12399a53c');

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
