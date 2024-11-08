// contracts/contracts/Todo.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Todo {
    struct Task {
        uint256 id;
        string content;
        bool isCompleted;
        uint256 createdAt;
        string category;
        uint8 priority; // 1: Low, 2: Medium, 3: High
    }

    event TaskCreated(
        uint256 indexed id,
        string content,
        string category,
        uint8 priority,
        uint256 createdAt
    );
    event TaskUpdated(
        uint256 indexed id,
        string content,
        string category,
        uint8 priority
    );
    event TaskToggled(uint256 indexed id, bool isCompleted);
    event TaskDeleted(uint256 indexed id);

    mapping(address => Task[]) private userTasks;
    mapping(address => mapping(uint256 => bool)) private userTaskExists;
    mapping(address => uint256) private userTaskCount;

    modifier taskExists(uint256 _id) {
        require(userTaskExists[msg.sender][_id], "Task does not exist");
        _;
    }

    modifier validPriority(uint8 _priority) {
        require(_priority >= 1 && _priority <= 3, "Invalid priority level");
        _;
    }

    function createTask(
        string memory _content,
        string memory _category,
        uint8 _priority
    ) external validPriority(_priority) {
        uint256 taskId = userTaskCount[msg.sender];
        Task memory newTask = Task({
            id: taskId,
            content: _content,
            isCompleted: false,
            createdAt: block.timestamp,
            category: _category,
            priority: _priority
        });

        userTasks[msg.sender].push(newTask);
        userTaskExists[msg.sender][taskId] = true;
        userTaskCount[msg.sender]++;

        emit TaskCreated(
            taskId,
            _content,
            _category,
            _priority,
            block.timestamp
        );
    }

    function updateTask(
        uint256 _id,
        string memory _content,
        string memory _category,
        uint8 _priority
    ) external taskExists(_id) validPriority(_priority) {
        uint256 index = _findTaskIndex(_id);
        Task storage task = userTasks[msg.sender][index];

        task.content = _content;
        task.category = _category;
        task.priority = _priority;

        emit TaskUpdated(_id, _content, _category, _priority);
    }

    function toggleTask(uint256 _id) external taskExists(_id) {
        uint256 index = _findTaskIndex(_id);
        userTasks[msg.sender][index].isCompleted = !userTasks[msg.sender][index]
            .isCompleted;

        emit TaskToggled(_id, userTasks[msg.sender][index].isCompleted);
    }

    function deleteTask(uint256 _id) external taskExists(_id) {
        uint256 index = _findTaskIndex(_id);

        // Move the last element to the deleted position
        if (index != userTasks[msg.sender].length - 1) {
            userTasks[msg.sender][index] = userTasks[msg.sender][
                userTasks[msg.sender].length - 1
            ];
        }

        userTasks[msg.sender].pop();
        userTaskExists[msg.sender][_id] = false;

        emit TaskDeleted(_id);
    }

    function getTasks() external view returns (Task[] memory) {
        return userTasks[msg.sender];
    }

    function _findTaskIndex(uint256 _id) internal view returns (uint256) {
        for (uint256 i = 0; i < userTasks[msg.sender].length; i++) {
            if (userTasks[msg.sender][i].id == _id) {
                return i;
            }
        }
        revert("Task not found");
    }
}
