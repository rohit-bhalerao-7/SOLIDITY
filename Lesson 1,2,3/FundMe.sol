//SPDX-License-Identifier: MIT

//Get funds from user, withdraw funds, set minimum funding value in USD
pragma solidity ^0.8.0;
import "./PriceConverter.sol";

//instead of writing require statements and increasing gas price we declare error at top

error notOwner();

contract FundMe{
         
        using PriceConverter for uint256;

        //to decrease gas prices we use 'constant' & 'immutable' for variables
        //const variables are in CAPITAL
        uint256 public constant MINIMUM_USD = 50 * 1e18; //1e18= 1*10**18

        address[] public funders;
        mapping (address=>uint256) public addressToAmountFunded;

        //immutable variables naming is 'i_variable'
        //in const we just declare once and in immutable we can declare it once again in constructor
        address public immutable i_owner;
        //constructor is a func which is immediately called after deploying
        constructor(){
             i_owner = msg.sender;
        }  
        
        modifier onlyOwner{
           //require(msg.sender == owner," Sender is not the owner");
           if (msg.sender!= i_owner) {revert notOwner();}
           _; //This means run rest of the code after require/if
        }


         function fund() public payable{
            //Want to able to set minimum fund amount in USD
            //1. How do we send ETH to this contract?
            //number = 5;
            //getConversionRate(msg.value) = msg.value.getConversionRate()
            require(msg.value.getConversionRate()>= MINIMUM_USD, "Didn't send enough!" ); // 1e18= 1 x 10 x 10...(18 times 10)
            funders.push(msg.sender); //it will push the address of sender 
            addressToAmountFunded[msg.sender] = msg.value;

            //Undo any action before and send remaining gas back is called reverting.
            //In this case if requirement isn't met, it will revert. Anything after revert gas wont be paid for it.
            //Anything before revert gas will be paid for the computations. eg here is changing number to 5

         }

         function withdraw() public onlyOwner {
            for (uint256 funderIndex=0; funderIndex<funders.length ; funderIndex++) 
            {
               address funder = funders[funderIndex];
               addressToAmountFunded[funder] = 0;
            }

            //resetting array
            //instead of looping through for each array we can reset funders to a
            //new address with 0 objects in it ie blank
            funders = new address[](0);
            //transfer,send,call(use this)
            //we are not calling a function so ("")
            (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
            require(callSuccess, "Call Failed!");
         }
         
         //receive will trigger when calldata is empty and fallback triggered when calldata filled
         //incase receive not there and calldata empty fallback triggered otherwise error
         //can use receive and fallback only once in a contract
         receive() external payable  {
            fund();
         }
         fallback() external payable  {
            fund();
         }
         

}
