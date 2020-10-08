<template>
    <div class="main">
        <div class="register">
            <span class="title">登录</span>
            <div class="input"> 
                <el-input v-model="username" placeholder="请输入账号"></el-input>
                <el-input type="password" v-model="password" placeholder="请输入密码"></el-input>
            </div> 
            <div class="button">
                <el-button type="primary">确定</el-button>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data () {
        return {
            username: '',
            password: '',
        }
        
    }
}
</script>

</script>
<style lang="scss" scoped>
.button{
    margin: 20px auto 0;
    width: 400px;
    text-align: center;
}
.input{
    margin: 0 auto;
    width: 300px;
}
.title{
    margin: 0 auto;
    width: 100px;
    display: block;
    text-align: center;
    line-height: 80px;
    color: #121212;
    font-weight: 600;
    font-size: 25px;
}
.main{
    background-image:url('../assets/background.jpg');
    height: 100%;
    width: 100%;
}
.el-input{
    margin: 0px auto 20px;
    width: 300px;
    display: inline-block;
}
.el-button{
    width: 300px;
}
.register{
    box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    width: 400px;
    height: 300px;
    position: absolute;
    top: 50%;
    left: 50%;
    margin-left:-150px ;
    margin-top:-150px ;
    background-color: white;
}
</style>