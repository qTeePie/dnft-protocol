# Variables
include .env
export $(shell sed 's/=.*//' .env)

SCRIPT=script/DeployDNFT.s.sol
OZ_LIB=base/openzeppelin-contracts
RPC_URL= http://127.0.0.1:8545

# Start Anvil (local testnet)
anvil:
	anvil

# Install OpenZeppelin (only if not already installed)
install:
	[ -d "$(OZ_LIB)" ] || forge install OpenZeppelin/openzeppelin-contracts@v5.2.0 --no-commit && \
	forge install foundry-rs/forge-std@v1.8.2 --no-commit

# Build contracts (ensures OpenZeppelin is installed first)
build: install
	forge build

# Deploy contract
#deploy: build
#	forge script $(SCRIPT) --rpc-url $(RPC_URL) --broadcast --private-key $(PRIVATE_KEY) --chain-id 1111

deploy: build
	forge script $(SCRIPT) --rpc-url $(RPC_URL) --broadcast --private-key $(PRIVATE_KEY) --chain-id 1111

approve: build
	forge script script/ScriptApproveNFT.s.sol:ScriptApproveNFT --rpc-url $(RPC_URL) --broadcast --private-key $(PRIVATE_KEY) --chain-id 1111

# Run tests
test: build
	forge test -vvv

# Format Solidity files
fmt:
	forge fmt

# Clean cache & artifacts
clean:
	forge clean
	rm -rf base/openzeppelin-contracts

fork-anvil:
	anvil --fork-url $(RPC_URL) --chain-id 1111
