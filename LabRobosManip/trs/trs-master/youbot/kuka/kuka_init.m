function handles = kuka_init(vrep, id)
    % Initialize kuka
    
    % (C) Copyright Renaud Detry 2013.
    % Distributed under the GNU General Public License.
    % (See http://www.gnu.org/copyleft/gpl.html)
    
    % [todo] Retrieve all handles, and stream arm and wheel joints, the robot's pose,
    % the Hokuyo, and the arm tip pose. Store them in a structure. 
    
    handles = struct('id', id);
    
    
    %% Robot handles. 
    [res, armBase] = vrep.simxGetObjectHandle(id, 'Kuka_base', vrep.simx_opmode_oneshot_wait); vrchk(vrep, res);
    [res, armEndEffector] = vrep.simxGetObjectHandle(id, 'Kuka_end_effector', vrep.simx_opmode_oneshot_wait); vrchk(vrep, res);
    
    handles.armBase = armBase;
    handles.armEndEffector = armEndEffector;
    
    %% Arm handles. 
    % The project page ( http://renaud-detry.net/teaching/info0948/private/project.php )
    % contains information on the different control modes of the arm. Search for
    % km_mode on the project webpage to find the arm documentation. Read that documentation
    % before working with the code below.
    
    % The *position* of this object always corresponds to the position of the tip of
    % the arm (the tip is somewhere between the two fingers)
    %[res, ptip] = vrep.simxGetObjectHandle(id, 'youBot_gripperPositionTip', vrep.simx_opmode_oneshot_wait); vrchk(vrep, res);
    % In IK mode (km_mode set to 1 or 2), the robot will try to move the *position*
    % of ptip to the *position* of ptarget.
    %[res, ptarget] = vrep.simxGetObjectHandle(id, 'youBot_gripperPositionTarget', vrep.simx_opmode_oneshot_wait); vrchk(vrep, res);
    % The *orientation* of this object always corresponds to the orientation of the tip of
    % the arm (the tip is somewhere between the two fingers)
    %[res, otip] = vrep.simxGetObjectHandle(id, 'youBot_gripperOrientationTip', vrep.simx_opmode_oneshot_wait); vrchk(vrep, res);
    % In IK mode 2 (km_mode set to 2), the robot will try to move the *orientation*
    % of otip to the *orientation* of otarget.
    %[res, otarget] = vrep.simxGetObjectHandle(id, 'youBot_gripperOrientationTarget', vrep.simx_opmode_oneshot_wait); vrchk(vrep, res);
    % Tip orientations are easier to manipulate in the reference frame of Rectangle22,
    % because then the degree of freedom onto which the orientation controller acts
    % corresponds to one of the three Euler angles of the tip orientation.
    %[res, r22] = vrep.simxGetObjectHandle(id, 'Rectangle22', vrep.simx_opmode_oneshot_wait); vrchk(vrep, res);
    
    %handles.ptip = ptip;
    %handles.ptarget = ptarget;
    %handles.otip = otip;
    %handles.otarget = otarget;
    %handles.r22 = r22;
    
    armJoints = - ones(1, 7);
    for i = 1:7
        [res, armJoints(i)] = vrep.simxGetObjectHandle(id, sprintf('LBR_iiwa_7_R800_joint%d', i), vrep.simx_opmode_oneshot_wait);
        vrchk(vrep, res);
    end
    handles.armJoints = armJoints;
    
    %[res, mapLooker] = vrep.simxGetObjectHandle(id, 'map', vrep.simx_opmode_oneshot_wait); vrchk(vrep, res);
    %handles.mapLooker = mapLooker;
    
    %[res, landmarks] = vrep.simxGetObjectHandle(id, 'Landmarks', vrep.simx_opmode_oneshot_wait); vrchk(vrep, res);
    %handles.landmarks = landmarks;
    
    %% Examples: getting information from the simulator (and testing the connection works). 
    % Stream wheel angles, Hokuyo data, and robot pose (see usage below)
    % Wheel angles are not used in this example, but they may be necessary in
    % your project.
    %for i = 1:4
    %    res = vrep.simxGetJointPosition(id, wheelJoints(i), vrep.simx_opmode_streaming); vrchk(vrep, res, true);
    %end
    %res = vrep.simxGetObjectPosition(id, ref, -1, vrep.simx_opmode_streaming); vrchk(vrep, res, true);
    %res = vrep.simxGetObjectOrientation(id, ref, -1, vrep.simx_opmode_streaming); vrchk(vrep, res, true);
    %res = vrep.simxReadVisionSensor(id, hokuyo1, vrep.simx_opmode_streaming); vrchk(vrep, res, true);
    %res = vrep.simxReadVisionSensor(id, hokuyo2, vrep.simx_opmode_streaming); vrchk(vrep, res, true);
    
    % Stream the arm joint angles and the tip position/orientation
    res = vrep.simxGetObjectPosition(id, armEndEffector, armBase, vrep.simx_opmode_streaming); vrchk(vrep, res, true);
    res = vrep.simxGetObjectOrientation(id, armEndEffector, armBase, vrep.simx_opmode_streaming); vrchk(vrep, res, true);
    for i = 1:7
        res = vrep.simxGetJointPosition(id, armJoints(i), vrep.simx_opmode_streaming); vrchk(vrep, res, true);
    end
    
    % Make sure that all streaming data has reached the client at least once
    vrep.simxGetPingTime(id); 
end
