from typing import Optional

from spec.intf.scenario_intf import IScenario
from spec.scenario import spec


class ScenarioImpl(IScenario):

    @spec.not_implemented(jira="E2EPLTFRM-131")
    def i_use_variable_with_value_as_an_input_parameter(
            self,
            variable: str,
            value: Optional[str],
    ):
        raise NotImplementedError()

    @spec.not_implemented(jira="E2EPLTFRM-132")
    def i_expect_variable_to_be_an_output_parameter(
            self,
            variable: str,
    ):
        raise NotImplementedError()

    @spec.not_implemented(jira='E2EPLTFRM-33')
    def i_execute_scenario(
            self,
            scenario: str,
    ):
        raise NotImplementedError()

    @spec.not_implemented(jira='E2EPLTFRM-34')
    def scenario_steps_should_complete_successfully(
            self,
    ):
        raise NotImplementedError()
