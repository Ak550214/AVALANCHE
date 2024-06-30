const hre = require("hardhat");

async function main() {
  // Retrieve the Points contract factory
  const Points = await hre.ethers.getContractFactory("Points");

  // Deploy the Points contract
  const points = await Points.deploy();
  await points.deployed();

  // Log the address to which the Points contract was deployed
  console.log(`Points contract successfully deployed to: ${points.address}`);
}

// Recommended Hardhat pattern for using async/await and handling errors
main().catch((error) => {
  console.error("An error occurred during deployment:", error);
  process.exitCode = 1;
});
