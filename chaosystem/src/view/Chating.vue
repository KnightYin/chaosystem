<template>
    <div>
        <h1>聊天室</h1>
        <div>
            <div class="chat" v-for='item in tabledata' :key='item.id'>
                <span v-text="item.username"></span>
                <span v-text="item.time"></span>
                <div v-text="item.content"></div>
            </div>
        </div>
        <el-input
            autosize
            placeholder="请输入聊天内容"
            v-model="content"
            @keyup.enter.native='add'
            >
        </el-input>
    </div>
</template>
<script>
export default {
    data(){
        return{
             content:'',
             tabledata:[],
             id:0
        }
    },
    methods:{
        add(){
            console.log('dad')
            let id=this.id++
            let time=new Date().toLocaleString();
            let username='哈哈';
            this.tabledata.push({
                time,
                username,
                id,
                content:this.content
            })
            this.content='';
        }
    }
}
</script>
<style lang="scss" scoped>
.el-input{
    margin: 50px auto 0;
    width: 300px;
    display: block;
}
h1{
    width: 100px;
    text-align: center;
    margin: 0 auto;
    line-height: 200px;
}
.chat{
    width: 80%;
    padding: 5px 5px;
    margin:0 auto;
    border: 1px solid black;
}
</style>