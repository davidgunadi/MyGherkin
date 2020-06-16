from typing import Optional

from Assert import Assert
from driver.ShellDriver import ShellDriver, IShellEndpoint
from driver.common import IPlainCredentials
from spec.intf.shell_intf import IShell
from spec.shell import spec
from util.timer import Timer


def to_check_the_implementation(jira: str):
    def impl(func):
        return spec.partially_implemented("Need to check", jira=jira)(func)
    return impl


class ShellImpl(IShell):

    @to_check_the_implementation(jira='E2EPLTFRM-35')
    def shell_session_to_endpoint_using_shell_as_driver(
            self,
            driver: ShellDriver,
            endpoint: str,
            shell: Optional[str],
    ):
        endpoint_obj: IShellEndpoint = self.e2e.get_endpoint(endpoint)
        credentials: IPlainCredentials = self.e2e.get_credentials(endpoint_obj.credentials_id)
        driver.initialize(endpoint_obj, credentials, shell)

    @to_check_the_implementation(jira='E2EPLTFRM-36')
    def i_execute_command_in_driver(
            self,
            driver: ShellDriver,
            command: str,
    ):
        driver.execute_command(command)

    @to_check_the_implementation(jira='E2EPLTFRM-37')
    def i_execute_script_in_driver(
            self,
            driver: ShellDriver,
            script: str,
    ):
        driver.execute_command(script)

    @to_check_the_implementation(jira='E2EPLTFRM-38')
    def i_wait_while_command_in_driver_succeeds(
            self,
            driver: ShellDriver,
            command: str,
    ):
        status = 0
        with Timer(timeout=300) as timer:
            while status == 0 and not timer.timeout:
                status, _ = driver.execute_command(command)

    @to_check_the_implementation(jira='E2EPLTFRM-39')
    def i_wait_unless_command_in_driver_succeeds(
            self,
            driver: ShellDriver,
            command: str,
    ):
        status = None
        with Timer(timeout=300) as timer:
            while status != 0 and not timer.timeout:
                status, _ = driver.execute_command(command)

    @to_check_the_implementation(jira='E2EPLTFRM-40')
    def commands_in_driver_should_complete_successfully(
            self,
            driver: ShellDriver,
    ):
        Assert.Eq(0, driver.last_status)

    @to_check_the_implementation(jira='E2EPLTFRM-41')
    def exit_status_in_driver_should_be_value(
            self,
            driver: ShellDriver,
            value: str,
    ):
        Assert.Eq(value, driver.scenario_output)

    @to_check_the_implementation(jira='E2EPLTFRM-42')
    def the_output_in_driver_should_be_value(
            self,
            driver: ShellDriver,
            value: str,
    ):
        Assert.Eq(value, driver.scenario_output)

    @to_check_the_implementation(jira='E2EPLTFRM-43')
    def value_should_be_in_output_of_driver(
            self,
            driver: ShellDriver,
            value: str,
    ):
        Assert.In(value, driver.scenario_output)

    @to_check_the_implementation(jira='E2EPLTFRM-44')
    def the_output_in_driver_should_be(
            self,
            driver: ShellDriver,
            value: str,
    ):
        Assert.In(value, driver.scenario_output)

    @to_check_the_implementation(jira='E2EPLTFRM-45')
    def i_put_the_output_of_driver_into_variable_as_type(
            self,
            driver: ShellDriver,
            variable: str,
            as_type: Optional[str],
    ):
        self.i_remember_the_output_of_driver_as_variable_as_type(driver, variable, as_type)

    @to_check_the_implementation(jira='E2EPLTFRM-45')
    def i_remember_the_output_of_driver_as_variable_as_type(
            self,
            driver: ShellDriver,
            variable: str,
            as_type: Optional[str],
    ):
        self.e2e.variables[variable] = driver.scenario_output
