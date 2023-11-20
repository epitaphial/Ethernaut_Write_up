# Vault

Use `await web3.eth.getStorageAt("0x68029F38DaFf90cc22eb18976E1c3Fe7D689E442","0x1")` to read password first.

It is the hex of "A very strong secret password :)".

Then `await contract.unlock("0x412076657279207374726f6e67207365637265742070617373776f7264203a29")` to unlock the vault.
