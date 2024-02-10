// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract PayByLocation {
 
    struct Employee {
        string name;
        uint256 distance;
        uint256 registeredAt;
        uint256 contractEnd;
        int256 lat;
        int256 lng;
        bool comply;
        bool paid;
    }
    
    mapping(address => Employee) public employees;
    mapping(uint => address) public employeesAddress;
    uint public employeeCount;

    constructor() {
        employeeCount = 0;
    }

    function addEmployee(
        address _employeeAddress,
        string memory _name,
        uint256 _allowedDistance,
        uint256 _contractEnd,
        int256 _lat,
        int256 _lng
    ) public {
        uint256 time = block.timestamp;
        Employee memory employee = Employee(
            _name,
            _allowedDistance,
            time,
            _contractEnd,
            _lat,
            _lng,
            true,
            false
        );
        employees[_employeeAddress] = employee;
        employeesAddress[employeeCount] = _employeeAddress;
        employeeCount++;

    }

    function getEmployee(uint index)
        public
        view
        returns (Employee memory)
    {
        return (employees[employeesAddress[index]]);
    }

    function getEmployees()
        public
        view
        returns (Employee[] memory)
    {

        Employee[] memory ret = new Employee[](employeeCount);
        for (uint i = 0; i < employeeCount; i++) {
            ret[i] = employees[employeesAddress[i]];
        }
        return ret;
    
    }
    
    function evaluate(int256 _lat, int256 _lng) public {
        // Reference distance is lat and lng from the function parameters
        address empAddr = msg.sender;
        Employee storage employee = employees[empAddr];
        bool comply = isComplied(_lat, _lng, employee);
        
        if (comply && block.timestamp >= employee.contractEnd && !employee.paid) {
            // Reward the employee for compliance
            employee.paid = true;
            // You can define your reward mechanism here, for example, transferring tokens or ether
            // For demonstration, let's assume rewarding with 1 ether
            payable(empAddr).transfer(1 ether);
        } else if (!comply && block.timestamp < employee.contractEnd) {
            // Penalize the employee for non-compliance
            // You can define your penalty mechanism here
            // For demonstration, let's assume deducting 1 ether from the employee's balance
            // Assuming the contract holds the balance of employees
            // You would typically handle this with appropriate funds management in a real application
            if (address(this).balance >= 1 ether) {
                payable(empAddr).transfer(1 ether - 1 ether);
            }
        }

        employees[empAddr] = employee;
    }

    function getDistance(
        int256 _lat,
        int256 _lng,
        int256 _lat1,
        int256 _lng1
    ) private pure returns (int256) {
        int256 dist = sqrt(((_lat - _lat1)**2) + ((_lng - _lng1)**2));
        return dist;
        // return 6;
    }

    function sqrt(int256 x) private pure returns (int256 y) {
        int256 z = (x + 1) / 2;
        y = x;
        while (z < (y)) {
            y = z;
            z = (x / z + z) / 2;
        }
        return y;
    }

    function isComplied(
        int256 _lat,
        int256 _lng,
        Employee memory _employee
    ) private pure returns (bool) {
        int256 distance = getDistance(
            _lat,
            _lng,
            _employee.lat,
            _employee.lng
        );
        return distance <= int(_employee.distance);
    }

    function getSender() public view returns (address) {
        return msg.sender;
    }

}
