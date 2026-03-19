# Charles抓包记录示例

## 工具介绍
Charles是一款常用的网络抓包工具，可用于分析游戏与服务器之间的网络通信，帮助测试人员发现潜在的问题。

## 抓包环境设置
- **Charles版本**：4.6.2
- **操作系统**：Windows 10
- **代理设置**：
  - HTTP代理：127.0.0.1:8888
  - HTTPS代理：127.0.0.1:8888
- **SSL证书**：已安装Charles根证书

## 抓包示例

### 1. 游戏登录请求
- **请求URL**：`https://api.example.com/auth/login`
- **请求方法**：POST
- **请求头**：
  ```
  Content-Type: application/json
  User-Agent: GameClient/1.0.0
  Device-ID: 1234567890abcdef
  ```
- **请求体**：
  ```json
  {
    "username": "testuser",
    "password": "********",
    "device_id": "1234567890abcdef",
    "os": "iOS",
    "version": "1.0.0"
  }
  ```
- **响应**：
  ```json
  {
    "code": 200,
    "message": "success",
    "data": {
      "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
      "user_id": "123456",
      "username": "testuser",
      "level": 10
    }
  }
  ```

### 2. 抽卡请求
- **请求URL**：`https://api.example.com/game/draw`
- **请求方法**：POST
- **请求头**：
  ```
  Content-Type: application/json
  Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
  ```
- **请求体**：
  ```json
  {
    "draw_type": "single",
    "pool_id": "101",
    "currency": "star_ticket",
    "count": 1
  }
  ```
- **响应**：
  ```json
  {
    "code": 200,
    "message": "success",
    "data": {
      "draw_id": "789012",
      "results": [
        {
          "item_id": "4001",
          "item_name": "SSR Character",
          "rarity": 5,
          "quantity": 1
        }
      ],
      "remaining_tickets": 9
    }
  }
  ```

### 3. 部落战争请求
- **请求URL**：`https://api.example.com/clan/war/start`
- **请求方法**：POST
- **请求头**：
  ```
  Content-Type: application/json
  Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
  ```
- **请求体**：
  ```json
  {
    "clan_id": "5678",
    "opponent_clan_id": "9012",
    "war_type": "regular"
  }
  ```
- **响应**：
  ```json
  {
    "code": 200,
    "message": "success",
    "data": {
      "war_id": "3456",
      "start_time": "2026-03-19T10:00:00Z",
      "end_time": "2026-03-20T10:00:00Z",
      "status": "pending"
    }
  }
  ```

### 4. 玩家数据同步请求
- **请求URL**：`https://api.example.com/game/sync`
- **请求方法**：POST
- **请求头**：
  ```
  Content-Type: application/json
  Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
  ```
- **请求体**：
  ```json
  {
    "player_id": "123456",
    "last_sync_time": "2026-03-19T09:00:00Z",
    "game_data": {
      "level": 10,
      "gold": 10000,
      "elixir": 5000,
      "trophies": 1500
    }
  }
  ```
- **响应**：
  ```json
  {
    "code": 200,
    "message": "success",
    "data": {
      "sync_time": "2026-03-19T10:00:00Z",
      "server_data": {
        "gold": 10000,
        "elixir": 5000,
        "trophies": 1500,
        "new_messages": 2
      }
    }
  }
  ```

## 分析要点
1. **请求/响应格式**：确保API请求和响应格式符合预期
2. **数据传输**：检查敏感数据是否加密传输
3. **错误处理**：测试错误情况下的响应
4. **性能分析**：分析请求响应时间，识别性能瓶颈
5. **安全检查**：检查是否存在安全漏洞，如未授权访问

## 常见问题
- **HTTPS抓包**：需要安装Charles根证书并信任
- **证书验证**：某些应用可能会验证证书，需要特殊处理
- **代理设置**：确保设备正确配置了Charles代理

## 工具使用技巧
1. 使用Charles的断点功能修改请求和响应
2. 使用重写功能模拟不同的服务器响应
3. 使用节流功能模拟网络延迟
4. 使用SSL代理功能分析HTTPS流量
5. 使用会话导出功能保存抓包记录