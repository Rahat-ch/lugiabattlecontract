async function main() {
    const [deployer] = await ethers.getSigners();

    console.log("Deploying contracts with the account:", deployer.address);

    console.log("Account Balance:", (await deployer.getBalance()).toString());

    const Token = await ethers.getContractFactory("Lugia");
    const token = await Token.deploy();

    console.log("Lugia battle address:", token.address)
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1)
    });

