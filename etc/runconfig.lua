return {
  TEST = true,
  version = "1.0.0",
  --集群地址配置
  cluster = {
    --admin = "127.0.0.1:2527", --后台交互节点
    --master = "127.0.0.1:2527",
    node1 = "127.0.0.1:2528",
    --node2 = "127.0.0.1:2529",
  },
  --通信协议
  prototype = "tcp",  --tcp/ws/kcp
  protopack = "pb",   --pb/json

  --各个服务配置
  service = {

    --debug_console服务
    debug_console = {
      [1] = {port=10701, node = "node1"},
      --[2] = {port=10702, node = "node2"},
      --[3] = {port=10703, node = "admin"},
    },
    --game服务
    game = {
      [1] = {node = "node1"},
      --[2] = {node = "node2"},
    },

    agentpool_common = {maxnum = 10, recyremove = 1, brokecachelen = 1,},
    agentpool = {
      [1] = {node = "node1"},
      --[2] = {node = "node2"},
    },

    roompool_common = {maxnum = 0, recyremove = 1, brokecachelen = 1,},
    roompool = {
      [1] = {node = "node1"},
      --[2] = {node = "node2"},
    },
    --gateway服务 maxclient 根据单个玩家内存来计算
    gateway_common = {maxclient = 2000, nodelay = true},
    gateway = {
      [1] = {port = 11798,  node = "node1"},
      --[2] = {port = 11799,  node = "node2"},
    },
    --global服务
    global = {
      [1] = {node = "node1"},
      --[2] = {node = "node1"},
    },
    --center服务
    center = {
      [1] = {node = "node1"},
       --[2] = {node = "node1"},
    },
    --login服务
    login = {
      [1] = {node = "node1"},
      --[2] = {node = "node2"},
    },
    --dbproxy服务

    dbproxy_common = {
      accountdb = {db_type = "mongodb", host = "127.0.0.1", db_name = "account"}, --host,port,username,password,authmod
      gamedb = {db_type = "mongodb", host = "127.0.0.1", db_name = "game"},
      globaldb = {db_type = "mongodb", host = "127.0.0.1", db_name = "global"},
      logdb = {db_type = "mongodb", host = "127.0.0.1", db_name = "log"},
      redisdb = {db_type = "redisdb", host = "127.0.0.1", db_name = "redis"},
      mysqldb = {db_type = "mysqldb", host = "192.168.101.66", db_name = "mysql", user="admin", password="tang1988"}
    },
    --dbproxy_common = {
    --	accountdb = {db_type = "mysqldb", host = "139.196.180.249", database = "account", port = 3306, user='admin', password='zhengsu@2018'}, --host,port,username,password,authmod
    --	gamedb = {db_type = "mysqldb", host = "139.196.180.249", database = "game", port = 3306, user='admin', password='zhengsu@2018'},
    --	globaldb = {db_type = "mysqldb", host = "139.196.180.249", database = "global", port = 3306, user='admin', password='zhengsu@2018'},
    --	logdb = {db_type = "mysqldb", host = "139.196.180.249", database = "log", port = 3306, user='admin', password='zhengsu@2018'},
    --},
    dbproxy = {
      [1] = {node = "node1"},
      [2] = {node = "node1"},
    },
    --host服务
    host_common = {
      web = { node = "node1", port = 12111, name = "web" },
      console = { node = "node1", port = 12112, name = "console" }, --尚未实现
    }
  },
  --玩家数据表配置
  playerdata = {
    baseinfo = true,
  },
  --支持的游戏类型 及对应的入口文件
  games_common = {
    --move = "libmove",
    --pinchidao = "libpinchidao",
    ddz="libddz",
    gp = 'libgp'

  },

  --具体各个功能逻辑的配置
  --movegame = {
  --	global = {
  --		[1] = "global1",
  --		[2] = "global2",
  --	},
  --},
  --
  ----具体各个功能逻辑的配置
  --pinchidaogame = {
  --	global = {
  --		[1] = "global1",
  --		[2] = "global2",
  --	},
  --},

  -- ddz={
  --     global={
  --         [1] = "global1",
  --         [2] = "global2",
  --     },
  -- },

  gp = {
    global={
      [1] = "global1",
      [2] = "global2",
    },
  },

  queryboard = {
    global = {
      [1] = "global1",
      --不支持分布式
    },
  },

}
