import os
import sys
import time

sys.path.append(os.path.join(os.path.dirname(__file__), '../../..'))

from xarm.wrapper import XArmAPI

if len(sys.argv) >= 2:
    ip = sys.argv[1]
else:
    try:
        from configparser import ConfigParser
        parser = ConfigParser()
        parser.read('../robot.conf')
        ip = parser.get('xArm', 'ip')
    except:
        ip = input('Please input the xArm ip address:')
        if not ip:
            print('input error, exit')
            sys.exit(1)

arm = XArmAPI(ip)
arm.motion_enable(enable=True)
arm.set_mode(0)
arm.set_state(state=0)

time.sleep(1)

print('=' * 50)

print('============TCP============')
print('* position:', arm.position)

print('===========JOINT===========')
print('* angles:', arm.angles)

arm.disconnect()
