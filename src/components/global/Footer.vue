<template>
    <!--フッター-->
    <v-footer color="primary" dark app>Todo管理ハイパー(仮)</v-footer>
</template>

<script>
export default {

  name: "Navigation_Yousei",
  props: {
    msg: {
      type: String
    },
    stop: {
      type: Boolean
    },
  },
  computed: {
    yousei() {
      return require("@/assets/yosei.png");
    }
  }
};
</script>