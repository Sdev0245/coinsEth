pragma solidity >= 0.4.0 <= 0.7.0;

contract ERC20{
    
    string public tokenName ; 
    int256 private tokens ; 
    string public symbol ="Crypto"; 
    address owner;
    
     mapping(address => int256) balance;
  event Transfer(address from ,address to ,int256 amount) ;
  mapping(address=>mapping(address=>int256)) allowed;
  
   constructor(string memory _tokenName,int256 _amount) public{
       tokenName = _tokenName;
       tokens= _amount;
       owner =msg.sender;
       balance[msg.sender]= _amount;
       
   }
   
   
  
   function balanceOf(address _owner) public view returns(int256)
   {
       
       require(_owner == msg.sender);
       return balance[_owner];
   }
   
   function transfer(address to ,int256 _amount) public returns(bool)
   {
          require(balance[msg.sender]-_amount >= 0 ) ;
           require(_amount > 0);
           balance[msg.sender] -= _amount;
           balance[to] += _amount;
           
           emit Transfer(msg.sender,to,_amount);
           return true;
       
   }
   
   function allowence(address _from ,address to) public view returns(int256)
   {
       require(_from == msg.sender );
       
       return allowed[_from][to];
   }
   
   function transferFrom(address _from ,address _to ,int256 amount) public returns(bool)
   {
       require(_from !=  msg.sender);
       require(amount > 0);
       
       emit Transfer(_from,_to,amount);
       return true;
   }
   
   
   
}