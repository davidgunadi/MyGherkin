from driver.StopwatchDriver import StopwatchDriver
from spec.intf.stopwatch_intf import IStopwatch
from spec.stopwatch import spec


class StopwatchImpl(IStopwatch):

    @spec.impl
    def a_stopwatch_driver(
            self,
            driver: StopwatchDriver,
    ):
        pass

    @spec.impl
    def i_action_the_stopwatch_driver(
            self,
            driver: StopwatchDriver,
            action: str,
    ):
        getattr(driver, action)()

    @spec.impl
    def the_stopwatch_driver_value_should_be_value_time_unit_or_less(
            self,
            driver: StopwatchDriver,
            value: str,
            time_unit: str,
    ):
        driver.check_value_equal_or_less(int(value), time_unit)

    @spec.impl
    def i_put_elapsed_time_of_the_stopwatch_driver_into_variable(
            self,
            driver: StopwatchDriver,
            variable: str,
    ):
        self.i_remember_elapsed_time_of_the_stopwatch_driver_as_variable(driver, variable)

    @spec.impl
    def i_remember_elapsed_time_of_the_stopwatch_driver_as_variable(
            self,
            driver: StopwatchDriver,
            variable: str,
    ):
        value = driver.get_elapsed_time()
        self.e2e.variables[variable] = value
