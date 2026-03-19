-- 游戏测试SQL查询示例

-- 1. 查询玩家信息
SELECT player_id, player_name, level, trophies
FROM players
WHERE level >= 10
ORDER BY trophies DESC;

-- 2. 查询部落信息
SELECT clan_id, clan_name, member_count, clan_level
FROM clans
WHERE member_count >= 20
ORDER BY clan_level DESC;

-- 3. 查询抽卡记录
SELECT draw_id, player_id, draw_time, rarity, item_name
FROM draw_records
WHERE player_id = '123456'
ORDER BY draw_time DESC
LIMIT 10;

-- 4. 查询部落战争记录
SELECT war_id, clan_id_1, clan_id_2, war_date, winner_clan_id, stars
FROM clan_wars
WHERE war_date >= '2026-03-01'
ORDER BY war_date DESC;

-- 5. 查询玩家活跃度
SELECT player_id, player_name, last_login, login_count, play_time_hours
FROM player_activity
WHERE last_login >= DATE_SUB(NOW(), INTERVAL 7 DAY)
ORDER BY play_time_hours DESC;

-- 6. 查询bug统计
SELECT bug_type, COUNT(*) as bug_count, AVG(severity) as avg_severity
FROM bug_reports
WHERE report_date >= '2026-03-01'
GROUP BY bug_type
ORDER BY bug_count DESC;

-- 7. 查询测试用例执行情况
SELECT test_case_id, test_case_name, execution_status, execution_date, tester_name
FROM test_executions
WHERE execution_date >= '2026-03-01'
ORDER BY execution_date DESC;

-- 8. 查询游戏性能数据
SELECT server_id, timestamp, avg_response_time, max_response_time, error_rate
FROM performance_metrics
WHERE timestamp >= DATE_SUB(NOW(), INTERVAL 24 HOUR)
ORDER BY timestamp ASC;

-- 9. 查询玩家充值记录
SELECT transaction_id, player_id, amount, currency, transaction_date, payment_method
FROM payment_records
WHERE transaction_date >= '2026-03-01'
ORDER BY transaction_date DESC;

-- 10. 查询游戏物品库存
SELECT item_id, item_name, item_type, current_stock, max_stock, last_updated
FROM item_inventory
WHERE current_stock < max_stock * 0.3
ORDER BY current_stock ASC;