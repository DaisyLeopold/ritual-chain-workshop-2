const {

expect

}=require("chai");



const {

ethers

}=require("hardhat");




describe(

"Production Flow",

function(){



let contract;




beforeEach(

async()=>{


const Factory=

await ethers.getContractFactory(

"PredictionMarket"

);



contract=

await Factory.deploy();



});








it(

"creates complete market lifecycle",

async()=>{



await contract.createMarket(

"Will Ritual expand?",

9999999999

);





const market=

await contract.getMarket(1);





expect(

market.id

)

.equal(1);



expect(

market.resolved

)

.equal(false);



});








it(

"stores user prediction",

async()=>{



const user=

(await ethers.getSigners())[1];





await contract.createMarket(

"Future market",

9999999999

);





await contract.connect(user)

.submitPrediction(

1,

true,

{

value:

ethers.parseEther("0.2")

}

);





const amount=

await contract.userPredictionAmount(

1,

user.address

);





expect(

amount

)

.equal(

ethers.parseEther("0.2")

);



});







});
