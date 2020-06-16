from spec.intf.internal_intf import IInternal
from spec.internal import spec


class InternalImpl(IInternal):

    @spec.impl
    def i_debug(self):
        pass
