from abc import abstractmethod
from E2EContext import E2EContext
from util.runner import Session


class ICommon(Session):

    def __init__(self, e2e: E2EContext):
        super().__init__(e2e)

    @abstractmethod
    def i_wait_for_time_time_unit(
        self,
        time: str,
        time_unit: str,
    ):
        """
        I wait for "<time>" "<time unit>"

        * <time> (required): the time period to wait
        * <time unit> (required): supported time units are: seconds, minutes
        """
        pass
