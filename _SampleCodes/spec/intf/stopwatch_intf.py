from abc import abstractmethod
from E2EContext import E2EContext
from driver.StopwatchDriver import StopwatchDriver
from util.runner import Session


class IStopwatch(Session):

    def __init__(self, e2e: E2EContext):
        super().__init__(e2e)

    @abstractmethod
    def a_stopwatch_driver(
        self,
        driver: StopwatchDriver,
    ):
        """
        a stopwatch "<stopwatch driver id>"

        * <stopwatch driver id> (required): a shortcut to this HTTP request, "curl" by default
        """
        pass

    @abstractmethod
    def i_action_the_stopwatch_driver(
        self,
        driver: StopwatchDriver,
        action: str,
    ):
        """
        I <action> the stopwatch ["<stopwatch driver id>"]

        * <action> (required): "start", "stop", "reset"
        * <stopwatch driver id> (optional): driver id, "stopwatch" by default
        """
        pass

    @abstractmethod
    def the_stopwatch_driver_value_should_be_value_time_unit_or_less(
        self,
        driver: StopwatchDriver,
        value: str,
        time_unit: str,
    ):
        """
        the stopwatch ["<stopwatch driver id>"] value should be "<value>" <time-unit> or less

        * <stopwatch driver id> (optional): driver id, "stopwatch" by default
        * <value> (required): numeric value
        * <time-unit> (required): "min", "sec", "ms"
        """
        pass

    @abstractmethod
    def i_put_elapsed_time_of_the_stopwatch_driver_into_variable(
        self,
        driver: StopwatchDriver,
        variable: str,
    ):
        """
        I put elapsed time of the stopwatch "<stopwatch driver id>" into "<variable>"

        * <stopwatch driver id> (optional): driver id, "stopwatch" by default
        * <variable> (required): variable name to put elapsed stopwatch time value
        """
        pass
