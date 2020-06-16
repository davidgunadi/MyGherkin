from spec.common import spec
from spec.intf.common_intf import ICommon
import time as time_module


class CommonImpl(ICommon):

    @spec.impl
    def i_wait_for_time_unit(self, time: str, time_unit: str):
        if time_unit == "seconds":
            time_module.sleep(int(time))
        elif time_unit == "minutes":
            time_module.sleep(int(time) * 60)
        else:
            raise ValueError(f'Invalid argument time_unit: {time_unit}')
