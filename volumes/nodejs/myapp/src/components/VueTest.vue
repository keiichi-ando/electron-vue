<template>
  <div class="vuetest">
    <h1>{{ msg }}</h1>
  <div>
    <button type="button" @click="printers()">Button</button>
    <ul>
    </ul>
  </div>
  </div>
</template>

<script>

const printer = require('node-native-printer');
const constWindows = require('node-native-printer/src/windows_printer.js')
const lista=printer.listPrinters(constWindows);


export default {
  name: 'VueTest',
  props: {
    msg: String
  },
  data() {
    return {
      prt: []
    }
  },
  method:{
    printers: function(){
      console.log(lista);
      console.log(this.prt)
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
