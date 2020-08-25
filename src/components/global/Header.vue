<template>
  <div>
    <!--サイドメニュー-->
    <v-navigation-drawer app v-model="drawer" clipped>
      <v-container>
        <v-list-item>
          <v-list-item-content>
            <v-list-item-title class="title grey--text text--darken-2">メニュー</v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-divider></v-divider>

        <v-list nav>
          <v-list-item v-for="nav_list in nav_lists" :key="nav_list.name">
            <v-list-item-icon>
              <v-icon>{{nav_list.icon}}</v-icon>
            </v-list-item-icon>
            <v-list-item-content>
              <v-list-item-title>{{nav_list.name}}</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-list>
      </v-container>
    </v-navigation-drawer>
    <!--ヘッダー-->
    <v-app-bar color="primary" dark app clipped-left>
      <v-app-bar-nav-icon @click="drawer=!drawer"></v-app-bar-nav-icon>

      <v-toolbar-title>ToDo管理ハイパー(仮)</v-toolbar-title>
      <v-spacer></v-spacer>

      <v-toolbar-items>
        <v-btn text>ボタン</v-btn>

        <v-menu offset-y>
          <template v-slot:activator="{on}">
            <v-btn v-on="on" text>
              ドロップダウンボタン
              <v-icon>mdi-menu-down</v-icon>
            </v-btn>
          </template>
          <v-list>
            <v-subheader>機能群</v-subheader>
            <v-list-item v-for="func in funcs" :key="func.name">
              <v-list-item-icon>
                <v-icon>{{func.icon}}</v-icon>
              </v-list-item-icon>
              <v-list-item-content>
                <v-list-item-title>{{func.name}}</v-list-item-title>
              </v-list-item-content>
            </v-list-item>
          </v-list>
        </v-menu>
      </v-toolbar-items>
    </v-app-bar>
  </div>
</template>

<script>
export default {
  data() {
    return {
      drawer: null,
      nav_lists: [
        { name: "メニュー１", icon: "mdi-function" },
        { name: "メニュー２", icon: "mdi-function" },
        { name: "メニュー３", icon: "mdi-function" }
      ],
      funcs: [
        { name: "機能１", icon: "mdi-function" },
        { name: "機能２", icon: "mdi-function" },
        { name: "機能３", icon: "mdi-function" }
      ]
    };
  }
};
</script>
