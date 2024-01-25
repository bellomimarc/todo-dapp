// SPDX-License-Identifier: MIT 
pragma solidity >=0.4.22 <=0.8.19;

contract TodoList {
    uint public taskCount;

    constructor() {
        taskCount = 0;

        createTask("This is a sample task.");
    }

    struct Task {
        uint id;
        string content;
        bool completed;
    }

    mapping(uint => Task) public tasks;

    function createTask(string memory _content) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false);
    }

    function toggleCompleted(uint _id) public {
        Task memory _task = tasks[_id];
        _task.completed = !_task.completed;
        tasks[_id] = _task;
    }
}