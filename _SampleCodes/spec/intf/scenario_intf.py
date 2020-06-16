from abc import abstractmethod
from E2EContext import E2EContext
from util.runner import Session


class IScenario(Session):

    def __init__(self, e2e: E2EContext):
        super().__init__(e2e)

    @abstractmethod
    def i_execute_scenario_scenario(
        self,
        scenario: str,
    ):
        """
        I execute scenario "<scenario>"

        * <scenario> (required): Jira issue key for End-to-end Test ticket to execute
        """
        pass

    @abstractmethod
    def scenario_steps_should_complete_successfully(
        self,
    ):
        """
        scenario steps should complete successfully
        """
        pass
