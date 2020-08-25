--タスク
create table if not exists task (task_id text PRIMARY KEY, task_name text, task_exp INTEGER,reg_date text, upd_date text);
--タグ
create table if not exists tag (tag_id text PRIMARY KEY, tag_name text, reg_date text, upd_date texttext);
--タスク-タグ中間テーブル
create table if not exists task_tag (task_id text PRIMARY KEY, tag_id text);
--アプリログ
create table if not exists AppLog (Id text PRIMARY KEY,StartDateTime text, EndDateTime text);
--経験値マスタ
create table if not exists exp (level_id INTEGER PRIMARY KEY,required_exp INTEGER);
--レベルビュー
Create VIEW if not exists View_CurrentLevel as
select currnt_exp_id, 
           SUM_EXP current_exp,required_exp - SUM_EXP next_requiredexp from exp
inner join 
(
select t0.level_id currnt_exp_id, 
           SUM_EXP  from exp t0,
(
SELECT SUM(task_exp) SUM_EXP
FROM task 
) t1

where SUM_EXP-required_exp  >= 0
) currnt_exp
on level_id = currnt_exp_id + 1
;

--経験値マスタ初期データ投入
insert or ignore into Exp(level_id,required_exp) values(1,0);
insert or ignore into Exp(level_id,required_exp) values(2,300);
insert or ignore into Exp(level_id,required_exp) values(3,450);
insert or ignore into Exp(level_id,required_exp) values(4,600);
insert or ignore into Exp(level_id,required_exp) values(5,750);
insert or ignore into Exp(level_id,required_exp) values(6,900);
insert or ignore into Exp(level_id,required_exp) values(7,1050);
insert or ignore into Exp(level_id,required_exp) values(8,1200);
insert or ignore into Exp(level_id,required_exp) values(9,1350);
insert or ignore into Exp(level_id,required_exp) values(10,1500);
insert or ignore into Exp(level_id,required_exp) values(11,1650);
insert or ignore into Exp(level_id,required_exp) values(12,1800);
insert or ignore into Exp(level_id,required_exp) values(13,1950);
insert or ignore into Exp(level_id,required_exp) values(14,2100);
insert or ignore into Exp(level_id,required_exp) values(15,2250);
insert or ignore into Exp(level_id,required_exp) values(16,2400);
insert or ignore into Exp(level_id,required_exp) values(17,2550);
insert or ignore into Exp(level_id,required_exp) values(18,2700);
insert or ignore into Exp(level_id,required_exp) values(19,2850);
insert or ignore into Exp(level_id,required_exp) values(20,3000);
insert or ignore into Exp(level_id,required_exp) values(21,3150);
insert or ignore into Exp(level_id,required_exp) values(22,3300);
insert or ignore into Exp(level_id,required_exp) values(23,3450);
insert or ignore into Exp(level_id,required_exp) values(24,3600);
insert or ignore into Exp(level_id,required_exp) values(25,3750);
insert or ignore into Exp(level_id,required_exp) values(26,3900);
insert or ignore into Exp(level_id,required_exp) values(27,4050);
insert or ignore into Exp(level_id,required_exp) values(28,4200);
insert or ignore into Exp(level_id,required_exp) values(29,4350);
insert or ignore into Exp(level_id,required_exp) values(30,4500);
insert or ignore into Exp(level_id,required_exp) values(31,4650);
insert or ignore into Exp(level_id,required_exp) values(32,4800);
insert or ignore into Exp(level_id,required_exp) values(33,4950);
insert or ignore into Exp(level_id,required_exp) values(34,5100);
insert or ignore into Exp(level_id,required_exp) values(35,5250);
insert or ignore into Exp(level_id,required_exp) values(36,5400);
insert or ignore into Exp(level_id,required_exp) values(37,5550);
insert or ignore into Exp(level_id,required_exp) values(38,5700);
insert or ignore into Exp(level_id,required_exp) values(39,5850);
insert or ignore into Exp(level_id,required_exp) values(40,6000);
insert or ignore into Exp(level_id,required_exp) values(41,6150);
insert or ignore into Exp(level_id,required_exp) values(42,6300);
insert or ignore into Exp(level_id,required_exp) values(43,6450);
insert or ignore into Exp(level_id,required_exp) values(44,6600);
insert or ignore into Exp(level_id,required_exp) values(45,6750);
insert or ignore into Exp(level_id,required_exp) values(46,6900);
insert or ignore into Exp(level_id,required_exp) values(47,7050);
insert or ignore into Exp(level_id,required_exp) values(48,7200);
insert or ignore into Exp(level_id,required_exp) values(49,7350);
insert or ignore into Exp(level_id,required_exp) values(50,7500);
insert or ignore into Exp(level_id,required_exp) values(51,7650);
insert or ignore into Exp(level_id,required_exp) values(52,7800);
insert or ignore into Exp(level_id,required_exp) values(53,7950);
insert or ignore into Exp(level_id,required_exp) values(54,8100);
insert or ignore into Exp(level_id,required_exp) values(55,8250);
insert or ignore into Exp(level_id,required_exp) values(56,8400);
insert or ignore into Exp(level_id,required_exp) values(57,8550);
insert or ignore into Exp(level_id,required_exp) values(58,8700);
insert or ignore into Exp(level_id,required_exp) values(59,8850);
insert or ignore into Exp(level_id,required_exp) values(60,9000);
insert or ignore into Exp(level_id,required_exp) values(61,9150);
insert or ignore into Exp(level_id,required_exp) values(62,9300);
insert or ignore into Exp(level_id,required_exp) values(63,9450);
insert or ignore into Exp(level_id,required_exp) values(64,9600);
insert or ignore into Exp(level_id,required_exp) values(65,9750);
insert or ignore into Exp(level_id,required_exp) values(66,9900);
insert or ignore into Exp(level_id,required_exp) values(67,10050);
insert or ignore into Exp(level_id,required_exp) values(68,10200);
insert or ignore into Exp(level_id,required_exp) values(69,10350);
insert or ignore into Exp(level_id,required_exp) values(70,10500);
insert or ignore into Exp(level_id,required_exp) values(71,10650);
insert or ignore into Exp(level_id,required_exp) values(72,10800);
insert or ignore into Exp(level_id,required_exp) values(73,10950);
insert or ignore into Exp(level_id,required_exp) values(74,11100);
insert or ignore into Exp(level_id,required_exp) values(75,11250);
insert or ignore into Exp(level_id,required_exp) values(76,11400);
insert or ignore into Exp(level_id,required_exp) values(77,11550);
insert or ignore into Exp(level_id,required_exp) values(78,11700);
insert or ignore into Exp(level_id,required_exp) values(79,11850);
insert or ignore into Exp(level_id,required_exp) values(80,12000);
insert or ignore into Exp(level_id,required_exp) values(81,12150);
insert or ignore into Exp(level_id,required_exp) values(82,12300);
insert or ignore into Exp(level_id,required_exp) values(83,12450);
insert or ignore into Exp(level_id,required_exp) values(84,12600);
insert or ignore into Exp(level_id,required_exp) values(85,12750);
insert or ignore into Exp(level_id,required_exp) values(86,12900);
insert or ignore into Exp(level_id,required_exp) values(87,13050);
insert or ignore into Exp(level_id,required_exp) values(88,13200);
insert or ignore into Exp(level_id,required_exp) values(89,13350);
insert or ignore into Exp(level_id,required_exp) values(90,13500);
insert or ignore into Exp(level_id,required_exp) values(91,13650);
insert or ignore into Exp(level_id,required_exp) values(92,13800);
insert or ignore into Exp(level_id,required_exp) values(93,13950);
insert or ignore into Exp(level_id,required_exp) values(94,14100);
insert or ignore into Exp(level_id,required_exp) values(95,14250);
insert or ignore into Exp(level_id,required_exp) values(96,14400);
insert or ignore into Exp(level_id,required_exp) values(97,14550);
insert or ignore into Exp(level_id,required_exp) values(98,14700);
insert or ignore into Exp(level_id,required_exp) values(99,14850);
insert or ignore into Exp(level_id,required_exp) values(100,15000);
