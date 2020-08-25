import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

const { ipcRenderer } = window.require("electron");

// グローバルメッセージ
const messageModule = {
  strict: process.env.NODE_ENV !== "production",
  namespaced: true,
  state: {
    msg: null,
    error: false,
    info: false,
    warning: false
  },
  getters: {
    msg: state => state.msg,
    type: state => {
      if (state.error) {
        return "error";
      }
      if (state.warning) {
        return "warning";
      }
      if (state.info) {
        return "info";
      }
      return null;
    },
    last_msg_time: state => state.last_msg_time
  },
  mutations: {
    set(state, payload) {
      if (payload.error) {
        state.error = payload.error;
      }
      if (payload.warning) {
        state.warning = payload.warning;
      }
      if (payload.info) {
        state.info = payload.info;
      }
      state.msg = payload.message;
    },
    clear(state) {
      state.error = false;
      state.warning = false;
      state.info = false;
      state.msg = null;
    }
  },
  actions: {
    LoginDateGet(context) {
      var _msg = null;
      ipcRenderer.on("log-row-reply", (event, arg) => {
        var start_time = Math.trunc(
          Date.parse(arg["StartDateTime"].replace(/-/g, "/")) / 1000
        );
        var end_time = Math.trunc(
          Date.parse(arg["EndDateTime"].replace(/-/g, "/")) / 1000
        );

        var diff = Math.trunc(end_time - start_time) / 60;

        _msg = `最終ログイン日時は${arg["StartDateTime"]}です。
                  アプリ起動時間は${diff}分です。`;
      });

      context.dispatch("setInfoMessage", { msg: _msg });
    },
    /**
     * エラーメッセージ表示
     */
    setErrorMessage(context, payload) {
      context.commit("clear");
      context.commit("set", { error: true, message: payload.msg });
    },
    setInfoMessage(context, payload) {
      context.commit("clear");
      context.commit("set", { info: true, message: payload.msg });
    },
    setWarningMessage(context, payload) {
      context.commit("clear");
      context.commit("set", { warning: true, message: payload.msg });
    },
    /**
     * クリア
     */
    Clear(context) {
      context.commit("clear");
    }
  }
};

//レベルモジュール
const LevelModule = {
  strict: process.env.NODE_ENV !== "production",
  namespaced: true,
  state: {
    user_level: null,
    next_requiredexp: null
  },
  getters: {
    user_level: state => state.user_level,
    next_requiredexp: state => state.next_requiredexp,
    level_achievement_rate: state => state.level_achievement_rate
  },
  mutations: {
    set(state, payload) {
      state.user_level = payload.row["currnt_exp_id"];
      state.next_requiredexp = payload.row["next_requiredexp"];
      state.level_achievement_rate =
        (payload.row["current_exp"] /
          (payload.row["current_exp"] + payload.row["next_requiredexp"])) *
        100;
    }
  },
  actions: {
    LevelGet(context) {
      ipcRenderer.send("level");
      ipcRenderer.on("row-reply", (event, arg) => {
        context.commit("set", { row: arg });
      });
    }
  }
};

//タスクモジュール
const TaskModule = {
  strict: process.env.NODE_ENV !== "production",
  namespaced: true,
  state: {
    tasks: null
  },
  getters: {
    tasks: state => state.tasks
  },
  mutations: {
    set(state, payload) {
      var task_obj = [];
      payload.row.forEach(x => {
        task_obj.push({
          task_id: x["task_id"],
          task_name: x["task_name"],
          task_exp: x["task_exp"],
          reg_date: Date.parse(x["reg_date"]),
          upd_date: Date.parse(x["upd_date"])
        });
      });
      state.tasks = task_obj;
    }
  },
  actions: {
    TaskGet(context) {
      ipcRenderer.send("task-select");
      ipcRenderer.on("task-row-reply", (event, arg) => {
        context.commit("set", { row: arg });
      });
    }
  }
};

const store = new Vuex.Store({
  modules: {
    message: messageModule,
    level: LevelModule,
    task: TaskModule
  }
});

export default store;
