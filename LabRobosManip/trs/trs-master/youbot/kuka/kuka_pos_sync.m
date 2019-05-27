function kuka()
% kuka Illustrates the V-REP Matlab bindings.

% This was created by Valdir Grassi Jr by modifying youbot.m distributed by TRS which has the following copyright:
% (C) Copyright Renaud Detry 2013, Thibaut Cuvelier 2017, Mathieu Baijot 2017.
% Distributed under the GNU General Public License.
% (See http://www.gnu.org/copyleft/gpl.html)


%% Initiate the connection to the simulator.
close all;
disp('Program started');
% Use the following line if you had to recompile remoteApi
%vrep = remApi('remoteApi', 'extApi.h');
vrep = remApi('remoteApi');
vrep.simxFinish(-1);
id = vrep.simxStart('127.0.0.1', 19997, true, true, 2000, 5);

% If you get an error like:
%   Remote API function call returned with error code: 64. Explanation: simxStart was not yet called.
% Make sure your code is within a function! You cannot call V-REP from a script.

if id < 0
    disp('Failed connecting to remote API server. Exiting.');
    vrep.delete();
    return;
end
fprintf('Connection %d to remote API server open.\n', id);

% Make sure we close the connection whenever the script is interrupted.
cleanupObj = onCleanup(@() cleanup_vrep(vrep, id));

% This will only work in "continuous remote API server service".
% See http://www.v-rep.eu/helpFiles/en/remoteApiServerSide.htm
vrep.simxStartSimulation(id, vrep.simx_opmode_oneshot_wait);

% Retrieve all handles
h = kuka_init(vrep, id);

% Let a few cycles pass to make sure there's a value waiting for us next time we try to get a joint angle or
% the robot pose with the simx_opmode_buffer option.
pause(1);

%% Kuka constants
% The time step the simulator is using (your code should run close to it).
timestep = 0.05;

%% Load trajectory and set starting position for the robot.
disp('Starting robot');

% Define trajectory here in radians
theta_s = [0, 0, 0, 0, 0, 0, 0]';
theta_g = (pi/180)*[90, 90, 180, -90, 90, 90, 0]';
td = 10;
[theta, dtheta, ddtheta] = trajetoria(theta_s, theta_g, td, timestep);
trajectoryJoints = theta';
trajectoryVelocityJoints = dtheta';
startingJoints = trajectoryJoints(1,:);

%% Set the arm to its starting configuration.
res = vrep.simxPauseCommunication(id, true); % Send order to the simulator through vrep object.
vrchk(vrep, res); % Check the return value from the previous V-REP call (res) and exit in case of error.
% Set a position of each joint 
for i = 1:7
    res = vrep.simxSetJointTargetPosition(id, h.armJoints(i), startingJoints(i), vrep.simx_opmode_oneshot);
    vrchk(vrep, res, true);
end
res = vrep.simxPauseCommunication(id, false);
vrchk(vrep, res);


%% Make sure everything is settled before we start.
pause(1);

% Get position and orientation of the end effector (first time)
[res, eepos] = vrep.simxGetObjectPosition(id, h.armEndEffector, h.armBase, vrep.simx_opmode_streaming); vrchk(vrep, res, true);
[res, eerot] = vrep.simxGetObjectOrientation(id, h.armEndEffector, h.armBase, vrep.simx_opmode_streaming); vrchk(vrep, res, true);

% Get the linear and angular velocity of the end effector (first time)
[res, eelinearvel, eeangularvel] = vrep.simxGetObjectVelocity(id, h.armEndEffector, vrep.simx_opmode_streaming); vrchk(vrep, res, true);

% Get position and velocity of each joint (first time)
for i = 1:7
    [res, jpos(i)] = vrep.simxGetJointPosition(id, h.armJoints(i), vrep.simx_opmode_streaming); vrchk(vrep, res, true);
    [res, jvel(i)] = vrep.simxGetObjectFloatParameter(id, h.armJoints(i), 2012, vrep.simx_opmode_streaming); vrchk(vrep, res, true);
end


%% Initialise the state machine.
fsm = 'move';
move_pos = 1;
max_move = max(size(theta));

disp('Starting movement');

%% Start the demo.
vrep.simxSynchronous(id,true); % Enable the synchronous mode (Blocking function call)

while true
        
    if vrep.simxGetConnectionId(id) == -1
        error('Lost connection to remote API.');
    end
    
    % The first simulation step waits for a trigger before being executed
    vrep.simxSynchronousTrigger(id); % Trigger next simulation step (Blocking function call)
    % The first simulation step is now being executed
    vrep.simxGetPingTime(id); % After this call, the first simulation step is finished (Blocking function call)
    % Now we can safely read all streamed values

    
    %% Apply the state machine.
    if strcmp(fsm, 'move')
        %% First behavior.

        % Pause communication. This is necessary so that all joints are set
        % at the same time when communication is resumed
        res = vrep.simxPauseCommunication(id, true); % Send order to the simulator through vrep object.
        vrchk(vrep, res); % Check the return value from the previous V-REP call (res) and exit in case of error.
       
        % Move the arm to the preset pose pickupJoints
        for i = 1:7
            res = vrep.simxSetJointTargetPosition(id, h.armJoints(i), trajectoryJoints(move_pos,i),vrep.simx_opmode_oneshot);
            vrchk(vrep, res, true);
            res = vrep.simxSetJointTargetVelocity(id, h.armJoints(i), trajectoryVelocityJoints(move_pos,i),vrep.simx_opmode_streaming);
            vrchk(vrep, res, true);
        end
        
        % Resume communication.
        res = vrep.simxPauseCommunication(id, false);
        vrchk(vrep, res);
                
        % Get position and orientation of end effector 
        [res, eepos] = vrep.simxGetObjectPosition(id, h.armEndEffector, h.armBase, vrep.simx_opmode_buffer); vrchk(vrep, res, true);
        [res, eerot] = vrep.simxGetObjectOrientation(id, h.armEndEffector, h.armBase, vrep.simx_opmode_buffer); vrchk(vrep, res, true);
        
        % Get the linear and angular velocity of the end effector 
        [res, eelinearvel, eeangularvel] = vrep.simxGetObjectVelocity(id, h.armEndEffector, vrep.simx_opmode_buffer); vrchk(vrep, res, true);

        % Get position and velocity of each joint
        for i = 1:7
            [res, jpos(i)] = vrep.simxGetJointPosition(id, h.armJoints(i), vrep.simx_opmode_buffer); vrchk(vrep, res, true);
            [res, jvel(i)] = vrep.simxGetObjectFloatParameter(id, h.armJoints(i), 2012, vrep.simx_opmode_buffer); vrchk(vrep, res, true);
        end
        
        % Change to next behavior when there is no more position to go to.
        move_pos = move_pos+1;
        if(move_pos > max_move)
            fsm = 'finished';  
        end
    elseif strcmp(fsm, 'finished')
        %% Demo done: exit the function.
        disp('Movement finished. Press any key to exit simulation.');
        vrep.simxSynchronous(id,false); % Enable the synchronous mode (Blocking function call)
        pause();
                
        break;
    else
        error('Unknown state %s.', fsm);
    end
    
end

end % main function

