import sqlite3 from "sqlite3";
import init_ddl from "raw-loader!@/db/init.sql";
// データベース作成＆開く

let Database;
export class DBAccesser {
  static async init() {
    Database = new sqlite3.Database("tasks.db");
    await this.multipleQuery(init_ddl);
  }
  static get() {
    return Database;
  }

  //単一のクエリ発行
  static singleQuery(sql) {
    Database.serialize(() => {
      Database.run(sql, err => {
        if (err) Database.exec("ROLLBACK");
      });
    });
  }

  static async selectQuery(sql) {
    return new Promise((resolve, reject) => {
      Database.get(sql, (err, row) => {
        if (err) return reject(err);
        return resolve(row);
      });
    });
  }

  //複数選択結果
  static async selectAllQuery(sql) {
    const result = []
    return new Promise((resolve, reject) => {
      Database.all(sql, (err, rows) => {
        if (err) return reject(err);
        rows.forEach(row => {
            result.push(row)
          })
        return resolve(result);
      });
    });
  }
  
  //複数処理実行
  static async multipleQuery(sql, param = Array) {
    return new Promise((resolve, reject) => {
      try {
        Database.serialize(function() {
          Database.exec("BEGIN TRANSACTION");
          // テーブル作成のクエリを実行する
          let multiple_ddl = sql.split(";");
          //最後の要素は空なので削除
          multiple_ddl.pop();
          multiple_ddl.forEach(x => {
            Database.run(x, param, err => {
              if (err) {
                throw err;
              }
            });
          });
          Database.exec("COMMIT");
        });
        return resolve();
      } catch (err) {
        //ロールバック
        Database.exec("ROLLBACK");
        return reject(err);
      }
    });
  }
}
