const express=require("express");
const app=express();
port = 3000;
app.use(express.json());
app.use(express.urlencoded({
    extended:true
}))


const personData=[];
app.listen(port,()=>{
    console.log(`Succesfully connected to ${port}`)
});

app.post("/api/addStudent",(req,res)=>{
    console.log("Result",req.body);
    const data={"id":personData.length+1,
        "name":req.body.name,
        "rollno":req.body.rollno,
        "division":req.body.division,
    }
    personData.push(data);
    console.log("Final Result",data);
    res.status(200).send({
        "Status_code":200,
        "Message":"Student Data is added succesfully",
        "student":data
});
})