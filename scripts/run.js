async function main() {
    const [owner, randoPerson] = await ethers.getSigners();
    const lugiaContractFactory = await hre.ethers.getContractFactory("Lugia");
    const lugiaContract = await lugiaContractFactory.deploy();
    await lugiaContract.deployed();
    console.log("Contract deployed to:", lugiaContract.address);
    console.log("Contract deployed by:", owner.address);

    let attackTxn = await lugiaContract.attack('Attack now bruh!');
    await attackTxn.wait();

    attackTxn = await lugiaContract.attack('Attack again yo!');
    await attackTxn.wait();

    let lugiaHp;
    lugiaHp = await lugiaContract.getCurrentHp();
    
    let charizardHp;
    charizardHp = await lugiaContract.getCurrentCharizardHp();

    let potionTxn = await lugiaContract.potion('Heal it bruh!');
    await potionTxn.wait()
    charizardHp = await lugiaContract.getCurrentCharizardHp();

    let allActions = await lugiaContract.getAllActions();
    console.log(allActions)
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });