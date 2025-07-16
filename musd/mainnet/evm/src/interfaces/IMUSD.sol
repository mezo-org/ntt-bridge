// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.8 <0.9.0;

interface IMUSD {
    function burn(address _account, uint256 _amount) external;
    function mint(address _account, uint256 _amount) external;
}