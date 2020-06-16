import sys
from abc import abstractmethod
from typing import Optional
from E2EContext import E2EContext
from util.runner import Session
# ShellDriver relies on pexpect library which has no windows support
if sys.platform != "win32":
    from driver.ShellDriver import ShellDriver
else:
    from driver.NullDriver import NullDriver
    # noinspection PyAbstractClass
    class ShellDriver(NullDriver):
        DEFAULT_DRIVER_ID = "shell"


class IShell(Session):

    def __init__(self, e2e: E2EContext):
        super().__init__(e2e)

    @abstractmethod
    def shell_session_to_envhost_using_shell_as_driver(
        self,
        driver: ShellDriver,
        envhost: str,
        shell: Optional[str],
    ):
        """
        shell session to "<envhost>" [using "<shell>"] [as "<shell driver instance id>"]

        * <envhost> (required): host definition from environment to connect to
        * <shell> (optional): "bash", getting from environment definition or "bash" by default
        * <shell driver instance id> (optional): a shortcut to this shell session, "shell" by default
        """
        pass

    @abstractmethod
    def i_execute_command_command_in_driver(
        self,
        driver: ShellDriver,
        command: str,
    ):
        """
        I execute command "<command>" [in "<shell driver instance id>"]

        * <command> (required): shell commands to execute
        * <shell driver instance id> (optional): shell session to use, "shell" by default
        """
        pass

    @abstractmethod
    def i_execute_script_in_driver(
        self,
        driver: ShellDriver,
        script: str,
    ):
        """
        I execute script [in "<shell driver instance id>"]:
        \"""
        <script>
        \"""

        * <script> (required): shell commands to execute
        * <shell driver instance id> (optional): shell session to use, "shell" by default
        """
        pass

    @abstractmethod
    def i_wait_while_command_in_driver_succeeds(
        self,
        driver: ShellDriver,
        command: str,
    ):
        """
        I wait while "<command>" [in "<shell driver instance id>"] succeeds

        * <command> (required): shell commands to execute
        * <shell driver instance id> (optional): shell session to use, "shell" by default
        """
        pass

    @abstractmethod
    def i_wait_unless_command_in_driver_succeeds(
        self,
        driver: ShellDriver,
        command: str,
    ):
        """
        I wait unless "<command>" [in "<shell driver instance id>"] succeeds

        * <command> (required): shell commands to execute
        * <shell driver instance id> (optional): shell session to use, "shell" by default
        """
        pass

    @abstractmethod
    def commands_in_driver_should_complete_successfully(
        self,
        driver: ShellDriver,
    ):
        """
        commands [in "<shell driver instance id>"] should complete successfully

        * <shell driver instance id> (optional): shell session to use, "shell" by default
        """
        pass

    @abstractmethod
    def exit_status_in_driver_should_be_value(
        self,
        driver: ShellDriver,
        value: str,
    ):
        """
        exit status [in "<shell driver instance id>"] should be "<value>"

        * <shell driver instance id> (optional): shell session to use, "shell" by default
        * <value> (required): command exit status to compare with
        """
        pass

    @abstractmethod
    def the_output_in_driver_should_be_value(
        self,
        driver: ShellDriver,
        value: str,
    ):
        """
        output [in "<shell driver instance id>"] should be "<value>"

        * <shell driver instance id> (optional): shell session to use, "shell" by default
        * <value> (required): exact value to compare output with
        """
        pass

    @abstractmethod
    def value_should_be_in_output_of_driver(
        self,
        driver: ShellDriver,
        value: str,
    ):
        """
        "<value>" should be in output [of "<shell driver instance id>"]

        * <value> (required): string to find in commands execution output
        * <shell driver instance id> (optional): shell session to use, "shell" by default
        """
        pass

    @abstractmethod
    def the_output_in_driver_should_be(
        self,
        driver: ShellDriver,
        value: str,
    ):
        """
        the output [in "<shell driver instance id>"] should be:
        \"""
        <value>
        \"""

        * <shell driver instance id> (optional): shell session to use, "shell" by default
        * <value> (required): exact value to compare output with
        """
        pass

    @abstractmethod
    def i_put_the_output_of_driver_into_variable_as_as_type(
        self,
        driver: ShellDriver,
        variable: str,
        as_type: Optional[str],
    ):
        """
        I put the output [of "<shell driver instance id>"] into "<variable>" [as <type>]

        * <variable> (required): variable name to store extracted value
        * <shell driver instance id> (optional): shell session to use, "shell" by default
        * <type> (optional>: "json"
        """
        pass
